Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB488D5CB9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733446.1139702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxfX-00051X-M8; Fri, 31 May 2024 08:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733446.1139702; Fri, 31 May 2024 08:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxfX-0004zV-It; Fri, 31 May 2024 08:31:23 +0000
Received: by outflank-mailman (input) for mailman id 733446;
 Fri, 31 May 2024 08:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCxfW-0004zP-JR
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:31:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2811b04e-1f28-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 10:31:20 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so2049117a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 01:31:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31b9919asm752375a12.8.2024.05.31.01.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 01:31:19 -0700 (PDT)
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
X-Inumbo-ID: 2811b04e-1f28-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717144280; x=1717749080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YcLzLE4Z3E7kIRjSBw2I5srCpX7gYlmZMZ7dNTS8rFo=;
        b=L0RY7sKeizT+jTGQUVgNIf5czWI1Y7X7Ei6HPrPXoMp8hgmzVPHu2xYwAmcJd2cELn
         9Sbfr/OpCljxBq/1AtUA1hEy4+KDEDI5ADRot8BZNRa4R2RNHW2hhJl6t2Eg7Gkkm2YC
         K111SrbGIgkyCUME7CSVkwbnLNDg3nJn2CHRBkjYUxvtsbIoa6/SnjczAdZZAKBmsZKN
         HjZZTtQaUrJd7sKq6PnBiZUI+qTR/I53zeKAUX/j62/dRvKbLbOZRDx/mgM1X2ozfma/
         ojR8N+Id5GDyb1U07rX+WZKwxvRh/cZIerdUg2RPOx8S6HX5h0JdmzhvlFdnZi9vLF17
         8IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144280; x=1717749080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcLzLE4Z3E7kIRjSBw2I5srCpX7gYlmZMZ7dNTS8rFo=;
        b=fzRoGKxIvMeVnkOZXr9kB9ToBuactIULVTGVn24aFqgZg/dttzPY+2UU8Am/j8DVo3
         JdQj6f2/QguP/3YFUnN0Y33niKU/fs0CJydP07y6/aUhc5asrOYoagHAnYDzjjogu08c
         U6GbNVDFoXSBuapj3lXv5RiPFJ3xclnybzaSqNxWvQmGA2WjwLkHTkS8f/jgAEy1AXnN
         3I3b11+XdjvRN0TCBpZD7//RksG/TJSkhVB0csDXwDxvuA4dVHRNzhMlkQ/IINjvWbLZ
         tn8Le1OSTRX5FmUsN9KALUwp0cfaOlVmJpUiuB88uLnVlD7yZ+Mp9u1cqvnPiSNPmaJI
         uxWw==
X-Forwarded-Encrypted: i=1; AJvYcCXBHEW3xCu1MqY8rQyscnx/RPowPTTDSbFJYr3si2vengE8zNJuMur1g7OnlcESv0bRXZb4NpMILwf9EsO2o7XxDNNNkXTWde5in/0vdDg=
X-Gm-Message-State: AOJu0Yxfgrpo6ndhAOomzfwmwppKdSDoPcnSIDzingzQn74nxrTxLYXa
	gO2oZ7p4GD9QasWaiGPg/wNMU2ssAJLOJrJvokY7gyfRTRFHWrzzqU345ESXQA==
X-Google-Smtp-Source: AGHT+IGe1H042Qk81yAjhw0hO6pCk0VdNukNepwUtcnMubcwkZgxMNZMfV8M3GTOX6KYJGCGONHtnw==
X-Received: by 2002:a50:f687:0:b0:57a:2e7c:1d88 with SMTP id 4fb4d7f45d1cf-57a3638fb05mr916867a12.20.1717144279894;
        Fri, 31 May 2024 01:31:19 -0700 (PDT)
Message-ID: <e9e11f6c-5da0-4121-b716-041fcda9d3b2@suse.com>
Date: Fri, 31 May 2024 10:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 13/15] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
 <376d2e89-da6d-49c2-90aa-aab4af6eb0d1@suse.com>
 <a38ac7e4-cf47-40a4-b76c-6752237b1ccc@epam.com>
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
In-Reply-To: <a38ac7e4-cf47-40a4-b76c-6752237b1ccc@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2024 10:05, Sergiy Kibrik wrote:
> 16.05.24 15:11, Jan Beulich:
>> On 15.05.2024 11:24, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/hvm/emulate.c
>>> +++ b/xen/arch/x86/hvm/emulate.c
>>> @@ -2667,7 +2667,9 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>>>           break;
>>>   
>>>       case VIO_mmio_completion:
>>> +#ifdef CONFIG_VMX
>>>       case VIO_realmode_completion:
>>> +#endif
>>>           BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
>>>           hvio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
>>>           memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_bytes);
>>
>> This change doesn't buy us anything, does it?
> 
> why not? Code won't compile w/o it.
> Or do you mean hiding the whole VIO_realmode_completion enum under 
> CONFIG_VMX wasn't really useful?

That's what I meant, by implication. To me it's extra #ifdef-ary without
real gain.

Jan

