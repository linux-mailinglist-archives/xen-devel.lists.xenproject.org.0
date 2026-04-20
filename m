Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGfVBoc15mkGtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:17:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D142CDB5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286033.1567153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpRF-0000OA-7b; Mon, 20 Apr 2026 14:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286033.1567153; Mon, 20 Apr 2026 14:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpRF-0000MR-4K; Mon, 20 Apr 2026 14:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1286033;
 Mon, 20 Apr 2026 14:17:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEpRE-0000ML-32
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:17:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpRC-0047OK-FE
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:17:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e6355a-bab6-0a2a0a5309dd-0a2a450aa6c4-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:17:22 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e63572-56b3-0a2a450a0019-d1558030a5e7-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:17:22 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so4131355e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 07:17:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d112sm33017573f8f.29.2026.04.20.07.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 07:17:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1776694642; x=1777299442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wg5SNyawniDLyLPrqcYAyIPgt3DlZagpj1lREfaB3qw=;
        b=FI+pb3otTrtWMiFcUDR730IpcXvDtiTcZ0rdY2pZCFKr0+44e6Ep9whF4ZOLxX0mmx
         cqGSAzbXytwAatQ9L9EE8vXwLnwr67q45mLijyLpIq3fPSUzv0quQ0NC501R0znjHc8D
         YE/PQThlAnbs5fEX/SsOCn40j6T3fsbsYEOxgQGSTbHeQJWOGPfEu/bIJ1bQOr6MPgZp
         SQNXOUGa0MYYZ4hM8N76+K5jbVz5T/OZ8kNrnBlsPG1zsBVkjw2AeLib4g2q2foYb0Ez
         ronuhSeHHzOLfNfsDuIqSXpT7VEcqjV1swF9XfAAo9vRxtn3kmj+5fcUPODkhEUcrKCA
         ONkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694642; x=1777299442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg5SNyawniDLyLPrqcYAyIPgt3DlZagpj1lREfaB3qw=;
        b=I5F+RKDzVpgVtsnr2wODQma7h8PWBg+BFHrpGR9cm/9XZ/GOxgRoiwtV/rlpOvSaIf
         f6QYMtvJnTuGeiWipJ1kM6ez0szEZfWuA9I0+HNX4qqtw7rcYtPLbX8ffuYHcn5sR7WQ
         pklaspygFYcY1jbko6LT8YNSbMC/Xtv52ZsD75KaIlUxsh3lXVgBajZJzknBh8Hu2X13
         GjEiy1UpwK4hwMYvuJ+Nfm8GX7gRmmC3pnmvPPRunHFhQj4Ol082l1gpnkT/w9hAa1NV
         Dz6uxeTeZ4YpZeCSNmNmrrQtctf6rtSGe02nkJIEE+KkYpRfPdda9Ccd4F3IeaZVUD6J
         PFwA==
X-Forwarded-Encrypted: i=1; AFNElJ9m2h9DV1p+hv7hr+9djf3ecw6tqwJD5ZKDB8T5gQ4+AIxTNBFk5vFukD+FUDLfVATO9BNWPnMK6Uw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRyrQiyiYs+UFupYcS9sWjeqpTrpm+0JkN53Shy8QlTerE3zIy
	hnWhrHSp2WDsMnz9i4HnJY40MRLW3lbg/TFbh0a1xkygIUvkCSCoDYU+MmqAMHcWKg==
X-Gm-Gg: AeBDietZUP4fGY/ptM58q9E66AWR6+QadqJ1MCc5DsXkFe/Bca5mEHmiguZ38XE0yhN
	wyA+Gk5rlIyU3u2L64Mu/7PcdOrjBzTouxjFwPME+eEYHrVpJdt7nZGJoli5Kbzsl4tqH90Nke2
	n/SAw71jolWY/PA6o67Y3DOEFPePtEqQfwyRY2yypEpq/YaBMkCnYzjA0FEwFZwJ9GCq8cNtiYI
	3cL9eh+Nyrissr/m2nv7owrHnJ+886/JAAu1RRn4zkwC1uaDxM6sWngEdZUrTlTY2UHhReuQIUg
	ueBGzcNQEgJzkCaAbbg6x2JaYGKHq9VI94VUw4LH0SOflQOnBgyUxsCKhWbxPQG/lDG1bYPxbBQ
	By9lc5ARsBWM45WZr9wBUf9JDJIEjA/Wz/u/yCiLzeKjWbySikAj43oQAhUUUa9A7Tu9w9gdpHF
	sLoQzVztq9H3yVtrz5iuqRNYLRcWj6eajDW1LD5f2rK4nhldw9oN9wQYglRdOGRZO/3dSi/AJ3d
	S7pekb1CIBWCatrTHQEVKinEg==
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr185446655e9.2.1776694641669;
        Mon, 20 Apr 2026 07:17:21 -0700 (PDT)
Message-ID: <a065f80f-0de5-4bfc-974c-31727dfa91ea@suse.com>
Date: Mon, 20 Apr 2026 16:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] xen/riscv: implement get_page_from_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <e32db25650546146594635821441494ee86648e9.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e32db25650546146594635821441494ee86648e9.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776694642-465748B7-649D5572/10/73395122804
X-purgate-type: spam
X-purgate-size: 2066
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: 843D142CDB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> The function is implemented out-of-line rather than as a static inline,
> to avoid header ordering issues where struct domain is incomplete when
> asm/p2m.h is included, leading to build failures:
>   In file included from ./arch/riscv/include/asm/domain.h:10,
>                    from ./include/xen/domain.h:16,
>                    from ./include/xen/sched.h:11,
>                    from ./include/xen/event.h:12,
>                    from common/cpu.c:3:
>   ./arch/riscv/include/asm/p2m.h: In function 'get_page_from_gfn':
>   ./arch/riscv/include/asm/p2m.h:50:33: error: invalid use of undefined type 'struct domain'
>      50 | #define p2m_get_hostp2m(d) (&(d)->arch.p2m)
>         |                                 ^~
>   ./arch/riscv/include/asm/p2m.h:180:38: note: in expansion of macro 'p2m_get_hostp2m'
>     180 |         return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>         |                                      ^~~~~~~~~~~~~~~
>   make[2]: *** [Rules.mk:253: common/cpu.o] Error 1
>   make[1]: *** [build.mk:72: common] Error 2
>   make: *** [Makefile:623: xen] Error 2

I still think this can and preferably would be sorted, but for now this is
good enough.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a comment adjustment:

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1534,3 +1534,16 @@ void p2m_handle_vmenter(void)
>       * won't be reused until need_flush is set to true.
>       */
>  }
> +
> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
> +                                    p2m_type_t *t, p2m_query_t q)
> +{
> +    /*
> +     * system domains are domains which doesn't have p2m translation tables,
> +     * so they can't use p2m_get_page_from_gfn() and extra care should be
> +     * done for them.
> +     */

This violates style and has two grammar issues. I'll take care of this
when committing.

Jan

