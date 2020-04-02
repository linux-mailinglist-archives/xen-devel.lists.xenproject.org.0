Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932319BF39
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwwV-0000qG-6h; Thu, 02 Apr 2020 10:19:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJwwT-0000pm-DZ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:19:21 +0000
X-Inumbo-ID: 65c20cf4-74cb-11ea-bba1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65c20cf4-74cb-11ea-bba1-12813bfff9fa;
 Thu, 02 Apr 2020 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6rwZacdltItl9czt/IkZJAdDx3fDf89O2zoFUkCWxII=;
 b=DKuLQ31n4nvhglfk0XMdRtCLNKk0YguB2HElxGt3ggmJQeF9Odffh3v5
 livHxNq7MkopCdbCaJMatxuD1iuM2OZTBkwUf8ifymEH5X7CNlEABylLu
 rowdankaB/H0GK/wqRsSeqoD0o5RNsiphDbjILXdBO/mb0xx0RtvvVFWC c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 70Hu1c/V3Xo4KeglIpiHkC8ugzcgbwS4wwpPLpvGWqiMgO3cCdF5MPFMqKNra51MkBgKQaGzDE
 GQTm51Y1vqiZbkBhn92eiZ7f4Iq2lcbOSQKJz7219QNpMUpDbyfe8w8EzSvEc4kn6YrEMGmfDv
 miWv7fcjcBSnPsyQ+Q+iJVB32l2aIr3JGmuEmuBR6dJ0cCFoTZawP905WCU/MXqHaWll0tMvPw
 zAG1ZnhSfQShb9Qzfe0sX6IY73GaDLWdPyyRjYaOg7ee4+GNzEjb3Wo/T0lp7F5Pcfi0a7LqRh
 YCw=
X-SBRS: 2.7
X-MesageID: 15380676
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15380676"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/5] x86/ucode: Don't try to cope with NULL pointers in
 apply_microcode()
Date: Thu, 2 Apr 2020 11:19:00 +0100
Message-ID: <20200402101902.28234-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200402101902.28234-1-andrew.cooper3@citrix.com>
References: <20200402101902.28234-1-andrew.cooper3@citrix.com>
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

No paths to apply_microcode() pass a NULL pointer, and other hooks don't
tolerate one in the first place.  We can expect the core logic not to pass us
junk, so drop the checks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c   | 3 ---
 xen/arch/x86/cpu/microcode/intel.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index c9656de55d..0ca0e9a038 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -219,9 +219,6 @@ static int apply_microcode(const struct microcode_patch *patch)
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     uint32_t rev, old_rev = sig->rev;
 
-    if ( !patch )
-        return -ENOENT;
-
     if ( microcode_fits(patch) != NEW_UCODE )
         return -EINVAL;
 
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 315fca9ff2..9cb077b583 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -270,9 +270,6 @@ static int apply_microcode(const struct microcode_patch *patch)
     struct cpu_signature *sig = &this_cpu(cpu_sig);
     uint32_t rev, old_rev = sig->rev;
 
-    if ( !patch )
-        return -ENOENT;
-
     if ( microcode_update_match(patch) != NEW_UCODE )
         return -EINVAL;
 
-- 
2.11.0


