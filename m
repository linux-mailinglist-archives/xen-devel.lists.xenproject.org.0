Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272641D9A3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199827.354113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv25-0005kj-D9; Thu, 30 Sep 2021 12:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199827.354113; Thu, 30 Sep 2021 12:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv25-0005i4-9Q; Thu, 30 Sep 2021 12:19:25 +0000
Received: by outflank-mailman (input) for mailman id 199827;
 Thu, 30 Sep 2021 12:19:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv23-0005hS-O3
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:19:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3aa67a2-b485-4dc3-9a45-2083fd2ca9bc;
 Thu, 30 Sep 2021 12:19:22 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-MhWaNnAmNSCRANtamFCC_Q-2; Thu, 30 Sep 2021 14:19:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 12:19:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:19:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:206:1::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:19:17 +0000
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
X-Inumbo-ID: a3aa67a2-b485-4dc3-9a45-2083fd2ca9bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYYLhi3kHcIFifWyH6tHSRW/l6Pd/aQQC0R+PsIihXg=;
	b=gMacaiA4D/NXTiybMuoD3R2LK3lkTkzUdFnkjPHrqCRORwB5pjqCZMluNzzawD7XVinrB5
	k07K3fAHMnohDDtRBObIKG4YBgrKeMEJrmj4jEEnkJG0Eg705GqD44UI3LDPe9fLN9bgga
	3KowmQ5w15r2hm/J2ac2wDP2TBUwSA4=
