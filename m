Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF564A7F4FC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 08:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941416.1340910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22T1-0003yG-F8; Tue, 08 Apr 2025 06:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941416.1340910; Tue, 08 Apr 2025 06:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22T1-0003vw-Bf; Tue, 08 Apr 2025 06:29:51 +0000
Received: by outflank-mailman (input) for mailman id 941416;
 Tue, 08 Apr 2025 06:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u22Sz-0003vq-WF
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 06:29:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id decab5ce-1442-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 08:29:48 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3965c995151so2548270f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 23:29:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1794efesm154766305e9.28.2025.04.07.23.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 23:29:47 -0700 (PDT)
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
X-Inumbo-ID: decab5ce-1442-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744093788; x=1744698588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n2Z6TsW7RSlBi/iT9pdafV8aPy2oE4gH2NEySS6TtrY=;
        b=Ng8opHza8JvAFihKYAg8m7FIXSGmw5QEUIcefxK4wMD5bXDfVSWXuS8v3FIOXDMxyX
         zWBJdIhfN0jTHyI3qJx6dfmh0YupNlhxR2RxLimsiRwQyyZu9p/9bczOdfakE1GexiLD
         vJW6y7Uk+7mGrlvf/TDqXlIxxGgda+fBpBjMDoHTebCY70Qi/M218aC7SrRUZumWpqVJ
         Uj1PQiR9gyZf9iYoyRknurS9OyqZJsJgq7qist4eN+6uv4oh6RTBTFExPEwLeqGSBs/m
         qRS15HjHZAe9RLgl8q1i7C0nMZExCv7dO4qOMKTB7D/ZhoB4M5j+jvrp6cIUpq1IqlDa
         UBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093788; x=1744698588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2Z6TsW7RSlBi/iT9pdafV8aPy2oE4gH2NEySS6TtrY=;
        b=MXdjdTuuLy900umTnuTGYoV/kKRWd4i6yACngVdfYklZFSJ74kmu+kFLUJwqxzT5v4
         Z9Si4K4AjfVf3j6JoYuOPkRknqxkHsQGSDX7j+N5iTiITCmpP1SYTDr+RzG409ay1cIZ
         dQ7tmlmeAogE5YLrGzC+3fZaRGVnWCrWieJ3qMgXZbVUN9jOe1vfgpo6hbn1s53QqE6x
         /WcmkUyTQ2Dayx5paRaVKxqwzMbBkzURpVyoRD7kDmQLJnhzaHUPgcSn4a4eXcmQ4Eke
         ObiAfk/1bQZk9tsU8UIXV7ynfLeTt30hTc8N89yRRellMBKPLRtqcvWVYPeFsRtT+4Cx
         EB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTSlrRM1/C6bXYm8vJmXYKlYR1Hm0ieew3+7xEB/03LxbAlkENXz5NHm/XvaB/j7B++RpD4B5JaX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuOqZFv2Rd/fOmu2C8nUZTcwgdjzBnH/ryeSuyUScZskkExkt0
	S3TKw9ak+wxP0C0On1qUStNYejtRWR/G+doRegZ/AAQoCLKlki5rz3IspalXlg==
X-Gm-Gg: ASbGncuHJ2AJv31dVYmK8Hs9JgBidaEWiip09kkTvah7UYJrvBM3jxxajNvPUkIYrLs
	7eThyFlDVpvuIf93VAjdaKG+9G9CDMqJTCv+DnHWfEvFHGf+Yq133ARHmPiD2UpphaCewZLGRAO
	S8k39mkeme7139eNdYh1hYQuTty7Mc0oxk3lO/bgzeL3mN0/p5b1tAGKunI0kwwb23dPsdd6T5w
	fArz7AT727YEzj8kZmiS8kd7iTx4+UTgOU+hPObInZQ1yYyjSdchAZeXUTjA34424Lb4o2Cghmx
	wEZXeepuG1cjtuUajKyg9Tg8vxdW1JmEr0mJrb2VMsF6edR+o2tGIXw56HkO/4cQVl4KA3NuXXy
	Am3PmtOIdfDStZf6XIfzWZO+NUEzjVwfx4EifkiPL
X-Google-Smtp-Source: AGHT+IFSqE9JuvncBlGpgX0ccCHHIji67T7VLtU4CKCLhpJvEgvNi6vU3qvDfNna0PiCe016kq6DSQ==
X-Received: by 2002:a5d:64ee:0:b0:391:487f:2828 with SMTP id ffacd0b85a97d-39d6fc0c2e6mr9552706f8f.10.1744093788201;
        Mon, 07 Apr 2025 23:29:48 -0700 (PDT)
Message-ID: <d8e0a956-3591-4398-ac58-d99e3d9cb415@suse.com>
Date: Tue, 8 Apr 2025 08:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen: x86: irq: initialize irq desc in create_irq()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
 <20250407164608.2558071-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250407164608.2558071-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.04.2025 18:46, Volodymyr Babchuk wrote:
> While building xen with GCC 14.2.1 with "-fcondition-coverage" option
> or with "-Og", the compiler produces a false positive warning:
> 
>   arch/x86/irq.c: In function ‘create_irq’:
>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>     281 |     ret = init_one_irq_desc(desc);
>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>     269 |     struct irq_desc *desc;
>         |                      ^~~~
>   cc1: all warnings being treated as errors
>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
> 
> While we have signed/unsigned comparison both in "for" loop and in
> "if" statement, this still can't lead to use of uninitialized "desc",
> as either loop will be executed at least once, or the function will
> return early. So this is a clearly false positive warning due to a
> bug [1] in GCC.
> 
> Initialize "desc" with NULL to make GCC happy.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=119665
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



