Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323868B5AFB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 16:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714106.1115120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RgZ-0004kL-Q8; Mon, 29 Apr 2024 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714106.1115120; Mon, 29 Apr 2024 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RgZ-0004i5-NH; Mon, 29 Apr 2024 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 714106;
 Mon, 29 Apr 2024 14:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1RgY-0004hx-8l
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 14:08:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe2459e-0631-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 16:08:48 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so9162015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 07:08:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c4e4800b0041bf7da4200sm7719713wmq.33.2024.04.29.07.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 07:08:48 -0700 (PDT)
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
X-Inumbo-ID: ffe2459e-0631-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714399728; x=1715004528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTTHoR6ZU9fHGDnULkOGFnNISjG4X83LTEHmIo5eNLs=;
        b=WDH5s3EyRpH0Pijob/93K+jEQPhOE6SS+zZK1Yac1s0bsxAj4ZDxQW3HOjyH9D057s
         EHKE3/xmO3KPZSpZTruDVrtU4DJND/dtXe/K02DmK673CSwCjlJxjx70iSfqX8QOTwix
         zBrUrgx+2ISibxVajIABwmfc2JQFsJq0BaaDh2zVLEQLTMvvUGjfpwaNZOQg5aT031O9
         enxnbB61YE/t/iTllr+YX3gtm5ocKG+EqIgOSSwr7Ld9MmkutdE3Nc7W0sNOr9/WKek5
         9dXNs3JtqmT+rX0/6SmZkhno39RNXAQrJy/eCvxzZejebgJ8FnjY/3aG38TwPInV6Syg
         qf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399728; x=1715004528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTTHoR6ZU9fHGDnULkOGFnNISjG4X83LTEHmIo5eNLs=;
        b=dqAk1bYpbSt/g65TTV8g+4p70B8OHN4C4lkPjtF3MaZbNf1OgBuhxiJq/0mPm0001b
         S50jIQhicITrj/uDWQmAt5g3HMu08yPR1Cs+lThgHWRNwYnz1M1ARdTBsb2g5BsykwWK
         6eux+8PAuSGV+sKOMLMYn7CRUrz37XYHHP2+zCGDiT7GOHmZnk0hhcP+bhvLlGXjRrZh
         LxwJEXBhgBlHRy1nnj7nVeS7CprPSk4dCHM+5zswmZsyeK4mvQjZJu7D9gPNUy4BTDYu
         n6BknzAYe+Ti3zdexb7etYFPXkIbLzVwxiEEXe6goSd2OQ1NQK25P+dFAYgI6wR4u1CK
         bqDw==
X-Forwarded-Encrypted: i=1; AJvYcCXLfb6eOW3b+6GSFQ+O8JvA1srJQ1OjzmopGsUoZE7w4K+/Qd/57qv/gsV1cBZ1VdlBxqsCh1quVvPGovmOgQo+nMXsfju/HFjXp7aKfdo=
X-Gm-Message-State: AOJu0YxWO+nY4fV9iUh/Flrqn2kKJm3W7fd77bXTk5Ea/l4MX1Lr1Xl8
	ofovjbQFdgfXMoVyFwJjr1fimrS6H9ehtRA7YIXpgfuAkb10gc6xqctfxnKPYA==
X-Google-Smtp-Source: AGHT+IH24wvQTXXocBQPg0b/JI8wTk3vMhMQSST/gVlrQiyDkspZPZ/hVj8R27gU5tlm9DMTcrre5A==
X-Received: by 2002:a05:600c:4f11:b0:419:87ab:f6db with SMTP id l17-20020a05600c4f1100b0041987abf6dbmr8277621wmq.23.1714399728362;
        Mon, 29 Apr 2024 07:08:48 -0700 (PDT)
Message-ID: <0e0bbe62-41e2-49c9-a850-1c80db641a8d@suse.com>
Date: Mon, 29 Apr 2024 16:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] gzip: move window pointer into gunzip state
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-5-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424163422.23276-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 18:34, Daniel P. Smith wrote:
> Move the window pointer, outcnt/wp, into struct gunzip_data. It was erroneously
> labeled as outcnt and then define aliased to wp, this eliminates the aliasing
> and only refers to as wp, the window pointer.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



