Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1583A3C2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670746.1043714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYKA-0000U3-Pq; Wed, 24 Jan 2024 08:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670746.1043714; Wed, 24 Jan 2024 08:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYKA-0000SR-N6; Wed, 24 Jan 2024 08:09:30 +0000
Received: by outflank-mailman (input) for mailman id 670746;
 Wed, 24 Jan 2024 08:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYK9-0000SJ-7Y
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:09:29 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4755720-ba8f-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:09:27 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cf0e9f76b4so19978991fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:09:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c8-20020a056e020cc800b0036197f7f157sm2837097ilj.2.2024.01.24.00.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:09:26 -0800 (PST)
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
X-Inumbo-ID: e4755720-ba8f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706083767; x=1706688567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P7zV7K1yaA9axuWOisKiHkCjFbxEMBhbbcgQ3S5fcA=;
        b=TtDbVWhQ6hh4gzUeOgEWI10/yLR42QvILW1/8Xl/ph0HrV0fpZOm1DqI499o8Z/Yvd
         1g3c0Jvwy6KTyeBO+nntpRtqTkW6oGTDYFkA1MVALcEu2LjhnDmr8qHqjKDGNNwTjBE4
         j9hMndluTIJDKecvook40sWQmb2wej03SVzU4qHO55AwCl+70iybKXS+sIFmj+q24DtR
         yY+x8wzrf3e01XumFUd0eiC2cwE7lIChdsXnCcAqWs57Vrhrgfk+1dqhlFNPXeA1HlBi
         nBc3otVhSUQmrj433fOWlPycRC9T3gWvp6sNB/N7gi5f8SL+RI7rDb04SnGzCzMmHr1i
         5chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706083767; x=1706688567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P7zV7K1yaA9axuWOisKiHkCjFbxEMBhbbcgQ3S5fcA=;
        b=V35C1D8Rx8yKAdTlVRa0zDIPJVNLuWiUT1cY5gTz+wUuct53Gm1D/tvBycJ0ZdaMxn
         XoMRUTSPI3y5YDVW/d6UfjWe8prjoqp67BHaPy0XlW76hagmHVbWPnQy6fJ3ne15v6lv
         EO8TeXYnvkL9V4utJN/rEMiYwq2Ak7z+qswB8P+9oaUGvkz0x5FYPahTB6XhVeKcFSH+
         J8i9/xRan3/rVyjWwHnI326LBA159XARNDjOVFlYo6NqZDfMaAXZirGOyqM9mVlWx3Mq
         x1uuSWU83xJK2P4DLOa2j2KvBfLk2PBhJ4yd0/wXxugCk/LknW51BioKX3L7FOAqGgTP
         wDoQ==
X-Gm-Message-State: AOJu0YyUx/3Y+60fHj8VSmwLq39t8FQ6BnfkgiMM3DNny8g6xgXpx+S2
	XX9KQZ2oLCEjvoIfrg8+e8PS0yGssLVz2UAf6UHMrPVljsNG7Ba4neUvjHB2jQ==
X-Google-Smtp-Source: AGHT+IGT9ZI4LD6FXzLl2wnqyq6Svkr4f+Xx/xyaysk0nr/b4Vv8UI5TPiTfAGstXj5jZamXCEBbuA==
X-Received: by 2002:a2e:a453:0:b0:2cf:1707:2c23 with SMTP id v19-20020a2ea453000000b002cf17072c23mr276394ljn.61.1706083766759;
        Wed, 24 Jan 2024 00:09:26 -0800 (PST)
Message-ID: <2c3086e1-39d8-4060-93f1-4c53283c0d70@suse.com>
Date: Wed, 24 Jan 2024 09:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/34] xen/riscv: add minimal stuff to page.h to build
 full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <7aa26bdad9bf923fd57f7a90e41c049cab0cd5bd.1703255175.git.oleksii.kurochko@gmail.com>
 <0740cab9-be2e-4aae-8b03-e3ec95d0b0ef@suse.com>
 <c7004f13d082535cebd50fbe0e2446e3af78e48d.camel@gmail.com>
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
In-Reply-To: <c7004f13d082535cebd50fbe0e2446e3af78e48d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 17:54, Oleksii wrote:
> On Tue, 2024-01-23 at 12:36 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V3:
>>>  - update the commit message
>>
>> Once again I find this puzzling, considering there's no commit
>> message
>> at all.
> By the I meant that asm/page.h was changed to page.h

Oh. Can you say "title" or "subject" when you mean that, and "commit
message" (or "description") only when you actually mean the description?

Jan

