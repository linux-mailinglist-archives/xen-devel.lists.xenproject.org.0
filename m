Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A4C78CAE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168941.1494810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMPJY-0003xJ-Ns; Fri, 21 Nov 2025 11:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168941.1494810; Fri, 21 Nov 2025 11:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMPJY-0003up-KH; Fri, 21 Nov 2025 11:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1168941;
 Fri, 21 Nov 2025 11:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMPJY-0003uj-0r
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 11:28:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32436bac-c6cd-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 12:28:26 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7277324204so323720666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 03:28:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdd5bfsm446433566b.9.2025.11.21.03.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 03:28:25 -0800 (PST)
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
X-Inumbo-ID: 32436bac-c6cd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763724506; x=1764329306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv0Zi5VDAkxyY9bqOBHFYBj7GdsVi+U+4pjwljfGEWU=;
        b=WtWkjCA6XcRyxfeuF+WR/xw/t5sOG6Cqipx6i/E2VZzm6jJcza4dIkWTuOkBFGWNCL
         SyjI80c2dsxRnWEOAxdiIpCnf14h3j4bbaToYCsWnBfg7+GCu3MR/CTCNYM4tgKWQxiR
         ru+L2NIF+XBwuCrtcpbemP/JECTxPyfl9qyW7tw/I9iRqaKV5kKAO8ULXORKbbjd9tPY
         FOeAzjwuXonk6R68DZHuxsmkABabalaFFErcq9OSR6rbDfyGGd7y6eHRsNM39kH/aaFb
         eORAtgBRmLlFOAwZamUKV7r4r66Sqj4na0+ry8DJQa3LeJR9D8L+pLlDBtwx9rnS8V10
         WB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724506; x=1764329306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv0Zi5VDAkxyY9bqOBHFYBj7GdsVi+U+4pjwljfGEWU=;
        b=v9PFNUnWMpeeOE+EnvjJlVmRoomXyArrjlmcx29wl+TxHOPBjr/45n48wYKypZidi7
         J3hrH2xhVtbw23dF5eRy/uVBS8STo/ESTUsXTMQ12Fc2Yc9c5d0r+Pg06XDnibQ+ntRH
         84GeKBEoqEexrSgLkH7+8rqfS4C4XffRLHVVRChH6yGgL0MqXDzQBHcDCFNY8ogzkZ7Z
         z+3teSZKX1pg5kooMoncOtJgLoEN3J8t0mSDUmQgMDyfMKkAQYhAvepgg7ZmVZwrP2gS
         QI1DOuHIAVDxJrcfa4gpZx+NRRnrfTt5P4dulcsmUVJWycpgcJOLp3R00LB4hZe6tfDp
         6Qtg==
X-Forwarded-Encrypted: i=1; AJvYcCXSzwkVYTB9Blf15NCEFMh0Pb/V/lXluIpx/p+2oBf8szDiSg5OiJE5VfHkqrp0ktE7JhonBqGbWGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrUiU7dd1FMqVsSVVfhFpf8D3bcU1CBmnPaEklfTgIvCE2Rwb0
	3ifMNOE06iJOxPdfi4v+PyG7BzXJQu82zsVG+GAjNLpqaa6G9J7Ln+aLQXDJ6iIHjQ==
X-Gm-Gg: ASbGncsEYytRD+nKRaHk37EbPkkd8oDRppu5g6AMNYV1NfiHsJmhcccyPywpoNZGZ+5
	H0OkEzEXcp1U0aBAq8psyUGPBJ7yluiheer/0hEOm9AWFC66gy1D+2H7s3AAuvp0ZBl4G+eXBGv
	FKD74ywuFRekH3MFFxE8lq26R3v5s4BAwzeB0cDDXodCF+CccWoHOGWqxbIQkGC2RPHN8uvffDt
	eSKw1jKcehvRxOPl1nuMCrTSd8/m+cOl9pvT8PgZMb49ARh2mnBG8GaLxyBk/aO/KITmyZHzacw
	3ItJdoY90dmUgkVo6I90NThK9F7k8RjNbOuKsEnuzeXr8qN/pykfqZoUBLSmY78vxPMcMGnv1V5
	PQwMaAwlnLr+ro3du8CjHDgIOToeMy8aRvKApynzoktlsPSwmIHgWhdvoIEckXfX8T5ubFx2MuH
	JlNGyTbrzzqqNglJZbuPJXblhsrANNY4iYf5uztNmO1XqwiuNv2cnlp906lLq3SOquSean/WM5b
	x8=
X-Google-Smtp-Source: AGHT+IHQpQ8fvv02sw8njUq/w+Gu1igspsL9LtkVxefgDnhUfgttTtgPvw0qBtXKuHPfsjapeURYAA==
X-Received: by 2002:a17:907:d28:b0:b73:5131:c45b with SMTP id a640c23a62f3a-b767156938dmr216381166b.22.1763724505708;
        Fri, 21 Nov 2025 03:28:25 -0800 (PST)
Message-ID: <05c8001a-d581-46e9-b261-a1ffbb03fd4e@suse.com>
Date: Fri, 21 Nov 2025 12:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
 <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
 <991e0324-98af-4264-a527-703c72439780@suse.com>
 <aec6b5a2-4e53-411c-be2d-9bdb27d883aa@epam.com>
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
In-Reply-To: <aec6b5a2-4e53-411c-be2d-9bdb27d883aa@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:59, Grygorii Strashko wrote:
> 
> 
> On 17.11.25 11:34, Jan Beulich wrote:
>> On 17.11.2025 10:31, Jan Beulich wrote:
>>> On 14.11.2025 19:01, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Now all libfdt features are built-it unconditionally, but...
>>>>
>>>> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
>>>> nodes, so full libfdt is not needed in this case and minimal, RO
>>>> configuration can be used.
>>>>
>>>> ARM - situation is more complicated:
>>>> 1) ARM reads Host DT (fdt.c RO)
>>>> 2) ARM reads passthrough DT (RO)
>>>> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
>>>> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
>>>> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
>>>> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
>>>
>>> This goes too far, imo.
>>
>> The more that, unless OVERLAY_DTB=y, all code and data moves to .init.*. Is
>> coverage in in .init.* really of as much concern as runtime code/data?
> 
> It is less priority, but still is. Any way it is unnecessary build units (build time) and
> increased binary size.
> 
> 
> Actually, I see interesting behavior - when build with CONFIG_CC_SPLIT_SECTIONS=y (CONFIG_LIVEPATCH=y)
> the libfdt code is not moved in ".init"
> 
> 0xa000027aa10 T fdt_ro_probe_
> 
> 0xa00002c0000 T __init_begin

Hmm, that's a bug, resulting from libfdt/ not using the usual machinery to do the
conversion.

Jan

