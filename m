Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FBB721D71
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 07:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543473.848488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q62eF-0001fr-Ha; Mon, 05 Jun 2023 05:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543473.848488; Mon, 05 Jun 2023 05:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q62eF-0001dG-D8; Mon, 05 Jun 2023 05:20:55 +0000
Received: by outflank-mailman (input) for mailman id 543473;
 Mon, 05 Jun 2023 05:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=phx/=BZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1q62eE-0001d8-7b
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 05:20:54 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe02::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbd11b23-0360-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 07:20:50 +0200 (CEST)
Received: from AS8PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:20b:312::28)
 by AS8PR08MB8372.eurprd08.prod.outlook.com (2603:10a6:20b:569::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 05:20:47 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::d8) by AS8PR04CA0053.outlook.office365.com
 (2603:10a6:20b:312::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 05:20:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.13 via Frontend Transport; Mon, 5 Jun 2023 05:20:47 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Mon, 05 Jun 2023 05:20:46 +0000
Received: from 9a9cbab8d97e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9187E66-7CD2-410D-825A-B1571E100472.1; 
 Mon, 05 Jun 2023 05:20:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a9cbab8d97e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jun 2023 05:20:39 +0000
Received: from DUZPR01CA0240.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::8) by DU0PR08MB8020.eurprd08.prod.outlook.com
 (2603:10a6:10:3e7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 05:20:36 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::64) by DUZPR01CA0240.outlook.office365.com
 (2603:10a6:10:4b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Mon, 5 Jun 2023 05:20:36 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.18 via Frontend Transport; Mon, 5 Jun 2023 05:20:36 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 5 Jun
 2023 05:20:35 +0000
Received: from [10.169.188.53] (10.169.188.53) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Mon, 5 Jun 2023 05:20:33 +0000
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
X-Inumbo-ID: bbd11b23-0360-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/qB5FDFT19m+OUEjTfr+DxgZ43dzMQdLsg/dxjwF5I=;
 b=UzLbN2TmdE2OQosYZduvwGCAHd2bAgUTUY0DWaeVhD3RY/yDegIMeHJnlW/EWl5csoIz1n/v0x/3Ozo0JoCCN4fcp2Q1d2ERWoUTc4vVAymbuhbUbSxzVistWj7ETH6Hl7e1EgZylLd52eEAWs883K8Eg1Cl5f2CLXyHPxDuPqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97be2f863247f834
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZE8kjob36GYufthee+RnBYhJMmfiLafL5tI7RAvb2+qPafHdrrddUc+3esvnAkiCMUSri1sCT0XASkhyp3ayyTXjES2rPVmOnGXLYhPKKXRestPyzQCWPO+Lktzsp+6jI7GwUGk6MkLL35ryGTYYrQDenjomGlPECdpMn4IyA4WgEP1mEvMfFOQdd+vvU/ZRJmhsdvR9MEwOZ0kjbM4AOMh9bVcONyl/ANkYO6jdzUb40hwbh1F+ghbaGv2rJJCiIq2Oca4+evN8IUlXo//BQMm682SDbWD4Q9zbdD9mnBahnxJl2CPBbUoAgFW7Hh6ZO760lzXg9da2C8th1zF1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/qB5FDFT19m+OUEjTfr+DxgZ43dzMQdLsg/dxjwF5I=;
 b=EFqcQ7pjkYmdSnaMri/XC/3uCx9PBzOdNN08Jl70wnBlNuQjgdXielEQ69kyKmV4pjGTPTEo+0NchoIG8OXnOT8pQQ0eebm9kTyXD096J8uE2oswnkoibEGI+QsfhzM5PPUxA/dcwI+uwrPwRcFO748qyxcwJqmH8wNSI/qkcR9XQPd0CG1QDLDHjokocBCWKrfrNGjY+G61ghLGmpX+hWjzVQ3eeswFnbA8L4sYS6ukszPF6SIZxbUEuymuSbEHGauoNri9PN54RY2Ma65Rb/zIxHQNZWS9FGm9Po6wHaPPte/kiAjCO0Xy8+TkdGb1I6bW+7HU+ij3504F9f63VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/qB5FDFT19m+OUEjTfr+DxgZ43dzMQdLsg/dxjwF5I=;
 b=UzLbN2TmdE2OQosYZduvwGCAHd2bAgUTUY0DWaeVhD3RY/yDegIMeHJnlW/EWl5csoIz1n/v0x/3Ozo0JoCCN4fcp2Q1d2ERWoUTc4vVAymbuhbUbSxzVistWj7ETH6Hl7e1EgZylLd52eEAWs883K8Eg1Cl5f2CLXyHPxDuPqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Content-Type: multipart/alternative;
	boundary="------------3JTVP8sbqEQ3djxngGXEyxAk"
Message-ID: <661569b8-e284-0618-c986-3cb0313beeb3@arm.com>
Date: Mon, 5 Jun 2023 13:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 10/40] xen/arm: split MMU and MPU config files from
 config.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-11-Penny.Zheng@arm.com>
 <f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT044:EE_|DU0PR08MB8020:EE_|AM7EUR03FT025:EE_|AS8PR08MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cb82f0-694e-4693-5048-08db65849e75
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Gx0JWBPTkBtnVWgqjrKhL7rAnbXPOOh4fJ2w/a0vUzl4M+vBBaMpuu3t7x1ILLvvkT4km9wH6B85HJl4Jjm4tFyjwDCmt+lUiQz41+aswtcE4rs3OzlA29lu+zHSvMVpkwXU/23swxNvGxRlG/BmQoOrHGE2RRj63zvKVHfNF4Ah6xthLklZl7lb7lA7YpCCh5grXu5IBv0HZEtl/cUz8dS/73mSrU8n0guTlqNGjQBmxw75r6AcNV3Z4QvYaCqmvLb7qcFZl4HTpd7lCBrXSwnnOW+7uzc5ELYKzhxBAME24adgVtmEewm5CvUHaAl0845zcUIIZ3BbWc9NZxlHBLofKEGhpFzHwdy6+TPUUMTGbKpgHe9FBU6EJGR4Ap/zNoF4lV5UsP1v/62Hl5hVBxGcEgsdNbIQC6+8ju8Cwqrc06MvOMeb0gI7ux8Pux2cB5QoROGQxZ/WQRGMp5cVY10K/mSriy/s58edKAzDm53txgXpu1ClWNjUxSGhJj4Ao/iPmJ87GHTLKjB2y3i7bDiXf+adpapHA15+0SPY59NRgdiC5sruoDL76q1IBpn0N+/N9R5PufefKUzy7F9yDhrXzR7TyTEu8hzs8jOVHUjY+gKRBMiHEItF0QL8RtY9NVo6LRvBMQHiKkSdRktngJYmgiVIGgQTcDZXnZU6zeYmDx4wsF80+upK6/UIr/h2ecaIrGTYiiIfLDE79HY8i2HqqBGD2L2e4VH0U9Gdr2gTMxwAGmT31kmSc9lV2SCteHaDJKf5adqlqEjatMpvB5Dq4mqG0BuXFIDuP7yV/V7c9xyPaYtwnGLuizlCQaWLV1RUmsAjHo2YN2j940o4Eg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(36756003)(16576012)(110136005)(54906003)(40460700003)(2906002)(31696002)(82310400005)(478600001)(86362001)(41300700001)(8936002)(8676002)(5660300002)(82740400003)(316002)(356005)(44832011)(81166007)(4326008)(40480700001)(70586007)(70206006)(31686004)(83380400001)(47076005)(2616005)(53546011)(26005)(186003)(336012)(426003)(36860700001)(33964004)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8020
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79cd5f47-71a4-40c8-25fc-08db658497e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p1vKN5qt0I+Q9TM+mkYY7rgf6JkZzVeQ3amqBEVuuw1XnSbXC+DEPqvNNJH8ntGwTzCJXoGvWkbYcV4ZtZwDWG0QAiC7PwBLCtYxJBo+SzT8YPAD0zw9ACKmlJjVrE1EG9TEMZSJeycWrW7BS/noHeUCcE04wXtwqxJFVFaTP45P/g3QNfD3Vc/y+IPbdZrm3Nl91J57kdEyja24XLhbtiAtCrU6IzVsl0BKIz2b6dGVvGmChynRMYNTHg1nmn7Wp8ZnD1M5r1aq8Asxwe3j5Px+2p2wyjah8JsJuez9KEcxkc1PwIGKnvSE9Dvs2fCyyzIR6jb0mbkIcmqgN5al1aGCZ4UAJh3ANX1jR+la0qiIaDg6MGnlFkrWFTk5vaekbZuRVP8LFNMz1dfMaXfsISfGZpqxrkzRXAvWVmsknPfH16F2gmZ2RU/5KFhuCRdZ61ChrKp9w/9Ehm7mDz58EZ574vflgViAvioOg6XPIR0aYSid8EzKZ1/888qqEAOPTRTKCdvH1A/EXUyLw+Ex5zYpDW98e5edzHGlrDTNdfzXASzDFUIGfTLuLFKYI9VfGSMDH2HDF/3XI932/882ubblbgLdRGSWpUg8+HAn4yLJxIhevmFlc/mCrhv/xmr/CkYKIvUoskqmBg0qWt9Hq7CzoBzvleKdCWqN5ooLqnbhOewsCFbRc3sfPs0MWwAtChCGwSuq934/ub725aQ6/6GM22hrZFNflB2FEWWsg6Z8fum/kZK0dkEVtCOIP3j/yYGbGGN3W2OaMYbO7xPSkDejg+EwNaF/oZyzUpAMVYMkdQZ3EvCvteEdPgeRG1cU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(40460700003)(47076005)(336012)(426003)(2906002)(2616005)(36756003)(86362001)(31696002)(82310400005)(81166007)(82740400003)(36860700001)(40480700001)(316002)(33964004)(41300700001)(5660300002)(107886003)(8676002)(8936002)(54906003)(110136005)(16576012)(478600001)(70206006)(70586007)(4326008)(31686004)(53546011)(26005)(186003)(44832011)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 05:20:47.0852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cb82f0-694e-4693-5048-08db65849e75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8372

