Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD379A77D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 13:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599300.934653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfee1-0008Mo-BZ; Mon, 11 Sep 2023 10:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599300.934653; Mon, 11 Sep 2023 10:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfee1-0008JD-6y; Mon, 11 Sep 2023 10:59:53 +0000
Received: by outflank-mailman (input) for mailman id 599300;
 Mon, 11 Sep 2023 10:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfedz-00089S-MI
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:59:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5375324e-5092-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 12:59:49 +0200 (CEST)
Received: from AS9PR06CA0214.eurprd06.prod.outlook.com (2603:10a6:20b:45e::19)
 by DU2PR08MB7357.eurprd08.prod.outlook.com (2603:10a6:10:2f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 10:59:42 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::50) by AS9PR06CA0214.outlook.office365.com
 (2603:10a6:20b:45e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 10:59:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 10:59:41 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Mon, 11 Sep 2023 10:59:41 +0000
Received: from c7968acde1d3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B599B3E-ABA5-4EBD-9B80-CFAEADDBFDCE.1; 
 Mon, 11 Sep 2023 10:09:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7968acde1d3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Sep 2023 10:09:06 +0000
Received: from DUZPR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::9) by DU0PR08MB8303.eurprd08.prod.outlook.com
 (2603:10a6:10:40d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 10:09:03 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::5e) by DUZPR01CA0016.outlook.office365.com
 (2603:10a6:10:46b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Mon, 11 Sep 2023 10:09:03 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 10:09:03 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 10:09:02 +0000
Received: from [10.169.172.145] (10.169.172.145) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 10:08:59 +0000
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
X-Inumbo-ID: 5375324e-5092-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2CmqhtOA8h2szWsBWmMo7GS+OvKM87btyBRLjpI5Nw=;
 b=VCl0GiEBM5zFvKWafyavUqv03XbSKAaHVzRu6D5EXay6lscR8uprT0w/R8B7VBBwZnoYh2AS7RXM8z1k+gc5cqoA/JQyWo+i0dTvbwUq7Omy19rgtUxtRzC3oYkgMx5ppjeW+JloI2nax0cnHxn8UROaqrOuCcSJHk9YRBllQOw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7020904d903089e8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMSzC53N8RU53zStsfprUMKx0gekRaPl9rU+nKFFl5TBaIQaKDcqOTOa5KzquxGeWVJdRf5yBeG2r+Za3K8XY7MlW33K5YoEpwa8K04pDp7DI6F1ixd7o9Jd6WGJdK+4nSI+X/xmE3gR4FbDkKliuRDArrRHXYke4MA9CO9hk5Lx3Y6D5Nd2EE6+Wav1M0RZcDwXm9npAfsvea68SiG6wgw9ceULZU8WlBQe4avFvV8BQAbNv0qmBYR1Sf4Ihi3il6wiHvCaXV170JMKGLIUPLnrZfTdSXE6X2O96xjudCUiQWsZqCGcK6vsZBf4ppdcRrcWcllKPYG2wGvJilpQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2CmqhtOA8h2szWsBWmMo7GS+OvKM87btyBRLjpI5Nw=;
 b=fLqAps6qQDmY4zWFCeEvz65gyjDzdO+PIKE7xiAnGg0bNPBeFVDkq48AZE2QGdoUp7Bj8d49AacrsWuRaWyLibPU9BOZhD/w6fCNJoYF2wv8dsUEWzPBn5W4IoA4NnjbO7f+Ltaj4m7RclmFBwJqL/c/aLctHuc+lm/29lKpHNuHIOCWYM2Pc27IkoQjhMMONDnjJ4VKIF1PiCUtUH6yb+0ZI+gw50McTJ3UFmKNIvh75seGtrnf+Vw2CcSWj/2yoBrBJHJ/HHcuFFWqQ+4P5xpN684rmgwqAd993IHp08/6H0DZ2Fpro9b8C9CJHNJK3j3hEm8mtKG/z0gslW0aug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2CmqhtOA8h2szWsBWmMo7GS+OvKM87btyBRLjpI5Nw=;
 b=VCl0GiEBM5zFvKWafyavUqv03XbSKAaHVzRu6D5EXay6lscR8uprT0w/R8B7VBBwZnoYh2AS7RXM8z1k+gc5cqoA/JQyWo+i0dTvbwUq7Omy19rgtUxtRzC3oYkgMx5ppjeW+JloI2nax0cnHxn8UROaqrOuCcSJHk9YRBllQOw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <d869e708-c5df-6538-ee07-7ced8e025887@arm.com>
Date: Mon, 11 Sep 2023 18:08:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 04/10] xen/arm: use paddr_assigned to indicate whether
 host address is provided
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <20230911040442.2541398-5-Penny.Zheng@arm.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <20230911040442.2541398-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT020:EE_|DU0PR08MB8303:EE_|AM7EUR03FT043:EE_|DU2PR08MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffbde4e-df89-4e83-41c6-08dbb2b6332d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ko88bD9nlI/8OaifsxkeYwKWcIUxqQ9iOMOkdztIMeXWrQvtMsqUstnk4OX9jDAgD7IMWaJmjprke4v3vQnqtALOt/h1FKShBWuu7aryTi3Rjce6TAJX2bphSj/9KBGqldbNmyzbBN6SSto0SAbSTiU/UADKSVR/NaMggPLmOCGBnysp8p4Tpgf4OAXZyYG0DD5DyB8Lx7TgkNJYCOZk8O+GCTt0MWX5xITV0KH1lxAtCk84ThYfKgU9xy2JPKIfNpnJoeZUDL8FBbV67OrM0/UST2BgpJEPO97pOg39rbnspipty1HgkxCTssWDSVC80NpwHXlg580P1urjjM3P5QYhgcK8mL12+eiet5Z1y0dP4OUeJqk+xCl+T+RJsfsUC9lKg+GkvPNfrBdk7afE4AiipUrtE8k/kHJqWYhmN1nJtmDarDWvJvAvCyQGjFVgg8V60KA9ttDeVQFZJ3ybs0tL7Mydi0qdhKVJHBNrlc7eJdSAODJfvW1KGxiDc6G+OSfC2OQc1iu1wSk0J+ZVKiSrKQE+z69BJEzmHk1TMF64iLWsO6nH1/M53OHsk8Evez5zA1LzdB/K/S/JYdb4jKD5hXFnxIw23TQSuamEh6ZawxBAZ0Ge4VWliSmkxU+YKIXWD+kxEpCwGKGxD2hGJRix+46zIx8XC5HQncbTicTF+4MQOyioL+oKbIKO8LncRDFUDFyCiIaDhYan6SbOlVEgyDJT9KFVC4fIa71kDOYs1tzo4PHIwq2UljLF1W2U1iPTLYnqkREaXsJob5Jj/3HenGh9jvnLTEt2i5aCXHoVAOYInYjloUdSMiXY99tnxHv9jTu62oIN4LcAupP0OEcNcfdAKsUnNKp5aeAY3Zw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(70206006)(8676002)(2616005)(44832011)(5660300002)(316002)(30864003)(478600001)(6666004)(70586007)(31686004)(16576012)(54906003)(6916009)(53546011)(26005)(8936002)(336012)(4326008)(426003)(83380400001)(41300700001)(2906002)(47076005)(36860700001)(36756003)(40460700003)(82740400003)(356005)(81166007)(31696002)(86362001)(40480700001)(334744004)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8303
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf422041-efad-4ae8-50ee-08dbb2af2016
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3jthXqO7vrWhDP6OujpCVCyTPFprliNDeHI6u5dsJ8/P3blC1fNMhySTD8A+MAXyz4Md58GmW3Alf7yT6WvNhE6VGFvYs+dIjovzpdFzTkIMHuJo7vSsI73XpsBeRwucJOgUzEZg+Llh1YJSZoE4PmKp8VIYjNSqiRwAakLU7tUNzjEa9/EquZuycFTWpYKpRlqVvb1O5luVZ8xCz5xaHNrImibihlzDFOH0z3WzdUAl10ll8Z6SqtiHqe4GYqKl4a5iHLZtt8x3dTnpgasCSuqeQJsKxU4DDJ4hgrO0Yx2HCLr3YBhb4VFwqFUKUvTeNEwz8j+2N1ytBVUGOQLD0ySpsRJQj4LADDfLdH84ouoo7q403OSq1/t2bVVsFuJdIrH/gHHQkU1ZuYPCBYEPhGOiZs+oTmBBTk8sw2pRf1oOHlMVG9VdeukteU94STCHgaeOQtcstRaptLp9xEKa1QWjX0JkA25heiVFinwp9TTLxDINmeF4eDggumi9cIM5THa4Gnekuv24eB4jwK360K4T8+xfwhs9R3U2KWK3iuuRvgDqSqtTaSua9M9Eh3kxGSviYXvR4HtN+nw/1o20V85P060YdiZUj41npuIJeNtnTuFvYKN0GUW2zNjCmEQDYjEAAMROFa+dRZbU7lCsEkAjVlsq/G9TQ20BQvAMVh0OaA5HaG2WB0FSYw1UOPUoLykDAx31uswFZq8yN3pAH89dumxft/EkrrEtIPhTfEwSdoNiDPEN3+tNL2TYCnM+kp88IGkWaBDadDfrPgHEbG1Ya4Zx/NcEyMd4JcvzzBBTnr+JVML8D8dD2IRCvv52PWxBNIRt1fJYykx5DXovw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(376002)(396003)(346002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(53546011)(40460700003)(6666004)(83380400001)(82740400003)(81166007)(86362001)(31696002)(36860700001)(47076005)(36756003)(2616005)(107886003)(426003)(336012)(26005)(40480700001)(70586007)(70206006)(30864003)(54906003)(16576012)(6916009)(316002)(41300700001)(2906002)(44832011)(5660300002)(8676002)(4326008)(8936002)(31686004)(478600001)(334744004)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:59:41.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffbde4e-df89-4e83-41c6-08dbb2b6332d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7357

Hi,

On 2023/9/11 12:04, Penny Zheng wrote:
> We use paddr_assigned to indicate whether host address is provided, by
> checking the length of "xen,shared-mem" property.
> 
> The shm matching criteria shall also be adapt to cover the new scenario, by
> adding when host address is not provided, if SHMID matches, the region size
> must exactly match too.
> 
> During domain creation, right now, a static shared memory node could be
> banked with a statically configured host memory bank, or a set of arbitrary
> host memory banks allocated from heap. To cover both scenarios, we create
> a new structure shm_meminfo. It is very alike meminfo, but with the maximum
> array size being a smaller number NR_SHM_BANKS(16).
> As "shm_meminfo" is also a new member of "enum meminfo_type", we shall implement
> its own callback "retrieve_shm_meminfo" to have access to all MACRO
> helpers, e.g. GET_MEMBANK(...).
> 
> Also, to make codes tidy and clear, we extract codes about parsing
> "xen,shared-mem" property from function "process_shm" and move them into
> a new helper "parse_shm_property".
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2
> - In order to get allocated banked host memory info during domain creation,
> we create a new structure shm_meminfo. It is very alike meminfo, with
> the maximum array size being NR_SHM_BANKS. As shm_meminfo is a new
> member of type meminfo_type, we shall implement its own callback
> retrieve_shm_meminfo to have access to all MACRO helpers, e.g.
> GET_MEMBANK(...)
> - rename "acquire_shm_memnode" to "find_shm_memnode"
> ---
> v2 -> v3
> - rebase and no changes
> ---
> v3 -> v4:
> rebase and no change
> ---
>   xen/arch/arm/bootfdt.c           | 100 ++++++++++-----
>   xen/arch/arm/domain_build.c      | 207 +++++++++++++++++++++++++------
>   xen/arch/arm/include/asm/setup.h |   3 +
>   3 files changed, 243 insertions(+), 67 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 66ad3ab3db..7d86dffd45 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -21,7 +21,15 @@ static __initdata struct {
>       unsigned int nr_nodes;
>       struct {
>           const struct shm_node *node;
> -        const struct membank *membank;
> +        /*
> +         * For a static shared memory node, it is either banked with a reserved
> +         * host memory bank, or arbitrary host memory which shall
> +         * be allocated by Xen with a specified total size(tot_size).
> +         */
> +        union {
> +            const struct membank *membank;
> +            paddr_t tot_size;
> +        };
>       } shm_nodes[NR_MEM_BANKS];
>   } shm_data;
>   #endif
> @@ -421,7 +429,7 @@ static int __init process_shm_node(const void *fdt, int node,
>       paddr_t paddr, gaddr, size;
>       unsigned int i;
>       int len;
> -    bool owner = false;
> +    bool owner = false, paddr_assigned = true;
>       const char *shm_id;
>   
>       if ( address_cells < 1 || size_cells < 1 )
> @@ -462,7 +470,7 @@ static int __init process_shm_node(const void *fdt, int node,
>       }
>   
>       /*
> -     * xen,shared-mem = <paddr, gaddr, size>;
> +     * xen,shared-mem = <paddr, gaddr, size>, and paddr could be optional
>        * Memory region starting from physical address #paddr of #size shall
>        * be mapped to guest physical address #gaddr as static shared memory
>        * region.
> @@ -473,16 +481,24 @@ static int __init process_shm_node(const void *fdt, int node,
>   
>       if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
>       {
> +        /* paddr is not provided in "xen,shared-mem" */
>           if ( len == dt_cells_to_size(size_cells + address_cells) )
> -            printk("fdt: host physical address must be chosen by users at the moment.\n");
> -
> -        printk("fdt: invalid `xen,shared-mem` property.\n");
> -        return -EINVAL;
> +            paddr_assigned = false;
> +        else
> +        {
> +            printk("fdt: invalid `xen,shared-mem` property.\n");
> +            return -EINVAL;
> +        }
>       }
>   
>       cell = (const __be32 *)prop->data;
> -    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> -    size = dt_next_cell(size_cells, &cell);
> +    if ( !paddr_assigned )
> +        device_tree_get_reg(&cell, address_cells, size_cells, &gaddr, &size);
> +    else
> +    {
> +        device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> +        size = dt_next_cell(size_cells, &cell);
> +    }
>   
>       if ( !size )
>       {
> @@ -495,23 +511,37 @@ static int __init process_shm_node(const void *fdt, int node,
>           paddr_t bank_start = shm_data.shm_nodes[i].membank->start;
>           paddr_t bank_size = shm_data.shm_nodes[i].membank->size;
>           const char *bank_id = shm_data.shm_nodes[i].node->shm_id;
> +        paddr_t tot_size = shm_data.shm_nodes[i].tot_size;
>   
>           /*
>            * Meet the following check:
> +         * when host address is provided:
>            * 1) The shm ID matches and the region exactly match
>            * 2) The shm ID doesn't match and the region doesn't overlap
>            * with an existing one
> +         * when host address is not provided:
> +         * 1) The shm ID matches and the region size exactly match
>            */
> -        if ( paddr == bank_start && size == bank_size )
> +        if ( !paddr_assigned || ((paddr == bank_start) && (size == bank_size)) )
>           {
>               if ( strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 )
> -                break;
> -            else

There is a bug introduced here.
`break;` shall not be deleted, since it is responsible for jump out of 
the loop when meeting the check:
```
* when host address is provided:
* 1) The shm ID matches and the region exactly match
```

> +            {
> +                if ( !paddr_assigned && (size != tot_size) )
> +                {
> +                    printk("fdt: when host address is not provided, if xen,shm-id matches, size must stay the same too(%"PRIpaddr" -> %"PRIpaddr")\n",
> +                           size, tot_size);
> +                    return -EINVAL;
> +                }
> +            }
> +            else if ( paddr_assigned )
>               {
>                   printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
>                          shm_id);
>                   return -EINVAL;
>               }
> +
> +            /* host address is not provided, and with different SHMID. */
> +            continue;
>           }
>           else
>           {
> @@ -542,37 +572,41 @@ static int __init process_shm_node(const void *fdt, int node,
>   
>       if ( (i == shm_data.nr_nodes) && (i == bootinfo.shminfo.nr_nodes) )
>       {
> -        struct meminfo *mem = &bootinfo.reserved_mem;
> -
> -        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
> +        if ( i < NR_MEM_BANKS )
>           {
> -            /* Static shared memory shall be reserved from any other use. */
> -            struct membank *membank = &mem->bank[mem->nr_banks];
>               struct shm_node *shm_node = &bootinfo.shminfo.node[i];
> -
> -            membank->start = paddr;
> -            membank->size = size;
> -            membank->type = MEMBANK_STATIC_DOMAIN;
> -            mem->nr_banks++;
> +            struct meminfo *mem = &bootinfo.reserved_mem;
>   
>               /* Record static shared memory node info in bootinfo.shminfo */
>               safe_strcpy(shm_node->shm_id, shm_id);
>               bootinfo.shminfo.nr_nodes++;
>   
> -            /*
> -             * Reserved memory bank is recorded together with shm
> -             * node info in shm_data, to assist doing shm node verification.
> -             */
>               shm_data.shm_nodes[i].node = shm_node;
> -            shm_data.shm_nodes[i].membank = membank;
>               shm_data.nr_nodes++;
> +            if ( !paddr_assigned )
> +                shm_data.shm_nodes[i].tot_size = size;
> +            else if ( mem->nr_banks < NR_MEM_BANKS )
> +            {
> +                struct membank *membank = &mem->bank[mem->nr_banks];
> +
> +                membank->start = paddr;
> +                membank->size = size;
> +                membank->type = MEMBANK_STATIC_DOMAIN;
> +                mem->nr_banks++;
> +
> +                /*
> +                 * Reserved memory bank is recorded together with shm
> +                 * node info in shm_data, to assist doing shm node verification.
> +                 */
> +                shm_data.shm_nodes[i].membank = membank;
> +            }
> +            else
> +                goto fail;
>           }
>           else
> -        {
> -            printk("Warning: Max number of supported memory regions reached.\n");
> -            return -ENOSPC;
> -        }
> +            goto fail;
>       }
> +
>       /*
>        * keep a count of the number of borrowers, which later may be used
>        * to calculate the reference count.
> @@ -581,6 +615,10 @@ static int __init process_shm_node(const void *fdt, int node,
>           bootinfo.shminfo.node[i].nr_shm_borrowers++;
>   
>       return 0;
> +
> + fail:
> +    printk("Warning: Max number of supported memory regions reached\n");
> +    return -ENOSPC;
>   }
>   #else
>   static int __init process_shm_node(const void *fdt, int node,
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d5945e421d..0116bacc2f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -50,6 +50,51 @@ boolean_param("ext_regions", opt_ext_regions);
>   static u64 __initdata dom0_mem;
>   static bool __initdata dom0_mem_set;
>   
> +#ifdef CONFIG_STATIC_SHM
> +#define NR_SHM_BANKS 16
> +
> +/*
> + * A static shared memory node could be banked with a statically
> + * configured host memory bank, or a set of arbitrary host memory
> + * banks allocated from heap.
> + */
> +struct shm_meminfo {
> +    unsigned int nr_banks;
> +    struct membank bank[NR_SHM_BANKS];
> +    paddr_t tot_size;
> +};
> +
> +/*
> + * struct shm_memnode holds banked host memory info for a static
> + * shared memory node
> + */
> +struct shm_memnode {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    struct shm_meminfo meminfo;
> +};
> +
> +static __initdata struct {
> +    unsigned int nr_nodes;
> +    struct shm_memnode node[NR_MEM_BANKS];
> +} shm_memdata;
> +
> +static void __init retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
> +                                        struct membank **bank,
> +                                        unsigned int **nr_banks)
> +{
> +    struct shm_meminfo *meminfo = (struct shm_meminfo *)mem;
> +
> +    if ( max_mem_banks )
> +        *max_mem_banks = NR_SHM_BANKS;
> +
> +    if ( nr_banks )
> +        *nr_banks = &(meminfo->nr_banks);
> +
> +    if ( bank )
> +        *bank = meminfo->bank;
> +}
> +#endif
> +
>   static int __init parse_dom0_mem(const char *s)
>   {
>       dom0_mem_set = true;
> @@ -117,6 +162,9 @@ static void __init retrieve_meminfo(void *mem, unsigned int *max_mem_banks,
>   
>   retrieve_fn __initdata retrievers[MAX_MEMINFO_TYPE] = {
>       [NORMAL_MEMINFO] = retrieve_meminfo,
> +#ifdef CONFIG_STATIC_SHM
> +    [SHM_MEMINFO] = retrieve_shm_meminfo,
> +#endif
>   };
>   
>   unsigned int __init dom0_max_vcpus(void)
> @@ -864,6 +912,24 @@ static int __init acquire_nr_borrower_domain(const char *shm_id,
>       return -EINVAL;
>   }
>   
> +static struct shm_memnode * __init find_shm_memnode(const char *shm_id)
> +{
> +    unsigned int i;
> +    struct shm_memnode *shm_memnode;
> +
> +    for ( i = 0 ; i < shm_memdata.nr_nodes; i++ )
> +    {
> +        shm_memnode = &shm_memdata.node[i];
> +
> +        if ( strcmp(shm_id, shm_memnode->shm_id) == 0 )
> +            return shm_memnode;
> +    }
> +
> +    shm_memnode = &shm_memdata.node[i];
> +    safe_strcpy(shm_memnode->shm_id, shm_id);
> +    return shm_memnode;
> +}
> +
>   /*
>    * This function checks whether the static shared memory region is
>    * already allocated to dom_io.
> @@ -1009,6 +1075,102 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
>       return 0;
>   }
>   
> +/* Parse "xen,shared-mem" property in static shared memory node */
> +static struct shm_memnode * __init parse_shm_property(struct domain *d,
> +                                    const struct dt_device_node *dt_node,
> +                                    bool *paddr_assigned, paddr_t *gbase,
> +                                    const char *shm_id)
> +{
> +    uint32_t addr_cells, size_cells;
> +    const struct dt_property *prop;
> +    const __be32 *cells;
> +    uint32_t len;
> +    unsigned int i;
> +    paddr_t pbase, psize;
> +    struct shm_memnode *shm_memnode;
> +
> +    /* xen,shared-mem = <pbase, gbase, size>; And pbase could be optional. */
> +    prop = dt_find_property(dt_node, "xen,shared-mem", &len);
> +    BUG_ON(!prop);
> +    cells = (const __be32 *)prop->value;
> +
> +    addr_cells = dt_n_addr_cells(dt_node);
> +    size_cells = dt_n_size_cells(dt_node);
> +    if ( len != dt_cells_to_size(addr_cells + size_cells + addr_cells) )
> +    {
> +        /* pbase is not provided in "xen,shared-mem" */
> +        if ( len == dt_cells_to_size(size_cells + addr_cells) )
> +            *paddr_assigned = false;
> +        else
> +        {
> +            printk("fdt: invalid `xen,shared-mem` property.\n");
> +            return NULL;
> +        }
> +    }
> +
> +    /*
> +     * If we firstly process the shared memory node with unique "xen,shm-id",
> +     * we allocate a new member "shm_memnode" for it in shm_memdata.
> +     */
> +    shm_memnode = find_shm_memnode(shm_id);
> +    BUG_ON(!shm_memnode);
> +    if ( !(*paddr_assigned) )
> +    {
> +        device_tree_get_reg(&cells, addr_cells, size_cells, gbase, &psize);
> +        if ( shm_memnode->meminfo.tot_size == 0 )
> +            goto out_early1;
> +        else
> +            goto out_early2;
> +    }
> +    else
> +    {
> +        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, gbase);
> +        psize = dt_read_number(cells, size_cells);
> +    }
> +
> +    /*
> +     * The static shared memory node #dt_node is banked with a
> +     * statically configured host memory bank.
> +     */
> +    shm_memnode->meminfo.bank[0].start = pbase;
> +    shm_memnode->meminfo.bank[0].size = psize;
> +    shm_memnode->meminfo.nr_banks = 1;
> +
> +    if ( !IS_ALIGNED(pbase, PAGE_SIZE) )
> +    {
> +        printk("%pd: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> +               d, pbase);
> +        return NULL;
> +    }
> +
> +    for ( i = 0; i < PFN_DOWN(psize); i++ )
> +        if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> +        {
> +            printk("%pd: invalid physical MFN 0x%"PRI_mfn"\n for static shared memory node\n",
> +                   d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> +            return NULL;
> +        }
> +
> + out_early1:
> +    if ( !IS_ALIGNED(psize, PAGE_SIZE) )
> +    {
> +        printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
> +               d, psize);
> +        return NULL;
> +    }
> +    shm_memnode->meminfo.tot_size = psize;
> +
> + out_early2:
> +    if ( !IS_ALIGNED(*gbase, PAGE_SIZE) )
> +    {
> +        printk("%pd: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> +               d, *gbase);
> +        return NULL;
> +    }
> +
> +    return shm_memnode;
> +}
> +
>   static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                                 const struct dt_device_node *node)
>   {
> @@ -1016,51 +1178,17 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>   
>       dt_for_each_child_node(node, shm_node)
>       {
> -        const struct dt_property *prop;
> -        const __be32 *cells;
> -        uint32_t addr_cells, size_cells;
>           paddr_t gbase, pbase, psize;
>           int ret = 0;
> -        unsigned int i;
>           const char *role_str;
>           const char *shm_id;
>           bool owner_dom_io = true;
> +        bool paddr_assigned = true;
> +        struct shm_memnode *shm_memnode;
>   
>           if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>               continue;
>   
> -        /*
> -         * xen,shared-mem = <pbase, gbase, size>;
> -         * TODO: pbase is optional.
> -         */
> -        addr_cells = dt_n_addr_cells(shm_node);
> -        size_cells = dt_n_size_cells(shm_node);
> -        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
> -        BUG_ON(!prop);
> -        cells = (const __be32 *)prop->value;
> -        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
> -        psize = dt_read_paddr(cells, size_cells);
> -        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
> -        {
> -            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> -                   d, pbase, gbase);
> -            return -EINVAL;
> -        }
> -        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
> -        {
> -            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
> -                   d, psize);
> -            return -EINVAL;
> -        }
> -
> -        for ( i = 0; i < PFN_DOWN(psize); i++ )
> -            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> -            {
> -                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
> -                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> -                return -EINVAL;
> -            }
> -
>           /*
>            * "role" property is optional and if it is defined explicitly,
>            * then the owner domain is not the default "dom_io" domain.
> @@ -1075,6 +1203,13 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           }
>           BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
>   
> +        shm_memnode = parse_shm_property(d, shm_node, &paddr_assigned, &gbase,
> +                                         shm_id);
> +        if ( !shm_memnode )
> +            return -EINVAL;
> +        pbase = shm_memnode->meminfo.bank[0].start;
> +        psize = shm_memnode->meminfo.bank[0].size;
> +
>           /*
>            * DOMID_IO is a fake domain and is not described in the Device-Tree.
>            * Therefore when the owner of the shared region is DOMID_IO, we will
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index ff543fc361..732f18dce5 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -59,6 +59,9 @@ struct meminfo {
>   
>   enum meminfo_type {
>       NORMAL_MEMINFO,
> +#ifdef CONFIG_STATIC_SHM
> +    SHM_MEMINFO,
> +#endif
>       MAX_MEMINFO_TYPE,
>   };
>   

