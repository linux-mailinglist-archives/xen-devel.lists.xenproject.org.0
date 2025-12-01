Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27AC98CA4
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 20:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175969.1500558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ97Y-0002k3-Q6; Mon, 01 Dec 2025 18:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175969.1500558; Mon, 01 Dec 2025 18:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ97Y-0002hq-NR; Mon, 01 Dec 2025 18:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1175969;
 Mon, 01 Dec 2025 18:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZUx=6H=bounce.vates.tech=bounce-md_30504962.692de592.v1-eabfd459e8c54d01ac90e9eaf32310aa@srs-se1.protection.inumbo.net>)
 id 1vQ97X-0002hk-KN
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 18:59:35 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id decd81dc-cee7-11f0-9d1a-b5c5bf9af7f9;
 Mon, 01 Dec 2025 19:59:32 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dKtVp5HkSzCf9KJ3
 for <xen-devel@lists.xenproject.org>; Mon,  1 Dec 2025 18:59:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 eabfd459e8c54d01ac90e9eaf32310aa; Mon, 01 Dec 2025 18:59:30 +0000
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
X-Inumbo-ID: decd81dc-cee7-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764615570; x=1764885570;
	bh=ylhC4YE60smKb0i1ZncxMoizZaeMIEpwPETneDMcwXQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ehCQyZ+dDv1AneK4EPxUViHlDFI9+QAJ76NNN9S6vzte0ZiqDQYzljrFC7+0N6A+l
	 apOEfX+mtN/niLAGnES6HytXeUIGOA4++bZy1o1iQG5u7OmZlPq28ybTYCMPvGAdln
	 rpvlYtbBK2kEQ+36uYtiJymY9ui97rBi9plNr5k5MxO6/B8zM90xq1h6OrrcS56Yl3
	 0Na4bvUbXE2nGdxHiMqWaCRDawMDIYmXUry4btp2KYGbR6nTuhFyQI/wSGhy92SS1B
	 EAI2hSi3qBeiCFxytNB8hd6OAPq0xFfdn7DwtoP1WCR86Td6KwAeKGgtk5T3stFSFm
	 6HN8A3upK37mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764615570; x=1764876070; i=teddy.astie@vates.tech;
	bh=ylhC4YE60smKb0i1ZncxMoizZaeMIEpwPETneDMcwXQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OB5RwmwqmCI9FD09FTZ5895aAf67DLmxU7YShrNOC+r7bpZ53U1uEP5GqEgAuax+B
	 a2jvnwNa3q7xeT0KzP9pn3wLrCocDb3L5nOV5xwj/LokyJ1ZRqAylo/DvkxCLOBDcm
	 CuGd/VmCNaeHrkIczR+SZR3gha260xqD9RNvRvnuHQ26xCQ+OaIXBkOqi6M7sashOt
	 Djg8r4jTor2/y9CCyoLjHI2aFNSoOx5G7k9aPqYHyip1XjvCeFRpjDBkx5N5hY/jc6
	 TIslbm29PY2fma4q5hCc60DTK5Jl0T3H/q11WeAuA0QQemiYFwqDyWKxJ5ubyIQJCU
	 1aW2SqHBPQuHQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20viridian:=20Fix=20bank=20count=20counting?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764615569642
Message-Id: <94d1520d-f848-41cb-89e5-48b37e29bd9a@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Paul Durrant" <paul@xen.org>, "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <5e38608b45ad25e6582163700edd3f232b6d2325.1764606368.git.teddy.astie@vates.tech> <12d2c454-7744-4b13-9156-48b284900c8c@citrix.com>
In-Reply-To: <12d2c454-7744-4b13-9156-48b284900c8c@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.eabfd459e8c54d01ac90e9eaf32310aa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251201:md
Date: Mon, 01 Dec 2025 18:59:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 01/12/2025 =C3=A0 18:48, Andrew Cooper a =C3=A9crit=C2=A0:
> On 01/12/2025 4:29 pm, Teddy Astie wrote:
>> hv_vpset_nr_banks() incorrectly counts the number of bank by using hweig=
ht64()
>> instead of flsl(). This for instance problematic in case only the second=
 bank
>> is selected (i.e >64 vCPUs, where here hweight64 gives 1), causing only =
the first
>> bank to be checked (non-valid) and the second (meaningful) one to be ski=
pped.
>>
>> Fixes: b4124682db6e ("viridian: add ExProcessorMasks variants of the flu=
sh hypercalls")
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/arch/x86/hvm/viridian/viridian.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/vir=
idian/viridian.c
>> index 90e749ceb5..f5e526241d 100644
>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>> @@ -601,7 +601,7 @@ static DEFINE_PER_CPU(union hypercall_vpset, hyperca=
ll_vpset);
>>   
>>   static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
>>   {
>> -    return hweight64(vpset->valid_bank_mask);
>> +    return fls64(vpset->valid_bank_mask);
>>   }
>>   
>>   static int hv_vpset_to_vpmask(const struct hv_vpset *in, paddr_t bank_=
gpa,
> 
> https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/=
datatypes/hv_vp_set#processor-set-example
> 
> This example is poor (it has several errors in the text), but the final
> statement says fairly clearly that the banks are tightly packed and not
> contiguous.
> 
> Therefore, hweight64() the correct calculation, and AFAICT, the single
> use of this helper in Xen correct.
> 

Ok, I see what you mean, such that only set bit of the mask imply a bank 
in the "BankContents". Which means that 2 set bits (regardless of their 
position) means 2 banks (regardless of which one).

But that looks contradictory with the second sentence
> The total set of virtual processors is split up into chunks of 64, known =
as a =E2=80=9Cbank=E2=80=9D. For example,
> processors 0-63 are in bank 0, 64-127 are in bank 1, and so on.

Even though, all the banks and "BankContents" are different things.

Interestingly, all open-source users of this hypercall I found fills the 
mask with 1s (up to the maximum vCPU they want to target). So in such 
case the layout is fully contiguous at the end.

> ~Andrew
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



