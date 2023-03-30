Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A16D0331
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516648.801115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqUH-00033p-9O; Thu, 30 Mar 2023 11:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516648.801115; Thu, 30 Mar 2023 11:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqUH-00031q-6X; Thu, 30 Mar 2023 11:30:37 +0000
Received: by outflank-mailman (input) for mailman id 516648;
 Thu, 30 Mar 2023 11:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqUF-00017i-KE
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:30:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 488a6625-ceee-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:30:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:30:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:30:32 +0000
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
X-Inumbo-ID: 488a6625-ceee-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdTjPLQ4EeBnw9fzPy29IBboxuebftSZyWXu3FIOCX34cqzRxjYT/htLlj8cJlZo+Vvj+C+rg8GmqKsuXt0bL1b8FJsMwX52fJEJjJ6YOmS1Zyf5V745TIOpuTWsWQTSyAyPK2MWAew62vzaaJVqCFIhF/d4tUbfSn4S6wtSp2+qQGD+hKd0YY46vFM8Zrl+dFROGTXcqrjXAneQECaRPTSo4J5IuUtRWmknS5u87MrWsujiOFkWMEh48qa2036GTatTBea9Yu5rC99dQXhqSgiOjuYwmvzsYNEozu0GLsfFYNVuXyjRZRFrz9BYeozImCGGC/9DPsJgDNCjQRZZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj7jaA7EDF02LqGniZpgC5UCF349tOE3CFBTSklxv5k=;
 b=mmf1gXxV6ed+FBzw1c8/cWpNrXgzlwCvJrktK71sc1sC+4Y59hKLoclfiq+5ddQ2rJrmmN9RDWqEOMT8DyIf07f1vwqKpZViv1mf/3tsZlSxp0OB7L1Vr4glkLvVdDiocQvSCefm9PMEUo8J1dUbH7eWjIaJLfRW2nwQq1UF40VgDifCo3zWcGz4ddGPRfJbbfixqtSDXfUAa2qY3xFVIkes7z9G6Kwh0UM4bhf+curl9rgGZ9v5OB0VoBrAjOB4EWYAvD8NZVipbHkTMm5anrj07DDCGOQ8fk1o7tbhny/XILbm3vgnC8zMr7I7hpXxLvIlvuf0TyiaqhJUoNAo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj7jaA7EDF02LqGniZpgC5UCF349tOE3CFBTSklxv5k=;
 b=TDrfGO65qWlDdV/Zs9jH6WmcH/wg1zP4l+r8yKqD0XUmJwCmBu9O2LZMdv9JC2J2VZ5dp8NpjXThd5/sXmquIU3mEu+tx5Juu3uaEpKcK3RvjUEEwmUNWFq1+Qq0JQD8ON29uMDZNKilCiEgwFGdeUynNsOAX3fRQvJu0fsdd7VS2ivFsmEROI9iJcWfSpWGwH/yFCsnNvrBt26eTxmcUcXhLzcRjy122MdS3na+x1rQcdQLw2rTfsARvB2sdgwEZ/kmNpGRAk55SWzo+2GJ2FmSQPh7Udwqyo6vt4c12+rg8dvGaexfdI/bgrHBDotFPHuQmGyK34XtQ5fkZGJbLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd15a200-aaa0-5c96-3be7-4f484ef3fc82@suse.com>
