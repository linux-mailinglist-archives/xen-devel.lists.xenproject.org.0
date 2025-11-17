Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3155C64805
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163941.1490977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzhu-0003Ht-DG; Mon, 17 Nov 2025 13:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163941.1490977; Mon, 17 Nov 2025 13:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzhu-0003GH-Ai; Mon, 17 Nov 2025 13:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1163941;
 Mon, 17 Nov 2025 13:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=De9A=5Z=bounce.vates.tech=bounce-md_30504962.691b2961.v1-e0a14a2970824abcbe9a77270c3a3747@srs-se1.protection.inumbo.net>)
 id 1vKzhs-0003GB-Jd
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:55:48 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dde24a2-c3bd-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 14:55:47 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d98Qn5YL5zPm17kV
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 13:55:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e0a14a2970824abcbe9a77270c3a3747; Mon, 17 Nov 2025 13:55:45 +0000
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
X-Inumbo-ID: 1dde24a2-c3bd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763387745; x=1763657745;
	bh=Jawcta93i7ZOpDiKzPjoaOUJjosVVO/UllUgK0aPrxE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oI4gMR8FLbEgkSAw/RhrYt6xpctoWD28u7/Xfx6zoSF49WNPx1G3LPjpfzQB+erfp
	 /adeWRBamG5GNz4jKHHZgAMYFc7KPBvet12wbbQGdxwc7x0U6lFeIiZDEZZJo/qL/E
	 A3wJEXjQlsg/HtGI95vXCszRBMTVjCjH4J6X5PjI6PdsYxkedpn3ybn9KK2cnezF3l
	 C9Yr/8lRa9980nkrhn3o0TSUSnu1aBvbJB+vJcqKuwa54YxqemGAuoA2rjp4rTu1cu
	 R9PZrca0A89IZbYFozO8sv4TjQW1CVnszAt+uOPPe2s/MRcvQg/70rif4jtAC/0VnW
	 TxPlEPpnxmowg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763387745; x=1763648245; i=teddy.astie@vates.tech;
	bh=Jawcta93i7ZOpDiKzPjoaOUJjosVVO/UllUgK0aPrxE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vs6vEfPkSb/EM2TZ2JbLZXxqRbUNofoELNEtJFEBPrzQZcdeERSJjXFZPtQ7pxEhl
	 oEM3OA3OQ7l2bNwHHboqYqSl7AeG9QPD/9xWhikMjdDeVBAp3cYH/f7KAqft+Xx8CB
	 xWiqproOyq8msVmbgyKPJE1pEPjlrGjaohiyHIqYmvZiHhA0zPKKHBdy8BaX4+y3UM
	 mHm7Jxp8V0fSfAYXp7EpS58r0KiLDUD/VWhP9JPBrE/Ol0mV3aNj7IWW8QoGICqLZQ
	 syUf+jC7zmVWkJ8NdSS0n07yiQaXfah0pGmGJm+jtXjexSmyvrUAT827VHegwqwbeL
	 9UtnrFkXK82Lw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20amd/iommu:=20Always=20atomically=20update=20DTE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763387744479
Message-Id: <26fdfb89-99a2-49b9-81c5-ea94f2fbc799@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech> <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech> <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com> <dcd39051-b2bf-409c-907f-3357ae06cc25@vates.tech>
In-Reply-To: <dcd39051-b2bf-409c-907f-3357ae06cc25@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e0a14a2970824abcbe9a77270c3a3747?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251117:md
Date: Mon, 17 Nov 2025 13:55:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 17/11/2025 =C3=A0 14:05, Teddy Astie a =C3=A9crit=C2=A0:
> Le 13/11/2025 =C3=A0 12:38, Jan Beulich a =C3=A9crit=C2=A0:
>> On 12.11.2025 16:37, Teddy Astie wrote:
>>> amd_iommu_set_root_page_table chooses between updating atomically
>>> and non-atomically depending on whether the DTE is active or not.
>>>
>>> This choice existed mostly because cx16 wasn't supposed always availabl=
e
>>> until [1]. Thus we don't need to threat the non-atomic path in a specia=
l
>>> way anymore.
>>>
>>> By rearranging slightly the atomic path, we can make it cover all the 
>>> cases
>>> which improves the code generation at the expense of systematically 
>>> performing
>>> cmpxchg16b.
>>>
>>> Also remove unused raw64 fields of ldte, and the deprecated comment 
>>> as the
>>> function actually behaves in a more usual way and can't return >0.
>>>
>>> [1] 2636fcdc15c7 "x86/iommu: check for CMPXCHG16B when enabling IOMMU"
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> =C2=A0 xen/drivers/passthrough/amd/iommu_map.c | 78 ++++++++-----------=
------
>>> =C2=A0 1 file changed, 25 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/ 
>>> passthrough/amd/iommu_map.c
>>> index 320a2dc64c..e3165d93aa 100644
>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>> @@ -154,69 +154,41 @@ static void set_iommu_ptes_present(unsigned 
>>> long pt_mfn,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unmap_domain_page(table);
>>> =C2=A0 }
>>> -/*
>>> - * This function returns
>>> - * - -errno for errors,
>>> - * - 0 for a successful update, atomic when necessary
>>> - * - 1 for a successful but non-atomic update, which may need to be 
>>> warned
>>> - *=C2=A0=C2=A0 about by the caller.
>>> - */
>>> =C2=A0 int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=
 root_ptr, uint16_t 
