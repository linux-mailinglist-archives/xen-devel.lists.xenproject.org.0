Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75036509F9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 11:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465980.724791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7DF7-00045M-Jo; Mon, 19 Dec 2022 10:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465980.724791; Mon, 19 Dec 2022 10:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7DF7-00042l-H5; Mon, 19 Dec 2022 10:19:33 +0000
Received: by outflank-mailman (input) for mailman id 465980;
 Mon, 19 Dec 2022 10:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7DF5-00042d-W4
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 10:19:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fb16289-7f86-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 11:19:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6846.eurprd04.prod.outlook.com (2603:10a6:803:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 10:19:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 10:19:27 +0000
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
X-Inumbo-ID: 9fb16289-7f86-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaWZ2WwpYX5uzDE6qqVrxPIPzid56rVLSvspEBBbNlvK9IvZgHVGbTR9VdoyGc+8U/vOCxbsMPWO66VgzEgOtnSlAQCB4PnJy4uWSVpGl6MuQqKQfvahK9rNIFwyu98sxAd6q04DWSIXKTEfqmws8Mc1a8cgf65JhlTe60bfWp9veQdDEdBUeJriiq/KYZsICtzpeSIgGupTpgxwrkMfvjnOWlBCWxcFJBzTaFgvlxMBm3j16plM0tNw4T8jg3MF/WK5j3LkVg2kNJDgqumPmM5PaQiZGII4VXUBJzZwFGZwliK9gpcCLvFg88K0fc3BzjyB0QmpBaXIHhwSXGyfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YutDsqFUuEXkKGXksRxdd9RJ5vOoNIl9MpgB9o5wh5w=;
 b=PqvU+WjyMTOwLgpBAiLO0i6xXTM4niPiDE2UV1KLu2ndJokoGMobZhNZ4LqibvZIvLCpC9LbdJiiISR63568KfAE36N5ydnxswB6Tk3EsuJTdGOhgJSAiFZptUtyn54hFbCEUI2ByNlqwTkbyLLj4FnRK8K2nfZfocng/JPswN5yW6nT0lHXT5TGmOY6IVGxUqlBwrnp2SMLfY6e+znU2cMSMdGAUFkD9fmTUmkXu2RmpYTHI3HKa56JczdiTHnPfq2B+LpUurSWWy80/6llhd5DnqlifFa6wEsE2Wpt0BdWeMRkrX10usLIzot2v/VJ/D/RM9w1HxXugWVdB3S9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YutDsqFUuEXkKGXksRxdd9RJ5vOoNIl9MpgB9o5wh5w=;
 b=VL1tRW6QArGRmdkU/RbUPmRUAOunKuPnVsBaRw2R60TcPkt3PfPKofVER18DGhZHnasWVIxf10/C0z5exKjMNGuezQMxMSK5XmgIwfMA4ribjwKeTvPvjrHtnun8/Q7jC9nRRfiOV1mqTEAkUotCyZ9pZ3v19UsKUpDloVAhqQlPDSabRRGejrOdVBSc07wyXfB3crc1qM+hWMNYnWOeyPP7Xs3W2alYtuOeG8CqwtSgQ8RYRqtIULETFblhRlfjieOuBAk5Dgl1aocN3iJodK3IFgunpJirvBPImeFhHzqW3rjj7ssbXmTYvVlVADty8oT9v6CyISGEiSP9f2LImQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e6390d3-d45e-3006-1370-adb0565445d2@suse.com>
Date: Mon, 19 Dec 2022 11:19:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] NUMA: replace phys_to_nid()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 41eccf64-06d4-4e3e-a50a-08dae1aa8256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c3r5MzOThYfqNe/v8nnE3UOEdOhgDtizJCMfLuGU5vF7VK5dq4iuub7tHOtGS9dpFL6vVJzVyOhU7+GoIpqlL44F5IJYpHozkrgKPmcewM8lWV3anqcDK3O7entJSgTeJe3mxNKcOcgNUwcf8yYtooPwXHDccJ30DPlY7eeffnByIsrXDrlS58AFY0C8H8KtMuP/qeuyPeqoyLL9pi8xBID52Own5aIfA2f/toXDTHSQDkaNT5COSYpZzCwFu8Z/jL5y9mM+3nwyJHHGQMyrZkiib2o7FUL7kdpbYj24OC+z/s7ns/Ow6O01N2t2hyY0AOYbv8cfYvVUPjVmdFO25SS8uMcTUCTyWG0BIJonGUMBLg8h9xBURSxWe72Mj2TI4pz+w34bY3c3QqLVuuO5a47hkH9NICOEeKzk4xl8cFc2MbplQ6hefmhCtrUb0TBaAa13Jf7ft/HlMW/FErQg4SglLrjYpaiLfDaJYYEEwvBmWV9SN25CYBsgIxHCwY7aC9PprvKLvPYZ8qK3dKP/mZbustPB+yqVW3duk8Xr4g3B+G9gHTDjcmcL+g5fwvGJtimijxc99DnWWrUgn3cvtjPjA0RNV8tP8dnUDBxy19sqgxwdeK6Mgtm55zl37YrIOhbAuzig7cv9DEpKBmOvkGpUTHuuw6tQsYNvh0TQcYFir7A9pCGv75vaSFEuZMRhuAnnouznNscprXPt/oN6vdPRAlDKDvyPiyhBk3y5BmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199015)(41300700001)(4326008)(8676002)(36756003)(38100700002)(5660300002)(8936002)(2906002)(83380400001)(31686004)(6506007)(6486002)(478600001)(316002)(26005)(6916009)(66556008)(54906003)(66946007)(66476007)(2616005)(31696002)(86362001)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGNZbDhzekVyekRFRFZlcTBlRExMMnB3MDRta1VNR1I3R0w2b3hQUXRmeURY?=
 =?utf-8?B?Tk9ncUsrVWRkeDRVWTU4LzVkNWFzMzE4a29zZjRYMkcrWDlOT29wRnRNTWZh?=
 =?utf-8?B?d0RBMm80ZE1STDN0ZXJMWUxLS1pmbXpoVzdzY0l0VU1DSEV6WXZHYnNpWVhW?=
 =?utf-8?B?Z0w4VWRscjhyWG5NVUFMM0d6byt1ckJreFBCcG5EY1JnVnpKRnJrejY3NzBq?=
 =?utf-8?B?SENDZnh3d05Eek1qTmhxcHJEV0RLYldJc2tWd2ZUVjNRQTY5VFVHNVQzR2pT?=
 =?utf-8?B?bk42M2VQWGNYekM0NFhRR0ttQkJIV2poVkxHck1BZ09rUkoxRiszZHk5V1Yy?=
 =?utf-8?B?MFB2cUE5VlFXR0ZlS1l4WU81N2tTL0hydnhtektCUDNPTUpQV2xrSVlzQmJj?=
 =?utf-8?B?QjdxMUY3bHZQaDFtV3BiMGRzdEJyUW9JSDRLQ3liYmNUMFZNZlp5NDJiTXZr?=
 =?utf-8?B?UGJ6dFlueUx4c3k4UG5HcThJNE1vUklPQzNvMTNmVHFpYjlPYlVpYVQzUUd4?=
 =?utf-8?B?UkJlSVplS28wNGhORmNwK0Uzd1ZEUXdvZVBFSGRWM2RnQnV0bmQrR01xSVJi?=
 =?utf-8?B?enNCb25FdWMzOVBmU3BhSnIvYmltKzdqNXNQN2FzaUFEUENPSXZCL0UrQUhh?=
 =?utf-8?B?elNpZVBrZDFJSVh4WVNJMEphcUhQZmZGeEh3WnBjOTFwUXUrcXM0WXpJdUpo?=
 =?utf-8?B?cDBnSzQ5MnhNVjRCQ29DUFpYUFRrdDhkclZMcG5KVjk4OVkwYlQ4dHRJWnNm?=
 =?utf-8?B?dkEzRFdsZ2FmOFJqVlF2VERZTHZIQXR2NGZ4eHZ4UE9JWFpVZEpGRXNnbGgv?=
 =?utf-8?B?SUVkbHE2RGZwd0Fta2dPT3ZuT21uV01EU1hJSzVlaWsyQURtNjlNU1hQQ29C?=
 =?utf-8?B?VGFwTlQ0c3RoS0orWUt1QjVuSDMzK09HbVhDclNtNVlOKysxWXJ4T2g4dGxl?=
 =?utf-8?B?N1FEZERUd0p2c1JDUE5icVFrUUxvY0UwT3ZIb2JoL0J5Z0lVRVdnOStTUFNh?=
 =?utf-8?B?VGZzSUcwTlYvcmtuTXZGUERBK0hYVUJ5TU54NGI3SXJubFZrV3FOS1BuT092?=
 =?utf-8?B?d1NkMC8xNTUzUlVyZEQ4a2plcU5zQ3NZZWtoeFBGMm53eC9HSzh4UCtLSGxm?=
 =?utf-8?B?TkNoalJIS0wwemZRN1l2NTdERGU5Y3g1TlRpb1hDbE5Fa0cxMWlpMXlVdmdF?=
 =?utf-8?B?MkxGanMrUGlkL2VGRGtHd05KQnFyYlFtZ1JGMXJsdHQxLzFIQWw1VUIvWmZu?=
 =?utf-8?B?SVAyejNvdXhhU005bW5IcEtFd0tpVDFuQW13NG1GSzREdjd5a1I1UkZ3S0t5?=
 =?utf-8?B?bFNZcGhiTVBkZUprT3lLN1V2a2lEbUR4TklLcThLbGdNYXYxN2ZYSG0wbzR3?=
 =?utf-8?B?MW9HSnlYZW16L25IbTh6OFN6TVQ5SUdUZ0pkZ1BSUWYzajhKOXJyZ2lRYXVz?=
 =?utf-8?B?V2lzZ0crS2NleDM4cmMyNDFLVXI4QzlPVnQ3ekRQYWVVOWJWMURmSUdGc1Jw?=
 =?utf-8?B?TTBkblhIUnE4UXFHOW5nL2ZJTDJocUNzWHFTQXpZQXR6YitvVy92dThSeTQ3?=
 =?utf-8?B?aTR2elJ5NmdFMm5uS2V0NzVyWnR0d24zVGp3Y1RyM1p6c0s1VGg3RDA4a2VY?=
 =?utf-8?B?T3NpZ1ZGc2pjSUVHMzRFU0tHR25OeVJUS0Y5VTZRZS9BSGtYOWFHZlY2OWU0?=
 =?utf-8?B?cCtJdldjZjJLN0xsMUVRMytCMWx2Uy91MUM5bFg5YllaNGp2aWl2QXZ5V1Nv?=
 =?utf-8?B?ZjB2eWM2NFZQLzI0WXdFU3lYZG5uTWhlYjB3TGtUeW5HUHp5Vm9wWXJOZ2h0?=
 =?utf-8?B?TGF1RTlIalc2Y1ZtRVpqRDUreW9HQTBDMUFiT0ZLcE4zeHFBenZqNmpwZDdv?=
 =?utf-8?B?QUdaVmdCek42UFlWeVU5Z2NBSEdqVEpPbWxDblc3Q1ordFZFMCt3SVltVEdr?=
 =?utf-8?B?WXI2Y2J4Vy9wbUtLcjhUbWZBR0x2S0w5TlF2MGh1VG5KME8rS2lyWlFNMktJ?=
 =?utf-8?B?bmc3bTMrb2NLWmxXaENqcmI5eEVWTTYrQjczWUFqY1lzU3FoOTVQa3BLa1ZV?=
 =?utf-8?B?d2RmVUo5cUhRQlJZalJnOTFyRm5QRWRqUHFSY2xKOTFvcFZsUXdDMnQ5NW1o?=
 =?utf-8?Q?gza8zHNlQA6vRrVrdAjt76iu7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41eccf64-06d4-4e3e-a50a-08dae1aa8256
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:19:27.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gM4NzAi0e4LoQVmJh6HEA2V3e5vWN5nWfTqmRPoVU2RZPPhlhf42LLorwGIdtHJIXKFJcv1sKB0PreyebXgcXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846

