Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E919088121A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695910.1086205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvkp-0000YH-5e; Wed, 20 Mar 2024 13:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695910.1086205; Wed, 20 Mar 2024 13:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvkp-0000V4-2B; Wed, 20 Mar 2024 13:13:15 +0000
Received: by outflank-mailman (input) for mailman id 695910;
 Wed, 20 Mar 2024 13:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmvkn-0000Uy-Ck
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:13:13 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a92a5ab-e6bb-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 14:13:12 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so7600497a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:13:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a056402091200b00568b6f73491sm5523208edz.14.2024.03.20.06.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 06:13:11 -0700 (PDT)
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
X-Inumbo-ID: 9a92a5ab-e6bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710940392; x=1711545192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4Knu+N3h3s5QMvzeNSrDHIQP1y/gcNwYue6TG77bt8=;
        b=ItzZ1rgqS34aFAFs51EUdioIRhnIVto+BilT+FQRkXWfVqIB07KthY53ArGYfdclkd
         dq2PVOOHK/1gSsk2b/r9N347pc2RaYCgOIKa1m4do0A5m36yjrUtnRN39wcs7FhSU8oo
         wriC/VBLExqhP1Ak0Vc9J85Qg/ApFsLNghIDYo/eJUdA17kijZD9ZU1y6ow0jarXukJp
         FQfI8Raxg5E3sTq/iIYe2MO/SkiL8CpQdaEF968ChPPHJOVylZZf0wQex0e7EUK7ekeg
         z5aUlQeMkuXAvWotxWQMWetQ2377bdB8RQq+mDD+Zh66sE5j96WAG9yDCfddKZ7IXO1u
         clOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710940392; x=1711545192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4Knu+N3h3s5QMvzeNSrDHIQP1y/gcNwYue6TG77bt8=;
        b=xRPWsILgdYxqa8f9oZE0+DsxDmmk9rrajBHuEMSWCjCu3EFre0xttLyccGd/CyEeXL
         6PG8OIaOWqdVCLjginNlQeH7XVCHQxAY8oO2MB25yxJEQeYYIW1Mo3iNE1v0sPaHPHT/
         9veD4XNArMXC0mN0yZNZ52FoFAGspqa8WVB+eX1Sxl6Ol5roneyfjCDZx8RIpKAkROA+
         /egeuklEmWJuSsYeMD8Qii4jDpdqmzLPkkE+9zu8Fx06e8hODRRZmhKKJerjDnZJywE1
         pWeQ1/Ov10bagv9D/RtCoAU7jvfW30CHM1veQqIdY3tIaNEvElbemVL8TI8uCGKg1MlW
         uLBA==
X-Gm-Message-State: AOJu0Yzeu1gwa/6rbBxBjDtWLJX4N/T75RHKHcI5BhGl19khp1VdViVQ
	obHHSsR6EFRjo8SCPPd6d/Vrsj/Q693Av6/XgoTJVuXCXZzgRvAOFLeajQ7vTA==
X-Google-Smtp-Source: AGHT+IF4p505pV2rzIXObwWCPCriSjExyMKIcWfrtVXL561xq9VOABYXSWM1jYf8knfRLphzjRSQ1Q==
X-Received: by 2002:a05:6402:4499:b0:566:2aff:2d38 with SMTP id er25-20020a056402449900b005662aff2d38mr4255474edb.26.1710940391746;
        Wed, 20 Mar 2024 06:13:11 -0700 (PDT)
Message-ID: <bb02d6b9-fb23-48d5-9c79-b40a32cc66d3@suse.com>
Date: Wed, 20 Mar 2024 14:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/credit2: Clean up trace handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-3-andrew.cooper3@citrix.com>
 <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
 <19d9487e-67cf-4c1e-9dc6-419d9c5d0120@citrix.com>
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
In-Reply-To: <19d9487e-67cf-4c1e-9dc6-419d9c5d0120@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 13:19, Andrew Cooper wrote:
> On 20/03/2024 12:16 pm, George Dunlap wrote:
>> On Mon, Mar 18, 2024 at 4:36 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> There is no need for bitfields anywhere - use more sensible types.  There is
>>> also no need to cast 'd' to (unsigned char *) before passing it to a function
>>> taking void *.  Switch to new trace_time() API.
>>>
>>> No functional change.
>> Hey Andrew -- overall changes look great, thanks for doing this very
>> detailed work.
>>
>> One issue here is that you've changed a number of signed values to
>> unsigned values; for example:
>>
>>> @@ -1563,16 +1559,16 @@ static s_time_t tickle_score(const struct scheduler *ops, s_time_t now,
>>>      if ( unlikely(tb_init_done) )
>>>      {
>>>          struct {
>>> -            unsigned unit:16, dom:16;
>>> -            int credit, score;
>>> -        } d;
>>> -        d.dom = cur->unit->domain->domain_id;
>>> -        d.unit = cur->unit->unit_id;
>>> -        d.credit = cur->credit;
>>> -        d.score = score;
>>> -        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
>>> -                    sizeof(d),
>>> -                    (unsigned char *)&d);
>>> +            uint16_t unit, dom;
>>> +            uint32_t credit, score;
>> ...here you change `int` to `unit32_t`; but `credit` and `score` are
>> both signed values, which may be negative.  There are a number of
>> other similar instances.  In general, if there's a signed value, it
>> was meant.
> 
> Oh - this is a consequence of being reviewed that way in earlier iterations.

Which in turn is a result of us still having way to many uses of plain
int when signed quantities aren't meant. Plus my suggestion to make
this explicit by saying "signed int" was rejected.

> If they really can hold negative numbers, they can become int32_t's. 
> What's important is that they have a clearly-specified width.

And please feel free to retain my R-b with any such adjustments.

Jan

