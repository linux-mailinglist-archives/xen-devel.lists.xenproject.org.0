Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22C747BF1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 05:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558774.873157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGtcT-0001K9-8U; Wed, 05 Jul 2023 03:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558774.873157; Wed, 05 Jul 2023 03:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGtcT-0001Gz-5T; Wed, 05 Jul 2023 03:55:57 +0000
Received: by outflank-mailman (input) for mailman id 558774;
 Wed, 05 Jul 2023 03:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGtcR-0001Gr-Rn
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 03:55:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4bade5f-1ae7-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 05:55:51 +0200 (CEST)
Received: from AS9PR0301CA0060.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::18) by VI1PR08MB10175.eurprd08.prod.outlook.com
 (2603:10a6:800:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 03:55:45 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::af) by AS9PR0301CA0060.outlook.office365.com
 (2603:10a6:20b:469::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 03:55:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 03:55:44 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Wed, 05 Jul 2023 03:55:44 +0000
Received: from 39581fb3c7f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D5E44D0-2EFE-4EF6-ACE2-AEF7064F698D.1; 
 Wed, 05 Jul 2023 03:55:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39581fb3c7f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 03:55:37 +0000
Received: from AM0PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:208:14::34)
 by AM0PR08MB5313.eurprd08.prod.outlook.com (2603:10a6:208:17f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 03:55:35 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:14:cafe::c6) by AM0PR03CA0021.outlook.office365.com
 (2603:10a6:208:14::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Wed, 5 Jul 2023 03:55:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 03:55:34 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 03:55:34 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 03:55:33 +0000
Received: from [10.169.172.87] (10.169.172.87) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 03:55:31 +0000
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
X-Inumbo-ID: d4bade5f-1ae7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nhI3Td4I97E56FkVd9XTIqug6xwtt3BnDfM/L/bd0M=;
 b=e6egVE+TbEW5FX+5NPHLvmGIQvOIIBgwRWHwTk8IHfL17xGDUnnDENIXdhVanphppWhAbzlpXcF59wJUh+4npv3gjEs6bocachX1AU2u6LsuHE1CVMZA9R3FO/zujfieyx+Pb77uS+pQupEwIj8BGortNAVUTSkP1pOx5cXYuZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 401759e917dbfcf5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLoaldjjDzjCbMynY7jn/SfKNrqNopfLZSDEzmG2i1W4Ak/VxoKzvPaksAzOwU8s0Ljk1GVt/TCw/mEfUZpHe29tYZ5diKNkTrcSL3VK56HjRGyLuNF+RyvfOdlcf4hw4+9nwBmzxeTAU84Zc7o/wp0YucdygAIA3CyDkwIXjSR33z3W+pNOzI5bnlcsrqWMuGBx/2gStatZCA5qgIoZCodlsIEseRrvPGQCqAemZtSyU8MFlOzljdRTT9m2loJKN1BTvMtFQOuW2ZxDsXZXEoZiHtGXkwHjysQGIlcWMaEvdcmkSgveUbpWXGZAl4mErLjt2dfY2/W3ztbqaxMtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nhI3Td4I97E56FkVd9XTIqug6xwtt3BnDfM/L/bd0M=;
 b=h453Y7h6jWfPBz+JiFLcd05DJGeOXzh8IcI8W9ZpbBrQhfsWinCUs6p1FuAn5NQAFN8wXQ45LYtREAyH4nUxMTtxNf4VFpXeHGPB6xo4U0EPqjW3i8vd0YPbmSi5Vp4zFJrFbVFIof/9lInvJwfrMsxy9j1KqYUfXDW16GXLpDyG/mYLTdCHdOaCOcICk8bMtQb/a/5x5QwhBX4L/NSH9spVlf2vw10yytYd26X10+ayng5n+Z4srw/zjde1mGkLkZvktJ8BKa7uxsJCS+0pDcaXboJe4pJ3QygmDK1VjrKJr95EJ6955g+TlashuDqvmyfPkJku2Rg0q5Ruh+YcfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nhI3Td4I97E56FkVd9XTIqug6xwtt3BnDfM/L/bd0M=;
 b=e6egVE+TbEW5FX+5NPHLvmGIQvOIIBgwRWHwTk8IHfL17xGDUnnDENIXdhVanphppWhAbzlpXcF59wJUh+4npv3gjEs6bocachX1AU2u6LsuHE1CVMZA9R3FO/zujfieyx+Pb77uS+pQupEwIj8BGortNAVUTSkP1pOx5cXYuZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <c5e5121e-3819-2e9a-0e0d-362c7c80a904@arm.com>
Date: Wed, 5 Jul 2023 11:55:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/52] xen/arm: introduce CONFIG_HAS_MMU
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-7-Penny.Zheng@arm.com>
 <4303bf0e-a987-1ee4-9524-c83756789322@amd.com>
 <1cbf44ae-2500-1428-5dd2-893e846faf1e@xen.org>
 <1cc8eaa4-6fcc-21bb-c590-bffa87e14177@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <1cc8eaa4-6fcc-21bb-c590-bffa87e14177@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT025:EE_|AM0PR08MB5313:EE_|AM7EUR03FT062:EE_|VI1PR08MB10175:EE_
