Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD65821927
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660567.1030118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRF-00083T-3x; Tue, 02 Jan 2024 09:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660567.1030118; Tue, 02 Jan 2024 09:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRE-0007wi-Su; Tue, 02 Jan 2024 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 660567;
 Tue, 02 Jan 2024 09:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRD-00060C-4x
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:55 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ebc50e0-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:53 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so591231466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:53 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:51 -0800 (PST)
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
X-Inumbo-ID: 8ebc50e0-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189112; x=1704793912; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcRHPr39Ase6Icq3b5rN9tDIxrSmfJ7neiBccxr3jrg=;
        b=p6D1+SqpkbGD0c8wn2kT8YuCLrQPOitpGYSbnr7vmmsAvsPtkcImJYwO653W1uJBpM
         Ka+K0ZVi7xOBYTe1UL4BzjzUUkfS2RQWK4gnLDGIIBa8XRoWa6Bd4ZN95/TA8OkZCps1
         VzEosBY8LX+5GX1RqOEA5AibCTA8fm9DX+KQAZsJBcV2zS5ng40cWuH5sXv6Hav1fHS4
         l4IX18yAk5qz/y56/UeboSeCo0cwQgjXM4JfdggAcY0YrHALKOlQ6HbpiYLh8jvC/9sW
         P4bfXBj22nX8NLERFON/3w57L4Qje9KcRG5HqBg0D0va6r4hDgiiQWrUycngoPTh7HvL
         tegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189112; x=1704793912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcRHPr39Ase6Icq3b5rN9tDIxrSmfJ7neiBccxr3jrg=;
        b=vc/HOjDI1bKj7poxxwDIxjn6U5D/7fk5hNAbx1zk3jGXDNkzg5mQ/5h5UIz+Fwdmsl
         fMKyd8VBM+bNu5TraC2c5re7LwU5jdzwpZZ70tT9twjmDSzqF1CaI2D4y5yNgBLFSw2X
         4u/bfgP8PRoM7n0Hjwc+gnijxvQpo2LTgcICpnFNrFqNNpDuWRJs+xpzOP4ELTaf3uGm
         nTmYTb+SQieMCJ6P6hsaOddOBTEd4TcaF7dNMZhnFABlXRU2oNO6K9XxxELx9dpOqOfP
         BEIyLG9Nx1J937m0BfAedAOWD9PScgSKb0txL4sbajkeDW3I3+M6K23Sp4NFm9iTQxSI
         Miig==
X-Gm-Message-State: AOJu0YwLDiJEBp2k77v2IjOo4Wm+qJYK47jQdkdVCTlxcW+5glHJyK+g
	508zruPwh3JLuCB1ZVQAjsITz77MShL0DDJRKGKquC3GUwU=
X-Google-Smtp-Source: AGHT+IFkKg2Atq8Mx1lI55ksS3FUhVs3unVFFXvmR1U7NRnE9JwsE85OqUkKJy1oOf0ZRrFChr1ioA==
X-Received: by 2002:a17:906:58f:b0:a23:57a1:d85b with SMTP id 15-20020a170906058f00b00a2357a1d85bmr8264149ejn.74.1704189112379;
        Tue, 02 Jan 2024 01:51:52 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 08/13] xen/page_alloc: introduce preserved page flags macro
Date: Tue,  2 Jan 2024 10:51:33 +0100
Message-Id: <20240102095138.17933-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra are flags that needs to be preserved when assigning
a page. Define a new macro that groups those flags and use it instead of
or'ing every time.

The new macro is used also in free_heap_pages() allowing future commits to
extended it with other flags that must stop merging, as it now works for
PGC_static. PGC_extra is no harm here since it's only ever being set on
allocated pages.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- new patch
---
 xen/common/page_alloc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 9ee3981bb5..3bf3120287 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -158,6 +158,8 @@
 #define PGC_static 0
 #endif
 
+#define preserved_flags (PGC_extra | PGC_static)
+
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
@@ -1504,7 +1506,7 @@ static void free_heap_pages(
             /* Merge with predecessor block? */
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
-                 (predecessor->count_info & PGC_static) ||
+                 (predecessor->count_info & preserved_flags) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (page_to_nid(predecessor) != node) )
                 break;
@@ -1528,7 +1530,7 @@ static void free_heap_pages(
             /* Merge with successor block? */
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
-                 (successor->count_info & PGC_static) ||
+                 (successor->count_info & preserved_flags) ||
                  (PFN_ORDER(successor) != order) ||
                  (page_to_nid(successor) != node) )
                 break;
@@ -2365,7 +2367,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~preserved_flags));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2425,7 +2427,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & preserved_flags) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
-- 
2.34.1


