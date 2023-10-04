Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555E7B87BA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 20:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612731.952797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo6I7-0005fY-BD; Wed, 04 Oct 2023 18:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612731.952797; Wed, 04 Oct 2023 18:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo6I7-0005dM-8W; Wed, 04 Oct 2023 18:08:11 +0000
Received: by outflank-mailman (input) for mailman id 612731;
 Wed, 04 Oct 2023 18:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo6I5-0005dG-Hh
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 18:08:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f769eee0-62e0-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 20:08:06 +0200 (CEST)
Received: from CY5PR17CA0036.namprd17.prod.outlook.com (2603:10b6:930:12::21)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Wed, 4 Oct
 2023 18:08:03 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::3f) by CY5PR17CA0036.outlook.office365.com
 (2603:10b6:930:12::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 18:08:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 18:08:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:08:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:08:00 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 13:07:58 -0500
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
X-Inumbo-ID: f769eee0-62e0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXT3wynQHnCUdWwQgJh69eP9VFU3/TBJ4XCVgsEkv1j042KGqgK+ybtakkjHj7T/eY54xvpJgRzPR0rbpSmHgnufXuRCDBXAgJdfSH+m91m3OI/fn9cDIhA+e5jGtAIIDdChZXoD8drfcdNj3KSzLAV0Atn3A3yrC/gnEDmnOpyk0kZ9xWyB8zfkwB2lvJu5VTQcqagaeywp4xi0eQVkK5a4UqdzqngK692hnWbyEmJ6J3Qx+45V/x+dX1Ou/2KC4x0HCRKhnXR4iEfcqw9r7CrobIjGz3k2JAfJykDWU0uS0sP+fDrNyNVddeymGE4h1inpkwrJpAOul1Op7+x8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoGLjzHo3oDBHjI78DIiWEFQWIppBzzWA6UMUCz/GH4=;
 b=m5WV/dGJZx8Sje9pyPjz2E+hZiCwEViM8VpJFdwmX5aUVSl6LeLplYh3OMBPYLPphl5Nlc0JhB84xV4o3VzGG2suXRvnW5MAzzBtrKlZFs6UHzw140NU/GkyoU9i1KO9o+R3BWRWqW3nXXycz2U6FET5kacq0pebR9JLdJ7XjxTbHvrnS1FgdSbapNvrxUtH2T9cVIiIVOsKOsLZnR6NhfVRalXG7ja2Pf/expEVjVqmrLJuwuwIWxcS3ur8fG29Yw5dgDqbRZ5NNoDjB1ULR7/1dCEimTm/OMOSgdKtKM6V8dj7A1tUzXvuLW8cenARIA9Goe0Vr6W68g844zc1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoGLjzHo3oDBHjI78DIiWEFQWIppBzzWA6UMUCz/GH4=;
 b=uJOP+p+Tc7QEiKMoCURMpcLEJp6z4Q/yRPkU/Ywpect40jWI1DZq1eFIvluJLDYzVjhLlNFs0INt7NUmZLGT68wx5isExnYfQc+hRFwkZxvjOpz9AhEgMqNcHZM/0f1kRPNuRhq+jza4TQQSy+Vx9aqNlDg4odNgn4Ud6ketBs4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f424263f-592d-f232-8d49-be84416db3b7@amd.com>
Date: Wed, 4 Oct 2023 14:07:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
 <041323d2-9114-328f-40c6-f5fed60892a5@xen.org>
 <1a8d7024-f881-a3f4-c575-240fb393555f@amd.com>
 <2053098f-5311-89ec-294a-aa731f2b01e1@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2053098f-5311-89ec-294a-aa731f2b01e1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: f0352d51-9c2e-4f7c-6bee-08dbc504d9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvqXm5jBdfIPLtYnmFzTT2Nnf9vp1sXTum2iW5oQkpdiovM+yE6rHztVZTdlFuqvPZrGN3wsuDYW7BVxPehd6DhHbj5MMv5iRMQKVY6FLMLADMZZCRo+DMcoJ7w7X6lAtnxP6a5SpD+xpp2bM1sTckOKcwBOPQkPq3XfnD2DHtJEYkI38WvsO4LXSJVdhJHHO324HqypEm1yNcdUUVN/lR9vKbLkJ1KKM7cJimaqrtE9Y5WTW/lLzLf3ognuN5MF/eMhu7eSrsss2bTz/FIuFQWYcSPnIgaHOf0D7zUAfl/WLYRWemgU1HoxqBn3cLKWaEgbJbOCU/jV6+BBm64IhD8AT89SwwbdSNIGpK3xbIP8Df9bdn5ObDh2Nj+srJj3nfQVeGDcFybgljYW7/+VJhaUOF0ou+dU/lBXSW/YKGllDgDUSL1nUt1TS4CazBf4ZM6lydWjtBf74MDgvRd/zR9fsfUv+ufdm0uAhl9+BIGNhPm7LsgBYI50kg9poGcflbONWbVbDLM48JYRyKuwyRxpk7kkGhVEbA3jXTxbY+I5EC5UxqCcpM2AL2znp8BPAOIbLsuWr6RO8c5fqcq96pyeEboyoJv44pWXqENK9PEedrCkxrHwlL3VBQN5thLTeMY/pScA/7xHADKQlVM+U8gKR6DIVMaag4v+boR9C9HYRZhaKPb39RpIVnHgspd/sCVjDifY4bR9Kr1kjMzXnC0wtyKJNzIJWre37A4KHQ7fCUZ9VAlAf5EbiIpkSbwAqNwtKxT3VlQwTlsb5Ei08jcnWd3+Ogv1hak6QXcUo3k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(46966006)(40470700004)(36840700001)(31686004)(44832011)(5660300002)(8676002)(2906002)(4326008)(8936002)(41300700001)(70206006)(70586007)(2616005)(316002)(16576012)(40460700003)(54906003)(110136005)(36860700001)(40480700001)(26005)(336012)(426003)(6666004)(36756003)(53546011)(356005)(81166007)(82740400003)(83380400001)(47076005)(31696002)(86362001)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:08:01.4576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0352d51-9c2e-4f7c-6bee-08dbc504d9c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

On 7/20/23 05:20, Julien Grall wrote:
> Hi,
> 
> On 18/07/2023 18:35, Stewart Hildebrand wrote:
>> On 7/13/23 14:40, Julien Grall wrote:
>>> Hi Stewart,
>>>
>>> On 07/07/2023 02:47, Stewart Hildebrand wrote:
>>>> From: Rahul Singh <rahul.singh@arm.com>
>>>>
>>>> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
>>>> the feature is not yet complete in the current upstream codebase. The purpose of
>>>> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
>>>> testing and development of PCI passthrough on ARM.
>>>>
>>>> Since PCI passthrough on ARM is still work in progress at this time, make it
>>>> depend on EXPERT.
>>>
>>> While preparing the patch for committing, I noticed that HAS_PASSTHROUGH
>>> will now allow the user to select one of the IOMMU quarantine options.
>>>
>>> There are three of them right now:
>>>    1. none
>>>    2. basic (i.e. faulting)
>>>    3. scratch page
>>>
>>> The latter is unlikely to work on Arm because we don't setup the scratch
>>> page. AFAIU, for that, we would need to implement the callback
>>> quarantine_init().
>>>
>>> I would expect 1 and 2 work. That said, I think 1. would behave like 2.
>>> because on Arm the device should not be automatically re-assigned to
>>> dom0. I know this is correct for platform device, but will it be valid
>>> for PCI as well?
>>
>> In a system with dom0 where the guest is created from the xl toolstack, we rely on "xl pci-assignable-add". Upon domain destruction, the device automatically gets assigned to domIO.
> 
> Ok. To clarify, does this mean any DMA will fault, the same as for
> platform device?

Yes, when the PCI device is assigned to domIO, any DMA from the device will produce a SMMU fault. The value of the quarantine= option doesn't change this behavior.

>> However, there's nothing preventing a user from attempting to invoke "xl pci-assignable-remove", which should assign the device back to dom0, but it is not automatic.
> 
> I don't think we want to fully prevent a user to re-assign a device to
> dom0. But we at least want to avoid re-assigning the device to dom0 by
> default. After that a user can reset the device before it gets
> re-assigned to dom0.
> 
> Cheers,
> 
> -- 
> Julien Grall

