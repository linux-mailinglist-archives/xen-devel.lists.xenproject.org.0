Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A295B71FAB7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542956.847439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yug-000803-PG; Fri, 02 Jun 2023 07:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542956.847439; Fri, 02 Jun 2023 07:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yug-0007xT-Kw; Fri, 02 Jun 2023 07:09:30 +0000
Received: by outflank-mailman (input) for mailman id 542956;
 Fri, 02 Jun 2023 07:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4yuf-0007xM-2f
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:09:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68c08ef9-0114-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 09:09:26 +0200 (CEST)
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 07:09:21 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::dd) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 07:09:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.18 via Frontend Transport; Fri, 2 Jun 2023 07:09:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:09:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 00:09:20 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:09:19 -0500
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
X-Inumbo-ID: 68c08ef9-0114-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbvwT0Ji+TumX+WJvb6StShDmYPR51rnP0y0gJJYdguRt/XiudG5Ra0F8Sjt7s6NyNRzg8gKj79YSSjhwvaRcNPpbjLJhyvyYIVX2GCSEh3pCFexEHLwfUJFlt/QcsSU9eNCCNjvEpq6Hs7oPdlo7xpgOrSl20Q+CyJ/l7UFh6sP765yNfKkfjhSC+5DfH1hyW/Xg+24qyky2Uqkve8apsVdicA5DGUeSnUrx3IoXSPCoovoSLEmnjNsMCjliGLQsdPv6pSfPenZ40OwwXSwQnivbbzXU4NFo3Qny+Y8MNMUAw+xT4+6hP/PvQsyGYMWBO8bsfcS1/7V8McAsHXZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpQ2ws80CQNTUwzp0GOLgnlRBVQVxMNSRqvNtb6G+5c=;
 b=iRVJB0Ie4MbMWDLv4KschkqMz4Va24PFHskgE+csHxl4rVea7RPLrOcptavXVEX2dxOozo/+Cc9U36ArUilWynZBMBx/T01zQNqIZ4A4tkSr3+oCjTxByEEeqYMp5rQoRyb0ma3nakDdh3hV3au2nCo6HbAG5+evBk46z4wcIhDaul8HoYABmcdH41/KtKkiqSorGMRfKyU7xBSOC3bxtPfQD9ledoC2aj4mRH7WOjJiuqvG3X+5SzObRGPU+Vie0T8kcaYrIpg0WpYPLlJX/gDTQ7K3dKr//Si2oFpkaYlGsTYgP4cUD/6KMbt9qwui8/Ymg9NUkiUesPdcQD4WyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpQ2ws80CQNTUwzp0GOLgnlRBVQVxMNSRqvNtb6G+5c=;
 b=eSl1YzW0GnLmtIHAV21IafrdhRwdkAzHHmj1KFeNwDC+Ok1mHo5Q4P7vD9xYEaE2ltTFgiaXePoYPhu2qfcDgOArVRkVJ3FQTnt45zCmmgE4GcsT7M+/EdRzckS6TBEQTDI9hDHkV+MoJMiHM45NwpmF0xM+rj+ux1X4ZrudnwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ec66d4ef-0093-45cd-9c9d-de870f6210b2@amd.com>
Date: Fri, 2 Jun 2023 09:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 01/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-2-vikram.garhwal@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b87fb8-b128-4b3f-2d2e-08db633849d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oeo23ejUX3zn2LKf6aBPpm7G3npI5oyux4KNbXgiYNKqPzkD5hN55YdUflaDUUcPRPOd/iBxuC4Ktuq/nIcC8H+kGTH+4TXAwrpkYw05JPPGtxo/yr2a+tC/K8JBNBq6kqmUG5bsMpzLt59kazYa0R8Hpxn6fMRQ+LpNzQag8GEsCa1zCHSupffAaIclxSwC9K5s4XuHfUesPwVsimg6bVPUfBDBJgJwVUnM846+66XteaIBL87cpTuMdhY5xnPYd0z4Jr2cIGjzYwch+J3DOE61Nft8plLr5oclTX+fcHjOyQb/ILMJIU+4QdWy1ZZLNC664Z8gLSKQ1G2fw40m4NaycggvgPKj/19D/OYmqwKcpnototMEFk8O/SSd0upMCDiSbA9xRPXm2W4RR4Lpf44MhO0KLazWtCX5JsrHzd8UA5v0cxxkSohzRFRq/1vl4AHrrphO9FOSOntel+o6QxHqopQjC0upAGoPuaE8noolc/vqyRf2AJlb9XfWy6MO6XdvLXLMur0wjssk+dN4aiQ+3YlwQdhABhaTqANwbvxh3/gYiWMPrDy0vV5gjhu43OcIibdUz1O4dZgL1W20j1hhjLLsx7kBtlIg9jgM3wFfrLCq6Jskp6/K5bS0KxRlCzihkc1mwCk+nBVveTIeNZYTXjRKQx8JJjBKa0bXVz2+yWXkQjopvZXjZ92VUn3ITXhRjeUrky7p8eZg/2R5/Hoy9tskcLYEJcSbsRgeBBOWzXwrQGVa4DGxSH2z/Fsx7nuGyvmYgAYVs07A43veQD+Sj+P00NFth964Er6EvqI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(478600001)(36860700001)(186003)(336012)(83380400001)(36756003)(53546011)(426003)(47076005)(86362001)(31696002)(82310400005)(2616005)(81166007)(40480700001)(356005)(26005)(82740400003)(316002)(41300700001)(4326008)(70586007)(31686004)(44832011)(70206006)(8676002)(4744005)(5660300002)(2906002)(16576012)(110136005)(54906003)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:09:20.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b87fb8-b128-4b3f-2d2e-08db633849d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919


On 02/06/2023 02:48, Vikram Garhwal wrote:
> Change __unflatten_device_tree() return type to integer so it can propagate
> memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
> memory allocation failure during boot.
> 
> Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
> 
NIT: no blank line here

> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


