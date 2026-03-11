Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BP5NQ2KsWnkDAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 16:28:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408DA266829
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 16:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251276.1548483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0LSv-0002yu-OO; Wed, 11 Mar 2026 15:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251276.1548483; Wed, 11 Mar 2026 15:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0LSv-0002wA-Ks; Wed, 11 Mar 2026 15:27:17 +0000
Received: by outflank-mailman (input) for mailman id 1251276;
 Wed, 11 Mar 2026 15:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0LSu-0002w4-2F
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 15:27:16 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7c30de0-1d5e-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 16:27:14 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439af7d77f0so13951f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 08:27:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f8223dc2sm7656888f8f.38.2026.03.11.08.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 08:27:13 -0700 (PDT)
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
X-Inumbo-ID: c7c30de0-1d5e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773242834; x=1773847634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TBnN2Dumri8XGwoA7NBPI1PL+2jwWyiT4+WfYmUV3Yo=;
        b=bujf7qvTb9gRybh2hfjInKYWL/PnAHpPuZwjuHQkwxeeAKGo1ys/YY6rS2ooylTf3a
         3Ymyodbh4+lADaA3rRBHwTpZFrbbDZIMZqOZ8PkjcT+0sf4y3uBu4EnI6BleoFCgOV0G
         DtikvMA0Qsgm0psVpimwno/JShsBaGfiJLiYwVmainv9PeW5My/6xsXz68TCii5hmvEe
         k5QP4UKs8VUPi1RiMMY/wOkCu18p3IYXbJWJmRg8Cb7Tlfj9oN+JmDti+XODgET9b1Mn
         L5rrXU0Zxi2d1kFaK1eILWiWQxgS3tn8EnUd5HBLwut9sXwozebacKbqvzaYGByQ7Qf1
         XwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242834; x=1773847634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBnN2Dumri8XGwoA7NBPI1PL+2jwWyiT4+WfYmUV3Yo=;
        b=KTiH+1IOhLOj4vujZ/dtRiCajzzY4FXthMvDJQMqJ10x+zpj+1wbNDNtm3RmEug3lN
         l7IbS2n2fSepDWmSPGxMslI2tRyPBkqMh19MRKrtTU5qVJthLwvp5kZasuMJUVoNQ55/
         Q7IyoR0pi+KEkazQbQOLrov7R9h9pUuh7Iv4cCoHqt0Kj2wZ6oSdvYoRUyIf4hQqHWF8
         K3QvKMNyFQuuY1ND2NZTpRuLdfzZXt+CFjaCR6qtaOmkfFl/I8VS/PAu8gc0W7h8K0v8
         AsQoZQiLe7uS3ylU4ER0a6X4suMyYgyDOBZyyUNygjuBPr6rOScF+VmRfCgp+B7XgoOu
         XRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNw/wG5PE9Fc4QjoaFfzGuPVbGhb4497YExG2tFib0E55axENo7tkykGhkKUa2aRUsTgZcYquu3Vk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeF54UkaEgazkWt7sLbPPzoLhAi4Ck3E9JTaLdEOZn2q06UjfI
	CA5Od7U8d8MhUDyhsKoSa/1JVg5mIu1B1JzNnOAppBqoZZQUcdW0kraYnmNNe7liyw==
X-Gm-Gg: ATEYQzyR5A9m2QYSUf2DOD69Ujg1wvePOTOlSLzyB6POSfYUWJV2ImoYfvYyQRSC7jz
	5VVjsDB0uxsXhg8wwvJB5+m/F8MRCqbOxQvaLpkYT6M3+CWK78IrZ+q5LfAdVq+Ywiy3XJVKiYR
	Db86vssrSNB+5R4vs32uDPWpGbktj0Om8X9TUZpKvqFeGVtsvGipuqjaTw97XxjRRytO82mjFY2
	7CH0EHVgoa+BaVBvwyfnjwtxkqOuYhphTzX75tw/9c4qYQzCcj3pPEkhRa5oHzgBa6pJPYf5E8F
	sK0io5Xv53UyAAPo19dFqta4ze/bPnBpSZxihX1yEgHPVMaMx2stkVgc/himAkw9aob8B5RCN2i
	3CMT14J0k1WJg8IBEG1KJ2JoPsgeeB9abqXYps1fsIlXPgVCQidPvPUUxN7+rbwvdQHqV+Wj+lX
	spizkJ/xzuLQKEQ1Cg6c2iAwLsHmhIKxMttYw0ZiNLmAR+WPA8FApUomp79vHEyjwrbcOCVNaUA
	cbsryS99l/0YcY=
