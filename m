Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F9F8CF8FF
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 08:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730590.1135708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBTi5-00071q-2G; Mon, 27 May 2024 06:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730590.1135708; Mon, 27 May 2024 06:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBTi4-00070K-Vo; Mon, 27 May 2024 06:19:52 +0000
Received: by outflank-mailman (input) for mailman id 730590;
 Mon, 27 May 2024 06:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBTi4-00070D-Ao
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 06:19:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bd87021-1bf1-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 08:19:44 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so12404200a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 May 2024 23:19:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817ee7sm456767466b.33.2024.05.26.23.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 23:19:42 -0700 (PDT)
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
X-Inumbo-ID: 1bd87021-1bf1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716790783; x=1717395583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pPEoGC6JBivgVNjVQ7HTaR0H3WFVtC4CHpf6XL3VwVo=;
        b=L2fmp96aF1y5PgAtUgtzJIjQmwwP4nTwc6UFiUyU4WlyMtl0cVcxY6/MXGKiG7SqwE
         ENCTDVa+aDUi0zCqi9GpQpUuJ73adxZc7Y+Dwh++3XKbcq58ReuUkCL6wo2dsT76bqNv
         ogEmRPL4NbP5sjcHz9DoAVAyV36O/NStcaHWMbCuuo7fLyPCQmCi408R9YupLKoarb38
         RWagl3eBPztkJLxy4G486Rrol0sL9+ImK4tMJvBtVuoWwmzulngHcDbeQdFQNOBffBHa
         +nG9Qe9VbX2+r8CjKMVXRM76FGABZBNHpgjBee/cDZJB+uImENa7kg2cPcNDjKGBRsKZ
         Shlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716790783; x=1717395583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPEoGC6JBivgVNjVQ7HTaR0H3WFVtC4CHpf6XL3VwVo=;
        b=VctHLKUQfVx1D7X3zqHPr9MwZNjnyxUCfcc1dtdPvxmulhvF1jIlQ1/sa5rJCSnQ0s
         TxvNorlosM+H/TLGzlHh5fWSjxxXmwA3P2vQoL6brsmuoEmGLAHt7hLqTg1EWlkzSiwh
         xHXnXOT2aJtbrhROJgFKWU4aklyV0ZVZNOz9fzJ8rHRZq7p4GC/3bXSjEeepr4I+8Oiw
         islGH/01avmz6xD/5L6FMDmstGsUrR5hPwrL0QrVW/940oo9Uo3fSyhbUdsKFtHm7sAS
         LQyxuMMddD26678prV1L58eR7Y/4bD7/vzsTsg4+zBxr5+KO3zsY+9imt6SjYi1unCAL
         1cFA==
X-Forwarded-Encrypted: i=1; AJvYcCUMhbLqxms+6sTAWarNMoSv0Gh7XM98HcSgSZA3mR8J4IlS4H21+sZKNWSOxmNMiFeRVTOSoZ7eZhc2mpbl9POCzIai03j+DgMRElv5Zo4=
X-Gm-Message-State: AOJu0Yx5xvjgxf+4V4VGA9P9TsZ4E7zkdMi8GZEQ01Kf0UAmBGP2rIB5
	TXT+CDYZdXZxYMv8PSPdIKWngNdb1QSkCkrkNW0c2VFRMGel64HO9fNFx3MC4Q==
X-Google-Smtp-Source: AGHT+IFOfZ5hLGKVeXcvYK9fUE8Wahf90KAa/8ajN1R9RYiivdm1+raj8QxOZdFqq2J5nio0rkvswA==
X-Received: by 2002:a17:906:d961:b0:a62:196c:b2af with SMTP id a640c23a62f3a-a6264f01e2dmr563294366b.52.1716790783528;
        Sun, 26 May 2024 23:19:43 -0700 (PDT)
