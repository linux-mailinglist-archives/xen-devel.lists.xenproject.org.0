Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190F740947
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 07:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556310.868740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qENt9-0004PJ-EZ; Wed, 28 Jun 2023 05:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556310.868740; Wed, 28 Jun 2023 05:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qENt9-0004Mh-BC; Wed, 28 Jun 2023 05:38:47 +0000
Received: by outflank-mailman (input) for mailman id 556310;
 Wed, 28 Jun 2023 05:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zt8O=CQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qENt8-0004Mb-8G
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 05:38:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09d47f70-1576-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 07:38:42 +0200 (CEST)
Received: from DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) by DU0PR08MB8323.eurprd08.prod.outlook.com
 (2603:10a6:10:40c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 05:38:33 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::b4) by DUZPR01CA0035.outlook.office365.com
 (2603:10a6:10:468::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.18 via Frontend
 Transport; Wed, 28 Jun 2023 05:38:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.16 via Frontend Transport; Wed, 28 Jun 2023 05:38:33 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Wed, 28 Jun 2023 05:38:32 +0000
Received: from 9fb7a5597d47.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91C9EBAA-8A9B-4B2D-B384-3CD06643AA90.1; 
 Wed, 28 Jun 2023 05:38:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fb7a5597d47.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 05:38:26 +0000
Received: from DUZPR01CA0200.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::10) by DU0PR08MB8661.eurprd08.prod.outlook.com
 (2603:10a6:10:403::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 05:38:22 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::f4) by DUZPR01CA0200.outlook.office365.com
 (2603:10a6:10:4b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.37 via Frontend
 Transport; Wed, 28 Jun 2023 05:38:22 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.18 via Frontend Transport; Wed, 28 Jun 2023 05:38:22 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 28 Jun
 2023 05:38:22 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 28 Jun
 2023 05:38:21 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 28 Jun 2023 05:38:18 +0000
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
X-Inumbo-ID: 09d47f70-1576-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyyXQKfnbwsrbZDjXyXdLte2vnTos8AOFBG83A6bL7U=;
 b=WOge6jjy/QG3GIU81WD12CfLVGwcCh+8sILo5Ua42k6ZVbut/9QP1YXf43OnLTZAhpqorHplApKMzz9ITY8A5R+/rVDdlmuS7057/0YosVDlIXiXF0XbTG1PQA6MBXVnBjBu+Py83J2sApKSpIKhrZI+L9xOTtovhNSENWLbLww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 869535a7e408df9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9EnE0EwieCAyQ2Fy3PcB0oSCuOw9NGINvUxDTyt6ePme7/mCIzp3w9OwwYQNjDMLXJ0uX8fQys3bgmvqxM2spH+ZAYmhbFALn1EiB/7Un0mD964bQMRX9llGl4OdX6mlgw/dw7SAkUfbZNnXLFXbptW4C1zX2cuyoyr+Sx47lXLNCnNq8TfWe0opY1cwbSEXcSoAwm7YSAynrjxzuhYZ90DZ2ezOiYfNtaZiCCNyJ5Hf9bF8K9GWK9tBJfGru8nKcfLaGOURAM119TjKci9CnsSAol6/gouVEQsA/Y53Z4QyDNlSTqCn/HXxUImdeWX9DDghG0wDrrAnAFj+0osfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyyXQKfnbwsrbZDjXyXdLte2vnTos8AOFBG83A6bL7U=;
 b=lmyR/+OBCDAClZags0HxWeg2xWGaXg8Y8XrtWS/winmW8+O+OIHLG3HXpUzQIQ8MgKB510+PkZKXh2QZjOAmlaSx3Amr9k0hfUDnEwnnw7b3gkOjUOaOjZ/woPbTA5NJODwqfcMgwGhBJ7fgusjnr4pQLFGfiDe8HPDpewR+7j/dZxt3p+WMGxjsAkSCVeKN5R2NssgPujQ2PgCqV7mPQqJ0gezWkuVvjWO2dpq84baUJZadOEIhnKSUAYnmb3ySjxqcFCVzf2SWB50XG1grClBSU3VtWGQa+92X9w3aGOQId+Vzyn2w3UZVc2S+19mXQrCi5HoQjJklt77qSSSQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyyXQKfnbwsrbZDjXyXdLte2vnTos8AOFBG83A6bL7U=;
 b=WOge6jjy/QG3GIU81WD12CfLVGwcCh+8sILo5Ua42k6ZVbut/9QP1YXf43OnLTZAhpqorHplApKMzz9ITY8A5R+/rVDdlmuS7057/0YosVDlIXiXF0XbTG1PQA6MBXVnBjBu+Py83J2sApKSpIKhrZI+L9xOTtovhNSENWLbLww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <7d3ff868-60a4-1eab-0b9b-f6ca649cfdeb@arm.com>
Date: Wed, 28 Jun 2023 13:38:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 15/52] xen: make VMAP only support in MMU system
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Chen <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-16-Penny.Zheng@arm.com>
 <654c9925-565a-80d4-5e93-129f6f0f691a@suse.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <654c9925-565a-80d4-5e93-129f6f0f691a@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT014:EE_|DU0PR08MB8661:EE_|DBAEUR03FT028:EE_|DU0PR08MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eae6d90-0adc-44a1-e55e-08db7799e943
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RESHwkRlAVj90Ss/ymFBOboFeEM31QyWOQ1bwc+FUj632Yt6jozQnKw7DP1gLUhM0gy4jkSboyHx+mmqxzvKAC68OsjjcuBme4g17Bo0pGZFpKMD8J1FEbT5Zp9rg8xsgqA6qGfIrAUevKaahLTDxHjb0paywuxtxq+W9Q9/Kq5nqp33DFPbzqmlsvhk0F6NJ0UJ6Kh/1j5BaOnbL74Q7n/oXZxRR0nefAIyrgoSFQ3vuVY7N7Ema3K3uqColUQ6OCrimn2JpXbRJlDfOLBiBTsAmSofIUUhfgriqfcFFjYFVAeddpun74qynRHysWRUbBdEkzZBbRG92QBQWH+ETKcziQa8HTRYpKIJE2BIByS2apQFXxrgMatUoO0Bpf70WodbIkbBtVU+bd5Rpso6NWQ2CUjlMRDHAKhPuP8Cn5UtADCh4RxXRG1RGuhRhlGw8K0ngwnNG5lFP0VaUZBAJHsbzQZJf3NNm7izBHdIt4zETFPLWznF4FDFU8KiPe4izWIgz7Miv8+2Bfau/l0mcapc2CNaOL1bSvdN5EYN2EJ3jo1ZWcdOAzeo0F1neZw3hp2Yc3qYs6kkHb8rIJWw+qS9qWTc0CWO+qfL3ziwTTfmhfmfybb6SirMu5csfAR9MXWa02KX2TjxHypvAwdkD5HDKTwVvJn+i63AA+3jX8CNTc09gg7kXp7hwo53wYwKqA3UU2U14lLtNn62diFRwFXglVYnjdgywFcS7fgCvDK1L6m47rcN66bEeK7GlJasJv8EdvQcS0/uCRNsUfCLqZn5hPM4BR1K4CiAFskVJFz/defxe+ipN5gRzJs9+6zyE6Ay6547rU9TCUWdLO7/uNjb3WYGZI/+Lt1EmexsyHc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(26005)(36756003)(82310400005)(36860700001)(47076005)(54906003)(2616005)(478600001)(336012)(426003)(16576012)(83380400001)(186003)(2906002)(44832011)(70206006)(356005)(8936002)(4326008)(82740400003)(31696002)(5660300002)(40480700001)(70586007)(81166007)(41300700001)(316002)(8676002)(6916009)(40460700003)(86362001)(31686004)(53546011)(3940600001)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8661
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4434cc3e-1674-4648-7a76-08db7799e2fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6UhmWLjWCpnLl1O9nYf7YD+Ir/qvNE6OJXEBDkb/iL+kQWggqA1O9u8dUzlTR4jQn51RRu0FpZBBVMbsKmjr4rScSCmk0hYlt733AhoLIdJF358efcobal9XUI1vXY6B5z9hibUi5Ibrp9adBa8xRblXKHAT/41aGojlTG6EXxAYHxyH/M1Qvx6071xDr+hNr5oVCVbTalzPm9MSX3ORDaNwCScLxkEaMCrTk6+YI15J9IRD0yo/++qXEZTxL0j6SYYVFknUh6Df4fg12Ggf9GTpjLZrfKC8KhlnzyLQfuqFExXXyprBUM5VSMBnCXmAx2OROhriSDzXyuySBMP2l4pqm7fKLbJEyiYTPH1Pei4It1F93SHtW4mItxu5sMf5gz+j0zI5SIc6o56j5m6k4005HqZ8BFV5i/7OyNbX6lFZa2zPKk4GNuM8br2SssANCMvPZwLnA9j2cU2k1cnTp2rQeoazuh+4zJXqmFiPxEQ0bGYdPgDsUvCZL8aTCALsGrlzlGM9YDC0bfeuTpgoX3Ptw3tHSwkKU3wqynw5EgLi7F9kEyVEwZttsF6D/OWq/hjY6QsbIv2Arko+uzCVFv96FYD9Qu4TIr4k9NvhuyclIT4B7HEKuj/vJ4EuUwRxob2HN5lDejJgUFX9RoXZ0EyQLYhrttSFcRitDC3V4VhGiGqjuo9fN2q+pK5DSzEIFTjk5vwF0V4VlcOYu+MOop2L+bf/1TFHJNxYXhYNJZk0FjCMu0OANsMmOTE8Qm36DXIV+VKemTtFAo5FoBSMy1IG//LcyXYWGw02LGq76mkcKpBEdFoANhrO73bV9niGV/NzKpVWeH8DAj5DPn24nQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(316002)(70586007)(4326008)(70206006)(478600001)(36756003)(6862004)(8936002)(5660300002)(8676002)(31686004)(44832011)(40460700003)(36860700001)(31696002)(86362001)(16576012)(40480700001)(54906003)(41300700001)(82310400005)(2906002)(53546011)(426003)(186003)(47076005)(336012)(83380400001)(26005)(82740400003)(81166007)(2616005)(3940600001)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 05:38:33.0143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eae6d90-0adc-44a1-e55e-08db7799e943
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8323

