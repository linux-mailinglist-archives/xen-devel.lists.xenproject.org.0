Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E95CD0C1F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 17:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190847.1511099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWd4G-0005hy-Tb; Fri, 19 Dec 2025 16:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190847.1511099; Fri, 19 Dec 2025 16:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWd4G-0005fg-QR; Fri, 19 Dec 2025 16:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1190847;
 Fri, 19 Dec 2025 16:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvx7=6Z=bounce.vates.tech=bounce-md_30504962.69457910.v1-e370a9d7b08f4cea86086aa5b235a627@srs-se1.protection.inumbo.net>)
 id 1vWd4F-0005fa-JA
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 16:10:59 +0000
Received: from mail137-31.atl71.mandrillapp.com
 (mail137-31.atl71.mandrillapp.com [198.2.137.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d50ce95-dcf5-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 17:10:57 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-31.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dXsw027xbz7lmRhx
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 16:10:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e370a9d7b08f4cea86086aa5b235a627; Fri, 19 Dec 2025 16:10:56 +0000
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
X-Inumbo-ID: 4d50ce95-dcf5-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766160656; x=1766430656;
	bh=POkgUHKK+RTRLCplev3npmwdhxPwzi4LihKNQTz3N1w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0rCMdRG8Ey7jJlDz6yr1Z4g9xHnJsXmTob1ecBr2A/mDlxTvPU/cT5C/l/oP4KmwG
	 0t1Sj5fIUoFIBzeilyOrzRjfK2yYxP2roARl2trTTK67OEdnovkbodsvx7bCPH8xQf
	 1Z9GFx5ExsUaXUDidDeqCNYAiMQjMsJDjOozjjF3vFKtDrEKl1mZScbmoaZhBGdlcO
	 mbMVawtcANUCtYua3qOhXWnM87ZSBqw01rRKvmzljHAARB86SfIK5gdrKJdjIdvT0M
	 P/KQJ8dwIx8F8kgdEOmi3NQdloy9bHxZY9IjPTZe/4tVbY4ZizxnJroq7z3uqqhJGy
	 Pt3rBRgMMJmYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766160656; x=1766421156; i=teddy.astie@vates.tech;
	bh=POkgUHKK+RTRLCplev3npmwdhxPwzi4LihKNQTz3N1w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WGkcNJFCisiQxeNg6jULZTpa6QYHRBwsjxZN/kRCm+Sfo0MwAN64/0p18DZ/GCC+X
	 8PEkloYzNiCBXGXRWe/D85LSm8MnbxI5fVe5yHmL1h40uBBxB9onGEJPfbMIpREPnP
	 f0ZOMWuS6fi0Mg6M0rGt4iKDClBA2XW24xlMunISTfKYdlre44MnOwGekrPmJIpIXL
	 owApgSaBLH4K6Gz+KE/0BzdbfmnflyWMW2E8zKR0L3uE+QanjvhW9W4xhuiRHTJw05
	 590xptGx2eZtNVhKEvBtpMWHn1OS6kNWGe4i5T9r0mobIqt+r4c6l/vm0omCwq+c3N
	 zYhDgd0GBi9Hg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH]=20xen/domctl:=20add=20XEN=5FDOMCTL=5FCDF=5FALL=20mask?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766160654563
Message-Id: <570f1e3d-94ab-40a9-8d6c-c36615e5aa2b@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <20251111201627.3579504-1-grygorii_strashko@epam.com> <67f0d3e0-bd90-4817-a084-49d01d8305ff@epam.com>
In-Reply-To: <67f0d3e0-bd90-4817-a084-49d01d8305ff@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e370a9d7b08f4cea86086aa5b235a627?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 16:10:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 18/12/2025 =C3=A0 16:21, Grygorii Strashko a =C3=A9crit=C2=A0:
> 
> 
> On 11.11.25 22:16, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Every XEN_DOMCTL_CDF_x flag:
>> - is defined in public/domctl.h
>> - explicitly listed in sanitise_domain_config() (common/domain.c) to for=
m
>> mask containing all supported DOMCTL_CDF flags for "Unknown CDF flags"
>> check.
>>
>> So, it is required to modify two files every time XEN_DOMCTL_CDF_x flags
>> set is modified.
>>
>> Simplify the things by introducing XEN_DOMCTL_CDF_ALL mask, so
>> sanitise_domain_config() no need to be modified any more.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
> 
> Seems nobody interested, sad, dropping from backlog.
> 

Sorry, I missed this one (I guess others have too).

> 
>> =C2=A0 xen/common/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 7 +------
>> =C2=A0 xen/include/public/domctl.h | 7 +++++++
>> =C2=A0 2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 775c33928585..4f91316ad93e 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -730,12 +730,7 @@ static int sanitise_domain_config(struct 
>> xen_domctl_createdomain *config)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool iommu =3D config->flags & XEN_DOMCTL=
_CDF_iommu;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool vpmu =3D config->flags & XEN_DOMCTL_=
CDF_vpmu;
>> -=C2=A0=C2=A0=C2=A0 if ( config->flags &
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~(XEN_DOMCTL_CDF_hvm |=
 XEN_DOMCTL_CDF_hap |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL=
_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL=
_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL=
_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL=
_CDF_trap_unmapped_accesses) )
>> +=C2=A0=C2=A0=C2=A0 if ( config->flags & ~XEN_DOMCTL_CDF_ALL )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_IN=
FO, "Unknown CDF flags %#x\n", config->flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 8f6708c0a7cd..94a8e3042cbf 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -72,6 +72,13 @@ struct xen_domctl_createdomain {
>> =C2=A0 /* Max XEN_DOMCTL_CDF_* constant.=C2=A0 Used for ABI checking. */
>> =C2=A0 #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
>> +#define 
>> XEN_DOMCTL_CDF_ALL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN_DOMCTL_CDF_hvm | XEN_DO=
MCTL_CDF_hap | 
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL_CDF_s3_inte=
grity | XEN_DOMCTL_CDF_oos_off | 
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL_CDF_xs_doma=
in | XEN_DOMCTL_CDF_iommu | 
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL_CDF_nested_=
virt | XEN_DOMCTL_CDF_vpmu | 
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMCTL_CDF_trap_un=
mapped_accesses)
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t flags;
>> =C2=A0 #define _XEN_DOMCTL_IOMMU_no_sharept=C2=A0 0
> 

Given that we already have XEN_DOMCTL_CDF_MAX, we could base the check 
using it instead.
Something like checking fls(config->flags) > fls(XEN_DOMCTL_CDF_MAX) ?

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



