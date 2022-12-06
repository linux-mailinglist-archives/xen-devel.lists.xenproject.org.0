Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BAF6444FD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454870.712429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YNv-0004CU-PQ; Tue, 06 Dec 2022 13:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454870.712429; Tue, 06 Dec 2022 13:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YNv-00049m-MR; Tue, 06 Dec 2022 13:53:23 +0000
Received: by outflank-mailman (input) for mailman id 454870;
 Tue, 06 Dec 2022 13:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YNu-00049e-Tc
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:53:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57db0e25-756d-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 14:53:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:53:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:53:20 +0000
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
X-Inumbo-ID: 57db0e25-756d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlhwWD2Xjv1f9wf5oMlKDKGvS2O82vBvJMMHNC4Bqh7E02qyr+6ogqfpndaNa+vVhorjvJgdPgDu/89tbRSicq63zVRHdGP9E80GfS8JCXP4/+uLouT8sj1YOF2BEdY3x+kFw7hWkfIxONHJd5uQ0ybTpq1ZrQwiJYYlBF2HqaxdfKhywsrxYKGMy0nF06G0rEuoScyX6tSap3S0DMkbKQs2BE+6m45qT/Z6M9Mcpz/E+gaRwjyor6ovn1Opz+0+VNPG+n9RLJiLEGPbUQNKYxtP935Miho7r/jLhotbIkNMRTjypOuiaBH48X5RuUALGT+Gukn71W8G1G376J/sNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ9MikagtSu0p0ylnNCQKQnatGD4lZkmVnVsnHpUchQ=;
 b=dBhp9OxWY85ifQn4uoSdw0/1WDvLfaKmxpEJAYg9Q+rO3izV2Tlpn9wh3yHOqgXTMJDlBDOO0ZLWQbeKiAKdYhjq0cjmGqfdE1t0RV7WFglVliweK7Mt7+0rftAM85NjqEbyMeLE6wQwLf97lq//6QOr90OM28V1eKOYs4TdwHeH/wEIrTypWa1X6BdtmkGRAm1JFOgTyUulBN2ApL2E8TrFWAxfJuB88a9JirKowiJS6Nst9uzGSGIHBJcBQ2jZ/nnde/e81uL5xSmxeRNqMcMwEBMzj/Abq8/XiIFcrKEaY4ZgneFPhr1a9qEpO3RZIEspubzO+NKu3EGgHi+pRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ9MikagtSu0p0ylnNCQKQnatGD4lZkmVnVsnHpUchQ=;
 b=pOhq+HkpN7NsSJM3sNoTmGx2vLQyJBOOghBQMCHKZrgOYXNI+297KjIicYvHII1JAznO9sobPCQNiSSCmRSXApQp7iByd4YuS2RqaOUKI0TpT4YiuSqX9pJ5ge3mfbIaPX0+5nMuNEI433kBevhrw6eS1qqjoXvRLDGdvVRVQ64R5VSSGlz6q9i0nLYKvAar3KiyH1SnX1PXKXJHsXzlV54lI/rfFl0L+R0skSG+z5fDxbamiSRpUsQpdj0lcZZp6eLroKlpoWrG460UhOLERifBMR4TqtZCdVEwEBICpaQ8mLmEhmdvHTM+uNjRPNuX+Wt+3itv+3UAVkdTEZETBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83f510bd-9a9c-3063-27dd-d894b1e8031c@suse.com>
