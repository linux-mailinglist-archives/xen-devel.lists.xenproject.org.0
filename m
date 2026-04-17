Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B6eJwQb4mny1gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:35:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA241AD7C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284178.1566049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDhTF-0003tH-2K; Fri, 17 Apr 2026 11:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284178.1566049; Fri, 17 Apr 2026 11:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDhTE-0003qe-Vo; Fri, 17 Apr 2026 11:34:48 +0000
Received: by outflank-mailman (input) for mailman id 1284178;
 Fri, 17 Apr 2026 11:34:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDhTD-0003qY-Ea
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:34:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDhTC-0091Be-Ro
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:34:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e21ad1-e002-0a2a0a5209dd-0a2a4509c1de-20
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:34:46 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e21ad6-2497-0a2a45090019-d155a736b9cd-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:34:46 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a3cee3a271so654970e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 04:34:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e1131sm327914e87.42.2026.04.17.04.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 04:34:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776425686; x=1777030486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0L0pHouCfjSuixj3LzgkUEOzA6V3wwKqkKyFey/VzY=;
        b=CafhZpIplua9WR5atex+ee6xbih6KAysqXxnPiF/O/ymTLIb/RXY7Am4LgXsmLOWWO
         Wb+VkVaPGGMLtgIUwZpT1LLhsPYYpnthQbMgKwwJY2T7Cz8UP1N9mPMLcSor7gjh45QP
         3Gh3XbZfLTLrkIG4T+nJGnQk68F1xzDTeOWcOOTGnidDFZo7Z+bia6RMKJeyie8XAoXg
         To2ArQxPFYBZAJfSV7bbMQQGa53ybecmXMHM23qcadW3eRQaGQl9nFoC6rg0VkdPn9/j
         Dk0hKka5EuBATCA6nk6ePAqk3t5q0xiAWJJHmHfvHFIL0rGkD4IOJoEhYyTcoR8U6yXV
         Ho5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776425686; x=1777030486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0L0pHouCfjSuixj3LzgkUEOzA6V3wwKqkKyFey/VzY=;
        b=bqWXTZ7QU6wsMw7GnFjx154v6h4mImidaWcaMbUaskPc2ygPF2oNNF7H2HJiEhx3BJ
         cc1mAd0xnQPyG2ixOE0xbwUA5QHUiFp5EGZ03y4M4fuRraKRcf+T1eWyWJyQMRzMzDyF
         vt4KexmnGNb6baXMq3NUnwORv2jRGmF/Ox0fT0hhIR6Hc3nubfTjQGzGKcL7z4n54XlW
         ZLowyATyVbfIud6xUr89BC79wLKvjQG2i8XqEdgKvw2f2faXi0UquEf0SiFLUN16bwBO
         ZwHSIPeeG1OzyuNTJhyFVh/Jd/FVsc2vMOuZem4yp94YROB2XGH6jJhzuG6b69i9l3Aj
         Fn0g==
X-Forwarded-Encrypted: i=1; AFNElJ8Q3k/7FgaNGLvLzbibtidU6cREEiB0zig9y/+dRWPXWE3o+TiCNHjX8Wme7/+33kSZXAD9zocDBhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7TFE7DvgKAoS39PqNw9hvTohqlNNAN1pgtI6exuV5kQ53XeX8
	7CzJIa6Jv2R8g+rhEOrBo94bsaki4O53AdnSSUXrtPLJqQy5Q6aAKfho2vc55A==
X-Gm-Gg: AeBDietNrKDGgeTCJZxPF8zFc6nmLynd/HcxGcBgwsvZ7RtjHD1oyxyMJ3wNXNKfjDA
	pNExyGz09Qd5V3ZEA1RsTiG5JCwWmmhz8ijw6DWr2QZTFzafl7//8dWsniwLCfy2rauIja7gy4E
	tlwRC6qlyO+ujwLOBr1z3W40eT1Howe1/fl1bBda8pzoU/nlml38M+wltZUr2xgyRrBvHfxuQRL
	dN8Z0yBgpg8CR3bmnVMHZKpLbYptHv/tOuvVAk56ndN8ur//T5JLLKRfuNalFymDBZ5UvEbm/qI
	qSVbritVJYVXPVK6KQnpUukRCbOtPUVCYIOlhOnMeZT/HfHH0SwQrH1v28LVLKAJh6h6GBbzsOg
	LIcg/fgReaV2GKtiKORC/ClIEJBoyzCVSiQtiYddfZoQyb03a4KjNYaQNqn3yYZDbYlb4TRss6i
	TNQ53nfKfey8Ymejz3OoYt4TS65tfV84cqVhwT7260avz8UC2iLKGBGqZDzYAxJbIRei1lAZhxn
	g04XK82d/pcSA==
X-Received: by 2002:a05:6512:158c:b0:5a4:4ea:9982 with SMTP id 2adb3069b0e04-5a4172bcc5cmr649760e87.8.1776425685607;
        Fri, 17 Apr 2026 04:34:45 -0700 (PDT)
Message-ID: <a0fe3904-7fb9-474c-9a97-6aca2c2dc50b@gmail.com>
Date: Fri, 17 Apr 2026 13:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/27] xen/riscv: add basic VGEIN management for AIA
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <f358325514c91c540e0edf992ca51414a1964fe0.1773157782.git.oleksii.kurochko@gmail.com>
 <09fed304-685c-46a9-9159-72baa1721224@suse.com>
 <4b977410-8d24-41c3-9c83-7d95637ddea3@gmail.com>
 <314c064b-88eb-497a-9022-2013125d63a9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <314c064b-88eb-497a-9022-2013125d63a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776425686-41D6FA53-3548148B/10/73395122804
