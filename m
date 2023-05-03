Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6B6F5517
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529056.822999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu92S-0007fB-Ke; Wed, 03 May 2023 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529056.822999; Wed, 03 May 2023 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu92S-0007cX-Ht; Wed, 03 May 2023 09:44:44 +0000
Received: by outflank-mailman (input) for mailman id 529056;
 Wed, 03 May 2023 09:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu92Q-0007cL-VY
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:44:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe16::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20d896b0-e997-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 11:44:42 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 09:44:40 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:44:40 +0000
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
X-Inumbo-ID: 20d896b0-e997-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvlRo9gffZaOASpcLxLtB6sqsLqdsDbGzUGPPf3VBZ1Zi9glelxkR9Hf0+CQEZj1TYnvboQwjk3TJIxDuSCtUS6I1sWw75HzkajVwc34j9Eyl2WqfXjC0tyd5TfDXMjTpgpEqwsxsN7p71ZhZ7B5qnAke3g9koOO6MoJkFe0UcOl6VYQiukFMFJK9C9q8NmqNj2HadTmEMh96eWNhFQ7jibSwhE9prtSxsRI895dKtETfdnw3tGIAXNrYy3a1Sj1yf2NWcME7xzUIaSdFwzQUWRgvEY0kLsWcn72KAflvXh1bctnf15JrrKQUAOl7UhO7pkNWi+Z9j84W/GuxHFksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG2zYnfRmLb43OT9mdiD5lm/T/9r7Wlaz+YjVV6KHds=;
 b=BjZkalo36iwu8/QwTG0G1MjeJE6yJHJFk5fmd/6RHu2DrlsqKjH5LJWj4AhOV4VWv3x/8WNh+0PdUb4hBfqmdOiZ4AYjdk8Vj1r1anXMAX5ZAbroWc//TbJNgn25Z3ENIS1VGLaIprJXn8KywolSmvLyGnq+AJI2hRni05MH8/3Ob3ub+nkAK1puW4a42UspU6bgGBVaFXvs1kXgGdDRqn7gvh0UoO9IYgnZ9oXOzyAkwvjD3duWYBkrVV1TfzuCS9KVhqqqzBzPcxaHhV5V1F/6kjyUYkY5jyctio0kqu9+AdAMvcvPMuTmAVdiAb1WlihEIhOHUlYeieudGtsuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG2zYnfRmLb43OT9mdiD5lm/T/9r7Wlaz+YjVV6KHds=;
 b=I6EBmK5BzFg05tm4Le3m41t63GyqeAInXGTuf2aQf/7gKeVehD7mElMeE5B0s5x5HsGs27aIYf+w4+XXB0Rs4ZbhAknWLcenQwt1FgQtgLNzmI2Q81u7SUDNZ3CdyffSSHyHNARnB9ntTHmEfZn7ReGn8rFbwm0cfGk0+vIz+K4fut4yHNZk3ngtBom4s5KQVgFWBkj6LG6Fr7hekTcyC8Rl9NdaHkdzDbNgzEf15dUQrrYwuAWuLLJHOKBWegyDnHC643K31abqubZp0e3nHHyjS8EplO+ttQsJ/qde+yBF1H77SoVKXS5YEj5LQU+lUITywzd60nhL1JWxw9O5ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e27ff909-93d1-b51b-ac88-20b17f5cf642@suse.com>
