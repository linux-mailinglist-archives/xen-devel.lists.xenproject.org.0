Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC9A7A995
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937138.1338188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PQj-000735-Cd; Thu, 03 Apr 2025 18:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937138.1338188; Thu, 03 Apr 2025 18:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PQj-00070R-A3; Thu, 03 Apr 2025 18:36:45 +0000
Received: by outflank-mailman (input) for mailman id 937138;
 Thu, 03 Apr 2025 18:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGE9=WV=bounce.vates.tech=bounce-md_30504962.67eed539.v1-206295418c54479ba96f1ecc4f4fa54f@srs-se1.protection.inumbo.net>)
 id 1u0PQi-00070K-4R
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:36:44 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96228ebc-10ba-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 20:36:42 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZT9S90d4nz705bZK
 for <xen-devel@lists.xenproject.org>; Thu,  3 Apr 2025 18:36:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 206295418c54479ba96f1ecc4f4fa54f; Thu, 03 Apr 2025 18:36:41 +0000
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
X-Inumbo-ID: 96228ebc-10ba-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743705401; x=1743975401;
	bh=yWMYqlLvIOZSn4k0C3wkSffWXKkjeYNkjrLUrF7ag8k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OvEHz5AhaOc6omhbUv3cNjr7sNyf53fkZ21XldSjIfiBsemSzjz5R0OqWHi9Tf22X
	 jkmZqbcYX87GMZqaES2aVQ71gxnOtokW+SRH+vp4gprReev66U7j/Fo4S3m0RZcGRA
	 X2tU33CeiNKvhfPbwJo86OmLlA8E34r0Kc+ajcBmAWEMjiRaLJssTLW04Mp3JDtCyJ
	 QnQAlnIzSqvJW+xl6UEKKtZeNCDWfhHGAl26eFxCFgAPmYW7G4ysIPmeNrHwZLaMgm
	 vizU8EHy3jUAvkZxSjYNwxotDzKDuSWzGiVdHr9NwEyyNXvJO6LlaBQYLxlpaktWAJ
	 a4rJwTyPT4Ukw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743705401; x=1743965901; i=teddy.astie@vates.tech;
	bh=yWMYqlLvIOZSn4k0C3wkSffWXKkjeYNkjrLUrF7ag8k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YfpN+pDacS5NX1P1zCfM9r9VL//u866qLOHbax8+QplxTfDFLsxx+P/iHFafMuYKX
	 HbKIsSlxMgUTClQJ41MtB1wwpmlPU+2C+pn4KtXBIRafNbBHaNmmJQrZgkTg3A/+Bf
	 +4fr9FlTFgZ0C0yn2XWoE7qs//hjiMn5fefMjKTqRVZ6GrcIvDrPqlBnxAkYfXp8w5
	 wDm8qH7BBwKBxsoBVnYwDIPt1YM9rfskjgTVrZJOZdn5jwYjzGp9wLDbIs7XIqaAtw
	 meo76g0lz9LMbScTNTLrXPgCPj8wlRQl1L5Ajt/yAkYW+S2nxrae0/j7yjaM4of9m5
	 yGsoWionVvKbg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20x86/amd:=20Add=20support=20for=20AMD=20TCE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743705399780
Message-Id: <7056c584-a95e-401b-bb35-e5d0e4171878@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>
Cc: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <6b751a400df49217defc89a19b3ac2ca33ab7690.1743683787.git.teddy.astie@vates.tech> <73b1dd32-c15e-46c4-982c-9b7a33c8785b@suse.com> <463eca2f-9e2a-474c-ae5a-4ed6cfe01ff8@citrix.com>
In-Reply-To: <463eca2f-9e2a-474c-ae5a-4ed6cfe01ff8@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.206295418c54479ba96f1ecc4f4fa54f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250403:md
Date: Thu, 03 Apr 2025 18:36:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 03/04/2025 =C3=A0 16:08, Andrew Cooper a =C3=A9crit=C2=A0:
> On 03/04/2025 1:58 pm, Jan Beulich wrote:
>> On 03.04.2025 14:44, Teddy Astie wrote:
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> RFC:


>>>   - is this change actually safe ?
>> Well, before getting here with reading I was already about to ask this v=
ery
>> question. It's really you who needs to prove it.
>>
>>>   - should we add a tce/no-tce option to opt-in/out this feature ?
>> Unless we're entirely certain we got this right and didn't overlook any
>> corner case, perhaps better to do so.
> 
> To bring across a quote of mine from Mattermost:
> 
> "I'm reasonably sure our TLB handling algorithm is safe for it,
> following the PCID work we did for Meltdown"
> 
> But, proving this is hard.
> > Some history: INVLPG flushing the entire paging structure cache
> (non-leaf mappings) was a last-minute "fix" to keep Windows working on
> the Pentium(?), where it had started using INVLPG from the 486(?) but
> with a logical error.
> 
> AMD's TCE feature is "that's a hefty hit to keep around, so here's an
> option for the behaviour one would more reasonably expect from INVLPG".
> 
> Anyway.=C2=A0 I have a suspicion that Intel's INVPCID no longer followed =
the
> INVLPG behaviour anyway, and that we were forced to account for that.
> However, I'm struggling to find confirmation one way or another in the SD=
M.
> 
> Another mitigating factor is that, because we use recursive pagetables,
> we have to upgrade an INVLPG into a full flush anyway if we edited
> non-leaf entries.
> 

Yes, while proving it on the hypervisor side may be doable, I am quite 
unsure about PV guests.
Some calls to HYPERVISOR_mmuext_op incidentally call invlpg and alike 
which could be affected with this change, as the guest can "assume" some 
behavior aspects of invlpg.

> 
> As to a cmdline option, there's cpuid=3Dno-tce if we really really need
> it, but I don't think we want a dedicated TCE option.
> 
> 
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -372,6 +372,9 @@ void asmlinkage start_secondary(void *unused)
>>>   
>>>       microcode_update_one();
>>>   
>>> +    if ( boot_cpu_has(X86_FEATURE_TCE) )
>>> +        write_efer(read_efer() | EFER_TCE);
>> Same here. But I wonder if you couldn't set the bit in trampoline_efer.
> 
> Yes, do set it in trampoline_efer, and drop this hunk.
> 

Will do.

> 
> If you add this, ...
> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2008,6 +2008,13 @@ void asmlinkage __init noreturn __start_xen(void)
>>      if ( cpu_has_pku )
>>          set_in_cr4(X86_CR4_PKE);
>>  
>> +    if ( boot_cpu_has(X86_FEATURE_TCE) )
> 
> ... the please also use it.
> 

Yes, I forgot to change it.

---

Aside enabling this flag for Xen/PV guests, it can be useful to expose 
it to the guests. While it's currently not going to change anything as 
most of the related instructions are trapped and managed by the 
hypervisor, it does affect the behavior of inside-guest INVLPGB if 
enabled in the VMCB.

> ~Andrew

Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


