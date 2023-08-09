Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B7775842
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580859.909311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgmJ-0002xQ-MF; Wed, 09 Aug 2023 10:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580859.909311; Wed, 09 Aug 2023 10:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgmJ-0002uO-JK; Wed, 09 Aug 2023 10:50:59 +0000
Received: by outflank-mailman (input) for mailman id 580859;
 Wed, 09 Aug 2023 10:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTgmI-0002uI-0R
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:50:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc98129-36a2-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 12:50:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 10:50:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 10:50:52 +0000
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
X-Inumbo-ID: 9dc98129-36a2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFe4HA4Y49KLAaP1LuMJtKAY6YGczGurCwJOeG6H0xwN5CeIqNuOIhdboQF3px3elN+vZ9eMqwNnZ3lHG6GwA7ziG22i77EYeYU2tUfHLFigCSnzAVno5LkpP2/X5VFQ/D59k1zTxYCFjjrZQO+fFuKLtTFYuq2be4+7+A0bRGZH3x3U28Ad+AR5wCX+T3ziNjFiQH+bHMaO25HBBrj+Jo5G6nsxln5ZulnOJF4OnSRDA8N/SNRnSjpkzZRc/WodtGUzLjQ3QgL1hzi3a9dqKDBmAnn5/jJa/6IMoHEi+1FgmLcqtZWsazY3fS0p9sF7PBFqSBGy9SmBQNiWUrYktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1GQHusw4elOucUIan9J4ndko7DdBkW3IAgTLctyzHs=;
 b=nD/Zp7rHCIbGfpbqcbsSBRB27l3c4gzq1WVMupY1pg+Wck/WSr/yjZ0aft502S+uiSJDAtb4AQxhnmZqCXsuwlsPB7gukQxU7cet/RkPGgpKZbgzEUNWV8dlet0j0KVcNEKbBeLmmYLNj7AqILV1hfXyb1waGqcV349OkXJ3FKDV1zj/7hiPqehM9GcPp5GQIAMPOtLE8W5PnifcjQfvzfWNaWOArilR9RceKzNuZ9FGTD88vyxVxwVsRT02BJDtMMPO5pbUgDHil2B/uK4X8eHiP7Ri7+XOFTwkAhA+IO2SDtq34vK4X8p8ZXJFf5cpyxbhOzMes02c4XC5gkRMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1GQHusw4elOucUIan9J4ndko7DdBkW3IAgTLctyzHs=;
 b=HxfG28qdVGP1y3/JAj/I/03DarTyYxsELd6RB31neVHar7Jsl4hgqBclfMqD73xHRj4Wc8Y5NBHo1x/ENMooeeLhLc8J0vl4uaFOxHtcFj7ekoZs5yVN0PA8ac3YXUSmhJj6I0ynO0fGQVFESmEWQoKmz2LqB1YxDbxiaXeiUQsoCY+QwmLMUgD+ztYl/hcBUn/IghoznksKxOBBLiJroku485xT6TQmH8somaaK0SmjNQnAh0l5NPgyzYy9SmJcfudMmkddkxaxp463+mrpi59UBuGN178+Tqolz9yPcOUhXyMYMhPNa/IkOZWU9QVbV/3tj51k/DzHj7IMMe7bSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a62ca6f0-765d-16bc-a5d4-e1ca9303de6a@suse.com>
