Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDCF5F62EE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416723.661389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMRB-0002Yn-PE; Thu, 06 Oct 2022 08:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416723.661389; Thu, 06 Oct 2022 08:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMRB-0002Vw-LV; Thu, 06 Oct 2022 08:41:01 +0000
Received: by outflank-mailman (input) for mailman id 416723;
 Thu, 06 Oct 2022 08:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogMRA-0002Vq-Il
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:41:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99e32e31-4552-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 10:40:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 08:40:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 08:40:58 +0000
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
X-Inumbo-ID: 99e32e31-4552-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSQrbogoVk3ga0B/d42F/H87iBT10DMhFyudqRh1BHCJW94d3sPrSJyVyHa6dxLbu7nJSM4S5FyBk0bc+9c2TaTq9eg2yPWYjl475PDV6rN0fzfEHDx2h0AhCbUNt0YgoDCenlHLk9op6e0rnlhrrBwRdtRY7i+BW5N8BgxsUZ3xxVBLlmcl6Bxg6a+N+tVKGMz3lVXN18huTAy3N/iqJgYCVT6g+UiA16FHIKadpB39GUVRffQaB/n5AgYelEm6cIx0Yw+OvFLlIyk/2LZPNwoMCksIkRnUjXzhyJZV8DNEGbLlgebQWEEAhQ+nsfLn2touoQ51eV2E2aOEXblbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYJzW7pJsTsrG7cUmtwhu0ZLDOihzGR909f8ymBMUyw=;
 b=HNez0h8GEqh2P4s9sIkQlZmVJ6uCz5eTcd2DcnGvAr95oG22iUMF8vDKR+jzxmPbQRdj/DSyajof7V+l4kAirF4Ok/rJO7j35hRhaMTTk1tjGZiF2xwhEJZzDlNFaqc7IapOz02Kvr7kueh7xNRBXYwbhOaJcLs3nXKjn/GghydNGIxR/MfeDO29H3LJXimOi6RQlD6vB1AUZy0/BznsxrRky0Gsqv5JX/WNlA0UPQvDBiEuVGbJYacNCYV7wE7WU2B1jZKAPjO8x6pLXGiHRofpIAElIQ62PmE6MTFckUi4Uqj0GeyJ0klsK6oLluayatBF9WC0qgSrACKqI7/jeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYJzW7pJsTsrG7cUmtwhu0ZLDOihzGR909f8ymBMUyw=;
 b=B1aZ94MoKoD0bk2QH1khEqQMkS0MiSHLGrd6Vf6ZtNXUDVV6J5vO337IfsoKEwJcVz97TIDOKZg+mgPWaaJ2XynvigHib9yr0kJ5Q9MkzJq0+wVKudUZnDpzlsKNm+M+/xMwuw3MyBGthZaAEj2ta8lnAIKk4HGD1QfXQ2tsbcK5H7afrFAzqqbEyg4GUGl7zZ5YPCIDyf77/udaZWHWxJ6OV/5BZtVJut+veFouM3gvdvQWqnKlQrBt2HX2x8YRVLCNiqZFOZ8l9+8mj4HBdQNbIvOOeVzNOlEl8z1HIdC5eQBJjgjzfWpbgrDI0dFl1YE6pGAY7fdg542PGcpwaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
