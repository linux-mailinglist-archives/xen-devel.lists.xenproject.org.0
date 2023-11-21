Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB47F3463
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638055.994304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5U6h-0000CG-1r; Tue, 21 Nov 2023 17:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638055.994304; Tue, 21 Nov 2023 17:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5U6g-00009F-V8; Tue, 21 Nov 2023 17:00:14 +0000
Received: by outflank-mailman (input) for mailman id 638055;
 Tue, 21 Nov 2023 17:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5U6f-000099-Do
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:00:13 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e83::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e2e746a-888f-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 18:00:11 +0100 (CET)
Received: from CY5PR19CA0054.namprd19.prod.outlook.com (2603:10b6:930:1a::15)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 17:00:08 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::d6) by CY5PR19CA0054.outlook.office365.com
 (2603:10b6:930:1a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Tue, 21 Nov 2023 17:00:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 17:00:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 11:00:07 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 11:00:06 -0600
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
X-Inumbo-ID: 6e2e746a-888f-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF1Lmr+dd2DwyTq7lGhRN9aZvLj3EVoLvS3CVUKv7ibpV+4Z95ToAQQcDNbrUpxJ4KeLcIKDxp5AkmMMTfXlZmXj11DyJqAPrNqCwLOn+jzK0S1Q2WzvEqQl34pqqpGNGnXYHBlfLFq4G9Lj/G0ShvD29nSy+wBx7Z6sSm8al8ohobxkJ9TnCyseHs/lA4kHIw431dE6LvuM3TP5PttNa9fmMzwOPozFcQFz2f38Ji54AlJ71K9YdN2P3AMiY28uMwtmGtVU7ogrgNVzbf9T2S+uI3/1ghMkTGoRMjgNZM2lGIbEWKM/Rx12AiDPETXf97xnjku9ianZ+7j+UtiK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2DtZCfTxvSpWr0hbq2RadosLP0CREHWT5Q0fDnOS+Y=;
 b=mY6wSro9n4Hjy6lQkgX6agfHvS+d/OfeUlmW79hrfTB593wCSxIIdZCc/30+1tyUziZBiQBLx4xgF3FfycLslEJp/BBw5YHbn76WELbke1iXzgDc0rjaAagqet/Xb8wRZohVv2qhmQe5ZVcuJONehsCJWs+8bLx3s/XcolgamfowTq/LHn9r97XuWIctWYjQCGbocCGDYqLJcOsu7hVI2/NagWxBXszOFRjhIbrspUYGio1nYI9FeKz3pQHTXtzfRT3tYy4uVCyWBe0bCpcR+bb28f54UOHyM/KEmhhPAo43Y8m3GaytNTu8qaTPS6TMUAbQSNq8ZZgSm/bG2zUbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2DtZCfTxvSpWr0hbq2RadosLP0CREHWT5Q0fDnOS+Y=;
 b=Sz+5ewM1lqTu0pHO7oF/BvE87SLhD8e6LDWQmZAHgUEkbnkXoHrWyi6RQ65kmhHCqCFflMVbWqsnmpRsc1OQmQpDtcdsact09CMj6LXQyNkvxTuxJbWoOoLl5QzgxlXEUKlvzzUSlVNVyh8tOGpR2gek0CYQCewAzLgY3qycVtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5b4ac8af-98a6-4757-9946-d520baa6a2a7@amd.com>
Date: Tue, 21 Nov 2023 18:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-2-michal.orzel@amd.com>
 <cbe5470e-2017-4c4f-bd32-987da72aaf44@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cbe5470e-2017-4c4f-bd32-987da72aaf44@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: a40a4d66-25a4-4202-6d9b-08dbeab350f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SsH8PShngre1PIqQUZz9B62vBkR9ClnpYBFz+eMiVYN3nBGFPFa0pUESHEpk7dRjnJEyt3HI+aQkO/OHiNOOH7k9WcEyPVwF7y2U3XfrfSt8rr5aU1I5boDLI+jMmh+AawgzseXnXBV2hSwU6KTTDl+5jGolHrjpU8oNC4uNXwHdrNu8Y3N1Ol7mfIOPAt6m0rlTF2dbXpqsPxiGR4ND3Cth0uxyx0NntLon8U9Y4uKwsz4ZOzBxDZ7hKEHs/wiHEyL6QfgUI4fruZor+X1KPKOWS2OgFox3S7Ei9QXCGgUjbalThdef4gpuhRQFTku+zo8iR9Z6J9z8aRWhrhR1PCzEcsqF4BdiuCmndPNH7BGiOoNKi+EUIonkNqWwowW5H9szWrOLt5cvJw6yKKMCx2TBwSWC02Tx7etNZ34/XiT4PakBzPQ0x2qLfQDD0jhfOjjvrE1X/WDQqUHdnteO0vzqunYdis9LBfylAnmbU9i9wgaiydpuifzVxJzITsmBBr5JvTD+0iU7EFh1f8qzCQFW0TJvjDXBdmPN+a7IpUxiIaC/6w1kZbCbI2VUU811BgF/7Jk5tkoAWweOEcNnAzlfjwAJYHudbUmJDb099ODBYYS005ZEsIA215hVQ5B3Rl1XZH69W8wkqJGLJjkQ7VrIik/+P6XOxUGXYNKPlXy4q6ASDgZBt2mSf80fxtT/Vtzdq73JzzhqRFXOY1mbqvhGVtmm+dWbwpQHZH9I8QYBc4vMenOmA+23z07eeuYccyNZ4//ZWoOYYycDgupiQ1hZADhROwg+WaaZgqfKigCLt662zAerobMMnX/Y9d3frEfmnvIAVIYXBDrkFtCfFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(40470700004)(46966006)(36840700001)(41300700001)(36756003)(86362001)(5660300002)(31696002)(2906002)(4744005)(44832011)(40460700003)(81166007)(356005)(40480700001)(47076005)(2616005)(53546011)(82740400003)(83380400001)(426003)(336012)(478600001)(26005)(31686004)(70586007)(70206006)(316002)(16576012)(54906003)(4326008)(8676002)(110136005)(8936002)(36860700001)(142923001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:00:08.0179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a40a4d66-25a4-4202-6d9b-08dbeab350f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319

Hi Julien,

On 21/11/2023 17:09, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 21/11/2023 09:45, Michal Orzel wrote:
>> At the moment, the 'hex' string is placed right after the 'putn'
>> function in the .text section. This is because of the limited range
>> (+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
>> 'adr_l' instead (range extended to +/- 4GB) and move the string to
>> .rodata.str. This way all the earlyprintk messages will be part of .rodata
>> and the behavior will be consistent with what we already do on arm32.
> 
> This will be correct today, but I am actually thinking to move 'hex' to
> .rodata.idmap so it can be used while we are on the 1:1 mapping and/or
> temporary mapping.
So you are planning on extending your series to also cover arm64?
If that is the case, then I'm ok on postponing/dropping this patch.

~Michal


