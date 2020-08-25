Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B92517DF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXK4-00037B-P7; Tue, 25 Aug 2020 11:41:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXK2-00030H-HQ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:02 +0000
X-Inumbo-ID: 96eb9674-f0d4-456b-b1fb-d7200e212ed8
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96eb9674-f0d4-456b-b1fb-d7200e212ed8;
 Tue, 25 Aug 2020 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=gyJ7RHtgfyrPqUIh/7IbYslh5wQnqEn0AH6SJydkzDk=;
 b=SI3npBlavX4oIftRWNem//Of+f1zc0weFira30nfBod6xlfge4N7AAT0
 KGTs7EFhQACQ4laL5RMhzzqF1ge18YAMzgt5v0fXklrYmCqyjcfrRR9f4
 S5bqofwc9sE8Tk06IuM9O9c64hmCK4ws2AYIfQoHNZBjcJpQ+Rn6trK9U s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ny6KDx10i0IsmUS09ysGVS60EPx2dP/HiTsa9AnMTScBb7sknxQrpArqzEHlSqnjraHU5xQWE8
 rMdpRDh/gMnzKfcz5EDfA/zpvtbfVnXwFBIj9K1v8rnBiiwYcM9ihUKzbOaB8WCxS+4RWMM9Q0
 PGworetgKns95pkz7qQJ8mBTSWD+yfX+NrDbEnqe+MnGhq828xZQ3fDXMfZyExQdXdq7A4YwLK
 NLgdxbPJLvrlrNzIBB+spjYFvuno7gDihHs4bKyRVucXup7Dde4p4FgeRJs5UdpLIKYSeKuPPL
 CaQ=
X-SBRS: 2.7
X-MesageID: 25246378
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25246378"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson
 <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/12] README.planner: Document magic job hostflags
Date: Tue, 25 Aug 2020 12:40:32 +0100
Message-ID: <20200825114041.16290-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 README.planner | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/README.planner b/README.planner
index c33aae11..f134d716 100644
--- a/README.planner
+++ b/README.planner
@@ -203,6 +203,66 @@ that shared systems get regrooved occasionally even if nothing decides
 to unshare them.
 
 
+ts-hosts-allocate-Executive and hostflags
+----------------------------------------
+
+Within a job, the allocations are actually done by
+ts-hosts-allocate-Executive.  It is told what to do by its command
+line arguments, which are (usually) simply IDENTs.
+
+The IDENTs provide the key for runvars which control the host
+allocation algorithm.  Principally, these are the runvars which define
+the job's hostflags
+    all_hostflags
+    IDENT_hostflags
+    runtime_IDENT_hostflags
+(all of these are comma-separated lists).
+
+Each such hostflag must, in general, be set for a particular host, for
+that host to be eligible.  But there are some special forms of job
+hostflag:
+
+  share-SHARING
+
+    The host may be shared with other jobs.  Typically used for
+    builds.  SHARING is a string which denotes the "scope" of the
+    sharing - jobs with the same SHARING should set the host up
+    identically.  The osstest test harness revision is automatically
+    appended and therefore does not need to be included.
+
+  equiv-FORMALTOKEN
+
+    For each equiv-FORMALTOKEN job flag set on one or more IDENTs, a
+    corresponding equiv-ACTUALTOKEN host flag must be set on the
+    corresponding hosts.  So, for example, if the IDENTs src_host and
+    dst_host both have equiv-1 specified, then the two hosts chosen
+    for src_host and dst_host will have an actual hostflag in common
+    which matches the pattern equiv-*.
+
+  diverse-FORMATLTOKEN
+
+    For each diverse-FORMALTOKEN flag, the selected host will *not* be
+    the same as any other allocation with the same diverse-FORMALTOKEN
+    flag in the same *flight*.
+
+  CONDNAME:CONDARGS...
+
+    Looks up CONDNAME as Osstest::ResourceCondition::PROPNAME.
+    The selected host must match the appropriate condition.
+    CONDNAMEs are:
+
+  PropEq:HOSTPROP:VAL
+
+    Require the host property HOSTPROP to be equal to VAL,
+    according to string comparison.  (Unset properties are
+    match an empty VAL.)
+
+  PropMinVer:HOSTPROP:VAL
+
+    Require the host property HOSTPROP to be at least VAL, according
+    to version number comparison (as implemented by dpkg and
+    coreutils).
+
 Flights
 -------
 
-- 
2.20.1


