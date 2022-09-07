Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0515B0131
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401094.642785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrts-0005VJ-7o; Wed, 07 Sep 2022 10:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401094.642785; Wed, 07 Sep 2022 10:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrts-0005Sg-50; Wed, 07 Sep 2022 10:03:16 +0000
Received: by outflank-mailman (input) for mailman id 401094;
 Wed, 07 Sep 2022 10:03:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aULX=ZK=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oVrtq-0005Sa-BA
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 10:03:14 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a0646b-2e94-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:03:13 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id c198so4241518pfc.13
 for <xen-devel@lists.xen.org>; Wed, 07 Sep 2022 03:03:11 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 e2-20020aa79802000000b0053e468a78a8sm3086093pfl.158.2022.09.07.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:03:09 -0700 (PDT)
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
X-Inumbo-ID: 47a0646b-2e94-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3xfU7QSmwgcKmCVLKintC697OWHrXLzPEQ6qLjpHYZA=;
        b=tjoLDV/UZqNlj8O5brq2Hj8H4N8+FsMaiYNrNcx6WYfLG5xDNDUNQR7WhPCOsDIvpV
         uKHoZNVjHCKOgRx/dZo4oybp5SN5uBwYNsu0ql+d3jjCO5kPGX2I49y0QV727DZnURRu
         STICCzRNxIYuILK3B1a7haKp6GEL1+FPaAN0+xsa6FSLu/tsiTW71pIc9G9KEI6K/stD
         as5/aXUROn8vm6un/zM7wVQNDkupC0k42c2SxaoNtxTBF/cBme5KvuLWsFCUIRgTnZRD
         FPZd31Rab79/GxAX8fE04zsLUbborbD0UBY3CUqNCeXRULnHagE8TOCN2nNNhVSRi1Bx
         VaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3xfU7QSmwgcKmCVLKintC697OWHrXLzPEQ6qLjpHYZA=;
        b=qWsSU2MwcQP0ZwTnTSUzN6992QRhKrljbzy1D1s889lsZeBgm1PQQthMjxGCcIqpUe
         qJujko1Lgk2YknXnubxfnzhRzr7f5ZVIShsUQB2APd71KfEVl+ON0TJ0JhKOmSDC5Cy7
         hVfvb7kzMaWVPbavWEz9054wXlelk367voeuQAdYgv13V0HTuWrHFTsGw+6FSsLo1GhB
         58gTLpRpM624QomGFE86dszDrVFTP77P4ZVJK1Ht1pG0Xp/NSMc/uPw86ulBfrKerSsg
         ycIkZA52DilTqlFsTEmmAKCNA8xQtbWaO4lmQm/cHTgywyZ8vAXHaV/1Plyj79i8bceo
         Lw+A==
X-Gm-Message-State: ACgBeo0rdvN7NJM5VBoMq06SNRGUeQ+85ycV9p94r9aDb8FOEjjmqtBs
	DNfrit7HvTgT0cPOB5lF65P2lUlw/ANngw==
X-Google-Smtp-Source: AA6agR7K1kj4W9OyjjZMgrIMpyDYOkvyq4cYeq7qtT+hEwza2jaU6sryAO3P43mkQHGm9uLwoQhtNA==
X-Received: by 2002:a63:5201:0:b0:434:d865:3335 with SMTP id g1-20020a635201000000b00434d8653335mr2788951pgb.478.1662544990402;
        Wed, 07 Sep 2022 03:03:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] .gitignore: Add init-dom0less
Date: Wed,  7 Sep 2022 15:33:01 +0530
Message-Id: <b349ea9e7e2946ee6b3bc7d40462a4948e2b53a9.1662544834.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tools/helpers/init-dom0less to gitignore.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 27881c976432..9f9f18c97d5f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -170,6 +170,7 @@ tools/flask/utils/flask-setenforce
 tools/flask/utils/flask-set-bool
 tools/flask/utils/flask-label-pci
 tools/helpers/init-xenstore-domain
+tools/helpers/init-dom0less
 tools/helpers/xen-init-dom0
 tools/hotplug/common/hotplugpath.sh
 tools/hotplug/FreeBSD/rc.d/xencommons
-- 
2.31.1.272.g89b43f80a514


