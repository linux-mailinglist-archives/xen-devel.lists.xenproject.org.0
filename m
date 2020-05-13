Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94241D1692
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:56:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrrt-0007QO-UH; Wed, 13 May 2020 13:56:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYrrs-0007Q3-Il
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:56:16 +0000
X-Inumbo-ID: 8230159a-9521-11ea-a380-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8230159a-9521-11ea-a380-12813bfff9fa;
 Wed, 13 May 2020 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589378174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8RnL7r04wvQLuEkyA1mIyz1nkfFjDGCWQxNcNfagCt4=;
 b=ZAUpL6SGJN70VJrjN95xxkbFv72q4A9LB6XFIAxMfvOspzlOQ8aJMrSl
 qf5Pk7h5xJB/847sxJ7fJN4RWXriqPJ2mfvKceHysGyH8kfxNea+FFOTy
 Kb98X7+8A7fCONSaxMzwOgnhw0GOx1cLf4HwbVdANgHFe2c28QXADvWgv o=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: OsZHGwfRCQDDywVu6pe+akW9kNGwoP1VbEawUh6mupPmhbra4dTE2Wkq/TDp83Nyg35LMQwdDF
 EAUHT7MDR8Rr14GUtC91sVg+NymN6Wo26BdluIh8gS5yS74tz1ccbOYmMyv78NMLzHvwd5mDNV
 QLJZj2LrdftePKEu2Nq5xsYzY7tMelU4LP9jLwwWY2930tnXeFZgEQhzRhpA6Qijbbtk0RXdYB
 glhefavSDmxxep4W9jeZ5AY3wkQfwAMOW/ceNWY3rN5rks5bKvJQpiWXr3ZXw75Tyu4Dk1RHfH
 bgE=
X-SBRS: 2.7
X-MesageID: 17414537
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17414537"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/build: Unilaterally disable -fcf-protection
Date: Wed, 13 May 2020 14:55:52 +0100
Message-ID: <20200513135552.24329-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200513135552.24329-1-andrew.cooper3@citrix.com>
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
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

Xen doesn't support CET-IBT yet.  At a minimum, logic is required to enable it
for supervisor use, but the livepatch functionality needs to learn not to
overwrite ENDBR64 instructions.

Furthermore, Ubuntu enables -fcf-protection by default, along with a buggy
version of GCC-9 which objects to it in combination with
-mindirect-branch=thunk-extern (Fixed in GCC 10, 9.4).

Various objects (Xen boot path, Rombios 32 stubs) require .text to be at the
beginning of the object.  These paths explode when .note.gnu.properties gets
put ahead of .text and we end up executing the notes data.

Disable -fcf-protection for all embedded objects.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Stefan Bader <stefan.bader@canonical.com>

v2:
 * Fix Rombios 32 stubs as well.
---
 Config.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.mk b/Config.mk
index b0f16680f3..7d556aed30 100644
--- a/Config.mk
+++ b/Config.mk
@@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
 EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
+EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
 
 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
-- 
2.11.0


