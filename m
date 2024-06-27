Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0991A41E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 12:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749956.1158205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMmY1-0002Ef-AP; Thu, 27 Jun 2024 10:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749956.1158205; Thu, 27 Jun 2024 10:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMmY1-0002Bj-7k; Thu, 27 Jun 2024 10:40:13 +0000
Received: by outflank-mailman (input) for mailman id 749956;
 Thu, 27 Jun 2024 10:40:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMmY0-0002Bd-Lp
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 10:40:12 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c4726f-3471-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 12:40:10 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so56863521fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 03:40:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b48d0d40sm1048497b3a.10.2024.06.27.03.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 03:40:09 -0700 (PDT)
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
X-Inumbo-ID: a0c4726f-3471-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719484810; x=1720089610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n70y0PhnhdmR0y0od7jjbLFRwIzTamhdpK5VhI//MbM=;
        b=KD8nimEdcLH2oNEaZYKMjk3fqARRHJA2lqYOoMz340P12ytfCxV1bc4Y9nQBPpvQzb
         pnNgk6pUn8CnQAtqKdNvJAp7xqcACaOUVxHELegk/sywXmqmqCsqsgdZ0x7CRu+KINuj
         SC5/BpdeJYabLxBATC0yOauhaRR/KZOGlWpeO3o6P9V/afGEMAQnilylp1/QW0sgZZTj
         QVQBjE5v91hPyOhl7d/QNEUjXcbm4ip5LSJ6z0yXbvaqLylEkyWNE6dv8K7PZei3qiA3
         IbUeSuOjvfbonpBllZrLwuMg9Bt9ieL4K66LY09cTAeURKKZWIhqeW5lzagHn4TDpNtJ
         WlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484810; x=1720089610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n70y0PhnhdmR0y0od7jjbLFRwIzTamhdpK5VhI//MbM=;
        b=OFkHds47zErb/L09VrCLK14yiiZfqfpnXc83SGKuz5vVtHD5epIHYErhpzC33DX+xR
         Q27jb5K0+6hCrOnNTyjbf6O8F2lBK2iDVZmgONHNagivE60qZHLnm+m83UhlTDMoO/5y
         7rDsClXmEF5KJThtYAGM+dPGJYWflnrdcmCKSOptqpg1BtwIlAZd/rdyWvEg5AS++o5z
         cnuj7TRVZXm4tnGrg0/P2eQ2JWtsvog3OrA2l7rizUtu7k5alEHeIg2Q0KHOof7+xm+A
         6qd8IPH+Ewha0Py8j23PCmibDE2pwLQOBSQwOSJGBqi1UMpirPMjiWDwudVgddLdB2h7
         KWEw==
X-Gm-Message-State: AOJu0YzEi9ClV3862lSlhfCoXK0isWBaJ232+x0JnzOReXoCtAgV9tgm
	i0t/9KDp0B/qD68M3JGiBgQkfvalf1QxH/iXPOrS/llR9k73JvApGD7MLd0TVw==
X-Google-Smtp-Source: AGHT+IHjz3gXw9cnyx3lnTPBkJH93+2IB8jjqjKUAGSCBoYHbf1XUROgt9JFWErViZuQB7rL54LqeQ==
X-Received: by 2002:a2e:9d14:0:b0:2ee:45f3:1d13 with SMTP id 38308e7fff4ca-2ee45f31ed3mr22693511fa.47.1719484810010;
        Thu, 27 Jun 2024 03:40:10 -0700 (PDT)
Message-ID: <5c15f165-bfae-40ef-ab15-59e262b90b81@suse.com>
Date: Thu, 27 Jun 2024 12:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 for-4.20 7/7] x86/traps: address violations of
 MISRA C Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
 <7830b9bfbb0aec272376817eb20bbcbfebdf4044.1719407840.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2406261746040.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406261746040.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 02:46, Stefano Stabellini wrote:
> On Wed, 26 Jun 2024, Nicola Vetrini wrote:
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


