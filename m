Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB91898BC5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700961.1094853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPZV-00075o-Nz; Thu, 04 Apr 2024 16:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700961.1094853; Thu, 04 Apr 2024 16:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPZV-00073I-LN; Thu, 04 Apr 2024 16:04:13 +0000
Received: by outflank-mailman (input) for mailman id 700961;
 Thu, 04 Apr 2024 16:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsPZT-00073A-Ja
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 16:04:11 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f92fe8cd-f29c-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 18:04:10 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d475b6609eso14826241fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 09:04:10 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bi11-20020a05651c230b00b002d6daf3b41fsm2149634ljb.101.2024.04.04.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:04:09 -0700 (PDT)
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
X-Inumbo-ID: f92fe8cd-f29c-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712246650; x=1712851450; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sRp72ST0r5viqEoUnEQbnSuMaBwnciDWYvvMAnVDde4=;
        b=IG96o2mfNgsxD3EPY7HCBn9DiAfj1RefpRU8QB5m6DSlsdznP2mSDh/Ls7xjcZMKGQ
         U67VW+/XwdbHl7jkImned5EAX01YpVR8uowB+2ptmei9CPnu9qdnXOyah9FY/P5gCNJk
         OuaQWYs4ew2TzLWm7eUGjQdtstsle2+Kdq+FhKBs25CZoUKxcc7x+XfYZjVvWqQaz2T0
         5Q9+PGwHWxES7I6nPiXcr/ex5D1DxOYTpTvWQGoOSMFDY2b5DEei9CvTTWgC9eD9mVs9
         EzPCqknBGfSBhYU1tPvhAF4OncjrnttoYVWUqskQjamZmJ1kVtAF5dpiKnKeUbkhyJ2F
         ICyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712246650; x=1712851450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRp72ST0r5viqEoUnEQbnSuMaBwnciDWYvvMAnVDde4=;
        b=mxJUCReROQylRjE06h/F8ZxKirm6HE56/zADcmPdK5Dyj33gBGH7sxueGJM2XaLJas
         oG3buvtf7AQm5aiAVhCcp/3iRIaRx8p4oilSH6FW2qSJPA6lMmaD43wp8fpt/3g/0mTT
         Kf+0+aoQsjTb6roTOnogZ6pYnZERuuoIZQZp3X3kCkwFqj/rLK6ZXgdtFTb4gIdadcqk
         Ss041BJHXyR8LRThYyns+LRVeIzp4WjF+K74G5SkWCri6NkS/YWRvt5cPjcggoFhdYtp
         YftSm9Dwo0tboxhr903rzlkb3a4s6auUL/OZlVywtiHGMw0i1l+lgzzuau7/MDo8IRYq
         r0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVW7HF6v5/ZPS1YN1zsQ3Mxmk8BiFFpUnTmr/O5Xh+Ywyf9/LN9lmfwSAkMHMEG/EeKLYwT3cYIwVJHYiXHp7J5r0mC8DgaJ7Q+2Xz6OuI=
X-Gm-Message-State: AOJu0YxuSBKm6xR1/yxSMqnZ2PTTPpHTN5JWsHL2I2dQHkbFcGqnNrRk
	ekSxT+kAlJjWCzJPErfPUky6i7n9A5OqHBFZWWtszw3221LuKsE6
X-Google-Smtp-Source: AGHT+IFeL5/U3X2vCbxF6gn+CyfSrP8wnelIuveHNOoEycArVs+OjcfZO/AW2c7k5OhMojSVKrHxkg==
X-Received: by 2002:a2e:9d85:0:b0:2d4:668f:baac with SMTP id c5-20020a2e9d85000000b002d4668fbaacmr2372574ljj.28.1712246649996;
        Thu, 04 Apr 2024 09:04:09 -0700 (PDT)
Message-ID: <0d09adbb0ac52e6e20252ddd6e599ee15030fad6.camel@gmail.com>
Subject: Re: [PATCH v7 08/19] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 18:04:08 +0200
In-Reply-To: <d315dda1-f89e-4028-9aa0-98b4e80c81fc@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <f0d836be5dbc04468a74cabf9b48a51921bf749b.1712137031.git.oleksii.kurochko@gmail.com>
	 <d315dda1-f89e-4028-9aa0-98b4e80c81fc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 17:01 +0200, Jan Beulich wrote:
> On 03.04.2024 12:20, Oleksii Kurochko wrote:
> > +#define emulate_cmpxchg_1_2(ptr, old, new, lr_sfx, sc_sfx) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 uint32_t *aligned_ptr; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long alignment_mask =3D sizeof(*aligned_pt=
r) -
> > sizeof(*(ptr)); \
> > +=C2=A0=C2=A0=C2=A0 uint8_t new_val_bit =3D \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsigned long)(ptr) & ali=
gnment_mask) * BITS_PER_BYTE; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long mask =3D \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GENMASK(((sizeof(*(ptr))) *=
 BITS_PER_BYTE) - 1, 0) <<
> > new_val_bit; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int old_ =3D (old) << new_val_bit; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int new_ =3D (new) << new_val_bit; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int old_val; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int scratch; \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 aligned_ptr =3D (uint32_t *)((unsigned long)ptr &
> > ~alignment_mask); \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 asm volatile ( \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.w" lr_sfx " %[scratc=
h], %[ptr_]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 and=C2=A0 %[o=
ld_val], %[scratch], %[mask]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bne=C2=A0 %[o=
ld_val], %z[old_], 1f\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* the following line is an=
 equivalent to:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=
=C2=A0 scratch =3D old_val & ~mask;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * And to elimanate on=
e ( likely register ) input it was
> > decided
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to use:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=
=C2=A0 scratch =3D old_val ^ scratch
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */ \
>=20
> I'm surprised this compiles without \-es inside the comment as well.
> Line
> splicing happens ahead of comment recognition as per the spec.
I'll add \-es inside the comment.

>=20
> Everything else okay-ish to me now, but I can't very well given an
> ack for
> a patch depending on things that haven't been committed yet and may
> never be.
Except 3 dependency ( which should be dropped as nothing anymore is
used now from this headers ):
   #include <asm/fence.h>
   #include <asm/io.h>
   #include <asm/system.h>

It seems everything else doesn't depending on other things, does it?

~ Oleksii


