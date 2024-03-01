Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81786E440
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 16:25:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687727.1071498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4km-0003Td-Jn; Fri, 01 Mar 2024 15:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687727.1071498; Fri, 01 Mar 2024 15:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4km-0003Re-H8; Fri, 01 Mar 2024 15:24:52 +0000
Received: by outflank-mailman (input) for mailman id 687727;
 Fri, 01 Mar 2024 15:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg4kk-0003RY-J6
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 15:24:50 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c4b322-d7df-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 16:24:49 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3e552eff09so309928366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 07:24:49 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bq5-20020a170906d0c500b00a43bf243342sm1794350ejb.24.2024.03.01.07.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 07:24:47 -0800 (PST)
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
X-Inumbo-ID: d7c4b322-d7df-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709306689; x=1709911489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0040ipsv4HL0h/S5Bl+ETToBshF56Om1ClMWwAp3WTc=;
        b=ViI3fIdpnpJw93Zz9ZajUUl8lPR3ZgWglsfKzZxunjcSpW3Ez9bVF+4PK1aG86+Djs
         liCNMn6D2mykHmU5KGI6+KLcA1MzntrZUS6cmTihudTxLzC2uFJE6DjJ349yPsdw5yIP
         Ikj5p22+0jOUZrvdG8qTrlR2cSQi8jKV4sxYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709306689; x=1709911489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0040ipsv4HL0h/S5Bl+ETToBshF56Om1ClMWwAp3WTc=;
        b=Gv1JUDnPpWkpSCqdj25wyeCxQ3RLRcLLCW5/SD69iIQyuKbaHvw+NkgZlMVHbIhq6u
         XK6FoNMZMlCuWluzShSgcLRqOMf574a+y1Hj+C6kgdFbSjOB45BkuKKmi/4BNsD0Fa1O
         QklgCB4+Ie1zRRVol28Gb2+HEGIzWu0W+2inkkuNZ+JfzmmkGGxrpxK9bzGY6msI9UAF
         B/4kpPgWE6pijJi4BQBs5LdQXm/FJVzK2U1bW7GDsj2/QONt5Hdfde0Yb+OMBP0nMJYb
         XGw5Atc2Fia1nmMYsXKjjxyLQzy0LSnTWp2Ronmbih8KUj6EVcExImNJpsCy4kj1m05n
         9p6g==
X-Gm-Message-State: AOJu0YwY1IjsXSJhSYf90ZDNyON3QMv68OtuOlrGCnj0F0sPF2NKCsEK
	kyW/ghNs5yY4HDulIZ5QrtGYIARlxGFVi34qUL79tmKemesj+CH/eLeD2QuM7/c=
X-Google-Smtp-Source: AGHT+IFuejmRGKbsFrc0ktfT1ac6SZwkkffvcmCcAIUu0Mq6RjHfU9U/9402tgSSLweTtQn2sRzQ4Q==
X-Received: by 2002:a17:907:20b9:b0:a43:eb29:a293 with SMTP id pw25-20020a17090720b900b00a43eb29a293mr1393956ejb.5.1709306688796;
        Fri, 01 Mar 2024 07:24:48 -0800 (PST)
Message-ID: <cbef216a-3f8f-4dd2-a83e-7bfe129b62fb@citrix.com>
Date: Fri, 1 Mar 2024 15:24:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
 policies
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240301112829.2657865-1-andrew.cooper3@citrix.com>
 <ZeHKWiHvsw_yMT0Y@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZeHKWiHvsw_yMT0Y@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 12:30 pm, Roger Pau Monné wrote:
> On Fri, Mar 01, 2024 at 11:28:29AM +0000, Andrew Cooper wrote:
>> The block in recalculate_cpuid_policy() predates the proper split between
>> default and max policies, and was a "slightly max for a toolstack which knows
>> about it" capability.  It didn't get transformed properly in Xen 4.14.
>>
>> Because Xen will accept a VM with HTT/CMP_LEGACY seen, they should be visible
>> in the max polices.  Keep the default policy matching host settings.
>>
>> This manifested as an incorrectly-rejected migration across XenServer's Xen
>> 4.13 -> 4.17 upgrade, as Xapi is slowly growing the logic to check a VM
>> against the target max policy.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
> I have one question below.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/cpu-policy.c | 29 ++++++++++++++++++++++-------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index c9b32bc17849..4f558e502e01 100644
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -464,6 +464,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>               raw_cpu_policy.feat.clwb )
>>              __set_bit(X86_FEATURE_CLWB, fs);
>>      }
>> +
>> +    /*
>> +     * Topology information inside the guest is entirely at the toolstack's
>> +     * disgression, and bears no relationship to the host we're running on.
>> +     *
>> +     * HTT identifies p->basic.lppp as valid
>> +     * CMP_LEGACY identifies p->extd.nc as valid
>> +     */
>> +    __set_bit(X86_FEATURE_HTT, fs);
>> +    __set_bit(X86_FEATURE_CMP_LEGACY, fs);
>>  }
>>  
>>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>> @@ -514,6 +524,18 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>>              __clear_bit(X86_FEATURE_CLWB, fs);
>>      }
>>  
>> +    /*
>> +     * Topology information is at the toolstack's discretion so these are
>> +     * unconditionally set in max, but pick a default which matches the host.
>> +     */
>> +    __clear_bit(X86_FEATURE_HTT, fs);
>> +    if ( cpu_has_htt )
>> +        __set_bit(X86_FEATURE_HTT, fs);
>> +
>> +    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
>> +    if ( cpu_has_cmp_legacy )
>> +        __set_bit(X86_FEATURE_CMP_LEGACY, fs);
> Not that I oppose to it, but does it make sense to expose this options
> to PV guests by default?  Those guests don't really have an APIC ID,
> and I think we don't expect any of the topology information to be
> usable by them in the first place.

This patch doesn't alter what PV or HVM guests see by default.  This
hunk only counteracts the prior hunk forcing visibility of the two bits
in the max policy.

Whether it is sensible for PV to see this is a different matter, and
it's actually very complicated.

On systems without CPUID Faulting, we have to contend with PV guests
seeing mostly host data, whatever Xen would prefer.

With CPUID Masking, we can hide (Intel) or hide/set (AMD) these bits in
the feature leaves, but we can never stop the host value leaking into
lppp/nc/etc.

For better or worse, when the toolstack is divining a policy for PV
guests, it also chooses the host HTT/CMP_LEGACY values.

We should reconsider all of this when we've got topology working
sensibly for HVM guests.

~Andrew

