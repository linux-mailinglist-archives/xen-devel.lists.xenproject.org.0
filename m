Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47F37519D2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562960.879787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqfb-0008Lk-7L; Thu, 13 Jul 2023 07:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562960.879787; Thu, 13 Jul 2023 07:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqfb-0008J6-3e; Thu, 13 Jul 2023 07:23:23 +0000
Received: by outflank-mailman (input) for mailman id 562960;
 Thu, 13 Jul 2023 07:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMFS=C7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qJqfZ-0008J0-TW
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:23:22 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d52414-214e-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 09:23:19 +0200 (CEST)
Received: from DBBPR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:d4::17)
 by VI1PR08MB5485.eurprd08.prod.outlook.com (2603:10a6:803:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 07:23:11 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::29) by DBBPR09CA0029.outlook.office365.com
 (2603:10a6:10:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:23:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 07:23:11 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Thu, 13 Jul 2023 07:23:11 +0000
Received: from 18bcb988f32f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74DC55A5-96B1-43DB-9E87-A50C1ABFC0ED.1; 
 Thu, 13 Jul 2023 07:23:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18bcb988f32f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jul 2023 07:23:04 +0000
Received: from AM6P191CA0082.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::23)
 by DB9PR08MB6457.eurprd08.prod.outlook.com (2603:10a6:10:23e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 07:23:02 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::58) by AM6P191CA0082.outlook.office365.com
 (2603:10a6:209:8a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22 via Frontend
 Transport; Thu, 13 Jul 2023 07:23:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Thu, 13 Jul 2023 07:23:01 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 07:23:00 +0000
Received: from [10.169.188.57] (10.169.188.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 13 Jul 2023 07:22:58 +0000
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
X-Inumbo-ID: 23d52414-214e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X5YRe7IEE82qehEe9TCTySMrhm/yQ/XCaBRvAiyH24=;
 b=S96TuXMq8Xo0WYjRkOoIXecXHd87uh268hga+6Ng4U5A+RdnT172oRAU8gxzzM3/mxkEWlY8nIlNUsamccxLkL1d4AGG5/tCGTJ8rJt5/RXJ5LKVU3Xkjdox4r/VTRLST2TU58OrSyWk6AsVa6imiC6r2qBr+OGQYlNsu1dfbxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57ba763cd74662de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHUPD1oRMwBlDeG5kihQlpwCgN5fzaleS8kzvVdGuqnqLBcAzecLlZ3sGXvgETrGd5eAJshhR1pnIXoPuWHA9w7OlcZ4tr3OzEKNQaLcU7gBL5v8TZpr0laik6QbuaaF+CD+IoypTx/fy578y766E0ESPdGRhViZqrkpc/ebTNZPhMvfx0JvR1+2tHD/pjilYKbREt6jtbO5nSGYMhKApxj2/zcDPZq0/zCaCLYhEnIoZoTRm8hRhPQim8W7U8BgnsRja4DBCxRiGv1W4etSaGgri8uQjtK1uJ1wKVTwVHkuZyh9L8WWKc1A3Owlyko5+nbK7UHdDbW6S3uWk097Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3X5YRe7IEE82qehEe9TCTySMrhm/yQ/XCaBRvAiyH24=;
 b=VhOWFPTtIZbC1XAmANaNDqvecNra/8vg5+VQ9nazYwY1zM84GKgVGD7J9GhqvtfGT7Je7zpZZCYvJQxi0hX2pwCjfNathIAhlZrZGtiO0PPBgxcWZOaoHpueEk229okh9r3SeTmf0ruAbs2sDsvrhSQLB63yq1PD/DVY12oeLZ+efC8rQvx9Hzyu1x2KOemEzggNbWdYAmYHnXkSagoETArtEKX6YOH+5UlO6RVAncURxPxzmkeVhJPbuIWRfrF8F/cNISRO+57XMq4RRjCi1tfhCkoTk9Zr68ppSLH6LolESkt01Cc56Z2n8SZGvEL6wgFLQNhjjwR3vj9tK3btPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X5YRe7IEE82qehEe9TCTySMrhm/yQ/XCaBRvAiyH24=;
 b=S96TuXMq8Xo0WYjRkOoIXecXHd87uh268hga+6Ng4U5A+RdnT172oRAU8gxzzM3/mxkEWlY8nIlNUsamccxLkL1d4AGG5/tCGTJ8rJt5/RXJ5LKVU3Xkjdox4r/VTRLST2TU58OrSyWk6AsVa6imiC6r2qBr+OGQYlNsu1dfbxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <e32b0108-8376-df56-6fa5-77562586f40f@arm.com>
Date: Thu, 13 Jul 2023 15:22:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 44/52] xen/mpu: P2M initialization in MPU system
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-45-Penny.Zheng@arm.com>
 <7df5b74c-8570-a484-b0c3-978a44a7c66a@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <7df5b74c-8570-a484-b0c3-978a44a7c66a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT019:EE_|DB9PR08MB6457:EE_|DBAEUR03FT024:EE_|VI1PR08MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ce018e-aee4-468a-a154-08db8372038f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iWKr4gXreUpwXDZtyASydfOWIRM4OiDowy4jo/UpHg1tIy13cUPyMOyuYwU6Fy97hIJ/yyZrbh1xCITN7+WAwEgwYmO5bUmYlzQnF1AjNcPtXvAYw3UTTrA/Ne3aPs2ybPBErx9cuSiZa/SUb3jdbZq1J/CP0M2SXtN3aUsTuKsLHZ05jbf+I59WX6ILZCGal6Gb71ZjJBs7PAa541UlECOlpS5eAM09j8en+pF3Z469XkkRoVr3NLRnZpuoyARXu2iTRmY+Py85Br9bGZ5nSaVldKgUO2pJ04A47oL2WkNIja+4+TFu2nQyRLqp7mVaPEjlQLdg4Doj1fh4utXeDX5PQ7TTTeW61T8f+FRxk0l3o1GPSAm1KT1kdfyB1kvrt93T2oXjXgaab8PDSEcr235DNhTrpS5qfvFvqUeMi/u8PxIJB23LD6xw1dUFppjzpeegje5MYekWa0WlOgUpNnhpEML0jq2Q3/ocvKKlFlpLliWrCN/gkT1QuHbIWUNF4ksGHv99/2het76tkxLsI8lxp3iSLr5xn0VALAx7ftNE/5gynBiph509N2AllvfuDfWrjUzErQt/D4LAaIYEt/oCuGpy4k4PeE9x6GC6poPK7Rh471ht0xZw/yFPE+sp9iom0neXdtU4VCnHX9oSjgpxqs0TJP1QCCAk0rEvHEQFnfVeR/ep/OyIrFqeuv9ktr1AmnR7pI3ZiuoUL6i/gOQf9WcaHH7StXrk2ScbM5I91ug4JP6Puauznc4Ci/X4F4j1KykGfuRFk2tunEFrLOBkhXxekHrrds5RBezKMvnFpEexNfMbmmuXtcE55dO5BP6iBlZibHJjN3wwrD4Odw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(110136005)(16576012)(54906003)(316002)(186003)(336012)(70206006)(4326008)(31686004)(70586007)(478600001)(41300700001)(40460700003)(8676002)(8936002)(53546011)(40480700001)(86362001)(31696002)(82310400005)(26005)(5660300002)(44832011)(83380400001)(47076005)(36860700001)(356005)(81166007)(2616005)(36756003)(2906002)(426003)(82740400003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6457
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e24a7d5-ef91-4f96-c316-08db8371fdea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	41hYnpveu8RtKJnKgcayWmGTkQ0kVQa1LeQIT+Y2Ahu6fEB/qwPwzdaJr77Q48mU/Oct926jKD8iacAQIbcq7L2ULhfNUlGnu/2zlLlxvpbK0KUA6bhwXsvtoZScziU+wvt+DCLSPRfdwF3uTW3IG9stYzDC93IURNdt7v5ayRssW3dxrCLYJ8P9LvxGAyGqEHRJUPEOJEsqbMekTW4zgKdk+seaaY6IMBiuzRzlVRFeboXgiBPfWJOxXtawrWKpkk6nA92SQb8NuZCqh+5naaiyenyKxVOEexpux5O1bixIZ0KmZu69zgN42qaCsAkDdz0TN+K1ZEpKTvv2gy+puGxkaL5PFAzUweLi2rcONdev63PAKo3JZ62wKAZ5pZCBryYPSdc8IRzr2YWL1DSY4/gUuNCVYXIydGW8USnrM4pYnem1qc9gy6ozRGyQWNomS8tDf3KEPpRGNJ5w06D38gYwHihVDmUvhSBvQou7wTjFH0uOhN5jTXcjkU+J0/WDFz5iQTbqiKuEwW0KoFuCUFAEILTwxhQi/bfWZ7xwpuKD/52cFnZT/QHaNu4diVSDo77ZY58W5dD48YILaBVX6UixBXhJVPEhk8/2ivOhoDCYO86eLmyQMNAZe/d9DPBlD4aYU5nGVCkAdNWYhNBSy9J8+L+N32Z/NrldizqS+pP/dHPvOQ99Faagam+2dEm4Gk3BCkB24/AQAc+jUtTuyIpTZwOo4Td3oyM5FIuej1WNJuWNFLNirHYIDTXsEeaR4ctTknTsShfvbw0HwVj1aqm7OFGnII1rRyiqFO2VwkZr9ou9fUa2R4cmJtZlozL6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(110136005)(16576012)(54906003)(316002)(186003)(336012)(31686004)(4326008)(70206006)(70586007)(478600001)(41300700001)(40460700003)(8676002)(8936002)(53546011)(40480700001)(86362001)(31696002)(82310400005)(26005)(5660300002)(44832011)(83380400001)(47076005)(36860700001)(81166007)(2616005)(36756003)(2906002)(426003)(82740400003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 07:23:11.2312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ce018e-aee4-468a-a154-08db8372038f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5485

Hi, Ayan

On 2023/7/5 23:35, Ayan Kumar Halder wrote:
> Hi Penny,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> We inherit p2m_init() to do P2M initialization in MPU system, including
>> VMID assignment, setting up P2M MPU region mapping table, etc.
>>
>> p2m_alloc_table() is responsible for allocating per-domain P2M MPU memory
>> region mapping table. As a MPU memory region structure(pr_t) takes 16 
>> bytes,
>> even with maximum supported MPU memory regions, 255, MPU memory 
>> mapping table
>> at most takes up less than 4KB.
>>
>> VSCTLR_EL2, Virtualization System Control Register, provides 
>> configuration
>> information for VMSAv8-64 and PMSAv8-64 virtualization using stage 2
>> of EL1&0 translation regime, bit[63:48] of which determines VMID for the
>> EL1-Guest-OS.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - new commit
>> ---
>>   xen/arch/arm/include/asm/mpu/mm.h |  3 ++
>>   xen/arch/arm/include/asm/p2m.h    |  5 +++
>>   xen/arch/arm/mpu/mm.c             | 22 ++++++++++
>>   xen/arch/arm/mpu/p2m.c            | 69 +++++++++++++++++++++++++++++++
>>   4 files changed, 99 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h 
>> b/xen/arch/arm/include/asm/mpu/mm.h
>> index a83519ad13..4df69245c6 100644
>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>> @@ -2,6 +2,8 @@
>>   #ifndef __ARCH_ARM_MM_MPU__
>>   #define __ARCH_ARM_MM_MPU__
> #ifdef CONFIG_ARM_64
>> +#include <asm/arm64/mpu.h>
> #endif
>> +
>>   extern struct page_info *frame_table;
>>   extern unsigned long frametable_pdx_end;
>>
>> @@ -11,6 +13,7 @@ extern uint8_t is_mm_range_mapped(paddr_t pa, 
>> paddr_t len);
>>   extern void *map_mm_range(paddr_t pa, size_t len, unsigned int 
>> attributes);
>>   extern void unmap_mm_range(paddr_t pa);
>>   extern bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len);
>> +extern pr_t *alloc_mpumap(void);
>>
>>   #endif /* __ARCH_ARM_MM_MPU__ */
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>> b/xen/arch/arm/include/asm/p2m.h
>> index d9c91d4a98..c3598d514e 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -61,8 +61,13 @@ struct p2m_domain {
>>       /* Current VMID in use */
>>       uint16_t vmid;
>>
>> +#ifndef CONFIG_HAS_MPU
>>       /* Current Translation Table Base Register for the p2m */
>>       uint64_t vttbr;
>> +#else
>> +    /* Current Virtualization System Control Register for the p2m */
>> +    uint64_t vsctlr;
> 
> register_t vsctlr;
> 
> So that it is 64-bit for ARM_64 and 32-bit for ARM_32.
> 

Understood, will fix

>> +#endif
>>
>>       /* Highest guest frame that's ever been mapped in the p2m */
>>       gfn_t max_mapped_gfn;
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 27d924e449..de5da96b80 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -872,6 +872,28 @@ void __init remove_early_mappings(paddr_t dtb_paddr)
>>               panic("Unable to destroy early Device-Tree mapping.\n");
>>   }
>>
>> +/*
>> + * Standard entry to dynamically allocate MPU memory region mapping 
>> table.
>> + * A 4KB page is enough for holding the maximum supported MPU memory
>> + * regions.
>> + */
>> +pr_t *alloc_mpumap(void)
>> +{
>> +    pr_t *map;
>> +
>> +    /*
>> +     * A MPU memory region structure(pr_t) takes 16 bytes, even with 
>> maximum
>> +     * supported MPU memory regions, 255, MPU memory mapping table at 
>> most
>> +     * takes up less than 4KB.
>> +     */
>> +    map = alloc_xenheap_pages(0, 0);
>> +    if ( map == NULL )
>> +        return NULL;
>> +
>> +    clear_page(map);
>> +    return map;
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
>> index a7a3912a9a..8f728f8957 100644
>> --- a/xen/arch/arm/mpu/p2m.c
>> +++ b/xen/arch/arm/mpu/p2m.c
>> @@ -4,6 +4,7 @@
>>   #include <xen/sched.h>
>>   #include <xen/warning.h>
>>
>> +#include <asm/mpu/mm.h>
>>   #include <asm/p2m.h>
>>   #include <asm/processor.h>
>>   #include <asm/sysregs.h>
>> @@ -97,6 +98,74 @@ fault:
>>       panic("Hardware with no PMSAv8-64 support in any translation 
>> regime.\n");
>>   }
>>
>> +static uint64_t __init generate_vsctlr(uint16_t vmid)
>> +{
>> +    return ((uint64_t)vmid << 48);
>> +}
> 
> Please move ^^^ to ./xen/arch/arm/include/asm/arm64/mpu.h as it differs 
> between R82 and R52
> 

Sure, will do

> - Ayan
> 
>> +
>> +static int __init p2m_alloc_table(struct domain *d)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    pr_t* p2m_map;
>> +
>> +    p2m_map = alloc_mpumap();
>> +    if ( !p2m_map )
>> +    {
>> +        printk(XENLOG_G_ERR "DOM%pd: p2m: unable to allocate P2M MPU 
>> mapping table\n", d);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    p2m->root = virt_to_page((const void *)p2m_map);
>> +
>> +    return 0;
>> +}
>> +
>> +int p2m_init(struct domain *d)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    int rc = 0;
>> +    unsigned int cpu;
>> +
>> +    rwlock_init(&p2m->lock);
>> +    spin_lock_init(&d->arch.paging.lock);
>> +
>> +    p2m->vmid = INVALID_VMID;
>> +    p2m->max_mapped_gfn = _gfn(0);
>> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
>> +
>> +    p2m->default_access = p2m_access_rwx;
>> +    /* mem_access is NOT supported in MPU system. */
>> +    p2m->mem_access_enabled = false;
>> +
>> +    /*
>> +     * Make sure that the type chosen to is able to store an vCPU ID
>> +     * between 0 and the maximum of virtual CPUS supported as long as
>> +     * the INVALID_VCPU_ID.
>> +     */
>> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < 
>> MAX_VIRT_CPUS);
>> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < 
>> INVALID_VCPU_ID);
>> +
>> +    for_each_possible_cpu(cpu)
>> +       p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
>> +
>> +    /*
>> +     * "Trivial" initialisation is now complete.  Set the backpointer so
>> +     * p2m_teardown() and friends know to do something.
>> +     */
>> +    p2m->domain = d;
>> +
>> +    rc = p2m_alloc_vmid(d);
>> +    if ( rc )
>> +        return rc;
>> +    p2m->vsctlr = generate_vsctlr(p2m->vmid);
>> +
>> +    rc = p2m_alloc_table(d);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    return rc;
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> -- 
>> 2.25.1
>>
>>

