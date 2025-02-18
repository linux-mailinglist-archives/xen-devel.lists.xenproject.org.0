Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F5A39B10
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891335.1300391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLsQ-0006Nf-BZ; Tue, 18 Feb 2025 11:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891335.1300391; Tue, 18 Feb 2025 11:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLsQ-0006Ka-8p; Tue, 18 Feb 2025 11:34:58 +0000
Received: by outflank-mailman (input) for mailman id 891335;
 Tue, 18 Feb 2025 11:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkLsP-0006KU-HG
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:34:57 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60afdb1e-edec-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:34:56 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abb8045c3f3so335261566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:34:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322c4sm1035650866b.34.2025.02.18.03.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 03:34:55 -0800 (PST)
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
X-Inumbo-ID: 60afdb1e-edec-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739878496; x=1740483296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hjzPyrQnEre1fJYBS9Z6oTK5PdCU4+7FXAVYb+mTDRI=;
        b=SqGF7CF5mxpZWfGjPu2AVpDgTCVJfU/37t0ufhyxZ6QNWQ0cNa4gB98jEVtH5JYIl5
         StCBfDA4yOROJLze7ZNFN0Ukj719wNgNPJcgMPae3ukX5y5ZjjVNKM4vrdRec9cXb16i
         CkUxHkV1s14ui7mynueuHkERnFok8R8fHySwSgoOFIDjomC9tPDnSK1qnEEJrLxhEjaT
         aUx+H8ybL3gJK+T2Y4t+npDziIr/ux/h2iYjhui3CrnO/L+8nEN6FNZRdBZN2ELywhUT
         Yp5GvuuILzGRpjGvm5jds93ITHLtjNBSH9xMJOTj0WZAo5WbBS/w+TMAe6zuZ+Mv4c/r
         4g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878496; x=1740483296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjzPyrQnEre1fJYBS9Z6oTK5PdCU4+7FXAVYb+mTDRI=;
        b=Syn0rdLjFW6p+d1GnBcQWruxaIcG8QLNEJjOcNy7ig7bjL8MEGUle+eB2yyJTaNXMo
         zLmWjIyKuEWwTJe7vFrxQiCsp/JnW54yeutspqHjQP2bitQIr/XI2nsop4nhHwint+n4
         7L0K9666WvN5v5vh8H7IxhXrbBneqCFZVl0GW/OKtEKgqRdDLrJi1+hQHsjUFFOhBTZJ
         rNGX4faISP3ukdTHM9waVJ9HuBkql9GQvIzrjGqyoAbUypUFxCDGqi2WxRmUsDuzhenf
         xpEeGmBe/xcRW7EcYs7fea5rOTjYoClWQmQjkmATOsBy/tZHgPeMVofKzxQDMgl5s3fG
         LFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuAAFI4pZ/RsZz784U8ytJWwlMwfac1KI+3vExAiatJrnTeTKh0VAGQk6byGSMNcnEOonkWaG+KfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpNnvBuE7XBMG2x9rraNTvRlyy6Xr1ob8z4uSgYsHNb0ZG+upA
	vSQuFvXjXwtphVyJY9Xp6h73XAHzqIQKdqOk8QxVTeK2ttVrLN/V1HjGX9qbIQ==
X-Gm-Gg: ASbGncvNdUggh0zT5QFl0MfAijwV9Ap3p4dzcx2UmcbJ7dPNBBFTrIr6xPuWGUqIacH
	A4WlhvxeVTktLr07sTcT4/cd1CqwWDV/Ipl1XTS9hZHAF2YLEnYxZfR/3ncCgbK3LTZVXUqTEIE
	mb4XbWn77eXws/H+H1QBY0g5z/S++eEDul5n95Ssr8srFaov77jO7VdiuZODsXClem4qZ2WWpo+
	d86Xvb9SOs/Bn2qDzq1W8Z4KDHG/DxICVhH8BLCZ+Ymq55V54e0E1vvxjZZEovZJbgyz1as+wJp
	7KBk0kJObL/WxBx0YnSFfcauf+shAL6xRo6ZlpwQsGVLwQh0STAyxCvlO9yVsZKkP/45fsuMgL3
	V
X-Google-Smtp-Source: AGHT+IEbPS8WYWzuEAJgnFH6HST7uZU8STuffNgyuMfozpQqR2QvKBjv8+isZpEx4p/gN2SsHaeFMw==
X-Received: by 2002:a17:907:9709:b0:ab7:83c2:bdb1 with SMTP id a640c23a62f3a-abb70ddc2cfmr1285322766b.44.1739878495971;
        Tue, 18 Feb 2025 03:34:55 -0800 (PST)
Message-ID: <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
Date: Tue, 18 Feb 2025 12:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>, Artem_Mygaiev@epam.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 03:36, Stefano Stabellini wrote:
> On Mon, 17 Feb 2025, Jan Beulich wrote:
>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>> 1. Const string arrays reformatting
>>> In case the length of items change we might need to introduce a bigger
>>> change wrt new formatting of unaffected lines
>>> ==============================================================================
>>>
>>> --- a/xen/drivers/acpi/tables.c
>>> +++ b/xen/drivers/acpi/tables.c
>>> @@ -38,10 +38,10 @@
>>> -static const char *__initdata
>>> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
>>> -static const char *__initdata
>>> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
>>> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
>>> +                                                            "res", "low" };
>>> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
>>>
>>> --- a/xen/drivers/acpi/utilities/utglobal.c
>>> +++ b/xen/drivers/acpi/utilities/utglobal.c
>>>  static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
>>> -	"SystemMemory",
>>> -	"SystemIO",
>>> -	"PCI_Config",
>>> -	"EmbeddedControl",
>>> -	"SMBus",
>>> -	"CMOS",
>>> -	"PCIBARTarget",
>>> -	"DataTable"
>>> +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
>>> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>>>  };
>>
>> Why in the world would a tool need to touch anything like the two examples
>> above? My take is that the code is worse readability-wise afterwards.
> 
> I think the output is acceptable: not necessarily better than before,
> but also not significantly worse.

Hmm, for the change to xen/drivers/acpi/tables.c I wouldn't agree with this
statement. And for xen/drivers/acpi/utilities/utglobal.c remember that this
is code taken from ACPI CA, which we may better not re-format.

> To me, the main takeaway is that there
> are many unavoidable but unnecessary changes.

Interesting. I'd say it slightly differently: The main takeaway is that
there are many avoidable / unnecessary changes.

Jan

