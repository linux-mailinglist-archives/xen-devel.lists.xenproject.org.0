Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D63276373B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 15:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570474.892280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOeJY-0006d8-D0; Wed, 26 Jul 2023 13:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570474.892280; Wed, 26 Jul 2023 13:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOeJY-0006ak-AN; Wed, 26 Jul 2023 13:12:28 +0000
Received: by outflank-mailman (input) for mailman id 570474;
 Wed, 26 Jul 2023 13:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEth=DM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOeJV-0006ac-Vv
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 13:12:26 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7ce240-2bb6-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 15:12:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5227799c224so786989a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 06:12:24 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056402180f00b0051e1660a34esm8723767edy.51.2023.07.26.06.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:12:22 -0700 (PDT)
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
X-Inumbo-ID: 0f7ce240-2bb6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690377143; x=1690981943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDTniEgvf2D3va1x2sfnKodoK2X+DyoDT6DraSd22Dg=;
        b=ML9Wr4iWhZnLY1EatIOaEgf12T/vl7QeV7b5Zy9/PX8HEDL7ghHsPIqiBcymTTZeRF
         efO210jUTIt6Csk6zdKblQnuOEiC1c9DX3UybqMRaHW1ItfJjO/7RRE0fKqXuDjl/fTI
         p/Lf7/uTpWYFOxAxfS8yvCS6zd08UuXywPectf8kCL2zZlOF14s/R6U1X97hfEncUKSN
         sp3PDI0R8RTVsyhMUQoLXy2GhWMsrEuu0Ceje9gdjkJoFf/Aw/F6Suu3iTAl7JUldo5a
         PRJil4fKb6FvEnuWBe/RX7WLgf72EQNhH2xToefDTo/WoyQLMGPKwWJMr74wFZcu6KGA
         8WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690377143; x=1690981943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDTniEgvf2D3va1x2sfnKodoK2X+DyoDT6DraSd22Dg=;
        b=ccz+HwyODKvXhfaJ20H1uWcf/hTuPH0wt4HKa7B59JzkbdnGAD/+mG8pFEmHUgMvmU
         lmgApbGUraakOOBcF1OovhHZg8VgqChOOYQeqLTrEFms8XgNB1NqigMdsNR/P67+Ei1c
         HzKMTMMz6J+qzlga57Nemis6fgkQ1PHuYJqZ85YcMfboMeYtZHVcMt8CVbNWZWxX/xCN
         C8nvxsdjPazjZ93iEY+sefZQA8zBhySjWUA2hcUMQH00kyIqvNIPkF1vJVmvjGE4qo3/
         Z4N79wMn6iw1pUdpRQO9/gfBdWT0cMMuoGah64h6SqK63CKAPWuTEvOkQuEOlbU+chdG
         FbNw==
X-Gm-Message-State: ABy/qLaVH4KMfvyn7k6MuRPjkv0tv4ToOGdE43PxvMljzUX3vhQ/Y6sr
	TkVnmyGX+P0ChbW10BFIFe8=
X-Google-Smtp-Source: APBJJlE96rbl/yWZnu2DQtd+GzkZJdtnaN+O/pzPHxSXe5H23ljhfBBwXdWGufbwmWWYVbjzSxSkiw==
X-Received: by 2002:a50:fc16:0:b0:522:3a89:a79d with SMTP id i22-20020a50fc16000000b005223a89a79dmr1391090edr.2.1690377143299;
        Wed, 26 Jul 2023 06:12:23 -0700 (PDT)
Message-ID: <4deb8c44cf639af66ad7f5b9b42180554e08d5cf.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 26 Jul 2023 16:12:22 +0300
In-Reply-To: <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
	 <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
	 <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
> On 26.07.2023 13:23, Oleksii wrote:
> > I would like to ask for advice on whether it would be easier, less
> > bug-
> > provoking ( during identity mapping to remove of whole Xen ) to
> > have a
> > separate identity section that won't be more than PAGE_SIZE.
>=20
> I'm afraid you can't safely do this in C, or at least not without
> further checking on what the compiler actually did.
>=20
> > @@ -264,6 +268,19 @@ void __init enable_mmu(void)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE1_MODE <=
< SATP_MODE_SHIFT);
> > =C2=A0}
> > =C2=A0
> > +void __attribute__((naked)) __section(".ident")
> > turn_on_mmu(unsigned
> > long ra)
>=20
> Did you read what gcc doc says about "naked"? Extended asm() isn't
> supported there. Since ...
>=20
> > +{
> > + =C2=A0 =C2=A0/* Ensure page table writes precede loading the SATP */
> > + =C2=A0 =C2=A0sfence_vma();
> > +
> > + =C2=A0 =C2=A0/* Enable the MMU and load the new pagetable for Xen */
> > + =C2=A0 =C2=A0csr_write(CSR_SATP,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PFN_DOWN((unsigned lo=
ng)stage1_pgtbl_root) |
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE1_MODE << SAT=
P_MODE_SHIFT);
> > +
> > + =C2=A0 =C2=A0asm volatile( "jr %0\n" : : "r"(ra) );
> > +}
>=20
> ... none of this really requires C, I think we're at the point where
> (iirc) Andrew's and my suggestion wants following, moving this to
> assembly code (at which point it doesn't need to be a separate
> function). You can still build page tables in C, of course. (Likely
> you then also won't need a separate section; some minimal alignment
> guarantees ought to suffice to make sure the critical code is
> confined to a single page.)

Thanks. I'll move all of this to assembly code.
Regarding alignment it is needed alignment on start and end of
function:
    .balign PAGE_SIZE
    GLOBAL(turn_on_mmu)
        ...
    .balign PAGE_SIZE
    ENDPROC(turn_on_mmu)

Does the better way exist?

~ Oleksii

