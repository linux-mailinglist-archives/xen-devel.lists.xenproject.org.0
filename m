Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EFB3BC08
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101328.1454431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urysc-0000Lp-QJ; Fri, 29 Aug 2025 13:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101328.1454431; Fri, 29 Aug 2025 13:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urysc-0000IF-N8; Fri, 29 Aug 2025 13:10:58 +0000
Received: by outflank-mailman (input) for mailman id 1101328;
 Fri, 29 Aug 2025 13:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vvX=3J=bounce.vates.tech=bounce-md_30504962.68b1a6dd.v1-7e61a5dbb2204fd0963032aef2ef34ee@srs-se1.protection.inumbo.net>)
 id 1urysa-0007gN-Ru
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:10:56 +0000
Received: from mail187-26.suw11.mandrillapp.com
 (mail187-26.suw11.mandrillapp.com [198.2.187.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9834e8c8-84d9-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 15:10:55 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-26.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cCzCx5ZM6zKsbWBR
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 13:10:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7e61a5dbb2204fd0963032aef2ef34ee; Fri, 29 Aug 2025 13:10:53 +0000
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
X-Inumbo-ID: 9834e8c8-84d9-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756473053; x=1756743053;
	bh=S8wgDu3X/LCTlKqHP2Q5RIW5ZS/B6RyV2RZ2Lo/o/Eg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fRXlBfBGQ9l5F4D6nAmk6wAUIAc6cpQ2LyjMM2VTPezVK4VnZMtkcRaGYitwvutxw
	 eBIAkRaWvVTdMRD7Dhu7IN5P74Znt5japZJO5Y+b5tpeSPUbC5BAcUsHeyhHYcilUf
	 ZLJKAGHfTjcsJNisVM9R5F0TTPl3620qdVlhs8s9msold9yWIHhYJ7fJSGfp8eBn+o
	 cbCoUk38IhM4ycBtyLX/G5S7luPR1KhLh9L8VaZsel56HCLS0MGjUSHMSxAEzWNflG
	 y4m0SmfYykDxAObS47ysYtyOsHcl7GfbpQEJoQHe0xa96/08RxwmMYB1yQwzYbCmhn
	 InAGZ4rYg02sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756473053; x=1756733553; i=teddy.astie@vates.tech;
	bh=S8wgDu3X/LCTlKqHP2Q5RIW5ZS/B6RyV2RZ2Lo/o/Eg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zvcDmkghTh/L7oC5uLBgV6ZBp9UwqzACxiNQcim2ujLV7Vp/zfBqRVARVWfH7C0Lg
	 TfRMNjmRBqjl8YT3fsy4Wn+P3VtU0ZSQgZm+uc2ffCDgrY5zVCBFVeVmvLOlRPyiU1
	 7pwLxm79zoq1KSv4+vAb+lhBryIwFXpjfGrP/t8BVYk/dJnW9Xl5BEKLlyA4sUEfCo
	 +8q4+rqgRXn/TN1HlbgtfB93AzxTF5zvyc1MgpRN3FRVv/3O8sP3KjTPY1xUpscWeP
	 ASwT837TYwtlChTzMnjcy74l9n76CEA3F7AdgP/vsPjwIaTbpOE+EbvonLncsQoWXX
	 y5OGiggIDJhYA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=201/9]=20x86/hvm:=20Use=20direct=20structures=20instead=20of=20guest=20handles?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756473052643
Message-Id: <5a7a560d-3792-4c31-a9f4-6a6aedff63b4@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech> <de595114d532e0fa6c885c47cf2b3551ad495525.1755785258.git.teddy.astie@vates.tech> <d934464e-03f5-4133-8b87-d5bb1b031d9b@suse.com>
In-Reply-To: <d934464e-03f5-4133-8b87-d5bb1b031d9b@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7e61a5dbb2204fd0963032aef2ef34ee?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 13:10:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 14:16, Jan Beulich a =C3=A9crit=C2=A0:
> On 21.08.2025 17:25, Teddy Astie wrote:
>> Make these functions work with hypervisor-owned pointer rather than
>> guest handles, so the function parameters don't have to live in guest me=
mory.
> 
> This is odd to read - the function parameters (arguments) didn't live in
> guest memory before either.
> 

I agree, I should reword that so that it's less confusing.

>> No functional changes intended.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/arch/x86/hvm/hvm.c | 126 +++++++++++++++++++++++------------------
>>   1 file changed, 70 insertions(+), 56 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 56c7de3977..8bf59c63fe 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -4142,19 +4142,14 @@ static int hvmop_flush_tlb_all(void)
>>       return paging_flush_tlb(NULL) ? 0 : -ERESTART;
>>   }
>>   
>> -static int hvmop_set_evtchn_upcall_vector(
>> -    XEN_GUEST_HANDLE_PARAM(xen_hvm_evtchn_upcall_vector_t) uop)
>> +static int hvmop_set_evtchn_upcall_vector(xen_hvm_evtchn_upcall_vector_=
t op)
> 
> Please can we avoid passing structures by value?
> 

