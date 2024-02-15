Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F48569CC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681942.1060950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeq5-0003wH-I7; Thu, 15 Feb 2024 16:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681942.1060950; Thu, 15 Feb 2024 16:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeq5-0003ta-F2; Thu, 15 Feb 2024 16:43:57 +0000
Received: by outflank-mailman (input) for mailman id 681942;
 Thu, 15 Feb 2024 16:43:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raeq3-0003tU-LJ
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:43:55 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67bfbdd2-cc21-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 17:43:54 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411e5f21c0bso9451975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 08:43:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0033b17880eacsm2256110wrt.56.2024.02.15.08.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:43:53 -0800 (PST)
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
X-Inumbo-ID: 67bfbdd2-cc21-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708015434; x=1708620234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGVNY4C0mPvDCpoPXmQ0H1utfMgnuxF+/tJticYBrzU=;
        b=HUIj95PGOB/PQK42cv9XU/UVxqePKGy9ady4/zhHoPcAcA4emAWjEyUM7vGkXXYfZZ
         /CErfrvBwY1gyrSu1xX3l6u+IOC+y+VweDVF47B/yPPnBu0LDbIBMBwCliQ/x86SZEIq
         1rEBMx5mCMaZdvoBrNqx3lHPmzxEf2yiTL8Jy+QHmhSBvR96lg2lp8Ht9CPgdzy8enSf
         fzZ4cDSY8YC/ofn1/mp7aCeHk8+WHc0DMoGSv0vuJVgSDElpdCJxLyIbJofXzTEDzERB
         QvdzyO1giJhEoWJqrI6Vyn0Jxq79JX4IIHdh1cq36O3yQYDEDOqFHnUgUK8FBmZ+jsa7
         6pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015434; x=1708620234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGVNY4C0mPvDCpoPXmQ0H1utfMgnuxF+/tJticYBrzU=;
        b=q+oHAzpub2RQbN/5Uig7XiVeHh/ZbKWCrOm9G/2y6eok8aLugEEt9AQKakYw13DqeP
         2sC8R9B+yYTcrlqGUYDJCxrrLxX4Sjhx4771dzRML8TIh4YP1FLqxRAuZglOqRb/a34q
         VZXNribLCKzRt3Hzjr7lgZj1NQCxdOhClYYc0UqP+WfYvgxTuVAeSbT1Ri0SUN1dv5UZ
         wwCbtlLLuQHzfGQGbCcvOhTjRSjIRHD9Oo/fXEMjhx77EKUdgabqtZyPEZn8hcTXBulZ
         jC/Buwj7S5pvmIPY/hvQKDoJHnFb4MG2f9MuqoyUijPFjEbgAxChC6sbd1kTmdoKpdUH
         NeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6nhuDwBmOYPWZw1JqfkVN8VpC6WSV0QMRfpTWtCr4BUcH/ncRK7ZCMx/hG9cngnEvPXPAiK6OmLmEt7G2hC/bEDivj3UnJqJAVX23K+A=
X-Gm-Message-State: AOJu0YyQn2RCn+ar9vPHtZC4C7r8/ltI3iH8+lAipoByodFlue+LtJX8
	vpiAqVeDAOkANhE46H/M1PY6icEYMlfCLQorSizWQCcF7SL5HKqpeh2DVVC96g==
X-Google-Smtp-Source: AGHT+IF4OKeNbXHmGCWs2pfkxjkmE9Jl7BFlmsliB9Av6MefIMi/hVcCGhta0frWToCOFg7IfkZqfw==
X-Received: by 2002:a05:600c:314a:b0:412:2d3c:9f92 with SMTP id h10-20020a05600c314a00b004122d3c9f92mr715933wmo.13.1708015433792;
        Thu, 15 Feb 2024 08:43:53 -0800 (PST)
Message-ID: <2f1e4d2d-5b33-47ff-912b-c4693744d0e9@suse.com>
Date: Thu, 15 Feb 2024 17:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
 <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
 <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
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
In-Reply-To: <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 17:38, Oleksii wrote:
> On Tue, 2024-02-13 at 14:33 +0100, Jan Beulich wrote:
>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23600
>>
>> What's the linker dependency here? Depending on the answer I might
>> further
>> ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_ or
>> HAS_AS_.
> I missed to introduce {L}LLD_VERSION config. It should output from the
> command:
>   riscv64-linux-gnu-ld --version

Doesn't answer my question though where the linker version matters
here.

>> That said, you may or may not be aware that personally I'm against
>> encoding such in Kconfig, and my repeated attempts to get the
>> respective
>> discussion unstuck have not led anywhere. Therefore if you keep this,
>> I'll
>> be in trouble whether to actually ack the change as a whole.
> Could I ask what is wrong with introduction of such things on KConfig?

Just one of several possible pointers:
https://lists.xen.org/archives/html/xen-devel/2022-09/msg01793.html

> Would it be better to put everything in riscv/arch.mk?

Or a mix of both, as per the proposal. Just to be clear, if I say "yes"
to your question, someone else may come along and tell you to turn
around again.

Jan