X-MC-Unique: MhWaNnAmNSCRANtamFCC_Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQKEa8b2c9PcL+xz/rOcCZ+5r+xQTrEt27WZ3BYew9JbQ8JY/enQ2oeIEDSQAfnNSHcUY5c3ah9epCBcOnHxmI0i645tZ44cbSW2EtWfkp16pSsHhDp+9/bodomxC16wrp3UZb5kERASMSHZ4pd5D8mm9lOT93Ypqp0SvPaF3Z1n6vd1NTWTU71iAdrJiV2W2hmpezPkxPrehV8DCyu3XytLK4kidXOGKhzW1PheISL4MTmcMBsBvCb1/L/dwe1TFmUFKIw+Cx9Wa23XKqXYW2D2Mjx+HhFtGxLBXaZ2QYE0laHU5V+aIBJD+bLWT06JURHgChC2AnwcsVVykumt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lYYLhi3kHcIFifWyH6tHSRW/l6Pd/aQQC0R+PsIihXg=;
 b=jp6MvJL1OYx+3FNgfl1Q+cjuEhEVes4EGbHkRjlzyp2qmmvX4YHlTYljF+LGi0kqHgpB0fJNLqltmBEZVFJl0Z3q8SLJ9PQAB8xCVN5xVK86uy1W/QMYIGDwruFOPuDyC94RJjLOIH+VM1MELaEfF02ZMP3sjdm4tw+CB8XLM+sWcxAFYPXIFNSQBXRURq5RhIhiEkWpJwBDDXWwEkxgxsQZyaoNbLsujgFlJ97e+dcLKJdAz3gzaKQLXAwZYKb4hkPI3mlmveYfHPf6aZNYwaqHSgcvR6aS+gdVOP7y3N+eLYSifglUdE2ZyemlFKw6OCE+Yi8uTybH8bX6ffKD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 6/9] xen/x86: generalize preferred console model from PV to
 PVH Dom0
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <582328b6-c86c-37f3-d802-5539b7a86736@suse.com>
Date: Thu, 30 Sep 2021 14:19:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:206:1::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02da42aa-3468-4345-7ae0-08d9840c86af
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479A1B8A557D70B9EF9E7FEB3AA9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UQAKGfoWrYfKpa+FBNEOEkPTr7Zsjf3Ial7V1xrRocM3R3wqkTyc6nGM+KMMJakrJGb/R+3UQES7nMHyo2TwWKiFOYaDXH1htJbs9M9aYGqcRBK+wO0dDAhSJ+VPrn2Sd/xvIBa8pHywwBRb7VS4BFxk1wTOqcXdqHFtDhzPskBPphvw96DH2QCCFO8AXRxval8EYvK1tw6iNR+MlaOQOPPgHJ2pe4tvn7d2irkq27Dl+vOgg6zTGD4No8Z98oJTFfEhsXzcbt7aEn2jWvR0Vrn/Mr+xRj/Bnb0j9PDkYVbOpKH5QZ45kc88dZ08Rq7Ld5P+tBtVe1E7Gn6bGxXADegorKJM1rK65tPIpYBmsb5XiVXIYkf2H2KP4YgM/ppWeHQRtb5HDR6AO/2KRDBopuuu1sKJ8hNOLHL9zKFHJdOh5EgAXLKRx5OvwuMxRi15sDLL4IcZE/OFQ/BamOAV5QFZO5+q/NzSgiND6y13IFu7vb+meT2VGZ7+5FrS7KcZ5hM9OkVmpzgGlQYK/tsoc14/q7YJhcL8HjVZzM1r0nDo2h43hsLNXG2QuI/mhQ1+Wyp/7VJ6lTK1dF/UwKAWVAJW5dWwvXPyQJNjex1qoxPrq0V0vpK3y3zX797z0wq4bJiEDBedBn7I1NhnVxlb9MR9ZKVDoplb5qDsEt5YLn3oUDV6+TZmdnqqSq3ljTsJ3Guk8CTzhGqXtIBHrlpbmGyDLc1d70X5XUaIgx39nA2ka4L3p/LiR6xBk2gFc53b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(86362001)(26005)(16576012)(508600001)(316002)(956004)(186003)(6486002)(8936002)(31686004)(54906003)(4326008)(83380400001)(110136005)(38100700002)(2616005)(66946007)(31696002)(66476007)(66556008)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDVXN0FvYmttK3FoYnhLdDVnZjEvcHljWkoyKzRCR3ZmeWQ5WU5qMjAxY0xU?=
 =?utf-8?B?bkRabFVlV2wyOTgwZmwvaUNETlloYk0rNUp4czlka205c1Rna1lBUFN5REU0?=
 =?utf-8?B?d3RLSEx4SHo0bTJHWVgwSzhEdWpFR2FjWVNFVFJ1cjhzaGxjVW5VTFNiZ1dJ?=
 =?utf-8?B?eG1TTCt0SWFxTmJPSFhrNjVJZWF5Y3J1eHY1TzZudDBxSHgrbDltL0lzWW5H?=
 =?utf-8?B?S012eW9CeitDVk10amRpdFVtMDVtQmZsaEMvTGJXNW4rWHFzbFYvTWpCcWZN?=
 =?utf-8?B?T0xwM1p4cXFBaXFHeWRyazZCMi9rS2VvaG91YWdTNUlXejRzMENjZlBVRnRS?=
 =?utf-8?B?VjF3MlEvYmxTVysyUFMxaEpDUEFTRUhNQ1hlY3JrZmFVZ0JyMlJzT0NLZHdY?=
 =?utf-8?B?RC9wWTFCSlNwSTgxYjROdTFxWHYzN0NTYVh0MjlPSHNnU2xTVUEzZjNxMnp4?=
 =?utf-8?B?YjFQNkdnNFU4NVBXOWFCcFpiaHNXY3Z1MHA1R2NDam9yQzd0WlhMeTE1aE1R?=
 =?utf-8?B?RG9BOUFHQXI1RXc4d2lCNytGNVJ5UU5WNDMyeHV0OXRPcUFqL2FjZFR2MURC?=
 =?utf-8?B?R01WdTE5bkNZeHowYXc2Q0FjbnJYU1hKc21ad2tzZTA5cGc4Z2tHblEvQWZr?=
 =?utf-8?B?aWYxUXZobldiVzRkWTFxY1lxNnk1UWJPaTI4d1BGdnQwa3I3WlBxKy9nZ0h4?=
 =?utf-8?B?M2Q0djk5VEVCSFpsT2RPTE5WczZ1d044eUlYN29kcG9CS0plYnpvVWpvenAz?=
 =?utf-8?B?UEtjckQySTN1K21GeEROSzVoZFN0NHFuR2lCS2pBdmRRMUFKRk1WczdBUnZ4?=
 =?utf-8?B?SktlSU9QR21WZ1FiSlJLQVU2L2trWWRCaDE0SktTWFlTaUw2aEVUT1ZLRnRt?=
 =?utf-8?B?OGRnbmQzUHQ0MW50Q09XaUtZaWZMYVRQdWtLdGNWcDBBOVB3cHplQkFSM1Zl?=
 =?utf-8?B?QmdrL3ZKd0NGaWNDTWRkcTFsOUU4VDNCYzBxSVQrNEdlNlE3YUlBaTV2aG15?=
 =?utf-8?B?R2lwNnNFZEVmQkxGQ05vSXFPSXRGR1N1Ykk2UTJiT3RUS09TeStmS0NHRnMz?=
 =?utf-8?B?aXBMM1RrUEtES1RycUt2NHpoMTluVDZkK29jK0NpYXkwRWdEM29SMDI0RUt6?=
 =?utf-8?B?Z204ajBsSjJPTUpPRVF3aWpuVmN1cnpvTjZXdisxSi9qSkNMMVgyMk1zNU5B?=
 =?utf-8?B?NEJOUXprWVl4TkpvaGQ5Rm9McHMzR0Y2NUxlRk1mUHVGaE9RVkpNYjBzQlVM?=
 =?utf-8?B?Uk9FVHdoMzNXNGVMNmZleHhMcUJQc2tXd3pNVzlCTU9scUhzZExFZWFob3Ni?=
 =?utf-8?B?WFg5YWM4a3JDT1F1U0JaM0pDeCtaSTlUQW9QUnFYSEdleVRKMnYvd3lkZCtk?=
 =?utf-8?B?cktnOXJpMEFWRWlOdGhERzYySjBDU1YxcjZJOVVBdU5BdFRJRjA1cGU3RTMv?=
 =?utf-8?B?bTZiT3U4N2xHNkFKZnhHUitqY2Rqa3lLUW00bWVpRVNlbW13cnZHd2t4K3JF?=
 =?utf-8?B?ZHB5anl0bzRxV0pidGYrRTRGODU5TlR2c0doTWpRUFg4dnJSYzA5a0xCSkpm?=
 =?utf-8?B?OTdseEVYcE9vR1IxOUovT0E2SDZ3SzdwVXpMVmlTQytURU03MEZRS1NvZVNq?=
 =?utf-8?B?VFlwY2V3N3RqSmV2NzBRbjlCRFhvaDdtcm1jbjVSeHkveE9ISDlxbXFJWHNr?=
 =?utf-8?B?VmdQaHA5YzZjT3liV01VQ3lYUmlUelJlM2dQdDFmU1Z1ZThmd0tnSk9mMWNk?=
 =?utf-8?Q?WnplLGizjskCuU8kEBAwvLH7omgqzT9JRbHTl+K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02da42aa-3468-4345-7ae0-08d9840c86af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:19:18.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uiHMhrvh9IV9SsMOI2PpOt83c2MzEK6QEEyOxwjY3MhC52dEuLOvmdSm1mfolXaM4F39Y166Q3PEag7ZTjOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

