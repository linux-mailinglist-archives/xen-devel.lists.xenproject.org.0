Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D8D08928
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 11:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198537.1515456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9my-0005GL-1T; Fri, 09 Jan 2026 10:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198537.1515456; Fri, 09 Jan 2026 10:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9mx-0005Eg-Uk; Fri, 09 Jan 2026 10:32:15 +0000
Received: by outflank-mailman (input) for mailman id 1198537;
 Fri, 09 Jan 2026 10:32:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M89a=7O=bounce.vates.tech=bounce-md_30504962.6960d91e.v1-0fd3b5e820884520bf223a4b27250d9e@srs-se1.protection.inumbo.net>)
 id 1ve9mw-0005Ea-EX
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 10:32:14 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6db0d167-ed46-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 11:32:00 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4dndPB1ttczBsTlVl
 for <xen-devel@lists.xenproject.org>; Fri,  9 Jan 2026 10:31:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0fd3b5e820884520bf223a4b27250d9e; Fri, 09 Jan 2026 10:31:58 +0000
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
X-Inumbo-ID: 6db0d167-ed46-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767954718; x=1768224718;
	bh=YIknYhztqWSVrk+mnswzaptf+MwJWbjnKORblGlN2So=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OxaK69xviHFfu93+1g+Q2m2Tn2BC8vadHMjEYU09t0yBZV52ALNLqbqqRUpsp79VR
	 F4DyuDykzRL6iiz7mgVw3SiaUZReBgMmdp3oDFgV7nOyyE/a9tnQKLbrdqJEehtYIs
	 aJLd+ux5ZUpHuF7at8kH8Yit9Fw8X3UB7WZO4pzOzsK3KYjFKZ27/soCtJMoasr1i6
	 P23xu9JI8fyGbaOaAZDhVdNBiuHSBGTxIKPjvCr4MA3GH3ZBT/jzfjTICtkkXbnI6c
	 q/S61OqYYp39YRvTbyNcYmEyxjTrcYSM4M7AnX+w1VqgLRN6SqjTiQAecf78NuO7XQ
	 7EewIHIf1dAIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767954718; x=1768215218; i=teddy.astie@vates.tech;
	bh=YIknYhztqWSVrk+mnswzaptf+MwJWbjnKORblGlN2So=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oVnm9F0NeuEoPTYj6hwfh6JAGM6VJAkavTDsGDNlNjPt4dOpBKqF+T8EABGeVLgYu
	 T0kDf+4z4+XssYrllHpWMVUXMq+ut2eqxHAr+6IrVi1oaXAQL4TL01SxxAnb8gmk+n
	 jIFSJYOK6x6EtW4i26MXYDyaQGh7eASA/onjYJBzoUv7mPZvvo4M8vdUAmzq4uiLuJ
	 6Rq6KOy7x9i6oTO6jrfBRUq8wGGB8ciE8logqZ5+xALUP/J519CsGd+f/8Iqnxx1tW
	 jJB6KOhIRJI8QiqLkSZiVQH/Dl2O+m3Dq602/UFuaI9hT8551vYjEPWuuOthqRZO9U
	 o6Krl7u177Llg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20pvh:=20Introduce=20SIF=5FHVM=5FGHCB=20for=20SEV-ES/SNP=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767954716857
Message-Id: <ca59701c-6c3e-4e9a-84b5-1a31037fa611@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech> <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech> <aV_s6ySoXU-G7Gno@Mac.lan> <f45ff7f7-aa71-4ddb-85ce-eadb1dfdb07f@vates.tech> <aWDC_UDsHkXoKu44@Mac.lan>
In-Reply-To: <aWDC_UDsHkXoKu44@Mac.lan>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0fd3b5e820884520bf223a4b27250d9e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260109:md
Date: Fri, 09 Jan 2026 10:31:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 09/01/2026 =C3=A0 09:59, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
> On Thu, Jan 08, 2026 at 07:12:48PM +0000, Teddy Astie wrote:
>> Le 08/01/2026 =C3=A0 18:46, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
>>> On Thu, Jan 08, 2026 at 04:50:51PM +0000, Teddy Astie wrote:
>>>> Le 28/12/2025 =C3=A0 13:54, Teddy Astie a =C3=A9crit=C2=A0:
>>>>> Under SEV, the pagetables needs to be post-processed to add the C-bit
>>>>> (to make the mapping encrypted). The guest is expected to query the C=
-bit
>>>>> through CPUID. However, under SEV-ES and SEV-SNP modes, this instruct=
ion
>>>>> now triggers #VC instead. The guest would need to setup a IDT very ea=
rly
>>>>> and instead use the early-GHCB protocol to emulate CPUID, which is
>>>>> complicated.
>>>
>>> Possibly a stupid question, but how is this information expected to
>>> be propagated to the guest when there's a guest firmware and
>>> bootloader in use?
>>>
>>> How is OVMF and/or grub propagating this information between
>>> themselves and to Linux?
>>>
>>
>> When booting Linux with SEV+UEFI, at least during the UEFI services, the
>> UEFI firmware transparently handles #VC for the rest to allow it to
>> perform CPUID operation.
>> (with SEV-SNP CPUID page exposed with a specific UEFI mecanism)
> 
> Hm, that's going to be cumbersome when using hvmloader in this
> scenario, as it makes extensive use of CPUID and hence would need to
> setup it's own #VC handler ahead of making use of CPUID.
> 
> Or we must instead get rid of hvmloader.
> 