Hi Jan

On 2023/6/26 14:00, Jan Beulich wrote:
> On 26.06.2023 05:34, Penny Zheng wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -27,6 +27,7 @@ config X86
>>   	select HAS_PDX
>>   	select HAS_SCHED_GRANULARITY
>>   	select HAS_UBSAN
>> +	select HAS_VMAP
> 
> With this being unconditional, ...
> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1750,12 +1750,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>           end_boot_allocator();
>>   
>>       system_state = SYS_STATE_boot;
>> +#ifdef CONFIG_HAS_VMAP
>>       /*
>>        * No calls involving ACPI code should go between the setting of
>>        * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
>>        * will break).
>>        */
>>       vm_init();
>> +#endif
> 
> ... there's no need to make this code less readable by adding #ifdef.
> Even for the Arm side I question the #ifdef-ary - it likely would be
> better to have an empty stub in the header for that case.
> 

I may misunderstand what you said in last serie and thought #ifdef-ary 
is preferred compared with inline stubs, referring here to recall
'''
Do you really need this and all other inline stubs? Imo the goal ought
to be to have as few of them as possible: The one above won't be
referenced if you further make LIVEPATCH depend on HAS_VMAP (which I
think you need to do anyway), and the only other call to the function
is visible in context above (i.e. won't be used either when !HAS_VMAP).
In other cases merely having a declaration (but no definition) may be
sufficient, as the compiler may be able to eliminate calls.
'''
So maybe the preferring order is "declaration > empty inline stubs > 
#ifdef-ary" ? As having a declaration is not enough for vm_init()(when
!HAS_VMAP), we provide static inline empty stub here.

