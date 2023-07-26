Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8A762F3F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 10:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570180.891722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZYy-0003Ez-Rg; Wed, 26 Jul 2023 08:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570180.891722; Wed, 26 Jul 2023 08:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZYy-0003D3-P9; Wed, 26 Jul 2023 08:08:04 +0000
Received: by outflank-mailman (input) for mailman id 570180;
 Wed, 26 Jul 2023 08:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEth=DM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOZYx-0003Cp-4P
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 08:08:03 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a72bd2d-2b8b-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 10:08:01 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so10259999e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 01:08:01 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d26-20020ac25eda000000b004fe12dbd35fsm79631lfq.271.2023.07.26.01.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 01:08:00 -0700 (PDT)
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
X-Inumbo-ID: 8a72bd2d-2b8b-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690358881; x=1690963681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DE6RFim+qXYzoOaObVpgU/iAADQeBudNCkA//A54Cdg=;
        b=F3q3DinjH9UgyYkV53lvZbBflyMd262y6Ro7YgBoonf8nTz/i3wasxXRrpb2x4es5d
         DxFjwlof76WaS44fqY/F3T+8V48FYGwf/mZ4vPM9BGrrElpSp4bb3KnzqsVr/z6L1ZKn
         wsc/t9bhKU2HgQnAb3g/cG0CyVni/ddTffJa24uALLOvsv+cgkCD+et5X/QNrnKlzWXx
         NmZgCglSfRWnLjLWaM8tUCDViSvQT5ZiaKvub/c2qwjjo/4HnClJPoceehtNlrTjzosM
         pjbfvIHvuPP1UvVeNraNGYYEytVZJZULvbLAVeHTDAqOg8a6mYI3X9yh9rbbn+DslB0Z
         KDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690358881; x=1690963681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE6RFim+qXYzoOaObVpgU/iAADQeBudNCkA//A54Cdg=;
        b=UjphMuFNwgch2QYPn8nNu86XZrIseIImSp1w0UBbWPmZ+QvKgoVSmFx7RJF6WLLYS2
         WBrqwk3EOIJAVe16VgHwpfZIcHqEl9HBNutVF5aRVgmR3tiBGMLbK37LbPlHCCJ3qOtr
         iJnKo3SibzzCUqasTQiko601fFd7p77gr1ErlD99Dk+eUJ5H6RuoElUk2aYWeSPTDqjL
         jit86o6406SvmA2//1Dz3qIGX9lMpoZVkFZ8SwShBtiyOYg9HlorwR5mMwKxoI3iNTP8
         +9BNOoFBzV6PoMapHWe10QKAmPtUdtRstH3x8F6mfT5sOWGTVI5njs4ACLzzLEo6ujQX
         ngsw==
X-Gm-Message-State: ABy/qLbe0kCBNYHv30EqgfdYAGtUynmyAkNXQ+EcMmramVgedjiJN9Uf
	new0ylcpPCU8OofbWUjvbKw=
X-Google-Smtp-Source: APBJJlF8LYGK5OrwKzfib37JjXbfV2pZEod0ieFdh9A7Mj/eeD3+G6MIL0xZqiN4NXCNHy544kieUQ==
X-Received: by 2002:a05:6512:15a5:b0:4f7:55e4:4665 with SMTP id bp37-20020a05651215a500b004f755e44665mr924479lfb.56.1690358881125;
        Wed, 26 Jul 2023 01:08:01 -0700 (PDT)
Message-ID: <9309ca34c386c48f2bff4ea8851b82cd8aa29a6a.camel@gmail.com>
Subject: Re: [PATCH] xen: Drop the (almost) unused extern start[]
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Roberto
 Bagnara <roberto.bagnara@bugseng.com>
Date: Wed, 26 Jul 2023 11:07:58 +0300
In-Reply-To: <20230725182049.2384427-1-andrew.cooper3@citrix.com>
References: <20230725182049.2384427-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-07-25 at 19:20 +0100, Andrew Cooper wrote:
> This global variable is shadowed by plenty local variables, violating
> MISRA
> rule 5.3.=C2=A0 Some architectures happen to have a symbol by the name of
> start in
> their head.S's, but it's not a useful symbol to reference from C.
>=20
> In fact, the single use of the global start[] in RISC-V is wrong and
> means to
> use _start[] as the linker symbol at the beginning of the .text
> section, not
> the function which happens to be in the same location.
>=20
> Fix RISC-V to use the right symbol for it's calculation, and drop the
> extern.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Really missed '_start'.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>=20
> I'm expecting:
>=20
> =C2=A0
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/945105609
>=20
> to come back and show green, but Gitlab is very backed up right now.=C2=
=A0
> I've
> compiled each architecture locally.
> ---
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/xen/kernel.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index fddb3cd0bdeb..99ed5e9623cc 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -148,7 +148,7 @@ static bool __init
> check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long aligned_load_start =3D load_start =
& level_map_mask;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long aligned_page_size =3D
> XEN_PT_LEVEL_SIZE(page_table_level);
> -=C2=A0=C2=A0=C2=A0 unsigned long xen_size =3D (unsigned long)(_end - sta=
rt);
> +=C2=A0=C2=A0=C2=A0 unsigned long xen_size =3D (unsigned long)(_end - _st=
art);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( (load_start + xen_size) > (aligned_load_sta=
rt +
> aligned_page_size) )
> =C2=A0=C2=A0=C2=A0=C2=A0 {
> diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
> index 9ac2694dc7b1..46b3c9c02625 100644
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -66,7 +66,7 @@
> =C2=A0})
> =C2=A0
> =C2=A0/* SAF-0-safe */
> -extern char _start[], _end[], start[];
> +extern char _start[], _end[];
> =C2=A0#define is_kernel(p) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 char *__p =3D (char *)(unsigned long)(p);=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 (__p >=3D _start) && (__p < _end);=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> base-commit: 0b1171be87698bc7d14760383c0770aeb6e41dd4


