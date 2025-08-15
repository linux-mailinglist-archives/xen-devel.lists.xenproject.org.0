Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAAB27AD8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082942.1442619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umphU-0002mO-V7; Fri, 15 Aug 2025 08:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082942.1442619; Fri, 15 Aug 2025 08:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umphU-0002jq-SQ; Fri, 15 Aug 2025 08:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1082942;
 Fri, 15 Aug 2025 08:22:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umphT-0002jk-SA
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:22:11 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef1dc478-79b0-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 10:22:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b11b2so2221375a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:22:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfcce74sm86771566b.70.2025.08.15.01.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:22:07 -0700 (PDT)
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
X-Inumbo-ID: ef1dc478-79b0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755246128; x=1755850928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FicuPYQ+5C0gzJB+7lhCWVOUMKux/rD98bas8hJhuOs=;
        b=CQF/ANW0gCp5Vpe5KyCq3bJjpSBAVjE8ASzJOqGXTW0xZJYUc3eoqNH4i8QYxsjnDm
         wyP448gELVGf7n3Ij0df5tdci3Rl0gE081vuqnjfwP6PDtHp15mXcBPFSSdROF9I3Onw
         2QcfYvY4zMYHfn8CXAj+K6R/l7RMjfZODs6N3j09M1lRlTVWBT+EQP76uTHZr9rtdnOS
         dHRwccrKnaX3VGca78GTQyLnUOHjhFiayxzlqaxgb2yp+SHR5avEFMhH/QpFqqS5qRKf
         lwnl9zVPCgjlkvKvwdrRceYPFBpkih6LLkBJNux4XCBWF3IouSEjUqALYhfxJOqoaTRD
         L02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246128; x=1755850928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FicuPYQ+5C0gzJB+7lhCWVOUMKux/rD98bas8hJhuOs=;
        b=QORoL5NUYzJY/kAtIbF5vO5D8aAzmKt6YyIDDiCTFfoV7P1mYgLN3v/4rZw7hV80un
         5FNvmErgFe4JIvr8j2/fUjhcyjW787BDmQq50HKRnS3AHKmL7Fj0EH8KZVfBor9JlaBW
         CWxHNeb6/BXo/UvgcIurtDWOn3CcdvmOI/YoK6qOw4V47av1A0SWIt/aAvi0VvihwB1i
         0CSsJ8PCXqe1Uij2ZOullb+BP5DKNw8BmRJekuffq6pcfBaainHg1j7Lg6FLSyjxy+4y
         cNkHkdEeqApLujDNewgNNWHhknsTgfMQ87F63uV6OZwO7cFCZY90RgDitRcaIsRLA15H
         w1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUwuBG//LovLl0qTjRUXgO30s1mw/XAFH9WiCZ+4cM+YocpUpwoxq6d2K1S5pqElbfPzbMNLygLphc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAVCR+jf0Bl32c4Ywj6BdYjIIOlKQzVJKl4IJbpYpyFIoDe1Nl
	MFwFf8qn9nKbVLlRG9VRLUllgn47mYssSBVq5X7d1kivi1vKy38wwxU8shufYIY7ug==
X-Gm-Gg: ASbGncurEJ9faZ00UwUpHmWeDzd21GCqG2be2MmdsmI0ToeC0xNTwj9Ra3w8Y1mBAIN
	PCfz/NQb5w/Wu5+KxkZgUwzJBVvcsDndpfe5D4q2iDoXgGNM0o6HU16rZN56j7kQ6PTIWs+HZY3
	vjTP0YNCM2DyDPw17PC8Le0ZfKTtio/IaONMM1nldDymtv8SoGDqCuHVcTBRh2Wqp05Ev/4ke5a
	3ELTayYJ/y2abUqYSswvTynZ/B/tnAxkVcqWZjuEbLNX2K6tD1o7E5Q4t4Gf5EY02xPvfmvDkW5
	Emg8O6r0OJiqFyVvKllYrFjCAKpM+guSBaHKALmzoHbVB1DLWVSgWpVFOtwBD08PArrazLx5Dt4
	0dmRFSNF/B6ri7X31h4VH1k6WmIhwPDc7JAB87GnUc2rnv7DU45YltHN1S8Os3nEnqajCk1Tr+w
	G1kmHHgXGPWqtRBMUd7g==
X-Google-Smtp-Source: AGHT+IEEGzfvZlFG9jwdVm5SXpogJTGqn+2ywMgCSU+x22t3Sl8pmaFUrvDjCJoiPNLgVVL1Lqbm9A==
X-Received: by 2002:a17:907:70c:b0:af2:4769:8917 with SMTP id a640c23a62f3a-afcdc24e050mr78524866b.37.1755246127676;
        Fri, 15 Aug 2025 01:22:07 -0700 (PDT)
Message-ID: <0e9878a9-fb0d-4d18-ab15-eb248629b192@suse.com>
Date: Fri, 15 Aug 2025 10:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
 <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
 <8e0b4a82-3189-4446-96a8-921d8ae44a21@suse.com>
 <5def44a3-4139-4870-94f2-cb895078f968@citrix.com>
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
In-Reply-To: <5def44a3-4139-4870-94f2-cb895078f968@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 20:09, Andrew Cooper wrote:
> On 14/08/2025 9:55 am, Jan Beulich wrote:
>> On 13.08.2025 13:25, Andrew Cooper wrote:
>>> On 12/08/2025 10:19 am, Jan Beulich wrote:
>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
>>>>> simplify setup"), load_system_tables() is called later on the BSP, so the
>>>>> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
>>>>>
>>>>> Move the BUILD_BUG_ON() into build_assertions(),
>>>> I'm not quite convinced of this move - having the related BUILD_BUG_ON()
>>>> and BUG_ON() next to each other would seem better to me.
>>> I don't see a specific reason for them to be together, and the comment
>>> explains what's going on.
>>>
>>> With FRED, we want a related BUILD_BUG_ON(), but there's no equivalent
>>> BUG_ON() because MSR_RSP_SL0 will #GP on being misaligned.
>> That BUILD_BUG_ON() could then sit next to the MSR write? Unless of course
>> that ends up sitting in an assembly source.
> 
> It's the bottom hunk in patch 14, which you've looked at now.
> 
> Personally, I think both BUILD_BUG_ON()'s should be together, because
> they are related.

I don't really agree, but I also won't insist on my preference to be followed.
IOW please keep as is.

Jan

