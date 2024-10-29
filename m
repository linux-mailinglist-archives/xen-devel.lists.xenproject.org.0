Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088469B4787
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827255.1241822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ju4-0006py-SD; Tue, 29 Oct 2024 10:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827255.1241822; Tue, 29 Oct 2024 10:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ju4-0006nH-OZ; Tue, 29 Oct 2024 10:56:48 +0000
Received: by outflank-mailman (input) for mailman id 827255;
 Tue, 29 Oct 2024 10:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5ju3-0006br-9H
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:56:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c218932-95e4-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 11:56:44 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso673007566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:56:44 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629f83fsm3898965a12.38.2024.10.29.03.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 03:56:42 -0700 (PDT)
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
X-Inumbo-ID: 7c218932-95e4-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdjMjE4OTMyLTk1ZTQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMTk5NDA0LjY3Njk2NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730199403; x=1730804203; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLbxQHiyK4T/N8pomFvkppNUPghYLKCRHF4kNAlmNyo=;
        b=Lc8GVj2AcDbG7BiUrDrSQXW0A3EU3raMBQHiEbv3VUrK+/GLFlpNrXxv6KTHiyLSa2
         lPuXkE3aYqty/UF4GpmhvBV/x4gj0tPX343VhHM7d5ZaDoDTmxqdykVJyFXpS5Rip0bT
         E0mZvhSoovsw9VPy+OutA1Hgjc8f6CsydTwH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199403; x=1730804203;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLbxQHiyK4T/N8pomFvkppNUPghYLKCRHF4kNAlmNyo=;
        b=O0/JcW8xvg2RD/p/w8MQyqTOTcJvjTmwqnVWrza0lyzIJRp/oXzcSNKUm59b7eNsPM
         rrwH4p4+c6a+yQQjvu7Gv7TzzCjGGfmGsKFKaH6lH3R48pF/54I+z2CGjXDwvNNHM7Zl
         +kQyhm9bNBdRWgraxqP8cp8By0rhm91TzdxHCaIDPN7ssFmEzeL4hK4naGKQ4DhE3N3u
         wM/6EuBDOEqfZsB8uVRpvyvNOhE/GejQbkrbmCiJdSYDJJ+OU6Bh5ISiQ69IFFbtWJFY
         S9Eou0dU+w5EgJO/cG74DlgcRFba5bQHAo2l+w5iBG7RF9peI5RqbSaO6i1lsZzQ+3Wh
         7d8w==
X-Forwarded-Encrypted: i=1; AJvYcCWXj1RVVAA5kgDealkya6KT9Mo3aGC7dzG4MEwcWSeZek9m1fANl4ITH6dvhyqSeV6Lg++e3mMZqgY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqtG9yKAkwSY8X9f5uIcEs1O0KRgSlpNxr8ORnRAanPmR/kkEb
	9EhZrHiOy7pUaMnFj9OgSUKqHPCQ05FBajVZzD747LHys6exH+vutMOYzdYRoRlcrT9kuR0bTYg
	d
X-Google-Smtp-Source: AGHT+IEo9qJiHFfE/luMD6g7Lwn0CW/FLdbHii5PYvwogOe3yTh+Z5KFJnPxfuU3jTnbBSDB412ncg==
X-Received: by 2002:a17:907:3f02:b0:a99:f746:385 with SMTP id a640c23a62f3a-a9de5c92befmr1042101566b.1.1730199403404;
        Tue, 29 Oct 2024 03:56:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 10:56:41 +0000
Message-Id: <D588I0A48MB1.1T96PWTSBSEY1@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/14] x86/xstate: Update stale assertions in
 fpu_x{rstor,save}()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-2-alejandro.vallejo@cloud.com>
 <fdc89027-d33c-40f5-93f9-b8d7e880e732@citrix.com>
 <7027a24e-3213-48c5-8027-24dcf1df55ac@suse.com>
In-Reply-To: <7027a24e-3213-48c5-8027-24dcf1df55ac@suse.com>

On Tue Oct 29, 2024 at 8:13 AM GMT, Jan Beulich wrote:
> On 28.10.2024 18:16, Andrew Cooper wrote:
> > On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> >> The asserts' intent was to establish whether the xsave instruction was
> >> usable or not, which at the time was strictly given by the presence of
> >> the xsave area. After edb48e76458b("x86/fpu: Combine fpu_ctxt and
> >> xsave_area in arch_vcpu"), that area is always present a more relevant
> >> assert is that the host supports XSAVE.
> >>
> >> Fixes: edb48e76458b("x86/fpu: Combine fpu_ctxt and xsave_area in arch_=
vcpu")
> >> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >> ---
> >> I'd also be ok with removing the assertions altogether. They serve ver=
y
> >> little purpose there after the merge of xsave and fpu_ctxt.
> >=20
> > I'd be fine with dropping them.
>
> +1
>
> Jan
>
> >=C2=A0 If they're violated, the use of
> > XSAVE/XRSTOR immediately afterwards will be fatal too.
> >=20
> > ~Andrew

Ok then, I'll re-send this one as a removal.

Cheers,
Alejandro

