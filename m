Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2257B46FE
	for <lists+xen-devel@lfdr.de>; Sun,  1 Oct 2023 12:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611000.950457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmtsu-0000nG-Fn; Sun, 01 Oct 2023 10:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611000.950457; Sun, 01 Oct 2023 10:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmtsu-0000k8-CD; Sun, 01 Oct 2023 10:41:12 +0000
Received: by outflank-mailman (input) for mailman id 611000;
 Sun, 01 Oct 2023 10:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vg4g=FP=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qmtss-0000j6-Rd
 for xen-devel@lists.xenproject.org; Sun, 01 Oct 2023 10:41:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0698bd3e-6047-11ee-9b0d-b553b5be7939;
 Sun, 01 Oct 2023 12:41:06 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99357737980so2133592366b.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Oct 2023 03:41:06 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 jx14-20020a170906ca4e00b0099caf5bed64sm15333657ejb.57.2023.10.01.03.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 03:41:05 -0700 (PDT)
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
X-Inumbo-ID: 0698bd3e-6047-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696156866; x=1696761666; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av1YVGUYjKuKpOxhCUYf9bVAmtK6lNc0JKDBqDmChEQ=;
        b=QRxPxvhT7dgDeFxDXSqCVh7uF7cc6Mhck78m3K3lj/XQZsnfvYmOpvYgH2ua5wX3yB
         L4bTiWTmg1TsSO9Bdx9dc4ya8XIBID96M+evuLRc5W3THhFIJgrUYObhOigzh63N3Kc8
         0IDd8j0em2MS8tHdPJxHmiXQXYb8pz0UUpnC8dvNHRMSe8Mn3YQLYRuE2goLye4OFGFy
         vKCmcC7+3Hlhi2XAHerHWGozQl6BhsUScciukFfW/Bb081tkpc84215SdkfHl+AoX3Tw
         IQzJyuVnOrxiWkxqlQm+HmCwG/z6Tpw1oCsIE9S34G4GbGCvS1Hn+AdrT0IXZWuDdMFa
         NNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696156866; x=1696761666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Av1YVGUYjKuKpOxhCUYf9bVAmtK6lNc0JKDBqDmChEQ=;
        b=QvqGszteoMESD/WWcSBx4x9kOrvDg6EQGCY8RtwvAcPM2d1NxQNvLSIq7iPKwmhTDU
         mMYgrw5diaYc1LmgAu/ySURtD5QAjA++Rr1hcZnJTW2SvD07uoOgBoqljcf9JyMr66JX
         2eShB/d3A+1nqbmzJ8w6u4FiEjbt4cHImrllCWTtRW8V9iH779UmNN46/sTV0oTRC5Hc
         4vIkuA0ZcC+XZQLSnULHYlrC92d5cstY9fJ8N8Mdh0n7QU/zotcjr0ABddy6lPSUx4pA
         tdRIQVPSqZFlKGrUlzkveq9RPJ7x5JwLz3NW3sXL5oPb5XluhREReIv38tYcrmgWBo8u
         bVuQ==
X-Gm-Message-State: AOJu0YzY+nTE+ldvtlA+s02wmw88niaalTH1uv+YBhhVdjZfrPy7pB52
	5yg/QKoYsWemHZXKEpj6FdzLbW1ixLW10w==
X-Google-Smtp-Source: AGHT+IEaRBVRFHBq8PsqtS7Xotm/O/WCU7PUdbnpb1YCwTqlB9U799c5jGmIPkQv2u5NF0F2mavHLA==
X-Received: by 2002:a17:906:7695:b0:9ad:e17c:464e with SMTP id o21-20020a170906769500b009ade17c464emr8738266ejm.68.1696156865773;
        Sun, 01 Oct 2023 03:41:05 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/3] xen: Use sync_try_cmpxchg instead of sync_cmpxchg
