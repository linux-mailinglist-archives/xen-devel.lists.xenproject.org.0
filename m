Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0071B09AEE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047927.1418234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdbi-0002cC-Bi; Fri, 18 Jul 2025 05:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047927.1418234; Fri, 18 Jul 2025 05:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdbi-0002Zi-8V; Fri, 18 Jul 2025 05:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1047927;
 Fri, 18 Jul 2025 05:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucdbh-0002Zc-F6
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:26:05 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2df53ff-6397-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 07:26:04 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so9361275e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:26:04 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2b945sm791191f8f.22.2025.07.17.22.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:26:03 -0700 (PDT)
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
X-Inumbo-ID: b2df53ff-6397-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752816364; x=1753421164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2WklU+nWWEWXG9k/djp+Z/ZvT5EPiTbaDw2VZZFNjEI=;
        b=bagMEOeGEzdJgLT0fxKSlCCoG1LfsRz2j9SaHqYhs+SO2Yrf5RHL9lwgHsfMDirIr9
         GKd0GcpBbCKCRqXQQ4dOG8c/7GsdlTdThJCmYkPFm7e4Y7yjpdVyEWf3ofYwvDb+DCYE
         QaTcWs5/c2mbK/vGQqtfMgf6cIy7r77vBJyQSnT/D42aJCDWQJujhVEVqeSPnDQRD9aV
         78TOg45NFIRex4rTBE69Tyni/Anrb1pJvpCYVsNzCw+aGyP1Kb6eX11TX8zROW5qRgpG
         DuPHgBI02fmKfHiUTZgSyTDwlb9M85y8tt2//Jk6UoWygcsMHX+qmYRijgD1g+gkYYGU
         TkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752816364; x=1753421164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WklU+nWWEWXG9k/djp+Z/ZvT5EPiTbaDw2VZZFNjEI=;
        b=Dh3v6ySky4xY3oJUBVU/yFIst6mUBWlmgBqI+JhZUgNTZLvU2PMnNJxYNdtIzojM24
         zUu2ZBmTBpFlumHzxyOlNQvxzubAIQvq+yQ5sgif4gJZQ8FFgL0ZTTR4C/fpI4jav2Cs
         xCnHAIBCrwiv7c0MziaDFpzSUyQxF4ptu+tuG/gtXkaKVc6owdsS8YT+I4RH3PMTjYOw
         Sd8/KvdvlXDDsbBxtHOTVvhvhdc+X3sHjbxcBAnIJ9yB9Ms4KVlEV335D4jkhpo62d/y
         eSHCpY9GYtmtPA4f4vwpgNlb+Tvq+A8zNF8GU4/XlB+Z3zYvDgRiyVlbQqts1aJGAIgX
         bv4w==
X-Forwarded-Encrypted: i=1; AJvYcCWe1oRoLerh7QjZPc8AhTa7TstyXsZ16q5w3faAOpZDF2ExVxc4tzDTYdQjWsD/nMMl3dURPVS+0xA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwT5SGXyflOkpZvkThPhH8IweCDrQl6excS/M3dMZkIewWjysm1
	5QZg8zhfXriYIFKWHRpLiTUeaJbRpDo8/GWHCRfu1QsHV5PUEgQmiTWoJJrE9MMyEg==
X-Gm-Gg: ASbGncukxBt6l3bRyuKBUOmGoD0+03T4UDSqVqZ+ov1GAg0vSGMbZBrvvledlCOTbZT
	z3LvHkvBFTsyUF1ldmNYmh2o8MgXT1FSfozuC+RwWbOyNQsn0OLZsSZWkPto/yWCa7N/HE1ibTb
	6IoBrl3HpqoR8unCybxFP1S7OKbxRB4HkZkJV7ttXmIHgkUBWzJ9XzMWAD/44158ZYQGJ3rb7fp
	N6DP8EpbFBxPszYaitoaXMAWI+2SNOSvXZuVN9xGnKgkF5qCPM2MsFtfOJ+BEg6ZA7+FrFVEmG+
	p39bTTLTP7CHozuajYxIYxOGPWvavjQtUHATkNEWG0DlNzs494S8/uv2vcRl5A7v/tdrqz4CVi8
	akRDy5BQ1o5+96GWIkyw+W5L06oHbOL3aM8qTFCl1ojkB/umWoab7OL7fX62np9NEJ8q1fw9ikZ
	O3VVvES1Sr+Y8QCW32Jfqyr4ZvJtpbwUj6ny95tAMqKca/rcB+ReLU206vLAdeq1wwku8=
