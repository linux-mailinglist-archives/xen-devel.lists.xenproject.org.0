Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52DB816A9C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655781.1023560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAaK-0002WV-LW; Mon, 18 Dec 2023 10:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655781.1023560; Mon, 18 Dec 2023 10:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAaK-0002UM-Id; Mon, 18 Dec 2023 10:10:52 +0000
Received: by outflank-mailman (input) for mailman id 655781;
 Mon, 18 Dec 2023 10:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFAaJ-0002UG-HQ
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:10:51 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7c24724-9d8d-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:10:49 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cc3f5e7451so32916701fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:10:49 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a2ea104000000b002cc794df665sm6983ljl.125.2023.12.18.02.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:10:48 -0800 (PST)
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
X-Inumbo-ID: b7c24724-9d8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702894249; x=1703499049; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OP7alBYNWOY0lV5TE68wytu7Od6IeE1WBgUzqPpLzT0=;
        b=UJCHzo7VBB+BohYPh4tnDH5Flhvk+3aKfDg9ZTm6PcakpQ3MkBP9UlJJkcOQq7aNe9
         nYf21gRRfCx5CxRCchd+0p0IO4gG4rzbsxASgExzZ0S/cTR8yRLOQzB0vefNQhAgjrIP
         VveGsDZU7kReymaPkVyjMhyIESKHm1NJ05285YXTEwwLfA8be78WoGAmnp0YLHEtDGjg
         OHatLeQiJ25Y3r9HVpK7uy2Fc+ZWAaOQpD2S0O3I2/q0YYGXXUTS85aSpDJGfpIhbetN
         dBKUWL6v66x0nT0GaxttYU81uLYqD4PFE/B4WXcDyLxpixfdYoamaKXgpCgtFZ9lloJF
         ya/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894249; x=1703499049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OP7alBYNWOY0lV5TE68wytu7Od6IeE1WBgUzqPpLzT0=;
        b=QoAkTS0OWagBQKXd0FArAXY0qhBhfB2KbDOVQRSASnYerfsYQYv41bT43R5iH4MyUs
         ILfJHjJMV8vP7xsZzaxgxExoGiCfklcbOG+cuhZPNjcGvTroRf1FAO3mIZSPLdvmPTGp
         dbLp/8a6fa9BtCwcmJ0nliRwixBwyXMQky05Q0zPjbWji6TdoHFXcGYHY2RrPOIzGKMo
         Dz/KK2Mq1EUvlrIJMGtHqMA6ZywZJTjRlLSP5ryeJzZP+soVkoExhKoR0+BlVR6oPPpU
         OKNVFHvFPwGES8FmaJrCwA0L2kEI7BbR8T0zIqkqM3ArAaWZNRf4D3J+ne/lozidUr+y
         N67Q==
X-Gm-Message-State: AOJu0YxTxkMRc2JEQ2vDLc800+cyKsEWKJgqaSziV0+Dkg3FL47fdYiR
	i0Rj6iofb5M7z/Y10bgYXYOICiPfeRiT5w==
X-Google-Smtp-Source: AGHT+IGNeIch/BNsQbxG42g/lJDMxhoQGGfYsWDGCQLY5U+uUOYeJL9eomjHlRoOQqdiekpBcBB5lw==
X-Received: by 2002:a2e:b708:0:b0:2cc:6bbf:ea8e with SMTP id j8-20020a2eb708000000b002cc6bbfea8emr920636ljo.45.1702894248946;
        Mon, 18 Dec 2023 02:10:48 -0800 (PST)
Message-ID: <fe18855bbbb0c6ee4d06ae6f5dcc975859a7b6bd.camel@gmail.com>
Subject: Re: [PATCH v2 28/39] xen/riscv: introduce asm/event.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:10:48 +0200
In-Reply-To: <483a3c56-14df-4130-9b05-506a19333afc@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <492c6183a8248046f0b6fdb186ad5b33953c3b24.1700761381.git.oleksii.kurochko@gmail.com>
	 <483a3c56-14df-4130-9b05-506a19333afc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 16:08 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/event.h
> > @@ -0,0 +1,34 @@
> > +#ifndef __ASM_RISCV_EVENT_H__
> > +#define __ASM_RISCV_EVENT_H__
> > +
> > +void vcpu_mark_events_pending(struct vcpu *v);
> > +
> > +static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline int local_events_need_delivery(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline void local_event_delivery_enable(void)
> > +{
> > +}
>=20
> These are stubs aiui, and hence would better have BUG() in them?
Yes, for now it would be better to add BUG(). Thanks.

>=20
> > +/* No arch specific virq definition now. Default to global. */
> > +static inline bool arch_virq_is_global(unsigned int virq)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
>=20
> This otoh may well remain as is for the foreseeable future.
>=20
> Jan


