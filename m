Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A062DD00
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 14:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445218.700282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovf7n-0003yy-6L; Thu, 17 Nov 2022 13:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445218.700282; Thu, 17 Nov 2022 13:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovf7n-0003wJ-3B; Thu, 17 Nov 2022 13:40:15 +0000
Received: by outflank-mailman (input) for mailman id 445218;
 Thu, 17 Nov 2022 13:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovf7l-0003vR-GT
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 13:40:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe59::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5af6855a-667d-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 14:40:11 +0100 (CET)
Received: from MW3PR06CA0023.namprd06.prod.outlook.com (2603:10b6:303:2a::28)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 13:40:07 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::98) by MW3PR06CA0023.outlook.office365.com
 (2603:10b6:303:2a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Thu, 17 Nov 2022 13:40:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 13:40:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 07:40:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 05:40:05 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 07:40:03 -0600
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
X-Inumbo-ID: 5af6855a-667d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSqRTt4fmQ4iCaITyfhpXRna5vOA2XSigjLfYTfyCZm5Y+vFFVx6SelbcJGV8WqcEU+egGNLgC07ex4iDufTm5LZcxkVdsZt28hmHW48IWTILxzzL4kz0j4xYAgyfcCk73xbNY8brcqVDnxTQaTcR4UirVB+DfS60GEmpsihIi0W4HSqYKQ3D8BNfYXlRaGxcQVOYEYNzKwNaE9SWc0EhubbUxZEYRuOh+MGeLFZx7q9HrNc8cb4sH0rt/4sh7zh3JDS76xZ/Pmd2+XQkX2t5X+qqPH5pnAw6Vs9VVi8kFEYY7cd/BnVid8bfQuNzzitwrzubv3SJVbcdBcZnpiYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avVnQD7ww8knOGhKoIuyVz3Zx0k6lSvfIXELF6snUSk=;
 b=GO6l0BEZYg3TS4IuTD3WJjlxi546Cz8S33DuEcvzrCEsjUPftQQYakmCX6IFu7XURlD++ezBEM0xVyXfPPt3vHVrDcS/l6mtYEcm6c0AWjZEGtSW8nmaC/Edx5NfRtvAerT5/qHF8kuVEQUMq0SH0bnczejU3jY6jotZiztqmtsY9obZ1rC12LlojkxnAnkVZBipQcXHTGqqouPLO3BOz1RxZR3Oru9UB+4msuoGtQRp+ISJrafv3/tgyCKSQoPuiEfNON2BQ56bdtNIfuhT2oTdM4an7i8OuYtUZjgND1DmWZjObaP1uEMDa/1NNnO2xPr0Iv7BkUnARLNk4OiXIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avVnQD7ww8knOGhKoIuyVz3Zx0k6lSvfIXELF6snUSk=;
 b=dzxjj7u3NUJIuaG/pPn9py6l5Q+4WSpgql+aHFY+VElGwgwz/UfOPUHyOmBe75nLWBASij4Q3ma3PxSDvYV1T8PRTk6T3twwya3vv611VXgj3LtOGD9v16j6KSDNFTDrffhqSExwdkgbqeBRqz4kfVTjYcSw7rk12voh3TFa420=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
Date: Thu, 17 Nov 2022 14:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 02/12] xen/Arm: GICv3: Adapt access to VMPIDR register
 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-3-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f91bbd-4557-4295-0ba2-08dac8a13d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kd847PcTmHTcgYCedmoZL69g9uKE/q81Pnz4qwgE9dXQmU9+owkXPTJohzKCrk9qLigKikAXGSLcCHblBlkMnUrY8TsHJncrFz5EoY6CZHUe/1YJ2P8x6pCKc6XJKPPpCHgsKvcTGARzM3QQv5LxunxhQ4pt1VTjL42SUx0s40MxP0Gxtg/pFVc5w/XXIqPdiqJUOeH+cizWAf16RPckL+g9m9AhMn8cNFrbtUpZT1jlFA3E66TP4nxbEKDllzrRRjR3ME8s5xu8xDrkehwNJ6uAzSzTlKyJfMzAu7/O77lsmy8/flh3tO5l9U+8Wc9eisDBit5H0FCjELnU7hP7waA93swjyoQwuX9M/3aZJDZc2FoeOPWFR343SO+eb9Qbjup01qw5kdj3nNXr5gXGoZS2eKN4P5hC+uSiOqVQhLtGyW+RT5q7E8IJjxVQUzM/B+2ilpz0FEBdPchqgK4gXtfFTvFwSZqNawo8c0z1K6pcoRVQwNq2bOtJj1F2skmTyrV9vGG+0OfUE0fHeyftmI+jG2UUai9+W8H29ojNcEtJaYRLVNzbwQZr+WuFAel35+AXOvPSGghOpwPL/6mk6pFgqW4KGiH3bsRC4nOwfhK6QvuDaZt7QA7PAdohxenFNpr7BsZ2Vxjaek1PCdJIadH1nzAv4ngEdaqriTlL44yTsB+/3OUhZAIEPK+jpgjWgYLDFrquGfrckmp1fLxK5dfyP0qAoYGHkEIozjrZvk7iIwp8NugdGdVybbdzud3Ff568nhCCFmZGKKrpFV2Lgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(16576012)(316002)(70586007)(70206006)(4326008)(8676002)(6666004)(336012)(26005)(426003)(53546011)(47076005)(2616005)(478600001)(81166007)(54906003)(110136005)(356005)(36756003)(82310400005)(82740400003)(31686004)(186003)(2906002)(44832011)(31696002)(40480700001)(36860700001)(40460700003)(8936002)(4744005)(5660300002)(83380400001)(41300700001)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:40:06.8099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f91bbd-4557-4295-0ba2-08dac8a13d44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
> Affinity level 3 is not present in AArch32.
> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
> Affinity level 3 is not present in Armv7 (ie arm32).
> Thus, any access to affinity level 3 needs to be guarded within
> "ifdef CONFIG_ARM_64".
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

although, IMO the commit msg does not reflect the change (i.e. you do nothing
related to accessing MPIDR, but instead you are just not taking the Aff3 into account for AArch32).
Also, I'm not sure why you used VMPIDR and not MPIDR.

~Michal

