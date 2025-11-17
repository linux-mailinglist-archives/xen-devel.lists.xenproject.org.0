Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E3C646F0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163914.1490955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzVs-0000Yb-1J; Mon, 17 Nov 2025 13:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163914.1490955; Mon, 17 Nov 2025 13:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzVr-0000WY-UQ; Mon, 17 Nov 2025 13:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1163914;
 Mon, 17 Nov 2025 13:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxLE=5Z=bounce.vates.tech=bounce-md_30504962.691b2674.v1-89622097d293476ebb0cdc24370e7a26@srs-se1.protection.inumbo.net>)
 id 1vKzVp-0000WO-Vj
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:43:22 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f5e6df1-c3bb-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:43:18 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d988N4snJzPm0Ybg
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 13:43:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 89622097d293476ebb0cdc24370e7a26; Mon, 17 Nov 2025 13:43:16 +0000
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
X-Inumbo-ID: 5f5e6df1-c3bb-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763386996; x=1763656996;
	bh=ntBvLrHN7LkrqjWf1C2pRNFbMWGvwGs0k5Eaaf5LmJA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EICX6tAx7p2BAxDWX89PhypZhv9EAAs23fbdnAY/fS7WDkugGw9nz/aG2KV0G6hza
	 mOMJmvgJsCpfhatxoxZ+/F23nmtz7kOUTromtsZ9mfTSS678RieYKYQ88YCltfiZ9C
	 qBX8TeG+u0tkUzk0dUJFRHxBW7KqY76vs5cudP37zOZRqtVEQlU2u/0PrFbEnilM8E
	 X5s0c99Xrfz0SP9eg0show7qCmC3TODaY61RF4jug3nSZquDBNbtuWSBIPmXGskI9g
	 5IynCKqkE9bN44sDVuuojXF6ep5QCOnvhemxZZhPTDK9PRd7+NEvyUMs8gNLFtvdRG
	 VLMFGHJAQ9mVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763386996; x=1763647496; i=teddy.astie@vates.tech;
	bh=ntBvLrHN7LkrqjWf1C2pRNFbMWGvwGs0k5Eaaf5LmJA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DG2xbH9E8v7g9qNoRwxGM3Re0625nqt2s5hyiUGPR3CgUuGzJTCcQZb9B+2Ocwq+y
	 QS3nODCLwywzPSkfyV2bbclbYNAAZDxyEoRQcmp1SNKShYbfQWbP7+jJlWboGRd5DI
	 p9oI984JXdpi880WMfVOcxnQzyyVyiXp1MRwMreBOo1ynvNWEthTQ/3dLqUnNVQmrT
	 KgD7DKXyqaZijL7b2r4t+/9O0VGp4BDS9ZYf86gN5/IQYJ9CJZGulriJeC3L2QYf5e
	 aH5sXml8IRxP8k+9Lt8oZo177/bqe80bWy1tRr2CO6zvKKbpWtVZOi16le1U4NU32m
	 V0STA/7B3AsOw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20ioreq:=20Make=20sure=20ioreq=20is=20always=20in-bounds?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763386995157
Message-Id: <8e1403ce-c333-4236-b38a-82525c7b542f@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <dddbae09e8e6b94a20f5ce24f3560dd15e5c6c01.1763382746.git.teddy.astie@vates.tech> <97ffeca9-348e-4997-a223-359fefa83107@suse.com>
In-Reply-To: <97ffeca9-348e-4997-a223-359fefa83107@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.89622097d293476ebb0cdc24370e7a26?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251117:md
Date: Mon, 17 Nov 2025 13:43:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 17/11/2025 =C3=A0 13:46, Jan Beulich a =C3=A9crit=C2=A0:
> On 17.11.2025 13:35, Teddy Astie wrote:
>> A 4K page appears to be able to hold 128 ioreq entries, which luckly
>> matches the current vCPU limit. However, if we decide to increase the
>> domain vCPU limit, that doesn't hold anymore and this function would now
>> silently create a out of bounds pointer leading to confusing problems.
>>
>> All architectures with ioreq support don't support 128 vCPU limit for
>> HVM guests, and  have pages that are at least 4 KB large, so this case
>> doesn't occurs in with the current limits.
>>
>> For the time being, make sure we can't make a Xen build that can
>> accidentally make a out of bounds pointers here.
>>
>> No functional change.
>>
>> Reported-by: Julian Vetter <julian.vetter@vates.tech>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> I was meaning to ack this, but ...
> 
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, stru=
ct vcpu *v)
>>   
>>       ASSERT((v =3D=3D current) || !vcpu_runnable(v));
>>       ASSERT(p !=3D NULL);
>> +    BUILD_BUG_ON(HVM_MAX_VCPUS > (PAGE_SIZE / sizeof(struct ioreq)));
> 
> ... does this even build on e.g. Arm? IOREQ_SERVER is a setting which can=
 be
> enabled (with EXPERT=3Dy) also for non-x86. Yet HVM_MAX_VCPUS looks to be=
 an
> x86-only thing. (I then also wonder about some of what the description sa=
ys).
> 
> Just to mention (no further change requested at this point, in this regar=
d):
> HVM_MAX_VCPUS being part of the public interface, we'll need to see wheth=
er we
> can sensibly retain that identifier to carry changed meaning once we up t=
he
> limit. The check here may therefore not trigger at that point; the hope t=
hen
> is that while making respective changes, people would at least stumble ac=
ross
> it by e.g. seeing it in grep output.
> 

Apparently it doesn't build (debian-bookworm-gcc-arm32-randconfig 
catched it).
ARM does provide MAX_VIRT_CPUS and GUEST_MAX_VCPUS which is 128 or 
lower, but that doesn't map (or not properly) with what we have in x86 
(MAX_VIRT_CPUS=3D8192 is PV-specific, and GUEST_MAX_VCPUS doesn't exist).

I am not sure what to do, looks like many things are redundant here.

> Jan



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



