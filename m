Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A63747BE4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 05:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558768.873148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGtPB-00087y-Va; Wed, 05 Jul 2023 03:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558768.873148; Wed, 05 Jul 2023 03:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGtPB-00085g-RZ; Wed, 05 Jul 2023 03:42:13 +0000
Received: by outflank-mailman (input) for mailman id 558768;
 Wed, 05 Jul 2023 03:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGtP9-00085a-Qv
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 03:42:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eae7368c-1ae5-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 05:42:09 +0200 (CEST)
Received: from AS4PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::6)
 by VI1PR08MB5533.eurprd08.prod.outlook.com (2603:10a6:803:12d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 03:42:04 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e0:cafe::83) by AS4PR09CA0003.outlook.office365.com
 (2603:10a6:20b:5e0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Wed, 5 Jul 2023 03:42:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 03:42:03 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Wed, 05 Jul 2023 03:42:03 +0000
Received: from f7af70dbc7fd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C30B975A-A8D8-45C6-9254-2C53C05A55C7.1; 
 Wed, 05 Jul 2023 03:41:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7af70dbc7fd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 03:41:56 +0000
Received: from AS9PR06CA0453.eurprd06.prod.outlook.com (2603:10a6:20b:49a::7)
 by AS8PR08MB6421.eurprd08.prod.outlook.com (2603:10a6:20b:31c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 03:41:54 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::6f) by AS9PR06CA0453.outlook.office365.com
 (2603:10a6:20b:49a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Wed, 5 Jul 2023 03:41:54 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 03:41:54 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 03:41:52 +0000
Received: from [10.169.172.87] (10.169.172.87) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 03:41:50 +0000
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
X-Inumbo-ID: eae7368c-1ae5-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4l64INYGwA55w8b43/Qs2oE0thWep9R23LFJjdMeJ8U=;
 b=g1g7mru9dVB0cBIq+bHLeN343TXwYyu423+0+P3wjuKjN1xhB37p9t8tKNvNIG5IQ/bSwqsUYgYOSf5xKP4uxeZN9nqj7bKFlVrzAAt3akc5InLBMGywY06ce1dWVKYc1Z1VMP34JmnrV2zTQ5lqmukC82Tj/e9/o7U+kJWUkdM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 680d2e592cbab0ee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLUi4GCGBaFRRcNBHO96+s8nbobbG4ugZRB5mRoiTu8qGBRc5fVWQw7zpC9Rx1+YiaX5AlSZRKKeRRiJNjIPv9dw7PdUgcV3FA43dhiNghSYstONXa04V0R6PLscA44O1pmdVsVJqHM+qXViaqHGZBHvQWYVpumQ+aFOYlP/8Mr1w7gOdgcriOAFd+63qecZeYMNqbqEd65n9zObHu9js4iLUf46go4p82A8cpCCdpYbzH1M4TJLQlVyoWvIqD+kNv0/u9XUhOQba5oWb4RRQYBvFbfsFiTRFQGCy0VSEgkysHlbrR8ad7nwwr09ogp+rQ15L3raVl74aWeETusvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l64INYGwA55w8b43/Qs2oE0thWep9R23LFJjdMeJ8U=;
 b=D+PNLWfIKRo/7gtLNRkF8ycMezqAp4qQBQL8dGVjjuPYUhONIXE3BKpAW+HZZHdjCmH8saPLHZtPQ6tU9vt5FNGJh+kX/fltmgx+m7AqsqAgL1itbT9LnLFgMmHQxuvgrCMd5ISScjnK8kDtRjvCsRnJNjQI+KUGVzXAvfp2RVLJPDff875FOz/5XLMk+fauZlbFq9USHqjyp9Q8hx2TV9d4gJf0N2YX3sytJBtOX09N4AK6O3jZJNSsM5I9Yz5ArzLtE3gksPtzBPc/uRG68zHs6WxXkiqJfOViVsZ1CoMkmd6YoJGJ4XP1rTbPm+Mx7oqbOTfDU/Vuo2sKe/wQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4l64INYGwA55w8b43/Qs2oE0thWep9R23LFJjdMeJ8U=;
 b=g1g7mru9dVB0cBIq+bHLeN343TXwYyu423+0+P3wjuKjN1xhB37p9t8tKNvNIG5IQ/bSwqsUYgYOSf5xKP4uxeZN9nqj7bKFlVrzAAt3akc5InLBMGywY06ce1dWVKYc1Z1VMP34JmnrV2zTQ5lqmukC82Tj/e9/o7U+kJWUkdM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <c5862fea-0ef7-1266-4c13-5b2735ad75c2@arm.com>
Date: Wed, 5 Jul 2023 11:41:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/52] xen/arm64: head: Introduce enable_boot_mmu and
 enable_runtime_mmu
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-6-Penny.Zheng@arm.com>
 <c10bc254-ad79-dada-d5fb-9ee619934ffb@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <c10bc254-ad79-dada-d5fb-9ee619934ffb@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT010:EE_|AS8PR08MB6421:EE_|AM7EUR03FT051:EE_|VI1PR08MB5533:EE_
X-MS-Office365-Filtering-Correlation-Id: b8036f74-d1ae-46c1-8249-08db7d09cc12
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 npBxPwdlf/vmoyVNCRvgdtrTSBkaoEgCYO01kbMLVPuoVcWzUkSYqgHLP0HQ4Qb+yhgQIusxaEKuxnakUDB6gAOdkTeX0pGAxFK5Nz9jtVUAXqrZgb7ODlq/tRDJNNkka8dZaykHYy63GVRYaB7jt8p1agNK4rBwZCDflHZvB2Fd6gjtBgvTsQLWE1sPmm/NXA7+ojjn0qHspCmpWcVt/g6wbo/cl0DkuNyYPkjN08zJmlhGeHMEIaWGl/600EXEElMkMNc+HrdP9u/vubU81yn9lDPTHajCAEeL191tODe8NQ6vnXej9LHtkTIvWuo7e/ceGPbMvpVmWX5KHqNA2f4q9n86NdbY23TeOh5HzKZgKfA7ZjIq8DQkJB2KpVGtL1cR2a/9XHhJsmgZJNFKvbpOgrJR+4jAKumWOA8HhQDARfbVHS9ZVwQMZY93yAQi2mLmRk22KtdM2gdASW5ObyVzLUxB0K0f2JGE2skugcYiAMfQ3THvP26QDeDmJ589hSR21fNbLopzBw+9T6Fq0lprc7g0aN3aJpsPy4As3sO3gmz0Z0odHskCeXStaSfayM+E12OMdbmKCjrWXvnwlagteR+odEvouen749pX4UVCY4svovzL3azNxw1EO52bIE3VYc/tOUB1eQwE3Z8YFUNN2wTY0uKyeg3jF6qZdD26L34mAYRDGuaUxzPP5KyLKoNjs5sZW9NVC5e97wuYfeQNUkw1rBtBb0ZsGWn0Ttz9g/hOo8lY/KCPi0EVNheeGoQKCQpZxcUFdQcssxpXVEwQAZOuvRJ5Qj+fZ5UKKFCI3C0ZZAcrMa12Y8qtaQLF3mE50Tlog0iOWmZ8xD8+VA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(2616005)(4326008)(70206006)(70586007)(81166007)(356005)(40480700001)(186003)(16576012)(86362001)(36756003)(31696002)(54906003)(53546011)(26005)(478600001)(40460700003)(82310400005)(110136005)(36860700001)(8936002)(8676002)(44832011)(5660300002)(31686004)(66899021)(2906002)(47076005)(41300700001)(82740400003)(316002)(83380400001)(426003)(336012)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6421
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17f6beb2-3477-48bd-4814-08db7d09c674
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yu4kxCnEkU59aR+a90jCrl6dvIrZKC2zRke1+hUrLx0i9jZYUpovxCFr4ZIFaDtx2nJdJUk98CG0b9+s2rEA1DuSz6Cc8dVhb/SSp7nqWBgr5znH3AFdTIinq0gNzRfjWQ9g6z+GDJwOdkfkl//mTiEvOybn64ZzAL2R2k4qBJTHCDjxQ4QWKhUxQBKDKjrFzVFGfumCVSMQBVC3NFjWMrCyug7J3iseCo1dwHQ978GlcXPvIG4AHw2bijy8Bz3hlsKSemC8bC6DY3r/nXy2GY5L/jZftxQeetFz6VdB0mXQopDO/UhVpWdGqomd3YwB68doBhk0S33j+NvAG+o3JHDt/cG0UBQev0DnCggkcdN6kYqevrETzWNEHoX6Is3svwLKFzUmJe6gJXRULE1chXE5WQxqDfeqibmRBNS5Mm1kn3VM52x3AVepu01faEg9t/DwiPuBLVM4325IkcPNCwBs9VF4OEUC/zK3A1+uWMDDnbWB95ytKVtjx/Q1DsgLerpMk1Su+YPH2LUSIMaZh45rG0fDDuKl8IomYGREqiempFVddztyY+7G847K5VXRVHOdzxJUpWgeAd1owHVXvm8Pa/Uhncj4you0+Xz0hFrQe+hmpPCq/jFYXGkacjPtnma0YpkZKDkTC1BSegRFx7nSnm7X4NqMcP/41VUUpWjwUDeb/0xewU+C3w4+g88hx/GcYKMJbJaGSydzKzxyRib8o4Rp2Kk+R/QTYvI8wkNpyLbOdOl8G2e2i8MLx878BWuowC1sbUIUsnSJlt2PJ0eDXktVnrPAJGKUQOeVTR6co5eFXy5ys6Secbk1v8Su
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(316002)(16576012)(107886003)(66899021)(26005)(40460700003)(53546011)(186003)(41300700001)(54906003)(82740400003)(81166007)(478600001)(110136005)(40480700001)(4326008)(82310400005)(70586007)(36756003)(2616005)(426003)(336012)(2906002)(70206006)(47076005)(86362001)(31696002)(31686004)(83380400001)(36860700001)(44832011)(8676002)(8936002)(5660300002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 03:42:03.4218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8036f74-d1ae-46c1-8249-08db7d09cc12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5533

Hi Julien

On 2023/7/5 05:24, Julien Grall wrote:
> Hi Penny,
> 
> On 26/06/2023 04:33, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> At the moment, on MMU system, enable_mmu() will return to an
>> address in the 1:1 mapping, then each path is responsible to
>> switch to virtual runtime mapping. Then remove_identity_mapping()
>> is called to remove all 1:1 mapping.
> 
> The identity mapping is only removed for the boot CPU. You mention it 
> correctly below but here it lead to think it may be called on the 
> secondary CPU. So I would add 'on the boot CPU'.
> 
>>
>> Since remove_identity_mapping() is not necessary on Non-MMU system,
>> and we also avoid creating empty function for Non-MMU system, trying
>> to keep only one codeflow in arm64/head.S, we move path switch and
>> remove_identity_mapping() in enable_mmu() on MMU system.
>>
>> As the remove_identity_mapping should only be called for the boot
>> CPU only, so we introduce enable_boot_mmu for boot CPU and
>> enable_runtime_mmu for secondary CPUs in this patch.
> 
> NIT: Add () after enable_runtime_mmu to be consistent with the rest of 
> commit message. Same for the title.
> 

sure.

> Also, I would prefer if we name the functions properly from the start. 
> So we don't have to rename them when they are moved in patch 7.
> 

ok. change them to enable_runtime_mm() and enable_boot_mm() at the beginning

>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>> v3:
>> - new patch
>> ---
>>   xen/arch/arm/arm64/head.S | 87 +++++++++++++++++++++++++++++++--------
>>   1 file changed, 70 insertions(+), 17 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 10a07db428..4dfbe0bc6f 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -314,21 +314,12 @@ real_start_efi:
>>           bl    check_cpu_mode
>>           bl    cpu_init
>> -        bl    create_page_tables
>> -        load_paddr x0, boot_pgtable
>> -        bl    enable_mmu
>>           /* We are still in the 1:1 mapping. Jump to the runtime 
>> Virtual Address. */
> 
> This comment is not accurate anymore given that the MMU is off.
> 

I'll remove.

>> -        ldr   x0, =primary_switched
>> -        br    x0
>> +        ldr   lr, =primary_switched
>> +        b     enable_boot_mmu
>> +
>>   primary_switched:
>> -        /*
>> -         * The 1:1 map may clash with other parts of the Xen virtual 
>> memory
>> -         * layout. As it is not used anymore, remove it completely to
>> -         * avoid having to worry about replacing existing mapping
>> -         * afterwards.
>> -         */
>> -        bl    remove_identity_mapping
>>           bl    setup_fixmap
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Use a virtual address to access the UART. */
>> @@ -373,13 +364,11 @@ GLOBAL(init_secondary)
>>   #endif
>>           bl    check_cpu_mode
>>           bl    cpu_init
>> -        load_paddr x0, init_ttbr
>> -        ldr   x0, [x0]
>> -        bl    enable_mmu
>>           /* We are still in the 1:1 mapping. Jump to the runtime 
>> Virtual Address. */

Note: Remove this too.

>> -        ldr   x0, =secondary_switched
>> -        br    x0
>> +        ldr   lr, =secondary_switched
>> +        b     enable_runtime_mmu
>> +
>>   secondary_switched:
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Use a virtual address to access the UART. */
>> @@ -694,6 +683,70 @@ enable_mmu:
>>           ret
>>   ENDPROC(enable_mmu)
>> +/*
>> + * Turn on the Data Cache and the MMU. The function will return
>> + * to the virtual address provided in LR (e.g. the runtime mapping).
> 
> The description here is exactly the same as below. However, there is a 
> different between the two functions. One is to deal with the secondary 
> CPUs whilst the second is for the boot CPUs.
> 

I'll add-on: This function deals with the secondary CPUs.

>> + *
>> + * Inputs:
>> + *   lr : Virtual address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + */
>> +enable_runtime_mmu:
> 
> I find "runtime" confusing in this case. How about 
> "enable_secondary_cpu_mm"?
> 

Sure, will do.

>> +        mov   x5, lr
>> +
>> +        load_paddr x0, init_ttbr
>> +        ldr   x0, [x0]
>> +
>> +        bl    enable_mmu
>> +        mov   lr, x5
>> +
>> +        /* return to secondary_switched */
>> +        ret
>> +ENDPROC(enable_runtime_mmu)
>> +
>> +/*
>> + * Turn on the Data Cache and the MMU. The function will return
>> + * to the virtual address provided in LR (e.g. the runtime mapping).
> 
> Similar remark as for the comment above.

I'll add-on: This function deals with the boot CPUs.

> 
>> + *
>> + * Inputs:
>> + *   lr : Virtual address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + */
>> +enable_boot_mmu:
> 
> Based on my comment above, I would sugesst to call it "enable_boot_cpu_mm"

sure,

> 
>> +        mov   x5, lr
>> +
>> +        bl    create_page_tables
>> +        load_paddr x0, boot_pgtable
>> +
>> +        bl    enable_mmu
>> +        mov   lr, x5
>> +
>> +        /*
>> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
>> +         * to the runtime mapping.
>> +         */
>> +        ldr   x0, =1f
>> +        br    x0
>> +1:
>> +        /*
>> +         * The 1:1 map may clash with other parts of the Xen virtual 
>> memory
>> +         * layout. As it is not used anymore, remove it completely to
>> +         * avoid having to worry about replacing existing mapping
>> +         * afterwards. Function will return to primary_switched.
>> +         */
>> +        b     remove_identity_mapping
>> +
>> +        /*
>> +         * Here might not be reached, as "ret" in 
>> remove_identity_mapping
>> +         * will use the return address in LR in advance. But keep ret 
>> here
>> +         * might be more safe if "ret" in remove_identity_mapping is 
>> removed
>> +         * in future.
>> +         */
>> +        ret
> 
> Given this path is meant to be unreachable, I would prefer if we call 
> "fail".

sure,

> 
>> +ENDPROC(enable_boot_mmu)
>> +
>>   /*
>>    * Remove the 1:1 map from the page-tables. It is not easy to keep 
>> track
>>    * where the 1:1 map was mapped, so we will look for the top-level 
>> entry
> 
> Cheers,
> 

