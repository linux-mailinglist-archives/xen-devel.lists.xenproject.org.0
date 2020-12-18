Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99C2DEA8B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 21:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56689.99304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMlS-0002M4-Kq; Fri, 18 Dec 2020 20:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56689.99304; Fri, 18 Dec 2020 20:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMlS-0002Lf-HE; Fri, 18 Dec 2020 20:54:14 +0000
Received: by outflank-mailman (input) for mailman id 56689;
 Fri, 18 Dec 2020 20:54:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpih=FW=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1kqMlQ-0002La-JY
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 20:54:12 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7026208b-057f-4e68-afaf-70403a55dbd9;
 Fri, 18 Dec 2020 20:54:11 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id 9BD54C3AF0F;
 Fri, 18 Dec 2020 21:45:30 +0100 (CET)
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
X-Inumbo-ID: 7026208b-057f-4e68-afaf-70403a55dbd9
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/3] docs: set date to SOURCE_DATE_EPOCH if available
Date: Fri, 18 Dec 2020 21:42:35 +0100
Message-Id: <23352f4835ae58c5cae6f425d5a8378f3d694055.1608319634.git.maxi@daemonizer.de>
In-Reply-To: <cover.1608319634.git.maxi@daemonizer.de>
References: <cover.1608319634.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the solution described in [1] to replace the call to the 'date'
command with a version that uses SOURCE_DATE_EPOCH if available. This
is needed for reproducible builds.

[1] https://reproducible-builds.org/docs/source-date-epoch/

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/Makefile b/docs/Makefile
index 8de1efb6f5..ac6792ff7c 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
 -include $(XEN_ROOT)/config/Docs.mk
 
 VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
-DATE		:= $(shell date +%Y-%m-%d)
+
+DATE_FMT	:= +%Y-%m-%d
+ifdef SOURCE_DATE_EPOCH
+DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u "$(DATE_FMT)")
+else
+DATE		:= $(shell date "$(DATE_FMT)")
+endif
 
 DOC_ARCHES      := arm x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
-- 
2.20.1


