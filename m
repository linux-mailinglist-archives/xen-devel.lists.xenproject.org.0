Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B0447EAE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223265.385906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2bS-0006Na-Vk; Mon, 08 Nov 2021 11:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223265.385906; Mon, 08 Nov 2021 11:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2bS-0006L2-Sb; Mon, 08 Nov 2021 11:14:18 +0000
Received: by outflank-mailman (input) for mailman id 223265;
 Mon, 08 Nov 2021 11:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z9tK=P3=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1mk2bS-0006Ks-Am
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:14:18 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01b855c8-4085-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 12:14:16 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 396CF61359;
 Mon,  8 Nov 2021 11:14:12 +0000 (UTC)
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
X-Inumbo-ID: 01b855c8-4085-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636370054;
	bh=v5kymqxyKmvAvPMLG99lLZzehfZMcI+K0hdQmyDJDP0=;
	h=From:To:Cc:Subject:Date:From;
	b=k61D9dl1CO6u+IxOeGYlKSKxTPYQAHbbqLThEby8SfhBMX0ageW4wKX/P496Gv/Jd
	 teRPGeONVdfzR25diD0r0h8E1sSkXICTuaYPb7F+hNm9fByD/+JKZIH1mcUlRaZbRH
	 PH/LNDgD+0JggPn4ItGI5hZC9L5NWDe8q2YtV2HAHE/4pUapd3MY4T+J3kPzgMCl20
	 0TblZ0t5MKBV4T2HP68As1A+1GzJxH5AlcvoTl0HIelh3PkWzWIGi1n5ma61p5mt5Y
	 X4pl1cQne52cLmAd/Ulya4DMIO2GFMvXj1VwjHBG6qLo2pPbciPsui3/SLTs8iQVAc
	 QkvnyI+vmbkNg==
From: Arnd Bergmann <arnd@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/balloon: fix unused-variable warning
Date: Mon,  8 Nov 2021 12:14:02 +0100
Message-Id: <20211108111408.3940366-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

In configurations with CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=n
and CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y, gcc warns about an
unused variable:

drivers/xen/balloon.c:83:12: error: 'xen_hotplug_unpopulated' defined but not used [-Werror=unused-variable]

Since this is always zero when CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
is disabled, turn it into a preprocessor constant in that case.

Fixes: 121f2faca2c0 ("xen/balloon: rename alloc/free_xenballooned_pages")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/xen/balloon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index ad9ba1e97450..ba2ea11e0d3d 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -80,9 +80,8 @@
 static uint __read_mostly balloon_boot_timeout = 180;
 module_param(balloon_boot_timeout, uint, 0444);
 
-static int xen_hotplug_unpopulated;
-
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
+static int xen_hotplug_unpopulated;
 
 static struct ctl_table balloon_table[] = {
 	{
@@ -115,6 +114,8 @@ static struct ctl_table xen_root[] = {
 	{ }
 };
 
+#else
+#define xen_hotplug_unpopulated 0
 #endif
 
 /*
-- 
2.29.2


