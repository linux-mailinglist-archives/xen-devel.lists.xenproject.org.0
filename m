Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0608D327B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731688.1137336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCT-0006pu-OV; Wed, 29 May 2024 09:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731688.1137336; Wed, 29 May 2024 09:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCT-0006mj-Li; Wed, 29 May 2024 09:02:25 +0000
Received: by outflank-mailman (input) for mailman id 731688;
 Wed, 29 May 2024 09:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCR-0006YK-Vs
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:23 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b94192-1d9a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 11:02:22 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-794c3946468so117511285a.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794db33d9f8sm73278785a.134.2024.05.29.02.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:19 -0700 (PDT)
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
X-Inumbo-ID: 28b94192-1d9a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973340; x=1717578140; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erP1nWqmPbjeOHjS7xu18nxyw0w9w/NsNw7WUoH3eXI=;
        b=r+yAnjlX7xkDSh4NSiYWo7CscaXOqMbnAKxpl6+seBmvqNr8U22JRPbik/7UTILPz8
         5Yc5nrxkEF7NpfRqlSeCWi/YqXKAyZuEFnJXtCHHPPw/re/+/1LHm9u3UBfoN9npEWTQ
         pILzOwNLQlM0L6zf9Re4Qypwyc1YGqRPqtU3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973340; x=1717578140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erP1nWqmPbjeOHjS7xu18nxyw0w9w/NsNw7WUoH3eXI=;
        b=AlScULjXJ163QT54JPhrA6FwcuJKakr8yOiRO/Nl2wKG6QjLtpVmpz9L4XGC1KTMH3
         zcFB8d/LdjuHL1GAX7QXYsKcEUWsh+H5lCNBm004opt+NlGHwvnVXcLEGBMhUX1d68qn
         1ovamcA/aOAzGekx8DFPKb1rbjvA8jYlwLfjCE7xwa0GibSDIvoTVG0ANiiWZVT9Id7B
         TgKvjWOwY9wEveV9QEomCx+bIgFvENj1ovY1ZQook9WRlKZ7TjGsXUxVFLmoXDmKU1sZ
         njwzqXoYPi1eDQrZb7mzM4Smhzhenydgn4aUKDdCcVAO9Eu8cXomWSk1rzGMo4bcPgIc
         cP0g==
X-Gm-Message-State: AOJu0YyMWVcIpnped4PS5JyGXOEFrCDBgFGlzpAj/Wor+Q3dyUjM+dcC
	HDpP301R/tbMmtR1PgkL6P4NoIapXTp3vNWonKb3EsemNl4pfvI6NdHE1I+Vji3OY4kYYMirNXa
	3
X-Google-Smtp-Source: AGHT+IGtDPgZsC09q6labm0ZQe0wplK8jSwdnIGkpbIgFSfZy/tLnmb/8TjhjPNyH7JAOytWhLdvRg==
X-Received: by 2002:a05:620a:394d:b0:794:a993:711e with SMTP id af79cd13be357-794ab060b3cmr1999790485a.16.1716973340284;
        Wed, 29 May 2024 02:02:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 1/9] x86/irq: remove offline CPUs from old CPU mask when adjusting move_cleanup_count
Date: Wed, 29 May 2024 11:01:23 +0200
Message-ID: <20240529090132.59434-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When adjusting move_cleanup_count to account for CPUs that are offline also
adjust old_cpu_mask, otherwise further calls to fixup_irqs() could subtract
those again creating and create an imbalance in move_cleanup_count.

Fixes: 472e0b74c5c4 ('x86/IRQ: deal with move cleanup count state in fixup_irqs()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index c16205a9beb6..9716e00e873b 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2572,6 +2572,14 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
             desc->arch.move_cleanup_count -= cpumask_weight(affinity);
             if ( !desc->arch.move_cleanup_count )
                 release_old_vec(desc);
+            else
+                /*
+                 * Adjust old_cpu_mask to account for the offline CPUs,
+                 * otherwise further calls to fixup_irqs() could subtract those
+                 * again and possibly underflow the counter.
+                 */
+                cpumask_and(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
+                            &cpu_online_map);
         }
 
         if ( !desc->action || cpumask_subset(desc->affinity, mask) )
-- 
2.44.0


