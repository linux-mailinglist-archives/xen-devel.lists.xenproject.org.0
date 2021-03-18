Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1103340459
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 12:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98887.187884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMqb8-0005IY-3Y; Thu, 18 Mar 2021 11:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98887.187884; Thu, 18 Mar 2021 11:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMqb8-0005I9-0N; Thu, 18 Mar 2021 11:13:50 +0000
Received: by outflank-mailman (input) for mailman id 98887;
 Thu, 18 Mar 2021 11:13:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMqb6-0005I4-C6
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 11:13:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMqb5-00070O-TI; Thu, 18 Mar 2021 11:13:47 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMqb5-0003rD-Jm; Thu, 18 Mar 2021 11:13:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=dr1ZIw/8uERAU6bmkajAXw9DCggg9HIKaG5EAygBmIs=; b=hOWu0nSAWRiN7lNHnxnRpj8hT+
	9/ePLdF6yq/nAsiWXK67bSeicgCtRC7qoLn2GhIujgJVUlyzjp/RMrvzlfAqCgxvFzNnf31oKJCTd
	501xutzm043CW6ahw9RHMrE3cReW8JVbFJX8TtsNdqwzignQvcw51vlXElF7qzbcPSzM=;
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
 <72E0C95C-D5E1-471B-9590-F4D42E3E066B@arm.com>
 <7ed12d12-6fed-cc3a-4a0b-76ad732d4337@xen.org>
 <C468C8BE-67D0-440D-B8CC-253337A52889@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cc1a28b2-7589-a500-1d31-a07adf35eebc@xen.org>
Date: Thu, 18 Mar 2021 11:13:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <C468C8BE-67D0-440D-B8CC-253337A52889@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 17/03/2021 17:04, Luca Fancellu wrote:
> Hi,

Hi Luca,

> I’ve checked the common code and the arm part, I can confirm that the domid 0 is never allocated even if the domain 0 is not present, here the only places where domain_create(…) is called using a variable value:

Thanks for checking it!


> 1) xen/arch/arm/domain_build.c
> d = domain_create(++max_init_domid, &d_cfg, false);
> Where max_init_domid has value 0 and it is defined in setup.c

We might want to add a comment on top of this code to explain why the 
'++a' rather than 'a++'.

> 
> 2) xen/common/domctl.c
> d = domain_create(dom, &op->u.createdomain, false);
> For me seems that the dom variable won’t take the 0 value, if someone could give another feedback it would be great.
> 
> On every other part where domain_create(…) is used, it is called with a constant value different from 0.

I agree with the analysis. However, I feel this is fragile because we 
rely on the caller to never pass 0. But it looks like domain_create() 
doesn't check if the ID is already used. So it would already be possible 
to overwrite hardware_domain.

Therefore, this can probably be deffered.

> 
> For the hardware_domain being NULL and not handled in some situation, it seems that it’s not directly related to this patch, but I can handle it on a next serie, from a quick look it seems that many cases can be handled by checking if the domain is NULL in is_hardware_domain(…).

Before this series, it is not possible to have hardware_domain == NULL 
at runtime because dom0 is always created.

Cheers,

-- 
Julien Grall