X-purgate-type: spam
X-purgate-size: 5071
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1FBA241AD7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 2:21 PM, Jan Beulich wrote:
> On 13.04.2026 16:42, Oleksii Kurochko wrote:
>> On 4/2/26 12:03 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> @@ -14,12 +27,109 @@ bool aia_available(void)
>>>>        return is_aia_available;
>>>>    }
>>>>    
>>>> +int __init vgein_init(unsigned int cpu)
>>>
>>> If this needs invoking once per CPU being brought up, it can't be __init.
>>
>> Yes, it is going to be called inside the secondary CPU bring-up function.
>>
>> __init sections are removed much later, after all CPUs are brought up,
>> so it looks like that at the moment when secondary CPUs are being
>> brought up, __init still exists and can be called.
> 
> No. And I said so before. See XEN_SYSCTL_cpu_hotplug (and ignore it having
> "hotplug" in the name, but merely consider that you can take CPUs offline
> at runtime, and later bring them online again).

Thanks, now it makes sense to drop __init.

> 
>>> Also - static?
>>
>> It isn't static because it will be called inside the secondary CPU
>> bring-up function.
> 
> As it doesn't need calling from the outside for the boot CPU, it's not
> obvious why it would need calling from the outside for secondary ones.

I think I am confused here by what do you mean by "calling from the 
outside".

It should be called during boot or secondary CPU initialization (if AIA 
is used), right?
Then considering that VGEIN-related stuff is connected to AIA then 
vgein_init() is expected to live in aia.c and considering that it wants 
to be called by secondary CPU boot code it can't be static.

I have a feeling that I misunderstood your statement...

> 
>>>> +{
>>>> +    struct vgein_bmp *vgein = &per_cpu(vgein_bmp, cpu);
>>>> +
>>>> +    csr_write(CSR_HGEIE, -1UL);
>>>> +    vgein->geilen = flsl(csr_read(CSR_HGEIE));
>>>> +    csr_write(CSR_HGEIE, 0);
>>>> +    if ( vgein->geilen )
>>>> +        vgein->geilen--;
>>>
>>> I don't understand this. The "len" in "geilen" stands for "length", I suppose,
>>> i.e. the number of bits. Hmm, the spec itself is inconsistent: "The number of
>>> bits implemented in hgeip and hgeie for guest external interrupts is UNSPECIFIED
>>> and may be zero. This number is known as GEILEN." This may or may not include
>>> bit 0 (which is implemented, but r/o zero). Then saying "Hence, if GEILEN is
>>> nonzero, bits GEILEN:1 shall be writable in ..." suggests 0 isn't included, but
>>> that's not unambiguous.
>>
>> But they explicitly wrote that: The least-significant bits are
>> implemented first, apart from bit 0. So bit 0 is explicitly excluded.
> 
> Fine, but not including it in anything named *LEN feels - as said - ambiguous.

Agree, it is. I just tried to follow the spec naming here. But I am okay 
to rename it to max_gein, for example.

> 
>>>> +    /*
>>>> +     * All vCPU guest interrupt files are used and we don't support a case
>>>> +     * when number of vCPU on 1 pCPU is bigger then geilen.
>>>> +     */
>>>
>>> This wants checking in vgein_init() then. CPUs (beyond the boot one)
>>> violating this should not be brought online.
>>
>> It'll be nice. But we can't know how many vCPUs will be ran on pCPU when
>> vgein_init() is executed.
> 
> I don't understand: How does it matter how many vCPU-s will exist later on
> (and will run wherever)?

IIUC, you want to check what is mentioned in the comment in vcpu_init(). 
The comment says that it is checking that number of vCPU on one pCPU 
isn't bigger then geilen. To check that we have to know an amount of 
vCPU potentially will be ran on pCPU.

For me it is enough to have that vgein->geilen isn't 0 as this case 
isn't supported now.

> 
>>>> +    ASSERT(vgein_id < vgein_bmp->geilen);
>>>
>>> What if not bit is available? By asserting, you assume the caller will not
>>> call here when no ID is available.
>>
>> It is just a temporary ASSERT() (as we don't support software guest
>> interrupt files) because in general it is fine if there is no bit
>> available, it will just mean that that no physical hardware guest
>> interrupt file is assigned to the virtual hart, and software-based
>> emulation (a "software file") must be used to handle guest external
>> interrupts.
>>
>> Will it be better to return 0 now here and just don't create a vCPU
>> on ...
>>
>>    Yet there is no caller of this function,
>>> so how can one verify whether this assertion is appropriate?
>>
>> ... the caller side when an assignment is expected to be happen?
> 
> Yes, you want to return errors for cases you can't handle. You wan to
> assert on internal state only, not on anything controlled by a caller
> outside of the hypervisor.

I will return then just vgein_id = 0 (as it is what should be returned 
when s/w guest interrupt files are supported) and handle that on the 
caller side.

And symmetrically I will add 'if ( !vgein_id ) return' to 
vgein_release() as nothing should be done in vgein bitmap in this case.

~ Oleksii


~ Oleksii

