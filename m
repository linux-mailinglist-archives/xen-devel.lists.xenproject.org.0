Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4687F8BAD3A
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716414.1118526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sgl-0008Vb-SF; Fri, 03 May 2024 13:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716414.1118526; Fri, 03 May 2024 13:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sgl-0008Tv-OV; Fri, 03 May 2024 13:10:59 +0000
Received: by outflank-mailman (input) for mailman id 716414;
 Fri, 03 May 2024 13:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrlW=MG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2sgk-0008TX-Ix
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:10:58 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92839da4-094e-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 15:10:55 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so2019426e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 06:10:54 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a19ca42000000b005189964a79dsm542848lfj.172.2024.05.03.06.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:10:53 -0700 (PDT)
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
X-Inumbo-ID: 92839da4-094e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714741854; x=1715346654; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vPkatx33e4RXhWnky40tRoYb8cVZymug/xfvKXxqeyk=;
        b=Nv1PbvrbvlsUdTw8XHGGt7pXlnYE7WnM1dZDmMHd0xHycT8p1WH8zjnPvFo90ocvWr
         WSswQXdvnU5twtovXGFLrVGInmSCod9VxZYGZ4THHbH+hE6oV9IMV/Rf7U+MswKfC2ao
         ybvg97khDHIsNdM7jgsuXfllSjs3zH7KtuUAKUw/PmrEWc2yygWpFojt6oVf1HmdynxB
         llwZAHZOU6GaZYozS90aUCR8OJYBBJY2LIOfveXnq7VSDwQ8DozhUNzkHpTMyWaDH4XW
         lmeZD/fVI1IguibPxZ5UpzyC56VIRJNmIyisxaH/eg7wGmvsD0k1rEOKnPFv/W1/4ldM
         2afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741854; x=1715346654;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPkatx33e4RXhWnky40tRoYb8cVZymug/xfvKXxqeyk=;
        b=oBtsUpZHMjPWsj2oPYewekad1yJ6qX09bMFPPT4j60uhrVqX8sziXnKq1N556Req9p
         nKtAnQ1Sh/+XV1vvUQYnmYIOFIYtpWynT/80SP99EfX4gmbP4S9d4oJx/IyR3exZMKZ6
         T/oxD/kgGaJ+phNQDumgVnXrnk3Itchf/zgjYdXQoGbm/foAfJANy7wBmXwjGdxYTBrf
         pKjnnTtcMnUDxcdAJy0WTLNan1LTyQNjfj8fV/SJ5RMOjQoYuEsjiu66zy0kKZru5ByA
         4TwsE9rknY6CKIIiwCdDhLVsqTriHkYnVnpxVbfCt6xoccaZNgD2W9UnYmCRh6GGrtYv
         GyZw==
X-Forwarded-Encrypted: i=1; AJvYcCXrmOzkv6LfUcbzVU3B8K/UYS7nstRtkA77udsp3hNhi+Yb4YqBThpVNyjkO3KpWv3Neo3k3cSL0iuNEEYyksRKiXP8s/hpad/HZWvc2kk=
X-Gm-Message-State: AOJu0Yzp66Q5fpOv6lS3xlsOrDVZ3zmsMmD31LV8EVjNyWbI95ObFnwb
	FksoNlIC80zC1kZ4iyU+by3xuOHEo7gDj9TOi39jq+ZXtIHak28Qo0zOig==
X-Google-Smtp-Source: AGHT+IGVv5A0VRacjLYP22YxqE6z3/sRcj86Kjd308oWNkB4T0aJ0+LJKYTpcKZqiEhvW46FgttkkQ==
X-Received: by 2002:ac2:44af:0:b0:51b:5c40:da74 with SMTP id c15-20020ac244af000000b0051b5c40da74mr1867044lfm.1.1714741853384;
        Fri, 03 May 2024 06:10:53 -0700 (PDT)
