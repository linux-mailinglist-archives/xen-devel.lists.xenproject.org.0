Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lkIqH7sWMGoiNQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:14:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF69687873
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GJZ6ow3c;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338370.1599396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ90L-0007t1-O6; Mon, 15 Jun 2026 15:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338370.1599396; Mon, 15 Jun 2026 15:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ90L-0007qe-KB; Mon, 15 Jun 2026 15:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1338370;
 Mon, 15 Jun 2026 15:13:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ90J-0007qY-IH
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:13:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ90I-000QmA-VL
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:13:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a301699-bab6-0a2a0a5309dd-0a2a4501933e-22
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:13:34 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30169e-c1f2-0a2a45010019-d1558032d429-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:13:34 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so22821595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:13:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922037ba81sm244907275e9.15.2026.06.15.08.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 08:13:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1781536414; x=1782141214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8AnYitvNUXv0OtlVvfG7YRGg2CPz/gP+9/bPKhnL9l0=;
        b=GJZ6ow3cY21Rq2gnI2Pa+3QjW/qmiAekYQJ2SMCUV6kEhz7zh9vf6MzxAuv9Qb3mhh
         gSI4W8lZC+JIUTAFK0qyRU1LP4uL020bgL7w7bMUFEWCy5uETcwU/cfDD3uioTdBS7E/
         yn4XAP2djgob6kUs4Keg2eL9C3YaqoxvqNwDosVblNajCcs3S5lYS6yN40sXW85F48HR
         kPdRYCe7AjB0pvQrAuREpKqYR/zDyIw79SwyBRDHwXtVdnExS3cad9QBrtVtwzCx7yfP
         bT+6oCLdAQz2sr2iKYO+P+GQu+sl8Pp17NWTuvahdO4k7NvfsCdPvo1OLoj31EPFmzbp
         O3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536414; x=1782141214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AnYitvNUXv0OtlVvfG7YRGg2CPz/gP+9/bPKhnL9l0=;
        b=Px/l3DWvV0FM83KLBhoCwDNbaxJUwAmKWsc+hYSRoqwzRBA/5FfyVOigihKz+JUn+2
         D/7a8mzEXiNLiBl0AUdiCkPKCjMTjFvhNRvlZxFqLqRmm+wGGvRfMs5WclqpNgmkaU/b
         /5aqz5R+9yh4YoA6gjP0trEjTdkJDHCUnPV+PUYFYKYDPO2fL+gheuAo3jDPPk+wwqmR
         rWtxX6GebbFdZZtzLogByIjHzM+wnTjKEpGLV1VNsqtsceYi9V1quOhhZwu3gx1HS5k4
         AWogcuUM1WYbjAqwKhkN8W8ajo65AUQFKtm0AShZ7uyYdQTi78Sf4HYMSjdbN693X/zE
         Fhuw==
X-Forwarded-Encrypted: i=1; AFNElJ8w3sOgXYgY54htOg3DoSY4vS4s6INdZHohC7Ua+wvCCSpz4DBXvDj1DEMT/YmGneldqFskALonZlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywkbc+yed9tc33iQNTi+lcRTo4s+scEEuM/GecOBQZJJfedHeZU
	/jLw5ArDPLdFOMYVV2oICQyBpw7xbsO+2JGuFaKmoNkCBoQyCNvcoxfGwMNYwD3AsQ==
X-Gm-Gg: Acq92OHboCs4YrlDvIlVitUD8/xBzJb43kcJzjubfUPBf6r6bV9rQJ1X0lPZn4XuC8b
	NckkkDdA5Czd/WhMrY/LIKXwdSMU+/yMV/il8VzN6/VugH5TxrTDQeTVCgnYbItiMz2/QY06+t7
	xXWblAk2pG1oPH0xJKtaWRjb9/alNPkp6GUAva6PLmyK1i5tX2bVoB/M8rfhh6JL5p27tfLRs8F
	ve9VZcYt3fmptwelTJPzDKfih5Jd7cI7fo/ooa6idUCbvnKeqcSGAvhr+ztqhZmS4/CaD4Y5aoC
	y7mLrZDhydXPDWMmzQmO8UFCQh3WWUgr8Y2bgBO4PIfC1YilxeQnvuPjxSchcs7hrRu3O0pSsp0
	Dm6XCYqfqKtAaqPKmY545Y6tJifW7Y4DuRgxuLbWJq/0C2qZGFkbjQ34+sj9/b6nxF7rXzXLYB7
	6Cy9ihb81HSezpFEluXsk9OTgZmC80sXEmfGUe+2CACd2vSYj1kgzJOgLd9v2pIGshdLoZrF1tU
	lCg2K2UmIU4RTM=