Date: Thu, 6 Oct 2022 10:40:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d07e23e-6956-493b-042d-08daa7767d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CxVQ/fNHuW02DbY57+A8TPMt5uwbSOZl1fSQRtQPSVix0TbMfxH0DODuBKuZkaP9IQQLKcuMkvEqAwMjghhaWn22kwiSaaAQvWMyq8oZo6bWomCdTVrBhEH2hryVghXSK8BXUNR8PnMHjLdZ5raTSnOdRGQls7NHftbLOE1w3QIoRSgQ1PzfcF46/hqYYAmuFe8pES1O+0L+Zig+8za05iVlq6zVZhyKMeHla7FFQVWAHz1zBPQa/Iss6qcok5gvwaCQIyObPUZVPO56mTKJvbsbnUa2/ABvoPfGGG7Z/eiWyhvdOfLVyc+DG8rI3USMlsqEAgWKSz86x6kuItCHHPte25NvbZuU+niiQB/K/WLiT5Tx+7jxeV2zfeeEfYJ0AOXE7ljygu/Gi60hnzGOwG0F1CU9LCX9A1H9EgxHfSuXq3gTE2wTQOFdt0g5nOGUlOlz/MngxyyKGZAAkSsTPsa94UQKzu/kHxdCsayqU900seGZyp6+RLOcJlEN/h3nQKIJx5grPjFyjSpbDWnN88FX1IEVgJs3uMtBMl7X+TIzSAO8ojVeq0aBIcLjxI7PL1eewCfGru4gkQomWnaFAIfl12CfgYdSi4j0IPhAhEsELbe73Jz8erahCz8AVHVlRhDaCgtHWbrBBKLKequhfgGtcbG9pUuNuLax74w+BeE74RIkRQcaFiTuKyhaexWSjPKPv+PbrN6axUrgIUSRBTODlTTaDe4l8GEpbW0SNx+fdlIxg+T52ylMHd0n5tmyEx91Ld4G6byGPLAMehmr3iWehMFLbA52EctmejCd27U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39850400004)(136003)(346002)(396003)(376002)(451199015)(2616005)(83380400001)(38100700002)(31696002)(36756003)(186003)(86362001)(5660300002)(8936002)(6512007)(66946007)(66556008)(66476007)(41300700001)(2906002)(26005)(54906003)(478600001)(6486002)(31686004)(6506007)(316002)(4326008)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGwxbDlBcWVXVUY1RGlacldPOHJRMjNYQjV3Tk9jOUE5UUpoMlBBR3MyRm0w?=
 =?utf-8?B?RWJ4dnJBVTVvOUswZHNpUmZCOXhBZTdZbk9GeUpKM3hxNzBDT2xoZEVpRjQ4?=
 =?utf-8?B?aXJvSlFGbnh2V0YyUmt3RDhGY1pQK2xEQ1hkQkJSQlpjdWs5RlIzVXNQVDZV?=
 =?utf-8?B?ejVlbmk4WUNnOUgwdTI5cE11THd3SHBZeFhNZmZjbyt6QWNBdkhWQWRtdFJ4?=
 =?utf-8?B?VGRHUlIrL0FXc3RpOGZLckorQ1hnVENWM1RWVVhHZFVBOGJuZ2xpWThSVDYx?=
 =?utf-8?B?cjNvU3hmUTN3ZUJEa2RhVlVGMGpwenRJOTN5T3REMnpFWE5xMy9SWU1FTHB4?=
 =?utf-8?B?RlRraGZMNWZxWFFhRkQ1dkNGZk02a1pGWlFkYkpQeUVzSzBtZkRCSlk2bnZU?=
 =?utf-8?B?QU90K25RSDE0c2hWREVGMG9iMjRnZGRyei9RK1h4U3ZqRFZBcXVRSDVTeDJv?=
 =?utf-8?B?djFRb2lTZ2U3dVJsTUpFZkVWK2JsMDBiSkIvUExwSlE1TktOTlNybmUydFN2?=
 =?utf-8?B?Ynh0VkZZMEFPVG1QeUdRT25GbXRudjl3Z2FjaEIzOXU2UmxhOUFZaElqNjZL?=
 =?utf-8?B?ZUVpV1NHKzNybk5BRmkwdVREakdXbDg2YkoxbzBzZlRMWHhwcXBFWHBYb0pF?=
 =?utf-8?B?NFNZZVZFWkhIWWJUMFphTDhFVVYwQWN2Z0lTb0sxcWc2MWQzS2ZMVXdOb3lv?=
 =?utf-8?B?bXFkSkhCQXRKUUY0cVpKdE84WlNWa3F2ZGY3NTVOaE5qUTE2QVR0Z0QvR2l0?=
 =?utf-8?B?Q1FzYS82amVpL3JjQW1IbzNVYjBqNVV6dWtyTUdMTUI5M2xnQURvam9oc0ZE?=
 =?utf-8?B?ZlQzK3hoTll4eW5kRVMzSFdPVW5aK2dtcjJVT3RTZGxIV1N1NTVOcUZtY2lp?=
 =?utf-8?B?SmVjK0k3dmp5T0QyMkxoY1d5aU01YnRITEZmWGo2N0w2NTRLWGxCV0JqRTVO?=
 =?utf-8?B?TnZwQlRBZGxOTHN3UUxwU0RzOHlmZjFLbVZCZG1GUHRpVkRGYUh1alhMMVlK?=
 =?utf-8?B?cndJYXQxWm9Dd3hKd1ZqWThTS0lrZWUxWDBUa280MHg4SnlDQmQ0b2Nzdzg5?=
 =?utf-8?B?Rjl2cG1zYTYrTHZKSURKakxYbjdNL3hSZERMc3pWTUl4V1dDUkpodUh5OUxG?=
 =?utf-8?B?QUZVbmJ6Vm1iWEk0SktxdVN4REFYQ2VLNktuSFZXZFVia3BmcjZpZHRxTGlS?=
 =?utf-8?B?djgwR0JwRDc0YXFiQjQvcXBmbEtJMnFOZXZEcmRTMTJ0RkFZNTh6U3lTbzU1?=
 =?utf-8?B?WlZiVzZ0dFJna0N6V2svV1NSOTlJeG9HSE9iR3pYWVNUcFdua0tDU0FNYTdj?=
 =?utf-8?B?ZnV5Q3VnUU0vaDBYYVdSQ0xUclBlYy9hOGhNOEI2ck0rYkdHdGlBbVFyRUg3?=
 =?utf-8?B?NjMwRUwvVFZCRFZRd0hsdmszVk0rMW1IUGgwMmJ6U05aeUgwTWdJY3hJOC91?=
 =?utf-8?B?NkxMdUlRSmlBaFRCaDlYT29EWjNpVVdrdWtMVGFmSlN2VGk2cmhrMTJ4RlNn?=
 =?utf-8?B?MzdoMXlTNjY0anB0ZEZsUjNLSEhBK1FCZllmeU40VDR0MHRCUWgxTkVIdi81?=
 =?utf-8?B?UGFpWEdPcEl2M3hTQ0Vhb0FrTStsOXlHbW5LeXJDK2VjNjlibVRFYzVHSFZo?=
 =?utf-8?B?bjFINUdpeVF4dWtMWStra2o2VWp2Tkl5aVk4d1liTG1HMTEzWE15QXJRZXQ2?=
 =?utf-8?B?bmx4UFdoOFJKa2hjN2MxZk4vR0FKRjJKVDBiNURRaG5NLzhzWEdlSXlZd01H?=
 =?utf-8?B?dTFlU2p0eWZHc0JZNTVBZVE4K0dLSjEvWWtVVGVQWkZQdGZNNU0rdGJURHF0?=
 =?utf-8?B?SHpCbzlIWW13ZTVscU5Uei9Ua1pNVmJuWW56WFpXYUkrNUZlUUdWL1dEYUlP?=
 =?utf-8?B?NDUzTTNhMmtOWXdnRXlmSzZCeTJjaDY5ZXNLY09FR24yRmlDMWZtdFQ3Z0Vw?=
 =?utf-8?B?MDZLUEtNeUxTdFZ5aktsNkdSKzlFTVhibEQzamNJZ3haQ1RweWUwc0FDQjhO?=
 =?utf-8?B?eEpLUWJ5eGRocElGWFJ6NEwwK1dtczBNTFhjSVpvSjM2ejNjZmh1ODRGdWdK?=
 =?utf-8?B?V3VRRGUzLzF6RGpxaVBIV0kxSXd1bVdqdGVhMzRHd3FibXN2dXRpQ2I2Nk1a?=
 =?utf-8?Q?QNTQUF27DasgmpxSsiyuB7TRT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d07e23e-6956-493b-042d-08daa7767d82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:40:58.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKZ7VbhggD7EILKc/qLDvHgLopJZpef1Y9NX4HGUWM7mu2xs6SBvW3axL1BBUGHmyC0Yd+tRiZPoSvVIobuzEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429

efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
higher priority than the type of the range. To avoid accessing memory at
runtime which was re-used for other purposes, make
efi_arch_process_memory_map() follow suit. While on x86 in theory the
same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
to do so, bypassing Xen's memory management), hence that type's handling
can be left alone.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Fixes: facac0af87ef ("x86-64: EFI runtime code")
Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> # Arm
Tested-By: Luca Fancellu <luca.fancellu@arm.com> # Arm
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm
---
v2: Amend description.

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -183,13 +183,15 @@ static EFI_STATUS __init efi_process_mem
 
     for ( Index = 0; Index < (mmap_size / desc_size); Index++ )
     {
-        if ( desc_ptr->Attribute & EFI_MEMORY_WB &&
-             (desc_ptr->Type == EfiConventionalMemory ||
-              desc_ptr->Type == EfiLoaderCode ||
-              desc_ptr->Type == EfiLoaderData ||
-              (!map_bs &&
-               (desc_ptr->Type == EfiBootServicesCode ||
-                desc_ptr->Type == EfiBootServicesData))) )
+        if ( desc_ptr->Attribute & EFI_MEMORY_RUNTIME )
+            /* nothing */;
+        else if ( (desc_ptr->Attribute & EFI_MEMORY_WB) &&
+                  (desc_ptr->Type == EfiConventionalMemory ||
+                   desc_ptr->Type == EfiLoaderCode ||
+                   desc_ptr->Type == EfiLoaderData ||
+                   (!map_bs &&
+                    (desc_ptr->Type == EfiBootServicesCode ||
+                     desc_ptr->Type == EfiBootServicesData))) )
         {
             if ( !meminfo_add_bank(&bootinfo.mem, desc_ptr) )
             {
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -185,7 +185,9 @@ static void __init efi_arch_process_memo
             /* fall through */
         case EfiLoaderCode:
         case EfiLoaderData:
-            if ( desc->Attribute & EFI_MEMORY_WB )
+            if ( desc->Attribute & EFI_MEMORY_RUNTIME )
+                type = E820_RESERVED;
+            else if ( desc->Attribute & EFI_MEMORY_WB )
                 type = E820_RAM;
             else
         case EfiUnusableMemory:

