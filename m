Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E24BF0AAF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 12:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146095.1478567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnTA-0006s2-9I; Mon, 20 Oct 2025 10:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146095.1478567; Mon, 20 Oct 2025 10:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnTA-0006pQ-68; Mon, 20 Oct 2025 10:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1146095;
 Mon, 20 Oct 2025 10:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnT9-0006pK-7S
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 10:50:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 954781e0-ada2-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 12:50:25 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so2133307f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 03:50:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47152959b6dsm135758145e9.7.2025.10.20.03.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 03:50:24 -0700 (PDT)
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
X-Inumbo-ID: 954781e0-ada2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760957424; x=1761562224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpc2NxMxtB3rCj7ZgMzRtPtewSOi2sqGb62WosMYCbg=;
        b=WWWEqMfpYihaoddzGzR84UB+X7KWaqh2mDZWQBHz8QTSCjYhHUf+v3HWeHR9I7GB0m
         IRYLAMbMXKHIB7hrFdhNuDHlgOgprYc15XLykBnUjsVXsYyGc6Diotwh5JY3Ix/7LpcA
         BdsftAFHaYXFu+lAqeBI0yPW/XI+EaNlN+f36yTmHkyFvglZ5V6AAfqs09RoqWDv2rg7
         2JsR6aMYHxhhJyHjZU3xK7Tz0yUf2lvLIq0ZPSpb2jfGBc2eXjP0VG3fcIUm4DP5stw6
         jfk99fTj6SkV0/iHDV8AiHsX2JJiMQxMwWgtw/c5u6mhGb/jwBxwwOBRRLsQ5bzgc8bM
         GQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760957424; x=1761562224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vpc2NxMxtB3rCj7ZgMzRtPtewSOi2sqGb62WosMYCbg=;
        b=MpxRbiaR63ZZCEWYuprWYm75Cz3G/sI4Oqbr7DnJTLuMr1z71SrcTcWGV7OWrrHqF4
         iBonErPJrD5mvt/Vz/p9Pii0DUB3rYbDaNQ+m4RZiFra3cx6TWznYNPxhHypzfVwfgiK
         MlLhvHV3CTY8GEC3K+f0H9s5IUYsLv28ExDJ4V3mN0qn1L5Du1QPDQRBLg7VSDxiplxt
         KphT//x/dphILixSKaTirfx+ZqCx/tTXTIe7fX023TueN7JM4zP4+x1J3Ll/pE7LhEfo
         2m+lqkb80p8wW8GbdbnNTgmWXVVJOWojA0Zhe0RCMsXgsDFcN8fTrMpGFs3zv/3bxa12
         bSRg==
X-Forwarded-Encrypted: i=1; AJvYcCUNCcdyf7NIpuM4albEBeQFXCMLOXZYFMp4oiLTflYG16gPwOak5urKLdbFxFnH1YZ2b4Yagb2Gcwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsqdg2qJd1Xp0B6ELNa3yt3kLnIbjxUGtW5TBjRc3J50HVgsiq
	0H+vAuknoYTdTCvR//CtKvV519z1CRRVW+PjPS5vU7JK0EH4mEZHYRjeCdOmYgMQEA==
X-Gm-Gg: ASbGncv74XyzsCAD9uKFG89GhCqs1OKJdTMKQsm8Ea2Ve56dy4nrmngScFg//xfm8Gl
	DlaOKOCERMYs48aw+70/HbP98oLsGtc3ayCQ/JkPf1K6X+iXyYjCBA0KtqMbgivaYiVm6Djyfv5
	L1drLGIz1H+AISUvcOwJ6GyG5mnOgWKnHjKMjxhLenNrzgI/K/cuFI6nkhEd2ZPWxIE4f/Nsr4G
	hKIPsWah/UEkimQmEdPm5+eefpCJq6PYY6g8ALMXxhrEiCexxs8vxVVv7pIVu6gXyE/LFdSwaxc
	VoEm9mXyjOOEEndMX50dcJMgnuBN5o3eIlO59b65QBEgfuUVfz9AE++Gv6wD/+7KhRTZ8qeuXpC
	GWpTHHPky74BCVyfihueH2mTvwFSmwcU/0pyPHPJbHJBjz8Lot6bZ24c5b86O+qZupcKoAWOwrH
	GvAN/+tEGUb0tRYs+FKWcak1C5lKp6XAhIiC64tLvuMcPZLZy0QtQxivuC6agk8we0PZO+4p2j9
	Cm446qwaQ==
X-Google-Smtp-Source: AGHT+IGGq3EMIeBaXtKS60R9azv/AhQ2nqKrL6o8CBZEDpD++8rP4ID0wl+xY15jjwyAaDXAN/H4QA==
X-Received: by 2002:a05:6000:248a:b0:428:3c9e:472 with SMTP id ffacd0b85a97d-4283c9e0668mr5413786f8f.39.1760957424502;
        Mon, 20 Oct 2025 03:50:24 -0700 (PDT)
Message-ID: <c424b6dd-0d81-4045-b0f4-bfc5fd5873df@suse.com>
Date: Mon, 20 Oct 2025 12:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with
 PCI segments != 0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20251017141434.15205-1-roger.pau@citrix.com>
 <706663d2-61dd-4fb0-b278-d3282dc7b5ca@suse.com> <aPX7zfet83VZm6wq@Mac.lan>
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
In-Reply-To: <aPX7zfet83VZm6wq@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 11:07, Roger Pau Monné wrote:
> On Mon, Oct 20, 2025 at 09:46:42AM +0200, Jan Beulich wrote:
>> On 17.10.2025 16:14, Roger Pau Monne wrote:
>>> Otherwise it's not possible for device models to map IRQs of devices on
>>> segments different than 0.  Keep the same function prototype and pass the
>>> segment in the high 16bits of the bus parameter, like it's done for the
>>> hypercall itself.
>>
>> While easiest, that's an odd interface, though. Should, at the very least the
>> function parameter then be named e.g. "segbus", along the lines of "devfn"?
> 
> I certainly don't mind using segbus instead of plain bus, will adjust
> now.
> 
>>> Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
>>
>> This commit wasn't about tool stack uses of the interfaces at all.
> 
> But there should have been a tools side change somewhere to make use
> of that interface, at the point that support for multi-segment was
> added to Xen?  Otherwise the support feels like half done.

Perhaps. I was after kernel functionality only at that point, and I
would really have liked toolstack folks to have picked up any work
needed there.

> Would you prefer me to use the "Amends:" tag?  Or no tag at all.

Both would be fine with me.

Jan

