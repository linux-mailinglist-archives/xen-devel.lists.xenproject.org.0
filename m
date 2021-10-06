Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6E3424552
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203086.358146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYB6d-0003yZ-Nf; Wed, 06 Oct 2021 17:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203086.358146; Wed, 06 Oct 2021 17:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYB6d-0003wH-KU; Wed, 06 Oct 2021 17:53:27 +0000
Received: by outflank-mailman (input) for mailman id 203086;
 Wed, 06 Oct 2021 17:53:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mYB6b-0003wB-FU
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:53:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYB6a-0000eK-06; Wed, 06 Oct 2021 17:53:24 +0000
Received: from [92.174.63.74] (helo=[192.168.1.232])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYB6Z-0001vV-OU; Wed, 06 Oct 2021 17:53:23 +0000
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
	bh=4h7p77+ErMgeMDTxObzjnh0L8kKQ4DK5oHqkmJ48N40=; b=ZLP+ruFj0NZA+F4/Kuc5ImBlYU
	j2ndxSd0ry7SA3Qv7fMqcn5KflpaEqgMFItUAlNk+EkRwG31/oAaZjpYdflcTXocLI12kozPLJc5H
	aDBdcuKJn7ENfPVUAwAJ2+eBygbQqrlEfaAsHE97j0KEpqNqhvVBL8+V4B2s3n0UP+zs=;
Message-ID: <f602b716-63b9-a3d2-237b-2048f8fabbcf@xen.org>
Date: Wed, 6 Oct 2021 19:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
To: Rahul Singh <Rahul.Singh@arm.com>, Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <Andre.Przywara@arm.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
 <11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
 <alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
 <8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
 <24925.33634.554859.2131@mariner.uk.xensource.com>
 <BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
 <24925.35194.369692.94259@mariner.uk.xensource.com>
 <5ADA6C46-A69D-459F-868C-DA579FEC36E2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ADA6C46-A69D-459F-868C-DA579FEC36E2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 06/10/2021 19:34, Rahul Singh wrote:
>> On 6 Oct 2021, at 12:33 pm, Ian Jackson <iwj@xenproject.org> wrote:
>>
>> Rahul Singh writes ("Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in libxl"):
>>> Hi Ian	
>>>> What is wrong with putting it in
>>>> libxl__arch_domain_build_info_setdefault
>>>> which I think exists precisely for this kind of thing ?
>>>
>>> As we have to set the arch_arm.vpci to false for x86 and ARM I
>>> thought it is right to move the code to common code to avoid
>>> duplication.
>>>
>>> Are you suggesting to put "
>>> libxl_defbool_setdefault(&b_info->arch_arm.vpci, false)ïżœin
>>> libxl__arch_domain_build_info_setdefault() for x86 and ARM
>>> differently.
>>
>> I've gone back and reread the whole thread, which I probably should
>> have done to start with....
>>
>> So:
>>
>>>>> #if defined(__arm__) || defined(__aarch64__)
>>>>>    /*
>>>>>     * Enable VPCI support for ARM. VPCI support for DOMU guests is not
>>>>>     * supported for x86.
>>>>>     */
>>>>>    if (d_config->num_pcidevs)
>>>>>      libxl_defbool_set(&b_info->arch_arm.vpci, true);
>>>>> #endif
>>
>> I think this logic probably ought to be in libxl, not in xl.
> 
> I will move the code to "libxl_arm.c"to avoid #ifdef in common code and also  to avoid setting the vpci for x86
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e00..2be208b99b 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -101,6 +101,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           return ERROR_FAIL;
>       }
>   
> +    /* Enable VPCI support. */
> +    if (d_config->num_pcidevs) {
> +        config->flags |= XEN_DOMCTL_CDF_vpci;
> +        libxl_defbool_set(&d_config->b_info.arch_arm.vpci, true);
> +    }
> +
>       return 0;
>   }
> 
>>   We try
>> to make the libxl API "do the right thing" by default.  In this case I
>> think that means to enable VPCI (i) on platforms where it's available
>> (ii) if the guest has PCI passthrough devices.  Is that right ?
> 
> Yes you are right VPCI will be enabled for guest when guest has PCI passthrough device
> assigned and VPCI support is available.
>>
>> Sorry to ask these question now, and please forgive my ignorance:
>>
>> Is VPCI inherently an ARM-specific ABI or protocol ?
> 
> As of now VPCI for DOMU guests is only implemented  for ARM.

We need to differentiate between what it is currently implemented and 
how it can be used in the future.

In particular, the layout of b_info is exposed to external toolstack 
(e.g. libvirt). So we can't easily remove an option. In other word, if 
we end up to need it for an other arch then we will have to keep some 
compat code.

In this case, I think this option is not arm specific. So the field 
ought to be outside of arch_arm.

>   
>>   When might an
>> admin want to turn it on explicitly ?
> 
> It will be enabled dynamically when admin assign any PCI device to guest.
> 
>>
>> How does this all relate to the (non-arch-specific) "passthrough"
>> option ?
> 
> VPCI will be enabled only when there is any PCI device assigned to guest therefore I used
> "d_config->num_pcidevs” to enable VPCI.

Ok. So we don't expect 'xl' or another toolstack to effectively touch 
the field for the time being. Is that correct?

If so, then I think this option should be hidden from external toolstack 
until we see a use.

Cheers,

-- 
Julien Grall

