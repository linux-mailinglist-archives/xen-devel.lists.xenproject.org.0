Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B511E697EE4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 15:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496019.766526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJAp-00005Z-Ml; Wed, 15 Feb 2023 14:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496019.766526; Wed, 15 Feb 2023 14:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJAp-0008UE-Jj; Wed, 15 Feb 2023 14:54:19 +0000
Received: by outflank-mailman (input) for mailman id 496019;
 Wed, 15 Feb 2023 14:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSJAo-0008U6-0r
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 14:54:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d9a8b67-ad40-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 15:54:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9489.eurprd04.prod.outlook.com (2603:10a6:102:2c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 14:54:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 14:54:13 +0000
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
X-Inumbo-ID: 9d9a8b67-ad40-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCHWvI6SPHmBM+QHw8gd8htG9zGzrYZy3hJa07Kw5PgoZCuzWsprkjqByrkN0YgRwwASG8WGF+fCEJpJFrA3DyvPy8tKpoz8jAw2kvq6DquMvwuIF3G6jK8snk1se3V3qzGNmUtorCgRQB80eWWLYNdbYgG2Bon+ddtjOIVsJAqZOy7HjziwONkBXBOpLlfF1xxIh0pOAlXtQMQM9e4eQk0o5sY5x1Gwr09dlNrcFVkvmuPWRTdPkeNxBPrw44AIxAtXP+l/3OTe4sjrZH2VBrjLC8FYgYw/t1bG/EWat3DQogzshHA/7PIg3T2FDx+4UK5LGcsbqZ4CWDKYNzujyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGuwNLop/ql4FzbLLIEGIhrzXrHY2ndkGysncLs6Gr4=;
 b=bfXl6kL1bn66VmSwobQwUThJYlU5QShPXe80DpAzJC+VzLAx3h/YzY+gaPytoFS0yX2YZ7j+DFsjh9IKlN7ZFj87webg8ajflQHrCiao7ZGeoHGG0OeGVV9Zu15UgawzSN0qG4VzPwU8WyPhMohmObocKzCVpSsWH9RlSt9Ysv/BGE7lsGbGYxZItj09sHGTCeILFxI7UH/PtCiErhaJTHX2FJdxq7CLWNng6G1OJJYvWqb6URbsS0EtKqwqWEo3d41R4yYF1yjbXXlYOh6o8Fd/6MgotX0/2FyHzWgAb0K0edmyXfrjrRETohHinGfAwNChiaHkzK0bompl838wXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGuwNLop/ql4FzbLLIEGIhrzXrHY2ndkGysncLs6Gr4=;
 b=X7SNHeRW08K/IztEJkwR5SPCznXurtTzGtc8O2b6ZIEI8ZR5pGESfuGLBugxbMxEzwKRdHnMCOHnu/LtrKqKmPFMXu2Nthpe0wjeji+9R/Y1f+k+7ppj53fNV2jHYfUtTM4uGIZWzHOvfOird7q3blWA0BUcYuos7cEtnONX8ry+N9YmmbaCXuDC7tuMX/hxXZuI/kQpO3zJ054FyDlS5CvqJ/2yzIRua6WgrzUsCfNQTT09kHGgjGYbyVK2+Fio0londh29tDQ6gd0LFgTWG/pJ363OQ2vWQR3GphUvrHUc+DttczNXYzmlBr5Aq9fgGvSQf468Ee+jiSpYyRQaPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
Date: Wed, 15 Feb 2023 15:54:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ff7ecb-6600-4e50-b70b-08db0f648090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bsk3jRPTKhs+c5u8IdElT0q1DYI98m1iGnvqZYjlCT8Dg6jQUWPCRa4M1BPj45uU5C8zrIg2hc9IDOZZA8LIJBshETyODH/bECYVOsomVBvkmKQBMBcbNFgHZGG1AJyhLKTek+77jwf/n1mDsHg02vMXNEhq9TJQSKeNagu7W1bwqUnl4aX1EHZtf8nCVdSUwG9yUFBYBDU0+QlNVl+GlEfrTWjnmhgta8vGsWhzfFKlt5C3W9fmhuEEiuIURo2ppoQ4QqgeeSgmI7ztpTWAJlc+CteSKKycUGlJrFYg2h7MJQwte4RABA5S5dKGEZuvOWq8mkAH4v6TF4zvttbAFmamTnR06vd9miwMWTZob60/OEdYXm0I50b94j+ePR/2Z0RVpnxGsYDRGf7g5gqAuAoM0kPdylT4vBkp8AbJ/tGxjSYzmnytLT8hjwGHhJyKzrKmXIeTmlaKEZi4fjZvs/OZCJmJ3+pM4KN4plyS+By52Ai9xqPqraGMQ+uKC6HaaJSNkUKU4lT13zxkBQARjqkRrYJfETT2HyEjYOMOP/xzK4HUquC9VE1woWo1Vqd2N8BSYHpmRsUnKwGa2Z2lGqRhOkf+I+KK9PbPv5yRJU9qCG6KdlXBS6jdzD9IgOGNVtumKKpgx631esQgtI+CIppSprlYo/gvoycaS/Yrc47z/15sib9pWLkdWl/IrpE9/y8VetvpPSEjDzVWvL8gkGrCdrIKiGaJ8W2bu7i6pjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(66899018)(83380400001)(54906003)(86362001)(31696002)(36756003)(26005)(186003)(6512007)(6506007)(2616005)(31686004)(66946007)(2906002)(5660300002)(8676002)(66476007)(4326008)(6916009)(66556008)(41300700001)(6486002)(478600001)(8936002)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWN3alQxQnRFTWNvTXJRRURpSmc5dHhzaERtSlJ1Ti9TY0drc3ZWckFacElO?=
 =?utf-8?B?cG9JQ0hIaHkwTERFSGVWcjIzdDVIR1RjZ29FSVdxUlNBbkYwL2N1VGxLYkhT?=
 =?utf-8?B?bDdkM01VWFhmQ1QyZ3pZeWhIRTV6bEsyUnRwQ2VVQmRSY1JPTjF5dkhSWGF5?=
 =?utf-8?B?YlV2cnRtUHBOa2ljdnNpeGRpdXkwQ3ZHb1lhNlVZSTdVYnRpVkpNMU9lZ2Mx?=
 =?utf-8?B?V0diM3cyNG14QTgyaUZTWU4yenZKbnNqN2dxa2xUVmprVE9LZ1p0WEpzMUgx?=
 =?utf-8?B?VU1SQnBramUraU5TWEsyTHVhQmRrQjRyUnFrTkNiT05uSFhNRUxyMmJpR1Va?=
 =?utf-8?B?QThTbnRjZFJFTHpxLzgyakZlNk85UnNKb2JtSlJuNUFJSE5FdEJYRDdDV0tq?=
 =?utf-8?B?Sk42Rjd1NHZDdG03Qk5tUGhIeVJUSmRXbjVpVk1aWDE4YWlheXM1ZnR1bVNy?=
 =?utf-8?B?dzNYV3hnSFJMK01QZjVIZ3JyU2g5MDhpLzlpQ0psSUJpV05sajhGd1pyQ3VN?=
 =?utf-8?B?a2FTRWM0T29FQXJYR28rWTZIN3JYOHkvQXNaTWVlQlJ3cTlmUnAvR1NEb3RE?=
 =?utf-8?B?SEhPYTV1eDdWSTZ0cFQ1aU1YMmlJbnY1M1BSUFVLT0VZM3R3VFl6TmExUjd2?=
 =?utf-8?B?Tkh6VUcwU2lUZlpRSUZhZ3IrMVprdnlxaTIzMXZDc0lQNjExdU1DbFVHdHlh?=
 =?utf-8?B?RHBKR3JsMmVPeG1GNWZOVkEyVksrTlVPc2xiRDFsRUQzUkRSWjNmdHd1OEdz?=
 =?utf-8?B?dGdQUE1QRkNyNUdHSWZUUEt5elhZUUxaZXc3L2lSRjNKOXZJM1NhWlhzYlJM?=
 =?utf-8?B?clJUdDhDSGxiZnROWDVaQXYwVU5GMkRuTXM5WWFOL0p2aFZsQ3EySmg4TURz?=
 =?utf-8?B?eCtrTS84QkJtc2xYUFhvMEp2TWl0MUxObWx2K0c1T040cytodFgwbmRiTnNT?=
 =?utf-8?B?SkJuM2VLNVpQT3l3TVdXU1d0TEdmdjl3QWxTalh5c2Y1M2M2cnpuRm9aRkJ3?=
 =?utf-8?B?NFB3VVhJVlNXWUtYY3M2Qjc1MzJuTWlGcEJSSm1xeWJlUHR2cWZSUWsvZE1D?=
 =?utf-8?B?MnRJUlVjTnpLYkszUUVVRFg1VVp2YVlxbVB1alpraDRDVmpaeU9adTVzZ2po?=
 =?utf-8?B?LzhQNTluZUUxeU1OYXRwRGhJRjlUbmVmeFBMQXZmamk3Q0xyWHdNWDBROEJv?=
 =?utf-8?B?TW42NlBreGZaZGRvLzhsSXp1TkRGQWw1bEcyT3FONzVVTGRNMnJUU0hWZ281?=
 =?utf-8?B?dko3VWJqWVRQT2tHRjhnb1JmWWhldFJoUENnaFI5S1N5VTBleFVYS3Z2ZHdE?=
 =?utf-8?B?ZWIzRlIyTU15dzV1R1R4VXlvdVpUdUxoeG5BczdxVmJQUzVrZ2VWZG5qUnpY?=
 =?utf-8?B?c0UwcUFDR09EY2xDVFpkVTdTYUNMMGozanZiVGpUQklPV2JFVnBIK3FvMVhq?=
 =?utf-8?B?cDBuQ2VkTlVMWHJ5OG5qNW1qRUV0K0VlT1YyemVjRklSVi8wdWhxdTNOTUZI?=
 =?utf-8?B?azBuNEFhSHRoZVdDNUV6VDFVd25oVlZmNDFkbzdYNDYrS2tQUE1mQWJnZ0Ix?=
 =?utf-8?B?SDFEektDdXdLRk90SWcxS1MxSE9MSXZETU1iOGdJKzlEd0tNak9LN0hGQ3VS?=
 =?utf-8?B?TlVWQ2pQSEdGUE1Cd0Q3RDRKcWwrRUlZUmJHR05tVFFKWkp0YlF0a1JRYVdF?=
 =?utf-8?B?RHRMM3RHb1h2SzJXdUpYazFiWjhoWExrdGwyZW1BV1lJUDlRZHhHeGZKVGMr?=
 =?utf-8?B?T1BMTjM1RWdUdlpGYndVNTBqODNNUElhY1ZBRXFza2FaZlJjV1g4bERaN0JC?=
 =?utf-8?B?Z3MvRDJ2bzZYaDZaR1B6VXczTnQ4NmlCQ0FzOEdyRjNQb2RZMDVvQnBDSjln?=
 =?utf-8?B?UHRoWkE2eStaeFM5VDA4amZBYTkwN0kxVEtFQ1RvcjJkTnp0ZkQ5eGU0V05i?=
 =?utf-8?B?QW9NK1lKK1V0U3J6U2ZwQmFPbEl5TEM3MlZDbnd0VEJuL0dDM2QzcGJWL2xW?=
 =?utf-8?B?NjQ0OGFKTGNEQ2xKNjI3L0cwMEhOWUk5a2FMZkJlbzZIc0JBeHI2RDAyY2Zl?=
 =?utf-8?B?aWxLTDlYSTdkZWtHcU9vZE5rN1JocXFVZmp4bmNiU3RHUFN4cGh1T0c1cmMw?=
 =?utf-8?Q?RoUWgsfuBqa+krcuE0xi6nN/O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ff7ecb-6600-4e50-b70b-08db0f648090
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 14:54:13.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8fonOxPpJgfbBVcgTEhbvtZ0Tsa09VoFzQVkSRANZSP0SWC/+1ji6cTuUPNT9XXaQ80XA7arwcQ311EodttQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9489

While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
applies to guests also when run on a 64-bit hypervisor: The "extended
CR3" format has to be used there as well, to fit the address in the only
32-bit wide register there. As a result it was a mistake that the check
was never enabled for that case, and was then mistakenly deleted in the
course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
CONFIG_PAGING_LEVELS==4"]).

Similarly during Dom0 construction kernel awareness needs to be taken
into account, and respective code was again mistakenly never enabled for
32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
5d1181a5ea5e ["xen: Remove x86_32 build target"]).

