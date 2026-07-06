Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SkXQLeBjS2p/QgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 10:14:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAFE70DFBD
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 10:14:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZyV2bUnp;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355117.1609898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgeSU-0001ix-8q; Mon, 06 Jul 2026 08:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355117.1609898; Mon, 06 Jul 2026 08:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgeSU-0001gY-5h; Mon, 06 Jul 2026 08:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1355117;
 Mon, 06 Jul 2026 08:13:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wgeSS-0001gS-Gd
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 08:13:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgeSR-008MIX-9U
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:13:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a4b63a0-2eae-0a2a0a5409dd-0a2a450c8fd0-26
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:13:39 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a4b63b3-f399-0a2a450c0019-d155dd31b965-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:13:39 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-46ed4f66256so2467063f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 01:13:39 -0700 (PDT)
Received: from notebook.. ([85.107.101.138]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d91bsm26696110f8f.4.2026.07.06.01.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 01:13:37 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783325619; x=1783930419; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aU61oKG+/isTLdZ1XQnCgcZgwvZBm2Ysmmw68wcyM2U=;
        b=ZyV2bUnpBelcSuH9tTgqhcf3I/6TSxJUwsvD/sQfKo2lvLpl6By/90H/XQwa2ZEIQV
         MZTDsKzkPnK8iiAV+R+O9g7h58a/qOk71eyhwSHgmEUvbh7QVM+eJ+OsFXBksz0o1jO1
         h2Ua8/SAAalSv4TdZBbGon3sUl8Z0F7U6QI7+0jx7mVK2pY/kcZirKYjuT6Fsd8Rx3JX
         BEqFaQAafMGRNcRrOk806X/gkT/VNTR+y+esezhMbmdSD4x67mJ3n58yKy6lYKFfvHZ+
         JVoBN4fNrijy4EtZjCcXP6m4YJgDSRLN6t/aN7wOiZUjzgWOXLHQ3ZMBoh8uP41h5pb8
         CBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325619; x=1783930419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU61oKG+/isTLdZ1XQnCgcZgwvZBm2Ysmmw68wcyM2U=;
        b=ZeLDI42elizTJBb0QewRohfgAQmJHXN9601dctDS6nTLSE0H0J2AE/S4Vqj1z3mV0a
         60pXgYgPByde+yhKSd9wtIdktgaIE4RYrpy4/iFf9Ywbv/rMTVU/7dAkY7JNiB4EkIor
         x9ZUavK0FsfQ1Q7x+UegOCXN/G414LoasGsAkUbcd+aLyudwTo+Shc/A3vmr1LlC5/1w
         2h+p52xVPSEUMy04M2NQs+vtlFtjzc93ajuhkdTcMqombPEqutcQQrTVTW3sIlSqtmMm
         xcXRQZEeoW5APiUwajzS/2bsYcleWYM7doma+jGNH/CC96aE9UFBo4DG12q1rMKPFwjJ
         2NbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFqvIMWd58wnOQlSg2+qt3iDent57DIUyjxK31lto6PvcJ/BoAqGhZKxTPw6mMDw9F+zqk4PEBNMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC4/CynJUggouyAsgKP/IxVQQwngYRN2hd6XuE2Tbt5kwBy0sL
	4srKmrA72aRjh/mZNgIp2fM1iapI094aWa16nCey8JXBx4+u365ydZjUATtRSA==
X-Gm-Gg: AfdE7cnyC1XhooeGeyehZME2puYaE1dFPk8RopOme0Wk9EnmZoQ05LTdqqmZfJYaCqF
	ABEV0AdJVbOQExd8IpRRIcOD+9ornQVGgjxcTZYrVD/VGsUcwVY2HPCw5aLXTHOnjqE4Z7J8/FU
	z1Qx2sL3cpxjD7lvhX1Z0tYXZV8niNIqE1srsh6Npb7W4YFexr6mxricK+5guHjDUyM3YPP1+dx
	TznSY3LDK1FR9E9fBl7uICcS7rVVhckCHUDCmwdHmK90MFJvi5GpQE+hsnsE306BxF0GoBRM4tK
	Ec/cZP0ojmgmFyUaNVMg6Z3HS4Orn9T3YDWLZmGJVt30CD9bMvznPfiBgRmxzb/7AoInMxusCze
	GTNfj6uVszGihcZzgFbPKtlfSusmlgKq11FGoOUedDoZxM7QrFaZg79UH//ZGEy5iJBmWTwcVFw
	i0c1MTWt14y4rWfg==
X-Received: by 2002:a05:6000:d4f:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-47aac6d990amr7938128f8f.25.1783325618344;
        Mon, 06 Jul 2026 01:13:38 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org,
	x86@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	dwmw2@infradead.org,
	paul@xen.org,
	xen-devel@lists.xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH] KVM: x86/xen: Convert evtchn_ports from IDR to XArray
