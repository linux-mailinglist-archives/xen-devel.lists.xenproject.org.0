Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D977496F7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559721.874978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJug-0005Vm-9l; Thu, 06 Jul 2023 08:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559721.874978; Thu, 06 Jul 2023 08:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJug-0005Tu-6Q; Thu, 06 Jul 2023 08:00:30 +0000
Received: by outflank-mailman (input) for mailman id 559721;
 Thu, 06 Jul 2023 08:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUoY=CY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qHJue-0005Tk-7c
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:00:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a84677b-1bd3-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:00:26 +0200 (CEST)
Received: from AS9PR06CA0254.eurprd06.prod.outlook.com (2603:10a6:20b:45f::29)
 by DU0PR08MB9632.eurprd08.prod.outlook.com (2603:10a6:10:447::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:00:24 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::f9) by AS9PR06CA0254.outlook.office365.com
 (2603:10a6:20b:45f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 08:00:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 08:00:23 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Thu, 06 Jul 2023 08:00:23 +0000
Received: from eed91a4eaa4f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6F91BB3-F120-4321-8E33-30C2BD5A8D0A.1; 
 Thu, 06 Jul 2023 08:00:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eed91a4eaa4f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 08:00:16 +0000
Received: from AS8PR04CA0186.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::11)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:00:15 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::21) by AS8PR04CA0186.outlook.office365.com
 (2603:10a6:20b:2f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 08:00:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 08:00:14 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 08:00:10 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 08:00:08 +0000
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
X-Inumbo-ID: 2a84677b-1bd3-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id3mbd/WET/yOTr9X2S9gwoCRet20H+18f9ajyGqou0=;
 b=ZqGnq5htFJJUfnAAOtrszykQzOPyIfka8Y9nrnCh6vNuZhazs/dwaeEYxjyBcfXx+SctX1/jMzEIc5PUBjKkla1ZLLBQlKZwHngctf36o3QCsgXGq4UqhxKKKCRvRHHvhCnZneGKVtsPh7MN34hmZv5cJOgzecTF40hzR5he1WM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aeb6469a1e5f72e8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nicvspyILb/jPnu9/Wm9Ks72O2pA/PZl+DaoAQ+Jpti5RwkjrzIPItof+QMSJa579il+bOtXmONhr3DaS0ufzc0SmA3JlGxurPhEION2g/S0Laoy6r0qoRI/GrRxwPBbgYgb1+lK9Urx2lkKjF3lGgpINBmR1ljIxWQSv+XCVSiZSKihY8rPp//vsAvuO1WSiG8ttTzrnW/Qoqel+qTpuvIwTt3BHX/tt9jU02fE5STkyvZhi1qNHXaVSGI4qIqwjzMAiKpcaYaBpAiO0tHx2xEKzv6+kOdjyZPHh1XBmQzYbQiEdLmUWoohw9yj291NVKgx0xfXHx1zZ/m55FVj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id3mbd/WET/yOTr9X2S9gwoCRet20H+18f9ajyGqou0=;
 b=UCYLLvY6y5iDVeJbJLVTAqJsjkAFJJ9IAvCBix1l0GrjNSsirBynpJhgtt3smQD7N5I+SMh0tgaliwOH1Ya0KFfCUVRuKq42sARrd7rpmHjlO8v5T8izlytGlGlNIMiXYtj9ziPFsEZuW24vMtM//7Sf5N4GyMPjuh03MRiLxwVoWk42Q/ttCeWzdN89MQhAUYNRJJBUYsMsSynuzHVuEz/Xw4EBWj/KkE6JO/8BQD1SSDCu6AGkA/Zfgqqv75k0Qhn4z1f+lg+ogOVlP4OSC7r6NenbSVXsDeHAgO6oj3KMFfK4MHLhOY/KAV7sUOhbSJeih1JSTiL7U+HZBvHyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id3mbd/WET/yOTr9X2S9gwoCRet20H+18f9ajyGqou0=;
 b=ZqGnq5htFJJUfnAAOtrszykQzOPyIfka8Y9nrnCh6vNuZhazs/dwaeEYxjyBcfXx+SctX1/jMzEIc5PUBjKkla1ZLLBQlKZwHngctf36o3QCsgXGq4UqhxKKKCRvRHHvhCnZneGKVtsPh7MN34hmZv5cJOgzecTF40hzR5he1WM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <429ab357-08bd-4dd2-06f4-b8e2bc032ce1@arm.com>
Date: Thu, 6 Jul 2023 16:00:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 11/52] xen/arm: mmu: fold FIXMAP into MMU system
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-12-Penny.Zheng@arm.com>
 <1be18c29-511e-27eb-0970-adaa1c74ce82@xen.org>
 <06760592-ab87-c6c8-83df-e9204fdedadf@arm.com>
 <059b1018-58b9-5daf-7bf3-f9b84c0625ff@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <059b1018-58b9-5daf-7bf3-f9b84c0625ff@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT016:EE_|AM7PR08MB5399:EE_|AM7EUR03FT006:EE_|DU0PR08MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 8570485c-8c3f-4432-1e38-08db7df70d5e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f4DUuelWSFVucjsiDHGAr8HNBKuqX64NrQr80CTCMJJ3z290npH/E9Al4RTUiWqSjUr2+XU872qPi4oSwYQkTTjB3ehyad0dgZqDHcOneQO8M8z4u9vd/nt8tqbehO97v4rrl5/0gSX4qWNMfwl0O/GvF8DMKmNhlrAWyljBMR40DiKQvxdA1oo0gx5d1JBVaBBmEhR1n2DAqHla0sU/57CC5i18u5TbdIqPxbDAI4LgIuUfXeUHP+cn6YZNzanYUfC+omvgECgyrVVnHIPfx5+mX6iq9l2R1iXif4xBx9hpYLb4oYD6StUZifennG9EtfH4xICYyM1enENYsEpPcmtfEEX/0fiet4e8FDCrA1llZAexVBEvOH4L3RUqFngiAn64l6mitMnrXOWnNgTdW6SxDbVtZ0I/XgUHxmnLpU5EONVFVxnWvGo9B+9N8V1L7mWiorkrYBDrQtW79taoWQJd+qtPPijZwxABPHi6tshdAf78ET6iWs73Kl26sKtjnJsgCWRieCz14kGJSEpWJyYpyFVJQ9yc4afd6GOSbS3QeGKk27cFfJgf0bLX5eKpvMw63fj9uhY4b37RJ60LsPCtv//mnLWAMgxaUrgYi4O2cGC28dgIGJMk2uhJbT286UWXffcdFhw9TjKLQLCLvFJyaA5KbaxjS7Lvy0T4k8XiOE/OBObIpFMFTjWSOTyxp2pz+5qh/fRpyqxK1HBRw4rV841ONyXwBCm57Hbtnf0E7D698w4iU67GhcBkb8RcCPN4aMsiUAc167UkftitKjsrp5iXy/I+PveC5iAlmse+3faj/rdsuuIHU6bdQTUftNKHH170ng82PX8xtiEjWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(70206006)(4326008)(70586007)(356005)(82740400003)(2616005)(81166007)(40480700001)(186003)(16576012)(86362001)(31696002)(36756003)(26005)(478600001)(110136005)(53546011)(54906003)(82310400005)(40460700003)(36860700001)(8936002)(41300700001)(8676002)(44832011)(5660300002)(31686004)(47076005)(2906002)(316002)(336012)(426003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4876ddb-857f-4acf-4921-08db7df707e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XZFqfzBFU6nWJmhVRVa/XNqgFXvMjs69GYa4KV+RZt7rwi8VnlrV+F7qHsaIMW4F0bPP1hT5Z+9ZvUAkYCv3yDPgJASWzIkzKTTmY9nN7ao5+jupAbl3tRqqnWzu5afsmFF5ClrWDRfYDVHWxhQlLBnn6dvXQ9Xa7MoiN28oGk3ellS7G/eSGUonlMFgsvJ2GfN4S4Zk6QqQ/Am1+/NlG6rAFXLcV6rkqDxe4dMtnJPm+8EVWlk5Gi8gNPhdEwbS4R5UbzvhwmV77x0Bii2KW+9m7J9G2YWWVLlvmQu9PleKZsBLJRA+klO3I9f4Vhn8DNsO7nawp0qx7QZdvj8fnGr155t6B/iwfdhpb4KaZObLTRT8/5HkhBBNtPFEvgS6YfRUozcL4p8W0SQLaXaswVdmdY5LhHdP7edB8iq3XKLXicfaYyPbRjyfon95SZxxn2Yw/ziUNCHNeB5kmChS3J/tYNF36OpOMDItV0UwyGnYjS2U22xYbrmOywmWws1z3txUBwnDrgkRmn+P3Bj5GnvBrUeKnJ2tsbdLpbLZticNRpHWDGOjOr0dKcomufLfrYMbv7c1lNtrJztpfiG2bRKPiS6AHMqtz/3koMzwzDmsX+hncLAVJ89Q0qp8hAto/FffIutRjLZWIgOEAWbF7jBcRmY6RpI0ZTjgxY2HIHwcMrIHMMD7R4hToVaeyjh4S+g56co4+kUQh4YIUerZ/pCR15AR18wPjr2LuQ6n+J9RB8PZjht4mPeT9Tz48VK1X94mZHx4twhHh+1soD931jVl2Eth9te9Vmq7rjQPIdtfikfQeqHCSgGb2IGt85yG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(31686004)(478600001)(110136005)(70586007)(16576012)(54906003)(36860700001)(336012)(36756003)(2616005)(47076005)(426003)(31696002)(86362001)(40480700001)(82310400005)(2906002)(70206006)(53546011)(26005)(186003)(81166007)(82740400003)(4326008)(316002)(8936002)(41300700001)(40460700003)(44832011)(8676002)(5660300002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:00:23.7254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8570485c-8c3f-4432-1e38-08db7df70d5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9632

