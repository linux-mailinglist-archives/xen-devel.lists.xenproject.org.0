Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2571A08F9B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 12:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869468.1280905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWDNI-0004Fx-MV; Fri, 10 Jan 2025 11:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869468.1280905; Fri, 10 Jan 2025 11:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWDNI-0004DJ-Jx; Fri, 10 Jan 2025 11:40:24 +0000
Received: by outflank-mailman (input) for mailman id 869468;
 Fri, 10 Jan 2025 11:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWDNG-0004DB-W4
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 11:40:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac5057e6-cf47-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 12:40:21 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso327258466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 03:40:21 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90da2c8sm160455666b.62.2025.01.10.03.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 03:40:20 -0800 (PST)
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
X-Inumbo-ID: ac5057e6-cf47-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736509221; x=1737114021; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWNhJ+USbtMq5De5TNW6JSW2YlRcCjhPAv9sMOiVInI=;
        b=egBpkougdHjg2F2+oRSd+RNdZG6/IkqUoIwO3D9pdiT2/eT9EyJLk+JZmDKKUAGDjO
         LzCBtkS26TulVF1odf+5/R/FfMvIlDVEdW2lkOZUIB2PzaRH/LaCwlhcqXnClTa13xmq
         U+lYnM9upXKB07vYGNNpGyLaWRwickiV0PEoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736509221; x=1737114021;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWNhJ+USbtMq5De5TNW6JSW2YlRcCjhPAv9sMOiVInI=;
        b=kZWjUQI3LpaZ8VpDTzrAxcKAPI6OvWyOlnpMJHOL9yJ1I1jQ4HF6AF3MKCc5IBF5Fp
         KlM9AgpJ1u3Cs4aoy17+0D1oAPaHQJU/66SHhLQ4Vvq6BJwn+5PTCwJOL1HirDz4qtxw
         I0b0tcRcnnFMG7QakMs/HUct4LYDPoBc4yYlvj6SxGa8VFzidj1D24wIzzdatiWbyxUo
         1C1rANWVcpB57W0fK14gXQrL/V5hEWCHFVVyPqd8e8qavLPPgr3pWjo2FFD2dhDVZHiJ
         ISuP5SPjWxUQyLgoKXE1fgqPG6fPtRHs1R25sN1sigf3bbjvEk1wYEyUbYtuhGFrs51g
         5Oow==
X-Forwarded-Encrypted: i=1; AJvYcCUsXQdumbZmhxG02ROYhsVGenCtC9yCrICLeiZTdxOV83++b/0Bk6Z7+FQHsXGVo4NV8iyqxmBC17o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcSiK6jr4y/+wZsZ7+zxDTlYtuJRY4rM8QdhtZr46AvUfpQWl+
	CD3z8dXBzh4X+YnPaXBA5zEWLyVMxn3GP+uLEOzwaBs4svX6fxIEgRWXGvUMCSE=
X-Gm-Gg: ASbGncsfuzQhTabASLymGK+tVGcRQtaQZXbtkQlsY4xsG32W0RHqYSCVwgE6r53ecs5
	nw3AI/gPeQZmTBdzqMO9sC8ozgGzXMi+vYRch4qDCA0culQ9iam74q/T2QaI/xaW6mClxQQd3Wl
	/RCShkqAmwlJH0kVD9yNhD+oXLYpZe4oZd59mcas12CjUderIxok8QL+7yYbUvK+9ktNWTixS+o
	I2idVou5RboKpwK+/zZ8W7uCLPsEPn1T4G0Mzrl+vdYxIlqLCOq8ZCdoVZtxmQ=
X-Google-Smtp-Source: AGHT+IFSvwcBI3JiUS552frjGxJDx4z6XY8CARYI1vKfRa3tJ6aQ5YolVotCuP3M8VNKEkficu7KEQ==
X-Received: by 2002:a17:906:c143:b0:aa6:79fa:b480 with SMTP id a640c23a62f3a-ab2ab670756mr947096666b.10.1736509220710;
        Fri, 10 Jan 2025 03:40:20 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 11:40:14 +0000
Message-Id: <D6YD543UTJJ5.1OAN0MJ4D1OZG@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Jan Beulich"
 <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 10/13] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-11-alejandro.vallejo@cloud.com>
 <7e36137b-ce1f-4e78-9a41-fbfdbe9c0d87@suse.com>
 <D6D3WWUR75T2.1C5DL8WJGQVNP@cloud.com>
 <def2d398-ae9a-43c8-8de6-22ea01eae196@suse.com>
 <D6D6IAZRJYH5.E1DPQHQSI9CE@cloud.com>
In-Reply-To: <D6D6IAZRJYH5.E1DPQHQSI9CE@cloud.com>

On Mon Dec 16, 2024 at 2:02 PM GMT, Alejandro Vallejo wrote:
> On Mon Dec 16, 2024 at 12:03 PM GMT, Jan Beulich wrote:
> > On 16.12.2024 13:00, Alejandro Vallejo wrote:
> > > On Mon Dec 9, 2024 at 4:30 PM GMT, Jan Beulich wrote:
> > >> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> > >>> --- a/xen/arch/x86/xstate.c
> > >>> +++ b/xen/arch/x86/xstate.c
> > >>> @@ -1022,9 +1022,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
> > >>> =20
> > >>>  uint64_t read_bndcfgu(void)
> > >>>  {
> > >>> +    uint64_t bndcfgu =3D 0;
> > >>>      unsigned long cr0 =3D read_cr0();
> > >>> -    struct xsave_struct *xstate
> > >>> -        =3D idle_vcpu[smp_processor_id()]->arch.xsave_area;
> > >>> +    struct vcpu *v =3D idle_vcpu[smp_processor_id()];
> > >>
> > >> Can this be pointer-to-const? Certainly right now, so the question i=
s rather
> > >> meant to be forward looking.
> > >>
> > >>> +    struct xsave_struct *xstate =3D VCPU_MAP_XSAVE_AREA(v);
> > >>
> > >> This certainly can be pointer-to-const, just like ...
> > >>
> > >>>      const struct xstate_bndcsr *bndcsr;
> > >>
> > >> ... this is.
> > >=20
> > > Yes, those retained non-const because of the now missing patch to zer=
o-out
> > > bndcfgu.
> >
> > I'm afraid this reply is ambiguous as to what's going to happen in the =
next
> > version. I can read both "will change" and "needs to stay" into it.
> >
> > Jan
>
> It was an answer to "Can this be pointer to const?". Yes, I'll put the co=
nst
> back.
>
> Cheers,
> Alejandro

Actually, xstate is the target of the assembly, so it will be written to
(though not from C). It seems like asking for trouble modifying the target =
of a
pointer to non-volatile const from inline assembly.

I'll leave it as-is in the interest of safety.

Cheers,
Alejandro

