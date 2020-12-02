Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073D2CBF2F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42759.76947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSqc-0000JV-9Q; Wed, 02 Dec 2020 14:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42759.76947; Wed, 02 Dec 2020 14:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSqc-0000It-5n; Wed, 02 Dec 2020 14:11:10 +0000
Received: by outflank-mailman (input) for mailman id 42759;
 Wed, 02 Dec 2020 14:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkSqa-0000In-Of
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:11:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSqa-0002Z0-D7; Wed, 02 Dec 2020 14:11:08 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSqa-0001AL-3l; Wed, 02 Dec 2020 14:11:08 +0000
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
	bh=JhAUXmvFa2YAXnelqSqr2MrMrVaCGJG+Ro8or6l66i8=; b=qs0dzSljClMkN2Q9r++2ip3B/l
	pYtK4hBzwJN5KKEG0Ie9PiQZwT/XIsTGh9GVJNKBDwC4m+CeCgfB4IJ6oH/LJjuv8v4tqRjqRYa6T
	ODRxHlCdRspSBalVjmnGzLv5NWpKwciNbX1/yxSA7DRFh+VL+odxJSpJQrGoUm2iH4gs=;
Subject: Re: [PATCH v2 4/8] xen/arm: Remove support for MSI on SMMUv3
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <cfc6cbe23f05162d5c62df9db09fef3f8e0b8e14.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011621380.1100@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012011639230.1100@sstabellini-ThinkPad-T480s>
 <D79D7DC5-649D-4517-A8CA-B13632595DA5@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5689cfe7-ca16-6540-d394-00d3f60f4f5f@xen.org>
Date: Wed, 2 Dec 2020 14:11:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <D79D7DC5-649D-4517-A8CA-B13632595DA5@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 02/12/2020 13:12, Rahul Singh wrote:
> Hello Stefano,
> 
>> On 2 Dec 2020, at 12:40 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 1 Dec 2020, Stefano Stabellini wrote:
>>> On Thu, 26 Nov 2020, Rahul Singh wrote:
>>>> XEN does not support MSI on ARM platforms, therefore remove the MSI
>>>> support from SMMUv3 driver.
>>>>
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>
>>> I wonder if it makes sense to #ifdef CONFIG_MSI this code instead of
>>> removing it completely.
>>
>> One more thought: could this patch be achieved by reverting
>> 166bdbd23161160f2abcea70621adba179050bee ? If this patch could be done
>> by a couple of revert, it would be great to say it in the commit
>> message.
>>
>   Ok will add in next version.
> 
>>
>>> In the past, we tried to keep the entire file as textually similar to
>>> the original Linux driver as possible to make it easier to backport
>>> features and fixes. So, in this case we would probably not even used an
>>> #ifdef but maybe something like:
>>>
>>>   if (/* msi_enabled */ 0)
>>>       return;
>>>
>>> at the beginning of arm_smmu_setup_msis.
>>>
>>>
>>> However, that strategy didn't actually work very well because backports
>>> have proven difficult to do anyway. So at that point we might as well at
>>> least have clean code in Xen and do the changes properly.

It was difficult because Linux decided to rework how IOMMU drivers 
works. I agree the risk is still there and therefore clean code would be 
better with some caveats (see below).

> 
> Main reason to remove the feature/code that is not usable in XEN is to have a clean code.

I agree that short term this feature will not be usable. However, I 
think we need to think about {medium, long}-term plan to avoid extra 
effort in the future because the driver evolve in a way making the 
revert of revert impossible.

Therefore I would prefer to keep both the MSI and PCI ATS present as 
they are going to be useful/necessary on some platforms. It doesn't 
matter that they don't work because the driver will be in tech preview.

Cheers,

-- 
Julien Grall

