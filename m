Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26F19931E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:08:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmG-0005nQ-Nu; Tue, 31 Mar 2020 10:05:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmF-0005mq-44
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:47 +0000
X-Inumbo-ID: 2e02c064-7337-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e02c064-7337-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9rWh21Edfez0ICixkeL7P6zQBmZ5AXXQhVFZulp9HhE=;
 b=TJIT5i2PD2hop2Pn30ujfzHNt3RT/HgAHa7ygExr3XOG0DbgS1ViTw7I
 DDRySxDMnd73h6aeFQXB3oR6HyGJATPl/tS/tU3Y3lDPR/1y/c++I9k9T
 aC/qNykfJDQnR+tMjhzgvVSlgG0dHb5MBB4hTDMxJUjSyQxJYHJWqe+D5 g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fouPiB5QEAFmQEUiSB7PoZkrziHhhGN70grod24TSPxibw4x7WBBOAdgEj/UqA7wa7qHNlrOAE
 SPY2+5zpmDB6COa54JgN8NNaKsVhYlQlIv5lvAeFKzXGZtXQ445DfQmRXCNIiovdYQAccaYmNK
 VPwOi9LBYlWo+THrSpehOq5UCr6td/7mjBUp0VquBWpO3xdHP4+i/OhXJO9q4104HnNZYpHbZR
 P4cQBhiZK2qsu/Yb+bA6T6GQjgRc7H3iAWQh26wS2FbtB3/hlFIFtPYjvsDUV+Ih0Y+Zd7zIhb
 ugY=
X-SBRS: 2.7
X-MesageID: 15137745
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15137745"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 03/11] x86/ucode/amd: Don't use void * for microcode_patch->mpb
Date: Tue, 31 Mar 2020 11:05:23 +0100
Message-ID: <20200331100531.4294-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200331100531.4294-1-andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

All code works fine with it having its correct type, and it even allows us to
drop two casts in a printk().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4245dc13bb..3f3a05fad2 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -59,7 +59,7 @@ struct __packed microcode_header_amd {
 #define UCODE_UCODE_TYPE           0x00000001
 
 struct microcode_patch {
-    void *mpb;
+    struct microcode_header_amd *mpb;
     size_t mpb_size;
     struct equiv_cpu_entry *equiv_cpu_table;
     size_t equiv_cpu_table_size;
@@ -330,8 +330,7 @@ static int get_ucode_from_buffer_amd(
 
     pr_debug("microcode: CPU%d size %zu, block size %u offset %zu equivID %#x rev %#x\n",
              smp_processor_id(), bufsize, mpbuf->len, *offset,
-             ((struct microcode_header_amd *)mc_amd->mpb)->processor_rev_id,
-             ((struct microcode_header_amd *)mc_amd->mpb)->patch_id);
+             mc_amd->mpb->processor_rev_id, mc_amd->mpb->patch_id);
 
     *offset += mpbuf->len + SECTION_HDR_SIZE;
 
-- 
2.11.0


