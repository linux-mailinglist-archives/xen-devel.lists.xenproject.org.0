Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F264B244
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460316.718200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51Vb-0007QA-3D; Tue, 13 Dec 2022 09:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460316.718200; Tue, 13 Dec 2022 09:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51Va-0007Mj-WD; Tue, 13 Dec 2022 09:23:31 +0000
Received: by outflank-mailman (input) for mailman id 460316;
 Tue, 13 Dec 2022 09:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p51VZ-0007Md-GV
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:23:29 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a5d295-7ac7-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 10:23:21 +0100 (CET)
Received: from DS7PR05CA0054.namprd05.prod.outlook.com (2603:10b6:8:2f::28) by
 MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 09:23:25 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::38) by DS7PR05CA0054.outlook.office365.com
 (2603:10b6:8:2f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.6 via Frontend
 Transport; Tue, 13 Dec 2022 09:23:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.7 via Frontend Transport; Tue, 13 Dec 2022 09:23:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 03:23:23 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 03:23:22 -0600
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
X-Inumbo-ID: c8a5d295-7ac7-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzBnqb7XrD/Qf6MKIjJ7PgMYaOklaLIMOgUMXsiKKhMKzmpVMg9yJH4nudZApuCNHKjKIxkGf2vyrO4yQJNKGry4cJjSudqbkPNS1vtn6yzIzXurhBqQ+ZuqPBbWgIhw244LIAA2TFWiI7omNzL8MmvoPFZWhWn9ZrD+fsG7SoibkU5gh1SbxSpSwZ2cP6GOKkmh/sI5nVabgZe4tBlRSf/J9IKLaK0gnUDRKMB/VK5XEBdvLuDP1r59FssPmTYbIO1ybXS1Y7bdgr5EUdH4NyBo6Wk5CrU7XYJnq6TXgfTj/0V6n9t5FaIOfWDyFQIbTaUCQ2VYSefCHWftBhJ3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8Ok8/F4ZfkpY+SoWaLL0+xyQKIus7BpNIU7NP/+sP8=;
 b=nm7oTkYsouF+akGwlPVg8QFZOh5+Eb0Ut/Jz2pFrijoJdfAdkWSsh6P8AdRemV3k5UnshN6uZ8jN0lKZ4sZpO55sluTnE20Mr4lsqfxXS56i9VOpJUh71GD/gr45420Z/ymLOnH3xT7XVIbmhPAqP9H+ylmbQjTXRwiYaRTTTHK/y3lYdt4efssJdEcUk7Xzg49m0nFh85uO72buIXjG4RHtJ0l/OOjpiFOW2UQlYlOXgIo0Kq1PSEd65/dT/YFCAE5VPzRHlIJINHiVWMRlhAReOANesPZOG4rtdOGU3vjShtbsdlTlfz0fOHZ0vpVBM+Pgd61EkoCv35Zl0iVnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8Ok8/F4ZfkpY+SoWaLL0+xyQKIus7BpNIU7NP/+sP8=;
 b=VqzC0uwq1ORKVvvw61dwBO/Y1f/J42GqOrhmWA7gAWeRKT6S9jGvytVQe7BuIBkyAbAOUte5YciwE6+NSgAgvO++K/+N/RiEzFilq0btwgfK0PHLHzypsI9UIlLJB6uLK/G94SUeIeZRVw/t+bkJfcBD7N08vOU/JtyQXbOLGwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1ce91eb8-a445-11f1-9dda-59983eb5d3ed@amd.com>
Date: Tue, 13 Dec 2022 10:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 02/18] xen/arm64: flushtlb: Implement the TLBI repeat
 workaround for TLB flush by VA
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|MN0PR12MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: c995b87f-6614-49a2-6f0b-08dadcebaf58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C/ZDl8ZzQyitiKzlPNXVqmMKtJNPsmK0r6yLr6FE7E6P/UoFK0dgnzAChYhUfmqdVZ+qPUHU7ONUnX4/ya4tmtLd0WLtY1d3f+RyQRGzX/W4ck3pt2i4W04kD1Oeq26Z8H0JFj8hGJAK4aOem8j4V9ZstaKrdVTQQqdLBKb+hguFPi6irDjARrfNwi/pA/Dsax8HezeXFAXFrNQZkYb0ww+rdfHB0rBljU5566bhmMdhOo9WxNLnklvNXF6sgPLUXkvDTQCMYpMeBEUbK1uHm5KmHepZsMAQpMUjv0f6k+mWkwYiRctWEtCZvBDhux/1QYRpqo60AOyX3u6XVvUoyjjuepavcqu46zd9HIKLMA/KZrzwrujxGsarL6GmwqF0N/Yfqemxxqd1Ws5+zRq0rr6y8U+viOJTdXlq1O6S3ZK8I+RL9nwqu67wZYx14o3tatghVjtsmOLLZCyTjAfc8xB3LIkYdOrSUOX05zJcB8eRmwId6eKJJYg9o397x+m7uFbjeWef8jMi32EUyQ+cB7U9HwogTaZcSh2+tln6ZEtywcQp4TnL9jXzeiV90XKqt5LVSDrEgRsfwoyauAQEZNjMDgwa53wuKYLq1i3bv/h8Jr0c1yJFFQb9smPY+Mcalsly3Bo8OsPHiRDJpDYkjMrX/grdBfW0u23JcMmNcuQmFFDt2TCd+neUGvGfmsNlUNXl2P4NtcZKZQbTHnemLIWyyjnbiTrKR7wSN1SM6sPO4gJZkusEi0zyCXCd1+o89qAajNxWXLYAayC3A9HnfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(31686004)(4744005)(41300700001)(4326008)(40480700001)(31696002)(8936002)(44832011)(19627235002)(86362001)(316002)(70586007)(8676002)(54906003)(5660300002)(70206006)(110136005)(16576012)(478600001)(356005)(47076005)(82740400003)(81166007)(336012)(426003)(53546011)(36756003)(26005)(186003)(82310400005)(2906002)(36860700001)(2616005)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 09:23:24.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c995b87f-6614-49a2-6f0b-08dadcebaf58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Looking at the Neoverse N1 errata document, it is not clear to me
> why the TLBI repeat workaround is not applied for TLB flush by VA.
> 
> The TBL flush by VA helpers are used in flush_xen_tlb_range_va_local()
> and flush_xen_tlb_range_va(). So if the range size if a fixed size smaller
> than a PAGE_SIZE, it would be possible that the compiler remove the loop
> and therefore replicate the sequence described in the erratum 1286807.
> 
> So the TLBI repeat workaround should also be applied for the TLB flush
> by VA helpers.
> 
> Fixes: 22e323d115d8 ("xen/arm: Add workaround for Cortex-A76/Neoverse-N1 erratum #1286807")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


