Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AACF747BF9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 06:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558779.873168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGtnX-0002tt-9A; Wed, 05 Jul 2023 04:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558779.873168; Wed, 05 Jul 2023 04:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGtnX-0002ru-5W; Wed, 05 Jul 2023 04:07:23 +0000
Received: by outflank-mailman (input) for mailman id 558779;
 Wed, 05 Jul 2023 04:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGtnW-0002ro-97
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 04:07:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb72707-1ae9-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 06:07:20 +0200 (CEST)
Received: from AS4P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::14)
 by DU0PR08MB8929.eurprd08.prod.outlook.com (2603:10a6:10:464::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 04:07:17 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e1:cafe::b0) by AS4P192CA0029.outlook.office365.com
 (2603:10a6:20b:5e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Wed, 5 Jul 2023 04:07:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 04:07:17 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Wed, 05 Jul 2023 04:07:17 +0000
Received: from acd7fb345927.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B99CBA0F-F56B-4B67-BFF8-CE802C0618F5.1; 
 Wed, 05 Jul 2023 04:07:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acd7fb345927.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 04:07:10 +0000
Received: from AS9PR05CA0280.eurprd05.prod.outlook.com (2603:10a6:20b:492::32)
 by DU0PR08MB9533.eurprd08.prod.outlook.com (2603:10a6:10:44f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 04:07:09 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:492:cafe::b3) by AS9PR05CA0280.outlook.office365.com
 (2603:10a6:20b:492::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 04:07:09 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 04:07:08 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 04:07:07 +0000
Received: from [10.169.172.87] (10.169.172.87) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 04:07:04 +0000
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
X-Inumbo-ID: 6fb72707-1ae9-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U8hf6nfEf/aYVO3WFhRRHpgwjqUsbYvpp7kXIbyaXk=;
 b=L6ZzQqbJsHLnjVTcwcXlWZ9Aa3YV6SFacK+162926GpJdgDJvVIeV3GXRIKj9O6Rs4Jo9z8MZKuiHzZ1MCCAfGiFZy6lkn9Hb8r3/g+qnSYzJQVejQkQzv+f2UnLG7nrIFj6VV/CW/RuxxpmewSoDXuH8fcXCpM4BKipsIMQ+iA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e6577bf4069bfe2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMuhxBo0y0gF8/ARyGrkDH+uIazQBujY5uv3bGSF3Ox0ighqLLe0/cBRYNjJ1ww7XYC5LYUr6q2nl/eHUppqn1iOhE7AyFBThxgzxcJw9Tz9RUNVds1JtzT60qilkS9KOjjpmMTbyWpxVlDsacfd+fNHog4QQzb0dDYQWU0YM1VAxnbx6ZUOZA2MMRKOmp54kfBGY+4ibAVzrN9TWNSLjgfmZ3xxL1cils40eUqN1KqVdcRz8M42QW1i3Nea+42VjM43Prt0FXOZdhh4kdLOmt9ssN9U577VNTSsRSERgQdRvYGV3r/FBEmfPKVPou8ID18fCzPm63GKnhWiNeMulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U8hf6nfEf/aYVO3WFhRRHpgwjqUsbYvpp7kXIbyaXk=;
 b=YSmnTU5YNWVr2GieWiaI7FsXimqJNBZi2nqV3lzrYF/hNXS5Shbo5mpy9xHEv7xTTJwuwwhfJoKyAu6yap1Q9zj4/oO33iRzydF6x9okGi02fd6FXaDMdtQA4Vxe6Ew4vvdaNSbW7q5hTAsEFEIL1mRel4GPQNLvKQB5lz2XCAxiai8SaQS4uYnxuJeGLNQZzx9UvAy7HlN56mceEx0sBwiIIPZHc/Wcwkhx8yQIN8YhR3S2ASLVMuXE3UZS38cFOjl/0Xmm+yZCflMCIVdrFjP2yYv5p+Ame/a8cBC4IWXv36GdAFap4C8WIAVwc9X+eDfNLKgFBwhm4lLtRHlvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U8hf6nfEf/aYVO3WFhRRHpgwjqUsbYvpp7kXIbyaXk=;
 b=L6ZzQqbJsHLnjVTcwcXlWZ9Aa3YV6SFacK+162926GpJdgDJvVIeV3GXRIKj9O6Rs4Jo9z8MZKuiHzZ1MCCAfGiFZy6lkn9Hb8r3/g+qnSYzJQVejQkQzv+f2UnLG7nrIFj6VV/CW/RuxxpmewSoDXuH8fcXCpM4BKipsIMQ+iA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <ec0b3255-3195-d479-a07b-2dbfc14634af@arm.com>
Date: Wed, 5 Jul 2023 12:07:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 07/52] xen/arm64: prepare for moving MMU related code
 from head.S
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-8-Penny.Zheng@arm.com>
 <2752bf5a-ae87-8cf9-fe4e-d7c2d7a1a6e5@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <2752bf5a-ae87-8cf9-fe4e-d7c2d7a1a6e5@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT020:EE_|DU0PR08MB9533:EE_|AM7EUR03FT060:EE_|DU0PR08MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 0464847e-27ce-4f26-0d2f-08db7d0d525b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JWfM+uZ5M1NgsZ6hfRdjZZjud4EPxnc1KUx1CbqNnqtlpBsd5PHlaJloOCM1xXHgM6h9tC821M7JB+/MihlctOZbrukFgTWaGyZD+FQfEeaYCyXFw++/zA361yDcU0hR30GhT5VWxdateun54J9TXposwCNxyr7Yzwfxo2ipM0u3LRvydveb9yXzzhbVgjPrqM5o5z8ANGIxBA1p4jnStAyPrg1Crf6m2eSmL/QjmY1JmTCWCl/ftO8o7uS74+f+v1I1Hq0D594VgDDD4VhL5YFM7Kwyo4e6FMmLgZVp6kv0RdezntBLWbe2UOgG3xV4ZgaKOrLHaf03YJOVCV58F7DGI25ZUML0dn2ggHtPolVqxX6HzR9SsgObmOMBTZG7bPlu8EvPzOq3/6fuxfx6lW09R058Y7fMCB88OTMQiJqjTlcRecZv0kofu7tqrXLAfNAvqycpWV5GZHfzH7BUO/XqxGBXUcItJu1j/uXiiSvUjWh31jS+Gi2tHB15/Sp5uNKagG0BD7fk8XYKCTbAwVWq4Jw97akuTFqY28eu6EpwaTNEZewRhrHeF0w9U7u8O6hDgt4NesZujXo1pMzUdBzG7cCdY/m/nQ0pGxxQGiH+0o2uHL2JSpXsaeL6IA8gAv5C7pxuAa3O9PTgb1pEstMLjPpXZzpnu/fU5ZlV95a2UUJkuK9rH5VIThoI/lTNjsXDsCjX+yop6ASy6dE7EinY2f5h4ynxx6EOiOi9ebmeUOJ8DZiPq3/R92hbXXrPRfg0mOyMtO/DwNVgZfKn6Jsbk88oOPoAcddW5eUWlGhYtPPuuPrAUKh9sZ+wkwLj1JYgCbyHiysnIXlU59DJbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(2906002)(82310400005)(8936002)(8676002)(54906003)(40480700001)(16576012)(110136005)(36756003)(41300700001)(36860700001)(426003)(336012)(44832011)(5660300002)(478600001)(40460700003)(31696002)(70206006)(70586007)(186003)(53546011)(26005)(86362001)(4326008)(316002)(31686004)(47076005)(81166007)(356005)(2616005)(83380400001)(82740400003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9533
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9c53b93-6ec3-42ad-e8c6-08db7d0d4cfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5YFp09q9bwIAKkT4Ax/R9gv3zCqtG+57CQ3uec7wZZU8kk4eRCdgcxB6f0D+epNpD8l16m01/KliJjeT/VcAg7QJc8dm5nF6EgzQA+VQ/IBbkV0W4mJlBYl6m3UDDuTDFTTZp5gpTIH9lysKtpynUMNt/XqDjHRyeq9O1aD/Pr7g6ry0s98VZV/fhXuXiYTkhISjVPgZDfVC1D4ktoths6p2osIcB4OlaMfuSfjcOiVpWwsGSNik0iWtU6CYUB2YegQA/qLJI/wD9ekQkZY19G7OTBbjWsq2PUegc8fWQfYm8UxwCIucEilyoao8Bapn3SttBlOvF8/RFuoJM8Xj6bdZpJaTFQivQnwoqy4wGmhO7po1BSgubt6CZBrWeUt1PD+wUVymgUImpaltxhhcSCc5NL2/90OYRLbSQtOPYh6zaxdxCv2XEx3658rXpC2n5zrFsIz31c9H6xFc9RB7YZJwO1pL/zxTltfX9q6EjVavvE3NGADxQ4gEuOBQD2aee/RFa3Xq36Je0MDzbmY/0HxRIMuvJaHXfyS7aKTtCYeRD4oQJqCT2hcCSzn9vZ2dXTnq961i3yfGI/OKiR/1U7feaanmUyElFdqdbwS7kUmNX4kM7aPP86HKrRtKDJlBYKNZ9wYJT8GYVit647EsjqC+Bdv7VuO12100WJRvycDlGivHNUiloCeDMCRT1l0qZfHE5cSSd4erKS2lEGwj/+W5RXZvzQem5wBBigtj2Myazu1exTt4wAVnHd69L+rKUuWtkJXnx5eG+ThYbLTVgv3d/FCH268Cuifa95sn4O8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(107886003)(36860700001)(316002)(426003)(41300700001)(186003)(83380400001)(53546011)(31686004)(47076005)(336012)(26005)(2616005)(40460700003)(110136005)(54906003)(82740400003)(16576012)(478600001)(81166007)(44832011)(70206006)(70586007)(4326008)(40480700001)(5660300002)(82310400005)(8676002)(86362001)(31696002)(8936002)(2906002)(36756003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 04:07:17.2177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0464847e-27ce-4f26-0d2f-08db7d0d525b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929

Hi Julien

On 2023/7/5 05:35, Julien Grall wrote:
> Hi Penny,
> 
> On 26/06/2023 04:33, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> We want to reuse head.S for MPU systems, but there are some
>> code are implemented for MMU systems only. We will move such
>> code to another MMU specific file. But before that we will
>> do some indentations fix in this patch to make them be easier
>> for reviewing:
>> 1. Fix the indentations of code comments.
>> 2. Fix the indentations for .text.header section.
>> 3. Rename puts() to asm_puts() for global export
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>> v1 -> v2:
>> 1. New patch.
>> ---
>> v3:
>> 1. fix commit message
>> 2. Rename puts() to asm_puts() for global export
>> ---
>>   xen/arch/arm/arm64/head.S | 42 +++++++++++++++++++--------------------
>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 4dfbe0bc6f..66347eedcc 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -94,7 +94,7 @@
>>   #define PRINT(_s)          \
>>           mov   x3, lr ;     \
>>           adr   x0, 98f ;    \
> 
> This was recently changed to adr_l in staging. So you will need to 
> rebase this patch.

Sure, I'll rebase.

> 
>> -        bl    puts    ;    \
>> +        bl    asm_puts ;   \
>>           mov   lr, x3 ;     \
>>           RODATA_STR(98, _s)
>> @@ -136,22 +136,22 @@
>>           add \xb, \xb, x20
>>   .endm
>> -        .section .text.header, "ax", %progbits
>> -        /*.aarch64*/
>> +.section .text.header, "ax", %progbits
>> +/*.aarch64*/
>> -        /*
>> -         * Kernel startup entry point.
>> -         * ---------------------------
>> -         *
>> -         * The requirements are:
>> -         *   MMU = off, D-cache = off, I-cache = on or off,
>> -         *   x0 = physical address to the FDT blob.
>> -         *
>> -         * This must be the very first address in the loaded image.
>> -         * It should be linked at XEN_VIRT_START, and loaded at any
>> -         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
>> -         * or the initial pagetable code below will need adjustment.
>> -         */
>> +/*
>> + * Kernel startup entry point.
>> + * ---------------------------
>> + *
>> + * The requirements are:
>> + *   MMU = off, D-cache = off, I-cache = on or off,
>> + *   x0 = physical address to the FDT blob.
>> + *
>> + * This must be the very first address in the loaded image.
>> + * It should be linked at XEN_VIRT_START, and loaded at any
>> + * 4K-aligned address.  All of text+data+bss must fit in 2MB,
>> + * or the initial pagetable code below will need adjustment.
>> + */
>>   GLOBAL(start)
>>           /*
>> @@ -520,7 +520,7 @@ ENDPROC(cpu_init)
>>    * Macro to create a mapping entry in \tbl to \phys. Only mapping in 
>> 3rd
>>    * level table (i.e page granularity) is supported.
>>    *
>> - * ptbl:     table symbol where the entry will be created
>> + * ptbl:    table symbol where the entry will be created
>>    * virt:    virtual address
>>    * phys:    physical address (should be page aligned)
>>    * tmp1:    scratch register
>> @@ -928,15 +928,15 @@ ENDPROC(init_uart)
>>    * x0: Nul-terminated string to print.
>>    * x23: Early UART base address
>>    * Clobbers x0-x1 */
>> -puts:
>> +ENTRY(asm_puts)
> 
> Can you mention in the comment that this function is only supposed to be 
> called from assembly?
> 
> While you are at it, can you update the comment coding style to:
> 
> /*
>   * Foo
>   * Bar
>   */
> 

Sure,

>>           early_uart_ready x23, 1
>>           ldrb  w1, [x0], #1           /* Load next char */
>>           cbz   w1, 1f                 /* Exit on nul */
>>           early_uart_transmit x23, w1
>> -        b     puts
>> +        b     asm_puts
>>   1:
>>           ret
>> -ENDPROC(puts)
>> +ENDPROC(asm_puts)
>>   /*
>>    * Print a 64-bit number in hex.
>> @@ -966,7 +966,7 @@ hex:    .ascii "0123456789abcdef"
>>   ENTRY(early_puts)
>>   init_uart:
>> -puts:
>> +asm_puts:
> 
> I find odd that you add ENTRY() to the asm_puts() above but not here. 
> However... I can't find any use of asm_puts() outside #ifdef 
> CONFIG_EARLY_PRINTK. So maybe it can be dropped?
> 

True. It is only used under #ifdef CONFIG_EARLY_PRINTK.
I'll drop.

> 
>>   putn:   ret
>>   #endif /* !CONFIG_EARLY_PRINTK */
> 
> Cheers,
> 

