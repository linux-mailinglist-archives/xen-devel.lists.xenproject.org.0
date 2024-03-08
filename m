Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C3875F41
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690141.1075887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVQs-0001nY-5x; Fri, 08 Mar 2024 08:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690141.1075887; Fri, 08 Mar 2024 08:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVQs-0001lc-3R; Fri, 08 Mar 2024 08:18:22 +0000
Received: by outflank-mailman (input) for mailman id 690141;
 Fri, 08 Mar 2024 08:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+fI=KO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1riVQq-0001lV-Pp
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:18:20 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6adf07dd-dd24-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 09:18:18 +0100 (CET)
Received: from CYZPR05CA0025.namprd05.prod.outlook.com (2603:10b6:930:a3::26)
 by PH7PR12MB6979.namprd12.prod.outlook.com (2603:10b6:510:1b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 08:18:15 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:a3:cafe::c2) by CYZPR05CA0025.outlook.office365.com
 (2603:10b6:930:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17 via Frontend
 Transport; Fri, 8 Mar 2024 08:18:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 08:18:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 02:18:13 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Mar 2024 02:18:12 -0600
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
X-Inumbo-ID: 6adf07dd-dd24-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWPc4cajZmRnA2RhpiRSvId2fIIcm+Vmpu77pK6gMs1naY0dfRe2Q6dh/JpQq/tr1rL5Ish+u5CRwVm+vs3Snit4adOfnesYM8lRZ+RSTq8C7uixg1UYZPfd6/0Mbf0Bas/wis+T0GLoIwWgJufIrSqrv+vTDAjREcUnrBlM4uuUxCAYcRPb7zAULpZUwHnTvYqoGBNRxTeGcfo6qzwlgmh0cT1dunhbyres3weYUZHN929B0HcmRIgQuq7ttihfXYWTztNEYJi7IuUlKQYkyerrxOZ7ETDC/1yD4slycyNXBJkk6dZXoVy/Dr7hCNhRw6K1wT+CRpCHu8VsFParPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o/qfVD/Fv0BwhkYHbhR/IRyVl9FYyao5rHFVXRWxes=;
 b=H9lardNGijMNj7PUOu1qgIzXMpQ2RaLO8YOSsxQCft4dlzwy6nrbOdKvprsJlAmgGyZTL3eTjUcPeHVtEfdzHkYVvjPTTJzATQAqT6iXeaPWkDbmXdmNGw8B+uHvRMSQErrfwBA2xIDX1LmGf3/fLSftBKHyCj5wk9b1aP41LxIbMEETwBAoO9h7n6b3XT/2yarjw+wgVXLGtf3nfEYT9A3HlR+P4IqI/2LZ6A8+v4ury4dhYVyy2sCu9hPdBR4rDGivQS02u61aBneBStDge9iKk/CzpDqvKIbre7TD1ZFKadaJwsJIoPHugp7teDHzdmD5StwsGXwO7djW1ZZx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o/qfVD/Fv0BwhkYHbhR/IRyVl9FYyao5rHFVXRWxes=;
 b=HWhAg5bBn1lIwO6SgVW0hoAzKc/7VoxybmvFKyqVwSe3xxYuR0kPyydEzfuU86c5954hFVRQCFuC56YwJ7wBoJtL8R5TTJQml5mlgnnSg47djoGgaRyGzdDfWPmqpkctHUo6LZCVtLdiDgjmfzw8et4PzsHMhxzxnjxFe+IOi08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <50342ff8-ddc7-44a9-9166-9755edf44782@amd.com>
Date: Fri, 8 Mar 2024 09:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen/arm: Rename assign_static_memory_11() for
 consistency
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-2-xin.wang2@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240308015435.4044339-2-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|PH7PR12MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: eacab02f-2ff5-4e8e-41ce-08dc3f484d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J4wUinicne5/QGGHH++g92uDrBCTZe2rTqFev7gv3qcMsxiIhQFzk1rb8A5EHAjmCgVdu/KkLKdJFfi6duRTrNlb7seg5OqBBXpLX/hUQOJ0VdVwulSIRs1dGhD2c6GjWNRDFe66+KsLwnjLVxcp+WbQ3303sHkZGM1Fg/29A82ly+uAioynFAusawPZW6NX5bhnEDuKAh3NaJmDQgCCx2HXKdXUWKH6lrQ7kuzLN4jPxgXmUE4LV78NZMGvGXlk2XalhEDgE+sJ8+uM2HeqqjyH7L0ULwzXyns4VS3+Wk++PDjyPviSjbCMQgCTGLf6MOPP8aYL0J/B1PdqxCHevmEZoAUzH1civtpVdbMx29tC2G8CSx9mj3Ve6SHsZz2QYn8mYHDJR8+X/SDt8tHQSKczu5SaS8lvIY2FG5ax8IYXtDMYKsGHX2XGZAGhlk9THgx1teAMDeRNSpyiKpuXwTYajpogHw3a/CkRaZSuqg35hBpCs0b87tAEQ3lmu1USMgMoMZvo07b1vO+j+OofQUxftlzrHPhF1HqNw+lbZMxcrMXVXcMKkd8CokpbaD5MDOQOiuTNdRWKC4kfAYvuR4kobcspzqGVepaRZMhmGxMikxOQkPgoeAxrzrwXTij74gbvULdJJnT9kjisXxlOanAk06mN85K4R3eIlE3efwD+AG3Qc+/6ekVWHVGQdnFGTWSyakErRC9AB+FqAGvt0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 08:18:14.3418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacab02f-2ff5-4e8e-41ce-08dc3f484d29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6979

Hi Henry,

On 08/03/2024 02:54, Henry Wang wrote:
> Currently on Arm there are 4 functions to allocate memory as domain
> RAM at boot time for different types of domains:
> (1) allocate_memory(): To allocate memory for Dom0less DomUs that
>     do not use static memory.
> (2) allocate_static_memory(): To allocate memory for Dom0less DomUs
>     that use static memory.
> (3) allocate_memory_11(): To allocate memory for Dom0.
> (4) assign_static_memory_11(): To allocate memory for Dom0less DomUs
>     that use static memory and directmapped.
> 
> To keep consistency between the names and the in-code comment on top
> of the functions, rename assign_static_memory_11() to
> allocate_static_memory_11(). No functional change intended.
There was a reason for this naming. The function is called assign_ and not allocate_ because
there is no allocation done inside. The function maps specified host regions to guest regions.
Refer:
https://lore.kernel.org/xen-devel/20220214031956.3726764-6-penny.zheng@arm.com/

~Michal

