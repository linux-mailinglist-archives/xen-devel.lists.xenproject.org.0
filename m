Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6167496FC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559727.874999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJw6-0006LQ-0s; Thu, 06 Jul 2023 08:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559727.874999; Thu, 06 Jul 2023 08:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJw5-0006Ht-Tl; Thu, 06 Jul 2023 08:01:57 +0000
Received: by outflank-mailman (input) for mailman id 559727;
 Thu, 06 Jul 2023 08:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUoY=CY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qHJw4-0006HE-Qu
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:01:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd66498-1bd3-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:01:55 +0200 (CEST)
Received: from DU2PR04CA0341.eurprd04.prod.outlook.com (2603:10a6:10:2b4::30)
 by DB4PR08MB9262.eurprd08.prod.outlook.com (2603:10a6:10:3f9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:01:51 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::ad) by DU2PR04CA0341.outlook.office365.com
 (2603:10a6:10:2b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 08:01:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 08:01:50 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Thu, 06 Jul 2023 08:01:50 +0000
Received: from f2a780f975cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CCFBD23-7725-480F-BFDA-F619904B0565.1; 
 Thu, 06 Jul 2023 08:01:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2a780f975cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 08:01:44 +0000
Received: from AM6P195CA0085.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::26)
 by PA4PR08MB5949.eurprd08.prod.outlook.com (2603:10a6:102:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:01:41 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::84) by AM6P195CA0085.outlook.office365.com
 (2603:10a6:209:86::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 08:01:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 08:01:41 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 08:01:39 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 08:01:39 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 08:01:37 +0000
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
X-Inumbo-ID: 5fd66498-1bd3-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjFlBriCUqIiYxpiIcklky5G1qQ7Ym6ZrrTYNXjCpO4=;
 b=mVyW2LhEDol0xVTD3Hp2ElGKEv/0xc7VrWYFu/sxBNeFCruHTZ7Y28+TxxeQm510YTuAC09T3u5ImkN7/tRRmLBy2mzSMQ95rMWw+xzVVdteGfJBF3kRTgMaFTsvrM0ge01m1O9W1qtCQEG36rPkJZ1dVKl91R/sPa1x1WLc6AQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc8f29814506501c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWP1V9GP7jBnLn6sET0Hg8EFRCScpdSw7pIafUACdCfbZnfPFBJHrT7V9VWxzqPclAF6b5uiokJK7aws+w5yPw5oOHjCbXVNGBvD6Ac1Gna7T67fzQhozhuVBADsI+nBhghdnqtP/ZofIKVWJ0ckdc5sd+yCG+tB0mNHCTnQtRd+q4HTikhuGSFbV6ijxouSNxGx8VtX6jMOxdA2X5RzMgdW7TYIICh+aVTqzYa9dqATo2ZsNdxkqTmwLfJpjJZC8JzV8g8s7Q9t3OlknYrlKFaJDlg1pby9U3pNV5OYyRBE6rao9JHcfslShSi5jTBNmry+QF4g52LVpWmpDgtqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjFlBriCUqIiYxpiIcklky5G1qQ7Ym6ZrrTYNXjCpO4=;
 b=J89jVbwh70o6LhbZQglRBt9SZ70oEUlHkbzq6fJuA0OFyf6jZUhZhD958UrB4AHBA7BFjp0AbM75ST8cuhxGitITQJ4jxnhT+vd6CDm6wWJWmCtJMZr/N7WHjXtP05u4XbKsKg7PPJ6L96QeeBerT128m2fR8K3NRfBD/Oc6DJ09kzT/359pXpNTH/OKninXbKtJfFgkxrfR5P2AAJKLeqGBPxXnkvmoQoBFUj7HR4Kl378KjNdBSxmRNo3mZiWGFuBWO1iyC3bl/cbi918bio6rJO88KnTxJ62Y5YQ6Iyv2ToHiVVCf9AHbRncs9Ge3YOYB98vvHQBHB9YPZk8YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjFlBriCUqIiYxpiIcklky5G1qQ7Ym6ZrrTYNXjCpO4=;
 b=mVyW2LhEDol0xVTD3Hp2ElGKEv/0xc7VrWYFu/sxBNeFCruHTZ7Y28+TxxeQm510YTuAC09T3u5ImkN7/tRRmLBy2mzSMQ95rMWw+xzVVdteGfJBF3kRTgMaFTsvrM0ge01m1O9W1qtCQEG36rPkJZ1dVKl91R/sPa1x1WLc6AQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <f88fb44e-2a18-a4fc-6618-558773e6e773@arm.com>
Date: Thu, 6 Jul 2023 16:01:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 12/52] xen/mmu: extract early uart mapping from
 setup_fixmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-13-Penny.Zheng@arm.com>
 <78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org>
 <02df8ce2-fa68-614b-87ce-82bb5b60d2a1@arm.com>
 <1c0a7397-0129-d0d5-2941-3ef1fddef61b@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <1c0a7397-0129-d0d5-2941-3ef1fddef61b@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT010:EE_|PA4PR08MB5949:EE_|DBAEUR03FT041:EE_|DB4PR08MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: b136d383-ead0-4755-0a67-08db7df7415a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ucRXTROrOE/VUPzv49eu5I4G3HyehAp6iOCaeMO0bm50FDbkGQlVNpjLZNaLtf35IBuRj+Asi2dh84DJppVbsmzd1guhaQZ+iyy0bDZuV7ovJIxJCC/PlodKcC1FXnVLRMiDb/Gdc81NmnX7WzURnpkOfYGop0TQL1hTQXhcsJH5hBVGVxBFD2d0xYa/tdhnGxXc84MUyVYNmtWMn5kmWM3yeYgWx7B+UgMDlMgz9pHhW9hrCJCyCQAub/io2RbdJKQzZnMkGpR6ZiXbBFNAy4TR/oUZde6udFrt5D9FPcnXPSiDWUB+qzwIBQI9Asp4JRqI7j4DqPhtn1j0JIX21iftMAaFesC4gtLFZbjpjuX71fNUnD0V/jd8CMT1jXyL9x3qdf2NtCdCeK35cBZeGXDCHPzwWgg1cFsv5cAR5y1iO6ww7KSAb6pfUsg79vfefxfqIxGS538Hu1/DkmRPvJRG2u724fF1pBCva1iv0ufrqeDyNzMc9y0VauN4cWUhOdw/2AcbhDndHYL+SCyd4TRVpirwOu44Pszuiiy2b41Oe17DRP1IgQcHHjpwQpFFWNhaPyJfacRv+cmvqeLAOwp6jqxi2VIMv7rC3BKbqmbGzRuKVNQZZDBq4KgkU6W9xyMDtebzqZZ3ULocEV2XCvv/ACFbLrcHPj7WO+RN05aq+pIU/5YBxVoSXxhUal88wqVkRXr9KIE6tAzqHExoaI2Oy1X/SMjOMSkFdAj5VzVYZx26mU0vZJ54Lb7C3nAAs0njX26bLqP/HbEaiVCQwzQjRX5ys3/dpW0cqeT8SpbPrx9GGrgnHSRViqPA8Jh/xn39xJJM37IgI9YRanImPw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(2906002)(36860700001)(41300700001)(40460700003)(40480700001)(2616005)(5660300002)(44832011)(82310400005)(53546011)(70586007)(31686004)(70206006)(4326008)(54906003)(478600001)(110136005)(86362001)(26005)(31696002)(186003)(336012)(16576012)(316002)(83380400001)(8936002)(426003)(36756003)(81166007)(356005)(82740400003)(47076005)(8676002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5949
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74e7fed0-441a-4c58-c2ba-08db7df73b78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8yKrLw7pz2e1kSgM4iMjRCk8cxT3ZwozhmzKQM7WCBHhWOWVOOZAniSu2E6Ysx0+JryZ4EujivTkZp3uZO3lMFAPYQ2pJTxokU04RO1FBVoWklfoWRyRlw1FESMfFa57X9qolr4FzoFbMlzz8Z5RdIN0zvtA9BkQ0RJdEnJTKuAE7tLeSrFMCT0ZOGMBrzZTKtcqdu7MWZAxltCAMcoW0RhQAxEx5jk3xRVrjA3lqqQYLOpGB1F2v8Ystc8ZiwbO+TstlcIa4Idf+p4LAAcls89vUMJ783eigtL+/MVot8iTx2Mn3HLwAY+liVifbqCVKo9JdqEd6+TF1TrI363em2MB+mZbOPIjO3mLeAslbNXJFYz3pRh9/b7XrpKXMN7nJUh+b6sUufx8ttR20cabN20dOMPto2pDfPBdoGGMcBbywinwcQEFhVJVsWiJFJ4LL6pWKmjVbwgqJQr2s3ulKQuATcuJU2RAjXB/1dzkb4j6jfsZloaxGKIAYKJOvnl4m59VRffD0ghubTpPSJyy5RGXbJ/IdZwIFVIPfq4HR5BEqyp1yipfWLHDD8kW/gWzjdaxHG7e4nHaes4HEyj3nrEfVltkLvKnLao7vrEdmFck/TKJ4Gg9lKpYFHZJh5Xu130oOyz2G+FRWFFuzC8bJzOAc8QgwcU6aF7pMB75QPlb3q56MIvsacgqOaK55W2DZRZ3rCC5ZNB+IoFv9XzF1LqmuUJTzciMNmzXEBRwvMqsizSIvbf/BuUGIJZOVmkXbviIXy8uvA6eS0+VIYiTraPgBndexmFQeDPp4GxcT6bLQD3PEHKgJkmBbxR44rf7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(186003)(82740400003)(478600001)(426003)(26005)(53546011)(31686004)(86362001)(336012)(2616005)(110136005)(316002)(81166007)(47076005)(83380400001)(16576012)(54906003)(36860700001)(70206006)(4326008)(70586007)(5660300002)(8936002)(8676002)(40460700003)(44832011)(41300700001)(2906002)(40480700001)(31696002)(82310400005)(36756003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:01:50.9714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b136d383-ead0-4755-0a67-08db7df7415a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9262

Hi Julien

On 2023/7/5 18:35, Julien Grall wrote:
> Hi Penny,
> 
> On 05/07/2023 10:03, Penny Zheng wrote:
>> On 2023/7/5 06:25, Julien Grall wrote:
>>> Hi Penny,
>>>
>>> Title: You want to clarify that this change is arm64 only. So:
>>>
>>> xen/arm64: mmu: ...
>>>
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> Original setup_fixmap is actually doing two seperate tasks, one is 
>>>> enabling
>>>> the early UART when earlyprintk on, and the other is to set up the 
>>>> fixmap
>>>> even when earlyprintk is not configured.
>>>>
>>>> To be more dedicated and precise, the old function shall be split 
>>>> into two
>>>> functions, setup_early_uart and new setup_fixmap.
>>> While some of the split before would be warrant even without the MPU 
>>> support. This one is not because there is limited point to have 3 
>>> lines function. So I think you want to justify based on what you plan 
>>> to do with the MPU code.
>>>
>>> That said, I don't think we need to introduce setup_fixmap. See below.
>>>
>>>
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - new patch
>>>> ---
>>>>   xen/arch/arm/arm64/head.S     |  3 +++
>>>>   xen/arch/arm/arm64/mmu/head.S | 24 +++++++++++++++++-------
>>>>   2 files changed, 20 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>>> index e63886b037..55a4cfe69e 100644
>>>> --- a/xen/arch/arm/arm64/head.S
>>>> +++ b/xen/arch/arm/arm64/head.S
>>>> @@ -258,7 +258,10 @@ real_start_efi:
>>>>           b     enable_boot_mm
>>>>   primary_switched:
>>>> +        bl    setup_early_uart
>>>> +#ifdef CONFIG_HAS_FIXMAP
>>>>           bl    setup_fixmap
>>>> +#endif
>>>>   #ifdef CONFIG_EARLY_PRINTK
>>>>           /* Use a virtual address to access the UART. */
>>>>           ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
>>>> diff --git a/xen/arch/arm/arm64/mmu/head.S 
>>>> b/xen/arch/arm/arm64/mmu/head.S
>>>> index 2b209fc3ce..295596aca1 100644
>>>> --- a/xen/arch/arm/arm64/mmu/head.S
>>>> +++ b/xen/arch/arm/arm64/mmu/head.S
>>>> @@ -367,24 +367,34 @@ identity_mapping_removed:
>>>>   ENDPROC(remove_identity_mapping)
>>>>   /*
>>>> - * Map the UART in the fixmap (when earlyprintk is used) and hook the
>>>> - * fixmap table in the page tables.
>>>> - *
>>>> - * The fixmap cannot be mapped in create_page_tables because it may
>>>> - * clash with the 1:1 mapping.
>>>
>>> Since commit 9d267c049d92 ("xen/arm64: Rework the memory layout"), 
>>> there is no chance that the fixmap will clash with the 1:1 mapping. 
>>> So rather than introducing a new function, I would move the creation 
>>> of the fixmap in create_pagetables().
>>>
>>
>> Understood. I'll move the creation of the fixmap in create_pagetables().
>>
>>> This would avoid the #ifdef CONFIG_HAS_FIXMAP in head.S.
>>>
>>>> + * Map the UART in the fixmap (when earlyprintk is used)
>>>>    *
>>>>    * Inputs:
>>>> - *   x20: Physical offset
>>>>    *   x23: Early UART base physical address
>>>>    *
>>>>    * Clobbers x0 - x3
>>>>    */
>>>> -ENTRY(setup_fixmap)
>>>> +ENTRY(setup_early_uart)
>>>>   #ifdef CONFIG_EARLY_PRINTK
>>>>           /* Add UART to the fixmap table */
>>>>           ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>>>>           create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, 
>>>> type=PT_DEV_L3
>>>> +        /* Ensure any page table updates made above have occurred. */
>>>> +        dsb   nshst
>>>> +
>>>> +        ret
>>>
>>> The 'ret' needs to be outside of the '#ifdef' block. But, in this 
>>> case, I would prefer if we don't call setup_early_uart() when 
>>> !CONFIG_EARLY_PRINTK in head.S
>>>
>>
>> okay. I'll move the #ifdef to the caller in head.S.
> 
> Thinking about this again. I think you can actually move the mapping of 
> the UART in create_pagetables() because it will also not clash with the 
> 1:1.
> 
> For the MPU, the mapping could then be moved in prepare_early_mappings().
> 
> This would reduce the number of functions exposed.

Understood! will do.

> 
> Cheers,
> 

