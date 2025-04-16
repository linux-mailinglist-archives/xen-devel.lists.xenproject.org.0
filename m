Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46177A90434
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956068.1349578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52gL-000372-Jv; Wed, 16 Apr 2025 13:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956068.1349578; Wed, 16 Apr 2025 13:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52gL-00035D-HJ; Wed, 16 Apr 2025 13:20:01 +0000
Received: by outflank-mailman (input) for mailman id 956068;
 Wed, 16 Apr 2025 13:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7a8=XC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u52gK-000357-5R
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:20:00 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dab8dbb-1ac5-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 15:19:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744809587652866.6064373494291;
 Wed, 16 Apr 2025 06:19:47 -0700 (PDT)
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
X-Inumbo-ID: 7dab8dbb-1ac5-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744809591; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h0QfuHOKE38wheAEER0Gd4u0sb6XOiM6hVXABgIbmt404az8jK//g+xvKCD6cc7cs/SQj5dEfmdhqVTx1JxKsaRKRbTrtfzq5IvcWhRZwk58n0re+F5UzDgk44p4LDLTfSjh1PzvanmRK6YYvt1XN9RtpHGAprU6eonTMWAhpSk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744809591; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Yi5yZOy0WgSeh/oDXQoDl/TLlCUzDfKzTXDHkKupCgY=; 
	b=K8nMweV107yU8aUMSbIeKI9o76Vk+faVNxT0up4XILwfZ2H+xVTT4VVVaR1A3sKB8WR5aT+eown3eJohAeqYDu2hbCGGqtE0qno5HNzxTT2b8R2F2tkR+aUPFr3QC6j1hXOyNuR92NDW4icw2Mi0X5M2Xj65a9igwSOyTjFB3lU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744809591;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Yi5yZOy0WgSeh/oDXQoDl/TLlCUzDfKzTXDHkKupCgY=;
	b=cNlS3/mIQV9AyicbJPQM3Qn8HFf3Z5h/r5CzEce1HRexKqXdrh+0xLQaXmynHgFU
	VBmi4hnKKjFJmSBWiTWi0OTOiTfvoqPT9w+YxSdw7yirHdB1Pbofb5rssIDTpe+xwSg
	pocCffyyPsHOA6dv0CttvsaQlTXD0lOv410CisPc=
Message-ID: <e6bc2726-e835-4d91-bc63-0b189c4cc640@apertussolutions.com>
Date: Wed, 16 Apr 2025 09:19:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
 <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com> <D96JE0Q8U026.2FWWHTWUUMTPE@amd.com>
 <60363eb4-cb35-4077-b964-0c321c495a19@suse.com>
 <D9771CIVB3IR.TAKEYOHRCY30@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <D9771CIVB3IR.TAKEYOHRCY30@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 4/15/25 07:59, Alejandro Vallejo wrote:
> On Tue Apr 15, 2025 at 7:17 AM BST, Jan Beulich wrote:
>> On 14.04.2025 19:27, Alejandro Vallejo wrote:
>>> On Mon Apr 14, 2025 at 6:06 PM BST, Alejandro Vallejo wrote:
>>>> On Thu Apr 10, 2025 at 12:34 PM BST, Jan Beulich wrote:
>>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>>
>>>>>> +            printk("  ramdisk: boot module %d\n", idx);
>>>>>> +            bi->mods[idx].type = BOOTMOD_RAMDISK;
>>>>>> +            bd->module = &bi->mods[idx];
>>>>>
>>>>> The field's named "module" now, but that now ends up inconsistent with
>>>>> naming used elsewhere, as is pretty noticeable here.
>>>>
>>>> Well, yes. It is confusing. Also, the DTB is called multiboot,ramdisk,
>>>> because multiboot,module is already used to detect what nodes are
>>>> expressed as multiboot,modules. I'm considering going back and calling
>>>> them ramdisk again. If anything, to avoid the ambiguity between
>>>> domain modules and multiboot modules. e.g: a kernel is a multiboot
>>>> module, but not a domain module.
>>>
>>> Particularly when misc/arm/device-tree/booting.txt already states that
>>> the initrd for dom0 ought to be provided with the "multiboot,ramdisk"
>>> string in the "compatible" prop.  Deviating from that is just going to
>>> make it far more annoying to unify arm and x86 in the future.  And
>>> calling those ramdisks anything but ramdisk internally is just plain
>>> confusing (as evidenced in the current series).
>>
>> Yet the limitation of this is quite obvious: How would you express
>> multiple such items?
> 
> With multiple such nodes.
> 
>    initrd1 {
>        compatible = "multiboot,ramdisk", "multiboot,module"
>        module-idx = <2>
>    };
>    initrd2 {
>        compatible = "multiboot,ramdisk", "multiboot,module"
>        module-idx = <3>
>    };
> 
> as is done in dom0less. This is not a hypothetical, it's already
> comitted.
> 
>> Have many "ramdisk"s?
> 
> As many as I require. If I was booting Xen(dom0+initrd) on
> Xen(hyperlaunch), that'd be 2 (with Xen passed as the kernel).
> 
>> Even if some of them serve an entirely different purpose?
> 
> The purpose of a ramdisk/initrd is of no concern to the hypervisor. They are
> specially crafted blobs consumed by kernels for purposes of bootstrap.
> 
>> See how Linux has gone to tuck together multiple CPIOs, as they can
>> have only one thing called "ramdisk" (which, aiui, now no longer truly
>> is).
> 
> That's an internal Linux matter. If they need 1, we'll pass 1. We do
> need several such blobs, because some OSs do need them. Namely, Xen. And
> AFAICS we call them modules mostly because (a) Xen does not have the
> module infrastructure that Linux has, which would causes ambiguities and
> (b) is typically loaded via multiboot, which does call each blob a
> module.
> 
>>
>>> So... how frontally opposed would you be to restoring the ramdisk
>>> nomenclature? Also, for ease of rebasing future patches it'd be far
>>> nicer to go back to ramdisk rather than reinventing some new name.
>>
>> Well, I fear I wouldn't ack such a patch. If everyone else agrees
>> that "ramdisk" is the best of all names (or at least getting close),
>> I'd perhaps mumble over, but let it go in.
> 
> Ok... When I send v4 I'll do so keeping the "module" rename. Meanwhile,
> I'll try to think of some options. Calling Xen's modules and the booted
> kernel modules the same way is just way too confusing.
> 
> I take it you have the same dislike for initrd as you do for ramdisk?
> 
>>
>> (Only partly as a joke: If we dislike "module", how about "blob" or
>> some such?)
> 
> Better not. Blob makes "kernel" sound like an adjective: Kernel blob.
> 
> There might be some other suitable word. I'll think about it.

And all this confusion and mess would have been avoided if left as the 
abstract ramdisk name.

v/r,
dps

