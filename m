Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8E5839EC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376666.609598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyQD-0005nD-Tk; Thu, 28 Jul 2022 07:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376666.609598; Thu, 28 Jul 2022 07:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyQD-0005ke-Qh; Thu, 28 Jul 2022 07:59:05 +0000
Received: by outflank-mailman (input) for mailman id 376666;
 Thu, 28 Jul 2022 07:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGyQC-0005ej-ER
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:59:04 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 258a63fd-0e4b-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 09:59:03 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id z18so1137421edb.10
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 00:59:03 -0700 (PDT)
Received: from uni.router.wind (adsl-69.109.242.233.tellas.gr.
 [109.242.233.69]) by smtp.googlemail.com with ESMTPSA id
 l2-20020a1709060cc200b00722e4bab163sm105413ejh.200.2022.07.28.00.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 00:59:02 -0700 (PDT)
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
X-Inumbo-ID: 258a63fd-0e4b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kwgwn4nxDPHONxfpv9ST7ryL+LvQhvZMH1dAza0ugw4=;
        b=jxd1jcy1EJS/n1CrAeDDR7rQZpPPusX//xpWTC0F4BeuwvRVdc96VHQ/vETtXAd7fQ
         k/ElpAHARj+YsIDek8vlqt3KmJoasOVWfrK2oBeCMC9qsq3uA6zfa1Kk8DpZgxCB7Rsz
         3vmhMt7Zi7gt2JLJpW0yCEnT6Q5dFeCdiZaOGah3LgfYGUsqmCk/ExewOIblISlKvpFW
         xLVdJS2RcpdWbNk4ZxxiYnAKcjYR8ZqDQtEQwshQGCERy9U2dcalrwjZD+rug2hXydc0
         99Q2hpJbI0+l412uDyKuEjTGycIr3GMsqOSkzDfivGpbTfAtVwoMXaZ5SPXx+2Di9gUu
         bWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kwgwn4nxDPHONxfpv9ST7ryL+LvQhvZMH1dAza0ugw4=;
        b=du5T5MO4rvSS4o+rHOLbXlnNERPIY41LVcaxYeIaigo3gx/YmPFlofRV8WE11VYKbL
         GpTYW5k/cLzynEoosLRY1FBPL62YTNT1h+R4wcN+h++XJwyCTtE6HMGKlxVTrQrBGRCz
         Y6s2R24pSYc4N7WuS3/o8DiwrF6r/bBBiyUkfsBN74iq1uIBww1nNGBYBw6P9uQRKEfO
         giABT1zrmA1C9NAuZSxTTEY6lsBPKJJkyliuSsgeoJYh6doZaMAAFU3BtbyIlLC53nNn
         TUgxOiTztY9E7GATwGQPe0YU9P1PPdt8L420CW4IcmthUUIbNyBD/eJ2YWtaMOCobjgP
         RG3Q==
X-Gm-Message-State: AJIora+oIJiMuxtr3X1woM7quEouCIHDQcwjqq6a7xyKDk86hRnR4gZC
	6NZo3mUIZs/EtoWJUxx2pZBv3/6UCrg=
X-Google-Smtp-Source: AGRyM1txKVD4jrGj5FhdZ0+s6cFNOSlkkgdZ1++x7l43ZviyW333xQ9oQT6rQ0X/+6NCfXUHh4h9cQ==
X-Received: by 2002:a05:6402:194d:b0:43b:f21b:e9f4 with SMTP id f13-20020a056402194d00b0043bf21be9f4mr20274505edz.180.1658995142575;
        Thu, 28 Jul 2022 00:59:02 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/2] automation: Remove XEN_CONFIG_EXPERT leftovers
Date: Thu, 28 Jul 2022 10:58:55 +0300
Message-Id: <20220728075856.1175504-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728075856.1175504-1-burzalodowa@gmail.com>
References: <20220728075856.1175504-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EXPERT config option cannot anymore be selected via the environmental
variable XEN_CONFIG_EXPERT. Remove stale references to XEN_CONFIG_EXPERT
from the automation code.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v2:
- add Stefano's R-b tag

Changes in v3:
- none

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


