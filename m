Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGiOCoUsxWnb7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:54:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4D3358AF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264015.1555764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kE4-0000xE-07; Thu, 26 Mar 2026 12:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264015.1555764; Thu, 26 Mar 2026 12:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kE3-0000ue-Th; Thu, 26 Mar 2026 12:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1264015;
 Thu, 26 Mar 2026 12:54:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c52c74.v1-709d0f9814064cb5bcc5ee894dd456fe@bounce.vates.tech>)
 id 1w5kE2-0000uU-9g
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:54:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kE1-002wG4-KC
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:54:13 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c52c74.v1-709d0f9814064cb5bcc5ee894dd456fe@bounce.vates.tech>)
 id 69c52c63-e002-0a2a0a5209dd-0a2a4507ae3e-44
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:54:13 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c52c74.v1-709d0f9814064cb5bcc5ee894dd456fe@bounce.vates.tech>)
 id 69c52c74-fd74-0a2a45070019-c602b42fb816-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:54:13 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fhNyD0ZwrzPm1FF5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:54:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 709d0f9814064cb5bcc5ee894dd456fe; Thu, 26 Mar 2026 12:54:12 +0000
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
	s=mte1; t=1774529652; x=1774799652;
	bh=9ENfk9W5x+5JX/9DDcM93W1SN8UBRjYQUTb1bavyQnk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JKVwDe8zycmD2FWulg3GVOCHP/ArsmdmxDBDns9XZ5vdNon/KgnUcm0b9hbm1WyvJ
	 Ws0WkKPXstY+NAMSKzBmWA2UL6lCHvYRfmqiQiBWGyOoF7h5FdZPc82kjtyAfr1cyO
	 5OjTx/lKxcY1PQF6ulUXmBtOkc51jEokJ+fCT5c/clMsY1o7wNq5DkOzcKvMB79udP
	 478L8SUoWB/pSVUhe+ToW/uVJi3Qm1VkZPOzEp5G654ytQkqJJr6ImuU3dmvJ2DiIO
	 hNoMjGK4qbHYRBMO6AP5KCAFPzCkZpCdTzudwv22XSF6hnfTA2PHbNjWxjWAJ2Lpba
	 LzvM30yWtaeew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774529652; x=1774790152; i=teddy.astie@vates.tech;
	bh=9ENfk9W5x+5JX/9DDcM93W1SN8UBRjYQUTb1bavyQnk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sVKd9jlFQKN6P15JonMDflisg3sE2kgo5d9+aLo7C2on5QrRf7gax8Gfm9yBPD2fq
	 iZQXmQGVYIQj1sZ20WDfSsf7KcmnrZbTh+IwhFGlAFY1iZBUvtaY5bpSFhbOIZ8Kec
	 NU7F6Clr+aHgCL8jOAvJC/gWhXAi9k6oquPAiRBBnhdmhXYEkm6h0pPgupSPAGGZBA
	 5r5raYlBduEurwL47ULB7LsMzBNdC5rJKblLPHVgVtn6Q9zNkLMovplF5Qo8RtcR6Y
	 Q/didwBp8UFEhZahLcbNNLfFpX70gsHrFmdBuUUDbCFdf87tdsz1Nod70m44f6LlTi
	 FPf21tQyP7s0g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20x86/intel:=20Add=20recent=20CPU=20models=20model-specific=20LBRs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774529650965
Message-Id: <7ccb48df-8255-4e01-9367-f9496fe2ee18@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <888b0df36c6706de9d7ec1c5c4cc229297699670.1774519884.git.teddy.astie@vates.tech> <975b6883-646d-4db4-b931-b21c45d0507b@vates.tech> <1e95cf58-0e40-4cfe-8ac9-cd31d97f8330@suse.com>
In-Reply-To: <1e95cf58-0e40-4cfe-8ac9-cd31d97f8330@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.709d0f9814064cb5bcc5ee894dd456fe?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260326:md
Date: Thu, 26 Mar 2026 12:54:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1774529653-578A4303-18314A8C/0/0
X-purgate-type: clean
X-purgate-size: 3549
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:ngoc-tu.dinh@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,xcp-ng.org:url,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.914];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 88D4D3358AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 26/03/2026 =C3=A0 12:05, Jan Beulich a =C3=A9crit=C2=A0:
> On 26.03.2026 11:35, Tu Dinh wrote:
>> On 26/03/2026 11:21, Teddy Astie wrote:
>>> Add all CPU models that supports these MSR as they are defined in Febru=
ary 2026 SDM.
>>> It uses the same list that span from Skylake to latest CPU models as a =
part of
>>>
>>>       MSRs in the 6th=E2=80=9413th generation Intel=C2=AE Core=E2=84=A2=
 processors,
>>>       1st=E2=80=945th generation Intel=C2=AE Xeon=C2=AE Scalable proces=
sor families,
>>>       Intel=C2=AE Core=E2=84=A2 Ultra 7 processors, 8th generation Inte=
l=C2=AE Core=E2=84=A2 i3
>>>       processors, Intel=C2=AE Xeon=C2=AE E processors, Intel=C2=AE Xeon=
=C2=AE 6 P-Core
>>>       processors, Intel=C2=AE Xeon=C2=AE 6 E-Core processors, and Intel=
=C2=AE Series 2
>>>       Core=E2=84=A2 Ultra processors
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> Currently, none of these MSR are exposed on these CPUs, leading to BSOD=
 [1]
>>> in Windows when it is supposedly trying to debug some program.
>>>
>>> I guess [2] is also caused by these missing MSRs.
>>>
>>> [1] https://xcp-ng.org/forum/topic/12008/application-on-vm-causing-bsod
>>> [2] https://lore.kernel.org/xen-devel/ced16fca-3b55-40a1-a7e2-ffadd9707=
394@vates.tech/
>>>
>>>    xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>
>> I don't think CPU models with architectural LBRs should be stuffed
>> together with the model-specific ones instead of having their own case.
> 
> I agree. We want to at least determine (or even enforce) how many LBRs
> are accessible. After all we can't be sure the DEPTH field hasn't been
> altered before we gained control.
> 
> Beyond that, because arch-LBR enabling is a significant effort, I guess
> using the existing machinery for the time being might be okay.
> 

While Architectural LBR support could be useful on its own, I don't 
think it would be enough.

If the guest is started without architectural LBR, the guest could 
default into using model-specific ones (basing eventually on 
Family-Model). That can happen if we migrate a guest from a Skylake-era 
CPU to a Granite Rapids, yet we still need the guest to keep access to 
model-specific ones, especially if they are stable across these CPU 
generations.

>> With that said, short of fully implementing arch LBR, it might make
>> sense to at least stub out the LER MSRs to allow Windows to read them
>> without crashing, as certain versions of Windows use LER MSR indexes
>> without checking the arch LBR CPUID bit.
> 
> This would be too Windows-centric for my taste.
> 

A few specific LBR MSR happens to be stable and are identical between 
architectural and model-specific lists.

     MSR_IA32_LASTBRANCHFROMIP 0x000001db
     MSR_IA32_LASTBRANCHTOIP 0x000001dc
     MSR_IA32_LASTINTFROMIP 0x000001dd
     MSR_IA32_LASTINTTOIP 0x000001de

In Xen, we already consider them somewhat "architectural", for instance, 
traps-setup.c:init_ler always uses MSR_IA32_LASTINTFROMIP unless you are 
running on a Pentium 4.

Perhaps for these ones at least, we should always expose them (unless 
you are a Pentium 4) ? It may be enough to prevent some guests from 
crashing when trying to access it.

Currently, it is only exposed if the CPU family is in this known list.

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



