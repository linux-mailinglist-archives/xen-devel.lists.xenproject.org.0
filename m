Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI1VD5WOe2kKGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:45:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702ADB2611
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216875.1526789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlV8S-0000O8-5T; Thu, 29 Jan 2026 16:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216875.1526789; Thu, 29 Jan 2026 16:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlV8S-0000Lm-27; Thu, 29 Jan 2026 16:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1216875;
 Thu, 29 Jan 2026 16:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlV8Q-0000Lg-Nc
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:44:46 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d07eb92c-fd31-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 17:44:44 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso10228845e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:44:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce64sm15983859f8f.26.2026.01.29.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:44:43 -0800 (PST)
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
X-Inumbo-ID: d07eb92c-fd31-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769705084; x=1770309884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IkHhVJ/Vbrsk3q8sQ0lJAfa6aQokFuXl4wPk+2eSUxA=;
        b=GYZOWRnULdoNA7mbpbmWYhOuQHEFn77Ry6YV3z+Uxrg67v5WnXKGpUaKUj7C33UcaI
         Kb894Iy8/oTwwIa8lt6vA4OTJmSZxyszcAs6OucLIDPqt+FmX+CCyY4Yjky9xqCfGhJh
         qUJtVyOPHw+L3LG3vVaw+5aFyPnHy4SJD+aqudUZSka5o4Oo2GC5/27MFEGpZfySM2Nt
         sbllNwozzANaJQjP3zGfhUDIURIft7p99ALGDh3vLOJX6PVdM0C1kDIqDOmKULZKG6if
         sy3ytANkaUUQydMZLuTRzjOV4cYalxyMc20Pejt9jQtc3embEifYkZ3BpeGLrew3phyh
         FhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705084; x=1770309884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkHhVJ/Vbrsk3q8sQ0lJAfa6aQokFuXl4wPk+2eSUxA=;
        b=p1n8T1htzc+12N7v3j2800I3aAZugFjnt1kKGYm64zLzgfZ5TRtHmJeLG49SFGKJpW
         VkWjVnSvke/4yAo3qTS0pEgDnYnpz2WA+bo0KIS1/UBU0P4TJD57e3sdNlrZcjfoqlh1
         HEp3jbyK+Yle/2yw/rJWNwgnBro/UxOovJ4NHuYROC7qsUXVboiRRjrR+Iu05GyUIWkP
         uK6FbFZafyRH0MzJ4xg8SAwvMFznRhuCxwmSdLj+z1auMui9jnNAAek8VKlzQMAeSi3F
         9sDppC7nqfhVXNu2SxakAXPsgsxP5jdYVQ1Au+Mwi5boETp+mHZuq+0WO8F1F2iWQGsO
         cdQA==
X-Forwarded-Encrypted: i=1; AJvYcCVthyhgQBqJFvf9MyN2J0ehy36Fdpa7VppUTijIFGXHDEf9BdaC+k4oivDPLwlx4IHGGcUs3L3xyLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOKRLsO4Gh2XG/X7QoWDAfAYLHBuq+C01docb4ToI6vTRULjyS
	YUss+loy87MjmwYYIxRQYGkKbFoCu2OPLTAjYt7xmhkk/XFiPgPMZ5OzTMKdSaE4NA==
X-Gm-Gg: AZuq6aJYiJzGJIIGemTQ+bzzUmBoe9q7RFbD//gS5RPsCrTZtvUhtewR/qpJSzdJau4
	xJkfgVenymXTdCZ1bf+InkiLLvkru+1fWjIg/qF7CNoCb5eFlRqDSwGdiDXVzFa3Iy8n+6cA13o
	dAYQ3K4Bl6W45rzppSDaE18yIdMn7xWnAIrwCn8Wh8s8Nx+Xy8phGZzsktDSxbAaP8NTq6f6I+n
	IyX/ael4kYr1N3piEN/F0GI/JKEGH0/H3DWbsFVccGn1AJXrAYEsDrdSWlvJ6pfAUG7wlTcINCV
	9eEbjfZW6cTcJdyW4w8HFi/7rHgodGhTDtX5bnrne3fhMQx4DQEKHdRH02rUFkDgftLk8T6667L
	lflbN1G8bL5S8bZEK7IvAfFUqjAeOOxOO8Da+byveGw4RKccnxgNPUG+/Pvsm6TyfXoL1tyNSkq
	Hgs6vd5RvjXYe4mDSVq4iUJxqQEwB62qTQHdHK7+zhdPCIuGG3CEEfAdJrp30RNfajqZJFOlR45
	eo=
X-Received: by 2002:a05:600c:3b0c:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-48069c8ba67mr105790895e9.32.1769705083648;
        Thu, 29 Jan 2026 08:44:43 -0800 (PST)
Message-ID: <b0f9073f-1c27-4162-a0b4-3007ff365bf2@suse.com>
Date: Thu, 29 Jan 2026 17:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <7b5b7cceb8a131b198d33a83f49ed112ff310389.1769099885.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <7b5b7cceb8a131b198d33a83f49ed112ff310389.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 702ADB2611
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> Based on Linux kernel v6.16.0.
> 
> Add lockless tracking of pending vCPU interrupts using atomic bitops.
> Two bitmaps are introduced:
>  - irqs_pending — interrupts currently pending for the vCPU
>  - irqs_pending_mask — bits that have changed in irqs_pending
> 
> The design follows a multi-producer, single-consumer model, where the
> consumer is the vCPU itself. Producers may set bits in
> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
> performed only by the consumer via xchg_acquire(). The consumer must not
> write to irqs_pending and must not act on bits that are not set in the
> mask. Otherwise, extra synchronization should be provided.
> 
> On RISC-V interrupts are not injected via guest registers, so pending
> interrupts must be recorded in irqs_pending (using the new
> vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
> HVIP before returning control to the guest. The consumer side is
> implemented in a follow-up patch.
> 
> A barrier between updating irqs_pending and setting the corresponding
> mask bit in vcpu_set_interrupt() / vcpu_unset_interrupt() guarantees
> that if the consumer observes a mask bit set, the corresponding pending
> bit is also visible. This prevents missed interrupts during the flush.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The use of barriers here matches the (Linux) specification, so
Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> @@ -130,3 +131,43 @@ void arch_vcpu_destroy(struct vcpu *v)
>  {
>      vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info));
>  }
> +
> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
> +{
> +    /*
> +     * We only allow VS-mode software, timer, and external
> +     * interrupts when irq is one of the local interrupts
> +     * defined by RISC-V privilege specification.
> +     */
> +    if ( irq != IRQ_VS_SOFT &&
> +         irq != IRQ_VS_TIMER &&
> +         irq != IRQ_VS_EXT )
> +        return -EINVAL;
> +
> +    set_bit(irq, v->arch.irqs_pending);
> +    smp_mb__before_atomic();
> +    set_bit(irq, v->arch.irqs_pending_mask);

... isn't it too heavy a barrier here? You only need ordering of writes,
without any regard to reads, don't you?

Jan

