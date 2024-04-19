Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F198AAD0E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708968.1108201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxln1-0001dB-LF; Fri, 19 Apr 2024 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708968.1108201; Fri, 19 Apr 2024 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxln1-0001bB-HN; Fri, 19 Apr 2024 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 708968;
 Fri, 19 Apr 2024 10:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxln0-0001b5-Dw
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:48:18 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 541462b5-fe3a-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:48:17 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-78efd533a00so108108985a.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:48:17 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 m2-20020ae9f202000000b0078d5d9cdc9esm1491985qkg.21.2024.04.19.03.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:48:15 -0700 (PDT)
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
X-Inumbo-ID: 541462b5-fe3a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713523696; x=1714128496; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTJ9X1eGKT0J67r/AkCZy+hhwxvfK9z8sjOHrNWwWzY=;
        b=KaWyUpCehXOk2Z+Bf+0uZEB2evNGWxfNSye572/4HeOq+0mi6CKnwlZk//SHp+ncVl
         vuAkXRa6bjLoVHctudZslEHU0v2hzQjqjIx1z5EZGHdXNeyfKznMIuUZIfV/u/wTEnxp
         y6AyDrMPbxK4ujJT1CHMJrFIUyi3CiT9Ut0t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713523696; x=1714128496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTJ9X1eGKT0J67r/AkCZy+hhwxvfK9z8sjOHrNWwWzY=;
        b=vjaCmslAXI03tVUhcZzTfAVHrqlQt6whwlb3fi62P16mM4CRpbsyaHzmC3RBYzBVlS
         6NMozPuIl1wtxCsb02DYl2dUopcqf+LaIeUY8/+7S8v31jHvu1zOwXimK6l81wipOMEn
         5pvrNZVBaruVuEVv5YK+QfICgUbWw7hMse/ZxSbZ0PZtbuvY1UZkEMVhJ1G1MMLgz3oX
         0UKI3UNY+gbGQmr+jMGuRwmPlmWnaceBqodXCQATBu+pmEFGMvwP0bnGnscEyFt7kaKf
         VB6AhRh1/GbKb41H8LGGof0BcrM84U3HGdCAb4xHpl17cFZQSSt30NMEccbnUX4gzc2Z
         271A==
X-Gm-Message-State: AOJu0YwrBgutXoYj4icRhBAXPtSw3WSN9Gg45LPbWN65hqGI1oC7zOpH
	r35RAZEhzZP6tTb42QOfYTe5BD6p0aHQRq/i0RO8YFJTuWB2EXGZKRQEkuMcqBY=
X-Google-Smtp-Source: AGHT+IEoBmDUJy9Kne/8Az1EumS+t4PL03bskf4vMgs3aEVbTBLFrtYNuulDh9qpw47nQAYE798pYg==
X-Received: by 2002:a05:620a:2983:b0:78d:6902:ca8f with SMTP id r3-20020a05620a298300b0078d6902ca8fmr2377559qkp.5.1713523696195;
        Fri, 19 Apr 2024 03:48:16 -0700 (PDT)
Date: Fri, 19 Apr 2024 12:48:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZiJL7bKCUwMr36LQ@macbook>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <96bb1fbb-0b4c-42ac-9c3b-16700a65130d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96bb1fbb-0b4c-42ac-9c3b-16700a65130d@citrix.com>

On Fri, Apr 19, 2024 at 11:10:33AM +0100, Andrew Cooper wrote:
> On 19/04/2024 11:02 am, Roger Pau Monne wrote:
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
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...
> 
> > ---
> > Changes since v1:
> >  - Fix off-by-one in range checking.
> > ---
> >  xen/common/livepatch_elf.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
> > index 45d73912a3cd..a67101eadc02 100644
> > --- a/xen/common/livepatch_elf.c
> > +++ b/xen/common/livepatch_elf.c
> > @@ -4,6 +4,7 @@
> >  
> >  #include <xen/errno.h>
> >  #include <xen/lib.h>
> > +#include <xen/sections.h>
> >  #include <xen/symbols.h>
> >  #include <xen/livepatch_elf.h>
> >  #include <xen/livepatch.h>
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
> 
> ... I normally vertically the (casts) in cases like this for improved
> legibility.  Happy to fold on commit.

Did this, but reverted afterwards because I wasn't sure whether it
would go against the coding style.  Aligning would be my preference
also.

Thanks, Roger.