Date: Thu, 30 Mar 2023 13:30:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 09/13] x86/shadow: drop is_hvm_...() where easily possible
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
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 09095ce4-d362-463f-c45c-08db31122c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bpkTtRmLCbBN3i7c+MvbHdH/Q1WrPlIgHIqzmKA/5Mivdq7sW+8+LNDW9Yz0Kbv7sIvH3lLs6AIQZA8t7JORD9hqKY/xZMRXXeB/1lxhlCfVKit4DBTXm7L8aJY5KVm+XJVxsW0CwrUP2BiPW2ETeube+sO10utqON9uZMceXdLJ3iR6x0hp3E/m0I/pAYGvTDlcyDdLnqdPD6Y6o8G2+B+XqbqhoKn6G3F39Fhm+zjLHPwjMJD8cA88ucHoV7y6B585XyXdVHb8weqX9QahC/GrIG3Hiy9kLgEtHnZ+1ZXxA/dtKrnnzICahRCL8+vOnjpPimVDzgJrx5gZdQFNWTa/OMtV757rW8IcoM3A7t3UERYcsT3jZQJ0QyNrV6QjzNG7Ia5Eqh20nECehVH10BNwc6QOo3LV7Ufe+nkbB3sx3pd8NxKSlCz9bidV8DfNECt1cnxLaaBpTOR79mE7n0Bjr030XnP+4p1305BISTlNRYYDht3y65kinkLYr7fLFfz4pBRh7YJt3W1+YZ/w8R8BBFJH6QcUNASZHA2vKqfBrwm4Kv/BZnHdXy3b/9kiw39wFgxsD28zXIpoV7pBA92jAO0hBCwydcP8nF9sseGase9mHEiWfaLM2ec1I3DI3SC63LQwDFaE+mkl4XRg2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39850400004)(451199021)(2616005)(83380400001)(6486002)(26005)(478600001)(316002)(186003)(54906003)(6506007)(2906002)(6512007)(36756003)(5660300002)(8936002)(38100700002)(4326008)(6916009)(66556008)(8676002)(66946007)(31696002)(66476007)(41300700001)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDUzQXZoTVRyaGlUN2RRYWxYUGZyeFYyS3pObGN1RWUreW5EY2o0UHhEbmp4?=
 =?utf-8?B?VjVyUXNBamZ0akhGRTdaanYraVd0NVZ5T1VsdG5TTkV3L0Q5QURGNCtxbVRq?=
 =?utf-8?B?Y0xMTEhtRkxHZSs5OVdrTTUzeUdSV0xOYWtLTlNjY1FRT2dLVkMrYzA5WGtB?=
 =?utf-8?B?NlBReWpiQi9ETFlsaC9obThuTGhZUlF5K29WdEZkRUZXMDJBN2p1RktmcEh2?=
 =?utf-8?B?eFhBVS85M0xnSFRhOWRvT0NlVkd3NVBxRUxFMXQ5YUdBYnRmQlRmSGRWVkpk?=
 =?utf-8?B?NFlQMW00bno3SDRPbVdTMHg1YkpRTVZtc0RqaFNYUUtWYS9uYVQ0Tzc0R3Vi?=
 =?utf-8?B?N3RveW9VQ01IejhHbUtPNVV6TW1oN0V6Rjh6MDZBNlIyWDVDVWU1ZU9GOXVl?=
 =?utf-8?B?bG1aSnpTVFFNNG5vOW9TcmhVMmpWUG9ONkd1TzRhQTU5RHoxc05UUVBXQ2JP?=
 =?utf-8?B?a21zMnE0Vnp0ajB0NW90SXlqUUwzejRybi9jNUVoUW54U0JhUU56VW9NZ1k4?=
 =?utf-8?B?TTJieGZveERmTzBoR0VCSmF1VkNVaFBLQ2JIMTMzTHk1Smx6NS9EVVo4TUkr?=
 =?utf-8?B?d01nVG1Md2tHNVBSQXZ0a00rN2hqSHNLRGlhQVplZmFaa2VWdmFHNkVucDJ6?=
 =?utf-8?B?TXJOQ0xzVUNUU1YwbjZZYTZkTXZtTXZLOE1vdFgwNlBLTGJuYzdXSVFKNDhT?=
 =?utf-8?B?emIwMDNXNDNXL29rMWM2NFJocmpuL3B1b1VWTmgwK3d3QWZIS1N6L0J4N29m?=
 =?utf-8?B?SldQWWpvdWRUa21TS3J5a3JXZ0hFZDVKOWFpeEkvL3dtbTJ2aFhwM2V3TFFr?=
 =?utf-8?B?dnZlaG54RUlFWXYxMkd5T1VtYUxleHpYd1AxV0J2QWt4UkwvTmVQRHZnUTFk?=
 =?utf-8?B?SFZYSzdxT2pjeUpWSWRVMnpheGVpOFRsNURUenJIanN4T0xQemVBTXdCSkxm?=
 =?utf-8?B?OHFqQkZTZmwvV0JMejlDVEw3bDZDZzNaRWp2K1JvNis3VnlqQWlhaFJucnNs?=
 =?utf-8?B?eWszNjdiWGlSVGJlUnEzNXpzdjhqeDRhY05HL3o3bDd3UkkyVDROOStTaWdx?=
 =?utf-8?B?M2lqd3BKY2RYa2ZMdDVmRFpEUllWY1pMOFA5VkJDdVhLNnNuOXhBVGdFT2xr?=
 =?utf-8?B?aTIyakk5bVRVZXVIU1daNVB6ZWZKT24ycGx2L0hTcVlCRHNCT1B0elFDTkhm?=
 =?utf-8?B?SWVjSUxxYS8yV2pWcUJHTEVqNm0zb2puczJNU0gxdlFyS0NoK1cvOHNZN2Fw?=
 =?utf-8?B?RHF1d0lUVmdBSlg4d1lON2FDRkxlcHNVNWpTNHJNQ1JQMWIyUXBDSG9TZUIy?=
 =?utf-8?B?d3J4bXJMZDNvYnU4UjVGaTJEQ3haRnp4QWhadko0M3ZMZnhWUU1ncWM5czlY?=
 =?utf-8?B?L0dYVUp3OVJRbFB1MjBrWVBpaUNFVEVIOGJCQlFzM3hYSDllWlB5dmVoK1pR?=
 =?utf-8?B?RzRYRFlwUE5xWFBDTklnQmlkcnhoNFR2Y3JiOWZMTnFITmJINlMxZW1iWUNM?=
 =?utf-8?B?WDY3dDdYcW43bk9NTEZMZ1J5T0tnSk4wMnJyTkRrRmwzUi8wMzUvTi9NcG5K?=
 =?utf-8?B?VFVjYUFpLy9od2dSRExTZ3psQjBqN2hJYzZZeTNCZDM0Nlh4a29PMzNaTTFJ?=
 =?utf-8?B?Y2FWVnpLUmFvdU1ycWZRdzRnSVpKSmhTMVFST1BPNFVQbml4Z3dKZnFZb0cw?=
 =?utf-8?B?QWdaWjlqU3YzcGZoVW5VRnA0U1FWbW05TGtxVGRZVFplaUNiNlZFMVltSUI3?=
 =?utf-8?B?YTJLUlNiY2hrSEFMY2ticjZSY2FWNEVjR3YwQ2hMclhMVDBsZnkxZXBKdmNs?=
 =?utf-8?B?dS9SNXFMMGg3SzFUUFlOcXNrc3A2THVQQXBxeG9TOGEyNzU1eWUrQTYvbU5N?=
 =?utf-8?B?U2NLR0x6ZnBBSVdtZXRUakVtV3VSUUw0akxONk4zN2FQaCsxZjhBamlNUXFU?=
 =?utf-8?B?dXRjOTlUZFZaS2NreUdDcisrWUozQ0swT295WVV2MmpvdlF2RklybXdwNlpj?=
 =?utf-8?B?Wnc4aWEwV0ptcWZzK2h1VUpENk9mU2VmL2Q3THR6bGlXeHd0am1CaWhtTlBs?=
 =?utf-8?B?Uzk1R3VUNjhreXBHM2VtUklVWUdIU0ViMzlLRVNreTlJa3JhVEJCR1N2ZEF2?=
 =?utf-8?Q?iAwpcgHQ00TB61l3HemKNOY2O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09095ce4-d362-463f-c45c-08db31122c3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:30:32.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIrE36J2LL8rfZyIY17Wvqh4ZKJ029XLYbSoea3QBWLLUqGKodQEZ6fyMbvh/1H2SgHUk70gbadfgqHD8u185g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262

