Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECDC6478D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163926.1490965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzc7-0001LQ-Kj; Mon, 17 Nov 2025 13:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163926.1490965; Mon, 17 Nov 2025 13:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzc7-0001JL-HU; Mon, 17 Nov 2025 13:49:51 +0000
Received: by outflank-mailman (input) for mailman id 1163926;
 Mon, 17 Nov 2025 13:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyG8=5Z=bounce.vates.tech=bounce-md_30504962.691b27f9.v1-70580733afca4796bdd468aa9b758f12@srs-se1.protection.inumbo.net>)
 id 1vKzc6-0001JF-PW
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:49:50 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ea1619-c3bc-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:49:46 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d98Hs2nlyzPm0YBh
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 13:49:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 70580733afca4796bdd468aa9b758f12; Mon, 17 Nov 2025 13:49:45 +0000
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
X-Inumbo-ID: 46ea1619-c3bc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763387385; x=1763657385;
	bh=mO6salj5sp01CJoed4sk4CCQzBMxza7Mwxm/SOKiU24=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DXdUDoptKDExTiTRAWerKO4ajq0IsKKPOdpRzTnzjoWRBpDd/yI9qpxxJJrvTa2uS
	 T6TlqTJUhOK0Qvxv0YEajTaPMKLTNAQtM0SzVpCMlKYORQWFSUGWUbmMw2mM3o5Qbr
	 fh8iWEhgnoPwcpYa3orF8rZZHb8HK8sqarf4nt9UTSMhjGzCf3MHOyYKY+YdFnfke1
	 X4OW1toA8tG5rDEy4UcbdjRKD+frFA2wkAZABqdNlykqZMKJwaPSPsC4HaHFqLcagO
	 k+bgDxfLcYKOKVfoKhzwkiyIXyUzYMLd8BmyYdCzMJr3xGetj8iSuCkMryNygYr0ik
	 Paux1xle0rZhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763387385; x=1763647885; i=teddy.astie@vates.tech;
	bh=mO6salj5sp01CJoed4sk4CCQzBMxza7Mwxm/SOKiU24=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jqPm8fcGrW0SyQSHTRZc2H5XggsSnsh7DQ9cfWkxP+Xupy9Qu0yBwMMgRMoIi9zqk
	 XkpPCmnVCLuJbzFT9rNm9leN0ErAIdOB2tfx0mxm0lDArG2hJ3FIO1DK4Axhrvi0Wb
	 J8AXHwUM3BVKFAEqa1/t4Uf5/RstS/V8tusA5yH5jbwQfKzxxtet7PKNiMe526vC93
	 gVy5Y6Aldemb39UWozLLWyltYrlitwEYZRYahZVEQXC+qnx4Su8bImp+UrcGID9aWy
	 XfmWxf82WwXM1JxQlEd+QIN2gxTj+0ilt6NfCb0yxsxwSM+RXsPWQKnQ2BF6OcyJXj
	 INvJLTXxmH5Mw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20amd/iommu:=20Always=20atomically=20update=20DTE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763387384261
