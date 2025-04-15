Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DECA89989
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952480.1347910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dDs-0001q6-UF; Tue, 15 Apr 2025 10:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952480.1347910; Tue, 15 Apr 2025 10:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dDs-0001oL-R9; Tue, 15 Apr 2025 10:08:56 +0000
Received: by outflank-mailman (input) for mailman id 952480;
 Tue, 15 Apr 2025 10:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4dDs-0001oF-2k
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:08:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2e8cd1b-19e1-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:08:54 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso51333955e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:08:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445713sm13506574f8f.85.2025.04.15.03.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:08:53 -0700 (PDT)
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
X-Inumbo-ID: a2e8cd1b-19e1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744711733; x=1745316533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xmHX8X/LjWjBg8XOYxVC0gMXzq+dbKWZsKIZNOr7yzo=;
        b=b4lsTSHBxuFiRt1Jelsx3P+z7/ryLUYnM1js0sI5TfPgpn/Ha3rgII+rjJzD/vQx28
         1i6hNvU3TRmgaZef6Tz7xE+O0Z8mh+3j425Fa7IgtCV609SxuLsZQNBN+pg9vLCbcUYI
         jjcXeRDXRXaSgcown28tQysqxtbxhpduq9BkBCU6SqkymmNOlnOqRu7mqN/yepKJc0eO
         MEPxzJuAcCZ6Q9gfVZfYKxnYprab0hDmBKuvyegvO+1V2DIgKBD9eYTTq1sSzyYv09pi
         ywP+UitxFhI7rMGpRCzHkFBzBJ4x65eZvFLv4EsNEJVGezJ4OITGYLRvnhIp3UL2xgm8
         TIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744711733; x=1745316533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmHX8X/LjWjBg8XOYxVC0gMXzq+dbKWZsKIZNOr7yzo=;
        b=rWCQ1KWkw1mbwDgHvAdyEKalYHUbq9rjOuMUSjdZrOgC+Q9XDynl29/hBHhZKLLWCp
         TMkG55SIUw1Tc0brS+bWn4PGumkQt5byITR7An7/7fwCvpRlpCRxQlQNzKYx22lZggKi
         qCEDfjgOnCB/jDgq3vNZSb4cfEgvA4oebygLjT8LXMdRK7HOGtHIjZ4y0qiGng3Xwln6
         MXs/1e/c8f2J3oi18WyOcnr7WatKSd/hiLPD2G77dobej0VTgQ2ijqV9B57Zao74Zgql
         /oI5jQnMAfB6cP4Jv5yEstlpjMGSxNYy/I0ObqJb+Oy7WJSXrEpSMnU+7CPgZzjmQr6C
         ekLQ==
X-Gm-Message-State: AOJu0Yybuiua3jqzBaeNnurO7VmPuFvsEF/uyIqBacyvVmpX3ImQixT5
	5AG5MLUjb9+ujOsCxB+6v0pXMbzKQcvKtgdERVCzvdIzgONbKq1ctLIhxi+ehw==
X-Gm-Gg: ASbGncu3ahtRMWDlaToOWWoCgT0auRhy9kMcVp7dBPQ+xe9G6hUJ1gDoIdVyQwSxfRV
	VnhCZjY7bR7FbWQ23u1TF7rm1VjLbKbq/RgCUFbCGIBnPLXzlr6ePNI5oXGJ6MWlrenLPINXRNX
	yz9GQg8oZ1nPnIABkKDFj075jCVpClP7VRLOxKgqWy/8pKFgewf2d0GMOD8zQI5T8eZcXciiM/r
	BKW+2Xp9jVavecOYzwcVxaCwdJ6XzlWflcVPG9W51h/+7LuNcbIv3/gNVyVUCT7fYJ9si9zyFSs
	kRTjuyeIf7BCBbMS+1WYZb3XTSqtRAbEgPK9r/aNigsHrk9KCrbnQrmEZHPl+xD+1ZIPp7zqAF9
	QbgQQJ3hCt9hBnQ/O4hbMNfH2QA==
X-Google-Smtp-Source: AGHT+IEQh3EyJp/diCWwO9J0Nn5AG4cIp0qUEDmEto6yGu1cy4b3yjRmkkpBf0EISzamdvSdvuql4w==
X-Received: by 2002:a05:6000:2906:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39e9f3dbcc5mr11526561f8f.0.1744711733616;
        Tue, 15 Apr 2025 03:08:53 -0700 (PDT)
Message-ID: <43993568-030f-4182-9346-162d48099b7b@suse.com>
Date: Tue, 15 Apr 2025 12:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com> <Z_4mAAm-gCmZTJub@macbook.lan>
 <PH7PR12MB58546CF210C99C8B835FFC4AE7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB58546CF210C99C8B835FFC4AE7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 12:07, Chen, Jiqian wrote:
> On 2025/4/15 17:25, Roger Pau Monné wrote:
>> On Wed, Apr 09, 2025 at 02:45:22PM +0800, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -745,6 +745,76 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
>>>      return !bar->mem ? -ENOMEM : 0;
>>>  }
>>>  
>>> +/* These capabilities can be exposed to the guest, that vPCI can handle. */
>>> +static const unsigned int guest_supported_caps[] = {
>>> +    PCI_CAP_ID_MSI,
>>> +    PCI_CAP_ID_MSIX,
>>> +};
>>
>> Is there a reason this needs to be defined outside of the function
>> scope?  So far it's only used by vpci_init_capability_list().
> Because, for dom0 I don't need to pass this array, so I need to set below parameter "caps" to be NULL or guest_supported_caps according to the type of domain.
> If inside the function, I can't to do that since "caps" is const, I think.

Why would the more narrow scope of the array affect how it can be used?

Jan