>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -15,6 +15,7 @@ config CORE_PARKING
>>   config GRANT_TABLE
>>   	bool "Grant table support" if EXPERT
>>   	default y
>> +	depends on HAS_VMAP
> 
> Looking back at the commit which added use of vmap.h there, I can't
> seem to be bale to spot why it did. Where's the dependency there?

vzalloc() is used in grant_table_init() in xen/common/grantable.c:2023

> And even if there is one, I think you don't want to unconditionally
> turn off a core, guest-visible feature. Instead you would want to
> identify a way to continue to support the feature in perhaps
> slightly less efficient a way.
> 

We have discussed in MPU design, normally, xen guest in MPU system
will be a linux guest with no pv(with CONFIG_XEN=n), so advanced 
features like grant table is in no use there.

>> --- a/xen/common/vmap.c
>> +++ b/xen/common/vmap.c
>> @@ -331,4 +331,11 @@ void vfree(void *va)
>>       while ( (pg = page_list_remove_head(&pg_list)) != NULL )
>>           free_domheap_page(pg);
>>   }
>> +
>> +void iounmap(void __iomem *va)
>> +{
>> +    unsigned long addr = (unsigned long)(void __force *)va;
>> +
>> +    vunmap((void *)(addr & PAGE_MASK));
>> +}
> 
> Why does this move here?

