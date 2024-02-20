Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3E85BC46
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683507.1063062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcPJ7-0007UN-7G; Tue, 20 Feb 2024 12:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683507.1063062; Tue, 20 Feb 2024 12:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcPJ7-0007SM-4M; Tue, 20 Feb 2024 12:33:09 +0000
Received: by outflank-mailman (input) for mailman id 683507;
 Tue, 20 Feb 2024 12:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcPJ5-0007SG-Ad
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:33:07 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 325c5dc6-cfec-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:33:06 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563e330351dso4552623a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 04:33:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i24-20020a170906251800b00a3d9a94b13fsm3919287ejb.136.2024.02.20.04.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:33:05 -0800 (PST)
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
X-Inumbo-ID: 325c5dc6-cfec-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708432385; x=1709037185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVIlI8kKiUvnaHesQPPaKCxj6fyw45LDej26PUkzPh4=;
        b=CElfueAHMXI+yugycg192MU9I4L3PT6nh9GSSH9+q1ao9WOdiEhMUh3PbI1TAivZ+w
         mfqIDAX1/fz2YlO02sf1eC2SQ2WynWDc3uR6fQ0pgFCyAvHMxMMQbSlqSERVoPIGVblT
         lFiOr53gpQmS/eZqzB8PSbUcHDOT0/2tR/fk9hYhz2nRomuK2Ks59SXUE7ea0M9xBuin
         JiF8P3NzRyrKMEDKu8DmLgCAjrIbudRZTt0QIbXNo2K7dP13yjuFLlKHQNyz/B8XtPgQ
         DF0M4Mu+UmfViY7HE/AFXEWtJGOQ+twntLO3mhMtIMxSWsB6U+eisfwK8TIuF0fTXXET
         3zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708432385; x=1709037185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVIlI8kKiUvnaHesQPPaKCxj6fyw45LDej26PUkzPh4=;
        b=OP7o9lobE1Ti3bCZPH9vckIYLpvtm3uQiFtF60zVQhxJHqtoRF0+4Ih9kG44d3MiuN
         fk0xqwdqk42jfVe4sr4uOhq+P0WhCPuEd/yJdNZ7p6A4s1+fa8+BpW6bjR3ROspB4yhD
         bi2UxQl+th/h3TmgcMMlYxRPgRhjcYwhK7N56aN/lrnoy0/sYEPnZzeuDAXwe+qEck5I
         wU4m29jn1UtgoUTP5gdQx3iKwxH18dcnIVcNlMAyMJduJGWuhmeK5NltFNIfC0NPvPmB
         yOvb4fZpoq6STJ3gaKJPvLtb4wftov2dc3zCaqScw4hvzn/WzBC18UsD0xSW96nQ5aeh
         gniQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk3l7ute2+mhRc1cX5fD5zO5J0XAAU/5Hr426KFL3Yz1zvdnqmfdQYUmGWqvduV4vyMD0cJOg9WaQ0tef6WnGiOb6hmRu1t1Qzeas/w8w=
X-Gm-Message-State: AOJu0YxErNPtIEm3F91z0pIcNWqYmKy1GbUII1iD8fUk6dm1vjWsCI38
	I5k2oYNpTDUWq6Xsr9qJmdKRoRaCOcUE+Vfa1Eq+Xlb9IHnzAB358oNNuYCvVg==
X-Google-Smtp-Source: AGHT+IEgDdWlFcexjOL9HwXd1gkWL06cpWeTMDWFJVt2i/DPBUMr07rGktAFx8SGaulsjXsItO+A2A==
X-Received: by 2002:a17:906:cec7:b0:a3e:73c9:7acc with SMTP id si7-20020a170906cec700b00a3e73c97accmr3943998ejb.33.1708432385507;
        Tue, 20 Feb 2024 04:33:05 -0800 (PST)
Message-ID: <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
Date: Tue, 20 Feb 2024 13:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 13:17, Ayan Kumar Halder wrote:
> There can be situations when the registers cannot be emulated to their full
> functionality. This can be due to the complexity involved. In such cases, one
> can emulate those registers as RAZ/WI for example. We call them as partial
> emulation.
> 
> Some registers are non-optional and as such there is nothing preventing an OS
> from accessing them.
> Instead of injecting undefined exception (thus crashing a guest), one may want
> to prefer a partial emulation to let the guest running (in some cases accepting
> the fact that it might result in unwanted behavior).
> 
> A suitable example of this (as seen in subsequent patches) is emulation of
> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
> registers can be emulated as RAZ/WI and they can be enclosed within
> CONFIG_PARTIAL_EMULATION.
> 
> Further, "partial-emulation" command line option allows us to
> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
> enables support for partial emulation at compile time (i.e. adds code for
> partial emulation), this option may be enabled or disabled by Yocto or other
> build systems. However if the build system turns this option on, users
> can use scripts like Imagebuilder to generate uboot-script which will append
> "partial-emulation=true" to xen command line to turn on the partial emulation.
> Thus, it helps to avoid rebuilding xen.
> 
> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
> This is done so that Xen supports partial emulation. However, customers are
> fully aware when they enable partial emulation. It's important to note that
> enabling such support might result in unwanted/non-spec compliant behavior.
> 
> Added a note in SUPPORT.md to clarify the security support for partial
> emulation.

There may have been prior discussion of this, but I view this as too little
to justify ...

> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to support MSI.
>  
>      Status: Experimental
>  
> +### ARM/Partial Emulation
> +
> +Enable partial emulation of registers, otherwise considered unimplemented,
> +that would normally trigger a fault injection.
> +
> +    Status: Supported, with caveats
> +
> +Bugs allowing the userspace to attack the guest OS will not be considered
> +security vulnerabilities.
> +
> +Bugs that could compromise Xen will be considered security vulnerabilities.

... the odd statement regarding in-guest vulnerabilities that might be
introduced. I see only two ways of treating this as supported: Either
you simply refuse emulation when the access is from user space, or you
support that mode of emulation as much as that of kernel space accesses.
After all "injecting undefined exception (thus crashing a guest)"
(quoting the description) doesn't seem quite right: If you inject such
an exception for a user space access, all that ought to happen is the
user space process to be killed.

Jan

