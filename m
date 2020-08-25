Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86C2517E0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXJq-00030X-12; Tue, 25 Aug 2020 11:40:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXJo-00030Q-Rx
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:40:48 +0000
X-Inumbo-ID: 7c133b02-b6ff-4413-815f-ddae1da630c9
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c133b02-b6ff-4413-815f-ddae1da630c9;
 Tue, 25 Aug 2020 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KfSlZLk/KOh1OUKHe06qR7J7T5mdZ2Yh0iKTX9+NwSw=;
 b=fxrTzWe8+1ST06NeWGvHT813psnXDWwSKx88/nCCxs/bqiqtB5BbtG3Z
 Jo0ifueZGcrh14nGsrz9YA0ZhMwqRoISdXSEYhD43nWXk3kY60iAKfWQL
 up9fIYRVwJJQc9PURngQ+y9tj2kKsX3O3FwtD9rIFz/cCJC0t3TGpHLsO g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: b2YfxzFhg0jEXB75IrztMS+OLjzt8Z3KZPr3Oy4LpaIADProea7Z8l7JdymTFbba06vFfsJ5jl
 ERxkpWAZOTjOKUjr6t++ZENnZ9rU/KWetOZKb++JFkjJ5PrvKH2uTn2qysVAgC09YV1367koDw
 TtjcQBwm9tCHHFg0p5uNNey7M/XbcfQT3V8zjV65vlW2YWteqsDFYF+Jb73UPFxo7rzbayqwvL
 5i2M4ngp3Vk8rrczwjsbce/SvRc1ztRmGf0n2cr+kKsu31D+tGgVPgT1hF23rHrIAWoEc+ois/
 /Kg=
X-SBRS: 2.7
X-MesageID: 25539846
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25539846"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/12] target setup refactoring: Move
 target_kernkind_check
Date: Tue, 25 Aug 2020 12:40:37 +0100
Message-ID: <20200825114041.16290-9-ian.jackson@eu.citrix.com>
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

This is OK because nothing in access() looks at the rootdev or console
runvars, which are what target_kernkind_check sets.

No functional change other than perhaps to log output.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-debian-fixup | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-debian-fixup b/ts-debian-fixup
index 528fb03b..34051137 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -209,8 +209,8 @@ sub writecfg () {
 
 savecfg();
 ether();
-target_kernkind_check($gho);
 access();
+target_kernkind_check($gho);
 
 debian_overlays($ho, \&overlay);
 target_cmd_root($ho, <<END.debian_overlays_fixup_cmd($ho, $mountpoint));
-- 
2.20.1