X-Received: by 2002:a05:600c:4710:b0:490:601f:d766 with SMTP id 5b1f17b1804b1-49220085103mr137115535e9.1.1781536413965;
        Mon, 15 Jun 2026 08:13:33 -0700 (PDT)
Message-ID: <133430db-5605-4f3a-8ff7-77f9b57c91ad@suse.com>
Date: Mon, 15 Jun 2026 17:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <434e0be590bc0550e143836edff7e8e1e96b28c1.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <434e0be590bc0550e143836edff7e8e1e96b28c1.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781536414-B655DFF4-39B4B005/10/73395122804
X-purgate-type: spam
X-purgate-size: 12329
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCF69687873

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> Guests running under Xen program interrupt routing by writing to APLIC
> MMIO registers. Xen must intercept these accesses to enforce interrupt
> isolation between domains and to translate guest routing intent into the
> underlying physical MSI topology.
> 
> Writes are gated by the domain's authorised interrupt bitmap so that a
> guest cannot affect interrupts it does not own. TARGET register writes
> additionally require translation of the hart and IMSIC guest-file
> indices from virtual to physical, as the APLIC uses these fields
> directly to compute the MSI delivery address.
> 
> Delegation (APLIC_SOURCECFG_D) is not yet supported.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Merge the following patches into one:
>     xen/riscv: add vaplic access check:
>       - Add check that address is properly aligned.
>       - Check vaplic range intead of APLIC one.
>       - Return bool from vaplic_is_access instead of int.
>     xen/riscv: emulate guest writes to virtual APLIC MMIO
>       - Drop CALC_REG_VALUE.
>       - Use unsigned int instead of uin32_t for offset.
>       - s/.../subtracting in the comment.
>       - start one line comments from the upper case.
>       - Check the value before being written to sourcecfg register.
>       - 'unsigned int' for loop index.
>       - Omit unneessary braces.
>       - s/vaplic_update_target/aplic_msi_target_gen.
>       - Use IMSIC_MMIO_PAGE_SHIFT instead of 12 in aplic_msi_target_gen().
>       - Drop explicit usage of APLIC register in store function.
>       - Drop APLIC_REG_{GET,SET} macros and introudce APLIC specific funtcions.
>       - Ignore write to SOURCECFG_BASE when value is out-of-range.
>       - Drop ASSERT(!target_vcpu) inside handler of targer register setting,
>         just avoid such writings + debug message.
>       - domain_crash() instead of panic() in the case of default case.
>       - Drop ASSERT() in APLIC_SOURCE_CFG_BASE case and use domain_crash()
>         instead.
>     xen/riscv: emulate guest reads from virtual APLIC MMIO:
>       - s/regval_to_irqn/regindx_to_irqn.
>       - pass to to_vaplic() a domain instead of vintc.
>       - add check that load access is aligned.
>       - instead of panic() just crash a domain().
>       - use 'unsigned int' for local variable offset.
>       - Return 0 in the case APLIC_CLRIE_BASE ...APLIC_CLRIE_LAST reading to
>         follow AIA spec.
>       - Drop explicit usage of physical APLIC registers.
> ---
>  xen/arch/riscv/aplic.c              |  25 +++
>  xen/arch/riscv/include/asm/aplic.h  |   9 +
>  xen/arch/riscv/include/asm/intc.h   |  10 +-
>  xen/arch/riscv/include/asm/vaplic.h |   3 +
>  xen/arch/riscv/vaplic.c             | 289 +++++++++++++++++++++++++++-
>  5 files changed, 333 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 1c8fd0145eb2..1976733dfbaa 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -40,6 +40,31 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_version = INTC_APLIC,
>  };
>  
> +uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask)
> +{
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    ASSERT(offset < aplic.size);

Further assert suitable alignment of "offset"?

> +    spin_lock_irqsave(&aplic.lock, flags);
> +    val = readl((void __iomem *)((uintptr_t)aplic.regs + offset)) & mask;

Easier as

    val = readl((volatile void __iomem *)aplic.regs + offset) & mask;

? (Note that like const, volatile also shouldn't be cast away.)

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -15,6 +15,8 @@
>  
>  #include <asm/imsic.h>
>  
> +#define APLIC_NUM_REGS 32

What's this? It isn't used afaics, and it also doesn't match up with ...

> @@ -24,6 +26,8 @@
>  #define APLIC_DOMAINCFG_IE      BIT(8, U)
>  #define APLIC_DOMAINCFG_DM      BIT(2, U)
>  
> +#define APLIC_SOURCECFG_D       BIT(10, U)
> +
>  #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>  #define APLIC_SOURCECFG_SM_DETACH       0x1
>  #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
> @@ -71,6 +75,8 @@
>  #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
>                                   APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
>  
> +#define APLIC_SETCLR_OFFSET_MASK  ((32 * sizeof(uint32_t)) - 1)
> +
>  struct aplic_regs {
>      uint32_t domaincfg;         /* 0x0000 */
>      uint32_t sourcecfg[1023];   /* 0x0004 */
> @@ -114,4 +120,7 @@ struct aplic_regs {
>      uint32_t target[1023];      /* 0x3008 */
>  };

... this struct holding all the (far more than 32) registers.

As to APLIC_SETCLR_OFFSET_MASK: Any reason it has the low 2 bits set? The
literal 32 in there also looks rather arbitrary. It would be helpful if
there was a connection to those 32-s in struct aplic_regs that it actually
matches up with.

> --- a/xen/arch/riscv/include/asm/vaplic.h
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -26,6 +26,9 @@ struct vaplic_regs {
>  struct vaplic {
>      struct vintc vintc;
>      struct vaplic_regs regs;
> +
> +    paddr_t regs_start;
> +    paddr_t regs_size;

Can regs_size really go beyond 4G?

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -26,6 +26,283 @@
>  
>  #define FDT_VAPLIC_INT_CELLS 2
>  
> +#define AUTH_IRQ_BIT(d, irqn) ( \
> +    ((irqn) <= (d)->arch.vintc->irq_nums) && \
> +    test_bit(irqn, (d)->arch.vintc->allocated_irqs) )
> +
> +#define regindx_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))
> +
> +static inline uint32_t generate_auth_mask(const struct domain *d,
> +                                          unsigned int irqsn)
> +{
> +    if ( irqsn >= DIV_ROUND_UP(d->arch.vintc->irq_nums,
> +                               sizeof(uint32_t) * BITS_PER_BYTE) )

Why the rounding up? Isn't ->irqs_num the proper upper bound?

> +    {
> +        dprintk(XENLOG_DEBUG, "incorrect irqsn(%d) is passed\n", irqsn);

Once again: %u please with an unsigned int argument.

> +        return 0U;
> +    }
> +
> +    return *((uint32_t *)d->arch.vintc->allocated_irqs + irqsn);

Such casts would better be avoided

> +static int vaplic_emulate_load(const struct vcpu *vcpu,

v please for struct vcpu * variables (in the common case, of course there can
be exceptions).

> +                               const unsigned long addr, uint32_t *out)
> +{
> +    const struct domain *d = vcpu->domain;
> +    const struct vaplic *vaplic = to_vaplic(d);
> +    const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
> +    uint32_t auth_mask;
> +    unsigned int i;
> +
> +    switch ( offset )
> +    {
> +    case APLIC_DOMAINCFG:
> +        *out = vaplic->regs.domaincfg;
> +
> +        return 0;
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_SETIPNUM_LE:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:

For ranges like this APLIC_REG_OFFSET_MASK having the low two bits clear
(or there being some other mechanism to ensure only properly aligned
offsets are handled) would help. Mis-aligned accesses shouldn't be
handled ...

> +        /*
> +         * Based on the RISC-V AIA spec a read of these registers
> +         * always returns zero
> +         */
> +        *out = 0;
> +
> +        return 0;

... like this.

> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +        i = regindx_to_irqn(offset & APLIC_SETCLR_OFFSET_MASK);
> +        auth_mask = generate_auth_mask(d, i);
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +        /*
> +         * As target registers start for 1:

s/for/from/ ?

> +         *  0x3000 genmsi
> +         *  0x3004 target[1]
> +         *  0x3008 target[2]
> +         *   ...
> +         *  0x3FFC target[1023]
> +         * It is necessary to calculate an interrupt number by substracting
> +         * of APLIC_GENMSI instead of APLIC_TARGET_BASE.

Stray "of"? Or did you mean "subtraction"? (Also check other similar comments.)

> +    default:
> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
> +                 offset);
> +
> +        domain_crash(vcpu->domain);
> +
> +        return -EINVAL;
> +    }
> +
> +    *out = aplic_hw_read_reg(offset, auth_mask);

You blindly assume a 32-bit access here (and also in the write counterpart).
How do you end up knowing?

> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
> +                                         unsigned long addr, uint32_t value)

Why cf_check here but not for vaplic_emulate_load()?

> +{
> +    int rc = -EINVAL;
> +    const struct domain *d = vcpu->domain;
> +    unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
> +
> +    switch ( offset )
> +    {
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> +    {
> +        unsigned int irqn = regindx_to_irqn(offset & APLIC_SETCLR_OFFSET_MASK);
> +        value &= generate_auth_mask(d, irqn);
> +
> +        break;
> +    }
> +
> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
> +        if ( value & APLIC_SOURCECFG_D )
> +        {
> +            rc = -EOPNOTSUPP;
> +
> +            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
> +
> +            goto fail;
> +        }
> +
> +        /*
> +         * As sourcecfg register starts from 1:
> +         *   0x0000 domaincfg
> +         *   0x0004 sourcecfg[1]
> +         *   0x0008 sourcecfg[2]
> +         *    ...
> +         *   0x0FFC sourcecfg[1023]
> +         * It is necessary to calculate an interrupt number by subtracting
> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
> +         */
> +        if ( !AUTH_IRQ_BIT(d, regindx_to_irqn(offset - APLIC_DOMAINCFG)) )
> +            /* Interrupt not enabled, ignore it */
> +            return 0;
> +
> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "value(%u) is incorrect for sourcecfg register\n", value);
> +
> +            return 0;
> +        }
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +    {
> +        struct vcpu *target_vcpu = NULL;
> +
> +        /*
> +         * Look at vaplic_emulate_load() for explanation why
> +         * APLIC_GENMSI is subtracted.
> +         */
> +        if ( !AUTH_IRQ_BIT(d, regindx_to_irqn(offset - APLIC_GENMSI)) )
> +            /* Interrupt not enabled, ignore it */
> +            return 0;
> +
> +        for ( unsigned int i = 0; i < vcpu->domain->max_vcpus; i++ )
> +        {
> +            struct vcpu *v = vcpu->domain->vcpu[i];
> +
> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
> +            {
> +                target_vcpu = v;
> +                break;
> +            }
> +        }

Why is a loop needed here? vCPU-s are numbered sequentially.

> +static bool cf_check vaplic_is_access(const struct vcpu *vcpu,
> +                                      unsigned long addr)
> +{
> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain);
> +    paddr_t start = vaplic->regs_start;
> +    paddr_t end = vaplic->regs_start + vaplic->regs_size;
> +
> +    if ( addr & 0x3 )

Nit: Does the 0x here add any value?

> +    {
> +        dprintk(XENLOG_DEBUG,
> +                "APLIC MMIO address should be properly aligned\n");
> +
> +        return false;
> +    }

Ah, okay - here is the alignment check. Mind me asking for a (documenting)
assertion then in the actual read and write handlers?

> +    /* check if it is an APLIC access */

Nit: Style.

Jan

