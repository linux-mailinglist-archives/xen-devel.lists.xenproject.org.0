Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FFB431243
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211851.369527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOAN-00074Q-AP; Mon, 18 Oct 2021 08:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211851.369527; Mon, 18 Oct 2021 08:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOAN-00071o-6D; Mon, 18 Oct 2021 08:38:43 +0000
Received: by outflank-mailman (input) for mailman id 211851;
 Mon, 18 Oct 2021 08:38:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcOAL-00071i-RI
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:38:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82e4ad75-bedf-48fd-9f53-1dcf919e020c;
 Mon, 18 Oct 2021 08:38:40 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-3XkZYGabOLSDjlqgclbChg-1; Mon, 18 Oct 2021 10:38:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 08:38:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:38:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0059.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 08:38:35 +0000
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
X-Inumbo-ID: 82e4ad75-bedf-48fd-9f53-1dcf919e020c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634546319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3AZQt9zXFJ0tnSQRCHKAPpeLF3APpzN7f9iqQsmzuk=;
	b=nAeVTnOFRug8eWCW3IwMlDUXniwAivbOLZ7xO4V5v+fVUUS1U+perPPniaQl3ZSW0cic5Y
	n4vTtSESCAUUUIucnBX6Z54mHeJAtTTs52dj7QbboVuRPoX7VLqhUZ97iuiLE7GZy+N6Uv
	kAMIK56iNptESFUTSZN3cf1UYNi66a8=
X-MC-Unique: 3XkZYGabOLSDjlqgclbChg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK0ps7+4B4M5/44isJrjLK4unrcopgRHIW61ARhWfBg2xfgt2IqyrQ2Af3u3A3Rwicsx6fZisLhWG/KX3Cbvk4k3HP47ALrHyQErU5FwPfcK+xoR97N7QA+JpiCtKPexQipKix3OR49/d6OjN5MrC3BReBI0JSuj5cvxme+uEFHjK3bkKJVkM3v86j5xI0y21YPw1Oo4o8wm5ILG0f+o5DNcYGNAhWNXtjvNYhy65fDqh6gAgijCjXAxob1rTSu0rFTrKt0rE+GW8nVoVVls5mCwYzBDwW4vtlJX17zL/iKLx7CEpT2fvNNvGFnhdbC12ZKfEXTMAWHAHbDbMDhp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fndire85mAACL4pbJGncAywmLzcxt7aJCh+9xcbCQdo=;
 b=Yxa084fsfn+PtIKAI7yv8xcke6wtvx+O96/Vqx3F9B1m65AqSewUtecvjQ91FAr26zUzmdCkRQBK0sSKoCNymmEDrk0AIMq8UknYDKmkh+L1V95GsQIN3HdKmf059mMEzEDmXypLdDa8jlzxY2HnKGsI2ih1XRaZGre1kyyHECZRgQsDImCMQ22s1e654vp6oTfuoJG5kp8GMHY4lDMB5jsikMSGl1IlOsib+pNhfjry8GP4672agdHf93WCrg136ua6qh038onlqCe3deaq/BEeDLhoDvx4HA4MaY8q0B9NZ9hYLbwBQRrLJgQ7f/BVniWmGzApok+eNHgb63ze0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, iwj@xenproject.org,
 sstabellini@kernel.org, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
 <YW0qa2CXcnWZNCf7@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <466083bd-a4d3-0cb6-ebae-11a3e9f67a8f@suse.com>
