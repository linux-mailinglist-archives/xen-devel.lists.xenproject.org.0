Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CASIHq7hGnG4wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:47:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D301FF4BB8
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222153.1530186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1ZI-0005I2-BI; Thu, 05 Feb 2026 15:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222153.1530186; Thu, 05 Feb 2026 15:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1ZI-0005FO-8R; Thu, 05 Feb 2026 15:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1222153;
 Thu, 05 Feb 2026 15:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vo1ZH-0005FI-JR
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:46:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e52fac70-02a9-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 16:46:54 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-482f2599980so12831375e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 07:46:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm85009595e9.6.2026.02.05.07.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 07:46:53 -0800 (PST)
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
X-Inumbo-ID: e52fac70-02a9-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770306414; x=1770911214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJWEVKFZlapcnC6PGSpp+kal8z98AGg5h2rGPcrpzPA=;
        b=UKTcyxTS9wPMNZ1UTEJuAliBXtZ4mNqiOgIe8ODjycl7MaD/jq9SfdmwXamJUF7kaU
         HGyTUGK73DkJNoA0EEKyIKkAycSe8TYC0vYuF0QzEeeDcNBpyiw/bPFFWi5LbtxJFrr1
         sdNtpQNQY6PE6TW4fwaysV7bLxgy34Dh6lvkAIbBSSXGsNUBLXmrywxIjOQAOYRLc6J0
         deW1Cc8CAQ16nP4RKoHJQhaWT1R/CRPhsFFhWUT7Lo+dyWo6Sv4fmHFnneaKE+g3ZccT
         byInLO/aHfJiUUCt34AX1LpRjZVUWj+2dYC/HzXW/tAkc7eK+9fzPu6CAkyhAq7iz5s/
         +cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770306414; x=1770911214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJWEVKFZlapcnC6PGSpp+kal8z98AGg5h2rGPcrpzPA=;
        b=ln7Om1EUY5RCrLv+TO2eoLG8gZUVstDnmVpo1oDSeCEVYbPcVuZydF2ZnDMfvYndM/
         PtLPguxS3QsQUvwhTdUnDT/RyNYqM/y292WRp11q5bAaWgrYQfIlFf43bpgUaJGZmbNq
         XibvT8q2bH16bBYv7o4+JOGloAWWJDzsjd7fPhmVpp5RYBmGN5ZonYjQ2teP0cFIZjuX
         Rzed7BUZaIyMznVaIt81Teq6F4AkjGPMqZiyyF8SBalRM+jEsAfjuKs+sQadhjwixSaY
         fXeyFnpv4DUZebNJQdFSpCA8qIPxqYIzFxw0u7epnmudYObKg4YhbJqN16ASL3PCxyJu
         Wnmg==
X-Forwarded-Encrypted: i=1; AJvYcCXZotIc4rVgCAHW8APE61zlxicWUlzIZaKx9hQStsoB13usT2l3N/9hIuZ8UncyROiHn9MISAF8fmo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlgZZCeKGsNwmWGx84/j4Nq+3eHU0doAY1lXAUvEeefUrf560s
	rUksI2z4c5X9ySIL56SM8iw46EfUNUkPmGNBNh4wvEbiwbXSdhxTXKbOYiiwa6jE3A==
X-Gm-Gg: AZuq6aKmoICL4EPAyoboL1RmbnnalVl3IrSXu2/nrY2L1eGQ8vXCtskgBsSBKWDTypr
	vHXer8kgZhSqWhgMFmZUIM3G99cuzH9Z9KD3odFijbfXibJcrr6hzql3fy/zCKj7K22oHctY0Fv
	8D0n1XcClWk3XE9lH8CkVK+uas74h4fa0uq5oEZDsGjBp1KozNWiHBy9V7xKXRdGUxNgbXzEihV
	kHpMvOjjVuqu2PRU3Gd3hgbZEhWc/TmXMOcpUohW4fR3FAcnJikLxF9ua4hqyldD2juho7ibipX
	tHwCZcwUXDTJbnF2fzUzVF4SdWF5khdft4SHGsZAoIYTN0NbNLdAIeDJTgHRpeFd8nJniJFxVp8
	NyPpcov5YKWOd6jICrjHVAt+JjIbN8CgrOY9hXwz/eNPrbPj9lap097KUjn8KGXdepRrFz2j8v/
	h/FvIK2YXfg1ZDmWqDa1Eaj36UOMgGbAPxd5SmCMrJSf0GpkZEFxBWn28uwYEQaCB5Reb8NEsYk
	pM=
X-Received: by 2002:a05:600c:19cf:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-4830e93e9f6mr100577885e9.1.1770306413684;
        Thu, 05 Feb 2026 07:46:53 -0800 (PST)
