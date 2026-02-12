Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANQWLvTSjWmJ7gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 14:17:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6012DC05
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 14:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228947.1535033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqWZL-0003zw-GV; Thu, 12 Feb 2026 13:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228947.1535033; Thu, 12 Feb 2026 13:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqWZL-0003yV-DA; Thu, 12 Feb 2026 13:17:19 +0000
Received: by outflank-mailman (input) for mailman id 1228947;
 Thu, 12 Feb 2026 13:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqWZK-0003yP-Qo
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 13:17:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26afc2d1-0815-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 14:17:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso1958295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 05:17:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm160534295e9.0.2026.02.12.05.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 05:17:15 -0800 (PST)
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
X-Inumbo-ID: 26afc2d1-0815-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770902236; x=1771507036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4OEoz62PZzisdY26JBIeslB/E2Uqz1a3eDC/xKQQ4t4=;
        b=EnWv9NdGDR67kbn/CI6/ILeXbGlQE079n8QQgHHiZGCSmqy4fZcdut05uOXzvwDmsh
         0k+jbtjvVOlwzJRfuKIhMxA/2TS8wLvcb7TAaH0zzpKSdo4GXr2SlkQ6AlUx6VZ7CivV
         QskXPqTkAA3Uq9UxgcKL8tf433he6A3evDuoYrPV38B4mNkbkjvw9eV6mlGpMiSPZbs9
         BlK+jCVH9NTZYdQluWznOR9aTZeGJ15Cqd0P715tjIPilQAaTmyeNpniT6eJaCl2UWdY
         78Yrz2wC5MwNVo560kz9kdQzNMNNYnu5WvFig3EYQLDHGPcuHAGMRL64+mKlo747RmQ2
         BGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770902236; x=1771507036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OEoz62PZzisdY26JBIeslB/E2Uqz1a3eDC/xKQQ4t4=;
        b=SilCsjre1TtZxK5Mimb5qtxo5sN7/tYYGALK/tJxpFR2NJzb0WmKo8tBmpxyrwKiMl
         FIE+udjJS4w3skZXKAG/pgPvY+Mh1EyHk7A+7znCvweIQFh8/+KV//30MazZcQ5mXxCW
         4XztO9FDs+N91qBoFUJAR8Av0uU0tyB9HHvrmGr+LnYufpYAIeldVoNwTcIFjr061Lx7
         WLMyzC6DSBvwBCGOE8N5D1CkDGEAUwx7YcgqogTrwTGXiyJ3m9ieePbKcNJrV3FmZppU
         Z5oKfIM9UVBmXVoEVip2SzoBwA3Xxe1YYU/jMxQ0ez80Z59KGqb5oyyN/y88QHJ4sj5e
         F/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoOpz40AZjN8LUBZKSLU+aK2LLNdvtxgfg76XcIlr/rS526ObI00Jhxyb4oRcv76AvPCU3ZHF4Rno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjWo/X/y5p9yLpTp+UBEiwdnW0D616x6G5bfpMi6azve3a2W+0
	+zxADDhx/96FZaeh8xxgxKhYdkH3n1xgsLxNJQYWfM5S8fKwo0YUWhwnsWoLJvJODA==
X-Gm-Gg: AZuq6aIolMg03YkeL4bQ3d7oLawfoZRYCePSJpvFSF1Js5njPeCwTV1PQaSb2QN6LBQ
	wDyNTBcnLrLya1evhKlM88MlVdKCJmXE/LgzKZEqkeKyOntViriGLq1lI7qPg8u7JlHAvqzlKGm
	8VJoRDUUHrcPB3bmeHRhV1UqpAzNkeLbvRrVWyD/qKpZ9tujVc4wX4COwb5I9Ea57FGG+oPbYSi
	pAy0bh7A7pKaHHeRNF02BaRlhJxI8JkrxBUzfAS9VhD9qzeo3zw+XWEq35jsDuiLK07zy2stw4Y
	QRKThFJCouFRMeRI/nikucUTNkX4tWo3/XCjudMdfLqauabEVH6ihKuAtUdALZ097JEOIqdocJ0
	lrxKWl8PbsKiGqEtZGIHYeFuKyxdZ0FfKPo8z/EWSmxH8M1jn41nI7nqoiZpXlz4ANSPw8DVan5
	aYr0vmlU9eoOZoD2K3Hesl/Cxyb5a5PquVuwSHjtbEzDrhKNufrfqtWnNay6RC2JcrQsIVZzYCR
	SvUDkhtBPun/KI=
X-Received: by 2002:a05:600c:2e4a:b0:483:fbe:23dd with SMTP id 5b1f17b1804b1-48366021eb9mr26796265e9.12.1770902235551;
        Thu, 12 Feb 2026 05:17:15 -0800 (PST)
Message-ID: <2401ecf5-132b-41ac-b288-68c31db8c906@suse.com>
Date: Thu, 12 Feb 2026 14:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] x86/cpu: Migrate vendor checks to use cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-13-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-13-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 28A6012DC05
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/intel_cacheinfo.c
> +++ b/xen/arch/x86/cpu/intel_cacheinfo.c
> @@ -168,9 +168,8 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
>  	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cpuid2 for
>  	 * trace cache
>  	 */
> -	if ((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1 &&
> -	    c->x86_vendor != X86_VENDOR_SHANGHAI)
> -	{
> +	if (((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1) &&
> +	    (!(cpu_vendor() & X86_VENDOR_SHANGHAI))) {

Nit: Again, no need for the extra parentheses (here: around the !()). Nor do
I see a need to alter the first line at all.

> --- a/xen/arch/x86/cpu/mtrr/generic.c
> +++ b/xen/arch/x86/cpu/mtrr/generic.c
> @@ -218,9 +218,8 @@ static void __init print_mtrr_state(const char *level)
>  			printk("%s  %u disabled\n", level, i);
>  	}
>  
> -	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
> -	     boot_cpu_data.x86 >= 0xf) ||
> -	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
> +	if (((cpu_vendor() & X86_VENDOR_AMD) && boot_cpu_data.x86 >= 0xf) ||
> +	    (cpu_vendor() & X86_VENDOR_HYGON)) {

Perhaps easier as

	if ((cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
	    boot_cpu_data.x86 >= 0xf) {

, seeing that there's no Hygon hardware lower than Fam18?

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -398,7 +398,6 @@ int vpmu_load(struct vcpu *v, bool from_guest)
>  static int vpmu_arch_initialise(struct vcpu *v)
>  {
>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> -    uint8_t vendor = current_cpu_data.x86_vendor;
>      int ret;
>  
>      BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
> @@ -418,7 +417,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
>          if ( vpmu_mode != XENPMU_MODE_OFF )
>          {
>              printk(XENLOG_G_WARNING "VPMU: Unknown CPU vendor %d. "
> -                   "Disabling VPMU\n", vendor);
> +                   "Disabling VPMU\n", cpu_vendor());

Why would you want to make the log message less useful?

Jan

