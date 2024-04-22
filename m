Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4468ACB3B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 12:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709883.1108912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryrFI-000538-3G; Mon, 22 Apr 2024 10:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709883.1108912; Mon, 22 Apr 2024 10:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryrFI-00051a-08; Mon, 22 Apr 2024 10:50:00 +0000
Received: by outflank-mailman (input) for mailman id 709883;
 Mon, 22 Apr 2024 10:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ryrFG-00051U-8h
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 10:49:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f2a9b5b-0096-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 12:49:57 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41a7ae25d53so3119045e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 03:49:57 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b0041a3b5ed993sm4472277wms.25.2024.04.22.03.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 03:49:56 -0700 (PDT)
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
X-Inumbo-ID: 0f2a9b5b-0096-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713782997; x=1714387797; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJx8ULXnpCynxl86KYHOQaEOUtNSzPG3epJW2ZOzLOo=;
        b=fEC2LKuLL1oZGjyUzJ+PIeX6GhQ6Uo0TyuNLZ8+YWwueD0KaF/KV/Mp4kDAYrqcd47
         jliGZ3flm5Y8nZS0OZqwS38ZfVfQ9qhQFKlxSaTbTz9ludq2REwI0uVStn7qPOKwQahG
         Rtmz5YzLzcfCBp4HXVWgnNtNxe85ZaLsZL96c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782997; x=1714387797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJx8ULXnpCynxl86KYHOQaEOUtNSzPG3epJW2ZOzLOo=;
        b=VHaJkWN/DhxR00ld1BtuneFDGeRqg36BxbEAxIBN4oCxI2QztSdVBZH23RpwvzJ1Wm
         q+6z1qdOSLKTuO3vCH0pO+wXUYp9VeW2U6l2aQw5Yeeh372uFAfGkvSG1Fy+jS24wkIF
         ZRGfoMX2xSnVwidV49D/R4vOlfaz8jy76S8H8qULvpf6KtaWxxZBAMh1ykK/qgdanbVT
         5mwDeczMaUgsWFhoDNs4gkXyUF1mA4gPGW0H4AP6lhFJjxwmmY8VT22BtAqy/zAWzI5m
         QlSb+7/cBlXovqMnLixGhGV4jNAvLhRG9+myzhSo4LqA9k4Upziek7uwdrQPPdF3/vJu
         4djg==
X-Forwarded-Encrypted: i=1; AJvYcCWUoBcEWEUinuvepDMROuNaFa1qGbNbOBktjL6FFkFClGGRv/9B769Wxdv8ruNPWeWgoVIIv/vdwz+XE+txX0WXK0nWnswa5hlvCEddgV0=
X-Gm-Message-State: AOJu0Yys2QFAEo6GSm4wCzlLIW5fcsQEJZkE4/XHNo2XwzwxiNfafr3N
	VAOj+ofl+PuKRyIrC1dc7eeFjyq8xWBHRzOPidFuTra/rHGbHAou4ebCn83FyOU=
X-Google-Smtp-Source: AGHT+IHVocB0W18vsWqcLHARlwCt5dLeUBCv1N0ogAdbbXPH3KAvSt92gbsQnvG8Zr8WsmRrW7Bpng==
X-Received: by 2002:a05:600c:3b11:b0:418:17e9:c23f with SMTP id m17-20020a05600c3b1100b0041817e9c23fmr5930257wms.31.1713782996704;
        Mon, 22 Apr 2024 03:49:56 -0700 (PDT)
Date: Mon, 22 Apr 2024 12:49:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZiZA0-n6vbOgu-_1@macbook>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com>
 <ZiJMj00By3X8FskL@macbook>
 <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com>
 <ZiYXtJcefv-iMpAj@macbook>
 <f00e0b8b-0e45-45b1-9151-6c16c5a70d76@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f00e0b8b-0e45-45b1-9151-6c16c5a70d76@suse.com>

