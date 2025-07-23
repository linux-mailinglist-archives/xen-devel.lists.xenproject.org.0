Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4643FB0F6DF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054390.1423149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebGp-00014R-Oa; Wed, 23 Jul 2025 15:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054390.1423149; Wed, 23 Jul 2025 15:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebGp-00012z-Lq; Wed, 23 Jul 2025 15:20:39 +0000
Received: by outflank-mailman (input) for mailman id 1054390;
 Wed, 23 Jul 2025 15:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT0Q=2E=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uebGo-00012r-4H
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:20:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9575255c-67d8-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 17:20:36 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d54214adso49861125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:20:36 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45863a35298sm37529965e9.1.2025.07.23.08.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 08:20:35 -0700 (PDT)
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
X-Inumbo-ID: 9575255c-67d8-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753284036; x=1753888836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v20QHRO0/6mgl9U16FWQv7Foym9dNjJiEK2wUGm+zEE=;
        b=jp+724KpH1HivGnqzEuvOP+ECAFC7A2bN7M/h8jV38Rea0Crz8QsN5oYG55ntFvbNk
         a0sxaJ2m8EBebt6045eyqmsdWpjvt30j38+1szuHl2WtBoftD4rGnTR1x760kRRndfuQ
         8phK3Ce85dbabZvNST+u4u3b6U5fMGGRXaq2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753284036; x=1753888836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v20QHRO0/6mgl9U16FWQv7Foym9dNjJiEK2wUGm+zEE=;
        b=AlcA47zL3PwdOgKbhc0KP331haMTvXhi/dY1HrxXym8wgObEmTNxF0qhN+1ffmpOsF
         l0/1Usy1xUWcuSt0doU9Hly6wOzbGE7zuF+GCBpqGjI8oi2fXPOazZx0kJxrKxplPwRe
         hEH+rultcLJT3Vx6uaka3nHNOSYGn7ZZlkt0s5e3/rFLZFvkpWJwbVxiGFJO73esZlA7
         6zgbiF+VdWO1VtLOC3h4U1+m6nGw7ti/g9VO0OxUpTd2kIKoQDyldyjAlRChuc/ECB9/
         Pk69gTpOTcNPBOlAfLd4sBEagyNnlOo8wSEavMCWK6VSCHZubFibSUcr1ffcoyhT7oBn
         nPmA==
X-Gm-Message-State: AOJu0Yw6h1nFfJaoxrLYBr203L8djUIbf4+OIS3eoSEIPnKZ6wjWZOJO
	Hf+LyUvks40cs3mytUyPOt2qXIiU+aT2/1TTCECmeNscMKieV57yXeth1McMNJr0hJfhR9bY9ZG
	8Z4WT
X-Gm-Gg: ASbGnct+UmDRz0HcZ+qVEbjn+G5mjOqr6EBe5TLJyVE97srK0ABf3lPofSAJABMdWfI
	iNLmm56/iwdsqqzROGK416oF3IiB6t9/tw/t2MuVcFovRc6mtUNWszdTg6KGRxO/aAGim8BnqTp
	liiWJXLGtzitfGskvNdG78EhkYVHeZj7AD8Y7VbCfY8Ke/sV4XbwLIGCGwl7LtD8PLK9M/VZLZi
	jhE4CjxtrqAsOG4VHLTBZXcy2jN7soiJR+uITwUhThYDSwMO2utGUpWUdSiMgFanAcPndGRE69W
	rXP05vImgYVjnREcji7SsQvE4+Qp06spIn0IWKSNPoi3BN4vOy6YQTxH1R/AhNYQ06Ki+uJI5mf
	bA2dedHIqTOvHj07y/eMaMiJQosrIXApCg5ypVtpytfHplhBdny/dGouWydVYzK5HL116qRqTpp
	Ua
X-Google-Smtp-Source: AGHT+IHOfntZx3363mRbPRiJ16WCd02gGJC9I3G3nuM1MoWonh1p/rqL7Q0CUOnXcEBMGtKjtVmPbg==
X-Received: by 2002:a05:600c:a4f:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-45868d1bd7bmr29433535e9.19.1753284035704;
        Wed, 23 Jul 2025 08:20:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] x86/hvmloader: adjust strtoll() to parse hex numbers without 0x prefix
Date: Wed, 23 Jul 2025 17:19:49 +0200
Message-ID: <20250723151949.89400-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current strtoll() implementation in hvmloader requires hex number to be
prefixed with 0x, otherwise strtoll() won't parse them correctly even when
calling the function with base == 16.

Fix this by not unconditionally setting the base to 10 when the string is
not 0 prefixed, this also allows parsing octal numbers not 0 prefixed.
While there also handle '0X' as a valid hex number prefix, together with
'0x'.

No functional change intended to the existing call sites.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Noticed this oddity while looking at something else - I don't really have a
use case for such parsing, but I think it would be better to get this fixed
in case it's needed in the future.
---
 tools/firmware/hvmloader/util.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 31b4411db7b4..e65134268189 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -206,20 +206,18 @@ strtoll(const char *s, char **end, int base)
 
     if ( *s == '\0' ) goto out;
 
-    if ( *s == '0' ) {
+    if ( (base == 0 || base == 16) && *s == '0' ) {
         s++;
         if ( *s == '\0' ) goto out;
 
-        if ( *s == 'x' ) {
-            if ( base != 0 && base != 16) goto out;
+        if ( *s == 'x' || *s == 'X' ) {
             base = 16;
             s++;
         } else {
-            if ( base != 0 && base != 8) goto out;
+            if ( base != 0 ) goto out;
             base = 8;
         }
-    } else {
-        if (base != 0 && base != 10) goto out;
+    } else if ( base == 0 ) {
         base = 10;
     }
 
-- 
2.49.0


