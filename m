Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9866747D81
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 08:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558809.873229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGwN6-0007Mj-G8; Wed, 05 Jul 2023 06:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558809.873229; Wed, 05 Jul 2023 06:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGwN6-0007JO-DA; Wed, 05 Jul 2023 06:52:16 +0000
Received: by outflank-mailman (input) for mailman id 558809;
 Wed, 05 Jul 2023 06:52:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGwN4-0007JI-Sq
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 06:52:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 778b8513-1b00-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 08:52:11 +0200 (CEST)
Received: from AM6P194CA0084.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::25)
 by GV2PR08MB9208.eurprd08.prod.outlook.com (2603:10a6:150:dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 06:52:08 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::6a) by AM6P194CA0084.outlook.office365.com
 (2603:10a6:209:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 06:52:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 06:52:07 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Wed, 05 Jul 2023 06:52:07 +0000
Received: from 931af8c77eb2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70E3CBB5-F95C-4EF7-8E48-F653BF855F63.1; 
 Wed, 05 Jul 2023 06:52:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 931af8c77eb2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 06:52:00 +0000
Received: from AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22)
 by AS8PR08MB8325.eurprd08.prod.outlook.com (2603:10a6:20b:536::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 06:51:55 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:e6:cafe::26) by AM0PR10CA0105.outlook.office365.com
 (2603:10a6:208:e6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 06:51:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 06:51:54 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 06:51:52 +0000
Received: from [10.169.172.87] (10.169.172.87) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 06:51:50 +0000
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
X-Inumbo-ID: 778b8513-1b00-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ksZUMpbt/rL2MzQhztFmxteoi+WCZfgBRkRjHg2eXA=;
 b=SbMFZmlYiPO4T8ViE7DOuJvt2f67XsIxFQ/QELQTiTlpJFDuMZBLVlGBJ2VorIcEO9doDXzN2ZRrKX9iIPWk6juDInX4hdleIvhhypkqn2yrk3zLWfUaxaNYn5DzoVhoCNS5QopqOQjI1Ud8StG63VRebDhib6Sw1wzsBx+4pzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14237d68830cfb8b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkSoNPq0KfpKyNLaxtotTRzxevACTjLtsf2x796QVxAMOXY1lG2I/o/qgV6tL1rN9aZnBB56r2w8BRJUTP/vZf34KxA8kGibfyO1G3FwhiBDSpl/FLOLGgvSMBUTooPH5UwHzZM/tZSZki+J3jxyCkuGIzdxpUKLHJ9Gfk3Nstn7lkcSNT4LxahLRICyxDKtJnRoRvy+jz5SCJfkoHxHd3p3qVmwM6fdkh58sZxHTFIMiKtdXyDpAtJduHUvrkIplROn339YUi+71zF3qVEyjdMMSwscpGIxg1L8gUMMcxi1GrBIvEW8cMSlrPOqocOlXSOF6lfzlByyetPwfVcvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ksZUMpbt/rL2MzQhztFmxteoi+WCZfgBRkRjHg2eXA=;
 b=XWRpGWgs7Dk2e1sy90YJGIAlFmEINn9p7or9b1ML5no9CCguc98/LxjCODe1EUY1O4cFRFB7TbAJjCWFQaH6BpxbxfpaQmFPFEVZxvgcIMLSdu8lNziebxCBSlyT8QjgS2L7HrXt2fvk8ZnM3xqOXcnTsux+k28v4dqUtQHQc+BMy8HsA0uTlSJMR27GC11NcGLXn9F1bJwVDI6JspBWcxIzDLnvP29cmDOgJmZxDXxdYCq96EqVRUaf6mdwdhD5idLc8pslX3PM8N2SEkzkunYAlJ5IW5iF+BW6Ioc5qyQ22j6I2ie3tIzsW24d03XSK/HdKDXoqNjjb5UDTduKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ksZUMpbt/rL2MzQhztFmxteoi+WCZfgBRkRjHg2eXA=;
 b=SbMFZmlYiPO4T8ViE7DOuJvt2f67XsIxFQ/QELQTiTlpJFDuMZBLVlGBJ2VorIcEO9doDXzN2ZRrKX9iIPWk6juDInX4hdleIvhhypkqn2yrk3zLWfUaxaNYn5DzoVhoCNS5QopqOQjI1Ud8StG63VRebDhib6Sw1wzsBx+4pzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <02cc1edb-1f69-7fd3-a057-e5b04d2e14f4@arm.com>
Date: Wed, 5 Jul 2023 14:51:47 +0800
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
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <ee493a26-234c-876e-e19f-3708c13cb484@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT040:EE_|AS8PR08MB8325:EE_|AM7EUR03FT033:EE_|GV2PR08MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbba41c-af27-4504-1d7d-08db7d2459ad
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lyBiXVJgYJ7P1cYeP/NzqoZD5d99333CUZdQ626DFrAgYXpSsm9U/cZqXqrbaH7J36XSzOTYk2LFw8Wc+feIJUtYAPZszRwxOSEB3FFCCXVxbHxQnTRvMPZMv0UoT4jysTn6eAsOxroTTK4xizmKt4OT9Bt9IYdxccGsIVADJDfSYyNHw4D57VniStRlxTlCYJhiv7ByXU8G7aR0gIXzPwfUFDpxkZpKMES1pK3VLmAZUxXCZKOPUuBlntnsyhObnX4SVvil61Q+u0jcgkHYjWnsgCT1iTltR5ANSjeNLjfSd4TganX7hsaYXg6w8t+0Qhc4MDx6MZrHOQCRU62S7/xn8kOd+guTE11AizuE5+aM/KODsq0asgieztqUJoI6DjmQ4V0HBMZlqLUQ30PvMD5qSwUoi8niggBh5FBT69xjqhBN4IvIpPY6Wfnprw79hiUPZL7IHWJb3he30INVzRyYB8+viBuLjrTVdzqOEevkhaHkgI+oeSONwPUnjM+x41zI9J/pa5RN3sTtIVroYq2/tDiM+7Db8ICKsaRZVbdJvy1K7WnK6C7E0y8M6scSjejqE0+rphxlUIp5UNw9T73csPBP5YFFUupcw/gmb5yCFeaArSBOLivCHxyNK0l/O3+tY0P1GZ899OY22ZpxD8FPrGgYMCpPt7rAZf+H9BSuOpSmnchRuFzOtND96DCgch8NrOJOuDhsUaUCRbWMwi5mH6rohvpPYUIHcUEUhK3ZJiC3vsvFR8NljvXDavk+lPuZtIlSZcph94w5Rd86cQp3W0Ssjfc4gnXOFXOfrgzwsGEBFRUg7JkUVyTlCBdaixfeaGXSKHMvWy3IzVJzBA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(8676002)(31696002)(40480700001)(86362001)(36860700001)(2616005)(40460700003)(426003)(47076005)(356005)(83380400001)(81166007)(82740400003)(41300700001)(70586007)(36756003)(70206006)(16576012)(4326008)(316002)(186003)(336012)(26005)(54906003)(6666004)(110136005)(53546011)(478600001)(30864003)(82310400005)(31686004)(44832011)(2906002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8325
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d98afef1-b9c4-404b-21ca-08db7d2451d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	21QLku9TrV2wkcLcrsMT/AJ+20ewFWiSTsbJHtlSyTrZQiJj5V4bsAJ/TYFF/8VfluBpz3ZmJ/N/F5pfpamVoCPLrfb75RLc6oGF7Rz578JwRnos2syrz1/HtRdDIEdX5Pz2Ff5NAx5gwN5B0Xs9a2x2Vyey7ao4vO+HtEmNC31bHfHMSD8I4YTnXs0NjybSRY0Ll65QNDSggf3343p6iSX5oJ1kq06lU4fWSVCUjB9A+TEkNiwVqNMESoCJVvLrzM9s7IJuLmZfKofwMosqPdONT0rQUIUwpCVjxilwEQSXzKfLC0Aud19+0L+95hBYSFlHa+nXbR1aUqCtqeQjOn6u78gq+X+jCmL9PJoeWVqKh+16uTdJzLo04Yn0oXu2PqsQkyEIVMl2MtwGTDsYgxK7zQ8l81cxT9YJIB3i0xtj4taSV3buW5XDa7Ur6/WRinq/b0XPUGaJ011iZBQUbcACp39Z8poFGKhla6uJ5Vy1fTW8EWIivFw6xjjYj6kgkWVxcwG/tjqUTvOG2HHZZZoCTp39+sxGg1fgnRzLKfEL+bjrbImiBn337jkKJuZ0Qh+zVgc1xUZaMt10AxHvQsUOhkE6ruAgrYTj+63U90TT8mqMM14z6oUuq3SUqWnIl9LN1QjQXAaSqlkgfuWJerdzp5n/ah4H2WCfNCX3JlE2dwZRkq3Dy7CBR+9TKK8qixjYDOTIY9DY+R1qfYmI60dckBsfYF5QU5bio6ZpxJQoti4THfAehsq3pEyIjP666iPqFKjXDoRWqPSZWlyFEu5G3WZ92piVZ74e6sEsXaP4KGp3+Hl+hXG8kcvHJ2Fu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(107886003)(26005)(478600001)(82740400003)(31686004)(6666004)(86362001)(31696002)(2616005)(186003)(81166007)(16576012)(54906003)(4326008)(70586007)(36860700001)(110136005)(83380400001)(336012)(426003)(53546011)(70206006)(316002)(47076005)(5660300002)(8936002)(44832011)(40460700003)(30864003)(41300700001)(2906002)(40480700001)(8676002)(36756003)(82310400005)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 06:52:07.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbba41c-af27-4504-1d7d-08db7d2459ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9208

Hi Julien

On 2023/7/5 05:54, Julien Grall wrote:
> Hi Penny,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> Xen defines some global configuration macros for Arm in config.h.
>> We still want to use it for MMU systems, but there are some address
> 
> Did you mean MPU?
> 

yes, typo

>> layout related definitions that are defined for MMU systems only.
>> These definitions could not be used by MPU systems, but adding
>> ifdefery with CONFIG_HAS_MPU to gate these definitions will result
>> in a messy and hard-to-read/maintain code.
>>
>> So we keep some common definitions still in config.h, but move MMU
>> related definitions to a new file - mmu/layout.h to avoid spreading
>> "#ifdef" everywhere.
> 
> Just to ease the review, can you add some details which one are 
> considered common?
> 

Sure,
IMO， the only part left in common is as follows:
```
#ifdef CONFIG_ARM_64

#define FRAMETABLE_SIZE        GB(32)
#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))

#endif
```
I couldn't figure a proper way to remove the limit for MPU system.

when calculating variable "pdx_group_valid", which is defined as
```
unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
     (FRAMETABLE_NR + PDX_GROUP_COUNT - 1)/PDX_GROUP_COUNT)] = {[0] = 1}
'''

It relies on FRAMETABLE_NR to limit array length. If we are trying to
get rid of the limit for the MPU, it may bring a lot of changes in pdx 
common codes, like, variable "pdx_group_valid" needs to be allocated in 
runtime, according actual frametable size, at least for MPU case.


> Also, this patch will need to be rebased on top of the latest staging.

sure,

> 
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>> v1 -> v2:
>> 1. Remove duplicated FIXMAP definitions from config_mmu.h
>> ---
>> v3:
>> 1. name the new header layout.h
>> ---
>>   xen/arch/arm/include/asm/config.h     | 127 +----------------------
>>   xen/arch/arm/include/asm/mmu/layout.h | 141 ++++++++++++++++++++++++++
>>   2 files changed, 143 insertions(+), 125 deletions(-)
>>   create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
>>
>> diff --git a/xen/arch/arm/include/asm/config.h 
>> b/xen/arch/arm/include/asm/config.h
>> index 30f4665ba9..204b3dec13 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -71,131 +71,8 @@
>>   #include <xen/const.h>
>>   #include <xen/page-size.h>
>> -/*
>> - * ARM32 layout:
>> - *   0  -   2M   Unmapped
>> - *   2M -   4M   Xen text, data, bss
>> - *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> - *   6M -  10M   Early boot mapping of FDT
>> - *   10M - 12M   Livepatch vmap (if compiled in)
>> - *
>> - *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>> - * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual 
>> address
>> - *                    space
>> - *
>> - *   1G -   2G   Xenheap: always-mapped memory
>> - *   2G -   4G   Domheap: on-demand-mapped
>> - *
>> - * ARM64 layout:
>> - * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
>> - *
>> - *  Reserved to identity map Xen
>> - *
>> - * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
>> - *  (Relative offsets)
>> - *   0  -   2M   Unmapped
>> - *   2M -   4M   Xen text, data, bss
>> - *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> - *   6M -  10M   Early boot mapping of FDT
>> - *  10M -  12M   Livepatch vmap (if compiled in)
>> - *
>> - *   1G -   2G   VMAP: ioremap and early_ioremap
>> - *
>> - *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>> - *
>> - * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>> - *  Unused
>> - *
>> - * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>> - *  1:1 mapping of RAM
>> - *
>> - * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
>> - *  Unused
>> - */
>> -
>> -#ifdef CONFIG_ARM_32
>> -#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
>> -#else
>> -
>> -#define SLOT0_ENTRY_BITS  39
>> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> -
>> -#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
>> -#endif
>> -
>> -#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>> -
>> -#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>> -#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
>> -
>> -#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
>> -
>> -#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
>> -#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
>> -
>> -#ifdef CONFIG_LIVEPATCH
>> -#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + 
>> BOOT_FDT_VIRT_SIZE)
>> -#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
>> -#endif
>> -
>> -#define HYPERVISOR_VIRT_START  XEN_VIRT_START
>> -
>> -#ifdef CONFIG_ARM_32
>> -
>> -#define CONFIG_SEPARATE_XENHEAP 1
>> -
>> -#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
>> -#define FRAMETABLE_SIZE        MB(128-32)
>> -#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> -
>> -#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
>> -#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
>> -
>> -#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
>> -#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
>> -
>> -#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
>> -#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
>> -
>> -#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
>> -
>> -/* Number of domheap pagetable pages required at the second level 
>> (2MB mappings) */
>> -#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>> -
>> -/*
>> - * The temporary area is overlapping with the domheap area. This may
>> - * be used to create an alias of the first slot containing Xen mappings
>> - * when turning on/off the MMU.
>> - */
>> -#define TEMPORARY_AREA_FIRST_SLOT    
>> (first_table_offset(DOMHEAP_VIRT_START))
>> -
>> -/* Calculate the address in the temporary area */
>> -#define TEMPORARY_AREA_ADDR(addr)                           \
>> -     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
>> -      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
>> -
>> -#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
>> -
>> -#else /* ARM_64 */
>> -
>> -#define IDENTITY_MAPPING_AREA_NR_L0  4
>> -
>> -#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
>> -#define VMAP_VIRT_SIZE   GB(1)
>> -
>> -#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
>> -#define FRAMETABLE_SIZE        GB(32)
>> -#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> -
>> -#define DIRECTMAP_VIRT_START   SLOT0(256)
>> -#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
>> -#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE 
>> - 1)
>> -
>> -#define XENHEAP_VIRT_START     directmap_virt_start
>> -
>> -#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
>> -
>> +#ifndef CONFIG_HAS_MPU
> 
> We are not going to introduce HAS_MPU yet in Xen. So can you use 
> CONFIG_HAS_MMU?
> 
> Also, I would add:
> 
> #else
> # error "Unknown memory management layout"
> #endif
> 

Sure, will do.

>> +#include <asm/mmu/layout.h>
>>   #endif
>>   #define NR_hypercalls 64
>> diff --git a/xen/arch/arm/include/asm/mmu/layout.h 
>> b/xen/arch/arm/include/asm/mmu/layout.h
>> new file mode 100644
>> index 0000000000..8deda6b84d
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mmu/layout.h
>> @@ -0,0 +1,141 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> GPL-2.0 is deprecated and should not be used for new file. This should 
> instead be GPL-2.0-only
> 

understood.

>> +
>> +#ifndef __ARM_MMU_LAYOUT_H__
>> +#define __ARM_MMU_LAYOUT_H__
>> +
>> +/*
>> + * ARM32 layout:
>> + *   0  -   2M   Unmapped
>> + *   2M -   4M   Xen text, data, bss
>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> + *   6M -  10M   Early boot mapping of FDT
>> + *   10M - 12M   Livepatch vmap (if compiled in)
>> + *
>> + *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>> + * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual 
>> address
>> + *                    space
>> + *
>> + *   1G -   2G   Xenheap: always-mapped memory
>> + *   2G -   4G   Domheap: on-demand-mapped
>> + *
>> + * ARM64 layout:
>> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
>> + *
>> + *  Reserved to identity map Xen
>> + *
>> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
>> + *  (Relative offsets)
>> + *   0  -   2M   Unmapped
>> + *   2M -   4M   Xen text, data, bss
>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> + *   6M -  10M   Early boot mapping of FDT
>> + *  10M -  12M   Livepatch vmap (if compiled in)
>> + *
>> + *   1G -   2G   VMAP: ioremap and early_ioremap
>> + *
>> + *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>> + *
>> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>> + *  Unused
>> + *
>> + * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>> + *  1:1 mapping of RAM
>> + *
>> + * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
>> + *  Unused
>> + */
>> +
>> +#ifdef CONFIG_ARM_32
>> +#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
>> +#else
>> +
>> +#define SLOT0_ENTRY_BITS  39
>> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> +
>> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
>> +#endif
>> +
>> +#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>> +
>> +#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>> +#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
>> +
>> +#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
>> +
>> +#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
>> +#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
>> +
>> +#ifdef CONFIG_LIVEPATCH
>> +#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + 
>> BOOT_FDT_VIRT_SIZE)
>> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
>> +#endif
>> +
>> +#define HYPERVISOR_VIRT_START  XEN_VIRT_START
>> +
>> +#ifdef CONFIG_ARM_32
>> +
>> +#define CONFIG_SEPARATE_XENHEAP 1
>> +
>> +#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
>> +#define FRAMETABLE_SIZE        MB(128-32)
>> +#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> +
>> +#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
>> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
>> +
>> +#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
>> +#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
>> +
>> +#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
>> +#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
>> +
>> +#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
>> +
>> +/* Number of domheap pagetable pages required at the second level 
>> (2MB mappings) */
>> +#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>> +
>> +/*
>> + * The temporary area is overlapping with the domheap area. This may
>> + * be used to create an alias of the first slot containing Xen mappings
>> + * when turning on/off the MMU.
>> + */
>> +#define TEMPORARY_AREA_FIRST_SLOT    
>> (first_table_offset(DOMHEAP_VIRT_START))
>> +
>> +/* Calculate the address in the temporary area */
>> +#define TEMPORARY_AREA_ADDR(addr)                           \
>> +     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
>> +      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
>> +
>> +#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
>> +
>> +#else /* ARM_64 */
>> +
>> +#define IDENTITY_MAPPING_AREA_NR_L0  4
>> +
>> +#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
>> +#define VMAP_VIRT_SIZE   GB(1)
>> +
>> +#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
>> +#define FRAMETABLE_SIZE        GB(32)
>> +#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> +
>> +#define DIRECTMAP_VIRT_START   SLOT0(256)
>> +#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
>> +#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE 
>> - 1)
>> +
>> +#define XENHEAP_VIRT_START     directmap_virt_start
>> +
>> +#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
>> +
>> +#endif
>> +
>> +#endif /* __ARM_MMU_LAYOUT_H__ */
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
> 
> Cheers,
> 

