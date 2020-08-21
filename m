Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D524E507
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 06:17:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9Kwy-00079C-GA; Sat, 22 Aug 2020 04:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=excd=B7=amazon.de=prvs=4955aae30=mku@srs-us1.protection.inumbo.net>)
 id 1k98hZ-0000n7-BG
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 15:11:33 +0000
X-Inumbo-ID: f8a3d898-967d-432b-a0b4-f305b93643a7
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8a3d898-967d-432b-a0b4-f305b93643a7;
 Fri, 21 Aug 2020 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1598022692; x=1629558692;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=saeYHdUdP9+AELZDS6GvbD1dhH+0gLPnzXS8Nl4dU1k=;
 b=RBYQw/wFxKiWv6CI9UHuK+bGKy+1EdbZp5EBEmTaheDXDUa3weH5gM66
 wUrZCL9vemN5hO2/JIAal4Y0nq5LOqb4h6jHu+UO80L1geC6SfIsRtv6l
 IECLx8zM5Cr8GrLK79ARkuqZYXZDun71mbjCAECdI+LPCm/+LRP4HKk23 o=;
X-IronPort-AV: E=Sophos;i="5.76,337,1592870400"; d="scan'208";a="61712498"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Aug 2020 15:11:27 +0000
Received: from EX13D05EUB003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 01CDCA1FAB; Fri, 21 Aug 2020 15:11:24 +0000 (UTC)
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 15:11:23 +0000
Received: from dev-dsk-mku-1c-d6eb1b4b.eu-west-1.amazon.com (10.15.13.90) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 21 Aug 2020 15:11:20 +0000
From: Michael Kurth <mku@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 <wipawel@xen.org>, <wipawel@amazon.de>, Michael Kurth <mku@amazon.de>
Subject: [PATCH] Add additional symbols to xen-syms.map
Date: Fri, 21 Aug 2020 15:10:45 +0000
Message-ID: <20200821151045.92022-1-mku@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-Mailman-Approved-At: Sat, 22 Aug 2020 04:16:12 +0000
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
index 7e82b2178c..bab0646204 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -115,7 +115,7 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort \
+		| $(BASEDIR)/tools/symbols $(all_symbols) --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]*
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b388861679..efbe2f80b6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -153,7 +153,7 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort \
+		| $(BASEDIR)/tools/symbols $(all_symbols) --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
@@ -215,7 +215,7 @@ $(TARGET).efi: prelink-efi.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort >$(@D)/$(@F).map
+		| $(BASEDIR)/tools/symbols $(all_symbols) --xensyms --sysv --sort >$(@D)/$(@F).map
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




