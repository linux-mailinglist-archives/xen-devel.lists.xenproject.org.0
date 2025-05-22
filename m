Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C76AC184F
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994754.1377629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiZ-0002Rp-Oa; Thu, 22 May 2025 23:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994754.1377629; Thu, 22 May 2025 23:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiZ-0002N2-JL; Thu, 22 May 2025 23:52:55 +0000
Received: by outflank-mailman (input) for mailman id 994754;
 Thu, 22 May 2025 23:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j741=YG=flex--seanjc.bounces.google.com=30rgvaAYKCUs5rn0wpt11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@srs-se1.protection.inumbo.net>)
 id 1uIFiX-0007r8-0D
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:53 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df4313dd-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:52 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-30e6980471cso6916035a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:52 -0700 (PDT)
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
X-Inumbo-ID: df4313dd-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957971; x=1748562771; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pJUovYaxFJgcXRp1TDFKS/NrFefgEp1AkGzEV1OM9Zc=;
        b=tciWqeq/yd7qi1qocfjWZN36EgEvzsjUGIhgmQEUgGapNR9y4XD3tVprslkOkuwRvM
         wzGL/lAFwdcZZ4tZM4PKqtDhM38u6//Zc61KLMeCPfhlsZZ/v8hPF81PqNBvqCN5uivw
         AIA6/FHU1ixmxc/WX67DttCAV6GCsRPxkvwWL8xV/+KUBaVItzdIc5pFDO/rjI3woAdl
         USPGc49sOuQ2fdm7vQqsuC2S8OOQjcNdwTh9ShXXjWf0K3SMmfjWvOIMkQIEkohBwmNN
         VIJehnKI5LorTndn0GiVElmot/wmSSNDkPrW933M1PV9hiLDbFfmG8jbaH5YVGqre6CL
         ZYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957971; x=1748562771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJUovYaxFJgcXRp1TDFKS/NrFefgEp1AkGzEV1OM9Zc=;
        b=OkES+3tVYSyYG6d+BZheEy1OSsGE7Qd6AeoTNZdLWJJjtnQ5Ootu0c6/ewg4GlNhih
         m3AY/Jiy0DdGL01IAoLHWn4keDmrgeKdxYl0SyjOHvWJLPrXC99aj7xO2xcNRLZ5VRpQ
         H/i+dVN6USSElusbiUjzUC8pAFX8wzbeZK+imoFe0mTiqmtQFmP94hHeM79Ef7siEuQu
         8IFuyG5qj97SbNaITh2as9nT5j0vfgDM7u8qpkC76PH7yAEr/f/aLXfVYyybyO6gj4cP
         m57r0haZ70P2hINY50ofwqsfc0DRBh5Dbt9pbPWo0Vjf7wj7U9CuGFQr3+NJfe6uSbzu
         j8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRlj59Xq3FHHTqIR3hv1X8thTzatmiajL+PrWJ75gtOyduCuStLmHNNlSW8j0sWz5bvL8tiLvb1C0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpWZUr5ftt2soth/UMq2W3W3WNFpnY7wFp3q55nGuBb4wQ2H8f
	vmkPskXXerNk3727EW32EzMdgNOQCqn4AXRxL/W8tUWMIEFNduQ8kjNwvnUP5aziQ6Se7kwJ268
	FynlV8A==
X-Google-Smtp-Source: AGHT+IEDndqxTWcCtq5oGwy52YECfaW+Ize1PqvGwCK7FSF7/oiShVYNO6fCIsKX/sBpVCvd/V18cyz4IiY=
X-Received: from pjx8.prod.google.com ([2002:a17:90b:5688:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c2:b0:2ee:edae:780
 with SMTP id 98e67ed59e1d1-30e7d548c90mr43873310a91.15.1747957970976; Thu, 22
 May 2025 16:52:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:20 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-11-seanjc@google.com>
Subject: [PATCH v3 10/13] KVM: Drop sanity check that per-VM list of irqfds is unique
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that the eventfd's waitqueue ensures it has at most one priority
waiter, i.e. prevents KVM from binding multiple irqfds to one eventfd,
drop KVM's sanity check that eventfds are unique for a single VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 7b2e1f858f6d..d5258fd16033 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -288,7 +288,6 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 {
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
-	struct kvm_kernel_irqfd *tmp;
 	struct kvm *kvm = p->kvm;
 
 	/*
@@ -328,16 +327,6 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	if (p->ret)
 		goto out;
 
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-
-		WARN_ON_ONCE(1);
-		/* This fd is used for another irq already. */
-		p->ret = -EBUSY;
-		goto out;
-	}
-
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
 
 out:
-- 
2.49.0.1151.ga128411c76-goog


