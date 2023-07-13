Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF2751960
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562942.879747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqSX-0004Bz-4w; Thu, 13 Jul 2023 07:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562942.879747; Thu, 13 Jul 2023 07:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqSX-0004A0-1b; Thu, 13 Jul 2023 07:09:53 +0000
Received: by outflank-mailman (input) for mailman id 562942;
 Thu, 13 Jul 2023 07:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMFS=C7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qJqSV-00049s-Ia
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:09:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40f6e422-214c-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 09:09:48 +0200 (CEST)
Received: from AS9PR06CA0161.eurprd06.prod.outlook.com (2603:10a6:20b:45c::11)
 by AM0PR08MB5490.eurprd08.prod.outlook.com (2603:10a6:208:184::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 07:09:46 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::6b) by AS9PR06CA0161.outlook.office365.com
 (2603:10a6:20b:45c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:09:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 07:09:45 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Thu, 13 Jul 2023 07:09:45 +0000
Received: from bdfbac3fca67.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E290C975-03E5-4E3C-A5D2-3A23CAC36550.1; 
 Thu, 13 Jul 2023 07:09:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdfbac3fca67.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jul 2023 07:09:38 +0000
Received: from AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::45)
 by DU2PR08MB9962.eurprd08.prod.outlook.com (2603:10a6:10:498::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 07:09:36 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::8f) by AM6PR10CA0068.outlook.office365.com
 (2603:10a6:209:80::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:09:36 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Thu, 13 Jul 2023 07:09:35 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 07:09:34 +0000
Received: from [10.169.188.57] (10.169.188.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 13 Jul 2023 07:09:32 +0000
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
X-Inumbo-ID: 40f6e422-214c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTU4ZHlLMoF2IsWu3EkxBu5NQSzytA07Bng6us1O7H8=;
 b=lti6Hs9SDQ6+HRj0uUxTAyR0OKbZuVmTp+BGKsdCyVds88boi3NIsI4NXGNO4A6F73NWrULyRuV6C6r5Sd0levPgHdDCmDe9GgVMZxEYuWwM0A2ymj37uQkLEGDhKPf6bbaDRA3/yutbRxk5/eIP97SkfEs7ybOA+3hUmdLVTsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ac72dcd7b898748
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtQzVcL1N/gATDi/1g05jn9oQ1byVKWScYujOgb0SoiLGpPvdFUGYR6NlsT7h5hQOHWkf05PzVvoaUtPrNYrZs3mJIuBL1krWIfMCKtrzv2ziao7Jj2ufwddw+rrcjdgE+Nqd/JMuU6qTJMMstAlPhavProJYwYQ+xMjAZ3w/3/4JPhG4GV16dmn7qYAthXw5ZLD9TpzubQiv1wsUo3kMqlDLVFlvsqQNfGeRYgRDVyBs4Zr2DwWNSTNQZVBUQQ9UT3GXhtnr09yh0zH2EoRZzkKSkAqGYQ8OFGJBmaO5j95SaZPtW0arlnEUH3QwknwgJ59uhy0d+dgMiVYLHjj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTU4ZHlLMoF2IsWu3EkxBu5NQSzytA07Bng6us1O7H8=;
 b=HUkena8i+MaJmJAnX6sFjJVRGq+MpVqKYp6V9Tns1FP9mSrOctyCIPAGb4g5+etj3SJ+MGIsJJ466HElfPrSWg98cdSGnZg5E6gtWHNSVRSC0Rz9Biv62IFUZ+rnko1zhj7nK5Kk4cCKM/JMw2sTZqATrtbuJG6JX667st78ykyfN+X7BtzUmLAS+WHIDXfCu34qzHHOCcAfETc8o8iXVRiTB7Ty2by6XMnQAZHcAiYerulC78xfCZMiacx5ezvLG6ljMjHi2SWnB5Vfov7oRuGXm636CSTsrMmXUQ5yBt/eVgs2T2/tAGwjYTzoCFGl0HBHuXLVH2A7BbvKUX7wAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTU4ZHlLMoF2IsWu3EkxBu5NQSzytA07Bng6us1O7H8=;
 b=lti6Hs9SDQ6+HRj0uUxTAyR0OKbZuVmTp+BGKsdCyVds88boi3NIsI4NXGNO4A6F73NWrULyRuV6C6r5Sd0levPgHdDCmDe9GgVMZxEYuWwM0A2ymj37uQkLEGDhKPf6bbaDRA3/yutbRxk5/eIP97SkfEs7ybOA+3hUmdLVTsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <9e0c03c5-3fcf-b9b2-f1ae-da04aae27e0a@arm.com>
Date: Thu, 13 Jul 2023 15:09:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 36/52] xen/mpu: implememt ioremap_xxx in MPU
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-37-Penny.Zheng@arm.com>
 <60afd920-6fdb-5403-e096-57f86e4ed35e@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <60afd920-6fdb-5403-e096-57f86e4ed35e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT004:EE_|DU2PR08MB9962:EE_|AM7EUR03FT015:EE_|AM0PR08MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ebeba0-c38c-4a0d-ff31-08db83702361
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f/K6dJePZTiQ+BNLDD8g5q31cct71dST1qoifowIdCb2J/a6fZXikJOdge0R/P4LOEcdTDjbSin/IAkzpnrtZhiSGULutsO1/9FpGLQ/6lVua5X2rwiNq1pdCaj3MRkFSdUg9F0DmbpIwQQuzJKA9SH/0zQuKix3iW+ya9tmBwUr3LNyv22wtjFHsUH4SS33ryRwh5UwCuV17DlfMRgYKV8KvMZlkJBrjy6p+UVzKtI/XBokc34PDdRcxmSMzSDA1yLNvnWlStFopa3KLcmpc9qrsJpIETgSMsSFgJIj5YHF+4R6Q6XB7l1oWJUuFaWPixwQNZQFEw8No74eNDzdsXgIjhXfCKcxZ69fci1Q/DLEDvxI5UmGEJ7N3XdqnGNzc/2Su09OIXZ0Zw+pqjaPZJe4Pu+UlS9NDTO8Lsj20eUWO/9s8E/GP9i/ModogXY1S7FjPTq7cR9nSBefBghWT5b/V+auFEZ0+DEC9KKRpSG7Nxg1b4t45tD2XcaPkJFfx50Z3rXzRBesnKLpmHt6OmtHkzPx8zdgKBdrhj67wcaUXVjb0A+E4TLSl93qeAIl7KeTHFSMGzCRkYBYoXnixq9WnELVYj3MEKUvgHL/i96NCiGvKos5kGPbEJWyHkmAjYg2d/Vff1l9XeNdkcNxadbdJlrFAuS71l5ZgjiCGLceULX0eI0jHC3r2AzsdMoJ2OqvVRkWAjfr2ZlzkkJPkDM2NLtq7/wPhKTdWlH1a+6kUKM0MYOdb87MmfilSfw9BzAK8bYYKJS3tIGX4YmbkRdLF88G57499ZzG3QOjy/AinAZCAy7niDBFRvfxJB6r83fRbeWCoIZuGMEuuBVVwBrJxLfKSn72RrzECLgM+mo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(36860700001)(47076005)(186003)(53546011)(426003)(336012)(83380400001)(36756003)(2616005)(82310400005)(86362001)(31696002)(81166007)(356005)(82740400003)(40480700001)(26005)(41300700001)(4326008)(70586007)(70206006)(30864003)(2906002)(316002)(44832011)(31686004)(5660300002)(8936002)(8676002)(54906003)(110136005)(66899021)(478600001)(16576012)(21314003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9962
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	812e5975-6d24-42cf-3b3f-08db83701d96
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gzpspmJ4FQ8h2TrFSMuJ1cmxHmpsMxindZDbhYvepUb4hwJGGmVCHAyAOSKKybUAwrpL7kpT8X1HUa3SvPYIVAhQsH3A9EYtj2rSf8nhmaa1CAOKyF9bN9pj0w/A9Yp3nycsOuf6OFdzk4qFj/Ee8KiiTH7cWiIQjFVG4I0oFW8O4QrWco35t2eKBsWLL26Sdhuu3o56SlhL3FKuY9NIX2GWf8KGO7HEQCxERYnvUd9vJH5pkLi9PbZiVKtJW6fgnj7Y8aw/aFZmwkj24BhoNoHY8EONVNC9dYtUONDv2i9VnGQ152I2fVxPiXmsGgP3bJ5bEVwf9Lpdr8NC2wduUt77IfCO5TcpVE19PjXwsM67xUSnl1IqUBVtwSrech3aY9fX1CU9bsdzAo8H3b8IGV+RcM5BummxybTMlRZGYvRhw5KkOcQT+Mg1cHpGCB2jekZqSrolnAYeF6THdyuez7iwhvvYU28LN/3gQH89yRbcvgPiwT/5/Vieo3V0lqIPkl8Onb4tb3loAi9zeYN4e9LFse5I5vkzZpB08wUyvGGbbsYexQsGU7FhJdwHQ1ueZLRpWjB/K3ejVvdszMxmnG7WMc4rW5TzSX2qOGMOt35yS4roa9YIZmtsfERKOTUlCsk8YSUgiVPMEq059OCWACK2ZidddHGFCvgYajRF2NJtVjp7al08SvEatQEzggWvpHPfrhmY4H+YArIhb/MyEwi9n+jM2HtfDRzzzHthWgNZP4FRw/acRVelWJ+HJWHedK2FszPcwpn/LTYpTKg/UM+cPyGYYwOhRUpTf4E3nsRXh2MvpmhtWCnXlHynoIlVK5UAn4RFp5CjWSPFy1ZYew==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(47076005)(336012)(426003)(26005)(53546011)(186003)(36860700001)(2616005)(83380400001)(70206006)(70586007)(4326008)(316002)(44832011)(8676002)(8936002)(41300700001)(5660300002)(2906002)(110136005)(16576012)(30864003)(478600001)(54906003)(40480700001)(82740400003)(81166007)(36756003)(82310400005)(86362001)(31696002)(31686004)(66899021)(3940600001)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 07:09:45.5476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ebeba0-c38c-4a0d-ff31-08db83702361
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5490

Hi Ayan

On 2023/7/5 22:01, Ayan Kumar Halder wrote:
> Hi Penny,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> A set of function ioremap_xxx are designed to map deivce memory or
>> remap part of memory temporarily for short-time special purpose, like
>> using ioremap_wc to temporarily remap guest kernel non-cacheable, for
>> copying it to guest memory.
>>
>> As virtual translation is not supported in MPU, and we always follow the
>> rule of "map in demand" in MPU, we implement MPU version of ioremap_xxx,
>> through mapping the memory with a transient MPU memory region.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - adapt to the new rule of "map in demand"
>> ---
>>   xen/arch/arm/include/asm/arm64/mpu.h |   4 +
>>   xen/arch/arm/include/asm/mm.h        |   6 +
>>   xen/arch/arm/mpu/mm.c                | 185 +++++++++++++++++++++++++++
>>   3 files changed, 195 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>> b/xen/arch/arm/include/asm/arm64/mpu.h
>> index aee7947223..c5e69f239a 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -121,6 +121,10 @@ static inline bool region_is_valid(pr_t *pr)
>>       return pr->prlar.reg.en;
>>   }
>>
>> +static inline bool region_is_transient(pr_t *pr)
>> +{
>> +    return pr->prlar.reg.tran;
>> +}
>>   #endif /* __ASSEMBLY__ */
>>
>>   #endif /* __ARM64_MPU_H__ */
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> index cffbf8a595..0352182d99 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -227,6 +227,7 @@ void __iomem *ioremap_attr(paddr_t start, size_t 
>> len, unsigned int attributes);
>>   extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>   extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>>
>> +#ifndef CONFIG_HAS_MPU
>>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>>   {
>>       return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>> @@ -241,6 +242,11 @@ static inline void __iomem *ioremap_wc(paddr_t 
>> start, size_t len)
>>   {
>>       return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>>   }
>> +#else
>> +extern void __iomem *ioremap_nocache(paddr_t start, size_t len);
>> +extern void __iomem *ioremap_cache(paddr_t start, size_t len);
>> +extern void __iomem *ioremap_wc(paddr_t start, size_t len);
>> +#endif
>>
>>   /* XXX -- account for base */
>>   #define mfn_valid(mfn)        
>> ({                                              \
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 9d5c1da39c..3bb1a5c7c4 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -624,6 +624,191 @@ int __init unmap_staticmem_pages_to_xen(paddr_t 
>> start, paddr_t end)
>>       return xen_mpumap_update(start, end, 0);
>>   }
>>
>> +/*
>> + * Check whether memory range [pa, pa + len) is mapped in Xen MPU
>> + * memory mapping table xen_mpumap.
>> + *
>> + * If it is mapped, the associated index will be returned.
>> + * If it is not mapped, INVALID_REGION_IDX will be returned.
>> + */
>> +static uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len)
>> +{
>> +    int rc;
>> +    uint8_t idx;
>> +
>> +    rc = mpumap_contain_region(xen_mpumap, max_xen_mpumap, pa, pa + 
>> len - 1,
>> +                               &idx);
>> +    if ( (rc == MPUMAP_REGION_FOUND) || (rc == 
>> MPUMAP_REGION_INCLUSIVE) )
>> +        return idx;
>> +
>> +    if ( rc == MPUMAP_REGION_OVERLAP )
>> +         panic("mpu: can not deal with overlapped MPU memory region\n");
>> +    /* Not mapped */
>> +    return INVALID_REGION_IDX;
>> +}
>> +
>> +static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
>> +{
>> +    if ( region->prbar.reg.ap != PAGE_AP_MASK(attributes) )
>> +    {
>> +        printk(XENLOG_WARNING "region permission is not matched (0x%x 
>> -> 0x%x)\n",
>> +               region->prbar.reg.ap, PAGE_AP_MASK(attributes));
>> +        return false;
>> +    }
>> +
>> +    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
>> +    {
>> +        printk(XENLOG_WARNING "region execution permission is not 
>> matched (0x%x -> 0x%x)\n",
>> +               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
>> +        return false;
>> +    }
>> +
>> +    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
>> +    {
>> +        printk(XENLOG_WARNING "region memory attributes is not 
>> matched (0x%x -> 0x%x)\n",
>> +               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + * Check whether memory range [pa, pa + len) is mapped with memory
>> + * attributes #attr in Xen MPU memory mapping table xen_mpumap.
>> + *
>> + * If it is mapped but with different memory attributes, Errno -EINVAL
>> + * will be returned.
>> + * If it is not mapped at all, Errno -ENOENT will be returned.
>> + */
>> +static int is_mm_range_mapped_with_attr(paddr_t pa, paddr_t len,
>> +                                        unsigned int attr)
>> +{
>> +    uint8_t idx;
>> +
>> +    idx = is_mm_range_mapped(pa, len);
>> +    if ( idx != INVALID_REGION_IDX )
>> +    {
>> +        pr_t *region;
>> +
>> +        region = &xen_mpumap[idx];
>> +        if ( !is_mm_attr_match(region, attr) )
>> +            return -EINVAL;
>> +
>> +        return 0;
>> +    }
>> +
>> +    return -ENOENT;
>> +}
>> +
>> +/*
>> + * map_mm_range shall work with unmap_mm_range to map a chunk
>> + * of memory with a transient MPU memory region for a period of short 
>> time.
>> + */
>> +static void *map_mm_range(paddr_t pa, size_t len, unsigned int 
>> attributes)
>> +{
>> +    if ( xen_mpumap_update(pa, pa + len, attributes | _PAGE_TRANSIENT) )
>> +        printk(XENLOG_ERR "Failed to map_mm_range 
>> 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
>> +               pa, pa + len);
> Don't you want to return NULL or something from here ?

Right, I shall return NULL. Will fix.

>> +
>> +    return maddr_to_virt(pa);
>> +}
>> +
>> +static void unmap_mm_range(paddr_t pa)
>> +{
>> +    uint8_t idx;
>> +
>> +    /*
>> +     * The mapping size in map_mm_range is at least PAGE_SIZE.
>> +     * Find the MPU memory region mapped through map_mm_range, and 
>> associated
>> +     * idx will be returned.
>> +     */
>> +    idx = is_mm_range_mapped(pa, PAGE_SIZE);
>> +    if ( idx == INVALID_REGION_IDX )
>> +    {
>> +        printk(XENLOG_ERR "Failed to unmap_mm_range MPU memory region 
>> at 0x%"PRIpaddr"\n",
>> +               pa);
>> +        return;
>> +    }
>> +
>> +    if ( !region_is_transient(&xen_mpumap[idx]) )
>> +    {
>> +        printk(XENLOG_WARNING "Failed to unmap MPU memory region at 
>> 0x%"PRIpaddr"\n, as it is not transient\n",
>> +               pa);
>> +        return;
>> +    }
> 
> Does this mean you only allow unmapping of transient memory ?

For this function, yes.

> 
> So, is the non transient memory always expected to be mapped throughout 
> the lifetime of the system ?
> 

Maybe I should rename this pair helpers to 
map_mm_transient()/unmap_mm_transient() for better understanding.
For mapping memory with transient MPU region, we are suggesting to
use map_mm_transient()/unmap_mm_transient().

You could see that, in Xen, Functions like, ioremap_xxx()/iounmap(),
map_domain_page()/unmap_domain_page(), are always working as a pair
and showing up with each other nearby. "Transient" is referring to
this kind of senario.
So for "non-transient" memory, it is more pointing to the memory not
mapped from functions like ioremap_xxx() and map_domain_page(). We could
use xen_mpumap_update to do the mapping/unmapping for them.

>> +
>> +    /* Disable MPU memory region and clear the according entry in 
>> xen_mpumap */
>> +    control_mpu_region_from_index(idx, false);
>> +}
>> +
>> +/*
>> + * It works with "iounmap" as a pair to temporarily map a chunk of 
>> memory
>> + * with a transient MPU memory region, for short-time special accessing.
>> + */
>> +void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
>> +{
>> +    return map_mm_range(round_pgdown(pa), round_pgup(len), attributes);
>> +}
>> +
>> +/* ioremap_nocache is normally used to map device memory */
>> +void __iomem *ioremap_nocache(paddr_t start, size_t len)
>> +{
>> +    int rc;
> 
> For this function and others (ioremap_xxx()), don't we need to check if 
> the memory is transient ?
> 

Checking if the memory is transient should lay in unmapping function, 
like iounmap(). Since in function iounmap(), we shall only unmap the 
"transient" memory, memory that is mapped through ioremap_xxx().

The reason why I add checking is_mm_range_mapped_with_attr() here is 
that, in some corner cases, memory is already mapped as expected, there 
is no need to map again. In MMU, it is only a redundant mapping. 
However, in MPU, it could lead to failure of "Overlapping MPU memory 
region".

For example,
If earlyprintk is enabled, uart0 will be mapped at assembly by 
setup_early_uart(), see commit
"[PATCH v3 26/52] xen/mpu: map early uart when earlyprintk on".
Then later when we are doing uart initialization in pl011_uart_init(),
ioremap_nocache() will try to map it twice if there is no checking.

> - Ayan
> 
>> +
>> +    /* Check whether it is already mapped as device memory */
>> +    rc = is_mm_range_mapped_with_attr(start, len, 
>> PAGE_HYPERVISOR_NOCACHE);
>> +    if ( rc == -ENOENT )
>> +        return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>> +    else if ( rc != 0 )
>> +        return NULL;
>> +
>> +    /* Already mapped */
>> +    return maddr_to_virt(start);
>> +}
>> +
>> +/*
>> + * ioremap_cache which is working with iounmap as a pair, is normally 
>> used to
>> + * map a chunck of cacheable memory temporarily for short-time 
>> special purpose.
>> + */
>> +void __iomem *ioremap_cache(paddr_t start, size_t len)
>> +{
>> +    int rc;
>> +
>> +    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR);
>> +    if ( rc == -ENOENT )
>> +        return ioremap_attr(start, len, PAGE_HYPERVISOR);
>> +    else if ( rc != 0 )
>> +        return NULL;
>> +
>> +    /* Already mapped */
>> +    return maddr_to_virt(start);
>> +}
>> +
>> +/*
>> + * ioremap_wc which is working with iounmap as a pair, is normally 
>> used to
>> + * map a chunck of non-cacheable memory temporarily for short-time 
>> special
>> + * purpose.
>> + */
>> +void __iomem *ioremap_wc(paddr_t start, size_t len)
>> +{
>> +    int rc;
>> +
>> +    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR_WC);
>> +    if ( rc == -ENOENT )
>> +        ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>> +    else if ( rc != 0 )
>> +        return NULL;
>> +
>> +    /* Already mapped */
>> +    return maddr_to_virt(start);
>> +}
>> +
>> +void iounmap(void __iomem *va)
>> +{
>> +    unmap_mm_range(virt_to_maddr(va));
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> -- 
>> 2.25.1
>>
>>

