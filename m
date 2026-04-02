Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBkLGptTzmmEmwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:31:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19338856A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271729.1559793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8GGU-00037g-Tj; Thu, 02 Apr 2026 11:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271729.1559793; Thu, 02 Apr 2026 11:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8GGU-00035B-Qq; Thu, 02 Apr 2026 11:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1271729;
 Thu, 02 Apr 2026 11:31:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8GGT-000355-KM
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:31:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8GGT-0066G9-0g
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:31:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce537c-e002-0a2a0a5209dd-0a2a450bb440-2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:31:08 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce537c-bca8-0a2a450b0019-d1558032b851-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:31:08 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48891776099so6362445e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 04:31:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e221bsm6966582f8f.29.2026.04.02.04.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 04:31:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1775129468; x=1775734268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UwgFaFS040PUOj+XjGLXXnLnN9/5WsK6qngXTqgJqUQ=;
        b=axnuXaegysWpWKNcGadjcpsWVAPkvfzQ9OK3JPhlZYHHmZBBAwRg6gujUqv5Wl2K0o
         WljZhmBcZhD4cKQ+4neNxTglLUPABGZvjjBufZXjYmTReUm6tmkxAUxJd2Vw3YjRd+tH
         bZDXDHTbwgL1vnBNnsq11baXTQckq+V+7K8I5KoU20TQj/HiK8iy2SaNyle/TFNsmdQs
         nFPgH2QRCjIeIUYzTXbGPtQ8EwmXHqVEnoNzAqGfwKimfNefRqVsGKKHQcuqj6dTpEbI
         fVbTPkS2gRK/KEkM8Bd2jlKHODtOIYLAa66WtcrHqjTiFrlIjtYpyEd/aAalws2rFiDu
         NyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775129468; x=1775734268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwgFaFS040PUOj+XjGLXXnLnN9/5WsK6qngXTqgJqUQ=;
        b=chQb88i71OglHJYHnx342iK4IkUXDaAn117/9JPfPz2NsbgYaY2S0Ffe1kr/5ZOWxT
         jVFC023l4N8onltNOf2yDwoK9RcBjQNc9wLdxIhZPBEAokH9SiN1ET6SIdP35IAZufkP
         8Sz8D4bao95fiJTU3Y9KDDA/3v2zBUucEv3XTCF2cMI6n00hB5DW1TlRsCIaB1rPC5RB
         lAm6MgMdNM4biPNiJZ71KzO1DFjYvCDFHQj7d67YwFiquovnW26ThKf8OgUyy9Pq3nFq
         Y3O1Czv9IVnHTNsuBw6ja+FOkUIOwt8m2NVPYkhdzB9wos5jIUzrQqsPhZVNnbtlWLgq
         M/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmeXnSpkXxsNNlSi4Wnzw5cOB+r4nSPj7nT86cA6sWyyLYVNZ/fLx0HXzbyr1ossHGMXLwH6WeuoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAPvBRNVcPDPAJyCxvkaoKFV1IS9Si6u9OzcIb6Cmr0tYi6cbd
	VC+M9S+yMK85bOVKEFUVPhD6+zaF2kLRtcLYD9zpzrMKe6o0Rt2eWREdFLjRKuaCqQ==
X-Gm-Gg: ATEYQzxJppvs+0V+AC5v9vTHSZNYm0woaKxZilzbmNj2uH3y1h0v6WO/1dZtHZnycau
	XAOyymNj9zjeJD9fOE5xAJJoWHdwl9/+RGRN+QRGcjbgVehpzVv7SphgMftnixTH1dgsYhWwXGH
	MInTQJjJia0sNJvkvue5XVYII+n/Rj6OWFcOZ7m9LbQIfzEo09AJOrBw6/LASBdjQYQ16gFhphJ
	VLQWEsNv4U8dQmivF6uCYa09UE7A+TdLbL2ju/wfV7ZmcfEXZ3SXOAfJzVu6o+hcCdjy+DVf2Ii
	iBAtCE4c3i9aX1GJb/Yjufl2o6o/swWifhI2XF9LRJb4+1JLCTIxMdTuprGwJREuMwfyy+EILcN
	q+GU4GOcjDil25sVpP91jPj6TRj1e1hjNodA7+g4vWLUzo61jA/ketRrryAmgzFb1L8rzgtkkA/
	9KIe8Jx/PdB9Ud+6ublUhMksFyHL8OOggbENL7j6nX6boOATmoyCS7aMz6sLkojKZjlwsH/opje
	I3bAFYLfLEaoKE=
