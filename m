Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A107646A27A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239544.415569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUQ-0004Wv-68; Mon, 06 Dec 2021 17:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239544.415569; Mon, 06 Dec 2021 17:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUP-0004Oj-Um; Mon, 06 Dec 2021 17:09:21 +0000
Received: by outflank-mailman (input) for mailman id 239544;
 Mon, 06 Dec 2021 17:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPp-0005ta-Md
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969b80ed-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:36 +0100 (CET)
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
X-Inumbo-ID: 969b80ed-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6gPon+8ie7LTESQTDwjPUyrtRsfp7PjeTPv6/Lsi+SE=;
  b=D/nkpGKBvWy0S5AH7X/9jNocRO0JJj6uEEiT7o6Ocs0gHcrbwvJIfbiM
   qNvmAYFXZySAVYbQPWvAipI4KJAXDlBSpzZwYHQPVHH2bswyo74gKWGmY
   tdmDetmPnBz7W9rAi9rUslwrQACsizCtQgWOTyvm50KCJGEu4GUW6ao+p
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gf5YhVC7b28sGIfSw4cd8CgRx51//9NucJR41a3vpFzAQ5ebjMsz45YTg3KawPEPor0PswS0De
 tapNmDQgAEUWdo59XVgxyJeBxNTZ/3Wyr0LqArvDOU7mC/8dVQBku1T2FJ93fRt26C2yAW4CQ8
 RP76zSV6Ab0TzgTZZOtjYFw9Fcf1pyFB0eastBC+JT6ONtupZj4aUJkAvwzJ/bVKCf9g1/+KRs
 dgl/lY8FFKtA7iHei6wJMqmTfTCKsZx+sfUA8RP1wUnxMNwdW5pim94Hn6Hijjb3/Qr/4S7Geh
 TIhkDcYh3UbRnvMtJH+Tfb/Q
X-SBRS: 5.1
X-MesageID: 59766556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0/hyE6wfouvGd0AEaHZ6t+fGwSrEfRIJ4+MujC+fZmUNrF6WrkUPm
 jZLUGqDO/2MN2Cgco92YYq290hSvJWBx4RlQABr/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wbZn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/ttx
 IRSs4aIcwp3JafIuNk5DEIDPS4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25ERQ6iDO
 pRxhTxHfDebZkRFOg8sDosjvsSxtHCmSxlUgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE8H7+GQoyL8GExHyO9XfEru7QnwvrVYQKDrq6+/V2xlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWxpmKEuRgNHcJdCeQg5CmCz6PV50CSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVmB+uaLqymKAyVLNmUGRRIgElBezda29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysgPNb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM2d3XC3270k5JGQWy2yGskTKuOGpxbEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQOcguLl7apnswOh74M4XRfK4Ey/tX1
 XCzK5nEMJrnIf4/kGreqxk1j9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgo
 ivgBxQGkQWn3hUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:UFpHP6BBoK/VnJ3lHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766556"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 48/57] libs/stat: Fix and rework perl-binding build
Date: Mon, 6 Dec 2021 17:02:31 +0000
Message-ID: <20211206170241.13165-49-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For PERL_FLAGS, use make's shell rather than a backquote.

Rather than relying on the VCS to create an empty directory for us,
we can create one before generating the *.c file for the bindings.

Make use of generic variable names to build a shared library from a
source file: CFLAGS, LDFLAGS, and LDLIBS.

To build a shared library, we need to build the source file with
"-fPIC", which was drop by 6d0ec05390 (tools: split libxenstat into
new tools/libs/stat directory).

The source file generated by swig seems to be missing many prototype for
many functions, so we need "-Wno-missing-prototypes" in order to
build it. Also, one of the prototype is deemed malformed, so we also
need "-Wno-strict-prototypes".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/stat/Makefile                  | 15 +++++++++++----
 tools/libs/stat/bindings/swig/perl/.empty |  1 -
 2 files changed, 11 insertions(+), 5 deletions(-)
 delete mode 100644 tools/libs/stat/bindings/swig/perl/.empty

diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index d5d9cb3659..962f02090b 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -94,13 +94,20 @@ uninstall: uninstall-python-bindings
 endif
 
 # Perl bindings
-PERL_FLAGS=`perl -MConfig -e 'print "$$Config{ccflags} -I$$Config{archlib}/CORE";'`
+PERL_FLAGS = $(shell $(PERL) -MConfig -e 'print "$$Config{ccflags} -I$$Config{archlib}/CORE";')
 $(PERLMOD): $(PERLSRC)
 $(PERLSRC): bindings/swig/xenstat.i
-	swig -perl $(SWIG_FLAGS) -outdir $(@D) -o $(PERLSRC) $<
-
+	mkdir -p $(@D)
+	swig -perl $(SWIG_FLAGS) -outdir $(@D) -o $@ $<
+
+$(PERLLIB): CFLAGS += -fPIC
+$(PERLLIB): CFLAGS += -Wno-strict-prototypes
+$(PERLLIB): CFLAGS += -Wno-missing-prototypes
+$(PERLLIB): LDFLAGS += $(PERL_FLAGS)
+$(PERLLIB): LDFLAGS += $(SHLIB_LDFLAGS)
+$(PERLLIB): LDLIBS := $(LDLIBS_libxenstat)
 $(PERLLIB): $(PERLSRC)
-	$(CC) $(CFLAGS) $(LDFLAGS) $(PERL_FLAGS) $(SHLIB_LDFLAGS) -lxenstat -o $@ $< $(APPEND_LDFLAGS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: perl-bindings
 perl-bindings: $(PERLLIB) $(PERLMOD)
diff --git a/tools/libs/stat/bindings/swig/perl/.empty b/tools/libs/stat/bindings/swig/perl/.empty
deleted file mode 100644
index 2a8dd4274d..0000000000
--- a/tools/libs/stat/bindings/swig/perl/.empty
+++ /dev/null
@@ -1 +0,0 @@
-This directory is empty; this file is included to prevent version control systems from removing the directory.
-- 
Anthony PERARD


