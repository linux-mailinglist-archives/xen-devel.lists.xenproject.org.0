Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E07481DC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559019.873668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzZg-0000ty-Cv; Wed, 05 Jul 2023 10:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559019.873668; Wed, 05 Jul 2023 10:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzZg-0000rp-9z; Wed, 05 Jul 2023 10:17:28 +0000
Received: by outflank-mailman (input) for mailman id 559019;
 Wed, 05 Jul 2023 10:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGzZe-0000rj-JG
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:17:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2218d24b-1b1d-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 12:17:24 +0200 (CEST)
Received: from DB8PR06CA0059.eurprd06.prod.outlook.com (2603:10a6:10:120::33)
 by GV2PR08MB8438.eurprd08.prod.outlook.com (2603:10a6:150:bc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 10:16:47 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::6d) by DB8PR06CA0059.outlook.office365.com
 (2603:10a6:10:120::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 10:16:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 10:16:46 +0000
Received: ("Tessian outbound 546d04a74417:v142");
 Wed, 05 Jul 2023 10:16:46 +0000
Received: from 20d070d6f704.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD7B940E-5B18-4841-B6ED-01FBE54B8FA0.1; 
 Wed, 05 Jul 2023 10:16:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20d070d6f704.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 10:16:40 +0000
Received: from DU2PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:3b::34)
 by AM8PR08MB5617.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:16:38 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::97) by DU2PR04CA0029.outlook.office365.com
 (2603:10a6:10:3b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 10:16:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 10:16:38 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 10:16:36 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 10:16:34 +0000
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
X-Inumbo-ID: 2218d24b-1b1d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGKcRV8ZVxRk6HkQxNgVHoGgzsREVbM/znqOXqnir2w=;
 b=OMeCyu5UTF8aQxFJvjVIiXOLeg+QhgkNd34nafXrYafPXLmgn/MG6b0XQYNPCtpAoeQxFzfECdUxBEfJFfKK93kU4wZ1xFkuTCdGqtXAZYjK7s4qJHSnCyBZYRub0AzZgiVDr2ykynwsGRdT4+p8wk1DwQODsZKOYca83AIcLjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b806ed44ce0801b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYEAq32Ne4gRIEJ3N0LEY+ZKmj9wtLFJlYxyeG2q/gKqRO3xezT2oryxzkPRFXQgfE4jP1Iuk8vdsu2RYmT/aeyOwFWwTQW+fuz1yde7syd/LZ6FcsiZH8ToAibX6hgUKDydYwcXOAi3q/JWaxjzxfeppQ1c+E8l6J+VS6cIhtTg1MnT5Q1Q9PG7mbGuv6r3jDfNOfp6JkfaqN5xP0cBo8n4mqwSdtxNNEKcPO+GFDKi2zc0BRm+UBeyvkB1rMeXAZx2OAe+lySd5XacjD3YdCCFSegjC0v+vgD2vje3ggiMJp5C1bmf8vxf/aT4vHaxXKT0a1czEONTG3qQl2PM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGKcRV8ZVxRk6HkQxNgVHoGgzsREVbM/znqOXqnir2w=;
 b=g4X+4C+7/HftVooZ617XIWiUdOR8zI5QVbLMPPTeRzy4C3n47s6Hl3Cwk2o2UB0izwl1JKLYQ9hx+DlG88Ytdrz8MXx4xjjT6Xh9CvtD4L7bKRo7V0eHkhZ8nIOLw11eEq6s7s3xCppZuVUJoMpE6OzrgQ7WgCvBVsfvEnmwsBWeJtx6tvv73RAy/9MW3OqWskDFb4TyDF7t8UtHR/OMkRPkrDzD4qEADEN2jHuWSDgOHrf0Nd74dNlyjox92nWcZeHSkcjHty8heT6VjejcSbCfinZ5oPeSfdSeydinw7YEJjb4IJ0l+UQ7v15lGJXC+Hicr5Ew9pY1TOGRIAybaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGKcRV8ZVxRk6HkQxNgVHoGgzsREVbM/znqOXqnir2w=;
 b=OMeCyu5UTF8aQxFJvjVIiXOLeg+QhgkNd34nafXrYafPXLmgn/MG6b0XQYNPCtpAoeQxFzfECdUxBEfJFfKK93kU4wZ1xFkuTCdGqtXAZYjK7s4qJHSnCyBZYRub0AzZgiVDr2ykynwsGRdT4+p8wk1DwQODsZKOYca83AIcLjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <add845b8-31c1-52a6-18ff-b19a6cb6ef38@arm.com>
Date: Wed, 5 Jul 2023 18:16:32 +0800
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
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <16428e2d-423c-6a9c-5caa-6ff5770a840e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT060:EE_|AM8PR08MB5617:EE_|DBAEUR03FT036:EE_|GV2PR08MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4e92d9-b1a7-4742-d471-08db7d40f075
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p145TI0F01eFD7sN9pfhOwbmoSzOKaqaG1Ro8D0hInQC2/O8la49SPT7OUPIuWF+NqQBW0+LkYj16PrU3wmDmA+Bhgor+uL9GKt7qJMHa1IqNFr5KlUl/S9l4Dw+c7kg4/1CkyqHUMLZ/wPuyfHOHPNiphfPqN50JP9PHs1h/7tKqRpPFjnwIgUSk/YPHpfts7RXtChJKoYIVix+g2OuQ65rIDvPzp5DnnactZ/iu2LDm+7By370BXAfjsdMkPYbhd9yWpp2lcXmb28k6wYXrrRq0JuXjC71Z31/S/h00Inxx4roXh79izJ1xwgycjxdrWaamp0qH+HGP/uFnrnCRsq7eDhwgJ/h1Hj1tgHFf+wBIBywQ51tIbsULDQQdphAyxUvC/gzj9uyUSTeL+xLUTCf7wcBcmq32iGRPuUkAJLGoDLGWoCKMUW+CY6H2gd4WhYA7EmxVwh6Luz8Ac5IHUdx0Jo3lMu3oWiNpRpvuuu3X0A5rtCmUvYRxRlVUv2l2Co4ZHuEFji2nG74b0aN08F6w0sqoDPtj/MQjWS03SBZ9OhTzjscuY6F0kN9ALhfAzhzUahMA7dbsl/oxViR7FmfD7e0RcYhm4ZsscD33o7gPpDNBeK6qHWfTsrQG/nhGs5zIfGXVJi+WITvs7Z4rVhJqD0AMnlQvi1h6ZEg17od6N1VclSrKgWK35lmMxll+hLrt8LnQ8Nd1S/yujEmgCRMszp9nrmDLUHX2vYosbK7ybufE1ruZcfueGZxeHbN60fLSCiqhGEglV46Af/dft4ZGXP5mMWZefDqI8aVD1Iyig8lTG+B+jpX1ijmR9V1zrUev5wtvfgxiikP81+6vv25J44KM1UZU4xteDjCINc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(31686004)(2906002)(82310400005)(44832011)(336012)(5660300002)(86362001)(2616005)(40480700001)(36860700001)(31696002)(70206006)(8676002)(8936002)(53546011)(110136005)(54906003)(478600001)(16576012)(26005)(186003)(356005)(82740400003)(426003)(47076005)(40460700003)(81166007)(83380400001)(4326008)(70586007)(36756003)(316002)(41300700001)(3940600001)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5617
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	016afb09-63e1-4647-ee93-08db7d40eb43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMv0/TBR7Fxmb2iFBPSGN4LQsrBPeKCuc+MdkCe/VvuZFgmmvU48JR0jsCxmkOzoBaX0KKnZRiJmNOgZWkZzRJJa/1d93Q86zaK6ArTQchOBHTIkWAL9Jn1AelXdF9IkxbQqKS6eIeDYQ/C8XTyzkK07NSb6F2wtlDKokI9vh+S+4zAdXd+o5pGeCuyS69wn35elLeQ34m0bpyUnd9Cnk+wuEd124k9gVrCyIgJQckw71H9LOXO2Fgx9erObXq1o9lJgVL8jax5wOK5kxUKUI0jjoLNnrlrb1aMNOhQXpTz2OQbZnnD636xPp8EQzyZlbA5gGyO8s0PC9ZzwPMT8zPzSPsk+bobMCiFtV4ZsPCf3hPOyxLssuh7dmUc+GMo3f3XPfcTzu0GUPvDM4ILzkZhU7J+mU139zM5AMYV7AHGZIrQHxj8aUb2JTEYEpime9KnKNosLPT4EZXrLr/7BS1uICXCsz6vpehl/iXZkwPMwFFrZ5lhP3YcRDpF1gRy4Qy9ARY+sSdBGOclxokb5kYG/GxP1Ls/ABIWG/HZr0OS9x90jBr9TygU41Q15rWFGBYzdZvsrAZiL+jWWDBT+DE3C/0z56e1/qh2YCKiG2Vd8qr0/1K0ggehuBE9r4wNudgG3qs4cnmpJFBggi28KP4rOtsYnuyl9hgO9CQPOZbV5QfvRzxLsZq7O/YrHvaHaSC6jlhadk3F4ye0Fsi6rn2Oly4rpMRZWNzXAAt1VmxEbld2Sia6pZlx3hzgwpUwxODUlabrprW/L9CvMu1YlI4lVQrA0CEzOKMxDxWqreDdBq5ckkW5ipfSZykhWDBKTBKyVaeXXSWemBD/veFcAUA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(31686004)(44832011)(2906002)(4326008)(478600001)(316002)(70586007)(70206006)(8676002)(8936002)(5660300002)(36756003)(40460700003)(336012)(31696002)(41300700001)(40480700001)(36860700001)(86362001)(110136005)(16576012)(54906003)(82310400005)(186003)(53546011)(2616005)(26005)(47076005)(81166007)(426003)(83380400001)(82740400003)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:16:46.8533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4e92d9-b1a7-4742-d471-08db7d40f075
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8438

Hi Ayan

On 2023/7/4 23:10, Ayan Kumar Halder wrote:
> Hi Penny,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> In function init_staticmem_pages, we need the access to static memory
>> for proper initialization.
>> It is not a problem in MMU system, as Xen map the whole RAM in
>> setup_mm(). However, with limited MPU memory regions, it is too luxury
>> to map the whole RAM.
>> As a result, we follow the rule of "map on demand", to map static memory
>> temporarily before its initialization, and unmap immediately after its
>> initialization.
> 
> I could see that you are using _PAGE_TRANSIENT  to map memory 
> temporarily. However, I don't see this being translated to any of the 
> MPU hardware features (ie _PAGE_TRANSIENT does not seem to translate to 
> any of the attributes in PRBAR, PRLAR, PRENR, etc). Thus, how is it 
> different from mapping the memory in "non temporary" way ?
> 

It is only software feature.
It is designed for implementing functions like ioremap_xxx(), or 
map_staticmem_pages_to_xen() here, which are always occuring with its 
reverse unmapping function nearby like iounmap(), or 
unmap_staticmem_pages_to_xen(), to map a chunk of memory *temporarily*, 
for a very short time.
I want to check this flag in the unmapping function, to ensure that we 
are unmapping the proper MPU region.

Fixed MPU regions are like Xen text section, Xen data section, etc.

> Please let me know what I am missing.
> 
> - Ayan
> 
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - new commit
>> ---
>>   xen/arch/arm/include/asm/mm.h |  2 ++
>>   xen/arch/arm/mmu/mm.c         | 10 ++++++++++
>>   xen/arch/arm/mpu/mm.c         | 10 ++++++++++
>>   xen/arch/arm/setup.c          | 21 +++++++++++++++++++++
>>   4 files changed, 43 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> index 66d98b9a29..cffbf8a595 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -224,6 +224,8 @@ extern void mm_init_secondary_cpu(void);
>>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>>   /* map a physical range in virtual memory */
>>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int 
>> attributes);
>> +extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>> +extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>
>>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>>   {
>> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
>> index 2f29cb53fe..4196a55c32 100644
>> --- a/xen/arch/arm/mmu/mm.c
>> +++ b/xen/arch/arm/mmu/mm.c
>> @@ -1113,6 +1113,16 @@ int populate_pt_range(unsigned long virt, 
>> unsigned long nr_mfns)
>>       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
>>   }
>>
>> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>> +{
>> +    return 0;
>> +}
>> +
>> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>> +{
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index a40055ae5e..9d5c1da39c 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -614,6 +614,16 @@ void __init setup_frametable_mappings(paddr_t ps, 
>> paddr_t pe)
>>              frametable_size - (nr_pdxs * sizeof(struct page_info)));
>>   }
>>
>> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>> +{
>> +    return xen_mpumap_update(start, end, PAGE_HYPERVISOR | 
>> _PAGE_TRANSIENT);
>> +}
>> +
>> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>> +{
>> +    return xen_mpumap_update(start, end, 0);
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index f42b53d17b..c21d1db763 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -637,12 +637,33 @@ void __init init_staticmem_pages(void)
>>               mfn_t bank_start = 
>> _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
>>               unsigned long bank_pages = 
>> PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
>>               mfn_t bank_end = mfn_add(bank_start, bank_pages);
>> +            int res;
>>
>>               if ( mfn_x(bank_end) <= mfn_x(bank_start) )
>>                   return;
>>
>> +            /* Map temporarily before initialization */
>> +            res = map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
>> +                                             mfn_to_maddr(bank_end));
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Failed to map static memory to 
>> Xen: %d\n",
>> +                       res);
>> +                return;
>> +            }
>> +
>>               unprepare_staticmem_pages(mfn_to_page(bank_start),
>>                                         bank_pages, false);
>> +
>> +            /* Unmap immediately after initialization */
>> +            res = unmap_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
>> +                                               mfn_to_maddr(bank_end));
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Failed to unmap static memory to 
>> Xen: %d\n",
>> +                       res);
>> +                return;
>> +            }
>>           }
>>       }
>>   #endif
>> -- 
>> 2.25.1
>>
>>

