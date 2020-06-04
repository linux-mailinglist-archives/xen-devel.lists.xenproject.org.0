Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093761EE4B8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:45:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpFN-0005c6-Rk; Thu, 04 Jun 2020 12:45:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcT=7R=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jgpFM-0005bg-Bn
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:45:24 +0000
X-Inumbo-ID: 3745003a-a661-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3745003a-a661-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 12:45:06 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jgpF3-0006vr-Bn; Thu, 04 Jun 2020 13:45:05 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 4/4] cs-bisection-step: Do not needlessly repro on tip
Date: Thu,  4 Jun 2020 13:44:59 +0100
Message-Id: <20200604124459.18453-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
References: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If we were halfway through bisecting, we treat the incident failure as
the basis failure.  But our previous bisection results can count as
indications that things are really failing - we don't need to repro on
the very final commit.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index bc6fb794..9a0fee39 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -873,7 +873,8 @@ sub search () {
         need_repro_sequence(2, sub {
             my ($repro_count, $is_last_repro) = @_;
             need_repro('pass', $nodes{"@basispass_rtuple"}, "basis pass") ||
-            need_repro('fail', $nodes{"@latest_rtuple"},    "basis failure");
+            need_repro('fail', $nodes{"@latest_rtuple"}, "basis failure",
+		       !$is_last_repro);
         });
 
     foreach my $startfail (@failures) {
-- 
2.20.1


