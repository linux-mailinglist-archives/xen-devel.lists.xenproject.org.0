Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F331773971
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579519.907535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJIL-0004ta-BC; Tue, 08 Aug 2023 09:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579519.907535; Tue, 08 Aug 2023 09:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJIL-0004qT-7S; Tue, 08 Aug 2023 09:46:29 +0000
Received: by outflank-mailman (input) for mailman id 579519;
 Tue, 08 Aug 2023 09:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTJIK-0004XQ-21
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:46:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7199e127-35d0-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 11:46:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 09:46:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 09:46:25 +0000
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
X-Inumbo-ID: 7199e127-35d0-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsQbHyK8371hUpUCjQ2h6kvc8HkwF3y7Z9LtBlQWjIa1MaZJULl6ReeSxv4LWLAxb/MY/cCBpFxAZ6wnvVl6hxh6y9oakyCAL3wPzWxsqlJwq/DnvnEm8/Ri9Tsd0GMTNq9GUx1oWHwLnWzt6KcUCXLstX7rlG5M29ekNO6Lng0TmWHLPcx1RRcFnGm+SbJENil5LHk/S+YvKXqhUvayu/6bBtv0X4s9awc8l+7a62WSpXjXH3gkXyo9FaoDz8PLxbr9sfXh0fPXhPB8WBAnfsL4O/O55NUDgT5zuaaCJ2ncAT0S3Tgy9noyFVIoFCduiJQdNKpXH1z4E2DfKZVXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVrFtQxpqHFMm4qDt7dXEN4BfK0cHrftLblwpSh5cH0=;
 b=TXhsNkxj0pcrYayCxGnboHo0BOIAsIvvY3yKTqP7r0PhFrkawwCPsSfRjfAU1kElAu8oN8Ww/5Ke39+IBZUFhn6lKyhZH5Z2pH6PEgHJgN9xkbmufoUUQxLOO6/iNv2ql1MKANK6vurGLRkFj0DFQHJldBb3y8djQR+uwWRZS5a5708jo/neEV8Uq/IrBM5uUJSociq7SSTvChne4CWr+D3ZFu6wJt7LOr6KUbIfJvSxBGzDVDYpnbin0zQKLMM1t+kzveeiXUnl75YOMcP/gHftHuJbEa70KBdow8HO9ZYBn+eDRgxi1cJ1KqxIfyPlGAImbRiHIesvQpolp3pH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVrFtQxpqHFMm4qDt7dXEN4BfK0cHrftLblwpSh5cH0=;
 b=Su0FHVYqDlZKYxTe11zbOkJlub8bMKdXITFuM5Du9ptsTYnjhrTqzuCV+sWP/xkY7W5WCFVOB7QvKjZ0e1KazFQtuglGyucDfB+O5NHgRMYeLNhYilnKTin7b7Su9/zYWkUJKwLo+LgpD53TH8Ocbv6rJfMyE3iecU1O+crWwJuGxSWbibpJfI2iLsw1TmALtD2HfWt6D4ISfHOfB92DEP9eGPJ4JUM4WYFo2+vqbj2Uo9ACvdQFbmzydH/mPcPXsylIJB2JFpqrTdTvfohk2E/3gN28zLzFhdzNQkCJex/zuxRt3NZ5v3uxN2s9nd/YTetOk69cQ/jINQ8mBFrtGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
