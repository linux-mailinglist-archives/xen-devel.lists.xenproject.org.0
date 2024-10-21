Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F569A6C4C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823579.1237611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVc-0004MV-T5; Mon, 21 Oct 2024 14:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823579.1237611; Mon, 21 Oct 2024 14:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVc-0004KG-PJ; Mon, 21 Oct 2024 14:35:48 +0000
Received: by outflank-mailman (input) for mailman id 823579;
 Mon, 21 Oct 2024 14:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2tVb-0003qm-Lj
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:35:47 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c228474e-8fb9-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 16:35:46 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb58980711so46566931fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:35:46 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b1d8sm1999394a12.72.2024.10.21.07.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:35:43 -0700 (PDT)
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
X-Inumbo-ID: c228474e-8fb9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729521345; x=1730126145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx4DxoEGK87IzCRHyCD3oOn3pSGeacIwAEqwfo4eKqM=;
        b=Pk4ebvSvOIdMK5KNDulYR8mHvWz41vFAxe9t78E7bkqOhdLDFDLICTTsR6Reek3BCO
         begwut4Oi94hSAXy4lvivMSeWKGNvN3SnC+I8p39w8Fb8ZXommYzcLN0BciKY9SwJ7Ls
         TVQgkcYGnaan0sGRBcsUB9QJDWTYigR53htYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521345; x=1730126145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wx4DxoEGK87IzCRHyCD3oOn3pSGeacIwAEqwfo4eKqM=;
        b=LgBRfmAyuF2ufpe5kM8CbevUv/lfR3oea0uYO35BHSwnN9P46VdIbswG6kAinSalc1
         8NiH462espZoCZwFFe8InP5sajL8V0ky3pItp5eZJ5cCStC9bIZdmwm2zrnxzWZK9vuY
         zTiAphgBVSSDp++W0VSsxA5ABDzAnYUHKRY1lSJ5yU/5AlJAiPlmaY00i7+M487iEd7s
         AqU+C604Yr5dcJOW6YVRD4ZssAAHBElG1NN2GlEiaHfE872Rz1g+a32XTjqQoltrRYa5
         lVp0ikpRjuk+k8Bp3ckKt7YNTDWOEDt8x8J69+TBz0bPrLEGlv0A9yd2lPxff7jhDa6w
         wz0Q==
X-Gm-Message-State: AOJu0YziErSzl4930pMEGQOnRnOmZiAUBBQVNmqBJSNXcO1j3aSWjtSU
	CJ3rU64LFynfOWdUBfInLEFkk5JpCvrFwYpLkoiOhL/QQvxQsSoQECKy5rmlXkpXezSdrQ2Dluk
	i
X-Google-Smtp-Source: AGHT+IGse2dyV0E/absSWns3VWnI+Id9CbrtOfQF+0l232rU5Hw81dKAt8o1eL90madGy4MeeaNP/w==
X-Received: by 2002:a2e:4e02:0:b0:2fa:ded3:f6aa with SMTP id 38308e7fff4ca-2fb831df580mr42160181fa.20.1729521344684;
        Mon, 21 Oct 2024 07:35:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/3] CI: Rework domU_config generation in qubes-x86-64.sh
Date: Mon, 21 Oct 2024 15:35:38 +0100
Message-Id: <20241021143539.3898995-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, various blocks rewrite domU_config= as a whole, even though it is
largely the same.

 * dom0pvh-hvm does nothing but change the domain type to hvm
 * *-pci sets the domain type, clears vif=[], appends earlyprintk=xen to the
   cmdline, and adds some PCI config.

Refactor this to be domU_type (defaults to pvh), domU_vif (defaults to
xenbr0), and domU_extra_cfg (defaults to empty) and use these variables to
build domU_config= once.

Of note, the default domU_config= now sets cmdline=, and extra= is intended
for inclusion via domU_extra_cfg as necessary.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 automation/scripts/qubes-x86-64.sh | 50 +++++++++++++-----------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 306304e9219f..4b6311efffa8 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -15,16 +15,9 @@ test_variant=$1
 extra_xen_opts=
 wait_and_wakeup=
 timeout=120
-domU_config='
-type = "pvh"
-name = "domU"
-kernel = "/boot/vmlinuz"
-ramdisk = "/boot/initrd-domU"
-extra = "root=/dev/ram0 console=hvc0"
-memory = 512
-vif = [ "bridge=xenbr0", ]
-disk = [ ]
-'
+domU_type="pvh"
+domU_vif="'bridge=xenbr0',"
+domU_extra_cfg=
 
 case "${test_variant}" in
     ### test: smoke test & smoke test PVH & smoke test HVM
@@ -50,16 +43,7 @@ echo \"${passed}\"
         fi
 
         if [ "${test_variant}" = "dom0pvh-hvm" ]; then
-            domU_config='
-type = "hvm"
-name = "domU"
-kernel = "/boot/vmlinuz"
-ramdisk = "/boot/initrd-domU"
-extra = "root=/dev/ram0 console=hvc0"
-memory = 512
-vif = [ "bridge=xenbr0", ]
-disk = [ ]
-'
+            domU_type="hvm"
         fi
         ;;
 
@@ -101,15 +85,11 @@ echo \"${passed}\"
 
         passed="pci test passed"
 
-        domU_config='
-type = "'${test_variant#pci-}'"
-name = "domU"
-kernel = "/boot/vmlinuz"
-ramdisk = "/boot/initrd-domU"
-extra = "root=/dev/ram0 console=hvc0 earlyprintk=xen"
-memory = 512
-vif = [ ]
-disk = [ ]
+        domU_type="${test_variant#pci-}"
+        domU_vif=""
+
+        domU_extra_config='
+extra = "earlyprintk=xen"
 pci = [ "'$PCIDEV',seize=1" ]
 on_reboot = "destroy"
 '
@@ -148,6 +128,18 @@ done
         ;;
 esac
 
+domU_config="
+type = '${domU_type}'
+name = 'domU'
+kernel = '/boot/vmlinuz'
+ramdisk = '/boot/initrd-domU'
+cmdline = 'root=/dev/ram0 console=hvc0'
+memory = 512
+vif = [ ${domU_vif} ]
+disk = [ ]
+$domU_extra_config
+"
+
 # DomU
 mkdir -p rootfs
 cd rootfs
-- 
2.39.5


