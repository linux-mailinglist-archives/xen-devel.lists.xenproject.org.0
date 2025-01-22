Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D989A19277
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 14:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875947.1286348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taanR-0001TL-Gt; Wed, 22 Jan 2025 13:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875947.1286348; Wed, 22 Jan 2025 13:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taanR-0001R6-Dt; Wed, 22 Jan 2025 13:29:29 +0000
Received: by outflank-mailman (input) for mailman id 875947;
 Wed, 22 Jan 2025 13:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taanP-0001Qy-K8
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 13:29:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e699612c-d8c4-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 14:29:26 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so5721873f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 05:29:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e19fsm16691124f8f.93.2025.01.22.05.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 05:29:25 -0800 (PST)
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
X-Inumbo-ID: e699612c-d8c4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737552566; x=1738157366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bZidTBZU8G0XrlYEVd9UJVLcI4BEzSu2qbiRpOHgj7U=;
        b=Txk19CrBEWfs++qu6PZefwSdSNC2YpxvmWoyHA4m9873OZaIx8WdAo9BIR0+GbT7GD
         cPqYJFNu/XG3V9iI5eN01jdyTlKmiX3MYM5qt6tGavzxZZ8svIpCsTaBLArt6ut6V+oS
         E/F5NMHfehE7bxr/D72uAYkV1ONlHvvPEtYH2Fz5HTPQ3OJ1peTwkO7K8wgIgOj7lEma
         WeBVySdnQIFFeHkOeIt2E0/4tJK6UbDNiTo7DpAiN0zgICf1Yb3uwnQSzVnhVbrtpDJo
         mGmBRDVOkMI0sKyJ64Qvjr1tPjFepcZ7gKVGHkImGzJ+bjpcJTMSBPps4nx+cj/eR9T3
         YTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552566; x=1738157366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZidTBZU8G0XrlYEVd9UJVLcI4BEzSu2qbiRpOHgj7U=;
        b=f9IJzBDf4xyLuaEzMeSiiB5YBfQY/omnXVoNWuz3ygfwKQz9dWw6iFEi6NQMy+i5wM
         uN6L3kWg+24Zj8g1NL84d4JTIF1xOF6QOfXFVKWU9AQoWt4MSoB2mpPWe4HJBTYoVNY4
         bW1iTD66BLLSgarTV5mcmMey5ei/ELfUI10ZH3bSq05lvJJZQTmxTUY2bmt/JSNlZSN9
         BtNn8t2A97rAjSAjLiMS9g2Dff8Ck4idPO/IYlgpgdMusiPzn67bVS3X3ZRIigfiNZ9j
         xDXoI7Q+hAY2nqSMhEKGtEB9o13CLrS6LWijpv/qxVFj4w/wETvg0TXKuyEKR170WUzW
         NG0w==
X-Gm-Message-State: AOJu0Yw35XdAdeyCvb2CFhbzywxs/KeY7wXwI+M+iNY6XjADPmD7eGyh
	rsIjW7PxrtNu+WvlFDHIaq+D8oU721fn0aUsMPys6Rh8R6GxOIdm3qqukl+4xWKuxbYW8kCzJXk
	=
X-Gm-Gg: ASbGnct4ZbML+3Flgm04XZwJQtyN2lVQiSeW1kkyx/o+t2ftQX9iulKoiwk7qXClcaR
	2iYWBar0YXc71pXrZBZGEbA4QXRoUxkPiFNIzfmNrOkmmLzr6V6fmn59eUZzLhnBuajRpSc71Rc
	pkflOtgngIijAUCaakJhIRyPQ7DMmFzqIXQ4q1ACwRGvCRxH/PbkVLjH9o1uvAEdu2w7dq3b1xb
	KrAQHTdezmkdGM/cmcMIQ32dACVC3IB2UdrLtEiKhByQnd9GgfArYQz0A2bSHQzubOXqoZvQ7Fr
	2iQUWBaAO0iWpIYccjRV4j/fstibeAQQMJbIljA2PM708AkZofWR0ps=
X-Google-Smtp-Source: AGHT+IGtdiiTBfcSWw/hEj+lngLNZdJ567IYrB9FkzcsF+IgDygSe3xSLKaiJ6te3CPFk6KVC0Ra1Q==
X-Received: by 2002:a05:6000:1ace:b0:386:1cd3:8a07 with SMTP id ffacd0b85a97d-38bf5678239mr18260014f8f.7.1737552566141;
        Wed, 22 Jan 2025 05:29:26 -0800 (PST)
Message-ID: <24885d31-e536-4ff4-8457-300c9a028701@suse.com>
Date: Wed, 22 Jan 2025 14:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2e81cf29-65fd-74fc-db4f-95c453acc327@suse.com>
 <Z5DHOknjrhMoAGz6@macbook.local>
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
In-Reply-To: <Z5DHOknjrhMoAGz6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.01.2025 11:23, Roger Pau Monné wrote:
> On Fri, Aug 04, 2023 at 07:58:21AM +0200, Jan Beulich wrote:
>> In an entirely different context I came across Linux commit 428e3d08574b
>> ("KVM: x86: Fix zero iterations REP-string"), which points out that
>> we're still doing things wrong: For one, there's no zero-extension at
>> all on AMD. And then while RCX is zero-extended from 32 bits uniformly
>> for all string instructions on newer hardware, RSI/RDI are only for MOVS
>> and STOS on the systems I have access to. (On an old family 0xf system
>> I've further found that for REP LODS even RCX is not zero-extended.)
>>
>> Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. I'm uncertain though whether with concerns Andrew had voiced (maybe
just on irc/Matrix) I may go ahead and commit this. Andrew?

In any event - Oleksii, I guess I'd need a release ack here (or an indication
to defer to 4.21).

>> ---
>> Partly RFC for none of this being documented anywhere (and it partly
>> being model specific); inquiry pending.
> 
> Did you get any reply on this?

No, and to be honest I also didn't have much hope I would get any reply.

Jan

