Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED58A98D09
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 16:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964831.1355528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7b5h-0003GP-Px; Wed, 23 Apr 2025 14:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964831.1355528; Wed, 23 Apr 2025 14:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7b5h-0003EQ-NA; Wed, 23 Apr 2025 14:28:45 +0000
Received: by outflank-mailman (input) for mailman id 964831;
 Wed, 23 Apr 2025 14:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBP9=XJ=flex--seanjc.bounces.google.com=3GfkIaAYKCXYmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@srs-se1.protection.inumbo.net>)
 id 1u7b5g-0003EK-Me
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:28:44 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 415b1378-204f-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 16:28:42 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-afd3f1adff7so790294a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 07:28:42 -0700 (PDT)
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
X-Inumbo-ID: 415b1378-204f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745418521; x=1746023321; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=40rtvLOwDeuUbiOuCoW1t5olyX8gz8CZJ5ahJ10eU+w=;
        b=eV9iSR2067jWRO2+DiGAkYhnPzWljXvNKBxPPsayGMIhZj6engrHy/iDUd+pBQt3dZ
         WcuG8+DInS+hWWTwk5aflG8zK1ud/f5gTbL7dcQd6YIr1bQnws9MF59VCikjXXmDsrbN
         D/5QbFz3IgzN2QQfkDpzM4hJMRoWSdFFbzJ0P6lKHs8BBA6yS0bva64tuvBv1/+dI3u7
         vfUs1nFinDYdZMz/0Z9iRCrp2fac2tDA9XvBiiFb+o1XYm9bOR/iDzfYw8vd3zeW50gu
         UZojhdPOL5R3EZ5Plj2uINGnYGhu5tJplfeGdoQLraDNuwIiSfuBl+mG/cpqNM9y63DK
         tO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418521; x=1746023321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40rtvLOwDeuUbiOuCoW1t5olyX8gz8CZJ5ahJ10eU+w=;
        b=SS0WhHJ5NjSMx10ldIXNtPhvUzS9qft79/K5sVPSCDIXu8BQGBd5uaNAudwLjWQk6D
         AN1rgTpcw/07r539DIKmvNe3Xj143f7pv24McKMbJ1EXs+lFspvvbX42NNGr8qT0xKAJ
         fJ7ZzAOju/6hklqD51I6esdjpnQDh2MsDsNreuAM14pnopZP7mPwKoyMQ5pas+fgDGJm
         mP2FuvrdysUDv6SWsRLWQeTJIoT7wRvY0sRxtTMP5fzvaWjAfCm72hACBI1xjbjkBOXT
         hdXk3ao7YPWMgPqsG9NR3i7sVo9Ltp/W5dMMYIts2/73uxUjpSWK7/k2hge2W26NyNBa
         7ARw==
X-Forwarded-Encrypted: i=1; AJvYcCXgmmdlWL1V/BrFerIHUspNL6G7AajWTKJbFpVwqHLUKYv72foLBHhBEWaoHYMkCSd+ZqBM8e1vuhg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPtVkxuRC06w65fZzqfOH+Yg3Tms0XYKwFTVdcBDjRHVansCbx
	j2EGfZMpluj+gqeeqsB8uXN2uJ94ZDoxG2Ru/qA6zHEjfFGEFVGeT0KBN3mn4+D3Me5gY1UfQ4V
	PQg==
X-Google-Smtp-Source: AGHT+IEHFWhYz0oAsCQCzYVGgs17eJ2RdOv2pA+CJ/89PxdUza1pyAyGtkAfHJad1QU5DCSNGF6B8Gtgtdo=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:301:1ea9:63b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2cd:b0:2fa:21d3:4332
 with SMTP id 98e67ed59e1d1-309df187b6dmr4574319a91.12.1745418521285; Wed, 23
 Apr 2025 07:28:41 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:28:39 -0700
In-Reply-To: <20250422082216.1954310-4-xin@zytor.com>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-4-xin@zytor.com>
Message-ID: <aAj5F9IZXG7MB0ai@google.com>
Subject: Re: [RFC PATCH v2 03/34] x86/msr: Rename rdpmcl() to rdpmcq()
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com, 
	pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org, 
	boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Xin Li (Intel) wrote:
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/events/amd/uncore.c              |  2 +-
>  arch/x86/events/core.c                    |  2 +-
>  arch/x86/events/intel/core.c              |  4 ++--
>  arch/x86/events/intel/ds.c                |  2 +-
>  arch/x86/include/asm/msr.h                |  2 +-
>  arch/x86/include/asm/paravirt.h           |  2 +-
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 12 ++++++------
>  7 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
> index f231e1078e51..b9933ab3116c 100644
> --- a/arch/x86/events/amd/uncore.c
> +++ b/arch/x86/events/amd/uncore.c
> @@ -152,7 +152,7 @@ static void amd_uncore_read(struct perf_event *event)
>  	if (hwc->event_base_rdpmc < 0)
>  		rdmsrq(hwc->event_base, new);
>  	else
> -		rdpmcl(hwc->event_base_rdpmc, new);
> +		rdpmcq(hwc->event_base_rdpmc, new);

Now that rdpmc() is gone, i.e. rdpmcl/rdpmcq() is the only helper, why not simply
rename rdpmcl() => rdpmc()?  I see no point in adding a 'q' qualifier; it doesn't
disambiguate anything and IMO is pure noise.