At the same time restrict enabling of the assist for Dom0 to just the
32-bit case. Furthermore there's no need for an atomic update there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was uncertain whether to add a check to the CR3 guest read path,
raising e.g. #GP(0) when the value read wouldn't fit but also may not
be converted to "extended" format (overflow is possible there in
principle because of the control tools "slack" in promote_l3_table()).

In that context I was puzzled to find no check on the CR3 guest write
path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
of the low reserved ones) could observe anomalous behavior rather than
plain failure.

As to a Fixes: tag - it's pretty unclear which of the many original
32-on-64 changes to blame. I don't think the two cited commits should
be referenced there, as they didn't break anything that wasn't already
broken.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
     unsigned int   partial_flags = page->partial_flags;
     l3_pgentry_t   l3e = l3e_empty();
 
+    /*
+     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
+     * understand the weird 'extended cr3' format for dealing with high-order
+     * address bits. We cut some slack for control tools (before vcpu0 is
+     * initialised).
+     */
+    if ( is_pv_32bit_domain(d) &&
+         unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
+         mfn_x(l3mfn) >= 0x100000 &&
+         d->vcpu[0] && d->vcpu[0]->is_initialised )
+    {
+        gdprintk(XENLOG_WARNING,
+                 "PAE pgd must be below 4GB (%#lx >= 0x100000)",
+                 mfn_x(l3mfn));
+        return -ERANGE;
+    }
+
     pl3e = map_domain_page(l3mfn);
 
     /*
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -490,12 +490,12 @@ int __init dom0_construct_pv(struct doma
 
     nr_pages = dom0_compute_nr_pages(d, &parms, initrd_len);
 
-    if ( parms.pae == XEN_PAE_EXTCR3 )
-            set_bit(VMASST_TYPE_pae_extended_cr3, &d->vm_assist);
-
 #ifdef CONFIG_PV32
     if ( elf_32bit(&elf) )
     {
+        if ( parms.pae == XEN_PAE_EXTCR3 )
+            __set_bit(VMASST_TYPE_pae_extended_cr3, &d->vm_assist);
+
         if ( !pv_shim && (parms.virt_hv_start_low != UNSET_ADDR) )
         {
             unsigned long value = ROUNDUP(parms.virt_hv_start_low,
@@ -594,7 +594,10 @@ int __init dom0_construct_pv(struct doma
         vphysmap_start = parms.p2m_base;
         vphysmap_end   = vphysmap_start + nr_pages * sizeof(unsigned long);
     }
-    page = alloc_domheap_pages(d, order, MEMF_no_scrub);
+    page = alloc_domheap_pages(d, order,
+                               MEMF_no_scrub |
+                               (VM_ASSIST(d, pae_extended_cr3) ||
+                                !compat ? 0 : MEMF_bits(32)));
     if ( page == NULL )
         panic("Not enough RAM for domain 0 allocation\n");
     alloc_spfn = mfn_x(page_to_mfn(page));

