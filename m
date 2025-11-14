Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED7C5DEB6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 16:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162744.1490277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJvsN-00045d-CU; Fri, 14 Nov 2025 15:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162744.1490277; Fri, 14 Nov 2025 15:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJvsN-00044B-9b; Fri, 14 Nov 2025 15:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1162744;
 Fri, 14 Nov 2025 15:38:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPjS=5W=bounce.vates.tech=bounce-md_30504962.69174ce1.v1-d3c919766c5941e086b6a33d74e7cfd5@srs-se1.protection.inumbo.net>)
 id 1vJvsL-000445-CK
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 15:38:13 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec661e6a-c16f-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 16:38:10 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d7LrK2XZHzPm1jdQ
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 15:38:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d3c919766c5941e086b6a33d74e7cfd5; Fri, 14 Nov 2025 15:38:09 +0000
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
X-Inumbo-ID: ec661e6a-c16f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763134689; x=1763404689;
	bh=20xomhk/VQ7jBvQ/ylw/sAduc+bLCjKwAcblqXn0QJ8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TO/4RzY+hwCvXq5DW+uVHTMtaJV1uxPnkCWkg5fFglXDlWamRaEFOtMzwkcDMtPiX
	 iACpaEcXSl4Ltos4BjDUtwDjcEVHFTD3bureCg8BwnPhWqpYYvwsVlIwkaLhGQozbf
	 dfbR27pMzkoS84Wf3lJUQqTCPMAstN6tNlq/WvPwffgrM8TUdbiymGgg5NdqZSh6Cc
	 JTOo9UFakq+YIG7hKb6M+v0laCmDoIdndULST1m08bOtoFt3Y7QgNFVXyqWUY0EABo
	 k5cYTsdgL1+2gn1to9B/LOi/7m7KKaSBhCfB1NWwgzou35Q/G51s/+zNiwZ7M4iJgB
	 aMuQlPQ3oex8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763134689; x=1763395189; i=teddy.astie@vates.tech;
	bh=20xomhk/VQ7jBvQ/ylw/sAduc+bLCjKwAcblqXn0QJ8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Cooplw2/ZVe0GVpzqj/hg3fPodos6KFDVr+sFkpzbszIRomPkNTsHwoPuKEJUkHW+
	 KkIk1hmfAi1zRm3XgrOljtlcCzaj5iiBq7OGHOjBqI4tNNLIOdTWguhJGtO5HILtRV
	 dZYI6HUOJ1FPhi+X3f3a9CGwLm2S5c6U4OvAt6THR8zcRXMKriu7Y0AehK/ls6uKn6
	 /XvW7PUEtqKbWiwnYr9u+xjfCiv9B+8OEv0j6iVXO5+Ys9tI8/CNduPkFvH6b5SuJg
	 E27qEMmFNEFrfsXMoiGysrj6tXsuhwztebTTLlsGqQQ36DrgCdGDTdmj8U75LjUccr
	 j8BgGfn/eq/uQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20ioreq:=20Assert=20with=20out=20of=20bounds=20vCPU=20ID?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763134687808
Message-Id: <ecb9c659-72a1-4d46-a04f-68268e7c3cc3@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
References: <f4146ec2fa354ab6a64d96eca831fe0be97f281b.1763124998.git.teddy.astie@vates.tech> <c8070338-8522-41bf-9402-229e2369857c@citrix.com>
In-Reply-To: <c8070338-8522-41bf-9402-229e2369857c@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d3c919766c5941e086b6a33d74e7cfd5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251114:md
Date: Fri, 14 Nov 2025 15:38:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/11/2025 =C3=A0 14:24, Andrew Cooper a =C3=A9crit=C2=A0:
> On 14/11/2025 1:05 pm, Teddy Astie wrote:
>> A 4K page appears to be able to hold 128 ioreq entries, which luckly
>> matches the current vCPU limit. However, if we decide to increase the
>> domain vCPU limit, that doesn't hold anymore and this function would now
>> silently create a out of bounds pointer leading to confusing problems.
>>
>> All architectures have no more than 128 as vCPU limit on HVM guests,
>> and have pages that are at most 4 KB, so this case doesn't occurs in
>> with the current limits.
>>
>> Assert if the vCPU ID will lead to a out of bounds pointer.
>>
>> No functional change.
>>
>> Reported-by: Julian Vetter <julian.vetter@vates.tech>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> Not sure if this is the best approach, perhaps preventing compilation if=
 the
>> vCPU limit is higher than what the ioreq page can hold is preferable ?
>>
>>   xen/common/ioreq.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
>> index f5fd30ce12..b2ef46ed7b 100644
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, stru=
ct vcpu *v)
>>   
>>       ASSERT((v =3D=3D current) || !vcpu_runnable(v));
>>       ASSERT(p !=3D NULL);
>> +    ASSERT(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq)));
>>   
>>       return &p->vcpu_ioreq[v->vcpu_id];
>>   }
> 
> The 128 vCPU problem was known and IOERQ servers intentionally had
> multi-page capabilities from the outset to address this problem.
> 
> See the calculation in ioreq_server_max_frames().
> 
> It hasn't been exercised in anger because there's still the APIC ID
> limit at 128 still, but IOREQ servers are expected to work correctly
> above this limit.  


Yes, although only the first ioreq page exists and can be used (even 
though ioreq_server_max_frames may report more). It looks like the logic 
is incomplete there.


> That said, this function is clearly buggy and in need
> of fixing.
> 
> To the assert specifically, that's really not appropriate.=C2=A0 If it we=
re
> to ever fire, we'd have an XSA.=C2=A0 Logic if this nature either needs t=
o be
> fail safe (if returning NULL is ok), or be a BUG() so it doesn't become
> unsafe in release builds.
> 

It looks like it is possible to somewhat gracefully handle this, by e.g 
crashing the offending domain instead of stepping in a assert. I'm 
trying this for v2.

> ~Andrew



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



