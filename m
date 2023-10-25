Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3B7D6DB9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622903.970157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveJw-0006RA-7N; Wed, 25 Oct 2023 13:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622903.970157; Wed, 25 Oct 2023 13:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveJw-0006PV-4O; Wed, 25 Oct 2023 13:53:16 +0000
Received: by outflank-mailman (input) for mailman id 622903;
 Wed, 25 Oct 2023 13:53:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNCc=GH=citrix.com=prvs=655f6113c=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1qveJt-0006PN-14
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:53:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d51db5e2-733d-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 15:53:11 +0200 (CEST)
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
X-Inumbo-ID: d51db5e2-733d-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698241991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1rTF1L7sceyYkO4xRn03+9nOQi2HxeA/98hX8pyoRUE=;
  b=S+288GXA/EL1vOiXlXuQF0CwrogwRsJcxQPeXUskICGciSTswDWWQtkM
   OfsW/k1mWAKkqlIJBKE0djBPVfhYcdQQtdl/xBQN4mHkKrufmhfky4bm5
   uyJEYT19cNglmgHFDlKSNYsIGqjATqBCTsm0cceS0BozYPq5sxEYjCHCh
   M=;
X-CSE-ConnectionGUID: 5ENMPXBDTLaMVxiih2iwPA==
X-CSE-MsgGUID: 099osSSCQquNCP3mP7cA0A==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125204398
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:vK5nsaD02AmzTxVW/1Djw5YqxClBgxIJ4kV8jS/XYbTApD0k0jJWy
 mAcXzzSP6qKN2f1fI0gbI61pksG6pWBydAxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtC4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp8tRJFl+3
 9AkDDkoUACChuLswa2DY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/BZ4gneHumn7ldD5wo1OJv6snpWPUyWSd1ZC0aoePIoDRFJU9ckCw/
 jOX+H/COTojLcG54gLe90rzjcaXtHauMG4VPOLhraM76LGJ/UQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdxGxvnOspBMXXNtUVeog52ml1a788wufQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwoKvWmQHXKCppWy1q5qyiAuCEwQpCWYnWz8FTAtf4sbbidRm5v7QdeqPAJJZn/WsR2Cgm
 WjW/Xlg71kApZRVjfnlpzgrlxrp9sCTEFNvjunCdjj9hj6VcrJJcGBBBbLzxvFaJYLRdUGbv
 X4LgKByB8hVVsnSzURhrAgXdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNbSvzMvUtPtPqW5lCIU3c+TLNDK68gj1mO8UZSeN61Hs2OR74M57FyyDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkjP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPQlEwDDLeiPnKKmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:r0IrP6OxT0tRPMBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-Talos-CUID: 9a23:vGj2y25KkqS3s1oiU9ssqWMyP/gVWFHh6H71HV+5CGYzSaKtYArF
X-Talos-MUID: 9a23:DUXQgAoxbubhTg0oNfsez2kzZcBz2J+FMVkQt74+4My8aidZYx7I2Q==
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="125204398"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when compiling OCaml C stubs
Date: Wed, 25 Oct 2023 14:52:42 +0100
Message-ID: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

The code currently uses GCC to compile OCaml C stubs directly,
and although in most cases this works, it is not entirely correct.

This will fail if the OCaml runtime has been recompiled to use and link with ASAN for example
(or other situations where a flag needs to be used consistently in everything that is linked into the same binary).

Use the OCaml compiler instead, which knows how to invoke the correct C compiler with the correct flags,
and append the Xen specific CFLAGS to that instead.

Drop the explicit -fPIC and -I$(ocamlc -where): these will now be provided by the compiler as needed.

Use -verbose so we see the actuall full C compiler command line invocation done by the OCaml compiler.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/ocaml/Makefile.rules | 2 +-
 tools/ocaml/common.make    | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 0d3c6ac839..74856e2282 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -37,7 +37,7 @@ ALL_OCAML_OBJS ?= $(OBJS)
 	$(call quiet-command, $(OCAMLYACC) -q $<,MLYACC,$@)
 
 %.o: %.c
-	$(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<,CC,$@)
+	$(call quiet-command, $(OCAMLOPT) -verbose $(addprefix -ccopt ,$(CFLAGS)) -c -o $@ $<,CC,$@)
 
 META: META.in
 	sed 's/@VERSION@/$(VERSION)/g' < $< $o
diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index 0c8a597d5b..629e4b3e66 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -9,8 +9,6 @@ OCAMLLEX ?= ocamllex
 OCAMLYACC ?= ocamlyacc
 OCAMLFIND ?= ocamlfind
 
-CFLAGS += -fPIC -I$(shell ocamlc -where)
-
 OCAMLOPTFLAG_G := $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\) .*/\1/p')
 OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -cc $(CC) -w F -warn-error F
 OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
-- 
2.41.0


