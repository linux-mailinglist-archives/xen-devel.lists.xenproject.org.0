Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACC9856D2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803773.1214576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOr3-0000Ls-FW; Wed, 25 Sep 2024 10:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803773.1214576; Wed, 25 Sep 2024 10:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOr3-0000JD-CS; Wed, 25 Sep 2024 10:02:41 +0000
Received: by outflank-mailman (input) for mailman id 803773;
 Wed, 25 Sep 2024 10:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stOr2-0000J7-6m
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:02:40 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bf37f19-7b25-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 12:02:39 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so567932a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:02:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4f77dsm190523766b.49.2024.09.25.03.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 03:02:38 -0700 (PDT)
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
X-Inumbo-ID: 4bf37f19-7b25-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727258558; x=1727863358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgh6U+o953EI1t/cO5C597di0x+Dzl/gRTzlRhbrSJM=;
        b=Fq3WiU9h+oJ14w3ZKlcQ1Kg/TsB3dMRu8/0BZIuHMqqcXsd6tLc9/KdqKAUPXpJ/Hp
         mGhcuutNphO8X8rj097ebmzmcijBrdmD2zZU7/9ZYmAgNu29cF3pSFG7E0FHBcLu32Af
         FgGRdhpyysvAN2wcukOd+ZP4OMqTnrrkOLYkEK6g/rodX3w8RY94VIz1WmfR2bwJ52nJ
         obh5WKxDPQ6Zux8yxWKUF+Cq9kMss2ohGK6Rl73JfvLxXZQkGpXrMcF64lZPPlu2Psan
         wSy77X4px9cJ0SuQrWPec0g1R41JCVjFVs1KvS1M8pM1i6TpgD4gYtoSVJV91IT3oUSr
         UYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258558; x=1727863358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgh6U+o953EI1t/cO5C597di0x+Dzl/gRTzlRhbrSJM=;
        b=OtuxOuZO+G8ywokNoGdNVWMeN6gXdiEZHkq3AP/Ojf4eEo76VBCk8tipGwB3G7jHyQ
         OytsRBKul1cwlrsRQEV4mmAt8Yhy5gGAGcQCz2wg2r3WF0nUwH20V4I6tVc5t0kAg0L+
         +Ipdx822ld5wZbOBZjzqWQG1HaqfP0qMFH7SmdZ1nF+/M49YjJiSIbs9B5FkSo4EBjbA
         cZyFX/WjGHo0nE0b7IY+MeOIZ53FqXSDV39QG3n+Rr4jvDTV3jP+g3jJ64usMMWsFhpS
         rTdGmuEMqQFgHQjn3VG83d3WU5pSoAlh4BGSbvR8AIPMP+k0SQElM/w2T5tejqV07tXY
         n67Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtudwalXoA9XmO1m1O2YzGIWzdnOL0FZQ7azKFOq87UQex7meLCZWaZwPs0PcaQMcEesP26ioafb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzX1VXwwZKJD1EsqkoLnXdm/vQk5ZiFrZy7LMp8Lp/OXDvckF4
	QiCXt/IZeIv25BfwVGZevSJi3BwpPEtqil3atpTgZuYhSt1Y/CocEQi3zeUqDkF/GLTEdvFEBzg
	=
X-Google-Smtp-Source: AGHT+IGDWn6prwaw13H12Ms2SSnMqczLAX7OfO57Q19dB/476YStfKFy5LUlThXZ/a9210Rw8Jkfxg==
X-Received: by 2002:a17:907:3f96:b0:a86:7a84:abb7 with SMTP id a640c23a62f3a-a93a035d752mr203117366b.20.1727258558465;
        Wed, 25 Sep 2024 03:02:38 -0700 (PDT)
Message-ID: <d7fc6937-e384-4340-b946-2774ceec373d@suse.com>
Date: Wed, 25 Sep 2024 12:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-6-roger.pau@citrix.com>
 <5a22e8a0-da9d-415f-85a5-42d2a372a08e@suse.com>
 <ZvPX1jFl7DLyXHk8@macbook.local>
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
In-Reply-To: <ZvPX1jFl7DLyXHk8@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 11:28, Roger Pau Monné wrote:
> On Wed, Sep 25, 2024 at 11:01:08AM +0200, Jan Beulich wrote:
>> On 25.09.2024 10:42, Roger Pau Monne wrote:
>>> alternatives is used both at boot time, and when loading livepatch payloads.
>>> While for the former it makes sense to panic, it's not useful for the later, as
>>> for livepatches it's possible to fail to load the livepatch if alternatives
>>> cannot be resolved and continue operating normally.
>>>
>>> Relax the BUGs in _apply_alternatives() to instead return an error code.  The
>>> caller will figure out whether the failures are fatal and panic.
>>>
>>> Print an error message to provide some user-readable information about what
>>> went wrong.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Albeit ...
>>
>>> @@ -394,8 +418,10 @@ static int __init cf_check nmi_apply_alternatives(
>>>                                   PAGE_HYPERVISOR_RWX);
>>>          flush_local(FLUSH_TLB_GLOBAL);
>>>  
>>> -        _apply_alternatives(__alt_instructions, __alt_instructions_end,
>>> -                            alt_done);
>>> +        rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
>>> +                                 alt_done);
>>> +        if ( rc )
>>> +            panic("Unable to apply alternatives: %d\n", rc);
>>
>> ... I see little value in logging rc here - the other log message will
>> provide better detail anyway.
> 
> Current log messages do indeed provide better detail, but maybe we end
> up adding new return error paths to _apply_alternatives() in the
> future.

I'd expect such error paths to then also have dedicated logging.

>  I see no harm in printing the error code if there's one.

Well, it's not much harm indeed, yet imo extra data logged also normally
wants to have a reason for the logging. After if you look at the log,
you'd expect every detail to tell you something (useful; in some certain
cases at least). Anyway - I don't mean to insist on the removal, it just
looked pretty useless to me.

Jan