Date: Mon,  6 Jul 2026 11:13:11 +0300
Message-Id: <20260706081311.13633-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783325619-0D128D51-6A64DFD5/0/0
X-purgate-type: clean
X-purgate-size: 5312
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,xen.org,lists.xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:x86@kernel.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:dwmw2@infradead.org,m:paul@xen.org,m:xen-devel@lists.xenproject.org,m:frn1furkan10@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEAFE70DFBD

IDR is deprecated in favor of XArray: see
Documentation/core-api/idr.rst. Convert evtchn_ports accordingly.

kvm_xen_eventfd_assign()'s single-slot idr_alloc() becomes
xa_insert(), since it was really an insert-at-index, not an
allocation: -EBUSY replaces -ENOSPC, still mapped to -EEXIST.

kvm_xen_hcall_evtchn_send() drops its explicit rcu_read_lock(),
since xa_load() takes its own RCU read-side section internally.
evtchnfd's lifetime is still guaranteed by kvm->srcu.

xen_lock is left in place: it protects state beyond the map itself.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 arch/x86/include/asm/kvm_host.h |  3 ++-
 arch/x86/kvm/xen.c              | 34 ++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index d8700eb848b4..6c8542b32313 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -16,6 +16,7 @@
 #include <linux/irq_work.h>
 #include <linux/irq.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>
 
 #include <linux/kvm.h>
 #include <linux/kvm_para.h>
