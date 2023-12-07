Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A98085B2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649758.1014608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBmj-0001oe-Bc; Thu, 07 Dec 2023 10:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649758.1014608; Thu, 07 Dec 2023 10:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBmj-0001mh-8O; Thu, 07 Dec 2023 10:39:13 +0000
Received: by outflank-mailman (input) for mailman id 649758;
 Thu, 07 Dec 2023 10:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3y/=HS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rBBmi-0001mb-CA
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:39:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dae7e15f-94ec-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 11:39:10 +0100 (CET)
Received: from AS4P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::10)
 by DB9PR08MB7795.eurprd08.prod.outlook.com (2603:10a6:10:39a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 10:38:40 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::66) by AS4P190CA0016.outlook.office365.com
 (2603:10a6:20b:5d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 10:38:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 10:38:39 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Thu, 07 Dec 2023 10:38:39 +0000
Received: from 740bd187e9ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F0BFF0F-141D-4E9C-870A-A269F46461DB.1; 
 Thu, 07 Dec 2023 09:57:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 740bd187e9ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Dec 2023 09:57:07 +0000
Received: from AS9PR05CA0257.eurprd05.prod.outlook.com (2603:10a6:20b:493::9)
 by DBAPR08MB5847.eurprd08.prod.outlook.com (2603:10a6:10:1a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 09:57:01 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:493:cafe::a1) by AS9PR05CA0257.outlook.office365.com
 (2603:10a6:20b:493::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 09:57:01 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 09:57:01 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 7 Dec
 2023 09:56:59 +0000
Received: from [10.169.172.174] (10.169.172.174) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32 via Frontend
 Transport; Thu, 7 Dec 2023 09:56:56 +0000
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
X-Inumbo-ID: dae7e15f-94ec-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EUryys58tZ1ezxgxk09GlD/GS/izIaZSkIwKfu0Eovn5+CNd4HQJciXcfmDIdfBY1A67OGMV49mbCOcylBIKeqwgvCgs7rK5GTsf+7PfgrdD0n4gGE6LA1862fwwOMDVvaC13LtzISgbFmUpxv8UReMalKYvsrwRUFEQD353rkJxLMbAnc23ZEUwTJsiQwt8xl8Ch0+QqYV+7hPyLwFB7PAOsKhJuOrrsXxLmP/wABOxIwkmLsiUIeQ/R0yGibUeKHhSMqPNTnlalP+RwIXhf5UcfZsAG60OB4YAOApQFpnOybOXo36obII8c74FxUhXXzk55FLwvAayQ4PzNDeb1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBG2u2yERX6y59klU8cmRDWiTUFOl60ag5KyakPDLsg=;
 b=NlWC12hND5I87LULQSJInciJIQSBfiy61e/BFT+ixtri5iAyJQ70Oxq1WscGDvHVSEnto/wgTxV+a6XEyQGXDtsR/f20ckK2Y7TatiKYqdUPScsGMZTfDjzpEEWiBSmCOqfW5Y8YRRe/oOx+1LDvsJ6jX8m1MUQCUmSmix/ktFVCJE4aZMApaTQJuwryfkb8/foYGtH0l6egMMxSJJ9JyeCWjDPVxsF4udydktXM9dHodkq+TVQ1LsHGXQY43UredN15y6D8U/8CYM5eSc0pT4qFl8pXl/F9PcIKGi7T3paLQQ54RsyuQ3uYyN530W8z63lvo2EkbwlZ8gurKX/LAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBG2u2yERX6y59klU8cmRDWiTUFOl60ag5KyakPDLsg=;
 b=Z2dzyRjwqnbXMp53lHs80HqFfyWlqxhOohqupMDgBHRCUAtxNprkk2jRDLZ6+HqRhn0YaVKeJcchS7FCOBvFN9vL5NAHFhM84K6r651khC4sERZGTAXdz48XfgSH3BnvKaUotpB00tGFJJYETIukkN5Zx+ZrKGE6UuU80Zmqhc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7dbcdf01292bc6ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i92jiHRw/mvqUUsnzIUjxOZItrQf6IePKBKUkCtWwA0mYqXaxislCiHRi15VMwrvIH2aA3PvC1m12xhF6+bURI2kRqR2N1j7b+7CL6bj6qKXMTbpqMONu/kIBBPC5qbe6zQSeCrSb8fG3uN5t9Icre8zqaUNrEkn8zVYKZ7Stf1ylcwbkQNQwIXPXAF9qnPtNikLfqGPZ1weZ8HqeuqVldXO6o/rnBAroMN454q5Zgt9FSASMHd0qGwsoIlobyUw2u2X6bK02hk4t44UaFqDgmJuo1zgQZZXaU2TolaApT99ETIuV+3bnQZZRz1HQ6AJMYHTAPxebbHOF1edDThA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBG2u2yERX6y59klU8cmRDWiTUFOl60ag5KyakPDLsg=;
 b=h5yp1qXvPZ+hFVPFuDx98DA4XeY9Zu6NUmEWoXteYEAeLU+7Ei3uzIwvpf0HX07AdRw55PeyFl9FFWxF9X7XzQjBsFTJY/Ob/dcy5vWEhcwj751uOHC1Da5P/d3V3rjUigws8YL2MuzDvkxQH4iDppmC1/SNa/K9m2PHHbfTqWoAK0BsAD3VrpnJ2Qv5vHDpT3PGJrj7zxMSBlT/HwreAIxwZB/DKWD+resDY2e0/9zoNmDOf5MM462GshrtKuox26ol90nkFkRfJjhf3lsuR3ND3bMfUBNZ1xLq8Onswe7rkkann8/IMShoe66b8PCnn+cEd57WD0qVNh2oMUWTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBG2u2yERX6y59klU8cmRDWiTUFOl60ag5KyakPDLsg=;
 b=Z2dzyRjwqnbXMp53lHs80HqFfyWlqxhOohqupMDgBHRCUAtxNprkk2jRDLZ6+HqRhn0YaVKeJcchS7FCOBvFN9vL5NAHFhM84K6r651khC4sERZGTAXdz48XfgSH3BnvKaUotpB00tGFJJYETIukkN5Zx+ZrKGE6UuU80Zmqhc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <978feb5a-a220-3505-d1f8-864ec9ea08c3@arm.com>
Date: Thu, 7 Dec 2023 17:56:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 02/11] xen/arm: avoid repetitive checking in
 process_shm_node
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-3-Penny.Zheng@arm.com>
 <fed944e1-cb66-46a1-b327-d69ad280cc5f@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <fed944e1-cb66-46a1-b327-d69ad280cc5f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AMS0EPF00000195:EE_|DBAPR08MB5847:EE_|AM3PEPF0000A795:EE_|DB9PR08MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc158a3-4bd8-49cc-f229-08dbf710acfc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2wofqFAS4op/wfG60NLzXiLyELoWp2uqqMGuzCtTeMInsv/D5B8CzhPfOwO5D63XSoPp9xWsi+uzsyRKdUyrWkAia6LnFs3D7lXMiZqRheJTlPiGnPCm1Alvok8HSZ7iRD9cKUXLC8iyuyTnqK6ycXbbxKKdzzVo/GHZC4rv5G6PtKdn9L8J+bjEStDeg6Ksp0PV7xe6md4iAipJXWC+Elmx4vDF7pmmfgY7ySSGGBLiCJbD/1Mz/whjS+U7JsklGRJPMmDV+t5h3ijLPSColJtqLG19AJTEOHg/hYgYZzWksm/cfNpUUD94BrZ8+AV7hJoSEAsDERzhKkIfoiSnuK7HoM1QfeA5/j8cN1k7vvX/iqCaDJ3BN4ZvorYnxVL3VdyfwGPxedr2cFJNAbQci2ajhe9fecjcDZFhC6oPL/vIrIwzfzMPvUhB7xmqz7PVNsB72448VTLzNWw6W0GPRIo5Z0Bi89dZMNH6P7mIY7DJZ/b/+tg9meq42A1dQL9bPblD39mgAkQ3+yKDeoKBLIHY0E4sVvRTNuvHmnpiilXtpNFfIICrxHhTqqhNJK+rQt80x1PRlX+QiMlkN3XcCWWpOsUoajo+VlSVvoKlWpd5sjhptQk4v3YhUBrYcY75lFn/XOAcS3pqugbHQIcqRtifhNlyCASN1wvmbcqy3PORptKia+k2wC7ey/sS/zfMLxe8wDHDF5uHWC/L222gO90N5IR1cUnB4Mt/8hqjAMPlsCGM94vGuaME2BSh9x396Yx+mtmAzBirr4jg7oKjW5RM8sKXtazSFR3zNYW7TyI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(346002)(396003)(376002)(84040400005)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(36840700001)(46966006)(53546011)(478600001)(2616005)(31686004)(26005)(336012)(83380400001)(110136005)(316002)(70586007)(70206006)(8936002)(5660300002)(426003)(16576012)(44832011)(54906003)(4326008)(8676002)(47076005)(2906002)(36860700001)(31696002)(40480700001)(86362001)(41300700001)(356005)(36756003)(81166007)(82740400003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5847
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78ea392e-dd5f-4908-430d-08dbf70adbf3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jnsRfQkcwy4FWWL/iXrte/zHLNl3m74ZcjSK1+zqfJeKpGD0WS9HolnaUkreBb5zTz8PpLNElhepJPu0OT+5zOhUchVTtuyTUqzobIgE8Xm25staero1TWKcbvYx668r4/b5grSzmYmEtCK6//ZSqMG0SjkhTQkVh2wUDAJEFwXJfTdiM5bZ5GtMDauh6y2DebFq3cvuzA2Ww/VAiiPsyCiWrV7wdFZXWWuIrgFV9b9w+zat9NYsJ2hLAt7AnL/aVEHaIqT+laPy/1Rw8pVCn9nNAVlURgaA5MiUvvFpogMvdG+INHu6/2OWw+Xs1U1uvAzuCHBt1HOW7sMRijXU8JEYCVYVv9VTf+nzC8CbRth016MC0ChWfr75DU1a5GjS0HgEOps7CElCPTL50RsiIRAKtWpAkF09nLQvOX3jwT9xnnYHjxTG3UmlgapMEAwpqD2Zu1+eX9Hg5RmGX0Sl7Koe+WZP66kBFiuOJ6JYXEX8BAQmaRNFrafAXnrN6iWBRrVV57AyYLRaoD3o1wZSxxCj6puefwu30NWu1yHxTaHHef2ktO3CyZdaWQzxkPmQztsBu2b8Ab9BwM0uawsIX1IIfUlz4+VMDzVch8JsxmKgGU44C7pRjiJMJi4lD29CXSjAjUBh5sjfHDLaTUYULNTtulwYRp/5pmrUU+OAfswSHVeox+c01MDPHYhzwjUNlbwfz5rqQdYbIG4WPB7DbE98Xv6IRN3WHWymre6X+4ffifM8biR5trOfOkKpmjWM5GRL1kVTeaFtW4kgP7WYhnyNUpObD5KtgjpQ9pcaw+I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(84040400005)(230922051799003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(40470700004)(36840700001)(46966006)(41300700001)(36756003)(5660300002)(40460700003)(2906002)(82740400003)(31686004)(426003)(44832011)(36860700001)(83380400001)(47076005)(8936002)(478600001)(81166007)(53546011)(4326008)(8676002)(107886003)(86362001)(336012)(31696002)(26005)(40480700001)(54906003)(316002)(110136005)(16576012)(2616005)(70586007)(70206006)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 10:38:39.6384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc158a3-4bd8-49cc-f229-08dbf710acfc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7795

Hi Michal

On 2023/12/6 19:35, Michal Orzel wrote:
> Hi Penny,
> 
> On 06/12/2023 10:06, Penny Zheng wrote:
>>
>>
>> Putting overlap and overflow checking in the loop is causing repetitive
>> operation, so this commit extracts both checking outside the loop.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> In general the patch looks good to me:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 

Thx~

> That said, there are 2 things I realized during review.
> 
>> ---
>> v6:
>> new commit
>> ---
>>   xen/arch/arm/static-shmem.c | 39 +++++++++++++++----------------------
>>   1 file changed, 16 insertions(+), 23 deletions(-)
>>
>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>> index cb268cd2ed..1a1a9386e4 100644
>> --- a/xen/arch/arm/static-shmem.c
>> +++ b/xen/arch/arm/static-shmem.c
>> @@ -349,7 +349,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>   {
>>       const struct fdt_property *prop, *prop_id, *prop_role;
>>       const __be32 *cell;
>> -    paddr_t paddr, gaddr, size;
>> +    paddr_t paddr, gaddr, size, end;
>>       struct meminfo *mem = &bootinfo.reserved_mem;
>>       unsigned int i;
>>       int len;
>> @@ -422,6 +422,13 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>           return -EINVAL;
>>       }
>>
>> +    end = paddr + size;
>> +    if ( end <= paddr )
>> +    {
>> +        printk("fdt: static shared memory region %s overflow\n", shm_id);
>> +        return -EINVAL;
>> +    }
>> +
>>       for ( i = 0; i < mem->nr_banks; i++ )
>>       {
>>           /*
>> @@ -441,30 +448,13 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>                   return -EINVAL;
>>               }
>>           }
>> +        else if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
>> +            continue;
>>           else
>>           {
>> -            paddr_t end = paddr + size;
>> -            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
>> -
>> -            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
> You are iterating over reserved memory regions in general, so apart from shmem regions there might be truly /reserved ones.
> It appears that we don't have overflow check in device_tree_get_meminfo, so this second check was the only place to detect that
> (protected by a feature, so not very useful) :) This is just an observation and I agree to drop it. We should be checking for an
> overflow in device_tree_get_meminfo.
> 

True~

> The second observation I made is that we don't seem to assign and check the return code from device_tree_for_each_node.
> This means, that any error while parsing the early fdt (e.g. static shm issues) does not stop Xen from booting, which might result in strange behavior later on.
> If others agree, I'm ok to send a fix for that.
> 
> ~Michal

Penny Zheng
Many thanks

