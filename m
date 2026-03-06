Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JY/GmCVqmkkUAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 09:50:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2021D586
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 09:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247450.1546064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyQsB-0003Au-PK; Fri, 06 Mar 2026 08:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247450.1546064; Fri, 06 Mar 2026 08:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyQsB-00038r-MD; Fri, 06 Mar 2026 08:49:27 +0000
Received: by outflank-mailman (input) for mailman id 1247450;
 Fri, 06 Mar 2026 08:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vyQsA-00038l-2n
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 08:49:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 602ce972-1939-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 09:49:24 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso83242355e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 00:49:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae0202sm128773545e9.6.2026.03.06.00.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 00:49:23 -0800 (PST)
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
X-Inumbo-ID: 602ce972-1939-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772786964; x=1773391764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U02JrJpD6n7i++ALGsisq3tquoiP2+K1GuxNuju8wx8=;
        b=Lp6kWuRTU+ebKDuNqj43t6RxE3k5iqtA3M7cGMTvx/4uDauwVkq18WaRXNBiOcF+hl
         IROlDVaVjIYEl2anvq+hY7xYS85MZ+hbeFMyh0G1eH2qvqSBuyoZDfWZOC0KcVkNKJY/
         CBdCoQ3A//8wtaAlMzuRxA34YgS3i4w8B6iAYHCT3kcuW+vKpo2MzOzaWIvyKUL4JRld
         9aGFi6dLQT0wY/xibTkHePzNiiNDiPK5yIS1xAKlmuzE+Exm3CUsUOxStb+WzjYdL6Ui
         GeOASneuQpJ39XgmoD1BGHOiiYtSeoJh76QNnm3Jd3/2+Htutg2YayDyc4bvLzU1eECG
         wZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786964; x=1773391764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U02JrJpD6n7i++ALGsisq3tquoiP2+K1GuxNuju8wx8=;
        b=pqyLght4ZWxbLwaeWLsgt2Xd0t0K503kQlnuqEPZJMud8loReSnXZiu/cFF9po68kw
         gx6lOvWJtwjqij7n0D6qrqhcjVj2AgQpwWmItbWZw0qHRi6OshONOhsh/k+QG/kGdwTR
         EOwcO8y6iIi8Sysv9I4MdAMX3s27JMwDrDYJ0ZlQ8Bw2VL47OwQeTaEibJ4uCH+iUkoU
         h3XxSIzN+u5HYsDtZP4+axF6CZAqQhWQBrJKE9iJBv5F5ru/9LtWv/l6rTTcYWtkmg9p
         KsdMwyxdf5FoGKUZYKR5VJ0fYwB7ocNSP+3FQj03wWhjURdApj23GtVCzATzrwBzGjcn
         ODMg==
X-Forwarded-Encrypted: i=1; AJvYcCUeesnuJ8rvADh43rKPhqiDFMC7jvtuIMcG050OfDlWABehM5R0iX9/ZGIAuQyuVtoUzoqaboRa2O0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaoTMt30ZbaqCNcNQrxXtNVEf6s5Ko7IxOxmx95sOE73fzg+pX
	VrmhJyhM6ovhihdJ/tYi8KvZppNpT2IC35xh+rf8OG13yaqZ05Fd7PmKPa1rgY3Y3g==
X-Gm-Gg: ATEYQzxsQgcJhLfYYU9WazAAPKj2tJTjS5RmCvYlYOAz3BX23z+Yewwo8Q5/XZSi9TM
	HnDfELWFnhVg+dhzwB8Dd6HYnhQqDriZ6c88LCZAmuL2Ntj33yAWQVJq+XlKl4X9SGHDWjPJ6gs
	lAikv//G76EPyYH7AaSiLNML+qJuTuwd8+/dYILjzmQtfdHnnEMcX5Bga8vADjC6dhNntvjuM/n
	wshGLSSpBUMqCR/xU/xk9ctY6gHa8wh3GkE8tKMHMeXDLpVb2RI9lmAhxR9p2UmIacNwr0BTJ2/
	1LQaNtm4rZgAATI3F0trgLZI/iS4uK2g39P8nhZYjIIAvfaXBag6HYfO61ZGaNEqchlXN//WA6D
	fUNWJKO5zLaNGc9LW50NgD6pGxVzhO/CR0xh1wz4FjxwFJtxEuA5bvJ5HKk28qyxt0YD+JCKsUB
	rmSJ4x7SZi+XpA6xzENtI9Du3/JyZL5LuZgnpmIBIuYQLBU8mQYU1VOvYafaid8j9lgarAeFhhS
	jaoH6jW3Ghlnt4=
X-Received: by 2002:a05:600c:1e2a:b0:483:c771:10e with SMTP id 5b1f17b1804b1-48526957d6cmr16921425e9.20.1772786963764;
        Fri, 06 Mar 2026 00:49:23 -0800 (PST)
Message-ID: <9e222b10-f63a-4a5a-981c-36c438e3071c@suse.com>
Date: Fri, 6 Mar 2026 09:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0DF2021D586
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 20:57, Ayan Kumar Halder wrote:
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -237,7 +237,15 @@ enum gic_version {
>      GIC_V3,
>  };
>  
> +/*
> + * GICv3 supports up to 16 LRs (4 bits in ICH_VTR_EL2), can use uint16_t
> + * GICv2 supports up to 64 LRs (6 bits in GICH_VTR), requires uint64_t
> + */
> +#ifdef CONFIG_GICV3
> +DECLARE_PER_CPU(uint16_t, lr_mask);
> +#else
>  DECLARE_PER_CPU(uint64_t, lr_mask);
> +#endif

But GICV2 and GICV3 can be enabled at the same time, at which point you'd still
need 64 bits, I suppose.

Jan

