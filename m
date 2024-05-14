Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB8A8C4C8B
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721139.1124275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mAt-0007Fy-I4; Tue, 14 May 2024 07:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721139.1124275; Tue, 14 May 2024 07:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mAt-0007D9-F0; Tue, 14 May 2024 07:02:11 +0000
Received: by outflank-mailman (input) for mailman id 721139;
 Tue, 14 May 2024 07:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6mAs-0007D3-4x
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:02:10 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1325311-11bf-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:02:08 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso1016672366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:02:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b015ecsm694054966b.177.2024.05.14.00.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 00:02:07 -0700 (PDT)
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
X-Inumbo-ID: e1325311-11bf-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715670128; x=1716274928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQRhkDVX1LcDamhTiLZZoZLv/dajDYSw/6ksfLUt5MI=;
        b=PAJtZHtb9Mf7vIRoi45vzixKheWLfZXWyRje4aPjieDP0WvrKyAMPeO69FMIts6cna
         CbIlhklFLLmaKHn3KgbW4bkw2rncok7OhTCzVURbng/dSCdpymJZVd0UO46eBlA4ifOY
         XOcBtzXk0FpN7PaDiqm0GxDPRNYaCuELF0WqrPeL2H4uusvDndx2N+SVoA/5pXH8+F6t
         VXdDFgWKzEqt7KTLFEjdbw/HhJZVG98FNNdZOQAqltrI2OeB287N1hG2Ng+p/QWl3IKI
         6cZIL1f194To6ChRal56OMgarvEflWxUuzF/qgFumerWEHnHo/HwFr950g0HiNhmTO/E
         u8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670128; x=1716274928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQRhkDVX1LcDamhTiLZZoZLv/dajDYSw/6ksfLUt5MI=;
        b=cuuZ7yG7IfrvwAsbWR9E/eOLLmLWIpXZ5wPYhDlAvAzTuPEkAzlhW2cJqpZY5olUhk
         uAy30aXvj68imoLrmN6YD8mYO1br0BsURBQIW8ujQzLnhsYXDrwdMndZUEsIj4dK07nh
         ulZhHlZZObtrqnlR4eauhebJncnvTWSG5j682TXzXpA0iuUtmzVXgQ1v/xBuJ2nDvycl
         GTbtL/fXKWqgXrsjX8yDmFk9ujkJNvFbQiQnKcnCekwh993LQGamkSoV6ZXAJ/TeEYWH
         qIUFSRjrLL4sEDBLBC9bHOp6YuYjuk/ozLFPcC20QOTSTGk/VUIft4pUSspXmlo/w0qF
         yMpA==
X-Forwarded-Encrypted: i=1; AJvYcCVAQeTZ/cdUFHGRWrRHlsSMa2AcY2U2OYaSS5v71K567wf7WyLVah6OoyWyZ/iixChFHh22rHaka0l/uxNVp3uQ5zC7zfOKa/P9ZdA7zp0=
X-Gm-Message-State: AOJu0YxnDbxq2USAh4mApBEW5Ohtb6cjMPGot+3/xK7sfTZqeI6XmPut
	kB2o+nHJ1Aj0NQr/eLDUFXCZbn/5RrzSD3mdm1k7eqIm52UDXP18RIQDVyV6qQ==
X-Google-Smtp-Source: AGHT+IEaG8aj9u+XjBcmid97Z0/lXiRG1Quzk59GzpwLWNNZl2T9uLpkqdu9QGXYOcc9yLEu3U/j5w==
X-Received: by 2002:a17:906:30c7:b0:a59:a431:a8ce with SMTP id a640c23a62f3a-a5a2d55a7c3mr823465866b.2.1715670128172;
        Tue, 14 May 2024 00:02:08 -0700 (PDT)
Message-ID: <79ff7ec2-e4d4-4407-a5a1-98027c0a8c97@suse.com>
Date: Tue, 14 May 2024 09:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/13] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-5-carlo.nonato@minervasys.tech>
 <8fbd50df-6c9a-4177-8001-39c0f15e715e@suse.com>
 <CAG+AhRX3oUiGxwYphQDcKo_W+4V3kzMoDh_NVGQcCBXxYT0YAg@mail.gmail.com>
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
In-Reply-To: <CAG+AhRX3oUiGxwYphQDcKo_W+4V3kzMoDh_NVGQcCBXxYT0YAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 17:53, Carlo Nonato wrote:
> Hi Jan,
> 
> On Mon, May 6, 2024 at 2:01 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.05.2024 18:55, Carlo Nonato wrote:
>>> Add a command line parameter to allow the user to set the coloring
>>> configuration for Dom0.
>>> A common configuration syntax for cache colors is introduced and
>>> documented.
>>> Take the opportunity to also add:
>>>  - default configuration notion.
>>>  - function to check well-formed configurations.
>>>
>>> Direct mapping Dom0 isn't possible when coloring is enabled, so
>>> CDF_directmap flag is removed when creating it.
>>>
>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit ...
>>
>>> v8:
>>> - added bound check on dom0_num_colors
>>> - default colors array set just once
>>> v7:
>>> - parse_color_config() doesn't accept leading/trailing commas anymore
>>> - removed alloc_colors() helper
>>> v6:
>>> - moved domain_llc_coloring_free() in this patch
>>
>> ... I'm having trouble seeing why this was done: Dom0 isn't ever cleaned up
>> after, is it?
> 
> domain_destroy() is never called for dom0, right?

Indeed, with perhaps the exception of late hwdom (assuming that feature hasn't
bit-rotted).

Jan

> If so, yes this is wrongly placed here.
> 
> Thanks.
> 
>> Jan


