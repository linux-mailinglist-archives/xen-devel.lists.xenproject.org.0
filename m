Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7joZDtUiMWpkcQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:17:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD168E1E8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=L6YHwQod;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339070.1600192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQrS-0006Rs-WC; Tue, 16 Jun 2026 10:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339070.1600192; Tue, 16 Jun 2026 10:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQrS-0006PF-Sr; Tue, 16 Jun 2026 10:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1339070;
 Tue, 16 Jun 2026 10:17:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQrR-0006Nc-18
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:17:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQrQ-005Can-Cg
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:17:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3122ae-5cb7-0a2a0a5109dd-0a2a450ce7ca-44
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:17:36 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3122c0-62f1-0a2a450c0019-d155dd33d9b7-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:17:36 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso2508160f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:17:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa47ce3sm75691975e9.6.2026.06.16.03.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 03:17:34 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781605056; x=1782209856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=juA3+18AhhbVIaQe/2VOGliqYiMHNv5kVUzNjIvEzMU=;
        b=L6YHwQodao8Bqt1wf5Y4nLL+KIcGCAfoSexCfkPgAJW9GdHtku3g4cPzj4+Mb+a8zo
         8u4VswvWaLLzwUqxNNqhmtcw5fDGTbnhotjE/upyIKjX7PvXEFdRvqfimVkF1kWKG8+a
         tnwAW98tbxWf6Mf3hxoCpS0EqD1JUGBtgLJcjEcu151DpgDMfI/9/JRWPvl5jVL9vcmu
         dKgOl8IC55hyJ5hhWyVdsI/+fch4Fq8iGhUjfUR11FZcwLNWEtqq8e0ZRXq/AkWjECPO
         x8IY3AI/s8LBN45qRJqve9Q+2s4f6SaawnD6+MbXMd9KvmcK8KBjsTYqxxeP4lnEofM4
         E2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605056; x=1782209856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juA3+18AhhbVIaQe/2VOGliqYiMHNv5kVUzNjIvEzMU=;
        b=o8+LNeOtfjlwH7dzTTswk9/Wh6psKntP3ieq/0pt/HbrtITOO0IWDeMTZHE7wcZOlU
         l18L4cAIxhuyCq7SVnwmvHwHICkZIA5QjrJJGLANFfeayJa+jBPM1WHxXTlywr0zBkKS
         KGuhXHPWfYkbXZouQYvJ7pwkta8ykrgis4wFEMOmOO1jy9bGMV0yj+5q47G0zc4JlquK
         8DuuK86Y/UjsWCYB2jPyrrNjv/AqBM5d4QeNsER0PUM2n3wv5ntspPXverEqac6CKX8v
         ChkhtEqUJM7GAs5UyLdPn6ceHLj5VMl6B7zd7F/hQgX9BloJB4bFZaUWq6L+yexEPReG
         sGIw==
X-Forwarded-Encrypted: i=1; AFNElJ+FvILiOnUiMZk4gmOagmoacQ9wP+tG2Ycqrv4GcnRbkfpOYzzgirOw71pFrY3UCmds9ozbR4WwREE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhYBhWjhZJOcuRD2swuracxZ6R2lLI5OPexRJ7KCH0TuynFKgm
	MQyMtWx3yhzain075o6e7FIDxYj1+soH8q4leoSQADl/7r72PhuuY2XTDFO7ChUVUA==
