Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6332429A4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 14:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qAP-0006Zr-QJ; Wed, 12 Aug 2020 12:47:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5qAP-0006Z7-3x
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 12:47:41 +0000
X-Inumbo-ID: f5f021b3-5d2f-4934-8d3f-ec34eef62537
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5f021b3-5d2f-4934-8d3f-ec34eef62537;
 Wed, 12 Aug 2020 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597236456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CXQgceqtYbB9GXFemr8LYcWqBzM3eTccW3m7nVwexM=;
 b=ie4bxRVPfaW7gsQxbAvygcb1i50hi5At7U3rw3Hh0fG870W4sh1dNCUD
 BQJeW5B2K0FiShLvp2e0lHt39Ve/2KzU2mS/+0X4r1HQ+YwPBWqZnVY/g
 AXMs7VRdPR0VPAt3oq01yTwdSlBtau+fChWFXIPgUyx8iViobOcjUTDsK Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Im807mCdRVkf/6+5h0C8CiM0JY5v/yVXC2+UUsKsuVXglE56Z0LdzyuRnIysBhJZ3D2ZWpy8/0
 c8OIcfGMGx38PRfQztnn5Wcq6nQWZ3b/VB6vjhqGSutp9pAoHc/m3ktAKZTzt7BjtRPPhIEWY0
 fqAzrNrSYjaqjFmJX5xNNCJ7PQnx1u/Z1XfCozP8NkVk0vzbUxUez7PJPGab/SEdK2ZMW7cfkL
 oP17Y/0kTmEIBakzUdjCKWnp2tDP9qkNtw7bojNCskCr4Sa3vLsA2iMG0PH6LNDNiyCKf8vK+K
 gsg=
X-SBRS: 2.7
X-MesageID: 24673476
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24673476"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH 1/5] x86/hvm: change EOI exit bitmap helper parameter
Date: Wed, 12 Aug 2020 14:47:05 +0200
Message-ID: <20200812124709.4165-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812124709.4165-1-roger.pau@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
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

Change the last parameter of the update_eoi_exit_bitmap helper to be a
set/clear boolean instead of a triggering field. This is already
inline with how the function is implemented, and will allow deciding
whether an exit is required by the higher layers that call into
update_eoi_exit_bitmap. Note that the current behavior is not changed
by this patch.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c    | 4 ++--
 xen/include/asm-x86/hvm/hvm.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index eb54aadfba..1c04a7e3fc 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1885,9 +1885,9 @@ static void vmx_set_info_guest(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_eoi_exit_bitmap(struct vcpu *v, u8 vector, u8 trig)
+static void vmx_update_eoi_exit_bitmap(struct vcpu *v, uint8_t vector, bool set)
 {
-    if ( trig )
+    if ( set )
         vmx_set_eoi_exit_bitmap(v, vector);
     else
         vmx_clear_eoi_exit_bitmap(v, vector);
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 1eb377dd82..be0d8b0a4d 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -192,7 +192,7 @@ struct hvm_function_table {
     void (*nhvm_domain_relinquish_resources)(struct domain *d);
 
     /* Virtual interrupt delivery */
-    void (*update_eoi_exit_bitmap)(struct vcpu *v, u8 vector, u8 trig);
+    void (*update_eoi_exit_bitmap)(struct vcpu *v, uint8_t vector, bool set);
     void (*process_isr)(int isr, struct vcpu *v);
     void (*deliver_posted_intr)(struct vcpu *v, u8 vector);
     void (*sync_pir_to_irr)(struct vcpu *v);
-- 
2.28.0


