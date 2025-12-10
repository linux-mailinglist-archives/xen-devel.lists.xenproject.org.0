Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25FCB2931
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182718.1505563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGbj-0005eZ-BZ; Wed, 10 Dec 2025 09:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182718.1505563; Wed, 10 Dec 2025 09:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGbj-0005cL-8X; Wed, 10 Dec 2025 09:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1182718;
 Wed, 10 Dec 2025 09:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2u0=6Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vTGbi-0005cF-0V
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:35:38 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94673efb-d5ab-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 10:35:35 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SA2PR03MB5676.namprd03.prod.outlook.com (2603:10b6:806:116::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 09:35:31 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 09:35:31 +0000
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
X-Inumbo-ID: 94673efb-d5ab-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/bPlColAkYYETPlvd4wUvhJQb2wpiKWaPM4dMS5ZzrrFQqmv22E89Vv9IRGtytw3sWBOTIzcPKqxs4fUTdzBsvak0s2kV6So91KYRFCb8j02eRsybrC2O9U1lpxHVWXLypnVhY+ioBIMjPcdYwGG/TvOQxKwek1UXnzKageAjJ+r1YY5siJAP6nZypkVGh5+MWhi/vUglQDTpck2XaLi3UCxneoy0+2zvetmzQI0/dU+WsQofd/I4uE9+e0seIdNprQhy5m5t3xIe8lMbQmwHt2a5hBvjYYBBlGnK5QDAnNJVdlmTc44cDEUN8oQNt3pblnG7CpSxEj7Lksg+zvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BF2tLEa1ciGn4FPlLPIZRHS9g5i/rlx0nNwf49e0PUY=;
 b=AWhfakboagIiiUdqsF2BMrjBkfWndl1s26ClKtz0a+GR/SWK4XI4i4FO5eZ5FbWQkf8zT6gCtTePOSUGIeuI6nZPZVqNiJDwzxWfQofH36vJIjAabAr40U5FvKiSGDNrhq8KWgAb87Y3g5IQgTEuM1/m7/OQiq2qBPXr2IfcrBbxjhBaH4pxFr39rQ5e4BB27lDNeDJNOKAe4QN85SeeYysIE9fzfx4hMvl7t0jjaNohFGqpE3MWDQs26I93TDuV74Lu5aRwpTvKz7ofkUZIcB8qBazsIXTQba/F/WhdlAMyrMZP0eZrdnyahj7c7eiJphLvAcR1/SeizAOrppTIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF2tLEa1ciGn4FPlLPIZRHS9g5i/rlx0nNwf49e0PUY=;
 b=hi37Gq0TbuUW+Ub6e/DaHlt9Nzx1CYLyeeq10jrmGms9RcuCQzkdl0cuHIYvN8WmTJc0D4essMfhiC3NKUY8hjN7KSY+S/lxs7FWHFKsWC3V95q4iPDk2z8GSxuBS9o+5o+TsJGOMB5oFr1lgbcFxqqlnHFe9bfyFTMPA9FcNWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pod: fix decrease_reservation() clearing of M2P entries
Date: Wed, 10 Dec 2025 10:35:13 +0100
Message-ID: <20251210093513.59534-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::7) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SA2PR03MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 7930c043-dfb1-4580-946f-08de37cf7620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUZJZVZiOXlmRFVRSFBYUlBaZHBwRGh3c0dnNTBXMTNCMFVuZEV0SmZQd2VK?=
 =?utf-8?B?S01PUlNMMWxWekVsYXUxRnpja0FFeXpUSmI1Qm1Bc1dkT1VEcWdFdmtPWU0v?=
 =?utf-8?B?by9iY1JrSlBDb0JaQXJXMHh0d0hwMURaRVB0R05lYnZLUTdUSmRHbXpteWRp?=
 =?utf-8?B?eERZeVhiS2NxSkV3TkV3YXRrRUtzWkkzL1owcGRBT1VkeDY4OGpjSGsrUkxq?=
 =?utf-8?B?cW9iUTRWN3NvTktCWkY4SU9QWDA1SkNJclN4ZTgzS1k3Nm9Jbm5zTG5WVUkx?=
 =?utf-8?B?cVgzV0tXRjlqaERFS0NINGZ3dW5PTk5OYU5QemkzcDlXdjJGRzZzL1I3cDVF?=
 =?utf-8?B?MUlUaUh4RDMvT1dMYzNDQkhqS3kwSDY1QVRVMitTSmJWQTlwcjJuM0M2dExj?=
 =?utf-8?B?TlpLdmY4bWtFdWNMcmZHZXdTK3JqSTl4QzZZU050b3ora0lmM09YNGhCQjlU?=
 =?utf-8?B?ZWdaeC84OFRwU1RpQzNCVjRJK292U1Y5S20vS2tCRE1PTmgrRXJOMnJucEhj?=
 =?utf-8?B?ak5IL2Q5MVYyL2hhT3p2bXhDNGg1Yml6dEhuMUdwQWU2YS9zSTZqWmQ5QVk3?=
 =?utf-8?B?MDhmdHNjMGo3NHVNeVJqL09nT281cVBpbE5KY0lYL0R4eDlDd3Jud1ZHNlZD?=
 =?utf-8?B?K1BJTDViK013SFNaMVRFUHlhZjRxYnAzcFJtMWZUeEFsU05jK1hBSWtTZlZM?=
 =?utf-8?B?MlNuMG9UQTBKUkhSLzh2Y0lyd1RDeFRrbEIyRm9ReXZoa0t0SWhvcnVvQmtF?=
 =?utf-8?B?WjV6cWhtTmVMQ1hFS0VWbE1TZ3VmSzA1VGtYNnR3YW9ZcUdJTUo5ZGZHOXZK?=
 =?utf-8?B?bFBGRTRoNmdlZW1WVzBNSkNyUS91UThnNHBTWlA2VkVDd051T3hGKyt1NUl0?=
 =?utf-8?B?bGJqRHRsRHdVUHpaVjRYNE9sZkNLYk4wKzUyY2lVM09EWUgrdjBRMFFNNSsy?=
 =?utf-8?B?TEtrT3JHaW5rMFBSUjVmdzNJQTYxd3IzS1l5a3FzcGhHMjRCZjhIdHdOa1Iz?=
 =?utf-8?B?Wm5RcDVOQjViMElXYzNnSktvNHIrTk5Ld3oybkg0RmpuMnl6QjR0bWU4M3dz?=
 =?utf-8?B?V3ZFZ0tjdjJHRXZmZzJwUmdnWDNqYW1qUzJoLzlXNVJHdmR3RmxqaTR3ZUhN?=
 =?utf-8?B?ZmJTU2Z5TjJTeXBidFFoZHlyT2VnRHArN1FERFk2ckF6MFJCQW9FSVZIZVJC?=
 =?utf-8?B?cXFWRXNZYW1mU3VJcjdDUnlQWjJseG9BR0JwVzFYQ2VPOTZqSitHQ0NsTEF0?=
 =?utf-8?B?ck4wZjA1Ry8wemw2VTFMOE13ZlE2OVcrUnRadlE1enZ1NlArZHJNODVyK0V4?=
 =?utf-8?B?NFBVN290UUh4ZCtMSVpOODdhY29RTkM2YnB4bVlwM3ZhMGE3OEI1UWFxNWtC?=
 =?utf-8?B?ZUhZbm1jWHZzWWtZKzlXRUlFMVRwa1AvUWE0OWJhazBKSWVXSERkWHB6a0h4?=
 =?utf-8?B?WElsOERUdFlaK0ZsT1M2U2RQN2IzNzNmS3pOR2MrdmQxYVY3bFhDc3E2Ym5I?=
 =?utf-8?B?THpIaEtDNEVCaCt3YnhTclI5WFdMM3ZJbGphcUdJdmpuWEhRZ3l4U0JyMVhG?=
 =?utf-8?B?V0Zyb3JUTWJRODQ2UUpuemZIQVlWcjJielo4aTVOYm4vZlMyTWdBYytKaTE5?=
 =?utf-8?B?YkNsOS81cGFKeVFPcm1PWHY3RVJGbEUvQXNLaU1OaXF6TTQwbU9RVElKZStp?=
 =?utf-8?B?by9od1NmdlBCdG1kSnAvQlNxQlU1b09zaTVEWkx0Q3VBUE1TendrTXdlSHIx?=
 =?utf-8?B?eTR6VlJTdElnNU5GdmI0dTkwV0FzZmU4aFFlQWdvR1ZLb0p6WjZ5V2xKQjN2?=
 =?utf-8?B?NDE1Nlp6Y3hUby9CZzFUclIzQzFiYlZIN28wQkdKbExONDcrNWFoSmxQeFpu?=
 =?utf-8?B?TDZVRUNxZ3JDVmJUNGVtWXJEOVhmb3NxUHhYU1Z4ejMzVU9mVmxIMC85VUt3?=
 =?utf-8?Q?zB1lB6g+eP0GKYuUx2xBPcXPTSGMaBdt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBpSlhwei84alVmaW5mZkNFUTBXZkJFZWZzN0R3YlBKR1ZuUTBHd1RNNVA5?=
 =?utf-8?B?TTdzanpmRklIZThtdCtRV3FRMWVIMCt0blViT254OHVCK1I5S2hjVnRZdEZ4?=
 =?utf-8?B?ZkZGSFpna0ZabUYzNi9lZnh5NmR3RnUvaWdrUXh3YzVwWHJpQUlSK3N0Yyty?=
 =?utf-8?B?NGNxUTRLNWp5ekNGdXk4eDJmQ1ljNXVZRFNyWkZ6a0hIWEpLZUlHbWxjbHhF?=
 =?utf-8?B?UmN2L0d1dk5uMzlSc2RYRy9zUWU4OXo3M1FzeG5sSmpLZlMra2wvNFRKbjlw?=
 =?utf-8?B?RXBtTzRIRllCamZJcFg0MmQyMnoxdXN1U1ZqUUFHWlJZazhFRXk2a3ZBc01T?=
 =?utf-8?B?Mk5FajNPZzY0ZFZvRjhHT21lcmhobFdKVWUxYmpnVUZISmd5S0N4SkFaeEto?=
 =?utf-8?B?VndCd1dHTzVzRzBVTXFEMm01MGVHaUM1Y2JRNGltdHV5VzMwZ09zOWs3aXJr?=
 =?utf-8?B?NTJtSVBZVnVJYWNqbXRZK2JDVlA4SG0wUWpOeFVBTTFWOWRzam1kbjduclVi?=
 =?utf-8?B?dDN5NDg1UEM4UTZCVGdlQkNxdmo5U250WmphR0JFbEtVcnRaVFBMRTQyYmJ5?=
 =?utf-8?B?S0IrcE8rTzE4cXZLWVVvZlZuVnp0VTl4ZXIwQnc3MlZsb0dtbWZ4aWdXRGxi?=
 =?utf-8?B?RysxYitkdkZ1RVdtcUF3cWdCQ0hmK3Q4MkVRVFNTa2MzYmxkcE5adW90ZEsx?=
 =?utf-8?B?bVRxUHVYalJvdkRLRWxTSmpQTTBHblBDeG00MG9wdnk2TjUrZzFEKzFobjlB?=
 =?utf-8?B?OVpHbmNlQnI5T3BsSmpRVkg3NTBUVWdheWZJcFBaUnZHOG83MjVNdHR4R2kz?=
 =?utf-8?B?R1dDK29lMW1LVTNISkF5eGF0bW54N0crcDVXM3JnRHRiZWxsTEFIMnpOamc2?=
 =?utf-8?B?U05yRHFGcEY1L3FpZHpZV09DMEdZVGlzNzEyV3VCZjQxL29aYlNxMlZhaE5X?=
 =?utf-8?B?QTNPK3h3bllqRnFIdTBJcG44b0ZEZ28vTmRTSWlZbnpZSnRPTzZHUGRnUkt6?=
 =?utf-8?B?Rmw4NEQwQjFkK0JHV09jTXA4MUEvQjB1eFhDWm8wWHhXSHROWkNKUWRzSEtU?=
 =?utf-8?B?eC9xV29UYmJyWXdDRWRvZVdpRnZIWWtHVFVMWXRhRnd0TklRMC9SaUdKeEJq?=
 =?utf-8?B?azl1NS9WWTlkdzRlZ3ppUHZJZ0RhK1NSeWlENkhMNklObEtzVCs2Mi9YV0lL?=
 =?utf-8?B?VlNSQnFkUG1mNWZ5UC9hVWY4eVIzcExuSFNydGpHRUEvUlZORUpMYndSSitK?=
 =?utf-8?B?QVBLS3RvdVpYaFlNSjRNb002ekk3cWlJaVJXeHA1Q2kzRFY0TkkyazFndFVa?=
 =?utf-8?B?V3dRM2NoQVpSNm4rdlQ0K1c2SDlnTnh5ZmtkS0hSZDRvMDdsaVBkK2dpSGNa?=
 =?utf-8?B?SG9YYndSVys3bVVaMHp3cituNnN2cXYzWDk0cThYRXdiYXpkRmpHVlRoQ0hx?=
 =?utf-8?B?Z08xTUdPSmtQVm5DQ0JlRkxsT3U4Snl5aFltWW5zbFdOQmprUTVRYVZEb084?=
 =?utf-8?B?djN1cmRVWWswL2pjbi9EQ3ZmOGNEZDAvTzlqUUJIQy95bVJBRks1OTRnckQ0?=
 =?utf-8?B?UkFPQVFnajhuNUtFUmt2NzhkcUpWZG9PQXc1NmlSb3BFamwyUlIrREM0Rzlt?=
 =?utf-8?B?emVPV3UvK2FnQzYvcTVaZS9IK0pTYUh0ZDMyVmFlUEY2UjZXRGdBZjhxZWVB?=
 =?utf-8?B?dUc2TWdrUFJ5RzJ2MlFPTFNKYS9LeEx3d09keFFXaCs0Rzd4cFUzaTRzRTBS?=
 =?utf-8?B?VDdJT0IzVUZKL2VwRC9oMlUwcU9idE8zUmNaTGpDdDlXazBMalZobTNBUlpa?=
 =?utf-8?B?VEUrL3VyR2pnc00wTG1FbGwrVTM2djl1ZTNmZ0Vabk1UL3JYNVZrWHNxU0hM?=
 =?utf-8?B?elZUR25qVmZCVXNnZTFNbTZRM242K214ZjFaeGdrdFMvTGlkTE05cVVqUytM?=
 =?utf-8?B?QURyNURCWmlUbUh0R29ESVh2cHBnVXcxS2tKamNEZm13ZFV3UUtvZGtMZ0Vv?=
 =?utf-8?B?MlIwL1pJQlRieUlMbi9zNFJGdy8zOWl3MVpWeTJqbW9YMWpGa0hldUVOQm56?=
 =?utf-8?B?bUxldjB6c0Vka09weWl2cVptc3dQUUpzUm84cnpmQU5qQ2JxNzlzZ2NJVzZ3?=
 =?utf-8?Q?pDSvtp0wmbP09ivanTSx4kQvl?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7930c043-dfb1-4580-946f-08de37cf7620
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:35:31.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GpK4A/D+sXBaeNseuHIaouSel0pgiicdXg3RxR2hQMtOH02WZsXIh0YlEMjM10Nb+HD4SoU+0T7M4QGI1WaCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5676

Add the missing index increase in the M2P clearing loop, otherwise the loop
keeps pointlessly setting the same MFN entry repeatedly.  This seems to be
an oversight from the change that introduced support to process high order
pages in one go.

Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/p2m-pod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 05633fe2ac88..22dde913cc3c 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -655,7 +655,7 @@ decrease_reservation(struct domain *d, gfn_t gfn, unsigned int order)
             }
             p2m_tlb_flush_sync(p2m);
             for ( j = 0; j < n; ++j )
-                set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+                set_gpfn_from_mfn(mfn_x(mfn) + j, INVALID_M2P_ENTRY);
             p2m_pod_cache_add(p2m, page, cur_order);
 
             ioreq_request_mapcache_invalidate(d);
-- 
2.51.0


