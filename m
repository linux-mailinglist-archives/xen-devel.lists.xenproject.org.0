Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E4413E98
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192058.342352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpwp-00023D-9e; Wed, 22 Sep 2021 00:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192058.342352; Wed, 22 Sep 2021 00:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpwp-0001zh-4H; Wed, 22 Sep 2021 00:17:15 +0000
Received: by outflank-mailman (input) for mailman id 192058;
 Wed, 22 Sep 2021 00:17:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cs+K=OM=flex--seanjc.bounces.google.com=3enNKYQYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-us1.protection.inumbo.net>)
 id 1mSpnc-0000pt-Sp
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:07:44 +0000
Received: from mail-qk1-x74a.google.com (unknown [2607:f8b0:4864:20::74a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c89c8772-a935-4c12-85fa-e239b1d93411;
 Wed, 22 Sep 2021 00:06:19 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id
 bm12-20020a05620a198c00b00432e14ddb99so5306451qkb.21
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:06:19 -0700 (PDT)
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
X-Inumbo-ID: c89c8772-a935-4c12-85fa-e239b1d93411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=4BBDHyzTmFJD2PGtjmXQGbVqPzRCZc8ppu5cY3KZ5Y8=;
        b=i1hLF6bC7QippVnwD+QfcurzwPql0DTYdtvpNMOXEcTNGevY7UnIQHp4F8TFxhWOcC
         y5khcTlTsxcY03DM6I7OGwJdsNRusHePnZs48VJgz9iDl9BCd/WdBAHgBd08BkVlEctl
         qgkp34acvdJvQRinIA310i906+1pI4VRGGbTHUSEWOTyISF582eEBN0uohWrXglJ4Vha
         UiRiAJR9+rHm1hSoN64l3MLHm8i51hrtd5lKdh0LN16chuzJEtOj6NO2pvuQiZZnchZT
         2+/Nzn1kX3D5dvOeb3mhXnOtnZBTLnXfaqpsFhvkCaK7qjG4cSZxh2Y/t71DvQNuI5L1
         pIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=4BBDHyzTmFJD2PGtjmXQGbVqPzRCZc8ppu5cY3KZ5Y8=;
        b=JRbKpsY9gHOT9MaMelgARMT1JqTf84UIaAZLivNewsuY2JBkCA56Iy8K+4zobnRMdp
         tK4K7AypNAw0CpLpv3e1HjnsFRLAvXMp+qmjS9dNxTG3ALgc9iJ3Y4IAeyIwpd/wXdDB
         eJL5ezlsvwsrYx74N0kb3iexuK3AeFIE82ZdrgbXGv1WHtfe4ZhfEhd472Hq8fJgx10o
         97urcNE24NWiIhB1OZxpDbuK1Ri8JTNLm+A0ugozabqY+0QtXDlz6te/3kRiinBYtwYi
         RCn7WIuH74Lium/xTqXVY00t7kSr89OUlQr3HNfFmP6/7bCCcL5x0jVxfDl0otu57h4T
         6u+w==
X-Gm-Message-State: AOAM5322EB73JOy3sUe3ClvPQWl5LMtVkzX7lyLJxgPfxO8cxeJHsZwo
	KZEYJ7P6NoCS57v4W4t5rQuu3gYPhqQ=
X-Google-Smtp-Source: ABdhPJzV8/bAA+bVdBd7d54Vy+1c6C23hub/FF/gkHwdARHRitfqPelJ1Pr98qSi4K4qg/f1+Xhzcbcxu/4=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:ad4:466a:: with SMTP id z10mr32596974qvv.47.1632269178759;
 Tue, 21 Sep 2021 17:06:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:33 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-17-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 16/16] perf: Drop guest callback (un)register stubs
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

Drop perf's stubs for (un)registering guest callbacks now that KVM
registration of callbacks is hidden behind GUEST_PERF_EVENTS=y.  The only
other user is x86 XEN_PV, and x86 unconditionally selects PERF_EVENTS.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index d582dfeb4e20..20327d1046bb 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1505,11 +1505,6 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
 static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
-static inline void perf_register_guest_info_callbacks
-(struct perf_guest_info_callbacks *cbs)					{ }
-static inline void perf_unregister_guest_info_callbacks
-(struct perf_guest_info_callbacks *cbs)					{ }
-
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
 
 typedef int (perf_ksymbol_get_name_f)(char *name, int name_len, void *data);
-- 
2.33.0.464.g1972c5931b-goog