Date: Sun,  1 Oct 2023 12:39:11 +0200
Message-ID: <20231001104053.9644-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231001104053.9644-1-ubizjak@gmail.com>
References: <20231001104053.9644-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sync_try_cmpxchg instead of sync_cmpxchg (*ptr, old, new) == old
in clear_masked_cond(), clear_linked() and
gnttab_end_foreign_access_ref_v1(). x86 CMPXCHG instruction returns
success in ZF flag, so this change saves a compare after cmpxchg
(and related move instruction in front of cmpxchg), improving the
cmpxchg loop in gnttab_end_foreign_access_ref_v1 from:

     174:	eb 0e                	jmp    184 <...>
     176:	89 d0                	mov    %edx,%eax
     178:	f0 66 0f b1 31       	lock cmpxchg %si,(%rcx)
     17d:	66 39 c2             	cmp    %ax,%dx
     180:	74 11                	je     193 <...>
     182:	89 c2                	mov    %eax,%edx
     184:	89 d6                	mov    %edx,%esi
     186:	66 83 e6 18          	and    $0x18,%si
     18a:	74 ea                	je     176 <...>

to:

     614:	89 c1                	mov    %eax,%ecx
     616:	66 83 e1 18          	and    $0x18,%cx
     61a:	75 11                	jne    62d <...>
     61c:	f0 66 0f b1 0a       	lock cmpxchg %cx,(%rdx)
     621:	75 f1                	jne    614 <...>

No functional change intended.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
v2: Improve commit description.
---
 drivers/xen/events/events_fifo.c | 26 ++++++++++++--------------
 drivers/xen/grant-table.c        | 10 ++++------
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index ad9fe51d3fb3..655775db7caf 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -226,21 +226,20 @@ static bool evtchn_fifo_is_masked(evtchn_port_t port)
  */
 static bool clear_masked_cond(volatile event_word_t *word)
 {
-	event_word_t new, old, w;
+	event_word_t new, old;
 
-	w = *word;
+	old = *word;
 
 	do {
-		if (!(w & (1 << EVTCHN_FIFO_MASKED)))
+		if (!(old & (1 << EVTCHN_FIFO_MASKED)))
 			return true;
 
-		if (w & (1 << EVTCHN_FIFO_PENDING))
+		if (old & (1 << EVTCHN_FIFO_PENDING))
 			return false;
 
-		old = w & ~(1 << EVTCHN_FIFO_BUSY);
+		old = old & ~(1 << EVTCHN_FIFO_BUSY);
 		new = old & ~(1 << EVTCHN_FIFO_MASKED);
-		w = sync_cmpxchg(word, old, new);
-	} while (w != old);
+	} while (!sync_try_cmpxchg(word, &old, new));
 
 	return true;
 }
@@ -259,17 +258,16 @@ static void evtchn_fifo_unmask(evtchn_port_t port)
 
 static uint32_t clear_linked(volatile event_word_t *word)
 {
-	event_word_t new, old, w;
+	event_word_t new, old;
 
-	w = *word;
+	old = *word;
 
 	do {
-		old = w;
-		new = (w & ~((1 << EVTCHN_FIFO_LINKED)
-			     | EVTCHN_FIFO_LINK_MASK));
-	} while ((w = sync_cmpxchg(word, old, new)) != old);
+		new = (old & ~((1 << EVTCHN_FIFO_LINKED)
+			       | EVTCHN_FIFO_LINK_MASK));
+	} while (!sync_try_cmpxchg(word, &old, new));
 
-	return w & EVTCHN_FIFO_LINK_MASK;
+	return old & EVTCHN_FIFO_LINK_MASK;
 }
 
 static void consume_one_event(unsigned cpu, struct evtchn_loop_ctrl *ctrl,
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 35659bf70746..04a6b470b15d 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -427,16 +427,14 @@ EXPORT_SYMBOL_GPL(gnttab_grant_foreign_access);
 
 static int gnttab_end_foreign_access_ref_v1(grant_ref_t ref)
 {
-	u16 flags, nflags;
-	u16 *pflags;
+	u16 *pflags = &gnttab_shared.v1[ref].flags;
+	u16 flags;
 
-	pflags = &gnttab_shared.v1[ref].flags;
-	nflags = *pflags;
+	flags = *pflags;
 	do {
-		flags = nflags;
 		if (flags & (GTF_reading|GTF_writing))
 			return 0;
-	} while ((nflags = sync_cmpxchg(pflags, flags, 0)) != flags);
+	} while (!sync_try_cmpxchg(pflags, &flags, 0));
 
 	return 1;
 }
-- 
2.41.0


