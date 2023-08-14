Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562B77B2AA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583267.913379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSAQ-0005bq-VI; Mon, 14 Aug 2023 07:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583267.913379; Mon, 14 Aug 2023 07:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSAQ-0005Z7-S3; Mon, 14 Aug 2023 07:39:10 +0000
Received: by outflank-mailman (input) for mailman id 583267;
 Mon, 14 Aug 2023 07:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ZCf=D7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qVSAP-0005XG-Dx
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:39:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e88::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60ef709-3a75-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:39:08 +0200 (CEST)
Received: from DM6PR10CA0006.namprd10.prod.outlook.com (2603:10b6:5:60::19) by
 MW3PR12MB4556.namprd12.prod.outlook.com (2603:10b6:303:52::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 07:39:04 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::8d) by DM6PR10CA0006.outlook.office365.com
 (2603:10b6:5:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:39:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:39:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 02:39:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 02:38:48 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 14 Aug 2023 02:38:47 -0500
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
X-Inumbo-ID: a60ef709-3a75-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gin+fhQr1g5vLTDvFZsPNVf8iADNNJllI3kipDha2nfdisqPDKY5S5RKGRX69fTxMJlGw4iNo0Uwy3tnMGI73mLZmKfdusHb2zjx9EDfZCcUX3LG4m/17ijWndK9hrMz6kZ5o1kwCB0tiyliqLZyVht3IYwBcaNA8V1+VvonaW6GYrR3bH9A7iAajdnIhz0qp9jSxtBqmqbxzJx7vRkAmKsBIc+pVOE8faw/ABME4vbo1Lfko3KszfGTrTf9pFVezvrAtYZfILMqjQER9vArzlKgF7oAAnYEMBTtXMX62lUDGxfwjt9gm5J9sfRCaTazwwqTsp+nIy8SaatgrqPUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPz3H2axURI9tiwg5czBfIt98I6FRLeTYL0ldg1EJvI=;
 b=fn1hUAFG8tDcVH2lIng2tPLxvEsQCW+HDcj1Rvp+FoJsDkuAQywcDKS/aM7L0zv6AUJrJ1AR32UYkzoVpxJQohPyoVWIdQ/CXy/DxLenuGCVv9XgaZ9kU16NLhclys4ZEC/ub4wpZi18rF01RDIrls0bXdqShq3+O0F1/Ht4HMaIOCLQfabpfpkYcUat8gGhFTtEdOeehR33Bw2t17ig96v1vpYPIU/kafAgBg6XsYcgpUsLk+hDkYgDl/Ft/bvmTAj4ZlSJ4WZ80HXFf2klc4vlq8JZ/6Kruxmi+yLU+6sjMmkTpZ6ewFPnZLL8//NIHmQrpYZ9S/As85ozS2y89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPz3H2axURI9tiwg5czBfIt98I6FRLeTYL0ldg1EJvI=;
 b=ngVlY58nHl8wVdCmHQwUZDvEoexCqQMHDbYEA8GtNl09FjoxKzKfp+vXoEjnm+3L5rs0hgvW0+730AbAZVm1QCuMrV45Q2O+5cK643A25kLAqXmH0j7RTQST9XjcCKW5Pea/F4oSyN1eGbmXs2QQpiKWEUjDpsPXhNCRvsv4VnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c3b4e459-289d-6418-85a7-4835fe644167@amd.com>
Date: Mon, 14 Aug 2023 09:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] automation: update test-artifacts to use Debian
 Bookworm instead of unstable
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
 <20230812020651.11608-2-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230812020651.11608-2-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|MW3PR12MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5d5666-d322-457f-f1cb-08db9c9988fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xdLMU1f5fnGRoI4xB/nxRlBL+CebsVapUaMkP4h6LNLYhGSdOqCr6Dph4s4eJcGzCH1Q45ZgejXzuGh+YPwN4Ge3+wjhhGw5mjmYLBzKyBucDMkXWtteAUrCX4tT41craoLs5XnCRTkZwoDna4UzgfqP2BsYWjDzd1jCZYHcW4bpQXBVwyr/Lzu2qPWlfxCPPvCATeKJ2tV81qID42jnJJujizMBRO5SZzEjwyYZYjDT23BoFup0HqWa3gqH6pzOrE3oKj5YWFakmnYk+4C5SdEMXUwdIxkjG7Em3AEKHiAQX09jfIL8VgPyvLHvmC7jw1D5UHjSCVJG27sR3rdzdot/7Lkigujh6OdPCz4+qOHKsVWBnVcQxmanCcoBKo0LlrC3xVSYOZE3vpbjUe9TMmomchbKEn/HyQANJW1TMgbv0NIYLwMwloNGqZboNP88ZWor7KGrbuKGOf/+dmXtizBJt8hixP5ECFpGT0nPep/J6QhbMnVpZinbkzB+med8H3i7A+/WkUjB8FJk3MUMwGFTavb9lE7chPuY6ANhXOUeyCWDUxmG97OsUj8poLDf3Y0tNko7XuJatFGASeTUqPNLqnkK8nnBnt/GWw+QKLHvkw7HfVkqSXixoWfBZaLKhBJp6eBl/fsc7Z8nY2ZsDBJ90tUNgy9Q0LTDoDDirGdqGu+ceX04IOiaV5nT3AMExjYB6kiAREWED6v/EbUjqWsON1ywTTnjne+RUbX2esRXgHOEOdVwlCT7QDK/SsldRbo4mgdmBgKFji55i60wnJ6nCYi6TdHJCZnEDL/T3jSALFIhJxM6VhwHIZChjJhG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(186006)(1800799006)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(31686004)(2906002)(356005)(36756003)(5660300002)(558084003)(40460700003)(44832011)(86362001)(31696002)(82740400003)(81166007)(8936002)(4326008)(8676002)(40480700001)(41300700001)(36860700001)(316002)(47076005)(16576012)(54906003)(70206006)(70586007)(110136005)(26005)(336012)(2616005)(426003)(53546011)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:39:04.4302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5d5666-d322-457f-f1cb-08db9c9988fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4556


On 12/08/2023 04:06, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


