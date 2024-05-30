Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F08D4A0F
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 13:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732663.1138679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCde1-0004YL-Oc; Thu, 30 May 2024 11:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732663.1138679; Thu, 30 May 2024 11:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCde1-0004W0-Lr; Thu, 30 May 2024 11:08:29 +0000
Received: by outflank-mailman (input) for mailman id 732663;
 Thu, 30 May 2024 11:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCde0-0004Vu-Jz
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 11:08:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0c18f6d-1e74-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 13:08:27 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a635a74e031so88883566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 04:08:27 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a66b9a876c2sm16307666b.196.2024.05.30.04.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 04:08:26 -0700 (PDT)
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
X-Inumbo-ID: f0c18f6d-1e74-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717067307; x=1717672107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cYj/4GpETTQq5gzUVSXQKkVw4LGNcmrbU/zLmYHMHP8=;
        b=J7o9lwu5EvSkd6QGNWyHB4vwbbBa30WF7bONBKND/Edap/hz3Rp3D5zDUZE5cmPqOp
         6ZiBcyobLd2UyPgDPpFo39/71kJqtB0+E4wn/t8WVADY7SThgdigxFs+rOqqtefjl//x
         mxI9bm138U3zGLofyyeh1MQAxvcMweQqSoCWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717067307; x=1717672107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYj/4GpETTQq5gzUVSXQKkVw4LGNcmrbU/zLmYHMHP8=;
        b=J3t0ChfTe/6Ta4wRGTyjBgEd4l9s37GxWERJ2cCOazUN6kFEO4Oa+Q08O0d/OUjxhJ
         QvGOO4AabrQ76Yxp3n0MtpC10ZOY0Rfa1gAjnSHRiXOKaA73AEcw71KgwWzHScQPcmrQ
         bMrYfktfP5DW9Np1PJ8z1WXC+J1Urdq8chKXwFcMxyH81wWlqR8P9qwqOviPyiEGTkq9
         PFqcEsHgzbPV8Rb4pKOz6UPVycy/JylBGqe1UH7tVQ0hibX7ybZCn+IhUheIZUwYhEyJ
         aF7ewuM68Kv11h2NbIl2Vq7/uyd1OzGbGPCzdE0c6HQM3FEb65GaPOkhyJETax53Pr8W
         ZNpw==
X-Forwarded-Encrypted: i=1; AJvYcCVd1nMW2OCKgavyxuKPMmPPr+O2SHwbG1pwfweEpS6U57jeclcLX4dBrVSmq+zy438en2xtFLCB+ObWTRpRZGImhOZn2Et4jKV0Kn6e3Es=
X-Gm-Message-State: AOJu0Yz/jO08Ljt6UIHvrdUSVFmHNZfm+OqdtLKd/3Tuj2Ew7QNB2LaW
	4ASoUX5VaoKC79kjB/+mK9MMw3PurpNKtfyN7m7NNG8yxSfqppFXlVaSLgQbJ4A=
X-Google-Smtp-Source: AGHT+IFcVVO5KFEiGJMwiCmjs/Okz70R8fcylmlMjDG+mj4RquN/Dr6YOOKhQPHUkJ4IcmzFShT83Q==
X-Received: by 2002:a17:906:3958:b0:a5c:daf2:1cfb with SMTP id a640c23a62f3a-a65e923c323mr222182366b.63.1717067307086;
        Thu, 30 May 2024 04:08:27 -0700 (PDT)
Message-ID: <0d3101bc-624e-43b0-95e7-cc89de3bb259@citrix.com>
Date: Thu, 30 May 2024 12:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2024 3:32 pm, Alejandro Vallejo wrote:
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f033d22785be..b70b22d55fcf 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -2,6 +2,17 @@
>  
>  #include <xen/lib/x86/cpu-policy.h>
>  
> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
> +{
> +    /*
> +     * TODO: Derive x2APIC ID from the topology information inside `p`
> +     *       rather than from the vCPU ID alone. This bodge is a temporary
> +     *       measure until all infra is in place to retrieve or derive the
> +     *       initial x2APIC ID from migrated domains.
> +     */
> +    return id * 2;
> +}
> +

I'm afraid it's nonsensical to try and derive x2APIC ID from a
policy+vcpu_id.

Take a step back, and think the data through.

A VM has:
* A unique APIC_ID for each vCPU
* Info in CPUID describing how to decompose the APIC_ID into topology

Right now, because this is all completely broken, we have:
* Hardcoded APIC_ID = vCPU_ID * 2
* Total nonsense in CPUID


When constructing a VM, the toolstack (given suitable admin
guidance/defaults) *must* choose both:
* The APIC_ID themselves
* The CPUID topo data to match

i.e. this series should be editing the toolstack's call to
xc_domain_hvm_setcontext().

It's not, because AFAICT you're depending on the migration compatibility
logic and inserting a new hardcoded assumption about symmetry of the layout.


The data flows we need are:

(New) create:
* Toolstack chooses both parts of topo information
* Xen needs a default, which reasonably can be APIC_ID=vCPU_ID when the
rest of the data flow has been cleaned up.  But this is needs to be
explicit in vcpu_create() and without reference to the policy.

And to be clear, it's fine for now for the toolstack to choose a
symmetric layout and pick appropriate APIC_IDs+CPUID for this, but it
needs to be the toolstack making this decision, not Xen inventing state
out of thin air based on the toolstack only giving half the information.

(New) migrate:
* Data from the stream, exactly as presented

(Compat) migrate:
* Synthesize the missing xapic_id field in LAPIC_REGs as APIC_ID=vCPU_ID
* 2.

I'm pretty sure this will be a net reduction in complexity in this
series.  It definitely reduces the Xen complexity.

~Andrew

