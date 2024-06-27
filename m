Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE591A2E5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749890.1158125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlgo-0005cV-J1; Thu, 27 Jun 2024 09:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749890.1158125; Thu, 27 Jun 2024 09:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlgo-0005aV-FW; Thu, 27 Jun 2024 09:45:14 +0000
Received: by outflank-mailman (input) for mailman id 749890;
 Thu, 27 Jun 2024 09:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMlgn-0005aN-Lv
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:45:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2df9b7e-3469-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 11:45:12 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a729da840a8so63748966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:45:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d779669sm42384966b.99.2024.06.27.02.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:45:11 -0700 (PDT)
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
X-Inumbo-ID: f2df9b7e-3469-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719481512; x=1720086312; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o5bsw/bIwpiQtTxDqqa+G2RfEnwKlsaZmclV+a4TWf4=;
        b=CwZ50Ism7r/Ie7QS7qR3jcaP7nmbc+/MgvntLbx4ha2fYiGvuAWIgJHGFrfCcG6n2L
         umzVnZcUWngr6hzfUKidibkcz6memUJ0pxgZRwD356N04ZaI+DD8F4BsdIoQriARsXm4
         xPuEIAX6WdXZxJE1pCshiTOcoKyiRebOxTnVF7M+rFd7o3fL1H+fp6QWsPeYSogxuJcz
         BpuIiT6JN0wT8Mx7q33wBtuC98pia7iAEhAoEZCFOOwvqivujLzx/zA+H6uVfgmABBml
         wQXVf2zKWRTM/Kejmhs1eOIO4JcmXik1R/sSicFVKwR+JKRuxHIkiEJ+z+mC19hAt04J
         wJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719481512; x=1720086312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5bsw/bIwpiQtTxDqqa+G2RfEnwKlsaZmclV+a4TWf4=;
        b=lwc3wbF+6Jsg5y+7yc834GMSUab8XE7PQkztXzxnVZsv2okSTCZZg6s5oE4b0x9qy/
         T9746Shw06LPIP8EHpyZxmSDB7opcwQrUKaVuwwFB4tGpej5s+tHyeJw2i6R0t8Kqe0J
         GCUc/VfK0O0AaclmjQTru+P+Ubys77bqZkf6CG8descWK8BO46czcTKIIUDWPRBOr5dA
         rKZ+2aZR66BEbR7lrjn0gt1ATsYV5eIUugaJf4mFX7ZvnI1ddSdypi+JTg1u8Q26bYcq
         1/EnAO9BsWvaPBTRXUuAnpNdWiQtA49OVZZDikEK0EkHu4YqBU7wPb19Wz52MKj6zhpB
         sVEQ==
X-Gm-Message-State: AOJu0YwzEeZXdRhH6wpOJnlQdOwT5FyAG/TGuy5GT4alirX/CwAYa4RL
	FZ7cXCEdExHX9mfwuUTtHE+mkrLiEwbUP/qYYtgqhriHOMJIIqFm
X-Google-Smtp-Source: AGHT+IGs2vCA/H/FFuDyR5glr6eBfRxB5KcllOGQmtGLf27nREEa85kWr5SzDu3hNTlWyIai7dNdoA==
X-Received: by 2002:a17:906:99d5:b0:a72:58c3:2696 with SMTP id a640c23a62f3a-a7296f5d2admr186679466b.14.1719481511468;
        Thu, 27 Jun 2024 02:45:11 -0700 (PDT)
Message-ID: <baac4da598318434e14779ba3f3b55a6e0a6de39.camel@gmail.com>
Subject: Re: [XEN PATCH v2 for-4.19] automation/eclair: add deviations
 agreed in MISRA meetings
From: oleksii.kurochko@gmail.com
To: Stefano Stabellini <sstabellini@kernel.org>, Federico Serafini
	 <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>
Date: Thu, 27 Jun 2024 11:45:10 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406261740560.3635@ubuntu-linux-20-04-desktop>
References: 
	<816b323f5e325784947d09502f9352188bd325cf.1719381829.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406261740560.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-06-26 at 17:41 -0700, Stefano Stabellini wrote:
