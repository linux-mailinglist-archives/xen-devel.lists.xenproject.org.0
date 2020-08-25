Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318052517E9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXKG-0003Hi-3M; Tue, 25 Aug 2020 11:41:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXKD-00030Q-OM
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:13 +0000
X-Inumbo-ID: 40e0b126-323d-4f92-9d1c-23933f2ef573
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40e0b126-323d-4f92-9d1c-23933f2ef573;
 Tue, 25 Aug 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=V3dp6ogsZeukd7HS+zQVWguTAl6WZQIGCg2gBghL8Mo=;
 b=X2gWnzbl0fF8sry1mfJonU+Gpe60I6jcYXg9iDf62mTEhp7gLPybGR+3
 EFffTSn21HgixsUxsDaQRo4SKNy1X4T81T+HgqT0XP4T3hFWf/JILLx+v
 xxNiB+NbaqN5I/ftr4PhRVycz4igYO1bZgCEYkkH7Z2X7FJMRdRKlqQBP c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Gvnj0CSp6Em3Zzjaj5uTubKIe75V6DoY+SaLrnfEwETAWouiVxd3qB+oTgj7mByusc+klmg8Cx
 QhjN6K3nAfVb7qMvlnG/QBHXLJHrbr7sisTv6VsfsWqKNZh7n9r1DtzHbBEhg4IHpPMDs9od+B
 ksN3eneoQ9cNqCaIoh//6sz3LR5OP22CupYEITr39PiGNN9PLHmWrccD3h55bO92Ue+hMFShx7
 4QTU+qjHz0uEC4lONWxpKnZ2VqP37O7+TinWvlOmE/cctgtG+SY9GH8kr5zzircKrzbcRznSiP
 eXw=
X-SBRS: 2.7
X-MesageID: 25223287
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25223287"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 06/12] duration estimator: Fix a warning
Date: Tue, 25 Aug 2020 12:40:35 +0100
Message-ID: <20200825114041.16290-7-ian.jackson@eu.citrix.com>
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

$onhost can be undef.  Fixes this warning:

Use of uninitialized value $onhost in concatenation (.) or string at Osstest/Executive.pm line 1293.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 4151aa6c..b3aecfc5 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1274,7 +1274,8 @@ END
     return sub {
         my ($job, $hostidname, $onhost, $uptoincl_testid) = @_;
 
-	my $memokey = "$job $hostidname $onhost ".($uptoincl_testid//"");
+	my $memokey =
+	  "$job $hostidname ".($onhost//"")." ".($uptoincl_testid//"");
 	my $memo = $our_memo->{$memokey};
 	return @$memo if $memo;
 
-- 
2.20.1


