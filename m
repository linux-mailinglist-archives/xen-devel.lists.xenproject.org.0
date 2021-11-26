Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8645EEA6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232792.403859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawZ-0005oS-Ru; Fri, 26 Nov 2021 13:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232792.403859; Fri, 26 Nov 2021 13:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawY-0005U3-Tu; Fri, 26 Nov 2021 13:07:10 +0000
Received: by outflank-mailman (input) for mailman id 232792;
 Fri, 26 Nov 2021 13:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavo-0003W9-JO
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7af74ef-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:23 +0100 (CET)
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
X-Inumbo-ID: a7af74ef-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6MkSkTdCAehsaJLlFHgLLk6HFoheo0WWaEyuCz1hHYs=;
  b=CWU/iHricrdMAINFI+Dg1xmfr+rMna2wLk2Xq5zjN/7V0r5mJmSeDi1h
   kBRrx6MuZBvnTrqfmFizQ6b+ylr/eeGaGC//EykAwc8RbjinSqpsMnX0F
   yRWd2cIAya0fuBC11uTsYMhI0uGz8BVfMKQwuBdQ1w6wuocyDHm+OgwXV
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6Uj1SgDZB8dlL8kof0Ub0RanFk182/i9EBEkH1wmMSg6aZU5qqTTgAtKW/UV9ePcNSjr2OAAcc
 Bec1Kjz1DUoj7s+yHakh4NGtsGIPGxgU/i3kLDN5a+tNgda1BkNfbJgRGfgdFu5ZYtEJVKvhkr
 slrJeM/LSJ5XbXX2JjjuUt2wvxbOd2TDjChniwwHNFW+BSdH1qjTjhlzYsnO5+uPen/nZufS7r
 4EOczLmXUXJ7unQnKYcb6U2SuZLpduV1JZ7f0Irh7620oHhiQIaJoElHsm2u68HhYhumIYIm/j
 kZbybqsumRzN4q56AMge7aXu
X-SBRS: 5.1
X-MesageID: 59064074
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hQEqaqJwtaVGP1kuFE+RHJIlxSXFcZb7ZxGr2PjKsXjdYENShTcAz
 jMaDW2EafiLYDPzKIhxPtmxoEsEu8fXmNBnTwplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Gpolq9
 9hSkaW1UD11PLLwnrU4ShdHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gph3p4SRamCD
 yYfQRR3aVPRUjNvBk1NGrAVsNnxrXrPLCIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCssSdFQOVdDMkD7Ri3lqjL3wDII3EKUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRONHNi2+AswGzARN8wGCxFQLpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Lv2EgeRg4bphYIlcFh
 XM/XysKv/e/21PwMMdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCrCjOXeOrtZIRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:IWYawK0UWCXXIc7JANKjKwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064074"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 43/65] x86/logdirty: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:24 +0000
Message-ID: <20211126123446.32324-44-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/mm/hap/hap.c       |  6 +++---
 xen/arch/x86/mm/shadow/common.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index de4b13565ab4..ed5112b00b63 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -180,7 +180,7 @@ int hap_track_dirty_vram(struct domain *d,
  * NB: Domain that having device assigned should not set log_global. Because
  * there is no way to track the memory updating from device.
  */
-static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
+static int cf_check hap_enable_log_dirty(struct domain *d, bool log_global)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
@@ -211,7 +211,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
     return 0;
 }
 
-static int hap_disable_log_dirty(struct domain *d)
+static int cf_check hap_disable_log_dirty(struct domain *d)
 {
     paging_lock(d);
     d->arch.paging.mode &= ~PG_log_dirty;
@@ -228,7 +228,7 @@ static int hap_disable_log_dirty(struct domain *d)
     return 0;
 }
 
-static void hap_clean_dirty_bitmap(struct domain *d)
+static void cf_check hap_clean_dirty_bitmap(struct domain *d)
 {
     /*
      * Switch to log-dirty mode, either by setting l1e entries of P2M table to
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 03bcd9518c39..8e51168e61b6 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -40,9 +40,9 @@
 
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
-static int sh_enable_log_dirty(struct domain *, bool log_global);
-static int sh_disable_log_dirty(struct domain *);
-static void sh_clean_dirty_bitmap(struct domain *);
+static int cf_check sh_enable_log_dirty(struct domain *, bool log_global);
+static int cf_check sh_disable_log_dirty(struct domain *);
+static void cf_check sh_clean_dirty_bitmap(struct domain *);
 
 /* Set up the shadow-specific parts of a domain struct at start of day.
  * Called for every domain from arch_domain_create() */
@@ -3016,7 +3016,7 @@ static int shadow_test_disable(struct domain *d)
 /* Shadow specific code which is called in paging_log_dirty_enable().
  * Return 0 if no problem found.
  */
-static int sh_enable_log_dirty(struct domain *d, bool log_global)
+static int cf_check sh_enable_log_dirty(struct domain *d, bool log_global)
 {
     int ret;
 
@@ -3044,7 +3044,7 @@ static int sh_enable_log_dirty(struct domain *d, bool log_global)
 }
 
 /* shadow specfic code which is called in paging_log_dirty_disable() */
-static int sh_disable_log_dirty(struct domain *d)
+static int cf_check sh_disable_log_dirty(struct domain *d)
 {
     int ret;
 
@@ -3058,7 +3058,7 @@ static int sh_disable_log_dirty(struct domain *d)
 /* This function is called when we CLEAN log dirty bitmap. See
  * paging_log_dirty_op() for details.
  */
-static void sh_clean_dirty_bitmap(struct domain *d)
+static void cf_check sh_clean_dirty_bitmap(struct domain *d)
 {
     paging_lock(d);
     /* Need to revoke write access to the domain's pages again.
-- 
2.11.0


