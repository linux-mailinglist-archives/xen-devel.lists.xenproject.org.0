Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C3AA7116
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 14:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974642.1362442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAp5p-0000V6-Up; Fri, 02 May 2025 12:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974642.1362442; Fri, 02 May 2025 12:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAp5p-0000TQ-S8; Fri, 02 May 2025 12:02:13 +0000
Received: by outflank-mailman (input) for mailman id 974642;
 Fri, 02 May 2025 12:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqCQ=XS=bounce.vates.tech=bounce-md_30504962.6814b43e.v1-b7fac139afee4c4bacce4987f340402b@srs-se1.protection.inumbo.net>)
 id 1uAp5p-0000TK-8J
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 12:02:13 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 450daade-274d-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 14:02:08 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4ZpqKV4m5Jz705qmr
 for <xen-devel@lists.xenproject.org>; Fri,  2 May 2025 12:02:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b7fac139afee4c4bacce4987f340402b; Fri, 02 May 2025 12:02:06 +0000
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
X-Inumbo-ID: 450daade-274d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1746187326; x=1746457326;
	bh=OSmJFUI9n/ffWaWhE807TX6P7hyPIRTfSRc9JDcYOJU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fFHfqeZnVtllm6Cw2pQ3oSyTNLvkEHvOfA6c4VX0Ip6c/bQ728QoCPX9J8DM36cPS
	 YAU36EDJTTAz2wbU8OJkg3fPvrktOKLgfPDYud2cL3VJ6GlMOnQeA4yn4LicVdWAsJ
	 lfOOJyCV1ZSDTmGxQmasfnltp5IMWrQPeY41nZpycIAprwB1VEQSvpO4hOgcoDJwMI
	 Ds3fsIvHmEq5hJIdsUzX6iydqu7krOw8Db6tUpl6lMN3KQLBqX+MKqxCc5StXzHS4h
	 LvGDQB4G59Nw7N4WIbn4MQY4mcPy5t5daoPHuaMgEaoBxrimOIXz13pkXaDOj+X95H
	 9G+JsNIKQyjiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1746187326; x=1746447826; i=teddy.astie@vates.tech;
	bh=OSmJFUI9n/ffWaWhE807TX6P7hyPIRTfSRc9JDcYOJU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XLwIwO4INX/zbpFkumapJCexd8Um1FoZRhLaHEw4GAcmX+Gw6VYFa510KZeOv1xKW
	 OMTdTB4EYiIcGsU52opY6enw8Sm4Gx5xscaqoz5wIfucvuEBnLZcmndoW+w6iadHOH
	 thLGQhqO2J+orE3NdVLtyLOwxOeESGZVNrTmQvbGA8CQjoPsQqSKwsdy/IQfi5xuIQ
	 RxkkhrvIub1OvKbqTRGsrJDECiMqZVdXsHc4XxGNcfQIheIiwpu2UsU0djVgwhQE5T
	 2ljUD57Yf8zErdIoiZd2Lggpc+bJNV4idXVO+DHSTAxGF8MeKwEX/LvyUVwe3cRpEw
	 osbb8CPjpC4Pw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=200/4]=20Physical=20address=20hypercall=20ABI=20("HVMv2")?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1746187325373
Message-Id: <84af0f46-752a-4a4f-8a77-6a4b0b7620a0@vates.tech>
To: "Julien Grall" <julien@xen.org>, "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1744981654.git.teddy.astie@vates.tech> <b73ca490-921b-4151-ad81-16d531634846@suse.com> <c026ae61-d6af-448c-a91f-8608e6d9969f@xen.org>
In-Reply-To: <c026ae61-d6af-448c-a91f-8608e6d9969f@xen.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b7fac139afee4c4bacce4987f340402b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250502:md
Date: Fri, 02 May 2025 12:02:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 01/05/2025 =C3=A0 13:14, Julien Grall a =C3=A9crit=C2=A0:
> Hi,
> 
> On 22/04/2025 08:45, Jan Beulich wrote:
>> On 18.04.2025 16:18, Teddy Astie wrote:
>>> In current HVM mode, when a hypercall references a structure in guest 
>>> memory,
>>> it is passed to the hypervisor as its "linear address" (e.g virtual 
>>> address for
>>> the x86 long mode).
>>> One of the caveats is that this linear address (GVA) is generally not 
>>> directly
>>> usable by the Xen and needs to be translated from GVA to GPA then 
>>> HPA. This
>>> implies a complex and potentially expensive lookup of the pagetables 
>>> inside the
>>> guest. This can be significant, especially if the P2M cannot use 
>>> efficiently
>>> superpages (or with e.g XSA-304).
>>>
>>> This proposal introduce a new mode where all addresses used for 
>>> hypercalls are
>>> GPADDR instead of GVADDR, therefore, looking up the HPA related to 
>>> this GPA
>>> only needs a P2M lookup and not looking through the inside-guest 
>>> pagetables.
>>>
>>> This mode is opt-in and must be enabled explicitely by the toolstack.
>>
>> Which I view as a severe downside (leaving aside the PVH Dom0 aspect): 
>> This way
>> a guest needs to be converted all in one go. While doable, it'll be 
>> increasingly
>> risky with the size of the guest kernel code base.
> 
> +1. It is not only the guest kernel, but also the firmware (UEFI, U-boot)=
.
> 
> Furthermore, I don't think this can be easily adopted in public cloud 
> where the admin for Xen and the guest will be different. So any 
> indication of the ABI would have to come from the guest itself rather 
> than the configuration.
> 

Makes sense, I am experimenting with a alternative design which requires 
setting the 30th bit (31th is already used for viridian) of the eax 
register to indicate the use of this new ABI. Also keeping a CPUID to 
indicate that the feature is supported by the hypervisor (thus no need 
to enable it in advance for a guest).

> Cheers,
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



