Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF6413E96
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192056.342341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpwl-0001aA-SZ; Wed, 22 Sep 2021 00:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192056.342341; Wed, 22 Sep 2021 00:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpwl-0001XJ-NP; Wed, 22 Sep 2021 00:17:11 +0000
Received: by outflank-mailman (input) for mailman id 192056;
 Wed, 22 Sep 2021 00:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuAi=OM=flex--seanjc.bounces.google.com=3dnNKYQYKCZcJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@srs-us1.protection.inumbo.net>)
 id 1mSpnI-0000pt-SI
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:07:24 +0000
Received: from mail-qv1-xf4a.google.com (unknown [2607:f8b0:4864:20::f4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61d8f6f0-0070-4e6d-b646-8742924dc860;
 Wed, 22 Sep 2021 00:06:14 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id
 q17-20020a0cf5d1000000b00380e60ef363so7785089qvm.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:06:14 -0700 (PDT)
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
X-Inumbo-ID: 61d8f6f0-0070-4e6d-b646-8742924dc860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=hykBvrf8DnzH3Q8YHjL/Y0GXRoABX5ADBK+0/12MWfw=;
        b=jKopPzwiybt9fB96grPLhcmov4eHABK3Rn1V3+jC89gDcrIoprd65bnGYY9DP7ju4b
         85kkPs7ZPkL8WlWgMXplyIY3a/z2qIzxH+/FI3XjcdmrliPkx8nPrp2a5kX5Pjc1ywob
         ByTND1+iT+q5EbaKv8lVZV94ko5nNdJrrzXW+BlrNXXtl2FDDO+EPFHPKuUM6DjPG5xB
         A3Kj4DmZiicnBCVFqv70LMvPNdNZybwucvdKO2/8ODrWoNpkysFbo74lUlyrUvFEKlBi
         o1a2jdJRabm/xdF8RFOfzaw+a+ydqqTbWa982xz/HRYZHvnoWhQfVxgfpJMjXOW1pVY7
         0TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=hykBvrf8DnzH3Q8YHjL/Y0GXRoABX5ADBK+0/12MWfw=;
        b=aNDw7PZ7ZEtFvBhA9Usrb7eZVYKFYWfOb9iYwAxf66uMKc9zpt5gYVkYKkaqTT3MpI
         U8q090Ivc6YuaA6nu/iowSfVon20qONc+BHs5c31WzzL+Yzwla5hIiET/2QG25yy8Kcw
         TH2QJBkaZZKCboHYIqa+fsSTi/S20eb6kgTUgr2H7Wxn16/LYZD7PRjHT/ggIlTo3H9a
         da3Lb9IloKjkME/ZK5uASZmJ79VF1IOMFH1T61k2/4MzgoEJoQBu9T14hFQUeKEho9Ov
         tGE8O5JU2ob2EmO5OcW3ti3dn0GhhhTEF68bXuG5fX36z0LVeeul76lmJN3pSuTRXdnD
         IYjQ==
X-Gm-Message-State: AOAM5337e1ErbLbJrpVm/xvzA/uaJE4vmwcyEXoad/Fqc0XmwXS2jl8H
	SFooQ0H0QpH9g71c0rS5qYMEf/7VUVA=
X-Google-Smtp-Source: ABdhPJy5GySvAYc4kjGUgxPeiS0d5MaL33kPbz4EVAybMqnGUcP/K+XpH6FqRymRPMD4ga0cIEmdn6OzCzE=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1143:: with SMTP id
 p3mr39279294ybu.420.1632269174363; Tue, 21 Sep 2021 17:06:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:31 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-15-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 14/16] KVM: arm64: Convert to the generic perf callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Artem Kashkanov <artem.kashkanov@intel.com>, Like Xu <like.xu.linux@gmail.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop arm64's version of the callbacks in favor of the callbacks provided
by generic KVM, which are semantically identical.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/perf.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 3e99ac4ab2d6..0b902e0d5b5d 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,45 +13,15 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
-static unsigned int kvm_guest_state(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-	unsigned int state;
-
-	if (!vcpu)
-		return 0;
-
-	state = PERF_GUEST_ACTIVE;
-	if (!vcpu_mode_priv(vcpu))
-		state |= PERF_GUEST_USER;
-
-	return state;
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return *vcpu_pc(vcpu);
-}
-
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.state		= kvm_guest_state,
-	.get_ip		= kvm_get_guest_ip,
-};
-
 void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_register_perf_callbacks(NULL);
 }
 
 void kvm_perf_teardown(void)
 {
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_unregister_perf_callbacks();
 }
-- 
2.33.0.464.g1972c5931b-goog


