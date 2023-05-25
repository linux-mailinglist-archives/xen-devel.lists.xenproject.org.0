Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E467107EE
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539401.840221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26iW-0001Uc-Iu; Thu, 25 May 2023 08:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539401.840221; Thu, 25 May 2023 08:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26iW-0001Rn-Fa; Thu, 25 May 2023 08:53:04 +0000
Received: by outflank-mailman (input) for mailman id 539401;
 Thu, 25 May 2023 08:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UGVO=BO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q26iU-0001Rc-Ac
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:53:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a3bf825-fad9-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:52:56 +0200 (CEST)
Received: from MW2PR16CA0046.namprd16.prod.outlook.com (2603:10b6:907:1::23)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 08:52:53 +0000
Received: from CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::39) by MW2PR16CA0046.outlook.office365.com
 (2603:10b6:907:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 08:52:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT099.mail.protection.outlook.com (10.13.175.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.30 via Frontend Transport; Thu, 25 May 2023 08:52:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 03:52:51 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 03:52:50 -0500
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
X-Inumbo-ID: 8a3bf825-fad9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnQaQTk26mH33VBGktPes/YsmpC9umrQSM4M545Lac4YOVpjhF5jH3DFuiO0SSSgzF4Eve0J2MZnDkMOaZ/NQlr4SgbbGPWKLWQ2qMg6WTFqdRo1xMGgDdixZmEEbnk4j5UIN/vW6yN2rpXYlbbAFeP864OP1LB7BqoL7ADJhan3CbYM3wxQge27WGej2FcY7/m8F8EhI/C3ihjV1fXH6rjf+QC7U0L3FHq9zgpc8VG3MYidwFkuQALSBwrMKpSW4ZqkW5dc3CRCnuSiGgWpDNAKktd1O6WETS8oHW7XOFx3my1jYbtP2ale6pAwgnedPxzQ0ETTAz+xLw3RoaMoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OyPcgKZoFP8YKYHn+5Au+VhrdJACiIX6cyKBpe3eDc=;
 b=O1yjYBZASixDvI/iS36UpC0O1mRGYmnR6GshlLj3Zy0KjYLzvDKIiDB2BECwFIQTUN5Nv4dcYJwUyGK7Tf9D3g1KX/PFD7MvtWZ30RM19EsHvuFEjJmV0oJTOqGho0QzZgNf2wUph1IIY8gDNOYudUW9IwjhfHeSToiZb27FGrkR2/0gC1jsfi64B6Ehuv1oP3bmBUAlOuw2JYMLWxozR21d1MJMZ/oIaApnlyTwMvWdwo9rSO5Raj8EiQMuq5zp60e0BmQts+iEQWVGBQw+KJ67KeSlSzpYK74bXChWqAqyYYq+nvzq5E6AWKhv00Fh6AT+ENB7eJla0CquoKhLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OyPcgKZoFP8YKYHn+5Au+VhrdJACiIX6cyKBpe3eDc=;
 b=FlCtNr2Ff4cmhdvhcKSf5bPqlse/fJsXwashj53aX1j6hJVQzjCjod4JVaFdjipTAqlVeAKBkGoyKAaTHbie9LIwPmHTQ+4aUXJUpesUgefiluRQWMejraR5mSu/KUPPiVm0s8D0VuaP+qtTfi4lYp0iaH0JgzP/febz98bM94k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3dcbec7c-87d2-31cc-ad0f-d8ff4c8baeae@amd.com>
Date: Thu, 25 May 2023 10:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-12-luca.fancellu@arm.com>
 <D01601D3-8215-46A0-8539-CF126A5FE11F@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D01601D3-8215-46A0-8539-CF126A5FE11F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT099:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac61525-2327-470e-9c9d-08db5cfd6d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aELOJXecHJW9xH4lHQV9JzXEKa0OljZpSubEN6ppA5T2CG9o8Bu67ypP82UmIfJZDE1nnGFW+Ll/bY19PC1PPGCghvSQg82Nfr+/euwzo8LVcXGblIS6ZXFZC4+yjlsDJdkgsHSDpQBFWKDas+5sv1FoAfjoI+A/BFutPC3TilKbd1z4P6nLB+Uh/oC3YJ/VqRnHmxzjqkzbhN+1P9QegC2voBUBIzEHLRSCRgT3m3W76OlbqAq5GMC04j/Tt+Qq9S/Z2Ks7lX4mK1fz2yLAkYLftD+0HHlGAADsC5xaG2l5ASQ5xpE7WJzvCwIeM0xuKkCaEJX8pSJ3XHqGflrkNWcGOnQAxJpapssEHpxcfT2pXMbrlEosjzKzYo1lTZtlvCutqwIQ/EHtPdn6kmYtGmV2ls5q+PcfWo7QrdZQY/Uu57MdjvPCMzEI2uhQgKlsdOdJ2SEkJECkEotgpaevoNvx86ZrPn56b6kTVPmqiW0H0X1nDp5TDhFXBg2Vuib2zEQNhGgprgtxEs5fIitznARnhht+NHzej2fTM6Apsw4iBY/35/zmFFrzSEUTF89sAYnL/9+aTF9cv4dyqYh8KQ5f9i/VKYA2kDttAsbzXeScFj9RMP6PfKB6pkZp+K1D2YANT66WgzV+HuDFpwCnJtqFHHnyvmo8C4Lv82JUe1ayMdMtILtetsK4kKWcQNWTqRXsMoKobnZwUhg+gfibZ056ECaxv7RfXjO0wVjuKQeL6t4G1uFqmTQVEX00B8xSZrcQios7Mz2/BwzZ+95giA34wjGZHLccS60DlHWfKbyea0bdE/o7Jc2sv05LP8xKpn8+2tj0NviIxpeNC5SeTg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(478600001)(26005)(186003)(53546011)(70586007)(70206006)(110136005)(54906003)(16576012)(316002)(31686004)(40460700003)(36860700001)(2616005)(6666004)(83380400001)(426003)(47076005)(336012)(41300700001)(31696002)(82310400005)(81166007)(8936002)(356005)(44832011)(2906002)(86362001)(40480700001)(82740400003)(5660300002)(36756003)(8676002)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:52:52.9706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac61525-2327-470e-9c9d-08db5cfd6d2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384

Hi Luca,

Sorry for jumping into this but I just wanted to read the dt binding doc and spotted one thing by accident.

On 24/05/2023 17:20, Bertrand Marquis wrote:
> 
> 
> Hi Luca,
> 
>> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> Add a device tree property in the dom0less domU configuration
>> to enable the guest to use SVE.
>>
>> Update documentation.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

(...)
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 9202a96d9c28..ba4fe9e165ee 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -4008,6 +4008,34 @@ void __init create_domUs(void)
>>             d_cfg.max_maptrack_frames = val;
>>         }
>>
>> +        if ( dt_get_property(node, "sve", &val) )
>> +        {
>> +#ifdef CONFIG_ARM64_SVE
>> +            unsigned int sve_vl_bits;
>> +            bool ret = false;
>> +
>> +            if ( !val )
>> +            {
>> +                /* Property found with no value, means max HW VL supported */
>> +                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
>> +            }
>> +            else
>> +            {
>> +                if ( dt_property_read_u32(node, "sve", &val) )
>> +                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
>> +                else
>> +                    panic("Error reading 'sve' property");
Both here and ...

>> +            }
>> +
>> +            if ( ret )
>> +                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
>> +            else
>> +                panic("SVE vector length error\n");
>> +#else
>> +            panic("'sve' property found, but CONFIG_ARM64_SVE not selected");
here you are missing \n at the end of string. If you take a look at panic() implementation,
new line char is not added so in your case it would result in an ugly formatted panic message.

~Michal

