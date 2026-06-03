Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4UMIHZFBIGpjzQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:00:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4657638E32
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:00:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OoPHmPNR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326765.1592102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUn4k-0003un-Gi; Wed, 03 Jun 2026 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326765.1592102; Wed, 03 Jun 2026 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUn4k-0003t8-Bo; Wed, 03 Jun 2026 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1326765;
 Wed, 03 Jun 2026 15:00:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUn4i-0003o4-L5
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:00:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUn4i-001HYX-1Y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:00:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204177-2eae-0a2a0a5409dd-0a2a450ac452-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:00:07 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204177-56b3-0a2a450a0019-d155802ce0cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:00:07 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso120095745e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:00:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b6162289sm64593715e9.6.2026.06.03.08.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 08:00:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1780498807; x=1781103607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h4qiwD+fIY+UkkXj6tpEfx9hA8Hx1mkSUF/YM6TkV7I=;
        b=OoPHmPNRVNS2oDg6TNXjAzH/pGYznsap3LHI76cB8a6vyO1FiF24Cxap/XTdzxsPQv
         TLqkRfLLZcd1IJsRQl/7rMaV5rYgp6LDmeidNTAIo3IFZiP5LjGDCbUtrk7F8Kg+S5O/
         xGs9qOMzL3Pmf58oi/yHMVg1AyrbaLR5ez11Cl+xmA3qf4quV2XvtaLO+pIDAMFnaYZk
         AFkSiqhOi7GIEb6kzI7mmhYu19vHuNc3s2w22cV0r6CQVLk4NFLsx7D0ZZY/B4Wxx4W7
         ipBe+LZCJep02bUqE0tVUyB484I5rLHws94PM1n1tQlAzCyHi9yt7cwiYrQ/TqZ8DwJw
         de8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498807; x=1781103607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4qiwD+fIY+UkkXj6tpEfx9hA8Hx1mkSUF/YM6TkV7I=;
        b=IB94thvjadpCIxJLKBw/zZwlP+zX3RfEyJUrVeY5JfxaVoSBw27NtOsDkIYB3GBYBm
         6e+j2na01kmd2apSk98XFeRiAfsBxj1b8gBG6b2GwkFaeXP2xB2g/a9sfYix/ZIQ2CPq
         X8Gp0OlV0dwZsoF3Yeyif4zvzySnxXzps9ClXsGyL2SmCVNPuFr1oheBQzVecm/IO7+s
         7gr2hgm0fDZN+s5pazCisC95sMX/St4+FtzQXIpfgclPGdQ5KGAHQh3BPzZph/lsqGct
         N3vlQ1O8msQeq7t/vxb98wy5PdBjj6/EvCAyObWUH8YzBdSwprJCSBinCoScNOC8Dz7v
         GTGw==
X-Forwarded-Encrypted: i=1; AFNElJ/CH9mtFMT1EUMXjlYXRXVKybPfsAJhEuSzeUXQrLrgyVjsMe2jUH8LJALaKAfrWn2lDCTeAHvE7HM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuZZFjZWEvMJz2Ih+ow13T5361Sc8bXyk/XHmFO4vNbKZHwAYN
	hw+M9IuAddkjtGqkPWGMQ31Hq091cJGYNBXFP6vKnPc56vfkBOQ8WEcDfcnBzOzOqQ==
X-Gm-Gg: Acq92OEKDTmGxpxFYM3wQFAlxyUFarUOH05kim8mO8OYdpZ6035NKaLeymON+9fojjj
	mSwoZh79AhnQRoEZVEF2pQJLw9Z54tUVTbqDylCtovQ2C2APHBKLStEr7+0Q3oUySpQlrbjXu8O
	mTPz/U7YElTFEia0fViHkit+g3Evjnzp/f+m+WSPwPaNclXRiFTdnPDLtoHt8OtzcTIhKZZE03p
	Bpj7uGFByq7BZW/PtXNY4KSR71/i9KeRDrLlXb1HXL0hmAMkPG6WUA5gVdYQkGuG+hUEErrBssm
	utPyaubHpl9Dal9JidLtgzmL7FBfdG6yOJ7aIjFFCFUE3Un8ylBTnOIyZatIVtBBC9v/PvY0fXd
	SrwzGfLsubFI5J2Y0gGXudo07yqrHfJ1zlN5FcCnyWp+ppgaJ6wkdktFYw4uI8zpoHiXJ57fGt9
	Y3zCSAs5DPOJ4pTq+9yoNB6VQh7zq9hVMKUeeClm2DImpjfwc+GSZUBSvZiBt8Ai/kQFczoZdJK
	hARsXZ16h8jQWwSqfxq9tipGw==
X-Received: by 2002:a05:600c:46ce:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490b5eb0aeemr58045555e9.19.1780498807322;
        Wed, 03 Jun 2026 08:00:07 -0700 (PDT)
Message-ID: <b95f7093-9ae8-4461-95d5-3c4b8a69c62d@suse.com>
Date: Wed, 3 Jun 2026 17:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/26] xen/riscv: introduce (de)initialization helpers
 for vINTC
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
 <fc5560cd49a2b952ce7724c23e41da3368833d9f.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fc5560cd49a2b952ce7724c23e41da3368833d9f.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1780498807-71F698B7-C0E631B9/0/0
X-purgate-type: clean
X-purgate-size: 1459
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
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
X-Rspamd-Queue-Id: B4657638E32

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -11,6 +11,7 @@
>  
>  #include <asm/aia.h>
>  #include <asm/intc.h>
> +#include <asm/vaplic.h>
>  
>  static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
>  
> @@ -94,3 +95,38 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>  
>      return -EOPNOTSUPP;
>  }
> +
> +int domain_vintc_init(struct domain *d)
> +{
> +    int ret = -EOPNOTSUPP;
> +    const enum intc_version ver = intc_hw_ops->info->hw_version;

Again - why would what the underlying hardware has control what all domains
get?

> +    switch ( ver )
> +    {
> +    case INTC_APLIC:
> +        ret = domain_vaplic_init(d);
> +        break;
> +
> +    default:
> +        printk("vintc (ver:%d) isn't implemented\n", ver);

If we take this path for whatever reason, ...

> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +void domain_vintc_deinit(struct domain *d)
> +{
> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
> +
> +    switch ( ver )
> +    {
> +    case INTC_APLIC:
> +        domain_vaplic_deinit(d);
> +        break;
> +
> +    default:
> +        printk("vintc (ver:%d) isn't implemented\n", ver);

... we're also going to take this path (very quickly afterwards), just to
get the same message twice without it being clear why it appears twice.

Jan