> On Wed, 26 Jun 2024, Federico Serafini wrote:
> > Update ECLAIR configuration to take into account the deviations
> > agreed during the MISRA meetings.
> >=20
> > While doing this, remove the obsolete "Set [123]" comments.
> >=20
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> release-ack requested
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
>=20
> > ---
> > Changes in v2:
> > - keep sync between deviations.ecl and deviations.rst;
> > - use 'deliberate' tag for all the deviations of R14.3;
> > - do not use the term "project-wide deviation" since it does not
> > add useful
> > =C2=A0 information.
> > ---
> > =C2=A0.../eclair_analysis/ECLAIR/deviations.ecl=C2=A0=C2=A0=C2=A0=C2=A0=
 | 93
> > +++++++++++++++++--
> > =C2=A0docs/misra/deviations.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 81 ++++++++++++++-
> > -
> > =C2=A02 files changed, 158 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index ae2eaf50f7..37cad8bf68 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -1,5 +1,3 @@
> > -### Set 1 ###
> > -
> > =C2=A0#
> > =C2=A0# Series 2.
> > =C2=A0#
> > @@ -23,6 +21,11 @@ Constant expressions and unreachable branches of
> > if and switch statements are ex
> > =C2=A0-config=3DMC3R1.R2.1,reports+=3D{deliberate,
> > "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_
> > RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
> > =C2=A0-doc_end
> > =C2=A0
> > +-doc_begin=3D"The asm-offset files are not linked deliberately,
> > since they are used to generate definitions for asm modules."
> > +-file_tag+=3D{asm_offsets,
> > "^xen/arch/(arm|x86)/(arm32|arm64|x86_64)/asm-offsets\\.c$"}
> > +-config=3DMC3R1.R2.1,reports+=3D{deliberate,
> > "any_area(any_loc(file(asm_offsets)))"}
> > +-doc_end
> > +
> > =C2=A0-doc_begin=3D"Pure declarations (i.e., declarations without
> > initialization) are
> > =C2=A0not executable, and therefore it is safe for them to be
> > unreachable."
> > =C2=A0-config=3DMC3R1.R2.1,ignored_stmts+=3D{"any()", "pure_decl()"}
> > @@ -63,6 +66,12 @@ they are not instances of commented-out code."
> > =C2=A0-
> > config=3DMC3R1.D4.3,reports+=3D{disapplied,"!(any_area(any_loc(file(^xe
> > n/arch/arm/arm64/.*$))))"}
> > =C2=A0-doc_end
> > =C2=A0
> > +-doc_begin=3D"The inline asm in 'arm64/lib/bitops.c' is tightly
> > coupled with the surronding C code that acts as a wrapper, so it
> > has been decided not to add an additional encapsulation layer."
> > +-file_tag+=3D{arm64_bitops, "^xen/arch/arm/arm64/lib/bitops\\.c$"}
> > +-config=3DMC3R1.D4.3,reports+=3D{deliberate,
> > "all_area(any_loc(file(arm64_bitops)&&any_exp(macro(^(bit|test)op$)
> > )))"}
> > +-config=3DMC3R1.D4.3,reports+=3D{deliberate,
> > "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask1
> > 6)))"}
> > +-doc_end
> > +
> > =C2=A0-doc_begin=3D"This header file is autogenerated or empty, therefo=
re
> > it poses no
> > =C2=A0risk if included more than once."
> > =C2=A0-file_tag+=3D{empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
> > @@ -213,10 +222,25 @@ Therefore the absence of prior declarations
> > is safe."
> > =C2=A0-config=3DMC3R1.R8.4,declarations+=3D{safe,
> > "loc(file(asm_defns))&&^current_stack_pointer$"}
> > =C2=A0-doc_end
> > =C2=A0
> > +-doc_begin=3D"The function apei_(read|check|clear)_mce are dead code
> > and are excluded from non-debug builds, therefore the absence of
> > prior declarations is safe."
> > +-config=3DMC3R1.R8.4,declarations+=3D{safe,
> > "^apei_(read|check|clear)_mce\\(.*$"}
> > +-doc_end
> > +
> > =C2=A0-doc_begin=3D"asmlinkage is a marker to indicate that the functio=
n
> > is only used to interface with asm modules."
> > =C2=A0-
> > config=3DMC3R1.R8.4,declarations+=3D{safe,"loc(text(^(?s).*asmlinkage.*
> > $, -1..0))"}
> > =C2=A0-doc_end
> > =C2=A0
> > +-doc_begin=3D"Given that bsearch and sort are defined with the
> > attribute 'gnu_inline', it's deliberate not to have a prior
> > declaration.
> > +See Section \"6.33.1 Common Function Attributes\" of
> > \"GCC_MANUAL\" for a full explanation of gnu_inline."
> > +-file_tag+=3D{bsearch_sort, "^xen/include/xen/(sort|lib)\\.h$"}
> > +-config=3DMC3R1.R8.4,reports+=3D{deliberate,
> > "any_area(any_loc(file(bsearch_sort))&&decl(name(bsearch||sort)))"}
> > +-doc_end
> > +
> > +-doc_begin=3D"first_valid_mfn is defined in this way because the
> > current lack of NUMA support in Arm and PPC requires it."
> > +-file_tag+=3D{first_valid_mfn, "^xen/common/page_alloc\\.c$"}
> > +-
> > config=3DMC3R1.R8.4,declarations+=3D{deliberate,"loc(file(first_valid_m
> > fn))"}
> > +-doc_end
> > +
> > =C2=A0-doc_begin=3D"The following variables are compiled in multiple
> > translation units
> > =C2=A0belonging to different executables and therefore are safe."
> > =C2=A0-config=3DMC3R1.R8.6,declarations+=3D{safe,
> > "name(current_stack_pointer||bsearch||sort)"}
> > @@ -257,8 +281,6 @@ dimension is higher than omitting the
> > dimension."
> > =C2=A0-config=3DMC3R1.R9.5,reports+=3D{deliberate, "any()"}
> > =C2=A0-doc_end
> > =C2=A0
> > -### Set 2 ###
> > -
> > =C2=A0#
> > =C2=A0# Series 10.
> > =C2=A0#
> > @@ -299,7 +321,6 @@ integers arguments on two's complement
> > architectures
> > =C2=A0-config=3DMC3R1.R10.1,reports+=3D{safe,
> > "any_area(any_loc(any_exp(macro(^ISOLATE_LSB$))))"}
> > =C2=A0-doc_end
> > =C2=A0
> > -### Set 3 ###
> > =C2=A0-doc_begin=3D"XEN only supports architectures where signed intege=
rs
> > are
> > =C2=A0representend using two's complement and all the XEN developers ar=
e
> > aware of
> > =C2=A0this."
> > @@ -323,6 +344,49 @@ constant expressions are required.\""
> > =C2=A0# Series 11
> > =C2=A0#
> > =C2=A0
> > +-doc_begin=3D"The conversion from a function pointer to unsigned
> > long or (void *) does not lose any information, provided that the
> > target type has enough bits to store it."
> > +-config=3DMC3R1.R11.1,casts+=3D{safe,
> > +=C2=A0 "from(type(canonical(__function_pointer_types)))
> > +=C2=A0=C2=A0 &&to(type(canonical(builtin(unsigned
> > long)||pointer(builtin(void)))))
> > +=C2=A0=C2=A0 &&relation(definitely_preserves_value)"
> > +}
> > +-doc_end
> > +
> > +-doc_begin=3D"The conversion from a function pointer to a boolean
> > has a well-known semantics that do not lead to unexpected
> > behaviour."
> > +-config=3DMC3R1.R11.1,casts+=3D{safe,
> > +=C2=A0 "from(type(canonical(__function_pointer_types)))
> > +=C2=A0=C2=A0 &&kind(pointer_to_boolean)"
> > +}
> > +-doc_end
> > +
> > +-doc_begin=3D"The conversion from a pointer to an incomplete type to
> > unsigned long does not lose any information, provided that the
> > target type has enough bits to store it."
> > +-config=3DMC3R1.R11.2,casts+=3D{safe,
> > +=C2=A0 "from(type(any()))
> > +=C2=A0=C2=A0 &&to(type(canonical(builtin(unsigned long))))
> > +=C2=A0=C2=A0 &&relation(definitely_preserves_value)"
> > +}
> > +-doc_end
> > +
> > +-doc_begin=3D"Conversions to object pointers that have a pointee
> > type with a smaller (i.e., less strict) alignment requirement are
> > safe."
> > +-config=3DMC3R1.R11.3,casts+=3D{safe,
> > +=C2=A0 "!relation(more_aligned_pointee)"
> > +}
> > +-doc_end
> > +
> > +-doc_begin=3D"Conversions from and to integral types are safe, in
> > the assumption that the target type has enough bits to store the
> > value.
> > +See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\""
> > +-config=3DMC3R1.R11.6,casts+=3D{safe,
> > +=C2=A0=C2=A0=C2=A0
> > "(from(type(canonical(integral())))||to(type(canonical(integral()))
> > ))
> > +=C2=A0=C2=A0=C2=A0=C2=A0 &&relation(definitely_preserves_value)"}
> > +-doc_end
> > +
> > +-doc_begin=3D"The conversion from a pointer to a boolean has a well-
> > known semantics that do not lead to unexpected behaviour."
> > +-config=3DMC3R1.R11.6,casts+=3D{safe,
> > +=C2=A0 "from(type(canonical(__pointer_types)))
> > +=C2=A0=C2=A0 &&kind(pointer_to_boolean)"
> > +}
> > +-doc_end
> > +
> > =C2=A0-doc_begin=3D"Violations caused by container_of are due to pointe=
r
> > arithmetic operations
> > =C2=A0with the provided offset. The resulting pointer is then
> > immediately cast back to its
> > =C2=A0original type, which preserves the qualifier. This use is deemed
> > safe.
> > @@ -354,9 +418,18 @@ activity."
> > =C2=A0-config=3DMC3R1.R14.2,reports+=3D{disapplied,"any()"}
> > =C2=A0-doc_end
> > =C2=A0
> > --doc_begin=3D"The XEN team relies on the fact that invariant
> > conditions of 'if'
> > -statements are deliberate"
> > --config=3DMC3R1.R14.3,statements=3D{deliberate ,
> > "wrapped(any(),node(if_stmt))" }
> > +-doc_begin=3D"The XEN team relies on the fact that invariant
> > conditions of 'if' statements and conditional operators are
> > deliberate"
> > +-config=3DMC3R1.R14.3,statements+=3D{deliberate,
> > "wrapped(any(),node(if_stmt||conditional_operator||binary_condition
> > al_operator))" }
> > +-doc_end
> > +
> > +-doc_begin=3D"Switches having a 'sizeof' operator as the condition
> > are deliberate and have limited scope."
> > +-config=3DMC3R1.R14.3,statements+=3D{deliberate,
> > "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
> > +-doc_end
> > +
> > +-doc_begin=3D"The use of an invariant size argument in
> > {put,get}_unsafe_size and array_access_ok, as defined in
> > arch/x86(_64)?/include/asm/uaccess.h is deliberate and is deemed
> > safe."
> > +-file_tag+=3D{x86_uaccess,
> > "^xen/arch/x86(_64)?/include/asm/uaccess\\.h$"}
> > +-config=3DMC3R1.R14.3,reports+=3D{deliberate,
> > "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^(put|get)_unsaf
> > e_size$))))"}
> > +-config=3DMC3R1.R14.3,reports+=3D{deliberate,
> > "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^array_access_ok
> > $))))"}
> > =C2=A0-doc_end
> > =C2=A0
> > =C2=A0-doc_begin=3D"A controlling expression of 'if' and iteration
> > statements having integer, character or pointer type has a
> > semantics that is well-known to all Xen developers."
> > @@ -527,8 +600,8 @@ falls under the jurisdiction of other MISRA
> > rules."
> > =C2=A0# General
> > =C2=A0#
> > =C2=A0
> > --doc_begin=3D"do-while-0 is a well recognized loop idiom by the xen
> > community."
> > --loop_idioms=3D{do_stmt, "literal(0)"}
> > +-doc_begin=3D"do-while-[01] is a well recognized loop idiom by the
> > xen community."
> > +-loop_idioms=3D{do_stmt, "literal(0)||literal(1)"}
> > =C2=A0-doc_end
> > =C2=A0-doc_begin=3D"while-[01] is a well recognized loop idiom by the x=
en
> > community."
> > =C2=A0-loop_idioms+=3D{while_stmt, "literal(0)||literal(1)"}
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 16fc345756..d682616796 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -63,6 +63,11 @@ Deviations related to MISRA C:2012 Rules:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch statement.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ECLAIR has been configured to ignore t=
hose statements.
> > =C2=A0
> > +=C2=A0=C2=A0 * - R2.1
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The asm-offset files are not linked deliber=
ately, since
> > they are used to
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generate definitions for asm modu=
les.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > +
> > =C2=A0=C2=A0=C2=A0 * - R2.2
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Proving compliance with respect to Rul=
e 2.2 is generally
> > impossible:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 see `<https://arxiv.org/abs/=
2212.13933>`_ for details.
> > Moreover, peer
> > @@ -203,6 +208,26 @@ Deviations related to MISRA C:2012 Rules:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > =C2=A0
> > +=C2=A0=C2=A0 * - R8.4
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Some functions are excluded from non-debug =
build, therefore
> > the absence
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of declaration is safe.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR, such functions=
 are:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - apei_read_mce()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - apei_check_mce()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - apei_clear_mce()
