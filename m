Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3970463870
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235241.408188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4aG-0002cJ-HD; Tue, 30 Nov 2021 14:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235241.408188; Tue, 30 Nov 2021 14:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4aG-0002aK-DW; Tue, 30 Nov 2021 14:58:16 +0000
Received: by outflank-mailman (input) for mailman id 235241;
 Tue, 30 Nov 2021 14:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4U0-0003Jn-VM
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:51:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b6bcd37-51ed-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:51:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECA4BB81A50;
 Tue, 30 Nov 2021 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A00C53FCF;
 Tue, 30 Nov 2021 14:51:46 +0000 (UTC)
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
X-Inumbo-ID: 0b6bcd37-51ed-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638283907;
	bh=0NDsr83+EogaVnAmGrqnMsG/gXmouT8EdiQm/ybL3W8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNrxbFLpfQzrGO7YcILMDjm/6TBS1uY4hZp3ev/dkHKKt2OrdGH+Dvw9gQ7JfSeW+
	 0ZTH42p1yyKgu0m0A+TOG3ritbyUc2ekR87EwZhW71fR7am5DOoCxn5xYngFtXa73K
	 HlGxElJCmWrDL55Hckac39r0x/HlHuN8dV7uxlcMMaD2nd/0CdTZZG+TvAhtYxMeaJ
	 TdjX+QQWEsytomB8ReY56fGBnRWAJdVSW1AUXwLljAFm0S3sKqVPbXoMrKpPbNRhUR
	 rt7tR3/rUJp3eztFbJS/dd1pzFLhrEvpQursvSWqXVG9/c+8X3pEAGvKbyAeLjtLT4
	 jMMxWsymbVTtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.10 38/43] xen: flag xen_snd_front to be not essential for system boot
Date: Tue, 30 Nov 2021 09:50:15 -0500
Message-Id: <20211130145022.945517-38-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit de6da33e6cb79abd4a5721b65b9a7dbed24378f8 ]

The Xen pv sound driver is not essential for booting. Set the respective
flag.

[boris: replace semicolon with comma]

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20211022064800.14978-6-jgross@suse.com
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/xen/xen_snd_front.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
index 228d820312973..33ebba73f6c08 100644
--- a/sound/xen/xen_snd_front.c
+++ b/sound/xen/xen_snd_front.c
@@ -358,6 +358,7 @@ static struct xenbus_driver xen_driver = {
 	.probe = xen_drv_probe,
 	.remove = xen_drv_remove,
 	.otherend_changed = sndback_changed,
+	.not_essential = true,
 };
 
 static int __init xen_drv_init(void)
-- 
2.33.0


