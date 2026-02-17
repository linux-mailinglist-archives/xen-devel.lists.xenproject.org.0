Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO0oLYAulGnQAQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:01:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2837114A246
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234673.1537831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsGxX-0000jW-TM; Tue, 17 Feb 2026 09:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234673.1537831; Tue, 17 Feb 2026 09:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsGxX-0000hR-QK; Tue, 17 Feb 2026 09:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1234673;
 Tue, 17 Feb 2026 09:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsGxW-0000hI-7x
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 09:01:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eefa890-0bdf-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 10:01:28 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso511719866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 01:01:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3f137dsm2183625a12.27.2026.02.17.01.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:01:27 -0800 (PST)
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
X-Inumbo-ID: 3eefa890-0bdf-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771318888; x=1771923688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L15KdnMdJlA0XZbOQvXvHmVbuz0rgu6RZil8bD0/q6M=;
        b=VXWGCZKqvfkIchuydyjD9b+JUqla8F2L0HS5pAWL5cupIBmgF3TUnr194u8sp9jH4g
         QeDSzfx+ig55I9M0m44lNDiCHDbAAOBzDYYkM/p/veLWITWFOSnNqHQNF/6EM1/WFnaE
         EmLtoRLPvW2twodrPiU1+GAB6KUYHvwL2jJC0QtqkE6rr70//F42ZW5GhFEPdKFkwAyI
         xaEXUzwYtb8d1qtaUq1vJfoOJawqtxXiABjeZVWl58QFnNH88tPXck7pt+pF5qUJ6L4i
         y5+yNIqj8P96AjMH7J4mBn2WKhYSukiYJgVgiRIFyZtIooHAy58JZsLVpj8kpjt3a72O
         uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771318888; x=1771923688;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L15KdnMdJlA0XZbOQvXvHmVbuz0rgu6RZil8bD0/q6M=;
        b=NkeSR8XcC8qcLfkAjDZ5QCa9ENqtds9nDuJg8uXXMx1GY+e2AQA/Np5VrDM7ni+ggp
         s4577XnqTGDcl9wFbIlrieLiMdl5q0vOpoOp82GCU3GL6tWgV9Cw7gfqbJ3VS36+i6s0
         Y7B/mLIx+BaFo2EhT3RWirUl4YusvhfjegFELyQmAQq05+Nhpjy7ANwxWaS8lwlWQHt9
         FgPAmQJeiYTBnpV3TJHVNda/ccRwb36c61tkJVAMiOL+7yH0YVzQb9DSQ/HT18SAZfUU
         WmcxEsNNZlMMsG81Rh7Cckum+vf/HkEPjs97yFMs3zZnQuDwVeqFMsBIhRFGeRl+Fmdi
         9ztw==
X-Forwarded-Encrypted: i=1; AJvYcCVIivtYKHv5rn1bPFEXD0ScknD1kuzzPT+hRUCMkmg9bKaqlAwy5UYCuXl4panlQUBWOJXasy6jcaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwP/UyHBHSE92Z0RUdwqP5Ttqr18wF3/5bElJrlNMoRI1RLtpbH
	fBJTbqLsOCv3jh6aVe4yvQxxAE4flK7Ph4xYH63ddY0/rccOH2RtdvJs
X-Gm-Gg: AZuq6aLtfxhUJ70+Cu4z+zODbf0w0F56z5NsC7iWL34jDN0hXMwiXqmL74N+pu+6A9n
	49rsPaYPwqStBd6pfWBYdeSP6F2hWEx+uv7/jIr71QdjS4e9PDHAhvgdA5TLzVhcg/d7hZZHyDK
	8hs1BXWbhc3boFoaIgwF1sMjaaH8E5Z4v2cSiS6ZFAXfbdFvAL+xTNHQk8Zh/eeRhSI7xP3pmh+
	BySlSa7ejGwEV1EzTKum1CFzVJEmiiiG2T7fpMWLb4LX0sAs/C6shyiZ8qDryVDuySY13PTlnWE
	VxsMzN//Uoku3TmSMqVBRrWBTLzgF5muGe4e8rX+tzNx8Rdx96L70CAT4viyWtgsm6srHhpwrek
	xZQdOY6K8vK6Iz/fMpX8ZAlZitesNikdcTU0lQmI016rHZJnjui5P16pgjNIWqwVAyFy/ZwnEDp
	NWz63fn7LaD+5fsx9AsiP7gELkDelxBzMTEZ6A3wCKrbPp0/aS5RUAGsqaI7td142lM6aecxflr
	TQ=
