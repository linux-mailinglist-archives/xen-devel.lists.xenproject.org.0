Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912708A8324
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707461.1105398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4Nf-0005bW-Ml; Wed, 17 Apr 2024 12:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707461.1105398; Wed, 17 Apr 2024 12:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4Nf-0005a0-Ik; Wed, 17 Apr 2024 12:27:15 +0000
Received: by outflank-mailman (input) for mailman id 707461;
 Wed, 17 Apr 2024 12:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6tE=LW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rx4Nd-0005ZZ-Kr
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:27:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfdab5c6-fcb5-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 14:27:11 +0200 (CEST)
Received: from BN0PR04CA0193.namprd04.prod.outlook.com (2603:10b6:408:e9::18)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 12:27:05 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::f5) by BN0PR04CA0193.outlook.office365.com
 (2603:10b6:408:e9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.38 via Frontend
 Transport; Wed, 17 Apr 2024 12:27:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Wed, 17 Apr 2024 12:27:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:27:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 17 Apr 2024 07:27:03 -0500
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
X-Inumbo-ID: cfdab5c6-fcb5-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE1KviOznDHorYcNZJYlyqf5d+eMwFcx5BUg2PyVe3WRPLNgzvFgkD+APVMlxstxIhQhJ1gmf5BDPbMkzJx8cJOhwUk+5ae/MVMGrRyTKG6RN193ZG0YRCCCK9/NwNHquyBVPm6kbN2eYVrnM9gjLl4hhemJfQg/VYMDm72Y6gC4vwQaEX0FuDvh3ww9ezC3N0laWwiWLKchcanauV+13QpFA1GyU3txPcAzJzgMwaAG15Qy/+8iIA1LZGeaGfYRq0skoaPqlmDzYGFWSXUAKAjDsLJAlD5SxF+QHT1WA7O1LZx3p0l0TU5Oa+UrEMjMnrRRVIiYsaDRMBeQK2SqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbHvg4qBQplAadW29MjytjWZsaY/L0op/dFxQP/havw=;
 b=g10hau3Tb50B8w8PccArd7RYH+to642dvsmVYKvW0BfSQWU63jHMTRqk2j4ZGi60Os1HPLeMBAuSekWKlnSrA4h6LxlwKNXIjpf+1i8s78x4idsXN6RTqlt9YNIuABkx8p/UgpjmlRYFiXbMZvGNcD6LHhnATeniMDbGX3L3wwozYyZm3ksqlEMFvVCmwyrK3TosahmIa8D6dpX7/U454qGRmA7LLloDMQr/YOp9xxfJXDwzAFUPZCr7LOI+/xDiEde+O5vULsRsQzcvUouX11gqu3HwQYOK8ThamvtgcGw5As/rO2CI0RaVzuoZOP5w7IYfUfdt06y+mblD1KK49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbHvg4qBQplAadW29MjytjWZsaY/L0op/dFxQP/havw=;
 b=p4C/azc9vOLNQoOEFfX3nsCOB5HDxbjGbSn7quuyJQwC0ZV48mNJKbojI4ed4uMoKr32piO7ii5mg5kRxeNa4p3YbDd/bsCGUFMK7zmV3TlGhp2poEugId0euRv+sTuWmIO8s/gYCLK5DEkgEFXw6e2qGVtwIiEg6P66EWlMGUU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3cbeda41-31fe-4bb3-a1a5-5338cfbf2717@amd.com>
Date: Wed, 17 Apr 2024 14:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder 2/5] uboot-script-gen: Extend DOMU_ENHANCED to
 specify "no-xenstore"
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
 <20240417120741.2453431-3-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240417120741.2453431-3-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 2162fec3-d483-454b-efa6-08dc5ed9b154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SUZiYsWl9Snl/xjbnuzaR75zEp2kCuCDVYDX3IkZzUlD3PbDbS69EioD/MPcQym4UmKmb4rdIS6CqT8HehGbvUFfl1we1UMmYACniv/lNtyhZcFqoEKzszcAZGVswOd+qyJpRMRjtdiBeg212GzmxUPSsNuaf08XJ4lWEePQna37hcQTtIeILNp296DZSKlVqiIh/pbcNgLhYylGBAfs/rrxeFIjtYbIWUyv+1G8xerC+S2cDEZy0ZjdLlAAOtfLXBI0PyWtEkfKxEc6YgHvWFtCcaXVqpDfXMsf8wcKOO4t9iGGRhb7f8vhwoCfD5tysLLydnW8pJSs/b1ef5EkS84a/YFK+fjhYMwxa2R0GDrl0vZreQ/svAJT03D+RX3brakyXVJlIU4FSI/ZoWhhgBlXrnviI3kNrubOuBpB+9wr1GLTebDUMWWcpqU/9w6FrJcnI7mhI8iba+RO4pk30jTj+5sQZRKzEWNyWDctNUqJ9PZN6dHOS+ITMQlB6oQBac2dnkAfiyaF6SfsQ5fAmxruqwRNfKJNskrXDwGhVLJ1xqXxuurgWeIFy8H7BuJeUAv0RX6hi5CK4dge+quGCRckgQRhB/W1m+wH4bTWK4pGFRXxRTE3Sv/AkXSIZdAvZ+TlrBIUXMFzaoM/xzZ2Owb3HYot5xNaON3oLo9tNZr0A0rCvONrRSnv0i+pe2IUaVypB+bvBJbVBnK6Wf3VIGwARmEnqNMUSXApC3sD19TcFViqkAB7BjBFYxhOhmLF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:27:05.5346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2162fec3-d483-454b-efa6-08dc5ed9b154
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041



On 17/04/2024 14:07, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need some Xen services to be available within single dom0less DomU.
> Just using "enabled" will lead to Xen panic because of no Dom0.
> 
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) At the moment, Xenstore support requires dom0 to be present
> (XEN) ****************************************
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


