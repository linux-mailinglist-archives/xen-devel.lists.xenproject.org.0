Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958286D0328
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516642.801096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqTX-0001AZ-JR; Thu, 30 Mar 2023 11:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516642.801096; Thu, 30 Mar 2023 11:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqTX-00017s-GB; Thu, 30 Mar 2023 11:29:51 +0000
Received: by outflank-mailman (input) for mailman id 516642;
 Thu, 30 Mar 2023 11:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqTW-00017i-5X
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:29:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe02::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ca88dfd-ceee-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:29:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:29:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:29:44 +0000
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
X-Inumbo-ID: 2ca88dfd-ceee-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANvtN6LtwhTDqcjrIm/qSioZOiVayLXVQAgq2BJWraLt/rdoQXVC8TMn6W4TjKg3wxcInIwoc2nufJ+hAkmoZjPfAF56Z9/xmz0PW9IM8xPt4m/k63CleawESvLJzwUqoivU+6U0pELFIsT6IAJuFzeRsIKVwzjBAfEfANgmfRmALP5Znk1YnOLruebiJktVVAHFt9fJgvWWuBYYl2uWvALFF4FGhL9/3b7lW2pVGccQG482mIIh5lE3z5FnYz85TfglT63bIekNvE4z9/YHugm6HtGdxESkQMnxBD76swlc1kYUePF1C3j42wRIMV2bk6pGUDQdNrCOPaprkheVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Yc63R99xXpCV2rFaghPhoG7GaIwoeqheiEnc9dAADg=;
 b=go0DRwATzveZ5FzDYQV5cPVed0ra3WSNtvUPYwWiMzlic3n0oeS/24y+IDwIF8BCB1i4DbQdAeDf0KBliLBtjuNW2XNwIhs9URv19qjYttFS9K7USjQz9rBAA+I4cYZsgY13dPk6xmodP+fry79ztxjydAOioP48AzFioDjGTGd+l2f0iL0+YHxdQqM77j6z3W8L4EB36819/QYyVdCYZ+DDK4Jndby9Hmjh8S336CeaJIuhwHhInUCXIUEOPxko/kYLMVApG9L7W9dy6pusJixu//1OaP3JSyl5zxZ/9x0erFjkcASufv+cdpclF1HkELUg+/SfedZVd6eJl3ysVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Yc63R99xXpCV2rFaghPhoG7GaIwoeqheiEnc9dAADg=;
 b=w73M7jtqUkOuIR1VNn/q7VX4ZVER49pJb3Gy7cEgDVOgXMR8F62A5/GWkSMRHU5ti/pokOipT1xWFiNqjTjMlcjpGqZdBviMVL3B7YE+91xh5QtM8sqSaaFxI79SA/EPCij8WZLNJqjnBPb4KF+t8m4M/2ziJ8l+QDMa7WQPWuGk+i4usg0GayXc+xxAsXaZYDNywCF5mypjatM27CnI+Kxw+pF36lWorI4HP9EjRHSzvBoKVw00i/Vhkb8f/CgdFgjL+AgNgkrMjtCcU12z21vcOKYfXQDsAzr9nmis15V1hgShCsivet7BxBIHRJfpk8qSFN2YeHlwCbS26wLbFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bae6790f-93ac-dbe4-c43e-8b28d2f7c8b3@suse.com>
