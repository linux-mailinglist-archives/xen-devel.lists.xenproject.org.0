Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAD347F4E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 18:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101139.193233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP7H2-0006C3-H5; Wed, 24 Mar 2021 17:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101139.193233; Wed, 24 Mar 2021 17:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP7H2-0006Be-Dk; Wed, 24 Mar 2021 17:26:28 +0000
Received: by outflank-mailman (input) for mailman id 101139;
 Wed, 24 Mar 2021 17:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP7H1-0006BZ-2O
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 17:26:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9056c7fb-668a-4af9-a3fa-ed7c6ec7ad55;
 Wed, 24 Mar 2021 17:26:26 +0000 (UTC)
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
X-Inumbo-ID: 9056c7fb-668a-4af9-a3fa-ed7c6ec7ad55
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616606786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dPLHjrsIcdVSICRqBVB8jslK5tUec3Pu0TVa6q4+SJs=;
  b=gXxx460c52GaU+649573Ty+xF9DOQ+AHg6fXqf1YhftUNTRqbNRVb6XU
   7qM0w5UDOJH5Kx/g5OfZ7CQzT86IIFxFP72oqmRZMi6Uy502lYWm7bBZw
   19ZKujkROty2RLjsLKKzjrd3tdmfadHqX7nQ/hGkB+Ul+ihX7qQr/ESHk
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fCpAEyZgOB4i1AjeKnOHs3t945P3Hp22YadJSqZPoAw6U/ikHIDBHKmkf0MyHaqYchHU9Kauqk
 90ccKBHgzdsgYwGmTY/hDwdKeeLQgk3yX0oO9VoaR9PcYnQKettwBuuh1xmc5ikRuyUGnRtZ8t
 Iv5b2r5X/+91+DptHAv750gNzYFrlPjhxum5GklOfLQBmv6ouhOVmn+y8crzzF9kUFVPneSDnO
 ChIV+xB1eV2SM5B8QHVYRbxroeuwqRx1bEeheaghqgojYyzDMH5h41gFvtm1Bc5/ENlFY2Hqk/
 OVM=
X-SBRS: 5.1
X-MesageID: 40050011
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TM5ZpKNBWpIUl8BcTiWjsMiAIKoaSvp033AA/SlKJyB9WMqeis
 yogbAnzhfykjkcQzUNntqHNamGTxrnhPpIyKMWOqqvWxSjhXuwIOhZnO3f6hDpBiGWzI5g/I
 h6dawWMrHNJHxbqeq/3wWiCdYnx7C8gcWVrMPT1W1kQw0vS4wI1XYbNi+hHkd7RBZLCPMCff
 L2jKd6jgGtZGgNaYCDDmQFNtKzwOHjro7sYhINGncciTWmsDXA0tHHOind+h8fVj9VqI1Sk1
 T4rw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40050011"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out HVM-specific shadow code
Date: Wed, 24 Mar 2021 17:26:08 +0000
Message-ID: <20210324172608.302316-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
Missed one from my list when creating the other series

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 15a22d6bde..49832ae017 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - x86_emulate: Expanded testing for several instruction classes
  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
  - CI loop: Add dom0less aarch64 smoke test
+ - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
 
 ## Removed / support downgraded
 
-- 
2.30.2


