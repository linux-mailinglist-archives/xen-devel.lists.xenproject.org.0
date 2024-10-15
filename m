Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF9099E9EA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 14:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819145.1232400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0gj3-0002Nl-3V; Tue, 15 Oct 2024 12:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819145.1232400; Tue, 15 Oct 2024 12:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0gj3-0002MG-0P; Tue, 15 Oct 2024 12:32:33 +0000
Received: by outflank-mailman (input) for mailman id 819145;
 Tue, 15 Oct 2024 12:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0gj2-0002MA-3E
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 12:32:32 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bbaa088-8af1-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 14:32:30 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so6200934e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 05:32:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6b1e9esm16631475e9.37.2024.10.15.05.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 05:32:29 -0700 (PDT)
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
X-Inumbo-ID: 8bbaa088-8af1-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728995550; x=1729600350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vS+LjnbTt/mPlMKrOUwqveZiLjjuHdKnLgW4MTNUxcE=;
        b=fhoFAa8oQ92otEqjJoDtOJWR015dWkb24AncJaOrt9tXbgbDu5NaYhyzX+wpueKAqe
         uN6CyD4WwxHP/CJLCAicThd8fQY0nr+CV1U9Kg7AucrZOYOLUE2DqU/yALFqJiqVdvDw
         01YhIkcvIYxreTl/hXaYmIhN0r/hJrcMvb7kpevSMQxmpDyTQBoopyI1duSw6+aOt3fu
         K9qJYrb7oi3wNRkeecwI+XXUMuZ6Ub2v4pB6WH8JiH1S4t4ZWVQloWe3w+ipm5nVpqrP
         uiH85n1dP7DL0STKZtfzHyRDYaQ35k/qQbQJ+b82bbtDDl5p/VwvZvmWYg7I8OExXCE1
         sz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995550; x=1729600350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS+LjnbTt/mPlMKrOUwqveZiLjjuHdKnLgW4MTNUxcE=;
        b=keNXx4cMQX7Gk5mHDbc/5dgE5baMHEu9/ogPzdsbRRtGytd1rN2rItDCc27m4Jrp+e
         /U140NnPyN8zcX3HDseOwx+kZ6n0qlTqo0viSX37FcoWzOp9YCyGbKtnPyQAostGrh7p
         iG/gNsk+QnSQ23QSI4lZ4Z+QlPzDSml3t6dENOxH9+ZG6irD0ThUnXqhzFTXAMg1Qe1U
         D/LkrPsvsNv+oiOQyOr0IOliI2bKv15avlNd3qyWww4dXxMai0GGM6XhllBdGZE5Pur1
         u2JhQCKlw0MQXB4RyprH2fsa8bvE1YoF6I76kb0A0KuUIJ/Z6DlQ/8m1l8VzGMM4bu00
         372w==
X-Forwarded-Encrypted: i=1; AJvYcCXFtSD1KO/KTTLO/ktmvLQl5e66sjnPvz7MjMWS8MSwxJOxgn6nxzWgFDx+eIQwLTirr/MiOYsq2O4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxukS6Ai70crL57FOsDSCzWE6Ko3rwPeO7xUAkuq4+v+CLNGJpu
	9FSuJLG7rpdjs56EI3ARQ+8iiyr5+cL7+oPrbsQTN+rWDJ6QIMOOkI5d+D2B2A==
X-Google-Smtp-Source: AGHT+IFVqS4dgsBaUnz6JIPj4GjS3rNLkLSub2/25TIuk3BWZXfT70lWjAvRMTt0vKUcyS+tRwsS9Q==
X-Received: by 2002:a05:6512:ad5:b0:52e:f2a6:8e1a with SMTP id 2adb3069b0e04-53a03f2d678mr177739e87.29.1728995550183;
        Tue, 15 Oct 2024 05:32:30 -0700 (PDT)
Message-ID: <9ff389f6-874b-4bb1-8685-d1e0e2281c59@suse.com>
Date: Tue, 15 Oct 2024 14:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
 <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
 <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
 <fce8372ee3bac4a0a3c6de58d7c7757df6e6d0a3.camel@gmail.com>
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
In-Reply-To: <fce8372ee3bac4a0a3c6de58d7c7757df6e6d0a3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.10.2024 11:11, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-10-15 at 08:33 +0200, Jan Beulich wrote:
>> On 10.10.2024 17:30, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long
>>> bootcpu_id,
>>>                            _end - _start, false) )
>>>          panic("Failed to add BOOTMOD_XEN\n");
>>>  
>>> +    BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_addr));
>>
>> We generally aim at avoiding side effects in BUG_ON() (or ASSERT()).
>> With
>>
>>     if (!boot_fdt_info(device_tree_flattened, dtb_addr))
>>         BUG();
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I can make the adjustment while committing, if desired.
> It would be great if these changes could be made during the commit.

I've committed it with the adjustment, yet once again I wondered: Why not
panic()?

Jan

