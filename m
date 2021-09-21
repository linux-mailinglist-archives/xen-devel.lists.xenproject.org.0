Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1419412F45
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191441.341473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa4W-0007dh-K0; Tue, 21 Sep 2021 07:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191441.341473; Tue, 21 Sep 2021 07:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa4W-0007cC-Gd; Tue, 21 Sep 2021 07:20:08 +0000
Received: by outflank-mailman (input) for mailman id 191441;
 Tue, 21 Sep 2021 07:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa4U-0006mE-T7
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:20:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea372172-ccdb-4c2f-90ab-494e8ddfb4fd;
 Tue, 21 Sep 2021 07:20:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37--c95hKXTPcSNhYd3da-yQQ-1; Tue, 21 Sep 2021 09:20:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 07:20:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:20:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Tue, 21 Sep 2021 07:20:01 +0000
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
X-Inumbo-ID: ea372172-ccdb-4c2f-90ab-494e8ddfb4fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZzQEVSwMvpFC6oSCiycTUs10fXX3566gSFd9Uc4olw=;
	b=JXP0PggS2U3EhnABGu1I2a2qo5wFco509ahINW49DEFxO594EwdSbfIjw62jI7CJBshKLt
	HJiWUjwu3bMdVEMCA6FPYPHKbFEqldpB2zfqsHPBNcG+gLt0Sq4X1jLXOZ035bVCeMpp4F
	4Sj78WSLK/4hHT6phu4Uj9xnDgdrPtY=