X-Received: by 2002:a05:6000:2283:b0:439:ae2a:755e with SMTP id ffacd0b85a97d-439f82017a2mr5884569f8f.23.1773242833530;
        Wed, 11 Mar 2026 08:27:13 -0700 (PDT)
Message-ID: <1e371e65-ca79-42a0-93f9-804f73084033@suse.com>
Date: Wed, 11 Mar 2026 16:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] x86/hvm: Support extended destination IDs in
 virtual MSI and IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-3-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-3-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 408DA266829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 13:31, Julian Vetter wrote:
> Use the newly defined masks to extract the full 15-bit destination ID
> from guest MSI addresses and IO-APIC RTEs. In hvm_inject_msi() combine
> the standard bits [19:12] with the extended bits [11:5] of the MSI
> address into a 15-bit destination ID for LAPIC delivery. Increase the
> dest parameter of vmsi_deliver() and hvm_girq_dest_2_vcpu_id() from
> uint8_t to uint32_t. In vmsi_deliver_pirq() extract the full destination
> from gflags via XEN_DOMCTL_VMSI_X86_FULL_DEST(). In msi_gflags() pack
> the extended bits from the MSI address into the new
> XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK field of gflags. In
> vioapic_deliver() read the combined 15-bit destination using the
> VIOAPIC_RTE_DEST() macro. Extend ioapic_check() to check for extended
> destination bits set in a domain that does not advertise
> XEN_HVM_CPUID_EXT_DEST_ID and refuse to restore the IO-APIC state,
> preventing silent interrupt misrouting after live migration.

This is pretty hard to read without being split in a few paragraphs.

> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -374,7 +374,16 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
>  int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
>  {
>      uint32_t tmp = (uint32_t) addr;
> -    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
> +    /*
> +     * Standard MSI destination address bits 19:12 (8 bits).
> +     * Extended MSI destination address bits 11:5 (7 more bits).
> +     *
> +     * As XEN_HVM_CPUID_EXT_DEST_ID is advertised, the guest may use bits 11:5
> +     * for high destination ID bits, expanding to 15 bits total. Guests unaware
> +     * of this feature set these bits to 0, so this is backwards-compatible.

How do you know? Like for the IO-APIC RTE bits, there is (and cannot be)
anything enforcing this. Hence for a guest to use this feature, it needs
to have a way to opt in.

> +     */
> +    uint32_t dest = (MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK) << MSI_ADDR_DEST_ID_BITS) |

Nit: This line looks too long now.

Here as well as ...

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -411,7 +411,9 @@ static void ioapic_inj_irq(
>  
>  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>  {
> -    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
> +    uint32_t dest = ((uint32_t)vioapic->redirtbl[pin].fields.ext_dest_id <<
> +                     VIOAPIC_RTE_DEST_ID_UPPER_BITS) |
> +                    vioapic->redirtbl[pin].fields.dest_id;

... e.g. here a macro or inline function doing the conversion would likely
help readability quite a bit.

> @@ -618,6 +620,21 @@ static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h
>               e->fields.reserved[0] || e->fields.reserved[1] ||
>               e->fields.reserved[2] || e->fields.reserved2 )
>              return -EINVAL;
> +
> +        /*
> +         * An RTE in the saved state has ext_dest_id bits set. Check that
> +         * the destination Xen has extended destination ID support enabled,
> +         * otherwise interrupt routing to APIC IDs > 255 would be broken
> +         * after restore.
> +         */
> +        if ( e->fields.ext_dest_id && !d->arch.hvm.ext_dest_id_enabled )

This won't build, as the ext_dest_id_enabled field appears only in patch 6.
But yes, that looks to be the opt-in mechanism I mentioned above.

> @@ -659,7 +676,7 @@ static int cf_check ioapic_load(struct domain *d, hvm_domain_context_t *h)
>      return 0;
>  }
>  
> -HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
> +HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_check, ioapic_load, 1,
>                            HVMSR_PER_DOM);

As per the comment there, this belongs in the earlier patch.

Jan

