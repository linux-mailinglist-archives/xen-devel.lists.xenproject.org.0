Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C944B26BD9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081984.1441990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaRD-0002G5-9L; Thu, 14 Aug 2025 16:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081984.1441990; Thu, 14 Aug 2025 16:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaRD-0002DZ-4H; Thu, 14 Aug 2025 16:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1081984;
 Thu, 14 Aug 2025 16:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umaRC-0000md-BL
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:04:22 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5741821a-7928-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 18:04:22 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0990b2so7380825e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 09:04:22 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c6bc93fsm26178975e9.2.2025.08.14.09.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:04:05 -0700 (PDT)
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
X-Inumbo-ID: 5741821a-7928-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755187461; x=1755792261; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/aE4/XzPV59CJPrm3Gg+uv4SbRmBDmotMngXyRqJUQ=;
        b=E7+134YxY9FOURXY/MR9yTGDiYdJrEEt/Nqnx04HlTmbE6U+8uXXBS52kvgXWuJbGx
         Hx+55Y7FYtUFq9j4Sf4xoM8XM8HbrwmhJOkxjtcncVY5HU96W603zaBQW93nhWuR4+ny
         pBwNVKdlGIWuqLEs5nYGR6YOk7dCpTQZSFfZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187461; x=1755792261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/aE4/XzPV59CJPrm3Gg+uv4SbRmBDmotMngXyRqJUQ=;
        b=CG5FNWvYBpgicw6htT2c1PeFBTlBUF2KS8ch9UzppJq/s7fJ63dfflfebEeIk7aATh
         Bipq+LTFhYEaOmz7GDXWol/gTqC//ccfo019rRTzsoao8B120VZMWhMX/rHF1cHG3HPH
         3hBTpqPjgwGGe5aTeSUtDjLqcNvyeFXv3hkSD7dS+YLRgUa3dtFhejnT/AIaDRL/nWFA
         chANtyPSTVO6hY24zrBVk2rjieEJVCJc2Es02xSF3fZjJxfyRHaAggMIyhn3KXkB1o9b
         6Ev9jCI8Cj5qazuZi6qG3LI6xRVp47vED/6HobED1OpzyBpKFaPgrDijgnjaAILoIhQn
         tb0w==
X-Gm-Message-State: AOJu0YzgMxfOAY06hvWnFvR48skBKCKEpnp9KISkdEOX+mKPzHILsB2x
	7702WbJpkgWWd87UMlPfD8L+mMRdflmgioLHsQYAGwUM/l+2HUiYakdpFeZ4jNym8cWdiU6oDWl
	OEsrU
X-Gm-Gg: ASbGncsu9e/WRixiw3b0gwqMOwLDE/Jt24HYrtyvcpJdCqPLVv9ebOPaY15OYXb/rSf
	Bc+lpQGgZ20ovmBA8J6Im5wQ8BwS0j+G9eEGlIG+iNl0j7JjFJ4fUz72EeWCAyVCrSYzVTR4lhA
	j7V/IFXTvHE+QLvNhe67YXWw5ys5lRpJ06APtnKpIfvI4GQb3ZG5LF0O+TIuOsM9qMpUoZ5snAY
	83qCh4SlypR/pRwyeJW/5+Xno0F5pJ9HaEg4CkhJcDj1ka3RkbwDr0BjkOi5N6ZE/gN1+q8s3VM
	cyJC+2yazDKQ2lHbZhd4S1CkTUnwS8CtC5p6v3BflNggPyEAWxAksAmB80tjd8ZclC/y1QSVR8d
	PtDIClP4FDfQGTNAfDPKMyxwOYLBXx+aRUOFbRjASmuXKtKes2wdV2JdAJcOwZTEKWw==
X-Google-Smtp-Source: AGHT+IHmbaGVo5yru/zbIYz4g1CR9qPgenXRGr/YGkkrLd01NhwlOqiZstHfexkqrTx+XqeNe3W9Pg==
X-Received: by 2002:a05:600c:b90:b0:458:bda4:43df with SMTP id 5b1f17b1804b1-45a1b646db2mr37167305e9.17.1755187445701;
        Thu, 14 Aug 2025 09:04:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@amd.com,
	Jiqian.Chen@amd.com,
	jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/5] xen/vpci: purge BAR rangeset contents before use
Date: Thu, 14 Aug 2025 18:03:54 +0200
Message-ID: <20250814160358.95543-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814160358.95543-1-roger.pau@citrix.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's possible for the BAR rangeset to contain stale data when used in
modify_bars() if previous calls to modify_bars() resulted in errors.

Fix by always purging the rangeset before usage, thus getting rid of any
previous stale data.  Remove the ASSERT that checked whether the rangeset
was empty, it was incorrect.

Fixes: 52ebde3cfae2 ('vpci/header: program p2m with guest BAR view')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 469f4977441a..b9756b364300 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -338,6 +338,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         if ( !bar->mem )
             continue;
 
+        /*
+         * Empty before use, previous failures might have left stale data in
+         * the rangeset.
+         */
+        rangeset_purge(bar->mem);
+
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
@@ -353,8 +359,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        ASSERT(rangeset_is_empty(bar->mem));
-
         /*
          * Make sure that the guest set address has the same page offset
          * as the physical address on the host or otherwise things won't work as
-- 
2.49.0