Message-ID: <bf162e123f0124730bf6572c415cf5eb700fe316.camel@gmail.com>
Subject: Re: [PATCH] xen/Kconfig: Drop the final remnants of ---help---
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Date: Fri, 03 May 2024 15:10:52 +0200
In-Reply-To: <20240502181049.1361384-1-andrew.cooper3@citrix.com>
References: <20240502181049.1361384-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-05-02 at 19:10 +0100, Andrew Cooper wrote:
> We deprecated the use of ---help--- a while ago, but a lot of new
> content
> copy&pastes bad examples.=C2=A0 Convert the remaining instances, and
> update
> Kconfig's parser to no longer recongise it.
>=20
> This now causes builds to fail with:
>=20
> =C2=A0 Kconfig.debug:8: syntax error
> =C2=A0 Kconfig.debug:7: unknown statement "---help---"
>=20
> which short circuits one common piece of churn in new content.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> For 4.19.=C2=A0 This cleans up a legacy we've been wanting to get rid of
> for a
> while, and will be least disruptive on people if it gets in ahead of
> most
> people starting work for 4.20.
I am okay with commiting the patch during 4.19 release:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0xen/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> =C2=A0xen/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 +++++++++----------
> =C2=A0xen/arch/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++---
> =C2=A0xen/arch/arm/platforms/Kconfig=C2=A0 | 12 ++++-----
> =C2=A0xen/arch/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++-----------
> =C2=A0xen/common/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48 ++++++++++++++++---------------
> --
> =C2=A0xen/common/sched/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 10 +++----
> =C2=A0xen/drivers/passthrough/Kconfig |=C2=A0 8 +++---
> =C2=A0xen/drivers/video/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0xen/tools/kconfig/lexer.l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A010 files changed, 76 insertions(+), 76 deletions(-)
>=20
> diff --git a/xen/Kconfig b/xen/Kconfig
> index 1e1b041fd52f..e459cdac0cd7 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -84,7 +84,7 @@ config UNSUPPORTED
> =C2=A0config LTO
> =C2=A0	bool "Link Time Optimisation"
> =C2=A0	depends on BROKEN
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enable Link Time Optimisation.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say N.
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index fa81853e9385..61b24ac552cd 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -4,7 +4,7 @@ menu "Debugging Options"
> =C2=A0config DEBUG
> =C2=A0	bool "Developer Checks"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 If you say Y here this will enable developer checks such
> as asserts
> =C2=A0	=C2=A0 and extra printks. This option is intended for development
> purposes
> =C2=A0	=C2=A0 only, and not for production use.
> @@ -17,14 +17,14 @@ config GDBSX
> =C2=A0	bool "Guest debugging with gdbsx"
> =C2=A0	depends on X86
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 If you want to enable support for debugging guests from
> dom0 via
> =C2=A0	=C2=A0 gdbsx then say Y.
> =C2=A0
> =C2=A0config FRAME_POINTER
> =C2=A0	bool "Compile Xen with frame pointers"
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 If you say Y here the resulting Xen will be slightly
> larger and
> =C2=A0	=C2=A0 maybe slower, but it gives very useful debugging
> information
> =C2=A0	=C2=A0 in case of any Xen bugs.
> @@ -33,7 +33,7 @@ config COVERAGE
> =C2=A0	bool "Code coverage support"
> =C2=A0	depends on !LIVEPATCH
> =C2=A0	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if
> !ENFORCE_UNIQUE_SYMBOLS
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enable code coverage support.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say N here.
> @@ -41,7 +41,7 @@ config COVERAGE
> =C2=A0config DEBUG_LOCK_PROFILE
> =C2=A0	bool "Lock Profiling"
> =C2=A0	select DEBUG_LOCKS
> -	---help---
> +	help
> =C2=A0	=C2=A0 Lock profiling allows you to see how often locks are taken
> and blocked.
> =C2=A0	=C2=A0 You can use serial console to print (and reset) using 'l'
> and 'L'
> =C2=A0	=C2=A0 respectively, or the 'xenlockprof' tool.
> @@ -49,13 +49,13 @@ config DEBUG_LOCK_PROFILE
> =C2=A0config DEBUG_LOCKS
> =C2=A0	bool "Lock debugging"
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enable debugging features of lock handling.=C2=A0 Some
> additional
> =C2=A0	=C2=A0 checks will be performed when acquiring and releasing
> locks.
> =C2=A0
> =C2=A0config PERF_COUNTERS
> =C2=A0	bool "Performance Counters"
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables software performance counters that allows you to
> analyze
> =C2=A0	=C2=A0 bottlenecks in the system.=C2=A0 To access this data you ca=
n
> use serial
> =C2=A0	=C2=A0 console to print (and reset) using 'p' and 'P'
> respectively, or
> @@ -64,21 +64,21 @@ config PERF_COUNTERS
> =C2=A0config PERF_ARRAYS
> =C2=A0	bool "Performance Counter Array Histograms"
> =C2=A0	depends on PERF_COUNTERS
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables software performance counter array histograms.
> =C2=A0
> =C2=A0
> =C2=A0config VERBOSE_DEBUG
> =C2=A0	bool "Verbose debug messages"
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 Guest output from HYPERVISOR_console_io and hypervisor
> parsing
> =C2=A0	=C2=A0 ELF images (dom0) will be logged in the Xen ring buffer.
> =C2=A0
> =C2=A0config DEVICE_TREE_DEBUG
> =C2=A0	bool "Device tree debug messages"
> =C2=A0	depends on HAS_DEVICE_TREE
> -	---help---
> +	help
> =C2=A0	=C2=A0 Device tree parsing and DOM0 device tree building messages
> are
> =C2=A0	=C2=A0 logged in the Xen ring buffer.
> =C2=A0	=C2=A0 If unsure, say N here.
> @@ -86,14 +86,14 @@ config DEVICE_TREE_DEBUG
> =C2=A0config SCRUB_DEBUG
> =C2=A0	bool "Page scrubbing test"
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 Verify that pages that need to be scrubbed before being
> allocated to
> =C2=A0	=C2=A0 a guest are indeed scrubbed.
> =C2=A0
> =C2=A0config UBSAN
> =C2=A0	bool "Undefined behaviour sanitizer"
> =C2=A0	depends on HAS_UBSAN
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enable undefined behaviour sanitizer. It uses compiler to
> insert code
> =C2=A0	=C2=A0 snippets so that undefined behaviours in C are detected
> during runtime.
> =C2=A0	=C2=A0 This requires a UBSAN capable compiler and it is a debug
> only feature.
> @@ -109,7 +109,7 @@ config UBSAN_FATAL
> =C2=A0
> =C2=A0config DEBUG_TRACE
> =C2=A0	bool "Debug trace support"
> -	---help---
> +	help
> =C2=A0	=C2=A0 Debug trace enables to record debug trace messages which
> are printed
> =C2=A0	=C2=A0 either directly to the console or are printed to console
> in case of
> =C2=A0	=C2=A0 a system crash.
> @@ -117,7 +117,7 @@ config DEBUG_TRACE
> =C2=A0config XMEM_POOL_POISON
> =C2=A0	bool "Poison free xenpool blocks"
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 Poison free blocks with 0xAA bytes and verify them when a
> block is
> =C2=A0	=C2=A0 allocated in order to spot use-after-free issues.
> =C2=A0
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f8139a773a43..21d03d9f4424 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -67,7 +67,7 @@ source "arch/Kconfig"
> =C2=A0config ACPI
> =C2=A0	bool "ACPI (Advanced Configuration and Power Interface)
> Support (UNSUPPORTED)" if UNSUPPORTED
> =C2=A0	depends on ARM_64 && ARM_EFI
> -	---help---
> +	help
> =C2=A0
> =C2=A0	=C2=A0 Advanced Configuration and Power Interface (ACPI) support
> for Xen is
> =C2=A0	=C2=A0 an alternative to device tree on ARM64. This requires
> UEFI.
> @@ -102,7 +102,7 @@ config GICV3
> =C2=A0	depends on !NEW_VGIC
> =C2=A0	default n if ARM_32
> =C2=A0	default y if ARM_64
> -	---help---
> +	help
> =C2=A0
> =C2=A0	=C2=A0 Driver for the ARM Generic Interrupt Controller v3.
> =C2=A0	=C2=A0 If unsure, use the default setting.
> @@ -132,7 +132,7 @@ config HVM
> =C2=A0config NEW_VGIC
> =C2=A0	bool "Use new VGIC implementation"
> =C2=A0	select GICV2
> -	---help---
> +	help
> =C2=A0
> =C2=A0	This is an alternative implementation of the ARM GIC
> interrupt
> =C2=A0	controller emulation, based on the Linux/KVM VGIC. It has a
> better
> @@ -147,7 +147,7 @@ config NEW_VGIC
> =C2=A0config SBSA_VUART_CONSOLE
> =C2=A0	bool "Emulated SBSA UART console support"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Allows a guest to use SBSA Generic UART as a console. The
> =C2=A0	=C2=A0 SBSA Generic UART implements a subset of ARM PL011 UART.
> =C2=A0
> diff --git a/xen/arch/arm/platforms/Kconfig
> b/xen/arch/arm/platforms/Kconfig
> index c93a6b275620..76f7e76b1bf4 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,14 +1,14 @@
> =C2=A0choice
> =C2=A0	prompt "Platform Support"
> =C2=A0	default ALL_PLAT
> -	---help---
> +	help
> =C2=A0	Choose which hardware platform to enable in Xen.
> =C2=A0
> =C2=A0	If unsure, choose ALL_PLAT.
> =C2=A0
> =C2=A0config ALL_PLAT
> =C2=A0	bool "All Platforms"
> -	---help---
> +	help
> =C2=A0	Enable support for all available hardware platforms. It
> doesn't
> =C2=A0	automatically select any of the related drivers.
> =C2=A0
> @@ -17,7 +17,7 @@ config QEMU
> =C2=A0	depends on ARM_64
> =C2=A0	select GICV3
> =C2=A0	select HAS_PL011
> -	---help---
> +	help
> =C2=A0	Enable all the required drivers for QEMU aarch64 virt
> emulated
> =C2=A0	machine.
> =C2=A0
> @@ -26,7 +26,7 @@ config RCAR3
> =C2=A0	depends on ARM_64
> =C2=A0	select HAS_SCIF
> =C2=A0	select IPMMU_VMSA
> -	---help---
> +	help
> =C2=A0	Enable all the required drivers for Renesas RCar3
> =C2=A0
> =C2=A0config MPSOC
> @@ -34,12 +34,12 @@ config MPSOC
> =C2=A0	depends on ARM_64
> =C2=A0	select HAS_CADENCE_UART
> =C2=A0	select ARM_SMMU
> -	---help---
> +	help
> =C2=A0	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
> =C2=A0
> =C2=A0config NO_PLAT
> =C2=A0	bool "No Platforms"
> -	---help---
> +	help
> =C2=A0	Do not enable specific support for any platform.
> =C2=A0
> =C2=A0endchoice
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 2b6248774d8f..7e03e4bc5546 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -58,7 +58,7 @@ source "arch/Kconfig"
> =C2=A0config PV
> =C2=A0	def_bool y
> =C2=A0	prompt "PV support"
> -	---help---
> +	help
> =C2=A0	=C2=A0 Interfaces to support PV domains. These require guest
> kernel support
> =C2=A0	=C2=A0 to run as a PV guest, but don't require any specific
> hardware support.
> =C2=A0
> @@ -71,7 +71,7 @@ config PV32
> =C2=A0	depends on PV
> =C2=A0	default PV_SHIM
> =C2=A0	select COMPAT
> -	---help---
> +	help
> =C2=A0	=C2=A0 The 32bit PV ABI uses Ring1, an area of the x86
> architecture which
> =C2=A0	=C2=A0 was deprecated and mostly removed in the AMD64 spec.=C2=A0 =
As a
> result,
> =C2=A0	=C2=A0 it occasionally conflicts with newer x86 hardware
> features, causing
> @@ -90,7 +90,7 @@ config PV_LINEAR_PT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Support for PV linear pa=
getables"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PV
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ---help---
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linear pagetables =
(also called "recursive pagetables")
> refers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to the practice of=
 a guest operating system having