All callers convert frame numbers (perhaps in turn derived from struct
page_info pointers) to an address, just for the function to convert it
back to a frame number (as the first step of paddr_to_pdx()). Replace
the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
call sites by the respectively most suitable one.

While there also
- introduce a !NUMA stub, eliminating the need for Arm (and potentially
  other ports) to carry one individually,
- drop the (strictly speaking wrong) "pure" attribute from the function,
- extend a condition in dump_numa() to make sure that none of the
  assertions would trigger for empty or (unlikely) single-page nodes (at
  the same time this also prevents the warning printk() to be issued for
  every empty [e.g. CPU-only] node).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Refine guarding in dump_numa(). Drop __attribute_pure__. Use
    mfn_to_nid() in free_heap_pages().

--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -11,11 +11,6 @@ typedef u8 nodeid_t;
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
 
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{
-    return 0;
-}
-
 /*
  * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
  * is required because the dummy helpers are using it.
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -492,7 +492,7 @@ p2m_pod_offline_or_broken_replace(struct
 {
     struct domain *d;
     struct p2m_domain *p2m;
-    nodeid_t node = phys_to_nid(page_to_maddr(p));
+    nodeid_t node = page_to_nid(p);
 
     if ( !(d = page_get_owner(p)) || !(p2m = p2m_get_hostp2m(d)) )
         return;
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -565,7 +565,7 @@ void __init paging_init(void)
                 if ( n == CNT )
                     ++holes;
                 else if ( k == holes )
-                    memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
+                    memflags = MEMF_node(mfn_to_nid(mfn));
             }
             if ( k == holes )
             {
@@ -600,7 +600,7 @@ void __init paging_init(void)
             mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
             if ( mfn_valid(mfn) )
             {
-                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
+                memflags = MEMF_node(mfn_to_nid(mfn));
                 break;
             }
         }
@@ -677,7 +677,7 @@ void __init paging_init(void)
             mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
             if ( mfn_valid(mfn) )
             {
-                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
+                memflags = MEMF_node(mfn_to_nid(mfn));
                 break;
             }
         }
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -671,15 +671,15 @@ static void cf_check dump_numa(unsigned
 
     for_each_online_node ( i )
     {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+        mfn_t mfn = _mfn(node_start_pfn(i) + 1);
 
         printk("NODE%u start->%lu size->%lu free->%lu\n",
                i, node_start_pfn(i), node_spanned_pages(i),
                avail_node_heap_pages(i));
-        /* Sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
+        /* Sanity check mfn_to_nid() */
+        if ( node_spanned_pages(i) > 1 && mfn_to_nid(mfn) != i )
+            printk("mfn_to_nid(%"PRI_mfn") -> %d should be %u\n",
+                   mfn_x(mfn), mfn_to_nid(mfn), i);
     }
 
     j = cpumask_first(&cpu_online_map);
