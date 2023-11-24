Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C77F71FF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640508.998846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tjk-0004I4-82; Fri, 24 Nov 2023 10:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640508.998846; Fri, 24 Nov 2023 10:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tjk-0004Fp-4R; Fri, 24 Nov 2023 10:48:40 +0000
Received: by outflank-mailman (input) for mailman id 640508;
 Fri, 24 Nov 2023 10:48:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6gD=HF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r6Tji-0004EL-SX
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:48:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a9bcfd-8ab7-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:48:36 +0100 (CET)
Received: from CH2PR17CA0017.namprd17.prod.outlook.com (2603:10b6:610:53::27)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 10:48:33 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:610:53:cafe::6d) by CH2PR17CA0017.outlook.office365.com
 (2603:10b6:610:53::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 10:48:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 10:48:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:48:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:48:32 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 04:48:29 -0600
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
X-Inumbo-ID: 04a9bcfd-8ab7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2OeljKCq8p90aklX4NJgeJu0Hj0PrTYgnzzPHa7CCzk4U5fEP+4mgIkzxW6zbOmF4kHXx6cABslX7UJyp206TQPFs+FGKGouh05yTVZ+nswg7S3Pep9ru2UJiZdZdY09VaiMIKT33pwFea9u/S/EClQFicHHICTRWaf++cVynzVZC8H9V7PcnKAbZ5e80ZF2AxPYVC9V6MZ+piWLWIFBj7CJChVRN6p0if0fNCWmooiJLy5RR56r1izhJeoxvMzZ9m9F+22cjcn9LBHFqaDIz3t/A1diS+Fc8g6Z5dU4Frd265zO+1U2EbMUVwM67osdUwX+cIdBbfqNLZ+nOfYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtE0gSxJw4o2GFpTOi5DoZtQJ/3WJX48J0z3EA7jhKY=;
 b=S+sKHn+geK6NE+XkoG7nB99Rjlu2Lz+ARPQH8g9+Ij6JyuLaURAKOuS8rm8PcTMyTB9Zl6ru8YAF0xUUrc4hgpV8NfuZD/yGKPhyz5v4oUFFqNSPoW73IMOji0K43DRoVm3yb+qMR9IfAkNPVjQQRZEr5BnrHgVSuWsRJMnBT+H0SE/ql2RLZXfuoauohv6MuLndispqpmZpPwf4KZXoV/W6dP3kXT2y2IsRJsGhUrxN3VxRZY5FFtbApKpiqYGdG+JLQisqOB89bLOIVYhBM4x9lJ5+Z90ZAil7YNTe8y9Lo3Wq954reQfW6BCcT32K9eUdNe2vDbVCaIGxqA/oCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtE0gSxJw4o2GFpTOi5DoZtQJ/3WJX48J0z3EA7jhKY=;
 b=QoydlTDe35Br3OWGCr7zJjzYs/vNjB9hdJvSsQhA3le0cuTUwK4qwF7DMCOYrTf2BvrIDD104jmkAhoAoTa5xsUl7T1UPB3NBOAlZm+ExnVyVLHG6dldP+teSwOXc7hNBgwebfRTmq/6YiiwPcZN34fMUrTzBaLj2Wz7gXmkaA8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9f473cc8-d4d5-41de-8b87-b263759c28c5@amd.com>
Date: Fri, 24 Nov 2023 11:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] xen/arm: Move static memory build code in separate
 modules
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <20231124094841.1475381-5-luca.fancellu@arm.com>
Content-Language: en-US
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231124094841.1475381-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b288ef-ad95-4e6d-77b9-08dbecdae718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MxU0DKXucTlRCU3K8n5soY/2QoEPU17ziGMh5s3gQHW9XyELxTfn2ADOM3Z2XCuErGZ+N7zR3L74DHYU30FEt8MVGdhKjLKXb7WiFexMxcJ6BQ8hHMadwpwvELqQhvaag7bzIFPV50NYGkPAqxOKXLqrmSodOSjqTan/0hrsEUlv9KIaB4VqmiAe+gWrAMDq2psRVz2zY2zvwOVlYYmBhxsveIJXpAARJhescwy6UXAao+zuuBrzDGzCrHR3WKw4cYqdtfgUG8HPFombluOH1BFa4erqcWZ2NOIV3Z5/QjPGolYGQ5vPtlWllHrW048LeMXkKchuC6m/xboVhh0+p/X6EehdseiFQalLH1RZoNxdiId3bD0uZU70TuZveEEVwQeKd47gzkdpbBG1raiVhbDo4Y8Rth7y+yTt+1q/RDMKn/P/oTjJZhmcZcW+ESpYplkL6Ojw/BdbHhNNClH43iH0DTq4GAnxn3BB7iNbq+Zl8OfgM5cDmda5F1J34xk+e9jUuNl+7EnjeGymblWfruwVfnabVN6sgEep8I907rzDXekEW3UvvNdPbacXNtzqc6CRUJN8GOVVMkPuTaKhHOZpifMqxXtmwRMi3csExIiuy+N85KvK+66tR98cEHl1YL1u5hhXqra7NkNId25j1/ca1dFkfV9i+K9T3Q7tRXrkI+twUMgWrYWhuhGgD/GJEeMTmbTKC+DJNA2puCSPMBgjxrQwbNpqrWp+cV7O3G+AWbiNn0GTpckVbk2F1ZlhH4ISo8LnQNqN3DTLnhVfwJxe0wl2TJ2ZswSEypu2qGdwyteafOw1ZqwdaRcqx8s9q1Gqo4EXrdTudM1b0qyqHYpL55LP7JOUGnzxAxfod3E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(26005)(2616005)(47076005)(4744005)(40460700003)(70206006)(70586007)(16576012)(110136005)(36756003)(54906003)(36860700001)(40480700001)(4326008)(81166007)(53546011)(316002)(8676002)(8936002)(31696002)(41300700001)(86362001)(478600001)(31686004)(336012)(356005)(44832011)(82740400003)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:48:32.6598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b288ef-ad95-4e6d-77b9-08dbecdae718
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457

Hi Luca,

+ CC others

On 24/11/2023 10:48, Luca Fancellu wrote:
> 
> 
> Move static memory and static shared memory code in separate modules
> so that they are included only when the corresponding feature is
> enabled, doing that we modularise the features and we remove some
> ifdefs from the code to improve readability.
> 
> Move process_shm_node function from bootfdt module and make it
> externally visible.
> 
> A static inline helper called process_shm_chosen is introduced, it
> will call the process_shm function for the '/chosen' node, and will
> be used by the function construct_dom0 instead of using directly
> process_shm, allowing some #ifdef to be removed.
> 
> No functional changes are intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

