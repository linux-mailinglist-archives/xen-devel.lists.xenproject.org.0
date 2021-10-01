Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866841F031
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200705.355278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWK1z-0007Sd-Mg; Fri, 01 Oct 2021 15:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200705.355278; Fri, 01 Oct 2021 15:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWK1z-0007PR-Ix; Fri, 01 Oct 2021 15:00:59 +0000
Received: by outflank-mailman (input) for mailman id 200705;
 Fri, 01 Oct 2021 15:00:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kuDH=OV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mWK1y-0006Wg-I5
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:00:58 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dc1d647-12eb-454f-985a-57c7ef8eb6bb;
 Fri, 01 Oct 2021 15:00:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B77812005F;
 Fri,  1 Oct 2021 15:00:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 801AE13C71;
 Fri,  1 Oct 2021 15:00:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YPkFHp4iV2G5OgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Oct 2021 15:00:46 +0000
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
X-Inumbo-ID: 1dc1d647-12eb-454f-985a-57c7ef8eb6bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633100446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oyuxf2Y1J+lyDb6SpUAj+J2Bo2Nkah6NWr6tdJdZLO8=;
	b=jo1x8PD9yL9dIXeua2bgw/yOpomsDEtePlNPQzVzLpCyps40A189+sdJu7dRFoPGe3NNmC
	Dt+fG2kheCL1JLztcphycrL3l5Jf45I29loB95W91kXj9XgsF4i1KreM0IDENfLhK1wBCn
	SSZX1BnAhZ0g19WVnsSczVhJ3wpvvZU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
Subject: [PATCH v5 3/3] xen: add Xen pvUSB maintainer
Date: Fri,  1 Oct 2021 17:00:39 +0200
Message-Id: <20211001150039.15921-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211001150039.15921-1-jgross@suse.com>
References: <20211001150039.15921-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for the Xen pvUSB stuff.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc68a13a7655..069724ff5628 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20529,6 +20529,14 @@ F:	drivers/scsi/xen-scsifront.c
 F:	drivers/xen/xen-scsiback.c
 F:	include/xen/interface/io/vscsiif.h
 
+XEN PVUSB DRIVER
+M:	Juergen Gross <jgross@suse.com>
+L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	divers/usb/host/xen*
+F:	include/xen/interface/io/usbif.h
+
 XEN SOUND FRONTEND DRIVER
 M:	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
-- 
2.26.2