> pagetable
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entries pointing t=
o other pagetables of the same level
> (i.e.,
> @@ -113,7 +113,7 @@ config HVM
> =C2=A0	select COMPAT
> =C2=A0	select IOREQ_SERVER
> =C2=A0	select MEM_ACCESS_ALWAYS_ON
> -	---help---
> +	help
> =C2=A0	=C2=A0 Interfaces to support HVM domains.=C2=A0 HVM domains requir=
e
> hardware
> =C2=A0	=C2=A0 virtualisation extensions (e.g. Intel VT-x, AMD SVM), but
> can boot
> =C2=A0	=C2=A0 guests which have no specific Xen knowledge.
> @@ -126,7 +126,7 @@ config XEN_SHSTK
> =C2=A0	bool "Supervisor Shadow Stacks"
> =C2=A0	depends on HAS_AS_CET_SS
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Control-flow Enforcement Technology (CET) is a set of
> features in
> =C2=A0	=C2=A0 hardware designed to combat Return-oriented Programming
> (ROP, also
> =C2=A0	=C2=A0 call/jump COP/JOP) attacks.=C2=A0 Shadow Stacks are one CET
> feature
> @@ -152,7 +152,7 @@ config SHADOW_PAGING
> =C2=A0	bool "Shadow Paging"
> =C2=A0	default !PV_SHIM_EXCLUSIVE
> =C2=A0	depends on PV || HVM
> -	---help---
> +	help
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Shadow pagin=
g is a software alternative to hardware paging
> support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Intel EPT, =
AMD NPT).
> @@ -171,7 +171,7 @@ config SHADOW_PAGING
> =C2=A0config BIGMEM
> =C2=A0	bool "big memory support"
> =C2=A0	default n
> -	---help---
> +	help
> =C2=A0	=C2=A0 Allows Xen to support up to 123Tb of memory.
> =C2=A0
> =C2=A0	=C2=A0 This requires enlarging struct page_info as well as
> shrinking
> @@ -183,7 +183,7 @@ config HVM_FEP
> =C2=A0	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if
> UNSUPPORTED
> =C2=A0	default DEBUG
> =C2=A0	depends on HVM
> -	---help---
> +	help
> =C2=A0
> =C2=A0	=C2=A0 Compiles in a feature that allows HVM guest to arbitrarily
> =C2=A0	=C2=A0 exercise the instruction emulator.
> @@ -203,7 +203,7 @@ config TBOOT
> =C2=A0	depends on UNSUPPORTED
> =C2=A0	default !PV_SHIM_EXCLUSIVE
> =C2=A0	select CRYPTO
> -	---help---
> +	help
> =C2=A0	=C2=A0 Allows support for Trusted Boot using the Intel(R) Trusted
> Execution
> =C2=A0	=C2=A0 Technology (TXT)
> =C2=A0
> @@ -213,14 +213,14 @@ choice
> =C2=A0	prompt "Alignment of Xen image"
> =C2=A0	default XEN_ALIGN_2M if PV_SHIM_EXCLUSIVE
> =C2=A0	default XEN_ALIGN_DEFAULT
> -	---help---
> +	help
> =C2=A0	=C2=A0 Specify alignment for Xen image.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, choose "default".
> =C2=A0
> =C2=A0config XEN_ALIGN_DEFAULT
> =C2=A0	bool "Default alignment"
> -	---help---
> +	help
> =C2=A0	=C2=A0 Pick alignment according to build variants.
> =C2=A0
> =C2=A0	=C2=A0 For EFI build the default alignment is 2M. For ELF build
> @@ -281,7 +281,7 @@ config GUEST
> =C2=A0config XEN_GUEST
> =C2=A0	bool "Xen Guest"
> =C2=A0	select GUEST
> -	---help---
> +	help
> =C2=A0	=C2=A0 Support for Xen detecting when it is running under Xen.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say N.
> @@ -290,7 +290,7 @@ config PVH_GUEST
> =C2=A0	def_bool y
> =C2=A0	prompt "PVH Guest"
> =C2=A0	depends on XEN_GUEST
> -	---help---
> +	help
> =C2=A0	=C2=A0 Support booting using the PVH ABI.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say Y.
> @@ -299,7 +299,7 @@ config PV_SHIM
> =C2=A0	def_bool y
> =C2=A0	prompt "PV Shim"
> =C2=A0	depends on PV && XEN_GUEST
> -	---help---
> +	help
> =C2=A0	=C2=A0 Build Xen with a mode which acts as a shim to allow PV
> guest to run
> =C2=A0	=C2=A0 in an HVM/PVH container. This mode can only be enabled
> with command
> =C2=A0	=C2=A0 line option.
> @@ -309,7 +309,7 @@ config PV_SHIM
> =C2=A0config PV_SHIM_EXCLUSIVE
> =C2=A0	bool "PV Shim Exclusive"
> =C2=A0	depends on PV_SHIM
> -	---help---
> +	help
> =C2=A0	=C2=A0 Build Xen in a way which unconditionally assumes PV_SHIM
> mode.=C2=A0 This
> =C2=A0	=C2=A0 option is only intended for use when building a dedicated
> PV Shim
> =C2=A0	=C2=A0 firmware, and will not function correctly in other
> scenarios.
> @@ -321,7 +321,7 @@ if !PV_SHIM_EXCLUSIVE
> =C2=A0config HYPERV_GUEST
> =C2=A0	bool "Hyper-V Guest"
> =C2=A0	select GUEST
> -	---help---
> +	help
> =C2=A0	=C2=A0 Support for Xen detecting when it is running under Hyper-
> V.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say N.
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index cff3166ff923..565ceda741b9 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -15,7 +15,7 @@ config CORE_PARKING
> =C2=A0config GRANT_TABLE
> =C2=A0	bool "Grant table support" if EXPERT
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Grant table provides a generic mechanism to memory sharing
> =C2=A0	=C2=A0 between domains. This shared memory interface underpins
> the
> =C2=A0	=C2=A0 split device drivers for block and network IO in a classic
> @@ -90,7 +90,7 @@ config MEM_ACCESS
> =C2=A0	def_bool MEM_ACCESS_ALWAYS_ON
> =C2=A0	prompt "Memory Access and VM events" if
> !MEM_ACCESS_ALWAYS_ON
> =C2=A0	depends on HVM
> -	---help---
> +	help
> =C2=A0
> =C2=A0	=C2=A0 Framework to configure memory access types for guests and
> receive
> =C2=A0	=C2=A0 related events in userspace.
> @@ -133,7 +133,7 @@ config INDIRECT_THUNK
> =C2=A0config SPECULATIVE_HARDEN_ARRAY
> =C2=A0	bool "Speculative Array Hardening"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Contemporary processors may use speculative execution as a
> =C2=A0	=C2=A0 performance optimisation, but this can potentially be
> abused by an
> =C2=A0	=C2=A0 attacker to leak data via speculative sidechannels.
> @@ -154,7 +154,7 @@ config SPECULATIVE_HARDEN_BRANCH
> =C2=A0	bool "Speculative Branch Hardening"
> =C2=A0	default y
> =C2=A0	depends on X86
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ---help---
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> =C2=A0	=C2=A0 Contemporary processors may use speculative execution as a
> =C2=A0	=C2=A0 performance optimisation, but this can potentially be
> abused by an
> =C2=A0	=C2=A0 attacker to leak data via speculative sidechannels.
> @@ -228,7 +228,7 @@ config DIT_DEFAULT
> =C2=A0config HYPFS
> =C2=A0	bool "Hypervisor file system support"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Support Xen hypervisor file system. This file system is
> used to
> =C2=A0	=C2=A0 present various hypervisor internal data to dom0 and in
> some
> =C2=A0	=C2=A0 cases to allow modifying settings. Disabling the support
> will
> @@ -241,7 +241,7 @@ config HYPFS_CONFIG
> =C2=A0	bool "Provide hypervisor .config via hypfs entry"
> =C2=A0	default y
> =C2=A0	depends on HYPFS
> -	---help---
> +	help
> =C2=A0	=C2=A0 When enabled the contents of the .config file used to
> build the
> =C2=A0	=C2=A0 hypervisor are provided via the hypfs entry
> /buildinfo/config.
> =C2=A0
> @@ -252,7 +252,7 @@ config IOREQ_SERVER
> =C2=A0	bool "IOREQ support (EXPERT)" if EXPERT && !X86
> =C2=A0	default X86
> =C2=A0	depends on HVM
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables generic mechanism for providing emulated devices
> to the guests.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say N.
> @@ -261,7 +261,7 @@ config KEXEC
> =C2=A0	bool "kexec support"
> =C2=A0	default y
> =C2=A0	depends on HAS_KEXEC
> -	---help---
> +	help
> =C2=A0	=C2=A0 Allows a running Xen hypervisor to be replaced with
> another OS
> =C2=A0	=C2=A0 without rebooting. This is primarily used to execute a
> crash
> =C2=A0	=C2=A0 environment to collect information on a Xen hypervisor or
> dom0 crash.
> @@ -270,7 +270,7 @@ config KEXEC
> =C2=A0
> =C2=A0config EFI_SET_VIRTUAL_ADDRESS_MAP
> =C2=A0=C2=A0=C2=A0=C2=A0 bool "EFI: call SetVirtualAddressMap()" if EXPER=
T
> -=C2=A0=C2=A0=C2=A0 ---help---
> +=C2=A0=C2=A0=C2=A0 help
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Call EFI SetVirtualAddressMap() runt=
ime service to setup
> memory map for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 further runtime services. According =
to UEFI spec, it isn't
> strictly
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 necessary, but many UEFI implementat=
ions misbehave when this
> call is
> @@ -292,7 +292,7 @@ config XENOPROF
> =C2=A0config XSM
> =C2=A0	bool "Xen Security Modules support"
> =C2=A0	default ARM
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables the security framework known as Xen Security
> Modules which
> =C2=A0	=C2=A0 allows administrators fine-grained control over a Xen
> domain and
> =C2=A0	=C2=A0 its capabilities by defining permissible interactions
> between domains,
> @@ -305,7 +305,7 @@ config XSM_FLASK
> =C2=A0	def_bool y
> =C2=A0	prompt "FLux Advanced Security Kernel support"
> =C2=A0	depends on XSM
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables FLASK (FLux Advanced Security Kernel) as the
> access control
> =C2=A0	=C2=A0 mechanism used by the XSM framework.=C2=A0 This provides a
> mandatory access
> =C2=A0	=C2=A0 control framework by which security enforcement,
> isolation, and
> @@ -318,7 +318,7 @@ config XSM_FLASK_AVC_STATS
> =C2=A0	def_bool y
> =C2=A0	prompt "Maintain statistics on the FLASK access vector
> cache" if EXPERT
> =C2=A0	depends on XSM_FLASK
> -	---help---
> +	help
> =C2=A0	=C2=A0 Maintain counters on the access vector cache that can be
> viewed using
> =C2=A0	=C2=A0 the FLASK_AVC_CACHESTATS sub-op of the xsm_op hypercall.=C2=
=A0
> Disabling
> =C2=A0	=C2=A0 this will save a tiny amount of memory and time to update
> the stats.
> @@ -329,7 +329,7 @@ config XSM_FLASK_POLICY
> =C2=A0	bool "Compile Xen with a built-in FLASK security policy"
> =C2=A0	default y if "$(XEN_HAS_CHECKPOLICY)" =3D "y"
> =C2=A0	depends on XSM_FLASK
> -	---help---
> +	help
> =C2=A0	=C2=A0 This includes a default XSM policy in the hypervisor so
> that the
> =C2=A0	=C2=A0 bootloader does not need to load a policy to get sane
> behavior from an
> =C2=A0	=C2=A0 XSM-enabled hypervisor.=C2=A0 If this is disabled, a policy
> must be
> @@ -345,7 +345,7 @@ config XSM_SILO
> =C2=A0	def_bool y
> =C2=A0	prompt "SILO support"
> =C2=A0	depends on XSM
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables SILO as the access control mechanism used by the
> XSM framework.
> =C2=A0	=C2=A0 This is not the default module, add boot parameter
> xsm=3Dsilo to choose
> =C2=A0	=C2=A0 it. This will deny any unmediated communication channels
> (grant tables
> @@ -372,7 +372,7 @@ config LATE_HWDOM
> =C2=A0	bool "Dedicated hardware domain"
> =C2=A0	default n
> =C2=A0	depends on XSM && X86
> -	---help---
> +	help
> =C2=A0	=C2=A0 Allows the creation of a dedicated hardware domain
> distinct from
> =C2=A0	=C2=A0 domain 0 that manages devices without needing access to
> other
> =C2=A0	=C2=A0 privileged functionality such as the ability to manage
> domains.
> @@ -390,7 +390,7 @@ config LATE_HWDOM
> =C2=A0
> =C2=A0config ARGO
> =C2=A0	bool "Argo: hypervisor-mediated interdomain communication
> (UNSUPPORTED)" if UNSUPPORTED
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enables a hypercall for domains to ask the hypervisor to
> perform
> =C2=A0	=C2=A0 data transfer of messages between domains.
> =C2=A0
> @@ -417,7 +417,7 @@ config LIVEPATCH
> =C2=A0	default X86
> =C2=A0	depends on "$(XEN_HAS_BUILD_ID)" =3D "y"
> =C2=A0	select CC_SPLIT_SECTIONS
> -	---help---
> +	help
> =C2=A0	=C2=A0 Allows a running Xen hypervisor to be dynamically patched
> using
> =C2=A0	=C2=A0 binary patches without rebooting. This is primarily used
> to binarily
> =C2=A0	=C2=A0 patch in the field an hypervisor with XSA fixes.
> @@ -428,7 +428,7 @@ config FAST_SYMBOL_LOOKUP
> =C2=A0	bool "Fast symbol lookup (bigger binary)"
> =C2=A0	default y
> =C2=A0	depends on LIVEPATCH
> -	---help---
> +	help
> =C2=A0	=C2=A0 When searching for symbol addresses we can use the built-
> in system
> =C2=A0	=C2=A0 that is optimized for searching symbols using addresses as
> the key.
> =C2=A0	=C2=A0 However using it for the inverse (find address using the
> symbol name)
> @@ -440,7 +440,7 @@ config FAST_SYMBOL_LOOKUP
> =C2=A0config ENFORCE_UNIQUE_SYMBOLS
> =C2=A0	bool "Enforce unique symbols"
> =C2=A0	default LIVEPATCH
> -	---help---
> +	help
> =C2=A0	=C2=A0 Multiple symbols with the same name aren't generally a
> problem
> =C2=A0	=C2=A0 unless livepatching is to be used.
> =C2=A0
> @@ -454,7 +454,7 @@ config ENFORCE_UNIQUE_SYMBOLS
> =C2=A0config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
> =C2=A0	bool "Suppress duplicate symbol warnings"
> =C2=A0	depends on !ENFORCE_UNIQUE_SYMBOLS
> -	---help---
> +	help
> =C2=A0	=C2=A0 Multiple symbols with the same name aren't generally a
> problem
> =C2=A0	=C2=A0 unless Live patching is to be used, so these warnings can
> be
> =C2=A0	=C2=A0 suppressed by enabling this option.=C2=A0 Certain other opt=
ions
> (known
> @@ -464,7 +464,7 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
> =C2=A0config CMDLINE
> =C2=A0	string "Built-in hypervisor command string" if EXPERT
> =C2=A0	default ""
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enter arguments here that should be compiled into the
> hypervisor
> =C2=A0	=C2=A0 image and used at boot time. When the system boots, this
> string
> =C2=A0	=C2=A0 will be parsed prior to the bootloader command line. So if
> a
> @@ -475,7 +475,7 @@ config CMDLINE_OVERRIDE
> =C2=A0	bool "Built-in command line overrides bootloader arguments"
> =C2=A0	default n
> =C2=A0	depends on CMDLINE !=3D ""
> -	---help---
> +	help
> =C2=A0	=C2=A0 Set this option to 'Y' to have the hypervisor ignore the
> bootloader
> =C2=A0	=C2=A0 command line, and use ONLY the built-in command line.
> =C2=A0
> @@ -485,7 +485,7 @@ config CMDLINE_OVERRIDE
> =C2=A0config DOM0_MEM
> =C2=A0	string "Default value for dom0_mem boot parameter"
> =C2=A0	default ""
> -	---help---
> +	help
> =C2=A0	=C2=A0 Sets a default value for dom0_mem, e.g. "512M".
> =C2=A0	=C2=A0 The specified string will be used for the dom0_mem
> parameter in
> =C2=A0	=C2=A0 case it was not specified on the command line.
> @@ -507,7 +507,7 @@ config DTB_FILE
> =C2=A0config TRACEBUFFER
> =C2=A0	bool "Enable tracing infrastructure" if EXPERT
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enable tracing infrastructure and pre-defined tracepoints
> within Xen.
> =C2=A0	=C2=A0 This will allow live information about Xen's execution and
> performance
> =C2=A0	=C2=A0 to be collected at run time for debugging or performance
> analysis.
> diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
> index b2ef0c99a3f8..18ca1ce7ab9f 100644
> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -4,20 +4,20 @@ menu "Schedulers"
> =C2=A0config SCHED_CREDIT
> =C2=A0	bool "Credit scheduler support"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 The traditional credit scheduler is a general purpose
> scheduler.
> =C2=A0
> =C2=A0config SCHED_CREDIT2
> =C2=A0	bool "Credit2 scheduler support"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 The credit2 scheduler is a general purpose scheduler that
> is
> =C2=A0	=C2=A0 optimized for lower latency and higher VM density.
> =C2=A0
> =C2=A0config SCHED_RTDS
> =C2=A0	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 The RTDS scheduler is a soft and firm real-time scheduler
> for
> =C2=A0	=C2=A0 multicore, targeted for embedded, automotive, graphics and
> gaming
> =C2=A0	=C2=A0 in the cloud, and general low-latency workloads.
> @@ -25,14 +25,14 @@ config SCHED_RTDS
> =C2=A0config SCHED_ARINC653
> =C2=A0	bool "ARINC653 scheduler support (UNSUPPORTED)" if
> UNSUPPORTED
> =C2=A0	default DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 The ARINC653 scheduler is a hard real-time scheduler for
> single
> =C2=A0	=C2=A0 cores, targeted for avionics, drones, and medical devices.
> =C2=A0
> =C2=A0config SCHED_NULL
> =C2=A0	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
> =C2=A0	default PV_SHIM || DEBUG
> -	---help---
> +	help
> =C2=A0	=C2=A0 The null scheduler is a static, zero overhead scheduler,
> =C2=A0	=C2=A0 for when there always are less vCPUs than pCPUs, typically
> =C2=A0	=C2=A0 in embedded or HPC scenarios.
> diff --git a/xen/drivers/passthrough/Kconfig
> b/xen/drivers/passthrough/Kconfig
> index 864fcf3b0cef..78edd805365e 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -6,7 +6,7 @@ if ARM
> =C2=A0config ARM_SMMU
> =C2=A0	bool "ARM SMMUv1 and v2 driver"
> =C2=A0	default y
> -	---help---
> +	help
> =C2=A0	=C2=A0 Support for implementations of the ARM System MMU
> architecture
> =C2=A0	=C2=A0 versions 1 and 2.
> =C2=A0
> @@ -16,7 +16,7 @@ config ARM_SMMU
> =C2=A0config ARM_SMMU_V3
> =C2=A0	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if
> EXPERT
> =C2=A0	depends on ARM_64 && (!ACPI || BROKEN)
> -	---help---
> +	help
> =C2=A0	 Support for implementations of the ARM System MMU
> architecture
> =C2=A0	 version 3. Driver is in experimental stage and should not
> be used in
> =C2=A0	 production.
> @@ -27,7 +27,7 @@ config ARM_SMMU_V3
> =C2=A0config IPMMU_VMSA
> =C2=A0	bool "Renesas IPMMU-VMSA found in R-Car Gen3/Gen4 SoCs"
> =C2=A0	depends on ARM_64
> -	---help---
> +	help
> =C2=A0	=C2=A0 Support for implementations of the Renesas IPMMU-VMSA
> found
> =C2=A0	=C2=A0 in R-Car Gen3/Gen4 SoCs.
> =C2=A0
> @@ -68,7 +68,7 @@ choice
> =C2=A0	prompt "IOMMU device quarantining default behavior"
> =C2=A0	depends on HAS_PCI
> =C2=A0	default IOMMU_QUARANTINE_BASIC
> -	---help---
> +	help
> =C2=A0	=C2=A0 When a PCI device is assigned to an untrusted domain, it
> is possible
> =C2=A0	=C2=A0 for that domain to program the device to DMA to an
> arbitrary address.
> =C2=A0	=C2=A0 The IOMMU is used to protect the host from malicious DMA
> by making
> diff --git a/xen/drivers/video/Kconfig b/xen/drivers/video/Kconfig
> index 41ca503cc961..245030beeaa2 100644
> --- a/xen/drivers/video/Kconfig
> +++ b/xen/drivers/video/Kconfig
> @@ -7,7 +7,7 @@ config VGA
> =C2=A0	select VIDEO
> =C2=A0	depends on X86
> =C2=A0	default y if !PV_SHIM_EXCLUSIVE
> -	---help---
> +	help
> =C2=A0	=C2=A0 Enable VGA output for the Xen hypervisor.
> =C2=A0
> =C2=A0	=C2=A0 If unsure, say Y.
> diff --git a/xen/tools/kconfig/lexer.l b/xen/tools/kconfig/lexer.l
> index 6354c905b006..4b7339ff4c8b 100644
> --- a/xen/tools/kconfig/lexer.l
> +++ b/xen/tools/kconfig/lexer.l
> @@ -105,7 +105,7 @@ n	[A-Za-z0-9_-]
> =C2=A0"endchoice"		return T_ENDCHOICE;
> =C2=A0"endif"			return T_ENDIF;
> =C2=A0"endmenu"		return T_ENDMENU;
> -"help"|"---help---"	return T_HELP;
> +"help"			return T_HELP;
> =C2=A0"hex"			return T_HEX;
> =C2=A0"if"			return T_IF;
> =C2=A0"imply"			return T_IMPLY;
>=20
> base-commit: feb9158a620040846d76981acbe8ea9e2255a07b


