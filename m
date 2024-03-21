Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF48855B9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 09:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696244.1086972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDqG-0006mO-Tv; Thu, 21 Mar 2024 08:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696244.1086972; Thu, 21 Mar 2024 08:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDqG-0006kI-RM; Thu, 21 Mar 2024 08:32:04 +0000
Received: by outflank-mailman (input) for mailman id 696244;
 Thu, 21 Mar 2024 08:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnDqF-0006k5-A6
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 08:32:03 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d503815-e75d-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 09:32:01 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513dd2d2415so738387e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 01:32:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402160600b005687f8721f9sm7718261edv.82.2024.03.21.01.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 01:32:00 -0700 (PDT)
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
X-Inumbo-ID: 7d503815-e75d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711009921; x=1711614721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm/4gsDR6jnwFhv6hnpaTx+UB+WvX38AWU60Azayg8A=;
        b=R2PhT2w4G+2X5MOo2Fuy4wzERaSLD58rhu/O8OYQF0VMtQZ6MAzgIVARYFoX/tljOx
         ePWdwwpd9YvO7loiMWwTU+tWE5TtObiR9s5JejgpWPAG2SNFP9YGkXp7r0LX9vYeRNva
         YbIkRXBkm3rBx9JZjGbbKteOVFTzOKiNy3YMDYI4CEOruYtTXK7fBk45w511uLry6e36
         CKeV7igtXt0wffTeVe5Adm9uvi35M/v/KN7xTNApQgLcNU75A4DCqYYDENmJY/u1NK8u
         E+dytXBQ4qZbSRJeCN3pFZcB9EkFwIPqlfY6Ecv5OzdDCy4s3LftIkRm9bX5GhkQ7jmU
         jGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711009921; x=1711614721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dm/4gsDR6jnwFhv6hnpaTx+UB+WvX38AWU60Azayg8A=;
        b=TLzBmEsZroL6ewkEphCNHD0TqZ+VONJZEp8P0iB0YWXgVB8q3mm1vnNmkSs4OMV8CM
         SqB/VkCxHcGTNCa6um7PQCjg51Q3ekK3rIU5zjWmgu0WKDzKZrR29/I8l7ersGHbUcEQ
         ro178rX2T1TxJ9r1/JsoFFqVzvehToLmXYHeygAyzZ0mgz3zpOoDkh50PAEHxy3+j7zg
         e+oJhsbQXnnLNSuBeDKqDqkNV1nuQLHg0qOuVVbS9pOtfcVObpEtgK9QtTcL8xJ0Ek2g
         NQqGJTaow4Y9hB0Y/MTKRkADi5fBFfaOIv5mwe0jEqHxyMNmTlM95YLKS2udXR+dmFJS
         6/gw==
X-Forwarded-Encrypted: i=1; AJvYcCXL1565eIQmw7fbKC0rR9VeyGzfjPEeRMZ9clN5V5r2vAtt8zKDim/fFNpx31hMYsU8qOsp5kcV4iTjxEqPGIBd4Ab76q6g9nImQZYaB30=
X-Gm-Message-State: AOJu0Yxr6JvTHRCAca01vKcO6GQs1YY9D+SlSf5aoatiV3GvsQK1bjs5
	w4ZSBF15I/Yim0NhS35TV1uaWagl/1wUefWruR0Aqdm8Kc0xb5SVCikEpzq7Ug==
X-Google-Smtp-Source: AGHT+IES2jxCIPi0mo6NnH0XUvuUbvhItRpYtsmv1l4y53vPZTV7UFbs5sFL+BUnUr9w5H4uPCLnyw==
X-Received: by 2002:ac2:4e8d:0:b0:513:5af1:33c1 with SMTP id o13-20020ac24e8d000000b005135af133c1mr881930lfr.6.1711009921063;
        Thu, 21 Mar 2024 01:32:01 -0700 (PDT)
Message-ID: <a7ac74fd-384e-4f1d-a056-e6695ecff7d9@suse.com>
Date: Thu, 21 Mar 2024 09:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/20] xen/riscv: introduce extenstion support check by
 compiler
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
 <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
 <04c1424cec1342dcfb849d361f5eb9f3e7f34734.camel@gmail.com>
 <20240320-oak-uprising-db787f501695@spud>
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
In-Reply-To: <20240320-oak-uprising-db787f501695@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 20:44, Conor Dooley wrote:
> On Wed, Mar 20, 2024 at 07:58:05PM +0100, Oleksii wrote:
>> On Mon, 2024-03-18 at 17:58 +0100, Jan Beulich wrote:
>>> On 15.03.2024 19:05, Oleksii Kurochko wrote:
>>>> Currently, RISC-V requires two extensions: _zbb and _zihintpause.
>>>
>>> Do we really require Zbb already?
>> After an introduction of Andrew C. patches [1] it is requited for
>> __builtin_ffs{l}
>>
>> [1]
>> https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t
>>>
>>>> This patch introduces a compiler check to check if these extensions
>>>> are supported.
>>>> Additionally, it introduces the riscv/booting.txt file, which
>>>> contains
>>>> information about the extensions that should be supported by the
>>>> platform.
>>>>
>>>> In the future, a feature will be introduced to check whether an
>>>> extension
>>>> is supported at runtime.
>>>> However, this feature requires functionality for parsing device
>>>> tree
>>>> source (DTS), which is not yet available.
>>>
>>> Can't you query the CPU for its features?
>> I couldn't find such reg ( or SBI call ) in the spec.
> 
> There isn't.
> 
>> SBI call sbi_probe_extension() exists, but it doesn't check for every
>> possible extension. As far as I understand it checks only for that one
>> which are present in SBI spec.
> 
> Yeah, it only checks for SBI extensions, not ISA extensions.

And there was never a consideration to add, at the architecture level,
some straightforward way for all layers of software to be able to
easily detect availability of extensions? I find the lack thereof
pretty surprising ...

Jan

