Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777522AAF8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 10:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyWrQ-00060W-JR; Thu, 23 Jul 2020 08:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyWrP-000601-9x
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 08:45:51 +0000
X-Inumbo-ID: e754dd1c-ccc0-11ea-86e9-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e754dd1c-ccc0-11ea-86e9-bc764e2007e4;
 Thu, 23 Jul 2020 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595493947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HV5BAB3Ru+vHQcQzkwyNhWTtfNyeOXATqykTtgvMic0=;
 b=FJa9WUs8X32R49Gny9LcDfi+OAAzS8rkILr5MSX2CHs6KNAJ1R/WLpQd
 hJ36omV7R8YdktvCBiVbEDfI8fNtgonGZtby1k/pzULG7qrtyljmUlNDz
 MB+f0qhwHclrZyI+eB/Mmya3IEflQY3Vmn04QIT1oeUwt62ab0GeI3eUq Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /mIOgJ6nw15sfd0b279IBlNRDY5Nc/NmPHLXeuRpP2hUXdEHF/oClU3qjsdqiiOLB/BuhRSbNl
 nbjw/gt+W3wDj2jF6DT0XSktpe4Zqmlt2xmpB7AG4FyTFqXbTd2NY9fPEyULGuSGVDm1gFktgP
 oWYZD4McskbIE3NygSE93KjKBlC3y/FF1T0eCUAmq/8EKHHJkx05LMCudAbEgXxGSkpuyxJ3tc
 6R7bGAAfT8lxXca6nDVQi926JeyOCRMiPU56n91TlftuXTsC8Itt0sWuiP6ZibQ8knT3xBPR6Y
 e3c=
X-SBRS: 2.7
X-MesageID: 23346344
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23346344"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] memory: introduce an option to force onlining of hotplug
 memory
Date: Thu, 23 Jul 2020 10:45:23 +0200
Message-ID: <20200723084523.42109-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723084523.42109-1-roger.pau@citrix.com>
References: <20200723084523.42109-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add an extra option to add_memory_resource that overrides the memory
hotplug online behavior in order to force onlining of memory from
add_memory_resource unconditionally.

This is required for the Xen balloon driver, that must run the
online page callback in order to correctly process the newly added
memory region, note this is an unpopulated region that is used by Linux
to either hotplug RAM or to map foreign pages from other domains, and
hence memory hotplug when running on Xen can be used even without the
user explicitly requesting it, as part of the normal operations of the
OS when attempting to map memory from a different domain.

Setting a different default value of memhp_default_online_type when
attaching the balloon driver is not a robust solution, as the user (or
distro init scripts) could still change it and thus break the Xen
balloon driver.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: xen-devel@lists.xenproject.org
Cc: linux-mm@kvack.org
---
 drivers/xen/balloon.c          |  2 +-
 include/linux/memory_hotplug.h |  3 ++-
 mm/memory_hotplug.c            | 16 ++++++++++------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 292413b27575..fe0e0c76834b 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -346,7 +346,7 @@ static enum bp_state reserve_additional_memory(void)
 	mutex_unlock(&balloon_mutex);
 	/* add_memory_resource() requires the device_hotplug lock */
 	lock_device_hotplug();
-	rc = add_memory_resource(nid, resource);
+	rc = add_memory_resource(nid, resource, true);
 	unlock_device_hotplug();
 	mutex_lock(&balloon_mutex);
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 375515803cd8..1793619fe4a6 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -342,7 +342,8 @@ extern void clear_zone_contiguous(struct zone *zone);
 extern void __ref free_area_init_core_hotplug(int nid);
 extern int __add_memory(int nid, u64 start, u64 size);
 extern int add_memory(int nid, u64 start, u64 size);
-extern int add_memory_resource(int nid, struct resource *resource);
+extern int add_memory_resource(int nid, struct resource *resource,
+			       bool force_online);
 extern int add_memory_driver_managed(int nid, u64 start, u64 size,
 				     const char *resource_name);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index da374cd3d45b..2491588d3f86 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1002,7 +1002,10 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = memhp_default_online_type;
+	bool force_online = arg;
+
+	mem->online_type = force_online ? MMOP_ONLINE
+					: memhp_default_online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1012,7 +1015,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
  *
  * we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLUG
  */
-int __ref add_memory_resource(int nid, struct resource *res)
+int __ref add_memory_resource(int nid, struct resource *res, bool force_online)
 {
 	struct mhp_params params = { .pgprot = PAGE_KERNEL };
 	u64 start, size;
@@ -1076,8 +1079,9 @@ int __ref add_memory_resource(int nid, struct resource *res)
 	mem_hotplug_done();
 
 	/* online pages if requested */
-	if (memhp_default_online_type != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+	if (memhp_default_online_type != MMOP_OFFLINE || force_online)
+		walk_memory_blocks(start, size, (void *)force_online,
+				   online_memory_block);
 
 	return ret;
 error:
@@ -1100,7 +1104,7 @@ int __ref __add_memory(int nid, u64 start, u64 size)
 	if (IS_ERR(res))
 		return PTR_ERR(res);
 
-	ret = add_memory_resource(nid, res);
+	ret = add_memory_resource(nid, res, false);
 	if (ret < 0)
 		release_memory_resource(res);
 	return ret;
@@ -1158,7 +1162,7 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 		goto out_unlock;
 	}
 
-	rc = add_memory_resource(nid, res);
+	rc = add_memory_resource(nid, res, false);
 	if (rc < 0)
 		release_memory_resource(res);
 
-- 
2.27.0


