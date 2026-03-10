Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJnEKCXyr2nkdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:27:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452E2495ED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249946.1547312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzuId-0003kx-S7; Tue, 10 Mar 2026 10:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249946.1547312; Tue, 10 Mar 2026 10:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzuId-0003iT-Ob; Tue, 10 Mar 2026 10:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1249946;
 Tue, 10 Mar 2026 10:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzuIc-0003iN-CY
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 10:26:50 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4df623b-1c6b-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 11:26:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-485445e80bdso3817825e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 03:26:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad97abasm31852455f8f.10.2026.03.10.03.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 03:26:46 -0700 (PDT)
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
X-Inumbo-ID: a4df623b-1c6b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773138407; x=1773743207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sXZ/Do0x+4Oc8KRITWR6W9eSNAsHpSr+C2VoN330X78=;
        b=eIcm9j5YuIEo+nWYD+2OgurBX/GFT7mZOsqMY+orZ+5YKzwom7aBHXAng1uU+wdjn9
         DiZIvCis/kj57j686tEteD6dll3eAeujkHcz+aX6zJ7qec30pWBASNLT6sgwbo51KFsI
         2oYpjA31FLVNWqGAcTMIXsZXOFZlT6JSmHtnZP7HqOCSkQjOR3gFNpLAEGO8AMxG/OWr
         oKjY0Hy5RJ7EusoiCpR5zdAoHwE9/Cch6h5OOrHkBw7ZR0r7umZjgU1EK6+JDh9o+DQX
         F8rSudZU6muSbDD+5s5ygXy3KooJtbVGWDymM6X8dx1VAfbvzfZBmhghARUoGQJO5QFH
         l4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138407; x=1773743207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXZ/Do0x+4Oc8KRITWR6W9eSNAsHpSr+C2VoN330X78=;
        b=N5ABbzUsJrlOlEBDCNpQ9IzTR6AtezQDHjFroe3scOQpmOC6G8/7Rlw3E/qrVG/+J2
         995ZqRTbk9eJBaPJXQn1yJTL296hNPm+8bsS4DnUNZPjUFEuf4qDAUTT+/U/M7DY/SMb
         mgjEx367vSbZLkQ4vyYVQw0otS7eTMkANYDQ7zU9u/WRudS4+zx8EyhsZpLy9QyPLriF
         J9UvUVzhg/WC+BfUyXttbkTJ1D61Zs1w/C2Y3sS6VcRWXpy3UlBxs9PnMmVqb6uzSNyk
         mWPnhehG43ec+GjfPgEKuX03DqOqAYwEDRoCzkfSu4yCW1MFqdACP+1iLQCUidmTp9zH
         6Muw==
X-Forwarded-Encrypted: i=1; AJvYcCUsqQA/vZ2/Swoy089yTLKcPidj/D4U3R4hSFNM2qmXRsxBRBUGK1riHixIQI6zslCsO7T+xO1Z+1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1x7Zu5Yo9den8CNZwNiDGWuu8VgIJi3kI0CVEmJiMTTE+Oadp
	+DIXiy+kfBcc/BW69i6JbD20b3yhZJfdSw9PopDbaYvPyLZOy20b6Gn8HQofGL5OsA==
X-Gm-Gg: ATEYQzyOm+WDP2cQgI32Y/1GABUO7ZO3OzOKDRQF+vlJwKyyMk+ZZoziZEuhGdPIRw1
	9ERLEa6dIr+6/Tg+2FU9Or+Mxgi8Rq8f+w+9IWM31s7xm9baANKj5tUvYTTx7YwMRn2Ec1uZrXh
	o4apIBQRpTin0/PvKg/Ep6U+qgeyHm9Girgtg7JnXdhe0tmlCKNlOfFMBfkrVFIpTBWpsmHUWJW
	utmLtLHEvyg785OBShXgUQ0omNJJFWtyK+cG26pXrgH4Hss+HaZA1t+czSLYXbXVtgoZrjeWtuL
	EeARew2kdz6lUF3iP9cSggPYFxUK3r1/zmX0OMTOjM/t6msgkevOHKqFKDhYU5mLVweglk4XgtQ
	RKu06LH3l6CHiiqoKVn6xDzqH3E5CFEMBv/uuipNYkZBUvri40SmhSXnCBDcsPR0TdHE7bmyk4s
	wdWwRUa3YRn204pDaQ+cRqvXc40ik4SLms2YvQdvAzSAsszmGtGqcX+Zn5+/bNFT6Mx4s9CQP8j
	siJmsFTisDHOoA=
X-Received: by 2002:a05:6000:2008:b0:439:d73d:95e with SMTP id ffacd0b85a97d-439da66a476mr25320352f8f.27.1773138407218;
        Tue, 10 Mar 2026 03:26:47 -0700 (PDT)
