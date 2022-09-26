Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021875EA963
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411915.655043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpaM-0005m6-LE; Mon, 26 Sep 2022 14:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411915.655043; Mon, 26 Sep 2022 14:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpaM-0005jU-IN; Mon, 26 Sep 2022 14:59:54 +0000
Received: by outflank-mailman (input) for mailman id 411915;
 Mon, 26 Sep 2022 14:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ocpaL-0005jO-Ff
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:59:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dee9a16b-3dab-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 16:59:51 +0200 (CEST)
Received: from MW4PR03CA0070.namprd03.prod.outlook.com (2603:10b6:303:b6::15)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:59:46 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::79) by MW4PR03CA0070.outlook.office365.com
 (2603:10b6:303:b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 14:59:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 14:59:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 09:59:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 09:59:36 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 09:59:36 -0500
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
X-Inumbo-ID: dee9a16b-3dab-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp+TEQsgNc4E8wW8t+bWEXPr7EqS2YCObHIjksipaX8CNmmDL7iM45vcCnjQGbgdbr1se56qEginHq/4+5slK84W9ZpcLBNZ2xveaQakcl6S+BKH05Xl26qJUbIy71XJQarYMpStUGYlNx3UbATS62rc/XVouLkuWf+G6cREjNswdV0O1K492/+9UOtTF+70L5t7w+4Sc5v3OcUtbS80b3T6rK5/r2lS2UBEjvdopt+i9MFf2B8rmSEy8h5nyS26aYKEco5400PPyP0+nWrPQ9xukBX0LrR6WADzYKIYKlu9CqCukCu6RqLoX6pzoYjgjdFyyoCPhiCy+qBpuGKO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpsHDvobjZSN/NAv9lqO/Wf0Q9sPdxa6UxR8kDW8pmw=;
 b=Ds0zdj3oaMnUdkjWwtk+ZoctftexLEpoht0pdV1HBpEcoSQGApQ6hIDkZ8JB/Lhaz2tITYc2TGXOCxE6AplNBau2/qA/QA/U+p9ilpUkwjYiGxpiUAfTMTXUTRDnTUYw7fsYuvBLwzJDhCiBj1lkrNkFcZmWVgruzlN+sq+O8MjQboXnqpf2NE1/T47QuC1NvOa+uF+oWXhwUIBmJI960WHqu1JbOfO395fb+2xzRzGzzBOddy19yVKrDtNZqLtwTMJjKWYQYyw3Dax0ouOo5BD9hli25kZNWWXuhsACP6YRTo2de5SGgKF6ndDlIVrkJb2Xt0JUhWsLjS2CwEC6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=stew.dk smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpsHDvobjZSN/NAv9lqO/Wf0Q9sPdxa6UxR8kDW8pmw=;
 b=x1JFxZWEeeLofGzosJ1OYcMcZ9ZgE16JkahGmZIib0lwHwMnDT4mjbvFFPNaQcjJFpStyMYO5MLPIaryLubq+TL9zazss2vBZA8jX4OdshHaAv77nZG+XI1oN3VRImxsAZ6grlWacSSdJ61wLjhQJ4Q0Hq8YqF7inLMZ49/aNN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <495c6147-17ac-ab4e-27ec-1cab394c57c3@amd.com>
Date: Mon, 26 Sep 2022 16:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 06/10] automation: qemu-smoke-arm32.sh: Modify script
 to use ImageBuilder
