Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2D79A77C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599296.934642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfedi-0007tq-0a; Mon, 11 Sep 2023 10:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599296.934642; Mon, 11 Sep 2023 10:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfedh-0007q7-Tx; Mon, 11 Sep 2023 10:59:33 +0000
Received: by outflank-mailman (input) for mailman id 599296;
 Mon, 11 Sep 2023 10:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfedg-0007mO-9M
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:59:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483af6d4-5092-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 12:59:30 +0200 (CEST)
Received: from DU6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::23)
 by DB8PR08MB5514.eurprd08.prod.outlook.com (2603:10a6:10:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 10:59:23 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:540:cafe::b) by DU6P191CA0019.outlook.office365.com
 (2603:10a6:10:540::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 10:59:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 10:59:22 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 11 Sep 2023 10:59:22 +0000
Received: from a251a66c4acf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5BF2CDD-9281-4521-8961-8158D1A58013.1; 
 Mon, 11 Sep 2023 10:39:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a251a66c4acf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Sep 2023 10:39:35 +0000
Received: from AM5PR0601CA0083.eurprd06.prod.outlook.com (2603:10a6:206::48)
 by PR3PR08MB5562.eurprd08.prod.outlook.com (2603:10a6:102:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 10:39:30 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::55) by AM5PR0601CA0083.outlook.office365.com
 (2603:10a6:206::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 10:39:29 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 10:39:29 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 10:39:23 +0000
Received: from [10.169.172.145] (10.169.172.145) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 10:39:20 +0000
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
X-Inumbo-ID: 483af6d4-5092-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJNu8O7FMsLnXn028+FCz/H6/lLmqhK1lHr+ye0OwDQ=;
 b=6z4lJY/rLTiSugX/RQQ8nMUsvgiesRc6+xvCuQNE4PMjlqzlxE7GUk8XWpWYrpE0pMi1cZ/Kr3Ds0fWWjMV8C3KCUpB2KSaclUnNHOuInV0dbzPRgQBo8vXwmKuE6CMNGu6l/twOl9GPQffWY2Q8QRHq83+1CTSJysAdNigW8LA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 358bc5f41c65dcef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq1PBFcCgenWxfOKI/EUiE3aKIDUWtsidLCPPRcE2uzn29t8lBRe30mxnKne/+CDjzbjaSeKmPuy4NpkNnutwnh46XR4upwTE74yc4oeI+3/MxguDyTZp3Myt6+IpUSXzvQKTJF8axC2JVqa0kP2CAVlQGxZsjNySpPOXsHTHoRgV/7FzlpzuZ0uurbwzOrGSSpKVf+rNLK5fkac57Fdohbo4LYhBvVLq5EkHHOGJ3yf6oX3axKiyr8OLs0l2Cr+VJsJXFFhl55CNPOI5PHAFS5byRO5T9XvGQ5ZK17baaIWKaEvLKq0cEztOZ/Y9IvzLwJfb5ePuK+DBIhCLrKWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJNu8O7FMsLnXn028+FCz/H6/lLmqhK1lHr+ye0OwDQ=;
 b=AxZIPGFvbc6u0rb8zNVgzT9Kx+0kodS+wZ1tBgO+KLtG+jJEcR1UiiI7lPnxRloPD5mIpoyHNAOVshxj40R+EgJU3NTkrhCo+ZyKKjzVucAHAKZA22lHG90kQJUMlkiVGUUUS3kTxP/59+bzQhXjWtS3Df+n9/VFhHugb2JX6jspO63Kt7blqiymxUfJad4TC6JUutVlpOtlal/UislDHqq75czMfYohgKwLnVy8P5/g9rUSoFrYA4I7hsPAfusJhYst+WcVBqbXwMN/7RqolGfrNZm6O1/Sny+C0XF0vxR5ekgDTK6EobnLEdn2m8JoIpoYASimlYEdvfPNmscAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJNu8O7FMsLnXn028+FCz/H6/lLmqhK1lHr+ye0OwDQ=;
 b=6z4lJY/rLTiSugX/RQQ8nMUsvgiesRc6+xvCuQNE4PMjlqzlxE7GUk8XWpWYrpE0pMi1cZ/Kr3Ds0fWWjMV8C3KCUpB2KSaclUnNHOuInV0dbzPRgQBo8vXwmKuE6CMNGu6l/twOl9GPQffWY2Q8QRHq83+1CTSJysAdNigW8LA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <61810692-e44d-7548-4734-b96c3b79b437@arm.com>
Date: Mon, 11 Sep 2023 18:39:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 09/10] xen/arm: fix duplicate /reserved-memory node in
 Dom0
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <20230911040442.2541398-10-Penny.Zheng@arm.com>
 <5212bdc4-9bce-fc5d-8a47-ae5e5fef37e3@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <5212bdc4-9bce-fc5d-8a47-ae5e5fef37e3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT028:EE_|PR3PR08MB5562:EE_|DBAEUR03FT025:EE_|DB8PR08MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 28521c90-53c4-488c-b8e8-08dbb2b627fa
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FTqVds2lJHB9Rk9Du5YqYHWC1IuE1OK/a61510arBd7duZHtumjRnPNVwyABVVq7SeVawVxYsK70vEXZreLev8sbMfX+KwPsKWOEkyZKC78QoQ5CRQDkN2hO8BbbT6urcVmTgNmJFiDRF1YuWiIkIpZQYfokohncQM5q9FH4eC+/mU0tI2cvUms+zwNld9WTsCd7c/MyRb9N3gezGjblnEylz4mB2zdjP24mSEZBlRitBFHs6C8mQ3VIvPdqDdkRIb0bLVMXKrHwSoEv38PV80IqVYqAI7vM0W+Y8ctarjPUOqHiFafWJT/nybwttz6EMc/nK1nxHUOy+ECvFEHAo/nP4ZKkjfEjNwIt+ZOAltvKXLHmSAxuAMin0SE+0Oif3J1YNZwmigA1VmvnnB03xYI7Fh9UmfENgJyIge/9Vlz7lDuZuap2PI/VN0FlaccCGxqkRKYgvPoHyX2Em7SOXnYJgg+aQEddjwi/Uue48pepf1XJzHDwqvDciHQ7JdUyJ3OUWjqrS2vp5EJ1pLnotUqjXeka07FdS/KejAUcChc+o1UlWH8Rk+UHEIeZzHzXOYPC74Sn35SDj58JliwT04A3zyVTG/2FqA7Tdfpin7SFPocNp0ETGUZfYknWxmBJIqoYOZ+PuMMjS/Lf778fCcCA0Ec/O/BML84QPT4TFc89Rn1+vwbdUgiqZKW8PKXj/gYuNUA6AvlcxV/rhikYFuLgJ6y7SHRA9o1dX9LHSKOl9h+ochDb8iCcgRTTot+DeWrh7hPR75UvWhkxB0d05xPLqXBlScqD3sVADEmRaK9lOP+iKImlIUQDU7lpMUduUjFze2cH5wUTeLUPoLxJTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39850400004)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(2906002)(44832011)(26005)(40480700001)(336012)(426003)(16576012)(41300700001)(316002)(54906003)(70206006)(70586007)(110136005)(478600001)(5660300002)(4326008)(8676002)(8936002)(31686004)(53546011)(36756003)(36860700001)(47076005)(2616005)(83380400001)(81166007)(31696002)(86362001)(82740400003)(356005)(3940600001)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5562
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5d6b4d4-bf80-48b3-2de4-08dbb2b360fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mRMIX6alQbe6tb50OmHajwU57GhxE/ZhZZmULIUgv8RfdsGlHBh7l+AwCezE12ZjD8Pvot10nZJxR0lHEAMwXn2WRxfQ7YFjZXDsqFJMQdpFBOdo2nbzEojstWk/9+m2lIhfBKROc12xvDiCLkWHIa+dJRTGJ1emk2tTfzdfvRK7i7B5xYfkowTuJnTFw9GQwFK1JVzXGRZHD2hMtppg4LKcKiJIkQWIXMfVRoJqLRK4eqG/SiwFEjI1yEXDRUmC4JRT/zwAt5sv0HU0Qp7BdYiGhLLEF9PY2X/x9v30euwjaIz8AtT7vHaCYG7/QIBnMSzDxrI3qjJ/Us789dAlQzZOu0evLtPYTYMBY21OnkTdEvmGSBX4om1fzFDFyMudugaVm6zFTUJhOS8jXSUcDQwhqyb2JmffMs+aT1aJAwwXWAR1DbUWjvimcP/Ajh1cr4Ov/caAUcdvLoHYvMbQLk40KX7nOBPX8qIui/XM0Z9zvxzuGwyw/R6w+Ln0k20FkWrCtLfAeN1c9AyKB3Roz6BtCRFzY2sYuHyn3wZWHG6Sj8EydmaEGZk/XXe5SZ/OD1WzZd7OPRn+Pedk1kCpn0LVjxZSQuMAzBnUFDQhkbSuXi7gGzoW3nKo59Ep7DrYOB4Oh0/lfRpzGuARfRoASXxcz7w9m9iIL1ELS+ZioX/qwPGcV4xg9nTzBXX0Uvouy+ByFaeDVig965qQf++wBOTfZrcNNjkrJCbEkHpqjMu1SxZGJUd5O9al99ao+BKJF4Vfzuje4mYikFIznb2o3pXeYpLjmTwsPiuIXo/sGF8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(376002)(396003)(346002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(8676002)(4326008)(8936002)(47076005)(83380400001)(36860700001)(478600001)(316002)(110136005)(54906003)(70206006)(70586007)(16576012)(40480700001)(107886003)(2616005)(336012)(426003)(26005)(41300700001)(53546011)(2906002)(82740400003)(5660300002)(81166007)(44832011)(31696002)(36756003)(86362001)(31686004)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:59:22.7123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28521c90-53c4-488c-b8e8-08dbb2b627fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5514

Hi Michal

On 2023/9/11 17:40, Michal Orzel wrote:
> Hi Penny,
> 
> On 11/09/2023 06:04, Penny Zheng wrote:
>>
>>
>> In case there is a /reserved-memory node already present in the host dtb,
>> current Xen codes would create yet another /reserved-memory node specially
> s/codes/code/
> 
>> for the static shm in Dom0 Device Tree.
>>
>> Xen will use write_properties() to copy the reserved memory nodes from host dtb
>> to Dom0 FDT, so we want to insert the shm node along with the copying.
>> And avoiding duplication, we add a checking before make_resv_memory_node().
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>
>> ---
>> v3 -> v4:
>> new commit
>> ---
>>   xen/arch/arm/domain_build.c       | 31 ++++++++++++++++++++++++++++---
>>   xen/arch/arm/include/asm/kernel.h |  2 ++
>>   2 files changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 02d903be78..dad234e4b5 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1401,6 +1401,10 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>>       return fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
>>   }
>>
>> +static int __init make_shm_memory_node(const struct domain *d,
>> +                                       void *fdt,
>> +                                       int addrcells, int sizecells,
>> +                                       const struct kernel_info *kinfo);
>>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>                                      const struct dt_device_node *node)
>>   {
>> @@ -1549,6 +1553,23 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>           }
>>       }
>>
>> +    if ( dt_node_path_is_equal(node, "/reserved-memory") )
>> +    {
>> +        kinfo->resv_mem = true;
> kinfo structure is used to store per-domain parameters and presence of reserved memory in host dtb
> does not fit into this. Moreover, there is no need to introduce yet another flag for that given
> that in other parts of the code in Xen we use bootinfo.reserved_mem.nr_banks to check if there are
> reserved regions.
> 
>> +
>> +        /* shared memory provided. */
>> +        if ( kinfo->shminfo.nr_banks != 0 )
>> +        {
>> +            uint32_t addrcells = dt_n_addr_cells(node),
>> +                     sizecells = dt_n_size_cells(node);
>> +
>> +            res = make_shm_memory_node(d, kinfo->fdt,
>> +                                       addrcells, sizecells, kinfo);
> I haven't yet looked at previous patches but does it make sense to request passing both kinfo->fdt and kinfo?
> IMO, the latter would be sufficient. This would apply to other functions you modified.
> 

yes, the latter would be sufficient. I'll fix it in next version.


>> +            if ( res )
>> +                return res;
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>>
>> @@ -2856,9 +2877,13 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>>                   return res;
>>           }
>>
>> -        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>> -        if ( res )
>> -            return res;
>> +        /* Avoid duplicate /reserved-memory nodes in Device Tree */
>> +        if ( !kinfo->resv_mem )
> No need for a new flag as mentioned above. Just before this line of code there is a check:
> if ( bootinfo.reserved_mem.nr_banks > 0 )
> {
>      res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
>                              &bootinfo.reserved_mem);
>      if ( res )
>          return res;
> }
> so you can just append the following:
> else
> {
>      res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>      if ( res )
>          return res;
> }
> to achieve the same without a need for a new flag.


Right now, bootinfo.reserved_mem is not only containing reserved regions 
described in host FDT /reserved-memory, but also the reserved ones for 
domain only, like in xen,static-mem = <xxx>.
So simply with non-zero bootinfo.reserved_mem.nr_banks, we couldn't tell
whether we had a /reserved-memory node in host FDT.

I agree that kinfo is not a good place to store whether host FDT has a
/reserved-memory node. Maybe bootinfo.has_resv_memory_node?

> 
> ~Michal

