Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5743722F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 08:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214752.373503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMb-0006Uo-4u; Fri, 22 Oct 2021 06:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214752.373503; Fri, 22 Oct 2021 06:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMa-0006SZ-TU; Fri, 22 Oct 2021 06:49:12 +0000
Received: by outflank-mailman (input) for mailman id 214752;
 Fri, 22 Oct 2021 06:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5cR=PK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mdoMZ-0005ue-DA
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 06:49:11 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40aec6ac-90d0-4ea7-ad84-6d5d02bd43c6;
 Fri, 22 Oct 2021 06:49:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21C651FD59;
 Fri, 22 Oct 2021 06:49:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D810413AAD;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yCmFM+BecmEIEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Oct 2021 06:49:04 +0000
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
X-Inumbo-ID: 40aec6ac-90d0-4ea7-ad84-6d5d02bd43c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634885345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80mOxk7OisLv8eTtTaoe81+q4mcgaLTrWwkMlhEogsw=;
	b=Y8s49wATwiV6ccraCQUa+ld+V54ty1XPZFYJwJ60XapgZj5bSnABkO44U1HpMqfeRnvSWM
	uW0I7W9S1o26EQZyD8UaYpPk7EcHaeQgRPdRS2ZmbSlW0cfsaBEx25FwtSU+hilKwCJfy5
	tsHcDZ7CYxP32C+ElsGFh95BERckVzY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] xen: flag xen_drm_front to be not essential for system boot
Date: Fri, 22 Oct 2021 08:47:57 +0200
Message-Id: <20211022064800.14978-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211022064800.14978-1-jgross@suse.com>
References: <20211022064800.14978-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the virtual frame buffer (vfb) the pv display driver is not
essential for booting the system. Set the respective flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 9f14d99c763c..bc7605324db3 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -773,6 +773,7 @@ static struct xenbus_driver xen_driver = {
 	.probe = xen_drv_probe,
 	.remove = xen_drv_remove,
 	.otherend_changed = displback_changed,
+	.not_essential = true,
 };
 
 static int __init xen_drv_init(void)
-- 
2.26.2