X-Received: by 2002:a17:907:9303:b0:b8f:b222:339 with SMTP id a640c23a62f3a-b8fb478f71emr649440466b.65.1771318887824;
        Tue, 17 Feb 2026 01:01:27 -0800 (PST)
Message-ID: <d12d8cb7-bc1f-47a4-bc1f-004817394467@gmail.com>
Date: Tue, 17 Feb 2026 10:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 1/6] xen/riscv: implement get_page_from_gfn()
To: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <c053f6bd-eedc-4dbf-a404-802781dee722@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2837114A246
X-Rspamd-Action: no action


On 2/16/26 1:38 PM, Jan Beulich wrote:
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
>>    In file included from ./arch/riscv/include/asm/domain.h:10,
>>                     from ./include/xen/domain.h:16,
>>                     from ./include/xen/sched.h:11,
>>                     from ./include/xen/event.h:12,
>>                     from common/cpu.c:3:
>>    ./arch/riscv/include/asm/p2m.h: In function 'get_page_from_gfn':
>>    ./arch/riscv/include/asm/p2m.h:50:33: error: invalid use of undefined type 'struct domain'
>>       50 | #define p2m_get_hostp2m(d) (&(d)->arch.p2m)
>>          |                                 ^~
>>    ./arch/riscv/include/asm/p2m.h:180:38: note: in expansion of macro 'p2m_get_hostp2m'
>>      180 |         return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>>          |                                      ^~~~~~~~~~~~~~~
>>    make[2]: *** [Rules.mk:253: common/cpu.o] Error 1
>>    make[1]: *** [build.mk:72: common] Error 2
>>    make: *** [Makefile:623: xen] Error 2
> Surely this can be addressed, when x86 and Arm have the function as inline?

Yes, it should be possible. The reason for now that is working for x86 and Arm is that:
1. Arm only pass pointer to struct domain to p2m_get_page_from_gfn() so it is enough just
    to have forward declaration for struct domain.
2. x86 uses pointer to p2m_domain in arch_domain so there is no need to include asm/p2m.h
    in asm/domain.h and so forward declaration will be enough. And so there is no dependency
    between xen/sched.h and asm/p2m.h through asm/domain.h which leads to the issue
    mentioned in the commit message.

RISC-V could in principle follow the x86 pattern (avoid including asm/p2m.h),
but the current out-of-line approach is also acceptable, it is simpler and more robust
against future header reordering problems.

>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Does it make sense to make this function almost fully generic?
>>
>> It looks like most of the logic here is architecture-independent and identical
>> across architectures, except for the following points:
>>
>> 1. ```
>>     if ( likely(d != dom_xen) )
>>     ```
>>
>>     This could be made generic by introducing paging_mode_translate() for ARM
>>     and defining it as `(d != dom_xen)` there.
>>
>> 2. ```
>>     if ( t )
>>         *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
>>     ```
>>
>>     Here, only `p2m_mmio_direct_io` appears to be architecture-specific. This
>>     could be abstracted via a helper such as `dom_io_p2m_type()` and used here
>>     instead.
> With P2M stuff I'd be careful. Abstracting the two aspects above may make
> future arch-specific changes there more difficult.
>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
>>           flush_tlb_guest_local();
>>       }
>>   }
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
> Once again something taken verbatim from Arm. Yes, dom_xen can in fact appear
> here, but it's not a real domain, has no memory truly assigned to it, has no
> GFN space, and hence calling it translated (or not) is simply wrong (at best:
> misleading). IOW ...
>
>> +    if ( likely(d != dom_xen) )
>> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>> +
>> +    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
> ... this comment would also want re-wording.

As you mentioned in the another reply to this patch, I messed up x86 and Arm
implementation in a bad way, so here should be DOMID_XEN used instead of
"Non-translated".

Based on your reply it seems like the first comment should be also rephrased
as you mentioned that DOMID_XEN can't be called also "not auto-translated".
I think it would be better to write the following:
  /*
   * Special case for DOMID_XEN as it is the only domain so far that has
   * no GFN space.
   */


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
> If only dom_xen can make it here, why the check for dom_io?

Incorrectly copied from x86. It should be just:
  *t = p2m_ram_rw
here as in RISC-V for MMIO pages owner isn't set to dom_io (and the same is
true for Arm I think).

Thanks.

~ Oleksii


