Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD416A0AFF0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 08:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870430.1281620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXEhR-00059c-Kx; Mon, 13 Jan 2025 07:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870430.1281620; Mon, 13 Jan 2025 07:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXEhR-00057L-Hp; Mon, 13 Jan 2025 07:17:25 +0000
Received: by outflank-mailman (input) for mailman id 870430;
 Mon, 13 Jan 2025 07:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXEhQ-00057F-Mx
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 07:17:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e9f98b9-d17e-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 08:17:22 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso1656282f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jan 2025 23:17:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e384054sm11457941f8f.36.2025.01.12.23.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jan 2025 23:17:21 -0800 (PST)
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
X-Inumbo-ID: 6e9f98b9-d17e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736752642; x=1737357442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kzJR6nhn29MJlodNa0cV+GZpT2J7q/F8tz7co/MTkfU=;
        b=WuFK1CK/GcZXXgMIRY1eWMtXgag8txAXiQM/NL0wgJTNbIAn4YAmos1lJ8K6KoFene
         xjI0+DfbDvaz808CI75Pj8I6ctFpsff9plcTMbg8ZK6ENocDSEG/dGGN2qD8hInTOxdd
         EF7cQ4V70V/5nY+KSuYi36Ih5BuILdFwIrwcctthibdF84+t/wIzPHxmf97zT9VC5YWf
         s2KZ++DdjgxifjpoyAwkdVHi1LAGDMIATuOA2C14k7BRmDHxfaxBEiToezpyKPjnmN4X
         oKpdNXtDXIDQS2V52BPBYL7YTFYVsZTrJn3lk2CmBxM5DliucjG7x6IQ3VL7ZJNuR3fl
         8GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736752642; x=1737357442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzJR6nhn29MJlodNa0cV+GZpT2J7q/F8tz7co/MTkfU=;
        b=TaoOdqykY1BxBas7R0gnzUrFOR7iYhW8367K0fw8SgZGlY72AeaaURuTymwS/JPLH/
         nrziiRdYyY9psPT4p9iOF3ieqjQ3R4Tn5jlzjq+jqBzmrSRbcvDMhQa554HfF/GNHsJe
         E541KHzPi7MfKy+Li8KRmlQi3GGC09Z/p8XR02h8eLbbcNnoDWFtQQvjXAusNGcJG5qs
         WLhEgtCesBnGZ2tgD5Csv2fj4GngcHo6/yCEQxR/bEbSz9HPWDDv9581XCrZ3eyx57xs
         6NgHYBGbUv54XforNxshATo+2PMo5gwW6bCOaYZnX9WRWMC3A8hu252PwbZmr2iOA6QQ
         yC/A==
X-Forwarded-Encrypted: i=1; AJvYcCWY5hopuSpZZHjOdI36KdIF8kAHUd/1vnBjNxMerTDj8XFdiRU9Is11gHea+PRXV4FXJQfqIuc0/bQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOqr1+dZeZcJvx0Yo1xHFCpwwShJIbusHRtviv/cHyPswKsJ4y
	b+nyaGOlKU8hqccFJCWh5f62vZNsClLBbzk+9JB2ZTSRKn+BPbvXleMqmxb8lg==
X-Gm-Gg: ASbGncsdHDvWqLZdVgKzkNg2ZAb7zNegfW+wlE7FTScbiq+m4hnoNzeviAi4OYWB2yK
	37oFh0pFOyYuVWMWB339mffAvjATleqzNMwHgQdc9nFnuHXXOLFemvjq880G3UPRttZiVfHN3F7
	gJOcBfQWpGZ5uGw0R538uhUfanU2srIzYVLNm1GHvUB5o/zJPDpH52BiN9ACAa6pgj4wTMTxIFz
	Wy1a4CW+cAj0wdSjAoP1M/Mar18+njzinnZkbQL32KCJfueFKMfNtpTWD+Mh2OKJFpXynQqmdxz
	iRz8fPRp/pXw5WwbHHlRFw62Hv4DpFenDzKOOr4sgg==
X-Google-Smtp-Source: AGHT+IEUtbDUyyxuiOe+vuQj6C+0PynMRMmjKBuA9gCbsMAb4ks3o3iel8VcQZlh+TPki2Q8kE5shw==
X-Received: by 2002:a5d:47a6:0:b0:385:f195:2a8 with SMTP id ffacd0b85a97d-38a87312734mr16348956f8f.30.1736752642022;
        Sun, 12 Jan 2025 23:17:22 -0800 (PST)
Message-ID: <28ad828a-0a9a-4637-bf55-59de2f731537@suse.com>
Date: Mon, 13 Jan 2025 08:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/pci: do not register devices outside of PCI
 segment scope
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250110140152.27624-1-roger.pau@citrix.com>
 <20250110140152.27624-2-roger.pau@citrix.com>
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
In-Reply-To: <20250110140152.27624-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 15:01, Roger Pau Monne wrote:
> The PCI segment value is limited to 16 bits, however there are buses like VMD
> that fake being part of the PCI topology by adding segment with a number
> outside the scope of the PCI firmware specification range (>= 0x10000). The
> MCFG ACPI Table "PCI Segment Group Number" field is defined as having a 16 bit
> width.
> 
> Attempting to register or manage those devices with Xen would result in errors
> at best, or overlaps with existing devices living on the truncated equivalent
> segment values.
> 
> Skip notifying Xen about those devices.

Hmm, is simply omitting the notification really all it takes? How would Xen
manage MSI / MSI-X, for example, without knowing of the device? As per the
BoF on the summit in Prague(?), I continue to think we need partial driver
logic in Xen for VMD ...

Jan

