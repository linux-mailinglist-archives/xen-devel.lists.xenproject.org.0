Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB+TGKVFlGmcBwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:40:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9914AF19
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234786.1537905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIV6-0007sH-76; Tue, 17 Feb 2026 10:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234786.1537905; Tue, 17 Feb 2026 10:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIV6-0007pw-3E; Tue, 17 Feb 2026 10:40:16 +0000
Received: by outflank-mailman (input) for mailman id 1234786;
 Tue, 17 Feb 2026 10:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsIV4-0006sb-RW
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 10:40:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a84cf2a-0bed-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 11:40:13 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2879091f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 02:40:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a78c89sm326708785e9.5.2026.02.17.02.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:40:12 -0800 (PST)
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
X-Inumbo-ID: 0a84cf2a-0bed-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771324813; x=1771929613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jhRM5XYO45exmyR3bTfVssls7DqrhYBlqXmOgp9F1Iw=;
        b=VWlrIDaaez3w0ddOdEXOqAh6EbVaUNjoGGz8f7PqiK2lbO3bzN/xpvsyS4UvsEzutx
         L0zsMriegCMaab7F3BBLO0Kz2aYUfniS/LSFVN/SdYK6i+11Nrrk/AWkbxXXUnVKy/iP
         BY46jYWBQ0SSiI0mpxrMGUh+KVqpPR5QznqBufKNI+jh60juiD+IO+2eJYSQvLG+3Uz6
         kCE+OpSut1dXTTv9iq2SnMp+NX2h3ugQIdbwDhkFYaUFKuDsDVOU2GE3DPZWzQVZJP5D
         ss55ufjpNDLZEqGtAxpmwSmqvU9aKGUTRObyFGFziURdQ5WJpXtoNlzOpAVLXCGhqnW9
         I4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324813; x=1771929613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhRM5XYO45exmyR3bTfVssls7DqrhYBlqXmOgp9F1Iw=;
        b=LTpyvixP4SMroKfcHMmfdAqIE/htdyBb5dKQHE7SfYGcKKko2JTKPGX9kpIIIdHQbw
         eA4lMHwCWCjk1g+TYWrwYFwTwNZJWnq/vF3LaZmyIUBm+3GhW0zG6+6MH6dvV8dzUYd8
         aeeQhpgC3KrRKObf5JgvrsB349W3N9EViwKAQxs0e6ctUb2yI5cTX2wz8+//EEx5BW0Z
         SFxQbUz0B1d54ZmwX7Ev+Zr0iH0vspJtBhJwMHpMgG+TLALtmfmn4Eq5/iepW/uxc8EY
         LTfp0BvISG1AO7tOdSEmms+YGU4h1emlq9xXZCfjENcdFX9mJdKdwetujuC9quwjVdg9
         BGlw==
X-Forwarded-Encrypted: i=1; AJvYcCVGubf/v6IP2pKaOL+sHn0qfo3EQbUcxxTtxGNUnNFkkTX0rp1oFwTR7/zZWNWQ3DVLK2eXgk1E4tE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEsyGzA6UG0U9mSnBVUxmHJ0vMflYtd3D+5UewT085UEbndPgd
	spYeGj8EzR3szuZ4uEyawz7sx2xF9qzkYzkWL4CeM5MLgynsu2+gmnfNz5nEy5b/2w==
X-Gm-Gg: AZuq6aIRnn2JnGfugTDucGJukeSBqDbjZlwqwakxtW3aNrmJY+ERgFMDHOUxlj05tOJ
	0Ug4fLbG9sw58x5PLYXux1irl8TuSIl7M6eH3g+/zBqIzmbtmrTQ+nheeYLiwBffG4q8iG7fggI
	zpUJTLl/SxLXdbTFQbvRMzgrjqPS+9s/7YgVOj4gDT3oq2w8Rfw8eLXucYnJrKnzdlyNDW0rehC
	HTb9OmnGDWwb5c1leuaBZqQD3SQC+Gp015v/FIdSXw++2CuhcR0Jz1yjyF77ZC1EwY2Ggu6d7ZP
	NHs6sDhHHQ4u4l7wrGVWWUo+FsUYj1OJrFuEka4IKBnct/HFB1nUAuHvTxETzTeS3ljjetB7nEU
	Qg7STVOv+q9vcff61vVtNaI5IDMVCdk/ndu+SYFtMgdnrsjHaf86LsSegZhxD+RgFCUsgv34w4v
	MYz7zyhD40g3ciW1AcPanoaHQoFjwX5+R+Wrod36DNqJBJieJDxW17AJXg8P3qplQtYB5bd+RWJ
	FvDs7DgJqmwrjtH+PqnG796BQ==
