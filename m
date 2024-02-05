Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7A6849AEE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 13:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676014.1051756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyRf-0003UR-Vs; Mon, 05 Feb 2024 12:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676014.1051756; Mon, 05 Feb 2024 12:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyRf-0003RZ-So; Mon, 05 Feb 2024 12:51:31 +0000
Received: by outflank-mailman (input) for mailman id 676014;
 Mon, 05 Feb 2024 12:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsQK=JO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rWyRe-0003RN-MW
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 12:51:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4608bb93-c425-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 13:51:27 +0100 (CET)
Received: from BLAPR03CA0128.namprd03.prod.outlook.com (2603:10b6:208:32e::13)
 by DM4PR12MB5134.namprd12.prod.outlook.com (2603:10b6:5:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Mon, 5 Feb
 2024 12:51:23 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::a5) by BLAPR03CA0128.outlook.office365.com
 (2603:10b6:208:32e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34 via Frontend
 Transport; Mon, 5 Feb 2024 12:51:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 12:51:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 5 Feb
 2024 06:50:34 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 5 Feb 2024 06:50:32 -0600
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
X-Inumbo-ID: 4608bb93-c425-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/qoyHRDqIlGwgdkElfjVGEniNgEHmgVlQt2gd9k4gI1wGKefgjxdJuSYvcMNu60U+JTqhDHsrdkTmuR/9zwPU7eRLvDSjqnZNP/kqJFxPpT+RPZ8l82UYAfGLfKXaBNEqYzlps0q766azoee9m4JN0WTwzRTAMyUTODwWmHDiSKiS8ckbDwXfZhH+QVG+j3KcgTfdwVz5VieFo3IYr11PBu7J1E9SrJ9NBUWkY1vRP2N0n8ptsfIpaMUsoDbR68y1ubFqtNRY4Qg3tDy/VK1kQyAzRuQPvcSE/I31tV/bR9bBCCzwGZTOrGx8/Mf2vR0d8A8Kp+clmpzRbZPOzGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZI5TNxZT3y6TKxyWrg3hJtD8+hQ67fWO8ncRaQqWhY=;
 b=C216T5hRHzk04wH1Qo6t5sV5b1VWC6LUHuxWD2053JA9T4DAIo6PyZw8OHnbL9ohNexxavqJnVs0hu1rLkUf0+sEJ3RwZhS4pPimkwRT6iQCeQ6tWZ/1flvI3unmCvt1ZKJ/mHTEf1Lk97lSYejmasT2VsQ9E8cjYK42ripKM8inJ2fR2dcCh+qqPIWnr4JMB94b6nGJzgFWeOb4tNyB4iXhufAvDahkuEYYlWxJQI3egTF5zj0dOzNo6zcMfAa7qX/YuBhRxd8iwPBvu2xbHbUoOhlaZIsHF77QDrihjoehs3Mz81NIvqEERxIeZRO6dNYYjOcT5Q5+qgfGmJmOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZI5TNxZT3y6TKxyWrg3hJtD8+hQ67fWO8ncRaQqWhY=;
 b=Ji0Nrw/mN+zG7UCrnJJSqxczqwrSRIiaVP8+XJIxCl4BZtuG5ZqxZVBeUHtTtY6mUxkR/p9sV486XCG3j5tJE6oOdmaU0JskHizmdqTfCd7cgYeYLAsBkX6GXocX6EuiDv09xQulizZqKpVbJlGpzwXM7IfFuqJp76XQX/lMN8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d6f57871-c3fc-4a51-bec8-f9a12a048186@amd.com>
Date: Mon, 5 Feb 2024 13:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: improve handling of load/store instruction
 decoding
Content-Language: en-US
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>
References: <20240131175043.1488886-1-alex.bennee@linaro.org>
 <e82e5a15-88e8-4d24-b872-548b608cebbc@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e82e5a15-88e8-4d24-b872-548b608cebbc@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|DM4PR12MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 371e650a-017e-4e7e-6188-08dc26492811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oF1hBRAZ40n+Ci/v7tsgXxkdTKkKHGvbS1vNCObvArcWAlV93SP1v/uITB/l76vrHztfkjQ53vYJnFpk1S1Y89M4yY8VzojXzZu6GUBHSxLP4CGec1ct7r3aBRPEIhn9FCdFH5vZZb6XlTp3T6yE7ST7hODS2Xwipi5F6hVQMCyM9UNZ8reR6993Rolr58vLh86KtEQC4N+VsKSPhOZK+8iWnGqqB0QmGxgOH/VMqWFcxe/nv5mbOCmak1bUvlnYaU9RT/wOfBa/B2zzM3JGBk7SYNoQp1FuGOBIlmR45h1Fk5TwYc7Jkn4GugJLrRIs9aoV+eUO4Qjv8v2zL5BWpC4bcs59e6ApNcqf9pgFREtX5EXtNAzftTCLTxHY3muk1NcU6tvrXSXrIkE1KdxVvNuqmIf+lrTiP3kmHUMGJosF6OMX0DzMRx7H+Kfsb7XieNbnC4prwZuLNbZICoYiL7Ekl6I6/fYM6gdsvv/6elTArZstZa9wFKC5KaSa4u+fP+sodTYfsGXB/f1iyrKm25cE4wUJygZRxUWvZWJFnnQjNiJrMqdnVh12PKNtGUbh80Tl4q5W2Y7VFx0jAZQIP27k9y9dR9MZLn3+B4OnJt98alfj89DjF7RQHD02IYoqTd5BqMoO0GtpEAMyFMhQaXPmEdRrZAhZcf1+b+w4LG/LRAnQhlbvLMtdrHIzMR2mArF3EIMvAwJYCz+10IbEQ9IhtWuYs9LY9zEQUEMioL+7JcLsHmdQzluij6SNjxheZrvHsYYuscJDCVtTPOtiW4wKQg26GD/zxprg9uetRcU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(230273577357003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(31686004)(41300700001)(478600001)(31696002)(86362001)(53546011)(36756003)(426003)(336012)(66574015)(2616005)(81166007)(82740400003)(47076005)(83380400001)(26005)(356005)(2906002)(5660300002)(316002)(70206006)(54906003)(44832011)(16576012)(36860700001)(8936002)(4326008)(8676002)(70586007)(110136005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 12:51:22.5994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371e650a-017e-4e7e-6188-08dc26492811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5134



On 05/02/2024 11:42, Julien Grall wrote:
> 
> 
> Hi Alex,
> 
> On 31/01/2024 17:50, Alex Bennée wrote:
>> While debugging VirtIO on Arm we ran into a warning due to memory
>> being memcpy'd across MMIO space. While the bug was in the mappings
>> the warning was a little confusing:
>>
>>    (XEN) d47v2 Rn should not be equal to Rt except for r31
>>    (XEN) d47v2 unhandled Arm instruction 0x3d800000
>>    (XEN) d47v2 Unable to decode instruction
>>
>> The Rn == Rt warning is only applicable to single register load/stores
>> so add some verification steps before to weed out unexpected accesses.
>>
>> I updated the Arm ARM reference to the online instruction decoding
>> table which will hopefully be more stable than the Arm ARM section
>> numbers.
NIT: commit msg should be written in imperative mood.

> 
> I am not sure if the links to the Arm websites are stable. But from
> past, experience, URL tends to disappear after a while. This is why we
> went with the section + the Arm spec.
> 
> This also has the advantage that we can check any differences between
> version. So my preference is to stick the Arm ARM reference. Bertrand,
> Michal, Stefano, any opinions?
I would prefer if we refer to Arm ARM instead of links to Arm websites.

Also, looking at Arm ARM J.a C4.1.88 (Loads and Stores) the encoding is a bit
different compared to that website and includes op3 and op4 (op2 is 24:23).

~Michal

