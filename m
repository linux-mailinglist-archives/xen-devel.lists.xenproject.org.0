Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4316D0324
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516639.801086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqSg-0000ZC-99; Thu, 30 Mar 2023 11:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516639.801086; Thu, 30 Mar 2023 11:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqSg-0000XD-5r; Thu, 30 Mar 2023 11:28:58 +0000
Received: by outflank-mailman (input) for mailman id 516639;
 Thu, 30 Mar 2023 11:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqSe-0000Wf-DM
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:28:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cf75118-ceee-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:28:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:28:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:28:51 +0000
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
X-Inumbo-ID: 0cf75118-ceee-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHym341cL9QELRcjy2x7O6q96mwuEBCwMNXjhd92QikchXkzhSMf/rc3PE0uKKPerDQdQdCkjqvfUwQF4PCwaS81BRW9iDgN1AvGcfChEG/XQ/A7ZS7P+j/zibFLzN57IajoC4QOwm05qjiaNTBlNMNtGPPIJ/xlA5ryidq7vMeu+Lzdgd9xR2Vb/5x5gAMKTMPuNCjArPXpbldi+y1zJrGQhXZAGgDk5BQZ3qpPKuhxozsrvZQ7dq1obz7r9KfGln7MjlZj+eBiUwbGLbujMDsiAtkP2HtcEdNwzxjMURH1AzCA8+7kA48jRIm7C5EL/pCpDsAQkDYrzR/0nmj9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMWrhjKLwqoqO04g0GrrD1jO59AIbRDrnsG95manGKw=;
 b=AYsb16hdbV6yw2IeB3weg6oAZSJaQBD3FVdYD38wOLSRg5sleltKalO99Ojd6GtznGojxbmhXi7DbuL+E62m0+NjihGgh/V8CzyOY1W28xwXIwgJBW9+lbkyZkhWdQtkiGkZvIv8GdgM+HCD2apHSHzeHnSMsmZCjn9VEpTMgrWxOjRXkx3vhCaXi963MeBlhGaD1GvL4iG1N3bcpyUS8rPeAHraePJWHXa47WUZvuMD3PCRiU7W8Ugb6H7tdHy8JmNhq1bBT8J56fVD+DUN4+DkFDQN3XBhRgFnJsezmGEkeDf1B5+JbUD6qSwNkF0Q0SivtapwDE0YeJrnBA4E5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMWrhjKLwqoqO04g0GrrD1jO59AIbRDrnsG95manGKw=;
 b=qxmeKtZ3WVO/tRgv4DZWBRUVg3siGHJMdzMrPhiLOYginJdqkpjBwYfvKU2kqvCnXeBcfZtZ9mcPKDbJx31iC1CpjQ+rwV9uSKthP+TNoEk105H1wXTh6lfzoR8zsRe4eto40CKEMNhm7JB19kfXxAQGbvygbzo+U5P5YNCWd9o7wyVCs/ak2yW5i2Hc/1YSv4PO57twbf2F7vGFKOLPx7Q2CQ/M4kovz2x/Vffta3NyHGDR3DUJAMpoEpEqu18O9PLXXbSV+CQ9YPHYUfe4T6Me+kuu5SV14d4NUCxys2FAUBIHM8c4rUeQ2War1eMarBzF6sVZvLXV/g1FiAvMlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74eb4a4c-8f5c-fd1d-f3a2-479abe736480@suse.com>
