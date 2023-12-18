Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4BB816A4D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 10:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655727.1023471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAMC-0003Y1-Bg; Mon, 18 Dec 2023 09:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655727.1023471; Mon, 18 Dec 2023 09:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAMC-0003Uc-7U; Mon, 18 Dec 2023 09:56:16 +0000
Received: by outflank-mailman (input) for mailman id 655727;
 Mon, 18 Dec 2023 09:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFAMA-0003UW-J1
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 09:56:14 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab939503-9d8b-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 10:56:10 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cc6b5a8364so9793751fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 01:56:10 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05651c009100b002cc77d0434esm101432ljq.22.2023.12.18.01.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 01:56:09 -0800 (PST)
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
X-Inumbo-ID: ab939503-9d8b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702893369; x=1703498169; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1wi5oz66ZuTJB947miRH47KjYEnI0bUKJACGV50xjrg=;
        b=X8Vk1T1leP8edf34/NZ4eQcsJ+t4lP5p1lsX406MXbjQ9A3IbSnee/Mb/0NoYbCErr
         GgnvDrtO0QEUFdJf5jMUe0VjKBgG+Swt9tprwWJx4ita1OUx2XUYjH3pc4zyyD3AZO0C
         Mm1mp2YiD+Kos0WeXGqpdikWGVi7ZgxCgw53zwS+hQoIIUFVKwlOPauUBNldULEYesXn
         FNYW6w5y7595SlF2VHhZzMFFyXB8R1HQpHVuCoIQC1Z2+kv93Ye5TqpiXyQ//5Y5fk5d
         ajC082kGyoZfJm2fIDCL6OWBr6xeb2FirIq7a4nGblUNbTEkmxtuOPsWpzR5Pb58uaf+
         1Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893369; x=1703498169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wi5oz66ZuTJB947miRH47KjYEnI0bUKJACGV50xjrg=;
        b=oTbiqiMz4t8FlQRoOEQ9psQCHHa8yeZWzqO0wp9ofpMIsvCuxGTOB8eJ6W+N8ix0ou
         EZcbPIQ1LExcQfaCqcia9EkRHiU+bml3uqZoLkz8C6mgNt7grLVoPkpnjZsTMyNctFG6
         jeLDGe416wMy9U+Tqf8xYrOr3heVOhAJ4odRz0ab49t/CFiSp9oOW5QZzzOOD5bJ33Mz
         vm8EF71QDSXnKBV2N1LWBVwkF+c9ewGkpG6ApJm8hOUlHJ4pLXftkGR+eqBixLaMNKZB
         1WiwvTPRE8Tw7J2JDjooY+ATOilCqtqjSGVkFtoNYLaCaKuR5ecgsKZrvSiC/sPHo6ug
         JcQw==
X-Gm-Message-State: AOJu0Yx8eyEYMt8Z3/95crwCRzI8QW3dzqBPeY6X496gcsPC9ofeeA1b
	WwA/iZiOcJWQyJogrTnVNWA=
X-Google-Smtp-Source: AGHT+IEZC0Ykx+b4/S1W3aG1lInvTw4Ez//R/vmHZVceOchcfTDDaB6l60yA56NwArnO7DGwdyOpBg==
X-Received: by 2002:a05:651c:1a21:b0:2cb:2f3b:c89e with SMTP id by33-20020a05651c1a2100b002cb2f3bc89emr6639672ljb.20.1702893369288;
        Mon, 18 Dec 2023 01:56:09 -0800 (PST)
Message-ID: <5d9896c04a906c7ee379d6788e4c854e90cef363.camel@gmail.com>
Subject: Re: [PATCH v2 21/39] xen/riscv: introduce bit operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 11:56:07 +0200
In-Reply-To: <ab8479db-b9f0-43b2-a751-349c7a59287d@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <20732007fb103115c0e01cefea7d113b8a7ad8e9.1700761381.git.oleksii.kurochko@gmail.com>
	 <ab8479db-b9f0-43b2-a751-349c7a59287d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 14:27 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Did you write this code from scratch? If not, you need to at least
> point
> out the origin. But: None of this looks RISC-V specific, so shouldn't
> it
> instead be put under xen/lib/, as a fallback implementation for arch-
> es
> not having optimized implementations? Looks also at least very
> similar
> to Arm64's, so that one perhaps then will want dropping as well? We
> surely don't want to carry two (almost) identical copies of the same
> logic.
No, I took the code from Arm because as you mentioned it doesn't have
RISC-V specific things.

I think we can move it to xen/lib. Would it be better to as part of
this patch series?

>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/lib/Makefile
> > @@ -0,0 +1 @@
> > +obj-y +=3D find_next_bit.o
>=20
> Dashes instead of underscores please in new file's names, whenever
> possible.
Sure. I'll update that. Thanks.

~ Oleksii

