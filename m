Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A66F5525
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529061.823020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu943-0000RB-Do; Wed, 03 May 2023 09:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529061.823020; Wed, 03 May 2023 09:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu943-0000Nn-An; Wed, 03 May 2023 09:46:23 +0000
Received: by outflank-mailman (input) for mailman id 529061;
 Wed, 03 May 2023 09:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu941-0000NW-Hl
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:46:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a6b7481-e997-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 11:46:18 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 09:45:49 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:45:49 +0000
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
X-Inumbo-ID: 5a6b7481-e997-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4Ti2FyuNUFQo5B8p5+8s/4oJXDMxJr4KKeZe8p8wtr3e1k4W5eDwmb7tNGjKTiFZ8R/2fkCzoQvb6S4L99qPz2G34yxw8XbbZVeemMv81G3lhYCOHzpHw4I65ar99LXv10pzDykBzWDVazamiMiMmx9HfjndxVUJCgLzcbh/iKhqWcjIFPjzSsZHoI4EDdp4hGtkCI+hVrpMjP7b9moBgopZCanlq8r7+I7yKd5e6rTaE5py+ai2W+PWhln8wHBC1UuDxiGc6yU8NhPug96hjWXoHXzDDhvwxs3R8ICcyJBxNJvLh8YquXWKaSBk9wUBJV0V45n20+K72K9bOE8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s2ziFxyLLrxphcX9bcoXKx8fmbmlbg2IZSNSJNSJw4=;
 b=FMTOR7WhKDNt4LkIe9tfRUyAZ9nEOLx/by1cEAo2LlyZ5ifueXwpA/HV+aR6OoIW5CEkERNlu5TVRQn83k+D1B7mSuZurzkjyBo3tRgz1cuGopmXbf9lJ2Od1QcEIIdUxtJV430GitjlOt18S11dJA7r3u47WGDksihXrkR5QBWahZ0uAlSJnIa6Xtis2qJDSeOByAUFV8lTHfpNAhOEvaD4X5r+3GqSKbNf6Fn+6FJc1VvkRJ9KVQyO1vkIopyMzcWKR8owXyByqrCRNhi4rGAXqta5RjNKyk1U5z599nJ0K/81KV0vWi0VKomsTIC40pmDsKXZ21YC01BXucjgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s2ziFxyLLrxphcX9bcoXKx8fmbmlbg2IZSNSJNSJw4=;
 b=ktwluAyIBMs75Hpu+3Nb54GPGgIiTdVoBjUA0PphmB0CUjFKOJ8yTC02HwGmI3PjNOqanvVR2B9VgCMxN2ckOEbsiNRTmPAkaihvZHoZMNe7w1VphDaNqHRLL4s8vGVMxMIC3OagahJ7OsCA15OpgCdr8ULVu/T9cMFuKLZX3RgR0yGdfc3QKa01jjk7kDS0vgr72tEk6VAmkSC/EMof96tEsQkMrOhuOhMSb9QEqEUNeS3zYVA+6qNHQ7culh1Ob5q0pNPAXqCJxKnj1+GlYKYmJTLzXnehamKrXeAD7aLU6HdAKskqtWor14jog8a7YX0T+dy3sEU2gHpwcCLFKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9dc789fe-6c03-165d-c361-6aaa4ba09763@suse.com>
Date: Wed, 3 May 2023 11:45:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 3/6] x86/PV: restrict guest-induced WBINVD (or alike) to
 cache writeback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
