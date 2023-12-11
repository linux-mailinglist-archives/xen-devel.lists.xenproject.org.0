Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617AD80CA81
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651778.1017587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg03-0001R5-Mc; Mon, 11 Dec 2023 13:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651778.1017587; Mon, 11 Dec 2023 13:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg03-0001Ow-Ju; Mon, 11 Dec 2023 13:07:07 +0000
Received: by outflank-mailman (input) for mailman id 651778;
 Mon, 11 Dec 2023 13:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCUY=HW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rCg01-0001NQ-Vx
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:07:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d409092-9826-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 14:07:03 +0100 (CET)
Received: from BYAPR11CA0101.namprd11.prod.outlook.com (2603:10b6:a03:f4::42)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 13:07:00 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::25) by BYAPR11CA0101.outlook.office365.com
 (2603:10b6:a03:f4::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 13:07:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 13:06:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 07:06:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 07:06:57 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 11 Dec 2023 07:06:55 -0600
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
X-Inumbo-ID: 2d409092-9826-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPbkt7hiRez5ewAOK8zRxjnFEU7M+Pn0TOBCROzUEcgJgZF6xgVvYL5efIF1c5lEG6uvI0l8y/MHYwQyoqm+I2hs67fjLzNTUK+ddYEKIstp4cBhuBDxm7FLbrYHCT6MDWC78V4ZaweWZWFVaQhE2jtMS3IdpFwnTyH0utdoGO0YqV+51cGbCADg6v0wuj+3U2vG0dwhdILjI4wcCt4/f5ei53JimWnfu40GarzTDol4qq/AD1fFXPnLBVNpsWMiCkKFpJLyoEdW7nd6ICV8d/YaLD875JGExhA5v3YcusPYYp1kEKwCwLmW0xdFmmqACWmlINKMkcj1YIpnLQn0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki6pc6WA00/Ip1SDCjI5lfGfFFY+R+iOGMs3/8kABJA=;
 b=MSaZl9MTaEbB4tn51nDujHl4TIqBMLgYGqmASOu9RVeWaqvD/I1ZcKNDintBfSkW2Xwo4/L9iwLnF8/E08p/OrqF7UjuY5to6zGDfdzsqM7ukRqotWLWGEuo3lfgk5TLnYUCi1xEOtjtoSTHOsCaCao943GIfsCS/virRAHQZUjZgSiHj6T4RvghEUXL2Xz/uT6shSd3Vskh/FqCLGcB0krh5s7DDCdJovUSfrS4rAKWFrzz5IJ8t2tYsGehKv+U7O1gZNC0TJqmiG2zjTqP0xH67gYyIk0lKVY2Vom16kWzv1Fn/vn1CiBROc2MyVrKT/vtJcEnzW1LdN6psSOOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki6pc6WA00/Ip1SDCjI5lfGfFFY+R+iOGMs3/8kABJA=;
 b=P4t2vPH5kvg6QbBgAG+C1+xD9km3tiboy5syc2uj7P/NTbEtsJ5xqwbRSv3TCQdaXG09WZFHrsC/8X2MCsEGIe9LM50XgBo++iuGLrpKfmNlsanHVuksvoI7JVTNIBHNtxAmfPZzlhi3j66Z98ZK6S4gRSa7/3GaqVJ9Iaq1HGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0f554dea-60fe-409a-935d-87f3eac30a87@amd.com>
Date: Mon, 11 Dec 2023 14:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/arm: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, <xen-devel@lists.xenproject.org>
CC: <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <4c0d38f2b707afa9aed1853a99d286fa2424fb9d.1702283415.git.nicola.vetrini@bugseng.com>
 <e86f46bd-b404-4feb-82f5-90c52837e169@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e86f46bd-b404-4feb-82f5-90c52837e169@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: dc87a61a-9175-41c7-893e-08dbfa4a0f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0BdzPv23cge4bwsWwzixx7DzCbRaGkxNyMfrrPXszfvkbz+3Fv2WnfBU9+mUlUjS7K7eO7f7NSFO47LhaGeam1vASrEQc20k6NqOh8y4ssK7df24b7bg5LgP6/GCKia6MAWorOOs9xgVxYAgJEJJ7wl+TsLZbwLKIeEpsFwozoxBsi+RT6e2qYHYq8ehIzih2ptOMNYcEdEzsxRynPFrESgqscdX+lVdK9I5eRIam6W597oBh15JRLZlwcgRkNCSBWAx9LRJD8ssvOYQqapwS/coH1mDhNwLsZddhaw1yyMS+VoqZ5JrIO9ajuormjzncdbrkgFq4ffkywLDf0uwK4H+/pJQZyFKT0kW+zmxTZ4FI5+Wq8y2/M8HI95ZqCxEJGQS01h+og2lMv47+4+6WRWkuuW++EemqBR3bFA5DhepcqAwtUgms2H5b/TShci296BGCqzUUAZV3/vGoMGltgL/NHAfxFMR4Y3BmpsjC98PHTt09AknYKhww9YLNh64BcU34/DqPwxVw+MiQS+3Isx6qZ1LGGGQlTbdeEnxtIArlnEJFMsUIzH5VnIIFjJ1A1OWX5frBw6WkAHMIg9WXScDKZ4QzXoh8SXbmgAzDfPxclwIOYu9cl3qYl6uqgZV0Mj1Piam0YKJXXafMaUGflUx+k/z4PBvyN8xs0ShqwCi0pNHexgA4ukt/cxLZEhvIwivaHHKP1MydyrKjOlb9QQBdn9nOQIMzVp1CFBjtqHrcNOyzm4S1H9e0iMm7xdg+7+kvzDbnpKxFoGHPKQ2+FJAVehAWa8E4jr00KV5dkOPI9h7L41MBXqNz+0fWTFq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(40460700003)(53546011)(36860700001)(5660300002)(47076005)(26005)(336012)(2616005)(44832011)(36756003)(426003)(54906003)(70586007)(70206006)(40480700001)(4744005)(2906002)(31686004)(82740400003)(41300700001)(81166007)(356005)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(110136005)(16576012)(316002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 13:06:59.2692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc87a61a-9175-41c7-893e-08dbfa4a0f4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523



On 11/12/2023 13:29, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 11/12/2023 10:30, Nicola Vetrini wrote:
>> The "return 1;" statements at the end of some cases in the switch
>> of function 'vgic_v3_its_mmio_write' in 'vcig-v3-its.c' cause the
>> unreachability of the "return 1;" statement after the switch, thus
>> violating MISRA C:2012 Rule 2.1:
>> "A project shall not contain unreachable code".
>>
>> The same is true for the switch in 'arch_memory_op' from
>> 'xen/arch/arm/mm.c'.
> 
> For both cases, I actually much prefer the "return" version in the
> cases. In particular for the vGIC emulation the switch is quite large
> and it would not be trivial to know what happens after the break.
Because of this...

> 
> IOW, I would much prefer if we remove the "return ..." outside of the
> switch.
wouldn't it be better to add ASSERT_UNREACHABLE() before this return instead of removing it?
This is what we have in e.g. vpl011 and it prevents mistakes.

~Michal

