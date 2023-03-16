Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1516BC4D9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 04:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510301.787728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pceX4-0002wm-UC; Thu, 16 Mar 2023 03:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510301.787728; Thu, 16 Mar 2023 03:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pceX4-0002tc-Qp; Thu, 16 Mar 2023 03:44:02 +0000
Received: by outflank-mailman (input) for mailman id 510301;
 Thu, 16 Mar 2023 03:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFGE=7I=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1pceX3-0002tW-8K
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 03:44:01 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c87dd470-c3ac-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 04:43:58 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id z42so278289ljq.13
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 20:43:58 -0700 (PDT)
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
X-Inumbo-ID: c87dd470-c3ac-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678938238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fRYWT6d7bt8Rna5CuthzM+zPUR5GgojER/C/3hTIBDM=;
        b=dNatpFOr7+Xq+r+jwerMeZIj6+y9FRXZjPK5MI4ohQmkZZhJbxnIPmNgezG212Qzsf
         RqqeyqoQ9gAplE3j9KR9SDyphFEph36esibzS5pubaefpvSlXlcYDoFX69twU70F7xYx
         /cb/xz9KNN1iu0lQsLQgAlzF7XT5FCcrUkjdjpAdGqsPe/MWQxjWqmhKcHYEyjoFdYm9
         JPYd59ITRQqlXoPAhD60Dofh5eDoOy7ekzp4WYXjT3+cN7TUQ+SMZYpwc3nbPcqzXQEN
         G+UE4OP5NTI64ytMOT7Fr8Z55mSS+Iye/Z5iIHXMjXCdrWMNilJAjC6E4kIzBzvxOBMb
         L+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678938238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRYWT6d7bt8Rna5CuthzM+zPUR5GgojER/C/3hTIBDM=;
        b=MZvggJr3JneZQCkZTvXIwWQ9UiCcH1tH1MZef84eKoA1cqDxUi42exsgBOLAqK37/9
         caFxhCxl5ZjD5A7GdahHggyxWY4bLitVr2NiNMjqtXWGHGHf08IFxlw+UktQ5hVmoxwO
         XNAP6fVcPjX49ENiLErFQNXS5jJAOxHGvgULRR7KVai6XrB2tdVP4bfkQWFrFoJi2mYE
         pzB9u/ClyUQgo7Xw3pyP5+bbesVJGkg9GI1PE9qNOrDBFuoF2oAjiZr80+4USfE1awMD
         GiqZuRnKKx5jSQV/NR24dqls1+cEITxLEecmqOppJzVcWII5dRXp7KWYQhYdyAJt7VpQ
         ZR9w==
X-Gm-Message-State: AO0yUKV7PSNFdTR4Ienzi2DEERqTgxIBGbfb2Yykqz4cBpl7F7sasxkz
	J25kxLD2raxMjC28KNllmOhrXVzM5PXFa3ytTrE=
X-Google-Smtp-Source: AK7set9AG9XUfqHapwPU1YDnL3AklIF/rrVhA+Zs8mj60a5XdsVMwm7p1Vs4Nfnxv33JJNb6hnek384jk4ly0IdRTPk=
X-Received: by 2002:a2e:b5d8:0:b0:295:bb34:9c2 with SMTP id
 g24-20020a2eb5d8000000b00295bb3409c2mr1594511ljn.10.1678938237777; Wed, 15
 Mar 2023 20:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230315185121.665635-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230315185121.665635-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 15 Mar 2023 20:43:46 -0700
Message-ID: <CAJ=z9a0QHMhg7K+8Yz=Oq2CSEHc_w1BMrkXKhi-LtbQnTrvBrQ@mail.gmail.com>
Subject: Re: [PATCH] xen/riscv: Fix build with GCC 10
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000004339ff05f6fc456d"

--0000000000004339ff05f6fc456d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Mar 2023 at 11:52, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

>   riscv64-linux-gnu-gcc -MMD -MP -MF arch/riscv/.early_printk.o.d
> -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes
> -Wdeclaration-after-statement -Wno-unused-but-set-variable
> -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc
> -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wv=
la
> -pipe -D__XEN__ -include ./include/xen/config.h -Wa,--strip-local-absolut=
e
> -g -mabi=3Dlp64  -I./include -I./arch/riscv/include -march=3Drv64gc
> -mstrict-align -mcmodel=3Dmedany   -c arch/riscv/early_printk.c -o
> arch/riscv/early_printk.o
>   arch/riscv/early_printk.c:18:2: error: #error "early_*() can be called
> from head.S with MMU-off"
>      18 | #error "early_*() can be called from head.S with MMU-off"
>         |  ^~~~~
>
>   $ riscv64-linux-gnu-gcc --version
>   riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
>
> The binary is otherwise correct, so remove the incorrect check.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
>
> I was honestly hoping to leave this to some poor sole in the future.
>
> But the irony of this check, after all the argument it caused, breaking t=
he
> very case it was trying to enforce, speaks volumes.


