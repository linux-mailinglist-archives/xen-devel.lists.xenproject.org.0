Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FD98B8B2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807917.1219649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZaB-00080C-5L; Tue, 01 Oct 2024 09:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807917.1219649; Tue, 01 Oct 2024 09:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZaB-0007xU-2U; Tue, 01 Oct 2024 09:54:15 +0000
Received: by outflank-mailman (input) for mailman id 807917;
 Tue, 01 Oct 2024 09:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svZaA-0007xO-7X
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:54:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ce5e722-7fdb-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 11:54:13 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c71f1396e4so6806230a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 02:54:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88240a325sm5932262a12.33.2024.10.01.02.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 02:54:12 -0700 (PDT)
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
X-Inumbo-ID: 1ce5e722-7fdb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727776453; x=1728381253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WNJiA63kD4vymkJd/rZ5UAhqsoGGtsreD6aHVmqYDZg=;
        b=YgOfIddxqxTgWHUyQhLfcTnvXxX4syi9n9DDdvezvgwZsw3bzMiAQGUko1GcupE8PA
         M/x3q2825o2Ef3U7gqd4aMQb6yzO5Po/R+r/eyPKq7rJ3TrjaKE7lQCWDMaMBy/YJK4x
         qztHFAVYNdyB5JAvjedNGVdrQzrAe6NfGSv9pAGvm37to+e66LXaJ5tWDEXOKWLlMra3
         9oEvftj6fUdZaPnppnrUb9ij87i4I8pMezUqJbBwMlUGhf9vouOLDmkNdsirOtxKvB1a
         R5ZqlhxqsGz/cD6D9c1FulaHOMQN3ctNv3BhX7Vkh45AWoaCQxB3gc+gndngFeLH1h+S
         E6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776453; x=1728381253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNJiA63kD4vymkJd/rZ5UAhqsoGGtsreD6aHVmqYDZg=;
        b=lltbXIs7iBBRRiIQxXiXT5Wt/hklv4aKm18bk2uFaBVIIfmKnOOhWEWr05grN6JlEe
         6Zz+Gu+RQY4Cqs17Y9dJ/qR0kqbkRwzP14ZcMEmvZ8leXVt3IpHUFDdjwXWzHuMBXkRf
         tmqyarzdByl/cGqpIqwJpTZDO/X5qNCinT2mAhImfaAWDWtoBXI9ro1xj25Cpi974Nbr
         d2YoeVoyDLl315LjkymfxTmjvSDgPVJTWv00WoUhpphG+p2z/ZRO7u0Kls1utuMtzJrX
         h8EPJMGuzcRgcDSu9uZcYdo1OC7wktPFWi9vw98CflXPBNXyXaifNya94pSIzEGD1ziI
         WaFg==
X-Gm-Message-State: AOJu0YyuFoUqKeXFcXy9u6STehqni616qKEO8UJPJfmKkrPuZRN42IfX
	Z1vFQ+D+oZbYf4/dx7UKC/icPH3AxW9K7v0lKeda5aHJssrh+4sImxl3BAGNIg==
X-Google-Smtp-Source: AGHT+IGD0B5Hm7VVr72fABC2wtCzH+bJb4g+dfqwP+M1vNPMHXb70CE/dyHXnzQVrsFTZtWl5qDByQ==
X-Received: by 2002:a05:6402:371b:b0:5c4:a62:e1f1 with SMTP id 4fb4d7f45d1cf-5c882603c1amr12331372a12.29.1727776452672;
        Tue, 01 Oct 2024 02:54:12 -0700 (PDT)
Message-ID: <f54ffc9e-3721-412e-be52-c93a1a801cca@suse.com>
Date: Tue, 1 Oct 2024 11:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/gnttab: address a violation of MISRA C
 Rule 13.6
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Federico Serafini <federico.serafini@bugseng.com>
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <cfd2873eb69707ec3f33ea888951ae5676c43bab.1727690180.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2409301549100.451631@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2409301549100.451631@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 00:53, Stefano Stabellini wrote:
> On Mon, 30 Sep 2024, Federico Serafini wrote:
>> --- a/xen/common/compat/grant_table.c
>> +++ b/xen/common/compat/grant_table.c
>> @@ -78,12 +78,15 @@ int compat_grant_table_op(
>>          cmd_op = cmd;
>>      switch ( cmd_op )
>>      {
>> -#define CASE(name) \
>> -    case GNTTABOP_##name: \
>> -        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
>> -                                                           gnttab_##name##_compat_t), \
>> -                                         count)) ) \
>> -            rc = -EFAULT; \
>> +#define CASE(name)                                                  \
>> +    case GNTTABOP_ ## name:                                         \
>> +    {                                                               \
>> +        XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
>> +            guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
>> +                                                                    \
>> +        if ( unlikely(!guest_handle_okay(h, count)) )               \
>> +            rc = -EFAULT;                                           \
>> +    }                                                               \
>>          break
> 
> We would typically put the break within the case { }

That won't work very well with the break not having a semicolon, for the
semicolon to actually be used when invoking the macro. Moving the break
(while adding a semicolon there) as you suggest would then mean the use
site semicolon to end up being an unreachable statement.

Jan

