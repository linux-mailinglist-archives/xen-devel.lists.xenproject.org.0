Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BC8AAD15
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708972.1108211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlpd-00030x-0x; Fri, 19 Apr 2024 10:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708972.1108211; Fri, 19 Apr 2024 10:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlpc-0002zG-Tw; Fri, 19 Apr 2024 10:51:00 +0000
Received: by outflank-mailman (input) for mailman id 708972;
 Fri, 19 Apr 2024 10:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxlpb-0002z8-Nu
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:50:59 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b458165a-fe3a-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:50:58 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-78edc3ad5fdso153733685a.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:50:58 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 wl20-20020a05620a57d400b0078ec846066fsm1477616qkn.7.2024.04.19.03.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:50:57 -0700 (PDT)
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
X-Inumbo-ID: b458165a-fe3a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713523858; x=1714128658; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TO1ioEjRcVqbHvtRkJo1lihfiWDnVbVRKnC9Z3oejdE=;
        b=tDaKzQDAVaLV2l/y2mUHNFaO6Uelp2x7htBGSahHsdfhhqM0lgNiLUHUvr5F7Gjp2A
         b38EGDc3+fqNh8HfB2ogiyJYLm/ta8/bTELIihXfMM3TkAVY7REjZedDZl0QPN75367Q
         HpmhlIQIy1D0Z/cRWajUzuN+LQBcK0gYiZ6iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713523858; x=1714128658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TO1ioEjRcVqbHvtRkJo1lihfiWDnVbVRKnC9Z3oejdE=;
        b=xJ+yKsXSn3ewO8ewYOnq8IT7vfHbxILLPl0ueM/CIzUdgZRpXF8o7ZbvoR624XnHh5
         rcgXpbWL/q3gFMCOfIr2O3Al2uEj4D1JpJTY4VS8EYqVXBEyrzr96yY8ee76S/NySprk
         +rlq9spwCaVuntMMPeovDnwisrXQXAgvy3CsE/WpjRibLVyMFk5O9jxQbuWEghaGOEYK
         i4Yjpz7gTmvqH4VLzmGbKoSXpTQg9a6MU5YaqrSLazdYv9uWyeWt0MjgUjximKqIf6df
         j+iqFbbP4gCNMD/1xolrrXGXa59bV7OsRNVI03B6m7akRNPEKpnqmpUFIiKTAzX+5dtA
         RM4A==
X-Forwarded-Encrypted: i=1; AJvYcCWV+ZSgPjV3JA5KViNcXlp1glgkEytUN7wHMs2OXT0hYvTes9Z8amgyo3C4RPkMLabMiOMOuGFN/sQWP+4XjOEyXAHVOsr57g4uXVlPFCY=
X-Gm-Message-State: AOJu0YxL39dZM1xiGDojiu3Cl6sB9eMtjQl7ra3/9v4PSYHzc2ldQmLy
	ssU2Mr3U3fhJTba/0onD9nZr7qt/eyBJDoALOHbLja3pqeetLP3UqTejy1VN6os=
X-Google-Smtp-Source: AGHT+IGjN4bQorsECdrAlSxKFAp/jXqjU1ch6173QHQiHwNBKhPd6A0F1bTlrQ1ePWHyAvUiZmVwSA==
X-Received: by 2002:a05:620a:13d3:b0:790:5cf2:cd86 with SMTP id g19-20020a05620a13d300b007905cf2cd86mr586795qkl.2.1713523857711;
        Fri, 19 Apr 2024 03:50:57 -0700 (PDT)
Date: Fri, 19 Apr 2024 12:50:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZiJMj00By3X8FskL@macbook>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com>

On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
> On 19.04.2024 12:02, Roger Pau Monne wrote:
> > Livepatch payloads containing symbols that belong to init sections can only
> > lead to page faults later on, as by the time the livepatch is loaded init
> > sections have already been freed.
> > 
> > Refuse to resolve such symbols and return an error instead.
> > 
> > Note such resolutions are only relevant for symbols that point to undefined
> > sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> > and hence must either be a Xen or a different livepatch payload symbol.
> > 
> > Do not allow to resolve symbols that point to __init_begin, as that address is
> > also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> > resolutions against it.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Fix off-by-one in range checking.
> 
> Which means you addressed Andrew's comment while at the same time extending
> the scope of ...
> 
> > @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
> >                      break;
> >                  }
> >              }
> > +
> > +            /*
> > +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> > +             * livepatch payloads don't have init sections or equivalent.
> > +             */
> > +            else if ( st_value >= (uintptr_t)&__init_begin &&
> > +                      st_value < (uintptr_t)&__init_end )
> > +            {
> > +                printk(XENLOG_ERR LIVEPATCH
> > +                       "%s: symbol %s is in init section, not resolving\n",
> > +                       elf->name, elf->sym[i].name);
> 
> ... what I raised concern about (and I had not seen any verbal reply to that,
> I don't think).

I've extended the commit message to explicitly mention the handling of
bounds for __init_{begin,end} checks.  Let me know if you are not fine
with it (or maybe you expected something else?).

Thanks, Roger.

