Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFAFB0776E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045236.1415346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2cu-00075N-Qw; Wed, 16 Jul 2025 13:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045236.1415346; Wed, 16 Jul 2025 13:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2cu-00072D-Mz; Wed, 16 Jul 2025 13:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1045236;
 Wed, 16 Jul 2025 13:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc2ct-000727-Pm
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:56:51 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c3f308-624c-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 15:56:50 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso4473204f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:56:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4346b70sm128262375ad.195.2025.07.16.06.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 06:56:49 -0700 (PDT)
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
X-Inumbo-ID: b8c3f308-624c-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752674210; x=1753279010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2hAdu/wq4uFfl4jnUk8biIe/WaWjGvHH93yTmeJzp7Q=;
        b=MnLDTKkdDUlN9ZPOrG3j1WpcuBrIaXmtZmzAtarxmR2xZfuGhQDNd44K/qqlakofZ/
         aszq5o4PtLJta17OJB3XkIvHbzcD5/EaOaOyalYpe5PaL1NPuQQE3j+gCPyFZ+v3C1N4
         ax46C5KsW8jdHRhC6O3DghqHwhX6XpqOTx0kZr/doyNYfosEzEWYtLpPP5AACJbJnNjH
         xKZbvKramSF3Wrp7Z9WwoV1NsHC8CC7cNO7/wIBQe7FD1W6xXvOg5PKLBbwDS3JyuiU7
         gwG1cJN78yErXqNWFbxLywrNUcIUNVaRSksuvQFQuJZJaC0YdpZ0K5BpQ2SLrjmHKRtq
         MYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752674210; x=1753279010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hAdu/wq4uFfl4jnUk8biIe/WaWjGvHH93yTmeJzp7Q=;
        b=sC1lCTdH8QtettQ4OSSD6g4CtP+OKmTwByyXT1FgpftHLXV0tcMGzpUbYUd1tEds6z
         kVUxrSvAsYTbCimvOGNf++GievyX4p5GN0P/EZO2JGtaJua4YvP+Kt6Nl31gsks5ERHH
         1XmB3cfkTO3ISJPfxb6DtuZuZSKYvId1i/qFL5WltXYh2Uz6bWWnbtikn3nEJB6fULDP
         MhDk4blsltL+E4abImghpT9Ra9nEUanPYHv5jkVHbFHfzFO/KPE9lcKDtlX6ovc90bPh
         ezLdG1WA/IMzjwBMR+Sn9F5nEBM3kNqvKTySS73qYJX36KV7gNHs2IqXU/eRTtYXwteH
         YEUw==
X-Forwarded-Encrypted: i=1; AJvYcCWzOZ4IWxskEzK3it5GOKzOAsuiyn/8TWb+rNGsMuSwmxqi4Lvx5hotYbt8E977YESZHDeruOpzHI0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqeebA/PhG/TDiq0vP6Ii06WcEPXptTm6kynDUGLRmih9F/AtZ
	up28+WltRdWGvxUqe00Ir0U8DxObd0P863Tv3AIxyGPH/Atq6wI4o2nrhPXu3uOBzg==
X-Gm-Gg: ASbGncsSZN63ZA6m8gBpk9ctUgDoRNzI710jA5I18+cGBitwBK3AQuaQcPAVNMOxr8X
	1WIRtOOmukMoKO50DIh438STmDvQOLrrXIEfdsKzBAsdi5rHonXL9rXsdf2ZhMPA4rML6vKipRC
	6D9ZhzMaHvP7n7e5/vcgAUoqiPj/+yIZyfxEDsip5DtqqlxRiuq7/xeS/PlWrPrGHbkEoR6m25i
	eRiHHMUN1AJuc/it3wHT6hDe69OwkTfylUBS5e5ttU6yiK3COpNHMF2LN5d/UIQcBgqQF4V5N10
	JsJGkyKQ+Pd5CN9CrHMCyNJSy5z1dmOosHVbAsve5tuh5nTA6Yxg5rGfPxpavV+Xkeo5XrXvi9n
	K5ZPznD34ntOxt+I7skpyIWkSH/sS8iG8fNvVKhLqHJ9iMEH8kSgABFJHEsMHRyQ9p3KQHsX14p
	MxnCzYdG8+i3gTC0ezHg==
X-Google-Smtp-Source: AGHT+IFGVfMMXvMVzlK+nHnZ23mCwbqKYthevGvxkP7bY+IXSjoF5uwNOsCVxUXqUh8AWDVHLUmeoA==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3b60e51ca38mr2462773f8f.33.1752674209932;
        Wed, 16 Jul 2025 06:56:49 -0700 (PDT)
Message-ID: <f8808232-dc06-4ecc-85bb-e05d8f948d00@suse.com>
Date: Wed, 16 Jul 2025 15:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/intel-family: Resync with Linux
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716132843.2086965-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 15:28, Andrew Cooper wrote:
> This snapshot is prior to Linux commit db4001f9cc32 ("x86/cpu/vfm: Delete all
> the *_FAM6_ CPU #defines") at the end of their conversion phase.
> 
> In addition to non-FAM6 infixed names, defines are added for the Pentium Pro,
> ArrowLake U, and reintroduced the PHI defines which were incorrectly deleted
> in the past.
> 
> In cpufeature.h, provide VFM_* macros to transform constants to/from the
> cpuinfo_x86 representation.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I meant to object to deleting PHI at the time, but was too late.  Just because
> Xen has stopped supporting the PHI doesn't mean the model numbers have ceased
> existing.

I don't mind their re-introduction, yet I wonder what value their presence has
when we don't use them anywhere. In the public cpufeatureset.h they serve a
documentation purpose, to have less holes there. This could be view the same
here, yes, but it still seems (yet) less relevant.

> --- a/xen/arch/x86/include/asm/intel-family.h
> +++ b/xen/arch/x86/include/asm/intel-family.h
> @@ -13,8 +13,8 @@
>   *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
>   * where:
>   * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
> - *		is assumed to be "_CORE" (and should be omitted). The other
> - *		value currently in use is _ATOM.
> + *		is assumed to be "_CORE" (and should be omitted). Other values
> + *		currently in use are _ATOM and _XEON_PHI

Nit: You lost the full stop.

> @@ -40,131 +40,223 @@
>   * their own names :-(
>   */
>  
> +#define IFM(_fam, _model)	VFM_MAKE(X86_VENDOR_INTEL, _fam, _model)
> +
>  /* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
>  #define INTEL_FAM6_ANY			X86_MODEL_ANY
> +/* Wildcard match for FAM6 so X86_MATCH_VFM(ANY) works */
> +#define INTEL_ANY			IFM(X86_FAMILY_ANY, X86_MODEL_ANY)
> +
> +#define INTEL_PENTIUM_PRO		IFM(6, 0x01)
>  
>  #define INTEL_FAM6_CORE_YONAH		0x0E
> +#define INTEL_CORE_YONAH		IFM(6, 0x0E)

Here and below I assume it is deliberate that you use a raw number again,
rather than making use of the immediately preceding #define? Perhaps for
the sake of brevity?

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