In-Reply-To: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d72f2c-df64-4a34-50b1-08db4bbb2d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zfJSpX52zNoSJgSDqDh8oLyEvYsXe+x+6prtXbYx8ALGbJb96oKPqeyHF5F+meIC3b8O4RI4gNZhxPNXdDWBxyUElvQ9I/Lhv3I60Rwue4pRhfItPmrpK//PLjdVH5960/t612XGZePRHIKawThacTL0cka/7GjDCrvOhHBzgrcnBH98DzrcVP3cGCgtVAvNgOXZiBK8VsoGGrjazOguvxYU9wubhbZSRfC1rRyoTMOviOPKCE5Q7PSjhsXEleE5FuRysMF/XhmUn/KVFwNtMAlJea0hysPzlCKBQxdWY+tPuLFuwfy//EPhlMI5KkAGgf/ElUFbjnA9Mg1qGerYDU0EF8Av4SZzw/E8xq43HcOUZj/z0WlG1RpR8+zbY7pYO7vd3jYhbZ0aHblAVXPWmjBmn+v3kUZp/DckA8afR2Q+EeeSlDEzdPISB45X2c/IyhpzI2LvgCLRjMrwrqhVqPaC7g9z9S8dug8PyLISR169G6OSqN5LLy4DjrNSQuHQVz3XHTCgH/cIpxfLtyqPy7y4A8smtbRou9uLySp9suCu7YnlBkGrU8wWv8ye05NgDp4g7MSKDml3yZtKy1L7IoxnZwyxy+KLh42yDMebpWkBqhvp3SNU7Oeo9R7pB15Z260MTz6CSIrdpw7akGxAsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(6506007)(26005)(6512007)(186003)(31686004)(2616005)(2906002)(5660300002)(83380400001)(8936002)(8676002)(6486002)(41300700001)(36756003)(478600001)(54906003)(38100700002)(66476007)(66556008)(316002)(31696002)(66946007)(6916009)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU5kWGhqKzNkK29WdFVEb25pdG5Rc2JKL0xvL0UvTXc1V3FrdllDaElBQ2Ft?=
 =?utf-8?B?SHc1NGFwdFNEdGxoNForSFRTUllieVhERG82aFE0RlZXTnU5NUJVaklZK1RE?=
 =?utf-8?B?UnJPTno4NDhyR0RId3BaVk1KdXVFODZuUk1PdzFvcHBwUXFveTdtMlFqVUVs?=
 =?utf-8?B?bk9yYnNxZkc4b3RUMVJrK1RQSFFScUhTVDFzVmtWbVoyLzBiZW9FWlVTZlQw?=
 =?utf-8?B?d1FLNGhlK0F5cDdDM2RSVE5wM1MvTVVHSlBDcHJma1B1eHl3RXlNeTRZSW5L?=
 =?utf-8?B?Qi90bFpQaVpNaXFoVllPNStMeDVzNEdwMVVYYkJJMGtQcUFVMTJuZzFzSVk4?=
 =?utf-8?B?UFJMRWQyRTdHSFFiT2VjdFVBUWU1VXh4Z3JGUkFjdjdiM24rQUljSWhtNDdD?=
 =?utf-8?B?THJoNkRublZpdlRmdCtkTEw0RVd5WFN1NWVvb2JhLy8rVmFTdllObDQxR2hM?=
 =?utf-8?B?SThmK1YzU3U4cWRYRlhIQUpYOC9UN2RvMHBGM0t6Y2lGVVFyYlpyU0hkbTB4?=
 =?utf-8?B?NkNUcHhKZmhBMFhOWkNBOTM0ZHR0ZFRlc2NXOEMyNm41THl5dlZVVVBHTFBi?=
 =?utf-8?B?SHdHZkVML3pSVjA1b3htN3kxeUMvcWVwZHhQeGpoSSt4UUpUTWhhaWprWlk3?=
 =?utf-8?B?MTRySGFvVWUrMlBJaXBmb3lpdHI4cXkzTC9WNVJmWmtIUUMvQ0dJK1JISURQ?=
 =?utf-8?B?TEI1TlJ1M0svV01HTE5mc2NtYWlYUnZHRGkwNWNyUmZ1RE5McDNwZFdYdThE?=
 =?utf-8?B?Y0NpTlE5THprSGtWMGg4Qjlaa1BZVjY5WmV2WVFqT0dJWlQxb016NkpFTld0?=
 =?utf-8?B?RGdYK3ZaU1BIcmpVZ0tpODkrOGMyNFZ6TzMvdVdvbE9kRjhVNitPZDdVNUtP?=
 =?utf-8?B?c2o4QXlzNDdpR1krRU9tZHVLbEh3N25saXRMbldaVDk3RkRkU25vVGN0TElp?=
 =?utf-8?B?WXkzR1J2UE9Qd1VDdWlUdWt6L3czQ2dSZnVNVTNLRjZVLzJQRXN3emljQ2pZ?=
 =?utf-8?B?Ui9sVStwZXZYSlduVmhaWHAyTGVDamp2dUxSS2poYStidGMvQkZSbFhuVTVv?=
 =?utf-8?B?c3M1L0dDODlwcmh5ZzgxUU9IMEVTN09aZlI3Y3FJYUtCS1NNV05ZRFlEb1Mv?=
 =?utf-8?B?eTBWSmlEb2JEd2c5eGw2RHJlL29nQzVnaE1pYks4TEZGbHU0UVdUUFJoRFdJ?=
 =?utf-8?B?Rmo4dnFvQkhiSzBDOElBclR3Y0JzWU50NVpuWjV1dUVaUDVhL3E0L3lCck1L?=
 =?utf-8?B?ZkE4d2ZTdUdyV2RkdmdpNThQdlVXUW9QZjJCdWJqSUVJNUF2Wkd6aWlGTlhN?=
 =?utf-8?B?M0NLaW9ybnh5N1lIbG1aeWs4VzVob2ZIZUhzdXJXcXc3VlUzUkdyaHJnR0x3?=
 =?utf-8?B?RnQya2F2TkVLYTA3ZUZia2pKNTVOUEc0dUJlY0Z1TTYwTjZTVUNzSG1GZVcx?=
 =?utf-8?B?SW1zc1VNaVBiMVIxQStWeU45STJzeEJwdTl4TWt0SmZDRnNFc05ZVlRTZTNK?=
 =?utf-8?B?SEVDMkdGdGdOb1RaY212Wm5ZaG1YOU1ENFcvTWZ5dDBYQlBVdFdTN2p3VVRu?=
 =?utf-8?B?VmE3Nm5HOVZra1Z5ckFiRTI5YlZic2s3eGtyZUF5VGRYZlpWbEJsdms4TWdU?=
 =?utf-8?B?akhwNlZ6WFBrSEtMaTdjM3JuZXExNUdMV2JMR3EwemhmVHZMV014QTBWQmZt?=
 =?utf-8?B?NG1ZalloKyt6bDlXRE9aTEcyWjhvOUNxSUYrbXo3dnZrTVdkblczUFRaYWgw?=
 =?utf-8?B?bVlyaDFqSnlrUUJOSTN0ckx0QTZ1NEJFT2s2dDdOYXBwdlVOSDA2MnBNUVlo?=
 =?utf-8?B?b0ZTT2Nya2Z0QjNKcGJ1YzBkcmhpSGdHTDhoYi9iOEYwdVJ2MW5ZcTRRMmJ6?=
 =?utf-8?B?S1JWd0UrVkltRFdhdUZuNDFFMTVyTjhWV1FOUlFwWktlRnBDOVAveGplWkNs?=
 =?utf-8?B?bXJJc0VPVXJ6Ylh4VnhzY24wWkFKOEV0R05sR1JDblk5VXRqcUJUVDR0blVT?=
 =?utf-8?B?L2JvUEszVUUvNGVvb2Rhdm5FZ09wb2tqeU14OTdWUG5hK21UMThGVEFQOHl6?=
 =?utf-8?B?YkVIWVFKM1dYYksySjJML3RMZFVoZElCUmMrT2V6THhhUWxueVRHMUtrVHla?=
 =?utf-8?Q?TCaWxD72OPwrIrqFmACPfYKct?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d72f2c-df64-4a34-50b1-08db4bbb2d63
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:45:49.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZSwL4/OqmrpkAbdfihTLGdGwYzfL8zA+AX5fDWRIJJwdCV0osEFvJvWF/yJv3ziRbzjENpPGGkk5olv6NBIYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980

