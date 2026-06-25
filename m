Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3kaAJms/PWqa0AgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 16:47:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06826C6C9B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 16:47:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KvAn0866;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345692.1604480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wclLk-0000jk-To; Thu, 25 Jun 2026 14:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345692.1604480; Thu, 25 Jun 2026 14:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wclLk-0000gw-Qe; Thu, 25 Jun 2026 14:46:40 +0000
Received: by outflank-mailman (input) for mailman id 1345692;
 Thu, 25 Jun 2026 14:46:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wclLj-0000gq-GO
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 14:46:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wclLi-005jTR-Sb
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 16:46:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d3f43-bab6-0a2a0a5309dd-0a2a4509d1f2-26
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 16:46:38 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d3f4e-97e6-0a2a45090019-d155dd2bd5e9-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 16:46:38 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-46dc0d0eb2aso711556f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 07:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46dd5f9da4fsm6087595f8f.23.2026.06.25.07.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 07:46:37 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782398798; x=1783003598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GXm0GVGKhdsVpoTo1dWrOJZD0tzMGODvnRJAUs+lf1A=;
        b=KvAn0866lIfNae+DVj90ZFIWV9qfSeSBZaCe8RciK5fp810ut9JtDNkVESFiWjdZdP
         xkp1mFvXL0sXAjfgJ2fbsZLmzgZgbFqtJXjhFgaRhCCJuG+v/l+X3yaoOPkb2w4b6PXK
         lYr38ong4C4E5LaDEMi1pusu2AH5isrBO6Evg9L6j0D22k7/DyjXPMs0QM5XGiWdw1E2
         VKQrG4mwa1jdPMJ62UqFJXVwtUxXpNNWzVq1xL8f/tPyaMAEFar5xGkdiqIWMA1hAz2P
         4l7Wt0Y4EUB7vS/Tn3U608CndsjHApq1709oCO9s3EnFbAspH29M9Etg3ApsLUxcLJLO
         Chzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782398798; x=1783003598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXm0GVGKhdsVpoTo1dWrOJZD0tzMGODvnRJAUs+lf1A=;
        b=d7mFPbTpu8wvOeAxsfRo3Mw7lY5vh8/fj1182tLLZmoWAPPaEgwN3L1xUYN3opsAUX
         7ukcu7+LfI0lU34o3NfEiw7ucLl3Uu4xOMmbL2OxNkncAPsROg0iad5MNy6+13M2owo+
         MAUOHGDAK8bSBMIKE8PyuP30QaxKXzsWddBzZ5TDf/m4Ky1KWn8BxYWyTDudSBJ5BDss
         Oz8naPddmLR6i6tgaHDE414ZALermho7ujtBOyI1oD4w7lOfUVeYDzRoQ8dD4UlaUFOt
         8BoYZiiRulzX9dyCQm1jaITFhKb0Jq4oxasOig4vXYg4JVAT2DNzv01rzkNde9WssaGO
         fQWw==
X-Forwarded-Encrypted: i=1; AHgh+Ro68T1ZjFftRvZO0lVHAMtcIt2RTxISJMJtKnenTkB6IO9vkjgsIu5YLa8vzedrtOFmJ90kdI9sqm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFsk0n8ni5mXdAYahMksNSMK/8RYXlIfDsCSOwv3GfdFwtVqvO
	Z/4eDNAzhrwmaeNh1asl1uVVqXIeZ1IvhOVcd3xKxOWu3b6FkRmE6eHd0aQ5anTMpg==
X-Gm-Gg: AfdE7clwaIWDPIflqAOW3HjMJr3XiqzOGDfuOWdMzJCyMFUJNWrg5QQHdWMtbWRNN0Q
	pC95/mb8oLIFNmG/3oi29sze3tELSX/PptualX5+S+gHgrY1wVQLmXxuZddqTHrFiDgM+C8/go9
	QI7wUUPVJ7Bc1hxbqgL5lXWOcIx9A6QqplAAWvkSL+fyeJSA6GsYvZSEb0hPN6HV1bqRggmalLf
	oibY+Qdoya0ei8vbO2nRHPdrovqTl25PnCO41cWPAiNvZ66JoPIqfkdJgnSUgZMnw04G1UMYZ+a
	9yRQlY/qI72tEtAbD+OwParlBJI8FFku3kJpvqy+c75fYHFvQYd6kQAH/8PdFG/wxOqRSE6rOpZ
	Ozvqy8SZaAnTpP/ao+/tGGb3E6eAEyuKcI0trTSufo0pClbX1PQojcTNnzWEpTSNdnlTEBE+/da
	NiSDBuasMiU5b9czdp/fl4vhLBeONVHr8bfnVVqORJLNa8P9AYNM65Dg6Sn1oAgsw8QEczd9YVW
	hi4
X-Received: by 2002:a05:6000:46dc:b0:46e:341b:45d6 with SMTP id ffacd0b85a97d-46e341b46d5mr1927865f8f.9.1782398798184;
        Thu, 25 Jun 2026 07:46:38 -0700 (PDT)
Message-ID: <cbb164f1-502d-44f0-850d-ed42ea690c02@suse.com>
Date: Thu, 25 Jun 2026 16:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] x86/vioapic: Add ioapic_check() to validate
 IO-APIC state before restore
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@vates.tech>
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
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782398798-44B2B986-D197F6A2/0/0
X-purgate-type: clean
X-purgate-size: 1497
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E06826C6C9B

On 27.04.2026 15:53, Julian Vetter wrote:
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -594,6 +594,32 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
>      return vioapic->redirtbl[pin].fields.trig_mode;
>  }
>  
> +static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const HVM_SAVE_TYPE(IOAPIC) *s;
> +
> +    if ( !has_vioapic(d) )
> +        return -ENODEV;
> +
> +    s = hvm_get_entry(IOAPIC, h);
> +    if ( !s )
> +        return -ENODATA;
> +
> +    /* base_address of 0 is never valid for the IO-APIC MMIO window. */
> +    if ( !s->base_address )
> +        return -EINVAL;

It also wants to be suitably aligned, and it wants to be below the domain's
phys-addr limit.

> +    /* IO-APIC APIC ID is a 4-bit field. */
> +    if ( s->id > 0xf )
> +        return -EINVAL;

This wants to remain in sync with what vioapic_write_indirect() does, i.e.
there likely wants to be a cross-referencing comment at each site, and the
logic likely also wants to be similar here.

> +    /* ioregsel must address a defined register. */
> +    if ( s->ioregsel > VIOAPIC_REG_RTE0 + (ARRAY_SIZE(s->redirtbl) - 1) * 2 + 1 )
> +        return -EINVAL;

Why would this be? vioapic_write() doesn't apply any restrictions.

> +    return 0;
> +}

What about the redirtbl[] entries? Values vioapic_write_redirent() would
never store shouldn't be accepted here.

Jan