Message-ID: <12335f4d-adde-42d3-aa25-b662e701b96d@suse.com>
Date: Mon, 27 May 2024 08:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v4 4/6] x86: Make the maximum number of altp2m
 views configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1716029860.git.w1benny@gmail.com>
 <ba5b81fdaf174a236c3963fcfd29ae3b19aff13d.1716029860.git.w1benny@gmail.com>
 <21196eb3-82ca-470b-8dc9-1a95b427f3b9@suse.com>
 <CAKBKdXj7xUyuy-wPCjR0a+kNwqCmGXOoO=-pMQa7=Yiyaom_mg@mail.gmail.com>
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
In-Reply-To: <CAKBKdXj7xUyuy-wPCjR0a+kNwqCmGXOoO=-pMQa7=Yiyaom_mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.05.2024 01:55, Petr Beneš wrote:
> On Tue, May 21, 2024 at 12:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> The compared entities don't really fit together. I think we want a new
>> MAX_NR_ALTP2M, which - for the time being - could simply be

Note that you've stripped too much context - "the compared entities" is
left without any meaning here, yet that's relevant to my earlier reply.

>> #define MAX_NR_ALTP2M MAX_EPTP
>>
>> in the header. That would then be a suitable replacement for the
>> min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) that you're adjusting
>> elsewhere. Which however raises the question whether in EPT-specific
>> code the min() wouldn't better survive, as min(d->nr_altp2m, MAX_EPTP).
>>
> 
> As you mentioned in a previous email, I've removed all the min(...,
> MAX_EPTP) invocations from the code, since nr_altp2m is validated to
> be no greater than that value. The only remaining places where this
> value occurs are:
> 
> - In my newly introduced condition in arch_sanitise_domain_config:
> 
> if ( config->nr_altp2m > MAX_EPTP )
> {
>     dprintk(XENLOG_INFO, "nr_altp2m must be <= %lu\n", MAX_NR_ALTP2M);
>     return -EINVAL;
> }

This is suspicious: You compare against one value but log another. This
isn't EPT-specific, so shouldn't use MAX_EPTP.

> - In hap_enable():
> 
> for ( i = 0; i < MAX_EPTP; i++ )
> {
>     d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
>     d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
> }
> 
> Note that altp2m_eptp/altp2m_visible_eptp is never accessed beyond
> nr_altp2m. From what you're saying, it sounds to me like I should only
> replace the first mentioned occurrence with MAX_NR_ALTP2M. Correct me
> if I'm wrong.

Yes. I suspect though that there may be further places that want adjusting.

>>> @@ -403,12 +403,12 @@ long p2m_set_mem_access_multi(struct domain *d,
>>>      /* altp2m view 0 is treated as the hostp2m */
>>>      if ( altp2m_idx )
>>>      {
>>> -        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
>>> -             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
>>> -             mfn_x(INVALID_MFN) )
>>> +        if ( altp2m_idx >= d->nr_altp2m ||
>>> +             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, d->nr_altp2m)]
>>> +             == mfn_x(INVALID_MFN) )
>>
>> Please don't break previously correct style: Binary operators (here: == )
>> belong onto the end of the earlier line. That'll render the line too long
>> again, but you want to deal with that e.g. thus:
>>
>>              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx,
>>                                                     d->nr_altp2m)] ==
>>              mfn_x(INVALID_MFN) )
>>
> 
> Roger suggested introducing the altp2m_get_p2m() function, which I
> like. I think introducing altp2m_get_eptp/visible_eptp and
> altp2m_set_eptp/visible_eptp would also elegantly solve the issue of
> overly long lines. My question is: if I go this route, should I
> strictly replace with these functions only accesses that use
> array_index_nospec()? Or should I replace all array accesses? For
> example:
> 
> for ( i = 0; i < d->nr_altp2m; i++ )
> {
>     struct p2m_domain *p2m;
> 
>     if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
>         continue;
> 
>     p2m = d->arch.altp2m_p2m[i];
> 
>     p2m_lock(p2m);
>     p2m->ept.ad = value;
>     p2m_unlock(p2m);
> }
> 
> ... should I be consistent and also replace these accesses with
> altp2m_get_eptp/altp2m_get_p2m (which will internally use
> array_index_nospec), or should I leave them as they are?

Perhaps leave them as they are, unless you can technically justify the
adjustment.

Jan