Message-Id: <4da9ecf1-3984-43a6-be45-1988bf79b85d@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech> <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech> <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com>
In-Reply-To: <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.70580733afca4796bdd468aa9b758f12?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251117:md
Date: Mon, 17 Nov 2025 13:49:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 13/11/2025 =C3=A0 12:38, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.11.2025 16:37, Teddy Astie wrote:
>> amd_iommu_set_root_page_table chooses between updating atomically
>> and non-atomically depending on whether the DTE is active or not.
>>
>> This choice existed mostly because cx16 wasn't supposed always available
>> until [1]. Thus we don't need to threat the non-atomic path in a special
>> way anymore.
>>
>> By rearranging slightly the atomic path, we can make it cover all the ca=
ses
>> which improves the code generation at the expense of systematically perf=
orming
>> cmpxchg16b.
>>
>> Also remove unused raw64 fields of ldte, and the deprecated comment as t=
he
>> function actually behaves in a more usual way and can't return >0.
>>
>> [1] 2636fcdc15c7 "x86/iommu: check for CMPXCHG16B when enabling IOMMU"
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/drivers/passthrough/amd/iommu_map.c | 78 ++++++++-----------------
>>   1 file changed, 25 insertions(+), 53 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passt=
hrough/amd/iommu_map.c
>> index 320a2dc64c..e3165d93aa 100644
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -154,69 +154,41 @@ static void set_iommu_ptes_present(unsigned long p=
t_mfn,
>>       unmap_domain_page(table);
>>   }
>>   
>> -/*
>> - * This function returns
>> - * - -errno for errors,
>> - * - 0 for a successful update, atomic when necessary
>> - * - 1 for a successful but non-atomic update, which may need to be war=
ned
>> - *   about by the caller.
>> - */
>>   int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
>>                                     uint64_t root_ptr, uint16_t domain_i=
d,
>>                                     uint8_t paging_mode, unsigned int fl=
ags)
>>   {
>>       bool valid =3D flags & SET_ROOT_VALID;
>>   
>> -    if ( dte->v && dte->tv )
>> -    {
>> -        union {
>> -            struct amd_iommu_dte dte;
>> -            uint64_t raw64[4];
>> -            __uint128_t raw128[2];
>> -        } ldte =3D { .dte =3D *dte };
>> -        __uint128_t res, old =3D ldte.raw128[0];
>> -        int ret =3D 0;
>> -
>> -        ldte.dte.domain_id =3D domain_id;
>> -        ldte.dte.pt_root =3D paddr_to_pfn(root_ptr);
>> -        ldte.dte.iw =3D true;
>> -        ldte.dte.ir =3D true;
>> -        ldte.dte.paging_mode =3D paging_mode;
>> -        ldte.dte.v =3D valid;
>> -
>> -        res =3D cmpxchg16b(dte, &old, &ldte.raw128[0]);
>> -
>> -        /*
>> -         * Hardware does not update the DTE behind our backs, so the
>> -         * return value should match "old".
>> -         */
>> -        if ( res !=3D old )
>> -        {
>> -            printk(XENLOG_ERR
>> -                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016l=
x_%016lx)\n",
>> -                   domain_id,
>> -                   (uint64_t)(res >> 64), (uint64_t)res,
>> -                   (uint64_t)(old >> 64), (uint64_t)old);
>> -            ret =3D -EILSEQ;
>> -        }
>> +    union {
>> +        struct amd_iommu_dte dte;
>> +        __uint128_t raw128[2];
>> +    } ldte =3D { .dte =3D *dte };
>> +    __uint128_t res, old =3D ldte.raw128[0];
>>   
>> -        return ret;
>> -    }
>> +    ldte.dte.domain_id =3D domain_id;
>> +    ldte.dte.pt_root =3D paddr_to_pfn(root_ptr);
>> +    ldte.dte.iw =3D true;
>> +    ldte.dte.ir =3D true;
>> +    ldte.dte.paging_mode =3D paging_mode;
>> +    ldte.dte.tv =3D true;
>> +    ldte.dte.v =3D valid;
>> +
>> +    res =3D cmpxchg16b(dte, &old, &ldte.raw128[0]);
>>   
>> -    if ( valid || dte->v )
>> +    /*
>> +     * Hardware does not update the DTE behind our backs, so the
>> +     * return value should match "old".
>> +     */
>> +    if ( res !=3D old )
>>       {
>> -        dte->tv =3D false;
>> -        dte->v =3D true;
>> -        smp_wmb();
>> +        printk(XENLOG_ERR
>> +                "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%=
016lx)\n",
>> +                domain_id,
>> +                (uint64_t)(res >> 64), (uint64_t)res,
>> +                (uint64_t)(old >> 64), (uint64_t)old);
> 
> Indentation is now off by 1 here.
> 
>> +        return -EILSEQ;
> 
> The downside of this is that all updates can now take this path. Yes, thi=
s shouldn't
> be possible to be taken, but it's a (minor) concern nevertheless. At the =
very least
> such a downside wants, imo, mentioning in the description, even if for no=
thing else
> than to make clear that it was a deliberate choice.
> 

I only expect to see this path in case of a bug (recoverable here), 
which is only checked in the res !=3D old case. But if something similar 
occurs in the non-atomic path, then nothing good will happen as such 
checks cannot be implemented properly.

Perhaps we want to emphasis this :
"The race check is now always made instead of only being made for the 
atomic path. This specific path should be triggered under normal 
circumstances, and is very likely a bug."

And wrap the res !=3D old inside a unlikely() to insist on this aspect.

> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



