Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250BAD05C51
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 20:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198047.1515321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdvRG-00052J-CQ; Thu, 08 Jan 2026 19:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198047.1515321; Thu, 08 Jan 2026 19:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdvRG-0004zj-8e; Thu, 08 Jan 2026 19:12:54 +0000
Received: by outflank-mailman (input) for mailman id 1198047;
 Thu, 08 Jan 2026 19:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ktx+=7N=bounce.vates.tech=bounce-md_30504962.696001b0.v1-884cca178e3844ecae15f78c544c311f@srs-se1.protection.inumbo.net>)
 id 1vdvRE-0004zd-HH
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 19:12:52 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06101c23-ecc6-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 20:12:50 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4dnF0c4kgrzBsTnTy
 for <xen-devel@lists.xenproject.org>; Thu,  8 Jan 2026 19:12:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 884cca178e3844ecae15f78c544c311f; Thu, 08 Jan 2026 19:12:48 +0000
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
X-Inumbo-ID: 06101c23-ecc6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767899568; x=1768169568;
	bh=DVpGMbKYvdwbRaLDKkNU+x5aQEKvdSLsNqoHHCYow3Q=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ET4zdBy7Nop4JwbxnleT8RAvTWmCJF3Dui7N5yyFOl/iFJSn36gWcW8jd0AWu6ONd
	 lWcJyQhuWH0MOZhA8W+NkaUODwcuyCMjW1MSY4CG0b8ZHggddZ+LDB1d8eZKEbw75H
	 G/h99ubqlmMC5buYD0Ynw/9MvkrVgaoekufxBpTIVqRQUqAVPmycawNOQsy9yGDh2D
	 eFQGWro0WwXEZdaMKnbDEfQDw54YlvFfcSxDf/fhz5qykZhsE+/2soxWXvSA2GzOuJ
	 KjzTZpLU+LhnpLnP2RNquQNntFAG9fNWH5jawdW2sCfidZMKgFaEXtjcKcLO3AIjGn
	 /w+hETqPlB5YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767899568; x=1768160068; i=teddy.astie@vates.tech;
	bh=DVpGMbKYvdwbRaLDKkNU+x5aQEKvdSLsNqoHHCYow3Q=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0S2NcC/JwjGJJvu2Fzlq/CvN7XrrHHwaL8at6CIiJQTjbZqDwFMBD590Cnvp6wYJz
	 YCkPN7FiRCZCH53vz6F1UnpTa+yqOO0aFnRTMRKi9ctIo1zQRVXXcrM9cx4I/4PdTk
	 HkCAged85b0J9CWa0Sp8OU/6EUjxoOSTzzUJuKXJ8gXFCjdKtuce7AQOuljuoRuz7m
	 OulsId4InHrUVhSfvRj2ImUJC6gPczRjW8aCxDgGOj7ZRfR0YGPZy14Fqz2iw98IYP
	 zGMyQSCtKolIEfRaaG14j2eIGGXLtQq6uNCQ7X7hb1IeflP24fdFy+d9e40DE/zuck
	 vmjKVRdT6Irmw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20pvh:=20Introduce=20SIF=5FHVM=5FGHCB=20for=20SEV-ES/SNP=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767899567042
Message-Id: <f45ff7f7-aa71-4ddb-85ce-eadb1dfdb07f@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech> <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech> <aV_s6ySoXU-G7Gno@Mac.lan>
In-Reply-To: <aV_s6ySoXU-G7Gno@Mac.lan>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.884cca178e3844ecae15f78c544c311f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260108:md
Date: Thu, 08 Jan 2026 19:12:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 08/01/2026 =C3=A0 18:46, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
> On Thu, Jan 08, 2026 at 04:50:51PM +0000, Teddy Astie wrote:
>> Le 28/12/2025 =C3=A0 13:54, Teddy Astie a =C3=A9crit=C2=A0:
>>> Under SEV, the pagetables needs to be post-processed to add the C-bit
>>> (to make the mapping encrypted). The guest is expected to query the C-b=
it
>>> through CPUID. However, under SEV-ES and SEV-SNP modes, this instructio=
n
>>> now triggers #VC instead. The guest would need to setup a IDT very earl=
y
>>> and instead use the early-GHCB protocol to emulate CPUID, which is
>>> complicated.
> 
> Possibly a stupid question, but how is this information expected to
> be propagated to the guest when there's a guest firmware and
> bootloader in use?
> 
> How is OVMF and/or grub propagating this information between
> themselves and to Linux?
> 

When booting Linux with SEV+UEFI, at least during the UEFI services, the 
UEFI firmware transparently handles #VC for the rest to allow it to 
perform CPUID operation.
(with SEV-SNP CPUID page exposed with a specific UEFI mecanism)

So overall, this proposal is only meaningful for PVH booting, everything 
that comes after can be handled differently.

> Are they relying on the CPUID discovery logic mentioned above, or
> there's some shadow infra used by KVM for example to already convey
> it?
> 

OVMF at its startup relies on #VC for emulating CPUID.
It then relies on GHCB MSR for getting SEV info/C-bit (but only with 
SEV-ES). And under SEV-SNP, it uses "CPUID page" instead of GHCB 
(PAGE_TYPE_CPUID in SEV-SNP firmware ABI specification).

This is because SEV/GHCB specification recommends using CPUID page under 
SEV-SNP (even though the same protocol as SEV-ES still works; but is 
discouraged).

In GHCB Version 2 (SEV-SNP)
> The hypervisor may supply the encryption bit position using the SEV Infor=
mation MSR protocol,
> but the guest should use the CPUID information supplied in the CPUID Page=
 to determine the
> encryption bit position.

But its location is unfortunately undefined in this specification and in 
the OVMF case, hardcoded in firmware metadata.

> Adding Xen side-channels when there's an architectural defined way to
> obtain the information is a duplication of interfaces, and could lead
> to issues in the long run.  We can not possibly be adding all vendor
> SEV options to SIF_ flags just because they are cumbersome to fetch.
> I know this is just one right now, but we don't know whether more of
> those CPUID options would be needed at the start of day in the future.
> 

That exists for SEV-ES and SEV-SNP (even though complicated) but for 
SEV-SNP, it would relies on discouraged mecanisms (GHCB CPUID Request).

AFAIU, this flag is enough for setting up long mode and GHCB which is 
what matters. There are some additional structures (e.g secret page and 
CPUID page) which could in the future be eventually exposed as PVH 
modules; which would be hopefully less intrusive.

--

Some specialized boot process for SEV-SNP (e.g the one used 
COCONUT-SVSM) relies on IGVM [1] with custom memory layouts, initial 
pagetables, and so on.

[1] https://github.com/microsoft/igvm

>>>    ## AP startup ##
>>>    
>>>    AP startup can be performed using hypercalls or the local APIC if pr=
esent.
>>> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
>>> index 7f15204c38..9b84df573b 100644
>>> --- a/xen/include/public/xen.h
>>> +++ b/xen/include/public/xen.h
>>> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>>>    #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>>>    #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt=
. mapped */
>>>                                       /* P->M making the 3 level tree o=
bsolete? */
>>> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that =
requires */
>>> +                                   /* use of GHCB. */
> 
> A concern I have with this is that we are adding vendor-specific
> terminology to what should otherwise be a vendor-agnostic interface.
> 
> There's already a fair amount of arch-specific information encoded in
> there, so maybe not that much of a big deal.
> 
> Thanks, Roger.
> 


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



