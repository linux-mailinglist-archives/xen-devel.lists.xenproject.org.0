Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABnNLcP1D2qXRwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:20:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615DB5AF756
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316310.1585708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJFR-0000FS-2q; Fri, 22 May 2026 06:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316310.1585708; Fri, 22 May 2026 06:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJFQ-0000Cz-Vw; Fri, 22 May 2026 06:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1316310;
 Fri, 22 May 2026 06:20:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQJFO-0008RG-U8
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:20:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJFO-00DS7I-9x
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:20:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ff5ae-bab6-0a2a0a5309dd-0a2a4504ab7a-22
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:20:38 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ff5b6-1dec-0a2a45040019-d155802bc54c-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:20:38 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so33186895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:20:38 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm21875725e9.9.2026.05.21.23.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 23:20:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430838; x=1780035638; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXWRI7l7nK7SIe4W1b4avZ/Bw1tdkEXb3sGKmZFhqOg=;
        b=ozY1tmOXhhdQQKc1kcwqjZ8FXx4C06qjCBT+0IXu8r6ivxqLEZ2nKcX3o07U/IqW8/
         3tPKw74SWWK5QCd4bvey2PB/OUtNRgpHMSzgoqEEC8R6+yvmSM0CZ/hKKhWs1jECvRDp
         SjqbUMkZm0Boa/UEQXrSsZspjzMEO3BfBZoCxOjuys5YD7/49j24elziiboszYFV7BGI
         LO9JGc/yFDdJxQT0dIl+0Nu9GT925XUbw5gd8y5G8fv1kCGDqYNVZX5OqTEOWhQLjkMV
         JwzeZf2b00bOG6uY0CAaIplZcUFuDu911V5OqCA17lfCSmOZahAb4CVP1wj1NMz9iEQ6
         jATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430838; x=1780035638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXWRI7l7nK7SIe4W1b4avZ/Bw1tdkEXb3sGKmZFhqOg=;
        b=dvrDkcaaDUxH1A76uj0OzoM4MIyrJ1BMNh/OEiCBK2BdzB6SZw9GNiGjCbA55ELipo
         dliT8+YNnwPCT1U8qWXXOSUWAvZDWvoeK/1p1wI8K7sSNa68aL5TOzOjTHz1k1EcDXQJ
         EJyX/FaaTeW0loFyQ8E06VLwS7nuqcJN5o45jVeKFiKU2gHYGtDvXnNuUQERSHMjnSuc
         u9kvewWQc0SJEOMAW9H3u2f1EOoUTZh0SsS1R6xfaWtL1jNoBU/M0FBFt/I4fFBO2fY5
         wS+5gCrAxdZNj325AFoutaXTJMPJq5eVAtwvqIeaRxHQil+4cqEI5iOgUAFe2dd3OIh1
         22uw==
X-Gm-Message-State: AOJu0YzZgOUTNEJd9HyZ3iYrGqIhguGiY7ug8+c65Qkjq17UWI/xXHSl
	Up0C5geqEsS24FbhRiacX9g0IHOOiJSMACCWl9iuSUk/M3sbrsslvIew21QZxoJL
X-Gm-Gg: Acq92OGQsGgCl/2BcEEsItXb7vY5zPonkEQ+1JtVKHeTmEwtnJAFGhX7ueyX1Li3VCm
	jqVbeux2teCs2Xy+Q520RsSTJ7etyf8XILDMrpMcsZCbvmKwTiUVd1ytf6h+Mkh2QGiaKBiaeJn
	ZgkOQizzrXIbOvNNIeYoiG2qtHgqgwIkkQN2YdtWEFf+JoNwckVp6/7XDrtqAW6QDAwDmuj9U29
	xptrGVMSpI8LUkbxhp8tAuskPu93M7TsnG4WQLSJhNj2tO1oik5K1kEe1YPe8nCsBzeddMHKkob
	sZoOlgkMWwS7qvt//dsbsyped7vXF9tmdno+FqpVmh4qM0zUGX8YMGviLISUVkmH3FAGrdBFkII
	L1FrMuxl2wUiKd3XsjPzwTxybR+9t+dW50J1r9Cqx0EKTrN41ns+p5J2j9mn0cFA9ls0psgW96j
	MxYMroMhk7cdOdKJc2YmBMl9Pfyg==
X-Received: by 2002:a05:600c:3547:b0:48f:e230:8caa with SMTP id 5b1f17b1804b1-490428f2dc2mr20958225e9.30.1779430837544;
        Thu, 21 May 2026 23:20:37 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: propagate vGIC vCPU init failures
