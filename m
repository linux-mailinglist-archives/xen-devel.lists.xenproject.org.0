Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851ACAFD1A
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 12:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181527.1504564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwEG-0000pj-GC; Tue, 09 Dec 2025 11:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181527.1504564; Tue, 09 Dec 2025 11:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwEG-0000m2-DG; Tue, 09 Dec 2025 11:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1181527;
 Tue, 09 Dec 2025 11:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSwEF-0000Qs-7N
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 11:50:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31b53620-d4f5-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 12:50:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so43149585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 03:50:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d612e3esm34987965e9.2.2025.12.09.03.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 03:50:00 -0800 (PST)
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
X-Inumbo-ID: 31b53620-d4f5-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765281001; x=1765885801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nMoXTuDTAYZLumO7wfb9zf0ZalNbaz80O5yc3ijOUtw=;
        b=KHnojmfj3/XCuW5Q7ZxNW+k5Z84WF78f2KeB5iNrjValo6erjrhTeokBZZECiViXNA
         SBcSQOl0Bj4/1zQKGp9HXUeFxOVftzZgUJOnGEPcOidYnzKclfRgiuL5JFHlxkc99fSm
         PzxBAwx2ZPmhpk0KGgWDYn0AZP6IxWu7Y/khOjaef5VTMoeygB/bl6CPfeilB5+rhYQY
         dKiLqxns8D6ywxsAqhMy6XpuOMZamfqlbNfjK8HrDb3T+vrDipkzaCCuE/kGKuZgK278
         qMoRuo4/6CPAd3c0lyPRepbyIk4G5YHImnOFLFxGKXDHbotRTlbBpykoaM25vkeoj/57
         A8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765281001; x=1765885801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMoXTuDTAYZLumO7wfb9zf0ZalNbaz80O5yc3ijOUtw=;
        b=EZvvHJ70GIL9CZS0nm5QaoKnQQOgVVThk4shkVQwX674DU7lT9MNd9A4toFsWDdamQ
         Fwncb3Bqqg6DUEP7hPOtDOSwSOukEklo3r0kv2RfGGsEhDxxXLyilNy3tF0qCVJh3/te
         /sAAwp34WvwSnhfUXC+3MefjlpSkgAZkqJ2knMh/qe2izrS4aGfVfhGgP8y9adJxB7DY
         qpBhBGJ7nVVNQhNnry/3bsoVnrCIAzzpDgews32lOhfofv0SagxUDRLOLvggu/5wWwsu
         miT3WC34YJrPfkMVeHqhnHwuGObYMOQK4tpg5xRVsSO4dw29QSBhPZ38fggF6YRnnABD
         CU5A==
X-Gm-Message-State: AOJu0Yy8VUJLGoGQzkTWy8fYSnAMNGxypy9NJMhgndTm8Xhp/dJ74wVC
	zLchGrhu137Eud2Ix7VDeJCpcUP9mV8AxoqvkJNsbdfHqUk2Iks9bF6dnuzzPZtYHw==
X-Gm-Gg: ASbGnctBdA4ObwsZzzagULfp91Bd34qnnRcaxgKOK9NkE2k08GWeKnsaPuotoBAUFng
	nS2lgkePvL4mT67RJc9U6OMkDwIaiyVO1e4FHzuN0M4ysXxW7UvLMb54rVKoTSakpCL1EJDQ6+2
	0RoBZ4ziWz/ciz92H2VbRp3ALuCAtqyNyaBdZPsuzsSi98FdlhS0eZhn9G8yuhmN00sA6v/RlpT
	Bh25vZ7uM2fPYhF+o9R1fUInYaipHSktQ6ePn20FLVIinptuoBsHA374eP6zHxUXDxVqvZIyQmT
	a0LzkVGNX1wHE1/ZL+Ln/3RnYnNjiESQiVsxJOV2xF62nKE/4sNhc/QrIBmpEinYa2ZuIt672C/
	4TFRXLhd2v04AnGL40A5lej0uf5y81tb5BWhXTkGmoI9sOJ2SQxJCdIbzNTCDvGJFxvQ1OjOQ8G
	9UKuLD9/oTT5piFFPg9UVAISV2L7f932+0rqWjc5xqxbIyAQBWDLfN3vQdp49QwVj7vfXzNf0mI
	v6Sxsx1dHvtog==
