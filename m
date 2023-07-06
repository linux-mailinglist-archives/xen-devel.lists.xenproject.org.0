Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC13749600
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559671.874887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJ4B-0002OR-LK; Thu, 06 Jul 2023 07:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559671.874887; Thu, 06 Jul 2023 07:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJ4B-0002MC-IT; Thu, 06 Jul 2023 07:06:15 +0000
Received: by outflank-mailman (input) for mailman id 559671;
 Thu, 06 Jul 2023 07:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUoY=CY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qHJ49-0002M5-UU
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:06:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95904a1c-1bcb-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:06:10 +0200 (CEST)
Received: from AS9PR06CA0627.eurprd06.prod.outlook.com (2603:10a6:20b:46e::31)
 by DU0PR08MB9025.eurprd08.prod.outlook.com (2603:10a6:10:471::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:06:07 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::c0) by AS9PR06CA0627.outlook.office365.com
 (2603:10a6:20b:46e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 07:06:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 07:06:06 +0000
Received: ("Tessian outbound 546d04a74417:v142");
 Thu, 06 Jul 2023 07:06:06 +0000
Received: from 164b35c9a721.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0DA2893F-0F0D-4452-BF38-B50BC92D5A36.1; 
 Thu, 06 Jul 2023 07:05:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 164b35c9a721.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 07:05:59 +0000
Received: from DUZPR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::18) by DU2PR08MB9963.eurprd08.prod.outlook.com
 (2603:10a6:10:495::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:05:57 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::eb) by DUZPR01CA0015.outlook.office365.com
 (2603:10a6:10:3c3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 07:05:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 07:05:56 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 07:05:55 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 07:05:53 +0000
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
X-Inumbo-ID: 95904a1c-1bcb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+lrRyVhzycLPYk73qkHO03Gg8HAnH3q4wV/adoM6mA=;
 b=E/s2rTMIfS2RPg+SvR0N8qBNvZDsQQtidyXkm5r+rr2pOmQmKT4dcNuvosI6z2pOf36mDFSePZubKMeghx5tzsFTZIQYqI62duOAQt1ytV9SnZcDHoOQk/s7YsZa5AZlbsJZOfka1jH9xfaekeJYfuH49NcvY/VU/+OBaz5Bdlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b27577b2912c9df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dztXu9Q/tO4fX79Pavs/2/GvNF6OdS8/UDBaAn5Pchho8j76Z320IMw7hgfNSBCJ80UhV4pSfUR92apElX/39exLhvXru8URcVRDJVdSKquukcVjIZjfgQoXYBDpcdcvc8mJG+jLIrgGj6NxTP5COV2+/3ddFOa8lu0pJ5fJqen0zu8Ko3Kgo0IPOLY+fkGsvtjGR+uJqGlrgpJhuMEgK+WEs5JkRKmKieWwPCdH6kLR7IXNuFDKAsB27nhfG1dycoZFop90yDrduQoJKmOaOALLOUgWBhEyPoRHKIKZA1VMJxaBV2r3wYrO5xKgGX9CeiJdwEl8fShbvQEGdZ/ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+lrRyVhzycLPYk73qkHO03Gg8HAnH3q4wV/adoM6mA=;
 b=KLhYqqVfE0IGBDhGO5/0VjLxv2gn8YzANotPa3msNie0MSyrnwmwPzgF9gasr/raqyJNKD+R1IVO2zh3Ljd2M5fkCe6PnKL9L5+2udkErt4EUDQQwJIY3tcQE0FPi38FNBGcvQFXXgHDsaHWkis4ifzq/kZNNoH70aQMvjJ2yF11dF3mSgLgdQMi5U1qa8QJefi4c2HbCIgs+821ZyeRqUUcSGF2O1vuEd4p9x7qTKUWr02CeG8dDqKQK34JBftx2ODJIeVb26/S5B5AfbXN2ivgqRFkMjLTxoFyNevbjQ2v3rpU6VfOtU2jbVcQxQ0wDoiGO3GS5EaVnWKQyb7fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+lrRyVhzycLPYk73qkHO03Gg8HAnH3q4wV/adoM6mA=;
 b=E/s2rTMIfS2RPg+SvR0N8qBNvZDsQQtidyXkm5r+rr2pOmQmKT4dcNuvosI6z2pOf36mDFSePZubKMeghx5tzsFTZIQYqI62duOAQt1ytV9SnZcDHoOQk/s7YsZa5AZlbsJZOfka1jH9xfaekeJYfuH49NcvY/VU/+OBaz5Bdlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <af324ae7-464b-7e04-e3fb-bc436e22a369@arm.com>
Date: Thu, 6 Jul 2023 15:05:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 09/52] xen/arm: use PA == VA for
 EARLY_UART_VIRTUAL_ADDRESS on MPU systems
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-10-Penny.Zheng@arm.com>
 <14ea91dc-2af1-f7c7-5888-22df8fd9133d@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <14ea91dc-2af1-f7c7-5888-22df8fd9133d@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT003:EE_|DU2PR08MB9963:EE_|AM7EUR03FT043:EE_|DU0PR08MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe46011-1d21-4776-e430-08db7def77fe
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fqXkt05WnwDwm3RO6N2G8xROsiBvYgaeL3Qw6hahXuJEsvYkQ3XbFXZrv0z6dqRHqHyLuTTasEZIE1PWc4pgm/9ZHIz4rveXN2m7D/EQm9MJByS6GMngfKhRTZcz1c/CSFHR+dv5DS+KCGkwqWiQAhTGTdtGfHdNW3HNOZYHhq1x/YTHQ+xh/owEWw7KJf1ArGIh7XzonFGb8PkAw1/JxEACY2PlWj4w9qw0hlkuqmofBJpptqmNkC54NMcz23xouTigTQQdAQtRrErRYyiMmWfUt2o55vSUuZnD3Jj64Nt6lErsVnA6xYcZhV7BTfDaYORm5j9vMH1cffk/fbWCpts/TSmiNhAG0g+29ldoDoJ29uFY8vZmg1XuDWVvhsskUwpXOHbUReN0cYVp+qs5xFmAX0QBrVWpAyIqG3c5LIa0JMnvdXNtacQP4sAvKcllBQBPAoN1XiHBcQneuNZsVyD55DwmrNEjfntARemlULNoAQL5whRfJ4CpriuvNpYdd0FPktWvc30cuRFXJxOmk9ubIqybDEjYALYSvGqWc2X8qHbAmMT91dlJ/ENkSfj68DgjgpbjmfihkTPOsTdl0LcVKW/aDu2BOsj0fv+a7WxHQrYyat9HiLQUtJU84WleypoOZOt0XP9CieyPZjL1LT2SlZbnA6bdR3DBkQ2OzOKKMGIjdN4wMCRtcn4BAi1FxWGSH941+mi53M/9vHT0SSAEh0t5HvnOYIHH2khTMKUmfKNjdgrm1tw8jy70Q5q0cA5RsV049s53Kk+uyrwiVocIrFoHQr948KQHgR/GG69NHgcxaI+KtqE8uuMN4PI5WzWNBnE3sWSQOzf8B5BZYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(186003)(82740400003)(478600001)(426003)(26005)(53546011)(31686004)(86362001)(336012)(2616005)(110136005)(316002)(81166007)(47076005)(356005)(16576012)(54906003)(36860700001)(70206006)(4326008)(70586007)(5660300002)(8936002)(8676002)(40460700003)(44832011)(4744005)(41300700001)(2906002)(40480700001)(31696002)(82310400005)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9963
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5347ccd3-8eb5-44df-a0a1-08db7def71e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	52TpJVUTc01dtZcQZp7bjW1rPgOZVX8LQjFyvKWkTmnyzRzxlATUfrQZDz1JCo7Wh15AhBzEMcRz0Oq+/y2u/MYAg6NleSXpD7acsOmVXrP6W7GzTWNY7hk+TKNlU4i3jhJa/xDjdnduvfDDgXZlcf5nvRWOoW/f7Msd+yn0eddrhwtTOntBwNZzR+JAoYfO7nXNfgiLEUOQ56T8tD1cxzGJnHqMTJz532YQO7jBQWIo683MUrZtg87+KU14ERpUQRv6p5ZkJx6GUHga8ikvh22IZQHvM/JaFeIfI8G7ykhrkGg4Thr6oyWQSdBhTHnXQ3zybjcK3u2JpvVO8dQt6sT+oyeS+khyVDGPoQ+sFjZ+HhyjqPF+z18w+kTLPKborcJd44Qe+XvWHF6NraAQIXOI771bjY5ESjEvPOt6szEVamZ+kk0gM9ttbcLxj36SHkNzAcPSJD9RBnxx/b7ZuvQdrXEN2aajXvBdUkLXmntAMzjyB3COEy7hmhI0/ySzbWYpIjSIAbIwwag8KIFCaqHyawgRvgRhJmPVQRUWo6/E6d5U3AJVMq8Qq4RQESBGdxFQttcF8JNkb9FtlHpTRw+ALSlyvJSsvat6uD2bUVn80/xTKHYpA8zRRwruKyA9+eUcvjM0z1Ij7VLt/Dc7wcy8F6vwH3SnEQ9Pcuqs9/+iy/JG5AbngeNsCBeQ5oNHRBIyTq6iSSbrNRz0m+SWWdIdS4jHH6tq8KIqe98WZd/yBRBtC8d23N0OkLjA76HfOwedpzpmFGMufZ7rR4rsAGHJGGg1RaFW9c0tLKitmls=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(186003)(82740400003)(478600001)(426003)(26005)(53546011)(31686004)(86362001)(107886003)(336012)(2616005)(110136005)(316002)(81166007)(47076005)(16576012)(54906003)(36860700001)(70206006)(4326008)(70586007)(5660300002)(8936002)(8676002)(40460700003)(44832011)(4744005)(41300700001)(2906002)(40480700001)(31696002)(82310400005)(36756003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:06:06.6281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe46011-1d21-4776-e430-08db7def77fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9025

Hi Julien

On 2023/7/5 03:25, Julien Grall wrote:
> Hi Penny,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> There is no VMSA support on MPU systems, so we can not map early
>> UART to FIXMAP_CONSOLE. In stead, we can use PA == VA for early
>> UART on MPU systems.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> 
> Is this change necessary for the MMU split? If not, I will skip the 
> review for now.
> 

It is not necessary. I will not include it in next series focusing on 
MMU split.

> Cheers,
> 

