Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FB44CFF1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224569.387974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkze8-0005C4-Ja; Thu, 11 Nov 2021 02:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224569.387974; Thu, 11 Nov 2021 02:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkze8-000597-Fo; Thu, 11 Nov 2021 02:17:00 +0000
Received: by outflank-mailman (input) for mailman id 224569;
 Thu, 11 Nov 2021 02:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rInb=P6=flex--seanjc.bounces.google.com=3CHuMYQYKCUMxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1mkzVd-0006EI-53
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:08:13 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37518b66-4294-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 03:08:10 +0100 (CET)
Received: by mail-pg1-x549.google.com with SMTP id
 r7-20020a63ce47000000b002a5cadd2f25so2489888pgi.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:08:10 -0800 (PST)
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
X-Inumbo-ID: 37518b66-4294-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=OsKSO91+IQOd1IkS1z06+WXQrIrb9btCelj8IT/rfjk=;
        b=UjO1QsSOEJxaGsYGL3Apu9warF+RLCb7N0O8lrT4uA7hcwAOXn0B9aIpQDfjrTQVV9
         GpUiUx0P3EvrUcerrFYJ43Q90SJS/Gs68/jHuhbKg4LsEjNWoUkdOiAjjqiiHSBSgjMG
         R7y7UnI6YE9rNtmXbNbVt3sbKA6jvhnnGELbGyK4SRL2xwd9sX+q3f8jF57/MEhgUPD+
         t/+a9Sg8Ta3/1ptTGbTPekcMLXxNe7dS033Slo6cfYWGcnVi+krIVbSkYZwCP0WX4pZh
         GTnRwbyA69uU8U608boW9DzCYJ+6PE43F4bM/b41jK5pMY5lvLJwB8NslG8L5Jh5BxcV
         /FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=OsKSO91+IQOd1IkS1z06+WXQrIrb9btCelj8IT/rfjk=;
        b=jzTJFtad77XKAjspXpiyaHJNm3+SbtZ7TiIal7Imv6zOiPWQ1AFNb/SlHJthDuVhfq
         I0sZYD9rF/W5Rq0CVfge2MmyaU3CgSZyjCpW8o5cS2gov1df/lqdGuXMV/8DxEcW9mPk
         fPCf4n2AE0Y8nyIJYwnsT69zLQtzxPaaoKwUE+hZ0nbNle+VetXT9sfkD7DTv7tK+hNS
         g6nsCMS4+Z5h/J1BpMrs9QH9pjmssEepxThyWxG9bCyUCIQbaIG5lUO4L4ICfP8l6nEU
         1UYVApzpnN2kg8jsTmucLL6Fn78mPOiR+vcNFuhlaGhpVEa+Y/5K0hm2XG0CkE0rbH8Y
         KpIA==
X-Gm-Message-State: AOAM5326EG2r86pxHU+zSR/ZZ1ErknJ/7CY2kNZvWB6tlt1+XPdy5wu4
	i02HpPbdgaou9F7iuOF7gVtkRQeI78k=
X-Google-Smtp-Source: ABdhPJyHlT5oqharcB3QQjRQ4qoO/10ujhci23RJu5uAP9JkYDshL4v2uHHALGrgFqagvzcYI5ZLh/T3x7g=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:1950:: with SMTP id
 16mr4223713pjh.126.1636596488573; Wed, 10 Nov 2021 18:08:08 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:38 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-18-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 17/17] perf: Drop guest callback (un)register stubs
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
	Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop perf's stubs for (un)registering guest callbacks now that KVM
registration of callbacks is hidden behind GUEST_PERF_EVENTS=y.  The only
other user is x86 XEN_PV, and x86 unconditionally selects PERF_EVENTS.

No functional change intended.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0ac7d867ca0c..7b7525e9155f 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1511,11 +1511,6 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
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
2.34.0.rc0.344.g81b53c2807-goog


