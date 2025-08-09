Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D9B1F71D
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 00:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076299.1437930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnW-0006Cg-6o; Sat, 09 Aug 2025 22:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076299.1437930; Sat, 09 Aug 2025 22:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnW-000661-27; Sat, 09 Aug 2025 22:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1076299;
 Sat, 09 Aug 2025 22:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSuF=2V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukrnU-0005qO-9S
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 22:12:16 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6454e55-756d-11f0-b898-0df219b8e170;
 Sun, 10 Aug 2025 00:12:12 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so2038729f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 15:12:12 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm35424323f8f.44.2025.08.09.15.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 15:12:11 -0700 (PDT)
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
X-Inumbo-ID: e6454e55-756d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754777532; x=1755382332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kbtQDcuNUXyTRgEfiYKqd93Fy+PpDHUdfFPn9AHKy0=;
        b=ottUsF2VPN/vpe0sOiJ3Z8WwfaETrVeLIwPO7jQVe6uBHT76JGcp89yTZM7JlE1Cxl
         MpZou9RhjDLhlxTzaaq3DYIH8IgNs9cGuHxkNE0J7L9beYY9IsWfMlN0qbDabi8UWHjC
         i75gw4v0KZPd4vyQPM0F2MHXgLU6vUmv1QX6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777532; x=1755382332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kbtQDcuNUXyTRgEfiYKqd93Fy+PpDHUdfFPn9AHKy0=;
        b=U2JIo5mXjCELBVESaTzpcJ8iOZZ0UIAChVuVvxMgfQVIb2vlOuMAi56QzCKoO/XnJ2
         DDqSU+pmdjM2NR2eu7s2+EhJVGfNQXw5nlBGqQWrb8aY0wv6qAeQwhuZAoaJedk4/xR3
         J38ZrVLxgBCiL84nTivqc29Va42tkp3TqYAHcBFJhgsedGEu+eFo/wWr0Gy48sSFZ5ni
         +cqVdn+maSwhQvDviieeuV59L4uuX5FHRkHsPPHoAAGp+nwYPKtbKy3Ut4Ux+zxxpIzu
         dAdkRwaLvtyX47ze36JXeqjKoSMSF6C+SotJZvj2E9NDD+cvYHd/XGgjH6vOYErksjIa
         H/MA==
X-Gm-Message-State: AOJu0Yy+QkvemdDvcOWf9JnbfE2qTrfby4Fp6yfcZ6d08lzUeXvxoMgC
	67fnCIz03MKJSYxgGvrkLnSsbPT8XPAy19d8s9l9LJWuxBhDxl7IDnCgW3qjBIagQjVfRMSzDC5
	hqLSqgohhTw==
X-Gm-Gg: ASbGnctsp/uEo/TUbrFqYT/JQBUUog6TexLb5yVBMIjPWcidxQz7EhI+J51XiTa0UuI
	WEGbJobLScIgvYMMip2D7Aw6ROLGeQppErz2q9lW3MXMR6YK47mcO4ONH7FUL0ULPHhjnilS2XD
	co4qlHEuGg4sk2eQrE1dbe/o3A++sd1+y3VX3PPdmx6rDRJoNiC4HnCLMrJrMZga+DMx7Of5Vyl
	vOszttsjblrO1d+g/mM3eoHsjJYci1kwHiEkRrAAQi/nY6q+n3xPTE4IC/ad41wRN/SfYvvK4Ph
	wQP4J3Hrid/Oz7v37hWS/gdHdMB1ho3rbbA+zzDHPf/up+n6M+rjtvBvJ9kGWjiPhAw6IDVL4wy
	C2ib4fYeHxn/Je/bE+QFIt4kJZPNtmXpSP5NNKk74iFlGwCO8awVpHE6DNvgR4IjtUk6qhjZYLX
	uq
X-Google-Smtp-Source: AGHT+IFVUsXbEO2zVpXVjvHoXeRW6wapD2jvYXCp/PAWUAe+QB6L/kYoJd3KgWjcL7YcgRDmrzj4Lw==
X-Received: by 2002:a5d:64e9:0:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3b900929b41mr6646095f8f.3.1754777531680;
        Sat, 09 Aug 2025 15:12:11 -0700 (PDT)
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
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH 2/5] CI: Update ppc64 to use Debian Trixie
Date: Sat,  9 Aug 2025 23:12:03 +0100
Message-Id: <20250809221206.1260861-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everything works fine with Debian 13.  Provide two new build jobs (for a total
of 6), and update the test job.

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

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975927256
---
 automation/gitlab-ci/build.yaml | 18 ++++++++++++++++--
 automation/gitlab-ci/test.yaml  |  2 +-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ab5211f77e5e..3fe539dc5683 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -319,10 +319,10 @@ debian-12-x86_64-clang-debug:
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-ppc64le-gcc-debug:
+debian-13-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
   variables:
-    CONTAINER: debian:12-ppc64le
+    CONTAINER: debian:13-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
@@ -705,6 +705,20 @@ debian-12-ppc64le-gcc:
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-12-ppc64le-gcc-debug:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:12-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-13-ppc64le-gcc:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:13-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
 # RISC-V 64 cross-build
 debian-12-riscv64-gcc:
   extends: .gcc-riscv64-cross-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1f0b27b2378a..2f6f3affa637 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -712,4 +712,4 @@ qemu-smoke-ppc64le-powernv9-gcc:
   script:
     - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-ppc64le-gcc-debug
+    - debian-13-ppc64le-gcc-debug
-- 
2.39.5


