Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C08A2962
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 10:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704439.1100841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvCJs-0004o1-CA; Fri, 12 Apr 2024 08:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704439.1100841; Fri, 12 Apr 2024 08:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvCJs-0004lc-9V; Fri, 12 Apr 2024 08:31:36 +0000
Received: by outflank-mailman (input) for mailman id 704439;
 Fri, 12 Apr 2024 08:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EY2Z=LR=bounce.vates.tech=bounce-md_30504962.6618f162.v1-468edefdb5654a02b8d083a9ad37ca33@srs-se1.protection.inumbo.net>)
 id 1rvCJq-0004lT-Ih
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 08:31:34 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1068ad7e-f8a7-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 10:31:32 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VG8tB5fmzzDRHxMD
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 08:31:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 468edefdb5654a02b8d083a9ad37ca33; Fri, 12 Apr 2024 08:31:30 +0000
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
X-Inumbo-ID: 1068ad7e-f8a7-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712910690; x=1713171190;
	bh=6e/myeW0UwWYDHdcvyrfEtLs3Xn/yOHkQWO+J0bJNTM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gJATNbgMTzPu7IbbdoaVudZ7KLoRDrLXssVcsABusxvA7v/iLhhNwtVL8QyNrlbar
	 loo9r8l9MRvQ5B+mJGM8e/J9gfTcRNZ5qlgSs3+VwSFMalsWByPtlU/qiAhmeZPWIC
	 u6pdWXwotBXQ+vHboIXRvI0TWU2j5vKn0dvFDf4wvgIZ9Are+Qi0crOgq1apDgVJis
	 wlsd6YefpPbfMJpgysN/HVxjA0Lgf5A/7atyd5tXc9fnQqvA3Wf55LlWxJaewxNHtb
	 q6uB67SgKqdJiP7j6GdZNPnqMGZB7Z9+dj3g0RKNLXE/XFbI1gSoM7F3sQR3h3Xy9B
	 Wol91MxpLWN3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712910690; x=1713171190; i=teddy.astie@vates.tech;
	bh=6e/myeW0UwWYDHdcvyrfEtLs3Xn/yOHkQWO+J0bJNTM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QIWLKRcLcyEKOeGwZXpom5TrLalRGceVsSOLut0TUzm+qWd0ppijkmqlOTvliDyWK
	 PrCjKEMrf9l+FYkz13TTe3sRdutesaOftSci2zP6G8bKjr/CVQWt93/RCXI3RKfefd
	 rgp+sRaL/rQu/tAob3QIqPWQLpEu6JtZTEappouxBc3k/BqI3+wHKfuTu4WlE+ATcM
	 wEgaaQzbDAsB6E0kPIG9YdC8v+v804rR3NqGiti/pY7ZtUtpvB8NkCiekQmQ4F6c2L
	 2vU6pIvDz74oV0O+3RiNoSWL5cl2YZATUR2YOw93JA31IHIyGSp/5FXCte4flQV8WQ
	 hb7UW0YaAy5rw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2=200/3]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712910687905
Message-Id: <c7fd7e96-714e-486a-9c67-e5e881218303@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1712580356.git.teddy.astie@vates.tech> <4bf2e6ea-a7fc-4cc6-aefe-4a9ed9ae97e1@citrix.com>
In-Reply-To: <4bf2e6ea-a7fc-4cc6-aefe-4a9ed9ae97e1@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.468edefdb5654a02b8d083a9ad37ca33?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 08:31:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 11/04/2024 =C3=A0 22:05, Andrew Cooper a =C3=A9crit=C2=A0:
> On 08/04/2024 2:02 pm, Teddy Astie wrote:
>> All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (a=
side
>> specifically crafted virtual machines).
>>
>> Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is support=
ed
>> while cx16 isn't, those paths may be bugged and are barely tested, dead =
code
>> in practice.
>>
>> Disable IOMMU in case we have IOMMU hardware but no cx16, then cleanup
>> no-cx16 handling logic from VT-d and AMD-Vi drivers.
>>
>> Teddy
>>
>> Changed in v2:
>>
>>   * Added cleanup no-cx16 code for x2APIC
>>   * Fixed commit and code formatting
>>   * Added missing Suggested-by note
>>
>> Teddy Astie (3):
>>    VT-d: Disable IOMMU if cx16 isn't supported
>>    AMD-Vi: Disable IOMMU if cx16 isn't supported
>>    VT-d: Cleanup MAP_SINGLE_DEVICE and related code
>>
>>   xen/arch/x86/apic.c                         |  6 ++
>>   xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
>>   xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
>>   xen/drivers/passthrough/vtd/intremap.c      | 65 ++++-----------
>>   xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
>>   xen/drivers/passthrough/vtd/vtd.h           |  5 +-
>>   6 files changed, 71 insertions(+), 145 deletions(-)
>>
> 
> Sorry, but you've sent out two copies of each patch in this series, and
> it's not clear if they're identical or not.
> 
> Please could you send out another version, making sure there's only one
> of each patch.
> 
> Also, you need to swap ENOSYS with ENODEV, as per Jan's review on v1.
> 
> Thanks,
> 
> ~Andrew

Hello,

Not entirely sure why it got sent twice, as marek said he only received 
it once. Will double-check next time to avoid this issue in case I 
wrongfully sent it twice.

Will also swap ENOSYS with ENODEV in the next version.

Thanks,

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