Date: Tue, 8 Aug 2023 11:46:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] move __read_mostly to xen/cache.h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 24628a65-1c93-4ddc-4ec5-08db97f4550c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZtLsTheX+PuBQyB/isMq0GkEsyY09jQbKY3AsayPlfoKdDGWCFLoQugUUu26z7T8SkweCtd3HMMA0/tRFPDOzfMeK1nsWTe7uBiFqsVv4pPgLTLZcFNc7yU832WjPGdA21WkHk0bmW3bZiQXcVceSBaoH05MLMY9/OaCuvGZ3FE4JiHIyUq4QuvyAXXrl3G1tS8IDNaSDip6yvKrxEDo9mwpZ6arQJUFTf0vdO+YZzf5A+X9QEqrY6QexD8Ktm1KgqG7/dv0zSxt1pbAki09vcWo30LvbvH714yoy2mdgWtdChwT36lycuSPUlHGyXqi43hC7xlKrc9IJVSqOrVOqRCrulKfWFuwWlyaLGjJk/P65d2MMD1hwmhTnox4dhr3osO6z85p1pyV5QXtkGvbmaTWXshgsMUXKf8ZJn43/5T4E50P6ZEbR69zFIvOCF5VudASV3byeGkGLsomCQWvcHwlFyZqwYI9hpJHNUn2dwTziPIc09wcH9MMrIxE2b2NhCeVb7mx+HaKWZR0uYf3fnl+bQeG5oe12i5FqsEgiaoBUHFH1LXS2wgvfNoS0gPmuDHc5p3c/t9T6Y0VFXDB4LF7v/WP80io+ZzKk8milNsuyurrpq9MFcRBvCIWOpPrpQ7CB1Ctb5cZAgtMVFAGWHzR/8ITJfese/4kbpqm1t5ACirBYNkNDnLCaC1WrX+z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(186006)(1800799003)(7416002)(8676002)(8936002)(5660300002)(4326008)(6916009)(41300700001)(316002)(83380400001)(86362001)(31696002)(2906002)(6512007)(6486002)(2616005)(6506007)(26005)(36756003)(66946007)(66476007)(66556008)(45080400002)(478600001)(31686004)(54906003)(38100700002)(45980500001)(30990500010)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2pFTGt1N1RRTEdxSlJCUllBNzgwNnViaFpUYXBYMHFSM0lSMkx3WkxWNis4?=
 =?utf-8?B?TjBtOERERXZTN3Vac3h3emdmMW8vWnpVSUFJT25jTkM4c3FoWGlwUXZuYStr?=
 =?utf-8?B?VUlKeEZLc3JTTE83NTdEczZIbHZ4T00vMytIMzg4aC9tT3RMZTBLck5OY3kw?=
 =?utf-8?B?ZjFwcnVXUTJmNExxOUVUd1Z0SEN0SVFHWnN5bWFPcUxRQnlEM2hRUGVKbXBW?=
 =?utf-8?B?bHhMNnV3RUNuaDZXTVBhN2M3bEM2RGQrVEt0TnNwMnVNVWZJVHZvTWVoN2N1?=
 =?utf-8?B?NHc1aTJVYUN3b2xDMWpZbk9CWFpUS1ZXcktBMDJTa2JNS1ZhN05VTFZtUjhN?=
 =?utf-8?B?NmtEM0hJNFhKRTA4SzU5RGNlVU1BdUtkNEtmVERXUW84djIyYTRJOTkrMXlt?=
 =?utf-8?B?d2FOTUV4VWN4ZWdva0RNQWk1OFk1Z3UzT1pXd3BVdW1Vam8ybFlSN3BVRnNo?=
 =?utf-8?B?SVdJTU1pT2FUWEhFRnRmY085TWFsZ05pVjNjZ3hIQytlTnduVW1icGlYWHl4?=
 =?utf-8?B?RGNYKzJVaEpOYWxLZndrd0oweURGOG9ubzhaY3M0V1l5allVajRjZHlIKzFN?=
 =?utf-8?B?b3liUDhBUlIvaVB3d2VUVnYyOW9EZy9ES01wbGVJbXgxMWhCUlRPdE1sMUMw?=
 =?utf-8?B?ODhXZnlFbzRVNVhKcXlLSkI5bjFFWlBWaHRlSXAvR1N6VnVzSzQ4eGZUT1RU?=
 =?utf-8?B?MmpFOGttR0crL1VmRmZhamdidzhXdmVPdTBBT2ZVSXZheHJTVDRuN1dXK1o1?=
 =?utf-8?B?MXZ6Z0l5TW1PbjNnUnlGNTduN3NIME1TREN3TkVEa2xxdWZaYlQxZ2lDUFVW?=
 =?utf-8?B?eHdsUkMwOUoxTUJzNUJKNWlaNkxNS2s0RDJ6eVVZQU03cTBXTXVIdkYwZlN5?=
 =?utf-8?B?NlZHSGFmdHNOT1FQaTRZUVhrY2Z5a0JQcVNtdEZjaHBGb3BSY2kvdUNCdnB1?=
 =?utf-8?B?R2lUbE03MFc3ZTBEQVJ0SFFzcHRNR3E0eWxrNCszQXFIS1FhbS94STVsSmNL?=
 =?utf-8?B?OEpyTlExSmQ3b1hvdkt5eDg1dkRJeTZKZ2JXdWx5VkVNRXh1KytDdEFCemxl?=
 =?utf-8?B?RnFsUVJ0KzNYK05QMFdWWkU1akx2QzF4Wmg1Nkt0R0tTMnhRYVV4NDUwL00y?=
 =?utf-8?B?d2tEWEZCL0pGaXRxak1QMjlaNDBpQmNGelJVSnNyRno0QWlSWVdMZ3hRNkh3?=
 =?utf-8?B?Mkt4UDRVZlZGUmozVEpsZTVKK25Ta2dzT0JVMGFsdGQvVzZBRGl0WWM4ZE5R?=
 =?utf-8?B?dU1wa1BiMVRRakh2amJNNlo3dDMxK1Z5Mktib0YrWVNhWDlLbEVWVnNyN2M2?=
 =?utf-8?B?WEJBdmlrSG5scW01ck9JVEw1TWpwek1uTEtVUmZCbGF2SVIxSUNEclk4cVo2?=
 =?utf-8?B?SUt3azF3eWJXSjFyVTZFaDJQYmppTGUvVkFFdk1IaGZhQm00NkZBNDJHSnRS?=
 =?utf-8?B?M2l2UklHd1kyS3JSbE01WEJ0SEVjU2t2eU1nejVlZVV3bTN4VWdrSVJkZDBq?=
 =?utf-8?B?dStjbkYrT2xoZDBzMFVLcU5BdnFISmxkd0NIa0xaUXNCbTk2Tnh4dGV0Z1hQ?=
 =?utf-8?B?VmpQWGRvOXRpNHhzTWYyVXphM0JUZXhzeDI5dkVaeGxKcHRZYjVta3VhRXF5?=
 =?utf-8?B?MEFGYkw5djNkckt1YndTbXJya3pabEpveWExMEsxMnEzYkM3c29La3cvZW9F?=
 =?utf-8?B?UG90Vzd1Q0hQdjBpTkhnN2I1K255Mkc3ZWlHSXp4L2NZTkxtRW1TdHpMb0FV?=
 =?utf-8?B?ZFRZa25JS1gyN1B0VXNrK2ZsNE1kK3Rxcy8vcHkrUzI3ZmNzcFhJNzRyckth?=
 =?utf-8?B?OUVrdzdwSWU3Y2I2NnNFTDNTWHlJOGx4dWZ5ZjhDTXFCTldRdlBGRDhocGdm?=
 =?utf-8?B?MDJMejArOGtodmp2Z0prYlp1NTlzZjg4K1c5L2pPdzZrYVc2TnlpcjIzdDR3?=
 =?utf-8?B?c2k2eUY4MGVHVDAveTdyRVhueEUyWjJjck80dzBBcWplMUhyVDAyKzBkUVVN?=
 =?utf-8?B?b211azZwUjAvTExTY2JXVkE4MVVZcVQrN0RCUlNNaUVXYndHZVE5WnZsZmdt?=
 =?utf-8?B?ZCt4ZHlJQmQzUUhsV3JwWnM2cDlEaG9PWjdNZnBxaVJ6TmdSUmhYWGNQTGxJ?=
 =?utf-8?Q?MjVJC4+K2lssM3U6hamPIGewS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24628a65-1c93-4ddc-4ec5-08db97f4550c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:46:25.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5Qa+SdjgpvN8/r6BQ1V4xLbWEGLQb99h3v+6rTfai70EE8dvhbjUAM08I9mXpqc/M7XNmFkFQiZDjpL74l1yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446

