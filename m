Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5DB55881
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 23:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122615.1466200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBTs-000776-CT; Fri, 12 Sep 2025 21:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122615.1466200; Fri, 12 Sep 2025 21:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBTs-00075c-9i; Fri, 12 Sep 2025 21:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1122615;
 Fri, 12 Sep 2025 21:38:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxBTr-00075W-AM
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 21:38:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBTq-006e3O-2N;
 Fri, 12 Sep 2025 21:38:54 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBTq-006BM1-2g;
 Fri, 12 Sep 2025 21:38:54 +0000
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
	bh=SFLYSUSsN6iOWQYYhy8K6YJtlIBFaDouIua2Q9yP8gk=; b=VAR4R9Mq9Wv5y7Yrbt5umYNItn
	ljwz4yC9AL15eomhPW3bLOErL2G+p9jUkG7+aHyKaC4z7qRjbbsiXkn8kSBFWdU7b54mxLq4keVV8
	wAwZbZE8/n8v95OMougqwGIUNVzSqRoEglk9bkDLoRBPh+uHo/LRhUeWvFVjrjyK7jTU=;
Message-ID: <1715e68b-fef3-4846-8db0-5cbd49878f27@xen.org>
Date: Fri, 12 Sep 2025 22:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
 <3e237c5256054a88b1c099d85d8bd1a602bba230.1756995595.git.oleksii_moisieiev@epam.com>
 <c68f1d0e-8a0d-4d8e-a98e-7617c548337a@xen.org>
 <e1291003-0738-4c42-83ae-1da575a00f9c@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e1291003-0738-4c42-83ae-1da575a00f9c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Release manager)

On 10/09/2025 15:49, Oleksii Moisieiev wrote:
> Hi Julien,
> 
> Thank you for your observations. You're absolutely right about this.
> 
> Currently, the sci_relinquish_resources call doesn't perform any operations
> because the single-agent doesn't implement a callback.
> 
> I'll move the sci implementation to be positioned above the tee
> implementation
> and prepare a patch for this change.

Thanks! I think this change should go in Xen 4.21. Please tag it with 
[for-4.21] or similar.

CCing Oleksii Kurochko to keep track.

Cheers,

-- 
Julien Grall


