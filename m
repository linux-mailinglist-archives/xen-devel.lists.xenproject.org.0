Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303EF192558
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:21:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH38N-0001AU-6a; Wed, 25 Mar 2020 10:19:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH38M-0001AD-G4
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:19:38 +0000
X-Inumbo-ID: 1ff25322-6e82-11ea-bec1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ff25322-6e82-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585131575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/A+bcvfjca3kfttQ3O2CHSTKLGnVLeJAoXIODhnRIz0=;
 b=KJfSvJymGwvIFyB2gxLfWVg8ncemUYG5HmvqE6vGq6kLJ7spXVN4NIB0
 18qvIDiRcpUf021M/v5X6P2cSLtNdjPyUxa9DiTaQskHWMLdvPSIEUlQM
 NB8ytxz8PoeGEMacXhhoKFcfVN59SWwAri52OSZSBubpyY4UcDY6j06YC o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a1XK9iIo+b6ivGf1wNZfLcDD4YRXz9o3MqngQU4RaKcgPNNnldsC3tNLWd5jIyTU/xWZhLtB9v
 mMg23qZkt2ZDOBDPG4iz5vJxMNHekr/EaxiqG5WzIQPPSnK5FpirviOPtlz40L5XbM6KKQGCTZ
 z3di6sXnR30k2HhkYsYUsN2gDJI9bXHHA7ecn/hh/smoGn1HMdnmJNQSpD2nZ2Qa6PDFcgxxzK
 f5F72CBSbCIfuh/hJ5jKpobyoIFaRh4wkiZuT3O2aCI1L/bvvhV2tsaKz8WWTwEdsNcD0w0Zad
 SZY=
X-SBRS: 2.7
X-MesageID: 15007540
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15007540"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 25 Mar 2020 11:19:08 +0100
Message-ID: <20200325101910.29168-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325101910.29168-1-roger.pau@citrix.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 2/4] x86/nvmx: only update SVI when using Ack
 on exit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Check whether there's a valid interrupt in VM_EXIT_INTR_INFO in order
to decide whether to update SVI in nvmx_update_apicv. If Ack on exit
is not being used VM_EXIT_INTR_INFO won't have a valid interrupt and
hence SVI shouldn't be updated to signal the interrupt is currently in
service because it won't be Acked.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 1b8461ba30..1753005c91 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1383,7 +1383,7 @@ static void nvmx_update_apicv(struct vcpu *v)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     unsigned long reason = get_vvmcs(v, VM_EXIT_REASON);
-    uint32_t intr_info = nvmx->intr.intr_info;
+    unsigned long intr_info = get_vvmcs(v, VM_EXIT_INTR_INFO);
 
     if ( reason == EXIT_REASON_EXTERNAL_INTERRUPT &&
          nvmx->intr.source == hvm_intsrc_lapic &&
-- 
2.26.0


