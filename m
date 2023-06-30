Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D87432CF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 04:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557248.870424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF45F-0001Wk-L8; Fri, 30 Jun 2023 02:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557248.870424; Fri, 30 Jun 2023 02:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF45F-0001TU-Hf; Fri, 30 Jun 2023 02:42:05 +0000
Received: by outflank-mailman (input) for mailman id 557248;
 Fri, 30 Jun 2023 02:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ekiN=CS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qF45D-0001TM-Uz
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 02:42:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0a141dc-16ef-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 04:42:01 +0200 (CEST)
Received: from AM5PR0301CA0034.eurprd03.prod.outlook.com
 (2603:10a6:206:14::47) by DBBPR08MB6315.eurprd08.prod.outlook.com
 (2603:10a6:10:209::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 02:41:58 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::e7) by AM5PR0301CA0034.outlook.office365.com
 (2603:10a6:206:14::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 02:41:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Fri, 30 Jun 2023 02:41:57 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Fri, 30 Jun 2023 02:41:57 +0000
Received: from bf420bec467f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE6C1697-34DC-4A3F-8BB7-FE838A01F355.1; 
 Fri, 30 Jun 2023 02:41:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf420bec467f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Jun 2023 02:41:50 +0000
Received: from DUZPR01CA0204.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::25) by GV2PR08MB8270.eurprd08.prod.outlook.com
 (2603:10a6:150:c1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 02:41:48 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::2) by DUZPR01CA0204.outlook.office365.com
 (2603:10a6:10:4b6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 02:41:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.22 via Frontend Transport; Fri, 30 Jun 2023 02:41:47 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 30 Jun
 2023 02:41:47 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 30 Jun 2023 02:41:44 +0000
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
X-Inumbo-ID: b0a141dc-16ef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xK1rqn9juYvQui7SX4KohYH8BQLQSbt3eja544/6ak=;
 b=COe7QVAM3EO20ZN4mu9V1SQo5n9034JxC9ftZy80SAMDGFqH+BB6AKGtVgCbL7ujb/xyAtSlot+JyGj7timZjdVwdr7gjXuZHAi4fYQcnR9ujXghiKCye0X2YLov6R8jeRLngNUPoKdaHUIuZh4UhY4PGiqHkH4MXyHjGH+a1ec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00fa637748314195
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoQsQ5sJ1HBvjGTuqtKSHDHwj8uKK60r6M2F8tHeZ9sUPfiRyrgSPrcoBkYY2JNWWJdEkLYrpwv2Tg7WdU9BQDwJFCW7SBynG0zmgc3WYS15MpJSfTTGu9/V8NX1keNJUCo6f99dCd18grw9xpHNK2YwkukU5Stj/rHGu/HuHwjbj95Pb5+n5jbVPCYVSCDm7mXVrwCpw5XN1/TWDnVU0LgKAvmbMNZDBJFKd9p4hcrfoZ+zBsUcr450Sy3CoPM/wJ6ZlIZjcPV6vMhArbw0szaqGBRPY20xS9qeFOae1O+pHJ11UX1bfNPwkLNU1uIJj/xCBVXNYoSivH0ccDosyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xK1rqn9juYvQui7SX4KohYH8BQLQSbt3eja544/6ak=;
 b=gpuknF934OqdxeU+UbhxwOLf3xnojMsU63fVjf49O0ztess4zH3sQeeDOTUAOAhtOJCX9S/eqj/JD1x08hyHc3ORBic9Y+7/tqxnb6nfTX4fhNYZ+nbhiQJTJ1/SWKu5s+uJJ+ja89zOx5jrDeEfpz6559v6sfvB6lpscSsoUDYkBAGeUEkEOdBPXI0hfou5I8VedmyWeURp+tsDDr5mARCUWv5UJLP1w5qzURAp8Arc71Qui0YMyP2afRs1lsbliJYAuO7lqjjEanSO6nv3yPreMmH8QFTU8VlFell915wbWmZKGYZU8+JbJAvyNgsZfM5a3Nv9WVJfjwFH4UuflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xK1rqn9juYvQui7SX4KohYH8BQLQSbt3eja544/6ak=;
 b=COe7QVAM3EO20ZN4mu9V1SQo5n9034JxC9ftZy80SAMDGFqH+BB6AKGtVgCbL7ujb/xyAtSlot+JyGj7timZjdVwdr7gjXuZHAi4fYQcnR9ujXghiKCye0X2YLov6R8jeRLngNUPoKdaHUIuZh4UhY4PGiqHkH4MXyHjGH+a1ec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <89b2c0e3-cb0b-13b2-6590-6d9cd9b7f1f4@arm.com>
Date: Fri, 30 Jun 2023 10:41:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/52] xen/mpu: introduce setup_mm_mappings
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-28-Penny.Zheng@arm.com>
 <ba80b734-fb18-49ee-a5b6-1c69ae5a811b@amd.com>
 <3e77ef15-4a34-8246-bf48-d87557690b48@xen.org>
 <6ec57ca4-be55-598d-ce30-a2f86150dfea@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <6ec57ca4-be55-598d-ce30-a2f86150dfea@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT055:EE_|GV2PR08MB8270:EE_|AM7EUR03FT006:EE_|DBBPR08MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f77aa1-f1f5-4cee-a421-08db7913929f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mc/Bd9qCQFgDUdxlSAfThDvHNXJMnr3XYcQfK1IzFvkIY4VFmONkgsKF+2CV085mX37x13XTjhNIr65+h2468z0X5KQ/+0ouwl5IaNVo2nHTgsq6obVKGVQt2K544hnuyrM6je1v1yUDU2bRLFwD2BdNwQE1GEkXN/Xcb9PVVvUGMxLtri0lBi6wn1WkcVY8gyqe8CDYG1md7OlxfkUOUeUOtJ94321uldjppk7UjPqDz3hcSdtzwsFZy2xaGQ3brr2cZ5kE2dty+ScNPUfolaxYaNoJghG5CNgIPMMx+9uvl4V6/CIDCDWEHSFCob3uZt7XNvaSaPVPmy7znue9IvjwTKl8Dm5IM3mArr+r8yRpLwDbwR/1/1w8k04oTwajAPfRn4RQq5CAfOOuVOvbYjiT0snq4RCos1U3yRNKfz52rQeNm7O0bIQuuYr712EDUHdjse6msBESr46vOo44P1qG8iNOXuWPEfYd7ATP9rryAw3XsEZZxUCeLJUcPfKTG/OTZAj6/EFxxy6WzWPSur1adbYrwDmVrL8weSR3rovgJmOxX2DSOyjHkmn5NrhyoMhdSm6LXhZIRnqruwXS9CXsO3ZKJrMHmVRxiVY1yWKUHXjrE6pqkfutL88p7rggA40GYid3l5cw173J+dzq1oscL4ah3ies5owuGq5cAX3W6nPfB9qNgyOCqzkeXoMWMPuHlPNmoERqrFAQ5WwdU7SPlOmkgImrfqYbUUfK0LOSbqhdrD7NYbVPPOJtlSeSZIY3x/lqBG/QQInuI4bOgkxgShOR8kfjpCJnTeWK1YuGkE20ANLReoSKWdceqShESpH+ZIX3EAgBQ3c1oDMDdA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(316002)(40460700003)(186003)(54906003)(16576012)(110136005)(5660300002)(31696002)(44832011)(83380400001)(47076005)(86362001)(36860700001)(478600001)(41300700001)(81166007)(356005)(8676002)(8936002)(82740400003)(82310400005)(40480700001)(426003)(336012)(36756003)(2616005)(26005)(31686004)(70586007)(4326008)(2906002)(70206006)(53546011)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f77b5346-48a1-4569-24fe-08db79138cd9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jSBod9w/cZ+96KXbQ4xbBLM5V1cxJPf9UVslpgD1QrYxg8xgU0NBz5BtNb97BNBRNZzEXyJXMk2r+kkgJ8R4faAx2Q9VHJLSBAcdLOJeTUkOaVvspOck1YJpNMhvzT4CkUrQ4rEZzUPJBAmLN+PSL2TW+ipgCwVie552j6v+P5k5cfNSFPY5R7VljO6h6n7Ng2x0f12ozzDPeE5pr0qHODcMs0ME458C9zAfw4Oro8KNNu9ZCJBW+E4Ja7jTrmigTmwkPNWspWn1dK1osgtW3tL9ui2fRsCVD4Q83+6rdme6k5isVBv/2C+7mBMyuDDnu0Nn8E8xHV0fqx3b+/2eW6g5ttTPGW8xWj0BxrY793NPi+cdscelwA00ymJle/1eiZDOuGVWx3BK3FqoD75x4Pge4p/93ot8Dhy1UTXxDLUaG0QMPLEm6BWsxCevWczEwmN7bU62Kxnv48fU2Zk6ctgsTIYWAWdqGm4OHQ5Q3txCr7T1HsLcIGvpvvkRk1vdIYmss3NuOCJK/VmcwJv2GSersTNSjuH7s40J7Dy1XDrlhHoEhZOykBAIaWOqsIrSB5iWPX23we0y5vBOCT1HxGDWUhKlZPXdzFEbOqU/74ummgdxmnZv9z6t6boe2c9KynvEPhIL4EI9euPk671Il1iMSnsqeNblXuFR/c9x60nBnbh2wnLozelqZyNRHI0/JhUWsflKq72xRPfX7P4gGaKBnoFwmbBv5a0Oe0tNBKSDUmqgebIHfdGJGxXnV+Uz+Oz8O0XwQQD7FrkoCWoPt5MEbjwXjq6BxZQkWNRsg29IG3gVMhrjWmlWJYi4vCqz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(26005)(36860700001)(4326008)(54906003)(110136005)(316002)(16576012)(40480700001)(426003)(336012)(53546011)(40460700003)(44832011)(70586007)(70206006)(47076005)(36756003)(83380400001)(478600001)(5660300002)(186003)(8676002)(31686004)(8936002)(82740400003)(81166007)(2906002)(31696002)(86362001)(41300700001)(82310400005)(2616005)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 02:41:57.3707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f77aa1-f1f5-4cee-a421-08db7913929f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315

