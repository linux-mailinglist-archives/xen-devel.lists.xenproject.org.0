Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1lZqBs8RqmnFKgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 00:29:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1F1219445
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 00:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247247.1546035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyI7f-0004QQ-L1; Thu, 05 Mar 2026 23:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247247.1546035; Thu, 05 Mar 2026 23:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyI7f-0004Ng-I0; Thu, 05 Mar 2026 23:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1247247;
 Thu, 05 Mar 2026 23:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+y1=BF=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vyI7e-0004Na-MH
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 23:28:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 102f392a-18eb-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 00:28:49 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so54311685e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 15:28:49 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485268859f1sm743165e9.2.2026.03.05.15.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 15:28:47 -0800 (PST)
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
X-Inumbo-ID: 102f392a-18eb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772753328; x=1773358128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vF9oHZvcy9raonXFUwX0+3Jx8cqQFifTNwFvrPALvY=;
        b=rnYxs1W+0C0cJAv7EsqchVOGrK2ziULp0JeZwBMXUqu67tTfSeXtwMKWOuYF12dHCy
         Of4T4+ESXcWR+TX1KvvsVOnbAGmKWPR95v9iRArydxUCU98ik0qVr+8/GMwjUDhD6adH
         qlOyQfePib5eDoHwN/lD5d8pGt/4cq5N9xck8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772753328; x=1773358128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vF9oHZvcy9raonXFUwX0+3Jx8cqQFifTNwFvrPALvY=;
        b=fx55aDh/dueL76CzoIIp/Uhmx56qh3yc67l9AALL6xySg1V4R72F1QCgoP1G1vyx3H
         CTz2fw6uW87RuROcy65kk+1QMwCq4w+0KKctHL5N9uOjBehCFbzewqXWqf9H8Q3C4GH8
         BjuNv15F3Q62/PuzTnbWgxo9pc0GKSwzg/YNiqI3lXDH6jVNP82BfTNmymkMu2JGwJOQ
         /ie6/b1xDGuaKfbx0DA/OmxEq61YOz4gq5njQ6TSPIMWfXRhMYNcuSftJlVVvJ+0XPwU
         HfPvJXJbXXBPQV4dqMj/TLDJSs8Cj2dk588nAUN/7Ouo84+iHRGwFjYP5ZuyNHTQWF+l
         pAKQ==
X-Gm-Message-State: AOJu0YxEhkhdLicd8TD3+rge2vBwfmGLlDIbOkU+1sGa8ou8eRt4x48e
	5rt18TjJnJhsAXQDH1lS88aU7wx0aMEakAqnjT8vr+yF7/owBtxxu5Os/fGjEImC6NV/ObKv5WD
	5sNaD
X-Gm-Gg: ATEYQzwGl/LO9TlhCO/lH08jV/hdP7n5VFVWXmM0yH01NTrrwm/xhr5FzsGWJ4zCgDL
	yEOJuZf54+SwrxD5RY7HDwcLdxAO2hERQRrGt0elrgSKyFaQrl8aLOhN99Ky9KecDHcyo2e7TvU
	TjZiUnL8Bxlh/fl8PIas6nJMKm9HbUxe4EMOiUIRrArCsmrHgRMjITPjGHD8ELbhhMBgYNdb9km
	+mTtYykFq99iVlAQMHiNR4aMXBGEkGNRbAPm7zV28kTQSOZk8blRMWZz1Vl9m2vB5Y9tggw3GcO
	r9F1SLcBLzlDak+eOPC0iJc9d6PYEgerFdphWgLj8OAJezgMCdpMXp4GpvceH7tSwnCElvxTma9
	gmwjZkEJ7dNQuS+Vi+ZjqdbR5eKY+XcbUE4trUMYYBMK8IWVQS6MkMMuynJnBlAo6OCVcBHIIsW
	38awS84V0oAjNQxkUjQYDbGNdca4WS7AyzzbWxwaYxKzmWXxNVMP+fDPu11mrHjmd7PrXjwY4=
X-Received: by 2002:a05:600c:3b07:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-4852697965dmr80705e9.33.1772753328227;
        Thu, 05 Mar 2026 15:28:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_sync_from_lrs()
Date: Thu,  5 Mar 2026 23:28:45 +0000
Message-Id: <20260305232845.62024-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AF1F1219445
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,xen.org:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

lr_mask doesn't have bits set beyond the hardware limit, with the upper bits
remaining zero.  Therefore, for_each_set_bit() is a better option.

For ARM64, bloat-o-meter reports:

  Function                                     old     new   delta
  vgic_sync_from_lrs                           208     168     -40

but this doesn't highlight that it also removes a call to find_next_bit() from
each loop iteration.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

RFC.  This form also doesn't suffer an OoB read when lr_mask changes type.
---
 xen/arch/arm/gic-vgic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a91..fae80e6cd293 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -241,9 +241,7 @@ static void gic_update_one_lr(struct vcpu *v, int i)
 
 void vgic_sync_from_lrs(struct vcpu *v)
 {
-    int i = 0;
     unsigned long flags;
-    unsigned int nr_lrs = gic_get_nr_lrs();
 
     /* The idle domain has no LRs to be cleared. Since gic_restore_state
      * doesn't write any LR registers for the idle domain they could be
@@ -255,11 +253,8 @@ void vgic_sync_from_lrs(struct vcpu *v)
 
     spin_lock_irqsave(&v->arch.vgic.lock, flags);
 
-    while ((i = find_next_bit((const unsigned long *) &this_cpu(lr_mask),
-                              nr_lrs, i)) < nr_lrs ) {
+    for_each_set_bit ( i, this_cpu(lr_mask) )
         gic_update_one_lr(v, i);
-        i++;
-    }
 
     spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
 }

base-commit: bdd49cc2f61510797a47ad81486be653633ab3ee
-- 
2.39.5


