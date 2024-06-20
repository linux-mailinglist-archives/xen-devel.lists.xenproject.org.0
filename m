Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBE90FDA6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744222.1151237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCAX-0000pG-97; Thu, 20 Jun 2024 07:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744222.1151237; Thu, 20 Jun 2024 07:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCAX-0000mC-5y; Thu, 20 Jun 2024 07:25:17 +0000
Received: by outflank-mailman (input) for mailman id 744222;
 Thu, 20 Jun 2024 07:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKCAV-0000m6-GO
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:25:15 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c487ca3-2ed6-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 09:25:14 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso7004131fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 00:25:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb6b4fasm11749796b3a.150.2024.06.20.00.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:25:13 -0700 (PDT)
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
X-Inumbo-ID: 3c487ca3-2ed6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718868313; x=1719473113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ/co182WcYNS1OnFxdpqFtoByqFD684VmQ5KeMq7uQ=;
        b=MBDX7YklnAci5FAeogeLQ5OvA/3TFuLYN6fwOCixmVAHQMFfuJ9vFdZ95f+SoZ4Puz
         4AjbLGj6n9QHN9YKnO2XQwq5XFDRJ8D38HBM/yVY6L/DtHGDg2EW9ZlrWWzMYUMfoCz3
         FOCYGqx1azJPlzq85n1SI3+Gjxh06C+PHSkTVb5q5c2EM+jYbc3foswSL8fHixHfyp+6
         z0v8tp+dj3nx5+dcATKLxsceST5sNmAsIQ7rllfyFsyER6OPLN7uAIrAfAE7egOYJfgG
         lfd6qChGniLO0oTaIg9PbRdMeLe4c+wZnC3qNQVUqtroQIWp9KI/bTenqxyIiBHOaV8f
         mrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718868313; x=1719473113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ/co182WcYNS1OnFxdpqFtoByqFD684VmQ5KeMq7uQ=;
        b=iFfeU0Z5HjSRrN0+KK/RGp18ZijVn7VxvLsTIIda40/ZXFGHYUEbsFZmFSJi79MaVu
         pHlbpcaDc33Ko+JgHXSL7Orpl/0+wOYBCQiXjJHmOwVstnXG/z2O++WWRuLZ9n/r1D4c
         GzWQ4XKozHVMt7GByNb3TYPPW7xsbC7LNtHsiLf7syJQ4NMZosbQfv7VA/1xKOXlauXG
         6mPbUsBeY5GJKcPUW9TexTZuMBkVTZwu8UWaVTQAbqu7WkwaC3g9NGMiXU7ibY3QOQl+
         i9nhbuhOSrbjIoP+JAGYb/WHDWe+q6/6WpSaLguDRNvStxIIql3V4nXj16hd8hB+Yopb
         1T2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoEoHx4R7Kr2r22jxDKUgDl2tXlzTLXvWam/zhv/GVZzMwyfQW9ZCIhBbRdaYcwetpOni6i4tKx/S06kaTTnRWLrGJLmBt7dDBtgqj8Hw=
X-Gm-Message-State: AOJu0Ywg7GKuELSF9+JecZkvQYXMOUi0fgzPtFmeLcS/vrpJHGav81BR
	z6NdNTbWysysYNktD4nS73FvSWVvBm4Aq63bahzWDummWuG2UtjcJ/B8bLNVmQ==
X-Google-Smtp-Source: AGHT+IFJx7TyLrlGOX0d4JxNqPQTuMz0lvzdHLm0D3lIPxOkj4v4IJZOTPs3KAFSSVH3lG3KBuS+Yw==
X-Received: by 2002:a2e:95cf:0:b0:2ec:5cf:565e with SMTP id 38308e7fff4ca-2ec3cec04c8mr36576311fa.12.1718868313537;
        Thu, 20 Jun 2024 00:25:13 -0700 (PDT)
Message-ID: <4cf14abe-881e-4328-9083-bd04afd6b307@suse.com>
Date: Thu, 20 Jun 2024 09:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v6 6/9] xen: Make the maximum number of altp2m
 views configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1718038855.git.w1benny@gmail.com>
 <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
 <4a49fe9b-66fd-4a32-ad01-14ed4c5fc34c@suse.com>
 <CAKBKdXgUKYoJfB1mG+6JSaV=jWpmRmS1UbQ6N4JNZ774rP_PoQ@mail.gmail.com>
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
In-Reply-To: <CAKBKdXgUKYoJfB1mG+6JSaV=jWpmRmS1UbQ6N4JNZ774rP_PoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2024 17:46, Petr Beneš wrote:
> On Thu, Jun 13, 2024 at 2:03 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> @@ -510,13 +526,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>>>      mfn_t mfn;
>>>      int rc = -EINVAL;
>>>
>>> -    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
>>> +    if ( idx >= d->nr_altp2m ||
>>>           d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
>>
>> This ends up being suspicious: The range check is against a value different
>> from what is passed to array_index_nospec(). The two weren't the same
>> before either, but there the range check was more strict (which now isn't
>> visible anymore, even though I think it would still be true). Imo this
>> wants a comment, or an assertion effectively taking the place of a comment.
> 
>> Since they're all "is this slot populated" checks, maybe we want
>> an is_altp2m_eptp_valid() helper?
> 
> Let me see if I understand correctly. You're suggesting the condition
> should be replaced with something like this? (Also, I would suggest
> altp2m_is_eptp_valid() name, since it's consistent e.g. with
> p2m_is_altp2m().)
> 
> static inline bool altp2m_is_eptp_valid(const struct domain *d,
>                                         unsigned int idx)
> {
>     /*
>      * EPTP index is correlated with altp2m index and should not exceed
>      * d->nr_altp2m.
>      */
>     assert(idx < d->nr_altp2m);
> 
>     return idx < MAX_EPTP &&
>         d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
>         mfn_x(INVALID_MFN);
> }

Not exactly. You may not assert on idx. The assertion, if any, wants to
check d->nr_altp2m against MAX_EPTP.

> Note that in the codebase there are also very similar checks, but
> again without array_index_nospec. For instance, in the
> p2m_altp2m_propagate_change() function (which is called fairly
> frequently):
> 
> int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
>                                 mfn_t mfn, unsigned int page_order,
>                                 p2m_type_t p2mt, p2m_access_t p2ma)
> {
>     struct p2m_domain *p2m;
>     unsigned int i;
>     unsigned int reset_count = 0;
>     unsigned int last_reset_idx = ~0;
>     int ret = 0;
> 
>     if ( !altp2m_active(d) )
>         return 0;
> 
>     altp2m_list_lock(d);
> 
>     for ( i = 0; i < d->nr_altp2m; i++ )
>     {
>         p2m_type_t t;
>         p2m_access_t a;
> 
>         // XXX this could be replaced with altp2m_is_eptp_valid(), but
> based on previous review remarks,
>         // it would introduce unnecessary perf. hit. So, should these
> occurrences left unchanged?
>         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
>             continue;
> 
>        ...
> 
> There are more instances of this. Which re-opens again the issue from
> previous conversation: should I introduce a function which will be
> used in some cases (where _nospec is used) and not used elsewhere?

You're again comparing cases where we control the index (in the loop) with
cases where we don't (hypercall inputs).

Jan