Date: Tue, 6 Dec 2022 14:53:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 1/5] x86/tboot: drop failed attempt to hash shadow page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
In-Reply-To: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bd3dd8-3148-493e-63b5-08dad7913bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H91zhsey8d2YUcNgTKjhJ0ROU2680zUWNSfW8UirUNT6kHP/KqBgt1dvqRC81SvWxa3ZeSWouiz43S32fwfom0vVc4SbLe6GHaLx5Y4gUHnPW2gQkzKQXQgHG7Jtk+iDetuXUFeMGCyAGeLC2Uoq52EcbeehJnlIvBi2uaFFni/ctz9vxBGtmA/Gnc1+U6NuZC+r4yzZmfNaYa6dPKQZgnqkMcYNCWgS/lHRfkEYkE/O/87/u5LRMLIlcVQagbQq/s4s8FALGjSFJncqKxU/OoBD5xQzLl9syG9hluo/8OnuK2OeEgQ52g32liax4kYW/lM8cjAdfLAoPlu3D/yt2Psu1NNimyK8vfyGKY3H4supxmPzDNK/aOFFNd87fbcPzwVu17+tXudcv19oH4cbqg+HmNuXiZXpsfu1L3PIE8sHvMJyTeNVzrslfXEmKKwq3Ht6Sw1ITql7rrwARBmT+fIyLkSjCsCelCut2OhNFWkF9oGQIA7+8XCY5XfEpiARaIPjPYvATmyoqibkFVDEABpZUMAeWQeTwxwnJfvTxAQhqB0DVqyUSpV3cOwgFQ1+UrTPqR61C1DXnSB1XLBDYbbm7wfGwoQlaKA6zpdBXwyrJcJVHa+syoNY94u229sKm72dOnBLZ060MRnjHDwqUhJvQQ/u674XyPBYuqWBQNlJ+S3SHH8rOMbRB29hKvDxY6LEI2V3gzLCU4b8D8M7PFSqOpD8AtS0O3hmSLAQ29c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(31686004)(186003)(6486002)(6916009)(316002)(54906003)(478600001)(31696002)(86362001)(36756003)(38100700002)(83380400001)(6506007)(2616005)(6512007)(26005)(2906002)(4326008)(5660300002)(41300700001)(8936002)(66556008)(8676002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC9LMEZDTk5XaVF4TG1ZMm5qWlRxRVladWV3MEo0bU85TGJiOWpkMVpNRkRP?=
 =?utf-8?B?TTNUc2tnWlNhVmdGV3UvVjVreEozK2R1Z1Z4eENiWU1sd3M3L2QvUkhYdDVz?=
 =?utf-8?B?T1NsM2RINnpXVE1Vdm9ia1ROMHl3UXk5bC9DS2hvMFFYU2tCVHltTzY3UW54?=
 =?utf-8?B?SEpWOEY3WG4xMzJIZWRTVVNlQUZJZ0x6MEhMUmdLSjlGbW1GUE96VldhZ2pn?=
 =?utf-8?B?NjN5UnRvVHJsb0Zaa2N6VXQyVCszc0J1bnNaczNJaHp4bUlUaGtBbWk2OUFL?=
 =?utf-8?B?RmRuT1hpbjAxckJ3YTJRcTR1MTlZaGY5ZE5wSmxDVEs4NlRXcHNJZllwYzh1?=
 =?utf-8?B?dklqU3FGM0t6ZmR4L2cydVIyUWptOTJXSHR4U3Z2eXcvRGliV3ZFSG5uTzdp?=
 =?utf-8?B?d3JoN0xSVzhoaXFxMjV6OE04NkpPVFBFWHQ0MVc4UEQ3MVEyYmkrMVAxNFBL?=
 =?utf-8?B?MGt2QUJiM05iWktYTGJXZ0U0V1B3WUZJSnpCSXloYXVGNFduNllEVWF1WS9z?=
 =?utf-8?B?emNBS2Z1UUlVMXJVWUZXZ3hrc1g3VEdnZndLM1ZVUWhOZW53ekdWK1hVQ1Np?=
 =?utf-8?B?K0dLMU54c1hVdms3TUY5QjFUbEJJdFM4TzRkUUhjRTJNL254dFc1aEd3cXp0?=
 =?utf-8?B?NzJGQ0ZxMElYZ1dFanA4c3gwL2xxUDVVQ3VkTkw2bjlrNm5JaXp1OUNoeCt0?=
 =?utf-8?B?WmlXWUpsUkkzUmFqU2NiaHIvRUYyUXhCaldtb1ByQmI2dm41UFJmNk5kYWJl?=
 =?utf-8?B?RFVjeXVTbUNFUDJwbmJJWXNjc0tuYURTOUJkdFRET0NLNWhsVkU4eFR2dEtO?=
 =?utf-8?B?ZFRLcDY1UWx0S0VaZlZBaHc3WW5BU3YvTjhFd01JY1A2OVdsWkNqbE8xZTlj?=
 =?utf-8?B?OHdTMU1hY0xERGQ1NVpqaVlkUzNNSDZjT2ZqSXBDQVpOcDlCUjVqMVhPeHpS?=
 =?utf-8?B?S01BNGc2eGZyNFVTaGxKQU9ienFoSnB0S21PWUVKQWhoZ1NvWFBDKzVlVkNE?=
 =?utf-8?B?MUJaVXBrYllaVDVhZ3FpVWM4TlZGT0lqNnR4S1lwNVZqbmRna0kvQ0NIbEJj?=
 =?utf-8?B?VlY1Y3I4UmozT0hTRTdlMzhia3lOeTFCK3RFaVFLNmJXcmtEeld0OHF4RlRI?=
 =?utf-8?B?bE5ISU9kRFcxWW1ZcUNJR3B4ejRsOURnUFhXeFdiMWJacFJhQzFRQ041R3Bq?=
 =?utf-8?B?RDZJOVJSbldBQlFqRDFZaTg3aURoNTE2dDBmWFQ4M0xuTnJTOUZ3VDkxa1o5?=
 =?utf-8?B?ejNyb05hQ0NQZk90UjdPMmhGeTdLSEJ1eFpVUUtIRmlCUGczVjd0VE5nRitX?=
 =?utf-8?B?R3JOb2VZRFB1ejUvRStOeVRyb2RLTS9aQW5SdnY5ZnZic1hQdEtweVJaNmEv?=
 =?utf-8?B?Q1FUNjN0OHJNYy8zQmVWdzVaOWxoVllXUUx5Uzl3aHNFUFkrN1ZzNDhtOEdZ?=
 =?utf-8?B?ekdaNG9SNEU0alFyNW84QXV5RVZXU09hTFJEaFpHbHR3VVVtM3RJT29uenY1?=
 =?utf-8?B?UUtvOHVwdGNSRVBzUUZObHo3c2g5OStpWHl0c2xNdjJXYVZlZ2U3YTlYbEpH?=
 =?utf-8?B?dEpZNXlvbU9JaE1CUFdvZmg0UmxjNlJ1aS9nK1NvdFJHZWNYQ1JTeEFhQTI1?=
 =?utf-8?B?RW53L09KUWc3RjNtcFJpSlc5aFl1cjdmaDJmd0NlNjBvMDU1aEVwTTJsZlJQ?=
 =?utf-8?B?QlNFV2F1Q1FhZ1h2OXVwSFdlRTRtUkFmY0IxN3JRdExhcEI2dFR3RkZWK1J0?=
 =?utf-8?B?MzQxQUg0Y2hpOHM2eWNFZEgwRVNUcEZxcndIbHBYM0FnUFgvN0tGWk5FeVhT?=
 =?utf-8?B?NU1FT3VhWExjdWNDZE05eXpWQ2lpSCtidEtWK2RBcGJaa004bDhkUi9jMk5l?=
 =?utf-8?B?MUwyb1VaalVVODZrbnFuQTUzK1hZS1ZjVVpmWjM3RmxDM0pDUzFtTkVBNWEv?=
 =?utf-8?B?WEdqUy9HUjU5ZjJwUFpieFVyUFJ5ZnpRRVZPZWVGVHVTY2lZYmt6bkZIL1BD?=
 =?utf-8?B?UUhabFdKK0lwZGhEdzNTZnJ4dkdDSzdFYTRSVmpVOURwWDVRVk9LMTkwZS9I?=
 =?utf-8?B?ZTBMZkVxaWtVWUc0cEhZS25BNm1qcFplcEFPMHkvdFZRUHhBalh6c20zN1NK?=
 =?utf-8?Q?DA5n/CTcG84HnBJ+TkUmD2TmD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bd3dd8-3148-493e-63b5-08dad7913bc6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:53:20.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M00zbxXOAgLqdWZriLoLs7ORhkr/Bzb6jNr30jSQRdsAhPcGklpRMy35xScMf96eGyiFtv9CZug4L+XkWhVAmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

While plausible to do what was intended based on the name of the flag
(PGC_page_table), that name was misleading and is going to be changed.
It marks page tables pages _having_ a shadow, not shadows of page table
pages. The attempt also didn't cover the HAP case at all, and it
constituted a potentially very long loop doing nothing when
!SHADOW_PAGING. Instead leave a comment of what actually wants doing
there (which then also may need to account for e.g. the risk of A/D bits
becoming set behind our backs).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -177,29 +177,6 @@ static void update_iommu_mac(vmac_ctx_t
 #define is_page_in_use(page) \
     (page_state_is(page, inuse) || page_state_is(page, offlining))
 
-static void update_pagetable_mac(vmac_ctx_t *ctx)
-{
-    unsigned long mfn;
-
-    for ( mfn = 0; mfn < max_page; mfn++ )
-    {
-        struct page_info *page = mfn_to_page(_mfn(mfn));
-
-        if ( !mfn_valid(_mfn(mfn)) )
-            continue;
-        if ( is_page_in_use(page) && !is_special_page(page) )
-        {
-            if ( page->count_info & PGC_page_table )
-            {
-                void *pg = map_domain_page(_mfn(mfn));
-
-                vmac_update(pg, PAGE_SIZE, ctx);
-                unmap_domain_page(pg);
-            }
-        }
-    }
-}
- 
 static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
                                        vmac_t *mac)
 {
@@ -233,8 +210,7 @@ static void tboot_gen_domain_integrity(c
         }
     }
 
-    /* MAC all shadow page tables */
-    update_pagetable_mac(&ctx);
+    /* TODO: MAC all shadow / HAP page tables */
 
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 


