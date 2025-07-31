Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AF0B16E9E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065154.1430538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaC-0001J1-Vp; Thu, 31 Jul 2025 09:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065154.1430538; Thu, 31 Jul 2025 09:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaC-0001CH-PN; Thu, 31 Jul 2025 09:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1065154;
 Thu, 31 Jul 2025 09:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPaB-0000Jb-3E
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:15 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae68d25c-6df0-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:28:13 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4535fc0485dso1331795e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:13 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:12 -0700 (PDT)
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
X-Inumbo-ID: ae68d25c-6df0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954093; x=1754558893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=SjLvpVHtRd18lhE9Txlxga6WzTJxYWCaHdYIS554D4rS1DZQtXKkm3vYWjLnH8lHYP
         A/7VJKvXciJaPPMBxZHt5APMXdYn4QtoZuzyWWj8Tp1xJ/2SLxDlMLu+tg/evz584qRq
         YUP3zHOfQ/DaKxBBmW5SSWSNXlnK0BoClo3uBNypKAwiwsc+tfRhVuVrpxR+s/+On5qU
         Gna2KciGbTArZadJPiMvpSGye/pasSgbBv5S9dZtdPSHEjy3MeGNWdglVWpKaAxw055c
         DRpF1BOIaKDP8+1nkn0/NDihQGu/vlMGw+1ot7UpHp6virCQc7/XjZa5NG/JWPHf2lvA
         /B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954093; x=1754558893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=FF0//g/WBvhErcG1cb8euvIqxc7mzwLh6wb26T7NkIe5SeYvBTdNRy1hoY69ASZZlj
         yv9LwSIJsHrYU6SmXYvdXIyuoGAKHpRlo6Z689i8sMa6RcDb6RlMkPM7W0YLGkwZxOCv
         wwA2y1dgvnMonEWG/swXGtVbbzU60WEA28PZEjqzMPmA2JZ7ecAn2DA0bI8YTFZkGuEq
         Xys1ajrHgrtT00aZkX2HSZchVf0c3iapB9MO6PjMiydz8HA/7bybGLN8Wb06udN3ILne
         UZ0zqsqAygyTDafmbjWsWCFqAqEgWwDQzZok4oqdqsiWy/G2uSPnzvaE95Fy6Tu0JkV2
         Y28A==
X-Gm-Message-State: AOJu0YwOL7RT+f35uo6wi0K9ZgBSSrSOFgZw+D4B8I/1nl8sOmqKPBd+
	OPr3vO86blODBTvHcFTVTBaQSUuShUq6BdlmHe8crerBUBOMHic7x3aoEv9Vwpfe
X-Gm-Gg: ASbGncvb7nfmFpxM6lSeTV7UcLXCYvjGQfJkvuH6cbQW8hiMR5RjPleMwkYwZ6WdCkV
	nD+PAgtd/ErSrvJAedS8O37cHOjcM9EQDsYIzkZWd4kpynIwaWuUdfStDvbdhHUdQPfwGAyJKGL
	frbv8AinG9krhv84ynTheFHuiegW6ZgzH5HdmU3yMSwNrPmGhxjKqLf9KL7RYYHtkVZU9cymL4B
	ftAzc8ygwLIrIGLSzpY5JNL2FFK6sWn4eVxxTJMCk8tbGwvzNnCoReHT35u2d4Z+JNACvEKAQpZ
	Aktnek02S2NJIEwaYy7c8QOTEPHp4JkQ9B9JW68ywO5Z8Y1g0C0p0CDUb40HPgouvFe/LNn0Jdr
	oRUOILwHSABEqiCXONBAcw3OFBQryeDz7h7VDBsbv6MvTscSgzLExoV89oYFsManEK085kgPiaC
	au6u5hgwjeD8jNGYlkurBITA==
X-Google-Smtp-Source: AGHT+IEn8oOmYQANRYTAYZUH6CiTUYdF7AujZG5AvgjD6VIU1gHdiyRGW9wGYbdQaIEriGhMgugt0w==
X-Received: by 2002:a05:600c:3b95:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-45892d05354mr21963705e9.3.1753954092602;
        Thu, 31 Jul 2025 02:28:12 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v12 5/6] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Thu, 31 Jul 2025 09:28:00 +0000
Message-Id: <b568f539ef26242def3c4aa2edf1683532213f42.1753953832.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
References: <cover.1753953832.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 155ea1f79f..872e97999c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -739,8 +739,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }
 
         if ( config->altp2m.nr > MAX_NR_ALTP2M )
-- 
2.34.1


