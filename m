Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNpcG4gwlGnQAQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:10:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C207A14A3C8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234683.1537841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsH5w-0002PX-ML; Tue, 17 Feb 2026 09:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234683.1537841; Tue, 17 Feb 2026 09:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsH5w-0002Ms-Iy; Tue, 17 Feb 2026 09:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1234683;
 Tue, 17 Feb 2026 09:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsH5v-0002Mm-B6
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 09:10:11 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74cbe545-0be0-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 10:10:08 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4837584120eso25829995e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 01:10:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a694d3sm104239475e9.10.2026.02.17.01.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:10:07 -0800 (PST)
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
X-Inumbo-ID: 74cbe545-0be0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771319408; x=1771924208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=86UtcHzjg9iP3Y+9o6V8epCBcUOMdnavKBFhUm3BARo=;
        b=TuIGvAzDFQ/+VwV4e8UvMeSW2CoGTdhKp0q4QVYJxhJstXLsIyMR5ohrHKSoIIl3fF
         RQaKtUYfVWFJyl6MZOJVgNSKQmzOTRnSFv8ae5izz8E3Zi0jumumoodKI/2SgLFoR1VR
         jAvZjUsD608ANtozHOxeIzAR3xLfLFfCC8SkPUkgjAmDjzYVAZDaoKODXC/MDrnycJBT
         U1seEJSSG/QIIMOalB6XPiJ+U3fKbwSAesXH7NJRZxJNGa6+HOKeek6KUabfbVFJTJ1V
         sxn7pOT9n9HMAGRsxalBa0Bc/75jiJr3UsDzO+FGxV7jkegmuaVBaYs9i+LNaD35pZHk
         OrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319408; x=1771924208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86UtcHzjg9iP3Y+9o6V8epCBcUOMdnavKBFhUm3BARo=;
        b=Ku2+QlCTNPvzdcx4ht1ya+t4aWP0PuWQ3ZvqzvRRxc2hf7TWcfQ8X9huIQddzbl9j8
         5zLPR4AGFg2XI+oLV1QXPgr+nDG0ysV+MnJig21vUVpZdPTAZN9pxoXoXYXST4jYMweh
         4XwynELViQPj9mq1C3Pxl9YP7tH3WMQocqtm/bTfZ8EE7A11g/TC/uN6/V8Xn+t82ptm
         Kg7EvdItrcnukn+GNnyFTHsewHD/C8Z++KVzKZzz8mSapx9/1quC2gj8CYh9lh5cHyi8
         gO0HdwinLhWP2j76VLh9egGXsrI3XQ/7PiblfbwwpsOHhYhFzY2vbjVfgIc25Gk8balh
         zjaA==
X-Forwarded-Encrypted: i=1; AJvYcCUOFt0ZO01n2BLUeDVZupt/0SF26Iy/FyAxi6VhtvCxzMHTw/9uncK/gu+P6YdWEUBdeK8hKuGa6XM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK9yyy3FhJ+w0g7EwPoF+GkouIqB4bC2M5ns92rloeIYlYiNRv
	UB9xDRqGAPzy8X8jieK9vKAgGSq00rIRq28puAqDcPetUsJrS6UDHiyJl8UOIipFPQ==
X-Gm-Gg: AZuq6aKU+BxWU2bTveBdNjmu9/Vwp03YKhExmhyF71dmJJbuVWHWIMCAAobl5T9PzWc
	aD6WwdAMGz+gvhlosCSqvPeBQnZyqjtTg0BeSKHiZ5Gf0ZVNKaDP6OafYUjOnvMuoQxGO9FVOrJ
	NlhmHlDE/vEwM5brsuLk6LcnTTH8LBQ01ZzUDwyPkbJ0YIjEQj/t+39f9inYczRQmd5WqSwtZR0
	GIU1z5puyau78OMSiHWhPuoQeGdIA7YLlb4mCivHQ1BQY7gEU55NhGDeT6JMFRk1kylshwci/nZ
	gh2ANT8Y6M3VwR8xRjoGGVrSqnbfLTdFG7X2oquD/JZUFH9hsQqmQaKaAvINbQ1EstZgjcbcYBs
	Eq90+klLefGl091bFvbDzUM1quD9eE+Zzyl3cY5OI87oQBJgcSY/3kTv8+gjpzqy70kyAVgUpnn
	q4WxpyEpSF2vI+3uscB7Uwno4Bp0VO8Jq8BM+05PltLyWBoahzMi6NaLl+WNrwkZaEWNGZGszg6
	V6WYgcitkYjj2k=
X-Received: by 2002:a05:600c:698c:b0:483:5a29:9678 with SMTP id 5b1f17b1804b1-48379b8bfbamr153664385e9.2.1771319407990;
        Tue, 17 Feb 2026 01:10:07 -0800 (PST)
Message-ID: <349ad398-8a18-46cc-a34b-576edfb544c0@suse.com>
Date: Tue, 17 Feb 2026 10:10:06 +0100
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
In-Reply-To: <d12d8cb7-bc1f-47a4-bc1f-004817394467@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: C207A14A3C8
X-Rspamd-Action: no action

On 17.02.2026 10:01, Oleksii Kurochko wrote:
> On 2/16/26 1:38 PM, Jan Beulich wrote:
>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
>>>           flush_tlb_guest_local();
>>>       }
>>>   }
>>> +
>>> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>>> +                                    p2m_type_t *t, p2m_query_t q)
>>> +{
>>> +    struct page_info *page;
>>> +
>>> +    /*
>>> +     * Special case for DOMID_XEN as it is the only domain so far that is
>>> +     * not auto-translated.
>>> +     */
>> Once again something taken verbatim from Arm. Yes, dom_xen can in fact appear
>> here, but it's not a real domain, has no memory truly assigned to it, has no
>> GFN space, and hence calling it translated (or not) is simply wrong (at best:
>> misleading). IOW ...
>>
>>> +    if ( likely(d != dom_xen) )
>>> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>>> +
>>> +    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
>> ... this comment would also want re-wording.
> 
> As you mentioned in the another reply to this patch, I messed up x86 and Arm
> implementation in a bad way, so here should be DOMID_XEN used instead of
> "Non-translated".
> 
> Based on your reply it seems like the first comment should be also rephrased
> as you mentioned that DOMID_XEN can't be called also "not auto-translated".
> I think it would be better to write the following:
>   /*
>    * Special case for DOMID_XEN as it is the only domain so far that has
>    * no GFN space.
>    */

Simply say that dom_xen isn't a "normal" domain?

>>> +    if ( t )
>>> +        *t = p2m_invalid;
>>> +
>>> +    page = mfn_to_page(_mfn(gfn));
>>> +
>>> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
>>> +        return NULL;
>>> +
>>> +    if ( t )
>>> +        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
>> If only dom_xen can make it here, why the check for dom_io?
> 
> Incorrectly copied from x86. It should be just:
>   *t = p2m_ram_rw
> here as in RISC-V for MMIO pages owner isn't set to dom_io (and the same is
> true for Arm I think).

May I suggest that right away you use the construct that I suggested Arm to
switch to (you were Cc-ed on that patch, I think)? Despite the absence of
p2m_ram_ro on RISC-V, that'll be usable, and it will allow keeping the code
untouched when p2m_ram_ro is introduced (sooner or later you will need it,
I expect).

Jan

