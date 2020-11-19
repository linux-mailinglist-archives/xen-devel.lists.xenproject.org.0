Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFC2B8CCA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 09:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30401.60371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfevc-0000dv-Ik; Thu, 19 Nov 2020 08:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30401.60371; Thu, 19 Nov 2020 08:04:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfevc-0000dW-Fo; Thu, 19 Nov 2020 08:04:28 +0000
Received: by outflank-mailman (input) for mailman id 30401;
 Thu, 19 Nov 2020 08:04:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfevb-0000dR-59
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:04:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14620c92-e3f1-4809-84c5-c88b100e72cb;
 Thu, 19 Nov 2020 08:04:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01225ADCD;
 Thu, 19 Nov 2020 08:04:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfevb-0000dR-59
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:04:27 +0000
X-Inumbo-ID: 14620c92-e3f1-4809-84c5-c88b100e72cb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 14620c92-e3f1-4809-84c5-c88b100e72cb;
	Thu, 19 Nov 2020 08:04:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605773063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxyAukJSmK/PU4Plp32QUs6CgHqvox/AGwUF6rJdUUY=;
	b=Jigi/H02kDeWyi0vmRXm3s3pegjDu9ITi2Qyx5DPEsBTuNav0LrCV5KuCkhVZ0bFZxMqV0
	bj3eKV3E2Jy5Pft4P+znoCKysMc4QBRHomoY/Lu3yuipaTeiMQLeyqZ6PmDAkilJjONG7B
	w2VPwMlScSzrHOV2ChTSiIZTgVobAnU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 01225ADCD;
	Thu, 19 Nov 2020 08:04:23 +0000 (UTC)
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20201118005051.26115-1-sstabellini@kernel.org>
 <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com>
 <alpine.DEB.2.21.2011181241310.11739@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e8c03eb-ee3f-4439-90c2-acf340c7d8e7@suse.com>
Date: Thu, 19 Nov 2020 09:04:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011181241310.11739@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 22:00, Stefano Stabellini wrote:
> On Wed, 18 Nov 2020, Jan Beulich wrote:
>> On 18.11.2020 01:50, Stefano Stabellini wrote:
>>> 1) It is not obvious that "Configure standard Xen features (expert
>>> users)" is actually the famous EXPERT we keep talking about on xen-devel
>>
>> Which can be addressed by simply changing the one prompt line.
>>
>>> 2) It is not obvious when we need to enable EXPERT to get a specific
>>> feature
>>>
>>> In particular if you want to enable ACPI support so that you can boot
>>> Xen on an ACPI platform, you have to enable EXPERT first. But searching
>>> through the kconfig menu it is really not clear (type '/' and "ACPI"):
>>> nothing in the description tells you that you need to enable EXPERT to
>>> get the option.
>>
>> And what causes this to be different once you switch to UNSUPPORTED?
> 
> Two things: firstly, it doesn't and shouldn't take an expert to enable
> ACPI support, even if ACPI support is experimental. So calling it
> UNSUPPORTED helps a lot. This is particularly relevant to the ARM Kconfig
> options changed by this patch. Secondly, this patch is adding
> "(UNSUPPORTED)" in the oneline prompt so that it becomes easy to match
> it with the option you need to enable.

There's redundancy here then, which I think is in almost all cases
better to avoid. That's first and foremost because the two places
can go out of sync. Therefore, if the primary thing is to help
"make menuconfig" (which I admit I don't normally use, as it's
nothing that gets invoked implicitly by the build process afaict,
i.e. one has to actively invoke it), perhaps we should enhance
kconfig to attach at least a pre-determined subset of labels to
the prompts automatically?

And second, also in reply to what you've been saying further down,
perhaps we would better go with a hierarchy of controls here, e.g.
EXPERT -> EXPERIMENTAL -> UNSUPPORTED?

>>> So this patch makes things easier by doing two things:
>>>
>>> - introduce a new kconfig option UNSUPPORTED which is clearly to enable
>>>   UNSUPPORTED features as defined by SUPPORT.md
>>>
>>> - change EXPERT options to UNSUPPORTED where it makes sense: keep
>>>   depending on EXPERT for features made for experts
>>>
>>> - tag unsupported features by adding (UNSUPPORTED) to the one-line
>>>   description
>>
>> I am, btw, not fully convinced of the need for this redundancy. Wouldn't
>> it be enough to have just EXPERT as a setting, but varying (<reason>)
>> tokens in the prompt text?
> 
> I don't think so, for the same reasons written above: EXPERT should not
> be gating things like ACPI.

Different views are possible here, I suppose. Turning on anything
that's unsupported requires people to know what they're doing (and
be ready to pick up the pieces themselves). I'd consider this to
fall under "expert".

> Moreover, the advantage of the tag in the
> oneline prompt is that you can search for an option and figure out that
> you need to enable UNSUPPORTED. It doesn't work if we use a different
> tag. Just to get the idea, try to do "make menuconfig" and search for
> "ARGO" with '/': you'll see "(UNSUPPORTED)". Then, if you search for
> "UNSUPPORTED" you can find what you need to enable.

Implying that textual representation and Kconfig option name match,
see above. Even a simple spelling mistake would break this model.

>>> --- a/xen/Kconfig
>>> +++ b/xen/Kconfig
>>> @@ -34,8 +34,17 @@ config DEFCONFIG_LIST
>>>  	option defconfig_list
>>>  	default ARCH_DEFCONFIG
>>>  
>>> +config UNSUPPORTED
>>> +	bool "Configure UNSUPPORTED features"
>>> +	help
>>> +	  This option allows unsupported Xen options to be enabled, which
>>
>> I'd recommend against "enabled" - a control may also be there to allow
>> disabling something.
> 
> I can change that.
> 
> 
>>> +	  includes non-security-supported, experimental, and tech preview
>>> +	  features as defined by SUPPORT.md. Xen binaries built with this
>>> +	  option enabled are not security supported.
>>
>> Overall I'm a little afraid of possible inverse implications: Anything
>> _not_ dependent upon this option (and in particular anything not
>> dependent upon any Kconfig control) may be considered supported then.
>>
>> Also the last sentence is already present for EXPERT, 
> 
> I am happy to rephrase it. What about:
> 
> "This option allows certain unsupported Xen options to be changed, which
> includes non-security-supported, experimental, and tech preview features
> as defined by SUPPORT.md."

Sounds better to me.

>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -151,7 +151,7 @@ config KEXEC
>>>  	  If unsure, say Y.
>>>  
>>>  config EFI_SET_VIRTUAL_ADDRESS_MAP
>>> -    bool "EFI: call SetVirtualAddressMap()" if EXPERT
>>> +    bool "EFI: call SetVirtualAddressMap() (UNSUPPORTED)" if UNSUPPORTED
>>
>> I have to admit I'm pretty unsure about what to do with this one.
> 
> Yeah, similarly to XEN_SHSTK, I don't have an opinion here either.  I am
> happy to change it or leave it as.

I guess at least for the first cut I'd like to ask to just leave it
alone.

Jan

