Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671B8B14D5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711652.1111796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRb-0004mq-HJ; Wed, 24 Apr 2024 20:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711652.1111796; Wed, 24 Apr 2024 20:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRb-0004kt-CT; Wed, 24 Apr 2024 20:42:19 +0000
Received: by outflank-mailman (input) for mailman id 711652;
 Wed, 24 Apr 2024 20:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRZ-0004VD-OJ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:17 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2374edd0-027b-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 22:42:17 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so192285f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:17 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:16 -0700 (PDT)
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
X-Inumbo-ID: 2374edd0-027b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991336; x=1714596136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtmRGO2sNugbwwUMKoj3jAhZKPNDueX11T7dOt/OTR0=;
        b=ImMDH9ujhm3A6f7PM/OCahBncT2sYc3LNlfNziJqPTpGb88ICHhIkKCdgjmrr6t6fg
         abP07Wp9Wu9iu6CpuMcXdPF4hRm+tWdb2E7cYVfSUcbD6DPgInGm8BzNfTeEHWb/Oobn
         Mn+C6xKBSbhrlX/malxSlK0JZ3fbnG+Ig4AqH2WzJmIGcCmzCbGQ+qYgZUW+iB1nL70A
         A61AbDsR0Ft9KMymkfeef+kqbYsciS3i66tRYT2LksTCQHIEZR4v8R5anmIKVxOIAMRw
         /M3ccCOzv+FgoSuYofFNL9bzXndkbGCtJbhPUTujnAIf7VijKiP2SoRWIjdBYM5ExxyR
         qV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991336; x=1714596136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtmRGO2sNugbwwUMKoj3jAhZKPNDueX11T7dOt/OTR0=;
        b=WdTe5nZ7MyR5uo/UvuMD7ANNviaVD+39lvBjI5PO3MYRf8ajsp7qR7GgCLlBociG7b
         Botgwk/F01sH8uikdevZutht8ZuAU8nIVBCs8RqWM8RAoX3AkqVDb/PXcvZwZoShVdou
         91RoHHQ8WOjEWGsi6eSy8eqV/fssWSs4veXt5VIkX6JzuW/oxFjM/5wlYyU+NDDwngfn
         OcQl64kHD9IY5RtCT3x2yMi9joZMGPIjb7y9USycg8XTm83NLXDd5jRKFKSHFBU8IkLV
         GkDMy6QrkTr9N+bq+WPZe4GSpaIjCDe4RD2RR8xrNGkcYUEbSXBsbrpTBHnuw9pPRQOj
         viEA==
X-Gm-Message-State: AOJu0Yy1F1TYSX3b0NHtWSuAi0cpahbvQeZJmdaxKZmAfFpHT1WAgjiP
	WjbJDLpTylMentonVE0KsEyavXhQsVlbNmExs/wN8/LTI9HnnKMMzW25hPN9
X-Google-Smtp-Source: AGHT+IG8sceugR+jYafGwjUSLrOZpBOsjUm5hfGUZZCkEVCwELdsm33t7ujhWc20qe82/1Y2jbn3Uw==
X-Received: by 2002:adf:ee50:0:b0:346:c746:289e with SMTP id w16-20020adfee50000000b00346c746289emr2566925wro.48.1713991336491;
        Wed, 24 Apr 2024 13:42:16 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w.benny@outlook.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Subject: [PATCH 2/7] x86/hap: Refactor boolean field assignments
Date: Wed, 24 Apr 2024 20:42:00 +0000
Message-Id: <8203e5e06e326ad320878439e5342f7f1acc685d.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713990376.git.w1benny@gmail.com>
References: <cover.1713990376.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w.benny@outlook.com>

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/mm/hap/hap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 9f964c1d87..d2011fde24 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -522,7 +522,7 @@ int hap_enable(struct domain *d, u32 mode)
                goto out;
         }
 
-        d->arch.altp2m_active = 0;
+        d->arch.altp2m_active = false;
     }
 
     /* Now let other users see the new mode */
@@ -585,7 +585,7 @@ void hap_teardown(struct domain *d, bool *preempted)
             for_each_vcpu ( d, v )
                 altp2m_vcpu_disable_ve(v);
 
-        d->arch.altp2m_active = 0;
+        d->arch.altp2m_active = false;
 
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
-- 
2.34.1