Message-ID: <15d344fc-4c12-4782-87a2-650ad0fc8650@suse.com>
Date: Thu, 5 Feb 2026 16:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix memory leak in xenmem_add_to_physmap_one
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <20260205125820.116555-1-michal.orzel@amd.com>
 <828feb7a-2a5b-4306-8da9-162df9ecfee3@suse.com>
 <0d91746d-2a58-4770-ac64-f974aa3563b1@amd.com>
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
In-Reply-To: <0d91746d-2a58-4770-ac64-f974aa3563b1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Xenia.Ragiadakou@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D301FF4BB8
X-Rspamd-Action: no action

On 05.02.2026 16:08, Orzel, Michal wrote:
> 
> 
> On 05/02/2026 14:49, Jan Beulich wrote:
>> On 05.02.2026 13:58, Michal Orzel wrote:
>>> When a guest maps pages via XENMEM_add_to_physmap to a GFN that already
>>> has an existing mapping, the old page at that GFN was not being removed,
>>> causing a memory leak. This affects all mapping spaces including
>>> XENMAPSPACE_shared_info, XENMAPSPACE_grant_table, and
>>> XENMAPSPACE_gmfn_foreign. The memory would be reclaimed on domain
>>> destruction.
>>>
>>> Add logic to remove the previously mapped page before creating the new
>>> mapping, matching the x86 implementation approach.
>>>
>>> Additionally, skip removal if the same MFN is being remapped.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> I'm not sure where to point the Fixes tag to.
>>> ---
>>>  xen/arch/arm/mm.c | 32 +++++++++++++++++++++++++++++---
>>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index 6df8b616e464..b9f1a493dcd7 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -166,10 +166,11 @@ int xenmem_add_to_physmap_one(
>>>      unsigned long idx,
>>>      gfn_t gfn)
>>>  {
>>> -    mfn_t mfn = INVALID_MFN;
>>> +    mfn_t mfn = INVALID_MFN, mfn_old;
>>>      int rc;
>>>      p2m_type_t t;
>>>      struct page_info *page = NULL;
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>  
>>>      switch ( space )
>>>      {
>>> @@ -244,6 +245,33 @@ int xenmem_add_to_physmap_one(
>>>          return -ENOSYS;
>>>      }
>>>  
>>> +    /*
>>> +     * Remove previously mapped page if it was present, to avoid leaking
>>> +     * memory.
>>> +     */
>>> +    mfn_old = gfn_to_mfn(d, gfn);
>>> +
>>> +    if ( mfn_valid(mfn_old) )
>>> +    {
>>> +        if ( is_special_page(mfn_to_page(mfn_old)) )
>>> +        {
>>> +            /* Just unmap, don't free */
>>> +            p2m_write_lock(p2m);
>>> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
>>> +                               p2m_invalid, p2m->default_access);
>>> +            p2m_write_unlock(p2m);
>>> +            if ( rc )
>>> +                return rc;
>>> +        }
>>> +        else if ( !mfn_eq(mfn, mfn_old) )
>>> +        {
>>> +            /* Normal domain memory is freed, to avoid leaking memory */
>>> +            rc = guest_remove_page(d, gfn_x(gfn));
>>> +            if ( rc )
>>> +                return rc;
>>> +        }
>>> +    }
>>
>> This new code and what follows below it are not inside a single locked region,
>> hence the cleanup done above may well have been "undone" again by the time the
>> P2M lock is acquired below. That locking may not be apparent in the x86
>> variant when merely looking at functions used. There's a large comment,
>> though, explaining how we actually (ab)use the simplified locking model
>> (compared to what was once intended, but never carried out).
> Do you suggest to put the new code and old code in a single locked region?

Yes. Which may be difficult on Arm, where the P2M lock isn't recursive.

>> Further, doesn't P2M entry type influence what needs doing here, including
>> possibly rejecting the request? x86 refuses to replace p2m_mmio_direct entries
>> by this means, but seeing that Arm has XENMAPSPACE_dev_mmio, this case may
>> need handling, but the handling may need to be different from what you do
>> above. (Just to mention: Presumably on Arm it's no different from x86: An MMIO
>> page may or may not pass an mfn_valid() check.)
> I actually had the following in my initial implementation:
> p2m_write_lock(p2m);
> mfn_old = p2m_get_entry(p2m, gfn, &p2mt_old, NULL, NULL, NULL);
> if ( p2mt_old == p2m_mmio_direct )
> {
>     p2m_write_unlock(p2m);
>     return -EPERM;
> }
> but realized this is actually a different issue than the one I want to solve and
> I don't want to fix two in one go.

Hmm. If you indeed want to separate both (and also not have both in a
series), I'd then suggest to at least mention that this aspect (and
whatever else there may be) is deliberately left out.

Jan