> > +
> > +=C2=A0=C2=A0 * - R8.4
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Given that bsearch and sort are defined wit=
h the attribute
> > 'gnu_inline',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it's deliberate not to have a pri=
or declaration.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See Section \"6.33.1 Common Funct=
ion Attributes\" of
> > \"GCC_MANUAL\" for
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a full explanation of gnu_inline.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R8.4
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - first_valid_mfn is defined in this way beca=
use the current
> > lack of NUMA
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 support in Arm and PPC requires i=
t.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > +
> > =C2=A0=C2=A0=C2=A0 * - R8.6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - The following variables are compiled i=
n multiple
> > translation units
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 belonging to different execu=
tables and therefore are safe.
> > @@ -282,6 +307,39 @@ Deviations related to MISRA C:2012 Rules:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If no bits are set, 0 is ret=
urned.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > =C2=A0
> > +=C2=A0=C2=A0 * - R11.1
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The conversion from a function pointer to u=
nsigned long or
> > (void \*) does
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not lose any information, provide=
d that the target type has
> > enough bits
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to store it.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R11.1
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The conversion from a function pointer to a=
 boolean has a
> > well-known
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics that do not lead to une=
xpected behaviour.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R11.2
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The conversion from a pointer to an incompl=
ete type to
> > unsigned long
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does not lose any information, pr=
ovided that the target
> > type has enough
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits to store it.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R11.3
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Conversions to object pointers that have a =
pointee type
> > with a smaller
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (i.e., less strict) alignment req=
uirement are safe.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R11.6
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Conversions from and to integral types are =
safe, in the
> > assumption that
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the target type has enough bits t=
o store the value.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See also Section \"4.7 Arrays and=
 Pointers\" of
