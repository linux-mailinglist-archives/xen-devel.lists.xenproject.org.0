Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3198A9AE1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708354.1107210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRVi-0001RI-T2; Thu, 18 Apr 2024 13:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708354.1107210; Thu, 18 Apr 2024 13:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRVi-0001OX-PH; Thu, 18 Apr 2024 13:09:06 +0000
Received: by outflank-mailman (input) for mailman id 708354;
 Thu, 18 Apr 2024 13:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wMuF=LX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rxRVh-0001OR-UC
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:09:05 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d44b3772-fd84-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 15:09:03 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso846313e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 06:09:03 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u24-20020ac248b8000000b0051967f6cd9bsm233104lfg.95.2024.04.18.06.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 06:09:01 -0700 (PDT)
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
X-Inumbo-ID: d44b3772-fd84-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713445743; x=1714050543; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c++SjeR4UWOk++noKSPlojD8/Y9H0t7zqX7dKsIsIFI=;
        b=ealt+5F1FpSUJB9q6G5iZQhCn1T3Oj+ixDcoVnv2X7qicGWSHBbv6bMrv0SFCIZijZ
         NjXTCz+xRSZh2L8agFnkGU+ayaYkJ0m2Y1UTtz+Bk/6jhpzTWl4CiWHyYQuoCgd0hRhM
         vGnA1ta21w3t6FRnk/yZg6NSOsz1OM/KQX8vdZHBA9Ls7ZR0c9SHcxBphyna0psdVN3/
         bLrH6hgiQ+GiA1tVPQJNPxczjifFGjFASlIzwthmSWL8N9i1XUZj827+U9O8TT2dqz8A
         y2mV2DoDq3jsdAk5YZknWuRJ1NBM2Zr37wH65Vu7ukz1aX4bBZbX5tV9HjawvO7zB6/D
         LX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713445743; x=1714050543;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c++SjeR4UWOk++noKSPlojD8/Y9H0t7zqX7dKsIsIFI=;
        b=esiueQMDU9NSzz2B2T8adDYmU3Q9I9HiwO/Gb5xxyjiuxasoDRju/Bk9g2UI6hCkO+
         +h6ZiItrWl5nQ/t0RyxziaXm+JdQN7Ix64hXhNl5mhK9C1jQzJ0WREPpP0IqzOi7ALe1
         ElG4K/a7yLfFN5Pd86mUO9w5NVvxrgBJN8KbadwBEs2pdpqxA4fXAhLwBfSUnHSNtEK+
         cAcD3IzgolxKv+3UoFJhgY2XEoWlKcHYjxgsPBBYupv+7NAScCoHIpeNqVRpsBrE9uI5
         uJ1KfdI86jVAO+tzwfgWiltN3o9DRMjsUsOahzXGhZthZzPmQuPlSxEtl7qjqDoNOH2O
         okQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9ASDubOj3Ew4WcOHsQwC4MqRidYj9otTYu132WfQh1qYE6ultS8ch+2ImmtbUKOQAokTY0BILLSCuRys86dUU1NPi+JIg79/k1iV9VqA=
X-Gm-Message-State: AOJu0Yyey/8dOoaYr4oh4OVPb5W3b7AG7k25A/KlAy9AHLQi+JRmO14T
	dHQ+hndQPTTdMhwbnKHnssTaoidmOWodSs9iCPok9DazSMIOn2Im
X-Google-Smtp-Source: AGHT+IFFXUI5U4RsnH6b6AhuENzVAf+u7OIByrBYupxSbDwiN4etyHrXW5W5iQIn5AelBoAHa1Xxxg==
X-Received: by 2002:ac2:4d0b:0:b0:516:2b5a:3a5 with SMTP id r11-20020ac24d0b000000b005162b5a03a5mr712863lfi.2.1713445742563;
        Thu, 18 Apr 2024 06:09:02 -0700 (PDT)
Message-ID: <3acf272c5950ea5e980cb40ae4ee3ec5698b26ae.camel@gmail.com>
Subject: Re: [PATCH] xen/riscv: check whether the assembler has Zbb
 extension support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 18 Apr 2024 15:09:01 +0200
In-Reply-To: <0f1c2960-2443-4afd-811a-7182cc0ccbd5@suse.com>
References: 
	<10816604a8625b5052f134e54c406fb4e7b6c898.1712649614.git.oleksii.kurochko@gmail.com>
	 <0f1c2960-2443-4afd-811a-7182cc0ccbd5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-18 at 12:00 +0200, Jan Beulich wrote:
> On 09.04.2024 10:00, Oleksii Kurochko wrote:
> > Update the argument of the as-insn for the Zbb case to verify that
> > Zbb is supported not only by a compiler, but also by an assembler.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> While technically all if fine here, I'm afraid I have a couple of
> nits:
>=20
> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -11,7 +11,8 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=3D
> > $(riscv-march-y)c
> > =C2=A0
> > =C2=A0riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-march-y)
> > =C2=A0
> > -zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
> > +zbb_insn :=3D "andn t0, t0, t0"
>=20
> As can be seen on the following line (as-insn, riscv-generic-flags)
> we
> prefer dashes over underscores in new variables' names. (Another
> question is
> whether the variable is needed in the first place, but that's pretty
> surely
> personal taste territory.)

It seems to me that we need it; otherwise, if we don't use the variable
and put everything directly:
  zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"andn t0, t0,
t0",_zbb)
Then as-insn will receive incorrect arguments because of the ',' used
in the instruction. It will parse it as 3 separete arguments ("and, t0
and t0"), which will lead to a compilation error:
   /bin/sh: -c: line 1: unexpected EOF while looking for matching `''
   /bin/sh: -c: line 2: syntax error: unexpected end of file

Probably I am missing something and it can be done in a different way.

>=20
> Furthermore this extra variable suggests there's yet more room for
> abstraction (as already suggested before).
>=20
> > +zbb :=3D $(call as-insn,$(CC) $(riscv-generic-
> > flags)_zbb,${zbb_insn},_zbb)
>=20
> Why figure braces in one case when everywhere else we use parentheses
> for
> variable references? There's no functional difference sure, but
> inconsistent
> use specifically may raise the question for some future reader
> whether there
> actually is one.
I see the usage of {} somewhere else in code base, so automatically use
them here too. Sure, it should be consistent. Thanks.

~ Oleksii

