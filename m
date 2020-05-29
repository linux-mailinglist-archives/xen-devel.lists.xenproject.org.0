Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA401E7BD5
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedDg-0000NH-Tk; Fri, 29 May 2020 11:30:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz0h=7L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jedDf-0000Mh-Kz
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:30:35 +0000
X-Inumbo-ID: cf9d655a-a19f-11ea-9947-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf9d655a-a19f-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:30:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so3106597wrt.9
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=sz1FcDFLMegKlUZkDsfZp3Ndlk2QZ4y65naYGuGgzZ4=;
 b=jbhoKm2h1VwIxBjfDrvHZi4N3CWp0Q9vEEnRgo/8De8lsy25j4flxsOgnUO+QJz+yc
 VPK8gGykJY3MjksCdGjYJkkZB5AEKhlTQ3Uv6W4Da+GRQQIQkPkDvuA8g5eLiOs/NqRe
 fnytXAUA+RLp69uMCVUoL9e6GANPu2IrntVG0BMfIx2RsKzd2xk+ITkNhGQc6VEjeF4B
 gmvcSdbNAqVmJ3kd5A721RfTFoe9QWBVeW9vPaNIjhyW3CH7wKxhpiscQ6B9I0+Nn6lx
 lYW2i2a4sbAjrUpQZ1jM0IchNw7aIE0wpNEWckDhcirLl9EXZe1fiXKegAExzcGzXjF2
 nXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=sz1FcDFLMegKlUZkDsfZp3Ndlk2QZ4y65naYGuGgzZ4=;
 b=uMk/2GlfAMLM8Safwc5wWOyMK7w5lMxGK0koJucK1poMMaSTj2CZigarqCytxI40HX
 eqOZ1wtQ8lmYwkdYIuflZh7+vMu73kD+CjE+OCTRuMADSgBdiIKHf+5cnExiO0a/leak
 462yuXOkxnc2Q4uCsYww7mixnbNlhy3ny3pZC4WAhDaYYlm6gHDPjcyKg59bjwY9TzhD
 j2/3w0k1TZSoSwjSV3vBNHgB8x2iPj+VSWIDm/zuHGmkgnS+25A8eQiFjWEKzuppPPjp
 e4zM5u8SzaAF4kIBWVVThy7obRBlF3xOzXi8N/EWLyjMLU7I3R3zbyQhNg8bYf2IWa3/
 8z/Q==
X-Gm-Message-State: AOAM531MUPMmbXWaGmqHoDFpmLuJ7ERh/faAT6P8MGzZDeOGLxYDf0vC
 DPsVpKKci3GIT5FR4OoRw+Q=
X-Google-Smtp-Source: ABdhPJw5gUHgQzVpWfymafzik1vjb7np8MPJfZuQgVzbfXSev0O6vfk96ckzO5C4zvOHcPF4K2iE5Q==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr8938355wrt.29.1590751833907;
 Fri, 29 May 2020 04:30:33 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id l17sm10213603wmi.3.2020.05.29.04.30.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:30:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
Subject: RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
Date: Fri, 29 May 2020 12:30:31 +0100
Message-ID: <005401d635ac$90bf9510$b23ebf30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH6xReBsxPpGuE++Yl5QcE4sAtmFah1zWCQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: committers@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@eu.citrix.com>
> Sent: 29 May 2020 12:19
> To: xen-devel@lists.xenproject.org; Paul Durrant <paul@xen.org>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>; committers@xenproject.org
> Subject: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
> 
> This series looks about as ready as it is going to be.  Unfortunately
> there are still two issues, each of which cropped up once in my final
> formal retest.  See below.
> 
> What are people's opinions?  Should I push this to osstest pretest
> soon after the Xen codefreeze (eg, after we get the first push after
> freeze) ?
> 

That sounds reasonable; I don't think we want to perturb osstest until after the first push.

> The downside would be introducing new low-probability heisenbugs.  But
> in my tests it seems that some existing heisenbugs may be abated.
> It's hard to say for sure.  The upside is a lower risk that Debian
> will break our stuff and also being able to commission a number of
> machines which do not work with stretch (Debian oldstable).
> 

I assume we can revert if things go badly wrong and being able to commission more machines would seem to be quite beneficial at this
stage.

  Paul

