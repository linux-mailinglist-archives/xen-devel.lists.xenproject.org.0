Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFUNBardw2kgugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:05:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0F3256E3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262282.1554847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5NvC-0005fA-2x; Wed, 25 Mar 2026 13:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262282.1554847; Wed, 25 Mar 2026 13:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5NvC-0005dV-09; Wed, 25 Mar 2026 13:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1262282;
 Wed, 25 Mar 2026 13:05:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c3dd89.v1-690d33c367e14505967812fda87fbdd9@bounce.vates.tech>)
 id 1w5NvA-0005dO-2P
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:05:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Nv9-005suX-Cb
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:05:15 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c3dd89.v1-690d33c367e14505967812fda87fbdd9@bounce.vates.tech>)
 id 69c3dd82-e002-0a2a0a5209dd-0a2a450be136-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:05:15 +0100
Received: from [198.2.132.30] (helo=mail132-30.atl131.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c3dd89.v1-690d33c367e14505967812fda87fbdd9@bounce.vates.tech>)
 id 69c3dd8a-ef63-0a2a450b0019-c602841e782a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:05:15 +0100
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fgnFP2N3CzP0KGQF
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:05:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 690d33c367e14505967812fda87fbdd9; Wed, 25 Mar 2026 13:05:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774443913; x=1774713913;
	bh=EmYNPxd/fkrYVjGGg/zcCsWJR8I68XdbR6a/tSj2C3Y=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FieBcGnmz9LWXS04t7K1fu3K1npiHiemUkl0agl0JsJEMhsn9sJQy7OhqisUsO+U7
	 lkhkL4eDrb+eyVBFcopImkKzFK6mzI8nuvgtYpNBjgXgSO/CmxKM0v52SvXobhf9OF
	 3XLvQX6VXmqAoTZR1Rtv92USJlJkH7kKLe607kd+5zG8VvEdQ//MoOZ2esTOxU8xE4
	 vEynyHteIdkwjK19QPoNpV0v+ZyJq6+qlGC+5mMhAhM9kCAZnTNOqV8RDcwwHgsE9C
	 64M9gZg1aI/udqH3aL2d92J1m+aIwxAWlg2iohr20D24IoLlLwMufrdOrVVr0WoBoI
	 0HqXfr5q7CFcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774443913; x=1774704413; i=teddy.astie@vates.tech;
	bh=EmYNPxd/fkrYVjGGg/zcCsWJR8I68XdbR6a/tSj2C3Y=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DWcR3dGeYuq2dVXGAi8pSsBukKDPWPSZGt3P0+9X0U0j/IB4rgZm2lZ1d+HrTNqfA
	 4XpUr76fnjjG4dpPRkhlZXgf0fLfAWV5LX470n6uryyjrPRDt4vCKNgBySc4s2/WfE
	 fRaio4A3nQiu5BJfTJVbNkv2x3PpgQ22LQF6m7hEFv7LI1EOHLKOWGZsJmw9d5p02X
	 6P0KUe5yYq/qrECpGV32b76+r01wijC77IUFdVBsrmlA4i+V27oL371HBhe1Pv7bEB
	 gYHfnpmXdSyEkXYIeD3b3o1x2AJ6Gev8QE1uW1mvDkoRqh7dQ1ua4+MjLkKaknFw5X
	 GZ9QLd728bvIw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/6]=20x86:=20Define=20some=20Intel=20vPMU=20leafs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774443912148
Message-Id: <fcad4b7f-b3db-4835-9c95-dd5a801f0690@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech> <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech> <d7438af9-1aad-446b-bd80-7d9e8f955cdc@suse.com> <690ad4c0-d9b1-45ec-8634-f8c002c0282a@vates.tech> <ab2802f8-1253-4be4-a4c8-5094d7378a8f@suse.com>
In-Reply-To: <ab2802f8-1253-4be4-a4c8-5094d7378a8f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.690d33c367e14505967812fda87fbdd9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260325:md
Date: Wed, 25 Mar 2026 13:05:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1774443915-9A6AE112-FDCC507E/0/0
X-purgate-type: clean
X-purgate-size: 3336
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.969];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 66E0F3256E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 25/03/2026 =C3=A0 12:43, Jan Beulich a =C3=A9crit=C2=A0:
> On 25.03.2026 10:48, Teddy Astie wrote:
>> Le 24/03/2026 =C3=A0 10:25, Jan Beulich a =C3=A9crit=C2=A0:
>>> On 10.03.2026 17:44, Teddy Astie wrote:
>>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>>> @@ -162,7 +162,15 @@ struct cpu_policy
>>>>                uint64_t :64, :64; /* Leaf 0x9 - DCA */
>>>>    
>>>>                /* Leaf 0xa - Intel PMU. */
>>>> -            uint8_t pmu_version, _pmu[15];
>>>> +            struct {
>>>> +                uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
>>>> +                                event_enum_length;
>>>> +                uint32_t /* b */:32;
>>>> +                uint32_t /* c */ fixed_ctr_mask;
>>>> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, =
:1,
>>>> +                                 anythread_depreciation:1, slots_per_=
cyc:4,
>>>> +                                 :13;
>>>> +            } pmu;
>>>
>>> Style-wise this looks to follow e.g. the cache leaf, so perhaps okay, e=
ven
>>> if I would have preferred you to follow what we did for leaf 6.
>>
>> My idea was to put all that as .pmu.*, so I wouldn't need to prefix
>> everything with "pmu_". I'm not sure if you're talking about a different
>> approach.
> 
> The "pmu" is fine. I'm talking of what's inside the struct {}.
> 

Is it regarding having union and _aa, _ab, (...) fields or prefixing 
fields with pmu_ ?

>>   > The named> boolean field, however, wants to be of type bool.
>>
>> Which fields ?
> 
> There's only one named 1-bit field: anythread_depreciation.
> 
>>   > And then the unnamed 1-bit> field really wants to be 2 bits, for
>> anythread_depreciation to be bit 15
>>> (etc).
>>>
>>
>> Ah yes thanks, I got confused with the fields size for a second.
>> I also found that slots_per_cyc is 3 bits instead of 4.
> 
> Not as far as I can see.
> 
>> I think this diff fixes it overall.
>>
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -167,9 +167,9 @@ struct cpu_policy
>>                                    event_enum_length;
>>                    uint32_t /* b */:32;
>>                    uint32_t /* c */ fixed_ctr_mask;
>> -                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1=
,
>> -                                 anythread_depreciation:1, slots_per_cy=
c:4,
>> -                                 :13;
>> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :2=
,
>> +                                 anythread_depreciation:1, slots_per_cy=
c:3,
>> +                                 :11;
> 
> Why 11 all of the sudden?
> 
Okay, I think I finally figured out field sizes (5-bit field confuses me).

struct {
     uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
                     event_enum_length;
     uint32_t /* b */:32;
     uint32_t /* c */ fixed_ctr_mask;
     uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :2;
     bool             anythread_depreciation:1;
     uint32_t         slots_per_cyc:4, :12;
} pmu;


> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



