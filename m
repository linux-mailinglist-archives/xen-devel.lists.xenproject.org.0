Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D406DFD92
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520301.807737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfIL-0007M3-BK; Wed, 12 Apr 2023 18:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520301.807737; Wed, 12 Apr 2023 18:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfIL-0007Jt-8a; Wed, 12 Apr 2023 18:34:13 +0000
Received: by outflank-mailman (input) for mailman id 520301;
 Wed, 12 Apr 2023 18:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPvI=AD=citrix.com=prvs=459801679=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmfII-0007Jn-Ot
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:34:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac37d79-d960-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:34:08 +0200 (CEST)
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
X-Inumbo-ID: 9ac37d79-d960-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681324447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8aR5c3iwwAn+MHFxqQ3wmB9i/4CaPvwKAvF/3XXZ3g=;
  b=KOViJcXlDzXr9mI+CZmSqEg58U+I5q7FRZJWiGBzDTOASoKsU+H1iHy+
   mofvW8GTUkrtRNrJ0Pofr5ooc7h3h5yel5Uc0urenlYAiD4BBOabkn9Hc
   0lyvJeNQw+HDDL0IQBO5aK9pNYGyUUQayi+baFeAUHmU+V/AXCZp7MjoI
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 105184545
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:OXLSlK4Q+aV6onN0c7L+yQxRtCnHchMFZxGqfqrLsTDasY5as4F+v
 mAeDDqAPv6JN2WmfNAgYNm2pE0EvpaAnd9kGlRrqitmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawS5geF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 6EWDBoqfi2/ge+V8eKeTPtg18EiFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7F/
 zKaojikav0cHNajmRyv2XKdvM3goj/wUtgZNrSRpsc/1TV/wURMUUZLBDNXu8KRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQhX+PvhcYHf1KAeA+wAiXz+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZvA+Hoqfqc3IJTf94
 AHaiS4si+QWjPdegs1X4mv7byKQSonhF1Blv1+JAD30smuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2WBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMgoLlTYrXwzPRHMt4wIrKTKuftnU
 Xt8WZ/1ZUv29Iw9lGbmLwvj+eRDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8HX+PTkkU3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI9STB/UqOAnux9E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:QPwYt6sikskfLQfjgTOXzHRz7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-Talos-CUID: 9a23:N8yBcGOICzdayu5DfnRp0GQzCv0ZdHD+/Sf1JV20WGNocejA
X-Talos-MUID: =?us-ascii?q?9a23=3A0MhzRA+mez78Ib/XnjrSqACQf81Us4KEI0A8q7c?=
 =?us-ascii?q?phNWPP3Z7GT603A3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.98,339,1673931600"; 
   d="scan'208";a="105184545"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <Michal.Orzel@arm.com>
Subject: [PATCH] CI: Update FreeBSD to 13.2
Date: Wed, 12 Apr 2023 19:33:56 +0100
Message-ID: <20230412183356.2986459-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <Michal.Orzel@arm.com>

Successful run:
  https://cirrus-ci.com/task/6232358978846720
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index b133afb74057..9bb6cce4ead3 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -23,7 +23,7 @@ task:
 task:
   name: 'FreeBSD 13'
   freebsd_instance:
-    image_family: freebsd-13-1
+    image_family: freebsd-13-2
   << : *FREEBSD_TEMPLATE
 
 task:
-- 
2.30.2


