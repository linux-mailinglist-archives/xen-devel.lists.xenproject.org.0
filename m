Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B70A9053D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956233.1349714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53K8-00026a-FJ; Wed, 16 Apr 2025 14:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956233.1349714; Wed, 16 Apr 2025 14:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53K8-00024p-CR; Wed, 16 Apr 2025 14:01:08 +0000
Received: by outflank-mailman (input) for mailman id 956233;
 Wed, 16 Apr 2025 14:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7a8=XC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u53K7-00024j-Ae
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:01:07 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b416425-1acb-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 16:01:03 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744812050960164.61457083759592;
 Wed, 16 Apr 2025 07:00:50 -0700 (PDT)
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
X-Inumbo-ID: 3b416425-1acb-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744812054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JVLtopfxtjx2mbYVxSq8VJi+9S9cVQFd0FSzjmAZGe6Fd7h04Fn/uSKztCucU/pbMJa0uarZCN1mg5VAutKDd29jbqWFPhI+pxDjtzW1v5icyOh23vuIBwmd3+cRzroPZY21OV08tvb0GkfqkMLSy2QiRX+8V447wKcg2Qv2nJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744812054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Tanzu67FF3cAQy6tnpCRBM7xvljrQD0cGctjLCbFsE=; 
	b=DrOjOdGNbZhZ8AA1Oxv/LBolHckElf0l6KnFaD89GEj9DPzkscKz7yKyFYErwmQoJ3CWK8pmldf+XR4wlm7ld66X51neZ1VG1vzqqRk5wPydxT6XUjzcURZ7Rze1c4u7/NHGXt+NBlRs7cYIDNhaKqAfM5f8eKDmiCIUUUyOf1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744812054;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7Tanzu67FF3cAQy6tnpCRBM7xvljrQD0cGctjLCbFsE=;
	b=ELSIj+PRXXuUe4XPAVspSwqiaAQcsuhFfSpAr5G9y83sJs6Cx9ru3nLOZ4OVcGTt
	wPZakPCY7+1ERpl3qq0owm2mRXma8fxN4mitoDG7K/7IoeNiT7vK3hbI2g60Px0mqz9
	jf+Q94J3RchoP/wc59xuuWl/JIm5IKpuyiPk+nP8=
Message-ID: <6517f3ca-1329-4591-9ccc-e6be5af31e44@apertussolutions.com>
Date: Wed, 16 Apr 2025 10:00:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
 <7fa754f8-d785-45d8-b9da-de5c85bc793b@apertussolutions.com>
 <f0a14866-0f38-4f8d-8e11-993a58c7da7b@suse.com>
 <644cdc5a-b96a-4e43-ae7a-4cadda1d1084@amd.com>
 <3832bb2b-978c-4990-928c-c18a003adcf4@apertussolutions.com>
 <73c8dacd-c1d7-459e-ac18-decaa5c9c5bd@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <73c8dacd-c1d7-459e-ac18-decaa5c9c5bd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



V/r,
Daniel P. Smith
Apertus Solutions, LLC

On 4/16/25 09:33, Jan Beulich wrote:
> On 16.04.2025 15:02, Daniel P. Smith wrote:
>> On 4/10/25 16:56, Jason Andryuk wrote:
>>> On 2025-04-10 11:01, Jan Beulich wrote:
>>>> On 10.04.2025 15:09, Daniel P. Smith wrote:
>>>>> On 4/9/25 02:24, Jan Beulich wrote:
>>>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>>>>
>>>>>>> To begin moving toward allowing the hypervisor to construct more
>>>>>>> than one
>>>>>>> domain at boot, a container is needed for a domain's build
>>>>>>> information.
>>>>>>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the
>>>>>>> initial
>>>>>>> struct boot_domain that encapsulate the build information for a
>>>>>>> domain.
>>>>>>>
>>>>>>> Add a kernel and ramdisk boot module reference along with a struct
>>>>>>> domain
>>>>>>> reference to the new struct boot_domain. This allows a struct
>>>>>>> boot_domain
>>>>>>> reference to be the only parameter necessary to pass down through
>>>>>>> the domain
>>>>>>> construction call chain.
>>>>>>>
>>>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>>
>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> I have to object because the meaningless rename is going cause
>>>>> significant pain in the rebase of the follow-on series for no improved
>>>>> code clarity.
>>>>
>>>> Sorry, then an incremental patch undoing the rename that happened (with
>>>> appropriate justification) will need proposing - the patch here has gone
>>>> in already.
>>>
>>> Coming from a Linux background, ramdisk seemed more natural to me.  But
>>> looking at hvm_start_info, the fields are called module there.  And
>>> since we shouldn't tie this to the Linux naming, the more generic
>>> "module" name seemed fine to me.
>>
>> Again, as I have stated, ramdisk is not a Linux only concept. In fact,
>> as Jan points out, initrd/initramfs are Linux specific implementations
>> of a ramdisk for which Xen doesn't even fully support. I am inclined to
>> ask the inverse of why hvm_start_info uses the name module. But that
>> aside, let's consider the fact that the field is only populated by the
>> device tree when a module type of BOOTMOD_RAMDISK is matched. And all
>> the uses of the field are when its value is stored into a local variable
>> called initrd.
>>
>> Though the biggest irony is that generally obtuse abstraction are
>> routinely blocked unless there is a tangible future case. Yet none was
>> offered in the comment. Thus on that principle alone, a request for a
>> tangible future use should have been requested and provided for the
>> change to be considered.
> 
> Does it even need to be a _future_ use here? Aren't you working on
> abstracting domain creation, suitable (in principle) for all architectures?
> Isn't therefore a more generic name (as "module" is) preferable over a more
> specific one?

Yes we are trying to build a future capability, but my point is let's 
consider all possible known OS's start up today. What other boot module 
could potentially be passed in that is exclusive of a ramdisk, thus 
allowing a multiplex of the field. And the answer is none. The other 
potential modules that could be passed in will need to be able to be 
coexist with a ramdisk module being passed. The immediate examples I can 
point to are, an SELinux policy file or a guest device tree. I'm not too 
familiar, perhaps a Zephyr guest may only take a guest DT, but a Linux 
guest may take an initrd and a DT.

v/r,
dps