Date: Mon, 18 Oct 2021 10:38:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW0qa2CXcnWZNCf7@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 269a01ce-7646-4424-081b-08d99212ad0c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63840C0D082B41B6DFDDC414B3BC9@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5eohtPsyy+4T8kY5It9lTbSkTBLqyTMoIW56HPq1cl/GY9aITmBXhBDaFezeC8VnimVf2YqT7sAXFl1khNybx4hE3w33OLWOP8VvJxpsKw/XPhveDAIM2LLG97EGiq535pPWyFAR+uqU6lelzkqx0ib6GtdDQtPxO9ZXGiF7c6OCGhYP+sfm7okfMHe/EDZAj09qXPH7VLtYpjj82qWXZlGU1AuyvXtNBb0cJLZ98IcyUEicuFmB5LSpagr8UYbDOCnIVWANcHqljpSa7Kto9Bo1qgyUcmqqxPU86n8MjdnGTIL8Pi0TTMTr5Qpatlp18gToBuPqhAuDRgRer6w7+qF3bXvb2BnLuvdG90tdpROsqQiItnvZeq+z4PMLMCaklVk5J5tPEFC9bO/F6r40wuSAcok3atNlpJRzrPZ+YlFOxKtbBZ81REa5PV+1AKBMSwxSyRtPXvwkRt69iT9bOxzq7ws/PGITFBySsFHYw/ED60fGYN24kUI2ZKq5GcTSE62JBHXc2aWMA0Ue3/KSBlbO4MLHVbMysmzL71nyr7o0QXNjvH/7xtM0MFdDp0Ec8/0V+Ew1r4zxa0z0J5jqrGihUJFUScH7g9OVwxtCnd4NlLYMysFpSlqhalrSxtGAKacoRfjf57RflRLu7ULqTHl07+L0hJftVogE0jXRh8n8wdzn9Wu+vfhXWk1aAj2RW/VSZK03godTr0YW4iaTINLKUjVLKlvXeliBYx4FAPgE9isyB4cAgU9idPeRv9TJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(956004)(53546011)(6486002)(2616005)(186003)(2906002)(66476007)(8936002)(316002)(26005)(4326008)(5660300002)(36756003)(16576012)(6916009)(86362001)(83380400001)(38100700002)(7416002)(66946007)(31686004)(31696002)(66556008)(508600001)(8676002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4lggAL+3IghaaRF8gGWUua48h0kxyPIsetGUjGwZlaW+W/++C7bArhlM6pae?=
 =?us-ascii?Q?vDe0bzyE/muh2b/OeBCkjH7jjfs9iCEckty5aUAL1BnPUNKI9f3gzDp12hpW?=
 =?us-ascii?Q?1tcEbC+P7RieS9ZDHQ5hEtbukz0fhYDYPWxCJQzjT4+/7YrtfrwzrQjrGocd?=
 =?us-ascii?Q?4Qz3Oz4L0aXrvDz7X1l6jOwVGi9EkgfsoIsEqisoGWnnUO7G1LkTj3k6MOJ5?=
 =?us-ascii?Q?vr8CuzfCYZcA09stkMOvAI3KQ31S7WuO8QUTJCBxUBLIsqOjuJH53xH4+eMZ?=
 =?us-ascii?Q?+MpRUpG+pDApF7YFJas5GmFmrZLoQZrl3xDmDyzFiTIczLexfTjpV5vQ+Bwu?=
 =?us-ascii?Q?X71ZIAnJuG4tAwkxCG1iMvK43OADpDob2u79F2Jr51HkadxUzgtnkj97ynec?=
 =?us-ascii?Q?gYJfzhsu+XCwbVGkJMwRF8Z+evwNCbIeVgRmQBiELGtChZCBnliV8aiEUwos?=
 =?us-ascii?Q?xUrypCDzFxa0zHvzb4+6xAyEJ09sE8nLfTeLJTcAnKlGesdqc8cfHllycrpx?=
 =?us-ascii?Q?86CTI5kLm3T4KE93qBS5hGU9tzCUEe5TGUxIhBqugzKWoXY20PJxbKNOa+Mj?=
 =?us-ascii?Q?hd56H/KqMJ9xliSDc93yNBWY3wH+tfpuavyKOQcR6M1H37LRcfW/T4H61sCE?=
 =?us-ascii?Q?skqfzm/7s61I+5Ev/Di+I2I3yCJu/UU/7aQm7jGgkmxLiJyEnHIViDVbaLYY?=
 =?us-ascii?Q?4b7Tk/1A6/OljHBTk4fuKc96NF+aWNzdu3TugQa0NH2wr96T9Ncy1SMdfHsH?=
 =?us-ascii?Q?U5rE7PRnlD1tzOfpsONfKH8hAaU5ibgGxgDTsSEUT5Cq7kvKx2mAB5qh0K1H?=
 =?us-ascii?Q?9ZxWmyHEFYd/aGUcp3Grypg+Oy6QXrXFpibUtEII7ln3AOO7qD0+jlO1lPTg?=
 =?us-ascii?Q?wjr9630/902x4YN9vt3pIAr4ZlKZcCUttwnfob/ObLViEJjX/G9OF8v09MFE?=
 =?us-ascii?Q?Lr1w7s0iPXmJ/cLkakJPhkBHCykSoP/vpHtOgWEE52T3aY/PqG2Azq/omt/8?=
 =?us-ascii?Q?wC1p9BxTuFzO2yxvf+l0Y+HjxXulb4Cl7fMzM/AXkkEDy3K9LPhLFct1jrwB?=
 =?us-ascii?Q?Q1kBvmDX65NnVVygy59vvQ+f5lT7bFvx8UqBerMyHfgDdOIkagKN7pdeHagB?=
 =?us-ascii?Q?LqEq+ivz1yDSBomah93x9/evcfnw0WZSpZgwY9eVX+w1OYR0QNR6fjJTSCHd?=
 =?us-ascii?Q?uXKrYosya2+e3JEouoaT6fcEIXsDDHQtKChulo9IwugkdrPGk2t+MXEMe1mN?=
 =?us-ascii?Q?k/q3c3oO2UrY+fw+4kqPAI1uwwx6GV3q/hnDGYkWIOMPQnJx9ZidCZ0nGPf9?=
 =?us-ascii?Q?QCRNI2UqxzIbhqyj9vgw4gAk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269a01ce-7646-4424-081b-08d99212ad0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:38:36.0648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTr6Syu0iws7knyHMwBolN04l5mklfOhezL4OC4BqUKvViKnNz7PeCY/2RVWJxwhJqxY46sMpHaBAn+atuXHfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 18.10.2021 10:03, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 18, 2021 at 09:47:06AM +0200, Jan Beulich wrote:
>> On 15.10.2021 18:51, Bertrand Marquis wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/arm/vpci.c
>>> @@ -0,0 +1,77 @@
>>> +/*
>>> + * xen/arch/arm/vpci.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License as published b=
y
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +#include <xen/sched.h>
>>> +#include <xen/vpci.h>
>>> +
>>> +#include <asm/mmio.h>
>>> +
>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>> +                          register_t *r, void *p)
>>> +{
>>> +    pci_sbdf_t sbdf;
>>> +    /* data is needed to prevent a pointer cast on 32bit */
>>> +    unsigned long data;
>>> +
>>> +    /* We ignore segment part and always handle segment 0 */
>>> +    sbdf.sbdf =3D VPCI_ECAM_BDF(info->gpa);
>>> +
>>> +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>> +                        1U << info->dabt.size, &data) )
>>> +    {
>>
>> Here it is quite clear that the SBDF you pass into vpci_ecam_read() is
>> the virtual one. The function then calls vpci_read(), which in turn
>> will call vpci_read_hw() in a number of situations (first and foremost
>> whenever pci_get_pdev_by_domain() returns NULL). That function as well
>> as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
>> physical one; I'm unable to spot any translation. Yet I do recall
>> seeing assignment of a virtual device and function number somewhere
>> (perhaps another of the related series), so the model also doesn't
>> look to assume 1:1 mapping of SBDF.
>>
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>      if ( !pdev->domain )
>>>      {
>>>          pdev->domain =3D hardware_domain;
>>> +#ifdef CONFIG_ARM
>>> +        /*
>>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci=
 handler
>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>> +         */
>>> +        ret =3D vpci_add_handlers(pdev);
>>> +        if ( ret )
>>> +        {
>>> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>> +            pdev->domain =3D NULL;
>>> +            goto out;
>>> +        }
>>> +#endif
>>>          ret =3D iommu_add_device(pdev);
>>>          if ( ret )
>>>          {
>>
>> Upon failure, vpci_add_handlers() will itself call vpci_remove_handlers(=
).
>> What about iommu_add_device() failure? The device will have ->domain
>> zapped, but all vPCI handlers still in place. This aspect of insufficien=
t
>> error cleanup was pointed out already in review of v1.
>>
>> Furthermore already in v1 I questioned why this would be Arm-specific: O=
n
>> x86 this code path is going to be taken for all devices Xen wasn't able
>> to discover at boot (anything on segments we wouldn't consider config
>> space access safe on without reassurance by Dom0 plus SR-IOV VFs, at the
>> very least).
>=20
> My original plans for SR-IOV VFs on PVH dom0 involved trapping
> accesses to the SR-IOV capability and detecting the creation of VFs
> without the need for dom0 to notify them to Xen. This would avoid dom0
> having to call PHYSDEVOP_pci_device_add for that case.
>=20
> I might be confused, but I think we also spoke about other (non SR-IOV
> related) cases where PCI devices might appear after certain actions by
> dom0, so I think we need to keep the PHYSDEVOP_pci_device_add for PVH
> dom0.

Right, hotplugged ones, which I forgot to mention in my earlier reply.

>> Hence it is my understanding that something along these
>> lines is actually also needed for PVH Dom0. I've just checked, and
>> according to my mailbox that comment was actually left unresponded to.
>>
>> Roger, am I missing anything here as to PVH Dom0 getting handlers put in
>> place?
>=20
> No, I think we will need those, likewise for run-time reported MCFG
> regions.

Yes, this was what I referred to by "without reassurance by Dom0".
Thanks for confirming.

Jan


