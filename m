Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A97CBD727
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186796.1508225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6TP-0002P8-MM; Mon, 15 Dec 2025 11:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186796.1508225; Mon, 15 Dec 2025 11:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6TP-0002Mf-J5; Mon, 15 Dec 2025 11:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1186796;
 Mon, 15 Dec 2025 11:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDTI=6V=bounce.vates.tech=bounce-md_30504962.693feca6.v1-1d6d433eef254cd493bc0de009543574@srs-se1.protection.inumbo.net>)
 id 1vV6TO-0002MZ-5L
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:10:38 +0000
Received: from mail187-17.suw11.mandrillapp.com
 (mail187-17.suw11.mandrillapp.com [198.2.187.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb1b6fb-d9a6-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:10:32 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-17.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dVHRB5pl4zRKLm2x
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 11:10:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1d6d433eef254cd493bc0de009543574; Mon, 15 Dec 2025 11:10:30 +0000
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
X-Inumbo-ID: abb1b6fb-d9a6-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765797030; x=1766067030;
	bh=/Tm/lFWw+bkeb39/Gt2gOUv2ZUxIQfzM1PDhJKKT2Kk=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e7GwnWoGVGtYfYvLapEbWCHrR8eAexcKKSFgUybrXUDj+luKSTAGzfOA+H6w1d/FK
	 flddhbU3Shn8GU2blIVQx+zvlrX8rSi2uIw2kM+Zli/AZ5DDPMZqY9eYKZHAi6e7qc
	 v7g09K8WEX4RrM8MwQJnESVv3LdO9FRvn61IX+RecxarabLmK/H1Wv6j8Jibv5zT0n
	 Xx5HXHc+A/nkHkfXvw1YCNLlGEtInphwSaSKUaPGWy/01pt8HKyJNts7V6NTREVQvH
	 dDjbKVwFCxk4uKL+p22+a7b0/IZ/CwGp1ze4cKectywDB35/lq27gRk9gotVtAFeSW
	 RVh4WnWQ7TqUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765797030; x=1766057530; i=teddy.astie@vates.tech;
	bh=/Tm/lFWw+bkeb39/Gt2gOUv2ZUxIQfzM1PDhJKKT2Kk=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=laH1Y+sts92S9ULMmr5MqzbpzNahwJHCJ3Tzv2TQr6qN3Ecq5ypJLMt54e+eRrnVV
	 r8YCYXJbLkbKEgtlAJz73IbsLPTndahhkcbJSDthfUp5h5+Jc9agA9i/VmR6Gp9yDc
	 6slIEl7mLalZIGk4MEilXCnQ4vnxUr5WoXNweKO7k1gXTSaxOnraIUB2NQxRS1ImDg
	 vt4vaUd/e/pOxU87MVe1qsgQyeQ/tTXjS/WpZslPMD7xP4rUJ3fSNbDLPw+Jcr7Ooe
	 rnKtAFWVcG4ENHaKE91Vt11iOpJqfQnQsIwURD8+NsKpc4AcBmFyV2FITXAcWUS2wG
	 WJl3o17X1Yq1w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Undefined=20behavior=20in=20libxenvchan?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765797029663
Message-Id: <55fa8ac0-c00a-4b64-abaa-c2cf088aec4e@vates.tech>
To: "Demi Marie Obenour" <demiobenour@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen developer discussion" <xen-devel@lists.xenproject.org>
References: <e06eb432-289b-447a-8c3d-43da4705b4e9@gmail.com> <e0c8ffb0-a916-4c78-bd5f-010b9a7a8bc3@citrix.com> <bdf22b1a-49b5-43d4-8dfc-178c0076c917@gmail.com>
In-Reply-To: <bdf22b1a-49b5-43d4-8dfc-178c0076c917@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1d6d433eef254cd493bc0de009543574?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251215:md
Date: Mon, 15 Dec 2025 11:10:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 15/12/2025 =C3=A0 00:08, Demi Marie Obenour a =C3=A9crit=C2=A0:
> On 12/14/25 17:50, Andrew Cooper wrote:
>> On 14/12/2025 7:09 pm, Demi Marie Obenour wrote:
>>> I noticed that libxenvchan has undefined behavior: it passes pointers
>>> to guest memory to memcpy() even though they can be concurrently
>>> changed.
>>>
>>> Would it make sense to reuse some of Xen's copy_from_guest() code
>>> instead?  There might be a licensing problem (GPL vs LGPL), though.
>>> I think the only approach that isn't UB and has decent performance
>>> is to do the whole copy in assembly.
>>
>> memcpy() is well defined.
> 
> Rich Felker wrote otherwise on the musl mailing list.  Specifically,
> it is undefined behavior if the data is changed while memcpy() is
> accessing it, either for reading or for writing.
> 
>> The problem is the potential for creating TOCTOU races if suitable
>> barriers aren't used, due to the compiler being able to optimise through
>> memcpy().
> 
> The concern here is about races in memcpy() itself.
> 
>> Xen's copy to/from guest are not appropriate in userspace.=C2=A0 They're
>> guarding against pagefaults and address ranges not belonging to the
>> target context.
>>
>> If more compiler/smp barriers are needed, then that's the appropriate fi=
x.
> 
> Rich Felker suggested to use an open-coded memcpy() that used volatile
> accesses.

Do you mean that if a libc uses something like this as a memcpy.

void *memcpy(
     void *restrict dest_str,
     const void *restrict src_str,
     size_t n)
{
     const char *src =3D src_str;
     char *dest =3D dest_str;
     size_t i =3D 0;

     while (i < n)
     {
         dest[i] =3D src[i];
         i++;
     }

     return dest_str;
}

that the compiler is free to optimize inside this function in ways that 
conflict with the "actual volatile-ness" of dest/src ?

Anything said regarding regarding TOCTOU can also happens from within 
the memcpy (even though most memcpy() implementations and what compiler 
would emit here is very unlikely unaffected by this).

Unfortunately, there is no available volatile memcpy in C, LLVM has a 
volatile memcpy, but not usable from C, Rust exposes it through 
"unstable" volatile_copy_non_overlapping, which got discussed in [1], 
there is also something regarding "atomic memcpy" [2], but I don't know 
the exact status of all this.

[1] 
https://doc.rust-lang.org/stable/core/intrinsics/fn.volatile_copy_nonoverla=
pping_memory.html

[2] https://github.com/rust-lang/rfcs/pull/3301

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



