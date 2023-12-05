Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B3805947
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648105.1012103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXor-0002Af-Il; Tue, 05 Dec 2023 15:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648105.1012103; Tue, 05 Dec 2023 15:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXor-000299-Do; Tue, 05 Dec 2023 15:58:45 +0000
Received: by outflank-mailman (input) for mailman id 648105;
 Tue, 05 Dec 2023 15:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAXoq-000292-2q
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:58:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e88::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 292e4511-9387-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:58:42 +0100 (CET)
Received: from DS7PR07CA0020.namprd07.prod.outlook.com (2603:10b6:5:3af::12)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 15:58:38 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::63) by DS7PR07CA0020.outlook.office365.com
 (2603:10b6:5:3af::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 15:58:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 15:58:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 09:58:36 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 09:58:36 -0600
Received: from [172.28.155.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 09:58:35 -0600
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
X-Inumbo-ID: 292e4511-9387-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsDWTFxDxEpnsvbZsOw6hT+9PASCp+8Vfj2bAtK5I2cfRh/r7wfCf2+P6XBTWgOPsh8nKzaiJBFLG2AOz9FnknU+/1n9MWtfD4d0lsmyu8reehIyxwfxHicimVGfItfXdXftXdhuqNRdlqIZaQafhLlAlsijxCKj7/NszW7gqRDqt7WZ10h8JiYtsgiBTkQkeWoILIZ3h3xBHvJU6wjAMA459OZg/eNZikVa3OJsaHQ7riRTNOSyN9qgGh7XOkQ7tzR8fmBf3syNcYp3w+m4Wfb0nkl50RU5TbZSBlnUHbIE63vaqkN4Cg06u+trXk5Yl210DEeGi0BrvMEh+f3RDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6Qv2sumMp0z0+JOdOass0gdxmxpJDwIOQMq0mZfz7I=;
 b=Qx5jV2V5nUYphWilV/7AePDhr4i8/VuXsVvoAUUa4JEOZbLqELmEmzdJxHMNi7Y+7YciSKedVyFo2Xmd1BrPbpaIURb6FRlj9RaLHBzssGByVH3crkZZ9vGYu5BLXI8NP61Izsu94378v9Rc8Khg6KC5LF5e5QpVbOS6O+iBsoD/3uMDd0bnRzk6Jyvjo5yfO0WaJDN6QTnIWDChsye+FwVLFXP+ILilZ1lXa/+24FL4lQxe+htHKDXKcCGbo8asBL8lo59ODLiDOhThrUX+hVbiDXZ+3lANQWJTFMBT+JuKDGRmiTcAkh3cjmfOgk+aaFGT0Dd+ge9lN93J/M7HHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6Qv2sumMp0z0+JOdOass0gdxmxpJDwIOQMq0mZfz7I=;
 b=01CQgpSpuqXTzK1yKc+2wXsf848TVBQz0BKAiyzyGlNa1I3R9pWnM8oLecH9sCAdi5z46t3l7DQpk0YikwCMMrfvO/h8/6VzEEPUyB7GyxjhwE2UdjUpVlF6N4azxPDqqR1/JM375sVJtY2Jeex6j8KRuJB8xXcLKcR0BaSAVUI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d9cdf228-3094-40f7-a023-3c820e57a9ba@amd.com>
Date: Tue, 5 Dec 2023 10:58:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ed6be2-17c8-4d84-730e-08dbf5ab0b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7wtmHnerj5/UtOt0QPVzP6Jt1zPQh7jrDL1kXN+sgdl/qAToww5ItA85xLL/ZpULB3fDfHNP1g++jamB6EzDpVWigv8H9RgRCXfuwOyiGwWsxi22036e6uO2GJojbp2EiNOsErtksoMCFIUGPULiDvhjlRq5NzqgMWCfp1W68xgrlZmfrtrq2Zm3HMC7++DbSY2vcuhtuMO2Q2fmqBnoE86uzsRl7D3GX5OEgDZkLYggw5v22MrvBlW8mmLwZedqoShLB8E2u2zBJvD6B1FGdmxMYhFAQ7Sg0nt/1mWYxWirtwDQ054+PcGcIuJx4bEmOdRt0pUV6vW75FOjCGoyKECNaN2y5Nl38ijyoDOCLABh3Zlrgjtn5Dy+mdlE29wyMrzBRBsPCtiUQgStRS6IqOjAYCUXdCUyNmjyoheTNw7svcN6HWIMHP0rG74yya3VJYLY/l/fH536u295h+m3pDa6DICLYbD0gOIC8IkmXV04t1xmB6uPwLlsuiv7DPu1m9ZMwQ1OvsU782GWLBAhMEeBgN60JbswZ10UqjQsInj795IoAxBhIqW+JucfTrLAa1lP3jRaNeC72foFN+qHxr4ohaXHjE9TZzmWfljPOy5jjelDkXiaAMkevTufQngRqHkB4zG8ozOJy9te7BbD4l7B92DLzRLBKZxIrOA+YEJlZammjWEv9UI+7OlFVvrmj9oFmGMA7/TPIDkGLub5xbcVkKDznjnsPi2Hc0Jp1zdSUxoCakPCXc8FbqzwG0nyw9fOl1gInVUVnycLhG1POGH6Dl1UHPjhv6chWZ4FC0E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(82310400011)(64100799003)(1800799012)(186009)(451199024)(46966006)(36840700001)(40470700004)(70206006)(70586007)(40480700001)(356005)(6666004)(478600001)(81166007)(36860700001)(31686004)(47076005)(426003)(40460700003)(336012)(82740400003)(53546011)(8936002)(4744005)(2906002)(8676002)(4326008)(5660300002)(41300700001)(36756003)(86362001)(31696002)(44832011)(16576012)(110136005)(316002)(2616005)(26005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 15:58:37.4432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ed6be2-17c8-4d84-730e-08dbf5ab0b07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628

On 12/1/23 20:27, Volodymyr Babchuk wrote:
> Introduce "fail" label in init_bars() function to have the centralized

The name was correct at the time of submission, but since then, init_bars() was renamed to init_header() in staging

> error return path. This is the pre-requirement for the future changes
> in this function.
> 
> This patch does not introduce functional changes.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> --

NIT: The scissors line should be tree dashes, not two