Without announcing hvc0 as preferred it won't get used as long as tty0
gets registered earlier. This is particularly problematic with there not
being any screen output for PVH Dom0 when the screen is in graphics
mode, as the necessary information doesn't get conveyed yet from the
hypervisor.

Follow PV's model, but be conservative and do this for Dom0 only for
now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Prior to 418492ba40b2 ("x86/virt/xen: Use guest_late_init to detect Xen
PVH guest") x86_init.oem.arch_setup was already used by PVH, so I assume
the use of this hook is acceptable here.

Seeing that change, I wonder in how far setting xen_pvh to true only in
xen_hvm_guest_late_init() can really work: This hook, as its name says,
gets called pretty late; any decision taken earlier might have been
wrong. One such wrong decision is what gets added here - preferred
consoles won't be registered when taking that path. While adding a 2nd
call there might work, aiui they would better be registered prior to
parse_early_param(), i.e. before "earlyprintk=" gets evaluated.

I also consider tying "detecting" PVH mode to the no-VGA and no-CMOS-RTC
FADT flags as problematic looking forward: There may conceivably be
"legacy free" HVM guests down the road, yet they shouldn't be mistaken
for being PVH. Most of the XEN_X86_EMU_* controlled functionality would
seem unsuitable for the same reason; presence/absence of
XENFEAT_hvm_pirqs (tied to XEN_X86_EMU_USE_PIRQ) might be sufficiently
reliable an indicator. Question there is whether the separation
introduced by Xen commit b96b50004804 ("x86: remove XENFEAT_hvm_pirqs
for PVHv2 guests") came early enough in the process of enabling PVHv2.
Plus I'm not sure a HVM guest without pass-through enabled couldn't be
run with this off (i.e. by relaxing emulation_flags_ok() and having the
tool stack not request this emulation in such cases).

I think the approach here might be equally applicable for DomU, albeit
potentially pointless (i.e. dropping the conditional might make sense
even if simply benign there): A PVH DomU ought to never come with a VGA
console. Yet even then a dummy one may still get registered and would
take precedence over hvc?

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -3,6 +3,7 @@
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
 #include <linux/memblock.h>
 #endif
+#include <linux/console.h>
 #include <linux/cpu.h>
 #include <linux/kexec.h>
 #include <linux/slab.h>
@@ -18,6 +19,7 @@
 #include <asm/xen/hypervisor.h>
 #include <asm/cpu.h>
 #include <asm/e820/api.h> 
+#include <asm/setup.h>
 
 #include "xen-ops.h"
 #include "smp.h"
@@ -274,6 +276,16 @@ bool xen_running_on_version_or_later(uns
 	return false;
 }
 
+void __init xen_add_preferred_consoles(void)
+{
+	add_preferred_console("xenboot", 0, NULL);
+	if (!boot_params.screen_info.orig_video_isVGA)
+		add_preferred_console("tty", 0, NULL);
+	add_preferred_console("hvc", 0, NULL);
+	if (boot_params.screen_info.orig_video_isVGA)
+		add_preferred_console("tty", 0, NULL);
+}
+
 void xen_reboot(int reason)
 {
 	struct sched_shutdown r = { .reason = reason };
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -28,7 +28,6 @@
 #include <linux/mm.h>
 #include <linux/page-flags.h>
 #include <linux/highmem.h>
-#include <linux/console.h>
 #include <linux/pci.h>
 #include <linux/gfp.h>
 #include <linux/edd.h>
@@ -1392,12 +1391,7 @@ asmlinkage __visible void __init xen_sta
 #endif
 	}
 
-	add_preferred_console("xenboot", 0, NULL);
-	if (!boot_params.screen_info.orig_video_isVGA)
-		add_preferred_console("tty", 0, NULL);
-	add_preferred_console("hvc", 0, NULL);
-	if (boot_params.screen_info.orig_video_isVGA)
-		add_preferred_console("tty", 0, NULL);
+	xen_add_preferred_consoles();
 
 #ifdef CONFIG_PCI
 	/* PCI BIOS service won't work from a PV guest. */
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -36,6 +36,9 @@ void __init xen_pvh_init(struct boot_par
 	pfn = __pa(hypercall_page);
 	wrmsr_safe(msr, (u32)pfn, (u32)(pfn >> 32));
 
+	if (xen_initial_domain())
+		x86_init.oem.arch_setup = xen_add_preferred_consoles;
+
 	xen_efi_init(boot_params);
 }
 
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -118,6 +118,8 @@ static inline void __init xen_init_vga(c
 }
 #endif
 
+void xen_add_preferred_consoles(void);
+
 void __init xen_init_apic(void);
 
 #ifdef CONFIG_XEN_EFI