> > \"GCC_MANUAL\"
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R11.6
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The conversion from a pointer to a boolean =
has a well-known
> > semantics
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that do not lead to unexpected be=
haviour.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
> > +
> > =C2=A0=C2=A0=C2=A0 * - R11.8
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Violations caused by container_of are =
due to pointer
> > arithmetic operations
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with the provided offset. Th=
e resulting pointer is then
> > immediately cast back to its
> > @@ -308,8 +366,19 @@ Deviations related to MISRA C:2012 Rules:
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0 * - R14.3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - The Xen team relies on the fact that i=
nvariant conditions
> > of 'if'
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statements are deliberate.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 - Project-wide deviation; tagged as `disappli=
ed` for ECLAIR.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statements and conditional operat=
ors are deliberate.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R14.3
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Switches having a 'sizeof' operator as the =
condition are
> > deliberate and
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 have limited scope.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > +
> > +=C2=A0=C2=A0 * - R14.3
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The use of an invariant size argument in
> > {put,get}_unsafe_size and
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 array_access_ok, as defined in
> > arch/x86(_64)?/include/asm/uaccess.h is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deliberate and is deemed safe.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0 * - R14.4
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A controlling expression of 'if' and i=
teration statements
> > having
> > @@ -475,10 +544,10 @@ Other deviations:
> > =C2=A0=C2=A0=C2=A0 * - Deviation
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Justification
> > =C2=A0
> > -=C2=A0=C2=A0 * - do-while-0 loops
> > -=C2=A0=C2=A0=C2=A0=C2=A0 - The do-while-0 is a well-recognized loop id=
iom used by the
> > Xen community
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and can therefore be used, even t=
hough it would cause a
> > number of
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 violations in some instances.
> > +=C2=A0=C2=A0 * - do-while-0 and do-while-1 loops
> > +=C2=A0=C2=A0=C2=A0=C2=A0 - The do-while-0 and do-while-1 loops are wel=
l-recognized
> > loop idioms used
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by the Xen community and can ther=
efore be used, even though
> > they would
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cause a number of violations in s=
ome instances.
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0 * - while-0 and while-1 loops
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - while-0 and while-1 are well-recognize=
d loop idioms used by
> > the Xen
> > --=20
> > 2.34.1
> >=20