@@ -721,7 +721,7 @@ static void cf_check dump_numa(unsigned
         spin_lock(&d->page_alloc_lock);
         page_list_for_each ( page, &d->page_list )
         {
-            i = phys_to_nid(page_to_maddr(page));
+            i = page_to_nid(page);
             page_num_node[i]++;
         }
         spin_unlock(&d->page_alloc_lock);
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -971,7 +971,7 @@ static struct page_info *alloc_heap_page
         return NULL;
     }
 
-    node = phys_to_nid(page_to_maddr(pg));
+    node = page_to_nid(pg);
     zone = page_to_zone(pg);
     buddy_order = PFN_ORDER(pg);
 
@@ -1078,7 +1078,7 @@ static struct page_info *alloc_heap_page
 /* Remove any offlined page in the buddy pointed to by head. */
 static int reserve_offlined_page(struct page_info *head)
 {
-    unsigned int node = phys_to_nid(page_to_maddr(head));
+    unsigned int node = page_to_nid(head);
     int zone = page_to_zone(head), i, head_order = PFN_ORDER(head), count = 0;
     struct page_info *cur_head;
     unsigned int cur_order, first_dirty;
@@ -1443,7 +1443,7 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
+    unsigned int i, node = mfn_to_nid(mfn);
     unsigned int zone = page_to_zone(pg);
     bool pg_offlined = false;
 
@@ -1487,7 +1487,7 @@ static void free_heap_pages(
                  !page_state_is(predecessor, free) ||
                  (predecessor->count_info & PGC_static) ||
                  (PFN_ORDER(predecessor) != order) ||
-                 (phys_to_nid(page_to_maddr(predecessor)) != node) )
+                 (page_to_nid(predecessor) != node) )
                 break;
 
             check_and_stop_scrub(predecessor);