Date: Wed, 9 Aug 2023 12:50:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] move PAGE_ALIGN() to common header
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: a574a85f-8e13-4896-0415-08db98c68039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5PF2GSZSno/3iS/dS9BqQq4VQgnD8hjqhLqJMCsvteMs2lILGaqlcUfg7kacI0QHxZIBOZOCfpSAMcHyUuen254FwCO7sffJYLqCzebTOR4mS2xsoxORRdFtHZho1W+nkyGhE2themhM0mpRkAhDlY28QBhfgEZOr4d/gtnfBgdSoyQlAzdkM/bU1LFE1By9Z8VhvuoDnw5sOBD8kGslc/LcGg8THy970hHfJxP18tpl9mns46gLMMMZcKgBPmhfZXnE1HBUqcyaddP2eyhAdbwSDBvtX88ipU6OU4OBXmVybhWviGRD+/KhN+Ibh/rB+FeEur5qaofGZrMWy2Y0IJzYTNzL+gdsfuRE4E2xgo/zXRIPhyIFjV1SlUnnxtJ8EwLlTUDl6dZ2iapb+4Zq601Iq3xs0zirEsiT8zuwHSM4wTS/f+erwssVkJLV+z+j1Kicm9Ls2m9eXwkjRDv0Gtz6UU5+CYfuHhHoBIkKBo6wukNsKkTp//8r1W8oD1B9kHEAH+GFgKs2V0U6Lb/rGT0+2ZsoMv4uiUtFIg+Ps9h/Jq++MLUVph/6K1EjnZ0OgLx1+Saa2FsXJ3UytbXmqJsHMnPeDAbRjfWbdgBjzJRwT4B47W05PUYk+ByDJWPpLFEqGlm3V9o3Ts4uw9Tacw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(1800799006)(451199021)(186006)(7416002)(8936002)(8676002)(5660300002)(4326008)(316002)(41300700001)(86362001)(83380400001)(31696002)(6916009)(2906002)(6486002)(6512007)(6666004)(2616005)(6506007)(26005)(36756003)(66556008)(66946007)(66476007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGtDVWp6R1BLNnU4ZVFud3ozK08vNnJLU2pjUUs5MlF3L1RaRTlNNm9zb3R0?=
 =?utf-8?B?Q1NJRG92azZYTUc1RnZmazRFeEpZRFI3aEhCQ0JFaC83bWh2VjloVExZbjk1?=
 =?utf-8?B?SCtxeEpPcitlTndTK2lMd0w2Mmc2OGR4TWdPbG1NRFZzMzBvZWQxTTZ5YnRt?=
 =?utf-8?B?cnhwb3JsR29iQ1BzYmdiNktGVlU5SkFhV3pwS1VGaGZmS3RlZENIQnI5SStO?=
 =?utf-8?B?RWE0VHdScUNvdm5ud0pxU1VTOUlBZk11SlpWandYcEM2OVV5SmJYaEJHeFlZ?=
 =?utf-8?B?Mi9XaXdxc2srYVRjYXQzSWlUVDRlTkYwL1J6c0Y0eVgxc2xpUENjOWdyTWhr?=
 =?utf-8?B?c0JXR3prS3hPN2VvMk5HSndxcWU3K2xHaGdrTGtrQ2xuZjFVS2c4Z2UzM0xI?=
 =?utf-8?B?bmtUVk1pL3VwdU54MlFzeS96L2dPUWsyS2ZkcURETzl4R2JqQml6UFpMUnpS?=
 =?utf-8?B?UzBSN1ExYS9vUW5zUVJhVjF5RHFNVjR4c01xVmp2QTZmdlg4R1ZXeVZhLzVM?=
 =?utf-8?B?TnVCUmJ4dVgyNVl1b0NMK3JYNDcyU2dYU0tLUUFoRE1KL1BNbUdtZ1Y5eHVm?=
 =?utf-8?B?N3phYWk0VTNpclJBL1JMaFgvdm4zOVVSeUhlNm9VYnBUOWhtWmFQWVJycEcr?=
 =?utf-8?B?RDhYQVFJay9WWVNwUXJXQlJwUHVnbndrWjU4U0dha1dkTGRHd3E4S2JSWitB?=
 =?utf-8?B?dmp4NklMN3NwMUVBaWQ2b2xpOCtHa2FYL2F5SE82QVhyZzA3czVWM1Q1dk9P?=
 =?utf-8?B?MDJPaytaU0k3MVF4cTlVdXpzUXJreHQ1QWc4NlNVcVpEK3NlclN0ckpVVG4v?=
 =?utf-8?B?MERGeEJ2TWRraGdOczlnZUFqbVRkTGozeXN0anBKcU1NMmJpT0dCMTZFNTd0?=
 =?utf-8?B?cUpxRENXZ2xNRUdlaFlnTjZnT2VNZDRKQjl6RDFSMUZ5bDg1dlV6NGdlSGhQ?=
 =?utf-8?B?OGx6eWVsNEY1SW5WZlE3Y1Nhd2VEcGNacGZzdWxVNEljYkNjTGF6Mi83dXAx?=
 =?utf-8?B?QlYrNjQ2eG52ckl6RWZ4aTJOanhuZUhuakpMWHp1RXJxRS9PbHRkSFQ5L0hR?=
 =?utf-8?B?OW1NM1ArU0VRVlJPTGdkdTFoQVdxai8yMjdjai9JV3gwMExtR2trWGV1Um9X?=
 =?utf-8?B?NDJMY01iclhqSnpoRkRSOHowMGI0eVpHWkk5cnVrck9ONHk0SEdmbjVpcWFs?=
 =?utf-8?B?TzJyb3hiZkg1UnpmdmZZcVpOdWZvemdZUDQ2aEszaG05cmdKZzZ4SktOZitu?=
 =?utf-8?B?bUVsL21ZcWxUT3hLbXREUCthVkFLWTZQL1IrTEVyVm1LWXgwWVdWay9Md2Zp?=
 =?utf-8?B?UU9XS2F3UWIzZ3Jvc3QvRkJYT1AvVldlNGNsR21ubzVtYW1XZkxObWhUSnhY?=
 =?utf-8?B?R2JGSEJlSUFDeVl1Z29UV083RzNzTCswQUJGMXFiWTlmWXJBSTVxU0VvSUJE?=
 =?utf-8?B?Wk9Ydlh0bVpYSmw1cm9sbHkxTDhIdmhYUWdsNXg1RjQvRjN6T1NoR1AyZmxz?=
 =?utf-8?B?NlNqTyszZ0JGUzh4S001Tzl3UUhJaE1Vd1lRU0dIaitoZHRVamR3Ynk5M1Fn?=
 =?utf-8?B?MzV1QnMwWENrZjUwU1d4WUNQUHpKY1FyNTBFVTZrUVVHUHpjSUMzdFgxTzk2?=
 =?utf-8?B?cFN4TVZFcXNsUUZUZWJhdkRLQlNwaitoSHhJQXhHRnZJeTh3aDZlNEMvTU1n?=
 =?utf-8?B?UFZqT0FYUkZVV3RpNHBKNUtoeEw3ZUhxVVBtU1FGVFZ1LzY5VTE5d0M0dUsw?=
 =?utf-8?B?eEZkVkc0V2dsTHA4Z1h2VEdHUmR1emxxWEw2NFB0S3VPdURVelBjL2V3Y1oy?=
 =?utf-8?B?QmtQNU0wbXJEN3VRTmY2TmpucDVxTXJsTVBiaEFETVhoMnZuTG9tTmxIWjNm?=
 =?utf-8?B?RERIYnJTRjR0UCtOSW9xeGdiZTlyNHZaSmhXV0F2TTJWOUxSeGJuTzh6YWxn?=
 =?utf-8?B?R3RzMlBuRG9GejZnM2puRlJqU3hGTGF2WmUzbTBLOGUwMzI3MGtNR0x1aFdq?=
 =?utf-8?B?VzJnRVhpN3RVMko2Z0QyemFBdFp0ZFhBM0dISUhlZnhOOE5lUFJxVEhweldY?=
 =?utf-8?B?Sk1KajFiQzBlVzdHZWFDUFRsR01oVnFaUlRKdUppa3l1dGFFQVBwOHpCTFRD?=
 =?utf-8?Q?4iFq7RPfjNrLffx98Ki32Ta1u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a574a85f-8e13-4896-0415-08db98c68039
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 10:50:52.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OT+YVVvXuHxPNbkjIBXM8R8SkDOsXqnHpeFAX2hfk1j9Go6KkbJkGEKfuVjeH4p3FJCWcQQdgCqW1mIVYQlH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9067

