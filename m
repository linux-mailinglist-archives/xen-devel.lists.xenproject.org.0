Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94A255E7B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 18:02:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgph-0005ow-6b; Fri, 28 Aug 2020 16:02:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KYCx=CG=amazon.de=prvs=502712ec5=mku@srs-us1.protection.inumbo.net>)
 id 1kBgpg-0005on-2V
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 16:02:28 +0000
X-Inumbo-ID: 723b695e-284d-43d7-a0e7-88c0ca26aadf
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 723b695e-284d-43d7-a0e7-88c0ca26aadf;
 Fri, 28 Aug 2020 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1598630548; x=1630166548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=LJtbuqdbYGtKdgG24o72P+74WSeJZH6//rWUPFJXdc0=;
 b=XYGa8CTPckAwQ37kHlNiuDOHhr5zpLCf86Z/GIeFElWcbARN2U3wHgFK
 E3yMMhVgFwjTxGxgp2s85jWNt356ODAH1W2OVJehkTWG73b4lZNkLF45D
 c4/GzNqJCbJG9KQ6/9K0kJkGui6APBvXhrSWrLliza1EetC/tDExIQiHR U=;
X-IronPort-AV: E=Sophos;i="5.76,364,1592870400"; d="scan'208";a="50691056"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 28 Aug 2020 16:02:26 +0000
Received: from EX13D05EUB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 23998A20CF; Fri, 28 Aug 2020 16:02:24 +0000 (UTC)
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 28 Aug 2020 16:02:21 +0000
Received: from dev-dsk-mku-1c-d6eb1b4b.eu-west-1.amazon.com (10.15.13.90) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 28 Aug 2020 16:02:18 +0000
From: Michael Kurth <mku@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 <wipawel@xen.org>, <wipawel@amazon.de>, Michael Kurth <mku@amazon.de>
Subject: [PATCH v2] Add additional symbols to xen-syms.map
Date: Fri, 28 Aug 2020 16:02:00 +0000
Message-ID: <20200828160200.13322-1-mku@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200821151045.92022-1-mku@amazon.de>
References: <20200821151045.92022-1-mku@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michael Kurth <mku@amazon.com>

Add "all_symbols" to all /tools/symbols calls so that
xen-syms.map lists all symbols and not only .text section
symbols. This change enhances debugging and livepatch
capabilities.

Signed-off-by: Michael Kurth <mku@amazon.de>
Reviewed-by: Eslam Elnikety <elnikety@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>
Reviewed-by: Robert Stonehouse <rjstone@amazon.co.uk>
Reviewed-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 xen/arch/arm/Makefile | 2 +-
 xen/arch/x86/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7e82b2178c..51173d9712 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -115,7 +115,7 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort \
+		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]*
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b388861679..14a05b09bc 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -153,7 +153,7 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort \
+		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
@@ -215,7 +215,7 @@ $(TARGET).efi: prelink-efi.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort >$(@D)/$(@F).map
+		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 else
 $(TARGET).efi: FORCE
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