Hi Julien

On 2023/7/5 18:31, Julien Grall wrote:
> Hi Penny,
> 
> On 05/07/2023 09:19, Penny Zheng wrote:
>> On 2023/7/5 06:12, Julien Grall wrote:
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index fb77392b82..22b28b8ba2 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -15,7 +15,6 @@ config ARM
>>>>       select HAS_DEVICE_TREE
>>>>       select HAS_PASSTHROUGH
>>>>       select HAS_PDX
>>>> -    select HAS_PMAP
>>>>       select IOMMU_FORCE_PT_SHARE
>>>>   config ARCH_DEFCONFIG
>>>> @@ -63,11 +62,17 @@ source "arch/Kconfig"
>>>>   config HAS_MMU
>>>>       bool "Memory Management Unit support in a VMSA system"
>>>>       default y
>>>> +    select HAS_PMAP
>>>>       help
>>>>         In a VMSA system, a Memory Management Unit (MMU) provides 
>>>> fine-grained control of
>>>>         a memory system through a set of virtual to physical address 
>>>> mappings and associated memory
>>>>         properties held in memory-mapped tables known as translation 
>>>> tables.
>>>> +config HAS_FIXMAP
>>>> +    bool "Provide special-purpose 4K mapping slots in a VMSA"
>>>
>>>
>>> Regardless what I wrote above, I don't think a developer should be 
>>> able to disable HAS_FIXMAP when the HAS_MMU is used. So the 3 lines 
>>> should be replaced with:
>>>
>>> def_bool HAS_MMU
>>
>> Understood, will fix
> 
> Do you still need HAS_FIXMAP if this patch is dropped?

Right now, this patch only contains:
1) wrap PMAP into MMU
2) change static inline virt_to_fix() to declaration in fixmap.h and
definition in mmu/mm.c.
HAS_FIXMAP is not needed anymore.

> 
> Cheers,
> 

