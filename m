Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF37FB9A3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643090.1002989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7wai-0007eW-EJ; Tue, 28 Nov 2023 11:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643090.1002989; Tue, 28 Nov 2023 11:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7wai-0007cJ-Bh; Tue, 28 Nov 2023 11:49:24 +0000
Received: by outflank-mailman (input) for mailman id 643090;
 Tue, 28 Nov 2023 11:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3UE=HJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7wag-0007ZQ-E9
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:49:22 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b4e35b4-8de4-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 12:49:21 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c875207626so65929691fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 03:49:21 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a2e3815000000b002c017a56a1asm197234lja.70.2023.11.28.03.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 03:49:20 -0800 (PST)
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
X-Inumbo-ID: 2b4e35b4-8de4-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701172161; x=1701776961; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/KNRJ/ypgDuLs9fOmmSW9k7hoLyKCqFCCwVHWWU1ECA=;
        b=MvYjVk167g+ApvUFYlh4iH3lmZKbxozvKhlow2EFicFTXGYvrQPnfAmVvgltN8ec5o
         GavzqpcDf6AG+agVCMeCqfVgAKueK0mpJzJmIihCme0fdGjvG0HZaf+0hCGlqgR6n76Q
         gD060z3sMIRLpC8JSTSkvMv+2lRJ/6XKR6dRk0FfgNYuxF4ynerQL63w8J1skta/Umyk
         6KYbHjbgQacfhrGHEr6XHOBqp0INnb6mPT/2j3V07Mc9kemdkTxsKApbyqAho8O9CY4Q
         1KP2gWsOFy/4WEImH5Hswz7NH+rf1J4OC9IKtw94DOnCUiqtoCaVFOutTlnq1iczor0F
         nyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701172161; x=1701776961;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KNRJ/ypgDuLs9fOmmSW9k7hoLyKCqFCCwVHWWU1ECA=;
        b=BXKGCLLjRV7a4s2ELkvCJwf7rQtyuOmiELOyG/TS0qIYv2CFqCXHAaddgiWGFYmYlq
         R3LipjjJ3Szj4nn9cUn4YQ28F8NSvcAYoOqu/aNd+6ZGNdX52hAnDSrrK8h9rwTY5WnC
         ZFuX0mvbfUa1JAXonoQW0EsWtYcyD8ZHJIGQHAMQBZkNdPvruQYDyCA0wUReuTHNFqQi
         vHlWAyRHzaPzl+HjpNh+xdWdtd3JRWTT5V8/id/rZMXp7MYEda4aIqHfnmUJfXrTNqpS
         w/70Vc+NwHooH54EI+8JCCsJKW9Ek2jYd9AAkkykJrpf/vZWzTe2MhCjmEjK2qN9/NMN
         gt4g==
X-Gm-Message-State: AOJu0YwP9APB44rRyWbCEO/SiuO8srr/mAAch77QaopNvZD+yJ8NDbMe
	KfEDqfdAxkV6LcIXATE6TP+9zM3orRBuEQ==
X-Google-Smtp-Source: AGHT+IGrfXBaLme77wLRiaD7AEYdSh3SC854xMi9G3zKJGpmZ7MDGXLHvUvnDeUqkCQdO9V9YY+x2w==
X-Received: by 2002:a05:651c:1a06:b0:2c9:9953:30ec with SMTP id by6-20020a05651c1a0600b002c9995330ecmr7856402ljb.20.1701172160656;
        Tue, 28 Nov 2023 03:49:20 -0800 (PST)
Message-ID: <893de5be9743dd4fc908dfbbfd1e7dc890f74b07.camel@gmail.com>
Subject: Re: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Tue, 28 Nov 2023 13:49:14 +0200
In-Reply-To: <b81607e0-409f-4805-a4ee-8be8fdd959b8@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
	 <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
	 <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
	 <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
	 <195a50316efde86113f6f5df269c754a90490c57.camel@gmail.com>
	 <b81607e0-409f-4805-a4ee-8be8fdd959b8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-11-28 at 10:58 +0100, Jan Beulich wrote:
> On 28.11.2023 10:28, Oleksii wrote:
> > On Tue, 2023-11-28 at 08:57 +0100, Jan Beulich wrote:
> > > On 27.11.2023 20:38, Oleksii wrote:
> > > > On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
> > > > > On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > > > > > --- a/xen/arch/ppc/include/asm/grant_table.h
> > > > > > +++ /dev/null
> > > > > > @@ -1,5 +0,0 @@
> > > > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > > -#ifndef __ASM_PPC_GRANT_TABLE_H__
> > > > > > -#define __ASM_PPC_GRANT_TABLE_H__
> > > > > > -
> > > > > > -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
> > > > >=20
> > > > > Removing this header would be correct only if GRANT_TABLE had
> > > > > a
> > > > > "depends on
> > > > > !PPC", I'm afraid. Recall that the earlier randconfig
> > > > > adjustment
> > > > > in
> > > > > CI was
> > > > > actually requested to be undone, at which point what an
> > > > > arch's
> > > > > defconfig
> > > > > says isn't necessarily what a randconfig should use.
> > > > We can do depends on !PPC && !RISCV but shouldn't it be enough
> > > > only
> > > > to
> > > > turn CONFIG_GRANT_TABLE off in defconfig and set
> > > > CONFIG_GRANT_TABLE=3Dn
> > > > in EXTRA_XEN_CONFIG?
> > >=20
> > > That _might_ be sufficient for CI, but we shouldn't take CI as
> > > the
> > > only
> > > thing in the world. Personally I consider any kind of overriding
> > > for,
> > > in particular, randconfig at bets bogus. Whatever may not be
> > > selected
> > > (or must be selected) should be arranged for by Kconfig files
> > > themselves.
> > > That said, there may be _rare_ exceptions. But what PPC's and
> > > RISC-
> > > V's
> > > defconfig-s have right now is more than "rare" imo.
> > >=20
> > > > Some time ago I also tried to redefine "Config GRANT_TABLE" in
> > > > arch-
> > > > specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it works
> > > > for
> > > > me.
> > > > Could it be solution instead of "depends on..." ?
> > >=20
> > > Why would we want to re-define an setting? There wants to be one
> > > single
> > > place where a common option is defined. Or maybe I don't
> > > understand
> > > what you're suggesting ...
> > I just thought this change is temporary because grant_table.h will
> > be
> > introduced later or earlier, and it will be needed to remove
> > "depends
> > on !PPC && !RISCV". And not to litter common KConfig with the
> > change
> > which will be removed, it will be better to redefine it in arch-
> > specific Kconfig with default n.
>=20
> Right. But if it's indeed temporary, what's the point of this patch?
> The entire series is (supposed to be) to improve code structure for
> longer term purposes. If a non-generic grant_table.h is going to
> appear for PPC and RISC-V, I don't see why the present dummy would
> need removing. That's only useful if an arch can be expected to live
> with GRANT_TABLE=3Dn even when otherwise feature-complete, and at that
> point modifying the Kconfig dependencies would (imo) be appropriate.
I agree. Let's proceed by adding the dependency in the KConfig file.

So which one option will be better:
1. depends on !PPC && !RISCV
2. depends on ARM || X86

~ Oleksii