I appreciate you dislike this check. But I think the fact it gets triggered
proved its effectiveness rather than the other way around.

From a brief look online, the define is meant to be present with medany. So
I think some digging would be worth here as this may indicate another
latent issue either on the command line or the compiler.

(I would like to point out that Linux has the exact same check. So why
would it work there but not in Xen?)

Cheers,




> =E2=80=94=E2=80=94
>  xen/arch/riscv/early_printk.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.=
c
> index dfe4ad77e25d..b66a11f1bc1a 100644
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -7,17 +7,6 @@
>  #include <asm/early_printk.h>
>  #include <asm/sbi.h>
>
> -/*
> - * When the MMU is off during early boot, any C function called has to
> - * use PC-relative rather than absolute address because the physical
> address
> - * may not match the virtual address.
> - *
> - * To guarantee PC-relative address cmodel=3Dmedany should be used
> - */
> -#ifndef __riscv_cmodel_medany
> -#error "early_*() can be called from head.S with MMU-off"
> -#endif
> -
>  /*
>   * TODO:
>   *   sbi_console_putchar is already planned for deprecation
> --
> 2.30.2
>
>
>

--0000000000004339ff05f6fc456d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 15 Mar 2023 at 11:52, Andrew Cooper &lt;<a href=3D"=
mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">=C2=A0 riscv64-linux-gnu-gcc -MMD -MP -MF arch/ri=
scv/.early_printk.o.d -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -W=
strict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variabl=
e -Wno-unused-local-typedefs=C2=A0 =C2=A0-O1 -fno-omit-frame-pointer -nostd=
inc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -=
Wvla -pipe -D__XEN__ -include ./include/xen/config.h -Wa,--strip-local-abso=
lute -g -mabi=3Dlp64=C2=A0 -I./include -I./arch/riscv/include -march=3Drv64=
gc -mstrict-align -mcmodel=3Dmedany=C2=A0 =C2=A0-c arch/riscv/early_printk.=
c -o arch/riscv/early_printk.o<br>
=C2=A0 arch/riscv/early_printk.c:18:2: error: #error &quot;early_*() can be=
 called from head.S with MMU-off&quot;<br>
=C2=A0 =C2=A0 =C2=A018 | #error &quot;early_*() can be called from head.S w=
ith MMU-off&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 ^~~~~<br>
<br>
=C2=A0 $ riscv64-linux-gnu-gcc --version<br>
=C2=A0 riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110<br>
<br>
The binary is otherwise correct, so remove the incorrect check.<br>
<br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
---<br>
CC: Bob Eshleman &lt;<a href=3D"mailto:bobbyeshleman@gmail.com" target=3D"_=
blank">bobbyeshleman@gmail.com</a>&gt;<br>
CC: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=
=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
CC: Connor Davis &lt;<a href=3D"mailto:connojdavis@gmail.com" target=3D"_bl=
ank">connojdavis@gmail.com</a>&gt;<br>
<br>
I was honestly hoping to leave this to some poor sole in the future.<br>
<br>
But the irony of this check, after all the argument it caused, breaking the=
<br>
very case it was trying to enforce, speaks volumes.</blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">I appreciate you dislike this check. But=
 I think the fact it gets triggered proved its effectiveness rather than th=
e other way around.</div><div dir=3D"auto"><br></div><div dir=3D"auto">From=
 a brief look online, the define is meant to be present with medany. So I t=
hink some digging would be worth here as this may indicate another latent i=
ssue either on the command line or the compiler.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">(I would like to point out that Linux has the exac=
t same check. So why would it work there but not in Xen?)</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>=E2=80=94=E2=80=94<br>
=C2=A0xen/arch/riscv/early_printk.c | 11 -----------<br>
=C2=A01 file changed, 11 deletions(-)<br>
<br>
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c<=
br>
index dfe4ad77e25d..b66a11f1bc1a 100644<br>
--- a/xen/arch/riscv/early_printk.c<br>
+++ b/xen/arch/riscv/early_printk.c<br>
@@ -7,17 +7,6 @@<br>
=C2=A0#include &lt;asm/early_printk.h&gt;<br>
=C2=A0#include &lt;asm/sbi.h&gt;<br>
<br>
-/*<br>
- * When the MMU is off during early boot, any C function called has to<br>
- * use PC-relative rather than absolute address because the physical addre=
ss<br>
- * may not match the virtual address.<br>
- *<br>
- * To guarantee PC-relative address cmodel=3Dmedany should be used<br>
- */<br>
-#ifndef __riscv_cmodel_medany<br>
-#error &quot;early_*() can be called from head.S with MMU-off&quot;<br>
-#endif<br>
-<br>
=C2=A0/*<br>
=C2=A0 * TODO:<br>
=C2=A0 *=C2=A0 =C2=A0sbi_console_putchar is already planned for deprecation=
<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000004339ff05f6fc456d--

