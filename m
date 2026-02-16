Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPNhGnUQk2lh1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 13:41:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9303143696
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 13:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234127.1537460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrxud-0008AR-CA; Mon, 16 Feb 2026 12:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234127.1537460; Mon, 16 Feb 2026 12:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrxud-00088z-9X; Mon, 16 Feb 2026 12:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1234127;
 Mon, 16 Feb 2026 12:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrxub-00088t-6t
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 12:41:13 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c64bc786-0b34-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 13:41:11 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so17244045e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 04:41:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837a5d562esm163465015e9.15.2026.02.16.04.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 04:41:10 -0800 (PST)
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
X-Inumbo-ID: c64bc786-0b34-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771245671; x=1771850471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=prqeE9bldgstLAFRdVZUSAfwYzXf6mauC3xewk05DqE=;
        b=LrD+TFTzpUUyk2CDwVzLjjvatIFzFtOwQ9j3kZCim75Y25evaCCD9dMELOH0/Ph1id
         4uMv2CZCOmPM3i+UXQjzwyDjx6OT8KPfOYtH2QdEVBx2wIvQclwcu/AD2KRseNh8xm8H
         JTCx4MCNqumrb5ir54WcwTKILvWge7rh9bYO8AggjECd/ZHkawJvLk0x36S1DJEkF672
         +9b4f9CTtmpBnhVFme0pCJkZ7f4zL8t2Idie2txkdvh2BNr4Tmg6br6Wojx3hgRDO6NQ
         p5FRLTdLFEy66QdurVsxFM6t5vQVkzJ9K8CTNcejvBtokharDBOu3MTYmT09xGipSqO6
         GDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245671; x=1771850471;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prqeE9bldgstLAFRdVZUSAfwYzXf6mauC3xewk05DqE=;
        b=tJMpssociDJRheUdpUn8+KVPR42WaW7X2GKmfyaXWI8/tEe6M5arI87CsJVMI0MXJz
         BTqB5Fs3J4RbSCJV9NUJIjAHHfCjzZM9xWe9Q7xL95K3OhHVipIlHoYd75nn5AV8rxYs
         LBqXsXPWogWIqm/js870NkVou/V+YU3OU9tI3UaFxPDNtzvdGZQCE009+aOqsXQeLatg
         vQAtsDOC7M53qZzfdYbyyuE8qMAes9MgIBByxHT9YBi08syVABTEzsdA04/plWYMrbrX
         BhZOkoxYzAROpyXpUBy2yXKmWANfdiCgapTTF2zlkNWSIGxgiREJi+wvmdtyaBkHYL4M
         /YrA==
X-Forwarded-Encrypted: i=1; AJvYcCVmITQxUmzr7ordRuFrJjuaLjNoDDKGyN0+U56WFPAOf83qiw32/KuhsNulRH8i/7husWzqB7K4/lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKIxRnQAdQgDdgp7zlf3bYboM4ulWLggIbykoAa04HMS2bApxJ
	hYax/0+IoVpvexvwojg1Xc3cm7ydxILcs47NCe3YyFysspEaeJ44pM/s1SNv4yre3A==
X-Gm-Gg: AZuq6aKXNvjRakfg1qibPotrzZrcLD0C6VSyCMBNdIXYtXi6vAQqn5ot95YRu9G8Vbj
	TuQoYJ436VJ1nl1VJyQGTZBWNTlMlH3k8FTpourSY4QcGbbzjmBJ66tg5TBmpFA2i4dkCf+X9eH
	wwQHMch1MhAe62seO4p46gpbZsjrK51wsSBYogdEWP5453uMLsjaCSL6vF5BDJSPpCdivBEPHRT
	ZFL02qi2c6rCMo12sGrbFa/HorjWZee6fa1kTdbcFv4urnNbnF2YhHCzF6ffn2VNqh+m3ABg8N2
	pdCRqQzeku1PrNJrKxZHfwdrWv9i/Dyub/yM4EKemyWuJ8hE61Q26RCg8Bi1QXIYcvLlvhranQ8
	FGe8/WxcgdZFZ4wi+1iv0UgjMF+2eWgXZSFk6w9crvlhjXjFs5qtzc4hAx8bZej5UYyMqzWl3GR
	MucfDEZDaiqWvaOCWr/kZ4KxfBMcq2tdnOPA6u4zS31A+5Wium/qORhj2ptBdTA+zmeSUvT8Srd
	sto7CuVc1LXYuI=
