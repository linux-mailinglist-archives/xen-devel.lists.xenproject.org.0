Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B555887EE82
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695063.1084623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGVx-00020S-SD; Mon, 18 Mar 2024 17:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695063.1084623; Mon, 18 Mar 2024 17:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGVx-0001yL-Nf; Mon, 18 Mar 2024 17:11:09 +0000
Received: by outflank-mailman (input) for mailman id 695063;
 Mon, 18 Mar 2024 17:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHY-0002gq-L9
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:16 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ca5a649-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:12 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41412253e71so7269575e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:11 -0700 (PDT)
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
X-Inumbo-ID: 6ca5a649-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780971; x=1711385771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJaVDu1HMN8nfSe34Wd7KEfeD3d4HQ65vleYBfsnpac=;
        b=LMlaEySiRkJ4mjwpdzbRgXK6nMiASO/g0d+vCYRUluLIzGfESf+D5kA6aRwwrcZiVh
         cAvn2Zw7kJrtdqw500dJ51tNrdDd3OYnUgr6brkmKpNnt1QtgrpjO4xW00ZR//1Q8uEi
         xfTax9o+3l1NQ4MvifyU/ClSnyWD02tR+lWxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780971; x=1711385771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJaVDu1HMN8nfSe34Wd7KEfeD3d4HQ65vleYBfsnpac=;
        b=FqgLC2R5M+qKumWVHQk96O/CJyAABDpF+7zxnVBv/9B/h/p4RkOd2ZAQu5MIbs19Xg
         F0g5slqWKgxe0mrOdKbcKiJ4rrASM/oqW8rRTyLqQBeGPg8sJdRQOJch4828G+rCPpYV
         4iqwyqBcRa0mEWsXGdVv9lZsfsz2BnWhMTT7mMS8GNla/vlqHZziDbm+kbcAQiWam7Wy
         bAw4NIGJEW8RMJTQuc+NPZ7cufQBtZALdMsw8P4sFEKpvWq3td2JnZoq43ak/Pm0QWqu
         pnIssaqyvzOSxxrx+GMRWCYPE8DagdaZsls7xepsKKcEvkkzdfcWxKIUxtnr7Xn+OFSs
         ahaw==
X-Gm-Message-State: AOJu0Yy6nLMID62VmgOsw+FpDqCsFNuPXag3HFtm+ywOcE0uQeGfMWIC
	JzYiXFnE1ilGZ4uJnSO0qcxbwkH0tcObVF6DwI2ovlQtNinWvvS9ISE+SD14Nxnrj73r/ZCFCMu
	W
X-Google-Smtp-Source: AGHT+IHaB/e3DTU/QGOuC0o0JPNOW3lrzTIeuYBU2yenLyQlwGyoquKV7itLuHb60AIA57Y7D3FACA==
X-Received: by 2002:a05:600c:1389:b0:413:ee4b:cd8e with SMTP id u9-20020a05600c138900b00413ee4bcd8emr9755387wmf.24.1710780971394;
        Mon, 18 Mar 2024 09:56:11 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 24/36] ts-nested-setup, setup l1 lvm volume groupe in guest
Date: Mon, 18 Mar 2024 16:55:33 +0000
Message-Id: <20240318165545.3898-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LVM in l0 doesn't let us run pvcreate on the host LV, `pvcreate
$outer_lvdev` fails with:
    Cannot use /dev/$l0-vg/l1_gueststorage_outer_lv: device is an LV

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-nested-setup | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ts-nested-setup b/ts-nested-setup
index be3d3733..7fc8beef 100755
--- a/ts-nested-setup
+++ b/ts-nested-setup
@@ -80,14 +80,14 @@ sub guest_storage () {
     target_cmd_root($l0, "vgremove -f $inner_vg ||:");
     my $outer_lvdev = lv_create($l0, $outer_vg, $outer_lv, $size);
 
-    target_cmd_root($l0, <<END);
-        pvcreate $outer_lvdev
-	vgcreate $inner_vg $outer_lvdev
-END
-
     toolstack($l0)->block_attach($l1, "$outer_lvdev,raw,sdb,rw");
     # NB this does not update the l1 guest config so if the l1 is shut
     # down and recreated in the l0, this will vanish.
+
+    target_cmd_root($l1, <<END);
+	pvcreate /dev/xvdb
+	vgcreate $inner_vg /dev/xvdb
+END
 }
 
 packages();
-- 
Anthony PERARD


