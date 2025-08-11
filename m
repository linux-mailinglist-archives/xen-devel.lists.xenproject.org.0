Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB0B203D1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077172.1438251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOw8-0006oK-6C; Mon, 11 Aug 2025 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077172.1438251; Mon, 11 Aug 2025 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOw8-0006mj-3P; Mon, 11 Aug 2025 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1077172;
 Mon, 11 Aug 2025 09:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulOw6-0006mb-6t
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:35:22 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f45a130-7696-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 11:35:20 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6182ea5a6c0so1112113a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 02:35:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21e44csm1972179466b.113.2025.08.11.02.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:35:19 -0700 (PDT)
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
X-Inumbo-ID: 7f45a130-7696-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754904920; x=1755509720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xu/o5lhozpSl2swzBnM4sfNjUphVc7yoGvbpld/MyxU=;
        b=IWTo2JRH1RkSxIcVuB8nFsJ4t3EwShH66NbwjgBH7UZasLyZE4Du5Q1Gtpb1iWFOvh
         Zc6jNSdmGDR1a9TUCRHy+ZaaohrvkRImpfr6nyWGZjhOaTk6eDZIHwTwGXm1Bpvuv4SS
         HkJsEUUXZDpcx3mm0APeb4EV0o0pfxq00OjUyNzl18INk+deQlU2THayGvP1kE9El3rX
         Kmvlesl9FHTt/P0M4fcw3gNGpsRYcgg88dn9NEY/SB4mS3uIW0Pgn0W4ljzygJFQDPN1
         KP4ajsjqIBNC5rgTERoFNp6SeKcTftyts2dnEprFmbxcHPs1J5y2LSvOt+8nsPSsHx7o
         4oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904920; x=1755509720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu/o5lhozpSl2swzBnM4sfNjUphVc7yoGvbpld/MyxU=;
        b=DZmc127tbnD440rnWcH+U6cJT2lgwpULO6uYOvHg+d2PGIrYD20dVIyRtuacRIPQkX
         BVCnmt5O31MF6ZguVt9RpwpVSuD2Qm7QAEnN9X1LWcw2uJeYXk/X+rO99gkQiIrlp0J0
         u5MhASv1CVCEC0HNjmv0ILetjFkLutino54tKRG1KSSj1lNhqoI7YYpvnMLkeAMhPiu/
         YCSZSqr/QcRb0Qmzo9EvYGv3DfMljTfOWnBQrUkSm/5YgCMwWyyJ34CrddMWIlm6SxGF
         Dchd81KOXJIuffhrgeNh9mcwiGDtJBSCStHcFXVx5pMkrZjG7A3T68vg2c3Y2l10wsJS
         avXA==
X-Forwarded-Encrypted: i=1; AJvYcCWFzDAdOcZTkKBTc24MzjPhivAd6RqTGSqQV+Ownboj0csyXhkVFdSMaAH7sL0oMyK+z+r752ix2vQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWv6nabrQiT8u27IaLNY1JgtLbjV+KUr16p2kOVdLIBEG8nXOL
	3/I+ucEfbKMnyQVQy9eM6yHIseKe7eNziTCZfhVul4iZ6hsCe28kLMuyCE1MQddpeg==
X-Gm-Gg: ASbGnct6aGhceRKcXsD6EMIhNPg9Mj3QCVwqFlZmDVQZtgf6LzJ+TqOKWRw/sgiebHQ
	44cBqId52BdmHxZUOL2ejWidIaFkO4+GL1va8NZrV2C0dirp4RJ8S3e6WfO2Oc0cyA50JPhZR3G
	xuD6WNAup4DeBxXozePOocCT3xnhgI7Zkdm2apQXPNtzS8DzDio5LWWLP4iMAj+F4PdKuxK/IdT
	HLcLhO7hbuxsh+nVv+OMRR0/suXGV+z5VAI9QIC49Dr0OFVG+WnjBSjnYknEOaoVEKioSv4RdMk
	r0Zz97xttBtTea7kSn2FJVcmnI+dLW86kL5ZngFvPuM8MJQwZZQBD066jg+NTbP2gcanZQlUJ9O
	3J2l4s/BguA2poY0P4zw9nAAJhGmpsMGd7d/eyK7RkJb/xTHo2OXbOF2E7XeIMfm60irq63veWj
	G2O15q25k=
X-Google-Smtp-Source: AGHT+IFUykwHz4HJem7pDZXoFKquzfKda0fMMlFcJg0nwG12IixG21hmUXZ9W6e2UD+KpGWJZmm6lw==
X-Received: by 2002:a17:907:72c3:b0:af9:6e2b:f30c with SMTP id a640c23a62f3a-af9c64d4ac0mr1061771566b.34.1754904919572;
        Mon, 11 Aug 2025 02:35:19 -0700 (PDT)
Message-ID: <c913ead7-46f4-4906-821e-2289d0f30b63@suse.com>
Date: Mon, 11 Aug 2025 11:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] xen/riscv: implement function to map memory in
 guest p2m
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
 <e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com>
 <31c75a64-8b69-47ac-9e08-6010fa6cfb9c@gmail.com>
 <ffec4fe0-cca7-40fb-a870-6fdf0201f44a@suse.com>
 <89787fe2-3eea-44b7-ad38-82d0d09be06f@gmail.com>
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
In-Reply-To: <89787fe2-3eea-44b7-ad38-82d0d09be06f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 11:29, Oleksii Kurochko wrote:
> 
> On 8/11/25 9:28 AM, Jan Beulich wrote:
>> On 08.08.2025 15:46, Oleksii Kurochko wrote:
>>> On 8/5/25 5:20 PM, Jan Beulich wrote:
>>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>>>>> +void p2m_write_unlock(struct p2m_domain *p2m)
>>>>> +{
>>>>> +    /*
>>>>> +     * The final flush is done with the P2M write lock taken to avoid
>>>>> +     * someone else modifying the P2M wbefore the TLB invalidation has
>>>> Nit: Stray 'w'.
>>>>
>>>>> +     * completed.
>>>>> +     */
>>>>> +    p2m_tlb_flush_sync(p2m);
>>>> Wasn't the plan to have this be conditional?
>>> Not really, probably, I misunderstood you before.
>>>
>>> Previously, I only had|p2m_force_tlb_flush_sync()| here, instead of
>>> |p2m_tlb_flush_sync()|, and the latter includes a condition check on
>>> |p2m->need_flush|.
>> Just to re-iterate my point: Not every unlock will require a flush. Hence
>> why I expect the flush to be conditional upon there being an indication
>> that some change was done that requires flushing.
>>
> The flush is actually conditional; the condition is inside
> |p2m_tlb_flush_sync()|:
>    void p2m_tlb_flush_sync(struct p2m_domain *p2m)
>    {
>      if ( p2m->need_flush )
>        p2m_force_tlb_flush_sync(p2m);
>    }

Hmm, I'd consider this misleading function naming then. Especially with
"force" and "sync" being kind of redundant with one another already anyway.
See x86'es naming.

Jan

