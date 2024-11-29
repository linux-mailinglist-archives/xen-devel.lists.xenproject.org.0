Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C494A9DC040
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 09:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845753.1261095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGw55-0003mp-1t; Fri, 29 Nov 2024 08:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845753.1261095; Fri, 29 Nov 2024 08:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGw54-0003km-V3; Fri, 29 Nov 2024 08:10:26 +0000
Received: by outflank-mailman (input) for mailman id 845753;
 Fri, 29 Nov 2024 08:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGw53-0003kX-TQ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 08:10:25 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6197e355-ae29-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 09:10:22 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38241435528so720957f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 00:10:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df15e1e7sm920061f8f.40.2024.11.29.00.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 00:10:21 -0800 (PST)
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
X-Inumbo-ID: 6197e355-ae29-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYxOTdlMzU1LWFlMjktMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODY3ODIyLjc5MjQ0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732867822; x=1733472622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v0DIuT5zuKBgvF/RnFYROoCdsmz0eaqdpfZLuvSiics=;
        b=Iky6fXKFqJQy+eggPkzh0U2HKRH33GLbDfLw4OoYVCr/9y0iOuJ6DfbrRQgWoM/Lzg
         HJJWsD1U8miC3dWxN9TVzmJb5xSRrfW7+8F5fPrPZqkk2ROdYe1hdv2OhLrg5EQfy16J
         j6rKjD1WFVsvbBbFo/F1AFWA3uO+YbL0r/2ZK76hZDQYXMTKt7M9hTczQA2tWqTRFw+g
         lBYz3h2e13WMLakjsJn00U32HD1FbokapRl2vNnz8w0z65wIYcTe0HVTEOI5U/l8eB/T
         t2L2drBftGXuXXq0ejGDLQ9qSwNoPqZjLgH/WOpgdZPXZ5u9UMnrYLLUPMNh9CFaWm0K
         sPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732867822; x=1733472622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0DIuT5zuKBgvF/RnFYROoCdsmz0eaqdpfZLuvSiics=;
        b=dAAsX3SZIFurJw7LFJRoupBZ2zIdPdVOwIoWbD8Z/8XMsyKgcQVe/xlVFuY4Vz2wKv
         0ch9HkltQJu2ERMXYqPegs9tZ6tvY8VbRWTw59kkDdmeR9mmNFcX35j1Hmkw9eygVJiO
         1na+QPhWnLtrIgbAZepDFPIkP4akFIh2SmUubFg+IsuQ3JjsgYtSA+r0dVSzuE8TcuPl
         tspLn7N7+vNFybtR1Xu404GoxSkbNplhsEcn+I6SIgHz56SfwiHkc+jt6aMI58q+vrSa
         ZLAjZrmf/xoiGM8HtL7nM5pUkcRh5IfvAaaDDfxnfbUqhFbswmIVytKFvKeMYSmmSnjP
         tzew==
X-Forwarded-Encrypted: i=1; AJvYcCVLydMUGXZmd4a/fvEY9GLOVKD4lePruC2Tjmx8SUMdu+g12vJyIeK7D0IdXPcqBlgyJt4H+xtIAXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW1wsoVuH+LVNqNy+vxPQIOzi38wio55ABnvufVdgfpcn3ZbiC
	5tgXuUDYUycepmNDg59imbQtXxuuSzkqCrHrcJdS5Pgsct9Zmp8jeQKdtuP/Zw==
X-Gm-Gg: ASbGncuNsxM0pYjHRflf7vr4GBXfroUFW+7gMQz8qYFKEkILmMAFOR3r5UCz/3MIW3g
	OhnwFhVZUHVzQzpMWBTSM4bt6LcTGcO1z2169NCOk6J6Hz1GFQNO3Wcmuc/XbDk3UfOCavhO+W+
	1TRVlXARTIlQBhYt2f/ldi91mgC3Aoew5WOH7nJhXvB904PpWzlkc8/JF7smLME06kDJlLCSR6O
	taLEmdcu4Xe6DYQpMLLujnq14CmtKf7kJoF+xTa6Ng5hzZrg36ErsZfavCkQbXCctQ8A8bcdLcF
	k/L8y3bneiNzfJndgOOvZ/Ey7HikgAwdREM=
X-Google-Smtp-Source: AGHT+IHpeNZ7QLEPzKl3FSrMn4DyR41gBcxhlpgtB+ycw3FhbAykT8eEAl9wCMRyP4KlYViEZdlEFA==
X-Received: by 2002:a5d:47ac:0:b0:382:4aa0:e728 with SMTP id ffacd0b85a97d-385c6eb7af7mr9501431f8f.1.1732867822213;
        Fri, 29 Nov 2024 00:10:22 -0800 (PST)
Message-ID: <00b2e757-30e7-4cea-b4cd-9c48461b4b5b@suse.com>
Date: Fri, 29 Nov 2024 09:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen: build: add support for CFLAGS_REMOVE variable
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-5-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241129014850.2852844-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 02:49, Volodymyr Babchuk wrote:
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -179,7 +179,7 @@ cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
>  # Calculation of flags, first the generic flags, then the arch specific flags,
>  # and last the flags modified for a target or a directory.
>  
> -c_flags = -MMD -MP -MF $(depfile) $(XEN_CFLAGS)
> +c_flags = -MMD -MP -MF $(depfile) $(filter-out $(CFLAGS_REMOVE),$(XEN_CFLAGS))

This looks rather fragile to me. Plus see the comment on the next patch,
where this is actually used.

Jan

