Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB50A9A979
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966092.1356419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tUe-0001ig-9l; Thu, 24 Apr 2025 10:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966092.1356419; Thu, 24 Apr 2025 10:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tUe-0001fu-6E; Thu, 24 Apr 2025 10:07:44 +0000
Received: by outflank-mailman (input) for mailman id 966092;
 Thu, 24 Apr 2025 10:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yjef=XK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7tUc-0001fm-Ih
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:07:43 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f44e0a90-20f3-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 12:07:39 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso157825066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 03:07:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace598f6ba6sm82691566b.86.2025.04.24.03.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 03:07:37 -0700 (PDT)
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
X-Inumbo-ID: f44e0a90-20f3-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745489259; x=1746094059; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4560j7Y3nADOH6F6SvPGqNl26ADQKXMG4bw42EWp/4=;
        b=FDyg5q46pgzbhxCvO8yRvXt9hfDVixdbS+04kCUARfWYc0QhhG3FXcmTS+Eeqpe3XY
         T4Qm85BkP0kK4oKWumjyFSEjb696F09A4ugU3aUT47sYEUDGDhC565NIHPFZKhlMoAlH
         ylJ7ZkpFpdW9x5xgycdX4b+hBSAv30259HXDOPuct0cTMzEwSB9y21lzuQ5DdNz/DXkP
         3/JLKlywwPp2yfQuEkGt20FeTYj8/DkFpSEeVvqMnjYEEhVGuaNTrQJnaqf8okyPOBJ9
         AQ11q0B2CtLOLDR+EGPajc/N3LJt0EJBzlyCl7b3KXwCKrXVBO4WtMxtfoyIDrHpUarB
         730Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489259; x=1746094059;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g4560j7Y3nADOH6F6SvPGqNl26ADQKXMG4bw42EWp/4=;
        b=lbPmUXFywro2OjzASw/OWZGt7KNmxJ1AIo5z0aXzecYxU82j4qUCursuTgxJIHETl3
         Ot7NbQgVuT9RwWWXVke9BQwtUL/mYg6wCzvGtNcfwrSucsPIFdWwgHMucV3CpdB4ZNDt
         xtoFBNkgZOD1PgIicLgXdcmBzbyMKyQjaV02cCRAOAqcmyfyZVgquRQwzroixNqtuld8
         SM69OnF3NPj50bvv9zyDntzhcIbXw4EvIlkhfNYQJUQypoonqh15uoajdatUHkjm1GZn
         0UxmTu01HDdid5+KFHC8obuqy9/ayGjbJtJeiC2sIQLwJ0fd4b5r94FYTo+F0EBimeFy
         u1cA==
X-Forwarded-Encrypted: i=1; AJvYcCX10kBLbbjIRRvykJ2C3O7MInchb/nUymtmJ/qJiVKaUdBC4TPzGpDwU3K/bL9uxLUBwnEWJ1heaRU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcsPUhL9F7yzVid3hqecN+12e9b1Q3RsyoOL1IESyNk8mXCChJ
	tvoI1WGe3XNafkQFcLu90+/q4bw6fAJ6ImlfEiir9JZhaTzdnI/s
X-Gm-Gg: ASbGncvvN2NBcXita4RFZ5l0OtZYkrgdcZYk1OtyMOdTtcgNTwnG06YyviqlARkFSD+
	byPINRyI4xuh4EZy25aoKrtXT44cIePXan1LmIF2j5XAMHL5bh/J7XRU6xBIWSo9koShh/n6oZE
	2kTNlbt0O1Tjn10Pgq4III3tU2U4QPQBQbIfH2xF7AT9uBEcyQAigegS/Vx0/ajDu5ky4UB85+m
	gbSVA06Ss3sO5skhUEQm2RAquvzw3h5blijumuRhNiq5APBwdx1tWx8Oo9vbhEAY3FT9WCg4V9H
	FCjjkvHli2QIdxvXjJroa72tn3l3KE8BCXsYic/pCSWO8ptSfI4+5bQrUzRreERxYcrAou192zU
	xI2Ij/JcimZEEBEfr
X-Google-Smtp-Source: AGHT+IFa65V2vtpARRqvAgBv9cqpAGknUdfzqj/k4Lp1V39UGYxEjn/HcJAz0Xv/4pyeBHYFqD1gOw==
X-Received: by 2002:a17:907:6e9e:b0:aca:a686:8558 with SMTP id a640c23a62f3a-ace570cdf79mr155273066b.6.1745489258408;
        Thu, 24 Apr 2025 03:07:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------3N15kRSEuV40hOF0dij5S8hz"
Message-ID: <b3515547-6a97-4237-8f38-5406a2575de6@gmail.com>
Date: Thu, 24 Apr 2025 12:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] tools: remove qemu-traditional
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Community Manager <community.manager@xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-5-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250408123526.14613-5-jgross@suse.com>

This is a multi-part message in MIME format.
--------------3N15kRSEuV40hOF0dij5S8hz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/8/25 2:35 PM, Juergen Gross wrote:
> Remove qemu traditional from the tree.
>
> Signed-off-by: Juergen Gross<jgross@suse.com>
> ---
>   .gitignore                                    |  3 -
>   CHANGELOG.md                                  |  1 +

