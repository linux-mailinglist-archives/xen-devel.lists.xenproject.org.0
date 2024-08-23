Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E895D974
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 01:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782738.1192257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shdHJ-0002D7-7q; Fri, 23 Aug 2024 23:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782738.1192257; Fri, 23 Aug 2024 23:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shdHJ-0002AR-3j; Fri, 23 Aug 2024 23:01:09 +0000
Received: by outflank-mailman (input) for mailman id 782738;
 Fri, 23 Aug 2024 23:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shdHI-0001rz-5B
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 23:01:08 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94189d40-61a3-11ef-8776-851b0ebba9a2;
 Sat, 24 Aug 2024 01:01:06 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5bf0261f162so3219718a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 16:01:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3ed39fsm2619258a12.57.2024.08.23.16.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 16:01:04 -0700 (PDT)
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
X-Inumbo-ID: 94189d40-61a3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724454065; x=1725058865; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zF8pjt0XDyvgbiqMd5EfMePZ7QzQjeJHHv0zF/e7/x8=;
        b=MqBDW0/B4wR3ADIjwQ2TjC2NDLDy8CHiuSvFfND/ePLS7FaezWDRzr7bcy7wZzs699
         /fjdbAvUvbmGkQzG4ruNqqduphY36zzJPqRuGtHikotQxUqSd758bmwLnqdm4i7Qfrxn
         pktqRW/C81ASSooi7dqsHo82pdUrFYH+4vgWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724454065; x=1725058865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zF8pjt0XDyvgbiqMd5EfMePZ7QzQjeJHHv0zF/e7/x8=;
        b=N+iEC50JoQmIpJXyj7zPtlTLyxhgGnzbgYdpqpZXecvsfInFEWfYRLIGA7sN+4mDv1
         C4MkX2VJ9SctekK6zbBA3/4r7NOW/V+u4S5NdAp/mn+bC20s0aXkHAOuG7CYZU6lm3pC
         vmEAPgaWljABVlTqUyH94nMoJ9JAP8i5MdQQT+TYNdpQy/3ZA3NJ2RGC83tOZ7PTqGeL
         kCMukjqlZUbf91+O6+bxwPS0sarVN3gPD910qV/8HxEi3VfcP7TZFJwwA6syH1Q7KH11
         yFQeUqvTDubjJYxBmBUID1qnDxwp03UTIvOlmClIgvdo6NTtbgD1lmXmntyRP02PSm8r
         XB8Q==
X-Gm-Message-State: AOJu0YyygRZmYw8fNvXjNklPSVex6PGXC4QZitTtyfu+qbgEh8WojTfa
	Qypk1JCQpyQOFU0QVatlzKjsSZh7ws4Gb7T+GnIf1DM/UEMKHZp7ytxj8m0Oi/HsPhAAfekYEjz
	p
X-Google-Smtp-Source: AGHT+IH2JdWSF1S4Wcp3axdJeQAz99ay+Ym31Wz/fI9epA6oB/3l14OL97aAyOaoM3sQM2+yPfGtvw==
X-Received: by 2002:a05:6402:4404:b0:5c0:9814:3f94 with SMTP id 4fb4d7f45d1cf-5c098144075mr133295a12.21.1724454065157;
        Fri, 23 Aug 2024 16:01:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()
Date: Sat, 24 Aug 2024 00:01:00 +0100
Message-Id: <20240823230100.1581448-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing expression is just a very complicated way of expressing a loop
over all bits of target->list.  Simplify the expression.

While here, fix the two gprintk()'s.  Because of a quotes vs line continuation
issue, there's a long string of spaces in the middle of the format string.

  $ strings xen-syms-arm32 | grep -e VGIC -e GICD_SGIR
  <G><1>%pv VGIC: write r=%08x                         target->list=%hx, wrong CPUTargetList
  <G><1>%pv vGICD:unhandled GICD_SGIR write %08x                  with wrong mode

not to mention trailing whitespace too.

Rewrite them to be more consise and more useful.  Use 0x prefixes for hex,
rather than ambigous, and identify the problem target vCPU / mode, rather than
simply saying somethign was wrong.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <JBeulich@suse.com>

In a fun twist, we can't use target->list directly in the expresion, because
the typeof() picks up constness from the pointer, and we get:

  In file included from arch/arm/vgic.c:11:
  arch/arm/vgic.c: In function ‘vgic_to_sgi’:
  ./include/xen/bitops.h:305:19: error: assignment of read-only variable ‘__v’
    305 |               __v &= __v - 1 )
        |                   ^~
  arch/arm/vgic.c:483:9: note: in expansion of macro ‘for_each_set_bit’
    483 |         for_each_set_bit ( i, target->list )
        |         ^~~~~~~~~~~~~~~~

Sadly we need -std=c23 before we can use typeof_unqual() which is what we
actually want here.
---
 xen/arch/arm/vgic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 7b54ccc7cbfa..081cbb67fb52 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -470,8 +470,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
     struct domain *d = v->domain;
     int vcpuid;
     int i;
-    unsigned int base;
-    unsigned long int bitmap;
+    unsigned int base, bitmap;
 
     ASSERT( virq < 16 );
 
@@ -481,15 +480,16 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
         perfc_incr(vgic_sgi_list);
         base = target->aff1 << 4;
         bitmap = target->list;
-        bitmap_for_each ( i, &bitmap, sizeof(target->list) * 8 )
+
+        for_each_set_bit ( i, bitmap )
         {
             vcpuid = base + i;
             if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL ||
                  !is_vcpu_online(d->vcpu[vcpuid]) )
             {
-                gprintk(XENLOG_WARNING, "VGIC: write r=%"PRIregister" \
-                        target->list=%hx, wrong CPUTargetList \n",
-                        sgir, target->list);
+                gprintk(XENLOG_WARNING,
+                        "vGIC: write %#"PRIregister", target->list=%#x, bad target v%d\n",
+                        sgir, target->list, vcpuid);
                 continue;
             }
             vgic_inject_irq(d, d->vcpu[vcpuid], virq, true);
@@ -510,8 +510,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
         break;
     default:
         gprintk(XENLOG_WARNING,
-                "vGICD:unhandled GICD_SGIR write %"PRIregister" \
-                 with wrong mode\n", sgir);
+                "vGICD: GICD_SGIR write %#"PRIregister" with unhangled mode %d\n",
+                sgir, irqmode);
         return false;
     }
 
-- 
2.39.2