--------------3JTVP8sbqEQ3djxngGXEyxAk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


Sorry for the late reply. Got sidetracked by other tasks...


On 2023/1/19 22:20, Julien Grall wrote:
> Hi,
>
> On 13/01/2023 05:28, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> Xen defines some global configuration macros for Arm in
>> config.h. We still want to use it for Armv8-R systems, but
>> there are some address related macros that are defined for
>> MMU systems. These macros will not be used by MPU systems,
>> Adding ifdefery with CONFIG_HAS_MPU to gate these macros
>> will result in a messy and hard-to-read/maintain code.
>>
>> So we keep some common definitions still in config.h, but
>> move virtual address related definitions to a new file -
>> config_mmu.h. And use a new file config_mpu.h to store
>> definitions for MPU systems. To avoid spreading #ifdef
>> everywhere, we keep the same definition names for MPU
>> systems, like XEN_VIRT_START and HYPERVISOR_VIRT_START,
>> but the definition contents are MPU specific.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v1 -> v2:
>> 1. Remove duplicated FIXMAP definitions from config_mmu.h
>> ---
>>   xen/arch/arm/include/asm/config.h     | 103 +++--------------------
>>   xen/arch/arm/include/asm/config_mmu.h | 112 ++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/config_mpu.h |  25 ++++++
>
> I think this patch wants to be split in two. So we keep code movement 
> separate from the introduction of new feature (e.g. MPU).
>
> Furthermore, I think it would be better to name the new header 
> layout_* (or similar).
>
> Lastly, you are going to introduce several file with _mmu or _mpu. I 
> would rather prefer if we create directory instead.
>
>
>>   3 files changed, 147 insertions(+), 93 deletions(-)
>>   create mode 100644 xen/arch/arm/include/asm/config_mmu.h
>>   create mode 100644 xen/arch/arm/include/asm/config_mpu.h
>>
>> diff --git a/xen/arch/arm/include/asm/config.h 
>> b/xen/arch/arm/include/asm/config.h
>> index 25a625ff08..86d8142959 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -48,6 +48,12 @@
>>     #define INVALID_VCPU_ID MAX_VIRT_CPUS
>>   +/* Used for calculating PDX */
>
> I am not entirely sure to understand the purpose of this comment.
>
>> +#ifdef CONFIG_ARM_64
>> +#define FfaRAMETABLE_SIZE        GB(32)
>> +#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> +#endif
>> +
>
> Why do you only keep the 64-bit version in config.h?
>
> However... the frametable size is limited by the space we reserve in 
> the virtual address space. This would not be the case for the MPU.
>

