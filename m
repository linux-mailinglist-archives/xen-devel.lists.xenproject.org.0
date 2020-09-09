Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2E263000
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 16:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG1RL-0005Hr-1S; Wed, 09 Sep 2020 14:51:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZUP=CS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kG1RJ-0005Hm-GN
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 14:51:13 +0000
X-Inumbo-ID: 7710f681-5e2d-4cca-98e9-926dbf73d292
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7710f681-5e2d-4cca-98e9-926dbf73d292;
 Wed, 09 Sep 2020 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599663073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T5drBJQw5icXhtwlyFbVjxtHTcuWeoT6NAXl1HUX1FM=;
 b=C0FCXauIXCiVO13WrR39lPZanq3F7X24+4RSLQG5+i4mj6dkGyLfR+Cl
 ruTXY1fcq9sI5G60f2RSkQQ8gxdh+Ri1qBo94Ag7/EHLqnYLVhBSiCZFi
 6N21ihnF5M/eeG6TUINXEOrSKOuCbHZQTMD5YTVsHK06w1975Uvbccd2Y 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LTqpRkA/fmXTWoX/s09qmWnDYjSN/hiJEoAb7In96piO8SuLIchw3PTl3tOWrbo420QF/M+OHb
 jt8rFy+nliq90cj9O8/ufLMeDibj4xA94fNB29vOq2gekwvn46KTDi02zjqLlpW+OzfDU9Wcb+
 CXol+Tl/lhk4O19knWJd0B9kEIcPhX3nsQzs1UoQ9nf2AmY9KZ8oWWZA+feqHMShXtQ5XDDeLa
 qrIj3Lzq7IWrGx5qOpmHLMnm1IH07T/x69NX+lEaoNrvbAHGE5oKFuaqaxr2TewqlCU/qk0ogD
 QM8=
X-SBRS: 2.7
X-MesageID: 26282907
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26282907"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding
 cache attributes
Date: Wed, 9 Sep 2020 16:50:58 +0200
Message-ID: <20200909145058.72066-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
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

MMIO regions below the maximum address on the memory map can have a
backing page struct that's shared with dom_io (see x86
arch_init_memory and it's usage of share_xen_page_with_guest), and
thus also fulfill the is_special_page check because the page has the
Xen heap bit set.

This is incorrect for MMIO regions when is_special_page is used by
epte_get_entry_emt, as it will force direct MMIO regions mapped into
the guest p2m to have the cache attributes set to write-back.

Add an extra check in epte_get_entry_emt in order to detect pages
shared with dom_io (ie: MMIO regions) and don't force them to
write-back cache type on that case.

Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Paul Durrant <paul@xen.org>
---
 xen/arch/x86/hvm/mtrr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index fb051d59c3..33b1dd9052 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -829,7 +829,9 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
 
     for ( i = 0; i < (1ul << order); i++ )
     {
-        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
+        const struct page_info *page = mfn_to_page(mfn_add(mfn, i));
+
+        if ( is_special_page(page) && page_get_owner(page) != dom_io )
         {
             if ( order )
                 return -1;
-- 
2.28.0


