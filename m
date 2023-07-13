Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D1751873
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 08:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562925.879707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJpMS-00034l-BN; Thu, 13 Jul 2023 05:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562925.879707; Thu, 13 Jul 2023 05:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJpMS-000336-8e; Thu, 13 Jul 2023 05:59:32 +0000
Received: by outflank-mailman (input) for mailman id 562925;
 Thu, 13 Jul 2023 05:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMFS=C7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qJpMP-000330-VB
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 05:59:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c8888f4-2142-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 07:59:27 +0200 (CEST)
Received: from DUZPR01CA0223.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::10) by AM8PR08MB6580.eurprd08.prod.outlook.com
 (2603:10a6:20b:369::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 05:59:23 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::b) by DUZPR01CA0223.outlook.office365.com
 (2603:10a6:10:4b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 05:59:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 05:59:22 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Thu, 13 Jul 2023 05:59:22 +0000
Received: from 481900c8624d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F00C89A8-9CD6-4B73-9718-F74A4DEF12EA.1; 
 Thu, 13 Jul 2023 05:59:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 481900c8624d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jul 2023 05:59:16 +0000
Received: from DB8PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:100::37)
 by DB3PR08MB8889.eurprd08.prod.outlook.com (2603:10a6:10:439::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 05:59:13 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::2d) by DB8PR06CA0024.outlook.office365.com
 (2603:10a6:10:100::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26 via Frontend
 Transport; Thu, 13 Jul 2023 05:59:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Thu, 13 Jul 2023 05:59:13 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 05:59:13 +0000
Received: from [10.169.188.57] (10.169.188.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 13 Jul 2023 05:59:10 +0000
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
X-Inumbo-ID: 6c8888f4-2142-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb21Prp8fY+sRO79D5+pwDnvhBbwbDsxvfdcKF5/o2o=;
 b=Jt3FPx3S4gK//08qFG/vsEJ9934c63N0KXO4waEqYHIqrWS/Jv2xgUttIL59ubppet/wB9imPvJ8FezIIId47pbiUPW6RJ4g7n2G+Vu3FSL+74gE1vubaJoHOXW1WMuGaf53YA6cNN0pggemnIN9h32pN/cWLBZ1+sPnfj6LrNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45810f259d438bca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaivM5W/YR5q7hil1ZB3aCnEqpTDp9SqEhEoYC3szP7vb9KDjfRkOcitqJUyrleKAiFxmWngrplq8YMSi3HvRa+trxIy+R6zFw8nREFIywV5gPlAx02XDoGzH14wsVIE7MMrRfujqFLwgZgX9ODOintKzPU4JcP+IMDf99FjbYYOVB13o1XUPr8X9e2MH5I8GllSemdUy+/XcARFO7vIMZK3Wpdk1F6K3CLsdmfYbL9o/xu7wm+iikDSK0p8MJe7GtKqGkn/EIr/VXV1lzKbOkGXDH2eUjmJC0X1QQZNczUG6iy628u/5xGhVvJsjrt2FQjdvaN2qZrCSP7VDrPHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb21Prp8fY+sRO79D5+pwDnvhBbwbDsxvfdcKF5/o2o=;
 b=CfAMaPClnL+n/6Q9GWFs1wABvawGG7cFSFz8eNqs3g3etpyP99JFNu/E8eqXzgFUAaTCyZ73BhUIkKXMYTySg3z38L1dQdOzgnbxBp1MPcNJS7CX5JxGnoKoYH5dzSgDx0bffXNDFxtc2WFniuzGum28yEPSsP11bAQiJzRwABr3mPliDyHvm+NZxwFY1mCL3zacmagjADIZ6wsxm1GnCJE/K7rMmpJ/QHVaJ0SG/QgOXb+KPwq6UZ2TSnhbhC4VJiQNMxSvtCR4U9rtkzPwGDBFGqcAp0anZfeS3HHyeUU0kI5uQBQpM0oLB1m39i5ad8rmmPLVSPQrBzSJ2PmPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb21Prp8fY+sRO79D5+pwDnvhBbwbDsxvfdcKF5/o2o=;
 b=Jt3FPx3S4gK//08qFG/vsEJ9934c63N0KXO4waEqYHIqrWS/Jv2xgUttIL59ubppet/wB9imPvJ8FezIIId47pbiUPW6RJ4g7n2G+Vu3FSL+74gE1vubaJoHOXW1WMuGaf53YA6cNN0pggemnIN9h32pN/cWLBZ1+sPnfj6LrNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <4aea82de-6517-a974-2610-897de52fe952@arm.com>
Date: Thu, 13 Jul 2023 13:59:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 35/52] xen/arm: map static memory on demand
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-36-Penny.Zheng@arm.com>
 <16428e2d-423c-6a9c-5caa-6ff5770a840e@amd.com>
 <add845b8-31c1-52a6-18ff-b19a6cb6ef38@arm.com>
 <ae0f338b-e86e-79db-8cb1-65cdd36c0911@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <ae0f338b-e86e-79db-8cb1-65cdd36c0911@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT061:EE_|DB3PR08MB8889:EE_|DBAEUR03FT011:EE_|AM8PR08MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbc86ec-c846-4579-d987-08db83664e4f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0yb8DpECsSfZ4DHPrss3a5Ds7fMT7LhMtcrG+sEg3cxhFIh6T7PnLGrEe6qqcNe7fmtYfgYo4SoGwqNbexioalaz1EgATIoVa1H34TPtkSToaAiOrArv/9bEDBzzlY8+/qwcXJn9A0WQbllNYQF92JBePswTorhhHKTgmAVpfe3NJNYVdxuuKaC8U8GY9ohzd1Z4jWs4o3CX9h8oP55amrXZdmkO1n8jPaBnqpXb+BOP5U1ShDqhr7cP2H+kxZT5IcF94m6h5BhgDU15HwzX2tH1+BqLNDtxQCoZ1Lkjp9mnZ/OSr4OMq0nOXlOn6E7GvFvAJliUtXJz9D2sYm+OBBYwn/qSFmPwhVmgtoYn5WrmVkXj2qGhUGewSfBxBPJuKHwZG8G35ImaFCb5N0zwpneeIrXD0USDPmWSIezSwKG+DJHfFPETRa/Egrgju4MEsWrtqhnIHLJwRZJw5dRpjEMzEsbZB3zFcU0UNlzHtonCrmOmVd+7zB8dfW8Wpnu6U1uGguI7qEMUUTvNG+NdE+E+qsVgKVzJeJZmkq/JG4yCcKvdP+8bF4l51n1HwxKRq9fiA6kklKVwpJ3tlEqpnOXiYy6IgZpZPQ3fbRn1FJSSK1gDB/+G5Mo2lZMmjAmGKV6Reo8o3r8wvPdCnGXIluhUlVpho8IKKboMoZjQ+HYI/7m6/acfvwjY1eRG4UHwoecshtRBUhH9CdLONKaI71AJIyYocfD7FZ9XdTR1Y6DBIX+aCHa3sRfUUmvvjJNtutka1774ewD3pjNf+PVl06NWcbzYq+cM7FWOUDdl4mGnJFBobYyylmp3bVe8rFmIhcod4MR6tY/dAHZlm15MovLFYUWC4s3bCOvp4U93aPw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(31686004)(8936002)(8676002)(41300700001)(54906003)(110136005)(40480700001)(5660300002)(2906002)(316002)(16576012)(44832011)(4326008)(70586007)(70206006)(40460700003)(426003)(478600001)(36756003)(31696002)(86362001)(186003)(336012)(82310400005)(81166007)(356005)(83380400001)(47076005)(82740400003)(2616005)(53546011)(26005)(36860700001)(21314003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8889
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82678c0e-3079-4e49-d350-08db836648fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNdM4eNh2H0iyZ8JagLc+QR1w3UCz7mRF9s4phjRyDIT/U9ch/ZRGe1/1pypo6uc2beQgV7ch625/9Z4FBWPdLwSoUKO95J4GtJdfrcZjvqEr3jyXEhwGTdcebI0O2VgCnBn4mcg7J7rwzkreVMRh4k5l5+UXgElai/ZmD/WcIquMQlvXrPuqWBnVygZ7zvF5HTzVh6bk1sw3QtlvXqc6oSO2hybdei79+RmH73DtAu73z+Yl5t6v4C7XthX1bb7oGSe0cL6f0U5DX8q0hvAHfZqlzOPPHHc+n/wLQDQFnignwIsikjP98mCb3lQqTzbhhm8w5cIPDFbYaSYmaBe5yMWVY1xTImekZkJsCFD3kg1r0oSWniF7NreITv6RVjcSVIiXHNpSyGYja4au/9IxPR4xWvhVwtphzj15qS0c9gpm+p9bVC3lwbMw8ma40HEdKhVg77fQRjfvviQpDotPjQYRMtRgNcdL5y+NDnBXk4LyFO4dvaWvxrr1TzAdvPtemugEsdcLL4JjqRHiJMW2SLZPgV3MGNlVWpRVjIxwpHXT5h1oBQ8VuysM+2wgOQ6A6WkD+WUMn0UR0/cbk3Cmj5Ve0hir+DXNZpFaSmvyGvlv+UYVZ4h8hF11e89VvuD9OIb9tZ2zF9ctStOobFAkSfxM9TcbA4RdJr2CYT5hgN9LB1NSF9iu0VQqsW7rgItwwDlejCdflMLdNOS7rdypiOmPzFqFhjh1KDUt/BBOPR1oMab5GmMSpzdYYCpoM/YkII2jAq85tPyCpv631jk0JFgd4MLOdHn2gcvqXHE7F78NEDQVqUOm9l1n9WkT7QDZ8uIcBoOhfdbPQxzxdk67g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(36860700001)(36756003)(31696002)(86362001)(81166007)(82740400003)(82310400005)(40460700003)(478600001)(110136005)(54906003)(16576012)(8936002)(44832011)(5660300002)(316002)(70586007)(70206006)(2906002)(41300700001)(8676002)(31686004)(4326008)(2616005)(83380400001)(47076005)(336012)(426003)(53546011)(26005)(186003)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 05:59:22.6815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbc86ec-c846-4579-d987-08db83664e4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6580

Hi Ayan

On 2023/7/5 21:33, Ayan Kumar Halder wrote:
> 
> On 05/07/2023 11:16, Penny Zheng wrote:
>> Hi Ayan
> Hi Penny,
>>
>> On 2023/7/4 23:10, Ayan Kumar Halder wrote:
>>> Hi Penny,
>>>
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> In function init_staticmem_pages, we need the access to static memory
>>>> for proper initialization.
>>>> It is not a problem in MMU system, as Xen map the whole RAM in
>>>> setup_mm(). However, with limited MPU memory regions, it is too luxury
>>>> to map the whole RAM.
>>>> As a result, we follow the rule of "map on demand", to map static 
>>>> memory
>>>> temporarily before its initialization, and unmap immediately after its
>>>> initialization.
>>>
>>> I could see that you are using _PAGE_TRANSIENT  to map memory 
>>> temporarily. However, I don't see this being translated to any of the 
>>> MPU hardware features (ie _PAGE_TRANSIENT does not seem to translate 
>>> to any of the attributes in PRBAR, PRLAR, PRENR, etc). Thus, how is 
>>> it different from mapping the memory in "non temporary" way ?
>>>
>>
>> It is only software feature.
>> It is designed for implementing functions like ioremap_xxx(), or 
>> map_staticmem_pages_to_xen() here, which are always occuring with its 
>> reverse unmapping function nearby like iounmap(), or 
>> unmap_staticmem_pages_to_xen(), to map a chunk of memory 
>> *temporarily*, for a very short time.
> I understand that it is a software only feature. But why does the 
> software need to know if the memory is mapped temporarily or not ? What 
> difference does it make ?

See this pair map_domain_page()/unmap_domain_page(), which is used to 
map/unmap page of guest RAM. vcpu in different mode is facing different 
scenario.

Taking usage in copy_guest() as example:
When vcpu in guest mode trying to access its own memory(e.g. copy
hypercall param), there is no need to do the mapping/unmapping in MPU,
as page is already mapped at both EL1/EL2. Checking if it is transient
region in unmap_domain_page() is definitely necessary to help avoid 
unmapping it here.
When vcpu in hypervisor mode at boot time copying kernel image to guest
memory, we need to map page as transient MPU region to do the copying 
and pasting.

>> I want to check this flag in the unmapping function, to ensure that we 
>> are unmapping the proper MPU region.
> 
> I had a look at unmap_staticmem_pages_to_xen() --> xen_mpumap_update() 
> --> control_mpu_region_from_index() and I don't see this flag used 
> anywhere.
 >
> - Ayan
> 
>>
>> Fixed MPU regions are like Xen text section, Xen data section, etc.
>>
>>> Please let me know what I am missing.
>>>
>>> - Ayan
>>>
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - new commit
>>>> ---
>>>>   xen/arch/arm/include/asm/mm.h |  2 ++
>>>>   xen/arch/arm/mmu/mm.c         | 10 ++++++++++
>>>>   xen/arch/arm/mpu/mm.c         | 10 ++++++++++
>>>>   xen/arch/arm/setup.c          | 21 +++++++++++++++++++++
>>>>   4 files changed, 43 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/mm.h 
>>>> b/xen/arch/arm/include/asm/mm.h
>>>> index 66d98b9a29..cffbf8a595 100644
>>>> --- a/xen/arch/arm/include/asm/mm.h
>>>> +++ b/xen/arch/arm/include/asm/mm.h
>>>> @@ -224,6 +224,8 @@ extern void mm_init_secondary_cpu(void);
>>>>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>>>>   /* map a physical range in virtual memory */
>>>>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int 
>>>> attributes);
>>>> +extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>>> +extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>>>
>>>>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t 
>>>> len)
>>>>   {
>>>> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
>>>> index 2f29cb53fe..4196a55c32 100644
>>>> --- a/xen/arch/arm/mmu/mm.c
>>>> +++ b/xen/arch/arm/mmu/mm.c
>>>> @@ -1113,6 +1113,16 @@ int populate_pt_range(unsigned long virt, 
>>>> unsigned long nr_mfns)
>>>>       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
>>>>   }
>>>>
>>>> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   /*
>>>>    * Local variables:
>>>>    * mode: C
>>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>>> index a40055ae5e..9d5c1da39c 100644
>>>> --- a/xen/arch/arm/mpu/mm.c
>>>> +++ b/xen/arch/arm/mpu/mm.c
>>>> @@ -614,6 +614,16 @@ void __init setup_frametable_mappings(paddr_t 
>>>> ps, paddr_t pe)
>>>>              frametable_size - (nr_pdxs * sizeof(struct page_info)));
>>>>   }
>>>>
>>>> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>>> +{
>>>> +    return xen_mpumap_update(start, end, PAGE_HYPERVISOR | 
>>>> _PAGE_TRANSIENT);
>>>> +}
>>>> +
>>>> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>>>> +{
>>>> +    return xen_mpumap_update(start, end, 0);
>>>> +}
>>>> +
>>>>   /*
>>>>    * Local variables:
>>>>    * mode: C
>>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>>> index f42b53d17b..c21d1db763 100644
>>>> --- a/xen/arch/arm/setup.c
>>>> +++ b/xen/arch/arm/setup.c
>>>> @@ -637,12 +637,33 @@ void __init init_staticmem_pages(void)
>>>>               mfn_t bank_start = 
>>>> _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
>>>>               unsigned long bank_pages = 
>>>> PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
>>>>               mfn_t bank_end = mfn_add(bank_start, bank_pages);
>>>> +            int res;
>>>>
>>>>               if ( mfn_x(bank_end) <= mfn_x(bank_start) )
>>>>                   return;
>>>>
>>>> +            /* Map temporarily before initialization */
>>>> +            res = map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
>>>> + mfn_to_maddr(bank_end));
>>>> +            if ( res )
>>>> +            {
>>>> +                printk(XENLOG_ERR "Failed to map static memory to 
>>>> Xen: %d\n",
>>>> +                       res);
>>>> +                return;
>>>> +            }
>>>> +
>>>> unprepare_staticmem_pages(mfn_to_page(bank_start),
>>>>                                         bank_pages, false);
>>>> +
>>>> +            /* Unmap immediately after initialization */
>>>> +            res = 
>>>> unmap_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
>>>> + mfn_to_maddr(bank_end));
>>>> +            if ( res )
>>>> +            {
>>>> +                printk(XENLOG_ERR "Failed to unmap static memory to 
>>>> Xen: %d\n",
>>>> +                       res);
>>>> +                return;
>>>> +            }
>>>>           }
>>>>       }
>>>>   #endif
>>>> -- 
>>>> 2.25.1
>>>>
>>>>

