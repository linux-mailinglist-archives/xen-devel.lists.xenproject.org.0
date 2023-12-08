Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57B809F77
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650489.1016073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXF9-0000mM-0N; Fri, 08 Dec 2023 09:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650489.1016073; Fri, 08 Dec 2023 09:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXF8-0000kc-Tu; Fri, 08 Dec 2023 09:33:58 +0000
Received: by outflank-mailman (input) for mailman id 650489;
 Fri, 08 Dec 2023 09:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBXF8-0000kN-2v
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:33:58 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e931b83c-95ac-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:33:57 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54ca43031d1so1734712a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:33:57 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ry9-20020a1709068d8900b00a1f744953c1sm144307ejc.105.2023.12.08.01.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:33:56 -0800 (PST)
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
X-Inumbo-ID: e931b83c-95ac-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702028037; x=1702632837; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H2UbHVSImPglhDCKTYh7VNNFG5Ccxw43XsWwlpypRfY=;
        b=bRRxcImC4XHzgHnnva7iXSd/KvTPEe6Jkm4Ojtn31WbKg7x8WuJQxMNjOrGUdz5vR2
         CJnyMZgavUqmWc9COa6H4fwNYIc3WBO9GW5j26kHaxqzXKLLOnhJA9mIcDS5mQOk3BW0
         bkZombAhJD3oN6rE1dsuZBZ3ukl/H5wE8ZM0pbNV/qyNozPbiYxMhqOC3U0mamx2qpBC
         KzTXmrBbH11x8dww/4SWGP6ZjJikXxe5yfd07A48eOqOU2h+NFB+K5CJipuukB+d9uGR
         hSDZhIijmVS5HEW3Z5vdFTeQl6Y1aWzNlrFsdmF+JdproSr3ydyiTBNskYJMWCi5RT6M
         Xr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702028037; x=1702632837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2UbHVSImPglhDCKTYh7VNNFG5Ccxw43XsWwlpypRfY=;
        b=buOPmSch/NoUEEDP/G0Gf/5/fxHtPwI1HpoP3oNxsISDOqwTSvmbf9EKF6NYFwimUt
         VIsgZ5N04qDjGcmKSfeUqQvMAQfVT38ubvGSx76QPDjxpeTIE8jYHLMFLLsf+FeI2Oma
         J3NtLISh2ODkb8JHtguMmxEC1Ti5fhxtVy34y3thVmHRVZZd2TVMxEZvdFP+Or9l+jdO
         rnQLkCtjQv13MMa/i5VJvsHHIhcZoANSD4tK3p85Rc5rRQSIv+dPHOgoCdy1QdB+d/3o
         QXOWYuIGwKcFGemsB1BGJgX0xPSUJKBwmJr0AimNa04SYIu7RCkavMpF8LGbceZGcLXD
         5lgg==
X-Gm-Message-State: AOJu0YxXfBVdPmO4DI6hD+jc16n3qqGh1hawbmAavuGvHeepguUXyxwH
	JUEivsSf4cJj7Rns8XH26Co=
X-Google-Smtp-Source: AGHT+IHV37JysTqwrnFX6XevDQOfHN22epga3Ha947S38oXYec3YGh2TlU+exLSDNtFsOjM/QcvClg==
X-Received: by 2002:a17:906:2618:b0:a09:e781:97ef with SMTP id h24-20020a170906261800b00a09e78197efmr2094588ejc.73.1702028036744;
        Fri, 08 Dec 2023 01:33:56 -0800 (PST)
Message-ID: <484d52564ea8b800d1eb39f1ef899c1a3044fc53.camel@gmail.com>
Subject: Re: [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:33:55 +0200
In-Reply-To: <028532fb-55d4-4a08-9b93-9ae29ed8e37c@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <aa2ff1df494f82f7c045f913371d3b9d04962a5e.1700761381.git.oleksii.kurochko@gmail.com>
	 <028532fb-55d4-4a08-9b93-9ae29ed8e37c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 15:28 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/nospec.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights
> > Reserved. */
> > +
> > +#ifndef _ASM_RISCV_NOSPEC_H
> > +#define _ASM_RISCV_NOSPEC_H
> > +
> > +static inline bool evaluate_nospec(bool condition)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return condition;
> > +}
> > +
> > +static inline void block_speculation(void)
> > +{
> > +}
> > +
> > +#endif /* _ASM_RISCV_NOSPEC_H */
>=20
> This being identical between Arm, PPC, and now RISC-V, wouldn't this
> be another
> asm-generic/ candidate? (Whether such trivial stubs are copyrightable
> is, as
> per earlier remarks, at least questionable to me.)
It is a good candidate to be moved to asm-generic. Thanks for notice
that. I'll update move this patch to generic headers patch series.

I am not sure too but the copyright was presented in Arm's file and
RISC-V's version is just a copy so I decided to leave it.
Does any documented rule exist in which cases copyright should be and
not?

~ Oleksii