For CHANGELOG.md changes LGTM: Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>   Config.mk                                     | 24 -----
>   INSTALL                                       | 12 ---
>   MAINTAINERS                                   |  4 -
>   README                                        |  2 +-
>   SUPPORT.md                                    | 16 ----
>   config/Tools.mk.in                            |  1 -
>   docs/process/branching-checklist.txt          |  1 -
>   docs/process/release-technician-checklist.txt |  1 -
>   stubdom/Makefile                              | 84 +----------------
>   stubdom/configure                             | 89 -------------------
>   stubdom/configure.ac                          | 15 ----
>   stubdom/ioemu-minios.cfg                      |  6 --
>   tools/Makefile                                | 58 ------------
>   tools/Rules.mk                                |  3 -
>   tools/config.h.in                             |  3 -
>   tools/configure                               | 42 +--------
>   tools/configure.ac                            | 21 +----
>   19 files changed, 10 insertions(+), 376 deletions(-)
>   delete mode 100644 stubdom/ioemu-minios.cfg
>
> diff --git a/.gitignore b/.gitignore
> index 53f5df0003..ccc0bebee6 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -255,9 +255,6 @@ LibVNCServer*
>   tools/qemu-xen-dir-remote
>   tools/qemu-xen-dir
>   
> -tools/qemu-xen-traditional-dir-remote
> -tools/qemu-xen-traditional-dir
> -
>   tools/firmware/seabios-dir-remote
>   tools/firmware/seabios-dir
>   
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ce4fcf2feb..d150b9fa1b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>   
>   ### Removed
> + - Support of qemu-traditional has been removed.
>   
>   ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
>   
> diff --git a/Config.mk b/Config.mk
> index 8be7733d9e..d61257a286 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -208,22 +208,12 @@ XEN_EXTFILES_URL ?=https://xenbits.xen.org/xen-extfiles
>   
>   # Where to look for inlined subtrees (for example, from a tarball)
>   QEMU_UPSTREAM_INTREE ?= $(XEN_ROOT)/tools/qemu-xen
> -QEMU_TRADITIONAL_INTREE ?= $(XEN_ROOT)/tools/qemu-xen-traditional
>   
>   
>   # Handle legacy options
>   ifneq (,$(SEABIOS_UPSTREAM_TAG))
>   SEABIOS_UPSTREAM_REVISION ?= $(SEABIOS_UPSTREAM_TAG)
>   endif
> -ifneq (,$(QEMU_REMOTE))
> -QEMU_TRADITIONAL_URL ?= $(QEMU_REMOTE)
> -endif
> -ifneq (,$(CONFIG_QEMU))
> -QEMU_TRADITIONAL_LOC ?= $(CONFIG_QEMU)
> -endif
> -ifneq (,$(QEMU_TAG))
> -QEMU_TRADITIONAL_REVISION ?= $(QEMU_TAG)
> -endif
>   
>   OVMF_UPSTREAM_URL ?=https://xenbits.xen.org/git-http/ovmf.git
>   OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
> @@ -239,20 +229,6 @@ SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
>   
>   ETHERBOOT_NICS ?= rtl8139 8086100e
>   
> -
> -QEMU_TRADITIONAL_URL ?=https://xenbits.xen.org/git-http/qemu-xen-traditional.git
> -QEMU_TRADITIONAL_REVISION ?= 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764
> -# Wed Jul 15 10:01:40 2020 +0100
> -# qemu-trad: remove Xen path dependencies
> -
> -# Specify which qemu-dm to use. This may be `ioemu' to use the old
> -# Mercurial in-tree version, or a local directory, or a git URL.
> -# QEMU_UPSTREAM_LOC ?= `pwd`/$(XEN_ROOT)/../qemu-xen.git
> -
> -# Defaults for subtree locations
> -QEMU_TRADITIONAL_LOC ?= $(call or,$(wildcard $(QEMU_TRADITIONAL_INTREE)),\
> -                                  $(QEMU_TRADITIONAL_URL))
> -
>   QEMU_UPSTREAM_LOC ?= $(call or,$(wildcard $(QEMU_UPSTREAM_INTREE)),\
>                                  $(QEMU_UPSTREAM_URL))
>   
> diff --git a/INSTALL b/INSTALL
> index 88c1464816..786e3da996 100644
> --- a/INSTALL
> +++ b/INSTALL
> @@ -113,15 +113,6 @@ Build a private copy of SeaBIOS.
>   Use the given SeaBIOS binary instead of compiling a private copy.
>     --with-system-seabios=PATH
>   
> -Build the old qemu used by xm/xend. This is required if existing domUs
> -should be migrated to this host, or if existing domU snapshots should be
> -started with this version of the tools. Only if all domUs used the new
> -upstream qemu during initial start it is safe to disable this option.
> -The old qemu requires rombios, which can be disable along with
> -qemu-traditional.
> -  --enable-qemu-traditional
> -  --enable-rombios
> -
>   The libxl toolstack uses the upstream qemu per default. A private copy
>   will be built. If desired this private copy can be configured with
>   additional options passed to its configure script.
> @@ -245,7 +236,6 @@ locations.
>   XEN_EXTFILES_URL=
>   OVMF_UPSTREAM_URL=
>   QEMU_UPSTREAM_URL=
> -QEMU_TRADITIONAL_URL=
>   SEABIOS_UPSTREAM_URL=
>   MINIOS_UPSTREAM_URL=
>   
> @@ -253,7 +243,6 @@ Using additional CFLAGS to build tools which will run in dom0 is
>   required when building distro packages. These variables can be used to
>   pass RPM_OPT_FLAGS.
>   EXTRA_CFLAGS_XEN_TOOLS=
> -EXTRA_CFLAGS_QEMU_TRADITIONAL=
>   EXTRA_CFLAGS_QEMU_XEN=
>   
>   Additional CFLAGS may be supplied to the build of the hypervisor by
> @@ -340,7 +329,6 @@ sudo make install BOOT_DIR=/ood/path/boot EFI_DIR=/odd/path/efi
>   export WGET=$(type -P false)
>   export GIT=$(type -P false)
>   export EXTRA_CFLAGS_XEN_TOOLS="$RPM_OPT_FLAGS"
> -export EXTRA_CFLAGS_QEMU_TRADITIONAL="$RPM_OPT_FLAGS"
>   export EXTRA_CFLAGS_QEMU_XEN="$RPM_OPT_FLAGS"
>   %configure \
>           --with-initddir=%{_initddir}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c11b82eca9..7d1b3b8641 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -466,10 +466,6 @@ M:	Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>   S:	Supported
>   F:	tools/python
>   
> -QEMU-DM
> -S:	Supported
> -T:	githttps://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
> -
>   QEMU UPSTREAM
>   M:	Stefano Stabellini<sstabellini@kernel.org>
>   M:	Anthony Perard<anthony.perard@vates.tech>
> diff --git a/README b/README
> index be90be3910..6ee58f7b35 100644
> --- a/README
> +++ b/README
> @@ -80,7 +80,7 @@ disabled at compile time:
>         libnl-3-dev, etc).  Required if network buffering is desired
>         when using Remus with libxl.  See docs/README.remus for detailed
>         information.
> -    * 16-bit x86 assembler, loader and compiler for qemu-traditional / rombios
> +    * 16-bit x86 assembler, loader and compiler for rombios
>         (dev86 rpm or bin86 & bcc debs)
>       * Development install of liblzma for rombios
>       * Development install of libbz2, liblzma, liblzo2, and libzstd for DomU
> diff --git a/SUPPORT.md b/SUPPORT.md
> index e8fd0c251e..5eecf1dcbc 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -998,21 +998,6 @@ See the section **Blkback** for image formats supported by QEMU.
>   
>       Status: Supported, not security supported
>   
> -### qemu-xen-traditional ###
> -
> -The Xen Project provides an old version of qemu with modifications
> -which enable use as a device model stub domain.  The old version is
> -normally selected by default only in a stub dm configuration, but it
> -can be requested explicitly in other configurations, for example in
> -`xl` with `device_model_version="QEMU_XEN_TRADITIONAL"`. - - Status, Device Model Stub Domains: Supported, with caveats - 
> Status, as host process device model: No security support, not 
> recommended - -qemu-xen-traditional is security supported only for 
> those available -devices which are supported for mainstream QEMU (see 
> above), with -trusted driver domains (see Device Model Stub Domains). 
> - ## Virtual Firmware ### x86/HVM iPXE @@ -1031,7 +1016,6 @@ as the 
> guest itself. Booting a guest via guest BIOS firmware Status, SeaBIOS 
> (qemu-xen): Supported - Status, ROMBIOS (qemu-xen-traditional): 
> Supported ### x86/HVM OVMF diff --git a/config/Tools.mk.in 
> b/config/Tools.mk.in index 37c071961e..463ab75965 100644 --- 
> a/config/Tools.mk.in +++ b/config/Tools.mk.in @@ -43,7 +43,6 @@ 
> CONFIG_OVMF := @ovmf@ CONFIG_ROMBIOS := @rombios@ CONFIG_SEABIOS := 
> @seabios@ CONFIG_IPXE := @ipxe@ -CONFIG_QEMU_TRAD := 
> @qemu_traditional@ CONFIG_QEMU_XEN := @qemu_xen@ 
> CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@ CONFIG_LIBNL := 
> @libnl@ diff --git a/docs/process/branching-checklist.txt 
> b/docs/process/branching-checklist.txt index aa7a27eed5..9632888a56 
> 100644 --- a/docs/process/branching-checklist.txt +++ 
> b/docs/process/branching-checklist.txt @@ -71,7 +71,6 @@ ov=4.0 Ensure 
> references to qemu trees and Mini-OS in xen.git's Config.mk are 
> updated. The variables and there content should be: * 
> QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0 - * QEMU_TRADITIONAL_REVISION: 
> xen-X.Y.0 * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0 Where X.Y is 
> the release version (e.g. 4.17). diff --git 
> a/docs/process/release-technician-checklist.txt 
> b/docs/process/release-technician-checklist.txt index 
> 829e8ec47b..64ed9fd5b2 100644 --- 
> a/docs/process/release-technician-checklist.txt +++ 
> b/docs/process/release-technician-checklist.txt @@ -56,7 +56,6 @@ 
> t=RELEASE-$r * change xen-unstable Config.mk # QEMU_UPSTREAM_REVISION, 
> -# QEMU_TRADITIONAL_REVISION # MINIOS_UPSTREAM_REVISION # (drop any 
> references to the specific commits, e.g. date or title) * change 
> SUPPORT.md heading version number; -unstable or -rc tag diff --git 
> a/stubdom/Makefile b/stubdom/Makefile index 724ce40365..82fc1e90f8 
> 100644 --- a/stubdom/Makefile +++ b/stubdom/Makefile @@ -7,7 +7,6 @@ 
> export PKG_CONFIG_DIR = $(CURDIR)/pkg-config # Remove flags which are 
> meant for tools, e.g. "-m64"
>   export EXTRA_CFLAGS_XEN_TOOLS=
> -export EXTRA_CFLAGS_QEMU_TRADITIONAL=
>   
>   export stubdom=y
>   export debug=y
> @@ -267,43 +266,6 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
>   .PHONY: $(CROSS_ROOT)
>   $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
>   
> -QEMU_ROOT := $(shell if [ -d "$(QEMU_TRADITIONAL_LOC)" ]; then echo "$(QEMU_TRADITIONAL_LOC)"; else echo .; fi)
> -
> -ifneq ($(filter ioemu,$(STUBDOM_TARGETS)),)
> -IOEMU_LINKFARM_TARGET := ioemu/linkfarm.stamp
> -endif
> -
> -ifeq ($(QEMU_ROOT),.)
> -$(XEN_ROOT)/tools/qemu-xen-traditional-dir:
> -	$(MAKE) DESTDIR= -C $(XEN_ROOT)/tools qemu-xen-traditional-dir-find
> -
> -ioemu/linkfarm.stamp: $(XEN_ROOT)/tools/qemu-xen-traditional-dir
> -	mkdir -p ioemu
> -	set -e;									\
> -	$(buildmakevars2shellvars);						\
> -	cd ioemu;								\
> -	src="$$XEN_ROOT/tools/qemu-xen-traditional-dir"; export src;		\
> -	(cd $$src && find * -type d						\
> -		$(addprefix ! -path , '*-softmmu*' '*-linux-user*') -print)	\
> -		| xargs mkdir -p;						\
> -	(cd $$src && find *	! -type l  -type f  $(addprefix ! -path ,	\
> -			'*.[oda1]' 'config-*' config.mak qemu-dm qemu-img-xen	\
> -			'*.html' '*.pod' '*-softmmu*' '*-linux-user*'		\
> -			)) >linkfarm.stamp.tmp;				\
> -	cmp -s linkfarm.stamp.tmp linkfarm.stamp &&			\
> -		rm linkfarm.stamp.tmp || {				\
> -		mv linkfarm.stamp.tmp linkfarm.stamp;			\
> -		cat linkfarm.stamp | while read f;			\
> -			do rm -f "$$f"; ln -s "$$src/$$f" "$$f"; done;	\
> -	}
> -else
> -export QEMU_ROOT
> -
> -ioemu/linkfarm.stamp:
> -	mkdir -p ioemu
> -	touch ioemu/linkfarm.stamp
> -endif
> -
>   #######
>   # libraries under tools/libs
>   #######
> @@ -380,29 +342,6 @@ $(TARGETS_MINIOS): mini-os-%:
>                   mkdir -p $@/$$i ; \
>   	done
>   
> -#######
> -# ioemu
> -#######
> -
> -ioemu-minios.gen.cfg: APP_LIBS = evtchn gnttab ctrl guest
> -ioemu-minios.gen.cfg: ioemu-minios.cfg Makefile
> -	$(GEN_config) >$@
> -
> -ioemu-minios-config.mk: ioemu-minios.gen.cfg
> -	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
> -
> -.PHONY: ioemu
> -ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
> -	[ -f ioemu/config-host.mak ] || \
> -	  ( $(buildmakevars2shellvars); \
> -	    cd ioemu ; \
> -	    LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) \
> -	    TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat ioemu-minios-config.mk)" \
> -	    TARGET_CFLAGS="$(TARGET_CFLAGS)" \
> -	    TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
> -	    $(QEMU_ROOT)/xen-setup-stubdom )
> -	$(MAKE) DESTDIR= -C ioemu -f $(QEMU_ROOT)/Makefile
> -
>   ###
>   # C
>   ###
> @@ -496,11 +435,6 @@ xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
>   # minios
>   ########
>   
> -.PHONY: ioemu-stubdom
> -ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386-stubdom/libqemu.a $(CURDIR)/ioemu/libqemu_common.a
> -ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
> -	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
> -
>   .PHONY: c-stubdom
>   c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
>   	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/c/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=$(CURDIR)/c/main.a
> @@ -544,13 +478,6 @@ else
>   install: $(STUBDOMPATH)
>   endif
>   
> -install-ioemu: ioemu-stubdom
> -	$(INSTALL_DIR) "$(DESTDIR)$(LIBEXEC_BIN)"
> -	$(INSTALL_PROG) stubdom-dm "$(DESTDIR)$(LIBEXEC_BIN)"
> -	$(INSTALL_DATA) stubdompath.sh "$(DESTDIR)$(LIBEXEC_BIN)"
> -	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
> -	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-ioemu/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz"
> -
>   install-grub: pv-grub
>   	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
>   	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz" @@ -593,11 +520,6 @@ else uninstall: endif -uninstall-ioemu: - rm -f 
> $(DESTDIR)$(LIBEXEC_BIN)/stubdom-dm - rm -f 
> $(DESTDIR)$(LIBEXEC_BIN)/stubdompath.sh - rm -f 
> $(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz - uninstall-grub: rm -f 
> $(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz @@ -617,11 
> +539,10 @@ uninstall-vtpmmgr: # clean ####### -# Only clean the 
> libxc/ioemu/mini-os part +# Only clean the libxc/mini-os part .PHONY: 
> clean clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib)) clean: - 
> rm -fr mini-os-$(XEN_TARGET_ARCH)-ioemu rm -fr 
> mini-os-$(XEN_TARGET_ARCH)-c rm -fr mini-os-$(XEN_TARGET_ARCH)-grub rm 
> -fr mini-os-$(XEN_TARGET_ARCH)-xenstore @@ -636,7 +557,6 @@ clean: rm 
> -f *-minios-config.mk rm -f *.gen.cfg rm -fr pkg-config - -[ ! -d 
> ioemu ] || $(MAKE) DESTDIR= -C ioemu clean -[ ! -d xenstore ] || 
> $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean -[ ! -d xenstorepvh 
> ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstorepvh clean @@ -647,7 
> +567,7 @@ crossclean: clean rm -fr newlib-$(XEN_TARGET_ARCH) rm -fr 
> zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH) rm -fr 
> libs-$(XEN_TARGET_ARCH) - rm -fr ioemu xenstore xenstorepvh + rm -fr 
> xenstore xenstorepvh rm -fr gmp-$(XEN_TARGET_ARCH) rm -fr 
> polarssl-$(XEN_TARGET_ARCH) rm -fr tpm_emulator-$(XEN_TARGET_ARCH) 
> diff --git a/stubdom/configure b/stubdom/configure index 
> 08cacf764c..9dd0e7c796 100755 --- a/stubdom/configure +++ 
> b/stubdom/configure @@ -622,7 +622,6 @@ STUBDOM_UNINSTALL 
> STUBDOM_INSTALL STUBDOM_BUILD STUBDOM_TARGETS -ioemu vtpmmgr vtpm 
> TPMEMU_VERSION @@ -713,14 +712,12 @@ SHELL' ac_subst_files='' 
> ac_user_opts=' enable_option_checking -enable_ioemu_stubdom 
> enable_c_stubdom enable_pv_grub enable_xenstore_stubdom 
> enable_xenstorepvh_stubdom enable_vtpm_stubdom enable_vtpmmgr_stubdom 
> -enable_qemu_traditional enable_debug enable_extfiles ' @@ -1363,7 
> +1360,6 @@ Optional Features: --disable-option-checking ignore 
> unrecognized --enable/--with options --disable-FEATURE do not include 
> FEATURE (same as --enable-FEATURE=no) --enable-FEATURE[=ARG] include 
> FEATURE [ARG=yes] - --enable-ioemu-stubdom Build and install 
> ioemu-stubdom --enable-c-stubdom Build and install c-stubdom (default 
> is DISABLED) --enable-pv-grub Build and install pv-grub (default is 
> DISABLED) --disable-xenstore-stubdom @@ -1375,7 +1371,6 @@ Optional 
> Features: --enable-vtpm-stubdom Build and install vtpm-stubdom 
> --enable-vtpmmgr-stubdom Build and install vtpmmgr-stubdom - 
> --disable-debug Disable debug build of stubdom (default is ENABLED) 
> --disable-extfiles Use xen extfiles repository for libraries (default 
> is ENABLED) @@ -2411,40 +2406,6 @@ case $host_os in *\ *) host_os=`echo "$host_os" | sed 's/ /-/g'`;; esac
>   
>   # Enable/disable stub domains
>   
> -# Check whether --enable-ioemu-stubdom was given.
> -if test ${enable_ioemu_stubdom+y}
> -then :
> -  enableval=$enable_ioemu_stubdom;
> -
> -if test "x$enableval" = "xyes"
> -then :
> -
> -
> -ioemu=y
> -STUBDOM_TARGETS="$STUBDOM_TARGETS ioemu"
> -STUBDOM_BUILD="$STUBDOM_BUILD ioemu-stubdom"
> -STUBDOM_INSTALL="$STUBDOM_INSTALL install-ioemu"
> -STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-ioemu"
> -
> -
> -else $as_nop
> -
> -if test "x$enableval" = "xno"
> -then :
> -
> -
> -ioemu=n
> -
> -
> -fi
> -
> -fi
> -
> -
> -fi
> -
> -
> -
>   # Check whether --enable-c-stubdom was given.
>   if test ${enable_c_stubdom+y}
>   then :
> @@ -2685,35 +2646,6 @@ fi
>   
>   
>   
> -# Check whether --enable-qemu-traditional was given.
> -if test ${enable_qemu_traditional+y}
> -then :
> -  enableval=$enable_qemu_traditional;
> -fi
> -
> -if test "x$enable_qemu_traditional" = "xyes"
> -then :
> -
> -    qemu_traditional=y
> -else $as_nop
> -
> -    qemu_traditional=n
> -
> -fi
> -if test "x$ioemu" = "x"
> -then :
> -
> -    ioemu=$qemu_traditional
> -
> -fi
> -echo "x$ioemu$qemu_traditional"
> -if test "x$ioemu$qemu_traditional" = "xyn"
> -then :
> -
> -    as_fn_error $? "IOEMU stubdomain requires qemu-traditional" "$LINENO" 5
> -
> -fi
> -
>   
>   # Check whether --enable-debug was given.
>   if test ${enable_debug+y}
> @@ -4358,27 +4290,6 @@ fi
>   
>   
>   
> -if test "x$ioemu" = "xy" || test "x$ioemu" = "x"
> -then :
> -
> -
> -ioemu=y
> -STUBDOM_TARGETS="$STUBDOM_TARGETS ioemu"
> -STUBDOM_BUILD="$STUBDOM_BUILD ioemu-stubdom"
> -STUBDOM_INSTALL="$STUBDOM_INSTALL install-ioemu"
> -STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-ioemu"
> -
> -
> -else $as_nop
> -
> -
> -ioemu=n
> -
> -
> -fi
> -
> -
> -
>   
>   
>   
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index fc736c0387..f07b08c5b3 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -18,7 +18,6 @@ m4_include([../m4/depends.m4])
>   m4_include([../m4/fetcher.m4])
>   
>   # Enable/disable stub domains
> -AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
>   AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
>   AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
>   AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
> @@ -26,19 +25,6 @@ AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
>   AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
>   AX_STUBDOM_CONDITIONAL([vtpmmgr-stubdom], [vtpmmgr])
>   
> -AC_ARG_ENABLE([qemu-traditional])
> -AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
> -    qemu_traditional=y],[
> -    qemu_traditional=n
> -])
> -AS_IF([test "x$ioemu" = "x"], [
> -    ioemu=$qemu_traditional
> -])
> -echo "x$ioemu$qemu_traditional"
> -AS_IF([test "x$ioemu$qemu_traditional" = "xyn"], [
> -    AC_MSG_ERROR(IOEMU stubdomain requires qemu-traditional)
> -])
> -
>   AX_ARG_DEFAULT_ENABLE([debug], [Disable debug build of stubdom])
>   AX_ARG_DEFAULT_ENABLE([extfiles], [Use xen extfiles repository for libraries])
>   
> @@ -69,7 +55,6 @@ AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
>   #Conditionally enable these stubdoms based on the presense of dependencies
>   AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
>   AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
> -AX_STUBDOM_CONDITIONAL_FINISH([ioemu-stubdom], [ioemu])
>   
>   AX_STUBDOM_FINISH
>   AC_OUTPUT()
> diff --git a/stubdom/ioemu-minios.cfg b/stubdom/ioemu-minios.cfg
> deleted file mode 100644
> index 6153ae05f8..0000000000
> --- a/stubdom/ioemu-minios.cfg
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -CONFIG_LIBC=y
> -CONFIG_LWIP=y
> -CONFIG_START_NETWORK=n
> -CONFIG_QEMU_XS_ARGS=y
> -CONFIG_PCIFRONT=y
> -XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
> diff --git a/tools/Makefile b/tools/Makefile
> index e9e1cda305..6ecf7c0da8 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -24,7 +24,6 @@ SUBDIRS-$(CONFIG_Linux) += vchan
>   
>   # do not recurse in to a dir we are about to delete
>   ifneq "$(MAKECMDGOALS)" "distclean" -SUBDIRS-$(CONFIG_QEMU_TRAD) += qemu-xen-traditional-dir 
> SUBDIRS-$(CONFIG_QEMU_XEN) += qemu-xen-dir endif @@ -79,7 +78,6 @@ 
> clean: subdirs-clean .PHONY: distclean distclean: subdirs-distclean 
> clean - rm -rf qemu-xen-traditional-dir 
> qemu-xen-traditional-dir-remote rm -rf qemu-xen-dir 
> qemu-xen-dir-remote qemu-xen-build rm -rf ../config/Tools.mk config.h 
> config.log config.status \ config.cache autom4te.cache @@ -97,11 +95,6 
> @@ QEMU_UPSTREAM_RPATH := -Wl,-rpath,$(LIBEXEC_LIB) 
> IOEMU_EXTRA_LDFLAGS := endif -QEMU_ROOT := $(shell if [ -d "$(QEMU_TRADITIONAL_LOC)" ]; then echo "$(QEMU_TRADITIONAL_LOC)"; else echo .; fi)
> -ifneq ($(QEMU_ROOT),.)
> -export QEMU_ROOT
> -endif
> -
>   # Targets for external trees:
>   #  ${target}-dir-find
>   #    See if the directory exists and check it out if not.
> @@ -136,54 +129,6 @@ endif
>   #   ${TARGET}_LOC
>   #     The ultimate location of the source (either a local dir or remote URL)
>   
> -# External target: qemu-xen-traditional
> -qemu-xen-traditional-dir-find:
> -	set -ex; \
> -	if test -d $(QEMU_TRADITIONAL_LOC); then \
> -		mkdir -p qemu-xen-traditional-dir; \
> -	else \
> -		export GIT=$(GIT); \
> -		$(XEN_ROOT)/scripts/git-checkout.sh $(QEMU_TRADITIONAL_LOC) $(QEMU_TRADITIONAL_REVISION) qemu-xen-traditional-dir; \
> -	fi
> -
> -.PHONY: qemu-xen-traditional-dir-force-update
> -qemu-xen-traditional-dir-force-update: qemu-xen-traditional-dir-find
> -	set -ex; \
> -	if [ "$(QEMU_TRADITIONAL_REVISION)" ]; then \
> -		cd qemu-xen-traditional-dir-remote; \
> -		$(GIT) fetch origin; \
> -		$(GIT) reset --hard $(QEMU_TRADITIONAL_REVISION); \
> -	fi
> -
> -qemu-traditional-recurse = \
> -	set -e; \
> -		$(buildmakevars2shellvars); \
> -		export CONFIG_BLKTAP1=n; \
> -		export BUILDING_QEMU_TRAD=y; \
> -		cd qemu-xen-traditional-dir; \
> -		$(1)
> -
> -subdir-all-qemu-xen-traditional-dir: qemu-xen-traditional-dir-find
> -	$(call qemu-traditional-recurse,\
> -		$(QEMU_ROOT)/xen-setup \
> -		--extra-cflags="-D__XEN_TOOLS__ $(EXTRA_CFLAGS_QEMU_TRADITIONAL)" \
> -		$(IOEMU_EXTRA_LDFLAGS) \
> -		--cpu=$(IOEMU_CPU_ARCH) \
> -		$(IOEMU_CONFIGURE_CROSS); \
> -		$(MAKE) all \
> -	)
> -
> -subdir-install-qemu-xen-traditional-dir: subdir-all-qemu-xen-traditional-dir
> -	$(call qemu-traditional-recurse,$(MAKE) install)
> -
> -subdir-clean-qemu-xen-traditional-dir:
> -	set -e; if test -d qemu-xen-traditional-dir/.; then \
> -		$(MAKE) -C qemu-xen-traditional-dir clean; \
> -	fi
> -subdir-uninstall-qemu-xen-traditional-dir:
> -	rm -f $(D)$(bindir)/qemu-nbd*
> -	rm -f $(D)$(bindir)/qemu-img*
> -
>   # External target: qemu-xen
>   qemu-xen-dir-find:
>   	if test -d $(QEMU_UPSTREAM_LOC) ; then \
> @@ -276,9 +221,6 @@ subtree-force-update:
>   ifeq ($(CONFIG_QEMU_XEN),y)
>   	$(MAKE) qemu-xen-dir-force-update
>   endif
> -ifeq ($(CONFIG_QEMU_TRAD),y)
> -	$(MAKE) qemu-xen-traditional-dir-force-update
> -endif
>   ifeq ($(CONFIG_X86),y)
>   	$(MAKE) -C firmware subtree-force-update
>   endif
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index 6bd636709f..725c3c32e9 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -134,12 +134,9 @@ endif
>   
>   CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
>   
> -# Don't add -Werror if we are used by qemu-trad build system.
> -ifndef BUILDING_QEMU_TRAD
>   ifeq ($(CONFIG_WERROR),y)
>   CFLAGS += -Werror
>   endif
> -endif
>   
>   ifeq ($(debug),y)
>   # Use -Og if available, -O0 otherwise
> diff --git a/tools/config.h.in b/tools/config.h.in
> index 0bab3cb136..fe2a94cfc4 100644
> --- a/tools/config.h.in
> +++ b/tools/config.h.in
> @@ -42,9 +42,6 @@
>   /* pygrub enabled */
>   #undef HAVE_PYGRUB
>   
> -/* Qemu traditional enabled */
> -#undef HAVE_QEMU_TRADITIONAL
> -
>   /* ROMBIOS enabled */
>   #undef HAVE_ROMBIOS
>   
> diff --git a/tools/configure b/tools/configure
> index e1f6ea6bf5..27ae7c52fb 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -726,7 +726,6 @@ BCC
>   LD86
>   AS86
>   ipxe
> -qemu_traditional
>   LINUX_BACKEND_MODULES
>   pygrub
>   golang
> @@ -835,7 +834,6 @@ enable_seabios
>   enable_golang
>   enable_pygrub
>   with_linux_backend_modules
> -enable_qemu_traditional
>   enable_ipxe
>   with_system_ipxe
>   enable_rombios
> @@ -1518,13 +1516,10 @@ Optional Features:
>     --disable-seabios       Disable SeaBIOS (default is ENABLED)
>     --disable-golang        Disable Go tools (default is ENABLED)
>     --disable-pygrub        Disable pygrub (default is ENABLED)
> -  --enable-qemu-traditional
> -                          Enable qemu traditional device model, (DEFAULT is
> -                          off)
>     --enable-ipxe           Enable in-tree IPXE, (DEFAULT is off, see also
>                             --with-system-ipxe)
> -  --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
> -                          or ipxe is enabled, otherwise off)
> +  --enable-rombios        Enable ROMBIOS, (DEFAULT is on if ipxe is enabled,
> +                          otherwise off)
>     --enable-libfsimage     Enable libfsimage, (DEFAULT is on if pygrub is
>                             enabled, otherwise off)
>     --enable-systemd        Enable systemd support (default is DISABLED)
> @@ -4838,45 +4833,16 @@ fi
>   LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
>   
>   
> -# Check whether --enable-qemu-traditional was given.
> -if test ${enable_qemu_traditional+y}
> -then :
> -  enableval=$enable_qemu_traditional;
> -fi
> -
> -if test "x$enable_qemu_traditional" = "xyes"
> -then :
> -
> -
> -printf "%s\n" "#define HAVE_QEMU_TRADITIONAL 1" >>confdefs.h
> -
> -    qemu_traditional=y
> -else $as_nop
> -
> -    qemu_traditional=n
> -
> -fi
> -
> -
>   # Check whether --enable-ipxe was given.
>   if test ${enable_ipxe+y}
>   then :
>     enableval=$enable_ipxe;
> -else $as_nop
> -
> -    if test "x$enable_qemu_traditional" = "xyes"
> -then :
> -
> -        enable_ipxe="yes"
> -
>   else $as_nop
>   
>           enable_ipxe="no"
>   
>   fi
>   
> -fi
> -
>   if test "x$enable_ipxe" = "xno"
>   then :
>     ipxe=n
> @@ -4912,7 +4878,7 @@ then :
>     enableval=$enable_rombios;
>   else $as_nop
>   
> -    if test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"
> +    if test "x$enable_ipxe" = "xyes"
>   then :
>   
>           enable_rombios="yes"
> @@ -4928,7 +4894,7 @@ fi
>   if test "x$enable_rombios" = "xyes"
>   then :
>   
> -                # Extract the first word of "as86", so it can be a program name with args.
> +    # Extract the first word of "as86", so it can be a program name with args.
>   set dummy as86; ac_word=$2
>   { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   printf %s "checking for $ac_word... " >&6; }
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 0dd6d747ab..dada1c3b15 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -121,25 +121,11 @@ esac])
>   LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
>   AC_SUBST(LINUX_BACKEND_MODULES)
>   
> -AC_ARG_ENABLE([qemu-traditional],
> -    AS_HELP_STRING([--enable-qemu-traditional],
> -                   [Enable qemu traditional device model, (DEFAULT is off)]))
> -AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
> -AC_DEFINE([HAVE_QEMU_TRADITIONAL], [1], [Qemu traditional enabled])
> -    qemu_traditional=y],[
> -    qemu_traditional=n
> -])
> -AC_SUBST(qemu_traditional)
> -
>   AC_ARG_ENABLE([ipxe],
>       AS_HELP_STRING([--enable-ipxe],
>                      [Enable in-tree IPXE,
>                       (DEFAULT is off, see also --with-system-ipxe)]),,[
> -    AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
> -        enable_ipxe="yes"
> -    ], [
>           enable_ipxe="no"
> -    ])
>   ])
>   AS_IF([test "x$enable_ipxe" = "xno"], [ipxe=n], [ipxe=y])
>   AC_ARG_WITH([system-ipxe],
> @@ -162,18 +148,15 @@ AC_SUBST(ipxe)
>   
>   AC_ARG_ENABLE([rombios],
>       AS_HELP_STRING([--enable-rombios],
> -                   [Enable ROMBIOS, (DEFAULT is on if qemu-traditional or ipxe is enabled,
> +                   [Enable ROMBIOS, (DEFAULT is on if ipxe is enabled,
>                       otherwise off)]),,[
> -    AS_IF([test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"], [
> +    AS_IF([test "x$enable_ipxe" = "xyes"], [
>           enable_rombios="yes"
>       ], [
>           enable_rombios="no"
>       ])
>   ])
>   AS_IF([test "x$enable_rombios" = "xyes"], [
> -    dnl as86, ld86, and bcc are only required when building rombios. They
> -    dnl are only needed when the host system is x86 but that check is done
> -    dnl for us above when checking if we should build with qemu-traditional.
>       AX_PATH_PROG_OR_FAIL([AS86], [as86])
>       AX_PATH_PROG_OR_FAIL([LD86], [ld86])
>       AX_PATH_PROG_OR_FAIL([BCC], [bcc])
--------------3N15kRSEuV40hOF0dij5S8hz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/8/25 2:35 PM, Juergen Gross wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20250408123526.14613-5-jgross@suse.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Remove qemu traditional from=
 the tree.

Signed-off-by: Juergen Gross <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
---
 .gitignore                                    |  3 -
 CHANGELOG.md                                  |  1 +</pre>
    </blockquote>
    <pre>For CHANGELOG.md changes LGTM: Acked-by: Oleksii Kurochko <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:oleksii.kurochko@gmail.com">&=
lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type=3D"cite"
      cite=3D"mid:20250408123526.14613-5-jgross@suse.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 Config.mk                                     | 24 -----
 INSTALL                                       | 12 ---
 MAINTAINERS                                   |  4 -
 README                                        |  2 +-
 SUPPORT.md                                    | 16 ----
 config/Tools.mk.in                            |  1 -
 docs/process/branching-checklist.txt          |  1 -
 docs/process/release-technician-checklist.txt |  1 -
 stubdom/Makefile                              | 84 +----------------
 stubdom/configure                             | 89 -------------------
 stubdom/configure.ac                          | 15 ----
 stubdom/ioemu-minios.cfg                      |  6 --
 tools/Makefile                                | 58 ------------
 tools/Rules.mk                                |  3 -
 tools/config.h.in                             |  3 -
 tools/configure                               | 42 +--------
 tools/configure.ac                            | 21 +----
 19 files changed, 10 insertions(+), 376 deletions(-)
 delete mode 100644 stubdom/ioemu-minios.cfg

diff --git a/.gitignore b/.gitignore
index 53f5df0003..ccc0bebee6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -255,9 +255,6 @@ LibVNCServer*
 tools/qemu-xen-dir-remote
 tools/qemu-xen-dir
=20
-tools/qemu-xen-traditional-dir-remote
-tools/qemu-xen-traditional-dir
-
 tools/firmware/seabios-dir-remote
 tools/firmware/seabios-dir
=20
diff --git a/CHANGELOG.md b/CHANGELOG.md
index ce4fcf2feb..d150b9fa1b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,7 @@ The format is based on [Keep a Changelog](<a class=3D"m=
oz-txt-link-freetext" href=3D"https://keepachangelog.com/en/1.0.0/">https=
://keepachangelog.com/en/1.0.0/</a>)
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
=20
 ### Removed
+ - Support of qemu-traditional has been removed.
=20
 ## [4.20.0](<a class=3D"moz-txt-link-freetext" href=3D"https://xenbits.x=
enproject.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3DRELEASE-4.20.0">https:=
//xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3DRELEASE-4.2=
0.0</a>) - 2025-03-05
=20
diff --git a/Config.mk b/Config.mk
index 8be7733d9e..d61257a286 100644
--- a/Config.mk
+++ b/Config.mk
@@ -208,22 +208,12 @@ XEN_EXTFILES_URL ?=3D <a class=3D"moz-txt-link-free=
text" href=3D"https://xenbits.xen.org/xen-extfiles">https://xenbits.xen.o=
rg/xen-extfiles</a>
=20
 # Where to look for inlined subtrees (for example, from a tarball)
 QEMU_UPSTREAM_INTREE ?=3D $(XEN_ROOT)/tools/qemu-xen
-QEMU_TRADITIONAL_INTREE ?=3D $(XEN_ROOT)/tools/qemu-xen-traditional
=20
=20
 # Handle legacy options
 ifneq (,$(SEABIOS_UPSTREAM_TAG))
 SEABIOS_UPSTREAM_REVISION ?=3D $(SEABIOS_UPSTREAM_TAG)
 endif
-ifneq (,$(QEMU_REMOTE))
-QEMU_TRADITIONAL_URL ?=3D $(QEMU_REMOTE)
-endif
-ifneq (,$(CONFIG_QEMU))
-QEMU_TRADITIONAL_LOC ?=3D $(CONFIG_QEMU)
-endif
-ifneq (,$(QEMU_TAG))
-QEMU_TRADITIONAL_REVISION ?=3D $(QEMU_TAG)
-endif
=20
 OVMF_UPSTREAM_URL ?=3D <a class=3D"moz-txt-link-freetext" href=3D"https:=
//xenbits.xen.org/git-http/ovmf.git">https://xenbits.xen.org/git-http/ovm=
f.git</a>
 OVMF_UPSTREAM_REVISION ?=3D ba91d0292e593df8528b66f99c1b0b14fadc8e16
@@ -239,20 +229,6 @@ SEABIOS_UPSTREAM_REVISION ?=3D rel-1.16.3
=20
 ETHERBOOT_NICS ?=3D rtl8139 8086100e
=20
-
-QEMU_TRADITIONAL_URL ?=3D <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://xenbits.xen.org/git-http/qemu-xen-traditional.git">https://xenbits.x=
en.org/git-http/qemu-xen-traditional.git</a>
-QEMU_TRADITIONAL_REVISION ?=3D 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764
-# Wed Jul 15 10:01:40 2020 +0100
-# qemu-trad: remove Xen path dependencies
-
-# Specify which qemu-dm to use. This may be `ioemu' to use the old
-# Mercurial in-tree version, or a local directory, or a git URL.
-# QEMU_UPSTREAM_LOC ?=3D `pwd`/$(XEN_ROOT)/../qemu-xen.git
-
-# Defaults for subtree locations
-QEMU_TRADITIONAL_LOC ?=3D $(call or,$(wildcard $(QEMU_TRADITIONAL_INTREE=
)),\
-                                  $(QEMU_TRADITIONAL_URL))
-
 QEMU_UPSTREAM_LOC ?=3D $(call or,$(wildcard $(QEMU_UPSTREAM_INTREE)),\
                                $(QEMU_UPSTREAM_URL))
=20
diff --git a/INSTALL b/INSTALL
index 88c1464816..786e3da996 100644
--- a/INSTALL
+++ b/INSTALL
@@ -113,15 +113,6 @@ Build a private copy of SeaBIOS.
 Use the given SeaBIOS binary instead of compiling a private copy.
   --with-system-seabios=3DPATH
=20
-Build the old qemu used by xm/xend. This is required if existing domUs
-should be migrated to this host, or if existing domU snapshots should be=

-started with this version of the tools. Only if all domUs used the new
-upstream qemu during initial start it is safe to disable this option.
-The old qemu requires rombios, which can be disable along with
-qemu-traditional.
-  --enable-qemu-traditional
-  --enable-rombios
-
 The libxl toolstack uses the upstream qemu per default. A private copy
 will be built. If desired this private copy can be configured with
 additional options passed to its configure script.
@@ -245,7 +236,6 @@ locations.
 XEN_EXTFILES_URL=3D
 OVMF_UPSTREAM_URL=3D
 QEMU_UPSTREAM_URL=3D
-QEMU_TRADITIONAL_URL=3D
 SEABIOS_UPSTREAM_URL=3D
 MINIOS_UPSTREAM_URL=3D
=20
@@ -253,7 +243,6 @@ Using additional CFLAGS to build tools which will run=
 in dom0 is
 required when building distro packages. These variables can be used to
 pass RPM_OPT_FLAGS.
 EXTRA_CFLAGS_XEN_TOOLS=3D
-EXTRA_CFLAGS_QEMU_TRADITIONAL=3D
 EXTRA_CFLAGS_QEMU_XEN=3D
=20
 Additional CFLAGS may be supplied to the build of the hypervisor by
@@ -340,7 +329,6 @@ sudo make install BOOT_DIR=3D/ood/path/boot EFI_DIR=3D=
/odd/path/efi
 export WGET=3D$(type -P false)
 export GIT=3D$(type -P false)
 export EXTRA_CFLAGS_XEN_TOOLS=3D"$RPM_OPT_FLAGS"
-export EXTRA_CFLAGS_QEMU_TRADITIONAL=3D"$RPM_OPT_FLAGS"
 export EXTRA_CFLAGS_QEMU_XEN=3D"$RPM_OPT_FLAGS"
 %configure \
         --with-initddir=3D%{_initddir}
diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..7d1b3b8641 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -466,10 +466,6 @@ M:	Marek Marczykowski-G=C3=B3recki <a class=3D"moz-t=
xt-link-rfc2396E" href=3D"mailto:marmarek@invisiblethingslab.com">&lt;mar=
marek@invisiblethingslab.com&gt;</a>
 S:	Supported
 F:	tools/python
=20
-QEMU-DM
-S:	Supported
-T:	git <a class=3D"moz-txt-link-freetext" href=3D"https://xenbits.xenpro=
ject.org/git-http/qemu-xen-traditional.git">https://xenbits.xenproject.or=
g/git-http/qemu-xen-traditional.git</a>
-
 QEMU UPSTREAM
 M:	Stefano Stabellini <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
 M:	Anthony Perard <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:anth=
ony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
diff --git a/README b/README
index be90be3910..6ee58f7b35 100644
--- a/README
+++ b/README
@@ -80,7 +80,7 @@ disabled at compile time:
       libnl-3-dev, etc).  Required if network buffering is desired
       when using Remus with libxl.  See docs/README.remus for detailed
       information.
-    * 16-bit x86 assembler, loader and compiler for qemu-traditional / r=
ombios
+    * 16-bit x86 assembler, loader and compiler for rombios
       (dev86 rpm or bin86 &amp; bcc debs)
     * Development install of liblzma for rombios
     * Development install of libbz2, liblzma, liblzo2, and libzstd for D=
omU
diff --git a/SUPPORT.md b/SUPPORT.md
index e8fd0c251e..5eecf1dcbc 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -998,21 +998,6 @@ See the section **Blkback** for image formats suppor=
ted by QEMU.
=20
     Status: Supported, not security supported
=20
-### qemu-xen-traditional ###
-
-The Xen Project provides an old version of qemu with modifications
-which enable use as a device model stub domain.  The old version is
-normally selected by default only in a stub dm configuration, but it
-can be requested explicitly in other configurations, for example in
-`xl` with `device_model_version=3D"QEMU_XEN_TRADITIONAL<a class=3D"moz-t=
xt-link-rfc2396E" href=3D"mailto:`.--Status,DeviceModelStubDomains:Suppor=
ted,withcaveats-Status,ashostprocessdevicemodel:Nosecuritysupport,notreco=
mmended--qemu-xen-traditionalissecuritysupportedonlyforthoseavailable-dev=
iceswhicharesupportedformainstreamQEMU(seeabove),with-trusteddriverdomain=
s(seeDeviceModelStubDomains).-##VirtualFirmware###x86/HVMiPXE@@-1031,7+10=
16,6@@astheguestitself.BootingaguestviaguestBIOSfirmwareStatus,SeaBIOS(qe=
mu-xen):Supported-Status,ROMBIOS(qemu-xen-traditional):Supported###x86/HV=
MOVMFdiff--gita/config/Tools.mk.inb/config/Tools.mk.inindex37c071961e..46=
3ab75965100644---a/config/Tools.mk.in+++b/config/Tools.mk.in@@-43,7+43,6@=
@CONFIG_OVMF:=3D@ovmf@CONFIG_ROMBIOS:=3D@rombios@CONFIG_SEABIOS:=3D@seabi=
os@CONFIG_IPXE:=3D@ipxe@-CONFIG_QEMU_TRAD:=3D@qemu_traditional@CONFIG_QEM=
U_XEN:=3D@qemu_xen@CONFIG_QEMUU_EXTRA_ARGS:=3D@EXTRA_QEMUU_CONFIGURE_ARGS=
@CONFIG_LIBNL:=3D@libnl@diff--gita/docs/process/branching-checklist.txtb/=
docs/process/branching-checklist.txtindexaa7a27eed5..9632888a56100644---a=
/docs/process/branching-checklist.txt+++b/docs/process/branching-checklis=
t.txt@@-71,7+71,6@@ov=3D4.0EnsurereferencestoqemutreesandMini-OSinxen.git=
'sConfig.mkareupdated.Thevariablesandtherecontentshouldbe:*QEMU_UPSTREAM_=
REVISION:qemu-xen-X.Y.0-*QEMU_TRADITIONAL_REVISION:xen-X.Y.0*MINIOS_UPSTR=
EAM_REVISION:xen-RELEASE-X.Y.0WhereX.Yisthereleaseversion(e.g.4.17).diff-=
-gita/docs/process/release-technician-checklist.txtb/docs/process/release=
-technician-checklist.txtindex829e8ec47b..64ed9fd5b2100644---a/docs/proce=
ss/release-technician-checklist.txt+++b/docs/process/release-technician-c=
hecklist.txt@@-56,7+56,6@@t=3DRELEASE-$r*changexen-unstableConfig.mk#QEMU=
_UPSTREAM_REVISION,-#QEMU_TRADITIONAL_REVISION#MINIOS_UPSTREAM_REVISION#(=
dropanyreferencestothespecificcommits,e.g.dateortitle)*changeSUPPORT.mdhe=
adingversionnumber;-unstableor-rctagdiff--gita/stubdom/Makefileb/stubdom/=
Makefileindex724ce40365..82fc1e90f8100644---a/stubdom/Makefile+++b/stubdo=
m/Makefile@@-7,7+7,6@@exportPKG_CONFIG_DIR=3D$(CURDIR)/pkg-config#Removef=
lagswhicharemeantfortools,e.g.">"`.
-
-    Status, Device Model Stub Domains: Supported, with caveats
-    Status, as host process device model: No security support, not recom=
mended
-
-qemu-xen-traditional is security supported only for those available
-devices which are supported for mainstream QEMU (see above), with
-trusted driver domains (see Device Model Stub Domains).
-
 ## Virtual Firmware
=20
 ### x86/HVM iPXE
@@ -1031,7 +1016,6 @@ as the guest itself.
 Booting a guest via guest BIOS firmware
=20
     Status, SeaBIOS (qemu-xen): Supported
-    Status, ROMBIOS (qemu-xen-traditional): Supported
=20
 ### x86/HVM OVMF
=20
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 37c071961e..463ab75965 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -43,7 +43,6 @@ CONFIG_OVMF         :=3D @ovmf@
 CONFIG_ROMBIOS      :=3D @rombios@
 CONFIG_SEABIOS      :=3D @seabios@
 CONFIG_IPXE         :=3D @ipxe@
-CONFIG_QEMU_TRAD    :=3D @qemu_traditional@
 CONFIG_QEMU_XEN     :=3D @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:=3D @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        :=3D @libnl@
diff --git a/docs/process/branching-checklist.txt b/docs/process/branchin=
g-checklist.txt
index aa7a27eed5..9632888a56 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -71,7 +71,6 @@ ov=3D4.0
 Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are u=
pdated.
 The variables and there content should be:
   * QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
-  * QEMU_TRADITIONAL_REVISION: xen-X.Y.0
   * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0
 Where X.Y is the release version (e.g. 4.17).
=20
diff --git a/docs/process/release-technician-checklist.txt b/docs/process=
/release-technician-checklist.txt
index 829e8ec47b..64ed9fd5b2 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -56,7 +56,6 @@ t=3DRELEASE-$r
=20
 * change xen-unstable Config.mk
 #   QEMU_UPSTREAM_REVISION,
-#   QEMU_TRADITIONAL_REVISION
 #   MINIOS_UPSTREAM_REVISION
 #     (drop any references to the specific commits, e.g. date or title)
 * change SUPPORT.md heading version number; -unstable or -rc tag
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 724ce40365..82fc1e90f8 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -7,7 +7,6 @@ export PKG_CONFIG_DIR =3D $(CURDIR)/pkg-config
=20
 # Remove flags which are meant for tools, e.g. "</a>-m64"
 export EXTRA_CFLAGS_XEN_TOOLS=3D
-export EXTRA_CFLAGS_QEMU_TRADITIONAL=3D
=20
 export stubdom=3Dy
 export debug=3Dy
@@ -267,43 +266,6 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
 .PHONY: $(CROSS_ROOT)
 $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
=20
-QEMU_ROOT :=3D $(shell if [ -d "$(QEMU_TRADITIONAL_LOC)" ]; then echo "$=
(QEMU_TRADITIONAL_LOC)"; else echo .; fi)
-
-ifneq ($(filter ioemu,$(STUBDOM_TARGETS)),)
-IOEMU_LINKFARM_TARGET :=3D ioemu/linkfarm.stamp
-endif
-
-ifeq ($(QEMU_ROOT),.)
-$(XEN_ROOT)/tools/qemu-xen-traditional-dir:
-	$(MAKE) DESTDIR=3D -C $(XEN_ROOT)/tools qemu-xen-traditional-dir-find
-
-ioemu/linkfarm.stamp: $(XEN_ROOT)/tools/qemu-xen-traditional-dir
-	mkdir -p ioemu
-	set -e;									\
-	$(buildmakevars2shellvars);						\
-	cd ioemu;								\
-	src=3D"$$XEN_ROOT/tools/qemu-xen-traditional-dir"; export src;		\
-	(cd $$src &amp;&amp; find * -type d						\
-		$(addprefix ! -path , '*-softmmu*' '*-linux-user*') -print)	\
-		| xargs mkdir -p;						\
-	(cd $$src &amp;&amp; find *	! -type l  -type f  $(addprefix ! -path ,	\=

-			'*.[oda1]' 'config-*' config.mak qemu-dm qemu-img-xen	\
-			'*.html' '*.pod' '*-softmmu*' '*-linux-user*'		\
-			)) &gt;linkfarm.stamp.tmp;				\
-	cmp -s linkfarm.stamp.tmp linkfarm.stamp &amp;&amp;			\
-		rm linkfarm.stamp.tmp || {				\
-		mv linkfarm.stamp.tmp linkfarm.stamp;			\
-		cat linkfarm.stamp | while read f;			\
-			do rm -f "$$f"; ln -s "$$src/$$f" "$$f"; done;	\
-	}
-else
-export QEMU_ROOT
-
-ioemu/linkfarm.stamp:
-	mkdir -p ioemu
-	touch ioemu/linkfarm.stamp
-endif
-
 #######
 # libraries under tools/libs
 #######
@@ -380,29 +342,6 @@ $(TARGETS_MINIOS): mini-os-%:
                 mkdir -p $@/$$i ; \
 	done
=20
-#######
-# ioemu
-#######
-
-ioemu-minios.gen.cfg: APP_LIBS =3D evtchn gnttab ctrl guest
-ioemu-minios.gen.cfg: ioemu-minios.cfg Makefile
-	$(GEN_config) &gt;$@
-
-ioemu-minios-config.mk: ioemu-minios.gen.cfg
-	MINIOS_CONFIG=3D"$(CURDIR)/$&lt;" CONFIG_FILE=3D"$(CURDIR)/$@" $(MAKE) =
DESTDIR=3D -C $(MINI_OS) config
-
-.PHONY: ioemu
-ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
-	[ -f ioemu/config-host.mak ] || \
-	  ( $(buildmakevars2shellvars); \
-	    cd ioemu ; \
-	    LWIPDIR=3D$(CURDIR)/lwip-$(XEN_TARGET_ARCH) \
-	    TARGET_CPPFLAGS=3D"$(TARGET_CPPFLAGS) $(shell cat ioemu-minios-conf=
ig.mk)" \
-	    TARGET_CFLAGS=3D"$(TARGET_CFLAGS)" \
-	    TARGET_LDFLAGS=3D"$(TARGET_LDFLAGS)" \
-	    $(QEMU_ROOT)/xen-setup-stubdom )
-	$(MAKE) DESTDIR=3D -C ioemu -f $(QEMU_ROOT)/Makefile
-
 ###
 # C
 ###
@@ -496,11 +435,6 @@ xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config=
=2Emk
 # minios
 ########
=20
-.PHONY: ioemu-stubdom
-ioemu-stubdom: APP_OBJS=3D$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/=
ioemu/i386-stubdom/libqemu.a $(CURDIR)/ioemu/libqemu_common.a
-ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) =
libxenguest ioemu
-	DEF_CPPFLAGS=3D"$(TARGET_CPPFLAGS)" DEF_CFLAGS=3D"$(TARGET_CFLAGS)" DEF=
_LDFLAGS=3D"$(TARGET_LDFLAGS)" MINIOS_CONFIG=3D"$(CURDIR)/ioemu-minios.ge=
n.cfg" $(MAKE) DESTDIR=3D -C $(MINI_OS) OBJ_DIR=3D$(CURDIR)/$&lt; LWIPDIR=
=3D$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=3D"$(APP_OBJS)"
-
 .PHONY: c-stubdom
 c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxengu=
est c
 	DEF_CPPFLAGS=3D"$(TARGET_CPPFLAGS)" DEF_CFLAGS=3D"$(TARGET_CFLAGS)" DEF=
_LDFLAGS=3D"$(TARGET_LDFLAGS)" MINIOS_CONFIG=3D"$(CURDIR)/c/minios.cfg" $=
(MAKE) DESTDIR=3D -C $(MINI_OS) OBJ_DIR=3D$(CURDIR)/$&lt; LWIPDIR=3D$(CUR=
DIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=3D$(CURDIR)/c/main.a
@@ -544,13 +478,6 @@ else
 install: $(STUBDOMPATH)
 endif
=20
-install-ioemu: ioemu-stubdom
-	$(INSTALL_DIR) "$(DESTDIR)$(LIBEXEC_BIN)"
-	$(INSTALL_PROG) stubdom-dm "$(DESTDIR)$(LIBEXEC_BIN)"
-	$(INSTALL_DATA) stubdompath.sh "$(DESTDIR)$(LIBEXEC_BIN)"
-	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
-	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-ioemu/mini-os.gz "$(DESTDIR)=
$(XENFIRMWAREDIR)/ioemu-stubdom.gz"
-
 install-grub: pv-grub
 	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
 	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$=
(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz<a class=3D"moz-txt-link-rf=
c2396E" href=3D"mailto:@@-593,11+520,6@@elseuninstall:endif-uninstall-ioe=
mu:-rm-f$(DESTDIR)$(LIBEXEC_BIN)/stubdom-dm-rm-f$(DESTDIR)$(LIBEXEC_BIN)/=
stubdompath.sh-rm-f$(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz-uninstall=
-grub:rm-f$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz@@-617=
,11+539,10@@uninstall-vtpmmgr:#clean#######-#Onlycleanthelibxc/ioemu/mini=
-ospart+#Onlycleanthelibxc/mini-ospart.PHONY:cleanclean:$(foreachlib,$(ST=
UB_LIBS),clean-libxen$(lib))clean:-rm-frmini-os-$(XEN_TARGET_ARCH)-ioemur=
m-frmini-os-$(XEN_TARGET_ARCH)-crm-frmini-os-$(XEN_TARGET_ARCH)-grubrm-fr=
mini-os-$(XEN_TARGET_ARCH)-xenstore@@-636,7+557,6@@clean:rm-f*-minios-con=
fig.mkrm-f*.gen.cfgrm-frpkg-config--[!-dioemu]||$(MAKE)DESTDIR=3D-Cioemuc=
lean-[!-dxenstore]||$(MAKE)-f$(CURDIR)/xenlibs.mk-Cxenstoreclean-[!-dxens=
torepvh]||$(MAKE)-f$(CURDIR)/xenlibs.mk-Cxenstorepvhclean@@-647,7+567,7@@=
crossclean:cleanrm-frnewlib-$(XEN_TARGET_ARCH)rm-frzlib-$(XEN_TARGET_ARCH=
)pciutils-$(XEN_TARGET_ARCH)rm-frlibs-$(XEN_TARGET_ARCH)-rm-frioemuxensto=
rexenstorepvh+rm-frxenstorexenstorepvhrm-frgmp-$(XEN_TARGET_ARCH)rm-frpol=
arssl-$(XEN_TARGET_ARCH)rm-frtpm_emulator-$(XEN_TARGET_ARCH)diff--gita/st=
ubdom/configureb/stubdom/configureindex08cacf764c..9dd0e7c796100755---a/s=
tubdom/configure+++b/stubdom/configure@@-622,7+622,6@@STUBDOM_UNINSTALLST=
UBDOM_INSTALLSTUBDOM_BUILDSTUBDOM_TARGETS-ioemuvtpmmgrvtpmTPMEMU_VERSION@=
@-713,14+712,12@@SHELL'ac_subst_files=3D''ac_user_opts=3D'enable_option_c=
hecking-enable_ioemu_stubdomenable_c_stubdomenable_pv_grubenable_xenstore=
_stubdomenable_xenstorepvh_stubdomenable_vtpm_stubdomenable_vtpmmgr_stubd=
om-enable_qemu_traditionalenable_debugenable_extfiles'@@-1363,7+1360,6@@O=
ptionalFeatures:--disable-option-checkingignoreunrecognized--enable/--wit=
hoptions--disable-FEATUREdonotincludeFEATURE(sameas--enable-FEATURE=3Dno)=
--enable-FEATURE[=3DARG]includeFEATURE[ARG=3Dyes]---enable-ioemu-stubdomB=
uildandinstallioemu-stubdom--enable-c-stubdomBuildandinstallc-stubdom(def=
aultisDISABLED)--enable-pv-grubBuildandinstallpv-grub(defaultisDISABLED)-=
-disable-xenstore-stubdom@@-1375,7+1371,6@@OptionalFeatures:--enable-vtpm=
-stubdomBuildandinstallvtpm-stubdom--enable-vtpmmgr-stubdomBuildandinstal=
lvtpmmgr-stubdom---disable-debugDisabledebugbuildofstubdom(defaultisENABL=
ED)--disable-extfilesUsexenextfilesrepositoryforlibraries(defaultisENABLE=
D)@@-2411,40+2406,6@@case$host_osin*\*)host_os=3D`echo">"
@@ -593,11 +520,6 @@ else
 uninstall:
 endif
=20
-uninstall-ioemu:
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/stubdom-dm
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/stubdompath.sh
-	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz
-
 uninstall-grub:
 	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz
=20
@@ -617,11 +539,10 @@ uninstall-vtpmmgr:
 # clean
 #######
=20
-# Only clean the libxc/ioemu/mini-os part
+# Only clean the libxc/mini-os part
 .PHONY: clean
 clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib))
 clean:
-	rm -fr mini-os-$(XEN_TARGET_ARCH)-ioemu
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-c
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-grub
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstore
@@ -636,7 +557,6 @@ clean:
 	rm -f *-minios-config.mk
 	rm -f *.gen.cfg
 	rm -fr pkg-config
-	-[ ! -d ioemu ] || $(MAKE) DESTDIR=3D -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean=

 	-[ ! -d xenstorepvh ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstorepvh=
 clean
=20
@@ -647,7 +567,7 @@ crossclean: clean
 	rm -fr newlib-$(XEN_TARGET_ARCH)
 	rm -fr zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
-	rm -fr ioemu xenstore xenstorepvh
+	rm -fr xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
 	rm -fr polarssl-$(XEN_TARGET_ARCH)
 	rm -fr tpm_emulator-$(XEN_TARGET_ARCH)
diff --git a/stubdom/configure b/stubdom/configure
index 08cacf764c..9dd0e7c796 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -622,7 +622,6 @@ STUBDOM_UNINSTALL
 STUBDOM_INSTALL
 STUBDOM_BUILD
 STUBDOM_TARGETS
-ioemu
 vtpmmgr
 vtpm
 TPMEMU_VERSION
@@ -713,14 +712,12 @@ SHELL'
 ac_subst_files=3D''
 ac_user_opts=3D'
 enable_option_checking
-enable_ioemu_stubdom
 enable_c_stubdom
 enable_pv_grub
 enable_xenstore_stubdom
 enable_xenstorepvh_stubdom
 enable_vtpm_stubdom
 enable_vtpmmgr_stubdom
-enable_qemu_traditional
 enable_debug
 enable_extfiles
 '
@@ -1363,7 +1360,6 @@ Optional Features:
   --disable-option-checking  ignore unrecognized --enable/--with options=

   --disable-FEATURE       do not include FEATURE (same as --enable-FEATU=
RE=3Dno)
   --enable-FEATURE[=3DARG]  include FEATURE [ARG=3Dyes]
-  --enable-ioemu-stubdom  Build and install ioemu-stubdom
   --enable-c-stubdom      Build and install c-stubdom (default is DISABL=
ED)
   --enable-pv-grub        Build and install pv-grub (default is DISABLED=
)
   --disable-xenstore-stubdom
@@ -1375,7 +1371,6 @@ Optional Features:
   --enable-vtpm-stubdom   Build and install vtpm-stubdom
   --enable-vtpmmgr-stubdom
                           Build and install vtpmmgr-stubdom
-
   --disable-debug         Disable debug build of stubdom (default is ENA=
BLED)
   --disable-extfiles      Use xen extfiles repository for libraries (def=
ault
                           is ENABLED)
@@ -2411,40 +2406,6 @@ case $host_os in *\ *) host_os=3D`echo "</a>$host_=
os" | sed 's/ /-/g'`;; esac
=20
 # Enable/disable stub domains
=20
-# Check whether --enable-ioemu-stubdom was given.
-if test ${enable_ioemu_stubdom+y}
-then :
-  enableval=3D$enable_ioemu_stubdom;
-
-if test "x$enableval" =3D "xyes"
-then :
-
-
-ioemu=3Dy
-STUBDOM_TARGETS=3D"$STUBDOM_TARGETS ioemu"
-STUBDOM_BUILD=3D"$STUBDOM_BUILD ioemu-stubdom"
-STUBDOM_INSTALL=3D"$STUBDOM_INSTALL install-ioemu"
-STUBDOM_UNINSTALL=3D"$STUBDOM_UNINSTALL install-ioemu"
-
-
-else $as_nop
-
-if test "x$enableval" =3D "xno"
-then :
-
-
-ioemu=3Dn
-
-
-fi
-
-fi
-
-
-fi
-
-
-
 # Check whether --enable-c-stubdom was given.
 if test ${enable_c_stubdom+y}
 then :
@@ -2685,35 +2646,6 @@ fi
=20
=20
=20
-# Check whether --enable-qemu-traditional was given.
-if test ${enable_qemu_traditional+y}
-then :
-  enableval=3D$enable_qemu_traditional;
-fi
-
-if test "x$enable_qemu_traditional" =3D "xyes"
-then :
-
-    qemu_traditional=3Dy
-else $as_nop
-
-    qemu_traditional=3Dn
-
-fi
-if test "x$ioemu" =3D "x"
-then :
-
-    ioemu=3D$qemu_traditional
-
-fi
-echo "x$ioemu$qemu_traditional"
-if test "x$ioemu$qemu_traditional" =3D "xyn"
-then :
-
-    as_fn_error $? "IOEMU stubdomain requires qemu-traditional" "$LINENO=
" 5
-
-fi
-
=20
 # Check whether --enable-debug was given.
 if test ${enable_debug+y}
@@ -4358,27 +4290,6 @@ fi
=20
=20
=20
-if test "x$ioemu" =3D "xy" || test "x$ioemu" =3D "x"
-then :
-
-
-ioemu=3Dy
-STUBDOM_TARGETS=3D"$STUBDOM_TARGETS ioemu"
-STUBDOM_BUILD=3D"$STUBDOM_BUILD ioemu-stubdom"
-STUBDOM_INSTALL=3D"$STUBDOM_INSTALL install-ioemu"
-STUBDOM_UNINSTALL=3D"$STUBDOM_UNINSTALL install-ioemu"
-
-
-else $as_nop
-
-
-ioemu=3Dn
-
-
-fi
-
-
-
=20
=20
=20
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index fc736c0387..f07b08c5b3 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -18,7 +18,6 @@ m4_include([../m4/depends.m4])
 m4_include([../m4/fetcher.m4])
=20
 # Enable/disable stub domains
-AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
 AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
 AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
 AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
@@ -26,19 +25,6 @@ AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xens=
torepvh])
 AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL([vtpmmgr-stubdom], [vtpmmgr])
=20
-AC_ARG_ENABLE([qemu-traditional])
-AS_IF([test "x$enable_qemu_traditional" =3D "xyes"], [
-    qemu_traditional=3Dy],[
-    qemu_traditional=3Dn
-])
-AS_IF([test "x$ioemu" =3D "x"], [
-    ioemu=3D$qemu_traditional
-])
-echo "x$ioemu$qemu_traditional"
-AS_IF([test "x$ioemu$qemu_traditional" =3D "xyn"], [
-    AC_MSG_ERROR(IOEMU stubdomain requires qemu-traditional)
-])
-
 AX_ARG_DEFAULT_ENABLE([debug], [Disable debug build of stubdom])
 AX_ARG_DEFAULT_ENABLE([extfiles], [Use xen extfiles repository for libra=
ries])
=20
@@ -69,7 +55,6 @@ AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
 #Conditionally enable these stubdoms based on the presense of dependenci=
es
 AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
-AX_STUBDOM_CONDITIONAL_FINISH([ioemu-stubdom], [ioemu])
=20
 AX_STUBDOM_FINISH
 AC_OUTPUT()
diff --git a/stubdom/ioemu-minios.cfg b/stubdom/ioemu-minios.cfg
deleted file mode 100644
index 6153ae05f8..0000000000
--- a/stubdom/ioemu-minios.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-CONFIG_LIBC=3Dy
-CONFIG_LWIP=3Dy
-CONFIG_START_NETWORK=3Dn
-CONFIG_QEMU_XS_ARGS=3Dy
-CONFIG_PCIFRONT=3Dy
-XEN_INTERFACE_VERSION=3D__XEN_LATEST_INTERFACE_VERSION__
diff --git a/tools/Makefile b/tools/Makefile
index e9e1cda305..6ecf7c0da8 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -24,7 +24,6 @@ SUBDIRS-$(CONFIG_Linux) +=3D vchan
=20
 # do not recurse in to a dir we are about to delete
 ifneq "$(MAKECMDGOALS)" "distclean<a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:-SUBDIRS-$(CONFIG_QEMU_TRAD)+=3Dqemu-xen-traditional-dirSUBDI=
RS-$(CONFIG_QEMU_XEN)+=3Dqemu-xen-direndif@@-79,7+78,6@@clean:subdirs-cle=
an.PHONY:distcleandistclean:subdirs-distcleanclean-rm-rfqemu-xen-traditio=
nal-dirqemu-xen-traditional-dir-remoterm-rfqemu-xen-dirqemu-xen-dir-remot=
eqemu-xen-buildrm-rf../config/Tools.mkconfig.hconfig.logconfig.status\con=
fig.cacheautom4te.cache@@-97,11+95,6@@QEMU_UPSTREAM_RPATH:=3D-Wl,-rpath,$=
(LIBEXEC_LIB)IOEMU_EXTRA_LDFLAGS:=3Dendif-QEMU_ROOT:=3D$(shellif[-d">"
-SUBDIRS-$(CONFIG_QEMU_TRAD) +=3D qemu-xen-traditional-dir
 SUBDIRS-$(CONFIG_QEMU_XEN) +=3D qemu-xen-dir
 endif
=20
@@ -79,7 +78,6 @@ clean: subdirs-clean
=20
 .PHONY: distclean
 distclean: subdirs-distclean clean
-	rm -rf qemu-xen-traditional-dir qemu-xen-traditional-dir-remote
 	rm -rf qemu-xen-dir qemu-xen-dir-remote qemu-xen-build
 	rm -rf ../config/Tools.mk config.h config.log config.status \
 		config.cache autom4te.cache
@@ -97,11 +95,6 @@ QEMU_UPSTREAM_RPATH :=3D -Wl,-rpath,$(LIBEXEC_LIB)
 IOEMU_EXTRA_LDFLAGS :=3D
 endif
=20
-QEMU_ROOT :=3D $(shell if [ -d "</a>$(QEMU_TRADITIONAL_LOC)" ]; then ech=
o "$(QEMU_TRADITIONAL_LOC)"; else echo .; fi)
-ifneq ($(QEMU_ROOT),.)
-export QEMU_ROOT
-endif
-
 # Targets for external trees:
 #  ${target}-dir-find
 #    See if the directory exists and check it out if not.
@@ -136,54 +129,6 @@ endif
 #   ${TARGET}_LOC
 #     The ultimate location of the source (either a local dir or remote =
URL)
=20
-# External target: qemu-xen-traditional
-qemu-xen-traditional-dir-find:
-	set -ex; \
-	if test -d $(QEMU_TRADITIONAL_LOC); then \
-		mkdir -p qemu-xen-traditional-dir; \
-	else \
-		export GIT=3D$(GIT); \
-		$(XEN_ROOT)/scripts/git-checkout.sh $(QEMU_TRADITIONAL_LOC) $(QEMU_TRA=
DITIONAL_REVISION) qemu-xen-traditional-dir; \
-	fi
-
-.PHONY: qemu-xen-traditional-dir-force-update
-qemu-xen-traditional-dir-force-update: qemu-xen-traditional-dir-find
-	set -ex; \
-	if [ "$(QEMU_TRADITIONAL_REVISION)" ]; then \
-		cd qemu-xen-traditional-dir-remote; \
-		$(GIT) fetch origin; \
-		$(GIT) reset --hard $(QEMU_TRADITIONAL_REVISION); \
-	fi
-
-qemu-traditional-recurse =3D \
-	set -e; \
-		$(buildmakevars2shellvars); \
-		export CONFIG_BLKTAP1=3Dn; \
-		export BUILDING_QEMU_TRAD=3Dy; \
-		cd qemu-xen-traditional-dir; \
-		$(1)
-
-subdir-all-qemu-xen-traditional-dir: qemu-xen-traditional-dir-find
-	$(call qemu-traditional-recurse,\
-		$(QEMU_ROOT)/xen-setup \
-		--extra-cflags=3D"-D__XEN_TOOLS__ $(EXTRA_CFLAGS_QEMU_TRADITIONAL)" \
-		$(IOEMU_EXTRA_LDFLAGS) \
-		--cpu=3D$(IOEMU_CPU_ARCH) \
-		$(IOEMU_CONFIGURE_CROSS); \
-		$(MAKE) all \
-	)
-
-subdir-install-qemu-xen-traditional-dir: subdir-all-qemu-xen-traditional=
-dir
-	$(call qemu-traditional-recurse,$(MAKE) install)
-
-subdir-clean-qemu-xen-traditional-dir:
-	set -e; if test -d qemu-xen-traditional-dir/.; then \
-		$(MAKE) -C qemu-xen-traditional-dir clean; \
-	fi
-subdir-uninstall-qemu-xen-traditional-dir:
-	rm -f $(D)$(bindir)/qemu-nbd*
-	rm -f $(D)$(bindir)/qemu-img*
-
 # External target: qemu-xen
 qemu-xen-dir-find:
 	if test -d $(QEMU_UPSTREAM_LOC) ; then \
@@ -276,9 +221,6 @@ subtree-force-update:
 ifeq ($(CONFIG_QEMU_XEN),y)
 	$(MAKE) qemu-xen-dir-force-update
 endif
-ifeq ($(CONFIG_QEMU_TRAD),y)
-	$(MAKE) qemu-xen-traditional-dir-force-update
-endif
 ifeq ($(CONFIG_X86),y)
 	$(MAKE) -C firmware subtree-force-update
 endif
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 6bd636709f..725c3c32e9 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -134,12 +134,9 @@ endif
=20
 CFLAGS_libxenlight +=3D $(CFLAGS_libxenctrl)
=20
-# Don't add -Werror if we are used by qemu-trad build system.
-ifndef BUILDING_QEMU_TRAD
 ifeq ($(CONFIG_WERROR),y)
 CFLAGS +=3D -Werror
 endif
-endif
=20
 ifeq ($(debug),y)
 # Use -Og if available, -O0 otherwise
diff --git a/tools/config.h.in b/tools/config.h.in
index 0bab3cb136..fe2a94cfc4 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -42,9 +42,6 @@
 /* pygrub enabled */
 #undef HAVE_PYGRUB
=20
-/* Qemu traditional enabled */
-#undef HAVE_QEMU_TRADITIONAL
-
 /* ROMBIOS enabled */
 #undef HAVE_ROMBIOS
=20
diff --git a/tools/configure b/tools/configure
index e1f6ea6bf5..27ae7c52fb 100755
--- a/tools/configure
+++ b/tools/configure
@@ -726,7 +726,6 @@ BCC
 LD86
 AS86
 ipxe
-qemu_traditional
 LINUX_BACKEND_MODULES
 pygrub
 golang
@@ -835,7 +834,6 @@ enable_seabios
 enable_golang
 enable_pygrub
 with_linux_backend_modules
-enable_qemu_traditional
 enable_ipxe
 with_system_ipxe
 enable_rombios
@@ -1518,13 +1516,10 @@ Optional Features:
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
   --disable-pygrub        Disable pygrub (default is ENABLED)
-  --enable-qemu-traditional
-                          Enable qemu traditional device model, (DEFAULT=
 is
-                          off)
   --enable-ipxe           Enable in-tree IPXE, (DEFAULT is off, see also=

                           --with-system-ipxe)
-  --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditi=
onal
-                          or ipxe is enabled, otherwise off)
+  --enable-rombios        Enable ROMBIOS, (DEFAULT is on if ipxe is enab=
led,
+                          otherwise off)
   --enable-libfsimage     Enable libfsimage, (DEFAULT is on if pygrub is=

                           enabled, otherwise off)
   --enable-systemd        Enable systemd support (default is DISABLED)
@@ -4838,45 +4833,16 @@ fi
 LINUX_BACKEND_MODULES=3D"`eval echo $LINUX_BACKEND_MODULES`"
=20
=20
-# Check whether --enable-qemu-traditional was given.
-if test ${enable_qemu_traditional+y}
-then :
-  enableval=3D$enable_qemu_traditional;
-fi
-
-if test "x$enable_qemu_traditional" =3D "xyes"
-then :
-
-
-printf "%s\n" "#define HAVE_QEMU_TRADITIONAL 1" &gt;&gt;confdefs.h
-
-    qemu_traditional=3Dy
-else $as_nop
-
-    qemu_traditional=3Dn
-
-fi
-
-
 # Check whether --enable-ipxe was given.
 if test ${enable_ipxe+y}
 then :
   enableval=3D$enable_ipxe;
-else $as_nop
-
-    if test "x$enable_qemu_traditional" =3D "xyes"
-then :
-
-        enable_ipxe=3D"yes"
-
 else $as_nop
=20
         enable_ipxe=3D"no"
=20
 fi
=20
-fi
-
 if test "x$enable_ipxe" =3D "xno"
 then :
   ipxe=3Dn
@@ -4912,7 +4878,7 @@ then :
   enableval=3D$enable_rombios;
 else $as_nop
=20
-    if test "x$enable_qemu_traditional" =3D "xyes" -o "x$enable_ipxe" =3D=
 "xyes"
+    if test "x$enable_ipxe" =3D "xyes"
 then :
=20
         enable_rombios=3D"yes"
@@ -4928,7 +4894,7 @@ fi
 if test "x$enable_rombios" =3D "xyes"
 then :
=20
-                # Extract the first word of "as86", so it can be a progr=
am name with args.
+    # Extract the first word of "as86", so it can be a program name with=
 args.
 set dummy as86; ac_word=3D$2
 { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" &gt=
;&amp;5
 printf %s "checking for $ac_word... " &gt;&amp;6; }
diff --git a/tools/configure.ac b/tools/configure.ac
index 0dd6d747ab..dada1c3b15 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -121,25 +121,11 @@ esac])
 LINUX_BACKEND_MODULES=3D"`eval echo $LINUX_BACKEND_MODULES`"
 AC_SUBST(LINUX_BACKEND_MODULES)
