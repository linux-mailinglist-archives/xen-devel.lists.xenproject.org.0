Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A169AA70F8
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 13:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974625.1362432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAozU-00073y-6n; Fri, 02 May 2025 11:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974625.1362432; Fri, 02 May 2025 11:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAozU-00071u-3m; Fri, 02 May 2025 11:55:40 +0000
Received: by outflank-mailman (input) for mailman id 974625;
 Fri, 02 May 2025 11:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEml=XS=bounce.vates.tech=bounce-md_30504962.6814b2b7.v1-759278f8d84e481c831ca3237c1bca05@srs-se1.protection.inumbo.net>)
 id 1uAozS-00071o-Hd
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 11:55:38 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bf26161-274c-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 13:55:37 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Zpq9z3pB5z705wWq
 for <xen-devel@lists.xenproject.org>; Fri,  2 May 2025 11:55:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 759278f8d84e481c831ca3237c1bca05; Fri, 02 May 2025 11:55:35 +0000
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
X-Inumbo-ID: 5bf26161-274c-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1746186935; x=1746456935;
	bh=8iJrYoI1OSS0dbzs4y01tnMky/wZNEidoo1t7rn/Q/E=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=riO8jYVXqG3nF4j9oFHmL/fZhYjWYvdMjZJEPjzpzZE3KaOHH6Idvo6cCJP/aiyfj
	 td2zW9BvtCOvI4DGxB4uab4eNcbS88+fWFkvAEYMzWrEIGIMfd/x3Ra4jAXFjUk3pV
	 I0D9R+QAsACyR/sNKdnN0pmed6icWWduY4iFMtTEjLbpVZcEoGyPGBpRUbxJJoRaOD
	 L/QD6bCxb5IUYQ5pmFOn1pDIZCVSo35S78svUxfBolbOS5Nd/ETZ+hcxJqE3bE4xEB
	 n5d3Bvmd3dCP/fkTnUaqywnVb7DMzwG2wtiQuQpBnXch4DzRVe952wmzCvmJBpPytO
	 MmuktRNeZeL2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1746186935; x=1746447435; i=teddy.astie@vates.tech;
	bh=8iJrYoI1OSS0dbzs4y01tnMky/wZNEidoo1t7rn/Q/E=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0UozmFr3FOWoqWbMzayyfmiEN2a/dtqdPdW8EM91pZTFJXRvt78uuuDS7aIcChdb5
	 uZKnQDY5ePoaWRey0zZnNm2oe5sirXAb41L0f7/pw7K03yIT5rSMbEcWdSTWFwGkdd
	 nQ123T3KK1wXTyKe3pFnDQ1sORoiAy/qCdMQ3SNvHOyAbRN8lBFh6MW5/Q5bx/w/CI
	 2N/3A0pY8oTr/XTu0Fe/cTJnkDntL57jwqrCRN0XhWhqs5ObjxiOeh9lv0EWdC4iVa
	 r1j6ObJfxebIqKoWM4TrI7dvOB54QHCecSoJBFm6w526dyMmIBMM4Dfndomx2SrMDp
	 kKbZe2mHwGO+g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=201/4]=20xen:=20Introduce=20physaddr=5Fabi=20CDF=20flag?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1746186934215
Message-Id: <ec06a030-3983-4689-bb8d-bbd523e820d4@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744981654.git.teddy.astie@vates.tech> <df0da6d56a9a9ca440b7bb2c7c0b71d66567e3aa.1744981654.git.teddy.astie@vates.tech> <238c657e-a53c-4eaa-84aa-1d3310b65723@suse.com>
In-Reply-To: <238c657e-a53c-4eaa-84aa-1d3310b65723@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.759278f8d84e481c831ca3237c1bca05?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250502:md
Date: Fri, 02 May 2025 11:55:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/04/2025 =C3=A0 17:59, Jan Beulich a =C3=A9crit=C2=A0:
> On 18.04.2025 16:18, Teddy Astie wrote:
>> @@ -745,6 +747,12 @@ static int sanitise_domain_config(struct xen_domctl=
_createdomain *config)
>>           return -EINVAL;
>>       }
>>   
>> +    if ( physaddr_abi && !hvm )
>> +    {
>> +        dprintk(XENLOG_INFO, "Physical address ABI requested for non-HV=
M guest");
>> +        return -EINVAL;
>> +    }

> 
> Why this restriction?
> 

physaddr_abi changes how copy_from/to_guest works to make it use GPA 
instead of GVA. As non-HVM probably means PV guest, it would mean 
something like PV guest hypercalls uses physical addresses (derived from 
MFN?) instead of virtual addresses, which would not really be practical 
for both the guest and the hypervisor.

> Jan
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



