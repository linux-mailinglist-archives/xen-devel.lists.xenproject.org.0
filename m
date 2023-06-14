Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48072F559
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548475.856451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KX2-0002kX-Nu; Wed, 14 Jun 2023 07:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548475.856451; Wed, 14 Jun 2023 07:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KX2-0002iV-KN; Wed, 14 Jun 2023 07:03:04 +0000
Received: by outflank-mailman (input) for mailman id 548475;
 Wed, 14 Jun 2023 07:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9KX1-0002iN-74
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:03:03 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 808a232b-0a81-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 09:03:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 07:02:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 07:02:58 +0000
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
X-Inumbo-ID: 808a232b-0a81-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKjJGLUBrqrwXGioXAYZJM+KcHZN7ZeoGrtME1bIxvBxCuJJHDJ7RumxEsDSxqf1nRQ3dGTooOM3ZAYq5WPLsaBSZmXJdXPdxrlbBANH6Xd/grcMRLP/Wg99NnFA9WetAjjzw9c22VND0ZvYCsyWR0cjMVmUo0+N2tZH5LS0vUGlBtkHLlZBo4sioQJnVBsYDnta1Qlr/loyieO15sqhFVR226leizU3aZghqT7E7IdutfCtPn37AnJvzQ2XLTQlef+QOTF/ua/k+GBi6KpHVFpkdHocb4+KBZni7gPuhI/ghKZ/DbrtXyNCTyWUE1ah/9Pt65U8rxc4HODUduX21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHO5cRG6rhGhB3CnH795D3Agajtj0bX3Uqvd4xLoY4g=;
 b=B0/YdOHRMT78Qj78XWf1lFuW+YqB8U+DaPaKZZofdD/D3JkqkHPDksTtIFmcsOy0EwckpMokGBmvsRouxlN4kTs8MWWbnSomfJdCXMRGDR9ZXEoXpbZPnkjURW4r+CQ6CQKjUYOwD+AiA8+nLfB4Zqxle5RZzZJyn/hilIpPTx2S+XgJT4v3Q9viVC8VBTmy+T23/zb1DNiy1Q+BmBkzWEm7oeSGuPS169D4iZeENHz1Lr6FyiZBS0U7zbIsEo+L2OtON9dpGnsGdRnGvmMekj66nWOkNdFpggVp4vQOIiyWW/kDi9pd9eBSheSWiXngTKwZE25bJg0oHVegm2lhLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHO5cRG6rhGhB3CnH795D3Agajtj0bX3Uqvd4xLoY4g=;
 b=EbjKjH03beAKzwKVMpToHhE5fz7rEZvcdOj3YD5DiOz4eKgWrsgW1lPIO2gVHmXdEe2nusdwqkWJ4C48iiuxtMc8QAzvdUqirOsZ8Xo6W50CV0Spb37ugnMhLWeGAL6bWuN8v+DUM0jlsQpVGNZ8MhikpJKU2mThoI9bG8bc9gccUC3Rix3PTvxjMUxCb34MTtI8mc2/hAaXl08YPeYPfQKjqCi3mJFSBy2reyabuTwWk/UOFRcNwTHrZ4PAXVUv42xourxjMix9FYXonlq7AaiZ6Cs9xlENvxrBnQHE2MtDczTKoNIJB7uwT86NZybvCqDGXCWElF1SlZhQZ7NJrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c6fc607-630d-c52f-06b8-4c5aae97f21f@suse.com>
