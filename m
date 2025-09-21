Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0795B8DFBC
	for <lists+xen-devel@lfdr.de>; Sun, 21 Sep 2025 18:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127642.1468325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0MwC-000074-EK; Sun, 21 Sep 2025 16:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127642.1468325; Sun, 21 Sep 2025 16:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0MwC-00005G-80; Sun, 21 Sep 2025 16:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1127642;
 Sun, 21 Sep 2025 16:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BC0m=4A=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v0MwA-000055-MH
 for xen-devel@lists.xenproject.org; Sun, 21 Sep 2025 16:29:18 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c12e44e-9708-11f0-9809-7dc792cee155;
 Sun, 21 Sep 2025 18:29:15 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A24587A0011;
 Sun, 21 Sep 2025 12:29:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sun, 21 Sep 2025 12:29:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Sep 2025 12:29:10 -0400 (EDT)
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
X-Inumbo-ID: 1c12e44e-9708-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1758472152; x=1758558552; bh=WdNTOPpdVrK9P8u9jRJTdDiUUMVvKBOw
	ULXLYZcXJu8=; b=j9eLME9Y7nWi0s1EHw0wfRabUNFi8aulnOQorjWbbstzDf8q
	4+x8BzOSRKzmy9nCwrYh0a7oD92muzWkR0TPph3Lb0Vmi4++L9b9YQz+sOM5vK+D
	f+YD18dO80EBPkdTTShynrOTpfTRmTlO9NI6MHjfCafvxaRQBvQngxyNZru7vBvI
	PLQSP0cHnPCEq5Vulv+rkOa+SNWrRVX6b81YMI3Fa71OJxHunnpYDs6DvpVqILZ/
	zXDNsZ2OOl991uQG7wmI46nfwZnUYTAPnPvs79fmvPOyCsreZIhf9lueuR4QvLYr
	o44f1RSn55c410K5kWHNmt2Jpbi0XGasIPzzIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1758472152; x=1758558552; bh=WdNTOPpdVrK9P8u9jRJTdDiUUMVv
	KBOwULXLYZcXJu8=; b=TqM51bi2IKXztUWG4FcVpjVAHDKS4JfekjWKnsyOdJ6B
	1JkGpLGDuYqGBp1QYDtjzXM6aNKdrn/2hRFYtlKLhkrVX6MnPhQLbmy/kS3/fc39
	koabU7ZymSeb3WfMUbkL/8FRvqt2OMfTgfJGNj1+Bd6EBdjvEEQy70FwoyDH/VYO
	+6Q6DL3UbLhYEMd2KGrQELuQTwNW7PwsnsmIdHLw6Cp+CR1qt/vCfHEhSrHC83nc
	MJUH+xz8Nepmb7Ak5uI35ip6eIukTPO9XHE8L8YvDJz5LnaDm+OMrGAm08dSSIvL
	eu4+Kww0Cjqy/4E2g3QIbBtYnuP1cAZnXGIJJqMByg==
X-ME-Sender: <xms:2CfQaHaLncbhGF1yYBKzqVtCdsgCXN3f2yvlxjvFq68BS7sM0SLpvA>
    <xme:2CfQaC9M9Hg_KXxF3Asr4BH0NJ-glvd6ieB8QTifaXIKCEGjUWDwwldykHnUCnM-I
    bYRYOYsW5cigw>
X-ME-Received: <xmr:2CfQaObicG33mKIb4jNBgW1oRob_2rJB3TF3ZHtvdFsoKCtVXtEF1Q7mTCBTi9Hm1zYFsv85FB_WByzQhDoYHole0x7BrTZW7zQPREAm4tc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehheeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeekieevkeeu
    heefgeevjeevveeutdejieevgeeuhfdvffeuteeftdduvdeuteevnecuffhomhgrihhnpe
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehsthgrsghlvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhi
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthihshhgthh
    gvnhhkohesvghprghmrdgtohhmpdhrtghpthhtoheprhgrfhgrvghlrdhjrdifhihsohgt
    khhisehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlh
    hlohesrghmugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:2CfQaEdBaNUM9KhKyyhy5jtU73qmJzvaTgr4ILJbj2MTKm8PVHeeqA>
    <xmx:2CfQaDltm6NZYqbMkoiLA5RCv_jGu9u9toeaJfeggaeQEnaX3QLJVQ>
    <xmx:2CfQaM0u3USCnbFzj_mYcRFpUWPgzhHPzLw1LYrLuMqb7C-EJtFvQg>
    <xmx:2CfQaEeE9Yh98U3EFLUcSGNRlokX5uOha2QTNjoFL-QS2m1o0lAlLw>
    <xmx:2CfQaENqCA9253hZxtRn2UEjSXEHf_VPMs9NXuGelV5UeHSIj5CD-PMo>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	stable@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
Subject: [PATCH] xen: take system_transition_mutex on suspend
Date: Sun, 21 Sep 2025 18:28:47 +0200
Message-ID: <20250921162853.223116-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen's do_suspend() calls dpm_suspend_start() without taking required
system_transition_mutex. Since 12ffc3b1513eb moved the
pm_restrict_gfp_mask() call, not taking that mutex results in a WARN.

Take the mutex in do_suspend(), and use mutex_trylock() to follow
how enter_state() does this.

Suggested-by: Jürgen Groß <jgross@suse.com>
Fixes: 12ffc3b1513eb "PM: Restrict swap use to later in the suspend sequence"
Link: https://lore.kernel.org/xen-devel/aKiBJeqsYx_4Top5@mail-itl/
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: stable@vger.kernel.org # v6.16+
---
 drivers/xen/manage.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index b4b4ebed68daf..f78d970949c0a 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -11,6 +11,7 @@
 #include <linux/reboot.h>
 #include <linux/sysrq.h>
 #include <linux/stop_machine.h>
+#include <linux/suspend.h>
 #include <linux/freezer.h>
 #include <linux/syscore_ops.h>
 #include <linux/export.h>
@@ -101,10 +102,16 @@ static void do_suspend(void)
 
 	shutting_down = SHUTDOWN_SUSPEND;
 
+	if (!mutex_trylock(&system_transition_mutex))
+	{
+		pr_err("%s: failed to take system_transition_mutex\n", __func__);
+		goto out;
+	}
+
 	err = freeze_processes();
 	if (err) {
 		pr_err("%s: freeze processes failed %d\n", __func__, err);
-		goto out;
+		goto out_unlock;
 	}
 
 	err = freeze_kernel_threads();
@@ -160,6 +167,8 @@ static void do_suspend(void)
 
 out_thaw:
 	thaw_processes();
+out_unlock:
+	mutex_unlock(&system_transition_mutex);
 out:
 	shutting_down = SHUTDOWN_INVALID;
 }
-- 
2.51.0


