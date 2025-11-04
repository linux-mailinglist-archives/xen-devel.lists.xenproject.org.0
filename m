Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F402C322BD
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 17:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155837.1485218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGKL1-0006gs-PE; Tue, 04 Nov 2025 16:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155837.1485218; Tue, 04 Nov 2025 16:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGKL1-0006fD-Lz; Tue, 04 Nov 2025 16:56:55 +0000
Received: by outflank-mailman (input) for mailman id 1155837;
 Tue, 04 Nov 2025 16:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vGKL0-0006f7-6Y
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 16:56:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 403e6aae-b99f-11f0-980a-7dc792cee155;
 Tue, 04 Nov 2025 17:56:48 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4775a52e045so1715265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Nov 2025 08:56:48 -0800 (PST)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f5be4sm5372270f8f.31.2025.11.04.08.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:56:46 -0800 (PST)
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
X-Inumbo-ID: 403e6aae-b99f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1762275407; x=1762880207; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHL3jDnrijy5yRgmLMMloMQopIIQXeenL/hLlkisGwk=;
        b=pnP5Zp3fCgxlVVnNcCLMtUXzO2UYEAY21PJtqBSMyyvVpPfPnFVOgvu2lABXOpKQpI
         eBS2DyRPUluoOEDllA2TwSaBMyLQOcGt4R67DzBE/HBJimyZGYlFsg54bUohbXqAUekF
         twdDbmYWk3+dBEvsLybVqsc/XK0j/nb0kuFK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762275407; x=1762880207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHL3jDnrijy5yRgmLMMloMQopIIQXeenL/hLlkisGwk=;
        b=IvPI7FiArg98+hGaHcc2GVZlMaATSSbeDXBprDc3ogEqGeXhDPyOF+JyniH97jENFB
         IFuS6id8HHbt74mRsNnWPmwHvQt5tSBO4eKCUlZ2uqZp0BKSkcBAtNrZoIYCApLcrZ90
         FpkhcG2ihOdyoCfn5S/pmezSI+ye69H5BqMIo318rYe0k4ZVJLMQWdVZvfuW4UQmmJfl
         IFZYnwK7u0SNaoIS2dbk1L23ncc7OjqGgDSKTESrtcpo7hwUnMH1p5/xOewfMUkwP+tK
         eAntEvcNzKUxKq+4NsjfVPCGIERNRGhquvUBxp2FIHDmj574E94meU3Ei7WyLSaGicfC
         NiQw==
X-Gm-Message-State: AOJu0Yz9Yinx1c5TjUnLaXve01eC97YmC0P53KtLTMG24tRn3bOtALrF
	+ch/4hCeNd4PBR4y3btwVT5ch7ofMaVFW+1bgHW8NoW7WcVu2Rd+fFdKuAOednpwkgfSULYyO0D
	TuIcQDq4=
X-Gm-Gg: ASbGncu/fz0QGkX2r+FRhXfVVOahZRezB+toiTdxQgLwOHQaMVvMKlxRioj4WAZGfNy
	Bp0FNkIjHt82laLgJZCZuqeTT+BSsUG3hxlzwuB9bCFL9evirATpHW1lgW5qxg7we0Tre7qSS5k
	vNPkQrVvOsYULkYXhxhz+HF0Wz8tkDE9fre7wyRcMBuBLJuhQ03eblNMXtidUXVxKeXdDZDxswt
	EmFyZ1kwS/01hfi/Fsi16bKevH9Yp7sCSlqMxuBU3tJVPGZkk47pWOvth0LXVXTkQiG+54dA4QR
	9kow19WOlA4nPMH2s6YtvIbGUp8wx8M4VvCLxciHH3MAm+NcdSeBaOGMez4CB2NLxki2/HsZxfr
	OuZiB5sLV+IAblK0xq+vm3Oh6YbKZ5bRjohxaysVrfCFNDEHI2IBTvsu75ZuLSjhD79IfeKt4O7
	ch1EDZZ8Kw6ApEcgVrybdUELZofOBqV8riqw0zFDipcGRPls0mtm8=
X-Google-Smtp-Source: AGHT+IHocYewmJrm0tCGAGe5t63rHYN1yb9F9ouw3ks4g052K2chrbt580WbN7ehYhqXVuAX9e2oyQ==
X-Received: by 2002:a05:600c:a00b:b0:46c:adf8:c845 with SMTP id 5b1f17b1804b1-4775cdc705amr107535e9.16.1762275406921;
        Tue, 04 Nov 2025 08:56:46 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Pau Ruiz Safont <pau.safont@vates.tech>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] ocaml/xsd_glue: Fix dynamic linking configuration
Date: Tue,  4 Nov 2025 16:56:44 +0000
Message-Id: <20251104165644.4011663-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The latest oxenstored from Xapi-project fails to start up:

  launch-xenstore[1201]: Starting /usr/sbin/oxenstored...
  launch-xenstore[1222]: Fatal error: exception
    Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll
    \"Failure(\\\"/usr/libexec/xen//ocaml/xsd_glue/xenctrl_plugin/domain_getinfo_v1.cmxs:
    undefined symbol: xc_domain_getinfo_single\\\")\")")

This is because domain_getinfo_v1.cmxs isn't dynamically linked correctly.
Fill in the correct variable, and remove the xen prefix from xenctrl.

Reported-by: Edwin Török <edwin.torok@citrix.com>
Suggested-by: Edwin Török <edwin.torok@citrix.com>
Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Pau Ruiz Safont <pau.safont@vates.tech>
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.21.  Without this, we can't proceed with deprecate oxenstored.

This wants backporting to 4.20 too.

Previously this was hidden by oxenstored unexpectedly statically linking
libxenctrl via the ocaml-evtchn bindings, and became exposed when the bindings
were moved to use libxenevtchn.
---
 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
index 4be1feacfe24..6356159020c1 100644
--- a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
@@ -11,7 +11,7 @@ OBJS = domain_getinfo_v1
 INTF = $(foreach obj, $(OBJS),$(obj).cmi)
 LIBS = domain_getinfo_v1.cmxa domain_getinfo_v1.cmxs
 
-LIBS_xsd_glue = $(call xenlibs-ldflags-ldlibs,xenctrl)
+LIBS_domain_getinfo_v1 = $(call xenlibs-ldflags-ldlibs,ctrl)
 
 all: $(INTF) $(LIBS) $(PROGRAMS)
 

base-commit: 9632ce6fe5b288244d2550cd2e619a55c5168bf8
-- 
2.39.5


