Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A667495BB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 08:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559614.874737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIdW-0002yo-2E; Thu, 06 Jul 2023 06:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559614.874737; Thu, 06 Jul 2023 06:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIdV-0002vu-Up; Thu, 06 Jul 2023 06:38:41 +0000
Received: by outflank-mailman (input) for mailman id 559614;
 Thu, 06 Jul 2023 06:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUoY=CY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qHIdU-0002vm-BM
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 06:38:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9af718-1bc7-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 08:38:39 +0200 (CEST)
Received: from AS9PR06CA0113.eurprd06.prod.outlook.com (2603:10a6:20b:465::30)
 by DB5PR08MB10140.eurprd08.prod.outlook.com (2603:10a6:10:4a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:38:33 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::38) by AS9PR06CA0113.outlook.office365.com
 (2603:10a6:20b:465::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 06:38:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 06:38:31 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Thu, 06 Jul 2023 06:38:31 +0000
Received: from 78e95d999980.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4E4100F-2DC4-44C3-9950-987E5AB4DA02.1; 
 Thu, 06 Jul 2023 06:38:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78e95d999980.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 06:38:25 +0000
Received: from AS9PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:488::22)
 by VI1PR08MB10276.eurprd08.prod.outlook.com (2603:10a6:800:1bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 06:38:23 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::46) by AS9PR05CA0018.outlook.office365.com
 (2603:10a6:20b:488::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 06:38:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 06:38:22 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 06:38:21 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 06:38:19 +0000
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
X-Inumbo-ID: bd9af718-1bc7-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbHoRgOIZuboUDejV0ywB+/9fhE4hpMgPE1PiuIVL5Q=;
 b=Q3FErF3510HA8NlazeJRKT5TGs7/EnKC6YfqbmZZpLQlDUwL+eFbAQsLn+kn+91UCatXp9+XFiDEDp1+tQUTmpycksJPRT04+KDd0hXCKvBkfmcFYYHIvHPhkTLDF97arrSI/pImIDHFl2O3OnCzPVRbYv3MwSjtzi8CSDo5GEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d234a8df0fe0bb1d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWaZVK/X9+R/h5jUDY3eZaHBl7hZKOf8Mces8jNHB7JuwQK2uGeMT+3PxMbhG0F3xXOYM7p3Uwgg2N9B8HQzyDRcPRVXgEbaeQGT5deXfyrxcLk9K1DaKzzehD8qSx18UfM8IgfQRcI79N8fzjUID/HSnvbJuIko1Oi7BJPt5LhqeblQSk9c43eZ4EWu7jFoomdpOF52ybhxAudpqEy7MqT6B8eHGDevbjNMoB+zAKUmxxLxzJbFKKT+tZxjBrCX3PwH/gUoN164QaZR09qJwXgErqqPQFE1lbPPE/4cTes1jtqoHHLLAGTBmDc84Vl0AYSfwhByXKxQAkhYo0UTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbHoRgOIZuboUDejV0ywB+/9fhE4hpMgPE1PiuIVL5Q=;
 b=MPob6s+Nsc+bOHEI+C2nQsp5NCTzSOS6+yIJlNqKxRhPpyZ8m0aD9hAv4lool7yvNgycPQ9WqHGNaCsoKp6RUfmPVVU82NWjKJt7eGsUGW8Z6G93yvXRA+gl3obXXjIdGAWxQYQFd0N68aeKIAQi3BFlesOkxgYLHhf1FbwjoINZz2lEXcBEC2u48gRDExsV+G6fzmPRoKs+gRyXCbwCZHK9UDNO2NMhoPTGBTh42ZgzjsnqLKQIlJ2Ivw1rZJlynGCOeRdozjXlqffwLWFd4ihB8DjIu9fr6JAUjlsV4CkYdBaNgg52sVvrBy479Vbn5rYtHtKHYOP8ULjJ0xnCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbHoRgOIZuboUDejV0ywB+/9fhE4hpMgPE1PiuIVL5Q=;
 b=Q3FErF3510HA8NlazeJRKT5TGs7/EnKC6YfqbmZZpLQlDUwL+eFbAQsLn+kn+91UCatXp9+XFiDEDp1+tQUTmpycksJPRT04+KDd0hXCKvBkfmcFYYHIvHPhkTLDF97arrSI/pImIDHFl2O3OnCzPVRbYv3MwSjtzi8CSDo5GEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <486a1a88-bddc-3364-1e10-793faf67f856@arm.com>
Date: Thu, 6 Jul 2023 14:38:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/52] xen/arm: add an option to define Xen start
 address for Armv8-R
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-4-Penny.Zheng@arm.com>
 <af5c0bf1-40eb-5b76-17b2-b63205cec182@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <af5c0bf1-40eb-5b76-17b2-b63205cec182@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT019:EE_|VI1PR08MB10276:EE_|AM7EUR03FT039:EE_|DB5PR08MB10140:EE_
