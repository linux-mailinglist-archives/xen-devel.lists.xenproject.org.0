Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2087915C0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 12:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595057.928539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd6yI-000886-TK; Mon, 04 Sep 2023 10:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595057.928539; Mon, 04 Sep 2023 10:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd6yI-00085y-Qj; Mon, 04 Sep 2023 10:38:18 +0000
Received: by outflank-mailman (input) for mailman id 595057;
 Mon, 04 Sep 2023 10:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd6yH-00085s-M1
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 10:38:17 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f6941a-4b0f-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 12:38:16 +0200 (CEST)
Received: from SA0PR11CA0025.namprd11.prod.outlook.com (2603:10b6:806:d3::30)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 4 Sep
 2023 10:38:11 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::27) by SA0PR11CA0025.outlook.office365.com
 (2603:10b6:806:d3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 10:38:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:38:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:38:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:38:03 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:38:02 -0500
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
X-Inumbo-ID: 26f6941a-4b0f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyFoTEYqEVc2zRQ/nrRbUkvoVQjllobighRYZmhhL+mKh6R+8rVq6g44RFAMCn7UHhFFMIxxaEE8Jq7WPxH31LRD9Dy08n5wlMF8uKDoSX10uPvxPSC8SCNtWyMj0IbvLCQ8eg4Cn/jtj5Vy4Dgq9nM9axjgCVyvJxmx0FDXJovcJP5iiZv8kAFj7fCDOzM8B9YXUxT4VsozhWH3eaofihFk50J3xC2tc2k9smMR07nqG2CMb78gpLvwA0KuSv6NcPXdENiIo4aNqgFN3zDTKRwmltTmEgjC5Yk0m8p0ITVorqtyx/SMAPYcg+h0TFBw5y4OCmZCF0Kzmqf/v1xyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d5oVQokJaFdpMS/R67uh6fWE/X2RjazXQwSgFWrGBE=;
 b=hYVgm83QmFgEJvuFOQYfZodcnSzDRzR5sTiyALpelJ2sk+M4NZ2JRuMyER2+mBNDbhom1/fNuWTOj4aenUb0NgWDxh4/5GXg/gpUqcQFjqQ067LOLlZp7MSjH3zno84ibIHiRVJ+vsTZmIdrQchjr+GrKq/uqNCivHEorbiy085Fc+rZnWPxU7NFF4Jlylq4GVZvNk5/Cs822ma5oZvvLVGW6Oy5ZgObZSD4u0lNDMrSvnDHCqxfwRPa8ILC53aRU2ab2ChYG7i6u2Znu1h+8LPhRIIX/+bOI2fvuKzEVYXnt8JL33RzoyAXbn/3jxGLpqUbofk/tKMrBlBgSI4QCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d5oVQokJaFdpMS/R67uh6fWE/X2RjazXQwSgFWrGBE=;
 b=A9e+ywESnjIkQlUSh9TYYFq7UAMeFx08VbvCER2ztM85rOCQzUJGNwn6frEkdAcRU5hiC+deGvM33nY4rPHZfHWaiiNGDV1hwcI12ys4JZQ62rkGSMGxlpKRS6MWWi2fLyNXptKv6zS0xd0UIRLewiJW/TdK56dAGcHbReASlD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dca9c2b9-aeaf-3628-de2a-846e1b92a0c4@amd.com>
Date: Mon, 4 Sep 2023 12:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v11 12/20] xen/smmu: Add remove_device callback for
 smmu_iommu ops
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
 <20230901045947.32351-13-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230901045947.32351-13-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b8c441-d87d-4ccb-98c2-08dbad330925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bLhEAA6PZQjwb5fraJJ6q5hzDB25z1Ds4EMNMr19uYSVWqagduQNbeyopXz3ihwwv6GT3vIlz1uF0isyLYWAfaTTznVKmdP8foqYBXXGIdaWwXJj7hZ2PxZlnE3hGhK0cu2QGCROZPKMouU1BPOQZgwkTQXLlt6otreFc41oQCMPAfPStWZxp1sfKJAsl1wRjJCzBoFMzakdOXZbz5ip9p6DBdut5zIX2SGvpH7Lan0HTCnt+PkcqFaMlNeUgsWqQ/Vo1mvC+Oa0uJxtKYfYAdiv3blSxe9HTZGH6sPYBaM0lJSioNrALLfeFbCpU2d7PYttWkXDxkJTZVXwR+8zkUdKZ9JSVc7vgHXHWCrFV0AdXzhvDThPFuSpW1mEwaXMHwdE4y+QyZAv7NPJDMd0KTaXCHeaT6zAUEZW27IXZOunIt6Iu0Q2rDgIbuDTCTDyPBmX3kgAuk/uqhwuWtsI79oYEOGzwLk70GC35kidfK38qkD6/6WggDpZs33ZNP7Blunvk7kt5pTATRJ1MNHRpcJ5+xcnl51Zkv4jLbSzqFr4WLXMTCMy5xhkeUV7oH11OiD/LfK/6xa36ByTra+k8uH+Bp8CZvjPAjAD4MFlnIOpm8insbgLJALJnBhQbhn/CEWWEBpaZtyeKtaiWW3b6IQrQAXf5VeZKm8pSG8evhy3NcxAdE6WWf4eHj6Y3lIV8J9Oy5H8//mqVe0mKgJfFDdTJapo6sCy5ktn4izEaA2dS8VBHFSUBPnpQ0u7iJrf9yVnZAc7dn1dp1XlNsPMhAh+gwzVwWBnxRR5LLIRiNYi1Sa3aQryPS2DYkioZgV2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(82310400011)(186009)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(41300700001)(40460700003)(356005)(82740400003)(53546011)(478600001)(31696002)(36860700001)(86362001)(47076005)(81166007)(2616005)(426003)(336012)(26005)(40480700001)(4744005)(70206006)(70586007)(36756003)(110136005)(316002)(16576012)(5660300002)(54906003)(2906002)(8676002)(8936002)(4326008)(44832011)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:38:11.0828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b8c441-d87d-4ccb-98c2-08dbad330925
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226



On 01/09/2023 06:59, Vikram Garhwal wrote:
> Add remove_device callback for removing the device entry from smmu-master using
> following steps:
> 1. Find if SMMU master exists for the device node.
> 2. Check if device is currently in use.
Just like in v10: you are not checking it. I asked you to add a check following Julien suggestion
but you did not reply to it. Even if you do not want to add this extra layer of protection, you
should mention that you rely on a check in iommu_remove_dt_device() instead. You can wait for Stefano
to give his opinion (and possibly ack this patch as is).

~Michal

