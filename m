Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A6C8D85C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:25:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173613.1498636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYFI-00072W-Vz; Thu, 27 Nov 2025 09:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173613.1498636; Thu, 27 Nov 2025 09:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYFI-0006zT-QE; Thu, 27 Nov 2025 09:25:00 +0000
Received: by outflank-mailman (input) for mailman id 1173613;
 Thu, 27 Nov 2025 09:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOYFI-0006zL-7l
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:25:00 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1462620-cb72-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 10:24:58 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso395465f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:24:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1cab9af3sm2360061f8f.41.2025.11.27.01.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:24:57 -0800 (PST)
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
X-Inumbo-ID: f1462620-cb72-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764235498; x=1764840298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GWwETVtIO2Lhi7EfpckxWZ2y5dVcdNLDAC+nGiG0TZo=;
        b=WVI5ausbFfIAFXnvcQgEWfkytXZle0ZIxvIJnuwAhFfj4M+GRZSKbOg/aDtvXEM2lh
         WlxXJ0cWXU4k0MVAfJ9LPcuQh0H/Jf4BL+0GfN8+6XRFkmSI74rTXGp9J2wsxJ+gyqXH
         3zMlyb1OxOLnc9C5nR48AEPnL3ziyumXOlKi8zJmdKEDxT+4lvfJd5Yl0q7Wszg/CIQ8
         Mj7u38NbuP3vNGaxHLnvEvz97bF6D5Gpk65oNsn/TQjF5p3lwEuEKwd2uro6jm0LgENq
         JIrhJviOY9sx6o6sJlAg1Acipa+GzZC2RZterpMWGaL/GwrM8sLws6XlwNG73EYFIDvY
         7Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235498; x=1764840298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWwETVtIO2Lhi7EfpckxWZ2y5dVcdNLDAC+nGiG0TZo=;
        b=P0Vus2KPA/2BBMqwxRNnlIjnPT5Rej6Y3Aj1zskCfa15fIaq+KqQBdYdRvanL1+IZL
         t1nawzq8w72W2pYEj7QWdnTH/3pK7lyXLkiqJdzOJdTgQdrBlmdWzPSGT4Yv+cSiz10D
         WsV7rbBs4fGo+PGqWCrlWcVNwx2p4gwEb/PUUNpT/beA21n/GNknMyXTNET2dCwfEGDE
         Khd7vIte6dgYsV4lKqjhkxDI2A6iUp0+AnL94ii5Na0g1s7BGLtPIM1L7jD0T+/9AMNK
         oS67OP4BoKeqU6jZ1dMVV3fi4DD+oD4Np/gGqzJMEoE6Bsuf2QMpGUEKxs/AX2jWsZfC
         Cj+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXNrTt/lynGuWBDV3u2lzfwjKDcJwiEqtzhW3Ir1da0b3HVn10iLaVQDa069oSwWHaOoJooODZnIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4qglAFnCwx5tk6ZIDi4B2/Aj9sWtsxLSFUnfoFF6NMNBgnxnp
	VpSG1nUcPpwmmTuig5c978Kr1N15oFw16OnkEmx/HifGu8GKiNizA4gS7VnaNq1ezA==
X-Gm-Gg: ASbGncsBC7ypUmlJkk26UTzR4mIwZoH9vRRGjjrUIkhQ53GF46tGgYMqvaaSXkL55pM
	yyFP5lVjpiqKLjiErys2Klt4484ijf/3XnAnh0loCOCqicCeWQhnx0Odc6wEhFeA+2P3dvVEc9D
	blaiENPnclPrEODIaUBn9p7Y9SKJEbr2EN2FUUGU657eIJLVN1hEpaTNnej+TmGZfFDcuvOEH3N
	tLYbFvhyfYJmwereiA8Wx1FXGLxXhiauXF1Ner0i40q5/j6BKBxGvv1AtzjRXdzjdcsM40GpwmQ
	XZemdAc8mQj7eticfIz8c5JYeKXY417Vfg8mwIj74XYiPtfmz+jilAkT/hfUDOQsxLjwZI3A5fP
	reMkEBs8nWfAIfgVKhSgVdO7iXi8FlDbTaqrbOq8m0DdYiUyLJ2Uf/szKBejGFldUBazXT64+cZ
	dfi4oKVPplAztbUPDv3z/cb2y18NXRvO13X1ZuxnbClra4upTxC/LT+nHOZ7bEB6788YCIlFV9p
	vQ=
X-Google-Smtp-Source: AGHT+IHG6gn7Y9um+cGpP5Rt6Aj1xWOEeiz77qEz5meD1DvXAiM1e1ncsyV9pGgKopbf+BJ+DN/FoQ==
X-Received: by 2002:a05:6000:184d:b0:42b:2de5:251e with SMTP id ffacd0b85a97d-42cc1cbe567mr23251443f8f.26.1764235497763;
        Thu, 27 Nov 2025 01:24:57 -0800 (PST)
Message-ID: <04a363ea-1ab0-4028-a2bc-8bfbacafab6e@suse.com>
Date: Thu, 27 Nov 2025 10:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86: Remove x86 prefixed names from cpuinfo for
 intel.c
To: Kevin Lampis <kevin.lampis@citrix.com>, andrew.cooper3@citrix.com
Cc: roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <20251126191945.3386781-1-kevin.lampis@citrix.com>
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
In-Reply-To: <20251126191945.3386781-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 20:19, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Changes in v2:
> - Convert the two switch statements in probe_masking_msrs(),
>   intel_log_freq() and check_memory_type_self_snoop_errata()
> - Requested style changes
> 
> Changes in v3:
> - Re-order the CPU model names in the switch statements
> - Better style changes

As to the latter, ...

> @@ -458,7 +460,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  {
>  	uint64_t val;
>  
> -	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
> +	if ( c->vfm == INTEL_P4_WILLAMETTE && c->stepping == 1 )
> +	{

... this is still introducing a mix of styles (partly Linux, partly Xen). Imo
we want to avoid this.

> @@ -468,8 +471,10 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  		}
>  	}
>  
> -	if (c->x86 == 6 && cpu_has_clflush &&
> -	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
> +	if ( cpu_has_clflush &&
> +	    ( c->vfm == INTEL_CORE2_DUNNINGTON ||
> +	      c->vfm == INTEL_NEHALEM_EX ||
> +	      c->vfm == INTEL_WESTMERE_EX ))
>  		setup_force_cpu_cap(X86_BUG_CLFLUSH_MONITOR);

Same here, plus in neither style there's provision for blanks immediately
inside inner parentheses. Indentation of that opening parenthesis would
also be off by one.

> @@ -657,14 +670,16 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>  	/* Work around errata */
>  	Intel_errata_workarounds(c);
>  
> -	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> -		(c->x86 == 0x6 && c->x86_model >= 0x0e))
> +	if ( ( c->family == 15 && c->model >= 0x03 ) ||
> +	     ( c->family == 6 && c->model >= 0x0e ) )

Again undue mix of styles and undue blanks inside inner parentheses.

> --- a/xen/arch/x86/include/asm/intel-family.h
> +++ b/xen/arch/x86/include/asm/intel-family.h
> @@ -179,6 +179,10 @@
>  #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
>  #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
>  
> +/* Family 15 - NetBurst */
> +#define INTEL_P4_WILLAMETTE		IFM(15, 0x01) /* Also Xeon Foster */
> +#define INTEL_P4_PRESCOTT		IFM(15, 0x03)

Andrew, can you please get in your re-syncing patch, so this part can be
omitted?

With the style adjustments (which I can certainly do while committing if no
other need for a v4 arises):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

