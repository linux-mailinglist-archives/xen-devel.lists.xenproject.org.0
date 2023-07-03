Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1F7455C2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 09:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558019.871788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGDgJ-0006Ty-8i; Mon, 03 Jul 2023 07:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558019.871788; Mon, 03 Jul 2023 07:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGDgJ-0006RV-5k; Mon, 03 Jul 2023 07:09:07 +0000
Received: by outflank-mailman (input) for mailman id 558019;
 Mon, 03 Jul 2023 07:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hCK=CV=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGDgH-0006RP-1d
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 07:09:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d085809-1970-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 09:09:02 +0200 (CEST)
Received: from DU2PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:10:3b::8) by
 GVXPR08MB7749.eurprd08.prod.outlook.com (2603:10a6:150:69::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Mon, 3 Jul 2023 07:08:56 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::59) by DU2PR04CA0003.outlook.office365.com
 (2603:10a6:10:3b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 07:08:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 07:08:55 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Mon, 03 Jul 2023 07:08:55 +0000
Received: from 826c2dc06566.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87614CE8-B39B-41D8-81C4-B5F4773FCF38.1; 
 Mon, 03 Jul 2023 07:08:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 826c2dc06566.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 03 Jul 2023 07:08:49 +0000
Received: from AM6P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::18)
 by AM9PR08MB6131.eurprd08.prod.outlook.com (2603:10a6:20b:2de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 07:08:47 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::a3) by AM6P191CA0041.outlook.office365.com
 (2603:10a6:209:7f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 07:08:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 07:08:47 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 3 Jul
 2023 07:08:46 +0000
Received: from [10.169.172.87] (10.169.172.87) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 3 Jul 2023 07:08:43 +0000
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
X-Inumbo-ID: 7d085809-1970-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj/cDl03UCXZVJBoV0kYatgjVvUdCe940CYqzl1ONTc=;
 b=ojEddXJiyXrQgXZRZE6u40Re29YC4HySOslswUEK+lquKVC5dHVyF5Kh/ljEE4eKGsos0smRZk9AMNWLUdztcdB7CaahRw3yXo1KCEbpKbROngKciz9Wk7WZb2UJ5RCPTZ8u1RXAZEP4vS8p8JqqViA4c3QngWkwPupPHP6PGcE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 682245e51d43774b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfUzYA30LaFQqnxlyohNaWI11It6WRwUxWU88ksfqhX2wNdXLVrMzFqa9abCzC52WeeGPhzWdJ/H/wMqeDcdKuffRjKeGsWucyrdKFFCnmCNy6556tigc8/P647u+7mtGOSSexzipj9pfGtSeE23E3jppkKCGi1NEWI7LiP0L65cgyXsHtHqErIan3XST006bjEjCnJ++sTn+vkGYKgRW2CV1U8X6Jn6pdKyFX6jf8LN3528SVeTkAb5/6Q3tZZ3XPADcf5MHyk425ke7GfvlcOA7WLxYsz12qBFcQZlGT9cbgaVa/10a7vX+6nm/EAzHxW1sGDPCkoeW8xB8536lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj/cDl03UCXZVJBoV0kYatgjVvUdCe940CYqzl1ONTc=;
 b=BJskarfGdW2RKr8VyGTQh1q/BpvRq44vhD3LL+kjOTwR1U2DAfceLeJJUD60fsqQxjvN/NZkA3eqUIovfZXjNBIuNJ1t41LIMyFS3yLBjFoEIjzspL5nh7O4B1GL4E4bUyZ5iAelobTbYs25JCip6EsxRo6EN17L9YKf2PkyJ5rCPdkPgutAXUE3triiUGoUsl9uMls1dBEt9B3T+tBAaJibHnYctQ8gV89RnnTPrB9CuKrTz1x99rKC5Yswm0hA7TUBfoKH4G4ix4XCoxW+prwtx/FtwWU03F4CrKlsCu5KUuzYVMN4HNTEBhvNJY8bo9Uzy+dGkGvMonHB8dhf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj/cDl03UCXZVJBoV0kYatgjVvUdCe940CYqzl1ONTc=;
 b=ojEddXJiyXrQgXZRZE6u40Re29YC4HySOslswUEK+lquKVC5dHVyF5Kh/ljEE4eKGsos0smRZk9AMNWLUdztcdB7CaahRw3yXo1KCEbpKbROngKciz9Wk7WZb2UJ5RCPTZ8u1RXAZEP4vS8p8JqqViA4c3QngWkwPupPHP6PGcE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <70007941-cb74-1fc8-61fd-326b66cde84b@arm.com>
Date: Mon, 3 Jul 2023 15:08:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 34/52] xen/mpu: destroy an existing entry in Xen MPU
 memory mapping table
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-35-Penny.Zheng@arm.com>
 <87564d07-391b-7dfa-e28f-e13d73e67811@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <87564d07-391b-7dfa-e28f-e13d73e67811@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT041:EE_|AM9PR08MB6131:EE_|DBAEUR03FT053:EE_|GVXPR08MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a10ac97-75ee-43a1-6fbf-08db7b945da9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MANqSPb7NxUsVDSAXWrF7uu+zh2QE6aCOjjMUPegJpw66j0LAudXMReD7CENYtwD5F+j4B+mvS2v8V9/pUplnQDhqpBBPcaGW6zB0QguxWTmAFUSsGn6dRNpmNb6MS8Zmdk+2ouGmKEjs4u0Ipbt9CRqLEtH5TplrOM7J5W6Nq23GY65hkLmy9Y2qO/aZul6EStuXkxjW3FGdLcut7CoOWN8MzSSMK5SsJpm6vAKiZPU2TWtSPLv8bCJRlgBWMndfEDHJ7gtMPu0cj5Dh/dBXZySWQKlIdjsnKi5ihUJnMEAvYMR3/blD954BmKryNZex3vo+92cm00EhMTeRxxWhLIZUEAOL5BZS6V5mNQ0w671aDKoti5G+9HfG0BwIqG/8bsafhWbn6i0r5EINKyVr9g/C9VGshB/O7k0B7/lTXjdf2spbJ79yKY8/7nbGF0tw2EUFe+7dsOy8TjYvbrxcUGZPPwKkHIpaSNd8zkgaIllxrPHp21mp35B0laR2K8Du9b/LfVLq0IYo+btThdJ0vPKPT0xB9zGl96mf/AdG9Ocu0SjU2OaPgB2FgAFpIQicSfAz0JJ9wZnzsXXG9914pImUUOV0MB62zy5Li0aZ5W1Ep0uaSDTvngRHvwH/sfmAKN25/M/IVLF+q9akxCaRXMfpVmKZN5mQU6XDLXr4syjXhnV7TLQyqQQ03OTBjLOnwLliKC83jr1oOpBK9ilOefi9AjJC33TIMau+KRjVAAosDNj/lKiC6uM1zOLN4LYT7XwwtIjYfcwUkZfA6hBSZ4v3DruhrWG/XhqxJXPeAcpG0SsG3OxB15tPIWvDJ77bDT8opRs4azFctJh3k4eHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(26005)(31686004)(478600001)(82740400003)(31696002)(86362001)(2616005)(186003)(36860700001)(16576012)(54906003)(70586007)(4326008)(81166007)(83380400001)(356005)(336012)(110136005)(426003)(53546011)(316002)(70206006)(47076005)(5660300002)(8936002)(8676002)(44832011)(40460700003)(41300700001)(2906002)(40480700001)(82310400005)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6131
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f1e4ff8-5a92-42c0-562c-08db7b9458a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HSQbROiKa/SSfec908gUAO38KKdrZiPpUhHYvLm1AnKwgRZbf02/piRKwyG50iBgTBSOh/OekmIDkVSFIG2405BeOhd0INHWglNbBzRF5rWDMSUJ3kodFJvNpp0Iy9I96QyrN8/isznXxQyujzoK/tvSkGP5jyfmOsIn7Uke44E7IjeosEAp8d7oD2Ydyk9A0jyP351LFKCj2y0ucXn6esZLVmE0RrMTpJpQ/0XVq+4SEgN7t2vHZq5BK4HVRqiVJIU1JSkCLgcCPuNJQMa6CzUf28WuKzTY5bEL98NrFalxHeQG+cchjesRuDkdOFGhJ1QqSU2uIawROmzV/+bN2AlQ5mbb47sx2AFml9QRmUfBuwT854fHmR72TvEhLA8dW4lbaC2wbFM4tepHxzqkKNYdJiuOZCH42Yhk32ZlLWcQHlqYs7u/zRMwRoE61a1aQuW7/61AEHcjdr0cUlcIUL5/DcHY3B2b4onIyDCkYDK6H6+e1BB+Nlz3iD1A/yWnPBCvIgO5Uz2A/3uhEd2JypDLROjA1W7onTiOtPAR0npySwVUIM+G7dnLiKy0AmP57+LXWS3aaVZ+yGo/upzR0OFyteMrQ2BIIF9w7/7J0tddJaWikvn7UH3fbCh3LQ2+4/7I37dQwEiB0ceXgyScP7nVrjdoefSgawg3WbQplPGheyJhLHkoChbcYJcvoESfOZ0QcBbBEKwpsocl5BIf2I3f/tULF600UK/GgMltjsF5702NaAeMMHzRXCgUWAiDg2c5VprUpqsTpb94zyt7NjCTD6sq/l+KRfs1nGCpoksJO4FrjJubXz4RedSFp4wV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(82310400005)(8936002)(54906003)(16576012)(110136005)(40480700001)(8676002)(36756003)(41300700001)(40460700003)(336012)(426003)(44832011)(36860700001)(5660300002)(478600001)(31696002)(70206006)(70586007)(186003)(86362001)(53546011)(26005)(4326008)(316002)(31686004)(47076005)(81166007)(2616005)(83380400001)(82740400003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 07:08:55.9662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a10ac97-75ee-43a1-6fbf-08db7b945da9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7749

Hi Ayan

On 2023/7/1 00:17, Ayan Kumar Halder wrote:
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
>> destroying an existing entry.
>>
>> We define a new helper "control_xen_mpumap_region_from_index" to 
>> enable/disable
>> the MPU region based on index. If region is within [0, 31], we could 
>> quickly
>> disable the MPU region through PRENR_EL2 which provides direct access 
>> to the
>> PRLAR_EL2.EN bits of EL2 MPU regions.
>>
>> Rignt now, we only support destroying a *WHOLE* MPU memory region,
>> part-region removing is not supported, as in worst case, it will
>> leave two fragments behind.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - make pr_get_base()/pr_get_limit() static inline
>> - need an isb to ensure register write visible before zeroing the entry
>> ---
>>   xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +
>>   xen/arch/arm/mm.c                        |  5 ++
>>   xen/arch/arm/mpu/mm.c                    | 74 ++++++++++++++++++++++++
>>   4 files changed, 84 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>> b/xen/arch/arm/include/asm/arm64/mpu.h
>> index 715ea69884..aee7947223 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -25,6 +25,8 @@
>>   #define REGION_UART_SEL            0x07
>>   #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>>
>> +#define MPU_PRENR_BITS             32
> 
> This is common to R52 and R82.
> 
> Thus, you can put it in the common file (may be 
> xen/arch/arm/include/asm/mpu/mm.h)
> 

Will do.

>> +
>>   /* Access permission attributes. */
>>   /* Read/Write at EL2, No Access at EL1/EL0. */
>>   #define AP_RW_EL2 0x0
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index c8a679afdd..96c025053b 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -509,6 +509,9 @@
>>   /* MPU Type registers encode */
>>   #define MPUIR_EL2   S3_4_C0_C0_4
>>
>> +/* MPU Protection Region Enable Register encode */
>> +#define PRENR_EL2   S3_4_C6_C1_1
>> +
>>   #endif
>>
>>   /* Access to system registers */
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 8625066256..247d17cfa1 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -164,7 +164,12 @@ int destroy_xen_mappings(unsigned long s, 
>> unsigned long e)
>>       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>>       ASSERT(s <= e);
>> +#ifndef CONFIG_HAS_MPU
>>       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>> +#else
>> +    return xen_mpumap_update(virt_to_maddr((void *)s),
>> +                             virt_to_maddr((void *)e), 0);
>> +#endif
>>   }
> 
> Refer my comment in previous patch.
> 
> You can have two implementations of this function 1) 
> xen/arch/arm/mmu/mm.c 2) xen/arch/arm/mpu/mm.h
> 

