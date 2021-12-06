Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2446A26F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239529.415476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTv-0006eN-GZ; Mon, 06 Dec 2021 17:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239529.415476; Mon, 06 Dec 2021 17:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTu-0006Jh-Qu; Mon, 06 Dec 2021 17:08:50 +0000
Received: by outflank-mailman (input) for mailman id 239529;
 Mon, 06 Dec 2021 17:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOl-0005ta-Ux
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fcc8f94-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:30 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6fcc8f94-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UhFgmmoOwKtG2lUQa+HnpdBh/Zms8eKZ6E/nA9EQD1A=;
  b=Z1VIgh6Ab/2rTOtL/4e3YhCyiaQlQaK2quttx2yYlvlwny9ApUgUNPrM
   Ez5mWSmul+jzc+x12kmMAOTbvhUdfWT7NW3bShADSiKybNT3BYOHuF0HP
   BfYpcpdewlx3qOr/R5RvVaN3YlEWgZ8RDAr1hlJQwIAL+/1/9b9rmJj6u
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2cQgVYcnPwKL4omFLQzgezRglJDjdbeB177CK6FPg8FOgTO0hKvmBJs0wS5rSKMvxBQAxvep1e
 16YVNcy5ZFA0xxFgAOuBi4t0o7AMl7pBPGvKH78636RH4zuzpvzScc2OXD/C2rxzkyofIkeV9j
 xpZOkg6GtVWtDU9qsrb9eemm22XuSBjFrfRRcOb1pNfPteTF53HOHxF5cJAZeDTa30nIPqiwui
 7WhbBTOI8+qcQ6vB2Kzf2HG5DLNvydzw1+xBzEy6MuTlSy39XiQTuPAEbQvsJtXXNUnNQBnkp/
 RfyYzGSb6Ca/KLwBNZydODSp
X-SBRS: 5.1
X-MesageID: 59766370
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jw7WIan2kwBJLn13GEGcVNHo5gxzIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUDiFbP2PZTanL492YYWxpEsPvJ6Dx99mSAE4qntgFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVLjaW5bVsYBJfzpOtFYTJgDgBhA6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeBO
 ZRCNmIHgBLoc1pRPEwyGrsCt9yZ2iCgXmx8iVDJuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z4HRMyJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhcaR9pXFfx88AyXw7DYywmcD2kACDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8jTWKACExcV44XxA4QlM3yOH+gZ4NgUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9XwsQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJqm3FF52LJ9k4DNRCyKFBaJxsldjBO
 hC7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHcrH40NBPKhT6ywCDAdJ3T3
 7/BK65A6l5AVsxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcEkgei3iOedl3RAp2hAZu2NatCQbsAFXREFT6VN7ILO9bHAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:7DuPbaP/E6TtBcBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766370"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [XEN PATCH 13/57] tools/firmware/hvmloader: remove "subdirs-*" prerequisite
Date: Mon, 6 Dec 2021 17:01:56 +0000
Message-ID: <20211206170241.13165-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

hvmloader's last subdir have been removed in 73b72736e6 ("acpi: Move
ACPI code to tools/libacpi"), so there is no need to use "subdirs-*"
target anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/firmware/hvmloader/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index e980ce7c5f..b754220839 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -60,7 +60,7 @@ ROMS += $(ROMBIOS_ROM) $(STDVGA_ROM) $(CIRRUSVGA_ROM)
 endif
 
 .PHONY: all
-all: acpi subdirs-all
+all: acpi
 	$(MAKE) hvmloader
 
 .PHONY: acpi
@@ -104,7 +104,7 @@ endif
 	mv $@.new $@
 
 .PHONY: clean
-clean: subdirs-clean
+clean:
 	rm -f roms.inc roms.inc.new acpi.h
 	rm -f hvmloader hvmloader.tmp *.o $(DEPS_RM)
 	$(MAKE) -C $(ACPI_PATH)  ACPI_BUILD_DIR=$(CURDIR) clean
-- 
Anthony PERARD


