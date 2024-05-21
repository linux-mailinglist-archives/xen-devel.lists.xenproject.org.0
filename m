Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F698CAD3C
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726847.1131230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NY0-0004T9-KK; Tue, 21 May 2024 11:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726847.1131230; Tue, 21 May 2024 11:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NY0-0004QO-HW; Tue, 21 May 2024 11:20:48 +0000
Received: by outflank-mailman (input) for mailman id 726847;
 Tue, 21 May 2024 11:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9NY0-0004QG-2Z
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 11:20:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2afb98ab-1764-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 13:20:45 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e37503115so6034542a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 04:20:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cebb3cd33sm676964566b.34.2024.05.21.04.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:20:45 -0700 (PDT)
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
X-Inumbo-ID: 2afb98ab-1764-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716290445; x=1716895245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iclHLejdVsdq+hBjiyZTbl5Uhef9O0yZKOK9QwDNKkc=;
        b=QXcm5yECrHHQuCyWRGdufXE9uk100TdW44Y0+J4c+Onj3D/GRfnU6Jxjund/u9W4zM
         l2udztIAlbeylekwU/LafBi/D8DOjHOubWpEvx2UeMGrmpSLaEeojdsGbazwQ2T+YIh2
         z+PhLEhr2YUcnHcUU6FoHBkFBrddLZPZ11M/PEyIMuLSJEiPIcUP9Xew4fDAtsNNY9OT
         HZrLDfsph+KhM7OC6oJzgCoJ7VSn42Q4RV/sWozUJlzeKlXbxnKj84hPsizoW2bvojX1
         ZC8ZJAxZixrGz15VhZ3ZVK0oHuHS7KK114A1yu/oeMASfPQMKqwxj5et5sSg653cGxRn
         BiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290445; x=1716895245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iclHLejdVsdq+hBjiyZTbl5Uhef9O0yZKOK9QwDNKkc=;
        b=ilAlJSuAAxMFEYB29eJ6XK2Af8vPAr5GVfLyHektd3wa7xvndFepFwiXfuoTxtBbcd
         ALbrNgannZpvbDcLxm2YfWiVkAwD4HASxUyQmlRXAQE7Cz48BJ7DJHuSPWFnmQy7fqqc
         ffDfz8QwKtYH4Ti7vd7SE15PCn7CVebRe+Z5zSZ38GDQTuh/+pmjNeQ1OJTegIyqegoN
         lYngyPiC4zt0OzmVQ17N3bBHwGBk1v6h3Gd0p0yuzvIKnCchdJCZESyyZFzWG/bYve5G
         MKXFSPdlwk5tjhYHjwiBmbe9KM6faxacs0FpQyOMWoCg4zLQOb4rC33CSoW34N+mn6Kp
         IvvQ==
X-Gm-Message-State: AOJu0Yw9yNvhFcW+GbknKtNjh3oLuyW6hrBGyXqi9VJcEhCgcHETA9Vo
	4gyqSy2Bf1smWMD0OSc6CpXk4i9YXJerPYX0S09wDwM5UN6k82taRMV2WPIXEg==
X-Google-Smtp-Source: AGHT+IH8vRu13EL93AfMjfUhzQ0GR87tQfa7IHQmgio0Bw4IGOx8gQ2EzKuLuNJiXyLUKJbYwWwRJg==
X-Received: by 2002:a17:906:c07:b0:a5c:f349:da7c with SMTP id a640c23a62f3a-a5cfe08c9ddmr846154366b.56.1716290445365;
        Tue, 21 May 2024 04:20:45 -0700 (PDT)
Message-ID: <d5fbea94-ae3d-4818-8947-a3f509218959@suse.com>
Date: Tue, 21 May 2024 13:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] x86/vpmu: address violations of MISRA C Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
 <ecba64bb8295fa27f0ddbb0905b0983a3572b1ae.1715757982.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405151617240.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151617240.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 01:17, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