Date: Wed, 14 Jun 2023 09:02:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxg: shrink variable scope in
 xc_core_arch_map_p2m_list_rw()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: deac75ce-a445-44db-cdbd-08db6ca5627d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zZ/1dJDVSZ5NVRqOX4FWviLYtEB6srdWBACmKKuM7Dl7xb5PkwZcyVxBDpOdjJaOPd4zD6vBTtpXrob8Ji+9zpqH5tlDj/ED4v1AgMY+d7c+z96vDLRSCvGgFTRrxsAHEjqLuQrFcKqEpWIX55TADmoaOQLyijjwi9EEJBXbvNmBmo4tnWqgDFaxW0fGFgzyE8dJEuXB+frShISDuDEtP0fxTIK2uf4NDCZTePxuifjgMOplgbXXfHXCtbWn63YKlnpaO3/g7bi02TjwtudvdrH9IV8CGYKRCkJb6hhojN7b2fKyAygfSiK/r2NSoy1X2BylW/cb7L1MuPaqnCzAaiqj7XTRPc9qvlAsHwU0ZvDMRTMmjU+ZmLG4yJCGhkFeEWzJhzN5UHDnQAbpBhje0aySjYH+t6weI28AMcf6UmapXT6xWAsB7HHYvUDn8SxLuXQK+9d54FugGXe2FEdQU2pxoflSqQ7C4xEhNaStiCH5KOxEY5A2epPByfB4oDOhW+pqRQi2LetYNEnQb067FbSTNvvhq6FVEfYClq3XKeZ3qWnDgBA1olkjXv1muYgWy9RPPPC1DJX9tSdOaOOROx6i4aUHRs37W5VhGWsjheDm7N9BYE7Tv3S50OYVOe30mvhtzvKxLLUMygy4ZSoTUDwejuyZ2I2fY1V0AsGhdXMYEsfdiBnggXdovDUAldjM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(31686004)(38100700002)(31696002)(86362001)(8936002)(83380400001)(8676002)(5660300002)(316002)(41300700001)(6916009)(66946007)(66556008)(66476007)(4326008)(54906003)(2616005)(36756003)(478600001)(186003)(107886003)(6506007)(26005)(6512007)(2906002)(6486002)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2hCMzUvS0VoWGFUeDJmWENUTVlhZEJtaEVpNnRvWXEvVWt4N2IzbjI3Ujdx?=
 =?utf-8?B?OUxNZGMzVDNjOWQ4ZHZxWjZzM0g5bU9yL2kvdTV3bkRVVXV5Y2tMVnBlVWZv?=
 =?utf-8?B?OFJjT3EvRVNJNTdXLzdDYS9LYmp2NnRrRmU3UEpWRWxFbmZIVDhyWTFUZVZL?=
 =?utf-8?B?OWhhMmZTOGU4ZnBVUlJRblNCeWlhV0E4VXp2UG9hMTd1ZVZBVm5pZmpSczQ1?=
 =?utf-8?B?WWlmU0FndElXdWttMVNRb3loQTI2cHRlVmwxVCtvMmpTOTZXNE1oTE1qZHIz?=
 =?utf-8?B?K21IbGc5bTFIeldXV0g0ajFyK2xMYnVDRlBDN2tqRkNUbTBIcDgxSDJwVnF1?=
 =?utf-8?B?cmdWMDdKS3NXZ1BWR1BpaFVwejZScGk3WXljRGlZNnEyUW0xb2k3Nk1ib1I5?=
 =?utf-8?B?YUEyOHoraDBqVVlmVEJVYXY5OXkxbDBoOEVFNmVkaGt3WlA4QnhnS2Y5cHFr?=
 =?utf-8?B?YWFVcEs1aGxyaW5aVUNiSFdQQWcyWVFEd1liRVpycXRwZVVPMkE5ZUIwamlP?=
 =?utf-8?B?S0JJUTJ4aE1CVWlsTGs2c0lTbFc4UEpKenRGRUIvS2dEd05uWGswSjlicS91?=
 =?utf-8?B?UEI2Z2FpckdQL0RmT0xiYWxqbkF3VHJJU3p5VzdjR3J2bDMzRUFDb2doNHBo?=
 =?utf-8?B?akdYQ1pFRjFrb29McEJNdE1xT1lGYWswRWZGMUE4bHVyb0hqNk9QYmRUcTVS?=
 =?utf-8?B?eEdyNmFvck5MazZ2RkJXNWovZDFaSWlOays2cUZwOG1NeTB5ZUJ4L1pWM0Ri?=
 =?utf-8?B?WXlWUXZBNWllS2oyaGx3VVQ2ZU1KSmdUeEJlcGs1eEFCUE9TYzFKdFY0YzV3?=
 =?utf-8?B?Y290T01mZFQvZlJXaTN0RldTdlpSSm5qTGdhMkhBMlhTa2tWc0FYVldFUHRn?=
 =?utf-8?B?WW81VzF5OTcwU01ETE84N0pLQW9wc3RpSkR5UTBtTFJWbzdBU3doVUxnS2hn?=
 =?utf-8?B?UnQ4QldaTCtqZHVyeEdhY1VYOTNhdnNEUUllZ2YxanhXQ0sycHJNdG5mNyt3?=
 =?utf-8?B?c0JQbHhGL2t3SWkyUzhpcWJQWDRlUUs2NzNHL3ZEVGZGQk5YK0JSSXNOOENF?=
 =?utf-8?B?UEZ5OUZKT3lhZndycnlwZnFkKzYvQ2RRVzFuQjBIaS8rekFyWk1JbnFjQVlO?=
 =?utf-8?B?d1U4YjIrL1p2dTU5UnVlZTNNakd4NU5LMkZlN3BxR1VsV09rMDNsbUxHVFpW?=
 =?utf-8?B?U0Y3SWkwc2pPMXZSUHlDbnJGdlhENTJpS0RZRW1rUlNQZnlCa0grZ2VZYmFT?=
 =?utf-8?B?bU9CYmJmbkNmK0NHMFFVYTd6bFNXN0pEY3JpVDNYQlNnSkM5TG51R2dpNCt2?=
 =?utf-8?B?ZVorUzlHdmVibUhnbDZHOXd4TEtxVzBMbEZtckhRMklJaWJ3QjdMR05YREtH?=
 =?utf-8?B?cDJxa3VYUUNmaXdSMHhxK0hrVWNmdjU4bmdZeThUdHF5YVR3ZFBLRDBFZ0pi?=
 =?utf-8?B?MU5SS0NZVVh5WDNvU3hURExmZHFabTVoSmQ4MmI2UFlkVnI0WDJFMHdRbTdP?=
 =?utf-8?B?Y3RrUFJadmgrSWR2b3ZhSmdFQ1JGa3E1T2pnWkxXM3prVnlMQTFsYVpQYWVJ?=
 =?utf-8?B?WS8yRmwvMXpuWllqOVcyZC9sanhEb3FFQVh4clMvTU04NTZCVXpGbUsrNUpK?=
 =?utf-8?B?UmpCNmZQMGFIK2lzaFN2UHJhV1pFUXNwVFhPbFZKVnkxM2djaXA0M1gydzVz?=
 =?utf-8?B?Q1NIbGFiNG9ZRzlnK01yRzNNTVgvaWVuVFdrMy9rWEVMUWJHNWdNOEltRzhX?=
 =?utf-8?B?WS9nUXVzaVBmZVVMK2M2RVNmTjc5Rm4rd2FiaU1mSmtLU3F5V3FEL0J5NXky?=
 =?utf-8?B?QTFCTEZSOXJSMEdVdXU2YTVZWkhhM05BdGI2aE9UdlBueXdyTWx1d2tXUDN2?=
 =?utf-8?B?dkUzVEVuSlZWTzRIaGhCWHZuUUJUSjN6cTdSZ3VNSDVUekVNZlVXSVZhWmg3?=
 =?utf-8?B?eW94WFJiUFU4VjFoRDBCRXVGemthcDlsSmVwVnFrK0J6R1V3cmovQ0QycFR5?=
 =?utf-8?B?eDRLNHY3alNxQU5MRFZzVnEyK2FrcThnRmx4a1NYcElEL0tSaUQzRm9Zbzhv?=
 =?utf-8?B?NUs5bW81OHRnQ2pmc09aMEJkZEpiQ0poamdXeUJiMEpXZG52WnJ5WXVhL2xB?=
 =?utf-8?Q?v1GE+KhZ6a/HAvgF3dl/MmknA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deac75ce-a445-44db-cdbd-08db6ca5627d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 07:02:58.2334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Drrne90tasiDh3CYlY8jgK+DdtzH2oNTFJoF5HiXD42fZDSt+DEwzflwFJuWPXzDbDIlMgwMTUpDSxfeO0CFtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