> The two issues:
> 
> 1. In one test, libvirt segfaulted.  This is with osstest's own-built
>    tested version of libvirt; osstest's own-build tested version of
>    Linux; and osstest's own-built xen.git#master.
> 
>    http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-i386-libvirt/info.html
>    http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-i386-libvirt/rimava1---var-log-
> kern.log.gz
>    | May 28 21:39:11 rimava1 kernel: [ 1146.326593] libvirtd[16868]: segfault at 820 ip b72535b0 sp
> abce5090 error 4 in libc-2.28.so[b71f0000+14e000]
> 
> 2. In one test, the Debian installer hung.  The kernel printed many
>    soft lockup messages.  This is with osstest's own dom0 kernel and
>    hypervisor, but the 4.19.67-2+deb10u1 kernel from Debian.
> 
>    http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-amd64-xl-qemut-debianhvm-i386-
> xsm/info.html
>    http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-amd64-xl-qemut-debianhvm-i386-
> xsm/godello1---var-log-xen-qemu-dm-debianhvm.guest.osstest.log.gz
> 
> Ian Jackson (49):
>   ts-logs-capture: Cope if xl shutdown leaves domain running for a bit
>   ts-xen-build-prep: Install rsync
>   lvcreate argments: pass --yes -Z y -W y
>   TestSupport: allow more time for apt
>   Booting: Use `--' rather than `---' to introduce host cmdline
>   di_installcmdline_core: Pass locale on d-i command line
>   setupboot_grub2: Drop $submenu variable
>   ts-leak-check: Ignore buster's udevd too
>   Bodge systemd random seed arrangements
>   Debian guests made with xen-tools: Write systemd random seed file
>   ts-debian-di-install: Provide guest with more RAM
>   Debian: preseed: use priority= alias
>   Debian: Specify `priority=critical' rather than locale
>   Honour 'LinuxSerialConsole <suite>' host property
>   buster: make-hosts-flight: Add to possible suites for hosts flight
>   buster: Extend grub2 uefi no install workaround
>   buster: ts-host-install: Extend net.ifnames workaround
>   buster: Deinstall the "systemd" package
>   buster: preseed partman-auto-lvm/guided_size
>   buster: ts-host-install: NTP not honoured bug remains
>   buster: Extend ARM clock workaround
>   buster: Extend guest bootloader workaround
>   Honour DebianImageFile_SUITE_ARCH
>   buster: Specify DebianImageFile_SUITE_ARCH
>   20_linux_xen: Copy Debian buster version into our initramfs area
>   20_linux_xen: Adhoc template substitution
>   20_linux_xen: Ignore xenpolicy and config files too
>   20_linux_xen: Support Xen Security Modules (XSM/FLASK)
>   mg-debian-installer-update: support overlay-intramfs-SUITE
>   overlay-initrd-buster/sbin/reopen-console: Copy from Debian
>   overlay-initrd-buster/sbin/reopen-console: Fix #932416
>   buster: chiark-scripts: Install a new version on buster too
>   buster: Provide TftpDiVersion
>   buster: grub, arm64: extend chainloading workaround
>   buster: setupboot_grub2: Note what files exist in /boot
>   buster: setupboot_grub2: Handle missing policy file bug
>   buster: Extend workaround for dhcpd EROFS bug
>   ts-xen-install: Add $ho argument to some_extradebs
>   ts-xen-install: Move some_extradebs to Debian.pm
>   Debian.pm: Break out standard_extradebs
>   Debian.pm: Move standard_extradebs to ts-host-install
>   buster: Install own linux-libc-dev package (!)
>   setupboot_grub2: Insist on space after directives
>   setupboot_grub2: Print line number of entry we are using
>   setupboot_grub2: Recognise --nounzip for initramfs
>   setupboot_grub2: Copy hv command line from grub to xen.cfg
>   setupboot_grub2: Do not boot with XSM policy etc. unless xsm=1
>   buster 20_linux_xen: Only load policy in XSM-enabled builds
>   buster: Switch to Debian buster as the default suite
> 
>  Osstest.pm                                    |   2 +-
>  Osstest/Debian.pm                             | 128 +++++--
>  Osstest/TestSupport.pm                        |  15 +-
>  make-hosts-flight                             |   2 +-
>  mfi-common                                    |   9 +
>  mg-debian-installer-update                    |  20 ++
>  overlay-buster/etc/grub.d/20_linux_xen        | 327 ++++++++++++++++++
>  overlay-initrd-buster/sbin/reopen-console     | 126 +++++++
>  .../override.conf                             |   3 +
>  overlay/usr/local/bin/random-seed-add         |  33 ++
>  production-config                             |   5 +
>  ts-debian-di-install                          |   2 +-
>  ts-debian-fixup                               |   6 +
>  ts-host-install                               |   6 +-
>  ts-leak-check                                 |   1 +
>  ts-logs-capture                               |   1 +
>  ts-xen-build-prep                             |   6 +-
>  ts-xen-install                                |  41 +--
>  18 files changed, 656 insertions(+), 77 deletions(-)
>  create mode 100755 overlay-buster/etc/grub.d/20_linux_xen
>  create mode 100755 overlay-initrd-buster/sbin/reopen-console
>  create mode 100644 overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
>  create mode 100755 overlay/usr/local/bin/random-seed-add
> 
> --
> 2.20.1



