Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43783C7AB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671622.1045054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2N7-00059P-N8; Thu, 25 Jan 2024 16:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671622.1045054; Thu, 25 Jan 2024 16:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2N7-000575-Jo; Thu, 25 Jan 2024 16:14:33 +0000
Received: by outflank-mailman (input) for mailman id 671622;
 Thu, 25 Jan 2024 16:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2N5-00056z-Pn
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:14:31 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12f69ac-bb9c-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 17:14:29 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so70867611fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:14:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z15-20020a6bc90f000000b007bf05f618f3sm8447933iof.55.2024.01.25.08.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:14:28 -0800 (PST)
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
X-Inumbo-ID: d12f69ac-bb9c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706199269; x=1706804069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47RlakhfRyn8lW4fs3dY8kIWGczXx47Izar2AGiOFD0=;
        b=MsKHzf0B+XAQf/+efimFUZgc4byFE828JzOEuwKfbT6FiVCHI9wutUp9MJ2/tUyE71
         9iDpU8oRx+7grULjLtqaNDAxkVZijR5xPXYMoMv/bHrK21vE6nfjXM20iGYNgUHye4y+
         EGbrgqlMyYhXucwAWipLhMyNHNP4imxvCUjyoc/zP4Xn0kHlS8bfBJ13rbiM9hdck9Sv
         vpNhxrRSzXJABUU6KC7S7cKDUQ+uQ9ST8CIjMsmLhi0V+6tsDux1Pd0OQPiMczT0p6YF
         pSBYnovnOSE7x3CRghREMVMWGccZiKX71z/5eYC4gRDkSeLl54e+xrY6RRBioh4EYX8Q
         dFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706199269; x=1706804069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47RlakhfRyn8lW4fs3dY8kIWGczXx47Izar2AGiOFD0=;
        b=WKDougIyIZ1QukIT4dcg7f1uu9fN6mMYtQuKLIb/zvGWHang6s/66/V88OBRoedy9G
         wEKFtTP6Ye9BKFaUbHsG6ZxSJIiTofg8mAt5C+zZgPn7tp3AEcBaswPoXCpLyoGqJU5x
         17EBDnjROdsdZYTXZfO9hs1kOWORQGb6O5RL55Z4JXDn+WocZJWi7pwGR3zCbwiy5p1N
         uJPd9G4+pk7iqloZPnOMnLCfpqGxBkwpllhoa24W1MT1qLoGLR5nLp6euKCY94f6+Sai
         1zFAsuJuTbAv7KTwyQ+yM3JCvJ5getpIdbobxR+86rYMK52d4ahcte9bQPMu4ypfGNFj
         5qwA==
X-Gm-Message-State: AOJu0YwKGF7aU7KgDlCoc0lpHvJcZLsh/HtiGwFtV+B15hr2gHTGwqTB
	had/ID+34I1tysYcwF67kopudAtPuzeeq4hqLw6yPrRzO54Sfk4CFZ/8yNKrBw==
X-Google-Smtp-Source: AGHT+IGnV2BAc1rBJmqif0CVVC49QD09Sl+Ye8LjwoaYvu7i87Vgtrq5VNMgDAon4DCkSFspqPGDHQ==
X-Received: by 2002:a2e:7805:0:b0:2cc:f5b6:91ed with SMTP id t5-20020a2e7805000000b002ccf5b691edmr1054623ljc.23.1706199269004;
        Thu, 25 Jan 2024 08:14:29 -0800 (PST)
Message-ID: <076a05e7-aa62-45bd-9f11-4a7cea0af396@suse.com>
Date: Thu, 25 Jan 2024 17:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 01/27] xen/vmap: Check the page has been
 mapped in vm_init_type()
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-2-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-2-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function map_pages_to_xen() could fail if it can't allocate the
> underlying page tables or (at least on Arm) if the area was already
> mapped.
> 
> The first error is caught by clear_page() because it would fault.
> However, the second error while very unlikely is not caught at all.
> 
> As this is boot code, use BUG_ON() to check if map_pages_to_xen() has
> succeeded.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