X-Gm-Gg: Acq92OF2i4QECwhWgSwsUB3Xfi8wdNjsWvGTkXxShVQAivFk7S9bY+PQpMyBQ9NDer9
	3pM8WVhAnaG6G1a25ztq5TrjvHjQD+Z7qNfOirMxJrfNArbFdWE1t+3yWwxcfauW2Xs6eveM0at
	8QOwtL18LC7lsvqAwdMaTPKHUl/zimgk7v+/Jk8aLYwW4BR8Flog0wPMSWoCmzvNbFhj4zc+1lN
	yRrqM+milF5hqbeD2vk1dAD/L+0D+sXKKd+1eO8dpGGTCRN/7ydALueulbvuQyw8H+Ygh+EvyUH
	0GscHvCIUz4ScaCSJCQCgL+cRLbbZ7u/SugTtuIc7l8Ez2WVuhtJ8IPw96/mSIyoBiOhfY8g/v+
	5lxm1iKYY4aN43nL4sRvXy+hDH/5X5HNKOj59YulQY973yHcK0B82dwm4IpYMZUxBWqUi3rYKdk
	MxqWH119QB2p+fAmgkPjzA5i7oIM9JSjJuPUOpD8w2ohtqA/Xur7Z3f8mozr4BPKEPKsqGiIzKL
	SM1kL04kZzpLN1w61Unnqh1RA==
X-Received: by 2002:a7b:cd0b:0:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-49220143bc6mr139847735e9.30.1781605055274;
        Tue, 16 Jun 2026 03:17:35 -0700 (PDT)
Message-ID: <b1378fde-29fc-4149-a421-56c64f8541c3@suse.com>
Date: Tue, 16 Jun 2026 12:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Daniel Smith <dpsmith@apertussolutions.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
 <20260613214749.20620-13-frediano.ziglio@cloud.com>
 <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
 <CAHt6W4en1yMLrUXv+RbcoPr-=S_=pi2Rrcm2BC2PzMZT+0ksFw@mail.gmail.com>
 <1c1829d2-4cb4-4e29-9012-fdcbca8d79a9@suse.com>
 <CAHt6W4daGuduOgRNUFOB8SZd+C5bxaubyQoU=xDcJSMzo97VDw@mail.gmail.com>
 <024e626a-e1be-4959-bd78-4e229beade98@suse.com>
 <CAHt6W4d62wJyALu3pM52JB12FXfDS0+fDk6Hna9fP55acskSAA@mail.gmail.com>
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
In-Reply-To: <CAHt6W4d62wJyALu3pM52JB12FXfDS0+fDk6Hna9fP55acskSAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781605056-E1F6ACF5-5D48EBDF/0/0
X-purgate-type: clean
X-purgate-size: 9937
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72FD168E1E8

