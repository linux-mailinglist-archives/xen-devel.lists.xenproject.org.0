Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8969C1A06
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 11:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832431.1247736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9LxP-0001pQ-4f; Fri, 08 Nov 2024 10:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832431.1247736; Fri, 08 Nov 2024 10:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9LxP-0001nY-1q; Fri, 08 Nov 2024 10:11:11 +0000
Received: by outflank-mailman (input) for mailman id 832431;
 Fri, 08 Nov 2024 10:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9LxN-0001nS-OE
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 10:11:09 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c323e418-9db9-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 11:11:04 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so15987865e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 02:11:04 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5b96sm58793935e9.41.2024.11.08.02.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 02:11:02 -0800 (PST)
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
X-Inumbo-ID: c323e418-9db9-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzMjNlNDE4LTlkYjktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDYwNjY0LjU1MTY5NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731060663; x=1731665463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8B59PsbjVMwBvTEdsytStB0ka/uppscNlMZreH/byk=;
        b=XWSQVQYV1vZFyT6hFx6UEq7rwodYdCZF1h9cXQJFmf65Fmm0vM8I/FfrD8qMKlW9tG
         WzdiTsemstakqz3qmA3t6Y+QzVl4/Xh/VAV9lzhfwx3SPKN9sqHaDFqjXA5NBThVaG/4
         5AfGUwzFEuxG4roCgv4ENd7jWoLKK1TSOSF08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060663; x=1731665463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8B59PsbjVMwBvTEdsytStB0ka/uppscNlMZreH/byk=;
        b=oyvyCe8v7r0L0zlktzRjlLE52oBm6He4xLtSAcDT0kI0ABFHA/FjLvXMuS66Yk8dzC
         C0+cAD5+kIWIDZFZh/VJovD3YPrjEBkPhLBFYC0HZf0jCumU7XFdjYdSunBo+4ya5b4A
         SFLj4umAPPu3qUPYUEjeMxEBrLOSumMIK9JeaA0dCaVcvtd7qRs9YwY7M1raBdNntekD
         PW2h1mGgioRSKXbXdg1vazIS9rCt3/A8cSV1VIWuvfJA6jMOR6j23ivwHAezEBCcJfKb
         6lOYjgv3j2tAQYS92u3CkTsyHskpq4tNiVdbXxWFVZGNUOT0BCcdbAB6wHFu/Un8gztT
         6pBg==
X-Gm-Message-State: AOJu0YyCVcZE3QUIKIiQHKqfRf3hMhvl8Si/x7NU0Zpqais4D4nFjVXM
	E49vePJbLwOMxbRv1faRQChf4qHfFOY4fFyrWhICGdKB5xHRSWygYf/TAPhossxddctMDb41sNt
	d
X-Google-Smtp-Source: AGHT+IFDgUFk6NAqgt+UYiaSfLOhAutazTTCUaCWVKrtb6toyoFbjsYa9X4QvE1M5LpCo6bfm5Dx1w==
X-Received: by 2002:a05:600c:3514:b0:431:52b7:a485 with SMTP id 5b1f17b1804b1-432b7508b3dmr17657385e9.19.1731060663351;
        Fri, 08 Nov 2024 02:11:03 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/Kconfig: livepatch-build-tools requires debug information
Date: Fri,  8 Nov 2024 11:10:25 +0100
Message-ID: <20241108101025.82228-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tools infrastructure used to build livepatches for Xen
(livepatch-build-tools) consumes some DWARF debug information present in
xen-syms to generate a livepatch (see livepatch-build script usage of readelf
-wi).

The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
on release builds, thus providing a default Kconfig selection that's not
suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
because it's missing the DWARF debug section.

Fix by selecting DEBUG_INFO by default if LIVEPATCH is enabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Don't use select.
---
 xen/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 07ff7eb7ba83..c4a8d86912e0 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -133,7 +133,7 @@ endif # DEBUG || EXPERT
 
 config DEBUG_INFO
 	bool "Compile Xen with debug info"
-	default DEBUG
+	default DEBUG || LIVEPATCH
 	help
 	  Say Y here if you want to build Xen with debug information. This
 	  information is needed e.g. for doing crash dump analysis of the
-- 
2.46.0