>>> domain_id,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t =
paging_mode, unsigned int 
>>> flags)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool valid =3D flags & SET_ROOT_VALID;
>>> -=C2=A0=C2=A0=C2=A0 if ( dte->v && dte->tv )
>>> -=C2=A0=C2=A0=C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=
uct amd_iommu_dte dte;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uin=
t64_t raw64[4];
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u=
int128_t raw128[2];
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } ldte =3D { .dte =3D *dte =
};
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __uint128_t res, old =3D ld=
te.raw128[0];
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldte.dte.domain_id =3D doma=
in_id;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldte.dte.pt_root =3D paddr_=
to_pfn(root_ptr);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldte.dte.iw =3D true;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldte.dte.ir =3D true;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldte.dte.paging_mode =3D pa=
ging_mode;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldte.dte.v =3D valid;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D cmpxchg16b(dte, &ol=
d, &ldte.raw128[0]);
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Hardware does not u=
pdate the DTE behind our backs, so the
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return value should=
 match "old".
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( res !=3D old )
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk(XENLOG_ERR
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Dom%d: unexpected DTE %016lx_%016l=
x (expected 
>>> %016lx_%016lx)\n",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain_id,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (uint64_t)(res >> 64), (uint64_t)re=
s,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (uint64_t)(old >> 64), (uint64_t)ol=
d);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D -EILSEQ;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 union {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amd_iommu_dte dte;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __uint128_t raw128[2];
>>> +=C2=A0=C2=A0=C2=A0 } ldte =3D { .dte =3D *dte };
>>> +=C2=A0=C2=A0=C2=A0 __uint128_t res, old =3D ldte.raw128[0];
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.domain_id =3D domain_id;
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.pt_root =3D paddr_to_pfn(root_ptr);
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.iw =3D true;
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.ir =3D true;
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.paging_mode =3D paging_mode;
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.tv =3D true;
>>> +=C2=A0=C2=A0=C2=A0 ldte.dte.v =3D valid;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 res =3D cmpxchg16b(dte, &old, &ldte.raw128[0]);
>>> -=C2=A0=C2=A0=C2=A0 if ( valid || dte->v )
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Hardware does not update the DTE behind our=
 backs, so the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * return value should match "old".
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 if ( res !=3D old )
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dte->tv =3D false;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dte->v =3D true;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 smp_wmb();
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_ERR
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Dom%d: unexpected DTE %016lx_%016lx (expected 
>>> %016lx_%016lx)\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 domain_id,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (uint64_t)(res >> 64), (uint64_t)res,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (uint64_t)(old >> 64), (uint64_t)old);
>>
>> Indentation is now off by 1 here.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EILSEQ;
>>
>> The downside of this is that all updates can now take this path. Yes, 
>> this shouldn't
>> be possible to be taken, but it's a (minor) concern nevertheless. At 
>> the very least
>> such a downside wants, imo, mentioning in the description, even if for 
>> nothing else
>> than to make clear that it was a deliberate choice.
>>
> 
> Apparently it doesn't build (debian-bookworm-gcc-arm32-randconfig 
> catched it).
> ARM does provide MAX_VIRT_CPUS and GUEST_MAX_VCPUS which is 128 or 
> lower, but that doesn't map (or not properly) with what we have in x86 
> (MAX_VIRT_CPUS=3D8192 is PV-specific, and GUEST_MAX_VCPUS doesn't exist).
> 
> I am not sure what to do, looks like many things are redundant here.
> 
>> Jan
>>
> 

Oops, sent the wrong message. Please ignore.


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



