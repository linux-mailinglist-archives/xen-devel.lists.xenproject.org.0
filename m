Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B7755F0F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 11:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564322.881777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKMK-0001hE-AA; Mon, 17 Jul 2023 09:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564322.881777; Mon, 17 Jul 2023 09:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKMK-0001fS-7M; Mon, 17 Jul 2023 09:17:36 +0000
Received: by outflank-mailman (input) for mailman id 564322;
 Mon, 17 Jul 2023 09:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLKMI-0001fM-4D
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 09:17:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2198d2d-2482-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 11:17:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8669.eurprd04.prod.outlook.com (2603:10a6:102:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 09:17:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 09:17:29 +0000
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
X-Inumbo-ID: c2198d2d-2482-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+MURylTSZoiIKg+YtxxSERyVfGL+vvilbBXujGoQ00ClTUaDwmgIjXKMXU9Utciyl/C+coCgccz9SdjfiezgoVCFG+dlImsYBrYzxdkEu8tJwLwl89Csbe6tgZ9tRVRfz4STF+XcY2SChuCxhgLJTtE4acQ2KEohY4Vybdesm7Z7AgFJoQspiiUNbiZeacbteC1933B/LiTfDgVteQrilWtvMcpZyCazdl0MlTo3DUEJIxdK6KurMoQywLJocPuR/JeFA0/8QUyDLyPlRcYGK/GPxAxnNLzkCxAB/XahkX7TOO/qtFo1JSmd8H28BVmgIlKwOd+uABkzlt/dLbZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg1MyTl64WbsP+vCmW05qoprI/VUJcDhMZmUUEZysCw=;
 b=VI0siWFVnRGAB/bT2cktqOVXE6nRdV7D2XuYjY3sGV/nk3KfSRYnGEudP59mAOjqaKcpfFp5BpwOdEEuUQ838BMH+TLhUmIxkAL0wS9JItYO9VyaeRQG+ELX4myh1tLdySW9FVb4VrlxdhaRVM/ddBVGQ31R7nkgwaXmSc6JnUrp8aB1J9bPMlepTL0VsJNlO1cft82dyrNCA0qcUwEBPaoZtjfOxfJi3mhlGs+hBKFUQ0iMGWNY/S8dNt2ibtm/OuLJgDJ9Jj9LVU+Fo1W/tIYh8WwoQ6a7iIQkNHbz+s8Hn7N/xPmJTt4ygb4+JTmRKenIcJtBmxwfC39pT+nfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg1MyTl64WbsP+vCmW05qoprI/VUJcDhMZmUUEZysCw=;
 b=mI53oAiLJ6Cf8Q0kyb9hfPrgUyVJH8gUYw/eVqj2yeoBpGPUq7wPzChYeOumftPi2W5TYbhwwGdHTarNIINI7sTYGvOD6Dzp6gtD4Sl7ER7c9PA73zQzNM+GZQvh9ExicItgPFPM8CgVRNLL7/h2KWgpzLXs+EF0f9TIUkvyQxInwNoxkHOhMqjPRMTa3RAxEiFyDqk8rm8Mtu+NmXTGWWx5qe6CclfPbhmEr8QOA/XFrTQssuKPpRhKAxYbWY54a0lo01zTGVXz8aCt0MYcu65NVskcqcyqdj373weP+LhshpMNnxSCe5fIpMcazPlwDhgy/fIkqtgTmne7K/CkxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df2c3154-2e8b-194a-ec1e-472819bbf026@suse.com>
Date: Mon, 17 Jul 2023 11:17:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop old (32-bit-only) MSR definitions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f20ee3d-8cac-4e61-a7b8-08db86a6a518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4AzIyDWiLXWn5nmWlosnzRK/tG1KDf0t+B17lKMxm+niAD9n0f33zaQyAl0eeHF5eX0lxYKNEfQ4hQvnxKSKSN+RoY+v90CUf+niN06eCncaH/ORcVJhTMB6fxsaqx5t+64efOJpQ3JZeHCJ2FH0FcNJ7uhl7xTeX8BoqOVUA/jm9UzbhAb2zVvqJ3E7hIYiBg2ezMVXUPnUWWfnmAEUAnN2ozRXMLtwjCA8V7TPIGcuY9DgvvV6RO0gdDUXkJAXzfFjSdw03L2T1Ho+niZINtwmsccY1zl7SCGW9V8LDctYbmTvy5SN+j4N+ibtXMuqhNoCQraWCYh7q2nBrx5VmZRi60oPrJYPGl0cqz4zRk006HjMolHq8QfbGdK2pwNYPYCJnyWupm1TEdZf9fsq/pkN+e99RynLZ/cYqyecN6gpSMqQQV7R+AfJrEdcgJhvntGKX2BgmgMExEaP9yxxaLLjshGP3JTU6ApNDy79iEjKm1feRrM7IN+M+me6NVJRVRt9psblfZIUBbW4nR20fKmHt3Lic1XczO+JOWcJvQBL4/fBHqdXZcFkQKvqoIahBr07eQYSZCh6viQJcb1igoCDyGvRvjNlzCGTHdosmZW7uJqDOR5SBytBc3VBQ7jruipvJPuWBAR3IB7ZTr7B+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(31696002)(6506007)(38100700002)(186003)(26005)(478600001)(6512007)(6666004)(6486002)(54906003)(8676002)(41300700001)(66476007)(8936002)(66556008)(2906002)(6916009)(66946007)(316002)(4326008)(5660300002)(36756003)(2616005)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUxkRVVRakx4UGxQY2lybjdoRnh3eE5hSGpXWHBlUmJkOXZLcEhqZkVUeUJX?=
 =?utf-8?B?ZnFaR1licEJ5czBNMWl2Um1CNmd6N3czZXh0VVRpYndVajhpOFZvUno2V1pI?=
 =?utf-8?B?NWMxaVQxU1I4SWplZG54eGFaaHlDSWFIcVBSWFNQbDYzbENkV0VNZDl2eHdU?=
 =?utf-8?B?OUFuM2JON044ZXlwclUyclQ1MkdXdHFWREpDdnJoa0RCNmxaN3N5aS8xYWVx?=
 =?utf-8?B?NjFjNlB4K1huM2lwUzU1bDNxLzVxTFNVZFFsWU15OXhiNFRGV1dybVNLc0M2?=
 =?utf-8?B?TEF1QkpZWmFmMGxzMGx4dlV2WWd4MEtWUVVFSUhYM3BORlE5UXhVdXdHaEtz?=
 =?utf-8?B?czBYUlJTV3pIWWJ2NU1FdWg4VXVXdURzQmFZT2pzUzF2L1U1c3F6cDBwS1k0?=
 =?utf-8?B?Z1BXdk9iS1NVekN1ZDk3VGhLUDhxYXFHOGdiSDZyWU9qd1VLK3A0WnZxOTUx?=
 =?utf-8?B?SWgzWlhjVERJaXAxMkcxYWlmcDdLVUFkNnhZZkFpZUdLZGNYcldlckJ3VlNE?=
 =?utf-8?B?K2xBMXhhNENkbVV4RmFUallwWGVMTE9RMGp0MWdQTE1NeHI3Vzk1bXQxV0pD?=
 =?utf-8?B?Y0JKTzBRK3lOYnNnbEhKZ3duK0ZvV2VnbndsRk83VzFmTjRKYXllYmlsQjBS?=
 =?utf-8?B?UUNTY1d6NG1vbGp1d2tZbys3MGRkTmUrZXVaRlpxanRFTnFFOHBIekl5Y3Y0?=
 =?utf-8?B?VUxsdjdiaE5kekJ2M05Hd2RSaXBVbGNHaytNalF0em45UTZvaWVSZEkwVEFl?=
 =?utf-8?B?a0t6S2lqMlFISlYvdVQzOTNSWDJSVEsyQm9TU2RnWnlxREROT3VWU1BlVEFl?=
 =?utf-8?B?K1NqcWEyWUpwdmMxdmFBMVRDREpYWUhRUldZL2t3US9NcVVPbVR2SFNub2Zn?=
 =?utf-8?B?MmtaVzRZUE9NeTlTWG5ZNWFlMVFPWWdRTEtQSzJTd2ttdkpBR1YxS3NKL3NS?=
 =?utf-8?B?KzRjcktNeTJZTkh2SGtrYjRod0hjdXBoYXROemJ6RDY1SHljaksrbnZKK09N?=
 =?utf-8?B?WXRWM3BWSXlIVzdnM1hSeHdIMHBITXNyZ3VVdFlGUHBoNE9HbGVvV0hmakln?=
 =?utf-8?B?bEZUR3JJenpWWnVCVnZkWUtmQjUxMmxMOGF1dUJzQ1ZtWEpaZEZyTzNRdCtM?=
 =?utf-8?B?d3ZLeUFnZ09KTkRRMVVyTGs2ajVZNWJ0WXRZN3ovU2J4d0dZd2R0U2pNWXlz?=
 =?utf-8?B?U1NSY3lsMVZCTVkzcHZ3Mkkxa1hsMUg4eTRmRGN4eld3UG5RYjg5ZndleWp0?=
 =?utf-8?B?WUs0T0RNL1d6aGZLVjRoMnJnYlRVTGhRVmNKRjliM0F1NkY0eUM0bWtEbFNo?=
 =?utf-8?B?bFN2cURVOGRPdy9GZ1J5ZC96SUtFV25UeWxJbDhIYjhqK3NPWjBGUFNUS0tu?=
 =?utf-8?B?L0l2SVlUWDJTVjdqeVVSay9TQlRSSE40OHdTUm9FRWtxL0RrZis5S2xYRXBJ?=
 =?utf-8?B?TERzcXhJV1R2T1I0d3E0VzY2WUlJSEJBR1lSRCs0VTBmM1U2VXJqT3N0cVEr?=
 =?utf-8?B?dVMreVRDSlozY3pkeXF5d244cC96OTZ3bG5aS1VXVmR6UFczVGFna3krU3Ux?=
 =?utf-8?B?RlloWG5SazVlUW1Nd3RDSHlpVlQvakhlRDVrYWpxcGwzNnlyUHFDamV2bE5G?=
 =?utf-8?B?NDhSeElVUTJRZ3pSM2NpV0xlV3VHUzVhYkNXd3c4RElZUUZPWDRZWk9mcmxp?=
 =?utf-8?B?WG9WaVgwV05xc0Y5Q01pWlhNcGlnOExEUENVNnFOZTBBckVPNTRmMlAvUlJi?=
 =?utf-8?B?Z1NvRHpnbkx2amdHenI2OHB6eklNeG5CZG1vdDlpaFRDMG1qOTZyVlNrYlpO?=
 =?utf-8?B?WWZtNTc5Z09zeGZHTmxaR2x5RCtOZGxsaHorcVoySTVpRnFQa2ZVRHZrUHZP?=
 =?utf-8?B?clJxS096MWJTZXVjaVoyRVFReVAxcEUvcEM4cWRpU2tha1NQUTVvTkVjN1p0?=
 =?utf-8?B?M0R5QnNQRTdMaXRIcUYvS3hSd09QKzNBSEQySXd2OHJZeGp0ZCt1MCsxa09E?=
 =?utf-8?B?NXpWM2hUUHFuazBRVDcraElDRUlIa0tOMFJZYlNvMnExM3hFNDlvQWQ0bVUy?=
 =?utf-8?B?Y3ZQMTBGRW5yb1lROENmMmNwZ2ZjaCtmaDlyNFN1TUJIdjRmcWFnZ2VTTWhy?=
 =?utf-8?Q?KUyzD6+N+QtTrOEVrYPOSsIgo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f20ee3d-8cac-4e61-a7b8-08db86a6a518
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 09:17:29.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iY64bSB3HDfXsGB1npAPylDhmztJkQxnYYoDdllwPbrBKwhEc1+k+HPxADe7QnQlIHdLvWyWwfs2F/laZHtbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8669

Some of them aren't liked by Misra rule 7.2; rather than fixing them,
drop the affected ones and a few more that aren't used (anymore). (Note
that e.g. some MSR_K7_* are applicable on K8 and newer as well, so need
retaining.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -334,7 +334,6 @@
 #define MSR_K7_EVNTSEL3			0xc0010003
 #define MSR_K7_PERFCTR3			0xc0010007
 #define MSR_K8_TOP_MEM1			0xc001001a
-#define MSR_K7_CLK_CTL			0xc001001b
 #define MSR_K8_TOP_MEM2			0xc001001d
 
 #define MSR_K8_HWCR			0xc0010015
@@ -427,46 +426,11 @@
 #define MSR_AMD_PPIN_CTL                0xc00102f0
 #define MSR_AMD_PPIN                    0xc00102f1
 
-/* K6 MSRs */
-#define MSR_K6_EFER			0xc0000080
-#define MSR_K6_STAR			0xc0000081
-#define MSR_K6_WHCR			0xc0000082
-#define MSR_K6_UWCCR			0xc0000085
-#define MSR_K6_EPMR			0xc0000086
-#define MSR_K6_PSOR			0xc0000087
-#define MSR_K6_PFIR			0xc0000088
-
-/* Centaur-Hauls/IDT defined MSRs. */
-#define MSR_IDT_FCR1			0x00000107
-#define MSR_IDT_FCR2			0x00000108
-#define MSR_IDT_FCR3			0x00000109
-#define MSR_IDT_FCR4			0x0000010a
-
-#define MSR_IDT_MCR0			0x00000110
-#define MSR_IDT_MCR1			0x00000111
-#define MSR_IDT_MCR2			0x00000112
-#define MSR_IDT_MCR3			0x00000113
-#define MSR_IDT_MCR4			0x00000114
-#define MSR_IDT_MCR5			0x00000115
-#define MSR_IDT_MCR6			0x00000116
-#define MSR_IDT_MCR7			0x00000117
-#define MSR_IDT_MCR_CTRL		0x00000120
-
 /* VIA Cyrix defined MSRs*/
 #define MSR_VIA_FCR			0x00001107
-#define MSR_VIA_LONGHAUL		0x0000110a
 #define MSR_VIA_RNG			0x0000110b
-#define MSR_VIA_BCR2			0x00001147
-
-/* Transmeta defined MSRs */
-#define MSR_TMTA_LONGRUN_CTRL		0x80868010
-#define MSR_TMTA_LONGRUN_FLAGS		0x80868011
-#define MSR_TMTA_LRTI_READOUT		0x80868018
-#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801a
 
 /* Intel defined MSRs. */
-#define MSR_IA32_P5_MC_ADDR		0x00000000
-#define MSR_IA32_P5_MC_TYPE		0x00000001
 #define MSR_IA32_TSC			0x00000010
 #define MSR_IA32_PLATFORM_ID		0x00000017
 #define MSR_IA32_EBL_CR_POWERON		0x0000002a

