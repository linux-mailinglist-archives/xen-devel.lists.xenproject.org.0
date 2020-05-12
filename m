Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3F1CFE0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 21:11:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYaJi-0002Qw-L0; Tue, 12 May 2020 19:11:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYaJi-0002Qq-0x
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 19:11:50 +0000
X-Inumbo-ID: 6dae7a82-9484-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dae7a82-9484-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 19:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589310709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oMCdGSDqIXHcN3yrHbB182v6Q6Qj/Ianz2JO6oKJY2I=;
 b=IX6PR4MFFU/bz0O8a5EdaZZhfcUZ5iIOJXQWMMOcycD/60yfqHylwgju
 lf3hSuEqiqWHWprWJCPeccx/xKWzzuyGvozVy7ifd5hRop9jP5vnTAIgY
 iJruB7MYZAbMupvQ0kVbfOL0lew45mS8tDx4GDa4yO1joJFkLQqHAjFP8 8=;
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
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: PBwiuavzafFtcce7TY/uOXgN1tTXnJ+s1m+WMDEnJTkyadmsH7TPFfUwRDQDuQmV67huSJee6e
 /G4x1e/Igmwppwy/Nt1vKUIE90uZP+K59wXFR32m/yrPVyrKP3RcfuTLgRATacAcWvRqJdWmdC
 f447dNQL5Gw2m32E1Tq3re8yrcrqM6pG4w32pbHR+UbRRuMLz2ZzJBCk6h7AFtp55pN1ONzEU6
 VK/Q/586PvfBzNP+bDcTCI7QwoujHHGXhH3DKEviXZPl7hM0doEuxxqciXYC1xike67kCeT0UD
 zNM=
X-SBRS: 2.7
X-MesageID: 17620682
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17620682"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/build: Unilaterally disable -fcf-protection
Date: Tue, 12 May 2020 20:11:16 +0100
Message-ID: <20200512191116.6851-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

See comment for details.  Works around a GCC-9 bug which breaks the build on
Ubuntu.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Stefan Bader <stefan.bader@canonical.com>

Sorry for messing you around with how to fix this.  I'd neglected to consider
the CONFIG_LIVEPATCH interaction.  With that extra observation, there is no
point having the extra complexity given that the result with CET-IBT and
Retpoline still isn't usable.
---
 xen/arch/x86/arch.mk         | 9 +++++++++
 xen/arch/x86/boot/build32.mk | 1 +
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 2a51553edb..93e30e4bea 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -67,6 +67,15 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
+# Xen doesn't support CET-IBT yet.  At a minimum, logic is required to
+# enable it for supervisor use, but the Livepatch functionality needs
+# to learn not to overwrite ENDBR64 instructions.
+#
+# Furthermore, Ubuntu enables -fcf-protection by default, along with a
+# buggy version of GCC-9 which objects to it in combination with
+# -mindirect-branch=thunk-extern (Fixed in GCC 10, 9.4).
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
+
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS-stack-boundary,CC,-mpreferred-stack-boundary=3)
diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
index 48c7407c00..5a00755512 100644
--- a/xen/arch/x86/boot/build32.mk
+++ b/xen/arch/x86/boot/build32.mk
@@ -3,6 +3,7 @@ CFLAGS =
 include $(XEN_ROOT)/Config.mk
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 
 CFLAGS += -Werror -fno-asynchronous-unwind-tables -fno-builtin -g0 -msoft-float
 CFLAGS += -I$(XEN_ROOT)/xen/include
-- 
2.11.0


