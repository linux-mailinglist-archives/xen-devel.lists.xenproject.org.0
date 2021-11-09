Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6738444B94A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 00:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224141.387249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaLr-0005Do-6W; Tue, 09 Nov 2021 23:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224141.387249; Tue, 09 Nov 2021 23:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaLr-0005C2-3O; Tue, 09 Nov 2021 23:16:27 +0000
Received: by outflank-mailman (input) for mailman id 224141;
 Tue, 09 Nov 2021 23:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j19n=P4=google.com=seanjc@srs-se1.protection.inumbo.net>)
 id 1mkaLp-0005Bw-QE
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 23:16:25 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e1a33f9-41b3-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 00:16:24 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id z6so867207pfe.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Nov 2021 15:16:24 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y9sm3778534pjt.27.2021.11.09.15.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 15:16:21 -0800 (PST)
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
X-Inumbo-ID: 0e1a33f9-41b3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3iDOWhiMYVH4J/xrL04EpHxxB+pfcqrny8aFQ+9uha4=;
        b=VzrYqN0K7z0Tuv/HZEo98TZC4k8HLv0Bi89F+eTM7VIgt8Hd0SbLQLu1jfW8/8S8fv
         tzfRT3bkeDhN2PHc31X4H7Y8DtkUZW4N710CDOsPQBTQtnUWIqdFY6F7ije1Cnoj6Q+4
         ppkFKf+QIHaiDGp0vt5e+c8PAWdm9ufyP9kMeDz/DPFOwmptdhrUt8KETig+vfK9Hq/N
         lJFBQKcjKRbfCPyMg8YrBLHsmR9t18pjj8BDwHYytNF7IYDGiDNiRxMB/BsE6ChUEAKz
         f1UvA+hVEnhTbq/8QIGBSxxEpmi70akY31pDC1IU1AtgFWCS0WgRlyVxJZndzjJCKeh8
         qtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3iDOWhiMYVH4J/xrL04EpHxxB+pfcqrny8aFQ+9uha4=;
        b=Fsk4kACmJcLxE/dTr0Y1Zb3KBol7jX0jerw0OweFwvbHKkUPzBfBHHSviHMVvTxxb3
         BX9PVkUcPG585I6HWjJgR0ZCV8VpPGijeMAhxwrPnyX82+f4vWNUPg3Ji469tFvSriEa
         5nfs6Qm+Jq2BIDIcLQkVBtO1jqfEpmqX45CdxHWmQpJ6DS0jyClQKKqquS/wpnayLOki
         it8AEjsThGFuSf3PSgJxbAiP92AFOoBpKwk4XlZiTrvgtSsX+w1pq0P5d/doYvvZtiQg
         T6zUt4o5xbNew1hhQnN9yWwftpLnKl8bnruLQdqkvosIhKoNXoLEZHs/DkaQHq3WUrPu
         uJ2g==
X-Gm-Message-State: AOAM531eWylUgUF0voUltpumqVG8W3MENcd1X5mm6jr6riUSH0bI7RuM
	epvdpiXWA3PEoljJq1Zh0FlMIA==
X-Google-Smtp-Source: ABdhPJzkNcQryrFCiNL8a59OsXtVtP1KqfiFu5fhzV9PARw6xea5VYu1cXC91MqNZo8wxwwswlX9UA==
X-Received: by 2002:a63:2c0f:: with SMTP id s15mr9035602pgs.6.1636499782405;
        Tue, 09 Nov 2021 15:16:22 -0800 (PST)
Date: Tue, 9 Nov 2021 23:16:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v3 15/16] KVM: arm64: Drop perf.c and fold its tiny bits
 of code into arm.c / pmu.c
Message-ID: <YYsBQvJPrG5Qrm6J@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-16-seanjc@google.com>
 <87tuhnq4it.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuhnq4it.wl-maz@kernel.org>

On Mon, Oct 11, 2021, Marc Zyngier wrote:
> On Wed, 22 Sep 2021 01:05:32 +0100,
> Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> > index 864b9997efb2..42270676498d 100644
> > --- a/include/kvm/arm_pmu.h
> > +++ b/include/kvm/arm_pmu.h
> > @@ -14,6 +14,7 @@
> >  #define ARMV8_PMU_MAX_COUNTER_PAIRS	((ARMV8_PMU_MAX_COUNTERS + 1) >> 1)
> >  
> >  DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
> > +void kvm_pmu_init(void);
> >  
> >  static __always_inline bool kvm_arm_support_pmu_v3(void)
> >  {
> 
> Note that this patch is now conflicting with e840f42a4992 ("KVM:
> arm64: Fix PMU probe ordering"), which was merged in -rc4. Moving the
> static key definition to arch/arm64/kvm/pmu-emul.c and getting rid of
> kvm_pmu_init() altogether should be enough to resolve it.

Defining kvm_arm_pmu_available in pmu-emul.c doesn't work as-is because pmu-emul.c
depends on CONFIG_HW_PERF_EVENTS=y.  Since pmu-emul.c is the only path that enables
the key, my plan is to add a prep match to bury kvm_arm_pmu_available behind the
existing #ifdef CONFIG_HW_PERF_EVENTS in arm_pmu.h and add a stub
for kvm_arm_support_pmu_v3().  The only ugly part is that the KVM_NVHE_ALIAS() also
gains an #ifdef, but that doesn't seem too bad.

