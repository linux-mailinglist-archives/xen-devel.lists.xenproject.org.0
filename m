Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKeGOVnb5WnNogEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:52:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E5427E90
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285442.1566472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjQm-0000zn-K5; Mon, 20 Apr 2026 07:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285442.1566472; Mon, 20 Apr 2026 07:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjQm-0000y7-HO; Mon, 20 Apr 2026 07:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1285442;
 Mon, 20 Apr 2026 07:52:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEjQl-0000y1-EJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 07:52:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEjQk-002hnS-Ns
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:52:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e5db3e-5cb7-0a2a0a5109dd-0a2a45038604-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:52:30 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e5db3e-672d-0a2a45030019-d155d0afa877-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:52:30 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-38dd9f0fdc6so39349401fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 00:52:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e7ca0sm2768205e87.65.2026.04.20.00.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 00:52:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776671550; x=1777276350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZ3eAnmcgaN5QC6piSgGEAj99CsjVfekQR5lOPQICjA=;
        b=i+Lm+tsyahg6V9w9Q1327V3Y+MKA7VYX5/PRrpFglNHbBS0H0dKblc8wucmHPeiIz9
         wUuEuJoIBqQQChyhE5CPWxrL4K641teSyp8kKnRSipDH6TdCqZjJOiJCETHpgZK4N0yO
         jCcthvqrpj7sbZDLwo2xxDX8qhahvTvv0sp8IcV/KNYr990CBiv8VUhZjTD6qhdTwQf2
         JjWJUNl2ttdv/71obQ3sI3oYHbiFjuiKYKMduOeL3KlkI6dM3wq92HZ6D53XY7UnbYXf
         hyXB/HHPoLFJcVCVevCrO1zxi2GLHVSNBp4M+RGV3O9nWn2rdpITOU36fDxW1aFs7iAx
         d34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671550; x=1777276350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZ3eAnmcgaN5QC6piSgGEAj99CsjVfekQR5lOPQICjA=;
        b=aDDXOiaYtz/aueiguS/SPNm9JqOafHc4uCqmc3J1nXdUAPD+50kvCEHNChkYjlpmr5
         dKE4Fo9YG4ohXOI8oTws5VtI+PFoMi8+Onq8I5w7IE3xAqmlqoAzneS+1K3ee6fgN82d
         Ery2S0N/vP1PXFiLvA0dVOktVMp59xUgOWTufKO0ijx5BQvsMWpk9/h5FOD4wxKhNI25
         sB5QsfMF6TQ3jBST0LmqI5riO7scw49iWtJKobJpHN5kOwVOkjpHQ90HFs/N99R95axL
         DUGhmr7wFoEiZoLYerd9j8xaMiREVw1MKzeORdG6lEeetQg+8O8qzH6k7olHgr+aKjwS
         byQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8z8FhXvYvC5ul26Ts2D3NvkouEMTsgf7GqZfc8ktr3LTgylNrc1XqmSMr49zNaplGeYBeJUk+EimA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykkM7XkqqEDyg2E/JFcjp45Y5ZN+pyu1VzCUb+HpDWEtAYYYZO
	NhSNQLMcju5/8h4pnXKXx8KVNXL+Rm37I6RtLILVqu5DwYbU0P0IojMF
X-Gm-Gg: AeBDievc2HDhEMc+vXzMu6XD+5iVRIK4z2ypcR6C0noMt00/K0g6rwEKRRB34NyngpC
	998joZTOfCXIGnAf+QHSiLmYBgdDMrV9KVOaK4kc/XAo+Q0gZ+UstJu72dlbPaT9GKWN3wp7FAg
	xjoavdLt/bIztLySXR1aPfLDt7f4IBO+gKp0OTfO2WB1Hol8cK7ZxLLC3358DxI61DwdTqLQi2t
	tVeHNIcixJuf/+RKSb9IdFcQxrxi/OgxBHQ+g8DKSt7J5Ji9mT736iQE+9c9b7mc+CLZyghu6zP
	u1bvqow8YltPKJVZyttUa+MXEOp+8uysp42Fb4ZsTAWoTPx7oFV1jrS4JyKdwVxgrn8XQccAMIc
	2BoSCJT1WOH5Gz21WuQUSg0TG9tGrQBVmAfIrNK+1Y58c6k+heZF3G+ulf1V0RLTTJ7AsFVNLkO
	NXvbx4hvcU1TqcTil+VigZb7zsRoTE/KPB1L6AleLfLQ3vzRWSaBXn31YJ2UtuY33RGnS5LYCpj
	+Lubbh+DldH7g==
X-Received: by 2002:a05:6512:3095:b0:5a3:4692:61ce with SMTP id 2adb3069b0e04-5a41716dad3mr3796433e87.1.1776671549287;
        Mon, 20 Apr 2026 00:52:29 -0700 (PDT)