Date: Thu, 30 Mar 2023 13:29:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 07/13] x86/shadow: move OOS functions to their own file
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
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b29130a-6045-490a-0333-08db31120f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4H5ejcPOHTSmfmzacEXkXyc9yLmltlg4iWflarDccXuQ/Hw+7ffGKmHTHeZsM8Nobhr63f3ZitcxYVju/21gLLgVt74EzQZrPW3TrscwgCSRYjQK4+3t9kQoRO/xHIK+HDdzcavaaFQeCnxL7+ERVVDJDYBpQcZNjuphjw9wbZ6jvl/xNjbJUfMJYBcpnOqIs6nart3biSCvZ97vKqsBrlt6hPr+4YVt3ZEgT6oR+LRm39NU2fzLYyx1L97qLHO7o31ktKquMTT9IHI09EWQvN5GVjVhJM2h/WyXaWtzaUrFd7bMma+4qO/qIN3IulitGEMPUiTPXGrAK6T3NmXP2DcFHr3aA5hvVlaZNJHnJqevZGbepZ62XKHELnMPAdDWjI5ZeLdhCNMFR7Mlb8mdc55VNC30MoWQ0906Xk2+onxHHOSjGDegtsHBBS/2MqXYskLZw/1Z7+yJK66jk4kbG3NoaJrmlwlEkCXJOkqK+VDqFA0VyIMlnAL2zeHX+Tbx7QuSJtmlhKtFQUFLbG5ZymjLXo6tiFBFy9JrZEY7Jj7W5VH64vG9jZ0ARYCrAHSJPAMVHfQL+WG40hELTFVHvQtiSDkslzCRYYgfgIaLLy+HkoNu9o3JxmNs2PLSimLyW4s7tI4eT/5Qnao7lYXBT4LkjKLCpBY/1j0hlVGOkrfSrxreBPcUHrphdAFh3x+mMWYiSe98pm9c1od/x43ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39850400004)(451199021)(2616005)(83380400001)(6486002)(26005)(478600001)(316002)(186003)(54906003)(6506007)(2906002)(6512007)(36756003)(5660300002)(30864003)(8936002)(38100700002)(4326008)(6916009)(66556008)(8676002)(66946007)(31696002)(66476007)(41300700001)(86362001)(31686004)(66899021)(45980500001)(43740500002)(579004)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkcrdmNYY3Y0aU00M1NSRlJDUjgyRHhSOEZUUDBpa3MzZmVLbXNDQlpxdmM1?=
 =?utf-8?B?ckIvdjNkU01NTGxqUkZpOXB0UG9RL2xDaUhJRGFsUW9Vd09rVmhERmJSUUZp?=
 =?utf-8?B?VzhCc2RtRlA4ZDgyN0U1YXlCZDg5cThnZU5UN3JXK2NKSnBpWCtIZUxJS0FV?=
 =?utf-8?B?YXhxMmowVWl2M3RmTklIQ3ZZYW5aTVZvSUlKSUFVUnhuZ0h2aGtreFlQZk51?=
 =?utf-8?B?N0kzUnV6Y1Q1dWlGOVhsR3BpZkxTaUd3aktBOXVjelJZak1DV0xtdGlJV0Uv?=
 =?utf-8?B?amRtdzNPRDhRcE1KdFJaekUxeWZYUFBJM1lJWXUreXZldlVsU0JqbVNQNEVI?=
 =?utf-8?B?cXlKZWtJS1NzK1JpNWtOU096ekpDbXEwOWJua0dHcEJFSGNtRzh2c1RJSUR0?=
 =?utf-8?B?TDJJMnVDUnIrK0JjWjVIN1RzK2cwL0FxQ09ZeE9jSnYxUmFuODN2ckRtNVc5?=
 =?utf-8?B?MjltSHZHT0h2b09xTElJMFdySHYzLzNmY2tKeGk1bFAvejlxZUxGcnVxOFhP?=
 =?utf-8?B?WHJuSEY1TFlmdis1Tkt3YVphWm1zODgwbkpvOE5vRzdPd0ZwYkdQZTl5dnpO?=
 =?utf-8?B?UmFwNkV1b2xVcUhvU1ZsMWJ2WTVwbDdyVDRzUFFaeXd4Ykk4VHJINnpHUVpI?=
 =?utf-8?B?RU55WFlJZUROa2FrSmVYNTlLaXc1TVcxMG5hK2FVcHlIV3g0Q2ErSG1yVm91?=
 =?utf-8?B?c255QksvNFE3djl0cGVKYlIrMFpsWXZURVU5eUtPTjNxRFAxL3hDVk1ISGhU?=
 =?utf-8?B?ZUJQWk9ySnRoQXpXVUV3a1U5bWYxSzFnT0NsdUJKSk1RTmhXK2dUSWs2VU1s?=
 =?utf-8?B?M3NQZTYrK3ltUWJSK1F3VHk3MlJKeTR0UHdiZWtZZHZ4RTMxY2x4Rks0UTdy?=
 =?utf-8?B?cDdxSi81RTluT0x0Ty9PVmJJOXBGRFpwTXVBWFRGckZQSXdjeEpwYUUvNWlD?=
 =?utf-8?B?cW1uNlZrN3l0TDgxWkgvdG5YNExaT2NWaFBiN3ExV0FtRU1ybHg5NFRxaGdK?=
 =?utf-8?B?alBYQTV3RVVXL1BTbzBnWVlESlRuSkNIZ01aL2wwV2ZrY1ArODh3N3dONFFu?=
 =?utf-8?B?UFI4Mmp1Zjd0YTBIUG5MY09MS3BIQmVNV0FqTmc3eWpYZGpJd0dJK0M2SHBr?=
 =?utf-8?B?VURkaUhIdmV0clRIQUNJYXFhNHRFdjlnd1dPdmdrb1F5MkxseHdPM1BxYis1?=
 =?utf-8?B?YlJXclh2RENUODk3RGIzK1UyQjkvTkVzQmN6L25aT1d0QlUvSzVEMTVWcDRO?=
 =?utf-8?B?MjhRQW4xbWV0RDdjOXlLOWpaMmQ1aStXeGJKWFQ5VHB6U1JaY1cvdHc5dHR4?=
 =?utf-8?B?alBKMTZnWis5eDVOUWVuUjF4eEFtUFdsam9sV1QwNE4wdVZyRVowRWdsZnVE?=
 =?utf-8?B?RVNlYndaMkYrWXkxUE9wUDBzS3BYSTRrc2krcDdTbTkyS09hUU5KeGhncHcv?=
 =?utf-8?B?RlZvN015RjdCUGdPaWFTd1VsSzI3dzdFMEdBeEVValRYSXZOVUk3UGR5dWNk?=
 =?utf-8?B?Sk9HZCtTem1sKzRtK21GYlRoN0lKUXY1SThqWm41bGpjZThybmNqem5vRS9W?=
 =?utf-8?B?eFhCQVJYQUNYTUcyRm8vWjhYZVE4VUgzeXB0UVhqUGdKamYwKzlMSStlZkRq?=
 =?utf-8?B?azYyWG5DaTQrYmU4b1lWa3k3SjVtNjd2OEhzWG9yVjNucW5qMDlsM09qUENt?=
 =?utf-8?B?c2lKc1EvRkZLK0d3cmZDcjhmV24raHVPZ1cvdVlrQ3RSamU3MnlsTk5UZ2Zh?=
 =?utf-8?B?N2pDZHk1QlRpQzB2YklqQW9SeWRzWUNrdytWWml0dXd3ejFiMldtWU5VZ3pW?=
 =?utf-8?B?NDhlc1AzNllIOG53dnZiTWMxU1U3dWh4eXJYcVZZTktPb0wvR05aU3Bmd09V?=
 =?utf-8?B?ZnVOb0ZhNEE1WWIzeGJYVUl3V3ZFRm5ERE1aUTZwS3hON01lVkpibFBvNFFM?=
 =?utf-8?B?b3hic3ZYK2xNQnUzK212dUFnbkhMNmU0eFlSakQ0Tnp5NWtpbDJDenFoTmwv?=
 =?utf-8?B?V0xOVVpIdlNnNnNKbC9SYkE5L1YzUXJsT2dlODBHSDFYWDRoM1VSVnl0QXQ4?=
 =?utf-8?B?QkxpdmdwUWF6RVdOQTRBZk9KT1orT2RINkZFcEZWV2JxeGhPemk3VDlaYVJE?=
 =?utf-8?Q?lUISdoPkntu4M55kcxpaqpt5r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b29130a-6045-490a-0333-08db31120f9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:29:44.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6RAXunOvFEJ1ADpmT1zQtyEcfMmM/nrVVj6gZTD/UTr6yqpziGosHu1aWzKjV2SshWTk9XujG/jZ8z2WhJs/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262