Refer my comment in previous patch.

I prefer #ifdef in destroy_xen_mappings()

>>
>>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned 
>> int flags)
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 0a65b58dc4..a40055ae5e 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -425,6 +425,59 @@ static int mpumap_contain_region(pr_t *table, 
>> uint8_t nr_regions,
>>       return MPUMAP_REGION_FAILED;
>>   }
>>
>> +/* Disable or enable EL2 MPU memory region at index #index */
>> +static void control_mpu_region_from_index(uint8_t index, bool enable)
>> +{
>> +    pr_t region;
>> +
>> +    read_protection_region(&region, index);
>> +    if ( !region_is_valid(&region) ^ enable )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "mpu: MPU memory region[%u] is already %s\n", index,
>> +               enable ? "enabled" : "disabled");
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * ARM64v8R provides PRENR_EL2 to have direct access to the
>> +     * PRLAR_EL2.EN bits of EL2 MPU regions from 0 to 31.
>> +     */
>> +    if ( index < MPU_PRENR_BITS )
>> +    {
>> +        uint64_t orig, after;
>> +
>> +        orig = READ_SYSREG(PRENR_EL2);
>> +        if ( enable )
>> +            /* Set respective bit */
>> +            after = orig | (1UL << index);
>> +        else
>> +            /* Clear respective bit */
>> +            after = orig & (~(1UL << index));
>> +        WRITE_SYSREG(after, PRENR_EL2);
>> +    }
>> +    else
>> +    {
>> +        region.prlar.reg.en = enable ? 1 : 0;
>> +        write_protection_region((const pr_t*)&region, index);
>> +    }
>> +    /* Ensure the write before zeroing the entry */
> dsb(); /* to ensure write completes */
>> +    isb();
>> +
>> +    /* Update according bitfield in xen_mpumap_mask */
>> +    spin_lock(&xen_mpumap_alloc_lock);
>> +
>> +    if ( enable )
>> +        set_bit(index, xen_mpumap_mask);
>> +    else
>> +    {
>> +        clear_bit(index, xen_mpumap_mask);
>> +        memset(&xen_mpumap[index], 0, sizeof(pr_t));
>> +    }
>> +
>> +    spin_unlock(&xen_mpumap_alloc_lock);
>> +}
>> +
>>   /*
>>    * Update an entry in Xen MPU memory region mapping 
>> table(xen_mpumap) at
>>    * the index @idx.
>> @@ -461,6 +514,27 @@ static int xen_mpumap_update_entry(paddr_t base, 
>> paddr_t limit,
>>
>>           write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
>>       }
>> +    else
>> +    {
>> +        /*
>> +         * Currently, we only support destroying a *WHOLE* MPU memory 
>> region,
>> +         * part-region removing is not supported, as in worst case, 
>> it will
>> +         * leave two fragments behind.
>> +         * part-region removing will be introduced only when actual 
>> usage
>> +         * comes.
>> +         */
>> +        if ( rc == MPUMAP_REGION_INCLUSIVE )
>> +        {
>> +            region_printk("mpu: part-region removing is not 
>> supported\n");
>> +            return -EINVAL;
>> +        }
>> +
>> +        /* We are removing the region */
>> +        if ( rc != MPUMAP_REGION_FOUND )
>> +            return -EINVAL;
>> +
>> +        control_mpu_region_from_index(idx, false);
>> +    }
>>
>>       return 0;
>>   }
>> -- 
>> 2.25.1
>>
>>
> - Ayan