@@ -1511,7 +1511,7 @@ static void free_heap_pages(
                  !page_state_is(successor, free) ||
                  (successor->count_info & PGC_static) ||
                  (PFN_ORDER(successor) != order) ||
-                 (phys_to_nid(page_to_maddr(successor)) != node) )
+                 (page_to_nid(successor) != node) )
                 break;
 
             check_and_stop_scrub(successor);
@@ -1574,7 +1574,7 @@ static unsigned long mark_page_offline(s
 static int reserve_heap_page(struct page_info *pg)
 {
     struct page_info *head = NULL;
-    unsigned int i, node = phys_to_nid(page_to_maddr(pg));
+    unsigned int i, node = page_to_nid(pg);
     unsigned int zone = page_to_zone(pg);
 
     for ( i = 0; i <= MAX_ORDER; i++ )
@@ -1794,7 +1794,7 @@ static void _init_heap_pages(const struc
                              bool need_scrub)
 {
     unsigned long s, e;
-    unsigned int nid = phys_to_nid(page_to_maddr(pg));
+    unsigned int nid = page_to_nid(pg);
 
     s = mfn_x(page_to_mfn(pg));
     e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
@@ -1869,7 +1869,7 @@ static void init_heap_pages(
 #ifdef CONFIG_SEPARATE_XENHEAP
         unsigned int zone = page_to_zone(pg);
 #endif
-        unsigned int nid = phys_to_nid(page_to_maddr(pg));
+        unsigned int nid = page_to_nid(pg);
         unsigned long left = nr_pages - i;
         unsigned long contig_pages;
 
@@ -1893,7 +1893,7 @@ static void init_heap_pages(
                 break;
 #endif
 
-            if ( nid != (phys_to_nid(page_to_maddr(pg + contig_pages))) )
+            if ( nid != (page_to_nid(pg + contig_pages)) )
                 break;
         }
 
@@ -1934,7 +1934,7 @@ void __init end_boot_allocator(void)
     {
         struct bootmem_region *r = &bootmem_region_list[i];
         if ( (r->s < r->e) &&
-             (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
+             (mfn_to_nid(_mfn(r->s)) == cpu_to_node(0)) )
         {
             init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
             r->e = r->s;
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -1,6 +1,7 @@
 #ifndef _XEN_NUMA_H
 #define _XEN_NUMA_H
 
+#include <xen/mm-frame.h>
 #include <asm/numa.h>
 
 #define NUMA_NO_NODE     0xFF
@@ -68,12 +69,15 @@ struct node_data {
 
 extern struct node_data node_data[];
 
-static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
+static inline nodeid_t mfn_to_nid(mfn_t mfn)
 {
     nodeid_t nid;
-    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
-    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    unsigned long pdx = mfn_to_pdx(mfn);
+
+    ASSERT((pdx >> memnode_shift) < memnodemapsize);
+    nid = memnodemap[pdx >> memnode_shift];
     ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
+
     return nid;
 }
 
@@ -102,6 +106,15 @@ extern bool numa_update_node_memblks(nod
                                      paddr_t start, paddr_t size, bool hotplug);
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
+#else
+
+static inline nodeid_t mfn_to_nid(mfn_t mfn)
+{
+    return 0;
+}
+
 #endif
 
+#define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
+
 #endif /* _XEN_NUMA_H */

