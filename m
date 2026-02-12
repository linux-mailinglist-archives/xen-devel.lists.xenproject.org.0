Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IlDDWK0jWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:07:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0912CDA9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228750.1534879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUXJ-0007l6-2j; Thu, 12 Feb 2026 11:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228750.1534879; Thu, 12 Feb 2026 11:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUXI-0007jf-VM; Thu, 12 Feb 2026 11:07:04 +0000
Received: by outflank-mailman (input) for mailman id 1228750;
 Thu, 12 Feb 2026 11:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqUXH-0007iP-SD
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:07:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4d86285-0802-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 12:07:01 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4834826e555so41035215e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 03:07:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d930902sm163406635e9.15.2026.02.12.03.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 03:07:00 -0800 (PST)
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
X-Inumbo-ID: f4d86285-0802-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770894421; x=1771499221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FDo8r25CrlKnFiqlK3BapE7vDtmMPvTDiE/pA/GmLCs=;
        b=dFJ0VltYsXwYHrFq5f8o3dZBtdpbZXOjVFKelx6vBFese7/bUIH6k1Viv+hemo3kW0
         Zoueg32YhwZ/YZhh9/+u6bE3dsqw4s63rNw3gCEGOBbde3XHG2UP7ROLyMiA16r3/Q3u
         H+uq710fjrcJHDzv99JJ2OolvFyMl4EKFfHqRVpJiXLQJpml/am1JBCgR7g5Riz7idv6
         dd8dcJ0PFoC1ee20fEbVsdTez3QUsbTuP9dQkwZlRVXaLQZ1Q7DjLFKqcQ8zTuCPRU8J
         qby18Mu7zsH4hF3DdfY/zdzPTbR7+LE0V+vAo0JavJAuHY1a82bGKzUo+bQRqrsPo1YK
         DFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894421; x=1771499221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDo8r25CrlKnFiqlK3BapE7vDtmMPvTDiE/pA/GmLCs=;
        b=JD05DINRpj7Ev/7pHPgeuufna/nnGDGZLcnNWasnGw+G4KxCb/DbF39vtHISxB36/f
         iNt9KtgYJlNb0jeypSbkbOLNqNMIzYc/sTO7ld+COs+rRagq+a3K7zaURI9NtMBBmLJo
         J6JgsH34DT9U2wbfi4VntIUOeB9eum5weYbSOcX20AK7CjU6VT5I5skIgmpR49yG+82U
         bvFcZuqh3+DWEAVnOrFHHYPKdfk+ToXwp5ESBaZrc691nYbk97AxN0QquGpPwhmaFOq4
         rmXpoV82unBGD1pMlfBSnStnFgr7ITj8eAzGSyogdPPgBZ1gAYHITlFur00nfWC1nyLk
         Ed5w==
X-Forwarded-Encrypted: i=1; AJvYcCWV+cukP4nD1+rOp2LfEbZk7CIPeSKBfN18gwahfLAjOrgCUL1LwePP8k5/bXufBHBtBL0bSlcmpH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFF36M8kpLksjlI3ThkrhkLJL8HoPNoyD+dYZhDAkO0WCfhzxY
	2gLxLjVzzGo5H3CAU4mFlV+hAWNtcbVh765bn/ey/jaFiCSCZItId7Cb1I38LxKpag==
X-Gm-Gg: AZuq6aJwTMYeuYe/0MA9yhWhndG26wgIBwsetEWSYBKCpMMpqhbphfgHUbAa/h+zjq+
	As/8mqGhr9f2ctN5ZeTwloDC3tkU1qDf66GNnj1I8hsqfj40VEpJku6+yZ1ZYWFpKC6hQou+/kF
	RFzjtYfV7cLOS0wz8/JsxYZlrtz8muLGXf2Z2NZ0SoeYQdcr/EV+MvE0sOllly71Hsh0tykwbe6
	OU8QCtCKnUO5/u/pnlVt1p4Dk3Zf/7Mfu2BzHD+mSrLp3P2eCNJcT2yuXUg42ULes7v2JQFE5s7
	E2vJ6Ewy65QF1x66GkqecwiRZh1OUYgnMpeG1k+yLA6K4mKSrS5MKYY+urSLgvxN0ku2H6yBtwG
	JP/WDOFXeWpNO+pQXfppMk1Qleo+mZRt4q3eH0gjUlSo265voqBAeCURYtjRlgXKSS3c3tvqE9d
	FAf3eF0aW03RihUuLRPH7eKWJJuYPKvvyFB/pAWAxn+a9NIAqFEX5bp5l5nCGavYhgzM6BTmhyl
	qVSmtXny4I0t8g=
