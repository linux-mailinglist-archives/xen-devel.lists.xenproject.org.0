Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3694AD56F5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011741.1390203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLVI-0002Eh-9Y; Wed, 11 Jun 2025 13:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011741.1390203; Wed, 11 Jun 2025 13:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLVI-0002CU-6Z; Wed, 11 Jun 2025 13:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1011741;
 Wed, 11 Jun 2025 13:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPLVG-0002CM-Mj
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:28:30 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67fa17c-46c7-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 15:28:29 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so5411024f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:28:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603092640sm86888965ad.54.2025.06.11.06.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:28:28 -0700 (PDT)
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
X-Inumbo-ID: f67fa17c-46c7-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749648509; x=1750253309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOHZkRc3ctKyMzq6MqCk9YchYthx0RwS7YGyu+lEHGw=;
        b=MebklG83iwTOX5ltY8YqMNvAsRcjXs3LpUTfz1QSvfFFGv7Tzoj0Bo1XUa78UikW0w
         k81lw3pmaWz9/XMUUDage0ScleIPObXHwuMSurLK4v3P98KjFCEfBrM4Y+0JBMYxdOCD
         wqdsYjnqmDYhfXWemDq81LO3/5/bKaBqQ+N67vZJv/nHN65fzFCafz5CwDV+Nzvqiduh
         IG9zSFO6B/NOpYUkC0Jadj7De+S1xRwZLdqkGfwAWJiTn3Lcxl4xfxHhz7+8ZIGjpFpu
         sPIueHxYEgOCVgEo/n56frolSlXaP/hLF4Qj2CYfVKEygQaHGxQ7moKiIaNuAIqCiQOe
         OFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648509; x=1750253309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOHZkRc3ctKyMzq6MqCk9YchYthx0RwS7YGyu+lEHGw=;
        b=KUmsEKmGj96FNvfJ8PIIQk4w0GOW3K6zpYy0qQflKKdcw+kxFzVyyZBVFh7q9/eVjO
         FImBmVZZ0IhOTlIcBxhq8UJbiS/B1purE4ukD/G/8VoexqHnL6CXjrRO9L4XKaw93su/
         t5fhfuMMe5ULZBgj7W9oyDXJfyXritjs0ru5uxDYWaiPzaDYBp+K8GJBUr8Db1OyNifD
         e1rQ1ITeNLKAR+eYZAKef1rst5f8xHWRXqGMW4SeXJhW91vo4iwyIozmSNBY0u4nijWm
         QKDVexjB/k/B6GpoUapqu/hFq+eRRhZfLMMAM6kcOtutmhhtWwq6eWtVLp+kzCqHwsxl
         psOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeWCe9ny3TRSrgNVwlhn3o5T+F+l6pHkLfKcMmWD5mn7bQvlCqF9jObOHQw78dk8tfwBvz3ZgKYDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPUvNbEfG0UfaJDIaoU3ZiY7FbwpiysfASPaGQzgEIr6BSBEB2
	b1Wemkyeo1kZF49TfzfWYNRViWOmIQtpaoLeuQI+I8G/9cUTbc0vu9TLpt5b+KPLzw==
X-Gm-Gg: ASbGncsYOSit824qy7cmVjVY05wpOehrygK8iqSj7JYQFmEVbfXqZrssFa+Tn2rIQTh
	9ULakq9rQe6ErL7LkTxLZn4xXR5qpa1JEASrscyNDWzkmL73oy6bAPnBX5WPqozeSR6Vq2lHLSq
	gweHCupqaqe0cfEy0qLbpsHXsqbfcX8HduQ769dCq7HNxCEZpPtmzNrj/RasVMfi/rvAwz+bYV2
	wuVgFIsfMFFaioJ9JeZux4lc1qB6OFDrgIUmXzl6SxoDlHrvdYi1CrImMmmlIPPml0gGgStkSIM
	/PtRXhSOpzqnHhWIdPREHmMZrCtyjWfIlsdf4g2p96xz0HBwG8ExzlSbYJ/Twzjev7yfij/li99
	wndwHJeGxw5g5AYu/zPXnBaLmkyrOudDXojjgT7tTkZR8vWY=
X-Google-Smtp-Source: AGHT+IG19wenMLI2OnajzGoCcP+u52UE3vvR5JGrjB1w0/KPS8sbeOLGR2AXeBrReiZsgnxuMPYAdg==
X-Received: by 2002:a05:6000:4020:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a558a3128cmr2940604f8f.44.1749648509242;
        Wed, 11 Jun 2025 06:28:29 -0700 (PDT)
Message-ID: <0defc4e7-382b-4651-8255-652da17a2129@suse.com>
Date: Wed, 11 Jun 2025 15:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] XSM changes for split hardware / control domain
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250610225737.469690-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 00:57, Jason Andryuk wrote:
> Theses are the broad changes needed for a split hardware / control
> domain.
> 
> An earlier posting gave device_model privileges to hardware domain.  For
> this posting, it was split out into a new capability.  This way the
> operator can choose where to run the device models without making the
> hardware domain have the permissions.
> 
> The first patch add XSM_HW_PRIV for the hardware hypercalls.  Unlike the
> first posting, the control domain can call these hypercalls even though
> it doesn't really make sense.  The idea was to keep the control domain
> all powerful from an XSM perspective.
> 
> SILO is changed to allow control, hardwware or xenstore to service
> domUs.  Xenstore and hardware will use grants for PV interfaces.
> Control wouldn't typically provide PV interfaces to domUs, but it is
> given the permision to do so.  Again, to keep control all powerful.
> 
> xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo this is not strictly
> needed.  xenconsoled could read Xen's dmesg.  If it's in hwdom, then
> that permission would be required.  SYSCTL_physinfo is mainly to silence
> xl messages, which are mostly cosmetic.
> 
> Jason Andryuk (4):
>   xen/xsm: Add XSM_HW_PRIV
>   xsm/silo: Support hwdom/control domains
>   xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
>   xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo

Overall I can't help the impression that this level of disaggregation simply
requires the use of Flask.

Jan

