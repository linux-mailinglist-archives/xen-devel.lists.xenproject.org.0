Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F173F6EE87D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 21:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526309.817982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOcq-0002L2-OG; Tue, 25 Apr 2023 19:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526309.817982; Tue, 25 Apr 2023 19:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOcq-0002Hz-Lb; Tue, 25 Apr 2023 19:46:56 +0000
Received: by outflank-mailman (input) for mailman id 526309;
 Tue, 25 Apr 2023 19:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v3bG=AQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prOcp-0002Ht-Jt
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 19:46:55 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb580ea1-e3a1-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 21:46:50 +0200 (CEST)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-3ef4a74b42dso30582501cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Apr 2023 12:46:50 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 rv12-20020a05620a688c00b0074c438db55asm1492592qkn.74.2023.04.25.12.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:46:47 -0700 (PDT)
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
X-Inumbo-ID: eb580ea1-e3a1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682452008; x=1685044008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kepz7/qGHLR5Ko6XQgYK3k4tdVN+H4VU8ZBZpvWm3pg=;
        b=dH1qID43D6X8wz4I74xUfwb48DtMD530JFfXz7XZOXL3O2UxX81y3JBZlhQznPXuH0
         RPR/C+gSQOA+LvseRCqMrBxCNi4pruoPtZKSG2QDNbDOK7cw3/ltnoqXi+0KOcVPGFwH
         8Dx7K+Y6NMy9VXjGRUt+p55RTZc+xVHS0li90TF8ni0v+7RwmN7+6gTtDM89LXTHDeHe
         7EEwzjC0wDMmCEXADoXwujWUTwEyR3Cp/HjZBa533qVkmlYr4etsabGSCTn6wVagjQAz
         6xypRCvHCfCKs/4Iun0kF6Kram9TZMwMHK8RrgjYjr5REX+CnKSnvYFegmv5Vorj5jb+
         BpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682452008; x=1685044008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kepz7/qGHLR5Ko6XQgYK3k4tdVN+H4VU8ZBZpvWm3pg=;
        b=KzjaNNBSP1gyTSnLt5Agm1lGZ79VR5nAuWcxsaLopFPFzWyIs/DqkZ49yG5I3sKxde
         5FPT6jW6H6kS3GLk1PHPm0rgQZP7FHw6kGqrD+070u90ES/GKVRPtN+rVj4CcjJyO0aK
         Z/VSxqQOUB+Nto869KGP8R24SkCP/H7fr0+pRn534CvrERbjavBdAvdeS3rbMtR9roq8
         PyQMFPz/0pFHGZiFjaRXug92k50ZwUJ507DNHOpIzcpcrHTPGYaJQDD36ITDL4q/Oko+
         5ouPUdLjy9wvTs5hLEaTo/wOFLoCSWmghGYzSausxmS4WmgoDUabPWzmeoYeUxUv4y1p
         qXfw==
X-Gm-Message-State: AAQBX9ead5LzbYSy6EVvVODlzLMt3g8x6MIdtvgnY7iLuMfNLHQACL8u
	PHPkCBc314nyNf/TCVtMIERHcCfmTnA=
X-Google-Smtp-Source: AKy350YcNREJfRH/nEbSDZMs6QUuHcjJdf65yWhgdMhhxiSp29zfA2++KPWh7/kNE0oPu6Gd6Dlvdw==
X-Received: by 2002:a05:622a:345:b0:3bf:bb1f:3c2b with SMTP id r5-20020a05622a034500b003bfbb1f3c2bmr30583251qtw.6.1682452008545;
        Tue, 25 Apr 2023 12:46:48 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] Fix install.sh for systemd
Date: Tue, 25 Apr 2023 15:46:20 -0400
Message-Id: <20230425194622.114869-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a fedora system, if you run `sudo sh install.sh` you break your
system.  The installation clobbers /var/run, a symlink to /run.  A
subsequent boot fails when /var/run and /run are different since
accesses through /var/run can't find items that now only exist in /run
and vice-versa.

Skip populating /var/run/xen when systemd is being used.  systemd
expects an empty /run on boot and works properly without one.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/Makefile b/tools/Makefile
index 4906fdbc23..32c8b0a2a2 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -58,9 +58,11 @@ build all: subdirs-all
 install:
 	$(INSTALL_DIR) -m 700 $(DESTDIR)$(XEN_DUMP_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LOG_DIR)
-	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LIB_DIR)
+ifneq ($(CONFIG_SYSTEMD),y)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_STORED)
+endif
 	$(INSTALL_DIR) $(DESTDIR)$(PKG_INSTALLDIR)
 	$(MAKE) subdirs-install
 
-- 
2.40.0