Yes, but when calculating variable /pdx_group_valid/, which is defined 
as '''

/unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(/
                       (/FRAMETABLE_NR + PDX_GROUP_COUNT - 1) / 
PDX_GROUP_COUNT)] = { [0] = 1 }/ ''',

it relies on FRAMETABLE_NR to limit array length. If we are trying to 
get rid of the limit for the MPU, hmmm,

it may bring a lot of changes in pdx common codes, for example, maybe 
variable /pdx_group_valid/ needs to

be allocated in runtime, according actual frametable size, at least for 
MPU case.

So, here, I intend to keep the same limit as MMU has for MPU too, or any 
suggestion from you?


> So having the limit in common seems a bit odd. In fact, I think we 
> should look at getting rid of the limit for the MPU.
>
> [...]

[...]

> Cheers,
>
Cheers,

Penny Zheng

--------------3JTVP8sbqEQ3djxngGXEyxAk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p><br>
    </p>
    <p>Sorry for the late reply. Got sidetracked by other tasks...</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/1/19 22:20, Julien Grall wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org">Hi,
      <br>
      <br>
      On 13/01/2023 05:28, Penny Zheng wrote:
      <br>
      <blockquote type="cite">From: Wei Chen <a class="moz-txt-link-rfc2396E" href="mailto:wei.chen@arm.com">&lt;wei.chen@arm.com&gt;</a>
        <br>
        <br>
        Xen defines some global configuration macros for Arm in
        <br>
        config.h. We still want to use it for Armv8-R systems, but
        <br>
        there are some address related macros that are defined for
        <br>
        MMU systems. These macros will not be used by MPU systems,
        <br>
        Adding ifdefery with CONFIG_HAS_MPU to gate these macros
        <br>
        will result in a messy and hard-to-read/maintain code.
        <br>
        <br>
        So we keep some common definitions still in config.h, but
        <br>
        move virtual address related definitions to a new file -
        <br>
        config_mmu.h. And use a new file config_mpu.h to store
        <br>
        definitions for MPU systems. To avoid spreading #ifdef
        <br>
        everywhere, we keep the same definition names for MPU
        <br>
        systems, like XEN_VIRT_START and HYPERVISOR_VIRT_START,
        <br>
        but the definition contents are MPU specific.
        <br>
        <br>
        Signed-off-by: Wei Chen <a class="moz-txt-link-rfc2396E" href="mailto:wei.chen@arm.com">&lt;wei.chen@arm.com&gt;</a>
        <br>
        ---
        <br>
        v1 -&gt; v2:
        <br>
        1. Remove duplicated FIXMAP definitions from config_mmu.h
        <br>
        ---
        <br>
          xen/arch/arm/include/asm/config.h     | 103
        +++--------------------
        <br>
          xen/arch/arm/include/asm/config_mmu.h | 112
        ++++++++++++++++++++++++++
        <br>
          xen/arch/arm/include/asm/config_mpu.h |  25 ++++++
        <br>
      </blockquote>
      <br>
      I think this patch wants to be split in two. So we keep code
      movement separate from the introduction of new feature (e.g. MPU).
      <br>
      <br>
      Furthermore, I think it would be better to name the new header
      layout_* (or similar).
      <br>
      <br>
      Lastly, you are going to introduce several file with _mmu or _mpu.
      I would rather prefer if we create directory instead.
      <br>
      <br>
      <br>
      <blockquote type="cite">  3 files changed, 147 insertions(+), 93
        deletions(-)
        <br>
          create mode 100644 xen/arch/arm/include/asm/config_mmu.h
        <br>
          create mode 100644 xen/arch/arm/include/asm/config_mpu.h
        <br>
        <br>
        diff --git a/xen/arch/arm/include/asm/config.h
        b/xen/arch/arm/include/asm/config.h
        <br>
        index 25a625ff08..86d8142959 100644
        <br>
        --- a/xen/arch/arm/include/asm/config.h
        <br>
        +++ b/xen/arch/arm/include/asm/config.h
        <br>
        @@ -48,6 +48,12 @@
        <br>
            #define INVALID_VCPU_ID MAX_VIRT_CPUS
        <br>
          +/* Used for calculating PDX */
        <br>
      </blockquote>
      <br>
      I am not entirely sure to understand the purpose of this comment.
      <br>
      <br>
    </blockquote>
    <blockquote type="cite"
      cite="mid:f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org">
      <blockquote type="cite">+#ifdef CONFIG_ARM_64
        <br>
        +#define FfaRAMETABLE_SIZE        GB(32)
        <br>
        +#define FRAMETABLE_NR          (FRAMETABLE_SIZE /
        sizeof(*frame_table))
        <br>
        +#endif
        <br>
        +
        <br>
      </blockquote>
      <br>
      Why do you only keep the 64-bit version in config.h?
      <br>
      <br>
      However... the frametable size is limited by the space we reserve
      in the virtual address space. This would not be the case for the
      MPU.
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, but when calculating variable <i>pdx_group_valid</i>, which
      is defined as '''</p>
    <p><i>unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(</i><br>
                            (<i>FRAMETABLE_NR + PDX_GROUP_COUNT - 1) /
        PDX_GROUP_COUNT)] = { [0] = 1 }</i> ''',</p>
    <p>it relies on FRAMETABLE_NR to limit array length. If we are
      trying to get rid of the limit for the MPU, hmmm, <br>
    </p>
    <p>it may bring a lot of changes in pdx common codes, for example,
      maybe variable <i>pdx_group_valid</i> needs to <br>
    </p>
    <p>be allocated in runtime, according actual frametable size, at
      least for MPU case.<br>
    </p>
    <p>So, here, I intend to keep the same limit as MMU has for MPU too,
      or any suggestion from you?</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org">So having
      the limit in common seems a bit odd. In fact, I think we should
      look at getting rid of the limit for the MPU.
      <br>
      <br>
      [...]
      <br>
    </blockquote>
    <p>[...]<br>
    </p>
    <blockquote type="cite"
      cite="mid:f42681d3-c08f-24bd-8f10-aa53930081b0@xen.org">Cheers,
      <br>
      <br>
    </blockquote>
    <p>Cheers,</p>
    <p>Penny Zheng<br>
    </p>
  </body>
</html>

--------------3JTVP8sbqEQ3djxngGXEyxAk--

