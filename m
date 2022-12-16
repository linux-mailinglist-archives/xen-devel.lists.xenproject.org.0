Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15064F107
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464955.723533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FYG-0004XH-3v; Fri, 16 Dec 2022 18:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464955.723533; Fri, 16 Dec 2022 18:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FYG-0004TJ-0W; Fri, 16 Dec 2022 18:35:20 +0000
Received: by outflank-mailman (input) for mailman id 464955;
 Fri, 16 Dec 2022 18:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FPV-0008JE-D1
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:26:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bff2c4b-7d6f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 19:26:10 +0100 (CET)
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
X-Inumbo-ID: 1bff2c4b-7d6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JUmULyGWIdhWMUegp5a4qbTMk08PxLxHNxfrTX1tB4k=;
  b=KiilK0Utz1hHOs5k6gp01rkp1sG7vvkTR/2wO5d/HvlLuZr64Q3PjMA8
   M2elin2mvWd30Gda+7czuF8nrngGxg5oFxxwUCeQXNkD9WRUbaGhNKue4
   JUZK/1KvlSbtzOh1mC/OAxWVwjQcaaCyBKnXee026iKQx6J0WN/OsVnV0
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87767478
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vIjixK/e510RQxQHzg2YDrUDiX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2oeCDvSb/zYNGugfd0kYd7k9xwEsZeAyIIyGlY4rCs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkleq
 tFBJwEkNymHoL+znK6jWPdwptUseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+limf+dXtEr0iSpoI84nTJzRw327/oWDbQUozVGpsKwhnIz
 o7A11/8Gw0fFISl8gOA/lX2h/PIpQDefI1HQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3J
 0UK9wI0oKM19UjtScPyNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhSPtFHEaHEZbXCsjEA5Z/8Hxvp0Tnx2aG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF7r1xBGFb5J+i8BQ2Sw283WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYMXOMkoJV/foH8GiausM4fFyRhErE3CE
 c3DLZbE4YgyV8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcyu+pEKKrPdfVoO9aNII6a5/I7NsrdNx8x9/tokN
 FnnAie0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:xhaws6MGqi0m+sBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="87767478"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 02/11] tools/ocaml/xenstored/Makefile: use ocamldep -sort for linking order
Date: Fri, 16 Dec 2022 18:25:11 +0000
Message-ID: <88465f679e51139016ac42faa6cdd8ba173978c5.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A better solution is being worked on for master,
but for now use ocamldep -sort instead of a manually established link
order.
The manually established link order will be wrong when (security)
patches introduce new dependencies between files that would require
changing the link order.

If dune was used as a build system this wouldn't be a problem, but we
can't use Dune yet due to OSSTest, which is stuck on Debian oldstable.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Reason for inclusion in 4.17:

Avoids having to put this patch as a prerequisite into a security update.
Earlier versions of XSA-326 needed this, and although latest version
didn't we don't know whether it might be needed again in the future or not.

Changes since v2:
- new in v3 (was previously emailed to security team though)

Changes since v3:
- add Acked-by line
---
 tools/ocaml/xenstored/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 6f7333926e..e8aaecf2e6 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -72,7 +72,11 @@ XENSTOREDLIBS = \
 PROGRAMS = oxenstored
 
 oxenstored_LIBS = $(XENSTOREDLIBS)
-oxenstored_OBJS = $(OBJS)
+# use ocamldep to figure out link order, otherwise the Makefile would have
+# to be continously adjusted for security patches that introduce new
+# dependencies between files
+oxenstored_MLSORTED = $(shell $(OCAMLDEP) -sort $(OBJS:=.ml))
+oxenstored_OBJS = $(oxenstored_MLSORTED:.ml=)
 
 OCAML_PROGRAM = oxenstored
 
-- 
2.34.1


