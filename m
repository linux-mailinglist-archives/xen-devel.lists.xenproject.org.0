Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B821AD1BB5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 12:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010228.1388398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZvm-00059P-Ho; Mon, 09 Jun 2025 10:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010228.1388398; Mon, 09 Jun 2025 10:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZvm-000576-EZ; Mon, 09 Jun 2025 10:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1010228;
 Mon, 09 Jun 2025 10:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bnjC=YY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uOZvl-000570-H2
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 10:40:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fdc70d5-451e-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 12:40:40 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453066fad06so9635435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 03:40:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5323b67ccsm9261407f8f.40.2025.06.09.03.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 03:40:39 -0700 (PDT)
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
X-Inumbo-ID: 2fdc70d5-451e-11f0-a304-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749465640; x=1750070440; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y9vtwJwC4yXW/Zm9wPRw+HunVVWlInElqaYADj5QPK8=;
        b=b1zBpd1U1kVIb/nmYTsamgPin9OE2QfDYu7Uae9IdqGf3IR4pASEQ4Rn/6XYTUyzXc
         OTSFbCXmWT0AksF4HmIUwA7tYOIOhmT/H0SUzdsi7C04UMbOabyCm8PceiOapoYZDaio
         whMEKuAL7x4Y5uhPclxD9L2LgKdlB6SOEtOrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465640; x=1750070440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9vtwJwC4yXW/Zm9wPRw+HunVVWlInElqaYADj5QPK8=;
        b=Pa2WcVbkNuSgruAVvyE7tY0ZXFTpYkreA8vvZ4L+cjdRVNfI1thlLxN4IWAflyUVXG
         4DbWyGGOoLL5klu63ERJDG8//LmPd/jQikmKp1/ysFa6kvQzcXfdLgFdQGRMuFSNgytn
         09FRwh4GVs4MhtI+WEbInMJDxD+D/3nl9BIV4LcKsPWh0tT8qrZNXyQQv5f+Z9ksG9Bm
         c7hwhVIM7Ye+zvkblGn/t/KwxknZL7L78l5TRdD6puGDPtT9vC7Ddt4UZpbJz6etGxkp
         pE9IlYg55mZkw9O/zRIyeNJbN1QaqKax8D73OKfch7SGAznYcPAjeKUhrA2wBexPMwBG
         FlXw==
X-Gm-Message-State: AOJu0YwDDkCTl5QpNvSwd7tfBckist8hDcDP+jChQmrfu4ukGRSbISkP
	rc52YLBVal5lFjxZ49KXkOXwbyunqx7D0oTe0qBDLmje2BdKGovHCA7GQxbbcZtSWVs=
X-Gm-Gg: ASbGncu39+eIUvEWIUTGeYCs3ppQiFRhB5Zd+FW20i8XUveCnUbgq5SFYHOOzeY8Ffj
	Luq/O8esx1pLlnrnyXR0skalT2fCgjJp/wvneEa8GuZw8cZgVBaBlC1WH9vu0Jdu04bamprrLJt
	R5LEq1s4MSkzw1cEr5JTDr7hJASroWOyrKDIwovc0gzzntgwMYNoW0r17EVZW1TmRnibMPS1Hw+
	AZcXeimYC6N5tnQQpQ3eoi0m+GK+S0crPWwjqIeGpT/PNxjbWe4u2xw3+srIW7XcU3/tRqXfwtT
	sOroClqC8zFy81OXYCTlBz0JYgX0tmu2An79odjq4+moPSZvaBCawx3rsXe9ba5IsNz6iBqQIzd
	yptfzZxoEOC+dGIz3hDE6gCSqL9hraQ==
X-Google-Smtp-Source: AGHT+IHvM9B3HX+yuAtRiC0fNa3herefi7/3fe9LYJAdv0rjnvbQVxfA75DBCIofg93xb8X2Q5DsDg==
X-Received: by 2002:a05:600c:4751:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4530c39d65fmr41804505e9.13.1749465639749;
        Mon, 09 Jun 2025 03:40:39 -0700 (PDT)
Date: Mon, 9 Jun 2025 12:40:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aEa6JsVwyWchp04u@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEapjHyBxHkkylkh@macbook.local>
 <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Jun 09, 2025 at 10:18:42AM +0000, Chen, Jiqian wrote:
> On 2025/6/9 17:29, Roger Pau Monné wrote:
> > On Mon, Jun 09, 2025 at 07:50:21AM +0000, Chen, Jiqian wrote:
> >> On 2025/6/6 17:14, Roger Pau Monné wrote:
> >>> On Fri, Jun 06, 2025 at 09:05:48AM +0200, Jan Beulich wrote:
> >>>> On 06.06.2025 08:29, Chen, Jiqian wrote:
> >>>>> On 2025/6/5 20:50, Roger Pau Monné wrote:
> >>>>>> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote: 
> >>>>>>> +  }; \
> >>>>>>> +  static vpci_capability_t *const finit##_entry  \
> >>>>>>> +               __used_section(".data.vpci") = &finit##_t
> >>>>>>
> >>>>>> IMO this should better use .rodata instead of .data. 
> >>>>> Is below change correct?
> >>>>>
> >>>>> +    static const vpci_capability_t *const finit##_entry  \
> >>>>> +        __used_section(".rodata") = &finit##_t
> >>>>
> >>>> No, specifically because ...
> >>>>
> >>>>>> Not that it matters much in practice, as we place it in .rodata anyway.  Note
> >>>>>> however you will have to move the placement of the VPCI_ARRAY in the
> >>>>>> linker script ahead of *(.rodata.*), otherwise that section match will
> >>>>>> consume the vPCI data.
> >>>>> I am sorry, how to move it ahead of *(.rodata.*) ?
> >>>>> Is below change correct?
> >>>>>
> >>>>> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> >>>>> index 793d0e11450c..3817642135aa 100644
> >>>>> --- a/xen/include/xen/xen.lds.h
> >>>>> +++ b/xen/include/xen/xen.lds.h
> >>>>> @@ -188,7 +188,7 @@
> >>>>>  #define VPCI_ARRAY               \
> >>>>>         . = ALIGN(POINTER_ALIGN); \
> >>>>>         __start_vpci_array = .;   \
> >>>>> -       *(SORT(.data.vpci.*))     \
> >>>>> +       *(.rodata)             \
> >>>>
> >>>> ... this isn't - you'd move _all_ of .rodata into here, which definitely
> >>>> isn't what you want. What I understand Roger meant was a .rodata-like
> >>>> section, e.g. .rodata.vpci.* (much like it was .data.vpci.* before).
> >>>
> >>> Indeed, my suggestion was merely to use .rodata instead of .data, as
> >>> that's more accurate IMO.  I think it should be *(.rodata.vpci) (and
> >>> same section change for the __used_section() attribute.
> >>
> >> If I understand correctly, the next version will be:
> >>
> >> +    static const vpci_capability_t *const finit##_entry  \
> >> +        __used_section(".rodata.vpci") = &finit##_t
> >> +
> >>
> >> and
> >>
> >>  #define VPCI_ARRAY               \
> >>         . = ALIGN(POINTER_ALIGN); \
> >>         __start_vpci_array = .;   \
> >> -       *(SORT(.data.vpci.*))     \
> >> +       *(.rodata.vpci)           \
> >>         __end_vpci_array = .;
> > 
> > Did you also move the instances of VPCI_ARRAY in the linker scripts so
> > it's before the catch-all *(.rodata.*)?
> > 
> >>
> >> But, that encountered an warning when compiling.
> >> " {standard input}: Assembler messages:
> >> {standard input}:1160: Warning: setting incorrect section attributes for .rodata.vpci
> >> {standard input}: Assembler messages:
> >> {standard input}:3034: Warning: setting incorrect section attributes for .rodata.vpci
> >> {standard input}: Assembler messages:
> >> {standard input}:6686: Warning: setting incorrect section attributes for .rodata.vpci "
> > 
> > What are the attributes for .rodata.vpci in the object files?  You can
> > get those using objdump or readelf, for example:
> > 
> > $ objdump -h xen/drivers/vpci/msi.o
> > [...]
> >  17 .data.vpci.9  00000008  0000000000000000  0000000000000000  00000a50  2**3
> >                   CONTENTS, ALLOC, LOAD, RELOC, DATA
> > 
> > It should be READONLY, otherwise you will get those messages.
> > 
> >> And, during booting Xen, all value of __start_vpci_array is incorrect.
> >> Do I miss anything?
> > 
> > I think that's likely because you haven't moved the instance of
> > VPCI_ARRAY in the linker script?
> Oh, right. Sorry, I forgot to move it.
> After changing this, it works now.
> 
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index bf956b6c5fc0..c88fd62f4f0d 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -134,6 +134,7 @@ SECTIONS
>         BUGFRAMES
> 
>         *(.rodata)
> +       VPCI_ARRAY
>         *(.rodata.*)
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
> @@ -148,7 +149,6 @@ SECTIONS
>         *(.note.gnu.build-id)
>         __note_gnu_build_id_end = .;
>  #endif
> -       VPCI_ARRAY
>    } PHDR(text)

FWIW, I would put it ahead of *(.rodata).  Remember to also modify the
linker script for all the other arches, not just x86.

Thanks, Roger.