X-Received: by 2002:a05:600c:8b84:b0:483:4bbc:89ea with SMTP id 5b1f17b1804b1-48379c42db1mr131645655e9.37.1771245671233;
        Mon, 16 Feb 2026 04:41:11 -0800 (PST)
Message-ID: <89cf7c4d-4507-43a8-843e-e9fbfa68519c@suse.com>
Date: Mon, 16 Feb 2026 13:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: implement get_page_from_gfn()
From: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
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
In-Reply-To: <c053f6bd-eedc-4dbf-a404-802781dee722@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: C9303143696
X-Rspamd-Action: no action

On 16.02.2026 13:38, Jan Beulich wrote:
> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>> Provide a RISC-V implementation of get_page_from_gfn(), matching the
>> semantics used by other architectures.
>>
>> For translated guests, this is implemented as a wrapper around
>> p2m_get_page_from_gfn(). For DOMID_XEN, which is not auto-translated,
>> provide a 1:1 RAM/MMIO mapping and perform the required validation and
>> reference counting.
>>
>> The function is implemented out-of-line rather than as a static inline,
>> to avoid header ordering issues where struct domain is incomplete when
>> asm/p2m.h is included, leading to build failures:
>>   In file included from ./arch/riscv/include/asm/domain.h:10,
>>                    from ./include/xen/domain.h:16,
>>                    from ./include/xen/sched.h:11,
>>                    from ./include/xen/event.h:12,
>>                    from common/cpu.c:3:
>>   ./arch/riscv/include/asm/p2m.h: In function 'get_page_from_gfn':
>>   ./arch/riscv/include/asm/p2m.h:50:33: error: invalid use of undefined type 'struct domain'
>>      50 | #define p2m_get_hostp2m(d) (&(d)->arch.p2m)
>>         |                                 ^~
>>   ./arch/riscv/include/asm/p2m.h:180:38: note: in expansion of macro 'p2m_get_hostp2m'
>>     180 |         return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>>         |                                      ^~~~~~~~~~~~~~~
>>   make[2]: *** [Rules.mk:253: common/cpu.o] Error 1
>>   make[1]: *** [build.mk:72: common] Error 2
>>   make: *** [Makefile:623: xen] Error 2
> 
> Surely this can be addressed, when x86 and Arm have the function as inline?
> 
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Does it make sense to make this function almost fully generic?
>>
>> It looks like most of the logic here is architecture-independent and identical
>> across architectures, except for the following points:
>>
>> 1. ```
>>    if ( likely(d != dom_xen) )
>>    ```
>>
>>    This could be made generic by introducing paging_mode_translate() for ARM
>>    and defining it as `(d != dom_xen)` there.
>>
>> 2. ```
>>    if ( t )
>>        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
>>    ```
>>
>>    Here, only `p2m_mmio_direct_io` appears to be architecture-specific. This
>>    could be abstracted via a helper such as `dom_io_p2m_type()` and used here
>>    instead.
> 
> With P2M stuff I'd be careful. Abstracting the two aspects above may make
> future arch-specific changes there more difficult.
> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
>>          flush_tlb_guest_local();
>>      }
>>  }
>> +
>> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>> +                                    p2m_type_t *t, p2m_query_t q)
>> +{
>> +    struct page_info *page;
>> +
>> +    /*
>> +     * Special case for DOMID_XEN as it is the only domain so far that is
>> +     * not auto-translated.
>> +     */
> 
> Once again something taken verbatim from Arm.

Actually it's a mix, up to ...

> Yes, dom_xen can in fact appear
> here, but it's not a real domain, has no memory truly assigned to it, has no
> GFN space, and hence calling it translated (or not) is simply wrong (at best:
> misleading). IOW ...
> 
>> +    if ( likely(d != dom_xen) )
>> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);

... here it's Arm code, but what follows is x86 code. Why did you create such
a mix?

Jan

>> +    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
> 
> ... this comment would also want re-wording.
> 
>> +    if ( t )
>> +        *t = p2m_invalid;
>> +
>> +    page = mfn_to_page(_mfn(gfn));
>> +
>> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
>> +        return NULL;
>> +
>> +    if ( t )
>> +        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
> 
> If only dom_xen can make it here, why the check for dom_io?
> 
> Jan


