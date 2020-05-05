Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5A1C5987
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:29:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyYo-0003Q8-NG; Tue, 05 May 2020 14:28:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3eM=6T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVyYn-0003Q3-Ro
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:28:37 +0000
X-Inumbo-ID: b4902408-8edc-11ea-9dc1-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4902408-8edc-11ea-9dc1-12813bfff9fa;
 Tue, 05 May 2020 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588688916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GVfuPbUQsqeIhGJoG8naDKUltMlZiudeC+6lsAOKUQ8=;
 b=aIzSUz/OVNWTRva1/0CdaO4GJzj5F/gjW9Ga55SqEfL8p2aarlnYjN1g
 Wt846UO92B2QeHYPAZ8miUiML5NuIsfO+9wWwRabbk9vf4sbGHCvrCzRB
 +1f4T2fqik/+6qXJ0C/zr1rrdmwlx/EetDVe0d4thuliJMOTmg7Vjlkhf o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: sqBHqNaj+V6A6wrt75k4CeaLMaQ9pdNnijpRDxGzrH0H32oA9Y5ymumUO2IHjXxrGzzIA47z+d
 xzMLRUBMY0WW8AAHNZPwWmWxmpOK5jyuo8XW34LU56i1obKDQcyfgTTdN9xN9OKo2FbCM/JEvK
 zczJ8ARQqzSGchK4ui6t/R5xpDx6j07g7QYJ2Raz4FhS61lNlq2yvMKR5IVqw9ctuFg9Xp4Zkf
 Vj0pf2KB2GWuxdw6OoyredLHA2P/F27mY4EuerEOrHOmVqEuEnqEHh+oPL02ew8EDFco0t3EDP
 YjY=
X-SBRS: 2.7
X-MesageID: 17472687
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17472687"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/pv: Fix Clang build with !CONFIG_PV32
Date: Tue, 5 May 2020 15:28:10 +0100
Message-ID: <20200505142810.14827-1-andrew.cooper3@citrix.com>
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

Clang 3.5 doesn't do enough dead-code-elimination to drop the compat_gdt
reference, resulting in a linker failure:

  hidden symbol `per_cpu__compat_gdt' isn't defined

Drop the local variable, and move evaluation of this_cpu(compat_gdt) to within
the guarded region.

Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 131ff03fcf..63f3893c7a 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -711,8 +711,6 @@ void load_system_tables(void)
 	struct tss64 *tss = &this_cpu(tss_page).tss;
 	seg_desc_t *gdt =
 		this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
-	seg_desc_t *compat_gdt =
-		this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY;
 
 	const struct desc_ptr gdtr = {
 		.base = (unsigned long)gdt,
@@ -753,8 +751,9 @@ void load_system_tables(void)
 	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
 			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
 	if ( IS_ENABLED(CONFIG_PV32) )
-		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
-				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
+		_set_tssldt_desc(
+			this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
+			(unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
 
 	per_cpu(full_gdt_loaded, cpu) = false;
 	lgdt(&gdtr);
-- 
2.11.0


