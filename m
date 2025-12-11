Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E558DCB60A7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 14:36:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184093.1506623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgpM-0003IR-Ky; Thu, 11 Dec 2025 13:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184093.1506623; Thu, 11 Dec 2025 13:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgpM-0003G0-He; Thu, 11 Dec 2025 13:35:28 +0000
Received: by outflank-mailman (input) for mailman id 1184093;
 Thu, 11 Dec 2025 13:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W3S8=6R=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vTgpL-0003Fu-VQ
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 13:35:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe04eda-d696-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 14:35:25 +0100 (CET)
Received: from nico-ideapad (opnsense-fib.sca.unipi.it [131.114.30.34])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 5EF214EEBF88;
 Thu, 11 Dec 2025 14:35:23 +0100 (CET)
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
X-Inumbo-ID: 3fe04eda-d696-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=131.114.30.34
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765460124;
	b=FZwcZtGW6fqVB+LfSxYB2xUDksJsuYccbaVSX6gtI+D1ivS0cv7XMT55+gPxBRpRB+lT
	 y2r+q+0vA5r0340+6rZqT7kgiwA5kU26SxeHcj4kTY1ldI4Kbp0zSkBzP+gCW4/MWrZbj
	 SHaPFXDPlYe2lN8Kk4UFtIzYUik4+8Yq01IFqHzK0RO8yKn/lb717eWUwtUa3h1m8uagb
	 mQhWQBWNkNbU2dFG8hrh7emHl8WzyEF/9SfusnuO8Bnhf++oxoXr59Lxd+UG+J1rMBO0B
	 /Uk/mQ1JyUjWn8g5d4HlzZuDgKG4qjKYPVxVIHc2lcq3Ao/DqRw7xySe1MnwLblkZivjW
	 K7eQ0R+3x6dgahtCjJuSc+pfBqb3eunlob6uGcPtE+AKoXs8OWDVwhwrYGdArGgOdcXu6
	 bxHD3yrgQ1cbGUI4v1gff7i9bUYjXhLh7LSrceKvKnv1q5eKv5oO7ryaBqp6plyPT6HsS
	 pNSiUl6ln6+T8JO6akluTjhpl561uB3SKLpyqdlAB032h4DUtehkQjoq28Z1e4lXsm1Nj
	 fuQRze3S4K9PTbFWc9nG6FyyJIUUi4MxoL9NB+bcguZsk6NhJTRRnn1gsjJSF9XL6bWnh
	 JuiXA6hGTCj9wcQUo1QvJZAuv0DUCVg9e+1bAft5aKiNd1rzeEoitUPT6LIHUI8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765460124;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+rzCWH0Y8pEJlCjlb9auQTIKxJOMaugB4OTrhjuAe8s=;
	b=N7Oh0zL0ghcX//YogBtZWAj2SzLdbzFbPFz7O3JqyZ2UM0ZCodvBjs0OGWKBX2lN5mWv
	 q06wn7Ta3hqeQeuaFNAWyhHtM/TMqlGkUdLCYlyAJBbQqc3Spujg2vKHNDo1zw3GlewJ6
	 tdiGl/irpY1uxzD/4hxeSu6myYksGRy3LnARMwSb+Gs0MiosoKbaHYtdk4Y9zFAbH7l0X
	 k2GytqqJOlTvcA0yPnCsPMBbRJ5tU4geGIIGg4zOEibcIS8jCLe6b5HeVx9/ClEGUOiJa
	 XEGF0jc978Wyuoxuj2hTIjtP0m7CMXKEZlugYqAxd4zB8oql+5qVySdnI1AGF/c3RKBq/
	 PosOl0g8WjfCv0RvQM4z+Aj9d69GfGDZWEpH/gwPAkSwOn7/hwN17/dqEq6nu/jwSQH7t
	 QxfzrkEMY5wtW1rcR8TVHUCCMubVvlzmbOItbuYheoeJeHnLCGI5VXWEF0C+CH1PR2GX6
	 2eDS9uP0RQejp2Ztu3GDaaHIYX9FNfht4M3uAW3cJUAQKKHLketOe28S0KA3ScUKQZ44B
	 YErXyJMy/+7qBkkgJI6fu2nnD5tZLmnTWWwAuJs8eFE17v2jLK4fdheDcCsDH+/sG/Mg9
	 qsljVTFWXmkxyIiCEdhtToQz8yXk29XGpP7cnstlK9Zlyfvc1ttP1GaBIeIMuy4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=131.114.30.34
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH] automation/eclair: Run *-testing jobs only in some branches
Date: Thu, 11 Dec 2025 14:34:54 +0100
Message-ID: <cf852fe2b233bf98e57bcf82d4c9253b59aa17ab.1765459392.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

These jobs should not run in regular scans, but only in xen-project/people
repositories and branches to speed up pipeline execution.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This should alleviate some of the recent delays of the ECLAIR pipelines
---
 automation/gitlab-ci/analyze.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 5ddfe37903..88bc42f5c3 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -52,6 +52,8 @@ eclair-x86_64-testing:
   tags:
     - eclair-analysis-testing
   rules:
+    - if: $CI_PROJECT_PATH !~ /^xen-project\/people/.*$/
+      when: never
     - if: $ECLAIR_TESTING
       when: always
     - !reference [.eclair-analysis:triggered, rules]
@@ -110,6 +112,8 @@ eclair-ARM64-testing:
   tags:
     - eclair-analysis-testing
   rules:
+    - if: $CI_PROJECT_PATH !~ /^xen-project\/people/.*$/
+      when: never
     - if: $ECLAIR_TESTING
       when: always
     - !reference [.eclair-analysis:triggered, rules]
-- 
2.52.0