X-Received: by 2002:a05:600c:3f0c:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-4888b79fc1dmr52135345e9.26.1775129468292;
        Thu, 02 Apr 2026 04:31:08 -0700 (PDT)
Message-ID: <1f5e262d-da1f-49a2-8e89-87fb714e51bf@suse.com>
Date: Thu, 2 Apr 2026 13:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/27] xen/riscv: introduce per-vCPU IMSIC state
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
 <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775129468-EF7422A1-62C998B7/0/0
X-purgate-type: clean
X-purgate-size: 3283
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: BC19338856A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> Each vCPU interacting with the IMSIC requires state to track the
> associated guest interrupt file and its backing context.
> 
> Introduce a per-vCPU structure to hold IMSIC-related state, including
> the guest interrupt file identifier and the CPU providing the backing
> VS-file. Access to the guest file identifier is protected by a lock.
> 
> Initialize this structure during vCPU setup and store it in arch_vcpu.
> The initial state marks the VS-file as software-backed until it becomes
> associated with a physical CPU.
> 
> Add helpers to retrieve and update the guest interrupt file identifier.

Yet again a functions with no callers.

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -59,6 +59,29 @@ do {                            \
>      csr_clear(CSR_SIREG, v);    \
>  } while (0)
>  
> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
> +{
> +    struct imsic_state *imsic_state = v->arch.imsic_state;
> +    unsigned long flags;
> +    unsigned int vsfile_id;
> +
> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    vsfile_id = imsic_state->guest_file_id;
> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);

What purpose does this locking have? Already ...

> +    return vsfile_id;

... here the value can be stale, if indeed there is a chance of races.
Did you perhaps mean to use ACCESS_ONCE() here and where the value is
set?

> @@ -315,6 +338,25 @@ static int imsic_parse_node(const struct dt_device_node *node,
>      return 0;
>  }
>  
> +int __init vcpu_imsic_init(struct vcpu *v)

__init for a function involved in setting up a vCPU?

> +{
> +    struct imsic_state *imsic_state;
> +
> +    /* Allocate IMSIC context */
> +    imsic_state = xvzalloc(struct imsic_state);
> +    if ( !imsic_state )
> +        return -ENOMEM;
> +
> +    v->arch.imsic_state = imsic_state;
> +
> +    /* Setup IMSIC context  */
> +    rwlock_init(&imsic_state->vsfile_lock);
> +
> +    imsic_state->guest_file_id = imsic_state->vsfile_pcpu = NR_CPUS;

Iirc Misra dislikes such double assignments, so better avoid them right away.
(As per a comment at the bottom this may need splitting anyway.)

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -52,6 +52,8 @@ struct arch_vcpu {
>  
>      struct vtimer vtimer;
>  
> +    struct imsic_state *imsic_state;

Just like it's "vtimer", perhaps also "vimsic_state" for both the field
and the struct tag?

> @@ -64,8 +65,20 @@ struct imsic_config {
>      spinlock_t lock;
>  };
>  
> +struct imsic_state {
> +    /* IMSIC VS-file */
> +    rwlock_t vsfile_lock;
> +    unsigned int guest_file_id;
> +    /*
> +     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
> +     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC SW-file
> +     */
> +    unsigned long vsfile_pcpu;

And why unsigned long, when unsigned int will do (as about everywhere else
for CPU numbers)? That'll also shrink the structure size by 8 bytes.

As to the comment - as per vcpu_imsic_init() NR_CPUS also has some special
meaning for guest_file_id, yet there's no comment there. How do file ID and
NR_CPUS fit together anyway?

Jan

