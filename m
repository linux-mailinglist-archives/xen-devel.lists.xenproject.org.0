Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LG/OPz2r2mmdwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:48:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C6249A71
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249978.1547387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzudD-0007D2-BJ; Tue, 10 Mar 2026 10:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249978.1547387; Tue, 10 Mar 2026 10:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzudD-0007BB-8Y; Tue, 10 Mar 2026 10:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1249978;
 Tue, 10 Mar 2026 10:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzudC-0007B5-L4
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 10:48:06 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d99aa20-1c6e-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 11:48:04 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439c4a93841so4842212f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 03:48:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadb29fdsm34852930f8f.16.2026.03.10.03.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 03:48:03 -0700 (PDT)
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
X-Inumbo-ID: 9d99aa20-1c6e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773139683; x=1773744483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OU0Gcrr3SCErOq/JAQhv2N/NVZPEAl9WbVDQK1P+2t8=;
        b=bff/Zt1EChfkqtR7LiGd6fqk3oq+Y0jwRkQ8wkbLqYbUZ/2SKiEhdODFvyJQ4G77xw
         8fV1eevgBWmGsaTuDQSAiA6Djp6xFja5DML/Q5ShaN2hqsWjFfu/dN8SOknBL3QHWC/V
         vodnOHl7+7YsP1+MLZFHA/CpzEwjuHD8AVfO/PLqb3B0/Bgdltlq6OrMky32vRsmreHc
         at1VmbLDIJdxvMSrBYt6IEK5h2FLP7Pi8dPgtDX3Q+AKKiFLnZ1QGoybap98gVyxEKt/
         HH/7jvTs32/Dkhd8UNsBFAfjqgffGBthbce6pUIpxUlqOLpif1Z71zF49B+6DDq83wAL
         T+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139683; x=1773744483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU0Gcrr3SCErOq/JAQhv2N/NVZPEAl9WbVDQK1P+2t8=;
        b=eJjKgBs8j6/lU08EuYhyLnVthreQCIPc0CkbDqDih5FrWq3VphcslqlVPqHd1emLqU
         11MQiIr2Gu2i9qXneeA1pEXoP9STNCM9n5l6i8e/wccxD/F8AJ1wxqZsh+SEFCLvwsV0
         Pgk1gdX3KXIqnMzlkNiPYNSuMN++97AMgyjoQRPELSdaKMnV5PpMLnLivRQGbqE1fQZi
         ptpCWbg9Ek5uvU/nKtKQejjsK+JO/Uw4CneTzeaYHqAeOlYsTYJMm8R2CViIok96bhz9
         4PI9QBCEi88c1dm4vM8JaYfby7I6X+OQ7xcE5sVi2Q504mhvCQFemM7sR5sA2p4kPdD6
         9L3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4/818VRWOVmwzoeBngDp3Qzg18pA+KHTFe00Ikp6QJMDygz0zto1Pa2ySHW2V91wdlj/u35iGYR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy928sCo3uREMy+d/1vCMW8dqdpcaoacKXIzw1goWNI1I7v102w
	GJNPTa1s05cyW0VMNBbViWOmMOoaQWIxphfHysBa0XxyGij+VUbu2Pm/olCjqKL5Pg==
X-Gm-Gg: ATEYQzxoFzfDpvToT1Ntq7pdbyJCIfRjFjX9Y0HcyU4AbdMNqQl0e/TNm/+9UezAXGO
	4BTWrQLZMdAxlGDs1zzBHPahAAFzhWXJwsVGOHo7v8mRwJNK1P3pIGSuo66r+OmkidaBIn0j807
	VgPQiYI7E+zgcS5zxtRolM8xC3fo+bhEBPIBeHSmTH+opiPhz2mtLoeGa9sW3d45zmvz5Xw4M6O
	OXAhdW3RtCUbHrH+fa7Hmg20NoEdB67K0W8j/0i8v75EuzRj7qNS6AXRncAHnNIKZpQCBdtkLzD
	QyLvUzE+XETHbtATlJHVP0u1Ga3kWGRdUUbhtlyEyeVC4WEaks+bOt0ONL3HEaVuLxyeO/lWxR1
	NYTwHo8y/JB0b93QrJY7k+KZTcmJEsAsPtfvEgHYRqvGTWpITbZ8Wj/B/F5RW31JXwkI6kHGIa4
	XlsEg7krpGZKd9Ew0NmNcNzDXd8opbka/YKnyXt+z6QWnV7UDPSzf+5dV5wJKOqDTaOM+uT/ta0
	aQt9rja8u+76U1ANoQPxbWmOA==
X-Received: by 2002:a5d:5c84:0:b0:439:b3ff:9ab9 with SMTP id ffacd0b85a97d-439da67c418mr26178050f8f.48.1773139683511;
        Tue, 10 Mar 2026 03:48:03 -0700 (PDT)
Message-ID: <f72434b1-7387-4611-869b-95e8df5242c6@suse.com>
Date: Tue, 10 Mar 2026 11:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86: Remove x86 prefixed names from x86/cpu/ files
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-5-kevin.lampis@citrix.com>
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
In-Reply-To: <20260304195350.837593-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 566C6249A71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,current_cpu_data.family:url,boot_cpu_data.family:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 20:53, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Inside core2_vpmu_init() there is a check for family == 6.
> Should this be extended to family 18/19?

Likely, but again in a separate change.

> --- a/xen/arch/x86/cpu/mtrr/generic.c
> +++ b/xen/arch/x86/cpu/mtrr/generic.c
> @@ -218,9 +218,9 @@ static void __init print_mtrr_state(const char *level)
>  			printk("%s  %u disabled\n", level, i);
>  	}
>  
> -	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
> -	     boot_cpu_data.x86 >= 0xf) ||
> -	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
> +	if ((boot_cpu_data.vendor == X86_VENDOR_AMD &&
> +	     boot_cpu_data.family >= 0xf) ||
> +	     boot_cpu_data.vendor == X86_VENDOR_HYGON) {
>  		uint64_t syscfg, tom2;

Just to mention (not insisting on a change), the >= 0xf could be dropped,
as older CPUs aren't 64-bit capable.

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -398,7 +398,7 @@ int vpmu_load(struct vcpu *v, bool from_guest)
>  static int vpmu_arch_initialise(struct vcpu *v)
>  {
>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> -    uint8_t vendor = current_cpu_data.x86_vendor;
> +    uint8_t vendor = current_cpu_data.vendor;

Imo we should take the opportunity to change this variable to unsigned int.

> @@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
>  
>  static int __init cf_check vpmu_init(void)
>  {
> -    int vendor = current_cpu_data.x86_vendor;
> +    int vendor = current_cpu_data.vendor;

Perhaps this one as well then.

> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -917,7 +917,9 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
>          return ERR_PTR(-EINVAL);
>      }
>  
> -    if ( current_cpu_data.x86 != 6 )
> +    /* XXX Does this need to be changed to include family 18/19?
> +     * Is the core2_ function name misleading? */
> +    if ( current_cpu_data.family != 6 )
>      {

As indicated before, such comments better wouldn't be added here, imo. With it
dropped and preferably with the type adjustments above (happy to carry out
while committing, as long as you agree):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