X-Received: by 2002:a05:600c:8b30:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48379bd7462mr189936365e9.17.1771324813089;
        Tue, 17 Feb 2026 02:40:13 -0800 (PST)
Message-ID: <bdd12139-7007-4b36-8d1e-14d722fc668c@suse.com>
Date: Tue, 17 Feb 2026 11:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: implement get_page_from_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <04eee3ae5e8aadf8c7f0b873ba24ce38220e8fa2.1770821989.git.oleksii.kurochko@gmail.com>
 <c053f6bd-eedc-4dbf-a404-802781dee722@suse.com>
 <d12d8cb7-bc1f-47a4-bc1f-004817394467@gmail.com>
 <349ad398-8a18-46cc-a34b-576edfb544c0@suse.com>
 <5146fc56-9fa7-49c9-8184-954ca84eb439@gmail.com>
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
In-Reply-To: <5146fc56-9fa7-49c9-8184-954ca84eb439@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C8D9914AF19
X-Rspamd-Action: no action

On 17.02.2026 10:58, Oleksii Kurochko wrote:
> 
> On 2/17/26 10:10 AM, Jan Beulich wrote:
>> On 17.02.2026 10:01, Oleksii Kurochko wrote:
>>> On 2/16/26 1:38 PM, Jan Beulich wrote:
>>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
>>>>>            flush_tlb_guest_local();
>>>>>        }
>>>>>    }
>>>>> +
>>>>> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>>>>> +                                    p2m_type_t *t, p2m_query_t q)
>>>>> +{
>>>>> +    struct page_info *page;
>>>>> +
>>>>> +    /*
>>>>> +     * Special case for DOMID_XEN as it is the only domain so far that is
>>>>> +     * not auto-translated.
>>>>> +     */
>>>> Once again something taken verbatim from Arm. Yes, dom_xen can in fact appear
>>>> here, but it's not a real domain, has no memory truly assigned to it, has no
>>>> GFN space, and hence calling it translated (or not) is simply wrong (at best:
>>>> misleading). IOW ...
>>>>
>>>>> +    if ( likely(d != dom_xen) )
>>>>> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>>>>> +
>>>>> +    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
>>>> ... this comment would also want re-wording.
>>> As you mentioned in the another reply to this patch, I messed up x86 and Arm
>>> implementation in a bad way, so here should be DOMID_XEN used instead of
>>> "Non-translated".
>>>
>>> Based on your reply it seems like the first comment should be also rephrased
>>> as you mentioned that DOMID_XEN can't be called also "not auto-translated".
>>> I think it would be better to write the following:
>>>    /*
>>>     * Special case for DOMID_XEN as it is the only domain so far that has
>>>     * no GFN space.
>>>     */
>> Simply say that dom_xen isn't a "normal" domain?
>>
>>>>> +    if ( t )
>>>>> +        *t = p2m_invalid;
>>>>> +
>>>>> +    page = mfn_to_page(_mfn(gfn));
>>>>> +
>>>>> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
>>>>> +        return NULL;
>>>>> +
>>>>> +    if ( t )
>>>>> +        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
>>>> If only dom_xen can make it here, why the check for dom_io?
>>> Incorrectly copied from x86. It should be just:
>>>    *t = p2m_ram_rw
>>> here as in RISC-V for MMIO pages owner isn't set to dom_io (and the same is
>>> true for Arm I think).
>> May I suggest that right away you use the construct that I suggested Arm to
>> switch to (you were Cc-ed on that patch, I think)? Despite the absence of
>> p2m_ram_ro on RISC-V, that'll be usable, and it will allow keeping the code
>> untouched when p2m_ram_ro is introduced (sooner or later you will need it,
>> I expect).
> 
> Sure, but doesn't that patch is connected to another function (translate_get_page())
> and just fixing the handling of what get_page_from_gfn() in *t?

Oh, sorry, I should have made explicit that the request was for patch 2.
Here indeed ...

> For get_page_from_gfn() to not miss the case when new type is introduced it make
> sense to do the following:
>      if ( page->u.inuse.type_info & PGT_writable_page )
>          *t = p2m_ram_rw;
>      else
> 	BUG_ON("unimplemented");

... this may be the best you can do right now (unless you want to introduce
p2m_ram_ro).

Jan

