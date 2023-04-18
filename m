Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3A6E5769
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 04:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522544.811990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poauE-0007oZ-Nb; Tue, 18 Apr 2023 02:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522544.811990; Tue, 18 Apr 2023 02:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poauE-0007mD-Jd; Tue, 18 Apr 2023 02:17:18 +0000
Received: by outflank-mailman (input) for mailman id 522544;
 Tue, 18 Apr 2023 02:17:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=woKg=AJ=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1poauD-0007m5-0c
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 02:17:17 +0000
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224d6f0a-dd8f-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 04:17:15 +0200 (CEST)
Received: by mail-ua1-x936.google.com with SMTP id p12so5921636uak.13
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 19:17:15 -0700 (PDT)
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
X-Inumbo-ID: 224d6f0a-dd8f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681784234; x=1684376234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmsrhIlqPhNfC3v/mD58KM5Yio1KnveeLKkcAYOXjeo=;
        b=CECXZ4WQPjSS2V5dKzTtIadvWHYmxLh9NBqNhhEJ7ifYb8OhcbVb3aPDF4jqhMsyCe
         IOLfD0Vp7+k9fWagsVQaHxAhlKYjjTVFwjzdDXiTGYxjSsBdt6MjEQbUshZSZeC3jjBd
         iTVO+gR/wAf5QlwTLaJrVoJTZ8hkstouFq4wSouTzZJwtvllQH5UJhFIC4zjaImdPJS5
         QeRW++vWVLEugpEuDjY7y/4wV87XEGOg2HNgU80L8wWO1R0J1UfwjqPjGYtkSyszDyBu
         jHc0kT8B5IyvCk10qW2hCBfqKBjZU547CSN7QRvWci0xbKVfHezIJmH6qnafIW18AQG3
         UB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681784234; x=1684376234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmsrhIlqPhNfC3v/mD58KM5Yio1KnveeLKkcAYOXjeo=;
        b=NMl5AIqULMCtbYGqxLJKnO50bq9tNDF9PZDPqrOAXfuC0ChnSKYyb0HPwsSue7LVh5
         wXPrQZ39nkgCLJYuHTr3icE7ZnA1U1gmL0OKYu6bfw/6T6+e7nhalXRF5FEX2W2+Mhy/
         etMDyjzNZ4UPTheXplttCqktULSM7SGy4qG5QRCp1kmJoklEDqRlp9SoqBfCMje6UXLy
         LHVptfXvUVSd1z8bUd/LWuZx7SJJuG0sT8Vi5hJYrR7HiaR3w1yZmCiewyktgt8H6Itb
         uQEVvvCugD2xFp1ZU8wb7ypcOlct5hNTSe+XxYCP5nsNjHEDGlmpo04I8M3Wo4gr8r3h
         oZlw==
X-Gm-Message-State: AAQBX9cINyAyOqnRAVWer4Zd6Nfob7FNqTR6QippLbhEKHzp9wLsEkwJ
	5urc7sx/BKH5r2klRwvM6COqK+EXbHJSh926m8E=
X-Google-Smtp-Source: AKy350abip4qDxzRZ+maiO/oRT+Jew3HTxluYCQI3bC+PB9CVOXK5jAPdmxRqBCSwDmVz3Ezfd8ostQG11krWDSgebs=
X-Received: by 2002:a1f:bd52:0:b0:440:125:7e59 with SMTP id
 n79-20020a1fbd52000000b0044001257e59mr4930034vkf.1.1681784233897; Mon, 17 Apr
 2023 19:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678970065.git.oleksii.kurochko@gmail.com> <2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com>
In-Reply-To: <2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:16:47 +1000
Message-ID: <CAKmqyKOUKv+6yw8R4ccm_rJL8nwxKJ0RRYq0NXDfUneGu15Fzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 11:22=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch is needed to keep all address of cpu0_boot_stack
> PC-relative.
>
> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic
> or compiler flags.
>
> Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
> cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
> where all addresses will be without counting that it might happen
> that linker address !=3D load address ( so addresses inside got
> sections will be relative to linker time ).
>
> It happens becuase the compiler from riscv64 docker compiled with
> --enable-default-pie:
>   [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -v
>   Using built-in specs.
>   COLLECT_GCC=3Driscv64-linux-gnu-gcc
>   COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/riscv64-linux-gnu/12.2.0/lto-wrapper
>   Target: riscv64-linux-gnu
>   Configured with: /build/riscv64-linux-gnu-gcc/src/gcc-12.2.0/configure
>   --prefix=3D/usr --program-prefix=3Driscv64-linux-gnu- --with-local-
>   prefix=3D/usr/riscv64-linux-gnu --with-sysroot=3D/usr/riscv64-linux-gnu=
 --
>   with-build-sysroot=3D/usr/riscv64-linux-gnu --libdir=3D/usr/lib --
>   libexecdir=3D/usr/lib --target=3Driscv64-linux-gnu --host=3Dx86_64-pc-l=
inux-
>   gnu --build=3Dx86_64-pc-linux-gnu --with-system-zlib --with-isl --with-
>   linker-hash-style=3Dgnu --disable-nls --disable-libunwind-exceptions --
>   disable-libstdcxx-pch --disable-libssp --disable-multilib --disable-
>   werror --enable-languages=3Dc,c++ --enable-shared --enable-threads=3Dpo=
six
>   --enable-__cxa_atexit --enable-clocale=3Dgnu --enable-gnu-unique-object=
 -
>   -enable-linker-build-id --enable-lto --enable-plugin --enable-install-
>   libiberty --enable-gnu-indirect-function --enable-default-pie --enable-
>   checking=3Drelease
>   Thread model: posix
>   Supported LTO compression algorithms: zlib zstd
>   gcc version 12.2.0 (GCC)
>
> Looking at gcc spec file for the RISC-V architecture:
>   [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -dumpspecs | grep -i
>   pic
>   --traditional-format %(subtarget_asm_debugging_spec) %{fno-pie|fno-
>   PIE|fno-pic|fno-PIC:;:-fpic} %{march=3D*} %{mabi=3D*} %{mno-relax} %{mb=
ig-
>   endian} %{mlittle-endian} %(subtarget_asm_spec)%{misa-spec=3D*}
> which means that -fpic is enabled if none of the following options are
> present on the command line:
>     -fno-pie
>     -fno-PIE
>     -fno-pic
>     -fno-PIC
>
> That's the reasons why 'la' is transformed to 'aupic/l{w|d} GOT' and
> not be dependent on the toolchain used.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  Changes in V2:
>  * instead of changing 'la' to 'lla' to keep cpu0_boot_stack PC-relative
>    it was updated CFLAGS with EMBEDDED_EXTRA_CFLAGS which contains
>    -fno-PIE thereby 'la' will be transformed to 'auipc/addi' without
>    GOT usage.
>  * update the commit message with additional details.
> ---
>  xen/arch/riscv/arch.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index 45fe858ee0..7448f759b4 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -1,6 +1,8 @@
>  ########################################
>  # RISCV-specific definitions
>
> +$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +
>  CFLAGS-$(CONFIG_RISCV_64) +=3D -mabi=3Dlp64
>
>  riscv-march-$(CONFIG_RISCV_ISA_RV64G) :=3D rv64g
> --
> 2.39.2
>
>

