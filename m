Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A31699E16
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 21:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496768.767642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSl75-0008FK-Ml; Thu, 16 Feb 2023 20:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496768.767642; Thu, 16 Feb 2023 20:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSl75-0008Cx-Hh; Thu, 16 Feb 2023 20:44:19 +0000
Received: by outflank-mailman (input) for mailman id 496768;
 Thu, 16 Feb 2023 20:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhTJ=6M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pSl73-0008Cr-DT
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 20:44:17 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acda162c-ae3a-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 21:44:15 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id t16so7564945edd.10
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 12:44:15 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 l26-20020a170906a41a00b0088991314edesm1229531ejz.7.2023.02.16.12.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 12:44:13 -0800 (PST)
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
X-Inumbo-ID: acda162c-ae3a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MTlmbdwgPwCwyv2ctKWgD4JM7LkeG14BYSM0zgf92vE=;
        b=UcSCCM4DFG9i1RTrgF76JeDtjSAt49FLuchlMjCbrg3CFlaPseT21prDZHvGDH2OvP
         YdmS2t6tO7JVI+gI8zankFmCieZQiTgkgZeNdUSPlbV1cB1sSmo5Pps1qhRBFAtUijec
         fKY7oSHHNcwdcJKJvvs5WF5BOSWz2/cIGLrt6GNNBCXvWrP41pu6bVtlrCbGUEPXvOyT
         ABVIUUdq4D9ZQehVjK1YXWYqiGoXHTvqvPQgOnoVdHg5RWGbpHGLpIlLMd9bAKGghv4K
         yeRrgaDCFWEHqDq3/zUD8TLFk+mpEd+0V+qskR3O4yz8pNhrXH6G36umgfjgTQ6I0iHp
         jTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTlmbdwgPwCwyv2ctKWgD4JM7LkeG14BYSM0zgf92vE=;
        b=BZIgOa3r+NjuRmsktDbTHQUfsweY82xSw3Bc4pOJkVjKheMVeu73MQvOMUXu8WInip
         2MoHpF3FHb8YtB+y/wcfXlvQeVjI3SxTj0FT5du/iIphLcqNoaWipdnXQywsPW+GsRCh
         XIu6duXQsoJdvV2yOQiHccoYbRZWjYxOUrQxM+xWrnk7sonM3zGDdv2FJzI1p2CR1xYE
         Nxh+xnlwVg7X3fyeEkOaRpdHJByXfXKRIZDOw55jMpbyg4Gi9KjxRd2TlcYQWzJk00CS
         r9fqa8OQGSKmISIGEp728lpA5DtsrZUk73RsLgUOXy0nb9VFe/nh/wLcRwYo+Z34TzI8
         3bag==
X-Gm-Message-State: AO0yUKXnl1usw2TUNxKSghCbfybH6C+N3W74N8q6Wb0gDqc59uhcZOrx
	TZUev5maGvshpk1Vj860XA4=
X-Google-Smtp-Source: AK7set+e5hkyH8/oXipt0xcwehIUcgrKl08m64ExV6ssh4dfGJz2hgwJNcm6AuXxH2qTb1L9BYGsQQ==
X-Received: by 2002:a17:907:174d:b0:880:3129:d84a with SMTP id lf13-20020a170907174d00b008803129d84amr7392342ejc.60.1676580254347;
        Thu, 16 Feb 2023 12:44:14 -0800 (PST)
Message-ID: <e00086a6b0494d30f61e295e690ecaf0aa19c4e7.camel@gmail.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 16 Feb 2023 22:44:12 +0200
In-Reply-To: <4c52d703-dd7c-b316-5e37-38c9aa705725@citrix.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
	 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
	 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
	 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
	 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
	 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
	 <413b6d1439a31e24719321494971cc165bd6942c.camel@gmail.com>
	 <29623e829602d0a7861785b8f0a47d6905ac89c4.camel@gmail.com>
	 <4c52d703-dd7c-b316-5e37-38c9aa705725@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-02-16 at 12:19 +0000, Andrew Cooper wrote:
> On 16/02/2023 12:09 pm, Oleksii wrote:
> > On Thu, 2023-02-16 at 12:44 +0200, Oleksii wrote:
> > > On Thu, 2023-02-16 at 08:31 +0100, Jan Beulich wrote:
> > > > On 15.02.2023 18:59, Oleksii wrote:
> > > > > Hello Jan and community,
> > > > >=20
> > > > > I experimented and switched RISC-V to x86 implementation. All
> > > > > that
> > > > > I
> > > > > changed in x86 implementation for RISC-V was
> > > > > _ASM_BUGFRAME_TEXT.
> > > > > Other
> > > > > things are the same as for x86.
> > > > >=20
> > > > > For RISC-V it is fine to skip '%c' modifier so
> > > > > _ASM_BUGFRAME_TEXT
> > > > > will
> > > > > look like:
> > > > >=20
> > > > > #define _ASM_BUGFRAME_TEXT(second_frame) \
> > > > > =C2=A0=C2=A0=C2=A0 ".Lbug%=3D: ebreak\n"=C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0 ".pushsection .bug_frames.%[bf_type], \"a\", @=
progbits\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".p2align 2\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".Lfrm%=3D:\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".long (.Lbug%=3D - .Lfrm%=3D) + %[bf_line_hi]=
\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".long (%[bf_ptr] - .Lfrm%=3D) + %[bf_line_lo]=
\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".if " #second_frame "\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".long 0, %[bf_msg] - .Lfrm%=3D\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".endif\n"
> > > > > =C2=A0=C2=A0=C2=A0 ".popsection\n"
> > > > I expect this could be further abstracted such that only the
> > > > actual
> > > > instruction is arch-specific.
> > > Generally, the only thing that can't be abstracted ( as you
> > > mentioned
> > > is an instruction ).
> > >=20
> > > So we can make additional defines:
> > > =C2=A0 1. #define MODIFIER "" or "c" (depends on architecture) and us=
e
> > > it
> > > =C2=A0
> > > the following way:
> > > =C2=A0 =C2=A0".pushsection .bug_frames.%"MODIFIER"[bf_type], \"a\",
> > > @progbits\n"
> > > =C2=A0 =C2=A0...
> > > =C2=A0 2. #define BUG_INSTR "ebreak" | "ud2" | "..." and use it in th=
e
> > > following way:
> > > =C2=A0 =C2=A0".Lbug%=3D: "BUG_ISNTR"\n"
> > > =C2=A0 =C2=A0...
> > > Except for these defines which should be specified for each
> > > architecture
> > > all other code will be the same for all architectures.
> > >=20
> > > But as I understand with modifier 'c' can be issues that not all
> > > compilers support but for ARM and =C2=A0x86 before immediate is
> > > present
> > > punctuation # or $ which are removed by modifier 'c'. And I am
> > > wondering what other ways to remove punctuation before immediate
> > > exist.
> > >=20
> > > Do you think we should consider that as an issue?
> > >=20
> > > > > The only thing I am worried about is:
> > > > >=20
> > > > > #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
> > > > > =C2=A0 [bf_type] "i" (type), ...
> > > > > because as I understand it can be an issue with 'i' modifier
> > > > > in
> > > > > case of
> > > > > PIE. I am not sure that Xen enables PIE somewhere but
> > > > > still...
> > > > > If it is not an issue then we can use x86 implementation as a
> > > > > generic
> > > > > one.
> > > > "i" is not generally an issue with PIE, it only is when the
> > > > value
> > > > is
> > > > the
> > > > address of a symbol. Here "type" is a constant in all cases.
> > > > (Or
> > > > else
> > > > how would you express an immediate operand of an instruction in
> > > > an
> > > > asm()?)
> > > Hmm. I don't know other ways to express an immediate operand
> > > except
> > > 'i'.
> > >=20
> > > It looks like type, line, msg are always 'constants'=C2=A0
> > > (
> > > they possibly can be passed without 'i' and used directly inside
> > > asm():
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0 ".pushsection .bug_frames." __stringify(type) ", \"a\",
> > > %progbits\n"\
> > > =C2=A0=C2=A0 ...
> > > ) but the issue will be with 'ptr' for which we have to use 'i'.
> > >=20
> > > And I am not sure about all 'constants'. For example, I think
> > > that it
> > > can be an issue with 'line' =3D '((line & ((1 << BUG_LINE_LO_WIDTH)
> > > -
> > > 1))
> > > << BUG_DISP_WIDTH)' if we will use that directly inside asm(...).
> > >=20
> > I think we can avoid 'i' by using 'r' + some kind of mov
> > instruction to
> > write a register value to memory. The code below is pseudo-code:
> > #define _ASM_BUGFRAME_TEXT(second_frame)
> > =C2=A0=C2=A0 =C2=A0...
> > =C2=A0=C2=A0=C2=A0 "loc_disp:\n"
> > =C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0 .long 0x0"
> > =C2=A0=C2=A0=C2=A0 "mov [loc_disp], some_register"
> > =C2=A0=C2=A0=C2=A0 ...
> > And the we have to define mov for each architecture.
>=20
> No, you really cannot.=C2=A0 This is the asm equivalent of writing
> something
> like this:
>=20
> static struct bugframe __section(.bug_frames.1) foo =3D {
> =C2=A0=C2=A0=C2=A0 .loc =3D insn - &foo + LINE_LO,
> =C2=A0=C2=A0=C2=A0 .msg =3D "bug string" - &foo + LINE_HI,
> };
>=20
> It is a data structure, not executable code.
Thanks for the clarification.