Hi,


On 2023/6/29 22:50, Ayan Kumar Halder wrote:
> 
> On 29/06/2023 15:29, Julien Grall wrote:
>> Hi,
>>
>> On 29/06/2023 15:05, Ayan Kumar Halder wrote:
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> Function setup_pagetables is responsible for boot-time pagetable setup
>>>> in MMU system at C world.
>>>> In MPU system, as we have already built up start-of-day Xen MPU memory
>>>> region mapping in assembly boot-time, here we only need to do a few
>>>> memory management data initializtion, including reading the number of
>>>> maximum MPU regions supported by the EL2 MPU, and setting the according
>>>> bitfield for regions enabled in assembly boot-time, in bitmap 
>>>> xen_mpumap_mask.
>>>> This bitmap xen_mpumap_mask is responsible for recording the usage 
>>>> of EL2 MPU
>>>> memory regions.
>>>>
>>>> In order to keep only one codeflow in arm/setup.c, setup_mm_mappings
>>>> , with a more generic name, is introduced to replace setup_pagetables.
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - introduce bitmap xen_mpumap_mask for dynamic allocation on MPU 
>>>> regions
>>>> ---
>>>>   xen/arch/arm/include/asm/arm64/mpu.h     |  1 +
>>>>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +++
>>>>   xen/arch/arm/include/asm/mm.h            |  4 ++--
>>>>   xen/arch/arm/mmu/mm.c                    |  7 +++++-
>>>>   xen/arch/arm/mpu/mm.c                    | 30 
>>>> ++++++++++++++++++++++++
>>>>   xen/arch/arm/setup.c                     |  2 +-
>>>>   6 files changed, 43 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>>> index 6ec2c10b14..407fec66c9 100644
>>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>>> @@ -19,6 +19,7 @@
>>>>    * or it needs adjustment.
>>>>    */
>>>>   #define REGION_UART_SEL            0x07
>>>> +#define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>>>
>>> May be this is simpler to read
>>>
>>> #define MPUIR_REGION_MASK _AC(0xFF, UL)
>>>
>>> Also, you can move it to xen/arch/arm/include/asm/mpu.h as it is 
>>> common between R52 and R82.
>>
>> I would actually prefer if we use GENMASK(...).
>>
>> [...]

