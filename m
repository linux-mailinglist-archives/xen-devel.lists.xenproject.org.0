Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61313A33AB2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 10:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887286.1296810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVEm-0004ge-Fx; Thu, 13 Feb 2025 09:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887286.1296810; Thu, 13 Feb 2025 09:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVEm-0004eO-Cx; Thu, 13 Feb 2025 09:10:24 +0000
Received: by outflank-mailman (input) for mailman id 887286;
 Thu, 13 Feb 2025 09:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiVEk-0004eI-Q8
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 09:10:22 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b22f64-e9ea-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 10:10:20 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7d583d2afso326117166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 01:10:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5327fc9bsm90088866b.75.2025.02.13.01.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 01:10:20 -0800 (PST)
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
X-Inumbo-ID: 59b22f64-e9ea-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739437820; x=1740042620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dlKOtAg9LgTX4E+8vRbxSlAPO4iQVdVyNiyP78/8vfI=;
        b=KPirJmGAMWFO+1kPxF+7kOGBGgpYZuqjYKMhYVP/ZHseCl+sUa6bP+4cUWiSun/kn9
         glkBfzRWU7/21mPTcS2ihmL905f09yllllB5n688de/eS3Dxomwr/PvFSPVAHzXkW1VU
         yJWH6pMjy9vcynmWxc1qIWZkTPaqqU8+pqiD20Nbloo2vHQHI1DVHaxLhf/Hb1wnxuZB
         bK7+cOEonDHLViVLN08NWiiiFaaNXwUlSQDFeZJ+5907IDv0W2y/+TQy/qP0ImldX+mR
         vqbsZpubLZHwBKd+OZIgrVHRgBeYl5kgrb/2B4OnEZk9UqykNv4mnNDNpqkj4H7z72kH
         wYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437820; x=1740042620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlKOtAg9LgTX4E+8vRbxSlAPO4iQVdVyNiyP78/8vfI=;
        b=ZIjE8qznkSVxRqXmqDIl9SnepDiqle7e8xm1u6H4xjnFo27qGJryPC8R3kDgqaGHkn
         vljkmEWtTWBHCFZXeUvNgNXjRrgc0YXzqBwHlEPbVOFpurcZ8cSt7z2bO2WINmfe3Lms
         J0qEnIAav/c0l1O8udykcLGfU6tE5qlbQ7ByHbn2vBotQRsFF/shSC3eBa5hPVFthZ+i
         WeMkW2eu61USC9Z5xAX6jXUlWDwa5dv8xDgPvvpF+O2TyloIdrl7QJ/7ioPu37WIF2m9
         1gvWmiaVx6MzaL2g1WRV2+W26hstuaZNMDWjn2mmK8+0xbe23bDQmgPTEOcQRmpA5rnu
         VyZw==
X-Forwarded-Encrypted: i=1; AJvYcCVb2mabDN4nupB1sbxdnsBjPuxyJBIVp4JflMb9+NzJHByrEoF5njQN4fWNlzNsF6U8GwQt5DDVO04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmsndjG4EiLgVsQ0mV9vCsfDRnrXISFITFptWFX8758I/FrASh
	2ecXxE7T0mYohfL+Q7traJyAwFC8BMRcE8KUXbC7wyAUsuZqo5urdYgcBRTk7Q==
X-Gm-Gg: ASbGncvLgXgF8XHuIDGAjNbuh0LICcCEAO8N3Zi6QK7GZQoU0y8PG7vPn18CPheGfFD
	HkI9mjzBh7aVeDEyZ2DSZrobwYcUxSz0xcLI4rxJl9h2dV/kXzQ8vFUPk9HpY8VCJ67pXADF0Rv
	k0Ks2TPi5sOaXRWoguDbSgWwXeu1c3e8Ayn409J0r3u6mrj1Q+qdmjJi6OAhVbR05vQYPrvfPrw
	2zWlyp/9OdmiAWUKU+59kEq97wK1Z12oqihz5T/XEyGMQc0BCsA21ly4z7R+n14qh5Hpv2znokl
	xnOE0CSxAsG9rgTMoBw4KYUJX7TCnWgZVch5B7IMLxP6bKIUwEUYOSFniloBX+5L7bW/Pm9iwbq
	K
X-Google-Smtp-Source: AGHT+IFiY9DW+cGO7gYROAapprvUWkN09soumnz0/DRxfCdxtiP3kuPoACSS6GmAqaOjWTeRNlDnyg==
X-Received: by 2002:a17:907:3f1e:b0:ab7:b7b5:2a0c with SMTP id a640c23a62f3a-aba5142bfccmr193373666b.6.1739437820333;
        Thu, 13 Feb 2025 01:10:20 -0800 (PST)
Message-ID: <75db93fa-ba17-44ae-b41a-c36afd9b49ca@suse.com>
Date: Thu, 13 Feb 2025 10:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/console: print Xen version via keyhandler
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250213082639.119796-1-dmkhn@proton.me>
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
In-Reply-To: <20250213082639.119796-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 09:28, dmkhn@proton.me wrote:
> --- a/xen/include/xen/version.h
> +++ b/xen/include/xen/version.h
> @@ -29,4 +29,7 @@ int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
>  static inline void xen_build_init(void) {};
>  #endif
>  
> +void xen_print_version(void);
> +void xen_print_build_id(void);

Hmm, I'm sorry, as I should have thought of this earlier already: What exactly
is the significance of the xen_ prefixes here? We're in Xen sources after all.

Jan