On Mon, Apr 22, 2024 at 10:25:40AM +0200, Jan Beulich wrote:
> On 22.04.2024 09:54, Roger Pau Monné wrote:
> > On Fri, Apr 19, 2024 at 04:34:41PM +0200, Jan Beulich wrote:
> >> On 19.04.2024 12:50, Roger Pau Monné wrote:
> >>> On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
> >>>> On 19.04.2024 12:02, Roger Pau Monne wrote:
> >>>>> Livepatch payloads containing symbols that belong to init sections can only
> >>>>> lead to page faults later on, as by the time the livepatch is loaded init
> >>>>> sections have already been freed.
> >>>>>
> >>>>> Refuse to resolve such symbols and return an error instead.
> >>>>>
> >>>>> Note such resolutions are only relevant for symbols that point to undefined
> >>>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> >>>>> and hence must either be a Xen or a different livepatch payload symbol.
> >>>>>
> >>>>> Do not allow to resolve symbols that point to __init_begin, as that address is
> >>>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> >>>>> resolutions against it.
> >>>>>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>> ---
> >>>>> Changes since v1:
> >>>>>  - Fix off-by-one in range checking.
> >>>>
> >>>> Which means you addressed Andrew's comment while at the same time extending
> >>>> the scope of ...
> >>>>
> >>>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
> >>>>>                      break;
> >>>>>                  }
> >>>>>              }
> >>>>> +
> >>>>> +            /*
> >>>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> >>>>> +             * livepatch payloads don't have init sections or equivalent.
> >>>>> +             */
> >>>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> >>>>> +                      st_value < (uintptr_t)&__init_end )
> >>>>> +            {
> >>>>> +                printk(XENLOG_ERR LIVEPATCH
> >>>>> +                       "%s: symbol %s is in init section, not resolving\n",
> >>>>> +                       elf->name, elf->sym[i].name);
> >>>>
> >>>> ... what I raised concern about (and I had not seen any verbal reply to that,
> >>>> I don't think).
> >>>
> >>> I've extended the commit message to explicitly mention the handling of
> >>> bounds for __init_{begin,end} checks.  Let me know if you are not fine
> >>> with it (or maybe you expected something else?).
> >>
> >> Well, you mention the two symbols you care about, but you don't mention
> >> at all that these two may alias other symbols which might be legal to
> >> reference from a livepatch.
> > 
> > I'm having a hard time understanding why a livepatch would want to
> > reference those, or any symbol in the .init sections for that matter.
> > __init_{begin,end} are exclusively used to unmap the init region after
> > boot.  What's the point in livepatch referencing data that's no
> > longer there?  The only application I would think of is to calculate
> > some kind of offsets, but that would better be done using other
> > symbols instead.
> > 
> > Please bear with me, it would be easier for me to understand if you
> > could provide a concrete example.
> 
> The issue is that you do comparison by address, not by name. Let's assume
> that .rodata ends exactly where .init.* starts. Then &__init_begin ==
> &_erodata == &__2M_rodata_end. Access to the latter two symbols wants to
> be permitted; only __init_begin and whatever ends up being the very first
> symbol in .init.* ought to not be referenced.

Hm, I guess I could add comparison by name additionally, but it looks
fragile to me.

So when st_value == __init_begin check if the name matches
"__init_begin" or "__2M_init_start" or "_sinittext", and fail
resolution, otherwise allow it?

> Worse (but contrived) would be cases of "constructed" symbols derived from
> ones ahead of __init_begin, with an offset large enough to actually point
> into .init.*. Such are _still_ valid to be used in calculations, as long
> as no deref occurs for anything at or past __init_begin.

But one would have to craft such a symbol specifically, at which point
I consider this out of the scope of what this patch is attempting to
protect against.  The aim is not to prevent malicious livepatches, and
there are far easier ways to trigger a page-fault from a livepatch.

Thanks, Roger.

