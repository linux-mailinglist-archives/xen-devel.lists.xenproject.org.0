Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873D677F69
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483010.748881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyZl-0004TY-FX; Mon, 23 Jan 2023 15:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483010.748881; Mon, 23 Jan 2023 15:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyZl-0004R6-Bl; Mon, 23 Jan 2023 15:17:37 +0000
Received: by outflank-mailman (input) for mailman id 483010;
 Mon, 23 Jan 2023 15:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJyZj-0004Qy-AK
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:17:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdae306-9b31-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:17:34 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id l8so9279961wms.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:17:34 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b003d35acb0fd7sm11047915wmb.34.2023.01.23.07.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:17:33 -0800 (PST)
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
X-Inumbo-ID: 0fdae306-9b31-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ajxs1wqVGy4VyBnUzuMAw1pH+VeDislQpXThvlQnrN4=;
        b=Rm+AtL4NtoLbFyjH6O8UdNoGuXzjdXqd48OgnQ8DDM3S7fLM8rJ1vsHpC8rO1R/vlS
         M3wniqFNeXlm75R9uaVBFHGPMlH1VEaJQM+EUQCnNTIYmvoDzl1zq5jWqmNV84HytHdb
         pcfeNpupFyL4KUbphh9XYfjzvwoCbYPfQZPls3ps0Z8++a7fOX0Jo743yhH8MSbHdC5F
         yBQEOUi3ZYSVRvZmpcvsxXFuP+6rqDEqh+iG72yS2DesrTe+WdKfYDk6nNOujQNWKcab
         McHdLsbNTod6bpjA15hwDA/0kZ5Zhn8oOnCVHMnTljzQYzSa2sXL4Vm8YVCDrf7++rL8
         6Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajxs1wqVGy4VyBnUzuMAw1pH+VeDislQpXThvlQnrN4=;
        b=Quc2x+oIfoieRALMoI24x+KWvlDzkszJNt2OtczRz+5HTgV5O0QwZxXiA2e9l403br
         04lmy5nGnJQDg8NOxDZNp58q6g//krecpVZm+8JBI91X3OhfuAPMnXlaR+kkPUctJb1P
         4ggMjjw6kiPUhkYJCnB8a/vgx1zb55fnuLwbhw5P5rckkxspDliUHDj+GObNeZ1aMMQq
         y1/D00iBEvC15Az/GlIyGaQYnEN8QxTo/vZcFxbv4IJbRBRHf/NHMufZzYXE0Yq50Ad8
         u+G2jEZsXgucAZzPwQ26GnEHITUKOk5xWLVnteYehjF5J+tZD7rzDkExmLMpsB13esrU
         h7hQ==
X-Gm-Message-State: AFqh2kp3Wx81l3fJ0kCahGSYuNgABGr/aYKfwnGa3C46BR1r+AXZ8AMy
	fLyohZu0VL65tnYjME0Vr9Y=
X-Google-Smtp-Source: AMrXdXu5uNAOnXEEEShUq+GA+FPUkrlkgf2LXOeXXj/TvMc/hY11jS3TpYI0+f/CglkLZjpa3xf9yg==
X-Received: by 2002:a05:600c:3d96:b0:3db:26b7:2fc8 with SMTP id bi22-20020a05600c3d9600b003db26b72fc8mr15410085wmb.39.1674487053554;
        Mon, 23 Jan 2023 07:17:33 -0800 (PST)
Message-ID: <ea3c256c0f5a7f09a2504c548e649a0cf0edcb43.camel@gmail.com>
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 23 Jan 2023 17:17:32 +0200
In-Reply-To: <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
	 <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 11:50 +0000, Andrew Cooper wrote:
> On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
> > new file mode 100644
> > index 0000000000..f7d46f42bb
> > --- /dev/null
> > +++ b/xen/arch/riscv/entry.S
> > @@ -0,0 +1,97 @@
> > +#include <asm/asm.h>
> > +#include <asm/processor.h>
> > +#include <asm/riscv_encoding.h>
> > +#include <asm/traps.h>
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .global handle_exception
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align 4
> > +
> > +handle_exception:
>=20
> ENTRY() which takes care of the global and the align.
>=20
> Also, you want a size and type at the end, just like in head.S=C2=A0
> (Sorry,
> we *still* don't have any sane infrastructure for doing that nicely.=C2=
=A0
> Opencode it for now.)
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Exceptions from xen */
> > +save_to_stack:
>=20
> This label isn't used at all, is it?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Save context to stack */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 sp, (RISC=
V_CPU_USER_REGS_OFFSET(sp) -
> > RISCV_CPU_USER_REGS_SIZE) (sp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 sp, =
sp, -RISCV_CPU_USER_REGS_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 t0, RISCV=
_CPU_USER_REGS_OFFSET(t0)(sp)
>=20
> Exceptions on RISC-V don't adjust the stack pointer.=C2=A0 This logic
> depends
> on interrupting Xen code, and Xen not having suffered a stack
> overflow
> (and actually, that the space on the stack for all registers also
> doesn't overflow).
>=20
> Which might be fine for now, but I think it warrants a comment
> somewhere
> (probably at handle_exception itself) stating the expectations while
> it's still a work in progress.=C2=A0 So in this case something like:
>=20
> /* Work-in-progress:=C2=A0 Depends on interrupting Xen, and the stack
> being
> good. */
>=20
>=20
> But, do we want to allocate stemp right away (even with an empty
> struct), and get tp set up properly?
>=20
I am not sure that I get you here about stemp. Could you please clarify
a little bit.

> That said, aren't we going to have to rewrite this when enabling H
> mode
> anyway?
I based these code on a code from Bobby's repo ( on top of which with
some additional patches I've successfully ran Dom0 ) so I am not sure
that it will be re-written.
Probably I don't understand about which one part you are talking about.

Regarding H mode if to be honest I didn't see where it is switched to
it.
Maybe Bobby or Alistair can explain me?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 save_context
> > +
> > +save_context:
>=20
> I'd drop this.=C2=A0 It's a nop right now.
>=20
> > <snip>
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrr=C2=A0=C2=A0=C2=A0 t0, =
CSR_SEPC
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 t0, RISCV=
_CPU_USER_REGS_OFFSET(sepc)(sp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrr=C2=A0=C2=A0=C2=A0 t0, =
CSR_SSTATUS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 t0, RISCV=
_CPU_USER_REGS_OFFSET(sstatus)(sp)
>=20
> So something I've noticed about CSRs through this series.
>=20
> The C CSR macros are set up to use real CSR names, but the CSR_*
> constants used in C and ASM are raw numbers.
>=20
> If we're using raw numbers, then the C CSR accessors should be static
> inlines instead, but the advantage of using names is the toolchain
> can
> issue an error when we reference a CSR not supported by the current
> extensions.
>=20
> We ought to use a single form, consistently through Xen.=C2=A0 How
> feasible
> will it be to use names throughout?
>=20
> ~Andrew


