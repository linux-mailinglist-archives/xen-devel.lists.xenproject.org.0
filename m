Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0BACF2D4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007031.1386306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCLO-0007MW-CA; Thu, 05 Jun 2025 15:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007031.1386306; Thu, 05 Jun 2025 15:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCLO-0007K6-96; Thu, 05 Jun 2025 15:17:26 +0000
Received: by outflank-mailman (input) for mailman id 1007031;
 Thu, 05 Jun 2025 15:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iek4=YU=bounce.vates.tech=bounce-md_30504962.6841b4fd.v1-4d8bcefe7eba4258a34eb4bab83edbfc@srs-se1.protection.inumbo.net>)
 id 1uNCLN-0007K0-8x
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:17:25 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7ac91d-4220-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:17:19 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4bCp312jpbzlfcQV
 for <xen-devel@lists.xenproject.org>; Thu,  5 Jun 2025 15:17:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4d8bcefe7eba4258a34eb4bab83edbfc; Thu, 05 Jun 2025 15:17:17 +0000
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
X-Inumbo-ID: 2b7ac91d-4220-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749136637; x=1749406637;
	bh=Y0zoEZ+oUKLBb3F2PrV9vMIfEPCCp4im/a1FbEJ+45U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=y9NLakJAOUC9A4xC1JcHfDsWNdYkcqSzpD7MnPGSINveQhxUm3FLuS5OE4nbAnRQV
	 LY7z6U0TXbX2SgDU7fQ31AMnDPCWQPUFNFagaaxzh0WnzuyQXCBb1UKjDuPr2TgMYN
	 IhyzeyphXveLLGj0gWbIZOIovPf65HoCTRaQUDmnyu5WrqzGUYoZno5IWR9zSC+eoL
	 QREGhbfLBI/Y9HSH34MhrgEbW39tmydCFMTk1iLXO9G0qUwmajvsl7+aerz6EdlSQ6
	 qW5TfPYl+E6ZWTqQcfbv/sMWI7iR4k/n8G8/2revoUH0yu5VcPHJ0sq7w5q666YbXG
	 TsezpaV8bViTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749136637; x=1749397137; i=teddy.astie@vates.tech;
	bh=Y0zoEZ+oUKLBb3F2PrV9vMIfEPCCp4im/a1FbEJ+45U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wAuftiU3qQN3z1kpjAe3VYIWc91O+Ykm7CNvT66NDR+Zv6x1UaE8ue25BCgn1vIgy
	 vRVIHhRK4Ks2+Fs9gewQxrIG2sROGGlk9Z1SSXARU5xYPvmb9JpjKZAyyuOKPYs/lQ
	 avQjf0hb9aEhB2Q0N/BlaiRZAMzRyjNtZgwnU2Z0oM1siOhwwObEz0Vcvf8D5izy+e
	 1Lpsf28s2EoJ/ytKRbTeGYrAtgpxCWUn0IQFH2K2ftx3rA3L5DYiBx/GL7qBjwAPzr
	 MAOMyiHdOG+4Gu7c8gcgH/Cc1iv8wFkIA3ayu9H9IUOh6AJMvXkaQJerfzn9zkqpYo
	 ZvaWeag9HfBNw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20vmx:=20Introduce=20vcpu=20single=20context=20VPID=20invalidation?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749136636299
Message-Id: <76bf2d72-3834-4455-8023-a20c84db58d0@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <83d0e7dfc076e9453fb6537e5948c03d90e947da.1748594036.git.teddy.astie@vates.tech> <4ed9d6ce-5634-4dd9-86e9-5d1f84a43e10@suse.com>
In-Reply-To: <4ed9d6ce-5634-4dd9-86e9-5d1f84a43e10@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4d8bcefe7eba4258a34eb4bab83edbfc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250605:md
Date: Thu, 05 Jun 2025 15:17:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 05/06/2025 =C3=A0 16:51, Jan Beulich a =C3=A9crit=C2=A0:
> On 30.05.2025 10:48, Teddy Astie wrote:
>> Introduce vpid_sync_vcpu_context to do a single-context invalidation
>> on the vpid attached to the vcpu as a alternative to per-gva and all-con=
texts
>> invlidations.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> Extracted from SEV series.
>> This will be used for instance in fixed-ASID patches (in SEV series).
> 
> I think it should be in that series, which may still be some long way out=
.
> Until then we'd carry dead/unreachable code (disliked by Misra), and we'd
> risk that this bit-rots because of being unused.
> 

Yes, that make sense, it should exist along with patches that make use 
of it.

>> --- a/xen/arch/x86/include/asm/
hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -451,6 +451,23 @@ static inline void ept_sync_all(void)
>>   
>>   void ept_sync_domain(struct p2m_domain *p2m);
>>   
>> +static inline void vpid_sync_vcpu_context(struct vcpu *v)
> 
> pointer-to-const?
> 
>> +{
>> +    int type =3D INVVPID_SINGLE_CONTEXT;
> 
> Please don't use plain int when all values possibly held in a variable ar=
e
> non-negative.
> 

I mostly took the code from other vcpu_sync_* functions. I will take a 
look as a separate patch on reworking the existing vpid_sync_vcpu_gva 
with these proposed changes, as it has the same problem.

>> +    /*
>> +     * If single context invalidation is not supported, we escalate to
>> +     * use all context invalidation.
>> +     */
>> +    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
>> +        goto execute_invvpid;
>> +
>> +    type =3D INVVPID_ALL_CONTEXT;
>> +
>> +execute_invvpid:
> 
> There no reason at all to use "goto" here (and with that replaced there's
> then also no style issue with the label placement).
> 

Should a similar treatment be made for vpid_sync_vcpu_gva ?

> Jan
> 
>> +    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
>> +}
>> +
>>   static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gv=
a)
>>   {
>>       int type =3D INVVPID_INDIVIDUAL_ADDR;
> 
> 

Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