@@ -1290,7 +1291,7 @@ struct kvm_xen {
 	bool runstate_update_flag;
 	u8 upcall_vector;
 	struct gfn_to_pfn_cache shinfo_cache;
-	struct idr evtchn_ports;
+	struct xarray evtchn_ports;
 	unsigned long poll_mask[BITS_TO_LONGS(KVM_MAX_VCPUS)];
 
 	struct kvm_xen_hvm_config hvm_config;
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 694b31c1fcc9..754191e3bef7 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -2072,7 +2072,7 @@ static int kvm_xen_eventfd_update(struct kvm *kvm,
 
 	/* Protect writes to evtchnfd as well as the idr lookup.  */
 	mutex_lock(&kvm->arch.xen.xen_lock);
-	evtchnfd = idr_find(&kvm->arch.xen.evtchn_ports, port);
+	evtchnfd = xa_load(&kvm->arch.xen.evtchn_ports, port);
 
 	ret = -ENOENT;
 	if (!evtchnfd)
@@ -2166,13 +2166,13 @@ static int kvm_xen_eventfd_assign(struct kvm *kvm,
 	}
 
 	mutex_lock(&kvm->arch.xen.xen_lock);
-	ret = idr_alloc(&kvm->arch.xen.evtchn_ports, evtchnfd, port, port + 1,
+	ret = xa_insert(&kvm->arch.xen.evtchn_ports, port, evtchnfd,
 			GFP_KERNEL);
 	mutex_unlock(&kvm->arch.xen.xen_lock);
-	if (ret >= 0)
+	if (!ret)
 		return 0;
 
-	if (ret == -ENOSPC)
+	if (ret == -EBUSY)
 		ret = -EEXIST;
 out:
 	if (eventfd)
@@ -2187,7 +2187,7 @@ static int kvm_xen_eventfd_deassign(struct kvm *kvm, u32 port)
 	struct evtchnfd *evtchnfd;
 
 	mutex_lock(&kvm->arch.xen.xen_lock);
-	evtchnfd = idr_remove(&kvm->arch.xen.evtchn_ports, port);
+	evtchnfd = xa_erase(&kvm->arch.xen.evtchn_ports, port);
 	mutex_unlock(&kvm->arch.xen.xen_lock);
 
 	if (!evtchnfd)
@@ -2203,7 +2203,7 @@ static int kvm_xen_eventfd_deassign(struct kvm *kvm, u32 port)
 static int kvm_xen_eventfd_reset(struct kvm *kvm)
 {
 	struct evtchnfd *evtchnfd, **all_evtchnfds;
-	int i;
+	unsigned long i;
 	int n = 0;
 
 	mutex_lock(&kvm->arch.xen.xen_lock);
@@ -2213,7 +2213,7 @@ static int kvm_xen_eventfd_reset(struct kvm *kvm)
 	 * critical section, first collect all the evtchnfd objects
 	 * in an array as they are removed from evtchn_ports.
 	 */
-	idr_for_each_entry(&kvm->arch.xen.evtchn_ports, evtchnfd, i)
+	xa_for_each(&kvm->arch.xen.evtchn_ports, i, evtchnfd)
 		n++;
 
 	all_evtchnfds = kmalloc_objs(struct evtchnfd *, n);
@@ -2223,9 +2223,9 @@ static int kvm_xen_eventfd_reset(struct kvm *kvm)
 	}
 
 	n = 0;
-	idr_for_each_entry(&kvm->arch.xen.evtchn_ports, evtchnfd, i) {
+	xa_for_each(&kvm->arch.xen.evtchn_ports, i, evtchnfd) {
 		all_evtchnfds[n++] = evtchnfd;
-		idr_remove(&kvm->arch.xen.evtchn_ports, evtchnfd->send_port);
+		xa_erase(&kvm->arch.xen.evtchn_ports, evtchnfd->send_port);
 	}
 	mutex_unlock(&kvm->arch.xen.xen_lock);
 
@@ -2276,12 +2276,10 @@ static bool kvm_xen_hcall_evtchn_send(struct kvm_vcpu *vcpu, u64 param, u64 *r)
 	}
 
 	/*
-	 * evtchnfd is protected by kvm->srcu; the idr lookup instead
-	 * is protected by RCU.
+	 * evtchnfd is protected by kvm->srcu; the xa_load is RCU-safe
+	 * internally, no explicit rcu_read_lock() needed.
 	 */
-	rcu_read_lock();
-	evtchnfd = idr_find(&vcpu->kvm->arch.xen.evtchn_ports, send.port);
-	rcu_read_unlock();
+	evtchnfd = xa_load(&vcpu->kvm->arch.xen.evtchn_ports, send.port);
 	if (!evtchnfd)
 		return false;
 
@@ -2328,23 +2326,23 @@ void kvm_xen_destroy_vcpu(struct kvm_vcpu *vcpu)
 void kvm_xen_init_vm(struct kvm *kvm)
 {
 	mutex_init(&kvm->arch.xen.xen_lock);
-	idr_init(&kvm->arch.xen.evtchn_ports);
+	xa_init(&kvm->arch.xen.evtchn_ports);
 	kvm_gpc_init(&kvm->arch.xen.shinfo_cache, kvm);
 }
 
 void kvm_xen_destroy_vm(struct kvm *kvm)
 {
 	struct evtchnfd *evtchnfd;
-	int i;
+	unsigned long i;
 
 	kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
 
-	idr_for_each_entry(&kvm->arch.xen.evtchn_ports, evtchnfd, i) {
+	xa_for_each(&kvm->arch.xen.evtchn_ports, i, evtchnfd) {
 		if (!evtchnfd->deliver.port.port)
 			eventfd_ctx_put(evtchnfd->deliver.eventfd.ctx);
 		kfree(evtchnfd);
 	}
-	idr_destroy(&kvm->arch.xen.evtchn_ports);
+	xa_destroy(&kvm->arch.xen.evtchn_ports);
 
 	if (kvm->arch.xen.hvm_config.msr)
 		static_branch_slow_dec_deferred(&kvm_xen_enabled);
-- 
2.34.1


