Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE200926BA5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 00:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753337.1161574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8aL-00014h-Dn; Wed, 03 Jul 2024 22:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753337.1161574; Wed, 03 Jul 2024 22:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8aL-00011X-Aw; Wed, 03 Jul 2024 22:36:21 +0000
Received: by outflank-mailman (input) for mailman id 753337;
 Wed, 03 Jul 2024 22:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP8aK-00011R-Cu
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 22:36:20 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b403a3-398c-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 00:36:17 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a727d9dd367so743866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 15:36:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf6336csm544875166b.70.2024.07.03.15.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 15:36:14 -0700 (PDT)
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
X-Inumbo-ID: a9b403a3-398c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720046176; x=1720650976; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qartpj94QO9IIjwcNKztD+etg1loQQXr0SUDN4EHJJo=;
        b=sMi7d7TMyGg8Ml2jqL8aEGOLzFmiIMAvy0zBXfsw3qVG0epmOFnkKB/77gcZovnMss
         wksxJTeQsyHBgWAY2+u4IImQ1KRVPKrKkEaME6RDED9sMh/TyTN9drZ/RkshzwTUrLID
         Kbutj2KqBfSaAeEXxg/Lpn/qtzguiuECCk3gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720046176; x=1720650976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qartpj94QO9IIjwcNKztD+etg1loQQXr0SUDN4EHJJo=;
        b=adevRxh2zl5bEJ2UqRs5+xrA3BlvF6leTYQ0AiZ41bDXfzlu9dq1cum71vAa+3nx9R
         a8UjQw9jHaPVtXJx5e+ZVgUugprPxumrdlImcvlxZ3v7YwoCQpc0rPFpURrajLISJRD0
         PDNMp7yGtCqmMupFBCrvm8UKupifGC5v4rK/GB4EJ7PDc/QBRpR9fRjOB4GlLE09W+tg
         qqXYIHW3OR9vW3HtgL4A4Fo0Lxb5nXn29E2kK2ai5yEm6xJ+2zEgvKTvUQsilW2noC/9
         uC3HfobSRVuhl+c1motvmYhI+m0wXKqT2h+2BF8/wTbx0c2Fco7bOuDwgs4d2pXQzAf2
         vbqw==
X-Gm-Message-State: AOJu0YxdalsDGME5eUG2HK5k9R5/QrSTEjRlgLYSaq4LkvGrDXn3Xo3u
	CuNkp3gklgjseldpMDWaJKuQUCUEiNHFT+MLkWujS4yz2rWih7utI47OWP3YKs5jM7GbjkkjJyj
	j
X-Google-Smtp-Source: AGHT+IExX5Nv+LsC1H8bO2T30R1oXX3JKM+1DztHjEm/4lrMkXRq0laGW2wrpRu5eTpZS/ReS8DqOA==
X-Received: by 2002:a17:907:9407:b0:a6f:bf0f:4209 with SMTP id a640c23a62f3a-a7514475b49mr1121407666b.42.1720046175886;
        Wed, 03 Jul 2024 15:36:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] tools/xs-clients: Fix `make clean` rule
Date: Wed,  3 Jul 2024 23:36:11 +0100
Message-Id: <20240703223611.1754927-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to the split, "the clients" used tools/xenstored/Makefile.common whose
clean rule includes *.o whereas after the split, the removal of *.o was lost
by virtule of not including Makefile.common any more.

This is the bug behind the following build error:

  make[2]: Entering directory '/local/xen.git/tools/xs-clients'
  gcc     xenstore_client.o    (snip)
  /usr/bin/ld: xenstore_client.o: relocation R_X86_64_32S against `.rodata' can not be used when making a PIE object; recompile with -fPIE
  /usr/bin/ld: failed to set dynamic section sizes: bad value
  collect2: error: ld returned 1 exit status
  make[2]: *** [Makefile:35: xenstore] Error 1

which was caused by `make clean` not properly cleaning the tree as I was
swapping between various build containers.

Switch to a plain single-colon clean rule.

Fixes: 5c293058b130 ("tools/xenstore: move xenstored sources into dedicated directory")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.19.  It's a minor build system corner case, but is also very safe too.

Ultimately it needs backporting to 4.18 too.
---
 tools/xs-clients/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xs-clients/Makefile b/tools/xs-clients/Makefile
index 4e78d365e0df..5415c441920a 100644
--- a/tools/xs-clients/Makefile
+++ b/tools/xs-clients/Makefile
@@ -38,8 +38,8 @@ xenstore-control: xenstore_control.o
 	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
 .PHONY: clean
-clean::
-	$(RM) $(TARGETS) $(DEPS_RM)
+clean:
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
2.39.2


