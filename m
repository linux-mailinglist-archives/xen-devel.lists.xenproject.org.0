Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D124C8D00A6
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730734.1135905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZvw-00058B-Hw; Mon, 27 May 2024 12:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730734.1135905; Mon, 27 May 2024 12:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZvw-000557-DU; Mon, 27 May 2024 12:58:36 +0000
Received: by outflank-mailman (input) for mailman id 730734;
 Mon, 27 May 2024 12:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBZvv-00054x-2P
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:58:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d333dd8e-1c28-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 14:58:34 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a62972c88a9so236161766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 05:58:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a62c501e85dsm247769766b.117.2024.05.27.05.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:58:33 -0700 (PDT)
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
X-Inumbo-ID: d333dd8e-1c28-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716814713; x=1717419513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Yme6rd5RZYashNZq5SnUrewWqWptJp8i6Jp+GbeKLw=;
        b=DR8Wku8IflbSgrHzpw4Y9BAXcKrPHjZ/B3g6/xNKmRI/tZRgkocxTrPJE4Ee2HGrYN
         ZiVAiZALy/UojRPEahf2JHvpDvTCLW9QeM3ADKvZSlXeRzB5Ct6ufV7QMaUnWHD0CRjG
         Fxd9pMb9wWYark0AHeYUBswug5aGZDtJ2qyrPPU5tb0rAgBIZScW2JUdYu2kMk6qL4P1
         v4RHv/hmTy8lhrsUE3uYvn/kCegwHXqIXZYWjJ2QkJomHZl9r0h2OxFjxXxmCF+94ZiC
         Lkew5tD9o3IFUbY1IN+LWBZQJgVp7cPFkQJGlaqNAMixgBYbfkBu5AZbSYFHijfcMyWj
         gF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814713; x=1717419513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Yme6rd5RZYashNZq5SnUrewWqWptJp8i6Jp+GbeKLw=;
        b=meXIGTQIIyomkdishavYbLYeZO0va6GnFLa85W+WRoE3nkBpkFoD6IL1mvHEFYqaOY
         wbUbcoJHUxa0uuYoqwnI+bs/yhr3U9pJ0FaEHFBadxX88oUWu1sk0ANXJBb7GiwIzEUL
         tI1m4cIQtM1D2xKb9xFtiM/cWCS0AwrupPQk9dolINK7Dhns8VXELyLEb+iX2H67MH6h
         bkaulh+pq0MqS3ELp9BjcN+db7vYdErEGH39XeL6rk91ahvqzolysAeQ0b6D9fYL7ZQ7
         Ec39NZPZdf7bRHVlmFYc/6aa0ODE39D02nUbyTOBnxXjtZI0lqWDL0RZux51ozmqL537
         ZgvA==
X-Forwarded-Encrypted: i=1; AJvYcCVevuFYFWEtGmZdwlLXZvoahTZ28kzzB6ohALsvzXcv0QlqnrLEKNsKI492pJkT4tKRPcX54paVat2NAlVBALt89JnUD+4lqcx4v5AmfqI=
X-Gm-Message-State: AOJu0YwpPkoA/jq6VR7QUo9Y6chTz69ArBz7AR9ns1eU5x3+wjv2yHJS
	vlaPIs6UI0XW4hA8jI1mrCMhj73NgSHwJH10kWqjl3oiZifeVuWnh0vSWpr0Ag==
X-Google-Smtp-Source: AGHT+IGbz1zNzGOOQzvC3vXB7vasindAwIi0MBbktLeKFgA2UWNqPL4IucJUAE+oaqG8uq7eWWsqrg==
X-Received: by 2002:a17:906:c49:b0:a5c:dd34:2312 with SMTP id a640c23a62f3a-a6264f01525mr590867766b.62.1716814713475;
        Mon, 27 May 2024 05:58:33 -0700 (PDT)
Message-ID: <a9b7ddb7-a485-4d0f-b2cc-7207093514c1@suse.com>
Date: Mon, 27 May 2024 14:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] xen/bitops: Delete find_first_set_bit()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> No more users.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



