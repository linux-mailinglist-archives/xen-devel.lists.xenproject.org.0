Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D369C8973
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:05:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836355.1252232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYat-00017K-96; Thu, 14 Nov 2024 12:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836355.1252232; Thu, 14 Nov 2024 12:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYat-00015L-50; Thu, 14 Nov 2024 12:05:03 +0000
Received: by outflank-mailman (input) for mailman id 836355;
 Thu, 14 Nov 2024 12:05:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBYas-00015F-8P
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:05:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBYap-004pYP-1e;
 Thu, 14 Nov 2024 12:04:59 +0000
Received: from [15.248.3.93] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBYao-004Gid-2R;
 Thu, 14 Nov 2024 12:04:58 +0000
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
	bh=FP9v43NDpOxTfi1whLij228pxlcxSdo5+0NGXttSYD8=; b=BGZrZrOXOlQdsfkyb82Z6EVkic
	G+9Irqdykdx0OVQFCXRJSKkt64wJ5OIQwFH4Eec/YbiHIrfBVjEcZL1UR6JpP3l9YTjwTMGlA+Lxy
	iQMnbU1GAb3LeB88cDRO49lE+S0hh9yHcu08Jey6CKBoKjdxvhCE60ABkXuxn5hSmlSg=;
Message-ID: <8e467912-a71a-4c10-91dc-46706ed7aa1e@xen.org>
Date: Thu, 14 Nov 2024 12:04:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
 <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
 <92564de9-24f7-4259-bc45-a95680101693@xen.org>
 <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/11/2024 11:48, Michal Orzel wrote:
> 
> 
> On 14/11/2024 11:31, Julien Grall wrote:
>> Looking at the code, I think /memreserve/ and /reserved-memory are not
>> mapped in Xen and everything in /reserved-memory is mapped to dom0.
> Why do we forward /reserved-memory to dom0 fdt but /memreserve/ not?

I was wondering the same. The main issue I can think of with 
/memreserve/ is some of the regions will likely be for Xen own usage. So 
we would need to have a way to exclude them from dom0.

 >  From the discussion> we're having it seems like we should treat them 
equally. Also, looking at Luca patch,
> we seem to special case /memreserve/ and only allow for overlap /memresrve/ with boot modules
> and not /reserved-memory/ with boot modules. If we are going to claim that all the boot modules
> can be marked as reserved by the bootloader, then I think we should treat them equally providing
> the same experience to dom0.

In my mind, /memreserved/ and /reserved-memory/ are different. The 
former doesn't say what the region is for, but the latter will indicate it.

So I am not 100% sure how the bootmodule could end up in 
/reserved-memory/ because they are described as part of the multiboot 
modules. Do you have a scenario?

Regardless that, if we decide to allow boot modules in /reserved-memory/ 
then we would need need to rework how the reserved-regions are mapped 
because we don't want the boot modules to be exposed to dom0.

> 
> Last thing I wanted to ask (for my clarity) is that if bootloader loads initrd at region A and marks
> it as reserved (either in /memreserve/ or /reserved-memory/), and later on Xen copies initrd from region
> A to B, shouldn't the reserved memory region be updated to cover new region for initrd?

If we mark the region has a reserved, then we are telling the OS it 
can't use the region. But I am not sure why it would be needed as Xen 
doesn't care how the regions is going to be used by the domain. From a 
domain side, do you see any reason why we would want to mark again the 
region as reserved?

If we didn't copy the initrd, then I would have directly agreed that 
they should be marked as /memreserve/.

Cheers,

-- 
Julien Grall


