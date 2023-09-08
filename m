Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E57980D7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 05:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597744.932077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeRrZ-0001rt-OS; Fri, 08 Sep 2023 03:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597744.932077; Fri, 08 Sep 2023 03:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeRrZ-0001od-Jm; Fri, 08 Sep 2023 03:08:53 +0000
Received: by outflank-mailman (input) for mailman id 597744;
 Fri, 08 Sep 2023 03:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VeSX=EY=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qeRrX-0001oW-LG
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 03:08:51 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07316fbf-4df5-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 05:08:49 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 388381l7002774
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 7 Sep 2023 23:08:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 388380oI002773;
 Thu, 7 Sep 2023 20:08:00 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 07316fbf-4df5-11ee-8783-cb3800f73035
Date: Thu, 7 Sep 2023 20:08:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: smita.koralahallichannabasappa@amd.com
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xenproject.org, rric@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, yazen.ghannam@amd.com
Subject: [PATCH] Revert "EDAC/mce_amd: Do not load edac_mce_amd module on
 guests"
Message-ID: <ZPqQEHXgmak1LMNh@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This reverts commit 767f4b620edadac579c9b8b6660761d4285fa6f9.

There are at least 3 valid reasons why a VM may see MCE events/registers.

First, the hypervisor may have a bug.  Ideally this should be dealt with
by fixing the hypervisor.  Failing that, the hypervisor and versions
effected need to be identified so only they are flagged as buggy.

Second, the Linux kernel may be handling adminstrative duties/hardware
for a hypervisor.  In this case, the events need to be processed and
potentially passed back through the hypervisor.

Third, the hypervisor may do full virtualization of MCE events.  In such
case, they should be handled normally.

Any of these blanket disabling the functionality is bad.  The original
patch was wrong.
---
 drivers/edac/mce_amd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index 9215c06783df..1b7fccfbb654 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -1361,9 +1361,6 @@ static int __init mce_amd_init(void)
 	    c->x86_vendor != X86_VENDOR_HYGON)
 		return -ENODEV;
 
-	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
-		return -ENODEV;
-
 	if (boot_cpu_has(X86_FEATURE_SMCA)) {
 		xec_mask = 0x3f;
 		goto out;
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