X-MC-Unique: -c95hKXTPcSNhYd3da-yQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+wLz7rUWazxE3ro99PvPgrXKeZg+rN2omAHPbRjJ1TNh0fU4BpYmBQBFvsbnSBvgF07flbm+kRHW8u4U8gpxqyD0qrvFHgv6u9Zx4kBMkakvTiqvBExuf5rwEjFgIqBY6ZXOSU1QUIId1FyZLHGT9KDYrAXULO84/2pVq6jY32WbBKrieh3pg2Rbg6EiFe+fznTa6igeEskY3zlI8/0apqv6aVZZViVovqKIkoS+mt5COOWukCvXCFn/f9RQiqu2WAIgUQSJ6sfsSEUD+XSwUgAGvvnkJ+94t+AoeWk0ZnUGOnDP1YkUxV0l/P2YQyKWbI629nAxhTA9m/LeDZPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MZzQEVSwMvpFC6oSCiycTUs10fXX3566gSFd9Uc4olw=;
 b=K3y5uFsuNLVTcVxz8jQOixhnLy6nrnqZLhAsbdWRnVdaaIN2fz+sWSy7p6Yc4IZH3gAQUMzcj6GplTjbfk44sFgfJOromeZIDKmMufd1Z44w9sae38df8MC4ietFPPXzN3HjvoXtekk4DlAJ9cP17hQzLbWkjgDxIk9G8IFpAbx/K6s74Vh1k6WoXTHNYNkOsLjUXZgV3Vxadk6AfL+odkWkiKQR1SeycLc63Yku9ogPDh4yc9GrkHSlWsMobsei1bFe6S6tfW8k6Wz7bBJZT4Ec5i+q3ThyI6yxVDGC+aqpXU/6fR28S2oeoRMmp8c+B87VgB+1NyAwpvHk9+Hycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 7/9] x86/PVH: actually show Dom0's stacks from debug key
 '0'
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <ca129fa5-7165-a9ef-4e57-75c43a708960@suse.com>
Date: Tue, 21 Sep 2021 09:20:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b068cf-b07a-4023-e6c1-08d97cd039a6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB667129AED513FA65383119BAB3A19@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ypZOEBrTsAT+Duv6+keWmuQFg/TsTMyfj7JJSuAvmLeKnZXxIsjHwPqRsrqt1+38Hu13BqX4I9F4fSIPmdE8pAVHA/qNGbaGl9o4+m5c56zSLIhdYE2vqIFbWl8x8pgOYM8lMsIcV9nk71H4guHg6cQzIQmwugOixAtVGVHgpRNufNEdhD+wzR8kwk5Er+UgdpwMVbXwmjMKQnnzqqLcH2GHcReUWfsU3RIQ/HH+5RihhzqpvP4wT+qtUHRO52PGiraa6ogXY9bTpUfI24kSoUiSczPCufOFk+RQfjvk1u+7rAU1q7CIImcJ9ijin2xM9d/pI1prkB2NfIM5Ub7VyiVtlJ3DNxwZ1NS7++mtU/h9s4XZoC5jeLpHReDW4Itcoa8jtjNCjxFf2bzUdS5m1YVtXHJ7JRq0d+2fUZJ5ww/CnGbgF+GMnhezRPLsqtitbLyvz5QYw/yeFt+EKdMukNns0KzP4x4EvEWR3jdTXJaOSoaDe9t9bkBaPt65HhJtpkbVwOJq8hor+FVhpOBHjpbaRc/BGY+FGmsV07t4658vKbBettuDndbjV0u2TYmsMKBLjbptE/5rJE5WsJcuSkKDcnLbu5O905bsEydC6nv3uzYtcplV/S/2zg26PKpDEkZrUOv3qlOS0oE3pQ+VzdkyEqZxJq033G2YpiM3aP8rGgdsjZIwomlnniAJur0pMIqIpmS/q5XZWhVmiqSs1nMWa3BhO0bzWISCjFK0vYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(5660300002)(36756003)(54906003)(4326008)(8936002)(956004)(31686004)(83380400001)(8676002)(2906002)(6486002)(2616005)(26005)(316002)(38100700002)(186003)(31696002)(508600001)(66476007)(66556008)(86362001)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1VMbVh2eldHTlZicUtjNG91T0hLKytwTGkvRkZ5ZzRjUXQ1L1g5QVBSQzdN?=
 =?utf-8?B?RzNwcFJieWJnTHNYNnpSQVMyaHlNejUyeGZ3V2owTjBZVi9VVkJDSlF4a0dJ?=
 =?utf-8?B?VVV2T2hiNXRwY3ZrdmFOTXh3blBvT1FlWU1saTdjZGNoNy9wVS80cDFtWWIz?=
 =?utf-8?B?Y08vanZPSm1UdFl0eGxER3laSENGT1VJUldWQ3JvY3JPYmhrbWJGVC9TVmJM?=
 =?utf-8?B?UWNhaUxNckhrVDFTVHhxcjFBWlRVQmY1M3YxQndKZEQ4QjhYQUlxYVBkQTBt?=
 =?utf-8?B?WE1qRWtFK3R4djR0bDA5T2RXNmEybU93TGFCK2NGdVE3RTl1UFphTGZkOUdU?=
 =?utf-8?B?bkNOTVpuNnhKRU9NaVVBRjRWbXp6RG5PRVBZSkNPelE4R0diZ01Rc21EbHIy?=
 =?utf-8?B?UjhMallrdkRIeWJtdUpRZFUvM3pZUTBIem9pOFA5WDRna3ExZEdlbmovcmx6?=
 =?utf-8?B?QlVzUHEzbU1Hc2NVQ2NJNjlYK3JhMnhWRlBJeDk3MXNGakVBbSswM2NUeC95?=
 =?utf-8?B?YTIvV1ZCdjUyc3cyWXIra29FOUtFc0wyaFZUU05oYjZyY3QzbVlhbTlpYWxo?=
 =?utf-8?B?bzVFbUJveUJReWpTSjFib0V4S3NLaEt0clFrQ3RLNm9tcVFzWGlqWnRVRk5H?=
 =?utf-8?B?VldjRE9HMDlKL1hkdVc3L1VPZE5kVzJjVHhEQWVkYVpyYUk2dUE3K1lhMmdp?=
 =?utf-8?B?QkN4aGlIRzFSODBRV2gyNCtjV1ZWMkF1WEtrRU5KcmhGU01aOU4xdzdhRlpl?=
 =?utf-8?B?eUQxWGZ4NURMMmpvREJYZU5QMHdPT3IxSVowU05xOEVGWjdaUlZhODNySVFq?=
 =?utf-8?B?ZmhRYUhWVFRxT3ROZDR2M3VKTDJHbjBOZDRjNmw4U0VVNkZWcyt2TlhHZzYy?=
 =?utf-8?B?MXdnNmJ4dzAzUmxwaWJQNVdHYTh4V3B1Q3ZFa05YNGlDRDh6cXBraHFBY1VN?=
 =?utf-8?B?UW9SSnAwdzVsUjN6RU9QTFhlL1VVcDd1YmxmZnBaQ2hBbktveHNFS09NRHEr?=
 =?utf-8?B?RnJrZ2hYdTByZlBqYTFIVVhOcnZQaUFlZ0xPM0pZdklUeC92WjIzWW9qczNT?=
 =?utf-8?B?WWdPeDZJWmh6NWo5MVg5WldUQisvSnRnekp3SVNTZXZCc3QzTTZZR29pMkFX?=
 =?utf-8?B?T1l6SEp5QzFQN3l1MDA5N0VBTkZEb285UGpiSnVERDhLTzhTQ1NJTFI4d3NL?=
 =?utf-8?B?SFh2U1ArQmx6Y3lsbGk4OThPS1dwK2g1bFRKRTZuWmdKaHpGMlRXdk1QaDBD?=
 =?utf-8?B?empMTURLTlNJcFpkQ080SUk1OUo4L0kybzdmVVhRa0hINjk5VDgyL2gyR2Mw?=
 =?utf-8?B?cjU1ZEtmQXBCSzROTUdsTE5VSUw5UWR2cmdtR1NMUTJPWlJ5OTBNUldnYU9m?=
 =?utf-8?B?bGVhT3o1TGtYbG10VldSU1Rpb2dOYVQvQVVPWWx0UTZySmNkSWRER3ZxeHlQ?=
 =?utf-8?B?Mld3RzZTdW9ZUms5R0R5NkE3Q3NZTVl4TTZKaGRlc29OZTVkajBkbDZKUXMx?=
 =?utf-8?B?Yk9UcDM2M01NMHZnbTYyMit0UkZNdGs2Z09YNmNXTk1FRlBWaERNUTNWRUVD?=
 =?utf-8?B?SUE0VkNkUnVMc0ZZZnIyK093SXhqc2NzNll0OXNPeDhzODZiOVJyV0g0QTRm?=
 =?utf-8?B?MjM0R0t6NHJQVkJIb1YrQ2k4YkZBTWtpUVdQYitYOHVDRGlOS21vRjJRUzA1?=
 =?utf-8?B?b1A1eWNzM1RMSVNnbnJhaDdlVGV3OEs4bHF3L3cxdXZMZzM3bU4yUXlNQTZS?=
 =?utf-8?Q?pIq+z1F3D8qju8Zs/YtURyeAL4pQ8xK5QtSSEAm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b068cf-b07a-4023-e6c1-08d97cd039a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:20:01.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hL/QSQ+Zpz0CjVJwdWTX2QIwh5ASu6sMr8v45kLAsiVJlOH4Uyju4S/xSCTE6SXYttuSJjGRKMa+cWg4lG/hog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

