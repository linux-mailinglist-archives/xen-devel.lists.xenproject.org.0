Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BC1D3279
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZEf1-0007EO-QJ; Thu, 14 May 2020 14:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2eD=64=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jZEf0-0007EJ-ND
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:16:30 +0000
X-Inumbo-ID: 813b5452-95ed-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 813b5452-95ed-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 14:16:30 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jZEez-0003Uc-6M; Thu, 14 May 2020 15:16:29 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH] cri-args-hostlists: Do not include transcript in
 reports
Date: Thu, 14 May 2020 15:16:26 +0100
Message-Id: <20200514141626.29137-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
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

These transcripts are huge and not useful.

Still include them if sg-secute-flight failed.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cri-args-hostlists | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 3578fe1c..28d576db 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -86,8 +86,11 @@ execute_flight () {
         ./sg-execute-flight $1 $2 >tmp/$1.transcript 2>&1
 	local rc=$?
 	set -e
-        cat tmp/$1.transcript
-	test $rc = 0
+        if [ "$rc" != 0 ]; then
+		cat tmp/$1.transcript
+		echo "rc=$rc"
+		exit 1
+	fi
 }
 
 start_email () {
-- 
2.20.1