Date: Wed, 3 May 2023 11:44:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 1/6] x86: support cache-writeback in flush_area_local() et
 al
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
In-Reply-To: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 8524c7b2-6117-4f39-caea-08db4bbb0445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwaZuD7vJLgsKWHayFHThjQ9LIhWqFoDzh4bQG2FlAaXxPpj3gLoFX2UZV0YJ7Ceb/b3VT3PYVTA9yrHABhXtfWodKBcPDVypkO+BakHm+BG1mgmD+rZ7tQAkQFbRsfAJhB+Ds9vc7OQ0Vadd+PGA+KzFUFqQro1qkTi7+LdpF5p7Qg0F7mZjvIYxMohHV3X5bT52Z6jew+usGCyerlBPQHFV0tnSF4qKejZFPHeq9JyEd9st/s0yixzolhvtXs8xrHogi4I63nhFhcYlArF9/iRDLkJS/Du8gJuRaJ/uySFQUWUHYox7phTSZOnhypyonyt0ItYUEnsufxTZpdE0RI0vsLu82pE/DI1JGjBdIPUnhUbhLrn9ql0iFgIzWIJnNtWmvwpq7HNyTWeNEcJ3mWMGJx7AUFTpmDMZThiechytmC8/5+eDd8or4hGI+Iy7RnO05CU8tJrNxySjHZy/9XuNdPmVQHHYALEAbCcGYKfjKkcKHuFtpmznNkJkSI4iNFnv2OT3/UXCdJ56b4a/PoheVEwkRvcfFJLXGzmEzspOVqqf034pRH8W4oRIRaOc07B0Ha9kwjQA+3NmVgSC30Vvh3bb/WASAUaL0H6ynCZmp5fCYhCMqJE1WlOJQhGip8YfFEXJTgSyYb4s+rsaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(31686004)(36756003)(5660300002)(2906002)(38100700002)(31696002)(8676002)(316002)(86362001)(66476007)(66946007)(66556008)(41300700001)(8936002)(4326008)(83380400001)(54906003)(186003)(6512007)(26005)(6916009)(478600001)(6486002)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJWRlBzdWRVYzFrOE5XRWlDNUp0Zk92VlJDM0ZHY0NpVmNReVAxMzg3QVRH?=
 =?utf-8?B?ckVXYU1HYmtvQ0UrUnk5VndFMkI2Z2pSczZQUzJjVHJERFBWZERWeGxiRnVM?=
 =?utf-8?B?NjJlWVlWbE9mRjJGajd2eFdQa0NCT3ZsQVRyY04vSEQycFBLWkJqZHRNTlly?=
 =?utf-8?B?M2M4ZUwzTkh3VjgyN3F4VFV4TzdhblpyK3VCUWQvMlpZZEtkdkMyblh2b09s?=
 =?utf-8?B?cHExU1oxeHZrdGl4bVBoWVpJaHNPblpmbjhPZnI0WjhuekZvdmd2Y0R6anBr?=
 =?utf-8?B?d1pYRzk3L3BzdzFmdDFpVzRYemFTMzVnNGJQSUtacW82dlV5bVI3ekNjOVc3?=
 =?utf-8?B?YTdzcWNoaHdrd2F4TUh0ZmhKMG94Qy9wRCtYemFQQmkyeUtyRFdEMVZESk5K?=
 =?utf-8?B?TC9lcjU5Qmd2cFJscXRMUzJFdks1UFBrcVplNFJtTnZKN2hvTUZyK0Q5MnVP?=
 =?utf-8?B?M2l2Zi9Gd2JuaHFWenZEeTBPRlNmbmpMeEFkei9Qc0w0VGNaWGRrMUNoTHdZ?=
 =?utf-8?B?OW84NU9mQnNySlREL2xSVmpvQXZsbmtnK2Mxc2xtNVBFUXRyaGJkTHpDekdr?=
 =?utf-8?B?cWhRZUhueHAzWjRFd0dxQkFkdVl5emgrY0RYL284VjI4ekVHdnZocXZENUhJ?=
 =?utf-8?B?dlEwV0hGZ1IxdDlPNmU1dkFFWFMvK0EyYUFSaGttTGljZmpqZVpnZWdJdjZ0?=
 =?utf-8?B?dDF3MDJFZC95eWg1bzR4V3JZaUQxWitxUittWUg0MjRWbVZCR0tzazlDQzNB?=
 =?utf-8?B?YmpLSU9RUkJiVzBCWmgrbEVLY2h3dXEyb1pmcUM4eFg4Y0YrNjZlc2xTdUpR?=
 =?utf-8?B?ZTJodTFPb0prb2hIYUdubkRiT1ZSMTUrdHpnMTZDZk1CelpIOEVTSFNxTUdI?=
 =?utf-8?B?cE15L0hMOG4reklLSkM3dmpjWXVKeVdMK3pHRUd6L2tpOGc1SFB1OGVkaCt5?=
 =?utf-8?B?MDZneGJqMG5kUlQxN1FraGZ5TzU4TGgxdGVqTkY0Ni9BWmhSa2kyUkdUOVU0?=
 =?utf-8?B?ZFhDYmJKOUhFd0dPdHU0dVEySEFjSU92am1GNGk3VHVQTFNpQmN5Y0t3eGcv?=
 =?utf-8?B?QUJ5eTVvRS9jZU1SZllYaDVGZEJydUZweTN4bjkxWUJ2dmdkcHM0MjRPQUZP?=
 =?utf-8?B?a3puaEFabFhDa1F5MmI5T3NONmdBU3U4VHIvbzJCU3FJNitwMGlmOU90T1Ew?=
 =?utf-8?B?ekVia0paeXRXTFFreElrd1U5cDVNMHZsQXlWcUZXTGRUbmU2c0Z4STBtSjMr?=
 =?utf-8?B?OEpMZ2Y4Qi9rZkk5b2V6THZFQTVIS09wY2VHYnBuL01vbi93SHY2bXBscmlH?=
 =?utf-8?B?bm9lMHBFUEFuSlVDU2JyUlJRdThCVFczUkNtbVU3c1ZnWlU2QlhlZ0pFK0ph?=
 =?utf-8?B?U1piZEViQnRtM1BsRHJQaXNhUGxBL0c0dW9EZFNVWlVjb1VhY3gxSFd6RFJ5?=
 =?utf-8?B?R3FuZzhXbXJkK2llMHhYMEpqaDhLa1R0bXR6ekdOaVpERjZpM3RFUFB2QVNw?=
 =?utf-8?B?c0JpUTlhS3Z6bzBGT1prRzhjZXVqYXZaNS9HUHh6dk9wUjFwa1hCalRLR0Fv?=
 =?utf-8?B?OERtS2tHOTF0ZmwvU0lvTUREQmpBVkRndE8rMHk5Q3JQbWZUdkJjQ21aYWEz?=
 =?utf-8?B?MUhkY3J2S1RscVMvZGcvbmlESzdsRy84OEVWUUMvLzVJM1IyTUNGTFdsMmtO?=
 =?utf-8?B?VFRjMGtUc2NHTXJxTlZDSXVPK0JGNkhKaXRTa2pqTExMVmlVb3NMRzhsd0wv?=
 =?utf-8?B?cTZPQlRzUnp1TXUvTGM4all4aVEyZVY1LzBmSWpZZi9mKytSaXVYNDI2THI5?=
 =?utf-8?B?aEZTckVxZVp2ellzMlg2RGlRRXY0TmdtTDZ2YlpEejl0MC9TMGR2ZUFrTzI5?=
 =?utf-8?B?RHl3K1pwdmdiU0dldFc2TS92MC9ON29pOXhZbmhHbU9BWUw4cWxqc0ZRUTRz?=
 =?utf-8?B?RitwdlM5TFRzK1pLb2pZU21EcEVIUzNhVEQzV3dMTmY0cWVoTGptQjkyK0Vw?=
 =?utf-8?B?RGRBdGp2TW5PMGc1dW4xTmozRldUZVBkZTA1Tm1GdmFHT3lwZlZLc1M0MktN?=
 =?utf-8?B?RWxmTjFnUmVydVhwMFptKzlHSkdMZEhFT3V1eFZqZDJEMTFSZllqc3pucDNm?=
 =?utf-8?Q?s2AIRFmnOe2ypOBYDwOvg2X/u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8524c7b2-6117-4f39-caea-08db4bbb0445
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:44:40.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ2rxB6r1k1fURd8zcHoxXn0iyi9GaEvBtbH2jri/gUD5oOfPxd0fpTJws8tlcn01FJhd/+r/veyNTp1yBu3Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086