show_guest_stack() does nothing for HVM. Introduce a HVM-specific
dumping function, paralleling the 64- and 32-bit PV ones. We don't know
the real stack size, so only dump up to the next page boundary.

Rather than adding a vcpu parameter to hvm_copy_from_guest_linear(),
introduce hvm_copy_from_vcpu_linear() which - for now at least - in
return won't need a "pfinfo" parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: The bypassing of the output interleaving avoidance isn't nice, but
     I've not been able to think of an alternative. Avoiding the call to
     hvm_vcpu_virtual_to_linear() would be in principle possible (adding
     in the SS base directly), but one way or another we need to access
     guest memory and hence can't sensibly avoid using the P2M layer.
     However, commit 0996e0f38540 ("x86/traps: prevent interleaving of
     concurrent cpu state dumps") introduced this logic here while
     really only talking about show_execution_state().
     vcpu_show_execution_state() is imo much less prone to interleaving
     of its output: It's uses from the keyhandler are sequential already
     anyway, and the only other use is from hvm_triple_fault(). Instead
     of making the locking conditional, it may therefore be an option to
     drop it again altogether.
TBD: For now this dumps also user mode stacks. We may want to restrict
     this.
TBD: An alternative to putting this next to {,compat_}show_guest_stack()
     is to put it in hvm.c, eliminating the need to introduce
     hvm_copy_from_vcpu_linear(), but then requiring extra parameters to
     be passed.
TBD: Technically this makes unnecessary the earlier added entering/
     leaving if the VMCS. Yet to avoid a series of non-trivial
     enter/exit pairs, I think leaving that in is still beneficial. In
     which case here perhaps merely the associate comment may want
     tweaking.
---
v3: New.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3408,6 +3408,15 @@ enum hvm_translation_result hvm_copy_fro
                       PFEC_page_present | pfec, pfinfo);
 }
 
