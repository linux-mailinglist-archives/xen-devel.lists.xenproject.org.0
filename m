Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DB5854CA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377693.611033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBu-0008H2-OX; Fri, 29 Jul 2022 17:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377693.611033; Fri, 29 Jul 2022 17:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBu-0008DC-KO; Fri, 29 Jul 2022 17:54:26 +0000
Received: by outflank-mailman (input) for mailman id 377693;
 Fri, 29 Jul 2022 17:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBt-0006a9-GD
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a701b24-0f67-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 19:54:24 +0200 (CEST)
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
X-Inumbo-ID: 7a701b24-0f67-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l4aF2ey7+PrEkwFig3yeefjykYcLjpth1sMCs1mC3pQ=;
  b=hvCsb+OGwybB2XLfpDxTsnZw5Glyyn1hIbF/W5fGiODNFapUFOhn+rI1
   tPIqLvqR+KMVnAh1m4XsnLoPpZ0irDHDCUSbYoYrSvLtekRoWdx+S3BUs
   SBQ/+4g3n2drqq/+cWxJqmdOWaK35BT6aIdGN95ncytLunzmbidqzpW1P
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76740552
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1AIS/aCp/oPIfBVW/0rjw5YqxClBgxIJ4kV8jS/XYbTApGh0gzcDn
 zYfXWyPPfnbMDHze40kPYS/p0gHu5XQmtNmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpLsfPb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJWyL0xqVjU3oTBowd+dd9RlNcq
 t8qCz9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTdjchXGJQFIIFAUIJk/gP2plj/0dDgwRFe9+vRovzCOkVYZPL7FFor6IIGlbsNptByDh
 DyX4lu+EhtLHYnKodaC2i313bKe9c/hY6oNEJWo+/gsh0ecrkQfAQMbfUG2qv64jgi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhxsvsVTEwi5iuSHeex73TnyHtGho2IjpXDcMbdjfp8+UPsalq0E+eFosyTfbk5jHmMWqum
 m7X9UDSk51W1JdWjPvjoDgrlhr2/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi7rnXzURhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43b5dcImSyM
 BOM41w5CHpv0JyCNPUfXm5MI55ykfiI+SrNDZg4keaikrAuLVTarUmClGab3nz3kVhErJzTz
 ayzKJ/0ZV5HWPsP8dZDb71CuVPd7nxhmDi7qFGS50jP7Idyk1bPFe5cYAPVMr1RAWHtiFy9z
 uuz/vCik313ONASqAGNmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:5Ree6KwmMzrgjpzpiRErKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="76740552"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during make clean
Date: Fri, 29 Jul 2022 18:53:24 +0100
Message-ID: <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Trying to include .ocamldep.make will cause it to be generated if it
doesn't exist.
We do not want this during make clean: we would remove it anyway.

Speeds up make clean.

Before (measured on f732240fd3bac25116151db5ddeb7203b62e85ce, July 2022):
```
Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl

 Performance counter stats for 'make clean -j8 -s' (5 runs):

            4.2233 +- 0.0208 seconds time elapsed  ( +-  0.49% )
```

After:
```
perf stat -r 5 --null make clean -j8 -s

 Performance counter stats for 'make clean -j8 -s' (5 runs):

            2.7325 +- 0.0138 seconds time elapsed  ( +-  0.51% )
```

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/Makefile.rules | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 7e4db457a1..d368308d9b 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -44,8 +44,10 @@ META: META.in
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
+ifneq ($(MAKECMDGOALS),clean)
 .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
+endif
 
 clean: $(CLEAN_HOOKS)
 	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
-- 
2.34.1


