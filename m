Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266D918A1C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 19:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749389.1157468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMWSK-0007jl-AG; Wed, 26 Jun 2024 17:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749389.1157468; Wed, 26 Jun 2024 17:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMWSK-0007hR-7e; Wed, 26 Jun 2024 17:29:16 +0000
Received: by outflank-mailman (input) for mailman id 749389;
 Wed, 26 Jun 2024 17:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evFT=N4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMWSI-0007fy-Nc
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 17:29:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b3da1a5-33e1-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 19:29:13 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a72585032f1so477886266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 10:29:13 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a726e13a4d7sm199375066b.19.2024.06.26.10.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:29:12 -0700 (PDT)
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
X-Inumbo-ID: 9b3da1a5-33e1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719422953; x=1720027753; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iWI5dEIRs50S8kVANmh6dYFT6ZEbgm6ruLtK3Zl9nQY=;
        b=XBKXgzyCdnlnddW4naY6d+t9d+fFjLuAxk/2HxdfhoZVq8tCl0zgVLT0KlsULMiquh
         BYz3CpM/fCPbyrKg0J5495LWtQZMwr3h6gewlroBRhoKJs8bD3CHMPhQyVnixzTlVV6/
         3xHUgd8CXDjZZmWPRBBqMeAGHUjkgrBYl2w3VegBsZsXmeeEBgLIQAyzAl2iDjVelDIE
         UuXFwJA3TXfY2YN/LoT6iRaWxiEs5RJtdyk+4ZvRAr03oySkOz59dLpGzMeXIxU4e+nh
         4teYrHC1hs8ygPiItP5UgszEF7MM8bcNlRNcAg8EA6dscMCJk0XeZW4XsI8l1eQOL4+v
         7s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422953; x=1720027753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWI5dEIRs50S8kVANmh6dYFT6ZEbgm6ruLtK3Zl9nQY=;
        b=ZmvLm9BEcRx/ELN+7uMrUIHy9UrupJBzsBxqdPIJbdEQ7YcEkuyB7vuoyAhOPA4diT
         aCnqfim+BCdFCJShmA64B8g34v/2tIAy8lh9C8myXKBFDB15T8Lyz489qt5FMW/rnTJo
         1viKk9za9AkNlGLZ3ovIAMd2EIx4/ZWuLTlqvRflbDrvLpE3rRRx9V7/F8Wwk5rXwqVU
         sU3Cpjbe8ryPawM2C/XfpZtNjzhdTho/+o9unhq1grMnFibm6JUIeWvRg1JeAmaqX4mi
         Omq37XcTABIMh7ONVk8V9Jnn1Sewpk73Ii2kFzf2A2uGio7SBgyXlVOt4CpLgb7jNyoA
         xbuA==
X-Forwarded-Encrypted: i=1; AJvYcCWbohA9l5MamqYSMtUboJ86wo7Zcjg8vl4YgkDd/n/ACrvf4gAmRzPOIsTnH+XMZZx08i9DphrShLKl4FUPDenJG8EkrTJ1H91VAfewyIE=
X-Gm-Message-State: AOJu0YxNOSmxNWhhVB1uJNUN0puOzizLB6fVHyKgAOdJvUeQkypGEcji
	RuhseHOEoe7FthDkoSg6JUjoTA1uR1bOldwcyqpDOwqRTqHCj6Nj
X-Google-Smtp-Source: AGHT+IGpDo2jKmRT6BZYdg9ZX/2FCYKr5btI3Bj4AbTf8YGMTt1+Y0Ks0vQPGZwYWbW86Sv9a7OZEw==
X-Received: by 2002:a17:907:8e93:b0:a6c:6f0a:e147 with SMTP id a640c23a62f3a-a714d72c2admr941936466b.12.1719422952901;
        Wed, 26 Jun 2024 10:29:12 -0700 (PDT)
Message-ID: <993881346ec5ab466b5d5b8bf55ece57428d5859.camel@gmail.com>
Subject: Re: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 26 Jun 2024 19:29:11 +0200
In-Reply-To: <6ed6d9bf-2e33-4294-974b-eb1924b011cc@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
	 <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
	 <b638c5f8-20e9-43bb-a47b-e24cb1b1b821@citrix.com>
	 <6ed6d9bf-2e33-4294-974b-eb1924b011cc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-06-26 at 09:53 +0200, Jan Beulich wrote:
> On 25.06.2024 23:10, Andrew Cooper wrote:
> > On 25/06/2024 3:49 pm, Jan Beulich wrote:
> > > On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/cmpxchg.h
> > > > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > > > @@ -18,6 +18,20 @@
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" );
> > > > =C2=A0
> > > > +/*
> > > > + * Binutils < 2.37 doesn't understand ANDN.=C2=A0 If the toolchain
> > > > is too
> > > > +ld, form
> > > Same question: Why's 2.37 suddenly of interest?
> >=20
> > You deleted the commit message which explains why:
>=20
> Not really. My whole point is that while the intention of the change
> looks
> okay, description and comment describe things insufficiently, to say
> the
> least.
>=20
> > > RISC-V does a conditional toolchain test for the Zbb extension
> > > (xen/arch/riscv/rules.mk), but unconditionally uses the ANDN
> > > instruction in emulate_xchg_1_2().
> >=20
> > Either Zbb needs to be mandatory (both in the toolchain and the
> > board
> > running Xen), or emulate_xchg_1_2() needs to not use the ANDN
> > instruction.
> >=20
> > I opted for the latter.
>=20
> And I agree with that.
Okay, then I'll update that in the next patch version.

~ Oleksii

