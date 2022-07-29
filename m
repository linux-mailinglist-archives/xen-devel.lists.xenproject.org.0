Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB135851D5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 16:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377563.610823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRM0-0002vL-EQ; Fri, 29 Jul 2022 14:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377563.610823; Fri, 29 Jul 2022 14:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRM0-0002se-Bf; Fri, 29 Jul 2022 14:52:40 +0000
Received: by outflank-mailman (input) for mailman id 377563;
 Fri, 29 Jul 2022 14:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHRLy-0002gj-K8
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 14:52:38 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1650fea9-0f4e-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 16:52:37 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id w5so6090305edd.13
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 07:52:37 -0700 (PDT)
Received: from uni.router.wind (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.googlemail.com with ESMTPSA id
 b1-20020a05640202c100b0043cf2e0ce1csm2415545edx.48.2022.07.29.07.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 07:52:36 -0700 (PDT)
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
X-Inumbo-ID: 1650fea9-0f4e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EpWGAxivG7VA1SFITY6jFALNeBUNtuGNZf8UrIE/8cE=;
        b=J2GfQJf+0aka5YXUMTEUH4QZh8ludkA3wGUd1r0nygz3LfjE4n80GfIeKcU0AX5lw2
         HhTxShERlM+d78TVABIFGhZa4364O8iQ2HdcfOi+TgPirNF/CgNWAnOBOR6ZHkJ61Vbr
         H0KqjNk1BK7I9UV9GVUVxRzJde3oyF0ISbwlgd56/qKDZYH3uOLS6pwakqtyqPvelNHB
         7b1EB8y20JDE6j8JUVWeS/j5UElZAp843h39cJqXr/6FV5uSRYUnBaJZGbqqeQwGC9dh
         6daEHW09q5Wpg4BZfFHDLyU06VJVnLStuwlnmD+yKixTm7hLi+PdvRIyTt7YXoWZJyVe
         7T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EpWGAxivG7VA1SFITY6jFALNeBUNtuGNZf8UrIE/8cE=;
        b=eI75yE7m0jn8ACGWmEy7NkzT6WbnwsuJa1WmVtYSdnSAEMSehFenlEhwMCt0C1XrmV
         OkR7Mga98qykzlbXD6t5wTLaySV9uqUfIecVm76Wo1C30ZZjaXSORG23qGcDAYIPqLAR
         w+AGS1y4whmIAPKpQ4z0aLVQIX48ICrocnT83Cf7ou/mKQhESI0XrlRTm4Z+yM+5JtcP
         El6UxAoCI8F8ixrkxPPnzn34i1y5YJisdTdMU2tkPxyvS3Xq2TyiM12VW6lCT8xns47g
         JyC3VfxLSuTD8gHs2QyS7ShF9P1f6xRjo4xUqL7N0ExATt8DPrTdZXzaVhMHMDdmOYIn
         yVpQ==
X-Gm-Message-State: AJIora+tFVqyecdewq0YcqaAd+/qdKf+K2mcn8l072low7p/oF0ahr/q
	UILSfjRjGASqPQ64zNvhYgwC+vhgfRmM6A==
X-Google-Smtp-Source: AGRyM1vjJh/vLa+qnPgcaVQz8m9J8iob0PA469RrrF+0gAB65qyaLWRTpl1ONytCDmPypF1URktgEA==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr4050804edb.142.1659106357006;
        Fri, 29 Jul 2022 07:52:37 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] automation: qemu-smoke-arm64.sh: Remove some stale comments
Date: Fri, 29 Jul 2022 17:52:27 +0300
Message-Id: <20220729145229.1250221-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729145229.1250221-1-burzalodowa@gmail.com>
References: <20220729145229.1250221-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove comment "# Install QEMU" because qemu is not installed, it is taken
from a test-artifacts container.

Change comment "# Busybox Dom0" to "# Busybox" because busybox is not used
only for the Dom0 but also for the DomU.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 automation/scripts/qemu-smoke-arm64.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 898398196a..f483a2ffc1 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -21,7 +21,6 @@ fi
 "
 fi
 
-# Install QEMU
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends u-boot-qemu \
@@ -44,7 +43,7 @@ sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts
 dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
 
 
-# Busybox Dom0
+# Busybox
 mkdir -p initrd
 mkdir -p initrd/bin
 mkdir -p initrd/sbin
-- 
2.34.1


