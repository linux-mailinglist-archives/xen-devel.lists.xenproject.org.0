Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487B8621860
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440118.694172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcb-0001Ut-Eh; Tue, 08 Nov 2022 15:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440118.694172; Tue, 08 Nov 2022 15:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcb-0001Rj-BJ; Tue, 08 Nov 2022 15:34:41 +0000
Received: by outflank-mailman (input) for mailman id 440118;
 Tue, 08 Nov 2022 15:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcZ-0001RY-RG
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d97f9394-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:38 +0100 (CET)
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
X-Inumbo-ID: d97f9394-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fcGVjUlcEVSXL3s0Xxex/3prCjVc7v5RHdmr3hXRWPM=;
  b=X20A+Z8UbcnnlgUnC8rSSi2+HFCrDg/bKckj02rB2ImH+OI1yDy+n4rN
   ePSr9G5W/DAFu+VYWEkSdJCGhPT2rBwqHorYsv1+3+6In48nnpaMiT2NH
   xrk8eLpZGT+OBNF4IKB9khC9XjbFV/Dqwy3ibpVs3mXrfQn71bFM99oZ5
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84828529
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LztBQa6viFvAWBW3r8pWsAxRtDTHchMFZxGqfqrLsTDasY5as4F+v
 jQcW2iFOKyMYGv3L48ibIu19hkC6JWHx4cyQAY+rSwzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkT7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 tcHLQscb1e6hMGw6q++UPA2nJ97I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAi3XhcjsetFWPoqkf6GnP1g1hlrPqNbI5f/TaGZUPzhvC9
 woq+Uz2Iy8jDM6YwgC5rCO3q8+fpSj3SLk7QejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6qfS+RffOWECQRZIctlgv8gzLRQm3
 0GEt8nkDjtutPuSU331y1uPhWrsY25PdzZEPHJaC1teizX+nG0tpknkUdNYAa/yt97WHxvtx
 iqT9jJl37pG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezP
 ic/WisLvve/2UdGiocmC79d8+xwkcDd+S3ND5g5rrNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FL5n8UShDUfw9kmreqwIhPVgDn35W+I8ubcqjk0TPPUS2OBZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8QWmKZNRW03wY8TXMGr9JYMLbbTe2KL2ggJUpfs/F/oQKQ994w9qwsC1
 irVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:0TZpM63zPs9sUgU7U5WuoQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84828529"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 06/15] tools/ocaml/Makefile.rules: hide -include on *clean
Date: Tue, 8 Nov 2022 15:33:58 +0000
Message-ID: <2a584406ee8cc1fce5175ad04feee6fdb18b6844.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes: 2f2b76d47c5bcd9 ("tools/ocaml: do not run ocamldep during make clean")

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- addresses review comments received post commit

Changes since v2:
- add Fixes line
- add 4.17 reason
---
 tools/ocaml/Makefile.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index e0b9de34e4..39ac260a4d 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -44,10 +44,8 @@ META: META.in
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
-ifeq (,$(findstring clean,$(MAKECMDGOALS)))
 .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
-endif
 
 clean: $(CLEAN_HOOKS)
 	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
@@ -94,7 +92,9 @@ define C_PROGRAM_template
 	$(call quiet-command, $(CC) $(LDFLAGS) -o $$@ $$+,BIN,$$@)
 endef
 
+ifeq (,$(findstring clean,$(MAKECMDGOALS)))
 -include .ocamldep.make
+endif
 
 $(foreach lib,$(OCAML_LIBRARY),$(eval $(call OCAML_LIBRARY_template,$(lib))))
 $(foreach lib,$(OCAML_NOC_LIBRARY),$(eval $(call OCAML_NOC_LIBRARY_template,$(lib))))
-- 
2.34.1


