Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3379FB53
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602007.938350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgfFl-0000su-NX; Thu, 14 Sep 2023 05:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602007.938350; Thu, 14 Sep 2023 05:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgfFl-0000q6-KZ; Thu, 14 Sep 2023 05:51:01 +0000
Received: by outflank-mailman (input) for mailman id 602007;
 Thu, 14 Sep 2023 05:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lXhl=E6=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qgfFj-0000gP-PI
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:50:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acbdc1a9-52c2-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:50:57 +0200 (CEST)
Received: from DB7PR02CA0034.eurprd02.prod.outlook.com (2603:10a6:10:52::47)
 by GV2PR08MB7953.eurprd08.prod.outlook.com (2603:10a6:150:ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 05:50:44 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::2b) by DB7PR02CA0034.outlook.office365.com
 (2603:10a6:10:52::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20 via Frontend
 Transport; Thu, 14 Sep 2023 05:50:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.19 via Frontend Transport; Thu, 14 Sep 2023 05:50:43 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Thu, 14 Sep 2023 05:50:42 +0000
Received: from 96ea165c2260.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 945516FD-BF1D-4061-94F3-CE9B88575D3D.1; 
 Thu, 14 Sep 2023 05:49:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96ea165c2260.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Sep 2023 05:49:02 +0000
Received: from AS9PR06CA0227.eurprd06.prod.outlook.com (2603:10a6:20b:45e::16)
 by PAVPR08MB9186.eurprd08.prod.outlook.com (2603:10a6:102:30c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 05:48:59 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::ac) by AS9PR06CA0227.outlook.office365.com
 (2603:10a6:20b:45e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20 via Frontend
 Transport; Thu, 14 Sep 2023 05:48:59 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Thu, 14 Sep 2023 05:48:59 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Sep
 2023 05:48:58 +0000
Received: from [10.169.172.183] (10.169.172.183) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 14 Sep 2023 05:48:55 +0000
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
X-Inumbo-ID: acbdc1a9-52c2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGzERvBoq9P2zABBNKNmztOcM5WNTyag1mJC2T+TaUk=;
 b=G4ghA2LYORfrQRps78NqaL/+c2gOA/F3Adn6tgW2DmeEPP21JJPjAbY4qHwoHp2xSgREMz1kfl1cikeUCyEMnjokjm2wrRdW/atnMi4AdaOiUNiQnCEq9oSSLeUP/mmYvoVuyLrH4gfdO2xFy5zyjRA6+n6G6UdVzZvwUpyQjRU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f839705765c254a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PB5CaYGTEip3+sx+HBUnpwQcYtWFyrVIY8NF5TjX2rIhojFR5hYJKX+H0svJr6vR9yDBu7bgNUSGUGgOv8x4OzdcsnwJG9t/BJECw5+Solqlv/6wPu1O+gyiISspeCKuN8WoWMGHgx2zxsr4KJKvrT6ycXybIXiE6KWYrEs/r9leP4pFvT+KqqbnjjpfQnMuxI8DyI3sVQsuEncbj50NEVu6mNWaAnG3/kQg8/DP/3T+2T7kxVWFIfF0TV9E4g8VELahX251vDBKu0UwAxDcGSx9dTvMR4LJEUp99TBKHw/8kVgZb49qn4sWN+Qkdq2Mq3TURgBMIg6QU9MmmEhuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGzERvBoq9P2zABBNKNmztOcM5WNTyag1mJC2T+TaUk=;
 b=kJSWlp5mEZ3b9tlKp77yCLXy8OYMgzQykg2oVDE5rPZ8p3L3H5Qs0waxN/nGWUr0asIdN+TN0EJ2a3qZY3kGhRoid2qqJoXdAr/YR7Z+sZrV5ZTKWRfK8cyBiBSqYFmdH5evTGZpoD29lxAqe48DxZG2ufVkMW2Qn7q2DL0EDOnw7ExMlX/sv28yw7VcDEFkl6WJC/ez/2kEoXi5/fsuK9scep3XBKZVvzYaK/nk6i5oY7oHAel0AVfqD9S+Qc3Xl4qbehzVW7szzStHAY6j/dfHU38qCcvDZ0cfo2MtOidgLsCAm7U9k4ftD7SMb4KRKXrIFwYEBmvPHuJNZxDs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGzERvBoq9P2zABBNKNmztOcM5WNTyag1mJC2T+TaUk=;
 b=G4ghA2LYORfrQRps78NqaL/+c2gOA/F3Adn6tgW2DmeEPP21JJPjAbY4qHwoHp2xSgREMz1kfl1cikeUCyEMnjokjm2wrRdW/atnMi4AdaOiUNiQnCEq9oSSLeUP/mmYvoVuyLrH4gfdO2xFy5zyjRA6+n6G6UdVzZvwUpyQjRU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <a958921e-500e-fd26-741d-1a1b686fdfcb@arm.com>
Date: Thu, 14 Sep 2023 13:48:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers
 within CONFIG_MMU
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <wei.chen@arm.com>,
	<henry.wang@arm.com>
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
 <20230911135942.791206-5-ayan.kumar.halder@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <20230911135942.791206-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT058:EE_|PAVPR08MB9186:EE_|DBAEUR03FT065:EE_|GV2PR08MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f506ed-1868-485c-2968-08dbb4e688b3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 z6shbnYnwqZ8U/r3nxMomT47ZlUqqwwsCluJZP4GScV3YceZUWBynRHKBBbHW2nCVgmwuRuw0PaqzU/BDi8nBmh+4Vhqfmic3V5cjubbcYY5q77Jyfy5PnyewJ0OmjDhN1P+ivEYP9Bw6jlwhPgoOkf6lWc1MQ2WwVlnxcEbvRSJyRwpNSliJGgXdMdtSu2AkoffTH5ITtJNFewxnMMRpA7Wfb13a7uySMUylGJFKGywtZco7YJAiMsqqZ9DtNszBciUDPqaczfAdMxXp/Wfjk5iI8juJTQA27wr6Tv6DjBI06nVOPluIDZnV0zP0fstAZvqnuIT71rXvGPkqKyGbyMGHW91Gf6XTaP9pmieoI2sn2pCOrAFvJ/5wybHahuwGOWtDBobm5ASd2sukFgwf8fZN+r9WiP245p+zpuBHEeRkMKl/KZ2GneLDLrm82kkCQ3dCPHlSAA+5hSKR2VQUtKGqePj+Uoey4s6ULmeneprhkPpyiJn3uPZmXHRM5x1UD/tw6xAYSizXb2/HqBiqYVxxVkrVwInR2BxWWwXkta6S3Zv9GWbXolOnQGz/ZOHyvmX8a6HyU4U/hgEJ9YpKyzP5p4p7XXy52E+WI6mb4osHqyCf1myCzQfnoHKXLEJxF9PIQJC7mhCd6tw9vrizEtvDlWAFlkVMbQvX5URVNmRlj3evOKFFeql9nHkB29yJO2yPwU6M5QFq1BaRx563xeIc5s1whAojIv0bjrMfMwT5EJru0rc7/VAZyKyJ7lZGVxy8NeVV4oYuLUU7qkfJzUYYHllliPFmITlMwp+FQIMvo+KS1tnQQ6xj348KhKCw1aqTHxnLIITloP1xvaJzw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(186009)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(31696002)(86362001)(44832011)(8936002)(4326008)(8676002)(5660300002)(40460700003)(2906002)(36756003)(53546011)(82740400003)(336012)(426003)(26005)(2616005)(81166007)(478600001)(356005)(36860700001)(47076005)(83380400001)(31686004)(54906003)(316002)(41300700001)(16576012)(110136005)(70206006)(70586007)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9186
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0bc7c14-d20c-46be-a32a-08dbb4e64aa6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9JNFWO8Fz74ztvapkePi75X5oPI/b4yKQCuoKICGzPTI712ikU0oUjlR9ExHwH5ThVcVTdoOi4vTRtFKiwVpAu7IhO0haoEYPMco0g5lqjtZ6YQq6Z5DO6fLXJNs09w7ez2bpf7V/NEtTE+V3fE35zPDYAOIxdlYvKBfberTM3L1KuoecpdIxCZw2xi3B+fJK/jKlPpAONaW6df36YDglCuDOx9r/enlyzGXrcO01cDQF1jB4nLjQNTTeugZEh60l14GUpqL1bZrCGBBrBGPQMmxFLkZGh69MIu3+BJK9vAjv/lC2k3QmzEOfDR73H28Dy5GkE7j4FoeRGW2qLMPmAqNqhrp6LVWXkuebrglUgkZlmTXrbw1atsxuz2gwkWH+Zk5mUOe7ouaUI2C4niKSGjR/Plw8pklZsNfJdorj3CYKOt3Y63ZWCvJyfxuYReCaUROixSrRXUiyF/3Jtr0Qd8Nv1GO56eTcymaFwt6Vl4BAp0fzP+lsxoO7GqazRDiyL8zYYlKOBcxpwlQPL7hgOH3/CdbzgBxsGnR4cVp1slJ4c+vk1DCzerVm27PowMs2U6Zd9B2UjNiEyNgZdOIBDsBhaR7Ygnwgktz66gJr0tB5EUJMMhQfa47SfwERTeiZar1/TRLEJFa0Ck3Q8LOh6ZTRtVcOoB0obtHon+K1jJ6/7S+BPUAHbdc4DgCWeL0AQWc/sD5R80ouE/STqE2IRki36G+7CaOAJ1MUsRQ/mvZs/JDZLNoaDJFaBU7RE1aXp1XBDYX8xnUmqp/YLCPyA/wG/6Kfw9FJbtJqLytkXE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(82310400011)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(26005)(2616005)(478600001)(336012)(81166007)(53546011)(40480700001)(426003)(2906002)(40460700003)(82740400003)(31696002)(47076005)(5660300002)(8676002)(4326008)(36756003)(8936002)(41300700001)(86362001)(70586007)(70206006)(110136005)(31686004)(36860700001)(316002)(54906003)(16576012)(83380400001)(44832011)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 05:50:43.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f506ed-1868-485c-2968-08dbb4e688b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7953

Hi, Ayan

On 2023/9/11 21:59, Ayan Kumar Halder wrote:
> The VMSA specific registers (ie TCR, TTBR0, TTBR1, VTTBR, etc) are valid when
> MMU is used, thus we can enclose them with CONFIG_MMU.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/traps.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 46c9a4031b..83522fcc5a 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -698,8 +698,10 @@ static void __do_trap_serror(struct cpu_user_regs *regs, bool guest)
>   struct reg_ctxt {
>       /* Guest-side state */
>       register_t sctlr_el1;
> +#ifdef CONFIG_MMU
>       register_t tcr_el1;
>       uint64_t ttbr0_el1, ttbr1_el1;
> +#endif
>   #ifdef CONFIG_ARM_32
>       uint32_t dfsr, ifsr;
>       uint32_t dfar, ifar;
> @@ -801,9 +803,11 @@ static void show_registers_32(const struct cpu_user_regs *regs,
>       if ( guest_mode_on )
>       {
>           printk("     SCTLR: %"PRIregister"\n", ctxt->sctlr_el1);
> +#ifdef CONFIG_MMU
>           printk("       TCR: %"PRIregister"\n", ctxt->tcr_el1);
>           printk("     TTBR0: %016"PRIx64"\n", ctxt->ttbr0_el1);
>           printk("     TTBR1: %016"PRIx64"\n", ctxt->ttbr1_el1);
> +#endif

FWIS, on v8R-AArch64, with MPU on EL2, we could still support VMSA on 
EL1, so registers like TTBR0_EL1/TCR_EL1 are valid.
See ARM DDI 0600B.a Table G1-2 Alphabetical index of modified AArch64 
System registers (continued) for detailed info.

>           printk("      IFAR: %08"PRIx32", IFSR: %08"PRIx32"\n"
>                  "      DFAR: %08"PRIx32", DFSR: %08"PRIx32"\n",
>   #ifdef CONFIG_ARM_64
> @@ -873,9 +877,11 @@ static void show_registers_64(const struct cpu_user_regs *regs,
>           printk("   FAR_EL1: %016"PRIx64"\n", ctxt->far);
>           printk("\n");
>           printk(" SCTLR_EL1: %"PRIregister"\n", ctxt->sctlr_el1);
> +#ifdef CONFIG_MMU
>           printk("   TCR_EL1: %"PRIregister"\n", ctxt->tcr_el1);
>           printk(" TTBR0_EL1: %016"PRIx64"\n", ctxt->ttbr0_el1);
>           printk(" TTBR1_EL1: %016"PRIx64"\n", ctxt->ttbr1_el1);
> +#endif
>           printk("\n");
>       }
>   }
> @@ -907,13 +913,15 @@ static void _show_registers(const struct cpu_user_regs *regs,
>           show_registers_32(regs, ctxt, guest_mode_on, v);
>   #endif
>       }
> +#ifdef CONFIG_MMU
>       printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
>       printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
> +    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>       printk("\n");
> +#endif
>   
>       printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
>       printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
> -    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>       printk("\n");
>       printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
>       printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
> @@ -931,9 +939,13 @@ void show_registers(const struct cpu_user_regs *regs)
>   {
>       struct reg_ctxt ctxt;
>       ctxt.sctlr_el1 = READ_SYSREG(SCTLR_EL1);
> +#ifdef CONFIG_MMU
>       ctxt.tcr_el1 = READ_SYSREG(TCR_EL1);
>       ctxt.ttbr0_el1 = READ_SYSREG64(TTBR0_EL1);
>       ctxt.ttbr1_el1 = READ_SYSREG64(TTBR1_EL1);
> +    ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
> +#endif
> +
>   #ifdef CONFIG_ARM_32
>       ctxt.dfar = READ_CP32(DFAR);
>       ctxt.ifar = READ_CP32(IFAR);
> @@ -945,7 +957,6 @@ void show_registers(const struct cpu_user_regs *regs)
>       if ( guest_mode(regs) && is_32bit_domain(current->domain) )
>           ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
>   #endif
> -    ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
>   
>       _show_registers(regs, &ctxt, guest_mode(regs), current);
>   }
> @@ -954,9 +965,11 @@ void vcpu_show_registers(const struct vcpu *v)
>   {
>       struct reg_ctxt ctxt;
>       ctxt.sctlr_el1 = v->arch.sctlr;
> +#ifdef CONFIG_MMU
>       ctxt.tcr_el1 = v->arch.ttbcr;
>       ctxt.ttbr0_el1 = v->arch.ttbr0;
>       ctxt.ttbr1_el1 = v->arch.ttbr1;
> +#endif
>   #ifdef CONFIG_ARM_32
>       ctxt.dfar = v->arch.dfar;
>       ctxt.ifar = v->arch.ifar;

