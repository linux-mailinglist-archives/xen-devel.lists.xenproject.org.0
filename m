Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36A6F5B44
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529312.823590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEUQ-0007AV-1d; Wed, 03 May 2023 15:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529312.823590; Wed, 03 May 2023 15:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEUP-00078G-V9; Wed, 03 May 2023 15:33:57 +0000
Received: by outflank-mailman (input) for mailman id 529312;
 Wed, 03 May 2023 15:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEUN-000715-TT
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:33:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d48b08-e9c7-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:33:55 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7498.eurprd04.prod.outlook.com (2603:10a6:10:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:33:53 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:33:53 +0000
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
X-Inumbo-ID: e9d48b08-e9c7-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Osh+id0j45zfZXNwwHYouI5WHcCjfXcW/PyhDXbQXBsTt22k+zb9dvmqUh0qb8/gJpX49M+717kFrQpfsxD4+zEjGH28AxGPjcDXZRf7B91Sdp46bA8jKrHKjKo0T2ForzHKAis1oWD687NmykAO+8nyLPd3VYIlavX/tUeSpWmlOQVrU1RksTJnk94eScXQstVvafNxxH11XSLNEI8zTyYWUYMYdmivRB7v/66vuSZhqReKu5UGjhbNtxD1TN4zeyoVxapi5UTkRTzyxdRWh8HIQp5njCtIyfqTfkLD01m3SIzWucl/UfXoPIk+OpgA7kYrO8ok3N6HU4M2tAaYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Stzvh+MzN3TPUQsXG0ZEOGdaQBSL5CX/KwjgUIRxmE=;
 b=XNIvxcwah0j0y5meDtGSTvbuPRRZaltVoJGZABiv4ebymhF28ftVLne/3HN9SLCXTFVwbqHDqlEICGRfq6yrE0gsoquglqbRg33k/OME9bJ0VswsZUBkprlPKPSXQOj91Q/4nezcAzaMl4Noob+DJQVCjhPWv0jk6SJbflqF/MnvmW7tJ3e2KsBpyehb80qv5rgfHJNKMmN96/71pFcNH5rzXx2vIXAEl+5vXXhRRrJWFR2yMiZ67yOW+HYWpQLft2edyQd/TE7UMohdLHQKjnEybuSIY4RhiOkTzSEfRBwQqQX1MQQa7pzTPaYceVMHFSevJSspkKIv/4hNjOi1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Stzvh+MzN3TPUQsXG0ZEOGdaQBSL5CX/KwjgUIRxmE=;
 b=WSCpiCM0pwYb3is2V7/KjC/dXNtG/1sAm2BHuO7hURtLJlMZ62T22xzj6NV2xR5rgptr76qpkDYNo7UA8l3w1gQWD7MxxHYkO6xy2INWmLylU4M35sKmQqjzouqPyVdlXXOsOvcXjRS2MueZbCaWqmq79j1DQK9oJQ70v+wYojnHdUaGH38KefhKWmxCb5hjU3pYDdOQQBKmDUqzhzdk3UAzLp/lXOZtBTqSn1UYUyv8HepHNo+B5JV17VCG9bkaug/bpDltBs/Y2ovnMt9pjCy6uAM8k0dvQduAf6SwNsMO492AuxOcj/IcoyL9OT2MpIaqBVf8FSbN7+J4IWkv1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9425d47-dff8-bf1e-5310-afbf834b8366@suse.com>
Date: Wed, 3 May 2023 17:33:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 2/2] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
In-Reply-To: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab24165-e4b5-4636-bd4c-08db4bebcd02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	leDVpWvs0zltC/Ydikt60yEb5v24ta6p02297aWXobICp5wlrY8ahIQCAWWMGoAwPtzog8ZsVA03Wa3IIsn6tLDUf7/9Q+95p4OQ/wNGiL/nsbR/Ch+MLBiKgJ5f+vYv5dcBT4DbVi7Al0aua7QCrHLOE0m1zRXp62gPfA3ZGGl8KY1s81zDO2jVMWZcNIboRb/HSolJl1zq5aQRcxROafTKwjtTi+AfGOTJdsy6inexFh48GbL9Bw9Xzqz9Nb2iocKUnd7rl/48yZSe8954gBXACcB7L6AAw5RFWBVjfqAOfypyXDjcG/tKog/+JzfiLThwKKsc2bxKkGLbMTrT+qloI/9yPBGaq2StcE0L6b8YcjF+LWcRiG3RcNgmrv2HlGtqKTBJ3sD0J+cefabBut1VXzVvvvJ08XK1H/FQ40HJGkjQHu/3bFOCBXXLHDjAGfLwF6QqYNEKPx/r9rwUZ7xIgvp9Vouzdcura2/qMDEWsnLqmWHFlG3661i7mk/ofELMz1nM7xyImamS7032MsxuQATPC6xtkmFKE88hma3eP9a7ekjx3oxG0D+4hkkKjBAge0LBnZz3v3nEvhrP7o50acptyY+6KicwTBgmHcpGvhdrPkz0inLe3LxkGKdipuhDEg18TGq0k6bXRzoGggfkSbssihQ2Z7txnbdc1eA7gDqsX3tUEb8zDYwLPvxaJsAha4PVxNkYx5Y3Kafhcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(2906002)(38100700002)(83380400001)(2616005)(26005)(6512007)(6506007)(186003)(6486002)(36756003)(8676002)(8936002)(5660300002)(86362001)(31696002)(478600001)(4326008)(6916009)(54906003)(316002)(41300700001)(66476007)(66946007)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVwb0R3ZVN0OUdZd3gvMkovN04wM2xLUXRmUmY4ckRwbDZiUmZmQ3ZZMnRT?=
 =?utf-8?B?dVYxVmEwTTNiY2dvNGNsVmxrZThIc3hqeHZvZkxjdHdOYXU1RXBvZURLa0xj?=
 =?utf-8?B?OGZlT0VmYW52eE9KNHgxSjBQemZpWk5PaG5vUHdTVVpaSVo4c3VWWGh3OHlp?=
 =?utf-8?B?YkJ3blZna3ovR0dmN0tjOE9hMUc2Z0dYMkc2bzg4cURqM3FtSXZqR0ptQkNn?=
 =?utf-8?B?cGZ6cFY3RjNhWjJxTUtleTVSQjBVZzZIQmZSblRuWmluTjV0bEhrdlFxZ1ZV?=
 =?utf-8?B?QVNVei8wQnVhNHc0MVcwd0hhYUE4bUh4bWhFU2Z4RXBLQmM0ZXVmWnNXeHAz?=
 =?utf-8?B?b3JObG0xS3RTRTAzME8wV0FYa0taZ2d3MnZLU0o4aDROSjRSTGE0WFBuTDJD?=
 =?utf-8?B?bnNGcUliYVNsRmZxaUpXUC9EZ0REYzJDV2RkSisvUzIwUmdKbUhCRXFQNG1U?=
 =?utf-8?B?VWRkRno5cXVDQUlSYTJtSXlEMDNCaWs3eHZCK1JlaHV5cVllbllkL0lULzJP?=
 =?utf-8?B?VWpvekk5eXFra0xGcEEyR28vemJrd29xL3JpVDQ2K25lUFJNSVhwa3pkMFNu?=
 =?utf-8?B?R2Q2dUt0dFo3VFlwdU44VHVTc0hQMGc5NjZmQkZGM1lmTi9pZ3l3NG43TUUv?=
 =?utf-8?B?RWh2OThVM2VpcVRleEtBTG91cXVaMTZNSmdUWlorNXcvUGJ4eS9McDRCQWtQ?=
 =?utf-8?B?MUoyUGU3MHNzeklVSzVjZ1NNTnZXNnA5QnhXcDNCRStSRnc5U3BnUi9PRVZx?=
 =?utf-8?B?a0xtZnNtT0Z6eHpsQ2xFb01WaGt1RW1aNkJlMGZILzdtb1RDOTQzREhhUzJ3?=
 =?utf-8?B?RVlKR2ZvbWVhdTBBMmJjcjFxSDFLVE1kb0VWUFZnVmdyZ00xYk1zUXVPMDNw?=
 =?utf-8?B?ZDgzNHA4TExUMmwvdHY5elgzZUpYU1pDOHRURktBV3N2YkxYcEZQLzdKSU1w?=
 =?utf-8?B?R3lEVjlkeDh6d0FVeHdyU2dCUDh3Q2lZZEh2WnBEV2RhK01zVFFTay85NXN3?=
 =?utf-8?B?UU85bldaYzFsb3VlWE94MGQza2YrUit5aGV0MUt1SVJIMHJHNHVkbkQwdFVu?=
 =?utf-8?B?cWhtNnVQYWRxS08zOVY0TEwwTmdHRUlUWktSbDdidlA1MzdiT3BMeVRyM2da?=
 =?utf-8?B?dC9LcGgxeDlOOHBRMml2cjNTWGxyZVZtMjdIQkxna2lXcWFpVE1xSkFabzRB?=
 =?utf-8?B?MFN6TVRHUWRCakV1NEgrMUhtc1A2VXAzWERlM3FRZ3d5Qm96UGVmUFNLejls?=
 =?utf-8?B?QVd5b0p3TW5iQ0JZNkJ6QkNJdFZaSmhENUF0UW4yaUJocWhJTFFWbUp5TFUy?=
 =?utf-8?B?YndUMWh1L1lzS3NKeHJOaUZKdk9leEFCVU4yN1dnRjRXRzRTa2ZxUXBORVdM?=
 =?utf-8?B?S3I0Y0Uvd0t1YjE5YXQvNlAxaVlUZm10WFp4YU9wNWtaZER2QU9XaGp6UHBE?=
 =?utf-8?B?SjFKQU81U0NjZmZEbmhGSDl0TTR1NkV1eFF3ZndEQTVUZzRZNW55ZFowQnlZ?=
 =?utf-8?B?MUphWDY5bjRnOWN2MU9qMU5mamJ2Vm9hUzBDZ1pVWE5LelRNWkdOU0I5clJk?=
 =?utf-8?B?QVFzbzRZMTdkdW1NSzV2NWdHRkdNOUVVamt4cWFKU2VuYXJvUjlTNjhISWcv?=
 =?utf-8?B?YjRUYWhTVktyZ2IwOHJYYTU2eGJadkVTeUJlL2V2eGoxdCtraEFXczR5REZS?=
 =?utf-8?B?a3FEU1p5ZE5IYkg1QmszWTlZM1VyRE0xVVZQUUh3QXo1QzdXclpabVJjcFMz?=
 =?utf-8?B?R2RBT09WMW11aUpuWWRxTlN6WVJmU25Pb0ZYS1NCVGprbUlYYS9Cdm1vV1Vw?=
 =?utf-8?B?cG54c1oyV0hGNnYyS28ybHpsNGdjVkxtWGNyV3R4SzRMSnhHSFZFalpXUnNB?=
 =?utf-8?B?NnVNMElEUEdWdmMyVHpjaW5YVXRiQTZEb0pDM29WVVR3SzJLY2dlcncrU2JI?=
 =?utf-8?B?dExBUmwwY1VwbHdTamR4aTJBRmRNT2xORlJyT21qaFJ0VERKeGl4eVcxNWJ5?=
 =?utf-8?B?NjFTOUlVWE1NcDVJQXlaeGozSHpDM1hPd3BFNWlyRUpQSE9jWE5BQU16ZnJl?=
 =?utf-8?B?Q28wWWVBQ3J3aEtJdmdHdzh2OHdQbmpNSy83bnhnV1ZBR3FsY2hZb0N3aUE2?=
 =?utf-8?Q?g6DE0DOb7vWi951dVVcTjWMKl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab24165-e4b5-4636-bd4c-08db4bebcd02
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:33:53.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qSKEzYxXp5UlJBs3RLCbphf7RVbJrX2cagk/opAjDZKWg6seXFDKXD31QlFJmdfcNh9yXf6qaWqAgOnMm9RNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7498

PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
more than 32k pIRQ-s can be used by a domain on x86. Document this upper
bound.

To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
parameter type) and setup_system_domains(). This is primarily to avoid
exposing the two static variables or introducing yet further arch hooks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
used. That would make the connection to setup_system_domains() yet more
weak, though.

Passing the domain pointer instead of the domain ID would also allow
to return a possibly different value if sensible for PVH Dom0 (which
presently has no access to PHYSDEVOP_pirq_eoi_gmfn_v<N> in the first
place).
---
v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
    only. Re-base over new earlier patch.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1130,7 +1130,8 @@ common for all domUs, while the optional
 is for dom0.  Changing the setting for domU has no impact on dom0 and vice
 versa.  For example to change dom0 without changing domU, use
 `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
-hardware domain is architecture dependent.
+hardware domain is architecture dependent.  The upper limit for both values on
+x86 is such that the resulting total number of IRQs can't be higher than 32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
 to use the default.
 
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2665,18 +2665,21 @@ void __init ioapic_init(void)
            nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
 
-unsigned int arch_hwdom_irqs(domid_t domid)
+unsigned int arch_hwdom_irqs(const struct domain *d)
 {
     unsigned int n = fls(num_present_cpus());
 
-    if ( !domid )
+    if ( is_system_domain(d) )
+        return PAGE_SIZE * BITS_PER_BYTE;
+
+    if ( !d->domain_id )
         n = min(n, dom0_max_vcpus());
     n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
 
     /* Bounded by the domain pirq eoi bitmap gfn. */
     n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
 
-    printk("Dom%d has maximum %u PIRQs\n", domid, n);
+    printk("%pd has maximum %u PIRQs\n", d, n);
 
     return n;
 }
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -664,7 +664,7 @@ struct domain *domain_create(domid_t dom
             d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
         else
             d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
-                                           : arch_hwdom_irqs(domid);
+                                           : arch_hwdom_irqs(d);
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
@@ -790,6 +790,24 @@ void __init setup_system_domains(void)
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
+#ifdef CONFIG_HAS_PIRQ
+    /* Bound-check values passed via "extra_guest_irqs=". */
+    {
+        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
+
+        if ( extra_hwdom_irqs > n - nr_static_irqs )
+        {
+            extra_hwdom_irqs = n - nr_static_irqs;
+            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
+        }
+        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
+        {
+            extra_domU_irqs = n - nr_static_irqs;
+            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
+        }
+    }
+#endif
+
     /*
      * Initialise our DOMID_IO domain.
      * This domain owns I/O pages that are within the range of the page_info
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -173,8 +173,9 @@ extern irq_desc_t *pirq_spin_lock_irq_de
 
 unsigned int set_desc_affinity(struct irq_desc *, const cpumask_t *);
 
+/* When passed a system domain, this returns the maximum permissible value. */
 #ifndef arch_hwdom_irqs
-unsigned int arch_hwdom_irqs(domid_t);
+unsigned int arch_hwdom_irqs(const struct domain *);
 #endif
 
 #ifndef arch_evtchn_bind_pirq


