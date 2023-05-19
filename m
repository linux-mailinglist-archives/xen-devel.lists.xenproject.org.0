Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097A709025
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 09:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536699.835304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuER-0000rx-4c; Fri, 19 May 2023 07:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536699.835304; Fri, 19 May 2023 07:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuER-0000pa-0I; Fri, 19 May 2023 07:08:55 +0000
Received: by outflank-mailman (input) for mailman id 536699;
 Fri, 19 May 2023 07:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9j/4=BI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pzuEP-0000pT-7o
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 07:08:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feae246a-f613-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 09:08:46 +0200 (CEST)
Received: from MW2PR2101CA0003.namprd21.prod.outlook.com (2603:10b6:302:1::16)
 by CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 07:08:42 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::c0) by MW2PR2101CA0003.outlook.office365.com
 (2603:10b6:302:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.7 via Frontend
 Transport; Fri, 19 May 2023 07:08:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 07:08:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 02:08:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 02:08:39 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 19 May 2023 02:08:37 -0500
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
X-Inumbo-ID: feae246a-f613-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJrZN+yVT+HLYIuQcXuyUxxYyMr5i7BAXTPCdRBWfVx/ZXOANE/MZurUzDGL9h1QNNkFcPCUKCCbgUrAY0D2yBB4FCgcc2USnG97c8Mg6KleTh2rY2twJe1GgB0A4rC+b38cxciMujT2ko/z6aJLaSsrRlwLyTJowRVfkst4iT5HJ+fbXXeWgi6QK/MLOv/S2g3+LoK9UG26PDJ8FhlcYwZtY8JtlcH8MrW3OlgcRMVz+vmfljaL4xgljXfR5NpEFX+Ez9czhRgo4C/zv3u2TNdciMxwIWVAwXtLPI90hKT+kj+t4BlZqW7wQg+o1mNab9BH14t2+kU5NrqnyF7fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/b4M/CxF91kxc/f6hPCJkHkDP4+LP+C59xmPdLzvC8o=;
 b=Zq3HNYv2/tBok8SWjjdBcAAMIe0/QOXqqq8oW94YXL+HGfpiA60dc3ClVS2lPCcB3FebzMzRZnkJyBPmYUdyQCvfP1+vpRmna9W9uNxFmu30YbT5iqse/p2SznUkh8ssMgMXn4Ll52uBqdxvSjygwOP/bFhe+Pforvi63b2vw/V4E0c+eryzdb6CYiAT7pT/edL1tsQVYm3QsfyOX7Rb3rvTWomR5wh2GrkcH+AS9bWYfDBWiMH2MNGOSDEz0awip5vLwSEJNys71U7HpBk+qPjj6IPXASUqeqx1XwgMFY1HBGVlDzVppGY0lreTfYGYaSvxEuUzgzOUcrFFGoGWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b4M/CxF91kxc/f6hPCJkHkDP4+LP+C59xmPdLzvC8o=;
 b=zi2WQ1mpBHPdtCDq8jk46NFMOQf05cUwSBUKz2blO7Yu/JcJ37PcBLdTsHDZILsdy6Zj95IktUcJ6EvFt6h1MXS7Zyw4ipCM7MkyCh8qCZ2tutMZ9LQLnNQlyTCIbKtbx2qhBRjDPg6JKTay4I6gN1aYFamifX8it9WzPo3YheM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a0d6197a-53e8-0121-c7e0-ddbdaf970c7e@amd.com>
Date: Fri, 19 May 2023 09:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] xen/misra: xen-analysis.py: use the relative path
 from the ...
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
 <20230504131245.2985400-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2305161743520.128889@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2305161743520.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|CY8PR12MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5ed2ac-5270-4895-510d-08db5837e0aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZl57d7RHMhp4IP15j9MjQj/a30dWoHZeHnjmDatinTTuxBlhIxtzUEh5+cSMNcEx9TcOyCd4+8ueZACLRfFLSdLChZI+6Ro7vUrtCrfnSJmPGuZyYI2VMzyVPz49aSBVaXmLYpiLCMG4xnhzOzognaBRNkJaHxaNvWr8VL/t+1adCR+OLsH9Oqs/yvWWehlyi8DiLedFNb22vAyZW78MTaopt1b8m+7OulymuGY2yiT+MYwTXGlrreKBogGlam08JI2tEGuYtPqNepI55VSn1JVs4IAANab4+nXwoKw0rY+kKZEi9nyPoXITVVqBNTCYFR3LLuvrbCMRCQ5YeBhIwdzEhh1NkSuCaAhsRmDCxF5vyJAn9D8/DEyINBCod0R5sPnNYydGn9Wj0H4IwMkH5Lar6/zwTf28b7AwEC0N+JholWtrfr+Z8fX1zKjGhbs0Q7T8I7McGlmv+7G7OggLaEKEH4iK6taaFkyaG7A7zZtTavUIGB4a0JAMKQxVuNxVZTIdj9r007xGBHZZ7bA6aqIVuQ9ApUNy6aActUlhL79z2DLVBE/ZQ97AsrAQSvOycNTd+EDJwT3+X1A+QKpprfAZlhdfC9Yh83+ggfhxjIJ/Bjk8NlQBbH2bsvY1QGHG1E3FipQTzgRUpvasSUJNID96sh91XDnCTVHWZcRExOW4Uw6n6i6OJPAcFO2QU7AbEHUblSDftv2yal6BnzRwoDEUSVt0zhYDuXuj0AbHZ0bqzgwpsWd3RWGUGsKNa9ZqU4g22bNODbR9zH941qy57oDJP4f5CWL2vq8OmGXWbQrwKoSimFiE83zGpQNK9Zw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(81166007)(6666004)(478600001)(356005)(86362001)(40480700001)(82740400003)(31696002)(36756003)(336012)(83380400001)(426003)(53546011)(26005)(186003)(316002)(40460700003)(2616005)(47076005)(36860700001)(44832011)(82310400005)(8936002)(31686004)(2906002)(7416002)(41300700001)(8676002)(5660300002)(54906003)(16576012)(110136005)(70586007)(70206006)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 07:08:41.7198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5ed2ac-5270-4895-510d-08db5837e0aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244

Hi Luca,

On 17/05/2023 02:44, Stefano Stabellini wrote:
> 
> 
> On Thu, 4 May 2023, Luca Fancellu wrote:
>> repository in the reports
>>
>> Currently the cppcheck report entries shows the relative file path
>> from the /xen folder of the repository instead of the base folder.
>> In order to ease the checks, for example, when looking a git diff
>> output and the report, use the repository folder as base.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

I know this patch is now committed but there is something confusing here.
At the moment, in the cppcheck report we have paths relative to xen/ e.g.:
arch/arm/arm64/lib/bitops.c(117,1):...

So after this patch, I would expect to see the path relative to root of repository e.g.:
*xen/*arch/arm/arm64/lib/bitops.c(117,1):...

However, with or without this patch the behavior is the same.
Did I misunderstand your patch?

~Michal

