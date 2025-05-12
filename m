Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3FFAB416C
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 20:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982027.1368528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEXX9-0003dX-H8; Mon, 12 May 2025 18:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982027.1368528; Mon, 12 May 2025 18:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEXX9-0003bm-Df; Mon, 12 May 2025 18:05:47 +0000
Received: by outflank-mailman (input) for mailman id 982027;
 Mon, 12 May 2025 18:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tILs=X4=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1uEXX8-0001Kz-Eu
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 18:05:46 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ace606-2f5b-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 20:05:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3C50614B7;
 Mon, 12 May 2025 18:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF8EC4CEE7;
 Mon, 12 May 2025 18:05:43 +0000 (UTC)
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
X-Inumbo-ID: b9ace606-2f5b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747073144;
	bh=0M7b1jwuL8aGrtVgJT1veCJSLkJZ6QXbB0t/Micp/7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyuVzCWj63wXRMOHJ5MGlLunznISQVMA/lipEyRQCtMonx1NA4tgbZKzpwtNfv7/C
	 3RhMntOlyqtZGbIiUSEDZXB4882iArRoeFc+E3J+E3/ul/EMvRc8UTXS/ViB3JFtF3
	 VfGq4XembhqziMvOavLcgg/da1Pe0cX/b2asOV87qjGQxxnxrJBCPL1sB1ges1Y1Na
	 EhbHGEDiuMbo/UIJblj5zk9es2FLI1JIjy66ZO/BKu5cG0nkMFAPz7Ut3fF1wcBVpU
	 4txeuvt69xDTSAS084chd9p2koow9L/RBjnSCjWI0WCYp4sNr8yK7tPRMh2/IkVeC5
	 jTf/O886yQmUA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	chenqiuji666@gmail.com,
	gregkh@linuxfoundation.org,
	xin.wang2@amd.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/3] xenbus: Allow PVH dom0 a non-local xenstore
Date: Mon, 12 May 2025 14:05:36 -0400
Message-Id: <20250512180537.438255-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512180537.438255-1-sashal@kernel.org>
References: <20250512180537.438255-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

[ Upstream commit 90989869baae47ee2aa3bcb6f6eb9fbbe4287958 ]

Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
late init path.

Ideally we'd drop the use of xen_initial_domain() and just check for the
event channel instead.  However, ARM has a xen,enhanced no-xenstore
mode, where the event channel and PFN would both be 0.  Retain the
xen_initial_domain() check, and use that for an additional check when
the event channel is 0.

Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
chance that high bits are set for the 32bit event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Change-Id: I5506da42e4c6b8e85079fefb2f193c8de17c7437
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
Message-ID: <20250506204456.5220-1-jason.andryuk@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fd686b962727a..17705f82f85fd 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -881,9 +881,15 @@ static int __init xenbus_init(void)
 	if (xen_pv_domain())
 		xen_store_domain_type = XS_PV;
 	if (xen_hvm_domain())
+	{
 		xen_store_domain_type = XS_HVM;
-	if (xen_hvm_domain() && xen_initial_domain())
-		xen_store_domain_type = XS_LOCAL;
+		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
+		if (err)
+			goto out_error;
+		xen_store_evtchn = (int)v;
+		if (!v && xen_initial_domain())
+			xen_store_domain_type = XS_LOCAL;
+	}
 	if (xen_pv_domain() && !xen_start_info->store_evtchn)
 		xen_store_domain_type = XS_LOCAL;
 	if (xen_pv_domain() && xen_start_info->store_evtchn)
@@ -902,10 +908,6 @@ static int __init xenbus_init(void)
 		xen_store_interface = gfn_to_virt(xen_store_gfn);
 		break;
 	case XS_HVM:
-		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
-		if (err)
-			goto out_error;
-		xen_store_evtchn = (int)v;
 		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
 		if (err)
 			goto out_error;
-- 
2.39.5