=20
-AC_ARG_ENABLE([qemu-traditional],
-    AS_HELP_STRING([--enable-qemu-traditional],
-                   [Enable qemu traditional device model, (DEFAULT is of=
f)]))
-AS_IF([test "x$enable_qemu_traditional" =3D "xyes"], [
-AC_DEFINE([HAVE_QEMU_TRADITIONAL], [1], [Qemu traditional enabled])
-    qemu_traditional=3Dy],[
-    qemu_traditional=3Dn
-])
-AC_SUBST(qemu_traditional)
-
 AC_ARG_ENABLE([ipxe],
     AS_HELP_STRING([--enable-ipxe],
                    [Enable in-tree IPXE,
                     (DEFAULT is off, see also --with-system-ipxe)]),,[
-    AS_IF([test "x$enable_qemu_traditional" =3D "xyes"], [
-        enable_ipxe=3D"yes"
-    ], [
         enable_ipxe=3D"no"
-    ])
 ])
 AS_IF([test "x$enable_ipxe" =3D "xno"], [ipxe=3Dn], [ipxe=3Dy])
 AC_ARG_WITH([system-ipxe],
@@ -162,18 +148,15 @@ AC_SUBST(ipxe)
=20
 AC_ARG_ENABLE([rombios],
     AS_HELP_STRING([--enable-rombios],
-                   [Enable ROMBIOS, (DEFAULT is on if qemu-traditional o=
r ipxe is enabled,
+                   [Enable ROMBIOS, (DEFAULT is on if ipxe is enabled,
                     otherwise off)]),,[
-    AS_IF([test "x$enable_qemu_traditional" =3D "xyes" -o "x$enable_ipxe=
" =3D "xyes"], [
+    AS_IF([test "x$enable_ipxe" =3D "xyes"], [
         enable_rombios=3D"yes"
     ], [
         enable_rombios=3D"no"
     ])
 ])
 AS_IF([test "x$enable_rombios" =3D "xyes"], [
-    dnl as86, ld86, and bcc are only required when building rombios. The=
y
-    dnl are only needed when the host system is x86 but that check is do=
ne
-    dnl for us above when checking if we should build with qemu-traditio=
nal.
     AX_PATH_PROG_OR_FAIL([AS86], [as86])
     AX_PATH_PROG_OR_FAIL([LD86], [ld86])
     AX_PATH_PROG_OR_FAIL([BCC], [bcc])
</pre>
    </blockquote>
  </body>
</html>

--------------3N15kRSEuV40hOF0dij5S8hz--