X-MS-Office365-Filtering-Correlation-Id: 017379c9-717c-479b-1562-08db7deb9dbd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YdFQlIAxn06SjgAFe+r70rkfFUIpwa491CjMEiSFHLA1uj7mXaWkD3fk7GJArmtOpUpXxm72lu1V82XU7mrpjBewlq1VzCgCVDZHzzPNMAzLDI3col0SH0fh87oR6aMQdizY/iaSM8LQjL283kd7hBTiAKvVUmOuDSQ1YLmZnATHIGgt+hmvbkXuldq5RJwSpKOEpSP/WTamerIODF5kdyXikSxXw8kq26mRWdduzN/wJhOmbUP3tvm+a8VFEp17UQzE1Vh431EepGqZHe4ywSxNPRkkjdlogsbMNbCb1680uZ2jctm2/SqI7wGZt0l8/lTnzBPnfx37GUvgs/cqgQ4CKVJmNPXEIzBXrJoHdHCjvvnQFiCQZd7a3AmLTxaeE5hPZZyG0awlixlgs8FVCdrY/Dv0N6XVDPeWslVsaSErjkNOKcGS4A8XKTCoashG/VzqcF0cxOuNjuF+aWN7YNdH9R9toSSZxpbFX4VPzIpFF5EmwhGzefbfZHmbRCcK23A5LdioNL7tkRfzNfuvpmLB3YkEiyt7zbCqBvkXI4M7EadronCedfuozyGxOxbg7j6l4aV6QI9R578autlUqobwXKVOIxJ1fUmP3EBO/yjYsXge5mAIQWC2gDxleM0SCpjG9jw6NWVnwZJnsST5ZsrLXv+74oFqyEciQFi4NYrJlgkT78s0Bw6sR1nmxbFTF1T1hnrPanG+uh+xDw2nxd5Q4+bCEdzQg/2dSQtoRx49SGqRRD+NVMoofUopsv4OoTpb9QsoHz3h3nBQSkEmz0cQjoCGylnWufSJjUfR4UqmfsefJqlf/h+9dMZGE4pU8lK3o7cKBGRtf2Az3hH9sQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(41300700001)(8936002)(5660300002)(8676002)(44832011)(82310400005)(36756003)(40480700001)(31696002)(186003)(2616005)(26005)(478600001)(82740400003)(31686004)(53546011)(70206006)(86362001)(47076005)(316002)(4326008)(70586007)(81166007)(36860700001)(54906003)(16576012)(110136005)(356005)(426003)(336012)(83380400001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10276
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40e74400-3fa5-42e5-d095-08db7deb981b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UJOgk3iDjX2rpDtf9Ka0S7jJ57wSVELdO5aJqECOf80E8hgCpco3X60LwNESqidybMqt5qdBgDTp+j4zDc6j4eX7eLuC5I7DaBgyAeRDdR0CQtiM0rafDWd1yZAUT14ZKmB/u1NKbaF4ZLAZ7jXjurvjIc8/J0gfn/4XYxnOCVoj98ZqIOTobFByB2I8+ZniwEJj4PNsHWPVG1tGf3BQELhOppE4n2fyCFpe07bxIAX81MWN+3HdLBfCxLOg2VQZ+EzGF7KCfhser1SXP1cWGZK4R1Jin1zuJkNkmJqQIZTISjktt8G1W7LMWsnW9+X6KuXjAMFeeKcwL14HWlxn9jG7CfA+SacxI++RvrfnWglFqT2/EDwAIEdn8FMR2JbUpDx064mF6urlAIgOELrAzmlXn/N2OAi8eUexHvvUVRjoPm6cwHkfGSDkQutnhk8eS0A7pl3QEnD5iS4oNAaUDjHbOqkbmmzHpt7rurcRAJjgjuEHfjJQNS+zeSg/WczVYivIYSk+YA5mZpr41c0WLW+rVAkXPdzNy+xvdwKxrDIKtvdUqO2BB+8VAnpAZLJpxe4rRWfIyrCl3//InVW/cFLqvigPDGKMs83+MEsFaFdwH4ghmxfWuTKuejykIEXYM5OHqpOFML4DLNlntY9415TijipfShFUXejVcT3OU7NkK1kKhcXxojTZjmpq7dwSt9HCSPahLn/H15y31Xr61TsRHsLx20jSpJLpsr3J4/dW1EeBEY5g8xoAiLbTLN0QViNhRM6OuK6eHm+tFQgj9a7UmH3WpbVgFBYjmYvURr2SZ4HvWKSmd1ov4TFg26Oy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(41300700001)(478600001)(54906003)(36860700001)(110136005)(31696002)(86362001)(82310400005)(81166007)(16576012)(82740400003)(107886003)(4326008)(426003)(83380400001)(36756003)(316002)(47076005)(70206006)(2616005)(2906002)(8936002)(5660300002)(8676002)(31686004)(186003)(44832011)(53546011)(26005)(336012)(70586007)(40480700001)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:38:31.9789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017379c9-717c-479b-1562-08db7deb9dbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10140

Hi Julien

On 2023/7/5 03:21, Julien Grall wrote:
> Hi,
> 
> On 26/06/2023 04:33, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> On Armv8-A, Xen has a fixed virtual start address (link address
>> too) for all Armv8-A platforms. In an MMU based system, Xen can
>> map its loaded address to this virtual start address. So, on
>> Armv8-A platforms, the Xen start address does not need to be
>> configurable. But on Armv8-R platforms, there is no MMU to map
>> loaded address to a fixed virtual address and different platforms
>> will have very different address space layout. So Xen cannot use
>> a fixed physical address on MPU based system and need to have it
>> configurable.
>>
>> In this patch we introduce one Kconfig option for users to define
>> the default Xen start address for Armv8-R. Users can enter the
>> address in config time, or select the tailored platform config
>> file from arch/arm/configs.
>>
>> And as we introduced Armv8-R to Xen, that means the existed Arm64
>> MMU based platforms should not be listed in Armv8-R platform
>> list, so we add !HAS_MPU dependency for these platforms.
> 
>  From a brief look, this patch doesn't seem to be necessary in order to 
> move the MMU code in separate files. Can you confirm?
> 
> If so can this be moved latter in the series? This is to allow the 
> reviewers to focus on the MMU split as we discussed on the call today.
> 

Sure，it will be not included in the next serie focusing on MMU split.

> Cheers,
> 