We could, but we would end up having to modify more code to go there i.e 
replacing all op.* with op->* which I tried to avoid here.

> More generally: This one-by-one adjustment is what I'd really like to avo=
id
> with any new interface. It would be far better if ...
> 
>>   {
>> -    xen_hvm_evtchn_upcall_vector_t op;
>>       struct domain *d =3D current->domain;
>>       struct vcpu *v;
>>   
>>       if ( !is_hvm_domain(d) )
>>           return -EINVAL;
>>   
>> -    if ( copy_from_guest(&op, uop, 1) )
>> -        return -EFAULT;
> 
> ... copy_from_guest() could transparantly handle both cases (virtual and
> physical addresses being used). And yes, this would exclude an "everying =
in
> registers" approach.
> 

A part of the goal here is to split the ABI part from the hypercall 
logic; such as it gets possible to have ABI that don't need to refer to 
guest addresses (either virtual or physical); and could help dealing 
with current 32-bits vs 64-bits ABIs. All without duplicating the main 
hypercall logic.

>> @@ -5115,28 +5087,70 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDL=
E_PARAM(void) arg)
>>       switch ( op )
>>       {
>>       case HVMOP_set_evtchn_upcall_vector:
>> -        rc =3D hvmop_set_evtchn_upcall_vector(
>> -            guest_handle_cast(arg, xen_hvm_evtchn_upcall_vector_t));
>> +    {
>> +        struct xen_hvm_evtchn_upcall_vector op;
>> +
>> +        if ( copy_from_guest(&op, arg, 1) )
>> +        {
>> +            rc =3D -EFAULT;
>> +            break;
>> +        }
>> +
>> +        rc =3D hvmop_set_evtchn_upcall_vector(op);
>>           break;
>> +    }
>>       
>>       case HVMOP_set_param:
>> -        rc =3D hvmop_set_param(
>> -            guest_handle_cast(arg, xen_hvm_param_t));
>> +    {
>> +        struct xen_hvm_param op;
>> +
>> +        if ( copy_from_guest(&op, arg, 1) )
>> +        {
>> +            rc =3D -EFAULT;
>> +            break;
>> +        }
>> +
>> +        rc =3D hvmop_set_param(op);
>>           break;
>> +    }
>>   
>>       case HVMOP_get_param:
>> -        rc =3D hvmop_get_param(
>> -            guest_handle_cast(arg, xen_hvm_param_t));
>> +    {
>> +        struct xen_hvm_param op;
>> +
>> +        if ( copy_from_guest(&op, arg, 1) )
>> +        {
>> +            rc =3D -EFAULT;
>> +            break;
>> +        }
>> +
>> +        rc =3D hvmop_get_param(&op);
>> +
>> +        if ( !rc && copy_to_guest(arg, &op, 1) )
> 
> Why would the original __copy_to_guest() need to change to copy_to_guest(=
)?
> 

That doesn't need to.

> Jan

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



