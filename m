Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB52DFF00
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 18:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57470.100563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krP1K-0004ut-0w; Mon, 21 Dec 2020 17:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57470.100563; Mon, 21 Dec 2020 17:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krP1J-0004uU-U7; Mon, 21 Dec 2020 17:30:53 +0000
Received: by outflank-mailman (input) for mailman id 57470;
 Mon, 21 Dec 2020 17:30:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MXr/=FZ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1krP1J-0004uP-06
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 17:30:53 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 400ffe58-c914-4293-816a-ab04875593e1;
 Mon, 21 Dec 2020 17:30:52 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0BLHUYPq078964
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 21 Dec 2020 12:30:40 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0BLHUYRm078963;
 Mon, 21 Dec 2020 09:30:34 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 400ffe58-c914-4293-816a-ab04875593e1
Date: Mon, 21 Dec 2020 09:30:34 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Ian Jackson <iwj@xenproject.org>
Subject: [RESEND] [RFC PATCH] xen/arm: domain_build: Ignore empty memory bank
Message-ID: <X+DbupqYE3rrFaIM@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Previously Xen had stopped processing Device Trees if an empty
(size == 0) memory bank was found.

Commit 5a37207df52066efefe419c677b089a654d37afc changed this behavior to
ignore such banks.  Unfortunately this means these empty nodes are
visible to code which accesses the device trees.  Have domain_build also
ignore these entries.

---
This is tagged "RFC" due to issues.

Authorship of this is unclean.  In the first version (checked in, but
never sent to the list and never compiled) a different condition was used
and the comment was absent.  When examing the code it became clear a
condition identical to
5a37207df52066efefe419c677b089a654d37afc was appropriate and so I changed
to !size.  Since what the code is doing was sufficiently similar, the
comment was grabbed.
How far does this dilute authorship?  I diagnosed the bug and figured out
where to add the lines, but the amount inspired by Julien Grall gives
Julien Grall some level of claim of authorship.  Advice is needed.

Commit 7d2b21fd36c2a47799eed71c67bae7faa1ec4272 is an outright bug for
me.  I don't know what percentage of users will experience this bug, but
being observed this quickly suggests this is major enough to be urgent
for the stable-4.14 branch.

I doubt this is the only bug exposed by
5a37207df52066efefe419c677b089a654d37afc.  This might actually effect
most uses of the device-tree code.  I think either the core needs to be
fixed to hide zero-sized entries from anything outside of
xen/common/device_tree.c, otherwise all uses of the device-tree core need
to be audited to ensure they ignore zero-sized entries.  Notably this is
the second location where zero-size device-tree entries need to be
ignored, preemptive action should be taken before a third is found by
bugreport.

Perhaps this fix is appropriate for the stable-4.14 branch and a proper
solution should be implemented for the main branch?

The error message which first showed was
"Unable to retrieve address %u for %s\n".  Where the number in %u was
0, this seems a poor error message.  Version 0.1 (which never got
compiled) had been:  if(!addr) continue;

As I thought the 0 it was reporting was an address of 0.  Perhaps the
message should instead be:
"Unable to retrieve address for index %u of %s\n"?
---
 xen/arch/arm/domain_build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e824ba34b0..0b83384bd3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1405,6 +1405,11 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     {
         struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
         res = dt_device_get_address(dev, i, &addr, &size);
+
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+
         if ( res )
         {
             printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