There's no need for every arch to define its own identical copy. If down
the road an arch needs to customize it, we can add #ifndef around the
common #define.

To be on the safe side build-breakage-wise, change a couple of #include
<asm/cache.h> to the xen/ equivalent.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/cache.h
+++ b/xen/arch/arm/include/asm/cache.h
@@ -6,8 +6,6 @@
 #define L1_CACHE_SHIFT  (CONFIG_ARM_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES  (1 << L1_CACHE_SHIFT)
 
-#define __read_mostly __section(".data.read_mostly")
-
 #endif
 /*
  * Local variables:
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -34,13 +34,13 @@
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <xen/acpi.h>
+#include <xen/cache.h>
 #include <xen/smp.h>
 #include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/param.h>
 #include <xen/trace.h>
 #include <xen/irq.h>
-#include <asm/cache.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/hpet.h>
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -7,11 +7,11 @@
  * Copyright (c) 2003-2006, K A Fraser
  */
 
+#include <xen/cache.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
-#include <asm/cache.h>
 #include <asm/flushtlb.h>
 #include <asm/invpcid.h>
 #include <asm/nops.h>
--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -6,10 +6,10 @@
 #include <xen/cpumask.h>
 #include <xen/string.h>
 #include <xen/kernel.h>
+#include <xen/cache.h>
 #include <xen/ctype.h>
 #include <xen/init.h>
 #include <xen/param.h>
-#include <asm/cache.h>
 #include <asm/fixmap.h>
 #include <asm/mpspec.h>
 #include <asm/apicdef.h>
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -6,11 +6,11 @@
  *
  * Copyright (c) 2019 Microsoft.
  */
+#include <xen/cache.h>
 #include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/types.h>
 
-#include <asm/cache.h>
 #include <asm/guest.h>
 
 static struct hypervisor_ops __read_mostly ops;
--- a/xen/arch/x86/include/asm/cache.h
+++ b/xen/arch/x86/include/asm/cache.h
@@ -9,8 +9,6 @@
 #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
 
-#define __read_mostly __section(".data.read_mostly")
-
 #ifndef __ASSEMBLY__
 
 void cache_flush(const void *addr, unsigned int size);
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -1,3 +1,4 @@
+#include <xen/cache.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 #include <xen/errno.h>
@@ -8,8 +9,6 @@
 #include <xen/elf.h>
 #include <xen/version.h>
 
-#include <asm/cache.h>
-
 const char *xen_compile_date(void)
 {
     return XEN_COMPILE_DATE;
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -15,6 +15,7 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
+#define __read_mostly   __section(".data.read_mostly")
 #define __ro_after_init __section(".data.ro_after_init")
 
 #endif /* __LINUX_CACHE_H */

