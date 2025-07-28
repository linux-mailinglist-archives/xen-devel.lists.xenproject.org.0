Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73BB138DC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061207.1426709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKyw-0005yD-2i; Mon, 28 Jul 2025 10:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061207.1426709; Mon, 28 Jul 2025 10:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKyw-0005wF-03; Mon, 28 Jul 2025 10:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1061207;
 Mon, 28 Jul 2025 10:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugKyv-0005w9-35
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:21:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981961ff-6b9c-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 12:21:16 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45629703011so29473705e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:21:16 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b778eb2779sm8265470f8f.15.2025.07.28.03.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:21:14 -0700 (PDT)
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
X-Inumbo-ID: 981961ff-6b9c-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753698075; x=1754302875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E4hTohy993P6bnMcVKg0EUAAvZNZk/2+wuFyCp4Hcbs=;
        b=m2QcjSAe1bX+SzfrTaB9D2Cbi8wn1gKhhBEMtqj0Vxb68czF27QGt4mx8T1jjaiepB
         q4ehEBtCal9TN1QUnQ8OJIFQAHq58fec0UvibbqKmMNbJ5+9eA+e5SweXIGY833m3wrl
         KCxdLy6mJAdZoTYujathP+HJ12FrZWzSfy/EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698075; x=1754302875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4hTohy993P6bnMcVKg0EUAAvZNZk/2+wuFyCp4Hcbs=;
        b=tm94XBOUEQMtDS09KmSsyW0sOp+E10sz1ZApj9YdV8bZLX+DGl/udkeKUciC/2LCVe
         Pa8wXbTWWOGEWiinEvh45OpngGKXuafOM1y7OUb6qvG8rGrffeo+vaRaoZYXRLOaDRED
         BAVlr4ms3BGefvvdi0KWNFSfP12TiCCb/BLvI6U4RGS3g1+LBlmC0gOeBE/HvCiNhvUZ
         a+gYy5EN3diLNJgey+F5nc3MyNcHejtWjm83PZKkeor1nWjWq+rFhIjX1861iJG60iZ6
         Su9MCvkUkMUP1clkQuIYrTl0BVkuTFOc6/XzWNk24Ad6alpVptpn85hsBmSeVmC3RTF9
         F6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU3oZW219ivNOpPJjORCPJ/5Je13RktLMlDgWcYnq7HvSbdbmyCDQdzncj104oPUrCDkvsxbCeXdyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzkgDjjY8HHOnNilTrUX5o5fgDNGJ1fnqkpyKzigD+V3gcgrJb
	vaOToIDNfyYBJs2On0YyLKlyWqaDHhOwi1W4NIiK5RBvPuRPoph3ClaMpCOHRo6MkZg=
X-Gm-Gg: ASbGnctWy361cAMx0dO5A9RoaW3xw+NX0Dtyat9mVDR/1rbab3KyoEgG+1yrZEk/JYV
	qkMOIR72rd/C7GY2jeW2lwNNVWT3ZAFBbdtSy0mu0JOhI7aUiir4Hy6lE7X2D0iLYlLqDWzZmcg
	nA0BrfzrXRQC4lECcepARR5wnUxHkcjqRcuEmiMa0l2q8cnjFC7rqOdAP7YUZL/M8Sta3gXGIZV
	hx0RQPVAyscBLD3Ar4Y+c7SLTnh5hmmLZz3mBDJoMIu5lfiJL10ER233GVo5625bpRLtCDhEoeH
	iTrYV9Y1oXXog1pEktm/L3NiP+3HbnUn7sZzdYuGMUSt17REjSWfsC61fdD5Tgj6nkPRfNdCNe9
	7ooWsqlFUOSghuuAyoQeom4hqN5Z6YWUyqzvcoE3nlUbEz0J3HTcKGsBryLa/WQsrS7gz
X-Google-Smtp-Source: AGHT+IEMPuafzHo+pW0sbH8Pt+SDUaC2oMmd6MT4/oVcXzkWy6uPgfnxbrEgK1jZtnazZLpSfmA8Hw==
X-Received: by 2002:a05:600c:8b25:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-458763135f9mr98934585e9.14.1753698075350;
        Mon, 28 Jul 2025 03:21:15 -0700 (PDT)
Message-ID: <0cd10fcf-d017-4a85-b248-e29e77903349@citrix.com>
Date: Mon, 28 Jul 2025 11:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/10] pmu.h: add a BUILD_BUG_ON to ensure it fits
 within one page
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/07/2025 4:06 pm, Edwin Török wrote:
> Linux already has a similar BUILD_BUG_ON.
> Currently this struct is ~224 bytes on x86-64.
>
> No functional change.
>
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
> ---
>  xen/arch/x86/cpu/vpmu.c  | 1 +
>  xen/include/public/pmu.h | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index c28192ea26..7be79c2d00 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -401,6 +401,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
>      uint8_t vendor = current_cpu_data.x86_vendor;
>      int ret;
>  
> +    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
>      BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
>      BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ);
>      BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);

This is fine (even if it ought to be elsewhere, but don't worry about that).

> diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
> index af8b7babdd..15decc024d 100644
> --- a/xen/include/public/pmu.h
> +++ b/xen/include/public/pmu.h
> @@ -93,6 +93,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_params_t);
>   * Architecture-independent fields of xen_pmu_data are WO for the hypervisor
>   * and RO for the guest but some fields in xen_pmu_arch can be writable
>   * by both the hypervisor and the guest (see arch-$arch/pmu.h).
> + *
> + * PAGE_SIZE bytes of memory are allocated.
> + * This struct cannot be larger than PAGE_SIZE.

This isn't.  Xen's PAGE_SIZE is not necessarily the same as PAGE_SIZE in
the guest consuming this header.

This highlights one of the problems that Xen's ABI entrenches.  Being
x86-only, it's 4k in practice, but there's no easy solution.

I'd just skip this comment.  Anything else is going to get tied up in
unrelated bigger problems.

~Andrew

