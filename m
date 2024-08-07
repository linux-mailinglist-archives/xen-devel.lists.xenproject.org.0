Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1194A1D3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 09:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773239.1183685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbbEI-0002Xj-7F; Wed, 07 Aug 2024 07:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773239.1183685; Wed, 07 Aug 2024 07:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbbEI-0002Un-3Z; Wed, 07 Aug 2024 07:37:06 +0000
Received: by outflank-mailman (input) for mailman id 773239;
 Wed, 07 Aug 2024 07:37:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbbEH-0002Uh-AV
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 07:37:05 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d76ddf76-548f-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 09:37:04 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5b9d48d1456so548207a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 00:37:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bba48b7310sm393957a12.92.2024.08.07.00.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 00:37:03 -0700 (PDT)
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
X-Inumbo-ID: d76ddf76-548f-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723016224; x=1723621024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4yC/bY4Xzf1y8u5hpA43JNh/VEMcup47Z7FEtIC+Tqc=;
        b=FJu+wsGGThRvg1EyzAWUHbGnLo8I+8Q8gTMZNq9Ng/WU7xrrkekurTE8Gp61ILB9He
         34Bhr8UNeGfB8xfmi0OYFB5QuVpGZm/34SNr2hLKV0RRrVmeMi5LZHUO4Eib+lsI1vuz
         4kCcZTNmBY9Gkvq0TQ7734OG/c2EHIHc0E499sAgZA8ZZufqHwKapu/eeXEv9aD8qkXm
         LOlY1DWArphrryktUuldKJUWitJVRYE3ubyoyKu5kVG/+zTKUnChoz2QXEbsjU9vDvNw
         V/YmLVwJ6K2dRwJM81JoEWbxXfzk9fF3Uvfx9IWYB6XOWYEXlvLLrp0F78SZrnCxw9/u
         ixhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723016224; x=1723621024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yC/bY4Xzf1y8u5hpA43JNh/VEMcup47Z7FEtIC+Tqc=;
        b=Ou0QpJenuIOaFjiYSf4LGA/9OITdQInbHzzZ5h85iggIbGU6YMIQKy8OINydOca3Ii
         r2BCeFhni0JFo7wx5dyKw/stNXMycbHWvhWR+7A5yvkQOOWVtlvheoj2a9Zeh4ZRvd3E
         V2PUplbdm4J10D4gN5SJFAUPaJa/80X/XH67IC8ZKaLweWYt6JcfiLR8evoedCuhp8wz
         4gyict6gOPkTzKTb7FDkU30tJqNnYznL2Frl4lnq64Wzdt3+gj2t1PDpATi5IdxszXQs
         Q8ssatI5jW+7vgE0kSe8t/ml+yTO8rx1/4R255h+0C3oTTTGH9OWoOgnPkioH38SVmN1
         z75Q==
X-Gm-Message-State: AOJu0Yyw657SfZgLh17w0IhR8Bwy2sSeDtNKNq9PD/Z/+OPgRHkf+qgG
	MD8wxRkn6nw9H0NXQER8bnLE7SPJsCdRIxpK822PMym23hqqXFsKrhDTfTSAWQ==
X-Google-Smtp-Source: AGHT+IHA9bxnSQegEa6tpkad+YyBBWmU0uBNI70FsIQnWk4uO00SdLJyJp9saUQqyvMihBsDXPcCIg==
X-Received: by 2002:aa7:d644:0:b0:5b8:4a95:2fe7 with SMTP id 4fb4d7f45d1cf-5bba367771emr999398a12.1.1723016223677;
        Wed, 07 Aug 2024 00:37:03 -0700 (PDT)
Message-ID: <e7908da9-69e0-4be2-8c6f-c339f75c290d@suse.com>
Date: Wed, 7 Aug 2024 09:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl> <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>
 <ZrI_YSBSiC7w5iP6@mail-itl> <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>
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
In-Reply-To: <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2024 17:24, Jürgen Groß wrote:
> On 06.08.24 17:21, Marek Marczykowski-Górecki wrote:
>> On Tue, Aug 06, 2024 at 04:12:32PM +0200, Jürgen Groß wrote:
>>> If possible it would be nice to verify suspend to disk still working, as
>>> the kernel will need to access the ACPI NVS area in this case.
>>
>> That might be harder, as Qubes OS doesn't support suspend to disk, but
>> I'll see if something can be done.
> 
> Thinking about it - can this ever work with Xen?

Not with today's Xen, I don't think. Hence why S4 is filtered out
somewhere. It'll take (perhaps a lot of) extra interaction between
Dom0 and Xen for this to work.

Jan

