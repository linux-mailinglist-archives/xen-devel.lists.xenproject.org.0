Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30174805F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558860.873318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyQE-0000Tn-BV; Wed, 05 Jul 2023 09:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558860.873318; Wed, 05 Jul 2023 09:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyQE-0000RA-8O; Wed, 05 Jul 2023 09:03:38 +0000
Received: by outflank-mailman (input) for mailman id 558860;
 Wed, 05 Jul 2023 09:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGyQC-0000R4-Dq
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:03:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1d54b8b-1b12-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:03:33 +0200 (CEST)
Received: from AM6PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:20b:2e::41)
 by PAXPR08MB6477.eurprd08.prod.outlook.com (2603:10a6:102:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 09:03:31 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::79) by AM6PR05CA0028.outlook.office365.com
 (2603:10a6:20b:2e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 09:03:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 09:03:30 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Wed, 05 Jul 2023 09:03:30 +0000
Received: from 38f707b2579c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3A65B337-F8B1-4BD8-8C9E-A965FEF15041.1; 
 Wed, 05 Jul 2023 09:03:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38f707b2579c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 09:03:23 +0000
Received: from DB6PR0301CA0079.eurprd03.prod.outlook.com (2603:10a6:6:30::26)
 by DBBPR08MB6217.eurprd08.prod.outlook.com (2603:10a6:10:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 09:03:19 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::15) by DB6PR0301CA0079.outlook.office365.com
 (2603:10a6:6:30::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 09:03:19 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 09:03:19 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 09:03:18 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 09:03:16 +0000
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
X-Inumbo-ID: d1d54b8b-1b12-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEbyc0mJr7qR8OXQc2PSISr0q3slBBd/4Umzp6DkF9A=;
 b=eCQqLIee/fGeJiJt+YnC7hhDBHx2f86BtG6DHQZQRl4tKXve+3D3Fs6MA8zWmvDNh4KKmg9Na5K6hCfCI9+sp8DpykHNZLCOnJcx5GtwnPUocY/hpTiqUE9R0AwoFMTs3oPxy3WDj1XU470LvZZnZWanLm/pTl9VqlzEHCouEto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: da6fc12ba7ce0ab4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGZt+Kns/HH6zktBFi07GcyceL4AWPeMtxVYgmZulYmxDxu/oML6L47m1b6N3NyAQ5jTLOOaL4ppMsga9k7sPNnbCmTBgIB2PHDBXVxcMknvevbv/LVHHzTHx6Ut62WT97VIb/pFiO3K0bkymbs6n9jtSQj7Yo/DwM9rLDt/0yktjP3rgca0MDoGT+pBH1Dnos0dwxaGlE62odED/N+81NZRHr/+bXpdQu/nWq/qfwMtBnzR3pFbEeJA3CarFs1Dn0MQitd2FEADOO2r+DYqGwZEO4p9tDXopSz3ku6ATzlQIQcjDypHE2a1YDCHdMPxQZsozDSsKBevHWtBKQQzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEbyc0mJr7qR8OXQc2PSISr0q3slBBd/4Umzp6DkF9A=;
 b=g9qDHKWCeH4xRwBNJYH5zW2rG8gPREIW/P6FxomODA6Tprg23eK9v9260nKZ0EZCSAr4AqcOMf/iHqZ6hUkyPtVnMvmbYClZVajTxjm/1rPCvzKOXlSQZBB3nYFIyuwSbaMlAFjJ11a3/qwqjpG2U7d/ErZ0AvKkA5a0aPv5YXbonnLKAhIBC57ym5xTlYlDJtzvdM6tdfNBM02sDzmQ9+dl/JTNlM0ymxRpzOjOlo+xKkNI/LO8AzL0p3XxjXA61brVZ6qMO4CJ3prfN//UOAwki7JTsbqKX2BjPwcZmLrbDXCrJ/HD2o6dydftLBqdtZTmjfcsJc2HMEYbprpYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEbyc0mJr7qR8OXQc2PSISr0q3slBBd/4Umzp6DkF9A=;
 b=eCQqLIee/fGeJiJt+YnC7hhDBHx2f86BtG6DHQZQRl4tKXve+3D3Fs6MA8zWmvDNh4KKmg9Na5K6hCfCI9+sp8DpykHNZLCOnJcx5GtwnPUocY/hpTiqUE9R0AwoFMTs3oPxy3WDj1XU470LvZZnZWanLm/pTl9VqlzEHCouEto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <02df8ce2-fa68-614b-87ce-82bb5b60d2a1@arm.com>
Date: Wed, 5 Jul 2023 17:03:14 +0800
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
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT028:EE_|DBBPR08MB6217:EE_|AM7EUR03FT031:EE_|PAXPR08MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c74c5ed-805f-4d35-3578-08db7d36b413
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c82Omk+HmS2gGyIOnwEandcbiJY+dKnq68qZjqAC4wYrMY4tpyUIjMjxA0tt4c0PmFBp30ElK5m5u8Q5GaIES6Teae4lSbatN57UiUp8QXfNxYs8W7mjQR1fgMiTDsjNSSTjzIWuHs3CcYIm3Iub66WAl8bWKKfVvCFa7GbhieZodtpjiGNasl9IpYMSwRmiSGoG6LG83XKtGoBDstQnYPXGF8NfpiVicZnz3VDoC9yy/P3AmHrXatxzY8493g+b1CaImRAmAK8f2fm3bK8z3lDgOMGmZjloZwr5JolJclNBSWNmqMrV7XoRAerjH+k4oziRmhFzVbhS1pr30eo4ZEDGOeT7sy3QxjYdOwTplbqLS6lOK/V9DY1RDuNxeIdT5VLx0tC8+BJo1mMnf2ruXHkrzVIqv3Rkj7weC1Dbhb9F41sJ0NHJvN94AcOuk4oWKhYOsf0xL4IuzObgfYMJf3TKGaNwb55a9Mllv7hISqV8zWPRbiwXEL0vpbIkIiuEb66zdA8yB6hnpIScVRULJR0V9UY2s7Z/FEY7X9CgTjvubYrlpCI+W/dWTbbl0L0Dl715wOjbRj1elbvRTjR8TgFd0MafrOfmvKeWaqdB8rzNnjr4bqWegizSPEet07iw6SKcNjIzYBRz3dcf6D0pvkgN2d7+EbzkUWhAEXiBnkiTIDVbB4pP2wLBZ4Jtbz9SiLwaXu4ElHaTVEoem/x3/NLi1t10Ns1Ye8kwpR2BHn0P3gCUyV9kF+llakc6XyOgc+mfZGnNnyW5IyX74zg//z4jYd7D5FxHMnTWDNB/5aE/5OVJ1UEj6rlYxLruXFTe+CdE2Xr4ReCj54SereaRyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(41300700001)(2906002)(5660300002)(40460700003)(44832011)(8936002)(8676002)(82310400005)(36756003)(40480700001)(31696002)(86362001)(31686004)(2616005)(82740400003)(426003)(336012)(478600001)(186003)(53546011)(26005)(70586007)(4326008)(70206006)(36860700001)(316002)(110136005)(83380400001)(356005)(54906003)(16576012)(47076005)(81166007)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6217
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef962ad9-a18f-4f59-f31b-08db7d36ad65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oyKy0XPx2jgAIasQRw1Iw0Wv76uXNR8/Mlnqdq1BOsoVdJ2S+iZSlfVzF2Kf+MUDSm1Fwu57traJMIn5lWtPb3xUk4WjIPXd0Bv08dEqlWekl5Ga9r/6oWYrZhYwVZ13e+v7AJkrTLIxqrv/DDU/nkEOVKSBuWLe2d4K9VAA0cTi1oVpNuTd5YGr9/MsfDSiarxMVdSxRqawIg0HnO0k06FhrL97v28UduXzDU3AFC83UiI9Uvdid30MND3LgSObQNVfo4qy95trH2n4vYFWkmYE74XuP0NYK2cF2GS8DmdBgXnQwkMi39qpdCI15kYpa/kob7xPBo6rNkGNBkBdKmkxKv6KNOxRaHYRNjsua7dpmgRKijLGqaCUMctru3YIBaIDKpZDk/u1fBRKmwzu4mjkgQTUgoz6BWwvDLl7cf/ANZIvRu2vnYBcGMBNg+phCNYAHN5ToJWmhsoNv/eqV2XxH8B+ayUw3PLAMJFGP0bbszEgdLfABgqmMgnSNAVUJ7osWXzMDw30m8dPWMsL4b1uJlcZGp9MrrpA8huqWnbdkTdwgOR79mu6aQVljycpm1cFUnJJiUQbyjI/mCesfEQnUEYA3dH1aFCgaJsN+vSF1YzBegKA2hiUZlrFZUDpdqABTbzJPtRmcw7TQwi5eExdbGL5MQR7h1MdYbxpajvscQfzusxVpddOykTt4CQBaI4pwiVk8hJTDV5VRIB0BLPHUM4IQ8q0U3n+xgmZ0cwCa9mMWTXetOg5hx191oMyRI+xvO1I2o6Ut6IWqeedXjosbm/7tRPl1YB7POxYYgzWUK/Mn2T/okyF9Z5nhi7U
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(54906003)(16576012)(26005)(44832011)(186003)(53546011)(86362001)(8676002)(31696002)(2906002)(8936002)(110136005)(36756003)(31686004)(5660300002)(41300700001)(40460700003)(478600001)(81166007)(4326008)(40480700001)(82740400003)(70586007)(70206006)(2616005)(47076005)(336012)(82310400005)(83380400001)(36860700001)(316002)(426003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 09:03:30.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c74c5ed-805f-4d35-3578-08db7d36b413
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6477

Hi Julien

On 2023/7/5 06:25, Julien Grall wrote:
> Hi Penny,
> 
> Title: You want to clarify that this change is arm64 only. So:
> 
> xen/arm64: mmu: ...
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> Original setup_fixmap is actually doing two seperate tasks, one is 
>> enabling
>> the early UART when earlyprintk on, and the other is to set up the fixmap
>> even when earlyprintk is not configured.
>>
>> To be more dedicated and precise, the old function shall be split into 
>> two
>> functions, setup_early_uart and new setup_fixmap.
> While some of the split before would be warrant even without the MPU 
> support. This one is not because there is limited point to have 3 lines 
> function. So I think you want to justify based on what you plan to do 
> with the MPU code.
> 
> That said, I don't think we need to introduce setup_fixmap. See below.
> 
> 
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - new patch
>> ---
>>   xen/arch/arm/arm64/head.S     |  3 +++
>>   xen/arch/arm/arm64/mmu/head.S | 24 +++++++++++++++++-------
>>   2 files changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index e63886b037..55a4cfe69e 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -258,7 +258,10 @@ real_start_efi:
>>           b     enable_boot_mm
>>   primary_switched:
>> +        bl    setup_early_uart
>> +#ifdef CONFIG_HAS_FIXMAP
>>           bl    setup_fixmap
>> +#endif
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Use a virtual address to access the UART. */
>>           ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
>> diff --git a/xen/arch/arm/arm64/mmu/head.S 
>> b/xen/arch/arm/arm64/mmu/head.S
>> index 2b209fc3ce..295596aca1 100644
>> --- a/xen/arch/arm/arm64/mmu/head.S
>> +++ b/xen/arch/arm/arm64/mmu/head.S
>> @@ -367,24 +367,34 @@ identity_mapping_removed:
>>   ENDPROC(remove_identity_mapping)
>>   /*
>> - * Map the UART in the fixmap (when earlyprintk is used) and hook the
>> - * fixmap table in the page tables.
>> - *
>> - * The fixmap cannot be mapped in create_page_tables because it may
>> - * clash with the 1:1 mapping.
> 
> Since commit 9d267c049d92 ("xen/arm64: Rework the memory layout"), there 
> is no chance that the fixmap will clash with the 1:1 mapping. So rather 
> than introducing a new function, I would move the creation of the fixmap 
> in create_pagetables().
> 

Understood. I'll move the creation of the fixmap in create_pagetables().

> This would avoid the #ifdef CONFIG_HAS_FIXMAP in head.S.
> 
>> + * Map the UART in the fixmap (when earlyprintk is used)
>>    *
>>    * Inputs:
>> - *   x20: Physical offset
>>    *   x23: Early UART base physical address
>>    *
>>    * Clobbers x0 - x3
>>    */
>> -ENTRY(setup_fixmap)
>> +ENTRY(setup_early_uart)
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Add UART to the fixmap table */
>>           ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>>           create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, 
>> type=PT_DEV_L3
>> +        /* Ensure any page table updates made above have occurred. */
>> +        dsb   nshst
>> +
>> +        ret
> 
> The 'ret' needs to be outside of the '#ifdef' block. But, in this case, 
> I would prefer if we don't call setup_early_uart() when 
> !CONFIG_EARLY_PRINTK in head.S
> 

okay. I'll move the #ifdef to the caller in head.S.

>>   #endif
>> +ENDPROC(setup_early_uart)
>> +
>> +/*
>> + * Map the fixmap table in the page tables.
>> + *
>> + * The fixmap cannot be mapped in create_page_tables because it may
>> + * clash with the 1:1 mapping.
>> + *
>> + * Clobbers x0 - x3
>> + */
>> +ENTRY(setup_fixmap)
>>           /* Map fixmap into boot_second */
>>           ldr   x0, =FIXMAP_ADDR(0)
>>           create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
> 
> Cheeers,
> 

