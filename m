Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0A7ABD85C
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 14:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990715.1374647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHMJx-00064J-TD; Tue, 20 May 2025 12:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990715.1374647; Tue, 20 May 2025 12:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHMJx-00062R-Pz; Tue, 20 May 2025 12:43:49 +0000
Received: by outflank-mailman (input) for mailman id 990715;
 Tue, 20 May 2025 12:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHMJw-00062L-Fe
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 12:43:48 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 126a870d-3578-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 14:43:47 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-601aa0cb92eso3621214a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 05:43:47 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04e665sm721788966b.5.2025.05.20.05.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 05:43:46 -0700 (PDT)
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
X-Inumbo-ID: 126a870d-3578-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747745026; x=1748349826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggUS9oTHJhmybZknx5MZc3EcGArj8C4sRd0GYfEHAew=;
        b=gXuVzHkNaDFKJfaCLsIdtGnoVbkhkUJ6+QMx3dF1VJ8dy3P7l0fqa9ZMKN8Mus+rK8
         LWS8KU4REXG0ZwmDyorRI2BS1oSq/Rsl6y8RGrVG+uv4a017cYKkwr7UUyPYao/THA7E
         9CVGDfk3PnKA3KYiHxcCEpkXsvpsgBjuMmh6eufphZKGYGJev52pRVZ4NzWooNZoNdI+
         rN5AV5BDdF5McMolhEMJU8/3BCOS5IgxjE1PjaPU52iGBTJcP4InR2oXVvmDp3OkA7lF
         dNFbaCMx2nRPvs8D9Nzt04uvbSQ3qoZhqtdcutf0WkJNIXMSIOnd7k3+DpjKS1cvhmJb
         zlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745026; x=1748349826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggUS9oTHJhmybZknx5MZc3EcGArj8C4sRd0GYfEHAew=;
        b=v2AW024B481O2zh+0rvxWAcOjFQradUxX4hKuq8IaAyA3f1LbHiXtZCe/xClz7/5RR
         TKugsvEaghQkL2HfRLgfub7Ore0oSNkQm/RV5393bc2WWOtjadlLA6sPi1sBpZ9/Mhzq
         6eGF4IHwdBPLNJ9PLV+NlF/NusypxGkoJCeNwXgbsFA8wjNRdDoTFbqvPt7bKG5uP4NF
         fMmd0HsEikcxCSG6K0quKahDKZ3OhPol7xLdZwUR72Hb30sZfHeJCOTh3aIJFrdIG6X6
         d2iIsSGbid25Zi5pjMonTl/1eZeueWPwyWBm4VI6SlvbDb+WO6BTBtep+33IZOnMyP7m
         0ATQ==
X-Gm-Message-State: AOJu0Yzu1Vv0gMhYcqqnXhwABGw7ipEUus1ysEdTZ6PpmWyS8PG/KtQl
	eqDgqeN9STtIPwvCBjwxhkzP0b7sW5pGOQpbnxWkRgew+W10mhGyBwSoOAwzj8tjeA==
X-Gm-Gg: ASbGncu3QZ0ekPNUEFaWHcXwSLil6FxfR3R8dx9eEbErDq2uJVkMaZ3OhiKU5r2KvDR
	10LU/Uw9Mhfc6oYS+MXA1CACJALMDJRT3/Cg1wNUSeW+KIPBznGRVYfJcWjnZ4GLXm2Ax5gDrIM
	bi+H7v+6dWdJBJncHKeWFXzVTnYsRzWQzTwRwGf71veH0+2DPycn+6Zp7I6WIKZUzfHsj5HB1za
	hpXtAtd7gvDXNz4dP2S7hlYRY59rqh0dYYEOAfv2tri13M6GdEWDzCqK0Bqv6gnSQMu4ruae51s
	fRLOWKoi28DOJcbJYq8/gcHHXKfYy2kEWCjy5DGbfnhFVAbbss4fWtxr5d4ABZONrnBv1CDA
X-Google-Smtp-Source: AGHT+IGtBBLq0vPjpBc6bWOjQqc6kftjS7Q902eBnAIwOfRw9ji+FTcokxJzDySKJMIQMttjXf49uA==
X-Received: by 2002:a17:907:db16:b0:ad2:1a64:79c5 with SMTP id a640c23a62f3a-ad536b579e7mr1634160566b.7.1747745026437;
        Tue, 20 May 2025 05:43:46 -0700 (PDT)
Message-ID: <42ce8b15-90eb-4f54-acb3-81bfe2be7e1e@suse.com>
Date: Tue, 20 May 2025 14:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat
 buffers
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-2-ross.lagerwall@citrix.com>
 <204e177c-beba-41a1-93bf-3ae6454875cc@suse.com>
 <CAG7k0EqeXPiBZ8AJG2VuszCPvcQAiVh25B8=3SfLsECk-FYs3g@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG7k0EqeXPiBZ8AJG2VuszCPvcQAiVh25B8=3SfLsECk-FYs3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.2025 12:53, Ross Lagerwall wrote:
> On Tue, May 13, 2025 at 3:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.05.2025 16:46, Ross Lagerwall wrote:
>>> Check that the total number of states passed in and hence the size of
>>> buffers is sufficient to avoid writing more than the caller has
>>> allocated.
>>>
>>> The interface is not explicit about whether getpx.total is expected to
>>> be set by the caller in this case but since it is always set in
>>> libxenctrl it seems reasonable to check it.
>>
>> Yet if we start checking the value, I think the public header should also
>> be made say so (in a comment).
>>
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -103,8 +103,10 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
>>>
>>>          cpufreq_residency_update(op->cpuid, pxpt->u.cur);
>>>
>>> -        ct = pmpt->perf.state_count;
>>> -        if ( copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct*ct) )
>>> +        ct = min_t(uint32_t, pmpt->perf.state_count, op->u.getpx.total);
>>
>> With this, ...
>>
>>> +        if ( ct <= op->u.getpx.total &&
>>
>> ... this is going to be always true, isn't it? Which constitutes a violation
>> of Misra rule 14.3.
>>
>> Also it would be nice if the min_t() could become a normal min(), e.g. by
>> "promoting" op->u.getpx.total to unsigned int via adding 0U. This way it's
>> clear there's no hidden truncation (or else there might be an argument for
>> keeping the check above).
>>
>>> +             copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct * ct) )
>>>          {
>>>              spin_unlock(cpufreq_statistic_lock);
>>>              ret = -EFAULT;
>>
>> Why would you constrain this copy-out but not the one just out of context
>> below here? (The question is of course moot if the condition was dropped.)
>>
> 
> Oh, I had intended this condition to be...
> 
>     if ( ct == op->u.getpx.total &&
> 
> ... based on your previous comment about the difficulties of partially
> copying a 2d array.
> 
>> An option may be to document that this array is copied only when the
>> buffer is large enough.
> 
> I left the other alone since partially copying a 1d array makes sense.

Right, if the relation there becomes == it indeed reflects that the 2-D
one is different in this regard from the 1-D one.

> If you would prefer, I can drop the condition and just let the caller
> deal with the partially copied 2d array?

With the adjusted relation I think all is going to be fine as you
(otherwise) had it. There may want to be a brief comment on that extra
condition you add.

Jan

