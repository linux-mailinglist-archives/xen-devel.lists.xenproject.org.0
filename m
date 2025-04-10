Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E10A84731
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945904.1343982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tPj-0002Gj-HQ; Thu, 10 Apr 2025 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945904.1343982; Thu, 10 Apr 2025 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tPj-0002CO-Ei; Thu, 10 Apr 2025 15:01:59 +0000
Received: by outflank-mailman (input) for mailman id 945904;
 Thu, 10 Apr 2025 15:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2tPh-00023z-KH
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:01:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be2bf83d-161c-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 17:01:55 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so10053875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 08:01:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625ea4sm58085755e9.12.2025.04.10.08.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:01:53 -0700 (PDT)
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
X-Inumbo-ID: be2bf83d-161c-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744297315; x=1744902115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MPZwXz5TmyHV371FcxCCpkULIn5V+T41xy3jEphy+zA=;
        b=E60f6ohmltcQF/qB4LPlMckHbNDfi5SEC2GQ6RopkTJKzjMtYt5SMsxReZe4QDw1TH
         ZsBFUaruVWoqVmjXWLZQwuD2+6uXSW41OzF1rqi6cFcta0r0bLXuwyKSRlsYUe3qr5Uv
         aIn1E6NPVorFEu+psorYncE90iIf0AVh646yaZheCWVm2TVRMHiHivYb+TMlmGmPHn1A
         72iGgcgFfdOJVXnaE+bndsMn9kkoSH4wBK2vzA9kZDq69H6YumlgBDT9NxH9ediEZdx6
         t8C7kVKJd1jG8JOE0TwnC6pfHr21U1eumddVinVOxEcNRcxfFjOTLhsEH5LQp+vRyX6F
         DmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297315; x=1744902115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPZwXz5TmyHV371FcxCCpkULIn5V+T41xy3jEphy+zA=;
        b=JmPPNBsVs9x5d6rd/F4XJ0SvU+c6aZbRRnJzPUSw/YinoPiOxjY+BclvicyjwrLXC5
         6PG2m+5nfNaxs5Ipb2+SCe6PpCtgFgskBkIggoT3JyfUYoBjQU6U+GyoN8CtA7wo2do4
         y85NNlTWotetnGFVLbCPHVeiRuwZvx31w8tljXub7e5TGKbjlrw+3fZRROMqsU9AIx5k
         rgoAEngCKORsI5AIPjESgS4qY28xxV2POIBVpspqBcNIrp5ae6VJYV/mxN8zMlkUN64d
         3SDDlyk5l3Y57gdRIcE2F03msgI5ai9D6kuAa9KS94Qn6bNLdUUFuREo81JQXMrF8hWl
         Cjmg==
X-Forwarded-Encrypted: i=1; AJvYcCW0W2f1K7ybZlgEv1HzdmNf+rNNiISteFFD2VJkkejSnQBi+BZqb8NcBJB4NZdQMhcDforaOsLyOkg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrOVJVjmZbQcnVdbxBBL6Ln7VWt+wt5XxzDvWTTLqeV1iVh4zF
	c95dHpCNHJuhiuWGswWz8Co2WiwICTGe058c9Jr2tRtoe+1PinU5ZBJ5RvyYLA==
X-Gm-Gg: ASbGncsALkoCWjcXIpRmigpDdb6xdDTo8TL88G902F64Wan1OZn/L+ADjwG/a6k1hyE
	V0Kb92DeaBvBot9WDrjtB2stMkorg2ts+Wa7icBQ5Sy+tfqaHOQ3wl/bkUN4gpuyJfqHiyM4DAu
	RjYOpMLFqVnyCt8LCIxTeZ6Avfx+i6zp4fQvPd1YxjJMYyU2gmufMMoLBzJb4RrTupT5whKRCQk
	2MXMObCgb0cZyW1QgjAfq6NuBb+Ojuoe9Dwr1W5FmR5fbxyK8H6DL0vRabTMdoRP/1XlcGhR1LN
	s+A6Pv5aFU0i5NmdAwci/RhbsaHkvWQd/AWEiJD6k2fq8wzTNcef+T5BVmZSVadBySeQDUY3TLy
	jvrMTP2s1CxMsV/sKPwr30p7R/w==
X-Google-Smtp-Source: AGHT+IGlhV45oHYXIWlrsxMTMlSoQr60Q3YoKuqMyfG/6yIzPs/leajHOla1WEdeknNA8bqm626zDw==
X-Received: by 2002:a05:600c:1554:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43f2d9a0563mr30239595e9.33.1744297313578;
        Thu, 10 Apr 2025 08:01:53 -0700 (PDT)
Message-ID: <f0a14866-0f38-4f8d-8e11-993a58c7da7b@suse.com>
Date: Thu, 10 Apr 2025 17:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
 <7fa754f8-d785-45d8-b9da-de5c85bc793b@apertussolutions.com>
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
In-Reply-To: <7fa754f8-d785-45d8-b9da-de5c85bc793b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2025 15:09, Daniel P. Smith wrote:
> On 4/9/25 02:24, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>
>>> To begin moving toward allowing the hypervisor to construct more than one
>>> domain at boot, a container is needed for a domain's build information.
>>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
>>> struct boot_domain that encapsulate the build information for a domain.
>>>
>>> Add a kernel and ramdisk boot module reference along with a struct domain
>>> reference to the new struct boot_domain. This allows a struct boot_domain
>>> reference to be the only parameter necessary to pass down through the domain
>>> construction call chain.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I have to object because the meaningless rename is going cause 
> significant pain in the rebase of the follow-on series for no improved 
> code clarity.

Sorry, then an incremental patch undoing the rename that happened (with
appropriate justification) will need proposing - the patch here has gone
in already.

Jan

