Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650D581A17
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 21:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375680.608152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPtv-00023s-EV; Tue, 26 Jul 2022 19:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375680.608152; Tue, 26 Jul 2022 19:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPtv-00021k-Bk; Tue, 26 Jul 2022 19:07:27 +0000
Received: by outflank-mailman (input) for mailman id 375680;
 Tue, 26 Jul 2022 19:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSNJ=X7=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGPtu-0001mA-Le
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 19:07:26 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f9589ca-0d16-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 21:07:25 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id j22so27863547ejs.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jul 2022 12:07:25 -0700 (PDT)
Received: from uni.router.wind (adsl-45.176.58.224.tellas.gr. [176.58.224.45])
 by smtp.googlemail.com with ESMTPSA id
 eg47-20020a05640228af00b0043bbcd94ee4sm8952306edb.51.2022.07.26.12.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:07:24 -0700 (PDT)
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
X-Inumbo-ID: 2f9589ca-0d16-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KuhC1kxwd9csR35zZXVNzYXhV5vaAkNKgTfykKJEjLA=;
        b=U3henfgLSkyzH5mr8ZBE40xVwJ8yWiGKYEXKCAmdE5nS3ywp7is/6BRL4DADq3Vvxr
         /4ZGd2XU7u5+RL3cFTCmbONYnadPDemw5LnrmkwClym3qS60YC87EE7Y41mkpFZAQOF+
         Psdzb0nn1UuxfEmfvdVCW7wiCdlQwDronuO+Wn0GnZLZ73HFmy05NRoEPJJGuBOv7Ote
         ygVuMlIRLrAisR7bJG80t3E9iLeXPKa0qTrfds6ao7JGlj84IAB//F8nG4Jh3t3aqa+6
         gKYA9zoJSJ7flz0kkDGdRgszea9gf0OlGb3g47bSFSLM2sb/aHlBsVa9ki+VqizKKZsa
         hSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuhC1kxwd9csR35zZXVNzYXhV5vaAkNKgTfykKJEjLA=;
        b=gU92YnLt6GoSQzddSnwKn+bmF7gLabScTo+wkzukHrKFTjrAs3PypQDaPs00xgQpny
         JejmyTXhUC6wLXu/D/MecoWp4/hhf1apRUP2kqm4uZ6AZTq8ssopvNpcKqSkrBTJLyaA
         yeCgqqDgkYcdrOolrQTbuCObXaCK9uO6BjSaXTF+6TEfY8D3WyRpt5ca97xSQOEAUbDQ
         J/jKikaeAW9gi0Io0x9lCbXyYtDdPbGyy3RAhfwzmyh6g6DjwnsPQoT9dNN/HnTlb5Eg
         60AOeQ6MzgsRsIaT74mmWyhHjMsicV3RegmdXpQBIVadgcJWL4nYVlM2x4LkGWXbdqPU
         UFBQ==
X-Gm-Message-State: AJIora/xF32To8iwoyEUXYjSS+pMkmBpkN424M3OfW0U2Je/N7vpeZl6
	nuBqYOzCBn3uVtXwJMTPwanPEek8VXQ=
X-Google-Smtp-Source: AGRyM1uXQsxs32z/UGYWbc6C54OE0fAhSrD/HZ5ulNk4vTDQTPhDUYUNbUKjeIjcMrDaIqynd13AMA==
X-Received: by 2002:a17:906:5a51:b0:72b:5cdf:ed77 with SMTP id my17-20020a1709065a5100b0072b5cdfed77mr14908863ejc.505.1658862445179;
        Tue, 26 Jul 2022 12:07:25 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] automation: Remove XEN_CONFIG_EXPERT leftovers
Date: Tue, 26 Jul 2022 22:07:00 +0300
Message-Id: <20220726190701.1048824-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726190701.1048824-1-burzalodowa@gmail.com>
References: <20220726190701.1048824-1-burzalodowa@gmail.com>
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