+enum hvm_translation_result hvm_copy_from_vcpu_linear(
+    void *buf, unsigned long addr, unsigned int size, struct vcpu *v,
+    unsigned int pfec)
+{
+    return __hvm_copy(buf, addr, size, v,
+                      HVMCOPY_from_guest | HVMCOPY_linear,
+                      PFEC_page_present | pfec, NULL);
+}
+
 unsigned int copy_to_user_hvm(void *to, const void *from, unsigned int len)
 {
     int rc;
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -364,6 +364,71 @@ static void show_guest_stack(struct vcpu
     printk("\n");
 }
 
+static void show_hvm_stack(struct vcpu *v, const struct cpu_user_regs *regs)
+{
+#ifdef CONFIG_HVM
+    unsigned long sp = regs->rsp, addr;
+    unsigned int i, bytes, words_per_line, pfec = PFEC_page_present;
+    struct segment_register ss, cs;
+
+    hvm_get_segment_register(v, x86_seg_ss, &ss);
+    hvm_get_segment_register(v, x86_seg_cs, &cs);
+
+    if ( hvm_long_mode_active(v) && cs.l )
+        i = 16, bytes = 8;
+    else
+    {
+        sp = ss.db ? (uint32_t)sp : (uint16_t)sp;
+        i = ss.db ? 8 : 4;
+        bytes = cs.db ? 4 : 2;
+    }
+
+    if ( bytes == 8 || (ss.db && !ss.base) )
+        printk("Guest stack trace from sp=%0*lx:", i, sp);
+    else
+        printk("Guest stack trace from ss:sp=%04x:%0*lx:", ss.sel, i, sp);
+
+    if ( !hvm_vcpu_virtual_to_linear(v, x86_seg_ss, &ss, sp, bytes,
+                                     hvm_access_read, &cs, &addr) )
+    {
+        printk(" Guest-inaccessible memory\n");
+        return;
+    }
+
+    if ( ss.dpl == 3 )
+        pfec |= PFEC_user_mode;
+
+    words_per_line = stack_words_per_line * (sizeof(void *) / bytes);
+    for ( i = 0; i < debug_stack_lines * words_per_line; )
+    {
+        unsigned long val = 0;
+
+        if ( (addr ^ (addr + bytes - 1)) & PAGE_SIZE )
+            break;
+
+        if ( !(i++ % words_per_line) )
+            printk("\n  ");
+
+        if ( hvm_copy_from_vcpu_linear(&val, addr, bytes, v,
+                                       pfec) != HVMTRANS_okay )
+        {
+            printk(" Fault while accessing guest memory.");
+            break;
+        }
+
+        printk(" %0*lx", 2 * bytes, val);
+
+        addr += bytes;
+        if ( !(addr & (PAGE_SIZE - 1)) )
+            break;
+    }
+
+    if ( !i )
+        printk(" Stack empty.");
+    printk("\n");
+#endif
+}
+
 /*
  * Notes for get_{stack,shstk}*_bottom() helpers
  *
@@ -629,7 +694,7 @@ void show_execution_state(const struct c
 
 void vcpu_show_execution_state(struct vcpu *v)
 {
-    unsigned long flags;
+    unsigned long flags = 0;
 
     if ( test_bit(_VPF_down, &v->pause_flags) )
     {
@@ -663,14 +728,22 @@ void vcpu_show_execution_state(struct vc
     }
 #endif
 
-    /* Prevent interleaving of output. */
-    flags = console_lock_recursive_irqsave();
+    /*
+     * Prevent interleaving of output if possible. For HVM we can't do so, as
+     * the necessary P2M lookups involve locking, which has to occur with IRQs
+     * enabled.
+     */
+    if ( !is_hvm_vcpu(v) )
+        flags = console_lock_recursive_irqsave();
 
     vcpu_show_registers(v);
-    if ( guest_kernel_mode(v, &v->arch.user_regs) )
+    if ( is_hvm_vcpu(v) )
+        show_hvm_stack(v, &v->arch.user_regs);
+    else if ( guest_kernel_mode(v, &v->arch.user_regs) )
         show_guest_stack(v, &v->arch.user_regs);
 
-    console_unlock_recursive_irqrestore(flags);
+    if ( !is_hvm_vcpu(v) )
+        console_unlock_recursive_irqrestore(flags);
 
 #ifdef CONFIG_HVM
     if ( cpu_has_vmx && is_hvm_vcpu(v) )
--- a/xen/include/asm-x86/hvm/support.h
+++ b/xen/include/asm-x86/hvm/support.h
@@ -101,6 +101,9 @@ enum hvm_translation_result hvm_copy_to_
 enum hvm_translation_result hvm_copy_from_guest_linear(
     void *buf, unsigned long addr, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo);
+enum hvm_translation_result hvm_copy_from_vcpu_linear(
+    void *buf, unsigned long addr, unsigned int size, struct vcpu *v,
+    unsigned int pfec);
 
 /*
  * Get a reference on the page under an HVM physical or linear address.  If


