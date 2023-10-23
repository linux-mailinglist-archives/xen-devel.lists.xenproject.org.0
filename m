Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0347D2F8D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621251.967517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurzu-000413-HG; Mon, 23 Oct 2023 10:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621251.967517; Mon, 23 Oct 2023 10:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurzu-0003z9-EV; Mon, 23 Oct 2023 10:17:22 +0000
Received: by outflank-mailman (input) for mailman id 621251;
 Mon, 23 Oct 2023 10:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qurzt-0003xi-Kr
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:17:21 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 592806f1-718d-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:17:19 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso4847098e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:17:19 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a199116000000b004ff91a94156sm1661783lfd.121.2023.10.23.03.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:17:18 -0700 (PDT)
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
X-Inumbo-ID: 592806f1-718d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698056239; x=1698661039; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3N+h0b2ma9kznVlCFW6Sd4rRJqY8OhwrMUGwKQZWwzQ=;
        b=E9FpKvONKacj973gbLEMiX1eXKwjDtJvu9Wch7FOxiRbwdBomw6qd9aOIyRqVI5T2S
         vD7+bhlisxMAe8TKA+e0PrG8X8VYqI05WfsbBQUrZzzq5H5ibB7n+6vTjnYWUJZHPllA
         5Yt68Rnu2NgtNWwzpuzANa0reAtY/vq6vzEzkB9a7mPmUjKkp1l5Cctn0vz0bWGr89Jk
         ED0U9V7ZFoswmcWpdZh+NSCc8gJ6JndfKo7Opjei9dDV6QVqNUpRaV6jP8XeEQtbG30H
         Xn0s9jIlqbqQFBiytK/GXh/N1jbgSjbpWa5wWyUiug5PWabIlP4XX9P2lW4Hy4d6tim/
         KEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056239; x=1698661039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3N+h0b2ma9kznVlCFW6Sd4rRJqY8OhwrMUGwKQZWwzQ=;
        b=GeE1nLCrmTCabvLN22gmgePEqomwuZifAAU5J+msLRPgqBrRGJA7z3fNX23XZE5ECP
         l683SRKw+C+KGKfgWYjU5GNLnDfnp58zvqvF+PSJPFtS4EPpwkb1DimYcOhjx/LYptMH
         wW1QnmZdstRClFzBGcnjYUTjVIRJ/gNxU4LxaGCVwY5sDvLeKp93YbUidOr/Pnacta5E
         eULSBJP8+LrHpMZcB5HeRyg/V+g5HLKCkmcJJPR3t3pijPbotpl/0Arq7Dtd+AowdPoq
         oGIcFH6IV7nRETZvw+3o3jUJHR+9e/J2u2YOFVHS/YbkXPbFd9zTklmoETJxZ4Zr2PqU
         anyA==
X-Gm-Message-State: AOJu0Yy6ROlco08ZbSnKJHpk6Cud1lCCmAdplQSyWXC9jI5mm3niYC0p
	Lfp2NlspPBX4RkvSaQSZzmChVYevIuU=
X-Google-Smtp-Source: AGHT+IGQr72TOl1hqP536vpy8yg9fknSTpYvg1E87wwDGfYVKcOVJWHolxhIVofyo96Muztkzdz4pw==
X-Received: by 2002:ac2:597a:0:b0:507:9623:8ae8 with SMTP id h26-20020ac2597a000000b0050796238ae8mr6120539lfp.29.1698056239076;
        Mon, 23 Oct 2023 03:17:19 -0700 (PDT)
Message-ID: <d7e862261c5a45902ba95eaff31d813d97f3c62e.camel@gmail.com>
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:17:18 +0300
In-Reply-To: <97eaa9e6-bc4b-4128-9563-cf3647a794c7@xen.org>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
	 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
	 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
	 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
	 <5059771d-3842-4a7c-814d-69388179b246@xen.org>
	 <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
	 <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
	 <04fe316e-bc4f-0df8-7771-5be7ca878297@suse.com>
	 <3ce85a73-96ab-41c8-8b90-f3899e771845@xen.org>
	 <63392d67-f1af-a53b-59c2-ad4752159726@suse.com>
	 <97eaa9e6-bc4b-4128-9563-cf3647a794c7@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 13:12 +0100, Julien Grall wrote:
> Hi,
>=20
> On 19/10/2023 12:41, Jan Beulich wrote:
> > On 19.10.2023 13:27, Julien Grall wrote:
> > > that doesn't involve one arch to symlink headers from another
> > > arch.
> >=20
> > Whether to use symlinks or #include "../../arch/..." or yet
> > something else is
> > a matter of mechanics.
>=20
> #include "../../arch/../" is pretty much in the same category. This
> is=20
> simply hiding the fact they could be in asm-generic.
>=20
> Anyway, I have shared my view. Let see what the others thinks.
I have the same point: if something is shared at least between two
arch, it should go to ASM-generic.

And that is the reason why I pushed device.h header to asm-generic.
It is needed to rename some stuff (e.g... GIC ) in it or add some
ifdefs.

~ Oleksii

