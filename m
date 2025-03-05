Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39AA5045B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902493.1310486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprPu-0007DQ-VE; Wed, 05 Mar 2025 16:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902493.1310486; Wed, 05 Mar 2025 16:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprPu-0007Bf-ST; Wed, 05 Mar 2025 16:16:18 +0000
Received: by outflank-mailman (input) for mailman id 902493;
 Wed, 05 Mar 2025 16:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HJ/=VY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tprPu-0007BZ-1Z
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:16:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2348ba6a-f9dd-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 17:16:04 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so46206365e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:16:04 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42e6ef8sm21473175e9.29.2025.03.05.08.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:16:03 -0800 (PST)
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
X-Inumbo-ID: 2348ba6a-f9dd-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741191364; x=1741796164; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYw4j/4W2hhMc/01lw3YNrQ1HHhLCfCpZlkvj4vtPmI=;
        b=QLWoDhXXjt669AdOKsYt2CJiU4VL2tsrKbTkViMQfLHSJuYFHrZwPYfGCO9RIrfW1q
         heP8IV6e4U2HfJCSv3VIy+koOFm5HbhvD3zvJAbGkb1QKgY477AQA8SgERLiIESJgpPK
         92lujAchBz6S85cjgoTBAaFuJHXL0OKDqdDas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191364; x=1741796164;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uYw4j/4W2hhMc/01lw3YNrQ1HHhLCfCpZlkvj4vtPmI=;
        b=qFyUwKKvnwDemgIP7/b2HIosQEAtakLVAYsNnlOgGl3AGNlgbnXsNPlSEILGXmkGyd
         2RbCTeVFtmCVlhnJNlL437exyLWdMrHJOBC7LsEjBW3TVmXlGGqEz3QWIo7Ra3fd8+QD
         G8ERSnhvIvnxwcxLh2nUEqAQw1pna50G5zBvjNwZMdBEcMAxSf7iU3jNwnF8B3sqXsQz
         ZP8VM98k7WbwRc7pn+GLdSuiF75M1xewCQPCwQ1MK2B5TjsqgJ20d+B4qiMTRKjM07Ng
         RPfuRSQBrtjTjfVxlI4YENvTaY46AdQkhp7EuzC7r3/qC7/qbpjC8vit1mvN/JuyRS6R
         +UWw==
X-Forwarded-Encrypted: i=1; AJvYcCVIVmFKKaPlXJQCIj8ssizOsYm8H9vckpqs+C3WftWQp91TwODKycRk/nAFOhIhOX1RIZX/+T0KurM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZw91f4IcTw89x8dXnSiSKwPUpHIrlrZwj5db2vJj47CPQSOEW
	6+5Nogc8trkByp7mXACT/F6wKdDkldOAVUdkA3In4bmYzVsLqImHoLEb3yjx5YE=
X-Gm-Gg: ASbGnctVzbEohggw6KXO7m+9HI2J+Kk0n+/xC7mowQybPBL6hR2dob9vVHv0hxt56vu
	o/HhLr+/aMVrsHeeNg0oRiXdLi53abYcX/e2kllXDnV+pzO7Q9Vy1ADgPgRIgrlU10ZnBRPjum7
	PMdZP9RTHACkue/Ovpg8aa4kvb/L69qeS8ZAVXzM0iEvCKPdwPsamE00MANO2mzEZooGLZuty7e
	fbwXRO7a5n3AWZtKzhfv60zjmxhaiMg9OVssQlL0ox0XGUnsmDyS07zpelycIu79qtcX425xIDN
	W+oWAjZb3D0sCT5JkN+twygRU0fClFQ47Wiyk+pr9GpvWe71UYhAMPH/FLr/KIzeMbGeqy8T3u0
	=
X-Google-Smtp-Source: AGHT+IGvedXT9iYS9/FU/yQBn9fMZ5H8/K532pZb8eR6+ecOTjJEQHnYEec15IEg8mkwoGTPe9uJMA==
X-Received: by 2002:a05:600c:190d:b0:43b:c309:da4c with SMTP id 5b1f17b1804b1-43bd2951c4fmr33624375e9.10.1741191364192;
        Wed, 05 Mar 2025 08:16:04 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Mar 2025 16:16:02 +0000
Message-Id: <D88GTP4MI6YK.3P81MPW1IG6CJ@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 08/12] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-9-alejandro.vallejo@cloud.com>
 <825fb979-7f1b-4079-955a-33111d7b4623@suse.com>
In-Reply-To: <825fb979-7f1b-4079-955a-33111d7b4623@suse.com>

On Wed Mar 5, 2025 at 3:29 PM GMT, Jan Beulich wrote:
> On 10.01.2025 14:28, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/x86_emulate/blk.c
> > +++ b/xen/arch/x86/x86_emulate/blk.c
> > @@ -11,9 +11,12 @@
> >      !defined(X86EMUL_NO_SIMD)
> >  # ifdef __XEN__
> >  #  include <asm/xstate.h>
> > -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
> > +/* Has a fastpath for `current`, so there's no actual map */
> > +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
> > +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(current, x)
> >  # else
> >  #  define FXSAVE_AREA get_fpu_save_area()
> > +#  define UNMAP_FXSAVE_AREA(x) ((void)(x))
> >  # endif
> >  #endif
>
> While preparing to commit this I felt a little uneasy. The mapping aspect
> is ...

Thanks for coming back to it :)

>
> > @@ -292,6 +295,9 @@ int x86_emul_blk(
> >          }
> >          else
> >              asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
> > +
> > +        UNMAP_FXSAVE_AREA(fxsr);
> > +
> >          break;
> >      }
> > =20
> > @@ -320,6 +326,9 @@ int x86_emul_blk(
> > =20
> >          if ( fxsr !=3D ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
> >              memcpy(ptr, fxsr, s->op_bytes);
> > +
> > +        UNMAP_FXSAVE_AREA(fxsr);
> > +
> >          break;
> >      }
> > =20
>
> ... is entirely invisible at the use sites. This imo calls for making
> mistakes, and hence the existing macro better would be adjusted to become
> MAP_FXSAVE_AREA().
>
> Jan

I prefer it that way too; I was simply trying to minimize the diff. Would y=
ou
like me to resend it with that adjustment?

Cheers,
Alejandro

