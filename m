Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66672442327
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219427.380242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUd-0008Q9-Ga; Mon, 01 Nov 2021 22:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219427.380242; Mon, 01 Nov 2021 22:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUd-0008OD-CY; Mon, 01 Nov 2021 22:09:27 +0000
Received: by outflank-mailman (input) for mailman id 219427;
 Mon, 01 Nov 2021 22:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUb-0007pr-N9
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5c9453dd-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:19 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-eXk5BEdqNLmhJzQa-EAuKg-1; Mon, 01 Nov 2021 18:09:18 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3974632wro.19
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:18 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r1sm726567wmr.36.2021.11.01.15.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:16 -0700 (PDT)
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
X-Inumbo-ID: 5c9453dd-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSQaBGBpJWy0B8DIEKBqKdfykrzA4ow4TzC1HWV6kH0=;
	b=hNSNMXU2Y/ryCTwvF3V47yRHi+POxwBr4glDBEfYK0S0Ns5en9qYlDbeWezXQMwMhHb6MF
	OWKSfyUcZnxqlywL8QICTVFh9cuj2k3GFG93i+t2kCnnKwFJvGDewoZ3tDcjlv9S0F5Y0s
	PZGrDGd+EHen92OgTkJja7gRK8dXI8U=
X-MC-Unique: eXk5BEdqNLmhJzQa-EAuKg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hSQaBGBpJWy0B8DIEKBqKdfykrzA4ow4TzC1HWV6kH0=;
        b=S365fwufjsHeXo+5HWY4KYuTzdl6YXz4Gra/SjD4LMpAgriVyQ3gQKtDfvZo7IVuWf
         qDST12A2D0pTi5FfKNInhTX/GNqzDVMj32qXwZSsi/u+18lSTrrOiZPHCg4s5t2gTkL+
         bNb+0f21C8Y67ejQyZRLA2n4a3NhKgGI5BuBxt9fo5ZwNIm+7eICiuvXGLbNsZ7wr9oD
         DHHkyLCF5Ib72sV1GQWej5YQSsH2xybrbA7/1yT66kJFzkIMtUTomW4usMk4GLDzd3IH
         Z89LMxTYw8rbh4J0ODcy/AmAadHeQTcs0SqwUocW+ZkRL0vgLwEQBEamcyPmYGz46Qw5
         it7g==
X-Gm-Message-State: AOAM533A6yKO9SNUg2K8jOG8fGzHiPdLiz2noI22B9FJQIcFDUcNIJWP
	aNCKVakOoNThu/NI+2yldGAqiaythCbT+/ZLZ+UepEAp4zLIwD3WX8zT8otw1dF4CSKhijGF6BM
	qfHmGejZfp9su6GxQRViK7abi2Ro=
X-Received: by 2002:adf:a78a:: with SMTP id j10mr42370726wrc.105.1635804557396;
        Mon, 01 Nov 2021 15:09:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHSBNKTiLO5JlEV3iFexkub7waHAM8W6BpiJr+wCxnuH8FeGBZ5Ook1cyDpaRUcX/w/4yrnA==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr42370691wrc.105.1635804557180;
        Mon, 01 Nov 2021 15:09:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?= =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>
Subject: [PULL 02/20] KVM: introduce dirty_pages and kvm_dirty_ring_enabled
Date: Mon,  1 Nov 2021 23:08:54 +0100
Message-Id: <20211101220912.10039-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

dirty_pages is used to calculate dirtyrate via dirty ring, when
enabled, kvm-reaper will increase the dirty pages after gfns
being dirtied.

kvm_dirty_ring_enabled shows if kvm-reaper is working. dirtyrate
thread could use it to check if measurement can base on dirty
ring feature.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <fee5fb2ab17ec2159405fc54a3cff8e02322f816.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/core/cpu.h  | 1 +
 include/sysemu/kvm.h   | 1 +
 accel/kvm/kvm-all.c    | 7 +++++++
 accel/stubs/kvm-stub.c | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1a10497af3..e948e81f1a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -381,6 +381,7 @@ struct CPUState {
     struct kvm_run *kvm_run;
     struct kvm_dirty_gfn *kvm_dirty_gfns;
     uint32_t kvm_fetch_index;
+    uint64_t dirty_pages;
 
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..7b22aeb6ae 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,5 @@ bool kvm_cpu_check_are_resettable(void);
 
 bool kvm_arch_cpu_check_are_resettable(void);
 
+bool kvm_dirty_ring_enabled(void);
 #endif
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index db8d83b137..eecd8031cf 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -469,6 +469,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     cpu->kvm_fd = ret;
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
+    cpu->dirty_pages = 0;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size < 0) {
@@ -743,6 +744,7 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
         count++;
     }
     cpu->kvm_fetch_index = fetch;
+    cpu->dirty_pages += count;
 
     return count;
 }
@@ -2296,6 +2298,11 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
     return vcpu_id >= 0 && vcpu_id < kvm_max_vcpu_id(s);
 }
 
+bool kvm_dirty_ring_enabled(void)
+{
+    return kvm_state->kvm_dirty_ring_size ? true : false;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5b1d00a222..5319573e00 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -147,4 +147,9 @@ bool kvm_arm_supports_user_irq(void)
 {
     return false;
 }
+
+bool kvm_dirty_ring_enabled(void)
+{
+    return false;
+}
 #endif
-- 
2.33.1


