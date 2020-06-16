Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84211FBC49
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEyX-0002az-2l; Tue, 16 Jun 2020 17:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HLj8=75=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jlEyU-0002ar-Vv
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:02:15 +0000
X-Inumbo-ID: 1ffde70c-aff3-11ea-b7bb-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ffde70c-aff3-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 17:02:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jlEyT-00084x-8A; Tue, 16 Jun 2020 18:02:13 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 2/4] standalone-generate-dump-flight-runvars: mkdir -p
 logs
Date: Tue, 16 Jun 2020 17:58:10 +0100
Message-Id: <20200616165812.25380-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
References: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
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

Otherwise if logs doesn't exist, the code in `standalone' which is
eventually called to build each flight will try to do it - but that
code is not idempotent in the presence of other racing copies of
itself.

Rather than trusting mkdir -p there, do it here.

No change other than to this dev-debugging script.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 standalone-generate-dump-flight-runvars | 1 +
 1 file changed, 1 insertion(+)

diff --git a/standalone-generate-dump-flight-runvars b/standalone-generate-dump-flight-runvars
index 3b893623..5c93b0af 100755
--- a/standalone-generate-dump-flight-runvars
+++ b/standalone-generate-dump-flight-runvars
@@ -53,6 +53,7 @@ if [ "x$AP_FETCH_PLACEHOLDERS" != xy ]; then
 	mkdir tmp/apmemo
     fi
     export AP_FETCH_PFX='./memoise tmp/apmemo'
+    mkdir -p logs
 fi
 
 # In the future it might be nice for this script to arrange to use a
-- 
2.20.1


