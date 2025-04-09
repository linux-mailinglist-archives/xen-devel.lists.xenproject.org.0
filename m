Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D58A82092
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 10:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943632.1342313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2RBn-0004Hj-J2; Wed, 09 Apr 2025 08:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943632.1342313; Wed, 09 Apr 2025 08:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2RBn-0004Eq-Fa; Wed, 09 Apr 2025 08:53:43 +0000
Received: by outflank-mailman (input) for mailman id 943632;
 Wed, 09 Apr 2025 08:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2RBm-0004Ek-3B
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 08:53:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217a30c7-1520-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 10:53:39 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso3010395e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 01:53:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm9084815e9.23.2025.04.09.01.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 01:53:38 -0700 (PDT)
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
X-Inumbo-ID: 217a30c7-1520-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744188819; x=1744793619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9cjuIjv/cNefTTaRPQ8A6blOHTprB70CTT3h7DOTPU=;
        b=C4QSJM3iIL/gJ2M5FQh66j9I4m/oDzDhDK3q1QRdc6rw/VnF/MCKfbrS5+xyC0Ivx3
         QUS3Tayf9dKcEyZzKTYHMV3zkBUWisS4HtuzAKBjLf8lJ6w0lk4N94P5104e9YN0vDjH
         8BpQR4IquOgV+hokS9HwzByHFqVWAp0rHtICz1kPABkaI2mHLkB18+rcFyGhBjUAorBm
         YR1LeZ+TQBKe6i/3DzX/48WoH91sZc2dpXAnd6W4JcqLsIy+qnXqQqRqFhDO/oHPVe+k
         CWVHvUZvt5OJY4hQhZjJCUkuVw5he3Q7HMpHI3pkMsiTHYVEtnNCeHmu+b+92YA514aP
         p58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188819; x=1744793619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9cjuIjv/cNefTTaRPQ8A6blOHTprB70CTT3h7DOTPU=;
        b=B3DGTbr0xZ9vaKXbnpnjAbz/5hxHvxmNNku1xk54qqojVCozz55HkTGV2tVPaJFV5b
         FpCxjcmA3FU2bmDK9u7BLJqyTQ76vg25dPGYft4vHVbBMQ+PXUZS5oWTZuJbBIrkf7dQ
         DdGc7l0/jH+DRo4ux9LkYbk+mbBunF+MrJPUjy2pGGwStIyNQhjgCxzL8oZoCUFy5F1w
         qS7b7JUxOCwvBRe404Z65xtMEmGtGF69j7TekXyM3OfY1IWWcxKoP3jlGwcpkjSYryFc
         mkgRHnlApi3E4AAyHUyUsjgo+ffBmc7Xw2Cx7kqG8jOXflck2LD0Y85bPD+nGETUta1g
         BdBg==
X-Forwarded-Encrypted: i=1; AJvYcCVc3+8CGiJit/qS3qHRTTv4eXdleHS722inuor335Z7K+P/y83ZXbvbBK3WcbyAzYaRgT1rP6k85P8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuuHnrWjHHescSEPx1zvNterCvDD7DjHl61CF3WR8z3XvYjK1k
	ikH+hnAdhMpO6wqwvmyR53XfiO4g/sJhgRCSSiw5PcFxt6UMIlEXHvjotbdaGQ==
X-Gm-Gg: ASbGncsUaLhLGBPY4QnIigcMF8WvKUw0cgsmxdit7Pp0qc+Iw/sw/sEB4wxxK9UdZkb
	Thqs+0BzKV2zmbghDKDHIirG+NXsfOzzgHFFjkAzA+9wstpokM16EZyHOvf7ZQoV8IJm5XlvYPs
	iJ/XVtvk05yiihgNIkSLGlReD5hBHaxgiSmc6NfYzGStIzvJo7UUcgcu9JLOEpKxO7NrWXt9S9R
	x3V8VCbss88g/VDOxJpVw7LnGXSaei5KAX+dhKD7w46RfgEe2X8Wf8Qz6UQ9PM5AUydC73xqlRj
	vI9eVX42mGh9jZ4ppNtjRkjl3UpNxwsmfs7AO/X7e6PiOYY3C+DoVxOvmjitjYyk3c+4JfxoF9G
	KkSwfNg1ScJNDudAGV/m8GTz3oA==
X-Google-Smtp-Source: AGHT+IFS39nfCa+S9kTJgMN5hpzs60I7n8t6DlknvmswpQpJwp5Sj3NDVUN28kw76aCb3XqP4Xb2Vw==
X-Received: by 2002:a05:600c:3b04:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43f0e5eff19mr61306165e9.10.1744188819238;
        Wed, 09 Apr 2025 01:53:39 -0700 (PDT)
Message-ID: <ff05d16d-c9f3-4655-abf0-25201f8bca85@suse.com>
Date: Wed, 9 Apr 2025 10:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 1/2] x86/amd: Add guest support for AMD TCE
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
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
In-Reply-To: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 11:10, Teddy Astie wrote:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -170,6 +170,7 @@ XEN_CPUFEATURE(SKINIT,        3*32+12) /*   SKINIT/STGI instructions */
>  XEN_CPUFEATURE(WDT,           3*32+13) /*   Watchdog timer */
>  XEN_CPUFEATURE(LWP,           3*32+15) /*   Light Weight Profiling */
>  XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
> +XEN_CPUFEATURE(TCE,           3*32+17) /*H  Translation Cache Extension support */

I consider this too limiting; this is a performance hint only, after all,
not affecting correctness when ignored if set. A shadow guest is fine to
enable TCE if it sees fit. It'll benefit if later migrated to a HAP-
capable host.

Further a HAP guest is also fine to set this bit even on a TCE-incapable
host. It'll benefit when migrated to a TCE-capable one. What we'd need to
ensure is that on TCE-incapable hosts only the guest view of EFER has the
bit set, while what's in the VMCB for hardware to use hasn't. (Arguably
support for this can come later, but the shortcoming would want pointing
out imo.)

Jan

