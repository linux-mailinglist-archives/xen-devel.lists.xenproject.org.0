Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF911FBC4A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEya-0002bB-BZ; Tue, 16 Jun 2020 17:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HLj8=75=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jlEyZ-0002ar-Qp
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:02:19 +0000
X-Inumbo-ID: 1fd91f62-aff3-11ea-b7bb-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fd91f62-aff3-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 17:02:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jlEyS-00084x-Vw; Tue, 16 Jun 2020 18:02:13 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 1/4] standalone: Fix spurious ]
Date: Tue, 16 Jun 2020 17:58:09 +0100
Message-Id: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This looks like this was once a call to test(1).  ssh-add, as it
happens, seems to ignore this spuriuous `]' (!) so there isn't any
significant change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 standalone | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/standalone b/standalone
index 977ad50c..b51acf7b 100755
--- a/standalone
+++ b/standalone
@@ -136,7 +136,7 @@ if [ ! -r "$WebspaceLog" ] ; then
     echo "WARNING: Cannot read apache logs at $WebspaceLog. Some tests may fail" >&2
 fi
 
-if ! ssh-add -l >/dev/null ] ; then
+if ! ssh-add -l >/dev/null ; then
     echo "WARNING: Unable to access ssh-agent. Some tests may fail" >&2
 fi
 
-- 
2.20.1


