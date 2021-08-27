Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E039D3F95AF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 10:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173473.316515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWoP-0000GQ-4y; Fri, 27 Aug 2021 08:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173473.316515; Fri, 27 Aug 2021 08:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWoP-0000Du-1g; Fri, 27 Aug 2021 08:02:05 +0000
Received: by outflank-mailman (input) for mailman id 173473;
 Fri, 27 Aug 2021 08:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCIF=NS=gmail.com=like.xu.linux@srs-us1.protection.inumbo.net>)
 id 1mJWoO-0000Do-1x
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 08:02:04 +0000
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c504e8f-a46e-4cf1-967f-91bd72729c84;
 Fri, 27 Aug 2021 08:02:03 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 17so5349929pgp.4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 01:02:03 -0700 (PDT)
Received: from Likes-MacBook-Pro.local ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id d15sm5390883pfd.115.2021.08.27.01.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 01:02:01 -0700 (PDT)
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
X-Inumbo-ID: 0c504e8f-a46e-4cf1-967f-91bd72729c84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cswhnu+o8kyBBIxzcLABF5rjUJeD7g9ZDLkYCWGDY3Y=;
        b=OqohcBTPo1bx+g+Uhy5kq56l7yUOxLEugEOLnrrHFGOE9q6fl4GSY8Z1g4cy28v8/H
         /L1w4p4Sg8b+ljDLiH9Gb1+GZJmzWV6ysvxelEZyI9D8Ew3G/bqelIPClmFt9as7aEEu
         nk0NoXFPWc3E70qTNobmYIJyHjN8UsaDJ8PQd9G9IThDwB0Rbm6047rMIfrYiIaoPol8
         83YdQMipI9Ef5oiCjCXNrqRhdPiM1lKbwLomBu4t1pdAiwluLh1kv3kaFwWDZpIPSD+6
         7uC9Sledzc7uwLe6e/cdddOBkwHJ7y8MIBF8ETXjcZo+yjuo33qz1BEAi+Qpk6kRxoes
         Y0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Cswhnu+o8kyBBIxzcLABF5rjUJeD7g9ZDLkYCWGDY3Y=;
        b=Hx5MhAXfpvPqPytgo0rldOe2YDtAADyiTudOjMM/DihuGDCPH9Y6sz7D+Y/5F+Y4k2
         pu5GkR09MmTqHqz7mKNo6PFwcFhbpk4DpVu5BuS0tCyNqq7flSJ2jmbQ7U/4PmEd7vVa
         o/dR2wj5icv9lVIgs3JnA7hsExCLk01KiF91l2tMdIHSaK/iU+gvMSkgD/M/qpkhtNbr
         J3q91bWJUQH00qcnTamEb0dfcW6WWpA5oUntuPx7Q1eSyRd+3myKVn0VW84Sn2qly7gb
         6ueYRWNCaBKGQwoMVv2ALuTezvuMvbCYdnf/XZQ2EngJw9UsfBr8Chj2+Jo7etoGcXEh
         K/nA==
X-Gm-Message-State: AOAM533CnqMFkryvPx7LaFuPVHhfAC+DKBoEI4EqyyFC/qSuPNsfK37K
	/W2nb+I1lMl4i1PIWd2BePU=
X-Google-Smtp-Source: ABdhPJz93kkIvT1VtOeM07aufGlsPC5VcsFoOF9FFZYwZ3Du0G+C1ytyrpDJPIrEyio9g37sV046Cg==
X-Received: by 2002:a05:6a00:1748:b0:3e2:ace4:82b7 with SMTP id j8-20020a056a00174800b003e2ace482b7mr7814214pfc.56.1630051322226;
        Fri, 27 Aug 2021 01:02:02 -0700 (PDT)
Subject: Re: [PATCH 00/15] perf: KVM: Fix, optimize, and clean up callbacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20210827005718.585190-1-seanjc@google.com>
 <fd3dcd6c-b3d5-4453-93fb-b46d0595534e@gmail.com>
 <YSiX9OPcrDsr3P4C@hirez.programming.kicks-ass.net>
From: Like Xu <like.xu.linux@gmail.com>
Organization: Tencent
Message-ID: <3bd4955a-1219-20b0-058b-d23f1e30aa77@gmail.com>
Date: Fri, 27 Aug 2021 16:01:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSiX9OPcrDsr3P4C@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27/8/2021 3:44 pm, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 02:52:25PM +0800, Like Xu wrote:
>> + STATIC BRANCH/CALL friends.
>>
>> On 27/8/2021 8:57 am, Sean Christopherson wrote:
>>> This started out as a small series[1] to fix a KVM bug related to Intel PT
>>> interrupt handling and snowballed horribly.
>>>
>>> The main problem being addressed is that the perf_guest_cbs are shared by
>>> all CPUs, can be nullified by KVM during module unload, and are not
>>> protected against concurrent access from NMI context.
>>
>> Shouldn't this be a generic issue of the static_call() usage ?
>>
>> At the beginning, we set up the static entry assuming perf_guest_cbs != NULL:
>>
>> 	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr) {
>> 		static_call_update(x86_guest_handle_intel_pt_intr,
>> 				   perf_guest_cbs->handle_intel_pt_intr);
>> 	}
>>
>> and then we unset the perf_guest_cbs and do the static function call like this:
>>
>> DECLARE_STATIC_CALL(x86_guest_handle_intel_pt_intr,
>> *(perf_guest_cbs->handle_intel_pt_intr));
>> static int handle_pmi_common(struct pt_regs *regs, u64 status)
>> {
>> 		...
>> 		if (!static_call(x86_guest_handle_intel_pt_intr)())
>> 			intel_pt_interrupt();
>> 		...
>> }
> 
> You just have to make sure all static_call() invocations that started
> before unreg are finished before continuing with the unload.
> synchronize_rcu() can help with that.

Do you mean something like that:

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 64e310ff4f3a..e7d310af7509 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8465,6 +8465,7 @@ void kvm_arch_exit(void)
  #endif
  	kvm_lapic_exit();
  	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	synchronize_rcu();

  	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
  		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
diff --git a/kernel/events/core.c b/kernel/events/core.c
index e466fc8176e1..63ae56c5d133 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6508,6 +6508,7 @@ EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
  int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
  {
  	perf_guest_cbs = NULL;
+	arch_perf_update_guest_cbs();
  	return 0;
  }
  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);

> 
> This is module unload 101. Nothing specific to static_call().
> 

