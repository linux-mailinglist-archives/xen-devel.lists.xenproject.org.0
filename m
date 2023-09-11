Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587079A77E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 13:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599305.934666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeeG-0001Gb-Mu; Mon, 11 Sep 2023 11:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599305.934666; Mon, 11 Sep 2023 11:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeeG-0001E5-JR; Mon, 11 Sep 2023 11:00:08 +0000
Received: by outflank-mailman (input) for mailman id 599305;
 Mon, 11 Sep 2023 11:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfeeF-0007mO-1K
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 11:00:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb4cc22-5092-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 13:00:05 +0200 (CEST)
Received: from DU2PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:10:3b::33)
 by GV2PR08MB9397.eurprd08.prod.outlook.com (2603:10a6:150:df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 10:59:48 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::9e) by DU2PR04CA0028.outlook.office365.com
 (2603:10a6:10:3b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34 via Frontend
 Transport; Mon, 11 Sep 2023 10:59:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023 10:59:48 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Mon, 11 Sep 2023 10:59:48 +0000
Received: from 47bf2553be39.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CAE9B454-D595-4A23-BE33-3D22F4EA9DC0.1; 
 Mon, 11 Sep 2023 10:04:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47bf2553be39.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Sep 2023 10:04:38 +0000
Received: from AM6P191CA0078.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::19)
 by GV1PR08MB8132.eurprd08.prod.outlook.com (2603:10a6:150:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 10:04:35 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::b2) by AM6P191CA0078.outlook.office365.com
 (2603:10a6:209:8a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34 via Frontend
 Transport; Mon, 11 Sep 2023 10:04:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.14 via Frontend Transport; Mon, 11 Sep 2023 10:04:35 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 10:04:34 +0000
Received: from [10.169.172.145] (10.169.172.145) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 10:04:31 +0000
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
X-Inumbo-ID: 5cb4cc22-5092-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NtjLYmq9vxIWtzkKY7mL+aVtr1lVfNHH2Olef4zjSE=;
 b=bKscj1ew2JZPysT8pHdF8Oxi3V7IzHE8vmFDP9cktS/kqTjYhpF9b0Xx96PNA9k2RV2mdokklD1g8TDMo0+YnSSmsNQ3L4IE/guB2qI7TnIdGC6+z86EKZ6abfa+UyFPsXUsfTxmoUJvW7v9UtsF09KtlwUA3p8iqp7IzXQYGLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e891ceb92fe0fa0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCdNMKes35wKHqd06aMSXnfpvYh/Xl+TXOJmHw3G3uNnY7qhPYLQM8jhu/Ern+I0UbRVpEVksftFQCJX6haOaDliEXCUxYg/5bthLGUaBZkzH3cB3XRtEC1CBmecB/4uGd9w9PdrgvMSfglyGW3zpVVonSOFIy+BCTBWP6m++RCNnhdJ9i3KC0KnUrT45zfY1z9Sc0sNYJVe8puOjfPz1PCzUmeFI4VM9nXYXeyiWWDQem2DZ9U4dP1c5tKc9cHGl7U2ApzdW5BxRc9Wxa3WmUg38+gZ5gx8UmzAgYBgtFFkJrZ+ibKxEexj4fPj4qenxkf/hPHGDBKmri6uWK4Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NtjLYmq9vxIWtzkKY7mL+aVtr1lVfNHH2Olef4zjSE=;
 b=i8trXC72MaA8yiV7yysNht9B/TTT+zCeWbUppdTKZv6UrKg3OaIIO6u2l7KtOVnpJ/0SrxpB8HzTza6fF7snvHm/ewf7oYWj102O+qQEvN/9DLsezdNRNZQ3Bjxtam088/LeEMFKmkvddSupKxeIW2CQ1f4ofTtXzr0Ug6mNTXNpN/Z4PKBDEsThfFWPTwoAcIagAhyPjS0RjGFOEeMxBjGGMRmVO+T+VA2Ij8X2gbV18HCfleMbQhsf+KHRW7M+vj2ra991oAuaJTLSWYiP4k8iNGrpFlu08R0tqWSoxZxsZdvtUxiA+oGvvD3irFLw6N0U84TXVbsPEnF/eO6YMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NtjLYmq9vxIWtzkKY7mL+aVtr1lVfNHH2Olef4zjSE=;
 b=bKscj1ew2JZPysT8pHdF8Oxi3V7IzHE8vmFDP9cktS/kqTjYhpF9b0Xx96PNA9k2RV2mdokklD1g8TDMo0+YnSSmsNQ3L4IE/guB2qI7TnIdGC6+z86EKZ6abfa+UyFPsXUsfTxmoUJvW7v9UtsF09KtlwUA3p8iqp7IzXQYGLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <2124b9ea-4c74-780a-f97f-ca3b3d7c9b16@arm.com>
Date: Mon, 11 Sep 2023 18:04:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 00/10] Follow-up static shared memory PART I
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <046aecc4-7270-0041-67dd-51614d2beee6@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <046aecc4-7270-0041-67dd-51614d2beee6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT014:EE_|GV1PR08MB8132:EE_|DBAEUR03FT044:EE_|GV2PR08MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: bafb3a2d-4288-496a-73df-08dbb2b63744
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lwc7nZcxytxKPJJPhZletp1bJieyumiu79d2E38dqPiOfiwQLVF8QaehTAzaUyTOoCq5FIXGG8jz6E/PTwqqlkr1RPAcN+w5XdJVKaJrTyKZg4n426FdKnADVltgpQV9dH5d9PR44kRSPJavKXL4VW/fqRMY7e0tQWA4xdB8JG1h/ZH/7Y/x+/7MJ2IHv5oNMHnEcGZNE5QPAaW4Z6MvRwY/kc6mT3Lve0054uJPNzbwN8as1xn2/+8SAGs9IfljBBEDQoSvyR2RGXjKc9ENzVNPrjKaMDUkSGEjd2IulSC/gCbsc64q/W7ApZtWcZo8Lc1bmd+AoJwuOpUEoG5+j7tT8t9B6E+sh6wRm4RIHtqgkJbKTooBHfpdW6uZGwOy34Q+MbsWRJMpQVfTHQ++Eapt1boCGJCqTZEytOEPiM9iMlcCnOvIzTTw23j5DglxyYT/GqC0o5eDHaLErrr9Jxoep/4z0Ol52NZTfB3raxV4QzjDcW9JOECi3WPfjfETASgLj1O87iVper6SpJj6HXBHRpmY/9H16k1FP1APPXiDj2TQ3HB3l0dBttQAzSf3MetnKmcB9xJBKfjiSInhn/XiqBwzPJw1onuh2lmBphTpnGkrMUUngoPZvJK0xSIXzALENzl6RKM9SWogfPrqgHGAYsaDUCK9aeJ4mXbzykcbyOhONX0UaMpVYUFvdkMfuix3zIHR6jc9Oj4bEA22CeaeoXvB6EUaV10LhaCg2MQQV28saIztIdd7IDP+2VOdjiorkJOY8Wz12fJIJtkTWjgmdg1y8TmQPayzDTp2+xFhRfN9Dm+gkygz0pbQ3+ZkJ8kRX6syTbwF58dfwmt0HCMlwEsFYR+md4MNDgjmdKxqx9QQUxs3AWIs3d24bPoA
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(186009)(82310400011)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(70586007)(110136005)(86362001)(26005)(426003)(336012)(2906002)(83380400001)(53546011)(40480700001)(2616005)(31696002)(36860700001)(356005)(82740400003)(81166007)(47076005)(40460700003)(36756003)(478600001)(966005)(5660300002)(4326008)(31686004)(8676002)(8936002)(44832011)(316002)(16576012)(70206006)(54906003)(41300700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8132
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48663458-3576-4c13-e471-08dbb2ae806a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4bdzBPRT5NV8ICYBaTp/0XXf5NJO9dzceRt2mY8g4itipnNyaj4dxvhyOeCjzX9cJ4tRx/MqJLW9I0N5m5kDbHIyaL0zuFRl/zbIATbZ90vgD5ikUNcobEGdyowdpn1b3kAsLTG3oDR0s3hz4YA5iMg/Bdln2u47sGulzX9YfczMKZeS34iaKevMTdtztREkS2UAPRIdNcpybcBsFbzpWhbqsBlBkICAMKMCm44CeTczTFPBqOcmdPbGjJ9KStJfQEtaiijCFF2HaTa6syGO3eSvVmQWziahza0zRwwzYJqTbPwvuYVgZuad+BGSJbayuwYeE2LvM0rfpz/LF/KG0QNg2gT1wUDVacp2W94mhaYEw67P8z3X8qa1aKaXChD4bKTd6qWrNJtGgcqLkZ7NHCJS3ff7+R0dEwnijV1FIuK+xYkEcb1pQJx+Nx3KKeMLQ/7/u//rG5eBHq2Zb+hJcH7XL2lzhjRrXdDzWg3NYKfQdNX1hCcg2C5CWfEcjXsTZAO71kgdC/MudMIE52YANOnDXGbRcI3DanpFWIlHMkbQiXOg7I6PdzrutOlNYU+Znh8J8nuQF7TgAdP8pNNlNsiZaFcBu4zQlGd3CHnA5Fv8BJMaP0xYEFU9nnO4d6h9zjpL4dP0kr1JmnFmro9ZRI1xPhVchqLvX9kFGOf3XkP4JCYf0iUkIJOpxNjh4XzbyNRgQj+UojlZ2LTHZoX0sKtRlwsKjidbjZu0/7DjCEwpMwhMhzgAGx7MiMlZ0wky4GHacevzLRFQOekTTQ4n9Tj2Zum+2cpLJy+aUWYiHBk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39850400004)(346002)(82310400011)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(31686004)(81166007)(53546011)(82740400003)(41300700001)(47076005)(86362001)(36756003)(40460700003)(40480700001)(36860700001)(107886003)(31696002)(426003)(966005)(336012)(26005)(110136005)(83380400001)(478600001)(8676002)(5660300002)(70586007)(70206006)(2906002)(8936002)(4326008)(16576012)(316002)(54906003)(44832011)(2616005)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:59:48.3613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bafb3a2d-4288-496a-73df-08dbb2b63744
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9397

Hi Michal

On 2023/9/11 17:01, Michal Orzel wrote:
> Hi Penny,
> 
> On 11/09/2023 06:04, Penny Zheng wrote:
>>
>>
>> There are some unsolving issues on current 4.17 static shared memory
>> feature[1], including:
>> - In order to avoid keeping growing 'membank', having the shared memory
>> info in separate structures is preferred.
>> - Missing implementation on having the host address optional in
>> "xen,shared-mem" property
>> - Removing static shared memory from extended regions
>> - Missing reference release on foreign superpage
>> - Fix duplicated /reserved-memory node on Dom0
>> - Missing static shm node declaration on guest /memory node
>> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
>>
>> All above objects have been divided into two parts to complete. And this
>> patch serie is PART I.
> 
> Just like I pointed out in the previous revision, there is a gitlab CI failure on shared-memory jobs:
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/999098293
> Did you change the interface that could lead to this (I cannot spot any change in the docs refinment) ?
> No Xen logs meaning the early boot failure. Please check.
> 

Soooooo sorry. I miss-looked that comment. I found that bug exists in 
bootfdt.c.
```
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 7d86dffd45..290dd27bf4 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -532,6 +532,8 @@ static int __init process_shm_node(const void *fdt, 
int node,
                             size, tot_size);
                      return -EINVAL;
                  }
+
+                break;
              }
              else if ( paddr_assigned )
              {
```
I accidentally delete a `break;` here, and I will also comment in the 
related commit and fix in next version!

> ~Michal