Date: Thu, 30 Mar 2023 13:28:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 06/13] x86/shadow: use lighter weight mode checks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: ad630740-782b-4e70-e904-08db3111eff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8memgGHnnl3923G4y2R5P0BTvyELGs7DNEdsvhKy4/yfszg5A5bqzZZNkznqif5mhuvcMNAq6rBUeZud9QVj7DN67b61qu9/UMO9lZWXGtQjKKvsFnfAe8DMFURf/jYhrwbGX0u+8qDPSu7y8onqDWiWtMSWJ47mxS41ET7dFmwzjIRKpBN5casbravTVC/EnzbmSHX5KUPos9HL06AP2awRb0C4TmQLwNPajiIb7R3rDklcKD6mf8fS5Q8zYkp90Gex55pOjhD+AZ4waBYVm2u3BlophI9QsN1/deCYmxorMg1dMw6eSvz1BUcJZUCcCAOYQTmNkF1YPlk2KQZQmSfrSPZmO8ds69sdzMUyJGIZq9De6gOvox6irR56LkNS/CtOoqupIamvyFao3yfbq9FtA4ZaBIamLc0scfyPum4cULWpLwguO0xJpCnUf5bEPavUfPIdLMhVjCRztc1TqvnYNEcTacbc2/CnIAtWlonIKmcFjMq30ZnATs4VBQdiU1dF2DW0nl/PF+Ydw8HPq6tVRNH4XsEzqFBmhuOa/70bxaG1P5gwlNGGNs+we5R6qptn6w4FILHYNI7sZwcrPqcY5PxsnAsCti72bT+IbnWia1izGw7bf3JF+OCJYg0yZUbiBDsbSERDBf38KwUyCFS7Sk430PEKKkFYX2O9qxBXzhSbiPNarDFEHbGepf5fZgzwKcsMSe2SoHFTiW6HwiYenbKrr7oxljvs/0TsvFmxYm+WBqnnmMH3CpCCRbOA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39850400004)(451199021)(2616005)(83380400001)(6486002)(26005)(478600001)(316002)(186003)(54906003)(6506007)(2906002)(6512007)(36756003)(5660300002)(8936002)(38100700002)(4326008)(6916009)(66556008)(8676002)(66946007)(31696002)(66476007)(41300700001)(86362001)(31686004)(66899021)(16393002)(45980500001)(43740500002)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzFwYnVhS1pMdnpseFQzL3NlYWNwWktxNmI0SGdqZ2ZPRU5iWkx2QndLLzVu?=
 =?utf-8?B?eVRabXE3TTZ4SVQzSk5zUi9YeDJDbGFYZE1vR1pSakRtVGFqSm1rYjdMajha?=
 =?utf-8?B?c29IOUZpOXdIL0hFSW1EcGJDWGNSOXdNL2pFOXYyWGZLcjNSS0VpSlVYWWQw?=
 =?utf-8?B?enRrbU8vU0dKdTZLYWczaFloZk1KY3hMK0ZnTEY1K0tyV1dsLzZzbmlZNUcy?=
 =?utf-8?B?d0JaS3liQW90bHVtV2E2MWdlY21zMnUyb1Z2Q09RcGZNYStvVFVUckVXdXJO?=
 =?utf-8?B?eFAyQnRjUE9CVEpabmwzNTd1dnJPSTFLT3drSm9DRFEwUzFnOTU1TjBkL1E2?=
 =?utf-8?B?c0xSYXRFRUFaR3hUcHptMGFoWmIyM05RU0Z5VGIvRE5XSXNQc3kzdXdtcnRu?=
 =?utf-8?B?Mzkyblp4MFJ4MFlnTk9KMGhDcWNpS09ocFFvUmZuVHgrRmhqTUdaVk4zOU1Z?=
 =?utf-8?B?cWhpNmcweU5iK2dxWFN0NjQ1VUdheUdMTkRYT3lXa25ieUxWZCtsNkRZTmVy?=
 =?utf-8?B?bjRBeG16a0FwNFhkQnZ5ZGRLOGpKN1lVcnUwNndyU09QYmJza0xJNnlYMmV3?=
 =?utf-8?B?MHFxbklPaFBPK2VlYmc1bjFvSjFveG15NTRXcDNveVdNUHkvLzdrZ0xXY1gv?=
 =?utf-8?B?VW50ck9pVXN6L3lTUHhFU2lRQmRZK0JmVmsxdUtCTURPbEN1ZUh2MTNscXVO?=
 =?utf-8?B?Wm1Uai9kVjByaWJYME5FM0dDRmN1UnluNXJMcFBNMVVkVVRkdTZPVFZZRHVn?=
 =?utf-8?B?b1BjN3dacUJkdG4zLzRlci85azlYL0RkL2psT2E1NDNxN29xUEF4T1IzN1Mw?=
 =?utf-8?B?c29DSWtROXhkTm9MRmUwak5NYmpqZ2ZEMm85OGxuNmxIUGd4OW9Wd214MzJx?=
 =?utf-8?B?UGUwMGMyQ08xM1dEb2Rkd3ZhOVRURmZzYy82UXVURFBaL1RtN2xXWVBiME1V?=
 =?utf-8?B?VFZ2OXhNSWh1VG85VWgxOFl4ZExNM0lmQUxqK0gwZkNuR1R1K2c3ZkVpM2p3?=
 =?utf-8?B?KzN0SkVOK0lUWFlYR2Z2SlBQcEFDd25YbE5QdjZnakpFWnpvZ0xha1B1UUEz?=
 =?utf-8?B?UW0wT2JqYitYeGlFTU9NbmdyamcrMzd4cThxNVpjbjZ1bHpLZU5INTNvWHRl?=
 =?utf-8?B?L0czd1dzVzdFNzhKbUdXYm85M3pqaW90SGpLZUJIMlNiN1NhYkdNTUpDSXBX?=
 =?utf-8?B?RXhpWGZKdFRaMWVkdERoeHlnc1hhUjVNaVFyY2dmYzRTQ3pCR213V1dIVlZk?=
 =?utf-8?B?MHZzVHFnbjBNenp3ckV0SzFhdjA2U09VajhndGNmWXhUWmlBakhvVmUwSTU4?=
 =?utf-8?B?MVh5QjhSNlI5dmNSZnFyZWU5YXloQmozVmJQbWFiT1dGTUFlYjI3ejlsUk0y?=
 =?utf-8?B?NENCY2V2Tml5b1V1ekhyKzBDZHdtVm1hQXRrZG44a3QzVVZUbmRobzVEbGxn?=
 =?utf-8?B?YzJTUjk1ODRTN2lUbWJDSEdETy9yQUZtZzdZNEE5cnZqSTVkV2dpUHJhcGhp?=
 =?utf-8?B?R3NKVGd1MU04QmhXZldBMWdOZTdqczdETjArVzBZWmlZYmlqSHlrWUc1RXFO?=
 =?utf-8?B?Y2hGanZZRERTTFBwaXhJWnZ6N3NieGwwR2pnYWpycVl6OWVJaHdjZGZrUERE?=
 =?utf-8?B?bllTREgvSGh3bGZtY09jMWxsMGVGMVh4bGs4c1VvK2Q0U0s5eTVrM1RaQU5C?=
 =?utf-8?B?TG5kOFJpd2dTdG4zNk5lVVBvUmswYytTb1ZGMmxMSVFIYjZNT3NHdEcyRUpv?=
 =?utf-8?B?NW8zeitPa3ZONWFoTGhxQk16YnhOVUF3VitMNndaUnYyVktUYnE4SVhsbEtl?=
 =?utf-8?B?MHZJTmgvWGZ1d3VNaXZNTy9LSjkxaHFFR09aNGNpVEFYZFVLQzlxUHVmVXpD?=
 =?utf-8?B?a0UycEhhVTJTZzAwM3NQUlZlSHR3MHMyc21xZis0Ynh0dGZvUnJsWUNwSmNw?=
 =?utf-8?B?SWdpR2h3RXBoak1QRktwemRYaG9KcFBMN1JCWTBJYWtvN29pQXdPQXlkNzNW?=
 =?utf-8?B?MHN3am9BdnRNZThKL1dUeG56MEpTeERHM0tia0E3YVVscEdxVHB3L2N5Tjc5?=
 =?utf-8?B?ZVJ0c01TRTNEYWZ6R0xJL3NKNzV5T2JQOCs4ZDFFMFd0d3ZnVnlqRzZydDkv?=
 =?utf-8?Q?Xj5JBqCcr6fb1HWB3gAaIjL9f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad630740-782b-4e70-e904-08db3111eff2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:28:51.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWpWk8yDV2la+oYkT79E07SY+0eEmvB0wIHZVmKdxSroYbZOm58Q+lBGZpRVYP09bsrp5KrzFtjAAykW+lxFHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262