What about mainly using C for BUG_FRAME and only allocating bug_frame
sections in assembly?

Please look at POC below:


#include <stdio.h>
#include <stdint.h>

#define BUG_DISP_WIDTH    24
#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)

struct bug_frame {
    signed int loc_disp:BUG_DISP_WIDTH;
    unsigned int line_hi:BUG_LINE_HI_WIDTH;
    signed int ptr_disp:BUG_DISP_WIDTH;
    unsigned int line_lo:BUG_LINE_LO_WIDTH;
    signed int msg_disp[];
};

#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) & \
                       ((1 << BUG_LINE_HI_WIDTH) - 1)) << \
                      BUG_LINE_LO_WIDTH) + \
                     (((b)->line_lo + ((b)->ptr_disp < 0)) &         =20
\
                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])

#define ALLOCATE_BF_SECTION(has_msg) do {                            \
    asm (".pushsection bug_frames                  \n"               =20
\
         ".long 0, 0 \n"                                             =20
\
        ".if " #has_msg "\n"                                         =20
\
         "\t.long 0 \n"                                              =20
\
         "\t.long 0 \n"                                              =20
\
         ".endif\n"                                                  =20
\
         ".popsection" );                                            =20
\
} while (0)

#define MERGE_(a,b)  a##b
#define UNIQUE_BUG_INSTR_LABEL(a) MERGE_(unique_name_, a)

#define BUG_FRAME(type, line, file, has_msg, msg) do {               =20
\
    unsigned int line_lo =3D (((line) >> BUG_LINE_LO_WIDTH) <<
BUG_DISP_WIDTH);                                                     =20
\
    unsigned int line_hi =3D ((line & ((1 << BUG_LINE_LO_WIDTH) - 1)) <<
BUG_DISP_WIDTH);                                                     =20
\
    ALLOCATE_BF_SECTION(1);                                          =20
\
    *(signed int *)(&bug_frames) =3D (unsigned long)
&&UNIQUE_BUG_INSTR_LABEL(line) - (unsigned long)&bug_frames + line_lo;
\
    *((signed int *)(&bug_frames) + 1) =3D (unsigned long)file -
(unsigned long)&bug_frames +  line_hi;                               =20
\
    bug_var.msg_disp[1] =3D (signed int)((unsigned long)#msg - (unsigned
long)&bug_frames);                                                   =20
\
    UNIQUE_BUG_INSTR_LABEL(line):                                    =20
\
        asm volatile ("nop");                                        =20
} while (0)

extern char bug_frames[];

static struct bug_frame bug_var __attribute__((section("bug_frames")));

int main() {
    BUG_FRAME(1, __LINE__, __FILE__, 1, "TEST");

    printf("bug_loc: %p\n", bug_loc(&bug_var));
    printf("bug_ptr: 0x%x\n", bug_ptr(&bug_var));
    printf("__FILE__: %s\n", (char *)bug_ptr(&bug_var));
    printf("bug_line: %d\n", bug_line(&bug_var));
    printf("msg: %s\n", bug_msg(&bug_var));

    BUG_FRAME(1, __LINE__, __FILE__, 1, "NEW TEST");

    printf("bug_loc: %p\n", bug_loc(&bug_var));
    printf("bug_ptr: 0x%x\n", bug_ptr(&bug_var));
    printf("__FILE__: %s\n", (char *)bug_ptr(&bug_var));
    printf("bug_line: %d\n", bug_line(&bug_var));
    printf("msg: %s\n", bug_msg(&bug_var));

    return 0;
}

Do you think it makes any sense? In this case, all BUG_FRAME can be re-
used among all architectures, and only bug instructions should be
changed.

>=20
> ~Andrew
~ Oleksii