Content-Language: en-US
To: Stewart Hildebrand <stewart@stew.dk>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-7-michal.orzel@amd.com>
 <2abd4de9-5382-3ca3-5d2e-81ddc79d3b95@stew.dk>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2abd4de9-5382-3ca3-5d2e-81ddc79d3b95@stew.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|BL1PR12MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf3456a-d106-41f7-3fab-08da9fcfc079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CuMAkc6vzZ/a1eGUTAARlGBzH0vvM3tfG4D89pF1KJSUKUsKt/Myhd8fJMGiBV4oRcLywOgdyPhlAgmWZI0hITdV1c6vkb2jafpBl3E75X2Oea6I2gB4H4E5/IAdcy8fgVS9tOt511lRUuCaz89vgibWHYfaExA821odQibAdngo5sGDH2ktN3UFgEj5B0csrGYCgAoeyCmhzisppI5aRJ6WQh+BVuaecqSdYReSUxuVcRdlk/Flmx0ajbb5oOTra7btcezcceoBYb5WGM855H18eUil8cmKLItNzOMWFQTiA3qJpKZnBUvtJr/yHtY7BQ519beyt+jmAH3n8+yv8ziDJXCd1GQoH/tNWUmUAs9M7ObovekuUM4BR709OeRg3stp0uVVC9WAiDKJ7Qaheb4H/CcbjU3D91VeUSBbh9A7XD7986jo38Gg8t7KKWL+AYZBvNJ5pJ69N4yPD3Pqd9p2ZxvRD9+XZyzr5tFCfPVyzggdzH3SthKUtJ8GoZ1iICo9iPtDjgP0GzBbXmaLsiSlIQ0UgYnMAjeedwwyHtujqgK0umA0JHzzABgjKCi2dj7reYMPfqb0w51aPlQZqRIx5fvnclRPTqZ2A7aIVTyWhqno0H3Po+LUKxQZLwdnDHs1KDtOjZW2VtPN4TbTSBmnnAnZpOLpTNCGFkgvocTaBJv4s2Ar7DA8aW38Sd/aF0rbCHrLBAQ5et6B6Ek/R0F2G0Ro7tzfs+/HvsAMWQKVx7aystuUZ1Su9MMbQ6j6hHvzVMeQUxka4YRvWxeobLGuv1M9UwabizAq1wJxWHW52oW5HgGY5OzNbei0265zuPuZDsr4Tv/BlstrhVdsCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(316002)(16576012)(31686004)(110136005)(54906003)(4326008)(70586007)(31696002)(70206006)(40480700001)(8676002)(86362001)(53546011)(26005)(36756003)(83380400001)(36860700001)(47076005)(44832011)(5660300002)(82310400005)(8936002)(41300700001)(40460700003)(336012)(426003)(2616005)(82740400003)(478600001)(186003)(2906002)(81166007)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:59:46.0689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf3456a-d106-41f7-3fab-08da9fcfc079
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160

Hi Stewart,

On 26/09/2022 16:46, Stewart Hildebrand wrote:
> 
> 
> On 9/26/22 07:04, Michal Orzel wrote:
>> Take an example from arm64 qemu test scripts and use ImageBuilder
>> to generate u-boot script automatically. Calculating the addresses
>> manually is quite error prone and also we will be able to benefit
>> from using ImageBuilder when adding domUs to this test in the future.
>>
>> Install and use u-boot from the debian package.
>> Modify the script so that binaries are loaded from u-boot via tftp.
>> Remove dtuart=/pl011@9000000 because stdout-path in QEMU dtb is always
>> set to pl011 node path.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v2:
>> - add explanation in commit msg why we remove dtuart path
>> ---
>>   automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
>>   1 file changed, 27 insertions(+), 30 deletions(-)
>>
>> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
>> index 530f3892fdd3..765facbe4d66 100755
>> --- a/automation/scripts/qemu-smoke-arm32.sh
>> +++ b/automation/scripts/qemu-smoke-arm32.sh
>> @@ -4,7 +4,9 @@ set -ex
>>
>>   export DEBIAN_FRONTENT=noninteractive
> 
> While you are here, there's a typo. s/DEBIAN_FRONTENT/DEBIAN_FRONTEND/

This is a good catch. Thanks!
It looks like all the Arm scripts use FRONTENT instead of FRONTEND. This is clearly incorrect.
I will need to fix all the occurrences as part of this cleanup series.

~Michal

