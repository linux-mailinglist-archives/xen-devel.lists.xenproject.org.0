Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13204511C98
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315339.533843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlRB-0001wj-Df; Wed, 27 Apr 2022 17:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315339.533843; Wed, 27 Apr 2022 17:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlRB-0001uu-AV; Wed, 27 Apr 2022 17:26:49 +0000
Received: by outflank-mailman (input) for mailman id 315339;
 Wed, 27 Apr 2022 17:26:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlRA-0001uo-2y
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:26:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlR9-0002wF-RN; Wed, 27 Apr 2022 17:26:47 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlR9-0000xS-LM; Wed, 27 Apr 2022 17:26:47 +0000
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
	bh=G/4lWYJrNfdUOGm/ldMF2kSuDkwr86rwdEE+I/9K1i0=; b=A7P48e++gjFwc2rRTxzmBoGoaO
	PvvsShBJ9HYgU0EveqwMJkfDpBVtP8uTtGiGxfU8amYuux2Z09RQMLOvB2CXeLoiJ/HIcn9aZCbYf
	QAOfXJne4gLJKnEAnK6GaazUCC/ahgSmzRKZRfW2wD6tvIdJxKPhZym6GMGWdYm4HtdY=;
Message-ID: <ce7b7364-553f-29b7-2cab-644930f4e143@xen.org>
Date: Wed, 27 Apr 2022 18:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 8/8] drivers/exynos4210: Remove unused-but-set variable
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-9-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427094941.291554-9-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/04/2022 10:49, Michal Orzel wrote:
> Function exynos4210_uart_init_preirq defines and sets a variable
> divisor but does not make use of it. Remove the definition and comment
> out the assignment as this function already has some TODOs.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Commenting out a code is a bad practise as well as using TODOs.

I disagree, having TODOs in the code is useful to track issues that are 
not critical or necessary to update the support state.

> However the only alternative would be to get rid of divisor variable
> and TODO comments. I'm open for solutions.

I am not overly happy with commented code, but I prefer it over removing 
the TODOs comment as you wouldn't address them and the issues are not fixed.

So for this patch:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

