Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15BCD4E2C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 08:43:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191935.1511322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXaZv-0004Ml-1Z; Mon, 22 Dec 2025 07:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191935.1511322; Mon, 22 Dec 2025 07:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXaZu-0004Kc-U0; Mon, 22 Dec 2025 07:43:38 +0000
Received: by outflank-mailman (input) for mailman id 1191935;
 Mon, 22 Dec 2025 07:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXaZs-0004KR-SY
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 07:43:36 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb76d9cf-df09-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 08:43:34 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso24689385e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 21 Dec 2025 23:43:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325d10cc48sm10508152f8f.16.2025.12.21.23.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Dec 2025 23:43:33 -0800 (PST)
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
X-Inumbo-ID: eb76d9cf-df09-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766389414; x=1766994214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a6SNnt2aOMZOvd4m1ek+Vk8ndoELmwEFbwsZqrOQp4I=;
        b=Ijz58Hjd2pRWJVa1CL8rycyhodaohrN7b5ZV7KLF/jV30r0Xj8D8bB9VPvHPTyVn9W
         AOx5YaYTT7XuRXA0upUTdkcDfDCdV0AMXRjw+BH7o2ZGL3FlBS7hPCTZ49YLq2y/sV2U
         iUegnFx/YrR+C9MrCQjqTHsK8UppA18i05BXLg25+m05C9DmWKxw8ewZ0erGzTHGl+aV
         4io2wT02eUszMdcm8tnfvgtWD/+uVuBLrHoKfBD/SCqlMJ0Owf/xyN0e1MocLzaGJar5
         rC5KypQU0YNwLSbSsq5IZV4gpvE2n37P9x3ulpQ1+UgkdKNY+kvW8wJpFuzdUjRb0t77
         m3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766389414; x=1766994214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6SNnt2aOMZOvd4m1ek+Vk8ndoELmwEFbwsZqrOQp4I=;
        b=Ulg11JV7LxDy04xblGoSHoHfqwEMlMfX7NtezQAIKPRiEpbfwCblnTvp4ajXSMVI7X
         2cKQ7EJBOHWzkdWR/b5x2ecWSMmatzM1lMkJ9tqe5EPmY+FPStwJbZ7EmbIqc5SBDEDi
         uacbbr5LEMZyqNVF+7ccYtdroO6yxHjsKs+uDslsv41GKr5MChN77QkSmb+A+SHZwEPP
         hMP12SCwoAsBBvgJyUgCJ0YEExwqtVCSj3c2YLTBjPIH8DS4/PKmiEIUwze4wcyPloBF
         v0LQG8hEIeB+HYi+OiMiNNXvrtG4y+om9Ql/bDK59ilF79I5eHw6iQ1WYQgxoshh4GEd
         P7eg==
X-Forwarded-Encrypted: i=1; AJvYcCV5BJEvluLRNjZWD1MOFAik26r/0cVxL4vLBn170LB8pmDlo8VwawhKx93pQRXUCs7f6eejwCaZQ3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy3IVBZek87DGn58PtOOxl8q/ic4LkbPuc6Md83LvYqAuK1lUX
	BcAP64LzB6xki1o5W1iEPy+GbN//oob83yb8b2aTJJ7pyDuAsv52SB0SZEd+2eH+4A==
X-Gm-Gg: AY/fxX4CPG57vvQ9Xbixt3+LibAjWveEUjUGYFpyLeYjRPDPyX/wtsfiiOWzcocNF9i
	uWEf8s7Hcet2WkbzsXur8wpc00cegYP/DGxFqusV3EnDC/JhRR/gvgzwLMlsWzxs6BwhVwgVrAB
	SOiqrolCGQY+6cUmX8hReRrlKt4EXdZCmDqFzUR3difKbyGJjfQdj3KQoL5MFSntm+Rr1rE9SI2
	JipZAB/0xs5Adyol5hQQNVodwnEYs09nY6JUpFatNNNVcuHSG5QfjJ8xvKpzo9y3IpDWGzdjLFY
	h6538mQY7mFOD9OePiA3OOKfy5DGHvVajJUpMAolxOsWy5tI8rQjE1kxU6vajro2XnDoTPNZmO8
	qQStmD3GfNkH1xODYRUkZN0NSXceYWhJB3cc/0LZjltmVLTccs9CQSzoWZ4QNmMWQTr/HH0894h
	Sm8NWU3msJsNBtwBBQzVAMwE5WkxiKJhuFAPJNJwTa5NeuvoRxt21eXo2wpS51xTpbjtdhDxmjr
	FU=
X-Google-Smtp-Source: AGHT+IGONtXXbe8WUOAfxlett703mQBuZWvP6Zng8vKPFmx7z7sYaExy9pYtLetXQnmct9ucXHHtQw==
X-Received: by 2002:a05:600c:458f:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-47d19592a3dmr95608285e9.32.1766389414206;
        Sun, 21 Dec 2025 23:43:34 -0800 (PST)
Message-ID: <440d8453-ff8f-439c-8395-aee30b28e11e@suse.com>
Date: Mon, 22 Dec 2025 08:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <2e42e8ee51badcfa2cb16e3db71fdecaac445bca.1765888425.git.oleksii.kurochko@gmail.com>
 <f5206b63-1f82-4abb-9740-9a0042fbcfb6@suse.com>
 <aac3c5e8-02a8-4463-bba9-d7b5b90c4273@gmail.com>
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
In-Reply-To: <aac3c5e8-02a8-4463-bba9-d7b5b90c4273@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2025 21:34, Oleksii Kurochko wrote:
> On 12/18/25 3:32 PM, Jan Beulich wrote:
>> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/sbi.h
>>> +++ b/xen/arch/riscv/include/asm/sbi.h
>>> @@ -14,6 +14,10 @@
>>>   
>>>   #include <xen/cpumask.h>
>>>   
>>> +#define XEN_SBI_VER_MAJOR 0
>>> +#define XEN_SBI_VER_MINOR 2
>>> +#define XEN_SBI_IMPID 7
>> Are these numbers part of the spec (sorry, lack of a reference makes me wonder,
>> plus if that were the case, I'd kind of expect the names to be SBI_XEN_..., not
>> XEN_SBI_...)?
> 
> XEN_SBI_IMPID is a number defined by the SBI specification:
>    https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-base.adoc#sbi-implementation-ids

I see. For this the name change below is then appropriate; for ...

> XEN_SBI_VER_MAJOR and XEN_SBI_VER_MINOR somehow also is a part of the spec, there is
> no such defines explicitly, but it is real numbers of the SBI version.

... these two I'm unconvinced, otoh: If it is us to control the versions
used here, the present names should imo remain. Brief comments may then
also want adding to clarify the different origin of the numbers.

Jan

