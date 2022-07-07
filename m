Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B356ACD7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 22:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363125.593502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9YGY-0005aS-2T; Thu, 07 Jul 2022 20:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363125.593502; Thu, 07 Jul 2022 20:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9YGX-0005Xu-VB; Thu, 07 Jul 2022 20:38:25 +0000
Received: by outflank-mailman (input) for mailman id 363125;
 Thu, 07 Jul 2022 20:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5Xm=XM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9YGW-0005FX-TF
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 20:38:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bece1b40-fe34-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 22:38:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id a9so4688769ejf.6
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jul 2022 13:38:24 -0700 (PDT)
Received: from uni.. (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.googlemail.com with ESMTPSA id
 s17-20020a1709060c1100b00722e52d043dsm19344858ejf.114.2022.07.07.13.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 13:38:22 -0700 (PDT)
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
X-Inumbo-ID: bece1b40-fe34-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5r3MkqNQKETdv3U9LPOk3V6DXnQBYUf9+YzV6L4cI4=;
        b=hkses1a30jzJ8OVxDA5IvEl9iNMgdz+7Oxoai2bEUc/31PEDl9VP5EVi63PL0vNIxj
         s7lGe7jVURr5NuMGildiKqxB07pXOqQjrxlLqgGtvK3In5sPOq6N6hQkH85M2qXBYG3n
         MgsHj0ba7D4E4XM7cTDJKGcsIIB2jm8quEbbt+htO8dHjDqKSyFycEorKx16+Q3PsfPy
         18dn5M5CBIjbyVqePtBW4dFgW8JfdWzx1aQXb0SbYXxEu6e0G7XBV9Nwgtw2gwipdcXC
         6cPcJuhyDiMfmNh8/Y1BjXIOvGS4cYQfn1vVBlZ/DRmXYjf0Qcyu/bx69t03vySaK8Py
         h/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x5r3MkqNQKETdv3U9LPOk3V6DXnQBYUf9+YzV6L4cI4=;
        b=ghp5csbTxyLFIEKXMsU0EIuEuzbz8BW46VnRDFGvXvzmce6PGuiCj74r1PXciWYs2/
         5ELKhs+jbDFlDq3ftEuPmwFPBGAN5OflK96nEVAk1SUWv3e3cLoC2d39+skLR7vJKdzy
         Pnqsnyf1dG3dMqOD7ijwRKNDqDLFwuDwfURYZOfG+uChBgR95oa0pQrHD3AmyfNwnOnX
         Rdf1hT1WTv+7PL+uG0rRSrIiHYGYKNcimf5gm8/EdGM0ZZEwyai5npUSNTv8i+X1J0vz
         YEr/5NFPx5+X9S1SGuQ607VYb8lZg5ebXMw9mzmJl12T2xLAIiCGcAY5Rik24blsvRjf
         sIwQ==
X-Gm-Message-State: AJIora+5oVVuCt6YFeVXo+03YfPZunW8jjMzDNVfCiPk+e6Je7OTLXPB
	nxaww3e8M8mKI5X5wriMP7mDInhoZ9s=
X-Google-Smtp-Source: AGRyM1u9kTlkyE3D8hqJUq/rFPvwAotF1//FwtOQn/TBvYkgopQWR0gZyAA0+6wwYl5CYZwdIDRlAA==
X-Received: by 2002:a17:907:9620:b0:722:fc5e:3259 with SMTP id gb32-20020a170907962000b00722fc5e3259mr44292104ejc.579.1657226303408;
        Thu, 07 Jul 2022 13:38:23 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation: Remove XEN_CONFIG_EXPERT leftovers
Date: Thu,  7 Jul 2022 23:38:02 +0300
Message-Id: <20220707203803.798317-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707203803.798317-1-burzalodowa@gmail.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EXPERT config option cannot anymore be selected via the environmental
variable XEN_CONFIG_EXPERT. Remove stale references to XEN_CONFIG_EXPERT
from the automation code.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 automation/build/README.md      | 3 ---
 automation/scripts/build        | 4 ++--
 automation/scripts/containerize | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index 2137957408..00305eed03 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -65,9 +65,6 @@ understands.
 - CONTAINER_NO_PULL: If set to 1, the script will not pull from docker hub.
   This is useful when testing container locally.
 
-- XEN_CONFIG_EXPERT: If this is defined in your shell it will be
-  automatically passed through to the container.
-
 If your docker host has Linux kernel > 4.11, and you want to use containers
 that run old glibc (for example, CentOS 6 or SLES11SP4), you may need to add
 
diff --git a/automation/scripts/build b/automation/scripts/build
index 281f8b1fcc..21b3bc57c8 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -91,6 +91,6 @@ for cfg in `ls ${cfg_dir}`; do
     echo "Building $cfg"
     make -j$(nproc) -C xen clean
     rm -f xen/.config
-    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} XEN_CONFIG_EXPERT=y defconfig
-    make -j$(nproc) -C xen XEN_CONFIG_EXPERT=y
+    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} defconfig
+    make -j$(nproc) -C xen
 done
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 8992c67278..9d4beca4fa 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -101,7 +101,6 @@ exec ${docker_cmd} run \
     -v "${CONTAINER_PATH}":/build:rw${selinux} \
     -v "${HOME}/.ssh":/root/.ssh:ro \
     ${SSH_AUTH_DIR:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent${selinux}} \
-    ${XEN_CONFIG_EXPERT:+-e XEN_CONFIG_EXPERT=${XEN_CONFIG_EXPERT}} \
     ${CONTAINER_ARGS} \
     -${termint}i --rm -- \
     ${CONTAINER} \
-- 
2.34.1


