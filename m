Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B621FA1D7E2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 15:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877939.1288107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPsr-0005vC-8a; Mon, 27 Jan 2025 14:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877939.1288107; Mon, 27 Jan 2025 14:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPsr-0005tx-5s; Mon, 27 Jan 2025 14:14:37 +0000
Received: by outflank-mailman (input) for mailman id 877939;
 Mon, 27 Jan 2025 14:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFPb=UT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcPsq-0005tr-7G
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 14:14:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0839f4a5-dcb9-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 15:14:34 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so3884906f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 06:14:34 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1761ffsm11011960f8f.7.2025.01.27.06.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:14:32 -0800 (PST)
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
X-Inumbo-ID: 0839f4a5-dcb9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737987273; x=1738592073; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdQXRQ9cjL2MNzJTQtVz+T+wXKwp6KP4F0FKbeuCHaA=;
        b=Mhae/AbCx/cwEd6dPqWLvja+gIoGBJbqWUrrz3Qbp0fKyni6mrxrJV6Eey73IKPyp5
         OAYCK4QgaW5PDCme9MVBIFYxI9cXPx5OXPUyk12mitPYVFxzUq15sIVyM2xqmI7Whejq
         YRrCjLrVNkrIlR5KuMIkftvKujwBz2pkvKwYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737987273; x=1738592073;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdQXRQ9cjL2MNzJTQtVz+T+wXKwp6KP4F0FKbeuCHaA=;
        b=CunYDRS3dav0IEk9ns7a+BGVkU4mW+/hxLzfAIwD0FpGZYl/13mDFhCWpcuIOIzPj8
         +MT4dEJFZ26ZoKQxnTOB8WPEsxH+c2/WgAO3zz4UR5HuL3J+r6zpN9TAMNPqMNYCR9k1
         IJDaBkMTWa0Am+ihssqey7r2EmU0rC0M3pywB/qlSRaE/D3ObxgqbMIQuFfGHdDwjcgY
         c/SCvsiUfal/g4gY8YcGf8RCE6/iw9gGF/89+QtLIubsf1dYkQEWOS3FUnbgHi+jglU2
         +feznV6l669b8ewUzXh4P4v9CxRqleTHdQ7XiUdyYIoZt5uXOfsKj/sr9m4leomcE88o
         EOsA==
X-Forwarded-Encrypted: i=1; AJvYcCXkL7eLoI9lKWy6YUXXUZs5Jv+ASp/jypXroyZddbIK/VA53IeNp8apYe4gEyeCQ9uzqj/eDmr66Yk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAF0teKk+MX0lXEHp9NHZTGGt+FfLFz1ZmIuMQd0jNcsFZ3JAu
	WRyWiQTXQLvGAnli0PJLk5eccMp5kVmXPkSbuPdYDhQI8kOnfR8dG2C/hjplzoKEXH4XuTbrTGM
	G08k=
X-Gm-Gg: ASbGncuFOQ86GdJp4GGpOTsEYn06eeq+lu5650iMVnDqsytNA5OG7dXwlbnLOJm1V+y
	UUd0iV57Kzy8pBCwsjPi8BLOXMLhAzFXtcBs7LzTTp506vCYNDrUaz0JioX3lcXh13ONw6WNm+b
	kLaTVsjmOx418ssRCIpWhdW7uE5EN5xD1CekBMVAfLClzRCOOHvIrAgqicxoAZuQs2NEk+5pzE2
	OVgI1rcpLjfSJhXsKEJ0QncawczQkyGbsv/EU+KXcEPu/YvcNc0J6cC6BGMVDQvaxOPPxSMUMk7
	G1FH8g1QW4mr2ZlUnOCctBIc8kmnv6V+s8o=
X-Google-Smtp-Source: AGHT+IHprSyTzp/bDQaGGYPXdjoC2kp6cprVnHtStF3l/Rbltb2pMj4I86xKw0vkm5WfUwYZGTGfqA==
X-Received: by 2002:adf:f68f:0:b0:38a:4184:1520 with SMTP id ffacd0b85a97d-38bf5673e98mr30865152f8f.27.1737987272904;
        Mon, 27 Jan 2025 06:14:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 14:14:28 +0000
Message-Id: <D7CX2GVZ29ON.3O2A4VFA7NTSC@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 09/12] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-10-alejandro.vallejo@cloud.com>
 <4011a01c-acbd-4ef4-b6f8-d266f6623289@suse.com>
In-Reply-To: <4011a01c-acbd-4ef4-b6f8-d266f6623289@suse.com>

Hi,

Thanks for reviewing this and the other patches.

On Mon Jan 27, 2025 at 10:57 AM GMT, Jan Beulich wrote:
> On 10.01.2025 14:28, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -1024,9 +1024,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
> > =20
> >  uint64_t read_bndcfgu(void)
> >  {
> > +    uint64_t bndcfgu =3D 0;
> >      unsigned long cr0 =3D read_cr0();
> > -    struct xsave_struct *xstate
> > -        =3D idle_vcpu[smp_processor_id()]->arch.xsave_area;
> > +    struct vcpu *v =3D idle_vcpu[smp_processor_id()];
>
> Question on this one remains: Can it be pointer-to-const (in the longer
> run; certainly in can be right now)?

I have no idea where I got the idea the C constness was transitive (quite
likely from Rust, as its illegal to grab a &mut from a &). Const being
non-transitive means I can constify the vcpu as you suggest/ask. The ration=
ale
was that getting a pointer to non-const from a pointer to const seemed wron=
g.

But C is bizarre and its finer details have a way of biting. Oh well.

FWIW, this ought to hold even in the long run. There won't be anything spec=
ial
in the map/unmap macros besides some indirection, so it'll work in a very
similar fashion as it does now.

I'll adjust it as you propose.

>
> > +    struct xsave_struct *xstate =3D VCPU_MAP_XSAVE_AREA(v);
>
> I realize my similar remark on this one was actually wrong; the asm()s
> clearly modify what is being pointed top.

Indeed, xstate can definitely not be const.

> Jan

Cheers,
Alejandro

