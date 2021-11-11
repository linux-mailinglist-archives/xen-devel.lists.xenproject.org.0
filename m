Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09C44D277
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 08:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224637.388046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml4UK-0002QX-IU; Thu, 11 Nov 2021 07:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224637.388046; Thu, 11 Nov 2021 07:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml4UK-0002No-EW; Thu, 11 Nov 2021 07:27:12 +0000
Received: by outflank-mailman (input) for mailman id 224637;
 Thu, 11 Nov 2021 07:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pxq=P6=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1ml4UJ-0002Ni-BR
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 07:27:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66e7eec-42c0-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 08:27:08 +0100 (CET)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-pdruPQAIOjyMHOxUqDgBaw-1; Thu, 11 Nov 2021 02:27:03 -0500
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a05640250cd00b003e35ea5357fso4651796edb.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 23:27:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r22sm821651ejd.109.2021.11.10.23.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:27:01 -0800 (PST)
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
X-Inumbo-ID: c66e7eec-42c0-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636615627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKrJW8F5NToX1nYO957BayIs9Dq3P1qwVdj4d8BfHuc=;
	b=EWjYAjKanzvzVmqNcyTlgfhnNj9Ny1srqJ/+RKNYUK4kTqdcKqBJLp8h25X464wkK81nAr
	NroVfszAJ7fcXtUhc+Qs3Q6AmsmB+cGZVUjfROSozaL9bex4yEyKWtraM6zkYdeQsjUCn2
	ZdLEFTHFGQTg9u8lV76AvN0Cc86MA04=
X-MC-Unique: pdruPQAIOjyMHOxUqDgBaw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kKrJW8F5NToX1nYO957BayIs9Dq3P1qwVdj4d8BfHuc=;
        b=cn0YnOtu4pIWnBzvoRazc2IsAtJa0+HE330FlJyFqtUwrqlEI6AtJcOudcAYojryMm
         Egormzuoo2q5w9EBHLGz9wnBeYWKeZaJ/oWULQROi+kUDEM/avrTU5oiitLUY1xbDybt
         QipU4ykeL+gWRduM22ChuaKCm3RrJqMH3pcMy5O8nmLiBmEVWJqwn57Hq73ErVpqK7Fd
         BLGs60IAOSGJcQnTSKaQlFRveN1Ul61at2kA9aARY67cWrZZQyl+pgkmFol+AjAMi4Pi
         pkBomgziU+1VO6JFnUAMTRULDC9LGCAfAEaCr92xoW87iCnV4Lnsb5xaIJzWLZUqRZ8R
         MVrg==
X-Gm-Message-State: AOAM532b6lZonWqiMr0L6xwD6sGanoMLXYE/jvonPIbe+W7uXFZvtQQW
	cDg3TN8hH6q5UsxrQJkVTHqmH9BlK3wf6gvrWMOa1WcgIY+RoVlsfoVAx4PCX60qoTO5Tk407ca
	MedqXautNq6CQ0ZEBAxE/CewdXpk=
X-Received: by 2002:a05:6402:4403:: with SMTP id y3mr7124340eda.163.1636615622059;
        Wed, 10 Nov 2021 23:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTpHPtJJgKdf3a1EjIi+ncJMYWN6M7NH5BDLr0bfrPMJpGogO5RDb023uvqL0d//3hxKxDnQ==
X-Received: by 2002:a05:6402:4403:: with SMTP id y3mr7124294eda.163.1636615621811;
        Wed, 10 Nov 2021 23:27:01 -0800 (PST)
Message-ID: <d784dc27-72d0-d64f-e1f4-a2b9a5f86dd4@redhat.com>
Date: Thu, 11 Nov 2021 08:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/17] perf: Protect perf_guest_cbs with RCU
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-2-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211111020738.2512932-2-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/21 03:07, Sean Christopherson wrote:
> Protect perf_guest_cbs with RCU to fix multiple possible errors.  Luckily,
> all paths that read perf_guest_cbs already require RCU protection, e.g. to
> protect the callback chains, so only the direct perf_guest_cbs touchpoints
> need to be modified.
> 
> Bug #1 is a simple lack of WRITE_ONCE/READ_ONCE behavior to ensure
> perf_guest_cbs isn't reloaded between a !NULL check and a dereference.
> Fixed via the READ_ONCE() in rcu_dereference().
> 
> Bug #2 is that on weakly-ordered architectures, updates to the callbacks
> themselves are not guaranteed to be visible before the pointer is made
> visible to readers.  Fixed by the smp_store_release() in
> rcu_assign_pointer() when the new pointer is non-NULL.
> 
> Bug #3 is that, because the callbacks are global, it's possible for
> readers to run in parallel with an unregisters, and thus a module
> implementing the callbacks can be unloaded while readers are in flight,
> resulting in a use-after-free.  Fixed by a synchronize_rcu() call when
> unregistering callbacks.
> 
> Bug #1 escaped notice because it's extremely unlikely a compiler will
> reload perf_guest_cbs in this sequence.  perf_guest_cbs does get reloaded
> for future derefs, e.g. for ->is_user_mode(), but the ->is_in_guest()
> guard all but guarantees the consumer will win the race, e.g. to nullify
> perf_guest_cbs, KVM has to completely exit the guest and teardown down
> all VMs before KVM start its module unload / unregister sequence.  This
> also makes it all but impossible to encounter bug #3.
> 
> Bug #2 has not been a problem because all architectures that register
> callbacks are strongly ordered and/or have a static set of callbacks.
> 
> But with help, unloading kvm_intel can trigger bug #1 e.g. wrapping
> perf_guest_cbs with READ_ONCE in perf_misc_flags() while spamming
> kvm_intel module load/unload leads to:
> 
>    BUG: kernel NULL pointer dereference, address: 0000000000000000
>    #PF: supervisor read access in kernel mode
>    #PF: error_code(0x0000) - not-present page
>    PGD 0 P4D 0
>    Oops: 0000 [#1] PREEMPT SMP
>    CPU: 6 PID: 1825 Comm: stress Not tainted 5.14.0-rc2+ #459
>    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
>    RIP: 0010:perf_misc_flags+0x1c/0x70
>    Call Trace:
>     perf_prepare_sample+0x53/0x6b0
>     perf_event_output_forward+0x67/0x160
>     __perf_event_overflow+0x52/0xf0
>     handle_pmi_common+0x207/0x300
>     intel_pmu_handle_irq+0xcf/0x410
>     perf_event_nmi_handler+0x28/0x50
>     nmi_handle+0xc7/0x260
>     default_do_nmi+0x6b/0x170
>     exc_nmi+0x103/0x130
>     asm_exc_nmi+0x76/0xbf
> 
> Fixes: 39447b386c84 ("perf: Enhance perf to allow for guest statistic collection from host")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

One nit:

>   EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
>   
>   int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>   {
> -	perf_guest_cbs = NULL;
> +	if (WARN_ON_ONCE(rcu_access_pointer(perf_guest_cbs) != cbs))
> +		return -EINVAL;
> +
> +	rcu_assign_pointer(perf_guest_cbs, NULL);
> +	synchronize_rcu();
This technically could be RCU_INIT_POINTER but it's not worth a respin.
There are dozens of other occurrences, and if somebody wanted they
could use Coccinelle to fix all of them.

Paolo


