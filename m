Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD5XEBJYwmnQbwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 10:23:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A562F305836
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 10:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260174.1553533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xyV-00011B-Rj; Tue, 24 Mar 2026 09:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260174.1553533; Tue, 24 Mar 2026 09:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xyV-0000yw-Oo; Tue, 24 Mar 2026 09:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1260174;
 Tue, 24 Mar 2026 09:22:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4xyT-0000yX-NT
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:22:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4xyS-009twv-LQ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:22:56 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c257e9-2eae-0a2a0a5409dd-0a2a450a951c-22
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:22:56 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c257f0-1772-0a2a450a0019-d155dd30cc27-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:22:56 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-439b94a19fdso3447601f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:22:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644ae016sm35180325f8f.4.2026.03.24.02.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 02:22:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1774344176; x=1774948976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzkp1NEvaHjOs5nRun5R6Ke0GqBh7Fy7LEq1D+cgpBE=;
        b=WocfXggT7WE2zResTMjsmyHHinrd3uVg6JerTtsVIcXNFl8oMx2b1cLCOisdM2x7/C
         OyoCJW/r57MlaInObGJxbAmSBwHtFlyLiYbMjwZN+Gptc6DERDle16+bhkEXBvFNMBnt
         wqIE6tZJyuQNBQcVOA2J9uUmBpLfGy0jVIxNmcPrWwTX5bzCUoJ65Jma3cOuYQg3jCO5
         eBZ7mJnu8AGsTW0xt3n75UR3Vec4quVKfE+eznZZLElbi2NEKc51Xp6hFeSkEYGJv4O8
         hhJCTkvNLX91P9Bg5mu234P5unpucTT5Z1ttmorW8rzpRtTPBOG9P06ByYLDwodzLaLu
         vgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344176; x=1774948976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yzkp1NEvaHjOs5nRun5R6Ke0GqBh7Fy7LEq1D+cgpBE=;
        b=DJf28kzwjIQK9nXVuqyZWsrPaWufrfqHGA7Y3jT4DDz9oExGYACxJnuwkIXycNbEm8
         s5U4uokhQH+sCKGw2IQboCSxIfBxRUOvSDmkf9PYjAWqv7zBmIhpDkK/apmfI2qhnhfe
         XkzNrWdvXfR6+D+ARNbKM/vB7JQ46oFqeFLoXN+U6XXQ1gDiBcCe8Oydck2GATQwK23a
         KFFy4y4QjMhcGMO1l3kVHLae2ZuBBuf7eZDBQF8W7+oBZdxJ68uzEP8OVUR4zBTITZe2
         QKTS0g8iWYmlE2g/ilOdhyIpQgloDDkZVIbB6cvsuRclq9HWNmE/9EqrgVH+1YJ6CXUA
         mWDA==
X-Forwarded-Encrypted: i=1; AJvYcCWmPcCtWmG4W4JoQs0qdM4HE1oPLjG6J10vKMMUb102s9e4PI+LTxSnD9cI9atvyZKOL8qAqUmgMEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLDjTxokgRhwAGF/AmW3Z1Z2lHVfI0JU9BtCFtFkLt14A2RR44
	Y6mm7MMVSaKPjCcx0AOVKq5K7VVhdmPityq6C2tTjaruFcg201B/HNWaiKVG7kQbsw==
X-Gm-Gg: ATEYQzz9vpfknv7psHMe9EBDnMC52+hVM1dqZwxdFDwiRR9E0XEhWugBm2jvJOfVmoA
	E+4ryFZmrh4XkUmHRKJ3RTjabkrCNSUPU5Ur0ohD6loQ6T7GAGBAXNXB3kd6PHmUGhB1Siwlnuy
	MBENPTwAMQNnFugqHydS3FtxIBIUyaz4xYVX1hDHQwTY5Ij7BVuN5r1yP+DeVl1qcuLjqR9BD9J
	5tIh2WfHMAkwuLzmhgR3jyAiOMoBHl/S/aPB0ZFXan9TglQH4t0H0Lqut3jgrhcvBCQb+SSm0kD
	a9HbP5j6FFSJgxU5qnpxSVgFT+X/VA6bJVRa3QjWHSS2OVz2U5zN2BFVrpdXOyGfDo2yS7LVI5E
	fe9FGMKBxTuabnAQG4DPOUr9Jww+Ii4b6Y7WIUWVMcW3ZbsGb/4MxnINJDBsGNxDvXZp+h1+98Q
	ln/iMcboU8NBwVru65iTz7dMHJY3jILSJDSn2QuohX81+ueQJFPkDnhGq0QOhBaAQMYbCxvFjJ2
	jzhjkvDdRTBc+E=
X-Received: by 2002:a05:6000:2005:b0:43b:4ae5:d7c8 with SMTP id ffacd0b85a97d-43b64233efamr24001095f8f.2.1774344175876;
        Tue, 24 Mar 2026 02:22:55 -0700 (PDT)
Message-ID: <d7438af9-1aad-446b-bd80-7d9e8f955cdc@suse.com>
Date: Tue, 24 Mar 2026 10:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86: Define some Intel vPMU leafs
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech>
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
In-Reply-To: <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774344176-50C84900-A95C430F/0/0
X-purgate-type: clean
X-purgate-size: 1115
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A562F305836
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 17:44, Teddy Astie wrote:
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -162,7 +162,15 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x9 - DCA */
>  
>              /* Leaf 0xa - Intel PMU. */
> -            uint8_t pmu_version, _pmu[15];
> +            struct {
> +                uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
> +                                event_enum_length;
> +                uint32_t /* b */:32;
> +                uint32_t /* c */ fixed_ctr_mask;
> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1,
> +                                 anythread_depreciation:1, slots_per_cyc:4,
> +                                 :13;
> +            } pmu;

Style-wise this looks to follow e.g. the cache leaf, so perhaps okay, even
if I would have preferred you to follow what we did for leaf 6. The named
boolean field, however, wants to be of type bool. And then the unnamed 1-bit
field really wants to be 2 bits, for anythread_depreciation to be bit 15
(etc).

Jan

