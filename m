Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2A8794EE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691856.1078341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk20D-0004wg-Rj; Tue, 12 Mar 2024 13:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691856.1078341; Tue, 12 Mar 2024 13:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk20D-0004u6-OA; Tue, 12 Mar 2024 13:17:09 +0000
Received: by outflank-mailman (input) for mailman id 691856;
 Tue, 12 Mar 2024 13:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk20D-0004tO-53
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:17:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d419dd4f-e072-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 14:17:08 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so89911366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 06:17:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b23-20020a170906039700b00a463a265b3bsm988113eja.220.2024.03.12.06.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 06:17:07 -0700 (PDT)
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
X-Inumbo-ID: d419dd4f-e072-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710249428; x=1710854228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfLh6d5uT4EjKMiqAgSJefYC6srarOg0RB32K2RRr0c=;
        b=F879kuc6AWi+q4xHvD5YMIew8Nxf5WJwcyIq22ppV+3GZMB22xKdwVkd/NfFVGVM0d
         /juKS/JS6Wo1m+rcHW/ZHjNvZZY8Y051gYYTAEOqjcpU7A48c9W5pE0XYytCfJh134UX
         zgDR+iQgaQi+oSon7acu0cB9Bi/aorP5RUqcofWt7+2FkYJLtK/fUarBeV01qmRY1wnz
         rvws8V0KtR6IlaTfrSKY3FodWgZormMQ3/iw+1R+q3TkgOlLKqAxkPLge325KVDOh7Ch
         yY8Fa2HG/wpoYmj/7mcIXm/CSF/kPR4WiO9yPTTr4KU0oK+E1OF6RR366nO+/7mVGkb0
         GEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249428; x=1710854228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfLh6d5uT4EjKMiqAgSJefYC6srarOg0RB32K2RRr0c=;
        b=qmQqz6Y99iArmLQYK+h6cYT9TIUdMjUPZCn823qNq4/4GQEzzWJK8e0RzJZf8KcUXR
         FrkQQCJvhx2K34aLc5wSzubI+jtABNEg3/8HQji4h5EeG6i6T5SfUJSH27Z/o+HMdLbo
         awKVUHzF5ProHZOJpnwhPnuBqRfFe0wlAI+8BOgzibH0KTu6jBQVMYNg1eQ928ET1Rw5
         2cHk6NLc5L+ePr2QELy8MNOD/g4LYfEPu9PY0uP/HaA3YPcvmt5XyVXbGJlOOhFl1aLC
         kd1sZX3ZE6QDNy3ha2Klgk7TQIeW7JAPCwEmA8Ke5TotQGvZmYsXmsUu9cSdK9HIbdUb
         SViw==
X-Gm-Message-State: AOJu0YxyWaaK+EpY4xSp5PD2bTuJigcL6P86RfX7MxhcLYn5T1vP/131
	+uRc5NQ4vmqoMHhu2I3FNW36BB5aXnTP0wbg/TWheCB6xvNjMoHbWc+mlY7qbQ==
X-Google-Smtp-Source: AGHT+IE/d/lFiYcPWZxButJgHCiNQkXVQ0FNdbu4Zc7LdlIySBF2RXietz56/fkO/j3AlT3M6EXYnA==
X-Received: by 2002:a17:906:c50:b0:a45:4ba5:2917 with SMTP id t16-20020a1709060c5000b00a454ba52917mr5619020ejf.75.1710249428034;
        Tue, 12 Mar 2024 06:17:08 -0700 (PDT)
Message-ID: <6da353df-0954-4ca5-b8b1-2e7b5f98c901@suse.com>
Date: Tue, 12 Mar 2024 14:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PoD: move increment of entry count
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
 <CAFLBxZbSWEW4DK5tdi24cBBG7P06iGpORMXXevb_g50pgXzQKw@mail.gmail.com>
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
In-Reply-To: <CAFLBxZbSWEW4DK5tdi24cBBG7P06iGpORMXXevb_g50pgXzQKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2024 17:04, George Dunlap wrote:
> On Tue, Jan 4, 2022 at 10:58 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> When not holding the PoD lock across the entire region covering P2M
>> update and stats update, the entry count should indicate too large a
>> value in preference to a too small one, to avoid functions bailing early
>> when they find the count is zero. Hence increments should happen ahead
>> of P2M updates, while decrements should happen only after. Deal with the
>> one place where this hasn't been the case yet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Add comments.
>> ---
>> While it might be possible to hold the PoD lock over the entire
>> operation, I didn't want to chance introducing a lock order violation on
>> a perhaps rarely taken code path.
>>
> 
> [No idea how I missed this 2 years ago, sorry for the delay]
> 
> Actually I think just holding the lock is probably the right thing to do.
> We already grab gfn_lock() over the entire operation, and p2m_set_entry()
> ASSERTs gfn_locked_by_me(); and all we have to do to trigger the check is
> boot any guest in PoD mode at all; surely we have osstest tests for that?

The gfn (aka p2m) lock isn't of interest here. It's the locks whose lock
level is between p2m and pod which are. Then again there are obviously
other calls to p2m_set_entry() with the PoD lock held. So if there was a
problem (e.g. with ept_set_entry() calling p2m_altp2m_propagate_change()),
I wouldn't make things meaningfully worse by holding the PoD lock for
longer here. So yes, let me switch to that and then hope ...

Jan