shadow_mode_...(), with the exception of shadow_mode_enabled(), are
shorthands for shadow_mode_enabled() && paging_mode_...(). While
potentially useful outside of shadow-internal functions, when we already
know that we're dealing with a domain in shadow mode, the "paging"
checks are sufficient and cheaper. While the "shadow" ones commonly
translate to a MOV/AND/CMP/Jcc sequence, the "paging" ones typically
resolve to just TEST+Jcc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over new earlier patch.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1856,7 +1856,7 @@ int sh_remove_write_access(struct domain
      * In guest refcounting, we trust Xen to already be restricting
      * all the writes to the guest page tables, so we do not need to
      * do more. */
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         return 0;
 
     /* Early exit if it's already a pagetable, or otherwise not writeable */
@@ -2088,7 +2088,7 @@ int sh_remove_all_mappings(struct domain
          *   guest pages with an extra reference taken by
          *   prepare_ring_for_helper().
          */
-        if ( !(shadow_mode_external(d)
+        if ( !(paging_mode_external(d)
                && (page->count_info & PGC_count_mask) <= 3
                && ((page->u.inuse.type_info & PGT_count_mask)
                    == (is_special_page(page) ||
@@ -2385,8 +2385,8 @@ static void sh_update_paging_modes(struc
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
-        ASSERT(shadow_mode_translate(d));
-        ASSERT(shadow_mode_external(d));
+        ASSERT(paging_mode_translate(d));
+        ASSERT(paging_mode_external(d));
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
         /* Need to resync all our pages now, because if a page goes out
@@ -2773,7 +2773,7 @@ void shadow_vcpu_teardown(struct vcpu *v
 
     sh_detach_old_tables(v);
 #ifdef CONFIG_HVM
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -526,7 +526,7 @@ _sh_propagate(struct vcpu *v,
                || (level == 1
                    && page_get_owner(mfn_to_page(target_mfn)) == dom_io);
     if ( mmio_mfn
-         && !(level == 1 && (!shadow_mode_refcounts(d)
+         && !(level == 1 && (!paging_mode_refcounts(d)
                              || p2mt == p2m_mmio_direct)) )
     {
         ASSERT((ft == ft_prefetch));
@@ -543,7 +543,7 @@ _sh_propagate(struct vcpu *v,
                        _PAGE_RW | _PAGE_PRESENT);
     if ( guest_nx_enabled(v) )
         pass_thru_flags |= _PAGE_NX_BIT;
-    if ( level == 1 && !shadow_mode_refcounts(d) && mmio_mfn )
+    if ( level == 1 && !paging_mode_refcounts(d) && mmio_mfn )
         pass_thru_flags |= PAGE_CACHE_ATTRS;
     sflags = gflags & pass_thru_flags;
 
@@ -663,7 +663,7 @@ _sh_propagate(struct vcpu *v,
      * (We handle log-dirty entirely inside the shadow code, without using the
      * p2m_ram_logdirty p2m type: only HAP uses that.)
      */
-    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) && !mmio_mfn )
+    if ( level == 1 && unlikely(paging_mode_log_dirty(d)) && !mmio_mfn )
     {
         if ( ft & FETCH_TYPE_WRITE )
             paging_mark_dirty(d, target_mfn);
@@ -819,7 +819,7 @@ do {
 #define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)    \
 do {                                                                      \
     int _i, _j;                                                           \
-    ASSERT(shadow_mode_external(_dom));                                   \
+    ASSERT(paging_mode_external(_dom));                                   \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_32_shadow);      \
     for ( _j = 0; _j < 4; _j++ )                                          \
     {                                                                     \
@@ -845,7 +845,7 @@ do {
 do {                                                                       \
     int _i;                                                                \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                        \
-    ASSERT(shadow_mode_external(_dom));                                    \
+    ASSERT(paging_mode_external(_dom));                                    \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_pae_shadow);      \
     for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                 \
     {                                                                      \
@@ -866,7 +866,7 @@ do {
     unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
     ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
-    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external */ &&    \
+    if ( is_pv_32bit_domain(_dom) /* implies !paging_mode_external */ &&    \
          mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
         _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
     for ( _i = 0; _i < _end; ++_i )                                         \
@@ -908,7 +908,7 @@ do {
 #define FOREACH_PRESENT_L4E(_sl4mfn, _sl4e, _gl4p, _done, _dom, _code)  \
 do {                                                                    \
     shadow_l4e_t *_sp = map_domain_page((_sl4mfn));                     \
-    int _xen = !shadow_mode_external(_dom);                             \
+    int _xen = !paging_mode_external(_dom);                             \
     int _i;                                                             \
     ASSERT(mfn_to_page(_sl4mfn)->u.sh.type == SH_type_l4_64_shadow);\
     for ( _i = 0; _i < SHADOW_L4_PAGETABLE_ENTRIES; _i++ )              \
@@ -977,7 +977,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
 #endif
 
     // Create the Xen mappings...
-    if ( !shadow_mode_external(d) )
+    if ( !paging_mode_external(d) )
     {
         switch (shadow_type)
         {
@@ -1379,7 +1379,7 @@ void sh_destroy_l1_shadow(struct domain
         shadow_demote(d, gmfn, t);
     }
 
-    if ( shadow_mode_refcounts(d) )
+    if ( paging_mode_refcounts(d) )
     {
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
@@ -1476,7 +1476,7 @@ static int cf_check validate_gl4e(
     l4e_propagate_from_guest(v, new_gl4e, sl3mfn, &new_sl4e, ft_prefetch);
 
     // check for updates to xen reserved slots
-    if ( !shadow_mode_external(d) )
+    if ( !paging_mode_external(d) )
     {
         int shadow_index = (((unsigned long)sl4p & ~PAGE_MASK) /
                             sizeof(shadow_l4e_t));
@@ -2399,7 +2399,7 @@ static int cf_check sh_page_fault(
     gfn = guest_walk_to_gfn(&gw);
     gmfn = get_gfn(d, gfn, &p2mt);
 
-    if ( shadow_mode_refcounts(d) &&
+    if ( paging_mode_refcounts(d) &&
          ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
           (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
     {
@@ -2623,7 +2623,7 @@ static int cf_check sh_page_fault(
     return EXCRET_fault_fixed;
 
  emulate:
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         goto not_a_shadow_fault;
 
 #ifdef CONFIG_HVM
@@ -3067,7 +3067,7 @@ sh_update_linear_entries(struct vcpu *v)
      */
 
     /* Don't try to update the monitor table if it doesn't exist */
-    if ( !shadow_mode_external(d) ||
+    if ( !paging_mode_external(d) ||
          pagetable_get_pfn(v->arch.hvm.monitor_table) == 0 )
         return;
 
@@ -3216,7 +3216,7 @@ static void cf_check sh_update_cr3(struc
     /* Double-check that the HVM code has sent us a sane guest_table */
     if ( is_hvm_domain(d) )
     {
-        ASSERT(shadow_mode_external(d));
+        ASSERT(paging_mode_external(d));
         if ( hvm_paging_enabled(v) )
             ASSERT(pagetable_get_pfn(v->arch.guest_table));
         else
@@ -3241,7 +3241,7 @@ static void cf_check sh_update_cr3(struc
      * table.  We cache the current state of that table and shadow that,
      * until the next CR3 write makes us refresh our cache.
      */
-    ASSERT(shadow_mode_external(d));
+    ASSERT(paging_mode_external(d));
 
     /*
      * Find where in the page the l3 table is, but ignore the low 2 bits of
@@ -3272,7 +3272,7 @@ static void cf_check sh_update_cr3(struc
         ASSERT(d->is_dying || d->is_shutting_down);
         return;
     }
-    if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
+    if ( !paging_mode_external(d) && !is_pv_32bit_domain(d) )
     {
         mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
 
@@ -3366,7 +3366,7 @@ static void cf_check sh_update_cr3(struc
     ///
     /// v->arch.cr3
     ///
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         make_cr3(v, pagetable_get_mfn(v->arch.hvm.monitor_table));
     }
@@ -3383,7 +3383,7 @@ static void cf_check sh_update_cr3(struc
     ///
     /// v->arch.hvm.hw_cr[3]
     ///
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         ASSERT(is_hvm_domain(d));
 #if SHADOW_PAGING_LEVELS == 3
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -420,7 +420,7 @@ static inline int sh_remove_write_access
                                          unsigned int level,
                                          unsigned long fault_addr)
 {
-    ASSERT(!shadow_mode_refcounts(d));
+    ASSERT(!paging_mode_refcounts(d));
     return 0;
 }
 #endif
@@ -533,8 +533,8 @@ sh_mfn_is_a_page_table(mfn_t gmfn)
         return 0;
 
     owner = page_get_owner(page);
-    if ( owner && shadow_mode_refcounts(owner)
-         && (page->count_info & PGC_shadowed_pt) )
+    if ( owner && paging_mode_refcounts(owner) &&
+         (page->count_info & PGC_shadowed_pt) )
         return 1;
 
     type_info = page->u.inuse.type_info & PGT_type_mask;
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -93,7 +93,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
     struct domain *owner = NULL;
 
     ASSERT(!sh_l1e_is_magic(sl1e));
-    ASSERT(shadow_mode_refcounts(d));
+    ASSERT(paging_mode_refcounts(d));
 
     if ( mfn_valid(mfn) )
     {
@@ -354,7 +354,7 @@ int shadow_set_l1e(struct domain *d, sha
          !sh_l1e_is_magic(new_sl1e) )
     {
         /* About to install a new reference */
-        if ( shadow_mode_refcounts(d) )
+        if ( paging_mode_refcounts(d) )
         {
 #define PAGE_FLIPPABLE (_PAGE_RW | _PAGE_PWT | _PAGE_PCD | _PAGE_PAT)
             int rc;
@@ -387,7 +387,7 @@ int shadow_set_l1e(struct domain *d, sha
 
     old_sl1f = shadow_l1e_get_flags(old_sl1e);
     if ( (old_sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(old_sl1e) &&
-         shadow_mode_refcounts(d) )
+         paging_mode_refcounts(d) )
     {
         /*
          * We lost a reference to an old mfn.
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -274,7 +274,7 @@ int shadow_set_l4e(struct domain *d, sha
 static void inline
 shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
 {
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         return;
 
     put_page_from_l1e(sl1e, d);


