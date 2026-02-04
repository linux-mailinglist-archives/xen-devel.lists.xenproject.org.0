Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPtvAXzsgmnqewMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 07:51:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20DE26E3
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 07:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220046.1528769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnWig-0003QW-Ve; Wed, 04 Feb 2026 06:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220046.1528769; Wed, 04 Feb 2026 06:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnWig-0003Nx-SJ; Wed, 04 Feb 2026 06:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1220046;
 Wed, 04 Feb 2026 06:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnWif-0003Nr-Uf
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 06:50:33 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc795085-0195-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 07:50:31 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806f80cac9so35430485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 22:50:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310859101sm19825735e9.8.2026.02.03.22.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 22:50:30 -0800 (PST)
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
X-Inumbo-ID: cc795085-0195-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770187831; x=1770792631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TCeKq1nEU8lvHTb7ifcHIk6Jg/vgURV8VPxvCoBXauk=;
        b=JKFvsPEiR+ZUC8lNdlLqF5Wf3iWrAJBzM5CBfUIPDzbciOIKyyI03RxkvS5be4LLzR
         21DfUXaUzslzi9j6eVwxA24gJUQjRaWslw2SXMBOdQrKuL0R0ComS3Sq0JzGlJv1iaOS
         XEyGZ82+bHY3QhWkwcJ64lAEDq3GtnKUFVzwKLkzE/lrgAWLdLnHGwXHphrlyGEPnHPO
         8+KMxQVDy60epafL2SCM7IMlPDc6gHC12sTLHuN1szRihqvhxSIA8qnPALV/MqNEPGIZ
         dsLIG8ujdaLd13P6gYOnIrZBTGNhna5C0INhSPBG2iOpVftwE09ulb5sH9EIobSyG5Nt
         hktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187831; x=1770792631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCeKq1nEU8lvHTb7ifcHIk6Jg/vgURV8VPxvCoBXauk=;
        b=TvMNWCrCDH4BDGkLr86TxIaAUkAHoFw8ER+iiRToJMZ6C8W3dRLDXVzMLe6SNo06E9
         LPf7iM8mjqHh2AY8plgX8073lfX/n5RUFsrMDAG9NfvEBvFF8t0EVmf711tCSunRDm5M
         Kd29cfh3J9ylPUKEay4dk4rfSR71XCHLHCzeNjt52DsqxIWj79AznbKMac9JbNZuu0vm
         kLSp8/sWjQ2uW1e+ncJftrPT0b2g7lfvOAx5MEOyUbsFA/sqPBTfBZrmwUMDiV+VEK0f
         iQ3pmnoL/jywM0/ttSQeZBczIxSADrFbS8ywgehBIMVAaLj5QOk/6eplQYII3gOhUZmP
         Canw==
X-Forwarded-Encrypted: i=1; AJvYcCWY7v8kCu/6j2d+iC5cZo0hRLRWdtn88GcPvIuI4D/qPcjE0Er6C9uV0TMy8/prSywUzzX2EIv002k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMU0NKMnhBNABDmqmBH76ceZx4Q+gw1WlyZy+xHhKpjS9QJvj1
	S2fLhvm48dikcBcZFiulE2LHX0zx4PADCpEt2q4FvZWwyFHAl5cDPkuosO1D1jGv3w==
X-Gm-Gg: AZuq6aKhZE6i2JOfXq4OyKbYsCSCkcTwNp3tQUREPoNL6OmEGzPJa0hjEK1/RcTUfX7
	GOPmAqPKKPRAi/wRcw4M6AYg60vCaSizKLdFsRNIdnz3ItXBqEtPlkAO0DDYGZVOpzJF1ri4u/o
	LfPMnMOUlUjaUZuN827hhx0Xt1IaW9aMTsBUvKKkM8VmFQf8GmbSGAi/20JwZz9M1xaOhUyutM2
	mnzy8niCKfv4VPoIzwCnnIk+H987g+2Bmfzzq9o/Kr6kSCl8O3JU1C0/77MHQAFBhN6y69YYR3y
	KbtUDoLJVTgtldeW0fS0+yjEXKvBCTKHsd+e4rh25mRggCWIeh5PSeI801QiOtkr9fajrnp0AYt
	Zq9xsHR6RqKPFIP/+ATCBP5IZP98c6MwDnAocq57PaLnqvqYWvmRVx7UfJ8Zl/DIY/fUHrkq24h
	1Ap4igsBNUMlcB3Qd08XXuFz1PzTDpeRXjKx+AEDvWHuFFGkvZUZejjZGqcmBSH/2FMDdvnWAg8
	rA=
X-Received: by 2002:a05:600c:1387:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4830e981f8fmr29600305e9.31.1770187831231;
        Tue, 03 Feb 2026 22:50:31 -0800 (PST)
Message-ID: <a8ab7bd7-3e17-43e2-bbe1-3503b6eda7ac@suse.com>
Date: Wed, 4 Feb 2026 07:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce sbi_set_timer()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5D20DE26E3
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -29,6 +29,10 @@
>  
>  #define SBI_EXT_BASE                    0x10
>  #define SBI_EXT_RFENCE                  0x52464E43
> +#define SBI_EXT_TIME                    0x54494D45
> +
> +/* SBI function IDs for TIME extension */
> +#define SBI_EXT_TIME_SET_TIMER          0x0

Nit: Do you really mean to have the time extension IDs above ...

>  /* SBI function IDs for BASE extension */
>  #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0

... the base extension ones?

> @@ -134,6 +138,20 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>  int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>                                  size_t size, unsigned long vmid);
>  
> +/*
> + * Programs the clock for next event after stime_value time. This function also
> + * clears the pending timer interrupt bit.
> + * If the supervisor wishes to clear the timer interrupt without scheduling the
> + * next timer event, it can either request a timer interrupt infinitely far
> + * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
> + * interrupt by clearing sie.STIE CSR bit.
> + * The stime_value parameter represents absolute time measured in ticks.
> + *
> + * This SBI call returns 0 upon success or an implementation specific negative
> + * error code.
> + */
> +extern int (*sbi_set_timer)(uint64_t stime_value);

__read_mostly or even __ro_after_init?

> @@ -326,6 +358,14 @@ int __init sbi_init(void)
>              sbi_rfence = sbi_rfence_v02;
>              printk("SBI v0.2 RFENCE extension detected\n");
>          }
> +
> +        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
> +        {
> +            sbi_set_timer = sbi_set_timer_v02;
> +            printk("SBI v0.2 TIME extension detected\n");

Is this really relevant to log especially in release builds? IOW can this at
least be downgraded to dprintk()?

Jan

