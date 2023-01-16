Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B966C2E1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478778.742151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQtb-0006X4-8C; Mon, 16 Jan 2023 14:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478778.742151; Mon, 16 Jan 2023 14:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQtb-0006VF-4V; Mon, 16 Jan 2023 14:55:35 +0000
Received: by outflank-mailman (input) for mailman id 478778;
 Mon, 16 Jan 2023 14:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6RV=5N=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pHQtZ-0006V5-NA
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:55:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2665525-95ad-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:55:32 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-mKaQAv_TNUGhncv7dQlH_w-1; Mon, 16 Jan 2023 09:55:29 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 t17-20020a056402525100b0049e0d2dd9b1so2410535edd.11
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:55:29 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a3-20020aa7cf03000000b0049019b48373sm11543707edy.85.2023.01.16.06.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:55:27 -0800 (PST)
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
X-Inumbo-ID: d2665525-95ad-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673880930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g48LKw/EQzyimcflA0uDUwRnS8dI8OL8jQyceWm5H5M=;
	b=PughXJ7o8kHmymIdqGuvEVsMHz7v1jxsYtvLoBuvYizxxas0HaC5Exr2ubBjlyBlk6OM0f
	sJX8PSPTYIMofJ72fOBWZwRKA8y874Sii1J47x0B4Q4alYW1hjFbIeJTjMQmd7LUcmKymW
	Sd3wMNEjAWGyeMR8mmV3SAMKsmFhm4g=
X-MC-Unique: mKaQAv_TNUGhncv7dQlH_w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g48LKw/EQzyimcflA0uDUwRnS8dI8OL8jQyceWm5H5M=;
        b=PXZKKWeg1AwNP+SebqVS4UCFm1ow/n+zNAFzNfutmGpVyXTB0l4k8tNExPK1LSPNEA
         S7iH5BGz95tZj4LeDHTmXblqUaLvIkAbW2TEYPNm/uZtu3+N8tekKMstUY614kM4xpjV
         eU1o2+VxGi8DCvShrQqoewHI0+KB8W1m6KQhxQ4pH37gPRbsof/waltftJNrBkZGlghC
         1pYKHHZ8oGErVLkc5EG+w1hN7dNWTlT0Uf91iABXAxI8LUOL+9lyIjyQ4FjfOphWSpUc
         AbBjjrXssmNtUyK1ZoS+sIIFlo/sNMs74wMLskyfdQl9mFjPd0KOguJdmiHOZ8wlW6mH
         nKZg==
X-Gm-Message-State: AFqh2krPMbvpUH+bPddfu5DEhy3krIteKKKrMRYLiRIVgwZE/tP43T0s
	hzFEIBQxBEbzXiti0F8YNPdTmZfI2uWiBvD1p6SGGclb5g6lRIwEZ3ZWc2gMJsjIbv0s+4yGP/0
	SMDtyCkRD2TGlsH4+AjbxqJL50kQ=
X-Received: by 2002:a17:906:8478:b0:84d:373b:39da with SMTP id hx24-20020a170906847800b0084d373b39damr29113664ejc.40.1673880928387;
        Mon, 16 Jan 2023 06:55:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsse3LgRug+Pp9ZoWtZxmVwLzZ7+mUuv4JYFK2PzosFJrEZ0QAORQ3jcyrTsWEYEH4Absw9GA==
X-Received: by 2002:a17:906:8478:b0:84d:373b:39da with SMTP id hx24-20020a170906847800b0084d373b39damr29113641ejc.40.1673880928211;
        Mon, 16 Jan 2023 06:55:28 -0800 (PST)
Date: Mon, 16 Jan 2023 15:55:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: linux-kernel@vger.kernel.org, amakhalov@vmware.com, ganb@vmware.com,
 ankitja@vmware.com, bordoloih@vmware.com, keerthanak@vmware.com,
 blamoreaux@vmware.com, namit@vmware.com, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>, Lewis Caroll
 <lewis.carroll@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Juergen
 Gross <jgross@suse.com>, x86@kernel.org, VMware PV-Drivers Reviewers
 <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
Message-ID: <20230116155526.05d37ff9@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116060134.80259-1-srivatsa@csail.mit.edu>
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Jan 2023 22:01:34 -0800
"Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:

> From: "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>
> 
> Under hypervisors that support mwait passthrough, a vCPU in mwait
> CPU-idle state remains in guest context (instead of yielding to the
> hypervisor via VMEXIT), which helps speed up wakeups from idle.
> 
> However, this runs into problems with CPU hotplug, because the Linux
> CPU offline path prefers to put the vCPU-to-be-offlined in mwait
> state, whenever mwait is available. As a result, since a vCPU in mwait
> remains in guest context and does not yield to the hypervisor, an
> offline vCPU *appears* to be 100% busy as viewed from the host, which
> prevents the hypervisor from running other vCPUs or workloads on the
> corresponding pCPU. [ Note that such a vCPU is not actually busy
> spinning though; it remains in mwait idle state in the guest ].
>
> Fix this by preventing the use of mwait idle state in the vCPU offline
> play_dead() path for any hypervisor, even if mwait support is
> available.

if mwait is enabled, it's very likely guest to have cpuidle
enabled and using the same mwait as well. So exiting early from
 mwait_play_dead(), might just punt workflow down:
  native_play_dead()
        ...
        mwait_play_dead();
        if (cpuidle_play_dead())   <- possible mwait here                                              
                hlt_play_dead(); 

and it will end up in mwait again and only if that fails
it will go HLT route and maybe transition to VMM.

Instead of workaround on guest side,
shouldn't hypervisor force VMEXIT on being uplugged vCPU when it's
actually hot-unplugging vCPU? (ex: QEMU kicks vCPU out from guest
context when it is removing vCPU, among other things)

> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Wyes Karny <wyes.karny@amd.com>
> Cc: Lewis Caroll <lewis.carroll@amd.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Alexey Makhalov <amakhalov@vmware.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: x86@kernel.org
> Cc: VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: kvm@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> ---
> 
> v1: https://lore.kernel.org/lkml/165843627080.142207.12667479241667142176.stgit@csail.mit.edu/
> 
>  arch/x86/kernel/smpboot.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 55cad72715d9..125a5d4bfded 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1763,6 +1763,15 @@ static inline void mwait_play_dead(void)
>  		return;
>  	if (!this_cpu_has(X86_FEATURE_CLFLUSH))
>  		return;
> +
> +	/*
> +	 * Do not use mwait in CPU offline play_dead if running under
> +	 * any hypervisor, to make sure that the offline vCPU actually
> +	 * yields to the hypervisor (which may not happen otherwise if
> +	 * the hypervisor supports mwait passthrough).
> +	 */
> +	if (this_cpu_has(X86_FEATURE_HYPERVISOR))
> +		return;
>  	if (__this_cpu_read(cpu_info.cpuid_level) < CPUID_MWAIT_LEAF)
>  		return;
>  