X-MS-Office365-Filtering-Correlation-Id: 758b6d1e-a7be-4cb4-cf9e-08db7d0bb5a3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ocolYZ1TWyQPW1TNd2I0I+Dj1xUCcIHiIrNvZ+R+lE8JesSnD/ccYtNpCs2ttJ3Fej2PxYtTK1oqv7IqP75s40M1hRfn2KHL70iDpDjpYRGwWS/Kr11Q/QB8Wn1wDLod4KvsUGiBwzWEUJz6faEl4f5moqpTsbtLKCMNe6iH/eCisrWjTnjP45FbNckCz8pKeOolRjN+W6ubeBHHWR6/tTUwHedme4tU8JvdRuV/2N+nBffbzBd9uJm9SIly5P9ofmRSxRKEbDpy2qb+8MJHK5MVdh7eU5e//zjnN2wLVPCQ3uC+5SQ5ovDAA147wEGocdez698iPYQlRQpTcjhqCbvZMtaSxDv51M7gLKwjtLCt3LjjmDjIbeCAZfvsdNqkmZsQByeCaUh0QQFisLJOTFEifJsfObGC1SRs5BZIDYoLdceOKhJUKrhrA7zd2NJinu5pMwGHoUKNSCdyg8sGjIlg0mu0y8zPR0OK7KnRnPkR2sXNc7wAMTxfTEKrDZzyhQ0n8eAriJqDh4pfDl7paLR/zSF4Vsz6sf0k5uv0N0DsCF/icY8QrpDFqEU+rIcvP72uDLV3O6HfO5QApV3SAsI6cmSoaXEFO7KileIxpamtoWTfW/itFn4v7Bhvhorm/Eo9c9g1KwHsPlWls9BcX2bSUlpZ9gNvjD/pFGO8flBAp8nuqS2Cp5szHx/SYm5AaSBfA0PFPD8RLYBiBoOxTQl/SHB7M/yjUo9ymRk4eC50X9ijfKM2pW4/bAhspIrl0iisUeVjJmhbmbD4uFkwB5b8AAGLec0X+WFlZ2ZWRmLjGZM3gxvcK3BzzJz3BRk1S8nxkjOYKF7qPmoeId/VgQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(44832011)(5660300002)(36860700001)(8676002)(8936002)(316002)(2906002)(47076005)(336012)(426003)(83380400001)(31686004)(41300700001)(2616005)(82740400003)(40480700001)(81166007)(70206006)(4326008)(356005)(70586007)(40460700003)(82310400005)(86362001)(16576012)(186003)(53546011)(478600001)(26005)(54906003)(110136005)(31696002)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5313
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ea2c3cb-a8ef-4a76-9e81-08db7d0bafc6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	828TKgAczlLbI6yv40mWr8Li9tOmU+FS/zTkJZz3W/Ngh1TJ7XlM5Kef5ZJyiDBptDt1IXtbP8K3htDGiI/ByFhPU5EgY1bKODJ5Ps07a4LAwzUWmdejm2ni6WGIc0oB7lppPM4jYF6Kiglz4II9d266ZWl9WMy9eSMIa+ZRJ/NSs4vSivADljFD7/TyAuXR9IfwLLQXnPM4lvlAUFqK15JStUDTQTrwJUeJu74ezpHsuwTScy2df6p7cc5ztl2BNmPU3NYC6oXB5mfzpmxO7h4G0Hf10CYsG3TtHBft5/NgTXX9wIptv3nbLOiKsF7E5oIHoq3+nNo+KpbN01GX1xGaO9CANFj/UPRqtdUrKGwjSggtMun4C/K3LY7fd3MbHK6N7P71PFyMSUFyUv0QrK/SFeLV/Eqsr+sg4M950biwi+6HwRr9Xx5Ha3hKnYbzCMXozJImJr+jBTy9QRmiZYXaXmYQfz9pKNxcYm2lG8cIvsWfuX9tydtMPjzVPfVyhvp6hkIzQE9zyIHeYRU5AL/AfHPjl0msvde/aoVVPsKfwEbBb5cHieDbBDj6hqsVfblsQh//tKpyDhORdkJvN5D7iF+hTUCl1Q/EKdNvTqM2apFYTclwwr965p03F9qW7u4cpgHuvbVGC/jKk0NHoUHA0Pw2Q23cwwFjHYb+CS2+bUF4Mc+nNUwdHRhPG119vAvALIRbVayvI0FDCVGE9WMkIjSnMNodft5FnYbaXHhS7P0JDQ5m6YRJlV+ELxTcIXsfc/rQGjH7dRDEzwn/AR8LkPNss0W/LT9BtqSo33UPO2WqjcYjmFSAy7jD66nN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(4326008)(31686004)(316002)(86362001)(186003)(31696002)(70206006)(70586007)(26005)(47076005)(53546011)(82740400003)(83380400001)(81166007)(2616005)(2906002)(36860700001)(426003)(336012)(5660300002)(44832011)(478600001)(8676002)(40460700003)(16576012)(54906003)(110136005)(40480700001)(8936002)(82310400005)(41300700001)(36756003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 03:55:44.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 758b6d1e-a7be-4cb4-cf9e-08db7d0bb5a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10175