For plain SEV, hvmloader would need to run with paging (PAE or 4-level) 
to properly handle encryption bit. But would also need Xen to handle 
MMIO instructions (which has some quirks due to being in encrypted memory).

For SEV-ES, #VC handler + GHCB is not only required for CPUID, but also 
for VMMCALL, MMIO, some MSR accesses, ...

It would be easier to not use hvmloader, especially since only UEFI 
supports SEV and guests would still need to support (Xen-specific) SEV 
bits to begin with.

>> So overall, this proposal is only meaningful for PVH booting, everything
>> that comes after can be handled differently.
>>
>>> Are they relying on the CPUID discovery logic mentioned above, or
>>> there's some shadow infra used by KVM for example to already convey
>>> it?
>>>
>>
>> OVMF at its startup relies on #VC for emulating CPUID.
>> It then relies on GHCB MSR for getting SEV info/C-bit (but only with
>> SEV-ES). And under SEV-SNP, it uses "CPUID page" instead of GHCB
>> (PAGE_TYPE_CPUID in SEV-SNP firmware ABI specification).
>>
>> This is because SEV/GHCB specification recommends using CPUID page under
>> SEV-SNP (even though the same protocol as SEV-ES still works; but is
>> discouraged).
> 
> In a previous reply to Jan you mention that Linux already has such
> handlers, but just for the decompressing code (and hence not reachable
> from the PVH entry point, that's already decompressed code).  Would it
> be possible to share the handlers with the PVH entry point?
> 

Maybe, Linux already does this for few parts of SEV code (e.g 
arch/x86/coco/sev/vc-shared.c being also included in 
arch/x86/boot/compressed/sev-handle-vc.c).

Everything we would need appears to be contained in 
arch/x86/boot/compressed/mem_encrypt.S.

>> In GHCB Version 2 (SEV-SNP)
>>> The hypervisor may supply the encryption bit position using the SEV Inf=
ormation MSR protocol,
>>> but the guest should use the CPUID information supplied in the CPUID Pa=
ge to determine the
>>> encryption bit position.
>>
>> But its location is unfortunately undefined in this specification and in
>> the OVMF case, hardcoded in firmware metadata.
>>
>>> Adding Xen side-channels when there's an architectural defined way to
>>> obtain the information is a duplication of interfaces, and could lead
>>> to issues in the long run.  We can not possibly be adding all vendor
>>> SEV options to SIF_ flags just because they are cumbersome to fetch.
>>> I know this is just one right now, but we don't know whether more of
>>> those CPUID options would be needed at the start of day in the future.
>>>
>>
>> That exists for SEV-ES and SEV-SNP (even though complicated) but for
>> SEV-SNP, it would relies on discouraged mecanisms (GHCB CPUID Request).
>>
>> AFAIU, this flag is enough for setting up long mode and GHCB which is
>> what matters. There are some additional structures (e.g secret page and
>> CPUID page) which could in the future be eventually exposed as PVH
>> modules; which would be hopefully less intrusive.
> 
> If my understating is correct, this is not needed for the initial
> implementation of SEV (when hypervisor doesn't implement ES or SNP
> guests can use CPUID), and hence it might be best to wait for the
> basic SEV implementation to be in the hypervisor before jumping into
> ES or SNP details?
> 

Correct; CPUID is handled normally when not running with SEV-ES/SNP.

> AFAICT (from your Linux entry point patch) you end up needing both the
> CPUID and the GHCB ways of detecting SEV support, so one doesn't
> preclude the other.
> 

Both are needed if we want to support both SEV-ES and no-ES cases; but 
if only SEV-ES+ is wanted, the CPUID path would never be taken with this 
approach.

>> --
>>
>> Some specialized boot process for SEV-SNP (e.g the one used
>> COCONUT-SVSM) relies on IGVM [1] with custom memory layouts, initial
>> pagetables, and so on.
>>
>> [1] https://github.com/microsoft/igvm
>>
>>>>>     ## AP startup ##
>>>>>     
>>>>>     AP startup can be performed using hypercalls or the local APIC if=
 present.
>>>>> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
>>>>> index 7f15204c38..9b84df573b 100644
>>>>> --- a/xen/include/public/xen.h
>>>>> +++ b/xen/include/public/xen.h
>>>>> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>>>>>     #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>>>>>     #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a v=
irt. mapped */
>>>>>                                        /* P->M making the 3 level tre=
e obsolete? */
>>>>> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest tha=
t requires */
>>>>> +                                   /* use of GHCB. */
>>>
>>> A concern I have with this is that we are adding vendor-specific
>>> terminology to what should otherwise be a vendor-agnostic interface.
>>>
>>> There's already a fair amount of arch-specific information encoded in
>>> there, so maybe not that much of a big deal.
> 
> If we end up getting this bit, I think it needs to be clear it's a
> vendor specific feature: SIF_AMD_SEV_GHCB or similar would be better
> IMO.
> 

I was thinking in case another vendor (non-AMD) implements this 
interface, but the MSR already has AMD_SEV in its name; so I'm ok using 
something like SIF_AMD_SEV_GHCB.

> Thanks, Roger.
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



