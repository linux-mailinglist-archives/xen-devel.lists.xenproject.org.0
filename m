Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BFD176EA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201278.1516946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfaEC-00006e-I5; Tue, 13 Jan 2026 08:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201278.1516946; Tue, 13 Jan 2026 08:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfaEC-0008WJ-FG; Tue, 13 Jan 2026 08:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1201278;
 Tue, 13 Jan 2026 08:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfaEA-0008Uv-WD
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:58:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c9dbe6-f05d-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:58:04 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso29845115e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 00:58:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9afsm45503714f8f.24.2026.01.13.00.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:58:03 -0800 (PST)
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
X-Inumbo-ID: f8c9dbe6-f05d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768294684; x=1768899484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGlKdero6n3cHpvHk8T+zZ5OcAUXGfpJ3+5ydXJc6VU=;
        b=bKCGN/ExNSh89pOFCbWkMTWY9tH04QDjNrA6xIUQ78D3MlfDLNP/TzK4bdyUrklmlU
         4up0M6VEzdtlUTqL9w2SZxYbvX9wT6viiDmNqY+EdUwWvvInhnn48OSb+TGctEjPvUo3
         1lQG5UrPv880WdYdbHK7sve9N7PO376XxdnF+w+S9QzRomFuRx00A5LmDpW2iUedQKWZ
         p5ZA5Whj5LWs/vF8SDAnu1+8MoWCoLQyyXNgYnRVnYhwULHVMbkK7SKTJgZVTCjeDZHe
         Gr+5Ool7dR8V0MR1fKy0Jg6zeGqAZ6H+SI8A+LTNQ1JfbwTA82zYENDeY4PUFX6WmsEY
         xdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294684; x=1768899484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGlKdero6n3cHpvHk8T+zZ5OcAUXGfpJ3+5ydXJc6VU=;
        b=KdGMK68RaIk0+5qrg9rmHmhFq/vQpOfLqYzHIj8CN18XNwmMWpyWMXzN/TIvWKrCpe
         lJ6x9OOnffIp5+r6lQYl7ZJ88gsS0e9XcER76IUrcP1vkuchsAyl7mDFc5y4vUkuy3z5
         rKU3Cnw4bWCpzvlttEsQPVzYxrc4kD8fIiA7QZWrVnWQ9gYS7FEIlCaBYx24gWuy7SnD
         9OjtRfcUJtQ8GMfnEdz+pm4y/yGovZL8orWfR8va69pnnc0CG6bVUZnlJXjw1jvLfTjs
         +FTcrXuKBeHV3srCEFH1878uP+QD8LA1ZyFt6uKBrlMq9M6syzuUgcoeH61c7BY70XQl
         yfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhD8KNTgW8GCKONJ/h7buP7IGWV6PzKsI/63bh8NKRsvU5UMOqTRMq/VQ7i+NZ4JNt1QOE4UFRHko=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDkKGg+jXQjl3/hxpZDqaUOll2kS/KMU+xHcz1EF5crK+/XwGz
	tRq8i2IrYu/TFzpgOUjOX4avuKKgDjyCsGbC6C2qpsdg+BQUME1gjGx1mmMNqNKVwg==
X-Gm-Gg: AY/fxX4NEdOEUzNjYeH0jFtBccCfPV5tEdZz4KStHE5TC+jGemlucU7SPSZBMUxHBff
	UpBb6Fl7KkyVLptmO9RgoxyBHJmiNqYN7GJ0JXI5Sifkvo5wAbclPAC3SY7fNIzQx7f3zZIxczx
	PDjsD8CQca6ywOgHU0GwzrmSIlQl7WfhAAayTp0DysBHtI49DwzeLcd2uoJgbfpv0L1uU8tF8xz
	am8P68MSwBeCTjhBg9xewAOukZf4JK1uVZ9UjISuuXdE0Y2+3IP2HwP6AKl+Is7Ak6rSifucj20
	qag520+R9c4634uYGtxulmrW/ppQndRCakrmmkLyJ9h75o9TrTvXtheTFGfvnRzgHDtHWndHKh0
	CReD03o4VgDBGAlNxDN2Fx+v31kiFlhXQ9Xe1R+k651byYchTpN1pgbODpMmrqGSJ+DHhYWn0u7
	ghDgp5YocvoyOTlhwNwg3cFIrWgJ3OOBGiVBVoWgdQ1Gbc/AKOLO6lAqOPT9CKSVieIXNHZFzzu
	Go=
X-Google-Smtp-Source: AGHT+IGnWEC7LPDCeLZOt8Q04Q60618nj45/7lP2Z/u5gYGioafnPcRfuvcI2t2vLHYEyaryqTCWsg==
X-Received: by 2002:a05:600c:620c:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47d84b3be47mr225661325e9.32.1768294684053;
        Tue, 13 Jan 2026 00:58:04 -0800 (PST)
Message-ID: <5b00ab27-5ad8-46c0-92fa-a1fa4b65bd99@suse.com>
Date: Tue, 13 Jan 2026 09:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
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
In-Reply-To: <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 18:15, Andrew Cooper wrote:
> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -331,8 +331,20 @@ config REQUIRE_NX
>>  	  was unavailable. However, if enabled, Xen will no longer boot on
>>  	  any CPU which is lacking NX support.
>>  
>> -config UCODE_SCAN_DEFAULT
>> +config MICROCODE_LOADING
>> +	bool "Microcode loading"
>> +	default y
>> +	help
>> +	  Support updating the microcode revision of available CPUs with a newer
>> +	  vendor-provided microcode blob. Microcode updates address some classes of
>> +	  silicon defects. It's a very common delivery mechanism for fixes or
>> +	  workarounds for speculative execution vulnerabilities.
>> +
>> +	  If unsure, say Y.
> 
> Please don't re-iterate the default.  It's a waste.

Well, first of all we should be consistent: Either we always have such a brief
sentence in the help texts of boolean options, or we never have. Who knows -
cleaning this up thoughout the tree may even address some anomalies (where the
sentence and the default setting disagree).

Jan

