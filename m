Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IxzgF0QCjmk9+gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:39:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BE12F871
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229583.1535514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZir-0004dx-2p; Thu, 12 Feb 2026 16:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229583.1535514; Thu, 12 Feb 2026 16:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZir-0004cW-0D; Thu, 12 Feb 2026 16:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1229583;
 Thu, 12 Feb 2026 16:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqZip-0004cQ-L2
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:39:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fff04d0-0831-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:39:18 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so330155e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:39:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0e15bsm108286995e9.13.2026.02.12.08.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 08:39:17 -0800 (PST)
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
X-Inumbo-ID: 5fff04d0-0831-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770914358; x=1771519158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZWqf1vFlUsMu2hMwJo3KsQQAIdjpGWh1C3SAdxuFZo=;
        b=RJi9FMG6UpV7PWPV1odjl83UIjjrwBWlAzQKUFNwdnGkF4Rxf8IYwrm+MmYQ9CVV5z
         tTfp5BGtZtCW6OKqnygWORyyYjFkLFUMQKNUKgbl6dyqf5ZLf6hlyRER+7DeSS6jRzVT
         hjY5e5QVZXiwfkBG8G5jjsl3C4K2pLmdBQECmqa9Ga7Zf6VK9/w2EWm/YJY58sEmt1ls
         yBFx6SD+VaoLaPsu9lfc1B3k2fummy6oamTYUZ0NmFd1G7o1l7dQwa3T8Lu4QHS/6YP0
         CqecOt5lnR+dstrvJC5KoRRwPoD14Kh20GfFQQXWDPmNV7LuiiRDcnH1pNYURDzK/dpE
         sQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914358; x=1771519158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZWqf1vFlUsMu2hMwJo3KsQQAIdjpGWh1C3SAdxuFZo=;
        b=Wb7tRl5zDBrJMyoa2vlZaGSKiRjxQGQgqSquAUJ1Ge8ISahuONH6YcXOkgwlWGwV7n
         d0hDDnxM6yDdpzprp9h+JCUQO28nY/SJYtZEEPZZ6p0FxrIcnwDJ1HyhWDzqGdW3QXhU
         XvX4Swpq+KNP5t9dc3MPoomK+VMKMBgX52WK4iFPxn+2Kv8g+u3Cw7AYzdYleiZi6k00
         MCA2xSUw1EG9P07VEK7tnJl9rt6W3+ow9Qp5rAEbEq6ROlxeKQI8Z/k3I8qwbkogcTFt
         n4TpvhrZLl/ayyGxqaBuWLacwjkrHBrAbdMHNfkaFXyRJh5Ric6jXT2bXPuwwhp0V6d5
         pBng==
X-Forwarded-Encrypted: i=1; AJvYcCXb1A8+x0HLb8PmC5bA7KBAgeaqfW95ggmRvbvHxQBjq/azq6BuxBpW6Fu7GJIs8GMx+qlQb8etNw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj6PHB4SJZpAhsmkhp1j4oq5JifOzHkDhB1FPVtNeFBXsLXyEp
	j0tWaBNb2c6OAuPXK/K2uTyeMRQRwu9PxcVuHtghCIGYigusa1heSTAjiH5UPU3eNA==
X-Gm-Gg: AZuq6aIL/7o6kl2dNDwA9JbdYYtlf1xo4KWDHZOglY+SYWKnvXpJ6ROBMNAdQ/8fWAx
	08YLijswJjQRTy1tqxVQzQ9EBICFRVB0ASaHkTMSIkvFBuGfy40CMcHyogHMdeYBCRGRFchnvF0
	ZIIsuBcACRx7VrJ9hRWXTEmBDdZrtXZWG47AF3ClMmjlumO9am2841ta+KSlBODdJUl7/5b4DeZ
	Lj/72Gla8t9lalMkwnHPleE1/yg9I2dJdE8bcz6T/X3J7acyjDMSkIst+9pJ4Ip6dyywtwYgosK
	U+OYGLePGEfE9XYKUlJuJ+7l45nym4Umomh5dtxrp1nbRkXVkE0+k4RhEWSedxWExM57RabJgcO
	zuGQ6UGgRcqs4GSZaBKAydgzOu6Vjkz30TZofw8JHo+lEQDeBTKiqcsGtNZoAl+tTBSS/F6xORE
	B7Urs8IADCr/KfQ2bCqqXOUyYQnz44KnTrFKm6PVhuu8EdQPnW0LpNzdHW89kl9ZcDJ1tIoqPbP
	Owmqp9rSgOfhfI=
X-Received: by 2002:a05:600c:83c8:b0:47e:f481:24b7 with SMTP id 5b1f17b1804b1-4836570e26bmr49282605e9.17.1770914357729;
        Thu, 12 Feb 2026 08:39:17 -0800 (PST)
Message-ID: <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
Date: Thu, 12 Feb 2026 17:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
X-Rspamd-Queue-Id: C15BE12F871
X-Rspamd-Action: no action

On 12.02.2026 17:21, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -44,6 +44,9 @@
>  #define P2M_LEVEL_MASK(p2m, lvl) \
>      (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
>  
> +/* Holds the bit size of IPAs in p2m tables */
> +extern unsigned int p2m_ipa_bits;

Hmm, I can spot a declaration and ...

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -51,6 +51,12 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>      .name = "Bare",
>  };
>  
> +/*
> + * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
> + * restricted by external entity (e.g. IOMMU).
> + */
> +unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;

... a definition, but neither a use nor a place where the variable would
be set. Hmm, yes, I see common/device-tree/domain-build.c uses it. Then
the following questions arise:
- What does "ipa" stand for? Is this a term sensible in RISC-V context at
  all? Judging from the comment at the decl, isn't it PPN width (plus
  PAGE_SHIFT) that it describes?
- With there not being anyone writing to the variable, why is it not
  const (or even a #define), or at the very least __ro_after_init?
And no, "Arm has it like this" doesn't count as an answer. Considering
all the review comments you've got so far you should know by now that you
shouldn't copy things blindly.

> --- a/xen/include/public/arch-riscv.h
> +++ b/xen/include/public/arch-riscv.h
> @@ -50,6 +50,14 @@ typedef uint64_t xen_ulong_t;
>  
>  #if defined(__XEN__) || defined(__XEN_TOOLS__)
>  
> +#define GUEST_RAM_BANKS   1
> +
> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
> +
> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }

Hmm, does RISC-V really want to go with compile-time constants here? And
if so, why would guests be limited to just 2 Gb? That may more efficiently
be RV32 guests then, with perhaps just an RV32 hypervisor.

Jan