Emulation related functions are involved in HVM handling only, and in
some cases they even invoke such checks after having already done things
which are valid for HVM domains only. OOS active also implies HVM. In
sh_remove_all_mappings() one of the two checks is redundant with an
earlier paging_mode_external() one (the other, however, needs to stay).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over changes/additions earlier in the series.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1522,7 +1522,7 @@ int sh_remove_all_mappings(struct domain
                && (page->count_info & PGC_count_mask) <= 3
                && ((page->u.inuse.type_info & PGT_count_mask)
                    == (is_special_page(page) ||
-                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
+                       is_ioreq_server_page(d, page)))) )
             printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
                    " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
                    mfn_x(gmfn), gfn_x(gfn),
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -204,10 +204,6 @@ hvm_emulate_write(enum x86_segment seg,
     if ( rc || !bytes )
         return rc;
 
-    /* Unaligned writes are only acceptable on HVM */
-    if ( (addr & (bytes - 1)) && !is_hvm_vcpu(v)  )
-        return X86EMUL_UNHANDLEABLE;
-
     ptr = sh_emulate_map_dest(v, addr, bytes, sh_ctxt);
     if ( IS_ERR(ptr) )
         return ~PTR_ERR(ptr);
@@ -258,10 +254,6 @@ hvm_emulate_cmpxchg(enum x86_segment seg
     if ( rc )
         return rc;
 
-    /* Unaligned writes are only acceptable on HVM */
-    if ( (addr & (bytes - 1)) && !is_hvm_vcpu(v)  )
-        return X86EMUL_UNHANDLEABLE;
-
     ptr = sh_emulate_map_dest(v, addr, bytes, sh_ctxt);
     if ( IS_ERR(ptr) )
         return ~PTR_ERR(ptr);
@@ -457,8 +449,7 @@ static void *sh_emulate_map_dest(struct
 
 #ifndef NDEBUG
     /* We don't emulate user-mode writes to page tables. */
-    if ( is_hvm_domain(d) ? hvm_get_cpl(v) == 3
-                          : !guest_kernel_mode(v, guest_cpu_user_regs()) )
+    if ( hvm_get_cpl(v) == 3 )
     {
         gdprintk(XENLOG_DEBUG, "User-mode write to pagetable reached "
                  "emulate_map_dest(). This should never happen!\n");
@@ -487,15 +478,6 @@ static void *sh_emulate_map_dest(struct
         sh_ctxt->mfn[1] = INVALID_MFN;
         map = map_domain_page(sh_ctxt->mfn[0]) + (vaddr & ~PAGE_MASK);
     }
-    else if ( !is_hvm_domain(d) )
-    {
-        /*
-         * Cross-page emulated writes are only supported for HVM guests;
-         * PV guests ought to know better.
-         */
-        put_page(mfn_to_page(sh_ctxt->mfn[0]));
-        return MAPPING_UNHANDLEABLE;
-    }
     else
     {
         /* This write crosses a page boundary. Translate the second page. */
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3438,7 +3438,7 @@ int sh_rm_write_access_from_sl1p(struct
     ASSERT(mfn_valid(smfn));
 
     /* Remember if we've been told that this process is being torn down */
-    if ( curr->domain == d && is_hvm_domain(d) )
+    if ( curr->domain == d )
         curr->arch.paging.shadow.pagetable_dying
             = mfn_to_page(gmfn)->pagetable_dying;
 
--- a/xen/arch/x86/mm/shadow/oos.c
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -580,7 +580,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
     if ( (pg->shadow_flags &
           ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)) ||
          sh_page_has_multiple_shadows(pg) ||
-         !is_hvm_vcpu(v) ||
          !v->domain->arch.paging.shadow.oos_active )
         return 0;
 