X-Google-Smtp-Source: AGHT+IH8m8Mar//0GKWcQzOCf2oubGWVkfJEsWbGB/DHqqQN0l0NBLngasiDSwJaJdeElrOGSu9q1w==
X-Received: by 2002:a05:6000:24ca:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3b613eab259mr4031924f8f.54.1752816363566;
        Thu, 17 Jul 2025 22:26:03 -0700 (PDT)
Message-ID: <355a37bb-632a-4a79-8498-8b4b57b279a2@suse.com>
Date: Fri, 18 Jul 2025 07:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250717130147.2842159-1-grygorii_strashko@epam.com>
 <d8778c57-c934-46d5-a600-dcdb2ca5ec26@suse.com>
 <72a6cd66-e811-4776-ad93-979b65e69a10@epam.com>
 <10e9c04f-7de8-4aa2-a555-0a5cb975e91f@suse.com>
 <fd0ccbd6-dd12-47aa-a2f1-93d2ae1b24a5@epam.com>
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
In-Reply-To: <fd0ccbd6-dd12-47aa-a2f1-93d2ae1b24a5@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 20:55, Grygorii Strashko wrote:
> On 17.07.25 18:33, Jan Beulich wrote:
>> On 17.07.2025 16:41, Grygorii Strashko wrote:
>>> On 17.07.25 16:10, Jan Beulich wrote:
>>>> On 17.07.2025 15:01, Grygorii Strashko wrote:
>>>>> --- a/xen/common/event_channel.c
>>>>> +++ b/xen/common/event_channel.c
>>>>> @@ -975,6 +975,9 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>>>>>        int port;
>>>>>        struct evtchn *chn;
>>>>>    +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>>>>> +        return;
>>>>> +
>>>>>        /*
>>>>>         * PV guests: It should not be possible to race with __evtchn_close(). The
>>>>>         *     caller of this function must synchronise with pirq_guest_unbind().
>>>>
>>>> Isn't this function unreachable on Arm, and hence a Misra rule 2.1 violation,
>>>> requiring #ifdef around the entire function to address?
>>>
>>> Yes. It's unused on Arm, only x86 is an user.
>>> I can put it under ifdef.
>>>
>>>>
>>>>> @@ -1710,10 +1713,15 @@ void evtchn_destroy_final(struct domain *d)
>>>>>    void evtchn_move_pirqs(struct vcpu *v)
>>>>>    {
>>>>>        struct domain *d = v->domain;
>>>>> -    const cpumask_t *mask = cpumask_of(v->processor);
>>>>> +    const cpumask_t *mask;
>>>>
>>>> This change shouldn't be necessary; compilers ought to be able to DCE the
>>>> code.
>>>
>>> Unfortunately not, with "-O1" more code is generated as cpumask_of() is complicated inside.
>>>
>>>>
>>>>>        unsigned int port;
>>>>>        struct evtchn *chn;
>>>>>    +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>>>>
>>>> Nit (style): Missing blanks (see other nearby if()-s).
>>>>
>>>> I wonder though whether we wouldn't better have x86'es arch_move_irqs()
>>>> invoke this function, and then #ifdef it out here altogether as well.
>>>
>>> Do you mean as in the below diff?
>>
>> Along these lines, yes. I guess personally I wouldn't convert to an
>> out-of-line function. If an inline function fails to compile (and that
>> isn't easily fixable), use a macro instead.
> 
> I'd prefer stick to out-of-line function, if you don't mind.
> Inline implementation causes cascade build failure:
> 
> adding
>  #include <xen/event.h>
>  #include <xen/sched.h>
> in irq.h is not enough.

Which is why I suggested using a macro; I kind of expected there to be
#include issues.

Jan