Much like we have PAGE_OFFSET() there already, there's also no reason
for each arch to define identical PAGE_ALIGN().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -303,8 +303,6 @@ static inline int gva_to_ipa(vaddr_t va,
 
 #endif /* __ASSEMBLY__ */
 
-#define PAGE_ALIGN(x) (((x) + PAGE_SIZE - 1) & PAGE_MASK)
-
 #endif /* __ARM_PAGE_H__ */
 
 /*
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -404,8 +404,6 @@ static inline void invalidate_icache(voi
 
 #endif /* !__ASSEMBLY__ */
 
-#define PAGE_ALIGN(x) (((x) + PAGE_SIZE - 1) & PAGE_MASK)
-
 #endif /* __X86_PAGE_H__ */
 
 /*
--- a/xen/include/xen/page-size.h
+++ b/xen/include/xen/page-size.h
@@ -10,7 +10,8 @@
  */
 #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
 #define PAGE_MASK           (~(PAGE_SIZE-1))
-#define PAGE_OFFSET(ptr)   ((unsigned long)(ptr) & ~PAGE_MASK)
+#define PAGE_OFFSET(ptr)    ((unsigned long)(ptr) & ~PAGE_MASK)
+#define PAGE_ALIGN(x)       (((x) + PAGE_SIZE - 1) & PAGE_MASK)
 
 #define PADDR_MASK          ((_AC(1,ULL) << PADDR_BITS) - 1)
 #define VADDR_MASK          (~_AC(0,UL) >> (BITS_PER_LONG - VADDR_BITS))

