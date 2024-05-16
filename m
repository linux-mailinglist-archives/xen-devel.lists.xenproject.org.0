Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4068C74D3
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723114.1127659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YgP-0003gq-7V; Thu, 16 May 2024 10:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723114.1127659; Thu, 16 May 2024 10:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YgP-0003ej-4x; Thu, 16 May 2024 10:49:57 +0000
Received: by outflank-mailman (input) for mailman id 723114;
 Thu, 16 May 2024 10:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YgN-0003eY-Oz
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:49:55 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06ea452b-1372-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:49:53 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-572af0b12b8so3109872a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:49:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcad0362sm7099189a12.20.2024.05.16.03.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:49:52 -0700 (PDT)
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
X-Inumbo-ID: 06ea452b-1372-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715856593; x=1716461393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bl/XB3ZRlZVeGhQxU9bpIlpMMOJOvBs3A0fid+cTgSs=;
        b=IdJJ+hk4Qi0sEgpXQHfmXfBmtsX/JdVnEISAXlxLzbUFo+G0CXyKBFeu0l06iz+M1w
         PnZ8j0l40z2QThKsTyEX3jf3nQQ+VLly9M1a4jT9jeLbuxwBEW5SfCsz9uyumHUkCPl5
         G6/MPxIJk02qaY9WJyJp34neyeqHnm835WdxVxNN749Rj/p/YgR0b68qLRx+mbyJspcb
         9w6ocPUogyYG8xrH5Cn/8gPGiEM2SgPryMNNiSKr1Vxm/u5dtAQMFdmHZ061P7fHUQZ+
         yICu5I2PMxC1SiTRTipngy/fapXAsE47h3ZE8xbp8JOVs4z7kd1EuQ40O5dTilTYmb4n
         kQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715856593; x=1716461393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bl/XB3ZRlZVeGhQxU9bpIlpMMOJOvBs3A0fid+cTgSs=;
        b=qzTxyQHP2cnZmCJo0JxgcHZ4xAGMo1zr0PpeeoBceNRY6EIBXnJ6Lo6h8bj12OF7If
         CO6G3wmMMY0f1zfCH+ouwJFjJrTotZdCTI22I2AgdF90PuKjGeeLznQANoMAHXZkpdH7
         il5XBiejHTPyyJJ1vV/xagk4vMa5WxvPXuNNKKfTkho+2U8Sg5rho2NEZ8ZeDgmX2JNp
         7Sj6Q9/HAV3DprkWNDpKxxD3YpfyZIZh8+tITTCBr46Rx6dIx0Prpp+zNHpJZEBFG5k4
         xziz2mmRqhN9GHKTSfCP8GAEX94dHHmILsQ3Hlz4JiQk/+0NA+B9qj0pVkh/+e5jDzR/
         oN5w==
X-Forwarded-Encrypted: i=1; AJvYcCXzvikP+yaWoItPnefNK11vJmBn/wHswpmDByG10eJ6ELHClyVXB+pgKf4B0a0lzB3eNYIoaC+NG99iLQZ0AzUtccK10vxR0L5U6mlxFFo=
X-Gm-Message-State: AOJu0YzKtqZS1apa9rpsH/N0iNwZ5U/Rt5OEbncy9PPeD3Tb5xbp9U9P
	ebqYpHFdpTLbIUsYPOkfMAH2+1pt6GoHmcV7damqHNvRYRWGNpLvLoPPtZZ6sw==
X-Google-Smtp-Source: AGHT+IG7H/Z+VkkPWcbXJlig5TIVBFBGq8GZYFhY4lMHxwGHaCqvQs4H4rHY3Hilk//oyGzqLlgpDA==
X-Received: by 2002:a50:8711:0:b0:572:7015:f303 with SMTP id 4fb4d7f45d1cf-5734d6f00d7mr15720119a12.35.1715856593132;
        Thu, 16 May 2024 03:49:53 -0700 (PDT)
Message-ID: <5a121770-9bf3-40c6-ae91-8dc70174dad5@suse.com>
Date: Thu, 16 May 2024 12:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
 <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
 <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
 <588867d6e054264551e0e27b534955fce9b6d6d5.camel@gmail.com>
 <77c6e497-631d-4f92-bd38-8ab7dba4841d@suse.com>
 <c8bd47e8f8558d88b4d5a4a09ea10728006fd4d3.camel@gmail.com>
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
In-Reply-To: <c8bd47e8f8558d88b4d5a4a09ea10728006fd4d3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 12:34, Oleksii K. wrote:
> On Thu, 2024-05-16 at 09:04 +0200, Jan Beulich wrote:
>> (Later) Wait, maybe I've finally figured it: You use
>> arch__test_and_*()
>> because those underlie __test_and_*(), but arch_test_bit() because
>> there's
>> solely test_bit() (same for the generic_* naming).
> Yes, that what I meant.
> 
>>  I guess I can accept
>> that then, despite the slight anomaly you point out, resulting in the
>> question towards 3 underscores in a row. To clarify, my thinking was
>> more
>> towards there not possibly being generic forms of test_and_*() (i.e.
>> no
>> possible set of arch_test_and_*() or generic_test_and_*()), thus
>> using
>> double inner underscores in arch__test_*() and generic__test_*() to
>> signify that those are purely internal functions, which aren't
>> supposed to
>> be called directly.
> I understand your point regarding functions that start with "__".
> For example, __test_and_clear_bit() is used not only internally (in
> terms of architecture code) but also in common code, so it is not
> strictly internal. I may have misunderstood what "internal function"
> means in this context.
> 
> I thought that, at least for bit operations, "__bit_operation" means
> that the bit operation is non-atomic and can be reordered, which
> implies that it's not a good idea to use it in common code without
> additional steps.

Correct, up to the comma; those may very well be used in common code,
provided non-atomic forms indeed suffice. But in my reply I didn't talk
about double-underscore-prefixes in names of involved functions. I
talked about inner double underscores.

> Anyway, I am not sure I understand which approach I should use in this
> patch. You mentioned that possibly test_and_() can't have a generic
> form, meaning it won't be a set of arch_test_and_() functions.
> 
> So, can I rename arch__test_() and generic__test_() to arch_test_() and
> generic_test_(), respectively, and use the renamed functions in
> _test_and*() in xen/bitops.h? Is my understanding correct?

You could. You could also stick to what you have now - as said, I can
accept that with the worked out explanation. Or you could switch to
using arch__test_bit() and generic__test_bit(), thus having the double
inner underscores identify "internal to the implementation" functions.
My preference would be in backwards order of what I have just enumerated
as possible options. I wonder whether really no-one else has any opinion
here ...

Jan

