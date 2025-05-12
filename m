Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF6AB4156
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 20:04:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981999.1368478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEXVp-0001Mo-Bp; Mon, 12 May 2025 18:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981999.1368478; Mon, 12 May 2025 18:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEXVp-0001L5-86; Mon, 12 May 2025 18:04:25 +0000
Received: by outflank-mailman (input) for mailman id 981999;
 Mon, 12 May 2025 18:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tILs=X4=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1uEXVo-0001Kz-4D
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 18:04:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87e1c8c0-2f5b-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 20:04:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE74F4A939;
 Mon, 12 May 2025 18:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6195FC4CEFE;
 Mon, 12 May 2025 18:04:19 +0000 (UTC)
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
X-Inumbo-ID: 87e1c8c0-2f5b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747073060;
	bh=lCTxzM5mPtEqEUhqg9mBz2nbnDEbWNQdOwqtwsH/FcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdHFr2ple1FtQDh+eCd7ZUHmvPvs2hX5VFnQlrBdiUdrKgvYL92mJAAONDT9yD2Ua
	 Pv8xqo17ABe2z4+MBtL4zc7yccQa/Y4ag/mrQYNqZiYRfphY9bdt1qHoXg9q+AbkEd
	 Koae12c8mrNpA52TTCEi0J1Q0vGkXvbGrexzHkcSsDwKuiklCJKsf4E6k7lJK66gbp
	 RTO7YkC/TmmYoipmFYURJY5FBNK69aYyGkreG06UYuWZyHu6NmcDYSoIK5EZZgWId6
	 T9MaPbYDgMSyUa/bRTEbhMUaUYXz9K0l/6bTwbqU7b0sgBMY92DbVck0dHrM1KYIB2
	 kYwg9wJ8Vy8XQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sumit.garg@kernel.org,
	gregkh@linuxfoundation.org,
	michal.orzel@amd.com,
	xin.wang2@amd.com,
	chenqiuji666@gmail.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 13/15] xenbus: Allow PVH dom0 a non-local xenstore
Date: Mon, 12 May 2025 14:03:48 -0400
Message-Id: <20250512180352.437356-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512180352.437356-1-sashal@kernel.org>
References: <20250512180352.437356-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.6
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
index 6d32ffb011365..86fe6e7790566 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -966,9 +966,15 @@ static int __init xenbus_init(void)
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
@@ -987,10 +993,6 @@ static int __init xenbus_init(void)
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


