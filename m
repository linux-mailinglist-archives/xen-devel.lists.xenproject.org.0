Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C61CFAA9
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 18:29:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXm6-0004iC-HS; Tue, 12 May 2020 16:28:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYXm6-0004i7-2T
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 16:28:58 +0000
X-Inumbo-ID: ac4c4e5e-946d-11ea-a2d8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac4c4e5e-946d-11ea-a2d8-12813bfff9fa;
 Tue, 12 May 2020 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589300936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ntlV26wEcF4XSi0g3CxgD+0WFwGxy7ndEp9NSgUC9o=;
 b=f5hvJZ26SLmrpXoi96zv1gyWv6P4jcRtUsqwV80kD18sJr45kk6n+gxq
 D+cRwgIXFH0xvLbmPyNG8rhGyZqg18mxJ6e4X2IkXwhD7BRH6VPyWcPN7
 0S8mVpUAmv3ALuaXvEkk4yvPB4reB0z7Wx6seQdmlqmV57vfUXsvYjCue g=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: +u5DxnAfrkcTxy86LoqbYdWGWgD4MDiNoRN4uyQr9EyenJJIeAcXbodTFOdmmyak2oVBpDV6hg
 RiDfOTSFS0LWue0y5Z1Fqv7GNdzmzQuHOriNg9WVWIe2BSWaK0I6uNlnH72X6I4x/1d8wJJOwE
 PfIG72bG3sz5okjDrUuB6imabWL7kOmnjDq4lEVFVWKLyDha0gd1CVDLGRInI3ljQrNRB7jpkj
 IAXHjxdKlR2bWaKOPvpuPk7dFzLe9kMUTuRVPC/O38BljzxfvWLg1+kOi/7/mBn10Rekb50ef3
 o+I=
X-SBRS: 2.7
X-MesageID: 18028713
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="18028713"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/guest: Fix assembler warnings with newer binutils
Date: Tue, 12 May 2020 17:28:30 +0100
Message-ID: <20200512162830.5912-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

GAS of at least version 2.34 complains:

  hypercall_page.S: Assembler messages:
  hypercall_page.S:24: Warning: symbol 'HYPERCALL_set_trap_table' already has its type set
  ...
  hypercall_page.S:71: Warning: symbol 'HYPERCALL_arch_7' already has its type set

This is because the whole page is declared as STT_OBJECT, and then every
hypercall within it is declared as STT_FUNC.  As these are function-like and
in .text, retain the STT_FUNC type and drop STT_OBJECT.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Alternative suggestions welcome.  I've got half a mind to strip the unused
hypercalls, as a large chunk of them are PV only and will never be used by a
PVH Xen.  This would also remove the existing alias between hypercall_page and
HYPERCALL_set_trap_table.
---
 xen/arch/x86/guest/xen/hypercall_page.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/guest/xen/hypercall_page.S b/xen/arch/x86/guest/xen/hypercall_page.S
index 6485e9150e..9673846b7d 100644
--- a/xen/arch/x86/guest/xen/hypercall_page.S
+++ b/xen/arch/x86/guest/xen/hypercall_page.S
@@ -8,7 +8,6 @@
 GLOBAL(hypercall_page)
          /* Poisoned with `ret` for safety before hypercalls are set up. */
         .fill PAGE_SIZE, 1, 0xc3
-        .type hypercall_page, STT_OBJECT
         .size hypercall_page, PAGE_SIZE
 
 /*
-- 
2.11.0


