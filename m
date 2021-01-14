Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04E2F64C6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67200.119725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hP-0002Ug-3P; Thu, 14 Jan 2021 15:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67200.119725; Thu, 14 Jan 2021 15:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hO-0002U0-Vu; Thu, 14 Jan 2021 15:38:10 +0000
Received: by outflank-mailman (input) for mailman id 67200;
 Thu, 14 Jan 2021 15:38:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hN-0002Sh-Jx
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7db08fb-9a29-474e-bba9-16ea968aab45;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 278E0AE61;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
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
X-Inumbo-ID: b7db08fb-9a29-474e-bba9-16ea968aab45
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIF6wlgKto7l14sulM2jBWZg1y3QuFNW1G+8fVgpNfk=;
	b=NhBtRzL+b1SXThGd+WY91WfSpgyHXWezUT6Q/oTc3PO8tsZY3fgRZFIMqYGhoMPP2Xtga1
	O9pE10CH+jlOsOAjwhaPQOUYEZCiAwbQV3GLHosaGaDS3CU571M9go7cVFJvPrp7X2kQW2
	qxaQavOnPHLnCoPomuLgtbybD09OmcM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v11 02/27] tools/libxenevtchn: rename open_flags to flags
Date: Thu, 14 Jan 2021 16:37:38 +0100
Message-Id: <20210114153803.2591-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the xenevtchn_open() parameter open_flags to flags as it might
be used for things not passed on to open().

No functional change.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V11:
- new patch (Andrew Cooper)
---
 tools/include/xenevtchn.h | 2 +-
 tools/libs/evtchn/core.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 91821ee56d..3e9b6e7323 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -67,7 +67,7 @@ struct xentoollog_logger;
  */
 /* Currently no flags are defined */
 xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
-                                 unsigned open_flags);
+                                 unsigned int flags);
 
 /*
  * Close a handle previously allocated with xenevtchn_open().
diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index 5008810f4f..50bae8ec0d 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -29,7 +29,7 @@ static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid)
     return xenevtchn_restrict(xce, domid);
 }
 
-xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
+xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
 {
     xenevtchn_handle *xce = malloc(sizeof(*xce));
     int rc;
-- 
2.26.2


