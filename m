Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F46274458
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:33:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjM6-0006Zc-MC; Tue, 22 Sep 2020 14:33:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKjM5-0006Yx-1C
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:33:17 +0000
X-Inumbo-ID: 0c68a282-44c2-4597-8dad-296ce9e0f30d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c68a282-44c2-4597-8dad-296ce9e0f30d;
 Tue, 22 Sep 2020 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600785196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yfV+DsbbLHBfSEA7rnfZ9lXk65oQgRpdfmHKb28HlCI=;
 b=C9LxHxR5RQxvSGDE1RovG0+uj7wl0Oz/a5njxGZC+E3a2t8wfXckbJnU
 mJFvM19UehjO9tbnyTNFEJyrjEc6yM6R1ogD+99oEYJXWTKmdGpx7SbRP
 pmjUfvOJnpYMd735IwKzloysHNGNFtxxkOKfx77GK1G+yaeVrYrSu0c2G Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GU3qsKjDio2n6j4iUERW9IFGQjBVErXB2sFDq4AsEHUoejDp82BDGJr/ET6YX/5HrPPKm/NgLi
 b49GhoEZAv4p/L5cXeCCPWzEpCBLcyuUFylmjPI36MslNjxzxpyOneWKuY+Wt/YQYK4BGSDYiN
 t/f63CXIhmk3+bGRXn9jnqnVFGTwUwyBj3HIDclXd4/6g4TI1nV3LIRsvOXFLXPL9SXXsnSaZn
 tyO7PV/Mz1NTbRE2+2U+rNz5s3ObkVphax7YrD4SQRqKFUtGR/hpt3Av2QvYY6XhCFF5gOYOXr
 uos=
X-SBRS: 2.7
X-MesageID: 27269900
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27269900"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/hpet: remove hpet_msi_read
Date: Tue, 22 Sep 2020 16:32:44 +0200
Message-ID: <20200922143245.44595-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922143245.44595-1-roger.pau@citrix.com>
References: <20200922143245.44595-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It's dead code, even more now that read_msi_msg has been removed.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hpet.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 154c67423b..a55e68e6f7 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -268,16 +268,6 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
     return 0;
 }
 
-static void __maybe_unused
-hpet_msi_read(struct hpet_event_channel *ch, struct msi_msg *msg)
-{
-    msg->data = hpet_read32(HPET_Tn_ROUTE(ch->idx));
-    msg->address_lo = hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4);
-    msg->address_hi = MSI_ADDR_BASE_HI;
-    if ( iommu_intremap )
-        iommu_read_msi_from_ire(&ch->msi, msg);
-}
-
 static unsigned int hpet_msi_startup(struct irq_desc *desc)
 {
     hpet_msi_unmask(desc);
-- 
2.28.0


