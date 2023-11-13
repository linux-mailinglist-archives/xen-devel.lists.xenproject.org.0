Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489137EA06E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631741.985394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Z8N-00056u-1W; Mon, 13 Nov 2023 15:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631741.985394; Mon, 13 Nov 2023 15:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Z8M-000552-V9; Mon, 13 Nov 2023 15:45:54 +0000
Received: by outflank-mailman (input) for mailman id 631741;
 Mon, 13 Nov 2023 15:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUCv=G2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r2Z8K-00054u-QC
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:45:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e89::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c60e4a-823b-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:45:49 +0100 (CET)
Received: from BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::15)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 15:45:43 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::13) by BLAP220CA0010.outlook.office365.com
 (2603:10b6:208:32c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 15:45:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 15:45:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 09:45:41 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 09:45:39 -0600
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
X-Inumbo-ID: b6c60e4a-823b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFbtYXr+nhqj9JltphGKRgtY5e771GZKq12XihcEU4WIbyrcNwKsQVz1EoJW1lbQYr0uiFUgMXtGKn2fhJcpH4rNpzkPe5e8yvWdbzEkQDw4CzlchLl1kSw43IScNYeQgMP9sGrFkgGELh5BrKr2r6inRowN0qUWUWXYVdsTSaxg4oM4yPXggH74+q9s0bwoWTM24goEJ3e93nQERSJUAhWAZLbVpvWK3Jf3tMkVq4Lv5Z4jV5I0polBYZnkEcEK1hL9w9ia5zZWSRhyU767kQAwVX7G3VTLvZ8/dagphSHBbLeQlr5XJ9mb9icjTA8B13+5vwMsC4XfiCi1mfx68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ3iVtCuw7LHIp5q2i34h3cMVfXC0ZsvJqh/O76MLeY=;
 b=IzH5EZ0IKje0pPyuDrBZYmIR79C02WhN84k37UC0f6Nc9S/TTxfLvj2JqZkcK1kG/PR88z8VXZr0OUrARuGv9oO5vxHCHhe2oFS9Sddzibb+RlbrW+2jv/RVfEnD4+Sw1yEecEdCNg1njCm9J9oKHk/yto9ZSXt9V89zxlZ5cAiE6hu1Lgl1/nUXq6Sb8DsSx9HkxVZwJ3G6qFngggy+Azp0T+HoTNUAP5K/7xFoH2Z/4zZxZveFI89c0906mASr5U0vn1rd01NMpZM6ntHVz9gqPCtmIDu+zkUbHldLhMGzuG3R+mjybyCjnOtVCiSL+Z00+thLNHlODiOisEQNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ3iVtCuw7LHIp5q2i34h3cMVfXC0ZsvJqh/O76MLeY=;
 b=npfyZxicgDlOKCvR6dT0Kw31Wxo0iS9k2JKQh6EAK3DAgYLOfqvtH/D8lemn3M49Nruqd+yNPqkPD1g7XkCzpXSbs/4IlERHEm3ph+u/d96tCErRZZp7TJ36dt4H56H1nIODLaA/Dj4QlM59/PHOJkZDCo5x7ERO8l6MZBOWLS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dc874a3f-e7d9-4c8c-9359-f5db191346ca@amd.com>
Date: Mon, 13 Nov 2023 16:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231113090841.595428-1-luca.fancellu@arm.com>
 <20231113090841.595428-4-luca.fancellu@arm.com>
 <8a4431da-7e48-4b71-9f62-154edcc5968c@amd.com>
 <91ACC322-B543-4675-BC56-D8D284BC7CA8@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <91ACC322-B543-4675-BC56-D8D284BC7CA8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5523b1e3-b929-4ac4-261e-08dbe45f97fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kHRo7okbehALxds2+eZtmpkFOtJn+hxSOSkucdM8jYkfXuo9YDmhRfkkRjxt14H/FNDRSELmpjN8lTPk9sbOT1CgtTDDiSYUt1UdD+mAdF4d+YGXmPjl0VKDAlGsRMlaZ2DLa/yQ3D4SowrW8UZ/RJzs2QSfGx7eYPyzAn1qSCA5I7HdpTLFhbpDwJmfLdUEG69XOHI/FfhfZvVcwCKNUmImeNYmkx2VhErt1P6ped1ivYHusPiVlJxNSHaUHNgyxRceFOXyTOra/Li1EDhF9u+ka/CpAmIFIC+ZBG2qOPAUyeGWKc8/U7H2k+sHQFgrV6yUUJKqSnqdlAfCvo1NieyzCaIKtv8mrWQGb510buWpDIu+ptXVhKx59JJKhM8sslWLinbNWs3EeDBOpnZPCzof9xGi+JBcAazN242m4je+mI1KN0o6FYx7CKRs9f6oW7JQZcCBX+0XITOR2C5l/MAElXp56P7DwC3ZEE20qUBVFAK/Hl1xFgEex7yrp9SvT1DwZxzqVrSLogqPdrtL8aBttVq9WhDFxsXBzVO0PmC/KYxVS6NFBDXg6s+WmwaWMvLmJ5VvWJugcdSaeWfwdabfKaMrEufdd53YFArjaPGCvucbtu3yK91KJB2cktMsjyO7ulpWvPh/bH06nNvNdj5DIJU6gOkyb8HVU0kLOVNsXsMKjQYTa1IRHBbrkuxNppFgwBCFgfVURYbuzJayl4be4xhvNCfa6WivOY2fW1dIop7vTUfJ/rb+N0PnnMtnRut7BooBinibtTeyMmipx7ASZwjBgrgJdmtSvxn/20vH+dDT+aS6tg6//ETRZUVkMTmcnFqF8AiaYy4aJG9kqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(478600001)(81166007)(36756003)(356005)(53546011)(336012)(426003)(47076005)(16576012)(6916009)(316002)(70206006)(70586007)(54906003)(31686004)(41300700001)(40480700001)(83380400001)(31696002)(44832011)(4326008)(8676002)(8936002)(40460700003)(5660300002)(82740400003)(4744005)(86362001)(2616005)(2906002)(26005)(36860700001)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 15:45:42.4027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5523b1e3-b929-4ac4-261e-08dbe45f97fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840

Hi Luca,

On 13/11/2023 15:17, Luca Fancellu wrote:
> 
> 
>> On 13 Nov 2023, at 11:58, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> Apart from pending question on static event channels code movement, a few NITs.
> 
> Related to that, it seems to me that this part can be handled by a separate patch/serie from
> this one, moving code from domain_build.c to a new module, so I’m wondering, is this point
> a blocker for this serie?
My recommendation was to move it to dom0less-build for now if we all agree that it should be guarded
by dom0less. That said, it is not a blocker from my POV. I can handle it later on after your series.

~Michal


