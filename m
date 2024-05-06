Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0C8BD0D4
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 16:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717696.1120149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3zkp-0004aS-W2; Mon, 06 May 2024 14:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717696.1120149; Mon, 06 May 2024 14:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3zkp-0004Ya-S6; Mon, 06 May 2024 14:55:47 +0000
Received: by outflank-mailman (input) for mailman id 717696;
 Mon, 06 May 2024 14:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3zko-0004YU-Ac
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 14:55:46 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b737e018-0bb8-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 16:55:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34eb52bfca3so1407582f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 07:55:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c12-20020adffb4c000000b0034f3e5452a5sm2251140wrs.1.2024.05.06.07.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 07:55:44 -0700 (PDT)
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
X-Inumbo-ID: b737e018-0bb8-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715007344; x=1715612144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJsqUtpAuWNoDoam7qidS6qcyOXY7ErXJ60/WNrj9qo=;
        b=aJrz01BP23tiuPezKni/YyqIE1KE0/p8qxg70jDuZZ4OgVzKyAqn7lzPT06ssPjjsZ
         A28cbgNzZ9d/XpWyQcmKY2EqXsaYiMWOJdYrdvK4gvf3zNhGmKgAotgqfBzJpfiHuus1
         YSAjIdOxershTTAB8WahptIrsC44SAVqZqNxO4Gv06YK0RtFGjAJHpl+/7tNMrbW7ap7
         P1gPfwnUvyYFFCxl89tDa/LBm9Vs6smwzjnbbfBVnCKBX7lGmBGCKiUuN8u4PlcYAzfp
         pUJu1fqLlzFP95QRIEYJdAanUrR97xXjzRdSd4IfzeQkT9cR7zpQw2GSQGj9G+LbAi3G
         EsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715007344; x=1715612144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJsqUtpAuWNoDoam7qidS6qcyOXY7ErXJ60/WNrj9qo=;
        b=A39ypBboo2fUAuMB2YvsW7EXpmYtjEvVMdBIIpqL31Yf6PAIWb4o3T39SymWYs3TiI
         xf6Sls7sCzUegBZvIct++3r0VaOSgnG3EJ/dy0nCEjSrXroi3K8LHpaZaO9WPeWt0jTU
         RupvHbcyUt803RWsEZcldwFbqEDuML1zwptmYj6TxDA0OCxn1rPVDSskAKMMTrK7agoA
         wzZk3CT2DkNyUZO8Fz+Gn+XBZM/eZuQRsoCHkJBW2gA/3IEUeXBV9pTDhWiAXzLezgGN
         q67Vd7e1uiS0gfvDZIUsmPsmsiV8xnKjWij9+cvoQYLIud6760OgfXmQ1Yh9Mf+D6Tri
         Z4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXpJQYtnEiBx/vXgkSdPliQh+3wueKpNGMfKMiW2LO89u0NFQzb0SVL1o+J8tAGvn+/ycHjs6ckiMdIel97FXvfOI6pqcIndp4Ch2r8IEE=
X-Gm-Message-State: AOJu0YwVcoO/pdrnZmh61xrLCEFSs1lslhYjV3zJD0TIa40V5CK6bu+E
	/pi/Jd7urxobNc0OHEvbH/km2qJDNeM+NcjLUHx7JDB/lWZ2T23HiJzV8q1Lzw==
X-Google-Smtp-Source: AGHT+IGF9KHwkGVl8uuKLAgyLhhqXVIWYRt6LByMZnQBu1wAdwMZbYMi2Q7aiBPnMqx39lOCqqEF9Q==
X-Received: by 2002:adf:f5cb:0:b0:34d:a7bc:e647 with SMTP id k11-20020adff5cb000000b0034da7bce647mr9700250wrp.62.1715007344357;
        Mon, 06 May 2024 07:55:44 -0700 (PDT)
Message-ID: <4ef79e54-deb1-4242-bcf6-af2b324326b4@suse.com>
Date: Mon, 6 May 2024 16:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and
 number of foreign mappings in the p2m
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-2-roger.pau@citrix.com>
 <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com> <ZjjqEPRycO-ZIkAe@macbook>
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
In-Reply-To: <ZjjqEPRycO-ZIkAe@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 16:32, Roger Pau Monné wrote:
> On Mon, May 06, 2024 at 12:07:33PM +0200, Jan Beulich wrote:
>> On 30.04.2024 18:58, Roger Pau Monne wrote:
>>> Keep track of the maximum gfn that has ever been populated into the p2m, and
>>> also account for the number of foreign mappings.  Such information will be
>>> needed in order to remove foreign mappings during teardown for HVM guests.
>>
>> Is "needed" the right term? We could e.g. traverse the P2M tree (didn't look
>> at patch 2 yet as to how exactly you use these two new fields there), at which
>> point we might get away without either or both of these extra statistics,
>> while at the same time also not needing to iterate over a gigantic range of
>> GFNs. Going from populated page tables would roughly match "max_gfn", with the
>> benefit of certain removals of P2M entries then also shrinking the upper bound.
> 
> The nr_foreign field is also used as a way to signal whether iteration
> over the p2m is needed in the first place.  If there are no foreign
> entries the iteration can be avoided (which is likely the case for a
> lot of domains).
> 
> Note that in 2/2 max_gfn is also used as the cursor for the teardown
> iteration, and points to the last processed p2m entry.  So even if the
> maximum gfn is obtained from the p2m page-tables directly, we would
> still need some kind of cursor to signal the position during teardown.
> Or alternatively remove all entries from the p2m, regardless of their
> type, so that the p2m shrinks.

Having such a cursor just for teardown wouldn't be a big deal, I think.

>>> --- a/xen/arch/x86/mm/p2m.c
>>> +++ b/xen/arch/x86/mm/p2m.c
>>> @@ -413,6 +413,8 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>>>          set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
>>>          if ( set_rc )
>>>              rc = set_rc;
>>> +        else
>>> +            p2m->max_gfn = gfn_max(gfn_add(gfn, 1u << order), p2m->max_gfn);
>>
>> For one a (new) field named "max_..." wants to record the maximum value, not
>> one above. And then you want to use 1UL, to match ...
> 
> So gfn + (1UL << order) - 1.

Right, or give the field a different name.

>>>          gfn = gfn_add(gfn, 1UL << order);
>>>          if ( !mfn_eq(mfn, INVALID_MFN) )
>>
>> ... surrounding code (more just out of context).
> 
> Oh, indeed.
> 
>> Further I can't really convince myself that doing the update just here is
>> enough, or whether alternatively the update wouldn't want to be further
>> constrained to happen just on newly set foreign entries. In that latter
>> case it would be far easier to reason whether doing the update just here is
>> sufficient. Plus iirc foreign entries are also necessarily order-0 (else
>> p2m_entry_modify() wouldn't be correct as is), which would allow to store
>> just the gfn we have in hands, thus resulting in the field then being
>> properly named (as to its prefix; it would likely want to become
>> "max_foreign_gfn" then).
> 
> I didn't want to limit this to foreign entries exclusively, as it
> could be useful for other purposes.

I see.

>  My initial intention was to do it
> in p2m_entry_modify() so that nr_foreign and max_gfn where set in the
> same function, but that requires passing yet another parameter to the
> function.

I was indeed implying that would have been the reason for you to not have
put it there.

What you don't answer though is the question of how you determined that
none of the other ->set_entry() invocations would need to have similar
code added. There are quite a few of them, after all.

Jan