Message-ID: <b00858a5-c989-482a-bce0-af82eca17e31@gmail.com>
Date: Mon, 20 Apr 2026 09:52:27 +0200
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
 <a0fe3904-7fb9-474c-9a97-6aca2c2dc50b@gmail.com>
 <718fe598-884c-4723-938f-7f783445771f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <718fe598-884c-4723-938f-7f783445771f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776671550-2957F938-0BCC316F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5831
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
X-Rspamd-Queue-Id: 5F2E5427E90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/26 4:07 PM, Jan Beulich wrote:
> On 17.04.2026 13:34, Oleksii Kurochko wrote:
>> On 4/16/26 2:21 PM, Jan Beulich wrote:
>>> On 13.04.2026 16:42, Oleksii Kurochko wrote:
>>>> On 4/2/26 12:03 PM, Jan Beulich wrote:
>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>> @@ -14,12 +27,109 @@ bool aia_available(void)
>>>>>>         return is_aia_available;
>>>>>>     }
>>>>>>     
>>>>>> +int __init vgein_init(unsigned int cpu)
>>>>>
>>>>> If this needs invoking once per CPU being brought up, it can't be __init.
>>>>
>>>> Yes, it is going to be called inside the secondary CPU bring-up function.
>>>>
>>>> __init sections are removed much later, after all CPUs are brought up,
>>>> so it looks like that at the moment when secondary CPUs are being
>>>> brought up, __init still exists and can be called.
>>>
>>> No. And I said so before. See XEN_SYSCTL_cpu_hotplug (and ignore it having
>>> "hotplug" in the name, but merely consider that you can take CPUs offline
>>> at runtime, and later bring them online again).
>>
>> Thanks, now it makes sense to drop __init.
>>
>>>>> Also - static?
>>>>
>>>> It isn't static because it will be called inside the secondary CPU
>>>> bring-up function.
>>>
>>> As it doesn't need calling from the outside for the boot CPU, it's not
>>> obvious why it would need calling from the outside for secondary ones.
>>
>> I think I am confused here by what do you mean by "calling from the
>> outside".
> 
> As in "from another translation unit".
> 
>> It should be called during boot or secondary CPU initialization (if AIA
>> is used), right?
>> Then considering that VGEIN-related stuff is connected to AIA then
>> vgein_init() is expected to live in aia.c and considering that it wants
>> to be called by secondary CPU boot code it can't be static.
> 
> Putting my question differently: Why is there a difference here between
> boot CPU and secondary CPUs. My (general) expectation would be that either
> the function wants calling from outside of aia.c in all cases, or it could
> be static (now and later).

Generally, if update prototype of aia_init() to receive cpuid argument 
then it will be enough to make vgein_init() static and then all others 
will call aia_init(). The only reason why I tried to have vgein_init() 
non-static is that in the case of secondary CPU there is no need to call 
second time anything (at least, now) from aia_init() or re-init 
is_aia_usable variable.

But I can agree that probably it would be better to make vgein_init() 
static now and then use aia_init() everywhere it is needed just for the 
case that if something new will be added what should be called for boot 
and secondary CPU won't be missed to call properly. And I think it is 
fine just re-init is_aia_usable without any additional synchronization.
As an option I could check at the start if is_aia_usable is initialized 
by checking if it is true and if it is then just call vgein_init() for 
that cpuid.
Would it be better?

> 
>>>>>> +{
>>>>>> +    struct vgein_bmp *vgein = &per_cpu(vgein_bmp, cpu);
>>>>>> +
>>>>>> +    csr_write(CSR_HGEIE, -1UL);
>>>>>> +    vgein->geilen = flsl(csr_read(CSR_HGEIE));
>>>>>> +    csr_write(CSR_HGEIE, 0);
>>>>>> +    if ( vgein->geilen )
>>>>>> +        vgein->geilen--;
>>>>>
>>>>> I don't understand this. The "len" in "geilen" stands for "length", I suppose,
>>>>> i.e. the number of bits. Hmm, the spec itself is inconsistent: "The number of
>>>>> bits implemented in hgeip and hgeie for guest external interrupts is UNSPECIFIED
>>>>> and may be zero. This number is known as GEILEN." This may or may not include
>>>>> bit 0 (which is implemented, but r/o zero). Then saying "Hence, if GEILEN is
>>>>> nonzero, bits GEILEN:1 shall be writable in ..." suggests 0 isn't included, but
>>>>> that's not unambiguous.
>>>>
>>>> But they explicitly wrote that: The least-significant bits are
>>>> implemented first, apart from bit 0. So bit 0 is explicitly excluded.
>>>
>>> Fine, but not including it in anything named *LEN feels - as said - ambiguous.
>>
>> Agree, it is. I just tried to follow the spec naming here. But I am okay
>> to rename it to max_gein, for example.
> 
> Perhaps better stick to spec naming, but consider adding a clarifying comment.

I will add then above geilen field in vgein_bmp struct the comment:
  The least-significant bits are implemented first, apart from bit 0

> 
>>>>>> +    /*
>>>>>> +     * All vCPU guest interrupt files are used and we don't support a case
>>>>>> +     * when number of vCPU on 1 pCPU is bigger then geilen.
>>>>>> +     */
>>>>>
>>>>> This wants checking in vgein_init() then. CPUs (beyond the boot one)
>>>>> violating this should not be brought online.
>>>>
>>>> It'll be nice. But we can't know how many vCPUs will be ran on pCPU when
>>>> vgein_init() is executed.
>>>
>>> I don't understand: How does it matter how many vCPU-s will exist later on
>>> (and will run wherever)?
>>
>> IIUC, you want to check what is mentioned in the comment in vcpu_init().
>> The comment says that it is checking that number of vCPU on one pCPU
>> isn't bigger then geilen. To check that we have to know an amount of
>> vCPU potentially will be ran on pCPU.
> 
> Well, not quite. I don't understand at all why the number of vCPU-s in
> a system would be limited by any pCPU property. I don't think we have
> any such constraint on x86, for example.

Then I will just drop this comment and correspondent ASSERT() and just 
return vgein_id in the case when there is no available h/w VGEINs to 
mark that h/w should use s/w guest interrupt files:

     if ( vgein_id > vgein->geilen )
         vgein_id = 0;
     else
         __set_bit(vgein_id, bmp);

~ Oleksii



