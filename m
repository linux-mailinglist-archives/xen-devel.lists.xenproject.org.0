Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A458C5906DB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 21:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385111.620646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMDZf-0004Av-B1; Thu, 11 Aug 2022 19:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385111.620646; Thu, 11 Aug 2022 19:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMDZf-00048G-8I; Thu, 11 Aug 2022 19:10:31 +0000
Received: by outflank-mailman (input) for mailman id 385111;
 Thu, 11 Aug 2022 19:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8gOk=YP=canonical.com=mfo@srs-se1.protection.inumbo.net>)
 id 1oMDZd-0003so-S0
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 19:10:29 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 428ad19f-19a9-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 21:10:27 +0200 (CEST)
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 418093FB95
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 19:10:27 +0000 (UTC)
Received: by mail-vs1-f70.google.com with SMTP id
 124-20020a670882000000b00388cd45f433so1751644vsi.8
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 12:10:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4e1:83a2:2ee9:2118:a2dc:3dd6])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a67ea07000000b00384b60a5160sm120094vso.12.2022.08.11.12.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 12:10:25 -0700 (PDT)
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
X-Inumbo-ID: 428ad19f-19a9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660245027;
	bh=hUhj4xVWV7i7kcWOSw9PKIOewcy2KLy7hUSFmlSeALs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JvfFDGvxb4Ky1UyLUiF1YIdF6mYNxCfwhk09hK6SY0yqMo+lOG0wljB0qxkLwTbCr
	 kN5pKEOKE7+SX6uV8DBhdG9NHglkuaA2DbrJz+xvo7c/3Fc4NQKyvJRpsdo3zPj0HB
	 wkG4yuiAg9c7FIbasgkYcycoIa2ZNQ8R2ftotSkAsetEQHqWBMRL7vDUhTvqXu1Uqc
	 KZisrNZtloq1YoHnwOT3ugj91M43/isBjwETWksWupBWqUzCZd0V9cUF7rx/D7Eael
	 +gGAVMSlKbDp2BIWdLS0EtyTh/GEj525rOvo9hJWysEmM7DSnmfoWbjlwlqsdia4F9
	 T/5S41C+PmIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hUhj4xVWV7i7kcWOSw9PKIOewcy2KLy7hUSFmlSeALs=;
        b=jKCPbq3j42olQQl1h+ZtjyPXp3hGhzpBkDDuTx6Dxg19YgL6lW66s7yHUvg9FV/cUK
         Fh8wpt5OXb5br6cWD1iyLCxxATCKl83cfi3o3a5aLlTme9z8AMj02xdQ+kgAcm5qI6UR
         aAXL9wueLrx98qGHx0cNeM3XL8SAtxnWcLC+eWXnMqEyhbrE/Mzm2oVTb9sgil4M5JHK
         2dpSUUzSJkGnxc+h531ZZNyGxrU3XRV2yafDRm7zoNqRiaV0nIRCiWUbMPV64TA1RTUf
         s+TYYIzgmZRtBMJUOuTR0sM41qK6Pa8l4z9eELLU5xquyh++P5LQlXcmjTTAWzKFA5et
         az4A==
X-Gm-Message-State: ACgBeo2Rwr3DbQ/3PTZ9oJ3YKg7T50PWeumlJ8lsIBjtpt2kf7lJKM8u
	z23LkvoVUEnz5ptLn92rjrhUbssE7VV9zAwAOaBxoO2+iVLvSAnvsiypa7Cj+SjXDxf39u6NX0l
	v9PrNp9W8jSZbrar/LPVldO7MYfYa+pf2pwfeqXq1K6iB
X-Received: by 2002:a05:6102:35c:b0:381:5d05:4eed with SMTP id e28-20020a056102035c00b003815d054eedmr291718vsa.74.1660245026117;
        Thu, 11 Aug 2022 12:10:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6fIp/rY8D97jEgLS//TfrCICxkbup/p/NhqJDS1P8SHF2f6jQwj5g6tmRAkZjERWUPn7iSzQ==
X-Received: by 2002:a05:6102:35c:b0:381:5d05:4eed with SMTP id e28-20020a056102035c00b003815d054eedmr291705vsa.74.1660245025851;
        Thu, 11 Aug 2022 12:10:25 -0700 (PDT)
From: Mauricio Faria de Oliveira <mfo@canonical.com>
To: xen-devel@lists.xenproject.org,
	grub-devel@gnu.org
