Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508CB1BE563
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:36:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqdN-00029f-DW; Wed, 29 Apr 2020 17:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUw1=6N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jTqdM-00029W-8I
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 17:36:32 +0000
X-Inumbo-ID: f3728f0e-8a3f-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3728f0e-8a3f-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588181787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aGTSaS8O3UBuwxmxOAb6nZh9nvU3qR7640hwUvfNwrE=;
 b=KWbEu/hk939WF+o68z3HfDhsllyAxIF2M+krFP6RUgb4U2X+4wWuwUoV
 8DFY/SyVtteJAo4oQ139lwNXboBCSHMQL7NKDqcouU6K5Cd52EHRYx71P
 dtpQNIxx2Ut5t1NLnL3CGagdWfE02P7U7sMOk58pWutZAs22L+9K1xI4x M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PzHf/MW00sqHEWTJR42cTIhXggS28enIJkbUXx4fQm5KsB5mgtsXAfqRHNBoPqJ1PUwX5sBEVP
 +PSXBfrYfViK6VKjYl2B4EOFKWKJrFq+nuc9Njuv6AS42ixpveOCsAG1dzjWzo9Ti5Xc/LMfcJ
 SNShQoKsr+f3OCHtsv+wV10s89D6eFskYgQCO/CVZyJsUsaYa511xPGwhl/mdIdK2IN7K4ZjiP
 9UnOU4j37Gn6wtv+39bQkftjq4pkh3AjEGUG+x2aSRBHq9EMdRRrkOjutRTMm8cYJsTwzaPtHN
 Fq0=
X-SBRS: 2.7
X-MesageID: 16473605
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16473605"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hap: be more selective with assisted TLB flush
Date: Wed, 29 Apr 2020 19:36:01 +0200
Message-ID: <20200429173601.77605-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When doing an assisted flush on HAP the purpose of the
on_selected_cpus is just to trigger a vmexit on remote CPUs that are
in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
also check that the vCPU is running.

While there also pass NULL as the data parameter of on_selected_cpus,
the dummy handler doesn't consume the data in any way.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/hap/hap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 580d1c2164..0275cdf5c8 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -719,7 +719,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
         hvm_asid_flush_vcpu(v);
 
         cpu = read_atomic(&v->dirty_cpu);
-        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) )
+        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
             __cpumask_set_cpu(cpu, mask);
     }
 
@@ -729,7 +729,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
      * not currently running will already be flushed when scheduled because of
      * the ASID tickle done in the loop above.
      */
-    on_selected_cpus(mask, dummy_flush, mask, 0);
+    on_selected_cpus(mask, dummy_flush, NULL, 0);
 
     return true;
 }
-- 
2.26.0


