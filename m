Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B74734A9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 20:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246280.424737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwqfR-00082j-Je; Mon, 13 Dec 2021 19:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246280.424737; Mon, 13 Dec 2021 19:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwqfR-000808-GV; Mon, 13 Dec 2021 19:07:21 +0000
Received: by outflank-mailman (input) for mailman id 246280;
 Mon, 13 Dec 2021 19:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEuh=Q6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mwqfQ-000802-JU
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 19:07:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b324e5-5c47-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 20:07:19 +0100 (CET)
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
X-Inumbo-ID: e3b324e5-5c47-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639422438;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=8ru3lFSf84OZ17ioZSPEU1QzbNuOpBrkz3ImK0ue+tw=;
  b=GhrE9rqfBMU4jZf4iC7aj9O/jjSvQVCivMpfu9jRVHyhjj/B58WEA1Qn
   wVHGQjJT6V9+R0lJDoJ85zq8Gu9BCYeYmqEHsSQSXFvBGoI5B+NeCdgkI
   A/CTFIyMzou9JIM3YhJwIvidONCsLaTla5c5hiwcMQ+fkBs7uiiZDUj34
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KsaWIhNLvGOXcdLd28a8g/6bCkbsDR2v+kjJgEFTL47kuMHiQtrODB8K7N4dp0cWM2xYFCJrB0
 VyzVWtwYDEzeHPNXfsswUc2WxoxKMLeOmJGNkyZQahX5GOOkPe0EQZMzJAEOSNsknCd2mBfw11
 ixmrGBoP4uMM88f8Th1UQOmnkuzqlJGUQ5hZUUQOKFbYLY4t3amBYiTaGEoX81O/uZ7KyVtsCH
 Mv9LVc1J3HIt1easU7bWxOaFKpg2IKNtIXZZ9ICF+Xe1ZpAwcRzOqbQzVKLeq8Ml4c2jl+iI5K
 Ru0Bb81AQCcCcgOB/Y01+Via
X-SBRS: 5.1
X-MesageID: 59420564
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:T40yZ6qdO1XHrH21A4S5cDp4KC1eBmInYhIvgKrLsJaIsI4StFCzt
 garIBnQOf+JMGCkf4h1atjlphwGvcKAx4JhTABqqSk3EHlHoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2Ncx24HiW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb+caV8wG4Lcors2Cwl2Si97DKBjpaCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ptFM2IyMkiojxtnGGk0WIlljOWT32T1IwFCpWO2jvs+2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYO8aY0iGt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4MMEasBio5bruvC3BFkZdQDtwZfl7q5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAGzARVodt/xory9U
 J8swZf20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LsWoleBc0b5ZfIFcFh
 XM/XisLu/du0IaCN/crM+pd9ex0pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pMidcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4DbZbXkEsGD7WlCsQVmKZKRW03wbEALcieg6RqmiSreWKKwUktVK3cx60PYYtgk/gHn+vE5
 CjlCERZ1ED+lTvMLgDTMiJvb7bmXJBeq3MnPHNzYQb0iiZ7OYv/vr0Cc5YXfKU88LAxx/BDU
 PRYKd6LBe5CS2qb9m1FP4X9toFraD+imRmKY3i+eDE6cpM5H17J99bocxHB7i4LCibr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBncnWjgOU2LscALQT46gGbj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aivO
 bdVwvX7PKFVlVpGqdMhQbNizKZ47Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhQQwYKwcSZ+ie0e0Zx2vJ5vMvLUSmvCJ68dJri6mJ08VgXMCFEIZIDQ==
IronPort-HdrOrdr: A9a23:NcZcC6NIEWjrF8BcTtejsMiBIKoaSvp037Eqv3oedfU1SL3+qy
 nAppQmPHPP5Ar5O0tQ/exoWpPwIk80nKQdieJ6UItKNDOW3VdAR7sC0WKN+VLd8lXFh4xg6Z
 s=
X-IronPort-AV: E=Sophos;i="5.88,203,1635220800"; 
   d="scan'208";a="59420564"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH] tools/libs: Don't recursively expand MAJOR ?= $(shell ...)
Date: Mon, 13 Dec 2021 19:04:49 +0000
Message-ID: <20211213190449.4830-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

?= is a deferred assignment.  Switch to an alternative form which lets us use
an immediate assignment.

Before, version.sh gets run anywhere between 46 and 88 times, with 50 on a
`clean`.  After, 6 times, invariant of main rune, and whether it is an
incremental build or not.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

The identity transform comes from the docs
https://www.gnu.org/software/make/manual/make.html#Flavors (final paragraph).

Something slightly weird is going on.  Before this, the exact number of hits
that verson.sh gets isn't stable, even when running repeat incremental builds.
I suspect this means we've got a lurking parallel build issue.
---
 tools/libs/libs.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index dfbbef4080f6..b21e0bf083a0 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -6,7 +6,10 @@
 #   MINOR:   minor version of lib (0 if empty)
 
 LIBNAME := $(notdir $(CURDIR))
-MAJOR ?= $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
+
+ifeq ($(origin MAJOR), undefined)
+MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
+endif
 MINOR ?= 0
 
 SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
-- 
2.11.0


