Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14A477715F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 09:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581848.911285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU078-0008J2-OM; Thu, 10 Aug 2023 07:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581848.911285; Thu, 10 Aug 2023 07:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU078-0008GD-Kx; Thu, 10 Aug 2023 07:29:46 +0000
Received: by outflank-mailman (input) for mailman id 581848;
 Thu, 10 Aug 2023 07:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LQy=D3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qU077-0008G7-J4
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 07:29:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6768c51-374f-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 09:29:34 +0200 (CEST)
Received: from PH8PR21CA0006.namprd21.prod.outlook.com (2603:10b6:510:2ce::18)
 by MN2PR12MB4471.namprd12.prod.outlook.com (2603:10b6:208:26f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:29:37 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::f1) by PH8PR21CA0006.outlook.office365.com
 (2603:10b6:510:2ce::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.7 via Frontend
 Transport; Thu, 10 Aug 2023 07:29:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 07:29:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:29:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 00:29:36 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 02:29:35 -0500
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
X-Inumbo-ID: a6768c51-374f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDx50zOLApOqVCAJ/6RjYEN3Zq0BPun7ka51p9A7I6sGL/2igxxSuUK570MGb3mzRWobrJY9pcFvBJd1XGvlRILZsmZX3Grm8eWYx8hk3FGckeAi2o0KUyf/Kn0NxCj8FoHJKDEQu0hzc8DQWnYNWAovLNtKN5NMjFnICuyfBDSwVJZFcWcys7iHd1z/JDq/7jeIvDzz70C5T+5vAs/6pkGWrnUv8FIay3mTrK/HgqkqZYavIQhxQXrOeoHrwFgWkadiN3whLS7pdW6Njg9aZ+VRcealXGON/4tL6AjYl1+1JpGHuNZtZMaYqVcF8cOyHGDO023GAHoFTDgUo3axpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W45RutX8vcvxy5yxc9uJy4ve8MDtYjJCydP9pLv3qRw=;
 b=DEol5moB+F0SW6tin6tQFDEFM6Xmfst5LeX75GWWWqedNZ9806sQrCX6y2m7Y5C+A6Wq7Y+/jV6ht3kT5GDbaYK1S9uAwGDW7MgclNEn//R/lZSx4KviBRzDSkbNRITUqTRPyXL8XEVOls124Y3cREsT3355dwebH3MtFFbiElXoh0FSxBUfZMI500rYizV2gIjx96AEWm8we/ykbRU9a2ieEOKvirzNlGSVDjx3QrxMyuE3FE8LyvfKFzu5/eYSZCqUxRfuO7DmR0EL8gUAzCcCv3Z2uQIVxYAeIyHH/c+iFo6gWIfwRnT8T/+CoWWaJ+QCWo1D4HqSesLk3U4Ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W45RutX8vcvxy5yxc9uJy4ve8MDtYjJCydP9pLv3qRw=;
 b=t7OhO7b23TwcXqtz0UquoQadvNukJnTJORRUkThCN4ZEdFX+b4RkzeVx0gkGZEnmf1egYgEcP2vd0Du6S+MyPKq9N94gBDF+KRbtWc+UTG3k3G6sUlWAX382RGWhr6F1bXn6MZgpFj30O5srGv4/EZzrDn4axsxwVg/NtLXhAPY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e1b73e48-913e-2ffc-0318-51c460eae61c@amd.com>
Date: Thu, 10 Aug 2023 09:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] automation: upgrade Alpine build and test artifact
 containers to 3.18
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <cardoe@cardoe.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
 <20230810011803.311832-1-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230810011803.311832-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MN2PR12MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dde544a-fabe-442e-34dc-08db99738d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f3XyznELnu4e1zqNKUBXVHCF2zwAAyElk5mqoaaQ7AXkf4gta0hPi+q1UMnC4Y6+qsc0PpA8CH22OsmC6g9LfUHyOzI+LC9jL3bGx/eebZB7viC0HnAbbE2/UCy1fZbJ8gJfZkt5kd9gOvJdibPxMCHztLFvqdOwRkjDLkX5VGC4Grn+AOPhZxPTkF1zTzAEtN7AvO1K52koYJ4RSY/SXJHXR5YGpXQC4B0eXpoTp/J1RX2I4lEjIC+RzojKXq71aPZAq53Q2Xq/EciHPaBPldaqc701IEeq295UuRC0qx5E3C/STqwU+49LeVSESV0rhSbe0eu4/SBcX4I8UdztKttjzib9jukijkA/n4pz+tDSgSm6UkO0p+i4bLKCZ3+a/s8yfTebHw+Ys5HTFn3XchrAwPyNt39GppXQcdFgAaFHpBqt0tvObpEznHjB+1a2SX2C44S0KHflL6uHyrWBeL4rm8Cczj0QEgbyMbin3/a7BgJ2Yfhc6DoiMpzmNhqG3nMNByigYERjZQNl1saVz18OmpA6a76k/lvF6nQYPUkyMoWnv9wCuWCVrJe7/jzskl/4UCTZ51/qhr6A9pN1iUzki844HaHbbRre/Iqjs9PKE3cDNpH2TPB3OPbvUDnSVdZUtJjyzHILshot1xO2NTliS37ODSMo87xZoIjE16V7vMrH786dxecwDWrYeQBbtBFBJJDiGCy9Uuac+8F2JCJlBz3/Y9rJ4kSPG8aTDgjinqW0lcUYTWq+dZIVavhv48R2tgDbcoAgvN+G/WDEMDFnY2l1a556cXKxJowlSPUorSwymzTMe6xyhU4iUIVM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(186006)(1800799006)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(6666004)(5660300002)(82740400003)(26005)(44832011)(8936002)(8676002)(41300700001)(36860700001)(53546011)(316002)(36756003)(16576012)(6916009)(4326008)(70206006)(47076005)(4744005)(70586007)(31686004)(356005)(83380400001)(81166007)(2906002)(336012)(426003)(40460700003)(86362001)(478600001)(54906003)(40480700001)(2616005)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:29:37.2047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dde544a-fabe-442e-34dc-08db99738d40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4471

Hi Stefano,

On 10/08/2023 03:18, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Alpine 3.12 is EOL. Also update the containerize script.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

You could mention the python upgrade in alpine test artifacts.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