We allow its use for writeback purposes only anyway, so let's also carry
these out that way on capable hardware.

We can then also expose the WBNOINVD feature, as there's no difference
to WBINVD anymore. Note that respective emulation logic has already been
in place since ad3abc47dd23 ("x86emul: support WBNOINVD").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: FLUSH_WRITEBACK -> FLUSH_CACHE_WRITEBACK.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3772,7 +3772,7 @@ long do_mmuext_op(
             else if ( unlikely(!cache_flush_permitted(currd)) )
                 rc = -EACCES;
             else
-                wbinvd();
+                wbnoinvd();
             break;
 
         case MMUEXT_FLUSH_CACHE_GLOBAL:
@@ -3788,7 +3788,7 @@ long do_mmuext_op(
                     if ( !cpumask_intersects(mask,
                                              per_cpu(cpu_sibling_mask, cpu)) )
                         __cpumask_set_cpu(cpu, mask);
-                flush_mask(mask, FLUSH_CACHE);
+                flush_mask(mask, FLUSH_CACHE_WRITEBACK);
             }
             else
                 rc = -EINVAL;
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1196,10 +1196,8 @@ static int cf_check cache_op(
          * newer linux uses this in some start-of-day timing loops.
          */
         ;
-    else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
-        wbnoinvd();
     else
-        wbinvd();
+        wbnoinvd();
 
     return X86EMUL_OKAY;
 }
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -238,7 +238,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
-XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*S  WBNOINVD instruction */
+XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*A  WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
 XEN_CPUFEATURE(IBRS,          8*32+14) /*S  MSR_SPEC_CTRL.IBRS */
 XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*S  MSR_SPEC_CTRL.STIBP */


