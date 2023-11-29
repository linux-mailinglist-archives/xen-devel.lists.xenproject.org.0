Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25107FDF17
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 19:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644153.1004808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8P0Q-0007z2-GQ; Wed, 29 Nov 2023 18:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644153.1004808; Wed, 29 Nov 2023 18:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8P0Q-0007x4-Dn; Wed, 29 Nov 2023 18:09:50 +0000
Received: by outflank-mailman (input) for mailman id 644153;
 Wed, 29 Nov 2023 18:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rgXt=HK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8P0P-0007wy-0Z
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 18:09:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e88::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4d23ff-8ee2-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 19:09:47 +0100 (CET)
Received: from BL1PR13CA0445.namprd13.prod.outlook.com (2603:10b6:208:2c3::30)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 18:09:43 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::7a) by BL1PR13CA0445.outlook.office365.com
 (2603:10b6:208:2c3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8 via Frontend
 Transport; Wed, 29 Nov 2023 18:09:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 18:09:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 12:09:42 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 12:09:41 -0600
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
X-Inumbo-ID: 7a4d23ff-8ee2-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckR2xVQ22oYl1p2qjoMPMZpKgl0pPozCbwEKJXMKzO+uO35YLlRXdR1XUJS8oI5MjPgsTJ2oMoUN4qWyHR57wAUdvyzneuGtIB7KWj2cW9U0E7ALSigQNHE6uZ5lgI21WUPjVEx62mfvzLbMsctY7dLYFNBImK31cnUjCI9R/6Gqyy5k6wNwZHhYQdMw68uQsELSMyplWOemBfChI63Add6dnYv4XSkQBLS6AgRFgD6R4djH5wB0UBdJYgOfQMWwe55N3phRvC6Pax3pNNd/WZBHPQcY5fMa9iSjvCmunHm5TVmjJfg7ChsC+lezaHnZXG/hBgIQuOuj5AUbfNBw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vex1tmOM2sMcRrcgze6k7ZYriWYb8FsjPwjP/Rioo5k=;
 b=OnUVuFFk3Rhbnl26nSQaa7BGuwo95eVEy8C/QdnC9K8phTcw1TRnCFWhEkeRBMxamJQorMD20pzPecxDnE4V2m1VNETgrpbtVZdHgHBLJKGFZHBhozKYhiIBhyJcQTPwROYzeA3LK/i+LVcQwjgORF3qv2jveO0lIftPPwjD3Sn9cGiwyiqLXfW9Ef9YEcbydV71PEA2PYESHWGXwKYsmSdYjzDLtoGyQiRXfc0MjihDVq+Qvt5rvWaGzWvWQhbnMzPmAM0C75aEvYRarHnWhi8z6iNGasA4TY4s+A7lnVF1MOLzXz63oZIRN28vscCRAiSzBQWL+3x2eQn3Hsz50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vex1tmOM2sMcRrcgze6k7ZYriWYb8FsjPwjP/Rioo5k=;
 b=MlXb4Jjq8epTZzcK5BVHuxO2psKiNMvhB44muE7L2vXxa24hcOY4LIyK0CmCYB2oycdCxRGFRqowZ/XwD/QNy+egd6qy0ndq1rsZau/pfzZP7evl9VF46ZdxpJJ5mZiOsj5X2dPseSnY9nr4LfPoOgwyR6MfVaxRZNEWwHSOhiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1814faee-d88a-48bc-9049-80af67cc39c9@amd.com>
Date: Wed, 29 Nov 2023 19:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Move static event channel feature to a separate
 module
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231129153417.84421-1-michal.orzel@amd.com>
 <c51e40ed-0cd7-4562-921f-d2dc67b9e4e6@xen.org>
 <9685bc21-9d57-4f64-bd2f-70b9d0b0168a@amd.com>
 <f42236b8-5fac-42df-9705-4ae4b0519d8e@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f42236b8-5fac-42df-9705-4ae4b0519d8e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: b576aa54-5dc4-48fe-6d9b-08dbf1065ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0uQx0PlxXrpuFmtfwBpQbKcSB6Bmbr5ry029QHRN+jDrH7ZqqIPu0o2n3aV1hvIBLCGPS0vflIiRVxyO5r5/1Zgj86XCjid5DK9t0W6WPyCR2tU6JB7DNC4sYRGzhm5jhCkUBG3It7srMcDiCf+cJry47yXh4U3CuooUQapN/4+0b9hBiTiqAw+PjGyfsthMWpzFJc85hsRWVJ4PcezOCjm/DrOyhxzUPyzTWHklrwDHPfMaYM5h/KF+Sg8wRNFpSaVZFWzrZe9AtUIXqVltnwIP1UHvrrVDjELekVzphcYr6aWJ9cmIGUj0FIuy/bwic5zPN/OgmlT1ZWn2qSKF4K0pVcB1lfzKbIHVZwxKJNMoXcJ/gJyQeAq4DOldsNyhBQFm1hJ8wx44CVU+qfuRQ7OVMtdHg0msFAsv2ZwabtdRmtbWiGtig61cxRa+crJkXDLqrWtn7uBvQkIyvvsTU4TayXv4G2hnL2++Uk62H1womVMQ/bmKb2iKzQcosoyWuOqQ4NeO/yQquwxGGTqpyjkF1c1MdIqQBZ/Yq8Q7SoUdionQrmZ4QZdud+3MXKGVSyzulUGAC80lciP6Qc5ENXFyaa0Aex/gtrZ9D2SmkPWZUVYGgOzv4KLq350FTticVnArGJIVGzdD3a9yf7bLdel5YKYi42gzlprzBht8zea4VcxU2EXz7KU31j6s8ozCzpyal5ifulJQS3MSP7M8Nzd62r7BgNl2S+dKsWF8O51lcl09zqjklOjxFK2sdZWajGW63CfVB9Bj9cTek7R9M1CNZlAiQ/7kqDPS0wqfmMgm6l5TEtjAkfaBSiNXnlC3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(47076005)(356005)(41300700001)(31696002)(5660300002)(44832011)(2616005)(86362001)(8676002)(8936002)(40480700001)(4326008)(2906002)(26005)(110136005)(31686004)(81166007)(478600001)(316002)(70206006)(70586007)(16576012)(40460700003)(53546011)(426003)(54906003)(336012)(36860700001)(83380400001)(36756003)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 18:09:42.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b576aa54-5dc4-48fe-6d9b-08dbf1065ca4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725



On 29/11/2023 18:54, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 29/11/2023 18:41, Michal Orzel wrote:
>> On 29/11/2023 18:17, Julien Grall wrote:
>>> That said, I could settle on defining the two helpers in the *.c
>>> directly because they are not meant to be used outside of a single *.c.
>>>
>>> Simarly...
>>>
>>>> diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/arch/arm/include/asm/static-evtchn.h
>>>> new file mode 100644
>>>> index 000000000000..472673fae345
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/include/asm/static-evtchn.h
>>>> @@ -0,0 +1,41 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#ifndef __ASM_STATIC_EVTCHN_H_
>>>> +#define __ASM_STATIC_EVTCHN_H_
>>>> +
>>>> +#ifdef CONFIG_STATIC_EVTCHN
>>>> +
>>>> +#include <xen/device_tree.h>
>>>> +
>>>> +#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
>>>
>>> ... this used to be defined in domain_build.c. AFAICT the only use is
>>> now in static-evtchn.c. So why is it defined in the header?
>>>
>>> If this is moved in the *.c, then the header static-evtchn.h would only
>>> contain alloc_static_evtchn(). This could be moved in domain_build.h or
>>> setup.h (I don't have any preference).
>> Apart from a prototype, we still need a stub. Therefore I would prefer to still have a header (will
>> be needed for future upgrades e.g. port exposure in fdt) and move the prototype and a stub there (the macro
>> I can move to *.c). It just looks better for me + we reduce ifdefery in domain_build/setup.h.
>> Would you be ok with that?
> 
> I don't much like headers containing just one prototype. But I can live
> with them if you think more will be added.
I can at least think of adding support for discovering static ports.
Thank you for meeting me halfway.

~Michal

