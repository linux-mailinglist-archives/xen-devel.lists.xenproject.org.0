Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E29871C3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805304.1216376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwa-0003ys-Ie; Thu, 26 Sep 2024 10:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805304.1216376; Thu, 26 Sep 2024 10:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwa-0003vY-FW; Thu, 26 Sep 2024 10:41:56 +0000
Received: by outflank-mailman (input) for mailman id 805304;
 Thu, 26 Sep 2024 10:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bue4=QY=flex--ardb.bounces.google.com=3cTr1ZggKCfgfwig+lnylttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1stlwZ-0003PD-9I
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:41:55 +0000
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com
 [2a00:1450:4864:20::44a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f27938ae-7bf3-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:41:54 +0200 (CEST)
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-37ccc188d6aso477081f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:41:54 -0700 (PDT)
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
X-Inumbo-ID: f27938ae-7bf3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347314; x=1727952114; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGUWykkQN0qvnmtiNNnHPsRB647HBGhIOvWdjI4gnIE=;
        b=4r2BqoD67WQ099RItlQm64rEL1/F10o8akgCrpJ3+XWDWyn5RrYk5yQbXlD/775o2K
         OYaOVkAeSJFerW/e1+SeDKZXKB+c54nIUDcC1Flw98cp0YPVZRtnAjRp8udaELjLQoVA
         Jwz6iPt6fZFNKTAc9FKZXx4H0T3id5LRafyPDExK7R3ejKJzYwEuIDIpfs8eCE4zEtyk
         a3lXP3RpTtjliBNYoD8uL/41VUCnejNH0IytIuzIjKNED5H7C+H3IdBVNfoQONE7+WPi
         EyUJadXmRNDX8QkGgqkwh+YpBG3hjTwkzh6vC1jFIsUO57wZiAhdIftSe25bp9+qqwKr
         3u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347314; x=1727952114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGUWykkQN0qvnmtiNNnHPsRB647HBGhIOvWdjI4gnIE=;
        b=ArSpRGNnRVPcWMr+FoH5HuwjXp5HFmoMvFZhoeKUwbftLQN+oGj6XpUXYhrQncX3Ir
         kl0HFNPZndVsXbRxJFLlzmGiWWjQ1MV+daftBRFY94Add78Zh7w3LbN8p2ZEi4ko+zjd
         QP/IZ28/nHYwbEaItvd75Z5+/vLE3I0XhBE9x5NIP+Pi0zyk2bwg/QzKcrTQc7T14exb
         3NvncXZX7WabCAwVocGGbbDT2lxRRGgMeIsAdn2Ow1ET2jKRkQl0RNffOIve0lNcuOrn
         jJNsDN/Ro9MfAjMuC/1RJl089XNEwJ6rrX95SPUEw+lAl69SC1bLMK49iE9tFq0BHGrJ
         W75Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWeqYPEgVkRUEb27sZCQEAy52xNNHh8Og08EUIDXNs9B1LeUU5SdWxVyDGmUzCbsxq91bQ0kUTNIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy18Mqq/gwvG7bzuBQB7Y381yQBnAtjirH40mk1WTmh/U4OrzxA
	VD6YdyL25rYf27j6jQGjoOOjZCg2mUj88GzbfgMkqvIeHGda+J0mpmEJPqJ3msQUAKcbZg==
X-Google-Smtp-Source: AGHT+IEW8daEir8doMTYKMTvqxc57QBSWijUw3aucG3twtEOjb20bOmmyd2zxDXhxhBNFQdIHerVpIzL
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:adf:f5cc:0:b0:374:ba5c:d59 with SMTP id
 ffacd0b85a97d-37cc22c28c9mr3799f8f.0.1727347313937; Thu, 26 Sep 2024 03:41:53
 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:41:16 +0200
In-Reply-To: <20240926104113.80146-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=738; i=ardb@kernel.org;
 h=from:subject; bh=duJbwDYusVICSqLA5fZPaN2Y/gts1cbjl01DSFcZijg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2rle/zunAFTQ8uo0anZz3lB82OHO8LP3L+2lmd1bueh
 fjq+tl0lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIk8O8XwT5P3of6psH2Nt6wt
 14S9Tru+QX3jdqMNE9bvFVnYGfCEdT0jwxaP/S0RDQ9cdv5L82B1q3ql4Zzkajwh8LCzSIzBPTM mXgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926104113.80146-9-ardb+git@google.com>
Subject: [PATCH 2/5] x86/pvh: Use correct size value in GDT descriptor
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The size field in a GDT descriptor is offset by 1, so subtract 1 from
the calculated range.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 98ddd552885a..f09e0fb832e4 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -223,7 +223,7 @@ SYM_CODE_END(pvh_start_xen)
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
-	.word gdt_end - gdt_start
+	.word gdt_end - gdt_start - 1
 	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
 	.word 0
 SYM_DATA_END(gdt)
-- 
2.46.0.792.g87dc391469-goog


