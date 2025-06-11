Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C6DAD52D9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011556.1390008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ9Q-0007SD-6A; Wed, 11 Jun 2025 10:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011556.1390008; Wed, 11 Jun 2025 10:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ9Q-0007QF-35; Wed, 11 Jun 2025 10:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1011556;
 Wed, 11 Jun 2025 10:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPJ9O-0007Ok-CU
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:57:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7fd04f3-46b2-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:57:46 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so56196125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:57:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453251712d8sm17527655e9.15.2025.06.11.03.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 03:57:44 -0700 (PDT)
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
X-Inumbo-ID: e7fd04f3-46b2-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749639465; x=1750244265; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cl+GhCpfu7nIBWM8Sg9hxFo9G8+cunQFO2sUMxQXoZs=;
        b=HKqCrI0GMOZwtHi1pJZqTHdVsWWwxc96aBgIRiJlbqpysk1aH3GSg2nzsejygJk1Vk
         GltdSQinyPJayyyPTofOLf+fmNpIx3SLuieOtLX7PEo+kHebYzv1YsYjLxLuEHxBFwro
         nnbgDmfuaf90Cygrlesuap6gwNef05hSp2dbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639465; x=1750244265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl+GhCpfu7nIBWM8Sg9hxFo9G8+cunQFO2sUMxQXoZs=;
        b=YHaGRyPC+t/1yYmOElRlIL3Pik32WDeW6nnjCDgHVYrPqeCzV0ZSkwRpx2XDq/VFj/
         zdVTiuFZaIbGZwSIEvOJ1H3nb25MWfLzWQytwbcorPiXEkhD8pI0fsuMXobs3jWnm3Ed
         bC3Fn8O2bSjHQGx+p3CGzHe29RY/TpXxOD1giyXGAbO3zwKiPRvZLNqxc0xjGDvBSWJC
         RZZ7KDZRn/1VApUsrJIY/iwbCu3fLNRmm+VUvPCbBQgx73UMcspPLYH3qFhmIB9EV74s
         o8Ykh5rWSohzy+QRgCBZbqCFTy8MaBpFQPA05Ui0dMGuywsclNvSuGi5ud1ytc4DNObY
         JPvA==
X-Gm-Message-State: AOJu0YylD9NwcZSKsDdYqcuPc1ItzEJ5HWYXHVzjdqbJgBUp74uzbz3f
	DBxmwStFsBmYZGpwW8qtgv3KGtH58F6RtEMMjXttpajabEvFf1WQwuEtrSJfia/4XMg4XRljg9E
	ItCle
X-Gm-Gg: ASbGncsB5UNUhs7l4mWOnpID461w+LA8R3DZ5zIykZXMzSBW9QZH1JMHOcz3pozIMec
	Ee/KwwGyZx7bC8iC79+G8pjgK/3C+YaFZtICjEckPGtnPUlZE9iD3KNu5crwenn5HKebONIa7ej
	ZuKb4zwunol/kWLX/iYNK2oSF5p92+SpCMvoxxIzFVmrisfbqB61KXVB9Zx1bgyz6nSKbvCCNOr
	3jMO2BJB87Rp68Ntx/jblsQ1jgtiqNbrV5DHTEEya1rikevex5vJ0BCbunRvPL90sN62V0vDg/S
	lzhBRouppM2xCDW3q/65dEQ1mf/iG9Kzpmm5CQHuz8QexkQeoNRFbW40Zp43apAb1P2ifq3YOaR
	ahevNToEOeHts4cSe2Yf/ENcOO8FZ4jhajED+H7YtSvjZQg==
