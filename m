Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89424364598
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112935.215344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTQ-0006CJ-UP; Mon, 19 Apr 2021 14:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112935.215344; Mon, 19 Apr 2021 14:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTQ-0006BS-Pk; Mon, 19 Apr 2021 14:02:00 +0000
Received: by outflank-mailman (input) for mailman id 112935;
 Mon, 19 Apr 2021 14:01:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTP-0005yZ-EP
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:01:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a82269e-fe70-47a8-9879-c76ff1e105b8;
 Mon, 19 Apr 2021 14:01:54 +0000 (UTC)
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
X-Inumbo-ID: 1a82269e-fe70-47a8-9879-c76ff1e105b8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6BUv+N6okA8eie29SW3frkmwZ8F2KRqBim4h2q/ANWM=;
  b=GeVz/Jgr1jzbMApAonIcLm1STwz1KWUlgDq42uy7M5D/C8j0DlGKJtVX
   S05y4G7ekjxcj9zX5qK/BgCb27ZyrO1AUXScdpaKmqqKPdWXzHd8eTICh
   HQiUzvx0P44/dbokgHmAne74xL2bLfxV65xDhry5RjPxrDH3w0+Dqr+cm
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2gZqkBYH1WeWqjKj9X9QFQDsCYxJLRAsGlWbdyIOlKNIXNu7DPePxXjniCpR4YIUoXnja2wAfv
 Jhskh1lGM37FwZPP+EUkGDJ7zy5VJMKFwwEneXji6w/KYrdnA+bhuCwYN6I4ZdGF9ddJLigRLJ
 +PH8GI+FMk8wv7u3MCCaA237dF9bJ2WCye1l3flV1Wnctzh7h/6MExASKBSqPTE7n9XxeZ2jxo
 t8+9AQZK8z4G+vpOo/8lhibZTPV0chl6qF9J3oz2K6Vi/+5cYHf66jBHaBexhSyRzYxDus12KK
 nsk=
X-SBRS: 5.1
X-MesageID: 42271924
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JzmgOqEN8ZxqED95pLqFP5HXdLJzesId70hD6mlaTxtJfsuE0/
 2/hfhz726ItB89UGwt8OrhBICuWnXZnKQZ3aAwOvOYUBDiqC+UKuhZnO7f6hnBPwG7yeJHz6
 dndMFFeaHNJHx3l9zz7gX9M/tI+qjlzImSie3Tz2hgQGhRAskKhTtRMQqVHlZ7QwNLH/MCZf
 ihz/BarDmtc2l/VKuGL0QFROTKqpnqk5/rcHc9ZiIP1QiUgTukrIP9ChiTty1xbxpzx94ZnV
 TtokjQ+rik98q20Abb0HXeq65LgcL7xsFYbfb87fQ9G3HJsEKFdY5hU7qNsHQUp+qo+RIQjN
 zBuVMEOcJrgkmhGF2dkF/I4U3A2Cxrw2L+wVWY6EGTxfDRdXYfMY59oq53NjHe8FEtudlg1r
 kj5RPhi7NeEQ7H2D7g7NzJSgxnmyOP0AEfuP9Wi2YaXZoVabdXo4Ba8k9THIwJAS72rIQqCv
 NnAs2Z/vBLalmXBkqpxFVH0ZipRDA+Dx2GSk8NtoiN2yNbm208y0cD3sQQkjMB+fsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="42271924"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/7] x86/irq: Make create_irq() compile at -Og
Date: Mon, 19 Apr 2021 15:01:29 +0100
Message-ID: <20210419140132.16909-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When compiling at -Og:

  irq.c: In function ‘create_irq’:
  irq.c:310:38: error: ‘desc’ may be used uninitialized in this function[-Werror=maybe-uninitialized]
               desc->arch.creator_domid = currd->domain_id;
               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~

This diagnostic is bogus, because desc is already read on earlier paths.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a1693f92dd..72b86c6155 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -264,7 +264,7 @@ void __init clear_irq_vector(int irq)
 int create_irq(nodeid_t node, bool grant_access)
 {
     int irq, ret;
-    struct irq_desc *desc;
+    struct irq_desc *desc = NULL;
 
     for (irq = nr_irqs_gsi; irq < nr_irqs; irq++)
     {
-- 
2.11.0


