Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0E7E2B73
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 18:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628248.979488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r03hk-0005Cr-US; Mon, 06 Nov 2023 17:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628248.979488; Mon, 06 Nov 2023 17:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r03hk-0005AN-RR; Mon, 06 Nov 2023 17:48:04 +0000
Received: by outflank-mailman (input) for mailman id 628248;
 Mon, 06 Nov 2023 17:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fhL=GT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r03hi-0005AH-NK
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 17:48:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f7cba29-7ccc-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 18:47:59 +0100 (CET)
Received: from DM6PR17CA0008.namprd17.prod.outlook.com (2603:10b6:5:1b3::21)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 17:47:56 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:1b3:cafe::d4) by DM6PR17CA0008.outlook.office365.com
 (2603:10b6:5:1b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Mon, 6 Nov 2023 17:47:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 17:47:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 11:47:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 11:47:54 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 6 Nov 2023 11:47:52 -0600
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
X-Inumbo-ID: 9f7cba29-7ccc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6Okd9k2Bu+ub8rn5Fz9yMmBgchVsQHuAZrZIjFegV5oWeak/g9fdYd7dCRfkwDSQN/RmnSbjScqRNRHmisbholjogxNsExrugjGIlmX8PFSQ8HVytN4uXnclriM9FdBXw+AdXC98ri0fBaeTO/0qlBTvTTGsllO4MLVGMCp/UYBtUl2rJ3JDZ8tfyWJVWgaezDU/DvxdNbarVxLTHoen03fXRZ8hEMJ6eh2FsWQze0YA9FBOQRELm1J4mM6VHXmvaUR2vdAT8VTqW0qgXf49mGShPkBF49rNwlmXjqol9ulOgBXl3xZqWJvawm+ijccjQWIj1aexQ8T8jZih0/kMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx8pDRogpcYqms54K2gsyznF472DXVcc//V/df7+vAk=;
 b=DePEPe7bTaQu5IUNQwXzxA9C8fz60Y968QKWYvs1P8WN08Y6CBJpY3cp4uTkoZ29YWS5L6CaMcT0Miovx04IbCcpKFKRAnxhdUpG0WAEFLTrwv7vKFVKfilu+D5TiTBOrFGEYIxU/d8umJn2wVQ5nZxJMQqgDoyxHJsSgvsntMZCsQILiYwiw5AM0yXdhI0cZGcJ4Z/rbo7niiYJAgSbCL6zl3a0SiBrkDTTGoBQsRM+HBZ8qym/8Esi0hkPJxOUxXPNWgx9yRPivAZKxN5kPCFyXhGUuQ4jGFehdKTK4M++WE7ak/D+PRv/hQPDk83D1Fg7hpZ+b/WEIk13WnbQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx8pDRogpcYqms54K2gsyznF472DXVcc//V/df7+vAk=;
 b=ZBN/QyNZiqy2eo7/+kV7ymDIhynxFg227lRVrSK5zYjBIzOru41WTdh5PVLJgttJKuK5kLwKjTJ25WOzveM2DQ2plf2K+1+V4XbZryiCxhkySIlTlEoOlwJCL0a6Xe8Tr8ZoHH4rYpj/1uvCvtD5YjygjTYpAEwXvC2PkoysotU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1b5b4c60-e6b9-4f89-bafc-1410be9a8f3a@amd.com>
Date: Mon, 6 Nov 2023 12:47:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] Revert "xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>""
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Wei Liu" <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-9-stewart.hildebrand@amd.com>
 <2f802877-1d89-4d28-9f47-a13e7cd277c0@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2f802877-1d89-4d28-9f47-a13e7cd277c0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1faecca8-3a47-4be4-fac3-08dbdef081ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rpCFaLzcqN/TRmyH0VAGbPbIE1F8Tp54rg/Qx9uIr2IGKI/1ZswPNMauSRaHXkn0qF3kg7cvoq8D5TeRAx4+di/C8fMjw3PW+CSTNwU66NodmQT+FWVJOdatxjA85DLf8GfTgXgmNs6r8TQbN1KSZyZo5O4kYSSxrUH74JxSq1j1Qibhm7l6ulSdd8xv+Wb4gOAPcCLQXI2SAmobbL9qdKG+r1tTXcJIGNR7Vx+vDUsfImDQuT/IwiLe9AT0vBeOcsuNx1tSFnKcFLuWQ/RBvrwHDydN9/IURgkjpJQxsyLfVHJ/ziPYdTM37xFUb1djUdkXGM+avnIB/2LZvOg75h3OG3ASKfqXZenpapSCWYmemFSmHFRSoOL/AX1RWCgkuT5A+ni7Lve5LobCm4kQN+DIta/LXRvsvfHH63AGpLaaMR5B/V750H2Jn3mfHylnF1f5bnwrnXwQalho24QL/exUgCwAG1ygEO3n5W42GlL0LNUKoQembw8kJQjEsvpV+LkT59WOZ6UyF6qXStZwhwBj2zGA4N4A8KWLsFfVdngX84ltUv/FCvvW4WZyU0x5dEbY1gqfU4dpvI6LE3BLoKDjjeC2zCeocHsCn5aurkl9+NSdCV/4CRlfHGfq1NNKiDbSEtwMOnkLalVZchaKyKFuoauwcxgagZ97ied64gnBgAxAZMTQtTQ5yKbW+hdOCm0JXGzo+w7JFr8CqMvFA+VXPJUw30IdV/6FRwY/yGZo2d5hnqjKlBkHQ91DL12Q/NGlTU+DnbHMQQGiCmXaKGPA52DqilUsnxhTYPE5+Zr1TzcQ9IK3gfYIylN9ufQt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(46966006)(36840700001)(40470700004)(8676002)(44832011)(2616005)(426003)(40460700003)(336012)(5660300002)(31696002)(70586007)(70206006)(82740400003)(26005)(478600001)(36756003)(54906003)(16576012)(110136005)(316002)(53546011)(4326008)(40480700001)(2906002)(47076005)(4744005)(8936002)(36860700001)(41300700001)(81166007)(86362001)(356005)(7416002)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 17:47:55.3840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1faecca8-3a47-4be4-fac3-08dbdef081ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

On 10/20/23 14:13, Julien Grall wrote:
> Hi,
> 
> On 04/10/2023 15:55, Stewart Hildebrand wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> This enables us to use IOMMU + PCI in dom0 without having to specify
>> "pci-passthrough=yes".
> 
> IIRC, the goal was to also allow to easily disable PCI passthrough (IOW
> vPCI at boot time). How would you do that now?

Right, a full revert would not allow that. I'll drop this revert/patch. Instead, allowing the PHYSDEVOP_pci_device_{add,remove} calls and xen/arch/arm/pci/pci.c:pci_init() to succeed in case of pci-passthrough=no looks like it'll work.

> 
>>
>> This reverts commit 15517ed61f55be6039aedcc99720ee07c772ed44.
> 
> Rahul's signed-off-by and yours are missing.
> 
> Cheers,
> 
> -- 
> Julien Grall