X-Google-Smtp-Source: AGHT+IGXUC5ZbMOtNPJBzXBB0lnv1I1H7Tc3Hl7X7ASDM4YMb+Gd3GH9sdI01nxMMtqa/uusq9NGVw==
X-Received: by 2002:a05:600c:8b44:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-453248db1a0mr24981415e9.27.1749639465367;
        Wed, 11 Jun 2025 03:57:45 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:57:44 +0200
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
Message-ID: <aElhKE7PHjayElEk@macbook.local>
References: <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEapjHyBxHkkylkh@macbook.local>
 <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEa6JsVwyWchp04u@macbook.local>
 <PH7PR12MB5854FC2E82CD17483B6B6BCFE76AA@PH7PR12MB5854.namprd12.prod.outlook.com>
 <6a7a1ab8-aabb-465b-bd22-a2bc1597b83b@suse.com>
 <BL1PR12MB584931934C33F982899FA577E775A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584931934C33F982899FA577E775A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Jun 11, 2025 at 10:19:34AM +0000, Chen, Jiqian wrote:
> Hi Roger,
> 
> On 2025/6/10 15:08, Jan Beulich wrote:
> > On 10.06.2025 05:52, Chen, Jiqian wrote:
> >> On 2025/6/9 18:40, Roger Pau Monné wrote:
> >>> On Mon, Jun 09, 2025 at 10:18:42AM +0000, Chen, Jiqian wrote:
> >>>> On 2025/6/9 17:29, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 09, 2025 at 07:50:21AM +0000, Chen, Jiqian wrote:
> >>>>>> On 2025/6/6 17:14, Roger Pau Monné wrote:
> >>>>>>> On Fri, Jun 06, 2025 at 09:05:48AM +0200, Jan Beulich wrote:
> >>>>>>>> On 06.06.2025 08:29, Chen, Jiqian wrote:
> >>>>>>>>> On 2025/6/5 20:50, Roger Pau Monné wrote:
> >>>>>>>>>> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote: 
> >>>>>>>>>>> +  }; \
> >>>>>>>>>>> +  static vpci_capability_t *const finit##_entry  \
> >>>>>>>>>>> +               __used_section(".data.vpci") = &finit##_t
> >>>>>>>>>>
> >>>>>>>>>> IMO this should better use .rodata instead of .data. 
> >>>>>>>>> Is below change correct?
> >>>>>>>>>
> >>>>>>>>> +    static const vpci_capability_t *const finit##_entry  \
> >>>>>>>>> +        __used_section(".rodata") = &finit##_t
> >>>>>>>>
> >>>>>>>> No, specifically because ...
> >>>>>>>>
> >>>>>>>>>> Not that it matters much in practice, as we place it in .rodata anyway.  Note
> >>>>>>>>>> however you will have to move the placement of the VPCI_ARRAY in the
> >>>>>>>>>> linker script ahead of *(.rodata.*), otherwise that section match will
> >>>>>>>>>> consume the vPCI data.
> >>>>>>>>> I am sorry, how to move it ahead of *(.rodata.*) ?
> >>>>>>>>> Is below change correct?
> >>>>>>>>>
> >>>>>>>>> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> >>>>>>>>> index 793d0e11450c..3817642135aa 100644
> >>>>>>>>> --- a/xen/include/xen/xen.lds.h
> >>>>>>>>> +++ b/xen/include/xen/xen.lds.h
> >>>>>>>>> @@ -188,7 +188,7 @@
> >>>>>>>>>  #define VPCI_ARRAY               \
> >>>>>>>>>         . = ALIGN(POINTER_ALIGN); \
> >>>>>>>>>         __start_vpci_array = .;   \
> >>>>>>>>> -       *(SORT(.data.vpci.*))     \
> >>>>>>>>> +       *(.rodata)             \
> >>>>>>>>
> >>>>>>>> ... this isn't - you'd move _all_ of .rodata into here, which definitely
> >>>>>>>> isn't what you want. What I understand Roger meant was a .rodata-like
> >>>>>>>> section, e.g. .rodata.vpci.* (much like it was .data.vpci.* before).
> >>>>>>>
> >>>>>>> Indeed, my suggestion was merely to use .rodata instead of .data, as
> >>>>>>> that's more accurate IMO.  I think it should be *(.rodata.vpci) (and
> >>>>>>> same section change for the __used_section() attribute.
> >>>>>>
> >>>>>> If I understand correctly, the next version will be:
> >>>>>>
> >>>>>> +    static const vpci_capability_t *const finit##_entry  \
> >>>>>> +        __used_section(".rodata.vpci") = &finit##_t
> >>>>>> +
> >>>>>>
> >>>>>> and
> >>>>>>
> >>>>>>  #define VPCI_ARRAY               \
> >>>>>>         . = ALIGN(POINTER_ALIGN); \
> >>>>>>         __start_vpci_array = .;   \
> >>>>>> -       *(SORT(.data.vpci.*))     \
> >>>>>> +       *(.rodata.vpci)           \
> >>>>>>         __end_vpci_array = .;
> >>>>>
> >>>>> Did you also move the instances of VPCI_ARRAY in the linker scripts so
> >>>>> it's before the catch-all *(.rodata.*)?
> >>>>>
> >>>>>>
> >>>>>> But, that encountered an warning when compiling.
> >>>>>> " {standard input}: Assembler messages:
> >>>>>> {standard input}:1160: Warning: setting incorrect section attributes for .rodata.vpci
> >>>>>> {standard input}: Assembler messages:
> >>>>>> {standard input}:3034: Warning: setting incorrect section attributes for .rodata.vpci
> >>>>>> {standard input}: Assembler messages:
> >>>>>> {standard input}:6686: Warning: setting incorrect section attributes for .rodata.vpci "
> >>>>>
> >>>>> What are the attributes for .rodata.vpci in the object files?  You can
> >>>>> get those using objdump or readelf, for example:
> >>>>>
> >>>>> $ objdump -h xen/drivers/vpci/msi.o
> >>>>> [...]
> >>>>>  17 .data.vpci.9  00000008  0000000000000000  0000000000000000  00000a50  2**3
> >>>>>                   CONTENTS, ALLOC, LOAD, RELOC, DATA
> >>>>>
> >>>>> It should be READONLY, otherwise you will get those messages.
> >>>>>
> >>>>>> And, during booting Xen, all value of __start_vpci_array is incorrect.
> >>>>>> Do I miss anything?
> >>>>>
> >>>>> I think that's likely because you haven't moved the instance of
> >>>>> VPCI_ARRAY in the linker script?
> >>>> Oh, right. Sorry, I forgot to move it.
> >>>> After changing this, it works now.
> >>>>
> >>>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> >>>> index bf956b6c5fc0..c88fd62f4f0d 100644
> >>>> --- a/xen/arch/x86/xen.lds.S
> >>>> +++ b/xen/arch/x86/xen.lds.S
> >>>> @@ -134,6 +134,7 @@ SECTIONS
> >>>>         BUGFRAMES
> >>>>
> >>>>         *(.rodata)
> >>>> +       VPCI_ARRAY
> >>>>         *(.rodata.*)
> >>>>         *(.data.rel.ro)
> >>>>         *(.data.rel.ro.*)
> >>>> @@ -148,7 +149,6 @@ SECTIONS
> >>>>         *(.note.gnu.build-id)
> >>>>         __note_gnu_build_id_end = .;
> >>>>  #endif
> >>>> -       VPCI_ARRAY
> >>>>    } PHDR(text)
> >>>
> >>> FWIW, I would put it ahead of *(.rodata).  Remember to also modify the
> >>> linker script for all the other arches, not just x86.
> >>
> >> Whether before *(.rodata.*) or before *(.rodata), there still is the warning " Warning: setting incorrect section attributes for .rodata.vpci "
> >> And the objdump shows "rodata.vpci" has no "readonly" word.
> > 
> > Did you check what gcc emits? It may be requesting "aw" instead of the
> > wanted "a" in the section attributes. Since there are relocations here,
> > ".rodata." may not be the correct prefix to use; it may instead need to
> > be ".data.rel.ro.".
> 
> What's your opinion about changing to ".data.rel.ro.vpci" ?

Yeah, it's longer but it's the correct section prefix to use.

Thanks, Roger.