X-Received: by 2002:a05:600c:4751:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-483656c7d98mr32971135e9.15.1770894421078;
        Thu, 12 Feb 2026 03:07:01 -0800 (PST)
Message-ID: <dea3752f-1926-4fb4-b0df-305ebbea4aa2@suse.com>
Date: Thu, 12 Feb 2026 12:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] x86: Migrate switch vendor checks to cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-7-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-7-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 96C0912CDA9
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -133,7 +133,7 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>          ret = -ENOENT;
>  
> -        switch ( boot_cpu_data.x86_vendor )
> +        switch( cpu_vendor() )

Nit: Please avoid screwing up style.

> @@ -141,12 +141,10 @@ static int __init cf_check cpufreq_driver_init(void)
>                  switch ( cpufreq_xen_opts[i] )
>                  {
>                  case CPUFREQ_xen:
> -                    ret = IS_ENABLED(CONFIG_INTEL) ?
> -                          acpi_cpufreq_register() : -ENODEV;
> +                    ret = acpi_cpufreq_register();
>                      break;
>                  case CPUFREQ_hwp:
> -                    ret = IS_ENABLED(CONFIG_INTEL) ?
> -                          hwp_register_driver() : -ENODEV;
> +                    ret = hwp_register_driver();
>                      break;
>                  case CPUFREQ_none:
>                      ret = 0;

This of course is a neat (side) effect.

> @@ -165,7 +163,6 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>          case X86_VENDOR_AMD:
>          case X86_VENDOR_HYGON:
> -#ifdef CONFIG_AMD
>              for ( i = 0; i < cpufreq_xen_cnt; i++ )
>              {
>                  switch ( cpufreq_xen_opts[i] )
> @@ -191,9 +188,6 @@ static int __init cf_check cpufreq_driver_init(void)
>                  if ( !ret || ret == -EBUSY )
>                      break;
>              }
> -#else
> -            ret = -ENODEV;
> -#endif /* CONFIG_AMD */
>              break;
>  
>          default:

There's a change to the function's return value, though: When reaching default:,
-ENOENT will result, when previously -ENODEV would have been returned for
compiled-out cases. It may well be that there is a dependency somewhere on the
particular return value - did you thoroughly check that?

Of course this may well apply elsewhere as well; I did not go through and check
every of the switch()es you alter.

> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -137,7 +137,7 @@ void x86_mcinfo_dump(struct mc_info *mi);
>  
>  static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
>  {
> -    switch (boot_cpu_data.x86_vendor) {
> +    switch (cpu_vendor()) {

Would be nice if style was updated while touching such.

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
>  
>  static int __init cf_check vpmu_init(void)
>  {
> -    int vendor = current_cpu_data.x86_vendor;
> +    int vendor = cpu_vendor();

It is only seeing the plain int here that I notice that cpu_vendor() returns
uint8_t. I don't think that's necessary, and hence as per ./CODING_STYLE it
should rather be unsigned int. Which is then waht would want using here as
well.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -319,7 +319,7 @@ void domain_cpu_policy_changed(struct domain *d)
>              if ( cpu_has_htt )
>                  edx |= cpufeat_mask(X86_FEATURE_HTT);
>  
> -            switch ( boot_cpu_data.x86_vendor )
> +            switch( cpu_vendor() )
>              {
>              case X86_VENDOR_INTEL:
>                  /*
> @@ -427,7 +427,7 @@ void domain_cpu_policy_changed(struct domain *d)
>              if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>                  edx &= ~CPUID_COMMON_1D_FEATURES;
>  
> -            switch ( boot_cpu_data.x86_vendor )
> +            switch( cpu_vendor() )
As they recur, I wonder where these bogus style adjustments are coming from.
It's not like ...

> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -63,7 +63,7 @@ void asmlinkage __init early_hypercall_setup(void)
>                    x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));
>      }
>  
> -    switch ( boot_cpu_data.x86_vendor )
> +    switch ( cpu_vendor() )

... you would have used a bad sed pattern globally, as here style remains
intact. Further down it breaks again.

Jan