The majority of the present callers really aren't after invalidating
cache contents, but only after writeback. Make this available by simply
extending the FLUSH_CACHE handling accordingly. No feature checks are
required here: cache_writeback() falls back to cache_flush() as
necessary, while WBNOINVD degenerates to WBINVD on older hardware.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: FLUSH_WRITEBACK -> FLUSH_CACHE_WRITEBACK.

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
     if ( flags & FLUSH_HVM_ASID_CORE )
         hvm_flush_guest_tlbs();
 
-    if ( flags & FLUSH_CACHE )
+    if ( flags & (FLUSH_CACHE | FLUSH_CACHE_WRITEBACK) )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
         unsigned long sz = 0;
@@ -245,13 +245,16 @@ unsigned int flush_area_local(const void
              c->x86_clflush_size && c->x86_cache_size && sz &&
              ((sz >> 10) < c->x86_cache_size) )
         {
-            cache_flush(va, sz);
-            flags &= ~FLUSH_CACHE;
+            if ( flags & FLUSH_CACHE )
+                cache_flush(va, sz);
+            else
+                cache_writeback(va, sz);
+            flags &= ~(FLUSH_CACHE | FLUSH_CACHE_WRITEBACK);
         }
-        else
-        {
+        else if ( flags & FLUSH_CACHE )
             wbinvd();
-        }
+        else
+            wbnoinvd();
     }
 
     if ( flags & FLUSH_ROOT_PGTBL )
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -135,6 +135,8 @@ void switch_cr3_cr4(unsigned long cr3, u
 #else
 # define FLUSH_NO_ASSIST 0
 #endif
+ /* Write back data cache contents */
+#define FLUSH_CACHE_WRITEBACK  0x10000
 
 /* Flush local TLBs/caches. */
 unsigned int flush_area_local(const void *va, unsigned int flags);
@@ -194,7 +196,11 @@ static inline int clean_and_invalidate_d
 }
 static inline int clean_dcache_va_range(const void *p, unsigned long size)
 {
-    return clean_and_invalidate_dcache_va_range(p, size);
+    unsigned int order = get_order_from_bytes(size);
+
+    /* sub-page granularity support needs to be added if necessary */
+    flush_area_local(p, FLUSH_CACHE_WRITEBACK | FLUSH_ORDER(order));
+    return 0;
 }
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);