This in particular allows to drop a dead assignment to "ptes" from near
the end of the function.

Coverity ID: 1532314
Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Much bigger change to limit the scope of "ptes" and other variables.

--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -92,11 +92,9 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
                              uint64_t p2m_cr3)
 {
     uint64_t p2m_vaddr, p2m_end, mask, off;
-    xen_pfn_t p2m_mfn, mfn, saved_mfn, max_pfn;
-    uint64_t *ptes = NULL;
+    xen_pfn_t p2m_mfn, saved_mfn;
     xen_pfn_t *mfns = NULL;
-    unsigned int fpp, n_pages, level, n_levels, shift,
-                 idx_start, idx_end, idx, saved_idx;
+    unsigned int fpp, level, n_levels, idx_start, idx_end, saved_idx;
 
     p2m_vaddr = GET_FIELD(live_shinfo, arch.p2m_vaddr, dinfo->guest_width);
     fpp = PAGE_SIZE / dinfo->guest_width;
@@ -152,8 +150,10 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
 
     for ( level = n_levels; level > 0; level-- )
     {
-        n_pages = idx_end - idx_start + 1;
-        ptes = xc_map_foreign_pages(xch, dom, PROT_READ, mfns, n_pages);
+        unsigned int n_pages = idx_end - idx_start + 1;
+        uint64_t *ptes = xc_map_foreign_pages(xch, dom, PROT_READ, mfns, n_pages);
+        unsigned int shift, idx;
+
         if ( !ptes )
         {
             PERROR("Failed to map %u page table pages for p2m list", n_pages);
@@ -169,18 +169,21 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
         if ( !mfns )
         {
             ERROR("Cannot allocate memory for array of %u mfns", idx);
+        out_unmap:
+            munmap(ptes, n_pages * PAGE_SIZE);
             goto out;
         }
 
         for ( idx = idx_start; idx <= idx_end; idx++ )
         {
-            mfn = (ptes[idx] & 0x000ffffffffff000ULL) >> PAGE_SHIFT;
+            xen_pfn_t mfn = (ptes[idx] & 0x000ffffffffff000ULL) >> PAGE_SHIFT;
+
             if ( mfn == 0 )
             {
                 ERROR("Bad mfn %#lx during page table walk for vaddr %#" PRIx64 " at level %d of p2m list",
                       mfn, off + ((uint64_t)idx << shift), level);
                 errno = ERANGE;
-                goto out;
+                goto out_unmap;
             }
             mfns[idx - idx_start] = mfn;
 
@@ -197,6 +200,8 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
 
         if ( level == 2 )
         {
+            xen_pfn_t max_pfn;
+
             if ( saved_idx == idx_end )
                 saved_idx++;
             max_pfn = ((xen_pfn_t)saved_idx << 9) * fpp;
@@ -210,7 +215,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
         }
 
         munmap(ptes, n_pages * PAGE_SIZE);
-        ptes = NULL;
         off = p2m_vaddr & ((mask >> shift) << shift);
     }
 
@@ -218,8 +222,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
 
  out:
     free(mfns);
-    if ( ptes )
-        munmap(ptes, n_pages * PAGE_SIZE);
 
     return NULL;
 }