On 16.06.2026 11:47, Frediano Ziglio wrote:
> On Mon, 15 Jun 2026 at 16:23, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.06.2026 17:07, Frediano Ziglio wrote:
>>> On Mon, 15 Jun 2026 at 15:03, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.06.2026 14:11, Frediano Ziglio wrote:
>>>>> On Mon, 15 Jun 2026 at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 13.06.2026 23:47, Frediano Ziglio wrote:
>>>>>>> +        {
>>>>>>> +            struct page_info *foreign_page;
>>>>>>> +            void *foreign;
>>>>>>> +            p2m_type_t p2mt;
>>>>>>> +            const unsigned long valid_mask =
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
>>>>>>> +#else
>>>>>>> +                p2m_to_mask(p2m_ram_rw);
>>>>>>> +#endif
>>>>>>
>>>>>> What about, for example, p2m_ram_ro? Or p2m_ram_shared? Or p2m_grant_map_*?
>>>>>> Etc. Any artificial constraining wants justifying in the description and/or
>>>>>> mentioning in the public header.
>>>>>
>>>>> The base of this was taken from migration code where there is such a check.
>>>>> I suppose that adding p2m_ram_ro (where available) won't hurt.
>>>>
>>>> Just to mention, to avoid another round trip just because of this: p2m_ram_ro
>>>> has different meaning on x86 vs Arm/RISC-V.
>>>
>>> That's confusing... should not this be fixed somehow?
>>> It won't save much from a round-trip. Should I allow it or not ?
>>
>> Ask the Arm maintainers. I raised this issue more than once, without any real
>> success.
>>
>>>>> p2m_ram_shared I'm not sure but seems fine too.
>>>>> For p2m_grant_map_* it feels a bit a security issue to me. It would
>>>>> allow a guest to give access to pages of other domains. It's true that
>>>>> the current domain would have to have write access to this domain
>>>>> anyway but extend these permissions sounds something it should not be
>>>>> able to do.
>>>>
>>>> It could copy the contents of the grant mapped page by other means. Why not
>>>> allow it in this new sub-op as well then?
>>>
>>> I'm more afraid of writing the content of the grant pages than copying it.
>>
>> But the same is true for writing to the granted page: The domain could do so
>> by other means.
>>
>>>> Talking of security: When the page you copy to is owned by a PV guest, I
>>>> think you further need to obtain a PGT_writable type ref. (Of course it then
>>>> likely is easier to always do this, not just for PV.)
>>>
>>> Wondering how save/restore (or migration) works in this case.
>>
>> Save is not relevant here. Restore happens before the guest gains control.
>> Which is entirely different from hypercall handling.
>>
>>>>>>> @@ -2012,6 +2139,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>              start_extent);
>>>>>>>          break;
>>>>>>>
>>>>>>> +    case XENMEM_foreigncopy:
>>>>>>> +        if ( unlikely(start_extent) )
>>>>>>> +            return -EINVAL;
>>>>>>
>>>>>> Please address review comments (verbally or by code changes) before submitting
>>>>>> a new version. Here I had asked "Why make this different from other continuable
>>>>>> sub-ops?"
>>>>>>
>>>>>
>>>>> There's already a comment in the same file for similar reason
>>>>>
>>>>>     /*
>>>>>      * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
>>>>>      * it ever becomes a practical problem, we can switch to mutating
>>>>>      * xmar.{frame,nr_frames,frame_list} in guest memory.
>>>>>      */
>>>>>
>>>>> so to avoid the doubt and possible future change I mutate the structure.
>>>>> Also I use the mutation to give more information to the caller, using
>>>>> "start_entent" won't allow this.
>>>>
>>>> You'll want to mention this in the description and/or a code comment. It
>>>> wants to become clear that the inconsistency in behavior (with other sub-
>>>> ops) is deliberate rather than accidental.
>>>>
>>>
>>> Added a comment in the code:
>>>
>>>         if ( copy.nr_frames && hypercall_preempt_check() )
>>>         {
>>>             /*
>>>              * Instead of using "start_extent" we update the structure back,
>>>              * we update it back in anyway to tell caller were the copy
>>>              * stopped.
>>>              */
>>>             rc = hypercall_create_continuation(
>>>                 __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
>>>             goto out;
>>>         }
>>
>> Please can this go into the hunk that I commented on?
>>
>>>>>>> --- a/xen/include/public/memory.h
>>>>>>> +++ b/xen/include/public/memory.h
>>>>>>> @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
>>>>>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>>>>>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>>>>>>>
>>>>>>> -/* Next available subop number is 29 */
>>>>>>> +/*
>>>>>>> + * Copy memory from/to a given domain.
>>>>>>> + */
>>>>>>> +#define XENMEM_foreigncopy 29
>>>>>>> +struct xen_foreigncopy {
>>>>>>> +    /* IN - The domain whose resource is to be copied. */
>>>>>>
>>>>>> There's still "resource" here, when this really is about RAM (memory) only,
>>>>>> not any other kind of resource.
>>>>>>
>>>>>>> +    domid_t domid;
>>>>>>> +
>>>>>>> +    /* IN - Flags. */
>>>>>>> +#define XENMEM_foreigncopy_from 0
>>>>>>> +#define XENMEM_foreigncopy_to 1
>>>>>>> +#define XENMEM_foreigncopy_direction 1
>>>>>>> +    uint16_t flags;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * IN
>>>>>>> +     *
>>>>>>> +     * As an IN parameter number of frames of the domain to be copied.
>>>>>>> +     */
>>>>>>> +    uint32_t nr_frames;
>>>>>>
>>>>>> This isn't just an input, as you update the field (and the handles below).
>>>>>> This property of fields wants reflecting here, so callers know that they (a)
>>>>>> can't re-use the struct on a subsequent call without re-initializing the
>>>>>> fields which may have changed, and (b) can't put the struct in r/o memory.
>>>>>>
>>>>>
>>>>> Update comments:
>>>>>
>>>>> /*
>>>>>  * Copy memory from/to a given domain.
>>>>>  */
>>>>> #define XENMEM_foreigncopy 29
>>>>> struct xen_foreigncopy {
>>>>>     /* IN - The domain whose memory is to be copied. */
>>>>>     domid_t domid;
>>>>>
>>>>>     /* IN - Flags. */
>>>>> #define XENMEM_foreigncopy_from 0
>>>>> #define XENMEM_foreigncopy_to 1
>>>>> #define XENMEM_foreigncopy_direction 1
>>>>>     uint16_t flags;
>>>>>
>>>>>     /*
>>>>>      * IN/OUT
>>>>>      *
>>>>>      * As an IN parameter number of frames of the domain to be copied.
>>>>>      * On output on error updated number of frames left.
>>>>>      */
>>>>>     uint32_t nr_frames;
>>>>
>>>> This is updated not only on error, but also when encoding continuations.
>>>>
>>>
>>> Yes, but this seems more an implementation detail to me. I don't think
>>> the caller cares about how the continuation is implemented.
>>
>> You just can't know what a caller may or may not care about. You want to
>> be precise.
>>
>>>>>>> +    /*
>>>>>>> +     * IN
>>>>>>> +     *
>>>>>>> +     * Frames to be copied.
>>>>>>> +     */
>>>>>>> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * IN/OUT
>>>>>>> +     *
>>>>>>> +     * Userspace buffer to read/write from.
>>>>>>> +     */
>>>>>>> +    XEN_GUEST_HANDLE(uint8) buffer;
>>>>>>
>>>>>> With these two handles, there continues to be a need to (explicitly) deal
>>>>>> with the compat case as well.
>>>>>
>>>>> I don't agree with this. Domains having access to other domains are
>>>>> limited (like stub domains for Qemu) and won't be 32 bits today so why
>>>>> allow 32 bits guests if not ever used?
>>>>
>>>> How do you know? Why shouldn't e.g. XTF be permitted to test this in all
>>>> possible modes? And even if all arguments end up in favor of "no compat
>>>> support", this then wants spelling out to make clear this wasn't an
>>>> oversight, but rather a conscious decision.
>>>>
>>>
>>> XTF can do something like
>>>
>>> #if COMPAT_GUEST
>>>     /* Compat guests are not supported, return success. */
>>>     return 0;
>>> # endif
>>>
>>> (or can be done in the Makefiles I suppose).
>>>
>>> Added a comment in memory.h:
>>>
>>>     /*
>>>      * Copy memory from/to a given domain.
>>>      * As this call requires target access and guest with target access won't be
>>>      * compat guests supported for compat guests this is not implemented.
>>>      */
>>
>> Well, okay. Right now what I can say is that with this it's then going to be
>> rather unlikely that I'd ack the overall change. You make assumptions on
>> what people may or may not do. There are still benefits to 32-bit environments
>> in certain situations, even more so that the x32 mode of x86-64 didn't really
>> take off.
> 
> Won't it save some round trips if you just told this a couple of
> emails earlier? If you already knew that compat is worth doing why
> asking to put a comment on it?

I'm sorry if this ended up confusing, but I specifically had made that
request conditional: "if all arguments end up in favor of". To me this
was pretty much rhetorical, but apparently it wasn't to you.

> Similar to the discussion about Arm, if you know the issue, can you
> explain it in more details? The description for the constant is the
> same in all architecture, so, what is the difference?

While Arm also says "writes are silently dropped" in the comment, I don't
think this matches the present use of the type: Afaict the type simply
means "r/o", without there being code to actually handle (skip) respective
guest insns. Part of my previous suggestion was to, at the very least, get
comment and implementation in line (i.e. even if p2m_ram_ro then would end
up having different properties on x86 and Arm).

Jan

