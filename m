Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2910182BC8D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 09:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666700.1037496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rODLC-0005x3-Uy; Fri, 12 Jan 2024 08:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666700.1037496; Fri, 12 Jan 2024 08:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rODLC-0005uP-SA; Fri, 12 Jan 2024 08:56:38 +0000
Received: by outflank-mailman (input) for mailman id 666700;
 Fri, 12 Jan 2024 08:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12w8=IW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rODLB-0005uJ-Iz
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 08:56:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7db1691d-b128-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 09:56:36 +0100 (CET)
Received: from CH0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:610:b3::9)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 08:56:32 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::51) by CH0PR03CA0034.outlook.office365.com
 (2603:10b6:610:b3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 08:56:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 08:56:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 02:56:31 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 02:56:29 -0600
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
X-Inumbo-ID: 7db1691d-b128-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbxafc4Ez7I9mOY98c4UbrPlITg8wsEXutj9mjZZ1TAZudrB/AUFRTxZ+3wEzPMQP0lBbfrhG0c2ZkACebDAZP2s1u5zB6v3LnA5Wrt/sYLPNgv+iZJQEaryWSI0XFfUkAOKP9Ttcv8+obCt2YJtoUbTojP9BCcqCbVyW6BWcxaeLdHscOMewvnFbJCzPTEzBYAFOLEhwQBy9rigNBgV0cLXK1CTGpaKxCLDAKbymuoCHjozwBuYCvzoZ+aehfXQO3UCKS+i/NiUPQz3Z30Zso6LxoTwf0S6Llnrt8i1Y1sEPeMgwh8RETwMiv8OD1h6qd4QtyPRyb3b9UrmDN60eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isriwWgkS0R+B3UXi/BtYK/HMKHNBQgThZOOLE3xvaU=;
 b=D12Eh12Bi2/y3U5D1RsJgtiYxiUma1eL60zIgq+8KXOaZYWXisyjvbnOXWHBDmAyWa86nF4DYy6akt/hueb3AQLmXi+gd4Dwqut6R25ogX7EywaeOrZWSwrmlhrDCWDbOfI3t34e0iPnuqR3zGiB9UXn1Vo1ldY9gjdzv9DiRBxO6U1yIvlsnIw1bsbFaiv9PuZPkfqbE7Ut65ZXWtNdGMz2eyN2f8LmN83Dvd5c1quPx+go812NjvPAiaKvhUZrassMvlN8+AY2HW/so2QB4o85ElgZYjtcvUIq6qeri9dWqHC28x1DA7MbFBCnmyp7pU7t1jYk9kgHCs/shYNQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=raptorengineering.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isriwWgkS0R+B3UXi/BtYK/HMKHNBQgThZOOLE3xvaU=;
 b=G8P4aFPQIHGLZzFEGjuzUrpNrakEQHe3iPpVbZbee4EaUFakJzosioIuodoPLwwx6lXXHNV8nzXLV0u10tL4tyG/CH4QvguMULGvYdsIqATaqXKv2Kp7IebpJ9rYwg1Frumt8mEMZx4IYbwk+2uGy88dWeYxE2QGp5WXMidfnuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <62bb1962-6668-4243-b41d-5aca5d3b7ecd@amd.com>
Date: Fri, 12 Jan 2024 09:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: bootfdt: Harden handling of malformed mem
 reserve map
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
	<xen-devel@lists.xenproject.org>
CC: Timothy Pearson <tpearson@raptorengineering.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111232422.2610495-1-sanastasio@raptorengineering.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240111232422.2610495-1-sanastasio@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b26a03-23ce-4ac1-3557-08dc134c5f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2wtqQnhWPs864lWxxfX4eDXoaw2uKGz0oF29G7Pk3oc+IGU/1fsIsL/Ti4KSSAJpEQ8WwlQMpt/pCNlDlhivR7xOw3RVsARd4eI0fEtOxNf3MBZ46VwDe0Hf9D25gBCbIL+dy4cYpmv0lPt0EyXrjK7YIt5rEhsIGTHPuW6I8lks9CwB+TLaMJlNL/jGyxLJxK5+IkdAooQK9QHaf9K2zwGpkr7bUtvpFofv7fY0+Y/doq+j+1i3W6e+ZtY46kJZa2HS8vQpfS2GdGPR6lm3tF1PgObPQepwwlCNwH2PeogOktexCplKh0q2DRV8qxU+5WxggWAcLIFqF0Dk96y8vJ5FTxRFtMZ63r3d/eb2HGhk/28T9bHRF9g+vfzAdPBJOguEbdG/n3GuUrJMRat5HIi9ev0qOQM1r3mur+J1Mf5COZ+DtJEfecOvh9lmr3WKjV4S+x8j/Js8Zrr1PNeJuiYGk67zrVQIuaGiv780PUsDzVHBFTt5NjQv7WIZnb7tjdHfQy7nk+rX5dk4s4D7af+38yAjtvDMVDBkL4tXsjq236RxXJLTC+faP+dq8shDToadapAEy52mWs3e/ZL5mXrOMGRRhTBtT7ocIl3y2kqPVrweHt5EGY8z09E1h+z6W2h8/RZIByOp8rpWDzggbQqPRiQPQqVtQsp9UqXIIjV3vwlJhndwJqklUJJVM9Fi7vHvtji+G/4w8tvHdQ44S2tXBW+S7FHDMrVdeDf93XpYWutaMLp8peIQp/29ioG2ZYzHL0FDcoZZz/PwNde9MfvoSN/4FPSo/g1N2d24/P4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(31686004)(40480700001)(40460700003)(336012)(70586007)(36756003)(356005)(31696002)(81166007)(86362001)(41300700001)(70206006)(36860700001)(110136005)(2616005)(4326008)(26005)(47076005)(426003)(478600001)(16576012)(54906003)(316002)(2906002)(8936002)(8676002)(5660300002)(44832011)(4744005)(6666004)(53546011)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:56:31.9157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b26a03-23ce-4ac1-3557-08dc134c5f7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831



On 12/01/2024 00:24, Shawn Anastasio wrote:
> 
> 
> The early_print_info routine in bootfdt.c incorrectly stores the result
> of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
> negative error code being interpreted incorrectly in a subsequent loop
> in the case where the device tree is malformed. Fix this by properly
> checking the return code for an error and calling panic().
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


