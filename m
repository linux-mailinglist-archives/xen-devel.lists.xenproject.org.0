Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B2AA77BCA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934190.1335999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPV-00076i-B7; Tue, 01 Apr 2025 13:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934190.1335999; Tue, 01 Apr 2025 13:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPV-00074q-7Y; Tue, 01 Apr 2025 13:12:09 +0000
Received: by outflank-mailman (input) for mailman id 934190;
 Tue, 01 Apr 2025 13:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMe-0008KU-BX
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fdb7702-0efa-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:09:10 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so926513066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:09:09 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac71927b7cfsm754553366b.49.2025.04.01.06.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:09:08 -0700 (PDT)
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
X-Inumbo-ID: 7fdb7702-0efa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512949; x=1744117749; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMjGk2rTj1yEkoZ9b/TWFB91n+XjEue7/7KXBnaUhCc=;
        b=eiSNgyT0eOS3FieQZdky1f+9BRhQrxOKnQ7VP8FlX+hyyQADbPxb0bqEhX9kdW050R
         OJON/U1vHojc3kVREzLpS03v3OQq10aozH3JR6w+/dY0mbR7+1ga/OmzDNhomKHzOjJa
         rKEYTKqlu6kQuF2rLK9n6Mh62+pxMXl1oOdaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512949; x=1744117749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMjGk2rTj1yEkoZ9b/TWFB91n+XjEue7/7KXBnaUhCc=;
        b=g1YGYNxqKO946VpdjP5JezL1i6w3IaLDkHue74OoBopArXwKcW+r+HGH7oVqXkz+m5
         iN4xzYTcTL5DQ/D6jQ6ShMR/bGEt+BZCJCNPQeYwJVSBTvmx/w866XFhXDuejPo5Pg3p
         L7ZtHsdDBfTKEX40dac6cZX6QM7810/0zId1JR3KLxIzgijI4RERQAZWeF+jph8xA9/c
         gkoj1NdXGh8l8ERmKofjKItiZPRAhX/kU+yuZSIO/OrNo89rX88OAtCKBGQJrJaVoOP5
         3dm9h9P2YmBIgHlfGsF2l8jhND6K8iICAmZitTYeA2aUkrsnffxhl4lPrSKYgv5Wch0C
         YqCg==
X-Gm-Message-State: AOJu0Yww7d1JdyAfg6N6lF06ojK+OcI5X3nRWsiJP2h9NxwSGcTdPUiY
	+QwlPEOEtDaO8wTUZmbjjZlBGJ+fwQrAtQ2ucxU96wRuLZQqvJSoVwtX5kIDoScFgbgxs7wP4Nx
	a
X-Gm-Gg: ASbGnctdV94zyQs0k9VXpvGwCEKr/UmVAL/eq90fpnlkUZImxBDji1ozzkUeS+TiLze
	fUsyhJ0ANe6cTL2BLC5Wg26Sqpv9jiksYo2b4hRyT7okWGsZdB6Syz3vSTZf+LEQp1J7X/AgLCI
	P2K+rJhsNcbdRxVWseHLt6JCGjU1x6R3Ais6zhOaCZwuIhLWowKYl3ja3C6X95sfyis24xK87fo
	CjxcP8b0ny1Vd9ebpzfF+usZJ9rvHX8M8rOyvAGs+GdOVVibJdLchOwItnlCsI3f2Zyuja1NCW6
	TDxZLv6coyyonqgwgVhjRZY2sFc4PKCwwFeHEyFWYD02ZdAiRw==
X-Google-Smtp-Source: AGHT+IFCculQFVIsAPIfraVZnCR3LJEGuoFKSvhvYzJv0ILOugajihhVFyqaE+eW8Eh1agmb3b2qsQ==
X-Received: by 2002:a17:906:7955:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac738a4bf32mr1077303566b.21.1743512948972;
        Tue, 01 Apr 2025 06:09:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 11/11] automation/x86: add a xen.efi test with a strict NX OVMF build
Date: Tue,  1 Apr 2025 15:08:40 +0200
Message-ID: <20250401130840.72119-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Such OVMF build does honor the PE sections attributes, and will not blindly
create all section mappings with read-write-execute permissions.

Strict NX build is only available in the Fedora edk2-experimental
package, so add the required dependencies to run a QEMU EFI job on the
Fedora 41 container and use it for the test.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/build/fedora/41-x86_64.dockerfile |  5 +++++
 automation/gitlab-ci/test.yaml               |  9 ++++++++
 automation/scripts/qemu-smoke-x86-64-efi.sh  | 22 ++++++++++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/automation/build/fedora/41-x86_64.dockerfile b/automation/build/fedora/41-x86_64.dockerfile
index 8032a2098632..84f366ac0643 100644
--- a/automation/build/fedora/41-x86_64.dockerfile
+++ b/automation/build/fedora/41-x86_64.dockerfile
@@ -65,6 +65,11 @@ RUN <<EOF
         glib2-devel
         pixman-devel
         ninja-build
+
+        # EFI Strict NX test
+        qemu-system-x86
+        edk2-experimental
+        expect
     )
 
     dnf -y --setopt=install_weak_deps=False install "${DEPS[@]}"
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 225eb4399807..dec14420ab62 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -593,6 +593,15 @@ qemu-smoke-x86-64-gcc-efi:
   needs:
     - debian-12-x86_64-gcc-debug
 
+qemu-smoke-x86-64-gcc-efi-strictnx:
+  extends: .qemu-smoke-x86-64
+  variables:
+    CONTAINER: fedora:41-x86_64
+  script:
+    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv strict 2>&1 | tee ${LOGFILE}
+  needs:
+    - debian-12-x86_64-gcc-debug
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
index 7572722be6e5..fbb662f1a756 100755
--- a/automation/scripts/qemu-smoke-x86-64-efi.sh
+++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
@@ -4,6 +4,7 @@ set -ex -o pipefail
 
 # variant should be either pv or pvh
 variant=$1
+mode=$2
 
 # Clone and build XTF
 git clone https://xenbits.xen.org/git-http/xtf.git
@@ -14,6 +15,19 @@ case $variant in
     *)   k=test-pv64-example     extra= ;;
 esac
 
+case $mode in
+    strict)
+        ovmf_code=/usr/share/edk2/experimental/OVMF_CODE_4M.secboot.strictnx.qcow2
+        ovmf_vars=/usr/share/edk2/ovmf/OVMF_VARS_4M.qcow2
+        ovmf_format=qcow2
+        ;;
+    *)
+        ovmf_code=/usr/share/OVMF/OVMF_CODE.fd
+        ovmf_vars=/usr/share/OVMF/OVMF_VARS.fd
+        ovmf_format=raw
+        ;;
+esac
+
 mkdir -p boot-esp/EFI/BOOT
 cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
 cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
@@ -27,13 +41,13 @@ options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
 kernel=kernel
 EOF
 
-cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
-cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
+cp $ovmf_code OVMF_CODE.fd
+cp $ovmf_vars OVMF_VARS.fd
 
 rm -f smoke.serial
 export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
-        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
-        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
+        -drive if=pflash,format=${ovmf_format},readonly=on,file=OVMF_CODE.fd \
+        -drive if=pflash,format=${ovmf_format},file=OVMF_VARS.fd \
         -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
         -m 512 -monitor none -serial stdio"
 
-- 
2.48.1


