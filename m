Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1CCF3EF6
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 14:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195408.1513351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vckyF-0002o5-Lm; Mon, 05 Jan 2026 13:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195408.1513351; Mon, 05 Jan 2026 13:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vckyF-0002ky-IN; Mon, 05 Jan 2026 13:50:07 +0000
Received: by outflank-mailman (input) for mailman id 1195408;
 Mon, 05 Jan 2026 13:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K9ii=7K=bounce.vates.tech=bounce-md_30504962.695bc189.v1-6139dbf1b10240ecb780db96bb83dcf8@srs-se1.protection.inumbo.net>)
 id 1vckyE-0002dh-2Y
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 13:50:06 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f1c9171-ea3d-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 14:50:03 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4dlFzZ04zNzK5vg69
 for <xen-devel@lists.xenproject.org>; Mon,  5 Jan 2026 13:50:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6139dbf1b10240ecb780db96bb83dcf8; Mon, 05 Jan 2026 13:50:01 +0000
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
X-Inumbo-ID: 6f1c9171-ea3d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767621002; x=1767891002;
	bh=Jx2VszJ0a4ZLDSguWGgJq3sBug+HdQPg/Syy4sUYLK8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=r0ShA0aH0atrnR8yBLMDNk8hxFb7M6CX9QqALWiBNs4NIr6vhyhBh/QIi3FAm2IbH
	 y8IeAhzkDdYNN3e1UQg+OkuYOG5pnnX8snwlrFknQFZCvTTYW5/3uDvD28f6nXugig
	 1QuKu9XzFXzv6SPYoSB90cQaf6IEYwSZ3QZCqPIkyRTGzz/0U5UnxJxG3stOcVN9ea
	 dBRd3QqeOI+KU5e6rvcZrQODrJLrb+Tmj4E9F9w2ZUdhNz3Png7b/EOVJniOvxhHBZ
	 4FMqIEmdRtu6uYloKBupnVDd+3AU1QPNN1cUKooWXhiPhobOuUh57CzBX6mVtvt8WL
	 qgKNjkNTFuG/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767621002; x=1767881502; i=teddy.astie@vates.tech;
	bh=Jx2VszJ0a4ZLDSguWGgJq3sBug+HdQPg/Syy4sUYLK8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0RyqLFcbcEXCyjV9DJ5Z6DsnaKi5R1L3mT+/qa22ylhaf0VPi9sFMML8rGUw3BwTs
	 lCXbgS16hwMJ4mbQpXmrMtVLJVa98QQCKlpZGNeFvMHugCgulAsUpPGqbmABFuoPHC
	 jeIKvdrC93ZOH2ixMAPhj5+M2bWhAEp+EZEqHsIx6DFET2QrFjOhKD20KIWfTHaaA9
	 vnWVHI/Jxc4YwWO7c37+3y03g65UsTMphBroFSExoAv0YzEdO+fL9aK6tSPwEXbL2C
	 Qf4tLeAva7Q/ReXUqB+WIQOZhCgyqm5wS2a+9KYtPvlvNtbirHuX1ueN+8KFLZMsnL
	 WwexzZNB8Ap6w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20pvh:=20Introduce=20SIF=5FHVM=5FGHCB=20for=20SEV-ES/SNP=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767621000671
Message-Id: <18d08be6-7e31-4b5f-b9b8-908375abfa29@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech> <7d439b75-801b-406d-98e0-29c207e1c1ba@suse.com> <7bbd6560-c988-44d9-a2e8-448cceb455e2@vates.tech> <b7a31f50-4fa7-4b53-ad92-3df6c4ff624c@suse.com>
In-Reply-To: <b7a31f50-4fa7-4b53-ad92-3df6c4ff624c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6139dbf1b10240ecb780db96bb83dcf8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260105:md
Date: Mon, 05 Jan 2026 13:50:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29/12/2025 =C3=A0 15:16, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.12.2025 13:39, Teddy Astie wrote:
>> Le 29/12/2025 =C3=A0 09:24, Jan Beulich a =C3=A9crit=C2=A0:
>>> On 28.12.2025 13:49, Teddy Astie wrote:
>>>> --- a/xen/include/public/xen.h
>>>> +++ b/xen/include/public/xen.h
>>>> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>>>>    #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>>>>    #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a vir=
t. mapped */
>>>>                                       /* P->M making the 3 level tree =
obsolete? */
>>>> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that=
 requires */
>>>> +                                   /* use of GHCB. */
>>>
>>> Naming-wise, do we really want to tie this to AMD (and hence exclude ot=
her
>>> vendors, or require yet another bit to be allocated later)?
>>
>> This is SEV-ES/SNP only, I don't think the same bit can be reused for
>> another technology (unless it also uses the GHCB MSR). As the guest
>> can't even check if it is Intel or AMD CPU at this point (if running
>> under SEV-ES or SEV-SNP).
> 
> If it was just telling AMD from Intel, that would be possible. There are
> a few well-known differences in how certain instructions behave [1]. But
> here you aren't after telling apart the vendors; you want to know whether
> you're (fundamentally) on SVM or VT-x.
> 
> Of course I have to admit that I find it quite irritating that in order
> to execute CPUID one has to have a #VC handler properly set up. This
> inverses the typical flow of events. Did they really not think of some
> replacement for at least the most basic information?
> 

Yes, but only with more information beforehand.

Regarding the #VC approach, the negociation example also state this
 > The above example is just one way to perform the GHCB negotiation for 
an SEV-ES guest. For example, you could use the GHCBInfo =3D 0x004 CPUID 
Request to obtain actual values for the CPUID instructions executed by 
the guest. Or you could use the GHCBInfo =3D 0x002 Request for SEV 
Information if MSR 0xc001_0130 does not contain the GHCBInfo =3D 0x001 SEV 
Information.

But that only works as long as you know GHCB MSR is available; which you 
may be able to check through SEV_STATUS MSR; but this MSR is only 
meaningful on CPUs that supports SEV (APM says the hypervisor cannot 
intercept these MSRs). This proposal aims to give this information to 
the guest through the start_info structure.

Under SEV-ES/SNP, the hypervisor cannot fake EFER MSR which in this case 
may have forced guest-visible EFER:SVME, it could be a way to check for 
SEV-ES for but it's quite hacky and fragile.
(I still need to test this though)

> Jan
> 
> [1] Of course, such details can change going forward. Vendors did alter
> the behavior of certain insns in the past.
> 


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



