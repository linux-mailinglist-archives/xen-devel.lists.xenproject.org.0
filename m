Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08D9F6465
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 12:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860278.1272327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNry3-0001TJ-TQ; Wed, 18 Dec 2024 11:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860278.1272327; Wed, 18 Dec 2024 11:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNry3-0001R4-QH; Wed, 18 Dec 2024 11:11:51 +0000
Received: by outflank-mailman (input) for mailman id 860278;
 Wed, 18 Dec 2024 11:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/pVV=TL=bounce.vates.tech=bounce-md_30504962.6762adf1.v1-f8a5024ce2f84d3684c581581389ef74@srs-se1.protection.inumbo.net>)
 id 1tNry1-0001Pg-TJ
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 11:11:50 +0000
Received: from mail179-16.suw41.mandrillapp.com
 (mail179-16.suw41.mandrillapp.com [198.2.179.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de7bb590-bd30-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 12:11:46 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-16.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4YCrbj1cchzB5qq16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 11:11:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f8a5024ce2f84d3684c581581389ef74; Wed, 18 Dec 2024 11:11:45 +0000
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
X-Inumbo-ID: de7bb590-bd30-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734520305; x=1734780805;
	bh=/8fqitR2/EHOxodVcrJrpGxwijByXtGNn4eBet1vubU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zGzCu7jd0jfactDQvjou7tKYs6MsQwvWvkRtiJJT8RMs+I40UVjPJ5p2nZVbEfT3P
	 12+B//UbIA8bc5WXCgCZrDxJLQBkuAW53OgaPXTsUFcNT1TG6W3sBIYVN0/wPz3+dK
	 Ea9zKjDbE5jVfmwt8HJgAJlLgPcYXQbhhL53m5sx0wQQij6DfjQOnBS3H1ZxHFrxSG
	 0SoDwzI1sQJ4c4sZiFf7LTPQvvQA+GhQNddRGAUBfEAbbyXiHEfJfOCZ8FTPUVWP9g
	 Epk01JhaSQ6Wagmz4ijunfIpjj+snAglQbeTCGTg9lxQVYxovEUEnfBbz7VaouQffU
	 XcPmheIeLovLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734520305; x=1734780805; i=thierry.escande@vates.tech;
	bh=/8fqitR2/EHOxodVcrJrpGxwijByXtGNn4eBet1vubU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KAbiHN8vXnITtQslRLkX20Yb4/c17Wy/85a8Lydy3btihXpIVTtg0rfeXbhYBfMOF
	 xqg7+1nCDIoiwVndgvKXbIoajmdEze6r0wcRoZ4hC5unK4iv0bb1u+0UPzoeNfGB38
	 7j5Cl5PVCcyYmEQEVb6PIlag+ipOEi77I5h36e/8UIyEfiapgIe97mkdBarWxYU4en
	 LJpa2Oimk1ozYZEqMSX34rDKixDYqEIx2ZKoEr8UQ4hR/otyvlmn4dRV5Zigc6UsUH
	 OttG8HHIpFb/AL5U78dguR907KW61njd22EZx2UuE5AJEPBGifhufQVV2sEnX26ptZ
	 weXksq2m0WMeQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/xen/mmu:=20Increase=20MAX=5FCONTIG=5FORDER?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734520304135
Message-Id: <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
To: "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20241204171346.458105-1-thierry.escande@vates.tech> <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com> <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech> <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com> <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
In-Reply-To: <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f8a5024ce2f84d3684c581581389ef74?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241218:md
Date: Wed, 18 Dec 2024 11:11:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 12/12/2024 12:09, Juergen Gross wrote:
> On 12.12.24 11:22, Jan Beulich wrote:
>> On 11.12.2024 19:20, Thierry Escande wrote:
>>> Hi Jan,
>>>
>>> On 09/12/2024 11:04, Jan Beulich wrote:
>>>> On 04.12.2024 18:14, Thierry Escande wrote:
>>>>> With change 9f40ec84a797 (xen/swiotlb: add alignment check for dma
>>>>> buffers), the driver mpt3sas fails to load because it cannot allocate
>>>>> its DMA pool for an allocation size of ~2,3 MBytes. This is because
>>>>> the
>>>>> alignement check added by 9f40ec84a797 fails and
>>>>> xen_swiotlb_alloc_coherent() ends up calling
>>>>> xen_create_contiguous_region() with a size order of 10 which is too
>>>>> high
>>>>> for the current max value.
>>>>>
>>>>> This patch increases the MAX_CONTIG_ORDER from 9 to 10 (4MB) to allow
>>>>> such allocations.
>>>>>
>>>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>>>> ---
>>>>> =C2=A0 arch/x86/xen/mmu_pv.c | 2 +-
>>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>>>>> index 55a4996d0c04..7f110740e1a2 100644
>>>>> --- a/arch/x86/xen/mmu_pv.c
>>>>> +++ b/arch/x86/xen/mmu_pv.c
>>>>> @@ -2200,7 +2200,7 @@ void __init xen_init_mmu_ops(void)
>>>>> =C2=A0 }
>>>>> =C2=A0 =C2=A0 /* Protected by xen_reservation_lock. */
>>>>> -#define MAX_CONTIG_ORDER 9 /* 2MB */
>>>>> +#define MAX_CONTIG_ORDER 10 /* 4MB */
>>>>> =C2=A0 static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
>>>>
>>>> While lacking respective commentary, bumping this value imo also
>>>> needs to
>>>> take into account Xen itself, at least commit-message-wise. The
>>>> bumping is
>>>> fine for Dom0 in any event. It is also fine for DomU-s with the
>>>> defaults
>>>> built into the hypervisor (orders 12 and 10 respectively for x86 and
>>>> Arm),
>>>> yet especially for Arm (and in the future PPC and RISC-V) any further
>>>> bumping would be less straightforward.
>>>
>>> Thanks for pointing this out. On the Xen side, CONFIG_CTLDOM_MAX_ORDER
>>> and CONFIG_HWDOM_MAX_ORDER seem big enough on all architectures. But I
>>> see CONFIG_DOMU_MAX_ORDER set to 9 (also all archs). Won't that be a
>>> problem for drivers trying to allocate more than that from a domU ?
>>
>> A driver assumes a (physical) device to be in the DomU, at which point i=
t
>> is CONFIG_PTDOM_MAX_ORDER which applies (PT standing for pass-through).
>>
>>>> However - does the driver really need this big a contiguous chunk? It
>>>> would seem far more desirable to me to break that up some, if possible=
.
>>>
>>> Since this works on bare metal I'm afraid the driver maintainer (mpt
>>> fusion driver) will just tell me to fix Xen.
>>
>> Well. The bigger such allocations, the larger the risk that on systems
>> that have been up for a while such allocations can't be fulfilled anymor=
e
>> even in the bare metal case.
> 
> Yes. I don't think we should just work around this issue without having
> even tried to get the driver fixed. In case they refuse to change it, we
> can still increase MAX_CONTIG_ORDER.

Thanks for the feedback. I'll try to have a look at the driver if I have
time to do so.

Regards,
Thierry


