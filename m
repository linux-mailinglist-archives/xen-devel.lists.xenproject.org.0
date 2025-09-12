Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C2B5520F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122089.1465990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50v-0004d9-9v; Fri, 12 Sep 2025 14:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122089.1465990; Fri, 12 Sep 2025 14:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50v-0004XK-3q; Fri, 12 Sep 2025 14:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1122089;
 Fri, 12 Sep 2025 14:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50u-0004JT-3J
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:36 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 005952d6-8fe7-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 16:44:35 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45dfb6cadf3so18049445e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:35 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:34 -0700 (PDT)
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
X-Inumbo-ID: 005952d6-8fe7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688275; x=1758293075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz6A5Gve9VSC84pT6xrA0HURFM9BjgbSCbypdn93KKc=;
        b=cfp6jlUjJWXSaNVCOdvJcFTmcXZwyCnAifNeM0Ul7zdyxgYpgLoxyDdg3mzmnjOTQe
         ASW9ZMIq2UDhGFPh+8Pq8Q4aFxz3q+KCNJYq6NnnPjVKHQrjU7oeFRt7EczS//JjkwEQ
         Qtbe7UkaIL0d5ALbQIQFdi6RPOJuRh8cgWf7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688275; x=1758293075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz6A5Gve9VSC84pT6xrA0HURFM9BjgbSCbypdn93KKc=;
        b=I/sxy3wJPM15MFBQPyfRFUZgE1wsNU3dNgffkPqgr6W4q7dfXUztzik9m9uPSE/G7B
         5nPSiuFtGZCCLx0KRg4/nraZR2bzpiGSh9wpAkFJtGwRqQfVaHS33R95zzIznDPU//hs
         cECKsimmfGJZV33oVC0lzGAIdr3oM1GPg/0ZJ/MRNDcxkKQmRfpoCvmWi9Fc/FDF0WWw
         2eLU6hG7ODaSIttUoj1vxcdobcfOjGMN1n8uaPMEGlUa4XWVuY7F5oCpZHV9nnhvSCh7
         TU0VleqIC3pSyT6kE0oH+2GBgjy3rjj9wURPKVHDqT8HDKe02X9cSltSu7L0UX1Q07x2
         ke8g==
X-Gm-Message-State: AOJu0YzuZEqJEoDH6mNNWhc/Dno/MkFE55e/eq3bx2hoO/U/3JtdIMH+
	1rh4EMsBc6wePGqV358oBekHCte9QDIZpbJbeULq3QkbJKJ//AtgJF6SwO25yonuxGwIH14z4Fg
	KPOir
X-Gm-Gg: ASbGncvZMo/H/Jy10Nolj8BY5de90FuZfLTnGcMVEgOzvM2oMYesN2Ys6KMZ+cHsI/3
	zVy+jRfJ+DrCKM36/YrgVNl+43w8CNaY6OgbM7dIZPZ9qwYj+p3+QQ4UJFgpmNr+8d3IiFILGB4
	gM0S6t42b6zMGoA32rRfyISjYnfk40bfY+JLEFx/tU82kVzI9i2c8LB6j/fY3zkaqygfST1Fq05
	IsdtFOdvpKS2f94CJSBlodCCQ2Lnb9/LcQNMk08sy+Q0EpF6owKqx3MiYlgkkUPGLqcOCOsir81
	B/H0I45ScJcGhfs1K2bxheBcppH03LdAkTxHnJC5CFBeNUcNZEV8VPxlvvUgulZZ9R5t8k/mIw2
	XzIsGAqgXsZqd/vbrkvGhPn6xDIlYDi5WvGrSrRZyH88NUTmTeXQjDajZLPLUaF481xHWZDmhcV
	j6
X-Google-Smtp-Source: AGHT+IFnlcxvKSZ/oFXXCOvd+e4AN+6ez3oru+DjhUoktXsiu1T1iIjZmKpAXTDS+cm5jeMmUwDl7g==
X-Received: by 2002:a05:600c:5254:b0:45d:f55d:3478 with SMTP id 5b1f17b1804b1-45f211e610fmr37983115e9.17.1757688274714;
        Fri, 12 Sep 2025 07:44:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v4 4/8] CI: Make qemu-smoke-x86-64-gcc-efi compatible with Debian Trixie
Date: Fri, 12 Sep 2025 15:44:23 +0100
Message-Id: <20250912144427.1905141-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OVMF package in Debian Trixie has _4M suffixes on the files.  Have
scripts/include/xtf-x86-64-efi check for this before falling back to no
suffix.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>
CC: Denis Mukhin <dmukhin@ford.com>

v4:
 * New

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11334759836
---
 automation/scripts/include/xtf-x86-64-efi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86-64-efi
index e0d821b3f6fd..8340c745dbf4 100644
--- a/automation/scripts/include/xtf-x86-64-efi
+++ b/automation/scripts/include/xtf-x86-64-efi
@@ -20,6 +20,7 @@ function xtf_arch_setup()
 {
     local esp_dir="${WORKDIR}/boot-esp"
     local efi_dir="${esp_dir}/EFI/BOOT"
+    local suff=
 
     # Generate EFI boot environment
     mkdir -p ${efi_dir}
@@ -35,8 +36,13 @@ options=${XEN_CMDLINE}
 kernel=kernel
 EOF
 
+    # Vs older versions, Debian Trixie names the OVMF files with a _4M suffix.
+    if [[ -e ${FW_PREFIX}/OVMF_VARS_4M.fd ]]; then
+        suff=_4M
+    fi
+
     # NB: OVMF_CODE.fd is read-only, no need to copy
-    cp ${FW_PREFIX}OVMF_VARS.fd ${WORKDIR}
+    cp ${FW_PREFIX}OVMF_VARS${suff}.fd ${WORKDIR}
 
     export TEST_CMD="${QEMU_PREFIX}qemu-system-x86_64 \
         -no-reboot \
@@ -45,8 +51,8 @@ EOF
         -serial stdio \
         -m 512 \
         -M q35,kernel-irqchip=split \
-        -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE.fd \
-        -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS.fd \
+        -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE${suff}.fd \
+        -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS${suff}.fd \
         -drive file=fat:rw:${esp_dir},media=disk,index=0,format=raw \
     "
 }
-- 
2.39.5


