Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D10680BCC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486906.754330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSFw-0005jX-Nq; Mon, 30 Jan 2023 11:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486906.754330; Mon, 30 Jan 2023 11:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSFw-0005gb-KQ; Mon, 30 Jan 2023 11:23:24 +0000
Received: by outflank-mailman (input) for mailman id 486906;
 Mon, 30 Jan 2023 11:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMSFv-0005MD-NB
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:23:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80f94a72-a090-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:23:21 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id gr7so6125816ejb.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 03:23:21 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 f6-20020a17090631c600b0088879b211easm1583515ejf.69.2023.01.30.03.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:23:20 -0800 (PST)
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
X-Inumbo-ID: 80f94a72-a090-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zoccrR9drtIg2Q4jc0Uq6rKA7pidLeebLHvSEOmeCg8=;
        b=N3e5sdUpwcpBCOGzwJzMwxILHjcXQ0YcFJfbN24NAuTFY8pTKiSa2+CUKN9eiV2fM5
         IEZJ4w4Tg0SN+kzYfP7GZfA+1nK3Hub2RrWibKQhmZrUQAJE7YPD68kjROVuh3Re4VnG
         s02sX9drn6oFvsWWlH0jFHGC5si7AwtkydQXevrOU4JT3/K0SIeQ0gvJaFDmiYMLVFeu
         SliCONaeI+CC3Tv9aHhTfIgTCf3Kp2F6HMVz5QLpT947EHqEwqU2IFewPJW9+0uNyZtb
         g+IDqnqX3q87UtPlRys+ZDz2CD+7l1sTRln2Elp9bMxi3X0ZnN1lBNbshp3EBpKnVsq2
         LZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoccrR9drtIg2Q4jc0Uq6rKA7pidLeebLHvSEOmeCg8=;
        b=dtNnPI1GdSYy/EYMvUAWLNG6GYprBNInOPFZI4ICuaYYj5AkeBxYX23K9NwPVxZEel
         7z1Tt8g7nafIbZb26L3j1MwRDNvfXXBJUWueRWdxBQ284ka4EaM74MqnybYQpsQY9mV3
         /to1X3WtjXbt9UQ3RAVdlasmb88Q+d2+pK4GsHuLKFlxkEuKYTvtYaVxt5XRsdz2mpUn
         Nd0vRmnJKEY04ftDEXKWWKXcn3NqOYZE3n6KbqOgPoD+8unzVkxXcHKyPO3X7/0fE1Tj
         aQ9ZNMWeRGV+Zu9ihP4PC+4kDmVxGPVH9whjZesA9ORmWMUSub6AyzJFo324IY5JTLkr
         ek2w==
X-Gm-Message-State: AO0yUKUEwzoQNloOnqSZMEAC9voprJfXnb1BYWURzxACSoUzX0nkQEJ/
	oVpYvDqY0mRQI4ONCYDk01M=
X-Google-Smtp-Source: AK7set/9ElLq5qFvezmrrKAO6qZhuJ9bd28Tl+XPq2J1E4C7F3qERDMfBhFS/e4CefaxysW1KEI5Rg==
X-Received: by 2002:a17:906:b7d4:b0:87b:dba1:1bf3 with SMTP id fy20-20020a170906b7d400b0087bdba11bf3mr11877358ejb.30.1675077801353;
        Mon, 30 Jan 2023 03:23:21 -0800 (PST)
Message-ID: <5069f8b672b107e83c151ce689f0586a89abd864.camel@gmail.com>
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of
 macros from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 30 Jan 2023 13:23:19 +0200
In-Reply-To: <0af565ba-646f-1540-0b0c-6a14e73ab5fc@suse.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
	 <0af565ba-646f-1540-0b0c-6a14e73ab5fc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-27 at 15:34 +0100, Jan Beulich wrote:
> On 27.01.2023 14:59, Oleksii Kurochko wrote:
> > The patch introduces macros: BUG(), WARN(), run_in_exception(),
> > assert_failed.
> >=20
> > The implementation uses "ebreak" instruction in combination with
> > diffrent bug frame tables (for each type) which contains useful
> > information.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes:
> > =C2=A0 - Remove __ in define namings
> > =C2=A0 - Update run_in_exception_handler() with
> > =C2=A0=C2=A0=C2=A0 register void *fn_ asm(__stringify(BUG_FN_REG)) =3D =
(fn);
> > =C2=A0 - Remove bug_instr_t type and change it's usage to uint32_t
>=20
> But that's not correct - as said before, you can't assume you can
> access
> 32 bits, there maybe only a 16-bit insn at the end of a page, with
> nothing
> mapped to the VA of the subsequent page. Even more ...
>=20
Agree that it will be an issue if 16-bit insn will be at the end of a
page.
The code is based on Linux
(https://elixir.bootlin.com/linux/latest/source/arch/riscv/kernel/traps.c#L=
152)
and it seems they might have the same issue.
> > + end:
> > +=C2=A0=C2=A0=C2=A0 regs->sepc +=3D GET_INSN_LENGTH(*(uint32_t *)pc);
>=20
> ... you obtain insn length you don't even need to read 32 bits.
>=20
It looks you are right so I'll change that in the new version of the
patch series.

> Jan
Oleksii


