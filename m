Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192E19D771
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 15:18:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKMCP-0006Jb-JD; Fri, 03 Apr 2020 13:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKMCN-0006JW-PP
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 13:17:27 +0000
X-Inumbo-ID: 76156276-75ad-11ea-bd0e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76156276-75ad-11ea-bd0e-12813bfff9fa;
 Fri, 03 Apr 2020 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585919846;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ALGvBdmFms4PYlnV2x24j5U+BD1c7rKpbBLtIR/PaNo=;
 b=KaCrRx4Gv3rqTTl1drAT+ItofgDo3K0Btab/iAitPFu+MpYrz3sPf/Ad
 x9xHYPJgK2uIiTE4bpLpqU7KbwaJvUX05VqWuJtdXlpfh03bXYOlUO1Ct
 p2HxJLQNxzBTavQEuFrO3jmRAYistjt0skFEXTHEpao+BFBJhajxOHh48 s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cWlfgwN6+VbQVN7Ngd1aAcZy/gYrCr7VgsECTdVCNgWDHbK0eb5lcHzy/A7DFMgslkNzAR1l6V
 I0513dxVlFZ7D91phcBSZBcR3sQ/2KXPhzbq+6NP3o/XAG0NyIX/tKGsXfVjsDb8i4CUPF4ulZ
 jXtcWXurtabtHeUdLtjMX854t+az2DA3EMu+8D3fH6fq+AnDCEyBy7uNPFfKRdljUSyaX59BzM
 ogyXlcYKEFYMUQZiAsPCC8uqMKB6pCMJlFECe/BV0IqIx2SfJMOs0cOhEhU9pUt0nfjl/pYsYe
 LCQ=
X-SBRS: 2.7
X-MesageID: 15538761
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,339,1580792400"; d="scan'208";a="15538761"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] docs: Render .md files using pandoc
Date: Fri, 3 Apr 2020 14:17:20 +0100
Message-ID: <20200403131720.30140-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Ian
 Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This fixes the fact that qemu-deprivilege.md, non-cooperative-migration.md and
xenstore-migration.md don't currently get rendered at all, and are therefore
missing from xenbits.xen.org/docs

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Paul Durrant <paul.durrant@citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>

Ian - given qemu-deprivilege.md was in 4.12, this wants backporting.  It quite
possibly needs some intermediate prerequisites
---
 docs/Makefile | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/docs/Makefile b/docs/Makefile
index d8ba99b1dc..3eae2dae60 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -15,7 +15,7 @@ RST-SRC-y := $(sort $(filter-out %index.rst,$(shell find * -type f -name '*.rst'
 
 TXTSRC-y := $(sort $(shell find misc -name '*.txt' -print))
 
-PANDOCSRC-y := $(sort $(shell find designs/ features/ misc/ process/ specs/ -name '*.pandoc' -print))
+PANDOCSRC-y := $(sort $(shell find designs/ features/ misc/ process/ specs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
 
 # Documentation targets
 $(foreach i,$(MAN_SECTIONS), \
@@ -24,15 +24,18 @@ $(foreach i,$(MAN_SECTIONS), \
 
 DOC_HTML := html/SUPPORT.html \
             $(patsubst %.pandoc,html/%.html,$(PANDOCSRC-y)) \
+            $(patsubst %.md,html/%.html,$(PANDOCSRC-y)) \
             $(patsubst %.rst,html/%.html,$(RST-SRC-y)) \
             $(patsubst %,html/%.html,$(MAN-SRC-y)) \
             $(patsubst %.txt,html/%.txt,$(TXTSRC-y)) \
             $(patsubst %,html/hypercall/%/index.html,$(DOC_ARCHES))
 DOC_TXT  := $(patsubst %.txt,txt/%.txt,$(TXTSRC-y)) \
             $(patsubst %.pandoc,txt/%.txt,$(PANDOCSRC-y)) \
+            $(patsubst %.md,txt/%.txt,$(PANDOCSRC-y)) \
             $(patsubst %.rst,txt/%.txt,$(RST-SRC-y)) \
             $(patsubst %,txt/%.txt,$(MAN-SRC-y))
 DOC_PDF  := $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
+            $(patsubst %.md,pdf/%.pdf,$(PANDOCSRC-y)) \
             $(patsubst %.rst,pdf/%.pdf,$(RST-SRC-y))
 
 # Top level build targets
@@ -228,12 +231,10 @@ define GENERATE_PANDOC_RULE
 # $(1) is the target documentation format. $(2) is the source format.
 $(call GENERATE_PANDOC_RULE_RAW,$(1)/%.$(1),%.$(2))
 endef
-$(eval $(call GENERATE_PANDOC_RULE,pdf,pandoc))   # pdf/%.pdf: %.pandoc
-$(eval $(call GENERATE_PANDOC_RULE,pdf,rst))      # pdf/%.pdf: %.rst
-$(eval $(call GENERATE_PANDOC_RULE,txt,pandoc))   # txt/%.txt: %.pandoc
-$(eval $(call GENERATE_PANDOC_RULE,txt,rst))      # txt/%.txt: %.rst
-$(eval $(call GENERATE_PANDOC_RULE,html,pandoc))  # html/%.html: %.pandoc
-$(eval $(call GENERATE_PANDOC_RULE,html,rst))     # html/%.html: %.rst
+
+$(foreach dst-fmt,pdf txt html,\
+$(foreach src-fmt,pandoc md rst,\
+$(eval $(call GENERATE_PANDOC_RULE,$(dst-fmt),$(src-fmt)))))
 
 $(eval $(call GENERATE_PANDOC_RULE_RAW,html/SUPPORT.html,$(XEN_ROOT)/SUPPORT.md))
 
-- 
2.11.0


