Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOCWKu5qzmmpngYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:11:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D0389735
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271903.1559890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Hot-0003Wy-VT; Thu, 02 Apr 2026 13:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271903.1559890; Thu, 02 Apr 2026 13:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Hot-0003UE-Sj; Thu, 02 Apr 2026 13:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1271903;
 Thu, 02 Apr 2026 13:10:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Hos-0003U8-DH
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:10:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Hor-006TsW-P6
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:10:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6ab8-bab6-0a2a0a5309dd-0a2a450c9af0-46
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:10:45 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6ad5-f40c-0a2a450c0019-d1558033e899-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:10:45 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso8511245e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 06:10:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e822227sm218935645e9.4.2026.04.02.06.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 06:10:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1775135445; x=1775740245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+GiadCBpp/EPZJ4qjhCkJKpc2ggsBpsuuZYB8N8xf+g=;
        b=HxrsXIop7RVOskq/Wotd3iiuwFyKAF7SlmjspU9Rl0VZVoeHEEhgwg49dA6lMPP/js
         tbtpI6FZl3DNEdIRkthe/qHg5lchUnH9jgJlWG3kOCUgnK1XEJSo1tIvSchdzVmDNYfx
         78ZP4QnFAc/sZuHsrvb6hhwUfh4Hhlf4ckrsIItEM1chZpppKkqTXTspgOxSjR1FaQFu
         6CISRnKyJx/y6T1aTkrkEVuBkiRce1mxIU7R00ZUr7gol9bkZFc6he0TFBefaR5DrZzU
         UKmGw7zhatRLuDfu7sTUzt0bUuxPKgo/JRrnMmayVU8j/Z41S63NeQs1erwoB/uiY3a+
         Cg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135445; x=1775740245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GiadCBpp/EPZJ4qjhCkJKpc2ggsBpsuuZYB8N8xf+g=;
        b=UojxBKP4kPRbsoUDgO86z/Ywz6Mso8oPweqMiUX/jp7Fy8XT3M+zd9mvVu9oG/wfSU
         zEZxScEUagWpziviQfmgRDPrtAnPPDK13PCNW+GoGrt0BclReLRgquSm6nGyGsxBoFBM
         gXl63cAg2sK/msjFX9B7aB+ARs+VFm12RZEft73If5eo7STghBBNCKPYVFNc8sZtC8xF
         BR6/Zs98kX4gwCJgRnGK6MVnb9a1EOMAeXHKTFbkZI0AgW3cDNo/qBohP54ZjAZC3Zxp
         c0xG1WsO5Nq8YXm+sx6BbAz8TadCh//tQZH9CvowZ5L/A8j4PA92aJqjZrzFqCcB1rTo
         gLEg==
X-Forwarded-Encrypted: i=1; AJvYcCVIJlsa5mHjPzHrAZHMHoOixQ6itaw4S9LuAQWLvqZ8RiEhqDfp7bR8vPFYVyIwETD1JqKWahAT7as=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJmRONHdo5AFDAbiWrB8phMsKtx4aOVdrZGRkXwKatxyTkUwnq
	DIuV+m8KFnSQC1e10LVlGBr3UgUQqy9YmfFLtf7yFKHwV0kLIGAt+ZQglxpfwUTadg==
X-Gm-Gg: ATEYQzz2yz5i6NEu4hiROkKy0gig8/gFSVp2uuUBNtGaE7871og2tVTt0wr8Gjz8W+t
	p+q/y+pK76cb95ELkgYDVPuPtMq1smnGn3MqjVzppfesfe4jye7HposVXzxvw3dDQP9Fs0k1CuW
	UEuEdXdsuhlYYbrf1aNBWd51QiAQe1zqlBX8Y08FR8aJyvUEUqswYqn5GcEO5JEwAN6uMUAsD5C
	isDQ/Ydb5ikL5EYlmXf4rUJsFPJFWXWtj9+N+ns4lJ0ttAFUJVlPIkBZiKfCfXPAV3wDPAF+JIT
	n4Y9x66qKVR+1FNXYFOnEextklV3BzNmUYWOeqvRcIkVqMh4c7vrzH8U93izzj2DJjcexBTF9v7
	OD8lqIsx1NVW0payXyFNtqfAh1GoWxlY7jE79Hx1DHYVNW5/Rl6ulWqenVaUAUeJVneqOWWwTLr
	ah9pVOB2j91QCkMolKgkjIVMnYScoCBg8eHi3QYLos2yPWLruQTX0oJ391sa0LPayq03cMpETzO
	Tla6hzJJpCwjQw=
X-Received: by 2002:a05:600c:4707:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48883597cfamr134534075e9.17.1775135444917;
        Thu, 02 Apr 2026 06:10:44 -0700 (PDT)
Message-ID: <0519fb8a-48e3-4f36-8d6c-a966080ffb55@suse.com>
Date: Thu, 2 Apr 2026 15:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/27] xen/riscv: add vaplic access check
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
 <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775135445-83746A3D-F2DA4913/0/0
X-purgate-type: clean
X-purgate-size: 1404
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: BD6D0389735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -38,6 +38,7 @@ static struct aplic_priv aplic = {
>  
>  static struct intc_info __ro_after_init aplic_info = {
>      .hw_version = INTC_APLIC,
> +    .private = &aplic,

Isn't this the host instance again? How can you ...

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -127,6 +127,20 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>      return 0;
>  }
>  
> +static int cf_check vaplic_is_access(const struct vcpu *vcpu,
> +                                     const unsigned long addr)
> +{
> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
> +    const struct aplic_priv *priv = vaplic->base.info->private;
> +    const paddr_t paddr_end = priv->paddr_start + priv->size;
> +
> +    /* check if it is an APLIC access */
> +    if ( priv->paddr_start <= addr && addr < paddr_end )

... use that here? Or asked differently, again: Where's the virtualization,
i.e. the abstraction away from host properties?

Furthermore, is it really sufficient to check just the starting address of
an access? Shouldn't the last byte accessed also fall into the range in
question?

> +        return 1;
> +
> +    return 0;
> +}

This function looks to want to return bool (and then use true/false).

Jan

