Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE14ECBA8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296466.504646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZcso-0001Os-DW; Wed, 30 Mar 2022 18:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296466.504646; Wed, 30 Mar 2022 18:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZcso-0001MF-AW; Wed, 30 Mar 2022 18:17:26 +0000
Received: by outflank-mailman (input) for mailman id 296466;
 Wed, 30 Mar 2022 18:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZcsm-0001M9-Q3
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:17:24 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a52d354b-b055-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 20:17:23 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id 85so17329323qkm.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 11:17:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05620a424a00b00680c0c0312dsm7647908qko.30.2022.03.30.11.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:17:21 -0700 (PDT)
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
X-Inumbo-ID: a52d354b-b055-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YqCLPlryrNNNW0/olca6wbBWbnfZE4rRVNX1Y/x2+E=;
        b=bK3iFG5bWynCGaU2ntDTSGnUaORvgJ3IaMBlcLG8ci7GlRARjRgcAID2RzsdQKa5Yj
         Og7ZFUxGhsHr4FKlrO5EF79ecS0niCyjghloIo/hqD1sjGWvucP9sAobAD5kafsQGhf4
         a33pA6EpW3u43Gz/glwc6CEqFrgWSjUt++rFTptSNIaq8tmN5z26HD8PHXPZjMCuvfmg
         NoiR3YRQAEk5G//x8uvP08jrPOzillmltsygJ2Hvfiu6N0gGNRdmheoIpg2zZIAyDFXW
         bIt6Y6lLjEIP4Zo8IciaSvr8cK/gft0h6cIuykOaqPQBzmASSvf+ilROIIbMKleynKy2
         p6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YqCLPlryrNNNW0/olca6wbBWbnfZE4rRVNX1Y/x2+E=;
        b=nHfrfyUAf4ilcxK/cUfRUmipUSarB2T/bwuGR7LiYtg14QNkhRiq/vfNaudO/IYQ1s
         6yMqYGx4jrhU9UeRIqzpjYtHGz/47e624YR4FBmA+i8Yzllg4vDBxanpIaqch4PpQQnb
         ieVneZ+ggZ48IQSiECG+Dd1qy8XhZMD85JJ49zqUXNMp2bvOWW6T2n7X5By1ep5QT0gJ
         gk1wnaZK6axeAI2XDGEkYObgbzLkNaRgKUdMPkEDwWiIyEjpkAK7VCCaTs9LB6QlCyZQ
         qgnRzqRwKqimdTfcMNAfRKRfUInp8eX7SAQj7eB6xjUeYJhvEpc5XASdEZnz2Rh7JbZO
         C3BA==
X-Gm-Message-State: AOAM532MKbrVm1Zd+fQVb0tgDHQuagdtnpMJ0Dxchy7JuUZ+cUIUrfpl
	FF0OlWqxj35d37/stPPrIh90KUOMaXk=
X-Google-Smtp-Source: ABdhPJzQUf/8qwXR20wbxPBnQEhlfkYx6oNT+P5gGem+NBl949xIkf3ITs0D1w4T68XglKkC3drSew==
X-Received: by 2002:a05:620a:16b7:b0:67d:3abc:e4d2 with SMTP id s23-20020a05620a16b700b0067d3abce4d2mr693864qkj.702.1648664242081;
        Wed, 30 Mar 2022 11:17:22 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Always set ao for qmp_proxy_spawn_outcome
Date: Wed, 30 Mar 2022 14:16:58 -0400
Message-Id: <20220330181658.30209-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've observed this failed assertion:
libxl_event.c:2057: libxl__ao_inprogress_gc: Assertion `ao' failed.

AFAICT, this is happening in qmp_proxy_spawn_outcome where
sdss->qmp_proxy_spawn.ao is NULL.

The out label of spawn_stub_launch_dm calls qmp_proxy_spawn_outcome, but
it is only in the success path that sdss->qmp_proxy_spawn.ao gets set to
the current ao.  Move the setting earlier to have an ao in all paths
through the function.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Another option would be to make spawn_stub_launch_dm call
spawn_stubdom_pvqemu_cb on error.  This avoids needing to set
sdss->qmp_proxy_spawn.ao, but it makes more paths through the code.
---
 tools/libs/light/libxl_dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9a8ddbe188..59a8dcf3a9 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2468,6 +2468,9 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
     uint32_t dm_domid = sdss->pvqemu.guest_domid;
     int need_qemu;
 
+    /* Set for out label through qmp_proxy_spawn_outcome(). */
+    sdss->qmp_proxy_spawn.ao = ao;
+
     if (ret) {
         LOGD(ERROR, guest_domid, "error connecting disk devices");
         goto out;
@@ -2567,7 +2570,6 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
             goto out;
     }
 
-    sdss->qmp_proxy_spawn.ao = ao;
     if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
         spawn_qmp_proxy(egc, sdss);
     } else {
-- 
2.35.1


