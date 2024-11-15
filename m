Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC29CDCB8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837060.1252974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBti8-0006Hy-JL; Fri, 15 Nov 2024 10:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837060.1252974; Fri, 15 Nov 2024 10:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBti8-0006FC-GU; Fri, 15 Nov 2024 10:37:56 +0000
Received: by outflank-mailman (input) for mailman id 837060;
 Fri, 15 Nov 2024 10:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBti6-0006AH-M9
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:37:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa6e3b9a-a33d-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 11:37:52 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso17638555e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 02:37:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1617bsm4082985f8f.72.2024.11.15.02.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 02:37:51 -0800 (PST)
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
X-Inumbo-ID: aa6e3b9a-a33d-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFhNmUzYjlhLWEzM2QtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY3MDcyLjQ5NDk1Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731667071; x=1732271871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SgQAW3/Y6uvoW7deyYTZF/SWoV1KDQMiLsIY8IsZxX8=;
        b=aCoGxTviknuT2rFM1DYCMFE2d1knDWl0WLEYKE1HHFhBx1oTKiCzI9FFsJVVpU3EUR
         27kAO+W9LW31ydNgoTPVl+BOj6zpJVhqpiFodSlbYARfGHx0AD/T9jfQL8DT0/sj2VcC
         Agf/Zr5ImF7Y6kaHKLJePbm1s2MtzWCWQMRvsf4CNHSiWD4AFICfNBKJNsTKHrbI8aTr
         BhWqAEJcYyqpUIQ9zQpx6mSGXiIaswx79B63/8H6MbStqoDCpE2AyA34RkPiYeug02Bp
         Wsvlq9rFx/OwwKKdSIf9SHAcAhdcJvbWr/P6upuxn6BmYUblcaBVawWez/vp8YEbZO8J
         K3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731667071; x=1732271871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgQAW3/Y6uvoW7deyYTZF/SWoV1KDQMiLsIY8IsZxX8=;
        b=kT99biP6D1GCSohPfbIjtmFadGEf8AqTWl3BC25Y/hgDYChm6R1S5QXhTbBZlJjH5a
         IyAZ20EfUTpawv4auhLQZZQMDt8qcQYccmcrN3eMAPMD9bVUbk22p3cI78alU229NnCV
         i0PY7zcUhBu7llmYmdINMNEbASMA6krAiP/C0W9TngMlbNeCwkOBfXAWG4p0Yz8annT7
         CwcshfKtzzK4Awov2shqI4znioqUN4z7Lu41tiXYHZqHNbSfDU5sZs5qN+OEnhTFJjU9
         r2DLklO5+w/8DKJozDdtktwT7E6dy9uB6AzIkWbE4c9BfIvZQEn+coehYyCA8MawhpSa
         jFIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzJ/8En46r/NXuxG6xstH52aQwJJH8h7KW2GW4jvS8WJrO7JYQTVYHCBpABgU905RdbXBb81DNNZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywenmh+PAE1t0xxIykf0PmAohwTZjH1+dZ1IgmdcqKobqerhqiA
	rNRFJGtgEwFRKQtwB31XkhDuHuUzNOptwLeCgADAuPlT0a5GzL1QiedCHnJBaw==
X-Google-Smtp-Source: AGHT+IFoDiZoJwxlNCV3BrXlb/pzqDqUBhEx85UHs7+Sxwi+MNhaVUHeoRVGleiBK10AU5wQhxgLtg==
X-Received: by 2002:a05:600c:4e0f:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-432df78f3aamr16499575e9.23.1731667071611;
        Fri, 15 Nov 2024 02:37:51 -0800 (PST)
Message-ID: <c2b670e0-3d35-4b19-b696-ad8faa05437d@suse.com>
Date: Fri, 15 Nov 2024 11:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix alignment check for non-present entries
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241115101225.70556-1-roger.pau@citrix.com>
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
In-Reply-To: <20241115101225.70556-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.11.2024 11:12, Roger Pau Monne wrote:
> While the alignment of the mfn is not relevant for non-present entries, the
> alignment of the linear address is.  Commit 5b52e1b0436f introduced a
> regression by not checking the alignment of the linear address when the new
> entry was a non-present one.
> 
> Fix by always checking the alignment of the linear address, non-present entries
> must just skip the alignment check of the physical address.
> 
> Fixes: 5b52e1b0436f ('x86/mm: skip super-page alignment checks for non-present entries')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



