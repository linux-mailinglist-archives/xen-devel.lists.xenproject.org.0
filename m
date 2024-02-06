Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC384B26E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676750.1053041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIbD-0000bo-Is; Tue, 06 Feb 2024 10:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676750.1053041; Tue, 06 Feb 2024 10:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIbD-0000a6-Fy; Tue, 06 Feb 2024 10:22:43 +0000
Received: by outflank-mailman (input) for mailman id 676750;
 Tue, 06 Feb 2024 10:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HdcV=JP=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rXINT-0004Uc-Qm
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:08:31 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adac36df-c4d7-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 11:08:30 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33b4437e132so592318f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:08:30 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a056000110900b0033b43aaac8fsm1706914wrw.7.2024.02.06.02.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 02:08:29 -0800 (PST)
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
X-Inumbo-ID: adac36df-c4d7-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707214110; x=1707818910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzv8a2Pw/K0/iyLlK8ysT6UaHzFq2GFrZoFzc1+mp2Q=;
        b=dL+rVXKnv5FlCpjDYeCTlu2UeelQ1pitIID7SxQ/y5J1SNqMjMOE16KmRGrpj7MusE
         uZT/JMrlDHNnu6DecNZx0Kul4tw+indFZ3vJnLP591BMiW1zKuqlJbLKOJjVqrmwgvV3
         X5vWR7fJH4q4fm1h1Q3ftESOMR+lS74V8QRJIYKgUSY/RO6xP/zeuNEDwQiATVSBNpqR
         MqKgCbFgdZ8pfOEY5rWgbvlAs+ymaptXy00qE4+f/wN8Bpui1wbe448/VsQKRL+T74ZC
         nh7ul5e/CN15U1MBnveBnfQdxcG6KVN73otfSK83xoikabi6HQyxPEEA3QKL+nAi+BEI
         znVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214110; x=1707818910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzv8a2Pw/K0/iyLlK8ysT6UaHzFq2GFrZoFzc1+mp2Q=;
        b=ISOu1P6EsSDwHREyaMeeboKn63OL1NBT1oIS6Zz9JZY5P4kj0I6o85G/58pZ4aeyqu
         TT2/mAdBgB3sJ1nQEOrJU5KEk15YlM5F96iZgNrs4XPqmX89fEOHpPhks/ezmon0tLCc
         s9m7cSUUjzC8YXwY6iyYsX7Z2pOld96yitZeg1gkFCqsZIfhfL+nOF/QbIS+nwM25wIk
         +7RJpGSzutcOUrEVFriwC8vT2Bgz+BNNjq0H56fAix6RRrDV6nGPvoIJ3BwPZp7W4IMh
         aSAamjXKqlxdNcuLZo+2/cKEQovSnLzHS3ENhVrs7jkwdgEfpmGssBxPH2rEij7vLkLB
         8a0Q==
X-Gm-Message-State: AOJu0Yw9mi5KFUZGd6EJXrGdsfH31uuPZRH7+ey3af/+C2no32ppxUZJ
	B2b28j3G18cw0WcqYdg3Uf23cCHAIuCbgIvFawRZE9fBf4jgnDE5M2TyDyt44fo=
X-Google-Smtp-Source: AGHT+IFMq+xArz6wMDh9WSL/7949AS5ugVC/LOZX62KrJl2879zr2oaRkdjKsN094FJ6zdu+NnqSQw==
X-Received: by 2002:adf:e9c7:0:b0:33b:4672:ff32 with SMTP id l7-20020adfe9c7000000b0033b4672ff32mr869165wrn.45.1707214109778;
        Tue, 06 Feb 2024 02:08:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU1Mgb/+Zbs2qnv4ZZxnnXcOrvERHQxmBxgyo6HOq0ENU1BDrm5X6S01jPavOqeDl8MMtdlqA1AEXj5OmjZIRX0a8bNPIToHfgxIrfs5pAVjQC1CoKIhWWhxKV1AKkWBY1maDmAdbK2MgOb5BxYFps7R0dJfk9Dy1mRfyjNjPAWRlJcfmLKY4YMXyx70dKjo4OtqV/aNCkWQgNI3qxOlZn0SJMy51faFa2jM2fXaRvmlH3AuzxYODzeK+BS+CXsYtJ8IPQMiiMR/NU4i9wvm2EWplMv9xwYsTI/Rx877/CuJOC9zfwUra2Rb2/XDK+T9s8S6ctURKQ6K6NViTKR
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
Date: Tue,  6 Feb 2024 10:08:22 +0000
Message-Id: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This patch addresses a behavior discrepancy in the handling of altp2m views,
where upon the creation and subsequent EPT violation, the page access
permissions were incorrectly inherited from the hostp2m instead of respecting
the altp2m default_access.

Previously, when a new altp2m view was established with restrictive
default_access permissions and activated via xc_altp2m_switch_to_view(),
it failed to trigger an event on the first access violation.  This behavior
diverged from the intended mechanism, where the altp2m's default_access
should dictate the initial permissions, ensuring proper event triggering on
access violations.

The correction involves modifying the handling mechanism to respect the
altp2m view's default_access upon its activation, eliminating the need for
setting memory access permissions for the entire altp2m range (e.g. within
xen-access.c).  This change not only aligns the behavior with the expected
access control logic but also results in a significant performance improvement
by reducing the overhead associated with setting memory access permissions
across the altp2m range.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/misc/xen-access.c | 14 --------------
 xen/arch/x86/mm/p2m.c   |  3 +++
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/tools/misc/xen-access.c b/tools/misc/xen-access.c
index 4097eebe6f..6cf3b6a42c 100644
--- a/tools/misc/xen-access.c
+++ b/tools/misc/xen-access.c
@@ -517,9 +517,6 @@ int main(int argc, char *argv[])
     /* With altp2m we just create a new, restricted view of the memory */
     if ( memaccess && altp2m )
     {
-        xen_pfn_t gfn = 0;
-        unsigned long perm_set = 0;
-
         if( altp2m_write_no_gpt )
         {
             rc = xc_monitor_inguest_pagefault(xch, domain_id, 1);
@@ -551,17 +548,6 @@ int main(int argc, char *argv[])
         }
 
         DPRINTF("altp2m view created with id %u\n", altp2m_view_id);
-        DPRINTF("Setting altp2m mem_access permissions.. ");
-
-        for(; gfn < xenaccess->max_gpfn; ++gfn)
-        {
-            rc = xc_altp2m_set_mem_access( xch, domain_id, altp2m_view_id, gfn,
-                                           default_access);
-            if ( !rc )
-                perm_set++;
-        }
-
-        DPRINTF("done! Permissions set on %lu pages.\n", perm_set);
 
         rc = xc_altp2m_switch_to_view( xch, domain_id, altp2m_view_id );
         if ( rc < 0 )
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 0983bd71d9..4251144704 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1849,6 +1849,9 @@ bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
     amfn = _mfn(mfn_x(*mfn) & mask);
     gfn = _gfn(gfn_l & mask);
 
+    /* Override the altp2m entry with its default access. */
+    *p2ma = ap2m->default_access;
+
     rc = p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
     p2m_unlock(ap2m);
 
-- 
2.34.1