Cc: Daniel Kiper <dkiper@net-space.pl>,
	=?UTF-8?q?Peter=20Gro=C3=9Fe?= <pegro@friiks.de>
Subject: [PATCH 1/2] templates/linux_xen: Properly load multiple initrd files
Date: Thu, 11 Aug 2022 16:10:13 -0300
Message-Id: <20220811191014.139882-2-mfo@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811191014.139882-1-mfo@canonical.com>
References: <20220811191014.139882-1-mfo@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The linux_xen template can put multiple initrd files in the
same multiboot[2] module[2] command, which is against specs.

This causes ONLY the _first_ initrd file to be loaded; other
files just have filenames in a "cmdline" string of the first
initrd file and are NOT loaded.

Fix this by inserting a module[2] command per initrd file.

Before:

    # touch /boot/xen /boot/microcode.cpio
    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot       /boot/xen ...
            module  /boot/vmlinuz-5.4.0-122-generic ...
            module  --nounzip   /boot/microcode.cpio /boot/initrd.img-5.4.0-122-generic

After:

    # touch /boot/xen /boot/microcode.cpio
    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot      /boot/xen ...
            module  /boot/vmlinuz-5.4.0-122-generic ...
            module  --nounzip   /boot/microcode.cpio
            module  --nounzip   /boot/initrd.img-5.4.0-122-generic

Cause:

The code was copied from the linux template, which is *apparently*
equivalent.. but its initrd command grub_cmd_initrd() *supports*
multiple files (see grub_initrd_init()), while module/module2 in
grub_cmd_module() *does not* (see grub_multiboot[2]_add_module()).

See commit e86f6aafb8de ("grub-mkconfig/20_linux_xen: Support multiple early initrd images"):
    'This is basically a copy of a698240d "grub-mkconfig/10_linux:
     Support multiple early initrd images" ...'

Specs:

Both multiboot and multiboot2 specifications mention support for
'multiple boot modules' (struct/tag used for kernel/initrd files):

    "Boot loaders don’t have to support multiple boot modules,
     but they are strongly encouraged to" [1,2]

However, there is a 1:1 relationship between boot modules and files,
more or less clearly; note the usage of singular/plural "module(s)".
(Multiboot2, clearly: "One tag appears per module".)

  Multiboot [1]:

    "the ‘mods’ fields indicate ... what boot modules
     were loaded ..., and where they can be found.
     ‘mods_count’ contains the number of modules loaded"

    "The first two fields contain the start and end addresses
     of the boot module itself."

  Multiboot2 [2]:

    "This tag indicates ... what boot module was loaded ...,
     and where it can be found."

    "The ‘mod_start’ and ‘mod_end’ contain the start and end
     physical addresses of the boot module itself."

    "One tag appears per module.
     This tag type may appear multiple times."

And both clearly mention the 'string' field of a boot module,
which is to be used by the operating system, not boot loader:

     "The ‘string’ field provides an arbitrary string to be
      associated with that particular boot module ...
      its exact use is specific to the operating system."

Links:

[1] https://www.gnu.org/software/grub/manual/multiboot/multiboot.html
    3.3 Boot information format

[2] https://www.gnu.org/software/grub/manual/multiboot2/multiboot.html
    3.6.6 Modules

Fixes: e86f6aafb8de ("grub-mkconfig/20_linux_xen: Support multiple early initrd images")

Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 util/grub.d/20_linux_xen.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
index 4382303c17f0..50c62562b730 100644
--- a/util/grub.d/20_linux_xen.in
+++ b/util/grub.d/20_linux_xen.in
@@ -162,12 +162,12 @@ EOF
     message="$(gettext_printf "Loading initial ramdisk ...")"
     initrd_path=
     for i in ${initrd}; do
-       initrd_path="${initrd_path} ${rel_dirname}/${i}"
-    done
-    sed "s/^/$submenu_indentation/" << EOF
+       initrd_path="${rel_dirname}/${i}"
+       sed "s/^/$submenu_indentation/" << EOF
 	echo	'$(echo "$message" | grub_quote)'
 	${module_loader}	--nounzip   $(echo $initrd_path)
 EOF
+    done
   fi
   if test -n "${xenpolicy}" ; then
     message="$(gettext_printf "Loading XSM policy ...")"
-- 
2.34.1