Hi Julien and Ayan

On 2023/7/4 20:04, Ayan Kumar Halder wrote:
> 
> On 04/07/2023 12:44, Julien Grall wrote:
>> Hi,
>>
>> On 04/07/2023 12:14, Ayan Kumar Halder wrote:
>>> On 26/06/2023 04:33, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> This commit wants to introduce a new Kconfig CONFIG_HAS_MMU to guard
>>>> MMU-related codes, to tell two different memory management 
>>>> architecture:
>>>> VMAS and PMSA.
>>>>
>>>> In a VMSA system, a Memory Management Unit (MMU) provides fine-grained
>>>> control of a memory system through a set of virtual to physical address
>>>> mappings and associated memory properties held in memory-mapped tables
>>>> known as translation tables.
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - new patch
>>>> ---
>>>>   xen/arch/arm/Kconfig | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index ff17345cdb..fb77392b82 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -60,6 +60,14 @@ config PADDR_BITS
>>>>
>>>>   source "arch/Kconfig"
>>>>
>>>> +config HAS_MMU
>>>> +       bool "Memory Management Unit support in a VMSA system"
>>>> +       default y
>>
>> I don't think you can disable HAS_MMU right now. So you want to drop 
>> the description to prevent a user to select it. This could then be 
>> combined to
>>
>> "def_bool y".
>>
>>>> +       help
>>>> +         In a VMSA system, a Memory Management Unit (MMU) provides 
>>>> fine-grained control of
>>>> +         a memory system through a set of virtual to physical 
>>>> address mappings and associated memory
>>>> +         properties held in memory-mapped tables known as 
>>>> translation tables.
>>>> +
>>>>   config ACPI
>>>>          bool "ACPI (Advanced Configuration and Power Interface) 
>>>> Support (UNSUPPORTED)" if UNSUPPORTED
>>>>          depends on ARM_64
>>>
>>> I don't think you need this option.
>>
>> I think we want to introduce a 'choice' where the user can select 
>> either the MPU or MMU. But not both.
> 
> +1 (I like this approach).

+1 from me

I will introduce the choice "ARM Memory Management Architecture" and 
default HAS_MMU


> 
>>
>> This would be similar to how we select the Physical address space size.
>>
>> Cheers,
>>

