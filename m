Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKoJKJoEk2nF0wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:50:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00967143221
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234051.1537418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrx7a-0008By-Vc; Mon, 16 Feb 2026 11:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234051.1537418; Mon, 16 Feb 2026 11:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrx7a-000897-Sh; Mon, 16 Feb 2026 11:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1234051;
 Mon, 16 Feb 2026 11:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrx7Z-000891-K9
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:50:33 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab519d55-0b2d-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 12:50:20 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so2522970f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 03:50:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm26644129f8f.35.2026.02.16.03.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 03:50:19 -0800 (PST)
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
X-Inumbo-ID: ab519d55-0b2d-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771242619; x=1771847419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oEWNuxj9S1ZsWEmjaAOrdxnQ3yMo5yTwjifNC2h4MyQ=;
        b=R9/2t/hZm/gJe/DNRgegeA8EAz7wCaOx+jy/Kin3SpsCaV0Z/esi1Cy4IDK8SDEete
         p9td8mS4wtoqb7jemVBtgx2H3fmtVvz4reC00lD/CNRxvNbi9re9UgiOon8Dd3cZW2rt
         XhuOstG4NgtoeOskGdqA121W3mMMslJ6rgdxiD4kY8/4+qmVH7qFgZx9yEUosttsupA7
         yNPCV7Slr0c3ad/S4JgGNVXiXXY/LZrFKk7oCgVkWZmcZe7HBRxtpRCRL0Q57tiR5n/Q
         lyqfdB7mMsA5Z5G+ZYt6rJ1vyRYB8ylqEsyiooYI8jFj6uVJXva/+AJbAv51vxYMOpyw
         Omsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242619; x=1771847419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEWNuxj9S1ZsWEmjaAOrdxnQ3yMo5yTwjifNC2h4MyQ=;
        b=W3274PL1swfP1lApS4VNAwPkIUQe4GozOaV4WlZgPj/WtAxa2DF79OTh6Hv6OEBPsr
         ltF5DJwiguTHxEzbfHgdFCnwDGGuNIDjk3nRDEfuIQAsOjLLSgeYhaA7660wHFCW70g8
         CPY1SazcLA9kYmlb41s2NMAdNkSN3JQ/vykGIePetY1D313IG8pTqwQl8al56SpUcktj
         0W/6lYIZ9Rh59a6aeOQr7V+CyIBpbv0E3T8WmNHIVtuqkUnjZ9+pA94ts8pqygpAWtyK
         ibozzHD23PkOkZp7dNU71f+CjaKUIL6oyg1OM7LR6TFltl10thUkynqCWmGnOAKAOnvI
         qWyw==
X-Forwarded-Encrypted: i=1; AJvYcCUaVep0eJSuba7kmyxwfM1ihz1qKlVdFsFWF7238Q5GuJ9kDBPVsm0pq8z4wlGWfZTuK+wY0RHXsXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycpsqbXVMd4pjZyP/GwoOu46HX1LJBfVAQIFCwefA1dxFWDicr
	fA+RzhDUBxL/jV2u/wZ8IToK3RojbIKXtshIaHOg9SRZV22a+UCAvGdGfeLs0jxyiA==
X-Gm-Gg: AZuq6aKGLW/gWapSsKpC5d43sOsL2eC+HhR8DRkSidS7qNpnZuk+7uSFskdhhwPkAZM
	isMerge45QPtlzN0bBeqwjvaRO1nJJGElUJaR+0XvTMluFYK9eM1H5S/M/z+5Spi7Cu2JdHryIt
	E9bo3Mv8ndZn3dFvxB1t9HQFwqBVEVLE0SPUx8zDLXlaJkkM3rJkEarRzqR/fk97UeY0FyvLULg
	3K1cbAA/5cMRrbfOJwwVGQIfeJFhl/3oKTIAFTSToi9iDi+KIAYFexf9RlMobzpGtV/YI8aIF4+
	aK1KJ1rODm3W5TKDES+2xfHY9xffSTD+OlXDlan1AFmtipB6VZefyuq83cWnjPGoRVQbM1Ve2aV
	QnTQSRtPkXsi0Jrh51QI/lItzA/Txwcytd7R0god0J2F9MbCWWdXV8GAPIZgXrUVyi3meNBB3zg
	fy8bs6aACrqG0zc2SR4esDo3IGBwR9VT2KCSv+yc9Vh3y/aXHi7a15aehSV1YoYJfTwiRRqb2Xg
	u329NPI0jZu1g8=
