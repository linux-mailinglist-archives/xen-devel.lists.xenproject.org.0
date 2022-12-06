Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC40644546
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:05:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454915.712494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YZV-0000gH-8D; Tue, 06 Dec 2022 14:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454915.712494; Tue, 06 Dec 2022 14:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YZV-0000dx-5U; Tue, 06 Dec 2022 14:05:21 +0000
Received: by outflank-mailman (input) for mailman id 454915;
 Tue, 06 Dec 2022 14:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiLW=4E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2YZT-0000dq-Kn
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:05:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a71288-756e-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 15:05:02 +0100 (CET)
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 14:05:14 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::3e) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Tue, 6 Dec 2022 14:05:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Tue, 6 Dec 2022 14:05:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 08:05:12 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 08:05:11 -0600
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
X-Inumbo-ID: f9a71288-756e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve9Nn3tyWuz92B+iGmIMMWxEggLXjmjx5cYf3efo9W9QDUiX5/gGuw6j8LPBIh/suvnxoasPdzxRS75CtRAHWD35URwNKOeJFInmTCk3Ppdi3aGgK6rApKUmqY7cZXxOVhHeYAcYESw2j0eQen32unW3LQszDTFRJoJnb5iNuUlhveTj+ZmFmr+Np38/nUOZ4l4iYFj3SGzbnjiJGNfsB3L9JenyFQk0kKou172zLR/2vBtQ/z5AY3SDuSbkLpqswEYrqxvo400xKKpAEd0pfaYTF6Oo7GU6p4oYPT5a6BwVn742/fpRODfUpLu/bIkaZKglt4yiEsA9rTbYkE25Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcAUhPy/S5Mr9wVdGuYBDm8qNnl/JIQ5QIVBIN4OJSg=;
 b=GbYnRbhKqu1OjZGN8rYLaLoJc/n2IqORWTrTr3ZNOmKHR63yrclVVvLFDUsC55zeQu2q9iueB+7RXcm4ew6Tma/YdWPFC8pqUpMcVrUo/1ZbvGvUMEiCCWA3l3QNqEpSjO0kPx4gQbPhR1ZLFE/Hv41OOds4OMKFBGcEWna17AiUooxwYDI1vnZQjLsJBiEd4mijbY+F5LT5vWJ6FC597Zdg7kTOQFn25RXCAksjpaybAWo2FMag0qPtz9sGl8ZuYryppwZrSPKaP/W7SuoxOSLSPcUYlHGnHAulfrGUxD2MooW2MNjYQv4u2mSv6dvtPa9/lHexEQFaNJRBDcaMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcAUhPy/S5Mr9wVdGuYBDm8qNnl/JIQ5QIVBIN4OJSg=;
 b=rJ1rkXd+zTmtR8NpVXNkh8qdcPtc6TSik+z1Z22RNlI3IDj6hELot4SPWUjouXoGPILMnpNLFxR3QMpdeXakJbLrguhL5i6qeN63hf1jun2MRjsakGMFBBNibhcnAJLsPst1mW5FaQPiWGvVg1IPGUB5R4+fdxlyDlNsLEfCqNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4adcb0d7-1f94-231e-9dc2-41dc3b45f949@amd.com>
Date: Tue, 6 Dec 2022 15:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen: Remove trigraphs from comments
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20221206105932.11855-1-michal.orzel@amd.com>
 <0bfa1b1b-7ae0-03c9-0291-5ce3f6877693@suse.com>
 <92cc2cf3-4c95-1395-be2c-d076fa5d397b@amd.com>
 <cf7f8deb-ec5c-c6ec-ba5b-b7099830fcb9@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cf7f8deb-ec5c-c6ec-ba5b-b7099830fcb9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: b331c1ec-abf9-4f50-5862-08dad792e577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vC6mPvcevBda/D12wjbRY9PPOuzEGSezjw8NoztuCJ7dSZkxj8DLC4gdvYogbsug9hl0xxF1pixjJlELRfYcz9iRDEOEWqn/ya4U+9bszrC2t/iT84OcqB5M/tMlI5dlBpKjNqkPddIF/pUqTVVxqkCE40dZM2aajiK8NyG9gNTrjm27F9MjcecWuC6fWDzFj/MT8D4wkYoT6/GjjLSp3FC9S6ec9uXiw6PGI3g2EGDqM6xGj/Z9ZmLj5CNp9TsnFmOww5ARwf3zJEIYrNHltKTtrEWhxoMObkyb3VCQmtZpz+gZ8q7eGa1dfToBB85sZgRuijxZdiD5xGaPngH0dj1wXBa8kpMEJwr9pQFt1pQRptAecsipRLd9/N1Dp4IPo8PW0oaLctFTxLsQAgI/qV2nOAVHt5w4db7vsBCSNfgOfzmEN6/z+8TJQhoSVUEuO2SHzsHaP5MrgL8Hl92xZXrYRWIe9IyfsLtAJxlGb+4lQCDzYq9izrznc5EmWL9QX2MOrwjVuqcooJKTuL//CYPkoeGwUMrrA4wun49ke9oO1oJT7DTTXdIaVxPPpMqLJzdx6ZVlEHMPDUzH87mUQBxywXShaggCElmBraZlDicQGCvRKOz5fC1EPybmVR/KayKsUOFdWUjZJc5WusufmHVPSXF3ffm9FDSxRPWuUXRpVErxTMqu4g6EzDS/Sz0FLJTj8w+TZaesj1bvF5t5XLAcmAcCT9xwfvV6xblSh3cuPspLI4vgRBl6RnUrb6CgfYFw/Lk6LRQAZnPsS0rTcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(2616005)(426003)(47076005)(82310400005)(186003)(82740400003)(5660300002)(8676002)(4326008)(36756003)(86362001)(336012)(83380400001)(70586007)(356005)(81166007)(478600001)(31696002)(40460700003)(40480700001)(54906003)(26005)(6916009)(316002)(53546011)(16576012)(36860700001)(70206006)(2906002)(66899015)(31686004)(44832011)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:05:13.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b331c1ec-abf9-4f50-5862-08dad792e577
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176