X-Google-Smtp-Source: AGHT+IFvFdPdunO/1AHhKaObIXWJvbBRaupF3aIhcH/Kc5yhqlKuc1rOoVt8vhCFUeOOTT0dpDrnYA==
X-Received: by 2002:a05:600c:3b08:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-47939ded20fmr131987375e9.7.1765281000997;
        Tue, 09 Dec 2025 03:50:00 -0800 (PST)
Message-ID: <f09af4cf-09d7-462a-b8d1-0f2a4b3f32cc@suse.com>
Date: Tue, 9 Dec 2025 12:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com> <aTLjwbcm4fjwNJfb@Mac.lan>
 <b03a8039-e4b3-42ff-9781-031bf68ccb72@suse.com> <aTgJUvqTIQRc66L_@Mac.lan>
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
In-Reply-To: <aTgJUvqTIQRc66L_@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 12:34, Roger Pau Monné wrote:
> On Mon, Dec 08, 2025 at 11:48:00AM +0100, Jan Beulich wrote:
>> On 05.12.2025 14:53, Roger Pau Monné wrote:
>>> On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/p2m.c
>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>> @@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
>>>>          {
>>>>              p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
>>>>              if ( !p2m_is_special(t) && !p2m_is_shared(t) )
>>>> +            {
>>>>                  set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
>>>> +                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
>>>> +            }
>>>>          }
>>>>      }
>>>>  
>>>> @@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
>>>>          if ( !p2m_is_grant(t) )
>>>>          {
>>>>              for ( i = 0; i < (1UL << page_order); i++ )
>>>> +            {
>>>>                  set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
>>>>                                    gfn_x(gfn_add(gfn, i)));
>>>> +                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
>>>
>>> Have you considered placing the respective
>>> paging_mark_pfn_{clean,dirty}() calls in p2m_entry_modify()?
>>
>> I didn't, but since you ask - I also don't think that's layering-wise
>> an appropriate place for them to live. Whether a page has to be
>> considered dirty needs determining elsewhere. No matter that ...
>>
>>> There's a lot of repetition here with regard to handling the side
>>> effects of p2m changes that are forced into the callers, that could
>>> likely be contained inside of p2m_entry_modify() at first sight.
>>
>> ... this way there is some redundancy.
> 
> Redundancy is one of the aspects, the other being IMO code more prone
> to errors.  Having to do all this non-trivial extra work after a call
> to set a p2m entry, both in the success and failure cases, seems
> likely that it will be forgotten or incorrectly implemented by some
> of the callers.
> 
> It's you doing the work to fix this, so I'm not going to insist.  It
> seems a lot of extra complexity duplicated across multiple callers.
> 
> FWIW, it would be easier to understand if we had the logic to mark
> pages as dirty in a single place, rather than scattered around
> different callers that do p2m modifications.  For the time being I'm
> fine with doing as you propose, but long term we should see about
> cleaning this code IMO.
> 
>> Furthermore p2m_entry_modify() also isn't really suitable: We don't
>> know the GFN there.
> 
> For one of the callers there's the GFN in context.  For the EPT caller
> it will likely require some plumbing.

From a more abstract perspective, passing a GFN into that function would
be wrong imo: Constructing a PTE may be unrelated to any particular GFN.
The association with a GFN comes into play only when placing the PTE in
a particular (live) page table.

Furthermore it's not quite clear what the conditions would be for
p2m_entry_modify() to actually mark a page dirty. Only new type? Might
old type also matter (so we wouldn't mark a page needlessly as dirty)?
Yet other criteria? That's what callers will "know" (better?).

Jan

