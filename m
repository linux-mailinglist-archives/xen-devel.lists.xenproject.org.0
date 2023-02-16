Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24948699431
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 13:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496533.767323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSdGJ-0001Hx-JY; Thu, 16 Feb 2023 12:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496533.767323; Thu, 16 Feb 2023 12:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSdGJ-0001En-Ga; Thu, 16 Feb 2023 12:21:19 +0000
Received: by outflank-mailman (input) for mailman id 496533;
 Thu, 16 Feb 2023 12:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhTJ=6M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pSdGH-0000gg-8H
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 12:21:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6927fd43-adf4-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 13:21:16 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id dr8so4613299ejc.12
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 04:21:16 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 v26-20020a1709060b5a00b008b1787ce722sm108280ejg.152.2023.02.16.04.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:21:16 -0800 (PST)
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
X-Inumbo-ID: 6927fd43-adf4-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQ+N3XSh7XdbndtvKyxOAdYibvxb9PAQGUDOIH38+Fg=;
        b=PKfpwFFgQ9lmq+q0cdO94lgia+EVD+hGSdVWZIbCUlZ8uHMQkWANjEE/mQgQkit0Of
         Bw8G1Vwjlu9ZkXZ1dGLqhqJBh5zRKGZmD+wsUy2xuhzSXG8g6UEvOh5ioPb3Vs+L8DzH
         PLS31Ckkxw5ztHqeI6z0HrxUZ+rNSRSQ6XGpRV7mX+KMPx46Yhqh//lqNT9PkwzSdELk
         rEznts53Hkohkk9WMHL1a9+kibbMhP5UHo0xuPYKdHF8DVTLmODXk86dSIMjVi3XdDrw
         rHxoysFF/ai++1pUCBMXpXu9rYhotoOUYrRGead995uZ7ILV3qma1cqY+r3zgYwM77id
         FsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQ+N3XSh7XdbndtvKyxOAdYibvxb9PAQGUDOIH38+Fg=;
        b=Fm13QXWOykKxMxle7vV3XWnzLvgrOoC9WZwNdMkmmMhJBzoWxgTgUdFW5bF7cXaVZA
         jKuAGy3p3AUXNLqdQ4AMw0V7Aib3D5WZmYb99NpaSDsnSckfk78ghP1JAeDSxYJExoNS
         epbsOX/3DIMKpjiWpA6x5zP9QpQLvNrVOa4jSpKvD3ZdrCuejCOu1w39mNjbwYZzsrvK
         Ltok5v7rimAXCmpkwHIc7la/gx/nmge9vyRmKQ8IkFR8kymQ59Adj+UGar+9Yg+1WJVZ
         v53+CzFLq0PtAQ2/nb+rYzz+IKcf07m8gIved2zV3LcQr0C60MaXUFnFA944jUMnw+1B
         9q6w==
X-Gm-Message-State: AO0yUKUV8TmYHYiefKsf7Z2z1M2svMNA5bW6vld3z4x3aBZz5u7WmQPu
	aXpEJjBxJOebKacpcmhXOCU=
X-Google-Smtp-Source: AK7set/reMxc2x6GBmXO1ZFaJyEMO7ZkMvvaH2/xgOX99VKEqph87auk4/8sq1yGreDsZXQS9x9JYA==
X-Received: by 2002:a17:906:c2cf:b0:8b1:fc:b1b0 with SMTP id ch15-20020a170906c2cf00b008b100fcb1b0mr5361970ejb.44.1676550076328;
        Thu, 16 Feb 2023 04:21:16 -0800 (PST)
Message-ID: <bbdd42399f21ae3e74c6564265127bc292e4e29a.camel@gmail.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 16 Feb 2023 14:21:14 +0200
In-Reply-To: <068340c3-2a2f-4bd0-20e9-f1dd6fe4bc2b@citrix.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
	 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
	 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
	 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
	 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
	 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
	 <068340c3-2a2f-4bd0-20e9-f1dd6fe4bc2b@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-02-16 at 10:48 +0000, Andrew Cooper wrote:
> On 16/02/2023 7:31 am, Jan Beulich wrote:
> > On 15.02.2023 18:59, Oleksii wrote:
> > > Hello Jan and community,
> > >=20
> > > I experimented and switched RISC-V to x86 implementation. All
> > > that I
> > > changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT.
> > > Other
> > > things are the same as for x86.
> > >=20
> > > For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT
> > > will
> > > look like:
> > >=20
> > > #define _ASM_BUGFRAME_TEXT(second_frame) \
> > > =C2=A0=C2=A0=C2=A0 ".Lbug%=3D: ebreak\n"=C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0 ".pushsection .bug_frames.%[bf_type], \"a\", @prog=
bits\n"
> > > =C2=A0=C2=A0=C2=A0 ".p2align 2\n"
> > > =C2=A0=C2=A0=C2=A0 ".Lfrm%=3D:\n"
> > > =C2=A0=C2=A0=C2=A0 ".long (.Lbug%=3D - .Lfrm%=3D) + %[bf_line_hi]\n"
> > > =C2=A0=C2=A0=C2=A0 ".long (%[bf_ptr] - .Lfrm%=3D) + %[bf_line_lo]\n"
> > > =C2=A0=C2=A0=C2=A0 ".if " #second_frame "\n"
> > > =C2=A0=C2=A0=C2=A0 ".long 0, %[bf_msg] - .Lfrm%=3D\n"
> > > =C2=A0=C2=A0=C2=A0 ".endif\n"
> > > =C2=A0=C2=A0=C2=A0 ".popsection\n"
> > I expect this could be further abstracted such that only the actual
> > instruction is arch-specific.
> >=20
> > > The only thing I am worried about is:
> > >=20
> > > #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
> > > =C2=A0 [bf_type] "i" (type), ...
> > > because as I understand it can be an issue with 'i' modifier in
> > > case of
> > > PIE. I am not sure that Xen enables PIE somewhere but still...
> > > If it is not an issue then we can use x86 implementation as a
> > > generic
> > > one.
> > "i" is not generally an issue with PIE, it only is when the value
> > is the
> > address of a symbol. Here "type" is a constant in all cases. (Or
> > else
> > how would you express an immediate operand of an instruction in an
> > asm()?)
>=20
> At a guess, the problem isn't type.=C2=A0 It's the line number, which end=
s
> up
> in a relocation.
Sure. I missed that.
>=20
> That said, I'm not sure an architecture could reasonably function
> without a generic 4-byte PC-relative relocation...
>=20
> ~Andrew