X-Received: by 2002:a05:6000:2881:b0:430:fb6d:1442 with SMTP id ffacd0b85a97d-4379793ddd6mr18204713f8f.62.1771242619523;
        Mon, 16 Feb 2026 03:50:19 -0800 (PST)
Message-ID: <0f7e5a73-a574-4aa2-80c7-b45d08b9d6b0@suse.com>
Date: Mon, 16 Feb 2026 12:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 00967143221
X-Rspamd-Action: no action

On 13.02.2026 17:29, Oleksii Kurochko wrote:
> Introduce helpers to manage VS-stage and G-stage translation state during
> vCPU context switches.
> 
> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
> switch-out to prevent speculative VS-stage translations from being associated
> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
> required order.
> 
> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
> only when required (e.g. on VMID reuse or generation change).
> 
> This provides the necessary infrastructure for correct p2m context switching
> on RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - Add comment above p2m_ctxt_switch_{to, from}().

I find these and other speculation related comments problematic: You can't
prevent every kind of speculation that way, yet all these comments are
written as if that was the case. What I think you mean in all cases is
speculation using the wrong set of page tables?

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>  
>      return get_page(page, p2m->domain) ? page : NULL;
>  }
> +
> +/* Should be called before other CSRs are stored to avoid speculation */
> +void p2m_ctxt_switch_from(struct vcpu *p)

What interaction with the storing of other CSRs would be problematic?

> +{
> +    if ( is_idle_vcpu(p) )
> +        return;
> +
> +    /*
> +     * No mechanism is provided to atomically change vsatp and hgatp
> +     * together. Hence, to prevent speculative execution causing one
> +     * guest’s VS-stage translations to be cached under another guest’s
> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
> +     * finally write the new vsatp value what will be done in
> +     * p2m_handle_vmenter().
> +     */
> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
> +
> +    /*
> +     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
> +     * or/and in p2m_handle_vmenter().
> +     */
> +}
> +
> +/* Should be called after other CSRs are restored to avoid speculation */
> +void p2m_ctxt_switch_to(struct vcpu *n)

Same question here.

> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
> +
> +    if ( is_idle_vcpu(n) )
> +        return;
> +
> +    csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
> +    /*
> +     * As VMID is unique per vCPU and just re-used here thereby there is no
> +     * need for G-stage TLB flush here.
> +     */
> +
> +    csr_write(CSR_VSATP, n->arch.vsatp);
> +    /*
> +     * As at the start of context switch VSATP were set to 0, so no speculation
> +     * could happen thereby there is no need for VS TLB flush here.
> +     */
> +}
> +
> +void p2m_handle_vmenter(void)
> +{
> +    struct vcpu *c = current;

Can you please stick to conventional names, i.e. "curr" here?

> +    struct p2m_domain *p2m = p2m_get_hostp2m(c->domain);
> +    struct vcpu_vmid *p_vmid = &c->arch.vmid;
> +    uint16_t old_vmid, new_vmid;

Nit: No real need for a fixed-width type here?

> +    bool need_flush;
> +
> +    BUG_ON(is_idle_vcpu(current));
> +
> +    old_vmid = p_vmid->vmid;
> +    need_flush = vmid_handle_vmenter(p_vmid);
> +    new_vmid = p_vmid->vmid;
> +
> +#ifdef P2M_DEBUG
> +    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
> +           c, old_vmid, new_vmid, need_flush);
> +#endif
> +
> +    if ( old_vmid != new_vmid )
> +        csr_write(CSR_HGATP, construct_hgatp(p2m, p_vmid->vmid));
> +
> +    if ( unlikely(need_flush) )
> +    {
> +        local_hfence_gvma_all();
> +        flush_tlb_guest_local();
> +    }

Why would the latter be needed here at all? And if it was needed, why
would it depend on whether a VMID roll-over occurred?

Jan

