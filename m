Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9E7311BD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 10:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549459.858005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9i0o-00071T-Fe; Thu, 15 Jun 2023 08:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549459.858005; Thu, 15 Jun 2023 08:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9i0o-0006yl-CB; Thu, 15 Jun 2023 08:07:22 +0000
Received: by outflank-mailman (input) for mailman id 549459;
 Thu, 15 Jun 2023 08:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAiO=CD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9i0m-0006yd-9C
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 08:07:20 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eab::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a46c0923-0b53-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 10:07:18 +0200 (CEST)
Received: from DM6PR02CA0138.namprd02.prod.outlook.com (2603:10b6:5:1b4::40)
 by BL1PR12MB5995.namprd12.prod.outlook.com (2603:10b6:208:39b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 08:07:12 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::c0) by DM6PR02CA0138.outlook.office365.com
 (2603:10b6:5:1b4::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38 via Frontend
 Transport; Thu, 15 Jun 2023 08:07:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Thu, 15 Jun 2023 08:07:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 03:07:10 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 15 Jun 2023 03:07:08 -0500
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
X-Inumbo-ID: a46c0923-0b53-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OS+qmHp5PohZP2hDax7i1OresOMQB7XqID7XUEszO7D/DuLE3dmLqUlrMALJsM/rHqSypYJzWejKvrm8oxZ1+VUBQxmxqi3RxlRu9n8LCr2R+JQAH9L5dfwHmWgTxDVKyZhegJIADx/wpR3CMwYOjOGx8t/lDrPpkGa0TxBJ0vCvvqqRRk4zqboYjd3iWvpl1RsLe6FLBW4nZdoFnv/bKse3fJo9XMNXLTNMRevABLuUj6geATWq1TWbpcykuS5tCeZuQK4nB8K1DyKkwyJ5Z9iee+4QI9ETPvJ8nA1NRVtYEJZ6lHXcdQLlv2xmfp6y7rhlcWTGUZSPcT08bzAgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG92KfOdPScVe4jWWPZdt3Md0Q0upSN9BDzoXqj98cM=;
 b=NkT7AVpNv2XFZ/0ZVMpFeWkL0ERnJ8hyXZFjCfdBTK8grz5K4KCefMbOdLxjPnbzj8umzjMi7Jb+fcPsTCE3E4ipCrOXVZosnML6OQzam1AdTKAZbaAcC9ffgQPzHlCjPnZLkmrdqdNXjWcnqnIhgjge3inBc50qQP2CAWpFVdIUmIWje3nqqsyFLSxqyNEyfRgqak0Wy0EdjBqpYinZAzjXJSW7YvcokmAcRhKU9caDnXb4iSVnjk73+J/yq8sM8Q36/aPX7U95lF26RDJK2AOPSMm6wxRWrLuHMbLVFoIwwZDoWJKnb7ORz46PKWMb02lZ4VWWgBYQcOckLgNcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG92KfOdPScVe4jWWPZdt3Md0Q0upSN9BDzoXqj98cM=;
 b=mYqZznZBOjqYpfTbNEMBqMPYrDkeBaJ7xsdO+D38JwXuuWvUeahc4/Bn/IJBC8DkQyw8t9TWrGku1lxEZUvbA8G8B/bPoomkUEtmhXnZpIjnIXmbjV63F5R2fgcw0mNjJ1XULTVGeu21FZDhEkEH90XuOrQO8yVLQVQPxz5SywM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5ab989bb-2ef7-d8bb-16f7-ec3a46142b72@amd.com>
Date: Thu, 15 Jun 2023 10:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN v8 5/5] xen/arm: p2m: Enable support for 32bit IPA for
 ARM_32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-6-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602120754.23817-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BL1PR12MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 0089b738-070d-42e7-880d-08db6d77860c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AuIz4vkNKTh+SDJFiwY2kI8l5W59SmlMfjj8ZydMd+zhptTkFcy/LovzQumm2Jq2+g7rQ9NAw4pgY5zNoaQcILqiJGgI8G2yhtf7AIyw94ikY/OTpDBTZNytDmI+65XUBanRlQ+piDLJfdOmdaIyKzVXWAex0kCtok1UuNNoNMV2Hkuh6ilkeEvuqepuC2VHbIBVuKT+WbTHUX7MRLygTVAT/nHYj9TK5SRVEur2ZRgnDmLUNYze8OjQtxWuUlG9u3tCMCsklVA0DAMhdeQqqh1SQ9nBoY4vg54Ke35gBX9eoLWyeupDPXUPymiHWBKzCQViyC04rq1/Mcd0GvtqMCCXDinmQkW6TeJy8MWVz08EtPC1a+nJcfF7Wq6YIyFobV9zTdGfiEowBbByJ+cYgzG3fbv/DynGgc+U6baJFdcuif63uqWgL2IAs2lc5jy5Bu/DVNo4nSnOCMiW+gRuEPkkCxG7V919AwPlrXN6Pu8d6NH3nYCgCKupEi74yj/JftpJk6Z2sVZgClgA8Q6vwcwHDnHdl1X4Le73Ypg0kZ0VQxGJ3m7JhAJyGE5RKlZMQng28jAiWJHOqMLoy7BF1zNVrIOV90YYUZ3LZ43q7vrOPveoM2elgYyLhtv2ZPz/LToCZP0fQ52d3AlZ1wlZtDAsu+vhwQSexTpKnMTu+sl7mA2XysPxTkiEXbORtc593bIo5JinCNA/xYnavDXDamqLA0tpb0jhV+1Ad/KHOkSdyFnGoptHwMSLZLuTVt+0cPFT3LsdcvW7tjrLWjadAXp1LBjrQ15hPP6sSfIP2nGyEjTWv2HeWrtcg5fOo4/d
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(81166007)(478600001)(82740400003)(356005)(82310400005)(40480700001)(83380400001)(47076005)(426003)(336012)(2616005)(36860700001)(186003)(26005)(53546011)(36756003)(40460700003)(316002)(41300700001)(70206006)(70586007)(4326008)(44832011)(7416002)(31696002)(86362001)(2906002)(31686004)(5660300002)(8936002)(8676002)(110136005)(54906003)(16576012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 08:07:11.9936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0089b738-070d-42e7-880d-08db6d77860c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5995



On 02/06/2023 14:07, Ayan Kumar Halder wrote:
> 
> 
> Refer ARM DDI 0406C.d ID040418, B3-1345,
> 
> "A stage 2 translation with an input address range of 31-34 bits can
> start the translation either:
> 
> - With a first-level lookup, accessing a first-level translation
>   table with 2-16 entries.
> 
> - With a second-level lookup, accessing a set of concatenated
>   second-level translation tables"
> 
> Thus, for 32 bit IPA, there will be no concatenated root level tables.
> So, the root-order is 0.
> 
> Also, Refer ARM DDI 0406C.d ID040418, B3-1348
> "Determining the required first lookup level for stage 2 translations
> 
> For a stage 2 translation, the output address range from the stage 1
> translations determines the required input address range for the stage 2
> translation. The permitted values of VTCR.SL0 are:
> 0b00 Stage 2 translation lookup must start at the second level.
> 0b01 Stage 2 translation lookup must start at the first level.
> 
> VTCR.T0SZ must indicate the required input address range. The size of
> the input address region is 2^(32-T0SZ) bytes."
> 
> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = 0 when the size of
> input address region is 2^32 bytes.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


