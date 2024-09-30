Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC660989C9A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807098.1218316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBeY-0001c0-1T; Mon, 30 Sep 2024 08:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807098.1218316; Mon, 30 Sep 2024 08:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBeX-0001Zh-V5; Mon, 30 Sep 2024 08:21:09 +0000
Received: by outflank-mailman (input) for mailman id 807098;
 Mon, 30 Sep 2024 08:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svBeW-0001Z4-Iv
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:21:08 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c85ed7-7f04-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 10:21:06 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so5273683a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:21:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bdeasm492039466b.167.2024.09.30.01.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 01:21:06 -0700 (PDT)
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
X-Inumbo-ID: f0c85ed7-7f04-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727684466; x=1728289266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7LgB8M0hP3IOkWTMyKjA6XhjduXwsH5x5hSMYSpLEdw=;
        b=aCGOoKY6TBxjmH9nA4PKSz7MHNUBxtN0lww5OZYKiuvMX+n0gbC92BKKbhZCEfSh9Z
         xeojXNjsVtujZPEdjoUHimjRSlDFr94IHWBcWvtr8rJuCoOSUBEciktEu7par4gpEWn4
         T5XCYT6S1PCkABGgw0JKLsJGXThejHD4FwX1m9xRk5UJw4EaKykDtVhIWXG5g+rSjMcx
         FCHKaxGbRAtlbKMo+aGVplSrPu0HKNufe5wQzybNTNdxnMiIUwFheyiQTN1KZsdNiZ6H
         V1mVlZ9tyHO3bfoqnMGNn1GTE78BxnbMojOiR1CljAvc+QnxNz6PCnTvaMT6QjmBykG/
         9SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684466; x=1728289266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LgB8M0hP3IOkWTMyKjA6XhjduXwsH5x5hSMYSpLEdw=;
        b=IgYzD5wt1GXrJMu8hJrbnGg+sJ2GB6U6fui972KSy/WXqaqXyiLSv3MTjpwLkRK0Mk
         j2XT9vjotUO9NeMhvNM9KQJCDVDcHlK9h/7I//+LGlMvsY3/9cy1kgGK1Ag08lPGkEJ5
         H7di5DHUqGKdwCOif1ZSi7nu+77UFHWf/HGyVCLsrocib1rJR/Kj2cx0faeG7pxqEPik
         Sqg7SKgwd4tPvPYbjUI9vAgCjwAzB9xkaTP0AfT/qHiyeHE4Rj4mtem5AW9FOK5Mf8yy
         cv7d7zDXyVHq84ClhkZ4Pg71RqMQcw5hGfQib3tyA2tgvBQeD/MDG1JNrsk6TjKovlS9
         uYKw==
X-Forwarded-Encrypted: i=1; AJvYcCWJdxw+Nsozd7mjKcrkmqUosf2O8gd2Sxdbb9cwIuLmpOfmAYoCi92eueOdlxhGIIIeNsFRZ3K9do8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwufaLkS9ZzExLGd7F41Aoh4eR3kiKTj9RJJXCiyXQUU3PsqLcl
	Se3XrLTtX9i/3JqS4IrxeNFyxOFYzoWmM2A5EZJKowHDQrQn8H0o+Tt0a06Xtw==
X-Google-Smtp-Source: AGHT+IFGl5ucs1APtJQvCoNB8HAO2gbx3HKIAtocfn2r72HASob1xftJZSJIYSve5qpt2UVZhi+Viw==
X-Received: by 2002:a17:907:928b:b0:a89:f5f6:395 with SMTP id a640c23a62f3a-a93c48f0902mr1457074866b.1.1727684466423;
        Mon, 30 Sep 2024 01:21:06 -0700 (PDT)
Message-ID: <43fffb94-bc2c-4880-9fdc-5387b3466a44@suse.com>
Date: Mon, 30 Sep 2024 10:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] device tree mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
 <db29de6d-5feb-4972-b60a-012f0dd9a307@suse.com>
 <ce42c8d7bee27917b7ed48f8cf1039a4f5c78dfa.camel@gmail.com>
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
In-Reply-To: <ce42c8d7bee27917b7ed48f8cf1039a4f5c78dfa.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.09.2024 10:14, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-30 at 09:27 +0200, Jan Beulich wrote:
>> On 27.09.2024 18:33, Oleksii Kurochko wrote:
>>> Current patch series introduces device tree mapping for RISC-V
>>> and necessary things for that such as:
>>> - Fixmap mapping
>>> - pmap
>>> - Xen page table processing
>>>
>>> ---
>>> Changes in v8:
>>>  - The following patch was merged to staging:
>>>      [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
>>> define {read,write}_atomic()
>>>  - All other changes are patch specific so please look at the
>>> patch.
>>
>> Except that afaics none of the patches has any revision log.
> Would it be helpful if I will send revision log as a reply to each
> patch? Or it would be better just to re-send the patch series?

To me the one for 6/7 is relevant, to aid review. Sending that as reply
will be okay I guess. Patches 1-5 went in a few minutes ago anyway.

Jan

