Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D965B328
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 15:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470339.729815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLRQ-00085z-Jz; Mon, 02 Jan 2023 14:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470339.729815; Mon, 02 Jan 2023 14:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLRQ-000831-Fb; Mon, 02 Jan 2023 14:05:28 +0000
Received: by outflank-mailman (input) for mailman id 470339;
 Mon, 02 Jan 2023 14:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7CY=47=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCLRO-00082q-Th
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 14:05:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 809d5f19-8aa6-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 15:05:25 +0100 (CET)
Received: from BN9PR03CA0197.namprd03.prod.outlook.com (2603:10b6:408:f9::22)
 by DM4PR12MB6566.namprd12.prod.outlook.com (2603:10b6:8:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 14:05:21 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::b) by BN9PR03CA0197.outlook.office365.com
 (2603:10b6:408:f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Mon, 2 Jan 2023 14:05:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Mon, 2 Jan 2023 14:05:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 08:05:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 06:05:19 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 2 Jan 2023 08:05:18 -0600
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
X-Inumbo-ID: 809d5f19-8aa6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQfKUCh69TDJtBzRyezYuC43lVhYInQ2xv0WwQo8su7h8EnGkZgzfUXuxZi0lONAQALMigNU8LJ6ZoKd2BHQ/6a6vEtaj6fPerKBOyDU+KhfosLjD6Ev4laHQsdShYlYyGaExUTEm2Hfw9SA/YB1VeYzYPLAHY9yu/bPhOnL3MEgdPUobmr48nuYmQihAbG6E49+hzhAiGV2NHOIhBs1OfrqPESD+BSHmXq1gUz5CdSuUEV+TQ6eNA3X8TUiVn601R8IFSV4gfFV6VvYJlgVPtXst74kvFimBFHc22yI/uA6wmyz1n3CkztSscuGDjabQQ5E/++cWvs3sK4TdZHIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv2nbBORmNi9jMe76KzemtB5/sficMOEg/4qBqBfQog=;
 b=X3b9O2onx+PLmuyOjXNf4hYz+LSJZlVTGFJlzQ2q+rMkCzzMtFVktS5BRHJ8CA2dQMLihWTIUG85Jrvw17a2C9wZsqJZxFRvsRbA2D/lEMMmcmqibd9PtbmYkr3OkMzmZUfX8dF/5xU5L2KzD3Pdl1fHhRu8KhEGEyNhp/Q+RNcgWemhnCGpFXgnfKeSVPOj75XRogZEizdt4BfFkIAuemnqk147y++rcONzvwD6la7b1t6hVM6WwYEcxty+vdLc+3vYkRaOXSdOVJRWx+TjeQrTLM+mxsaQiLL/cXN4i7kSERDBOOEsQUFg6TLm8w123ZCUOxW6Sac4rQcRQKAFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv2nbBORmNi9jMe76KzemtB5/sficMOEg/4qBqBfQog=;
 b=voQ6nPNErpryNN+qY4HZWb5EPMkYONhd4ovhhC5aLAJQ0xZRPBnLOqtoPaJCZsNAygmX/UjHfaDu8lqfUv9bVAlEKnwTKjJtxF0XWpuHnLCs1KCaUbFMpJeQD3c/kc91mI5ndfO9dlDrRC2RNrEbuMV5oaYNZeu6TDV0XpZmKvk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4caae81c-84a3-9925-2e9d-0f256feaa6c4@amd.com>
Date: Mon, 2 Jan 2023 15:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-5-andrew.cooper3@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221230003848.3241-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfa60f8-76b9-4f1d-36d3-08daecca6278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M45WnpRSehcSRgLauqT+P57rmVJ64fDbUaOKsKAMzlv+8oL/ovUmyGr/0sDimdYRpPQOLE2qfa7SrH7xGieAM5956g+Lj36pPcAzdTfoOAN9Ub3g+nDpY2nyqRflMb1CfHd3/ENXM9jNxN07XBE7ReH3F+eiFaE/ITmKJtb0IFtBaQ5psbxLcf8PsfP5jfJnPAW/5kf6Zefuy9uEYm+NEkaJNW4/YXnSDi5z8+ZEWNT+JQYhEt2GpWdnNeb638ZcSx14BxwQS3u/Xx5proxTHVeAXJvVl4JdkZ8SVOwg/U5BZNVpwyxdIYvrVLVi4NcI+jLeTkjIXht6LvNicd1QbyAuKj2y+c+fLJkmDnZCg/VdinSvBtYtSCwsRO8KNOGZXIISMkAfFkVzBR+ErKAQ8Dvn5tkeBZI3NhPFVEpwRog9x9kgOGXZpjKjQvF1hV/hFeZessNf5Jk6Bh+9Pcl4mNNlXK57/y6gswvsa3OODFrMc8kK8Q7pFpf0ZaysR+hDkFyxEVu1Mz3/eqCt+TiyBsO9sPOihHbK/G9ewQhjqEiDtT7v1h7hHzQohITllym4J7DQSgs7iMdnLVymmU8bSU10ZJmccJIrjRd2+/8F+2whuwEKBRMG4/rI7dKuT1oBSJoY6UMqbVAqoxsh8hN5g+Qp+mEopG9oAbb0E4//7oAmOrrsGdBOkSwQdwYys7YoU2DXZm6DgVZ4INAa8qmu/IEYrFIadJDxDAZFlCJN4qhGDXqlNefKMRZA0cZVtONpEr8Qa7rB/wgz99BaWvIa43eC2inZNqKRqf08bqkneoo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(81166007)(356005)(82740400003)(40480700001)(40460700003)(36756003)(82310400005)(86362001)(31696002)(53546011)(16576012)(316002)(36860700001)(70586007)(70206006)(2616005)(478600001)(26005)(186003)(31686004)(54906003)(110136005)(2906002)(47076005)(41300700001)(426003)(336012)(8676002)(8936002)(4326008)(44832011)(4744005)(5660300002)(22166006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 14:05:20.5472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfa60f8-76b9-4f1d-36d3-08daecca6278
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566

Hi Andrew,

On 30/12/2022 01:38, Andrew Cooper wrote:
> 
> 
> Whether to build only Xen, or everything, is a property of container,
> toolchain and/or testcase.  It is not a property of XEN_TARGET_ARCH.
> 
> Capitalise HYPERVISOR_ONLY and have it set by the debian-unstable-gcc-arm32-*
> testcases at the point that arm32 get matched with a container that can only
> build Xen.
> 
> For simplicity, retain the RANDCONFIG -> HYPERVISOR_ONLY implication.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

With regards to Oleksii comment, I do not think we should add HYPERVISOR_ONLY explicitly
for randconfig debian-unstable-gcc-arm32-* jobs. Doing so would require similar change
for all the randconfig jobs to be consistent and this is not needed.

~Michal


