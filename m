Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846088DCFA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698483.1090201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRua-00015o-Uc; Wed, 27 Mar 2024 11:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698483.1090201; Wed, 27 Mar 2024 11:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRua-00013z-RP; Wed, 27 Mar 2024 11:57:44 +0000
Received: by outflank-mailman (input) for mailman id 698483;
 Wed, 27 Mar 2024 11:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAEl=LB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rpRuZ-00013p-JV
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:57:43 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3624c472-ec31-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 12:57:41 +0100 (CET)
Received: from MW4PR03CA0092.namprd03.prod.outlook.com (2603:10b6:303:b7::7)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 11:57:37 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::5d) by MW4PR03CA0092.outlook.office365.com
 (2603:10b6:303:b7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 11:57:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 11:57:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 06:57:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 06:57:35 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 06:57:33 -0500
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
X-Inumbo-ID: 3624c472-ec31-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsILYJBxk0YUgwnLWZ7tQ7v5cAwt3uvC15Z0hcj5aTXqdhlLHcfATs0CxdveqDoddXD32GgiN5Xh9PWpewzOojlNafRFYNSGgAl1qL6vrnF9XpDk7pMNAuD87wG96DOv8T2vM0WCdlorC1CPTcRH2rV/O4kjhjyDxBqSsrvEvihHPvRgTRZa4LHnpyK3tU1VmD+FjdgbhSY4qIi3/xecRitR4pNOWgxtrk/nh50VJmRWujrrp3my8Lg6VaJ26Itg/AzU4YSUs/RvgC0r0uHKGV5DRdsYQ9vvMJO/z1ODwABzN8h0MfZ0YA6OylHPE0U7xOoEYJvG/dGLMRy9JuUPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glkmBnGMe+O51lp+AmzEypqT5ZsbGA5Usg9YV4dFEks=;
 b=kSl1ts2Nj5HPmmQqEDSxJ9cRak8Ul2K1gWfR31aiCrg306MC14X+9wsSAJiVd8X4nnw3dohKRTBTXz1BoCXqixgkzsS5QYfPMhWjlCJI9opN3ozova47AdVT51MsvSNOoFP2pZeLPJlwFqDbrLY9SJqzVOBZrv4gmFxa88HwF1PkEToPIqUtLqxkOiUhdm2mYFcMUYC59wUh076dXnP7ubtE+Y/ybbc2mumuHqwGPfB8ekEZoIoTABRc7TOmPGLz+ze+D2c02rrii38RMM+NykKs+93NGqekmz3kuiRalmBvjaCj7oIb6NV1tiroF72x5k+nfutfQQARZ040U/UqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glkmBnGMe+O51lp+AmzEypqT5ZsbGA5Usg9YV4dFEks=;
 b=mifdz35nn8vDrpTjdPdE6GcJZsgia41NynbWKCyJ+r3cc/Pj34HdxQuQhFwGBhpDXgdB0RqA9KjhS+eZPq06GNG5ikkMLMwR3ozeKjoDlCa6PuyOsFgWuiNgjJxyut93ASqB9px+WLnFNtARjnBP31QFTe2wx3I10rWCUTGlwA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4cb543df-c763-48f7-b727-2af9a27bdca8@amd.com>
Date: Wed, 27 Mar 2024 12:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
To: Carlo Nonato <carlo.nonato@minervasys.tech>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
	<xen-devel@lists.xenproject.org>, Andrea Bastoni
	<andrea.bastoni@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech>
 <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
 <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
 <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com>
 <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com>
 <22ab32bb-b0d0-4d68-8918-5fcb42cc0f88@suse.com>
 <CAG+AhRVEM+hcEbBO5Konjty8gQtZ0kq27rPjXCqsF627t9fqwg@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRVEM+hcEbBO5Konjty8gQtZ0kq27rPjXCqsF627t9fqwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a3bc01-04ce-4771-8175-08dc4e551899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8scHIk6oGXywtYViKyLNzozj8hn1JiPhqLj5DLFE6yn7cIkixKCQ7+LNzi2mh95UUZ7iTeifz2cpA98s4fyNcSSE/d7Lp7IjLCvawGwWTI7lI4athY+HdDitqKGo2XPKaz11r45fimIn9s+T7q1FXuShfJQkAPrq8rsazLMOqsSken8R3sXBeb86jbs9i/JpzohPJzj8ymyWAdsYSx13hIC96AAoOv4MMO8nOM1trxCH8JQGaY+bKuW+F0bQypwC3XlIWqa7a2V8tQToiCkOKUB9qVvWi3RvoutlY2zr28G+rVtqvLYgQD73OP7VS75TGKA2Z9TAnmocAhouNOr2tXS75sE4Is1Qmr3slaITqkwl5l0NQJUvxo33Pmd+QtzM5pQn1cZ48TCB23qSFKw5rLypVwEDvtxWA+tqs3TcHjetmM+AcZyZEKnQS70tdGWttpqepRsKGcASrquZNbnthpo/Ef3ZukRCDX8ic921M/JXh0SvkBTTDKG8+ToE0+OmUV91IRMccCU452H14aGr1HbGzuSdk1jSwxN1DcIzHueALdlEn7galDPa675eQE9odvKKG5IenNE2V/RdKi73WAbP9vFry6Ri/TWMp62bzVazM7UVCuVisX/l3P/hLX/pLak5U+W/A/cwYfMvP23x6umuzeNSsFo77QG4Cxb2UOZbKyx3ePq9UaepobVLKqm9b+jmFaH/OCU8T0N/WWnAxVbbzZBGUysMThsf6rCWnsQTKs263RuDQJK/1DKDAd9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 11:57:37.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a3bc01-04ce-4771-8175-08dc4e551899
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317



On 27/03/2024 12:39, Carlo Nonato wrote:
> 
> 
> Hi guys,
> 
> On Fri, Mar 22, 2024 at 8:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.03.2024 18:31, Carlo Nonato wrote:
>>> On Thu, Mar 21, 2024 at 4:57 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 21.03.2024 16:04, Carlo Nonato wrote:
>>>>> On Tue, Mar 19, 2024 at 4:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>>>>>>
>>>>>>>  Specify a list of IO ports to be excluded from dom0 access.
>>>>>>>
>>>>>>> +### dom0-llc-colors
>>>>>>> +> `= List of [ <integer> | <integer>-<integer> ]`
>>>>>>> +
>>>>>>> +> Default: `All available LLC colors`
>>>>>>> +
>>>>>>> +Specify dom0 LLC color configuration. This option is available only when
>>>>>>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
>>>>>>> +colors are used.
>>>>>>
>>>>>> My reservation towards this being a top-level option remains.
>>>>>
>>>>> How can I turn this into a lower-level option? Moving it into "dom0=" doesn't
>>>>> seem possible to me. How can I express a list (llc-colors) inside another list
>>>>> (dom0)? dom0=llc-colors=0-3,12-15,other-param=... How can I stop parsing
>>>>> before reaching other-param?
>>>>
>>>> For example by using a different separator:
>>>>
>>>> dom0=llc-colors=0-3+12-15,other-param=...
>>>
>>> Ok, but that would mean to change the implementation of the parsing function
>>> and to adopt this syntax also in other places, something that I would've
>>> preferred to avoid. Anyway I'll follow your suggestion.
>>
>> Well, this is all used by Arm only for now. You will want to make sure Arm
>> folks are actually okay with this alternative approach.
>>
>> Jan
> 
> Are you Arm maintainers ok with this?
I'm not a fan of this syntax and I find it more difficult to parse compared to the usual case, where
every option is clearly separated. That said, I won't oppose to it.

~Michal

