Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGiXIjlHFmofkQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 03:22:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AE35DE372
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 03:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320277.1587636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS2xQ-0001mg-Rl; Wed, 27 May 2026 01:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320277.1587636; Wed, 27 May 2026 01:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS2xQ-0001iZ-No; Wed, 27 May 2026 01:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1320277;
 Wed, 27 May 2026 01:21:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wS2xO-0001gH-Kt
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 01:21:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS2xO-00Cdnu-13
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 03:21:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1646e3-5cb7-0a2a0a5109dd-0a2a450a9be6-26
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 03:21:13 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a164709-56b3-0a2a450a0019-d155da34c1b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 03:21:13 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-bd4d7f4fa02so1884715366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 18:21:13 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm550541266b.40.2026.05.26.18.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 18:21:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779844873; x=1780449673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vMhWg43N7nYM1IT7U4BDAySY2pGEqFJ6jhyhmB4l4w=;
        b=efcP6ItTxc7InSUPfYwQg9/Tn3Hrm7BKkuu46ijqrK/mMREnZ1vlz3KBOljTG3/Hu2
         eWtPDYSSjGFD5RZxB9/F3r9PaeyZrM5QWKGiJtFgvtInFhGqAEnF+He+8YCA0GzdsIlT
         EaS2BJF62+GtuoerZRp7lr/7bxJypr/ghIX/mP372vY7vN89+OO1AGgwTzw9cGVZdt9E
         WVZ/VaKrxsBJ3gdTKVMIcvzrv9mEejWIVCqFe2w0VOTpMs/MSlODFs0+2DM5plfX3AeX
         DzsmMJ7h5jDVfJsLFoBiJ5bl/Kr6Fqu4GSHl9YmS4/GmIbX38DhrrGAE/LBkE/EhToPx
         WP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779844873; x=1780449673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vMhWg43N7nYM1IT7U4BDAySY2pGEqFJ6jhyhmB4l4w=;
        b=ZTfA+um8RfxeFYep+ojHCv38nQ2PlRjThDnO6bgxor/FeTSxo1dA7OXqvm9CSguGHD
         5TNYNLSwcLVnWcloT+EIi5toSpJC+fFdpfLIOxRCLNqmtKHdjTKWF83v0eNOLtMZ+r5h
         jA9RkwvLazq97Da1YEeod/0qgUmfue8cORB3R+lC7j17YUJml/5MltUzoUHUHpWlsqnD
         afiaAxTysbc3ewRRn397MdccJwWb67eax5DC7kntWDbXpSO3tcDkIgh2RwAa/GDXX/Kj
         szJkVVFmZTOutwcvftm2lnPdWw1nNic3NGU4xECrMkINyVW54Dc5gLVK7bOXNsPGHR/p
         N0JA==
X-Gm-Message-State: AOJu0Yzhd3zt7FC4NsaLsmG5sQkZnYzZY/2i68nFvCcsg1/wFJ3zFg/h
	w/ESYhFlq1jKvFYPjDqB7CZOYKGycLBeJ5PAZMdaT0sa5hhwJ3fsF66EFAHI3Q==
X-Gm-Gg: Acq92OGa7ojJfi/xtfTd8Y5BHlMWb2X1FjYjsGAuuRzY+JvZQmZQ/TLOYyNWjZ9I86U
	f4JZPFzL+Ji3uYhREiwU2y+15nYJBPor+7Ap4aIctRtD1zEaiycwC1TFfSLobGiB5Y+vmv3rmHA
	CSbUw/t8s2kwvygTJWwB1KSkY8G//X4BGuF/4cgy+x1jNrTqKVmhbeNesxV9grlGRNaV+QFfDYH
	h7UaBaC6JZnx5uVpnxH5Bfib5xfiwK5F36c5tTcnDOt/8+1OYCA8RSKJGJWD6ZmToh5XRfnqed5
	W5GfROfIA+rM+4AZs7x4RQZHmx7C/PF5fXZtl9JmzzK4jTiY1e/dhsF3RfYHF5s3c1qfbPcR/zO
	nCwcvcpZvqgt8XrB+kjskvs8DJvXhZReUVuE7IS8DFVOAZvd6xdsOcJjA4R6yK3MFe+Reupm69S
	2jL4I5g2rSPTKYufYBCVjIEPJRuPeg1UL/zmB7
X-Received: by 2002:a17:907:1dc8:b0:ba6:e18f:1568 with SMTP id a640c23a62f3a-bdd272cf257mr847459566b.32.1779844873438;
        Tue, 26 May 2026 18:21:13 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2 1/2] xen/arm: propagate vGIC vCPU init failures
Date: Wed, 27 May 2026 04:18:50 +0300
Message-ID: <6a422e066c1ee58b81d6c5c15952249572cd13bf.1779840898.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779840898.git.mykola_kvach@epam.com>
References: <cover.1779840898.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779844873-7CA798B7-120F01EB/0/0
X-purgate-type: clean
X-purgate-size: 5232
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.962];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 26AE35DE372
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

Keep the existing construct_domain() policy used by Dom0 and dom0less
domain construction: a failure to create a secondary vCPU stops the
secondary vCPU creation loop, but does not fail the whole domain
construction.

Fixes: ea37fd21110b ("xen/arm: split vgic driver into generic and vgic-v2 driver")
Fixes: 54ec59f6b0b3 ("xen/arm: vgic-v3: Don't create empty re-distributor regions")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- use min(i + 1U, vgic_v3_hw.nr_rdist_regions) when limiting the
  host-layout redistributor region count.
- keep the trailing blank line at the end of xen/arch/arm/vgic.c.
- clarify that the best-effort secondary vCPU allocation failure policy is
  the existing construct_domain() policy for Dom0 and dom0less domains.
---
 xen/arch/arm/vgic-v3.c | 2 +-
 xen/arch/arm/vgic.c    | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 77517c3030..c1c4d6f71e 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1834,7 +1834,7 @@ static int vgic_v3_domain_init(struct domain *d)
          * not match the number of pCPUs). Update the number of regions to
          * avoid exposing unused region as they will not get emulated.
          */
-        d->arch.vgic.nr_regions = i + 1;
+        d->arch.vgic.nr_regions = min(i + 1U, vgic_v3_hw.nr_rdist_regions);
 
         d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
     }
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6647071ad4..e5aca17dcb 100644
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
-- 
2.43.0