The code has been identified as HVM-only, and its main functions are
pretty well isolated. Move them to their own file. While moving, besides
making two functions non-static, do a few style adjustments, mainly
comment formatting, but leave the code otherwise untouched.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Adjust SPDX to GPL-2.0-only. A few more style adjustments.

--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -1,6 +1,6 @@
 ifeq ($(CONFIG_SHADOW_PAGING),y)
 obj-y += common.o set.o
-obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o
+obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o oos.o
 obj-$(CONFIG_PV) += pv.o guest_4.o
 else
 obj-y += none.o
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -152,576 +152,6 @@ static int __init cf_check shadow_audit_
 __initcall(shadow_audit_key_init);
 #endif /* SHADOW_AUDIT */
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-/**************************************************************************/
-/* Out-of-sync shadows. */
-
-/* From time to time, we let a shadowed pagetable page go out of sync
- * with its shadow: the guest is allowed to write directly to the page,
- * and those writes are not synchronously reflected in the shadow.
- * This lets us avoid many emulations if the guest is writing a lot to a
- * pagetable, but it relaxes a pretty important invariant in the shadow
- * pagetable design.  Therefore, some rules:
- *
- * 1. Only L1 pagetables may go out of sync: any page that is shadowed
- *    at at higher level must be synchronously updated.  This makes
- *    using linear shadow pagetables much less dangerous.
- *    That means that: (a) unsyncing code needs to check for higher-level
- *    shadows, and (b) promotion code needs to resync.
- *
- * 2. All shadow operations on a guest page require the page to be brought
- *    back into sync before proceeding.  This must be done under the
- *    paging lock so that the page is guaranteed to remain synced until
- *    the operation completes.
- *
- *    Exceptions to this rule: the pagefault and invlpg handlers may
- *    update only one entry on an out-of-sync page without resyncing it.
- *
- * 3. Operations on shadows that do not start from a guest page need to
- *    be aware that they may be handling an out-of-sync shadow.
- *
- * 4. Operations that do not normally take the paging lock (fast-path
- *    #PF handler, INVLPG) must fall back to a locking, syncing version
- *    if they see an out-of-sync table.
- *
- * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
- *    must explicitly resync all relevant pages or update their
- *    shadows.
- *
- * Currently out-of-sync pages are listed in a simple open-addressed
- * hash table with a second chance (must resist temptation to radically
- * over-engineer hash tables...)  The virtual address of the access
- * which caused us to unsync the page is also kept in the hash table, as
- * a hint for finding the writable mappings later.
- *
- * We keep a hash per vcpu, because we want as much as possible to do
- * the re-sync on the save vcpu we did the unsync on, so the VA hint
- * will be valid.
- */
-
-static void sh_oos_audit(struct domain *d)
-{
-    unsigned int idx, expected_idx, expected_idx_alt;
-    struct page_info *pg;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        {
-            mfn_t *oos = v->arch.paging.shadow.oos;
-            if ( mfn_eq(oos[idx], INVALID_MFN) )
-                continue;
-
-            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
-            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
-            if ( idx != expected_idx && idx != expected_idx_alt )
-            {
-                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
-                       __func__, idx, mfn_x(oos[idx]),
-                       expected_idx, expected_idx_alt);
-                BUG();
-            }
-            pg = mfn_to_page(oos[idx]);
-            if ( !(pg->count_info & PGC_shadowed_pt) )
-            {
-                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
-                BUG();
-            }
-            if ( !(pg->shadow_flags & SHF_out_of_sync) )
-            {
-                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
-                BUG();
-            }
-            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
-            {
-                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
-                BUG();
-            }
-        }
-    }
-}
-
-#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
-void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    struct vcpu *v;
-    mfn_t *oos;
-
-    ASSERT(mfn_is_out_of_sync(gmfn));
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-
-        if ( mfn_eq(oos[idx], gmfn) )
-            return;
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-#endif
-
-/* Update the shadow, but keep the page out of sync. */
-static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
-{
-    struct page_info *pg = mfn_to_page(gmfn);
-
-    ASSERT(mfn_valid(gmfn));
-    ASSERT(page_is_out_of_sync(pg));
-
-    /* Call out to the appropriate per-mode resyncing function */
-    if ( pg->shadow_flags & SHF_L1_32 )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
-    else if ( pg->shadow_flags & SHF_L1_PAE )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
-    else if ( pg->shadow_flags & SHF_L1_64 )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
-}
-
-static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                            mfn_t smfn, unsigned long off)
-{
-    ASSERT(mfn_valid(smfn));
-    ASSERT(mfn_valid(gmfn));
-
-    switch ( mfn_to_page(smfn)->u.sh.type )
-    {
-    case SH_type_l1_32_shadow:
-    case SH_type_fl1_32_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
-            (d, gmfn, smfn, off);
-
-    case SH_type_l1_pae_shadow:
-    case SH_type_fl1_pae_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
-            (d, gmfn, smfn, off);
-
-    case SH_type_l1_64_shadow:
-    case SH_type_fl1_64_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
-            (d, gmfn, smfn, off);
-
-    default:
-        return 0;
-    }
-}
-
-/*
- * Fixup arrays: We limit the maximum number of writable mappings to
- * SHADOW_OOS_FIXUPS and store enough information to remove them
- * quickly on resync.
- */
-
-static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
-                                       struct oos_fixup *fixup)
-{
-    struct domain *d = v->domain;
-    int i;
-    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-    {
-        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
-        {
-            sh_remove_write_access_from_sl1p(d, gmfn,
-                                             fixup->smfn[i],
-                                             fixup->off[i]);
-            fixup->smfn[i] = INVALID_MFN;
-        }
-    }
-
-    /* Always flush the TLBs. See comment on oos_fixup_add(). */
-    return 1;
-}
-
-void oos_fixup_add(struct domain *d, mfn_t gmfn,
-                   mfn_t smfn,  unsigned long off)
-{
-    int idx, next;
-    mfn_t *oos;
-    struct oos_fixup *oos_fixup;
-    struct vcpu *v;
-
-    perfc_incr(shadow_oos_fixup_add);
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_fixup = v->arch.paging.shadow.oos_fixup;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            int i;
-            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-            {
-                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
-                     && (oos_fixup[idx].off[i] == off) )
-                    return;
-            }
-
-            next = oos_fixup[idx].next;
-
-            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
-            {
-                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
-
-                /* Reuse this slot and remove current writable mapping. */
-                sh_remove_write_access_from_sl1p(d, gmfn,
-                                                 oos_fixup[idx].smfn[next],
-                                                 oos_fixup[idx].off[next]);
-                perfc_incr(shadow_oos_fixup_evict);
-                /* We should flush the TLBs now, because we removed a
-                   writable mapping, but since the shadow is already
-                   OOS we have no problem if another vcpu write to
-                   this page table. We just have to be very careful to
-                   *always* flush the tlbs on resync. */
-            }
-
-            oos_fixup[idx].smfn[next] = smfn;
-            oos_fixup[idx].off[next] = off;
-            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
-
-            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
-                                   struct oos_fixup *fixup)
-{
-    struct domain *d = v->domain;
-    int ftlb = 0;
-
-    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);
-
-    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
-    {
-    default:
-    case 0:
-        break;
-
-    case 1:
-        ftlb |= 1;
-        break;
-
-    case -1:
-        /* An unfindable writeable typecount has appeared, probably via a
-         * grant table entry: can't shoot the mapping, so try to unshadow
-         * the page.  If that doesn't work either, the guest is granting
-         * his pagetables and must be killed after all.
-         * This will flush the tlb, so we can return with no worries. */
-        shadow_remove_all_shadows(d, gmfn);
-        return 1;
-    }
-
-    if ( ftlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
-
-    return 0;
-}
-
-
-static inline void trace_resync(int event, mfn_t gmfn)
-{
-    if ( tb_init_done )
-    {
-        /* Convert gmfn to gfn */
-        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
-
-        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
-    }
-}
-
-/* Pull all the entries on an out-of-sync page back into sync. */
-static void _sh_resync(struct vcpu *v, mfn_t gmfn,
-                       struct oos_fixup *fixup, mfn_t snp)
-{
-    struct page_info *pg = mfn_to_page(gmfn);
-
-    ASSERT(paging_locked_by_me(v->domain));
-    ASSERT(mfn_is_out_of_sync(gmfn));
-    /* Guest page must be shadowed *only* as L1 when out of sync. */
-    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
-             & ~SHF_L1_ANY));
-    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
-
-    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
-
-    /* Need to pull write access so the page *stays* in sync. */
-    if ( oos_remove_write_access(v, gmfn, fixup) )
-    {
-        /* Page has been unshadowed. */
-        return;
-    }
-
-    /* No more writable mappings of this page, please */
-    pg->shadow_flags &= ~SHF_oos_may_write;
-
-    /* Update the shadows with current guest entries. */
-    _sh_resync_l1(v, gmfn, snp);
-
-    /* Now we know all the entries are synced, and will stay that way */
-    pg->shadow_flags &= ~SHF_out_of_sync;
-    perfc_incr(shadow_resync);
-    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
-}
-
-
-/* Add an MFN to the list of out-of-sync guest pagetables */
-static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
-{
-    int i, idx, oidx, swap = 0;
-    mfn_t *oos = v->arch.paging.shadow.oos;
-    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
-    struct oos_fixup fixup = { .next = 0 };
-
-    for (i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-        fixup.smfn[i] = INVALID_MFN;
-
-    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-    oidx = idx;
-
-    if ( !mfn_eq(oos[idx], INVALID_MFN)
-         && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
-    {
-        /* Punt the current occupant into the next slot */
-        SWAP(oos[idx], gmfn);
-        SWAP(oos_fixup[idx], fixup);
-        swap = 1;
-        idx = (idx + 1) % SHADOW_OOS_PAGES;
-    }
-    if ( !mfn_eq(oos[idx], INVALID_MFN) )
-    {
-        /* Crush the current occupant. */
-        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-        perfc_incr(shadow_unsync_evict);
-    }
-    oos[idx] = gmfn;
-    oos_fixup[idx] = fixup;
-
-    if ( swap )
-        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
-
-    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
-}
-
-/* Remove an MFN from the list of out-of-sync guest pagetables */
-static void oos_hash_remove(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    struct vcpu *v;
-
-    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            oos[idx] = INVALID_MFN;
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    mfn_t *oos_snapshot;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            return oos_snapshot[idx];
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-/* Pull a single guest page back into sync */
-void sh_resync(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    mfn_t *oos_snapshot;
-    struct oos_fixup *oos_fixup;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_fixup = v->arch.paging.shadow.oos_fixup;
-        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
-            oos[idx] = INVALID_MFN;
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-/* Figure out whether it's definitely safe not to sync this l1 table,
- * by making a call out to the mode in which that shadow was made. */
-static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
-{
-    struct page_info *pg = mfn_to_page(gl1mfn);
-    if ( pg->shadow_flags & SHF_L1_32 )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
-    else if ( pg->shadow_flags & SHF_L1_PAE )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
-    else if ( pg->shadow_flags & SHF_L1_64 )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
-           mfn_x(gl1mfn));
-    BUG();
-}
-
-
-/* Pull all out-of-sync pages back into sync.  Pages brought out of sync
- * on other vcpus are allowed to remain out of sync, but their contents
- * will be made safe (TLB flush semantics); pages unsynced by this vcpu
- * are brought back into sync and write-protected.  If skip != 0, we try
- * to avoid resyncing at all if we think we can get away with it. */
-void sh_resync_all(struct vcpu *v, int skip, int this, int others)
-{
-    int idx;
-    struct vcpu *other;
-    mfn_t *oos = v->arch.paging.shadow.oos;
-    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
-
-    SHADOW_PRINTK("%pv\n", v);
-
-    ASSERT(paging_locked_by_me(v->domain));
-
-    if ( !this )
-        goto resync_others;
-
-    /* First: resync all of this vcpu's oos pages */
-    for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        if ( !mfn_eq(oos[idx], INVALID_MFN) )
-        {
-            /* Write-protect and sync contents */
-            _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-            oos[idx] = INVALID_MFN;
-        }
-
- resync_others:
-    if ( !others )
-        return;
-
-    /* Second: make all *other* vcpus' oos pages safe. */
-    for_each_vcpu(v->domain, other)
-    {
-        if ( v == other )
-            continue;
-
-        oos = other->arch.paging.shadow.oos;
-        oos_fixup = other->arch.paging.shadow.oos_fixup;
-        oos_snapshot = other->arch.paging.shadow.oos_snapshot;
-
-        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        {
-            if ( mfn_eq(oos[idx], INVALID_MFN) )
-                continue;
-
-            if ( skip )
-            {
-                /* Update the shadows and leave the page OOS. */
-                if ( sh_skip_sync(v, oos[idx]) )
-                    continue;
-                trace_resync(TRC_SHADOW_RESYNC_ONLY, oos[idx]);
-                _sh_resync_l1(other, oos[idx], oos_snapshot[idx]);
-            }
-            else
-            {
-                /* Write-protect and sync contents */
-                _sh_resync(other, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-                oos[idx] = INVALID_MFN;
-            }
-        }
-    }
-}
-
-/* Allow a shadowed page to go out of sync. Unsyncs are traced in
- * multi.c:sh_page_fault() */
-int sh_unsync(struct vcpu *v, mfn_t gmfn)
-{
-    struct page_info *pg;
-
-    ASSERT(paging_locked_by_me(v->domain));
-
-    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
-
-    pg = mfn_to_page(gmfn);
-
-    /* Guest page must be shadowed *only* as L1 and *only* once when out
-     * of sync.  Also, get out now if it's already out of sync.
-     * Also, can't safely unsync if some vcpus have paging disabled.*/
-    if ( pg->shadow_flags &
-         ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
-         || sh_page_has_multiple_shadows(pg)
-         || !is_hvm_vcpu(v)
-         || !v->domain->arch.paging.shadow.oos_active )
-        return 0;
-
-    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_out_of_sync);
-    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_oos_may_write);
-
-    pg->shadow_flags |= SHF_out_of_sync|SHF_oos_may_write;
-    oos_hash_add(v, gmfn);
-    perfc_incr(shadow_unsync);
-    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_UNSYNC);
-    return 1;
-}
-
-#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
-
-
 /**************************************************************************/
 /* Code for "promoting" a guest page to the point where the shadow code is
  * willing to let it be treated as a guest page table.  This generally
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -0,0 +1,606 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/******************************************************************************
+ * arch/x86/mm/shadow/oos.c
+ *
+ * Shadow code dealing with out-of-sync shadows.
+ * Parts of this code are Copyright (c) 2006 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ */
+
+#include "private.h"
+
+#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
+
+#include <xen/trace.h>
+
+#include <asm/shadow.h>
+
+/*
+ * From time to time, we let a shadowed pagetable page go out of sync
+ * with its shadow: the guest is allowed to write directly to the page,
+ * and those writes are not synchronously reflected in the shadow.
+ * This lets us avoid many emulations if the guest is writing a lot to a
+ * pagetable, but it relaxes a pretty important invariant in the shadow
+ * pagetable design.  Therefore, some rules:
+ *
+ * 1. Only L1 pagetables may go out of sync: any page that is shadowed
+ *    at at higher level must be synchronously updated.  This makes
+ *    using linear shadow pagetables much less dangerous.
+ *    That means that: (a) unsyncing code needs to check for higher-level
+ *    shadows, and (b) promotion code needs to resync.
+ *
+ * 2. All shadow operations on a guest page require the page to be brought
+ *    back into sync before proceeding.  This must be done under the
+ *    paging lock so that the page is guaranteed to remain synced until
+ *    the operation completes.
+ *
+ *    Exceptions to this rule: the pagefault and invlpg handlers may
+ *    update only one entry on an out-of-sync page without resyncing it.
+ *
+ * 3. Operations on shadows that do not start from a guest page need to
+ *    be aware that they may be handling an out-of-sync shadow.
+ *
+ * 4. Operations that do not normally take the paging lock (fast-path
+ *    #PF handler, INVLPG) must fall back to a locking, syncing version
+ *    if they see an out-of-sync table.
+ *
+ * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
+ *    must explicitly resync all relevant pages or update their
+ *    shadows.
+ *
+ * Currently out-of-sync pages are listed in a simple open-addressed
+ * hash table with a second chance (must resist temptation to radically
+ * over-engineer hash tables...)  The virtual address of the access
+ * which caused us to unsync the page is also kept in the hash table, as
+ * a hint for finding the writable mappings later.
+ *
+ * We keep a hash per vcpu, because we want as much as possible to do
+ * the re-sync on the save vcpu we did the unsync on, so the VA hint
+ * will be valid.
+ */
+
+#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL
+void sh_oos_audit(struct domain *d)
+{
+    unsigned int idx, expected_idx, expected_idx_alt;
+    struct page_info *pg;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        {
+            mfn_t *oos = v->arch.paging.shadow.oos;
+
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
+                continue;
+
+            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
+            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
+            if ( idx != expected_idx && idx != expected_idx_alt )
+            {
+                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
+                       __func__, idx, mfn_x(oos[idx]),
+                       expected_idx, expected_idx_alt);
+                BUG();
+            }
+            pg = mfn_to_page(oos[idx]);
+            if ( !(pg->count_info & PGC_shadowed_pt) )
+            {
+                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
+                BUG();
+            }
+            if ( !(pg->shadow_flags & SHF_out_of_sync) )
+            {
+                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
+                BUG();
+            }
+            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
+            {
+                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
+                BUG();
+            }
+        }
+    }
+}
+#endif
+
+#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
+void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    struct vcpu *v;
+    mfn_t *oos;
+
+    ASSERT(mfn_is_out_of_sync(gmfn));
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+
+        if ( mfn_eq(oos[idx], gmfn) )
+            return;
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+#endif
+
+/* Update the shadow, but keep the page out of sync. */
+static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
+{
+    struct page_info *pg = mfn_to_page(gmfn);
+
+    ASSERT(mfn_valid(gmfn));
+    ASSERT(page_is_out_of_sync(pg));
+
+    /* Call out to the appropriate per-mode resyncing function */
+    if ( pg->shadow_flags & SHF_L1_32 )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
+    else if ( pg->shadow_flags & SHF_L1_PAE )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
+    else if ( pg->shadow_flags & SHF_L1_64 )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
+}
+
+static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
+                                            mfn_t smfn, unsigned long off)
+{
+    ASSERT(mfn_valid(smfn));
+    ASSERT(mfn_valid(gmfn));
+
+    switch ( mfn_to_page(smfn)->u.sh.type )
+    {
+    case SH_type_l1_32_shadow:
+    case SH_type_fl1_32_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
+            (d, gmfn, smfn, off);
+
+    case SH_type_l1_pae_shadow:
+    case SH_type_fl1_pae_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
+            (d, gmfn, smfn, off);
+
+    case SH_type_l1_64_shadow:
+    case SH_type_fl1_64_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
+            (d, gmfn, smfn, off);
+
+    default:
+        return 0;
+    }
+}
+
+/*
+ * Fixup arrays: We limit the maximum number of writable mappings to
+ * SHADOW_OOS_FIXUPS and store enough information to remove them
+ * quickly on resync.
+ */
+
+static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
+                                       struct oos_fixup *fixup)
+{
+    struct domain *d = v->domain;
+    int i;
+    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+    {
+        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
+        {
+            sh_remove_write_access_from_sl1p(d, gmfn,
+                                             fixup->smfn[i],
+                                             fixup->off[i]);
+            fixup->smfn[i] = INVALID_MFN;
+        }
+    }
+
+    /* Always flush the TLBs. See comment on oos_fixup_add(). */
+    return 1;
+}
+
+void oos_fixup_add(struct domain *d, mfn_t gmfn,
+                   mfn_t smfn,  unsigned long off)
+{
+    int idx, next;
+    mfn_t *oos;
+    struct oos_fixup *oos_fixup;
+    struct vcpu *v;
+
+    perfc_incr(shadow_oos_fixup_add);
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_fixup = v->arch.paging.shadow.oos_fixup;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            int i;
+            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+            {
+                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn) &&
+                     (oos_fixup[idx].off[i] == off) )
+                    return;
+            }
+
+            next = oos_fixup[idx].next;
+
+            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
+            {
+                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
+
+                /* Reuse this slot and remove current writable mapping. */
+                sh_remove_write_access_from_sl1p(d, gmfn,
+                                                 oos_fixup[idx].smfn[next],
+                                                 oos_fixup[idx].off[next]);
+                perfc_incr(shadow_oos_fixup_evict);
+                /*
+                 * We should flush the TLBs now, because we removed a
+                 * writable mapping, but since the shadow is already
+                 * OOS we have no problem if another vcpu write to
+                 * this page table. We just have to be very careful to
+                 * *always* flush the tlbs on resync.
+                 */
+            }
+
+            oos_fixup[idx].smfn[next] = smfn;
+            oos_fixup[idx].off[next] = off;
+            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
+
+            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
+                                   struct oos_fixup *fixup)
+{
+    struct domain *d = v->domain;
+    int ftlb = 0;
+
+    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);
+
+    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
+    {
+    default:
+    case 0:
+        break;
+
+    case 1:
+        ftlb |= 1;
+        break;
+
+    case -1:
+        /*
+         * An unfindable writeable typecount has appeared, probably via a
+         * grant table entry: can't shoot the mapping, so try to unshadow
+         * the page.  If that doesn't work either, the guest is granting
+         * his pagetables and must be killed after all.
+         * This will flush the tlb, so we can return with no worries.
+         */
+        shadow_remove_all_shadows(d, gmfn);
+        return 1;
+    }
+
+    if ( ftlb )
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
+
+    return 0;
+}
+
+static inline void trace_resync(int event, mfn_t gmfn)
+{
+    if ( tb_init_done )
+    {
+        /* Convert gmfn to gfn */
+        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
+
+        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
+    }
+}
+
+/* Pull all the entries on an out-of-sync page back into sync. */
+static void _sh_resync(struct vcpu *v, mfn_t gmfn,
+                       struct oos_fixup *fixup, mfn_t snp)
+{
+    struct page_info *pg = mfn_to_page(gmfn);
+
+    ASSERT(paging_locked_by_me(v->domain));
+    ASSERT(mfn_is_out_of_sync(gmfn));
+    /* Guest page must be shadowed *only* as L1 when out of sync. */
+    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
+             & ~SHF_L1_ANY));
+    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
+
+    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
+
+    /* Need to pull write access so the page *stays* in sync. */
+    if ( oos_remove_write_access(v, gmfn, fixup) )
+    {
+        /* Page has been unshadowed. */
+        return;
+    }
+
+    /* No more writable mappings of this page, please */
+    pg->shadow_flags &= ~SHF_oos_may_write;
+
+    /* Update the shadows with current guest entries. */
+    _sh_resync_l1(v, gmfn, snp);
+
+    /* Now we know all the entries are synced, and will stay that way */
+    pg->shadow_flags &= ~SHF_out_of_sync;
+    perfc_incr(shadow_resync);
+    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
+}
+
+/* Add an MFN to the list of out-of-sync guest pagetables */
+static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
+{
+    int i, idx, oidx, swap = 0;
+    mfn_t *oos = v->arch.paging.shadow.oos;
+    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
+    struct oos_fixup fixup = { .next = 0 };
+
+    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+        fixup.smfn[i] = INVALID_MFN;
+
+    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+    oidx = idx;
+
+    if ( !mfn_eq(oos[idx], INVALID_MFN) &&
+         (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
+    {
+        /* Punt the current occupant into the next slot */
+        SWAP(oos[idx], gmfn);
+        SWAP(oos_fixup[idx], fixup);
+        swap = 1;
+        idx = (idx + 1) % SHADOW_OOS_PAGES;
+    }
+    if ( !mfn_eq(oos[idx], INVALID_MFN) )
+    {
+        /* Crush the current occupant. */
+        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+        perfc_incr(shadow_unsync_evict);
+    }
+    oos[idx] = gmfn;
+    oos_fixup[idx] = fixup;
+
+    if ( swap )
+        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
+
+    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
+}
+
+/* Remove an MFN from the list of out-of-sync guest pagetables */
+void oos_hash_remove(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    struct vcpu *v;
+
+    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            oos[idx] = INVALID_MFN;
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    mfn_t *oos_snapshot;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            return oos_snapshot[idx];
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+/* Pull a single guest page back into sync */
+void sh_resync(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    mfn_t *oos_snapshot;
+    struct oos_fixup *oos_fixup;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_fixup = v->arch.paging.shadow.oos_fixup;
+        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
+            oos[idx] = INVALID_MFN;
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+/*
+ * Figure out whether it's definitely safe not to sync this l1 table,
+ * by making a call out to the mode in which that shadow was made.
+ */
+static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
+{
+    struct page_info *pg = mfn_to_page(gl1mfn);
+
+    if ( pg->shadow_flags & SHF_L1_32 )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
+    else if ( pg->shadow_flags & SHF_L1_PAE )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
+    else if ( pg->shadow_flags & SHF_L1_64 )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
+           mfn_x(gl1mfn));
+    BUG();
+}
+
+/*
+ * Pull all out-of-sync pages back into sync.  Pages brought out of sync
+ * on other vcpus are allowed to remain out of sync, but their contents
+ * will be made safe (TLB flush semantics); pages unsynced by this vcpu
+ * are brought back into sync and write-protected.  If skip != 0, we try
+ * to avoid resyncing at all if we think we can get away with it.
+ */
+void sh_resync_all(struct vcpu *v, int skip, int this, int others)
+{
+    int idx;
+    struct vcpu *other;
+    mfn_t *oos = v->arch.paging.shadow.oos;
+    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
+
+    SHADOW_PRINTK("%pv\n", v);
+
+    ASSERT(paging_locked_by_me(v->domain));
+
+    if ( !this )
+        goto resync_others;
+
+    /* First: resync all of this vcpu's oos pages */
+    for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        if ( !mfn_eq(oos[idx], INVALID_MFN) )
+        {
+            /* Write-protect and sync contents */
+            _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+            oos[idx] = INVALID_MFN;
+        }
+
+ resync_others:
+    if ( !others )
+        return;
+
+    /* Second: make all *other* vcpus' oos pages safe. */
+    for_each_vcpu(v->domain, other)
+    {
+        if ( v == other )
+            continue;
+
+        oos = other->arch.paging.shadow.oos;
+        oos_fixup = other->arch.paging.shadow.oos_fixup;
+        oos_snapshot = other->arch.paging.shadow.oos_snapshot;
+
+        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        {
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
+                continue;
+
+            if ( skip )
+            {
+                /* Update the shadows and leave the page OOS. */
+                if ( sh_skip_sync(v, oos[idx]) )
+                    continue;
+                trace_resync(TRC_SHADOW_RESYNC_ONLY, oos[idx]);
+                _sh_resync_l1(other, oos[idx], oos_snapshot[idx]);
+            }
+            else
+            {
+                /* Write-protect and sync contents */
+                _sh_resync(other, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+                oos[idx] = INVALID_MFN;
+            }
+        }
+    }
+}
+
+/*
+ * Allow a shadowed page to go out of sync. Unsyncs are traced in
+ * multi.c:sh_page_fault()
+ */
+int sh_unsync(struct vcpu *v, mfn_t gmfn)
+{
+    struct page_info *pg;
+
+    ASSERT(paging_locked_by_me(v->domain));
+
+    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
+
+    pg = mfn_to_page(gmfn);
+
+    /*
+     * Guest page must be shadowed *only* as L1 and *only* once when out
+     * of sync.  Also, get out now if it's already out of sync.
+     * Also, can't safely unsync if some vcpus have paging disabled.
+     */
+    if ( (pg->shadow_flags &
+          ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)) ||
+         sh_page_has_multiple_shadows(pg) ||
+         !is_hvm_vcpu(v) ||
+         !v->domain->arch.paging.shadow.oos_active )
+        return 0;
+
+    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_out_of_sync);
+    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_oos_may_write);
+
+    pg->shadow_flags |= SHF_out_of_sync|SHF_oos_may_write;
+    oos_hash_add(v, gmfn);
+    perfc_incr(shadow_unsync);
+    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_UNSYNC);
+    return 1;
+}
+
+#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -452,6 +452,7 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
 /* Pull an out-of-sync page back into sync. */
 void sh_resync(struct domain *d, mfn_t gmfn);
 
+void oos_hash_remove(struct domain *d, mfn_t gmfn);
 void oos_fixup_add(struct domain *d, mfn_t gmfn, mfn_t smfn, unsigned long off);
 
 /* Pull all out-of-sync shadows back into sync.  If skip != 0, we try
@@ -477,6 +478,7 @@ shadow_sync_other_vcpus(struct vcpu *v)
     sh_resync_all(v, 1 /* skip */, 0 /* this */, 1 /* others */);
 }
 
+void sh_oos_audit(struct domain *d);
 void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn);
 mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn);
 


