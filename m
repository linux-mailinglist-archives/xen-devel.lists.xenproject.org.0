Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04094749681
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559681.874907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJY9-0006XS-BO; Thu, 06 Jul 2023 07:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559681.874907; Thu, 06 Jul 2023 07:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJY9-0006VT-8e; Thu, 06 Jul 2023 07:37:13 +0000
Received: by outflank-mailman (input) for mailman id 559681;
 Thu, 06 Jul 2023 07:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUoY=CY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qHJY7-0006VN-LV
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:37:11 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe12::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98f66ad-1bcf-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:37:09 +0200 (CEST)
Received: from DUZPR01CA0326.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::25) by GV1PR08MB8108.eurprd08.prod.outlook.com
 (2603:10a6:150:93::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:37:03 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::45) by DUZPR01CA0326.outlook.office365.com
 (2603:10a6:10:4ba::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 07:37:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 07:37:02 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Thu, 06 Jul 2023 07:37:02 +0000
Received: from 1eb9b6c22cad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F501259-F8A5-49CA-8DAD-02744B794CC1.1; 
 Thu, 06 Jul 2023 07:36:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1eb9b6c22cad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 07:36:55 +0000
Received: from AS9PR05CA0116.eurprd05.prod.outlook.com (2603:10a6:20b:498::10)
 by AS4PR08MB7478.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:36:53 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:498:cafe::1e) by AS9PR05CA0116.outlook.office365.com
 (2603:10a6:20b:498::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 07:36:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 07:36:52 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 07:36:51 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 07:36:49 +0000
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
X-Inumbo-ID: e98f66ad-1bcf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0Y95sPTVDAB8hXY0t0JqFTvngRZNVAQT03PkRKRyUw=;
 b=RsIKAq7FP1l0u6ICTjg0/ZjwkgzL+8AWREpt9pvzMnTxO0R0zs2fqHMEZBPzQnhGJXlqPuSrQGEqcUTBDceB6tV5ZM9fm2ulQspKJpWxvEwwYJhZzAntSJJ7L3qI9n6EUR6znSz7VWFVGEUgJmmXMa5ahZMfYDBOLf/BAQvM0CU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f08f9d8ed0562c44
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajfIj7711o3si50q3yIgfLxAbb+Gve4qEolrGdT3wh2qDZKW+YrMtWmq+BNte2e2AK2Yn5Oxpq2tK4EqlsXJcMuJqBCIzFjwbcMkXTdjzktOJBFA875b7vdoCXNK0A2AvsyYyHqJbZkZglgh8iExlEodLBJuv4LQz3vuZy5khkvHQMOdJv1Cerq+4BNnZcTdn5iog+mnH0mb1ucHDnuaXf9TGYgxuhsBz50YeIvEwZ1n+LlhGM7ChjLEIug70BbwYo11hOnhtyCPOgoErCcRcHPHSev8gr4jRGXt63qA8mv30dJtCWI1il+iuY/CAhXSnFwndcewtqezSqECwNKAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0Y95sPTVDAB8hXY0t0JqFTvngRZNVAQT03PkRKRyUw=;
 b=GjvAZBP63g7DR4s5hyUtVZi8JEe6tYpQJKyKekyOWd62dFstYqzmvk+rhy2ynKYTbzwxrQAIrtFeJeB2cU4+jRkYqqs3QDERUa+4zJRJh2wkn5qVLq1jiqAYWo3BWhSqmGjE+UCfYcMmgHYK8Flvl+pbEB4tSq4sWgbOs89mgSaTIq5WTT4Sz+mTPWa48RZxrotf3BAcXV67Ncguc0WN4dKy+dgfinZthCYJIZV8ellQ+hJtbiB8ncfxkvvKgHQJ2cAUA92RV8mXGFbZZZsk8b6Evs+9Y3FU/YufIRtbZ3OBELMbIB7s0+6lnzzZTHAaOUxbJIK48Q1UWiOW5BHZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0Y95sPTVDAB8hXY0t0JqFTvngRZNVAQT03PkRKRyUw=;
 b=RsIKAq7FP1l0u6ICTjg0/ZjwkgzL+8AWREpt9pvzMnTxO0R0zs2fqHMEZBPzQnhGJXlqPuSrQGEqcUTBDceB6tV5ZM9fm2ulQspKJpWxvEwwYJhZzAntSJJ7L3qI9n6EUR6znSz7VWFVGEUgJmmXMa5ahZMfYDBOLf/BAQvM0CU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <f731455a-0639-d0fb-62cc-544347ce6e1d@arm.com>
Date: Thu, 6 Jul 2023 15:36:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 10/52] xen/arm: Move MMU related definitions from
 config.h to mmu/layout.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-11-Penny.Zheng@arm.com>
 <ee493a26-234c-876e-e19f-3708c13cb484@xen.org>
 <02cc1edb-1f69-7fd3-a057-e5b04d2e14f4@arm.com>
 <d2c0d251-8b10-c211-48ee-ce547aacbe91@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <d2c0d251-8b10-c211-48ee-ce547aacbe91@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT030:EE_|AS4PR08MB7478:EE_|DBAEUR03FT057:EE_|GV1PR08MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 074875fd-2b97-45ca-5913-08db7df3ca4a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wpiSaj5kKMvyKynLKYMIIRebnqJVaYpP4UJfsM2cTGJSTwngiEV5gHsyOsf7D50dmT1W1LOVAYOTxiREuLhAyFipTCW5cQry5tFbudb5Q2qLlVIu9x16QRVlfWm+LNkrx9CfFdof0XBpQk2M/h1tiD/QrH+Ieb+GjyxH3v/o3AvqQj7sCu5cgVBUIy0dNgH1kQj7A4QkX7Pom7GZWyEcdq+HQb2mgbbyEd3Nb4jQHAQ11EcwyeK20gMtfk4nyuVAuAJjM25A/WS5kYG6khqLHqqJfoCm72FIG9y54NEosc0r0KjfjSNRdurj3zt1rtPZjv4sAW/Z+huwB492ZwEI2/iV3Ogg/yCCAlqc1LjL17ya1Z8JW3teSUKjAtdBz6dMyxEnaLHXOwFiEp6BmTOluaH9/CtACPo/YmZFsKK5At1nMH8FBj7QRkOiqxZ1mjB9If3PgiDESdMWlU8q2nws+/asoos97IdxGr6OpB2L0dwZLTJBiSdWCg6GeeGAixcHYzGY7yqipkuwaQf3rcKWRhxoHkHpJzoe53UhOE+qcOFHsRPQ0k37AyV+oCIac+WCPN+rkx9XCpEIMp09klyK2uo6BtO0H+8lKaeE1X+GCx45z9CTIXP09BJNx/eoPSj9RQdPWZUB+qXuB/XSuSXQ13QTdxuQT7mxifGzy0WFpJn0Dv12VT65OVvzIypvgwG6OuXcgSk8JD4oCAxN9g91fuK2Ag1ADCfyk36MrxrzOxYRJYZJQ3sFPulGDuXdexS19FGconfnDqGgoIKP6AXEYfKegnzZcggBKzST8D7/8er8FvVjep6GUb0oOg6BZv+4Qg74cva0X4DlMrl430l6qA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(110136005)(54906003)(478600001)(70586007)(16576012)(53546011)(186003)(36860700001)(2906002)(82310400005)(70206006)(316002)(8936002)(41300700001)(40460700003)(44832011)(5660300002)(8676002)(4326008)(81166007)(356005)(82740400003)(86362001)(83380400001)(31696002)(36756003)(47076005)(336012)(26005)(426003)(40480700001)(2616005)(31686004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7478
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3debaae-a755-4468-2f62-08db7df3c46b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NPcccinOpQVNcO4Hlpb/vt+3ncVtEDnhXB+XzIieElh4NR5dpYvkL3Ze+Y0+w7dPe7Vxp9rxkB7eDwgOgpVRwktI6KBgzcAaODMSyFWJ0GpOwpxNSnXo4b0l6WLeqyleojHKgLeMGj/nTu2NNCXOCkeIAZ5WUnfrVeHosUmYHOTGRVXlNN9xpKCv3a/BzuwryFjRQS8XjUMY2iPaFEiFQDJpZKh0qdY2opD1g2JOeP6nWg/E5JE90VEv1nj0Z2jZJSHE3i6DL8vawdcsarshQDp7pX1vejAjW/TTQNBUW3xeagjZCbjPaHm7fGikszJWFGufaBboclrPiO4j5aAvINcXekUFuZPjdYHdc+JIQQMIc0yKrfrntIp8mfO5pQs76NhcZMnNlTm1Vlesadtctrq2MBvMpBfrKfIgiRsBGhKKck81ttRMG1NWwaDkfUru8YIHO53WA2tiYyYbyqpVlYMXvBQDG/mvu5LxxhYDtucothzh2AuR4wkOBVSxvGHoM1hHxIDnkWZKBaCkjfia+xLnunwmtjQqsNHFOfmeagIKF3cR26mcPoHD6OvD0xa5UtXr1qz7eJ7z9UXnYObz049EJO+dgOhvXhPHzRLQekZ1w6MZMxhx7EoThKyNwnszy6dTH1aCo8DXxW0myoz4gnI2e4r536sTSGePeFo9WKgELNklvTw2jwS2Z7oOF7yirfA6rC8lwWG5ocXqQxIiH08mC97QKZjQdkW1nwUtXqNjDaYLFTHWW+zugCmHzqYOWU3ndO3xKPEljTzhOOlascfSXAg132YZzSBJyIEYHbiDXKiebSJFfCR3vidZ/Oev
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(82310400005)(81166007)(82740400003)(40480700001)(36756003)(40460700003)(31696002)(86362001)(478600001)(426003)(186003)(53546011)(107886003)(26005)(8676002)(8936002)(44832011)(5660300002)(16576012)(54906003)(110136005)(31686004)(41300700001)(70586007)(70206006)(4326008)(2906002)(316002)(36860700001)(336012)(2616005)(47076005)(83380400001)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:37:02.7295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 074875fd-2b97-45ca-5913-08db7df3ca4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8108

Hi Julien

On 2023/7/5 18:30, Julien Grall wrote:
> Hi Penny,
> 
> On 05/07/2023 07:51, Penny Zheng wrote:
>> On 2023/7/5 05:54, Julien Grall wrote:
>>> Hi Penny,
>>>
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> From: Wei Chen <wei.chen@arm.com>
>>>>
>>>> Xen defines some global configuration macros for Arm in config.h.
>>>> We still want to use it for MMU systems, but there are some address
>>>
>>> Did you mean MPU?
>>>
>>
>> yes, typo
>>
>>>> layout related definitions that are defined for MMU systems only.
>>>> These definitions could not be used by MPU systems, but adding
>>>> ifdefery with CONFIG_HAS_MPU to gate these definitions will result
>>>> in a messy and hard-to-read/maintain code.
>>>>
>>>> So we keep some common definitions still in config.h, but move MMU
>>>> related definitions to a new file - mmu/layout.h to avoid spreading
>>>> "#ifdef" everywhere.
>>>
>>> Just to ease the review, can you add some details which one are 
>>> considered common?
>>>
>>
>> Sure,
>> IMO， the only part left in common is as follows:
>> ```
>> #ifdef CONFIG_ARM_64
>>
>> #define FRAMETABLE_SIZE        GB(32)
>> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>>
>> #endif
>> ```
> 
> Hmmm... Looking at the result of the patch, you moved FRAMETABLE_SIZE 
> and FRAMETABLE_NR in layout.h. Also, I can't find any layout specific 
> define in config.h. So I think the paragraph could be dropped.
> 

That's because I define this same snippet in both mmu/layout.h and
mpu/layout.h, see [PATCH v3 23/52] xen/arm: create mpu/layout.h for MPU 
related address definitions.
So it is common for both mmu/layout.h and mpu/layout.h.
We could leave it later for discussion.

>> I couldn't figure a proper way to remove the limit for MPU system.
>>
>> when calculating variable "pdx_group_valid", which is defined as
>> ```
>> unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
>>      (FRAMETABLE_NR + PDX_GROUP_COUNT - 1)/PDX_GROUP_COUNT)] = {[0] = 1}
>> '''
>>
>> It relies on FRAMETABLE_NR to limit array length. If we are trying to
>> get rid of the limit for the MPU, it may bring a lot of changes in pdx 
>> common codes, like, variable "pdx_group_valid" needs to be allocated 
>> in runtime, according actual frametable size, at least for MPU case.
> 
> The main problem is that, at least on Arm, the PDX is initialized before 
> you can allocate any memory. You should be able to re-order the code so 
> we populate the boot allocator first.
> 
> But I don't think this is worth it right now as, if I am not mistaken, 
> the pdx_group_valid is only 256 bytes on Arm64.
> 
> Cheers,
> 

