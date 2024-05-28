Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF988D175F
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 11:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731057.1136378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBtIZ-0000ZY-LQ; Tue, 28 May 2024 09:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731057.1136378; Tue, 28 May 2024 09:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBtIZ-0000XC-Hh; Tue, 28 May 2024 09:39:15 +0000
Received: by outflank-mailman (input) for mailman id 731057;
 Tue, 28 May 2024 09:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjWx=M7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBtIY-0000X2-3i
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 09:39:14 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 219905aa-1cd6-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 11:39:08 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso7358381fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 02:39:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm592227166b.196.2024.05.28.02.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 02:39:07 -0700 (PDT)
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
X-Inumbo-ID: 219905aa-1cd6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716889148; x=1717493948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OmmOJgb9cOlQkpl935RLGJTN/8f87RlqaEkuudmwh9Q=;
        b=MlkQCMKaPjvRQJd5nfDC/Lge42a5wCNMlYvdiUdEwuVNOd4XAQJaHdDUuRhZHkUbeS
         03KspmETjVGhf4x5IArfQrtKP6pWaebltP6N9u8Z3yKiK+DLqzy7DYaMYz7b8QRSkvXd
         omBU2cp5OC10b5Xuuabs4sTcHWQf4n3feb0GZV/Rc8PBJNmNnFJ4B+tsa80UQkOfN7V+
         IEa8xRDFqmxPp7JRHEKraMDwb7ha8PO5gIr2reiH9iooyrGqm7Ap63e0ylv6kbt4c9EF
         I2IrTCVPcs44Pd3f6zDwZwiDD2OcBSzZUd5tEJKjvSvJ+CjrbWsdGrYGcglOOadR4DTL
         JC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716889148; x=1717493948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmmOJgb9cOlQkpl935RLGJTN/8f87RlqaEkuudmwh9Q=;
        b=h9gWFVzFJEnIGrw9yC15a22E4Bi42GtbrHk3jw/fN+vUd9mF0cw9zBxEKOZ7yku8DO
         g5TAVGNolOnqVPuJ//kR22rtdIprl55/VMbnUmhlt5PY0HwRLM3Ujhej/33IQwqPEWr5
         4esmYerl3irs8/jqCZ2BHlE+1zRYcTOJD5ymcHazDCmnVZTajiWsnwem5wxB4yQBQuy+
         ddtcf3HimFxXHnaPppZNhZqafP0b7jyAs18l69PrO5bdoHNK1dz2iGrqRH0c/OqySkxc
         MtmwsUP0H/3G2VFTV7GSjaXgYwxK9JM3jVlXhjgub/lBr3rgjDv1oFD2zvv6ieQBB5d1
         ydXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWgUzAHw4zxxuMxxjVUJsxfrdjvYxzeTghMUBktTZCcDGFTEgyVTW08yVQ8QxLJSlAKsOusd4+ZER5IyzCAe7ydOglKREf0uQGl1+bIu4=
X-Gm-Message-State: AOJu0Yw/8bJP6H1bX37gFhxHZwELexE9ATShzWbAgC76WrxU3rFGAzxo
	bXgzZhpwKn3u6oMoLuH2eMwU0nIJTkkpjA2nxl4GBgu6m0Z7hGRKfjHxWvfR+g==
X-Google-Smtp-Source: AGHT+IFzMCTOJ1peU8vOLHt8SMxS3EEwszQpeTkbL1Q+aFq43O4IYBnn8Sbdt/jRb/Mom/b7l4q9zw==
X-Received: by 2002:a2e:961a:0:b0:2e5:6957:187a with SMTP id 38308e7fff4ca-2e95b041638mr91060931fa.4.1716889148005;
        Tue, 28 May 2024 02:39:08 -0700 (PDT)
Message-ID: <26c35562-e9ba-41cd-8bae-69469a5f0f88@suse.com>
Date: Tue, 28 May 2024 11:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
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
In-Reply-To: <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.05.2024 10:37, Oleksii K. wrote:
> On Tue, 2024-05-28 at 08:20 +0200, Jan Beulich wrote:
>> On 24.05.2024 13:08, Oleksii Kurochko wrote:
>>> +/**
>>> + * generic_test_bit - Determine whether a bit is set
>>> + * @nr: bit number to test
>>> + * @addr: Address to start counting from
>>> + *
>>> + * This operation is non-atomic and can be reordered.
>>> + * If two examples of this operation race, one can appear to
>>> succeed
>>> + * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>> + */
>>
>> You got carried away updating comments - there's no raciness for
>> simple test_bit(). As is also expressed by its name not having those
>> double underscores that the others have.
> Then it is true for every function in this header. Based on the naming
> the conclusion can be done if it is atomic/npn-atomic and can/can't be
> reordered. So the comments aren't seem very useful.

I disagree - test_bit() is different, in not being a read-modify-write
operation.

Jan