Date: Fri, 22 May 2026 09:18:26 +0300
Message-ID: <f9a0308092deb2135d32ad9fc2c5ccafc8a7320e.1779430299.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779430299.git.mykola_kvach@epam.com>
References: <cover.1779430299.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779430838-2997A3FF-8ED48185/0/0
X-purgate-type: clean
X-purgate-size: 4972
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 615DB5AF756
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

The vGIC per-vCPU init callback can fail. In particular, GICv3 rejects
a vCPU when the domain's redistributor layout has no MMIO slot covering
that vCPU. However, the generic vGIC init path ignored the callback
return value, so vcpu_create() could succeed with an invalid vGICv3
per-vCPU state.

This can be reproduced on FVP Base RevC by exposing a 2 MiB GICv3
redistributor region to Dom0 and booting Xen with:

    maxcpus=1 dom0_max_vcpus=64

The host GICv3 redistributor range is:

    region 0: 0x0000002f100000 - 0x0000002f300000

With Xen's guest redistributor frame size of 128 KiB, that range covers
16 guest redistributors. vCPU16 and above have no corresponding
redistributor slot.

Before this fix, Xen detected the missing redistributors:

    d0: Unable to find a re-distributor for VCPU 16
    ...
    d0: Unable to find a re-distributor for VCPU 63

but ignored the error and continued as if the secondary vCPUs had been
created correctly. Dom0 then saw 64 possible CPUs and could hang during
secondary CPU bring-up:

    smp: Bringing up secondary CPUs ...
    d0v15: vGICR: SGI: unhandled word write ... to ICACTIVER0

Propagate the vGIC vcpu_init() error so the caller can stop creating
secondary vCPUs. With this fix, Dom0 construction reports:

    d0: Unable to find a re-distributor for VCPU 16
    Failed to allocate d0v16

and the guest continues booting with the vCPUs created before the
failure:

    smp: Brought up 1 node, 16 CPUs

Free the private IRQ rank allocated by vcpu_vgic_init() on this error
path. The caller will still run the generic vCPU creation cleanup, but
XFREE() clears the pointer so that cleanup remains idempotent.

Also fix the host-layout redistributor region count for the case where
the requested vCPU count is larger than the capacity of all host
redistributor regions. The old code always stored i + 1 after the loop.
That is correct when the loop stops inside a valid region because the
requested vCPU count is covered. If the loop exits after consuming all
hardware regions, i is already equal to the number of allocated regions,
so i + 1 records one region too many.

In the same FVP setup, that off-by-one made Xen describe host-layout
GICR state beyond the populated redistributor region list. Dom0 then
accessed the GICR MMIO window described in its device tree, but Xen could
not match the access to a valid emulated redistributor frame. During
debugging this was seen as an unexpected vGICR access followed by a
guest panic:

    d0v0: vGICR: unknown gpa read address 000000002f10ffe8
    pc : gic_iterate_rdists+0x4c/0x104
    Kernel panic - not syncing: Attempted to kill the idle task!

Keep the existing best-effort Dom0 policy: a failure to create a
secondary vCPU stops the secondary vCPU creation loop, but does not fail
the whole Dom0 boot.

Fixes: ea37fd21110b ("xen/arm: split vgic driver into generic and vgic-v2 driver")
Fixes: 54ec59f6b0b3 ("xen/arm: vgic-v3: Don't create empty re-distributor regions")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/vgic-v3.c |  3 ++-
 xen/arch/arm/vgic.c    | 10 +++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 77517c3030..360778eb32 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1834,7 +1834,8 @@ static int vgic_v3_domain_init(struct domain *d)
          * not match the number of pCPUs). Update the number of regions to
          * avoid exposing unused region as they will not get emulated.
          */
-        d->arch.vgic.nr_regions = i + 1;
+        d->arch.vgic.nr_regions = (i == vgic_v3_hw.nr_rdist_regions) ?
+                                   i : i + 1;
 
         d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
     }
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6647071ad4..e55e484493 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -368,7 +368,7 @@ void domain_vgic_free(struct domain *d)
 
 int vcpu_vgic_init(struct vcpu *v)
 {
-    int i;
+    int i, ret;
 
     v->arch.vgic.private_irqs = xzalloc(struct vgic_irq_rank);
     if ( v->arch.vgic.private_irqs == NULL )
@@ -377,7 +377,12 @@ int vcpu_vgic_init(struct vcpu *v)
     /* SGIs/PPIs are always routed to this VCPU */
     vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
 
-    v->domain->arch.vgic.handler->vcpu_init(v);
+    ret = v->domain->arch.vgic.handler->vcpu_init(v);
+    if ( ret )
+    {
+        XFREE(v->arch.vgic.private_irqs);
+        return ret;
+    }
 
     memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs));
     for (i = 0; i < 32; i++)
@@ -944,4 +949,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_
  * indent-tabs-mode: nil
  * End:
  */
-
-- 
2.43.0


