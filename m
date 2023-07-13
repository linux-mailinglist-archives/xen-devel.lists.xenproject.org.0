Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B17516A7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 05:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562911.879676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJmku-000278-B8; Thu, 13 Jul 2023 03:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562911.879676; Thu, 13 Jul 2023 03:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJmku-00024c-5p; Thu, 13 Jul 2023 03:12:36 +0000
Received: by outflank-mailman (input) for mailman id 562911;
 Thu, 13 Jul 2023 03:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMFS=C7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qJmks-00024W-9k
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 03:12:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1adfc520-212b-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 05:12:32 +0200 (CEST)
Received: from DUZPR01CA0156.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::19) by AS2PR08MB9296.eurprd08.prod.outlook.com
 (2603:10a6:20b:598::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 03:12:28 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::1) by DUZPR01CA0156.outlook.office365.com
 (2603:10a6:10:4bd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 03:12:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 03:12:27 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Thu, 13 Jul 2023 03:12:27 +0000
Received: from db0c4e033e20.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D15B24A-8667-4919-B0B9-90AB78886CD1.1; 
 Thu, 13 Jul 2023 03:12:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db0c4e033e20.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jul 2023 03:12:20 +0000
Received: from DB9PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:10:1d9::17)
 by PA4PR08MB7388.eurprd08.prod.outlook.com (2603:10a6:102:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 03:12:17 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::27) by DB9PR02CA0012.outlook.office365.com
 (2603:10a6:10:1d9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 03:12:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Thu, 13 Jul 2023 03:12:16 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 03:12:15 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 03:12:15 +0000
Received: from [10.169.188.57] (10.169.188.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 13 Jul 2023 03:12:13 +0000
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
X-Inumbo-ID: 1adfc520-212b-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2LBhkWC8DU0jJ4oQ/ZRvKCgY3x7Z6by8dwwQ3Z8Ar8=;
 b=5Ezl/6jEXEN596bqwTLYwgMo+BaTaNvk39w6xxFUoAezrfk6nidJvJG0LyO97S792cpi9LSQS0ScWeTQZgAWh84mpenE2P4dmX8OK2hFCcsk8g1DbjBz3CF2KIS+eUa7Qo865lv7wNg2+drHzJ0ek6V/CD+J9wGiBTXG7PW2FLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad16a113698f3ae8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BekIXAesnkW/CR+DT0RZ+BteU/jPzv8YTvbCgt9SmLDdpTSAiQByarHyQWnvXVscKrC7LrgH2JgMpzegJHkuIt7r9jLeXUHhfLqwaCEYS5XC1sq6sV3HM6LYPu1IztiqfL507WIj/jYr0+8jb0AXQGm40YYoigOLKDES86heYYag5cNkPIO3W5928pxMnldnXKHOtrLcR9j5SB5CWFBYiNntS6vkZwE/mrvgRCJpUwW1tAEkwLfQA9w8HgTtnAU7nl4qhGSFMX97ud0GtLmiRxUTpTXx5XY6cuHz/WRtoT6pqi73PdF5fqSUO5L1SZuMxuysKcQBBRinCehLcW9+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2LBhkWC8DU0jJ4oQ/ZRvKCgY3x7Z6by8dwwQ3Z8Ar8=;
 b=lc0fu0LnhSSdSY0g0W+jPPQUsjdJREGxtXIsxVICnIjnNphz0NpGJTOaAl7mEhZNPMkOMl1uyhv2WIcYd8TvWyBsJ2eneVC/w2hxzpF+/7E5p29BWOXp6UhhgyG+3GppX695wNEaaXgTGVTUDAU8sLfkIuniNcmMnstuKCppviHsQil+KkF9yYUXLagg30t6ABoDCsuDjQh1EzcBGEmkZL6SdT4zkrrRm0IVu1bwXstfAa0ma/zZrBol5czrnZVp6HnsJolhPjSoYaUsJP/j/S8TqkvgJiHXoYpaB46zC2BBTI3yJecfzKSZuHqLuwhVLW2pP6RgrfDD1dGhKBbzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2LBhkWC8DU0jJ4oQ/ZRvKCgY3x7Z6by8dwwQ3Z8Ar8=;
 b=5Ezl/6jEXEN596bqwTLYwgMo+BaTaNvk39w6xxFUoAezrfk6nidJvJG0LyO97S792cpi9LSQS0ScWeTQZgAWh84mpenE2P4dmX8OK2hFCcsk8g1DbjBz3CF2KIS+eUa7Qo865lv7wNg2+drHzJ0ek6V/CD+J9wGiBTXG7PW2FLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <23275eba-3c1e-a51c-b248-7f7625671750@arm.com>
Date: Thu, 13 Jul 2023 11:12:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
 <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
 <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
 <baed1eac-0f9a-a85a-d4cc-feef772870db@xen.org>
 <c070054d-3f92-ecd2-4f04-a97c5a84d3d7@amd.com>
 <c05ac82d-f9bb-5d52-8b7d-df44d9043a66@xen.org>
 <bd6d9646-f0a8-5341-b4ce-7eca1d6153dc@arm.com>
 <93e0e360-d7f2-1987-a0a6-73420c55afcd@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <93e0e360-d7f2-1987-a0a6-73420c55afcd@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT052:EE_|PA4PR08MB7388:EE_|DBAEUR03FT013:EE_|AS2PR08MB9296:EE_
X-MS-Office365-Filtering-Correlation-Id: 266b0abf-7a20-48d0-f0fa-08db834efccf
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tauawAB44GxuGLAVhROMmhtiPsKDxu2VMI3BuIXHnP45ts+X9mEWUIcuhdP17wV/5bNr/JIEopwkxc3W4w/WTP+Lajd8PJalSiBcGQHfPIIsDPPIj2N4FUFVMawohH5S6wg/0GUmlMtJy21R66ZsiSsPVWw3dvhhqiudhohHf6EQXID5YuEIPj5TRR7CELL4Tq4Wxd7HQiWx3wdS8A5dBwpywmw7jlGdBp/pYN4hdNFk8qI7YCQ1KngHLLy71xl2GC4TeLnNCDahhwTuxIxCVYmS+nYzOFvZ3PzWCquVyH8t2fnuoSavhPzJN+vD9bsCXEZ/SmiNDeOoKFLhNUdMQNhxr6aak19qN6/hBx9xidqO+dYtmSiqCVVe/nBH1Q3CpSPtpY9cyRFScw1k4lrBCIheUTG/HZoi4ZKnBlKiDUrCbew72LF5cqpGpI7ijD3OtIhNPK1xjXk4L+HlxB5YCos0pCZl97kwa7TYmSgtoloQ2x5QmzJ33Ezyz6emGKUWjrwoymz4pN292MP46R/17cosmSpmgtDietH9XHu4jNAK9SsniUl4TPVWbD7dGwU96Jqde7zRwG5/NBeb7QdJU0fTDteviXs/iOLzsI5r/cJQBq2EVNGiNLkeaxz0CW4pbikJEzqpzzZiRnrksF+viNkiTp7xfk2NORCSxeSXPZ+76PkzUmqc6gczeKOiyDaKtGG37gKEbtnd0GRPmBMPe8f01IO0tMMMycE044+AMxG4uqCLlRQ+bmZ/+U8vxu1MQyU4+6/uBXDnTNb2Qd9xB0K/EfifoOpOOfqbGIQTY3O4RjRxbmlgWfLhvllHk+lZynCw9Rnvv4HdNeUXtu5CXvxL9moXYMgHzCdyTPc++L8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(36860700001)(36756003)(31696002)(86362001)(356005)(81166007)(82740400003)(82310400005)(40460700003)(478600001)(110136005)(16576012)(54906003)(8676002)(8936002)(44832011)(5660300002)(316002)(70206006)(70586007)(2906002)(4326008)(41300700001)(31686004)(2616005)(83380400001)(47076005)(336012)(426003)(53546011)(26005)(186003)(21314003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7388
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca91b9fc-3e67-474b-db15-08db834ef62d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cx1rJkn2cQQrWjtdSinhpdN7ni1hzw+PXzslphOqzhjOzKjUIsINy5H2uhLTwu/t4DBU7hLiWk6x6CJ47EPy8Aox+G86Y4Zi90SFAYELW1f/Qsti3GJ+1WHVtHm734CUGRrLIQun3adQDBVhmL5EKCv5tcTNQJjUNuqhZXTYoxH1P9cXblXSKwOF0TmcJCwEm2JGLzXSVbycvXJoqlCBjAddloXc6pX2A9a6dWVrXQqU9e1xCTSPPhoS3GydkCLRI/KgRSF4rZwg4+EvpGvYC55+UxzUqvulrmnVA+03pjQNsApipchpWpFNKyQWkILcbK2y9mggYgoH/Pto8+P/AckQti0jiWOyYOUHu1gCjyjVnsEspmr8PNThFP4njAtb2SwxikxeMYvL3WM1Cx0b7nr39P570025fSGsjDosGamsucc6LqKGMRcnoN/KjUJqI4Bm0ox3q8NnpvxFTF4k9Gjmia1FoYySkQ7gVSsAmT9tXghbGTnKql6lnfN/EF0ZLA6vkd0hIY5CJZMA/bBgzkI/SC7+e1zLugVvPtiJRM0jGbF5a1M4en6vLb6Nsqdxr49oiGGcJpf7iCa5TSHUpEfvXpvRGyI1ap0QnnOIS7BjDCr/6fmpNKZ9dp93WB8N0J5mh8lwP2hn6rzvzxDMAigWpfOcCqpt+UYUzJGrLSwvmLigRcoNglbwKpjYHHjv8/Ufny+8rao2dA+ETTF9+VrNm7dHRAhbMDCVwiga6zXGf/m26IlJS+BEibuXMyQBwBlyPbUEaaD/HyNVWd3DpmGO9KbAD34VJI0YPvvSwcPr1GYRCL5lZ2R0zo9O4ktAkSX77KbZwqRZLQ+LmAGOEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(44832011)(4326008)(70586007)(70206006)(41300700001)(316002)(2906002)(478600001)(16576012)(5660300002)(8936002)(8676002)(31686004)(110136005)(54906003)(36860700001)(40460700003)(26005)(40480700001)(107886003)(186003)(53546011)(36756003)(426003)(336012)(83380400001)(47076005)(81166007)(82740400003)(2616005)(82310400005)(86362001)(31696002)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 03:12:27.5230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 266b0abf-7a20-48d0-f0fa-08db834efccf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9296

Hi Julien

On 2023/7/3 17:20, Julien Grall wrote:
> Hi,
> 
> On 03/07/2023 06:12, Penny Zheng wrote:
>> Hi,
>>
>>
>> On 2023/6/30 23:02, Julien Grall wrote:
>>> Hi,
>>>
>>> On 30/06/2023 15:42, Ayan Kumar Halder wrote:
>>>> Hi Julien,
>>>>
>>>> On 30/06/2023 12:22, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 30/06/2023 11:49, Ayan Kumar Halder wrote:
>>>>>>
>>>>>> On 30/06/2023 05:07, Penny Zheng wrote:
>>>>>>> Hi,
>>>>>> Hi Penny,
>>>>>>>
>>>>>>>
>>>>>>> On 2023/6/30 01:22, Ayan Kumar Halder wrote:
>>>>>>>>
>>>>>>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>>>>>>> CAUTION: This message has originated from an External Source. 
>>>>>>>>> Please use proper judgment and caution when opening 
>>>>>>>>> attachments, clicking links, or responding to this email.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> In MPU system, MPU memory region is always mapped PAGE_ALIGN, 
>>>>>>>>> so in order to
>>>>>>>>> not access unexpected memory area, dtb section in xen.lds.S 
>>>>>>>>> should be made
>>>>>>>>> page-aligned too.
>>>>>>>>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make 
>>>>>>>>> it happen.
>>>>>>>>>
>>>>>>>>> In this commit, we map early FDT with a transient MPU memory 
>>>>>>>>> region, as
>>>>>>>>> it will be relocated into heap and unmapped at the end of boot.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>>>>>> ---
>>>>>>>>> v3:
>>>>>>>>> - map the first 2MB. Check the size and then re-map with an 
>>>>>>>>> extra 2MB if needed
>>>>>>>>> ---
>>>>>>>>>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>>>>>>>>>   xen/arch/arm/include/asm/page.h      |  5 +++++
>>>>>>>>>   xen/arch/arm/mm.c                    | 26 
>>>>>>>>> ++++++++++++++++++++------
>>>>>>>>>   xen/arch/arm/mpu/mm.c                |  1 +
>>>>>>>>>   xen/arch/arm/xen.lds.S               |  5 ++++-
>>>>>>>>>   5 files changed, 32 insertions(+), 8 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>>>>>>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>>>>>>>> index a6b07bab02..715ea69884 100644
>>>>>>>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>>>>>>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>>>>>>>> @@ -72,7 +72,8 @@ typedef union {
>>>>>>>>>           unsigned long ns:1;     /* Not-Secure */
>>>>>>>>>           unsigned long res:1;    /* Reserved 0 by hardware */
>>>>>>>>>           unsigned long limit:42; /* Limit Address */
>>>>>>>>> -        unsigned long pad:16;
>>>>>>>>> +        unsigned long pad:15;
>>>>>>>>> +        unsigned long tran:1;   /* Transient region */
>>>>>>>>>       } reg;
>>>>>>>>>       uint64_t bits;
>>>>>>>>>   } prlar_t;
>>>>>>>>> diff --git a/xen/arch/arm/include/asm/page.h 
>>>>>>>>> b/xen/arch/arm/include/asm/page.h
>>>>>>>>> index 85ecd5e4de..a434e2205a 100644
>>>>>>>>> --- a/xen/arch/arm/include/asm/page.h
>>>>>>>>> +++ b/xen/arch/arm/include/asm/page.h
>>>>>>>>> @@ -97,19 +97,24 @@
>>>>>>>>>    * [3:4] Execute Never
>>>>>>>>>    * [5:6] Access Permission
>>>>>>>>>    * [7]   Region Present
>>>>>>>>> + * [8]   Transient Region, e.g. MPU memory region is temproraily
>>>>>>>>> + *                              mapped for a short time
>>>>>>>>>    */
>>>>>>>>>   #define _PAGE_AI_BIT            0
>>>>>>>>>   #define _PAGE_XN_BIT            3
>>>>>>>>>   #define _PAGE_AP_BIT            5
>>>>>>>>>   #define _PAGE_PRESENT_BIT       7
>>>>>>>>> +#define _PAGE_TRANSIENT_BIT     8
>>>>>>>> I don't think this is related to MPU. At least when I look at 
>>>>>>>> the bit representation of PRBAR_EL1/2,
>>>>>>>
>>>>>>> This set of _PAGE_xxx flags aren't compliant with PRBAR_EL1/2 
>>>>>>> register map.
>>>>>>> It is a flag passed to function map_pages_to_xen() to indicate 
>>>>>>> memory
>>>>>>> attributes and permission.
>>>>>>
>>>>>> But aren't you writing these flags to PRBAR_EL1/EL2 when you call 
>>>>>> xen_mpumap_update_entry().
>>>>>>
>>>>>> In the below snippet of xen_mpumap_update_entry(), IIUC, you are 
>>>>>> writing these flags.
>>>>>>
>>>>>>          xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>>>>>>          xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
>>>>>>
>>>>>>          write_protection_region((const pr_t*)(&xen_mpumap[idx]), 
>>>>>> idx);
>>>>>>
>>>>>> Please clarify here.
>>>>>>
>>>>>> In this case, I don't prefer mixing hardware specific bits with 
>>>>>> software only representation for these reasons :-
>>>>>>
>>>>>> 1. It makes it confusing and hard to differentiate the hardware 
>>>>>> specific attrbutes from software only.
>>>>>
>>>>> Penny's approach matches what we are doing in the MMU code. We want 
>>>>> to have a way for the caller to pass just set of flags and let the 
>>>>> callee to decide what to do with them.
>>>>>
>>>>> This may be flags converted for HW fields or just used by the logic.
>>>>>
>>>>> If you disagree with this approach, then can you propose a 
>>>>> different way that we can discuss?
>>
>> Thanks ayan for pointing out that RES0 is not suitable for storing 
>> software-only flags, agreed.
>>
>> Then, maybe we should refine the existing "struct pr_t" to store these
>> sw bits, like:
>> ```
>> typedef union {
>>      struct {
>>         uint8_t tran:1; /* Transient region */
>>         uint8_t p2m_type:4; /* Used to store p2m types.*/
> 
> Why do you need the p2m_type?
> 

I inherited the usage from MMU. Right now, in commit "[PATCH v3 46/52] 
xen/mpu: look up entry in p2m table", we introduce the first usage to
tell whether it is a valid P2M MPU memory region. In the future,
we may also use it to check whether it works as RAM region(p2m_ram_rw).

>>      };
>>      uint8_t bits;
>> } pr_flags;
>>
>> /* MPU Protection Region */
>> typedef struct {
>>          prbar_t prbar;
>>          prlar_t prlar;
>>      pr_flags flags;
>> } pr_t;
>> ```
>> The drawback is that, considering the padding, "struct pr_t" expands 
>> from 16 bytes to 24 bytes.
> 
> For clarifications, pr_t is going to be used to create an array in Xen, 
> right? If so, what's the expected size of the array?
> 

Yes, it is going to be an array. And the maximum length is 255.
MPUIR_EL2 identifies the number of regions supported by the EL2 MPU,
which is 8-bits wide.
The original 16 bytes, even with 255 regions at most, will take up
less than 4KB. One page is enough. The following definition could have 
covered all scenarios.
```
/* EL2 Xen MPU memory region mapping table. */
pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
      xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
```

Now, FWIT, with 24 bytes, the static xen_mpumap definition only works 
before the heap allocator are up.
When heap is up, we may need to re-allocate xen_mpumap from heap. When
MPUIR_EL2.Region is more than 170, an extra page is needed.

> Cheers,
> 

