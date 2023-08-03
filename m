Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9DB76F413
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 22:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576602.902918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRf4E-0005ON-Lb; Thu, 03 Aug 2023 20:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576602.902918; Thu, 03 Aug 2023 20:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRf4E-0005MO-Ir; Thu, 03 Aug 2023 20:37:06 +0000
Received: by outflank-mailman (input) for mailman id 576602;
 Thu, 03 Aug 2023 20:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1P5=DU=citrix.com=prvs=57264c000=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRf4D-0005MI-6s
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 20:37:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f40c026-323d-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 22:37:02 +0200 (CEST)
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
X-Inumbo-ID: 7f40c026-323d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691095021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qo2z+FkjxDwHPIt1ZvN4XJLzKkB6Iynwj4/otjK3SjQ=;
  b=FGe2wWDDOQ15hZqamzvae3bZK6XB1/9STd+Ar+24PTtNZwsylEAhTka3
   VCfBvx8+Er8hu1yJUcK9wA4Ke5ITASvwlCkAx1pt+K6uh1eaTEYwQyMBx
   U2RMT9Knr+Le4nULmLDrwvnxcd7gJRkQm8UNacXFeVZK9aPpP0Qi2acJe
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118869900
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:roLjjq7yYmdf+K0AgrqTTAxRtITHchMFZxGqfqrLsTDasY5as4F+v
 mEZUWjUPa7YZ2Sgetp3b4XkpBkOu5bcyoRqGwNsq3phHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAT5weF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 OcBFhI3Yh2/ocG7nrS7QfIzl/hyFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/I9
 jyXrjyhav0cHIyG2ASr2G6Iv+/OryelQNlOD5bo1fE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OcpQRQ62
 1nPmMnmbRRtrbmURHS15rqS6zSoNkA9D0UPeCsFRgst+MT4rcc4iRenZtRsCqmulfXuBCr9h
 TuNqUAWgrwJiMcR2qaT/FbZgimtrJzEUg404ArMWmuvqAh+YeaNa5Sz7FnH7d5JNIuDUkSap
 38AhtSf6+YVS5qKkUSlQuwLEKu4+vWtPzjVgFopFJ4knxym+2SiZpxX+DFzPgF2dM0AcCXqS
 EDWsAJVopRUOROXgbRfOtzrTZ5wlO65SIqjD6qPBjZTXnRvXB6c5R9MX0Kd40bOnRYqkaokZ
 oanIP/5WB72Fp9b5DaxQu4c15oiySY/2X7fSPjH8vi37VaNTCXLEOlYaTNiesh8tfrZ+1uNr
 76zIuPQk31ivPvCjj47GGL5BXQDNjAFCJ//sKS7ncbTc1M9SAnN5xI8qI7NmrCJfYwPzo8kH
 VnnACe0LWbCaYXvc1niV5yaQOqHsWxDhXw6JzcwGl2jxmIuZ42ihI9GKcpuJel4qr0+laAvJ
 xXgRylnKq0eIgkrBhxHNcWtxGCcXEvDaf2y09qNP2FkIs8Iq/3h8d74ZAr/nBTi/QLu3fbSV
 4aIj1uBKbJaHlQKMSojQK73p79HlSRHyb0asoqhCoU7RXgAB6Aze3Os0qFtcpFTQfgBrxPDv
 zur7d4jjbGli+cIHBPh3Mhoc6/B/zNCI3dn
IronPort-HdrOrdr: A9a23:6N+J3aMcfLuFTMBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:fVn4gGADvaz+UJv6Ezh87XA2IMwoTlv+wSnWI0SjVndVGYTAHA==
X-Talos-MUID: 9a23:55QuTAZxnFUv1uBT5yb9uh9IKONR46WcDB4VyskdkJmnOnkl
X-IronPort-AV: E=Sophos;i="6.01,253,1684814400"; 
   d="scan'208";a="118869900"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
	"Daniel Smith" <dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
Subject: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Date: Thu, 3 Aug 2023 21:36:50 +0100
Message-ID: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The opensuse-tumbleweed build jobs currently fail with:

  /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In function 'rsa_private':
  /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
     56 |   if (!key->p || !key->q || !key->u) {
        |       ^
  In file included from /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
  /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
     28 |   tpm_bn_t p;
        |            ^

This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
OpenSSL BIGNUM flavour).  The author was probably meaning to do value checks,
but that's not what the code does.

Adjust it to compile.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>

While I've confirmed this to fix the build issue:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430

I'm -1 overall to the change, and would prefer to disable vtpm-stubdom
entirely.

It's TPM 1.2 only, using decades-old libs, and some stuff in the upstream
https://github.com/PeterHuewe/tpm-emulator (which is still abandaonded as of
2018) is just as concerning as the basic error here in rsa_private().

vtpm-stubdom isn't credibly component of a Xen system, and we're wasting loads
of CI cycles testing it...
---
 stubdom/Makefile                 |  1 +
 stubdom/vtpm-tpm_bn_t-addr.patch | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 stubdom/vtpm-tpm_bn_t-addr.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index a21e1c3fa3a8..d5fb354e7e37 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -243,6 +243,7 @@ tpm_emulator-$(XEN_TARGET_ARCH): tpm_emulator-$(TPMEMU_VERSION).tar.gz
 	patch -d $@ -p1 < vtpm_extern.patch
 	patch -d $@ -p1 < vtpm-microsecond-duration.patch
 	patch -d $@ -p1 < vtpm-command-duration.patch
+	patch -d $@ -p1 < vtpm-tpm_bn_t-addr.patch
 	mkdir $@/build
 	cd $@/build; CC=${CC} $(CMAKE) .. -DCMAKE_C_FLAGS:STRING="-std=c99 -DTPM_NO_EXTERN $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -Wno-declaration-after-statement"
 	touch $@
diff --git a/stubdom/vtpm-tpm_bn_t-addr.patch b/stubdom/vtpm-tpm_bn_t-addr.patch
new file mode 100644
index 000000000000..53172ae1c244
--- /dev/null
+++ b/stubdom/vtpm-tpm_bn_t-addr.patch
@@ -0,0 +1,18 @@
+All tpm_bn_t's are a 1-element array of one form or another, meaning the code
+below is tautological and triggers -Werror=address.
+
+diff -ru tpm_emulator-x86_64.orig/crypto/rsa.c tpm_emulator-x86_64/crypto/rsa.c
+--- tpm_emulator-x86_64.orig/crypto/rsa.c	2011-12-20 18:30:06.000000000 +0000
++++ tpm_emulator-x86_64/crypto/rsa.c	2023-08-03 20:44:17.379166284 +0100
+@@ -53,10 +53,7 @@
+   tpm_bn_init2(c, key->size);
+   tpm_bn_import(p, in_len, 1, in);
+ 
+-  if (!key->p || !key->q || !key->u) {
+-    /* c = p ^ d mod n */
+-    tpm_bn_powm(c, p, key->d, key->n);
+-  } else {
++  {
+     tpm_bn_init2(m1, key->size / 2);
+     tpm_bn_init2(m2, key->size / 2);
+     tpm_bn_init2(h, key->size);

base-commit: 092cae024ab6cd9bd5788eb6ca3ae1a05e796c0a
-- 
2.30.2


