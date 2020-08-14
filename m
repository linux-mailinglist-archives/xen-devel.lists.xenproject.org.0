Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604A244D6E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPS-0002B6-LT; Fri, 14 Aug 2020 17:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPR-00024Q-F7
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:29 +0000
X-Inumbo-ID: a79bd1c9-9634-4cd9-8417-1e073b6419dd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79bd1c9-9634-4cd9-8417-1e073b6419dd;
 Fri, 14 Aug 2020 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=8vkytt5GqRpeoxBlU85WPhVwiOpNG9/WUvBGp0GKiVM=;
 b=dBpQA09yT/3nEsZkwoeRj0qVsk/3BXxjwCymBwqChmTxHvOfgfPbItAc
 lzcdKSLzCeHLeKwfze0XGtG5yATL7yURjZ8edm3wbpCJdtGA0jqzbcOJe
 T5Uf8e1cRKqbDEfgoj4tIyqpFSjPqDzMFFcvwoHOCuiPiW+Or2mJ/7GiP k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Dvfpk2V3imRT+F9GdlmwJ2Stpeyx6tur2Q73/P3xHH8H7B1bL8TI1Tto2stI0ng3nqHrR9DJ8L
 m6A3GVCRPkai7iWsrOQy9D+c1HP1VHAkdr6THDQGQnkRUuQAGzkZ2J/Idz2uFwskuU3vnFtNc/
 fWWhKtzh3aJDHjubDDlhfgnixq8dEtKTojQ+O22qx0d3ZdL7Y4VQ+pd++qobBDi4Jo5AWpnD8Z
 Js3w49RxS5P6s2NLxyQKpXeTX3UDubPy+fLjf1bMLxA3D876qraQBl4HRb3GbHAH4pqDrdzdXu
 zlY=
X-SBRS: 2.7
X-MesageID: 24900368
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900368"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 15/60] history reporting (nfc): Introduce
 cache_set_key_cols
Date: Fri, 14 Aug 2020 18:21:20 +0100
Message-ID: <20200814172205.9624-16-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

This setter function will be needed when this becomes its own module.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 9510757f..07e549a0 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -76,12 +76,14 @@ our $restrictflight_cond = restrictflight_cond();
 our $flightcond;
 our $minflight;
 
+our @cache_row_key_cols;
+
 our %cache;
 
 our %q_count;
 our %q_misses;
 
-our @cache_row_key_cols = qw(flight job status name);
+sub cache_set_key_cols { @cache_row_key_cols = @_; }
 
 sub cache_row_key ($) {
     my ($jr) = @_;
@@ -177,6 +179,8 @@ sub cache_write_entry ($$) {
     print $fh " -->\n";
 }
 
+cache_set_key_cols(qw(flight job status name));
+
 sub computeflightsrange () {
     if ($flightlimit) {
 	my $minflightsq = db_prepare(<<END);
-- 
2.11.0


