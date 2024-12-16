Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15989F2FE6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857852.1270055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9k1-0001eU-TP; Mon, 16 Dec 2024 11:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857852.1270055; Mon, 16 Dec 2024 11:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9k1-0001c9-QA; Mon, 16 Dec 2024 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 857852;
 Mon, 16 Dec 2024 11:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tN9k0-0001c3-G5
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:58:24 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b4c57a4-bba5-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:58:20 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5cecbddb574so6831576a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:58:20 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f352b9sm3194597a12.81.2024.12.16.03.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:58:17 -0800 (PST)
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
X-Inumbo-ID: 0b4c57a4-bba5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734350300; x=1734955100; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OnOxTjScTaeAqk9bWH4KWMLUkfMOrD1DbxYHYwpUYY=;
        b=JKGE29KAg0vXpfScf+lyngp5+uQthje+Qm+puifE0ufPmUc1cOVjEphksO+wknqQr0
         57CpEvrFQWVKSREDH/xJLAEZp0LSSkkxVEWjCrkf+rbjBvvDsNHI/ZAEr0atTlxUHIoc
         bM40SA3g/HLv8D+iMQMewgNKnd1JkeHqQPhtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734350300; x=1734955100;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OnOxTjScTaeAqk9bWH4KWMLUkfMOrD1DbxYHYwpUYY=;
        b=OwmapWdxcYJHR8RSYjxVuJvU84vTHNviiUMYviD7mL3vOazNR+dXZnBPxNquTcNp5c
         70sn9uTAu398dss9++hyXjhlsjhNz+ct8yT6WFi/MkqyA2RMJWjKbBhRXcmjrC3DhEAB
         eu2VPvA3rIqralzNyK6UTIbSW6rD+RY9kqoxun4kdM5Jjq6Bax2BBD1/a4kyQY3SeR3n
         jIt//1zL5Tr6342YOTA7InWIR7q9p4dQ9T9ZJ/GHyHaaYrSfC5rujvvtjvzmd7LLtNsd
         BYaD87Ray9XqM4pFJf/3RyFgDttSYvScAo7eK/pbCqMf/Krs5M9ifoYKdMcwQYO8XVeP
         tyBg==
X-Forwarded-Encrypted: i=1; AJvYcCWgzWI3fkKPOHemeGMtbicqz4So42zjgFrdhk1IBxdwhiGd2tIBV/nXjgCjdfAbL2IDwQ6mcGWMFlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoBQxyN+OUf9tz7NxWDjf5OzdGLxHX/IsdaJrVQGSOE53eZQ8f
	jJAuf3xbOfAc0nDbAg11AEUYMiBdKEfitoAwfERYUqwiXaiUjrB+TMz9EdZy7+Q=
X-Gm-Gg: ASbGncuKoyQjdkLjzDgBakdww0Wo25fa1ubFXgYyIscAgW6nfMlF4DWMH3pIaPQdFV7
	MxTeeaiIRbaXITz9Yily9L05uxBsRnxs+6IAWVD3ybhtsz8Sn2QaymdZ2FXrMC34Z42Bi4xSEUz
	6jdQpGbizuuyycAvM4JBEcFWetS1Cy6btduXJ7fgXJvAdKusT5UgO5mQ/IgyraY5cBe1pJIPY4X
	c0ehKXzfOVW7+tdbnnycZny6sVpm21wItuDG0wcIwSCxNKQmHOj+93RnxyWCVc=
X-Google-Smtp-Source: AGHT+IH0YCezW2KEWLwpCMSIKQXnAWe611CAkvX5KczC12Vrp3XHOZp64i873gRWb5etHMVudi8pwA==
X-Received: by 2002:a05:6402:3593:b0:5d3:ba42:e9f4 with SMTP id 4fb4d7f45d1cf-5d63c3ed1e1mr10134748a12.23.1734350298634;
        Mon, 16 Dec 2024 03:58:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 11:58:14 +0000
Message-Id: <D6D3VA6T02AX.3PVLA7M6C30H@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 09/13] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-10-alejandro.vallejo@cloud.com>
 <bc308e63-5791-4e29-a218-0c83728c116a@suse.com>
In-Reply-To: <bc308e63-5791-4e29-a218-0c83728c116a@suse.com>

On Mon Dec 9, 2024 at 4:26 PM GMT, Jan Beulich wrote:
> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/x86_emulate/blk.c
> > +++ b/xen/arch/x86/x86_emulate/blk.c
> > @@ -11,9 +11,12 @@
> >      !defined(X86EMUL_NO_SIMD)
> >  # ifdef __XEN__
> >  #  include <asm/xstate.h>
> > -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
> > +/* has a fastpath for `current`, so there's no actual map */
> > +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
> > +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(currt ent, x)
>
> The typo of the first argument strongly suggests that the macro should
> already now evaluate its parameters, also pleasing Misra.

Not an unreasonable takeaway. I can expand as follows instead:

#define VCPU_UNMAP_XSAVE_AREA(v, x) ({ (void)(v); x; })

Thoughts?

>
> >  # else
> >  #  define FXSAVE_AREA get_fpu_save_area()
> > +#  define UNMAP_FXSAVE_AREA(x) ((void)x)
>
> If only for consistency and to avoid setting bad precedents - parentheses
> please around x.

Ack.

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
>
> So for now the emulator only supports FXSAVE / FXRSTOR. That'll need to c=
hange
> sooner or later. Is it really appropriate in that light to name the new m=
acro
> after FXSAVE, when the underlying machinery uses all XSAVE?
>
> Jan

I have no strong feeling one way or the other, except that it should mirror=
 the
other macro's name. I'd say it makes more sense to rename _both_ after the
emulator is XSAVE-aware. That the internal machinery is actually XSAVE-base=
d is
an implementation detail largely irrelevant at the call sites.

Cheers,
Alejandro

