Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF28C7A16
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723518.1128456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dem-00021H-CZ; Thu, 16 May 2024 16:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723518.1128456; Thu, 16 May 2024 16:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dem-0001zB-8c; Thu, 16 May 2024 16:08:36 +0000
Received: by outflank-mailman (input) for mailman id 723518;
 Thu, 16 May 2024 16:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7dej-0001z3-UR
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:08:33 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac7477f-139e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 18:08:32 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so330037266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:08:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a178a9d81sm991765466b.83.2024.05.16.09.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 09:08:31 -0700 (PDT)
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
X-Inumbo-ID: 8ac7477f-139e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715875712; x=1716480512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3GWIFoUQ8dNniA006Izn//1I6UsOs2gb+h/yuBgfR8=;
        b=E1yqt19h7i8rL/WS6ZbGpqNx+iWlIeklZIN4wbKv7GXBMYjSrlcjwUxuYIXuyf8O6F
         zr8FlZfQZpHvKQOEN3Qcm1WDkEa+fzS91HZBa+rMzhpxyoTPyq4uwonsdGkQJPQkEE8z
         teCrHCHZJDRPw6vkhmf3FfiCBebLwf+mPXasFSNkZbVlLY4KBPzusfgiLn5eeXTTgDVy
         A/cTKSZ1wdUIBgihc9MFhDIv/8t4BZQe37YmNPnov1bQ0B8e2ooQWwF0K0elyzJ9RDqj
         2afawqnXFh9y2Ci7C+4V8MSzUAM38bgGiyzwRSaerPhNO7w7uPYlDZ3yrwtJQxPZDnaD
         eUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875712; x=1716480512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3GWIFoUQ8dNniA006Izn//1I6UsOs2gb+h/yuBgfR8=;
        b=Z7mDasjkou3JePQ9dneQpBkZ6+D1ljzv+UivjrdbzH2Tm8CM6gCMYK+QEko8fWW71o
         IcipTswITckgU9/esD4b9IjoMXerhsg1dtcfm8QVTG3PHt075l5MR+2Ndg6stWMqvYh0
         GlIWnMogc5jH+N/NODDUG2ZihYOfcg4pVT3pNbVUbrL0Gn/mz1QmOkJdFrPiC4URcbet
         qPQnDpdjjdt+34DqgP/wFRXAhbxuOSNCbafuGzMa4oxMsLADmX7JYm6ypfq2R28LvR7U
         BMWggwF3piToGIX54GJPelOClXCteZROWRQZG/cHiQPXGv5j21ytKbelnk0oD0lpKPmZ
         9QjA==
X-Forwarded-Encrypted: i=1; AJvYcCUM2/bcgNYrHeoiEOezvv2OSXo4153ELk4yL2Hda5WvpkcNXguJrwxemGXII4EasendkDC9p1Ab7iZJHTV8bMYwvtxF/SaEAtHZ51u5hnU=
X-Gm-Message-State: AOJu0YyywTRlhOAtchSg7jYM6LTd69Dkvtsxh3euhJec/2e6nLGKiooJ
	7/XWnu4RwMYn8jhL9Xk8UK/yDxMXKNw7x+6oJmXZC8I6Wyzf/dlPgUPThbWHDQ==
X-Google-Smtp-Source: AGHT+IHbGaM09obCanNKoIlXey0+aLDlMv2Un3ZIfyDfJnmo3m7Lk0ezoiWMgxdW5kkS878eXBeFlw==
X-Received: by 2002:a17:907:7daa:b0:a5a:4705:ad36 with SMTP id a640c23a62f3a-a5a4705b758mr1302297766b.16.1715875712173;
        Thu, 16 May 2024 09:08:32 -0700 (PDT)
Message-ID: <6d19ef9b-ccd8-4ae0-9e9e-ff7f3d92b333@suse.com>
Date: Thu, 16 May 2024 18:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/4] address violations of MISRA C Rule 20.7
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
 <c67c1b8b-e14b-4c30-a381-1b89aedcddb9@suse.com>
 <7f8ef88d0a8bd3e40b213d19dfc80cd3fd2db298.camel@gmail.com>
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
In-Reply-To: <7f8ef88d0a8bd3e40b213d19dfc80cd3fd2db298.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 17:58, Oleksii K. wrote:
> On Wed, 2024-05-15 at 09:48 +0200, Jan Beulich wrote:
>> On 15.05.2024 09:34, Nicola Vetrini wrote:
>>> this series aims to refactor some macros that cause violations of
>>> MISRA C Rule
>>> 20.7 ("Expressions resulting from the expansion of macro parameters
>>> shall be
>>> enclosed in parentheses"). All the macros touched by these patches
>>> are in some
>>> way involved in violations, and the strategy adopted to bring them
>>> into
>>> compliance is to add parentheses around macro arguments where
>>> needed.
>>>
>>> Nicola Vetrini (4):
>>>   x86/vpmu: address violations of MISRA C Rule 20.7
>>>   x86/hvm: address violations of MISRA C Rule 20.7
>>>   x86_64/uaccess: address violations of MISRA C Rule 20.7
>>>   x86_64/cpu_idle: address violations of MISRA C Rule 20.7
>>
>> for 4.18 we took a relaxed approach towards (simple) changes for
>> Misra purposes.
>> I wonder whether you mean to permit the same for 4.19, or whether
>> series like
>> this one rather want/need delaying until after branching.
> Lets follow the same approach for 4.19.

Well, okay. But if you don't say now until when this is okay, you'll
need to announce the "stop" very prominently later on, so no-one
misses it.

Jan