Sure, I'll switch to use GENMASK(...).

>>
>>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>>> index fb6bb721b1..e06a6e5810 100644
>>>> --- a/xen/arch/arm/mpu/mm.c
>>>> +++ b/xen/arch/arm/mpu/mm.c
>>>> @@ -20,6 +20,7 @@
>>>>    */
>>>>
>>>>   #include <xen/init.h>
>>>> +#include <xen/mm.h>
>>>>   #include <xen/page-size.h>
>>>>   #include <asm/arm64/mpu.h>
>>>>
>>>> @@ -27,6 +28,35 @@
>>>>   pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>>>>        xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
>>>>
>>>> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
>>>> +uint8_t __ro_after_init max_xen_mpumap;
>>>> +
>>>> +/*
>>>> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory 
>>>> regions.
>>>> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
>>>> + * region 1, ..., and so on.
>>>> + * If a MPU memory region gets enabled, set the according bit to 1.
>>>> + */
>>>> +static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
>>>> +
>>>> +void __init setup_mm_mappings(unsigned long boot_phys_offset)
>>>> +{
>>>> +    unsigned int nr_regions = REGION_UART_SEL, i = 0;
>>>> +
>>>> +    /*
>>>> +     * MPUIR_EL2.Region[0:7] identifies the number of regions 
>>>> supported by
>>>> +     * the EL2 MPU.
>>>> +     */
>>>> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & 
>>>> MPUIR_REGION_MASK);
>>>
>>> NIT:- You may dop "& MPUIR_REGION_MASK " as the other bits are RES0
>>
>> From the Arm Arm (look for the definition of RES0 in the glossary):
>>
>> "
>> To preserve forward compatibility, software:
>> • Must not rely on the bit reading as 0.
>> • Must use an SBZP policy to write to the bit.
>> "
>>
>> So we should not drop "& MPUIR_REGION_MASK".
> 
> Yes, you are correct.
> 
> Penny, please disregard my NIT.
> 
> - Ayan
> 
>>
>> Cheers,
>>

