Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8FB14CCE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062519.1428228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiG8-0001JY-KK; Tue, 29 Jul 2025 11:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062519.1428228; Tue, 29 Jul 2025 11:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiG8-0001Gz-HP; Tue, 29 Jul 2025 11:12:40 +0000
Received: by outflank-mailman (input) for mailman id 1062519;
 Tue, 29 Jul 2025 11:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NrXi=2K=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1ugiG7-0000M4-38
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:12:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eecd6811-6c6c-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 13:12:37 +0200 (CEST)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-GzHVl2qGNsKllHguYOxZow-1; Tue,
 29 Jul 2025 07:12:32 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 99F66180036F; Tue, 29 Jul 2025 11:12:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.14])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 992E119560A2; Tue, 29 Jul 2025 11:12:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE77B21E6A27; Tue, 29 Jul 2025 13:12:26 +0200 (CEST)
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
X-Inumbo-ID: eecd6811-6c6c-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753787556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dt6qkMkh+MC47d4SdeRqjp6FPKdZAsysmAqVxMrrdaE=;
	b=BGPO25lSKl6R1sUkBqBQP8g5174QqsPPkaqvqEFg+P2LiOJe2AJsTGFPOhMIwOoew4Gp71
	J1uSHju3EctW/J458Vo79qf3yqjPNwtJBW3Gyoqbc8F8lio97z5vDI/B857os1TD8y8ihI
	QkeQnAF+MsKU1cJH4S6i4KIilg/I95A=
X-MC-Unique: GzHVl2qGNsKllHguYOxZow-1
X-Mimecast-MFC-AGG-ID: GzHVl2qGNsKllHguYOxZow_1753787551
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
Date: Tue, 29 Jul 2025 13:12:26 +0200
Message-ID: <20250729111226.3627499-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

xenfb_mouse_event() has a switch statement whose controlling
expression move->axis is an enum InputAxis.  The enum values are
INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
case for both axes.  In addition, it has an unreachable default label.
This convinces Coverity that move->axis can be greater than 1.  It
duly reports a buffer overrun when it is used to subscript an array
with two elements.

Replace the unreachable code by abort().

Resolves: Coverity CID 1613906
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/display/xenfb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 22822fecea..5e6c691779 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
                 scale = surface_height(surface) - 1;
                 break;
             default:
-                scale = 0x8000;
-                break;
+                abort();
             }
             xenfb->axis[move->axis] = move->value * scale / 0x7fff;
         }
-- 
2.49.0


