Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHhfIgguzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:39:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49937C469
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270476.1559140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wiZ-000651-NW; Wed, 01 Apr 2026 14:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270476.1559140; Wed, 01 Apr 2026 14:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wiZ-00062y-Kl; Wed, 01 Apr 2026 14:38:51 +0000
Received: by outflank-mailman (input) for mailman id 1270476;
 Wed, 01 Apr 2026 14:38:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7wiX-00062Y-NJ
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:38:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wiX-00GO0h-39
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:38:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2dec-bab6-0a2a0a5309dd-0a2a4503909c-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:38:49 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2df7-02b3-0a2a45030019-d1558032f1ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:38:47 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso92586735e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:38:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e735532sm150995725e9.0.2026.04.01.07.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:38:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775054327; x=1775659127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+sVZ8lyJfZymR2sAcSNbJsyX80kljhnFPnQXAv2d0zM=;
        b=AEeNqN2PPtPr4cyO1PJqbUwDqoG1SC5NJ5GmGGwM9RH+dB7Zy9ymfULq5FjxaoC50g
         ZQrlpFT249y3zdtwJXoeBQr9Odd/bdp+vmgqeWgpBZDy3AB1AT6KEDJ4r5Fkgcyc8rfV
         23vYGKePUNhp8UNdB7aUr8EqDMN5C+UpjqFz3cmFD33l4/3zJsGFwL58aVxNVPYmwyv2
         jNFUxvj8gpJrN7O0tCm0pxBazb41U/H50F5f8wZpmmg6cw4isOR2SvWtjhpPLnx2aKWy
         YVCNxmjZIvj3L462OVoxTtdtTKJVMvwBykgxPFk6Oeyy1n5wjrms0sE5dftPAXA7A2X9
         Ld1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054327; x=1775659127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sVZ8lyJfZymR2sAcSNbJsyX80kljhnFPnQXAv2d0zM=;
        b=ktXctLgIWj6HxEnoCBQ2oBHkDNkTwG4Yb7JajeNO8kfiDMAotg5JZHtdMjtXtvi2zL
         8U+rMWEDHlrZKIGkVDcJyIivy7g3YyI92H5TDJDB0dbgzCGXJPAvfkSk/rEqZtOf2shn
         OgLpzRfUfnwMwfJsnuYtQDl29DHeGgpRIaLSPuHZO0yz1LYAhxqLYwjyG46lMIyfSw0L
         0k08SrKHgFC0c37w6rCZDUcfwN0G0Cplt0ADivQNyHICdWs7sgTIhMsHfhPWftLrn7Hi
         1Wwg/14d+9lPjBQbzuNPgGh0sgSCDnhA6xlaTDKTjyjlYAtyezvYjaC8jFg3hgKJmslb
         RFlw==
X-Forwarded-Encrypted: i=1; AJvYcCVmqZlLL9EeiB+Yd82qHgd+XHaMGmluriRBGm0uFPAFPQYxiixPxB3AlmLs5f3zKNmI3XKlz349O94=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFH8NGypscyxW1KTWTfM8v5d246nZ27Q3gcvrZagBh1i91xrN6
	tDNSK96zIal87o5girpit1l4vdnr4hz5UppqFNwG0v6Fc4+dAOVgJs2Bng2hcYDYwQ==
X-Gm-Gg: ATEYQzzYx6W+SWC3EInu83iiOcMtg14QNUu+WrMJelA46R0L0XLskdND/ykp7Io5QHO
	xWChfpwacZfVA6ThGkxadS4IqWtyUWf/zSWS665saAUHmRewSEim9xaK7E6YMA1L305mx+XJHFR
	ZVSaCkRAFrt9XslAE0DUWsDTjGzOWCS79y9GV3h8SUeSIEgUTpH6oiUsWhnB/vS9Jrysp0TbM6f
	gLE3dS+xYWLfIvexIUDrKK9/i4UPdH0gzYX2Um4lndfo8Gjbjvgzd5u2L6x0+AoS8DFqN9NFYYz
	9v4TbRvkwPZmjq7f1pJwUJgQmquepR0QSnkwbrfNZmWCwHcRtJyfgRhQ46/3kxfIesC+iA+jPFu
	mYLivJDGa9GHZYbXe7PXW1Ui/w6U2g30a9VGgHvlviCZu42ls9WkAuSxh7pvtE+lJtZd9z4wgao
	vEmxPw7v9EkIoOdbL85DYb3IjHPWdp9/s7xAM7MaVSPHRpLluVnvrxFQ6sD6FkEUU2lh7gMml/u
	gk1uxi/uJCpTBk=
X-Received: by 2002:a05:600c:1388:b0:485:379b:57bb with SMTP id 5b1f17b1804b1-48883569e7fmr66375565e9.3.1775054326960;
        Wed, 01 Apr 2026 07:38:46 -0700 (PDT)
Message-ID: <9b3cd2ba-869b-4757-8bcd-51abad61b9f9@suse.com>
Date: Wed, 1 Apr 2026 16:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/27] xen/riscv: implement make_intc_domU_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <7a7f1430090eaf50cc3bff25e894c13404bffad5.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7a7f1430090eaf50cc3bff25e894c13404bffad5.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775054327-41D16C9A-8255C78B/0/0
X-purgate-type: clean
X-purgate-size: 1659
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C49937C469
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/dom0less-build.c
> +++ b/xen/arch/riscv/dom0less-build.c
> @@ -3,6 +3,15 @@
>  #include <xen/fdt-kernel.h>
>  #include <xen/init.h>
>  
> +#include <asm/intc.h>
> +
> +int __init make_intc_domU_node(struct kernel_info *kinfo)
> +{
> +    intc_make_domu_dt_node(kinfo);
> +
> +    return 0;
> +}

Is this wrapper really needed? Can't what's intc_make_domu_dt_node() right
now become make_intc_domU_node()?

> @@ -41,6 +41,10 @@ struct intc_hw_operations {
>  
>      /* handle external interrupt */
>      void (*handle_interrupt)(struct cpu_user_regs *regs);
> +
> +    /* Create interrupt controller node for domain */
> +    int (*make_dom_dt_node)(const struct kernel_info *kinfo,
> +                            const struct dt_device_node *intc);

An __init-only hook is somewhat risky, just to mention it. In IOMMU code
besides struct iommu_ops we have struct iommu_init_ops, just to give an
example of where the same could have been the case.

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -67,3 +67,11 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>      intc_set_irq_type(desc, desc->arch.type);
>      intc_set_irq_priority(desc, priority);
>  }
> +
> +int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
> +{
> +    if ( intc_hw_ops && intc_hw_ops->make_dom_dt_node )
> +        return intc_hw_ops->make_dom_dt_node(kinfo, intc_hw_ops->info->node);
> +
> +    return -ENOSYS;

How do you justify this choice of return value? This isn't even a hypercall
handler.

Jan

