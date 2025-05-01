Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02FAAA5F05
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 15:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974133.1362076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uATde-0006Cf-Mj; Thu, 01 May 2025 13:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974133.1362076; Thu, 01 May 2025 13:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uATde-0006AE-J8; Thu, 01 May 2025 13:07:42 +0000
Received: by outflank-mailman (input) for mailman id 974133;
 Thu, 01 May 2025 13:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Eah=XR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uATdd-0006A8-0H
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 13:07:41 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb2c26e-268d-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 15:07:30 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4032f863d20so280570b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 06:07:30 -0700 (PDT)
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
X-Inumbo-ID: 3cb2c26e-268d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746104849; x=1746709649; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMVaJbvW1c/t9ObxweHk7a2muzcHmtppOv1iFZiigw8=;
        b=ILHigeOPti3CJSSQxcAZoQIb5o0jdwUWUT51hAZtAKDZhDPlTsqbK2+MUSmzx9/hdb
         +o6DRBRwEzT/25VPoFOJhlL9tuY00ftC8Yu3ZAw2PzP6TYIyJGdP/u1JFxlygB/q3Zxj
         YYrmqSEc29MT8VoC+PV7aEpm/5k4ngLNEVA6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746104849; x=1746709649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMVaJbvW1c/t9ObxweHk7a2muzcHmtppOv1iFZiigw8=;
        b=WReenF62vgxMXNxhgoNPn7ukBItP+IhD28iI+Blzop8Wtcg92vsvWEQYe61udzMMux
         GIqZuxU0MbcZZpj4LtIlmg3AS7lPu+AyDME3b478GokfXy17FvIW15fWuMZFGVH8Czkz
         UjkRzqW7pS20/T4zjwxlGQZtkpuYZjuZF8DSXGmlUu+iMMh+TCZ5SqKIrcKFh16h9HjX
         z+wH/jjYnweR9ldrnWiR/+0FzsopWclH0gfjU8wGShFvGAe461hNFIhM+whsXglNBtZR
         2vmqL+KxIHY5tXrdempn5fwCol4JpenQzfGknryJA6pCIwLR39iq/en9H5sh3I9yafYC
         TC0A==
X-Gm-Message-State: AOJu0Yx2b/HmY3ptJLJmhKBct05AHKWifLM2tmCo0BAFd2aAVf0vEWdZ
	nCXv0mJ34rWIYdj9k+a5YwNZLhAvYHHEXWJtL1W9mfGvNkv8xvgvBQrdVlnKa8MjyS2Q6iEmMma
	KfuxE5j3V/Yq/fAbdGRnT9m+e/OVcV6urglRp4A==
X-Gm-Gg: ASbGncvKJ8tJuLh/arV9cWIPvqLZrDqU2/SDU703Rvn2VeJgQctT5PBbZsmStVhDgkX
	jLcclSHAw3FdoBdshla0+OOBu+F49Z2N24uujHmkKP/CpdAFdYxr+c2IyhaXhnRPiZfXU9K4dFL
	GawVk3QEbZr2DTJHyVbWW8EfFPgCJF4WOl
X-Google-Smtp-Source: AGHT+IE8FIUPP7YYZDSn3NECWR/FaVZOJhjWlTuvuBrS8+UpYxMO8Z+akDahkdJ7SJxG/k/j5deWCPpj/V4Jd+oqIGM=
X-Received: by 2002:a05:6808:2f14:b0:403:3814:7547 with SMTP id
 5614622812f47-40338147576mr921715b6e.11.1746104849156; Thu, 01 May 2025
 06:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250501122322.230599-1-gerald.elder-vass@cloud.com>
In-Reply-To: <20250501122322.230599-1-gerald.elder-vass@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 1 May 2025 14:07:18 +0100
X-Gm-Features: ATxdqUFcUwyQP1hTK9OK9GVUJTpU_oNAF_3MPp3GpZjkb03yeOjKh8kFoDdJDZg
Message-ID: <CACHz=ZhtPptqckh1htFXCxgzSvrv05kFNpcyvkWYf=MsK5pNxw@mail.gmail.com>
Subject: Re: [XEN PATCH v2] sbat: Add SBAT section to the Xen EFI binary
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:23=E2=80=AFPM Gerald Elder-Vass
<gerald.elder-vass@cloud.com> wrote:
>
> SBAT is a revocation scheme for UEFI SecureBoot, and is mandated by Micro=
soft
> for signing.
>
> The SBAT section provides a way for the binary to declare a generation
> id for its upstream source and any vendor changes applied. A compatible
> loader can then revoke vulnerable binaries by generation, using the
> binary's declared generation id(s) to determine if it is safe to load.
>
> More information about SBAT is available here:
> https://github.com/rhboot/shim/blob/main/SBAT.md
>
> Vendors should append a custom line onto sbat.csv(.in) with their vendor
> specific sbat data.
>
> Populate the SBAT section in the Xen binary by using the information
> in xen/arch/x86/sbat.csv
>
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> ---
> Changed since v1:
>  * Updated commit message to explain why SBAT is needed
>  * Renamed sbat_data.o rule to sbat.o
>  * Moved sbat.o rule into alphabetical order
>  * Removed xen specific entry from sbat.csv (and rule for auto filling ve=
rsion)
>    - The alternative of adding a "customise me" line would result in more
>      overhead for anyone else building Xen, regardless of UEFI SecureBoot=
 usage
>
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index d902fb7accd9..8fc5c69111d5 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -58,6 +58,7 @@ obj-y +=3D percpu.o
>  obj-y +=3D physdev.o
>  obj-$(CONFIG_COMPAT) +=3D x86_64/physdev.o
>  obj-y +=3D psr.o
> +obj-y +=3D sbat.o
>  obj-y +=3D setup.o
>  obj-y +=3D shutdown.o
>  obj-y +=3D smp.o
> @@ -277,6 +278,9 @@ $(obj)/efi.lds: AFLAGS-y +=3D -DEFI
>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>         $(call if_changed_dep,cpp_lds_S)
>
> +$(obj)/sbat.o: $(src)/sbat.csv
> +       $(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=3D.sb=
at,readonly,data,contents $< $@
> +
>  clean-files :=3D \
>      include/asm/asm-macros.* \
>      $(objtree)/.xen-syms.[0-9]* \
> diff --git a/xen/arch/x86/sbat.csv b/xen/arch/x86/sbat.csv
> new file mode 100644
> index 000000000000..1f262b5f038b
> --- /dev/null
> +++ b/xen/arch/x86/sbat.csv
> @@ -0,0 +1 @@
> +sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT=
.md
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 9a1dfe1b340a..e6405941e1b7 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -343,6 +343,8 @@ SECTIONS
>      *(.reloc)
>      __base_relocs_end =3D .;
>    }
> +
> +  .sbat (NOLOAD) : { *(.sbat) }
>  #elif defined(XEN_BUILD_EFI)
>    /*
>     * Due to the way EFI support is currently implemented, these two symb=
ols
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index a17810bb286f..756f97d48183 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -92,7 +92,8 @@
>         *(.comment.*) \
>         *(.note.*)
>  #else
> -#define DISCARD_EFI_SECTIONS
> +#define DISCARD_EFI_SECTIONS \
> +       *(.sbat)
>  #endif
>
>  /* Sections to be discarded. */

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

