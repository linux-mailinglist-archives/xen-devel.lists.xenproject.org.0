Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB2699205
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 11:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496447.767198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbkU-0007Zx-Lj; Thu, 16 Feb 2023 10:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496447.767198; Thu, 16 Feb 2023 10:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbkU-0007Y4-Iv; Thu, 16 Feb 2023 10:44:22 +0000
Received: by outflank-mailman (input) for mailman id 496447;
 Thu, 16 Feb 2023 10:44:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhTJ=6M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pSbkT-0007Xy-LR
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 10:44:21 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de91dda0-ade6-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 11:44:20 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id a3so4144634ejb.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 02:44:20 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 p18-20020a17090635d200b0087fa83790d8sm662395ejb.13.2023.02.16.02.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 02:44:19 -0800 (PST)
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
X-Inumbo-ID: de91dda0-ade6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wtLbpAkl0FZNX7sDs9cC+7OG5ZtljGI1XymIM3vizGk=;
        b=BQ152kqBUZq/BOQR66E6r9rNMMtGsM9DKGCUDzsdr/ukOKyhDIIgyN/2zKb/AbfUM2
         18vjmJ1I14s/79k88f+chAq5HmyyUPvs0vU/NJGACxwl17N7a9pYqIel7exABucpfJmv
         OHYoqVCQi6d7KvsGJg47oY4+CFwkXlJ4lAL7jHQKO3uvAmM+A8XPWPxVlSxn91kk58h/
         HJwiK7Ju3VF+w3x0M+9mlchzxa6GRbUlKT+NxeDAmkZBtb5U9Ja91FtXVE7cgUJFrBeS
         aPs258Ut5v1eteXNpNi2zoU0tNhYtv0GuqPtXvnYoLV4Vxbn51NMB4MZaHXx1SHguAuq
         MFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtLbpAkl0FZNX7sDs9cC+7OG5ZtljGI1XymIM3vizGk=;
        b=xkmgQzGprR2dy6oB39AhtVpxNRPUbcVMg+zZfHnl5W+73wO1OXvw7+tliSzLQ4PLo8
         aGe0BKSQ2/BUE3e54JReiim7xuvkJWy6njtcOQzfCAbU+vbytcFJvXOL2sgNC7ltzqeu
         NLCJA4XHTfKhZMUBq16YFXnNXfX65IihTUxwPNCvGn7oWq7t569UHbjcP2UHwsWa6FgG
         xi1qlch02eFQwe9fIkm3LwAOJFBUi1VHkVhmq7Ond09fdHlQAt+PaR0c4UB5zNm5tu3v
         U7AAlWlIolxoNUfMMhYnZDnvHgP77fxobz40wm4h4IFXRP8zRhRELXivppOBto47pSUJ
         eV2g==
X-Gm-Message-State: AO0yUKWpK7EYxgMxcUuPB1ZFf/vb8HMAT/FPN3+oHfGjZF2e8toxbV1O
	vnXZE9es5Hwj5OgaYzZWq0E=
X-Google-Smtp-Source: AK7set8mJdlQZVkG741pLh6R6beqXt+NLTrKOTHbT0CwH2ABef0cQ3n3Wwjq24EI3Y1NgCEbuaodpQ==
X-Received: by 2002:a17:907:584:b0:8b1:304e:589e with SMTP id vw4-20020a170907058400b008b1304e589emr4231420ejb.53.1676544260285;
        Thu, 16 Feb 2023 02:44:20 -0800 (PST)
Message-ID: <413b6d1439a31e24719321494971cc165bd6942c.camel@gmail.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 16 Feb 2023 12:44:18 +0200
In-Reply-To: <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
	 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
	 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
	 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
	 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
	 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-02-16 at 08:31 +0100, Jan Beulich wrote:
> On 15.02.2023 18:59, Oleksii wrote:
> > Hello Jan and community,
> >=20
> > I experimented and switched RISC-V to x86 implementation. All that
> > I
> > changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT.
> > Other
> > things are the same as for x86.
> >=20
> > For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT
> > will
> > look like:
> >=20
> > #define _ASM_BUGFRAME_TEXT(second_frame) \
> > =C2=A0=C2=A0=C2=A0 ".Lbug%=3D: ebreak\n"=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 ".pushsection .bug_frames.%[bf_type], \"a\", @progbi=
ts\n"
> > =C2=A0=C2=A0=C2=A0 ".p2align 2\n"
> > =C2=A0=C2=A0=C2=A0 ".Lfrm%=3D:\n"
> > =C2=A0=C2=A0=C2=A0 ".long (.Lbug%=3D - .Lfrm%=3D) + %[bf_line_hi]\n"
> > =C2=A0=C2=A0=C2=A0 ".long (%[bf_ptr] - .Lfrm%=3D) + %[bf_line_lo]\n"
> > =C2=A0=C2=A0=C2=A0 ".if " #second_frame "\n"
> > =C2=A0=C2=A0=C2=A0 ".long 0, %[bf_msg] - .Lfrm%=3D\n"
> > =C2=A0=C2=A0=C2=A0 ".endif\n"
> > =C2=A0=C2=A0=C2=A0 ".popsection\n"
>=20
> I expect this could be further abstracted such that only the actual
> instruction is arch-specific.
Generally, the only thing that can't be abstracted ( as you mentioned
is an instruction ).

So we can make additional defines:
=C2=A0 1. #define MODIFIER "" or "c" (depends on architecture) and use it =
=C2=A0
the following way:
=C2=A0 =C2=A0".pushsection .bug_frames.%"MODIFIER"[bf_type], \"a\", @progbi=
ts\n"
=C2=A0 =C2=A0...
=C2=A0 2. #define BUG_INSTR "ebreak" | "ud2" | "..." and use it in the
following way:
=C2=A0 =C2=A0".Lbug%=3D: "BUG_ISNTR"\n"
=C2=A0 =C2=A0...
Except for these defines which should be specified for each
architecture
all other code will be the same for all architectures.

But as I understand with modifier 'c' can be issues that not all
compilers support but for ARM and =C2=A0x86 before immediate is present
punctuation # or $ which are removed by modifier 'c'. And I am
wondering what other ways to remove punctuation before immediate exist.

Do you think we should consider that as an issue?

>=20
> > The only thing I am worried about is:
> >=20
> > #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
> > =C2=A0 [bf_type] "i" (type), ...
> > because as I understand it can be an issue with 'i' modifier in
> > case of
> > PIE. I am not sure that Xen enables PIE somewhere but still...
> > If it is not an issue then we can use x86 implementation as a
> > generic
> > one.
>=20
> "i" is not generally an issue with PIE, it only is when the value is
> the
> address of a symbol. Here "type" is a constant in all cases. (Or else
> how would you express an immediate operand of an instruction in an
> asm()?)
Hmm. I don't know other ways to express an immediate operand except
'i'.

It looks like type, line, msg are always 'constants'=C2=A0
(
they possibly can be passed without 'i' and used directly inside asm():
   ...
   ".pushsection .bug_frames." __stringify(type) ", \"a\",
%progbits\n"\
   ...
) but the issue will be with 'ptr' for which we have to use 'i'.

And I am not sure about all 'constants'. For example, I think that it
can be an issue with 'line' =3D '((line & ((1 << BUG_LINE_LO_WIDTH) - 1))
<< BUG_DISP_WIDTH)' if we will use that directly inside asm(...).

>=20
> Jan

~ Oleksii