On 06/12/2022 14:46, Jan Beulich wrote:
> 
> 
> On 06.12.2022 14:05, Michal Orzel wrote:
>> On 06/12/2022 13:42, Jan Beulich wrote:
>>> On 06.12.2022 11:59, Michal Orzel wrote:
>>>> --- a/xen/include/xen/pci_regs.h
>>>> +++ b/xen/include/xen/pci_regs.h
>>>> @@ -246,13 +246,13 @@
>>>>  #define  PCI_PM_CTRL_STATE_MASK      0x0003  /* Current power state (D0 to D3) */
>>>>  #define  PCI_PM_CTRL_NO_SOFT_RESET   0x0008  /* No reset for D3hot->D0 */
>>>>  #define  PCI_PM_CTRL_PME_ENABLE      0x0100  /* PME pin enable */
>>>> -#define  PCI_PM_CTRL_DATA_SEL_MASK   0x1e00  /* Data select (??) */
>>>> -#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000  /* Data scale (??) */
>>>> +#define  PCI_PM_CTRL_DATA_SEL_MASK   0x1e00  /* Data select (?) */
>>>> +#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000  /* Data scale (?) */
>>>>  #define  PCI_PM_CTRL_PME_STATUS      0x8000  /* PME pin status */
>>>> -#define PCI_PM_PPB_EXTENSIONS        6       /* PPB support extensions (??) */
>>>> -#define  PCI_PM_PPB_B2_B3    0x40    /* Stop clock when in D3hot (??) */
>>>> -#define  PCI_PM_BPCC_ENABLE  0x80    /* Bus power/clock control enable (??) */
>>>> -#define PCI_PM_DATA_REGISTER 7       /* (??) */
>>>> +#define PCI_PM_PPB_EXTENSIONS        6       /* PPB support extensions (?) */
>>>> +#define  PCI_PM_PPB_B2_B3    0x40    /* Stop clock when in D3hot (?) */
>>>> +#define  PCI_PM_BPCC_ENABLE  0x80    /* Bus power/clock control enable (?) */
>>>> +#define PCI_PM_DATA_REGISTER 7       /* (?) */
>>>>  #define PCI_PM_SIZEOF                8
>>>
>>> We've inherited all of these from Linux, and I notice Linux still has it
>>> this same way. Ideally Linux would change first, but I'd be okay with a
>>> sentence added to the description clarifying that we knowingly accept
>>> the divergence.
>> This file already diverged and we are not in sync with Linux as well.
> 
> Of course - that's the case for the majority of files we've taken from
> somewhere. But a Linux patch dropping the (??) parts of the comment
> (perhaps once whoever had put them there convinced themselves that the
> names of the constants and/or the comments are valid / applicable)
> would then no longer apply cleanly if we wanted to carry it over.
> Hence my request for amending the description.
I'm totally fine to add an extra sentence.

> 
>> Also there is no functional change being made by this patch so it is ok
>> to change Xen and not Linux in this case (which has quite a lot of trigraphs all over the place).
> 
> Based on what criteria are you saying this is ok (unconditionally)?

I said that it is ok to change Xen and not Linux because this file already diverged,
so we cannot assume that future backports will apply cleanly. If we change a file
that did not diverge, then we are required to modify the origin first and then
do the backport.

> 
> Jan

~Michal

