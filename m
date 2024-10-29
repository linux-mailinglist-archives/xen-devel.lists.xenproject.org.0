Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127DA9B4BD7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827441.1242044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mz7-0005e3-UC; Tue, 29 Oct 2024 14:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827441.1242044; Tue, 29 Oct 2024 14:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mz7-0005at-RY; Tue, 29 Oct 2024 14:14:13 +0000
Received: by outflank-mailman (input) for mailman id 827441;
 Tue, 29 Oct 2024 14:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5mz6-0005al-8m
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:14:12 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102ca991-9600-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 15:14:08 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso9133230e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 07:14:08 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298daasm474542666b.138.2024.10.29.07.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 07:14:07 -0700 (PDT)
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
X-Inumbo-ID: 102ca991-9600-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEwMmNhOTkxLTk2MDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjExMjQ4Ljg0NDA2LCJzZW5kZXIiOiJhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730211248; x=1730816048; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqt1QtwaKyWSrviNxZ7VZiV4y+Eve7of15PsFhgabG0=;
        b=O5V+WKsQR+idrNEQiMw2XkycDJQtApF+sgRVmtToJ11WxwHUbDvoe/iv41KFbCOCeF
         3ZKGBVhQnpMLNRoX1AQipRfsrkUwjQlfzEGVZG+RhvGIE7/Hl1EYhe57cfAdOAkZhY9M
         znTttkcFhSJk3bSnVx4uhexM7oq3i450LkZT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730211248; x=1730816048;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqt1QtwaKyWSrviNxZ7VZiV4y+Eve7of15PsFhgabG0=;
        b=Yvnpams2fAlaaOHAJshR2kENE2Y6qKaMZAKNvZsnDymWOsGvLM5xBKqCDrH2Ny6Ko1
         Nts4vzZdMuPC3pMv8pw8xDuhYHCmFZBEQ/NAaFSfx8iYzs1Afvyw05d9kMIAgOudgCDX
         I74gXhEdjvHfg1EqkYLdDdDwuLamsuO4ltz0xNDsJqg7+e8ZJW79fVIngfwjN7jJP/V9
         7dfy4FE8JeTdvgOZfwTyrm4kh6TsonPtrjCya05X382V+LLFZX6zs6DvMR4P1ySV7mCD
         FCiJiQ6HqYVA8s7nKSHTS4O0GAMG+lls6joR0w3kiNXOas6Hy8QCOCG6Pb18Pj5lBa7S
         GuEw==
X-Forwarded-Encrypted: i=1; AJvYcCXe1lgUsYj9ODjdK1nWmLWMy+s9CDtYZKHv0Z+Mbf7rfj1txtWST43zpKptVBpz9k+m10/ODqw1smU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGX3FE0802VJKbB2Vc4uChWabnhdlHalL/GNhMpMdkj20WMaAx
	wjJPQ66mDDQvZOq07VtCnR9lUXoRelbEc62MHwProco7Og1I5+7NG/muO4Kid6w=
X-Google-Smtp-Source: AGHT+IHNoCsmwl3/ohZT5yKL4rufqtZHmz/oZGDpVlIYU7DSpFKUwMUnJgHuYM9K7i1SibvQ/Ryy+w==
X-Received: by 2002:a05:6512:3c9f:b0:539:93b2:1380 with SMTP id 2adb3069b0e04-53b34921b15mr10239273e87.48.1730211248243;
        Tue, 29 Oct 2024 07:14:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 14:14:06 +0000
Message-Id: <D58CP5KMQBUE.L8TH21EXOPH2@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/14] x86/xstate: Map/unmap xsave area in
 xstate_set_init() and handle_setbv()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-6-alejandro.vallejo@cloud.com>
 <4f49f8df-d455-4be2-a245-e876713addf1@suse.com>
 <D58B4QZAZKUD.3BAWPZIU90TND@cloud.com>
 <aeaa64ed-91f3-4856-8938-195436427892@suse.com>
In-Reply-To: <aeaa64ed-91f3-4856-8938-195436427892@suse.com>

On Tue Oct 29, 2024 at 1:31 PM GMT, Jan Beulich wrote:
> On 29.10.2024 14:00, Alejandro Vallejo wrote:
> > On Tue Oct 29, 2024 at 8:26 AM GMT, Jan Beulich wrote:
> >> On 28.10.2024 16:49, Alejandro Vallejo wrote:
> >>> --- a/xen/arch/x86/xstate.c
> >>> +++ b/xen/arch/x86/xstate.c
> >>> @@ -993,7 +993,12 @@ int handle_xsetbv(u32 index, u64 new_bv)
> >>> =20
> >>>          clts();
> >>>          if ( curr->fpu_dirtied )
> >>> -            asm ( "stmxcsr %0" : "=3Dm" (curr->arch.xsave_area->fpu_=
sse.mxcsr) );
> >>> +        {
> >>> +            struct xsave_struct *xsave_area =3D vcpu_map_xsave_area(=
curr);
> >>> +
> >>> +            asm ( "stmxcsr %0" : "=3Dm" (xsave_area->fpu_sse.mxcsr) =
);
> >>> +            vcpu_unmap_xsave_area(curr, xsave_area);
> >>> +        }
> >>
> >> Since it's curr that we're dealing with, is this largely a cosmetic ch=
ange? I.e.
> >> there's no going to be any actual map/unmap operation in that case? Ot=
herwise
> >> I'd be inclined to say that an actual map/unmap is pretty high overhea=
d for a
> >> mere store of a 32-bit value.
> >=20
> > Somewhat.
> >=20
> > See the follow-up reply to patch2 with something resembling what I expe=
ct the
> > wrappers to have. In short, yes, I expect "current" to not require
> > mapping/unmapping; but I still would rather see those sites using the s=
ame
> > wrappers for auditability. After we settle on a particular interface, w=
e can
> > let the implementation details creep out if that happens to be clearer,=
 but
> > it's IMO easier to work this way for the time being until those details
> > crystalise.
>
> Sure. As expressed in a later reply on the same topic, what I'm after are=
 brief
> comments indicating that despite the function names involved, no actual m=
apping
> operations will be carried out in these cases, thus addressing concerns t=
owards
> the overhead involved.
>
> Jan

Right, I can add those to the sites using exclusively "current". That's no
problem.

Cheers,
Alejandro

