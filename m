Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52C986FB6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805066.1216083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkaK-0007Ri-6s; Thu, 26 Sep 2024 09:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805066.1216083; Thu, 26 Sep 2024 09:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkaK-0007Pa-4G; Thu, 26 Sep 2024 09:14:52 +0000
Received: by outflank-mailman (input) for mailman id 805066;
 Thu, 26 Sep 2024 09:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stkaI-0007PU-6W
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:14:50 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7290f7e-7be7-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:14:49 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-27b7a1480bdso402481fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 02:14:49 -0700 (PDT)
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
X-Inumbo-ID: c7290f7e-7be7-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727342087; x=1727946887; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5gG6fhu4buAtmFvVnDfQ7flK/OgXDfJClAomXu2XPU=;
        b=S1Gy0vZhyNzkr7t9upObI2Veu1tsgzWBjBA8sgEcymTYW0E3PEJ26nAne0ZRL9rurV
         GEJqpgHjC89jc+I/pM0eacH2ZqA3/sNBmy96LszP6YvCmHPHgf8uvdvDhX7Nln0ktCko
         IA4JwBLua45LyBN4aw/cSY6aDxkGCb0pTM41c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342087; x=1727946887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5gG6fhu4buAtmFvVnDfQ7flK/OgXDfJClAomXu2XPU=;
        b=IscjypFnQytvIMqT+47a4d+p0VXRPQ1FzLj4KXrNPjRS0F02k11JJjNuWDa4V776kQ
         UczbOxIIR7KSGlRbLZ6gop5RYzVNwRZHpw31zjMM6+7PEEVKnJvrBjvf6WkPCrDreKQA
         xgHtOoYS3FkQR1+idPg18+ALc7eAVyh3/ch88y5sWDX6CDVvfuxpv2etaTq43394+C4Y
         mqXJcrYDkYY1sYo1Wn61BItEgwN4UcyHfTQSiRGUwd7DzwEcydWAeNc5WFKGI+nNW2LC
         J3FgII4BBQDQPJMmgwX+PaQH3acMJTzdGD5/5g5bRqhA6vl7y3zC7ADDPmlLlDn6BpT6
         NG8A==
X-Gm-Message-State: AOJu0YwTkgvPZXCNNlZ6QuGw/0tORvq/I3kcKkffY1vifSH9Afgpe9Uk
	rz0XAQZYcmEMztpcPnNw678o3sUU++f7yKtXeqeln7xrDgNnNbVrPHSvCIGFxPpd2JRqWBvacB9
	IujmSin25/B5358I3M5xP2n6/0Ngc1LOCmqrgcQ==
X-Google-Smtp-Source: AGHT+IG68VxOX9dFKY6cmu4Ykx5tsHNEVQbpfa8BmN2B/mv5Eoqxc26r1trZfM4qcI9iOxcQasrUejedcawUOVRnwUg=
X-Received: by 2002:a05:6870:392a:b0:261:1b66:5ab1 with SMTP id
 586e51a60fabf-286e141f049mr4272065fac.21.1727342087475; Thu, 26 Sep 2024
 02:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-4-frediano.ziglio@cloud.com> <70416976-c18a-425d-95f0-ab218e101113@citrix.com>
In-Reply-To: <70416976-c18a-425d-95f0-ab218e101113@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Sep 2024 10:14:36 +0100
Message-ID: <CACHz=ZgSzBgxSgPzGJ-gkE9yCcPFx8jeX-Le9aHK+ROYff6nhQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:20=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 25/09/2024 7:01 am, Frediano Ziglio wrote:
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index 2d2f56ad22..859f7055dc 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -252,36 +243,30 @@ __efi64_mb2_start:
> > <snip>
> >
> >          /* We are on EFI platform and EFI boot services are available.=
 */
> >          incb    efi_platform(%rip)
> > @@ -291,77 +276,6 @@ __efi64_mb2_start:
> >           * be run on EFI platforms.
> >           */
> >          incb    skip_realmode(%rip)
>
> Well, these are two unfounded assumptions about the compile-time
> defaults of certain variables.
>
> Lets fix it afterwards, to save interfering with this series.
>
> > diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi=
2.c
> > new file mode 100644
> > index 0000000000..89c562cf6a
> > --- /dev/null
> > +++ b/xen/arch/x86/efi/parse-mbi2.c
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> GPL-2.0-only.  The unsuffixed form is deprecated now.
>
> > +
> > +#include <xen/efi.h>
> > +#include <xen/init.h>
> > +#include <xen/multiboot2.h>
> > +#include <asm/asm_defns.h>
> > +#include <asm/efi.h>
> > +
> > +const char * asmlinkage __init
> > +efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
> > +{
> > +    const multiboot2_tag_t *tag;
> > +    EFI_HANDLE ImageHandle =3D NULL;
> > +    EFI_SYSTEM_TABLE *SystemTable =3D NULL;
> > +    const char *cmdline =3D NULL;
> > +    bool have_bs =3D false;
> > +
> > +    if ( magic !=3D MULTIBOOT2_BOOTLOADER_MAGIC )
> > +        return "ERR: Not a Multiboot2 bootloader!";
> > +
> > +    /* Skip Multiboot2 information fixed part. */
> > +    tag =3D _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN)=
);
> > +
> > +    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
> > +            && tag->type !=3D MULTIBOOT2_TAG_TYPE_END;
>
> && on previous line.
>
> But, this can move into the switch statement and reduce the for()
> expression somewhat.
>

I forgot to reply this, I even though about what to write.
There are multiple reasons:
- having now a switch, it would require a goto/label or an additional
variable to exit the loop, unless I change all other case to continue
and have 2 breaks, either cases not much improving in my opinion;
- that specific part of the for loop is checking for termination and
that condition is doing exactly this;
- there are multiple instances of this kind of loop, and I was
thinking of adding a macro to simplify and reuse that loop so that
form is more suitable to do it.

... omissis ...

Frediano

