Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD4387EE5B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695006.1084498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQG-0001Dj-N3; Mon, 18 Mar 2024 17:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695006.1084498; Mon, 18 Mar 2024 17:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQG-00019p-FF; Mon, 18 Mar 2024 17:05:16 +0000
Received: by outflank-mailman (input) for mailman id 695006;
 Mon, 18 Mar 2024 17:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHa-0002gq-LR
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6da5e26c-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:13 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4146172fb7eso2496295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:12 -0700 (PDT)
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
X-Inumbo-ID: 6da5e26c-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780973; x=1711385773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY92DPy9yyYuIttEfcRR/uDeQT6by35Csv+FqYw2GjU=;
        b=eArn6NbJmpAczZpML3zC1abdGqvh97TlQy7hvXiTRprI2FI1TLWSrn3MSaEI8xtt1Y
         aG3tabmiO56vZaSZHgqnYHwHWnbDutJVgtWf5DCuYYonPsASczOw+Q3PQiKrGuvN5U9z
         zJA4mCCTpFqi2oZl+mVJodVo4W4yg4daG/lAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780973; x=1711385773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY92DPy9yyYuIttEfcRR/uDeQT6by35Csv+FqYw2GjU=;
        b=v+/z1zd6VsuuqHej1LXAwJ0ndfMqEN1yoFrf08SflUHt1FipEtZh5V6INnwhiEgnCa
         ToI4INZpTIlu9zsSyKlEaIJzGxxKaTjzfxT1pwKvshRYl8zBnqhwrxrdRtfZLHJOl+pJ
         S0Zt3rHz9qeQZssAJ2aHAB8LrVhbWH/6LrV4ftD6hQmPBkfLKH6dbTfh5J314KhrVpry
         UKpXZ8g4qWSskhoXHGsakY4YnrI/2gXfpN0RUo7+PiqZL+h29TF22uOHWuu7/Nr90shg
         IZYBXu/o0xR4K1IR/uia4iRgPEqgWqMZGKgs5nm2ORlc5oFpiv2Tt8p7ujOVqXuR9IME
         1etA==
X-Gm-Message-State: AOJu0YykAogdyXL33AYA8ZqnPL23vpvyjOnUy/4Ap58Ns5h3yITgk1k+
	YAetDG2PB06+7YBx37/vqBc1KZUGLfCtvk8Fo51Q+qkQJk7zkaYi2eX8D5GZq6nq9PTjKbVYicH
	y
X-Google-Smtp-Source: AGHT+IF1ebGGtocd78nErOHJCPWrOnYGjl/ISK3xVKDFteWa2f2at20onqeMu1D6Z9cpnv3faxcFdA==
X-Received: by 2002:a05:600c:19cd:b0:413:1688:2679 with SMTP id u13-20020a05600c19cd00b0041316882679mr7682967wmq.41.1710780972885;
        Mon, 18 Mar 2024 09:56:12 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 26/36] ts-debian-hvm-install: Allow udev failure in install media
Date: Mon, 18 Mar 2024 16:55:35 +0000
Message-Id: <20240318165545.3898-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel in "debian-12.1.0-amd64-netinst.iso" prevent debian installer
from booting. Early on, it does `udevadm trigger --action=add`, which
fails, the same way as the following runes fails:

$ cat /sys/devices/virtual/input/input2/name
Xen Virtual Keyboard
$ echo add > /sys/devices/virtual/input/input2/uevent
[   25.884403] synth uevent: /devices/virtual/input/input2: failed to send uevent
[   25.916498] input input2: uevent: failed to send synthetic uevent: -12
sh: write error: Cannot allocate memory
$ uname -a
Linux (none) 6.1.0-10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.38-1 (2023-07-14) x86_64 GNU/Linux

This doesn't looks like a new issue, Debian Buster ISO seems to do the
same thing (early boot command, and error in Linux logs), so it's
probable that now `udevadm trigger --action=add` return an error when
there's a failure.

Bug report in the kernel and in Debian:
    https://bugzilla.kernel.org/show_bug.cgi?id=207695
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=983357

One way to workaround the issue is to remove the vkb device, with xl's
"vkb_device=0", but libvirt doesn't have support for this config
option.

The second option is to edit the installation media, and allow the
failure.

Once installed, the guest boot fine.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    There's a potential fix for the kernel:
    
    https://lore.kernel.org/xen-devel/20221209142615.33574-1-jandryuk@gmail.com/

 ts-debian-hvm-install | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/ts-debian-hvm-install b/ts-debian-hvm-install
index 4deb443e..44eb3ab1 100755
--- a/ts-debian-hvm-install
+++ b/ts-debian-hvm-install
@@ -174,13 +174,14 @@ sub isolinux_cfg () {
 END
 }
 
-sub prepare_initrd ($$$) {
-    my ($initrddir,$newiso,$preseed_file_path) = @_;
+sub prepare_initrd ($$$$) {
+    my ($initrddir,$newiso,$preseed_file_path,$extra_rune) = @_;
     return <<"END";
       rm -rf $initrddir
       mkdir $initrddir
       cd $initrddir
       gzip -d < $newiso$ramdisk | cpio --extract --make-directories --no-absolute-filename
+      $extra_rune
       cp $preseed_file_path preseed.cfg
       find . | cpio -H newc --create | gzip -9 > $newiso$ramdisk
       cd -
@@ -268,7 +269,17 @@ sub prep () {
         target_putfilecontents_root_stash($ho, 10, preseed(),
                                           $preseed_file_path);
 
-        $cmds = prepare_initrd($initrddir,$newiso,$preseed_file_path);
+        my $extra_preseed_rune = '';
+        if ($gsuite =~ m/bookworm/) {
+            # Xen Virtual Keyboard initialisation fails and return ENOMEM
+            # https://bugzilla.kernel.org/show_bug.cgi?id=207695
+            # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=983357
+            $extra_preseed_rune .= <<END;
+sed -i '/udevadm trigger --action=add/s/\$/ ||:/' lib/debian-installer/start-udev
+END
+        }
+        $cmds = prepare_initrd($initrddir,$newiso,$preseed_file_path,
+            $extra_preseed_rune);
         target_cmd_root($ho, $cmds, $isotimeout);
 
         target_putfilecontents_root_stash($ho, 10, grub_cfg(),
-- 
Anthony PERARD