ioremap/iounmap is using vmap, at least in ARM. So for this more
generic interface, I was intending to implement it on MPU system.
In commit "[PATCH v3 19/52] xen/arm: switch to use ioremap_xxx in common 
file", I'm trying to replace all direct vmap interface with ioremap_xxx 
in common files.
Then I, in commit "[PATCH v3 36/52] xen/mpu: implememt ioremap_xxx in 
MPU", will implement MPU version of ioremap_xxx.

> 
>> --- a/xen/include/xen/vmap.h
>> +++ b/xen/include/xen/vmap.h
>> @@ -1,4 +1,4 @@
>> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
>> +#if !defined(__XEN_VMAP_H__) && (defined(VMAP_VIRT_START) || !defined(CONFIG_HAS_VMAP))
>>   #define __XEN_VMAP_H__
>>   
>>   #include <xen/mm-frame.h>
>> @@ -25,17 +25,14 @@ void vfree(void *va);
>>   
>>   void __iomem *ioremap(paddr_t, size_t);
>>   
>> -static inline void iounmap(void __iomem *va)
>> -{
>> -    unsigned long addr = (unsigned long)(void __force *)va;
>> -
>> -    vunmap((void *)(addr & PAGE_MASK));
>> -}
>> +void iounmap(void __iomem *va);
>>   
>>   void *arch_vmap_virt_end(void);
>>   static inline void vm_init(void)
>>   {
>> +#if defined(VMAP_VIRT_START)
>>       vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>> +#endif
>>   }
> 
> Why the (seemingly unrelated) #ifdef-ary here? You've eliminated
> the problematic caller already. Didn't you mean to add wider scope
> #ifdef CONFIG_HAS_VMAP to this header?
> 

plz correct me if I'm wrong, in MPU system with !HAS_VMAP, if we don't
#ifdef-ary here, we will have the following compilation error, I guess
it's because that vm_init() is a static inline stub:
```
./include/xen/vmap.h: In function ‘vm_init’:
./include/xen/vmap.h:33:40: error: ‘VMAP_VIRT_START’ undeclared (first 
use in this function); did you mean ‘XEN_VIRT_START’?
    33 |     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, 
arch_vmap_virt_end());
       |                                        ^~~~~~~~~~~~~~~
       |                                        XEN_VIRT_START
```

> Jan
> 