Message-ID: <4a5018a2-9867-432b-9464-874532241316@suse.com>
Date: Tue, 10 Mar 2026 11:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86: Remove x86 prefixed names from hvm code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-4-kevin.lampis@citrix.com>
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
In-Reply-To: <20260304195350.837593-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0452E2495ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
> I couldn't find any information about these Intel family 6 processors:
>   model 0x5d: /* SoFIA 3G Granite/ES2.1 */
>   model 0x65: /* SoFIA LTE AOSP */
>   model 0x6e: /* Cougar Mountain */
> Should I add them to intel-family.h?

We should keep that in sync with Linux, I think, so "no" unless you mean to
first have respective entries added there.

0x5d is listed in the SDM, so I'd recommend keeping the entries (using IFM()
directly for the time being).

0x65 and 0x6e aren't listed in the SDM, so may never really have hit the
public. Respective cases can perhaps be dropped, but such dropping would
again likely better be done in a separate change.

> @@ -3073,71 +3077,71 @@ static bool __init has_if_pschange_mc(void)
>       * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
>       * this time.
>       */
> -    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
> -         boot_cpu_data.x86 != 6 )
> +    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
> +         boot_cpu_data.family != 6 )
>          return false;
>  
> -    switch ( boot_cpu_data.x86_model )
> +    switch ( boot_cpu_data.vfm )
>      {
>          /*
>           * Core processors since at least Nehalem are vulnerable.
>           */
> -    case 0x1f: /* Auburndale / Havendale */
> -    case 0x1e: /* Nehalem */
> -    case 0x1a: /* Nehalem EP */
> -    case 0x2e: /* Nehalem EX */
> -    case 0x25: /* Westmere */
> -    case 0x2c: /* Westmere EP */
> -    case 0x2f: /* Westmere EX */
> -    case 0x2a: /* SandyBridge */
> -    case 0x2d: /* SandyBridge EP/EX */
> -    case 0x3a: /* IvyBridge */
> -    case 0x3e: /* IvyBridge EP/EX */
> -    case 0x3c: /* Haswell */
> -    case 0x3f: /* Haswell EX/EP */
> -    case 0x45: /* Haswell D */
> -    case 0x46: /* Haswell H */
> -    case 0x3d: /* Broadwell */
> -    case 0x47: /* Broadwell H */
> -    case 0x4f: /* Broadwell EP/EX */
> -    case 0x56: /* Broadwell D */
> -    case 0x4e: /* Skylake M */
> -    case 0x5e: /* Skylake D */
> -    case 0x55: /* Skylake-X / Cascade Lake */
> -    case 0x7d: /* Ice Lake */
> -    case 0x7e: /* Ice Lake */
> -    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
> -    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
> -    case 0xa5: /* Comet Lake H/S */
> -    case 0xa6: /* Comet Lake U */
> +    case INTEL_NEHALEM_G:
> +    case INTEL_NEHALEM:
> +    case INTEL_NEHALEM_EP:
> +    case INTEL_NEHALEM_EX:
> +    case INTEL_WESTMERE:
> +    case INTEL_WESTMERE_EP:
> +    case INTEL_WESTMERE_EX:
> +    case INTEL_SANDYBRIDGE:
> +    case INTEL_SANDYBRIDGE_X:
> +    case INTEL_IVYBRIDGE:
> +    case INTEL_IVYBRIDGE_X:
> +    case INTEL_HASWELL:
> +    case INTEL_HASWELL_X:
> +    case INTEL_HASWELL_L:
> +    case INTEL_HASWELL_G:
> +    case INTEL_BROADWELL:
> +    case INTEL_BROADWELL_G:
> +    case INTEL_BROADWELL_X:
> +    case INTEL_BROADWELL_D:
> +    case INTEL_SKYLAKE_L:
> +    case INTEL_SKYLAKE:
> +    case INTEL_SKYLAKE_X:
> +    case INTEL_ICELAKE:
> +    case INTEL_ICELAKE_L:
> +    case INTEL_KABYLAKE_L:
> +    case INTEL_KABYLAKE:
> +    case INTEL_COMETLAKE:
> +    case INTEL_COMETLAKE_L:
>          return true;
>  
>          /*
>           * Atom processors are not vulnerable.
>           */
> -    case 0x1c: /* Pineview */
> -    case 0x26: /* Lincroft */
> -    case 0x27: /* Penwell */
> -    case 0x35: /* Cloverview */
> -    case 0x36: /* Cedarview */
> -    case 0x37: /* Baytrail / Valleyview (Silvermont) */
> -    case 0x4d: /* Avaton / Rangely (Silvermont) */
> -    case 0x4c: /* Cherrytrail / Brasswell */
> -    case 0x4a: /* Merrifield */
> -    case 0x5a: /* Moorefield */
> -    case 0x5c: /* Goldmont */
> -    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
> -    case 0x65: /* SoFIA LTE AOSP */
> -    case 0x5f: /* Denverton */
> -    case 0x6e: /* Cougar Mountain */
> -    case 0x75: /* Lightning Mountain */
> -    case 0x7a: /* Gemini Lake */
> -    case 0x86: /* Jacobsville */
> +    case INTEL_ATOM_BONNELL:
> +    case INTEL_ATOM_BONNELL_MID:
> +    case INTEL_ATOM_SALTWELL_MID:
> +    case INTEL_ATOM_SALTWELL_TABLET:
> +    case INTEL_ATOM_SALTWELL:
> +    case INTEL_ATOM_SILVERMONT:
> +    case INTEL_ATOM_SILVERMONT_D:
> +    case INTEL_ATOM_AIRMONT:
> +    case INTEL_ATOM_SILVERMONT_MID:
> +    case INTEL_ATOM_SILVERMONT_MID2:

Can the Silvermonts please be grouped together?

> +    case INTEL_ATOM_GOLDMONT:
> +    //case 0x5d: /* SoFIA 3G Granite/ES2.1 */ // XXX ???
> +    //case 0x65: /* SoFIA LTE AOSP */         // XXX ???
> +    case INTEL_ATOM_GOLDMONT_D:
> +    //case 0x6e: /* Cougar Mountain */        // XXX ???
> +    case INTEL_ATOM_AIRMONT_NP:

Same for the Airmonts and ...

> +    case INTEL_ATOM_GOLDMONT_PLUS:

... the Goldmonts.

> @@ -3431,23 +3435,20 @@ static void __init lbr_tsx_fixup_check(void)
>       * fixed up as well.
>       */
>      if ( cpu_has_hle || cpu_has_rtm ||
> -         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
> -         boot_cpu_data.x86 != 6 )
> +         boot_cpu_data.vendor != X86_VENDOR_INTEL ||
> +         boot_cpu_data.family != 6 )
>          return;
>  
> -    switch ( boot_cpu_data.x86_model )
> +    switch ( boot_cpu_data.vfm )
>      {
> -    case 0x3c: /* HSM182, HSD172 - 4th gen Core */
> -    case 0x3f: /* HSE117 - Xeon E5 v3 */
> -    case 0x45: /* HSM182 - 4th gen Core */
> -    case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
> -    case 0x3d: /* BDM127 - 5th gen Core */
> -    case 0x47: /* BDD117 - 5th gen Core (GT3)
> -                  BDW117 - Xeon E3-1200 v4 */
> -    case 0x4f: /* BDF85  - Xeon E5-2600 v4
> -                  BDH75  - Core-i7 for LGA2011-v3 Socket
> -                  BDX88  - Xeon E7-x800 v4 */
> -    case 0x56: /* BDE105 - Xeon D-1500 */
> +    case INTEL_HASWELL:
> +    case INTEL_HASWELL_X:
> +    case INTEL_HASWELL_L:
> +    case INTEL_HASWELL_G:
> +    case INTEL_BROADWELL:
> +    case INTEL_BROADWELL_G:
> +    case INTEL_BROADWELL_X:
> +    case INTEL_BROADWELL_D:
>          break;

I think it would be nice for the errata numbers to not be lost.

> @@ -3476,19 +3477,16 @@ static void __init ler_to_fixup_check(void)
>       * that are not equal to bit[47].  Attempting to context switch this value
>       * may cause a #GP.  Software should sign extend the MSR.
>       */
> -    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
> -         boot_cpu_data.x86 != 6 )
> +    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
> +         boot_cpu_data.family != 6 )
>          return;
>  
> -    switch ( boot_cpu_data.x86_model )
> +    switch ( boot_cpu_data.vfm )
>      {
> -    case 0x3d: /* BDM131 - 5th gen Core */
> -    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
> -                  BDW120 - Xeon E3-1200 v4 */
> -    case 0x4f: /* BDF93  - Xeon E5-2600 v4
> -                  BDH80  - Core-i7 for LGA2011-v3 Socket
> -                  BDX93  - Xeon E7-x800 v4 */
> -    case 0x56: /* BDE??? - Xeon D-1500 */
> +    case INTEL_BROADWELL:
> +    case INTEL_BROADWELL_G:
> +    case INTEL_BROADWELL_X:
> +    case INTEL_BROADWELL_D:
>          ler_to_fixup_needed = true;
>          break;
>      }

Same here then.

Jan

