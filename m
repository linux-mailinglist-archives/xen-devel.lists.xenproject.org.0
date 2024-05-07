Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5398BE39A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718104.1120657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KkK-0006Aj-Ei; Tue, 07 May 2024 13:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718104.1120657; Tue, 07 May 2024 13:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KkK-00068Q-Ao; Tue, 07 May 2024 13:20:40 +0000
Received: by outflank-mailman (input) for mailman id 718104;
 Tue, 07 May 2024 13:20:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4KkJ-00067A-8a
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:20:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4KkI-0006t3-QM; Tue, 07 May 2024 13:20:38 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4KkI-00013E-Jw; Tue, 07 May 2024 13:20:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Vq5D31ZcLBl3pVFEjwUufVPv5XrfimQqt7yfe2KP65g=; b=nvLL9naYIjMk1Hvosgl1vJJsnj
	LhyuXKQD7/JF3QuwLsYdrQvA5HRMN/TXOaZoa9cjkdMZBS7Fgbv9wfJaeF8IskUpzOIuGiGrgHUnv
	9Z1mNjCoY1nybgqyOTzgH261ANpU+//+tfErSPtsk9yc+9ALUGJDpIcFGTEuj2H99i54=;
Message-ID: <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
Date: Tue, 7 May 2024 14:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240423082532.776623-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 23/04/2024 09:25, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.

Is this because we are mapping more than one page at the time? Can you 
point me to the code?

> But today, p2m_put_l3_page could not handle superpages.

This was done on purpose. Xen is not preemptible and therefore we need 
to be cautious how much work is done within the p2m code.

With the below proposal, for 1GB mapping, we may end up to call 
put_page() up to 512 * 512 = 262144 times. put_page() can free memory. 
This could be a very long operation.

Have you benchmark how long it would take?

Cheers,

-- 
Julien Grall

