Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPoeO2dcnWmxOgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:08:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537311836CE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239499.1540899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunSU-00021M-Bt; Tue, 24 Feb 2026 08:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239499.1540899; Tue, 24 Feb 2026 08:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunSU-0001yy-7f; Tue, 24 Feb 2026 08:07:54 +0000
Received: by outflank-mailman (input) for mailman id 1239499;
 Tue, 24 Feb 2026 08:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vunST-0001xa-AI
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:07:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e802cac5-1157-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 09:07:47 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48372efa020so41054475e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 00:07:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b890041csm16512515e9.5.2026.02.24.00.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 00:07:47 -0800 (PST)
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
X-Inumbo-ID: e802cac5-1157-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771920467; x=1772525267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ob3Py8e79uNOSOSdNosFw/qJ6k5/SSX4TduJtiw8gI=;
        b=YaoYSen0Ge3npaDsNgZAYvtx6t+Zl/E1VHrhxxo0UuEoRBcv3XGYVjv1WAaIWm8MTM
         TG/A9MhWFeDtMi9XWALavUjqBENap/4P5P/Ltlh0q4ql9uFkkXs2cAOFKEZkoXo5SSVv
         kcdOe3xtpOT6dSwc89WX6TmXuAzV8dYinWJFn/arDmbLH8Aal5VDTkKBYJbQSu37AqY4
         BchbzJ+SjnFewaLCRli3786GChr6PauqMQmV107pLy1b55t6420vlR0N1sTVJjARrxl7
         rk0+Ure+bDXqnsmEIV7QiKGLqvQ1cph9Wb72ddeqAsSwr+u3z5kKyziT+SDsOMNBVo0x
         oipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920467; x=1772525267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ob3Py8e79uNOSOSdNosFw/qJ6k5/SSX4TduJtiw8gI=;
        b=t3U75XPIDcsf000i1MnyG7kSVwgRS5fpu2NgRwLUm5Ln/IsnHwMbZXID8bQaeBO8kB
         8erwv5j3PaAd4bBmaWVBcI6iovEtR5xXkuwbb2J5A2RgAxybrt9xluweIwoQZ+h02aPe
         OstFAVHxV/cYe48ZjY6EAT9sc2a2/KmIOmF4va7DYLP0QCyUQZa/WedFsa9aV83H6R3B
         aXs9c2j40Jjp8iNXoH7oZmq4rMjgRbqxERXRKKMEKsdWN7vL/iWnCGVoGoi+T46epfRV
         S9DiiWnT1mm3ZhRYxruP7/g1Lr+1SuB0OByf0+6ggRJ93vWJq78tL0RcS8HUHrkDn2j/
         JOaw==
X-Forwarded-Encrypted: i=1; AJvYcCUM5UdlbD9gFDuXW7TCvJYzxYtX2dI1jeeS8qD/CXbvEiItW+BiRX1GRD9YUQj6EkZPhVEUcDFmGfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYFaSGRpdkhQ8BMCTbUMHby+Xw0FT824+gCa5XbHNbi4e76PiD
	X+hzYd/bR9BsbhyC0juGiycpkNBajMz7M8Uh2TW6ePrlEDaDx43j+QepeRfoeh9bmg==
X-Gm-Gg: AZuq6aKjH2OilcCOSffcu8I9DLPs0pJ0f1WAh1AVWbRR7RkixmId13Dsea0Z2fXligg
	QHKdYjj3JwQfnEIKDNEGxl22ehO+8UngZF9AmWqGEhB5izSVsddNc81WWi33uRQetswWTfdbzL6
	EMSONBoSrVUDL8qkoUwINkpOshc68tnW/iGGZRZULitq1/lcFEN5rPSG0Bd+RSxctucWZvY7Eb4
	SnrrVB6FSQoY/0y5xYRN5lhbqqzqz+sNIWqa/K23tzYbYQKAz3GLNEh3yeHZPrLzfCbwJOJUiFV
	ckTQiArt7v10fFZYQYqn6LvEwnyFL+il+szisdMR47cNVuCyMhg3v3AweETHA7EP6tpCruoG5tD
	lnJAS70WMPZ7vX65C3TjrtppRYaF7hTQsN+6rYf/5g8KKISNBgHbtyNtlhuyeeWYd+54lG9Uk9h
	VHdvYcArEObXZq9oAFRR3+cNddwqe71g/jJPyDpXIhCHvmsg9L553PGVGIdeRdsyEwtnlhJZhLD
	26V0GTmN/Fy04o=
X-Received: by 2002:a05:600c:8a16:10b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-483a9d95306mr118957765e9.3.1771920467363;
        Tue, 24 Feb 2026 00:07:47 -0800 (PST)
Message-ID: <bf8d5b4f-937a-4d6f-86ba-1ab07f53eb51@suse.com>
Date: Tue, 24 Feb 2026 09:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.995];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 537311836CE
X-Rspamd-Action: no action

On 20.02.2026 17:18, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -2,9 +2,39 @@
>  
>  #include <xen/init.h>
>  #include <xen/mm.h>
> +#include <xen/sections.h>
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +
> +struct csr_masks {
> +    register_t hedeleg;
> +    register_t henvcfg;
> +    register_t hideleg;
> +    register_t hstateen0;
> +};
> +
> +static struct csr_masks __ro_after_init csr_masks;
> +
> +void __init init_csr_masks(void)
> +{
> +#define INIT_CSR_MASK(csr, field) do { \
> +    register_t old; \
> +    old = csr_read(CSR_##csr); \

Can't this be the initializer of the variable? Can't ...

> +    csr_set(CSR_##csr, ULONG_MAX); \

... csr_swap() be used here, too?

> +    csr_masks.field = csr_swap(CSR_##csr, old); \
> +} while (0)

This whole macro body would also better be indented by one level, to not leave
in particular this closing brace as a misleading one.

Happy to make adjustments while committing, provided you agree. With the
adjustments (or clarification why any of them shouldn't be done):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

