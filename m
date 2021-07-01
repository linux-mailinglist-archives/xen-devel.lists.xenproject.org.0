Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6B3B92EE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148715.274909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxP2-0000ou-PI; Thu, 01 Jul 2021 14:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148715.274909; Thu, 01 Jul 2021 14:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxP2-0000lI-HA; Thu, 01 Jul 2021 14:10:52 +0000
Received: by outflank-mailman (input) for mailman id 148715;
 Thu, 01 Jul 2021 14:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxP1-0005tj-0R
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9750316e-8fc7-49fa-b4c6-65a7a8682684;
 Thu, 01 Jul 2021 14:10:38 +0000 (UTC)
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
X-Inumbo-ID: 9750316e-8fc7-49fa-b4c6-65a7a8682684
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y8SWyJ3p44fQ34F09ahZsCZGxd9yD3VsNGECNl35lHA=;
  b=BTkP9KZIzGwZ7ZB+cXXI9i1FEA1V0tKRob8pKou46ZcfUpIDC6d4nTL6
   ODnG2sGoqvrkwkB4NeS6oVgvJwM6fPCLPYSxFKmc2soMQfep794qGABEG
   0JCey909r8rjdmUe4zq3P0rqEqaaPa7TR0ehnc05LL8082A/HItU/bOf5
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WhFgH9js5xlwKlXGtlC/Joz2aE4ybEandDbTUzHIuxQO6BOpDJqr3Dn/Eirb1DIDOWqRv9Eefh
 0wH0QuXKhojgvB/yfeaNs0r61VHO24F68ufD9SDGF8ffW+xWBvp0Q5tVnHTOd4N6/1wNjQLEAx
 aI1BVhHu1lQPbW3POgx8ENbE8TqlmLBlGORSiqRv5yzOCYjWQfFkHDXCA/2bEyPvvNfkpzWHAR
 sVOTYK9kkBQrPMBQmf0in8M7rahj/jAp79FuNDbtxhtHPokOTN0Xj2J6r0AKj/RLyiAwyeZWIf
 eew=
X-SBRS: 5.1
X-MesageID: 49007486
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+M8RiK27SzyZ8UGeKRg56wqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="49007486"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 13/31] build,tools: have default rules depends on symbols
Date: Thu, 1 Jul 2021 15:09:53 +0100
Message-ID: <20210701141011.785641-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

No need to call $(MAKE) again.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/tools/Makefile b/xen/tools/Makefile
index e940939d61f4..4e42163f981c 100644
--- a/xen/tools/Makefile
+++ b/xen/tools/Makefile
@@ -2,8 +2,7 @@
 include $(XEN_ROOT)/Config.mk
 
 .PHONY: default
-default:
-	$(MAKE) symbols
+default: symbols
 
 .PHONY: clean
 clean:
-- 
Anthony PERARD


