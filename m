Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF41BD2C5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 05:05:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTd1g-0002uW-B8; Wed, 29 Apr 2020 03:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cw0=6N=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jTd1e-0002uP-6v
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 03:04:42 +0000
X-Inumbo-ID: 2a06e332-89c6-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a06e332-89c6-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 03:04:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so706488wrq.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 20:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qRzsulywIjE+sQcPoBEKngALHTHNWGcwn3UAFri5+Is=;
 b=B5oRsmOxxtULX0ELvlErFeZeY0jak0zTDw+T63dGQmt8YuEujgUo5u+ir5d7gG3q7b
 Hvri0SdTK51dwZCcRpky83W1etxumYRvsNFey41OECwRVZLsKA4Vh1iGEqcirnik+pS/
 szJVElSA3+3/MF+CVST65JqGVCfNJFJ13WZ78y/8v5YsiPP4jXZgKTGpFSV1Wm8dgxDo
 IDC+89MFvelQhTdaOtZVVm9HMmQXBv1ODxhFOQG0+xAoA1cNHLVByWacU6QBzgFMf+e4
 3FL9wXYnFlyWytZpMjh1IPXLcwyJk1D5ZiE2/nQjpoqCX5dUZG0s4VBCkquww1F21hae
 mw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRzsulywIjE+sQcPoBEKngALHTHNWGcwn3UAFri5+Is=;
 b=RyatFJUCb5sZiGNYP57Vmfyr53LAcmtS/GWYWDz8Q1BPFqgrAgbrSxek14FMnN3LSZ
 ZSzWAP8VhI4+vEDAZoKCQpvmDuDrwf/Bo1vgzUqTJo4926wkaGLQSz7z9ETj/1YygnQU
 UTIwp+Pgda3vVn8ap36jLo+ubBX2/lE60e0L+6aR+iwiwZvDDgoOA5D7RxvOvpf2F1WB
 /gnE561hGe/DSSlx0DianrTvaD/ZmjGY9NYJXr3GRNJq4uOHee8DHYQ+dzeBBZjDmWMB
 Gtr8Q6rdy4guoNkmaQ0CxLXiNwt1KYJZyYoqa8dBswUTTMf8HAZ3kS4ByRHSFxR8xWTv
 c1aQ==
X-Gm-Message-State: AGi0PubSgAjzQtIzjnXzjGmln5ceUkrNbGSu8/Q5WIdTb4cCcL6pUYYj
 1NSJJCsyME/EbYCWvPd/1G8=
X-Google-Smtp-Source: APiQypKtASVRZtrLSNfnMWkMLsFzDJUoGhbpBBFcLg/HpdRqjRqKpuxw46KWnaiyvF30jck0ZguBLw==
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr36701072wrs.415.1588129478643; 
 Tue, 28 Apr 2020 20:04:38 -0700 (PDT)
Received: from localhost.localdomain (public-gprs636909.centertel.pl.
 [5.184.31.46])
 by smtp.gmail.com with ESMTPSA id o6sm19713725wrw.63.2020.04.28.20.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 20:04:38 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Fix undefined behaviour
Date: Wed, 29 Apr 2020 03:04:08 +0000
Message-Id: <20200429030409.9406-2-gorbak25@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429030409.9406-1-gorbak25@gmail.com>
References: <20200429030409.9406-1-gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: artur@puzio.waw.pl, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Grzegorz Uriasz <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This patch fixes qemu crashes when passing through an IGD device to HVM guests under XEN. The problem is that on almost every laptop
reading the IGD ROM from SYSFS will fail, the reason for it is that the IGD rom is polymorphic and it modifies itself
during bootup - this results in an invalid rom image - the kernel checks whether the image is valid and when that's not the case
it won't allow userspace to read it. It seems that when the code was first written(xen_pt_load_rom.c) the kernel's back then didn't check
whether the rom is valid and just passed the contents to userspace - because of this qemu also tries to repair the rom later in the code.
When stating the rom the kernel isn't validating the rom contents so it is returning the proper size of the rom(32 4kb pages).

This results in undefined behaviour - pci_assign_dev_load_option_rom is creating a buffer and then writes the size of the buffer to a pointer.
In pci_assign_dev_load_option_rom under old kernels if the fstat would succeed then fread would also succeed - this means if the buffer
is allocated the size of the buffer will be set. On newer kernels this is not the case - on all laptops I've tested(spanning a few
generations of IGD) the fstat is successful and the buffer is allocated but the fread is failing - as the buffer is not deallocated
the function is returning a valid pointer without setting the size of the buffer for the caller. The caller of pci_assign_dev_load_option_rom
is holding the size of the buffer in an uninitialized variable and is just checking whether pci_assign_dev_load_option_rom returned a valid pointer.
This later results in cpu_physical_memory_write(0xc0000, result_of_pci_assign_dev_load_option_rom, unitialized_variable) which
depending on the compiler parameters, configure flags, etc... might crash qemu or might work - the xen 4.12 stable release with default configure
parameters works but changing the compiler options slightly(for instance by enabling qemu debug) results in qemu crashing ¯\_(;-;)_/¯

The only situation when the original pci_assign_dev_load_option_rom works is when the IDG is not the boot gpu - this won't happen on any laptop and
will be rare on desktops.

This patch deallocates the buffer and returns NULL if reading the VBIOS fails - the caller of the function then properly shuts down qemu.
The next patch in the series introduces a better method for getting the vbios so qemu does not exit when pci_assign_dev_load_option_rom fails -
this is the reason I've changed error_report to warn_report as whether a failure in pci_assign_dev_load_option_rom is fatal
depends on the caller.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 hw/xen/xen_pt_load_rom.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..9f100dc159 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -38,12 +38,12 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     fp = fopen(rom_file, "r+");
     if (fp == NULL) {
         if (errno != ENOENT) {
-            error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
+            warn_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
         }
         return NULL;
     }
     if (fstat(fileno(fp), &st) == -1) {
-        error_report("pci-assign: Cannot stat %s: %s", rom_file, strerror(errno));
+        warn_report("pci-assign: Cannot stat %s: %s", rom_file, strerror(errno));
         goto close_rom;
     }
 
@@ -59,10 +59,9 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     memset(ptr, 0xff, st.st_size);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
-        error_report("pci-assign: Cannot read from host %s", rom_file);
-        error_printf("Device option ROM contents are probably invalid "
-                     "(check dmesg).\nSkip option ROM probe with rombar=0, "
-                     "or load from file with romfile=\n");
+        warn_report("pci-assign: Cannot read from host %s", rom_file);
+        memory_region_unref(&dev->rom);
+        ptr = NULL;
         goto close_rom;
     }
 
-- 
2.26.1


