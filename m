Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70945B53FC1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 03:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121157.1465632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwsO4-0007qS-Db; Fri, 12 Sep 2025 01:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121157.1465632; Fri, 12 Sep 2025 01:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwsO4-0007op-9u; Fri, 12 Sep 2025 01:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1121157;
 Fri, 12 Sep 2025 01:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwsO2-0007oj-TB
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 01:15:38 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd3dc6b3-8f75-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 03:15:37 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45de1084868so6185355e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 18:15:37 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e016b5a16sm45827245e9.12.2025.09.11.18.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 18:15:35 -0700 (PDT)
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
X-Inumbo-ID: fd3dc6b3-8f75-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757639736; x=1758244536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yPQP1AiZ6MAimirV8m1kgaZtgS1jLjq17yJsft7IsE=;
        b=tR3V/War5/2hhpv4VdSlOld/qzfUQl0imMazq9vqJe/GnayYt0awBGsvlHSejry2yk
         NxZrEFj8ng+CL4jRWGCFqfPFqzcRdNZOGMlppHH3CMIc8Uka3mzR2QkxmG0IRnccb5o2
         xTf717XJybf/e3VTvV036uz84S5+P0KXyBsu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757639736; x=1758244536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yPQP1AiZ6MAimirV8m1kgaZtgS1jLjq17yJsft7IsE=;
        b=KrsQU1Udp/hr7fW3mSvZdEK5xn/HpUGKxkd6Yc9s8QvpPtclMvbd5BoGsV2dreOeNP
         v6cxzYhUEiUY6nOTwu9jmN0Yyb3rJsNot/JYufQbvQ3DSkFhVOgjrD9NWpXo7Nr0RZNA
         1zhug99nmMUWd9Ojufydc8qke9kRDAXCl093B2A59mLwXlAG4aoIYeyd43J3TjSEotoN
         dF48R6oHXCEsnDlJKbevLMEQWc4+tlsG7jj42/7r5pbTllz/xcWobm5TQa77yIPgnwmk
         yueg9q7xIbvamd6YujJX4DCCf+g7k9+/4jUNDjAM4wj8mrsug5l2YLua5wxJcBny/Vv+
         maiQ==
X-Gm-Message-State: AOJu0Yx2Q1tnUvC0h0IGDsnf7A9JFGGHozH4fMFuByTszBiB2Ip26a5v
	MOswuNqRzFQy3ezqmxtmGwneCneOVMyhHnHqKbAfBSi3gH3+CcQleNWPKwmMyeraQVZxPEmVgX7
	HsZf0
X-Gm-Gg: ASbGncvxlvTMRH/geofjNZjOxmKvJakbSqUAyXMUU9VbmLSnA+ctO+ACOSnrlEmUud0
	Nh8U2ZOY+m+8ZrM1DvDkwN3torH7NHp18hWfZQOi6ixH7s3trU62WdwKltw+bP/pDKZQwVztmss
	ZQqIcYlEXyrAZU36KZltver5kVOMeP0DibbHazn1B4WS2i2/blia3E7JFpOO/GrF6gNZp/m2kOF
	9j3VcR2rBOHTwRTbbGS9df2AphRxQmpSUgYgXiMB1MQHuQdAOvB9MnJKIzB2emwpixSfu1bnT/2
	BhN8TNCZx6PUr6U7Q0x4LzqAECBiNAIScHFnSoNlNOPcSuJk4t7Nq0I2kNJtJ/9Pd2dkwF2dncr
	LrieFQveqni2AsxP0t2LEYFengYuLSfs7U0Z0dkyLdGM6YepaOnVQoOghMTUVTB773nCrjWaa7N
	Ij9EfdKkonDDY=
X-Google-Smtp-Source: AGHT+IG9HHGIndgHY/tm/TceKBExZ0scjb6hvqpU+eCOivtwqyDdIXlG2ig0tHpVFlkCLJtISFnw2A==
X-Received: by 2002:a05:600c:1911:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45f211c8371mr9833845e9.3.1757639736369;
        Thu, 11 Sep 2025 18:15:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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
	Victor Lira <victorm.lira@amd.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v3 3.5/5] CI: Make qemu-smoke-x86-64-gcc-efi compatible with Debian Trixie
Date: Fri, 12 Sep 2025 02:15:34 +0100
Message-Id: <20250912011534.1889763-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OVMF package in Debian Trixie has _4M suffixes on the files.  Have
scripts/include/xtf-x86-64-efi check for this before falling back to no
suffix.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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

v3.5
 * New

Speculative testing in progress:
  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2035561867
---
 automation/scripts/include/xtf-x86-64-efi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86-64-efi
index e0d821b3f6fd..ea5f208e8cb3 100644
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
@@ -45,7 +51,7 @@ EOF
         -serial stdio \
         -m 512 \
         -M q35,kernel-irqchip=split \
-        -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE.fd \
+        -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE${suff}.fd \
         -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS.fd \
         -drive file=fat:rw:${esp_dir},media=disk,index=0,format=raw \
     "
-- 
2.39.5


