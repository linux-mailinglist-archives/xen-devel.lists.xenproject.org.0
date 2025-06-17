Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3EADC720
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 11:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018041.1394958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRT08-0007pD-KQ; Tue, 17 Jun 2025 09:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018041.1394958; Tue, 17 Jun 2025 09:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRT08-0007m6-GV; Tue, 17 Jun 2025 09:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1018041;
 Tue, 17 Jun 2025 09:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRT06-0007XT-VB
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 09:53:06 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd48dcd1-4b60-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 11:53:05 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-453426170b6so15856115e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 02:53:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d88f447sm75509655ad.45.2025.06.17.02.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:53:04 -0700 (PDT)
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
X-Inumbo-ID: dd48dcd1-4b60-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750153984; x=1750758784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/NhOlmMTj9iwnS+Cvnb8YLBqjtPN9tAIt1TSWDHLYYs=;
        b=LlMgiQgKwMQWSXGx2Khe4QszIw0hofn+NFcQSloSGZkd/Zy7bIOTynZylUvYF12dkX
         QLk3a85OnuRWKKoExdeQ7gekcvIm7qy0H7VTSGiDMgDlzalf6anJGnSJiMOu4aeP9+2t
         MDv1G0k7l9gecV2iypbR/sTmiHdRqjwXuWcewrrMc9KtC/FCFxl4XocnmXLstjrzdBGV
         duDOOXhkK0d0IovbY90yBa1l6YKy0Bauz/EPbKaSMZ8F+3fU39iVLhjq1DT/YF+JOBjO
         eibX7ddaQAkWzLGNROhkS+W2od6G6Uh19BfuhTRdlIoFaeIOWbrBn5N/ZXB79ViQY2m5
         zKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153984; x=1750758784;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NhOlmMTj9iwnS+Cvnb8YLBqjtPN9tAIt1TSWDHLYYs=;
        b=NcmA27vzRY4sYNnlRZbIzKkdyG3IRrdDZZ/1WwuWGCDGHNRpAp94aaLcjHpiwHQbG7
         wlHS8fl6TQ2U3b48Yfj93+aqi/8SYZ4LjS9T2EsAR5dg1OeMwnC3+KdxLdr6nDtCSW9r
         cB9s6jBmtcgDW9l+cqrurVVxrw/qYBKXDYtO13nflFnsPja/t8MmiLPL7jW2L9b0ci/Q
         SsLXrRrTzLPHKQH5MdKAElqZwe9GzT5BiWP16NPtQxHM0HcPFvhYbEn1XAvFkJjhh1xV
         dZTieEyG4jxFtvUXF/bxMF42bKI6MoJ13HePovdlputGiyWJUx3iByxiu7DiGuBc/H4n
         7WQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb0hiftd3PjJh0rHmHoZ9ksB8C1Fahx0MOQDE4Y/QsP0S7mlxweN+iIijRJZs8/NaI9uqfWrSnaco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxR8j/pzM1eOK6aNKbZy72D5innjxJxUhswmTY+BSHe3VaAksYA
	7vWWZhmrongEH12+zj+J8Xnq1kD6GHBZnzGP4iI6cwaPSHbDhAFG83mu+15eKXDm6Q==
X-Gm-Gg: ASbGncvfhzvf+kH6CxSGC5SVryQbXBzbWBV2s0rgrlSM0hLwD60nUycDe59EFXCz4Me
	veQ/igFHn6yumrgRHuOAz8cIclW+19zrcjIJ2XXnwTln7STLaGuisFPOT6kY5zEdw2oylI+6y38
	FakoU7hgkHhLC+JlBX7z92EGxeOtLIEudcFvuGeQS69wt8VWQ4oldqm+QffZofyl01nP0bJEfhj
	e3giEBEHErZkVlegJavnevZtAwHFgiNGQW79Ap58ELfGwmzFt55v+1Vg4a9Dys8XVMozCarP8Wv
	rX6ykpbQ2micP18lkfQ3EdXnUYt9dmEMPV2zKB4hggDRlhvF3WWnp7qxBtt+L+hnzAGZ27/5XL/
	K6ezY7Nty7Vldau5Fh5MC1oTd0cvn544vh4tp6ubGEaoGh8o=
X-Google-Smtp-Source: AGHT+IFRwA06Alg15IA790mL6WSzkoRqipFVlCMWuIChPUlFFSN4xuOJXf1GS7jNAa3qtGCpydougg==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a56d837d63mr14136598f8f.23.1750153984507;
        Tue, 17 Jun 2025 02:53:04 -0700 (PDT)
Message-ID: <01ff8001-9233-475d-8b26-6825ba326bde@suse.com>
Date: Tue, 17 Jun 2025 11:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/console: introduce domain_console struct
From: Jan Beulich <jbeulich@suse.com>
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250617012713.57074-1-dmukhin@ford.com>
 <1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com>
Content-Language: en-US
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
In-Reply-To: <1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 11:48, Jan Beulich wrote:
> On 17.06.2025 03:27, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Introduce domain_console for grouping data structures used for integrating
>> domain's diagnostic console with Xen's console driver.
>>
>> Group all pbuf-related data structures under domain_console. Rename the moved
>> fields to plain .buf, .idx and .lock names, since all uses of the fields are
>> touched.
>>
>> Bump the domain console buffer size to the closest power of 2 (256) and
>> rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.
>>
>> Move d->console->buf management under CONFIG_VERBOSE_DEBUG when the
>> HYPERCALL_console_io handler is enabled.
> 
> This, if at all, needs to be a separate change (with its own justification).
> I for one don't think VERBOSE_DEBUG is intended to control any kind of guest
> output.

Hmm, the option's help text indeed says it mixes two unrelated things. Maybe
this wants untangling. With a behavioral change like the one you suggest, that
help text would need updating in any event, though.

Jan

