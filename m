Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A33432EF7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 09:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212797.370816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjDv-0005k2-Br; Tue, 19 Oct 2021 07:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212797.370816; Tue, 19 Oct 2021 07:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjDv-0005hQ-87; Tue, 19 Oct 2021 07:07:47 +0000
Received: by outflank-mailman (input) for mailman id 212797;
 Tue, 19 Oct 2021 07:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcjDt-0005hI-FZ
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 07:07:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc409989-b4cd-49f0-b490-c1d62260e4fb;
 Tue, 19 Oct 2021 07:07:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-z47IlcbzMImtJOKQMPbZDg-1; Tue, 19 Oct 2021 09:07:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 07:07:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:07:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0201CA0015.eurprd02.prod.outlook.com (2603:10a6:203:3d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 07:07:41 +0000
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
X-Inumbo-ID: bc409989-b4cd-49f0-b490-c1d62260e4fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634627263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2z360L9um9kv6KI2fQQvUHzI9KCJe9yeHC5hFK8unxY=;
	b=jqko8vRBtlTAE8XcEqCGNatojP79Zzb7bp0zP0YV1wnPYpFaDunjQP7Sqf57QCul3VSUoS
	1xr2lPUWR9omV1RYXRR7MmILHLAuTk3l8xEpEh0QKfDzoxSuZcwMTIRr/0X/sfDgI6nqBa
	1thvisKalcUViXRA7iREWSUrGgOgudQ=
X-MC-Unique: z47IlcbzMImtJOKQMPbZDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka9FAXPddY2etMqWqvrRcY/LMIlTXW2VnoTuW8kSaR2Mu3NfwbrZg18I3kApYItMYHDPMVR34OWf6HOn5AAmf8dxKpjQ3Qmc3iVNNhFDlv56AEPDpdVDg6Ry32DeU9ImM24uo81kdDFVv/osNI5V08SD7Ga22nU7GWwHjXIOgoC28QhaNDXTttnwwjj0mM9lkaXbQ1KpkU8+4SYoz9Wfchcbq2//JDcHkJVpIfqYAliWffOM+3KcV0A9TxLoDTZIBtlT3DJt33lZjDsq4j6glwkqwaxN2xsu88/golTdAd5tytoEyTI5y+xq97mLcFsJkgLhYlLBhoh8gZXuWaWupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z360L9um9kv6KI2fQQvUHzI9KCJe9yeHC5hFK8unxY=;
 b=Y+4Oa9Do/D8Qf4vbSC5xtLwIv7kBpjS2hBpLtaegty1owgyxteGKoJgvwYHPbNhwitUEJ5OB64WOLz7SIjSEPKU9N0V4qh5yGGaqTN3dNoLgHUD22SDXATxhW/6KHzZbqauC+xzTCpxytuhNNCNQk6z7kCgHMk7V/WJA/YM/8utBKONUnVwMz4pSoSsh8vvCYbcJ8JeCD6aEVrSSr7VzqRduGFcvpSwicg+3aVZZpXtmcYVqaFPuTXXQN+obaf+edI1U1FHfS3iz7KEBwn84NB0yBfHrmiPoKUtJIllpBoz/8wBwCL7K8VPd5qagjFPFNrvZsFtrHBZh7c9cgvvTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] x86/hpet: Use another crystalball to evaluate HPET
 usability
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
Message-ID: <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
Date: Tue, 19 Oct 2021 09:07:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5484f71e-84e3-45e3-72de-08d992cf2449
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686162C6DB401C8A4903641DB3BD9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T9DtYz6Iaktmpg0NJhLXptTRizHfhY9sVvacihpmuPq3tq0WKrBQAKvqfvXMkc9z1m16JrueVruM5ptPj77wzWS4C53DSMIMFbKCDNkLAlnI2mQZjKxy0kfl256lmQk3+0pUgtXTHfDZX979cIPE2iumOWdOjuPYrtAeXVgp6XsGnmgC0oc5RJtsTAxCWBKbm6wk2rGpJUao++PoT5StlPgLlTdLysgbbnKQQ/0E92Tyw2LUjKerVjxA/eSOSO6MX/g2f0L3QsMjSq7XabKkNhBKF6osYeUwx5GwxX0cJavzKvt7fGb9eAIQttv4dAXoWae1OYXM6zHs4izZ0eS9PdCLOHHmg4ZT41235hJPHZefQlqQk0XaBL0rnW1Oj7d6fBvrBzNVYFy5mauz0PG5lGwXMXdS89BOvvO/J2g9lc+bgMB3B3GYlv2DVNDCOPlNBFFg+BA0tBWVWY+EZVaUGO2hdefS8o8KFBMv10UZvlvw4YlY9gEX1sdMJ+SAXGd41ap0CZwdxz2BFTthq1SI6ztHjSf7ecJ8Hp3eaWr5mlTMsN1jhqu5VCFUluxcCgxk+FtMvkD+NNKTrX0M+9hIwW+rcZeuFRI5xhDKyayH32GG4hWoBS7iHZjc1NS6RcTwIU3WjkIS05otLPyc0NEdNTWp9F54TamAmJqrYrKULrq1pJLLnsCqNXcqOQm/N+xO6kNgT2bdwYmDJLIOg6MjRU5DXHpDPgH8Rfpv8D7PkT5gwWbaBe2Ane+2iPkTI786
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(8936002)(66476007)(16576012)(36756003)(66946007)(66556008)(38100700002)(956004)(31686004)(2906002)(26005)(83380400001)(316002)(186003)(31696002)(6916009)(6486002)(2616005)(54906003)(8676002)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2dGQkdPaDNlZStOZ2ZKTjZaNEgwSzNscEJZYVNhWis1dWZPeHFGOUxCMFhi?=
 =?utf-8?B?OTFsc3JqQWY0MEU4NkEwSHRrN2RUM3lmd3VCblJEQmNPaVV5dkM4WHJmQlJV?=
 =?utf-8?B?UDNjT053dFl1UlY4RXJVQ3FObmRnbFlObUxCNjBQWXRIVVFESFk3bWlXVDNZ?=
 =?utf-8?B?dTY1cDk5bDJqZ1J1Qnhrcm5DWTNWcWV0YVlVQjBBNTdyMURhZWVUSlNQK2Qv?=
 =?utf-8?B?dHNSZzhHSmRucnRPelhSYTM3VlhkWVA0QmEyVm9KZnF0NDR6TE9QWDRJQWV1?=
 =?utf-8?B?YnV6N0tUTEVCT0ltTkFGSHJYNWZuRHdkc0pjTU1BTm5MTU9wWDdrUStBbldO?=
 =?utf-8?B?Smh0ZDVCYXVzc2NiQ1JGZzBycHVZb0xvMkRPV25MN2VNQXJUSzEvMk82Yzdv?=
 =?utf-8?B?Zm1XZXVrc2VySnlPdjZMRldOMnJ2cjVwcjBiOEFIY0c1SFlhZEFJd1NwQ3NO?=
 =?utf-8?B?eFM5Rnk0c2Z3UjlpOVkrR3g5L2ZhYmpjd2prOFh1dXBHTWRvMVZZd1N6QkQ1?=
 =?utf-8?B?OTRMZ1RMak41V2JTK2ptN2llQXhDdmltNEQ0aWM1Nm5MYXMrMVVpUXUzakxL?=
 =?utf-8?B?R3J5MFRYVnlkRmd0WE5VcGZsTGI0UnhaV0R5YW5TWEdvb0J5cFJ1KzBtdjdu?=
 =?utf-8?B?djRmMVRoYWE5NFI0Mm9BZlRJRkdGZGhGRDdjQXlEekxmcG1uMUhCY0hpUlVR?=
 =?utf-8?B?ZGdnRUhZUGZWVmJVRitDNVJwSEljT0VzSXpsZHlHeXBOdG95eHZOVFhLU0My?=
 =?utf-8?B?ZWl3c0FYT09ESlMvTTdiUXY3NTBZdnEwcDlnYTQvcitBZ0ZBTFZKdkFNQVpS?=
 =?utf-8?B?dzRiMmZwbElxZ2VQSW9DeVEyZ3E2RS94Ny9LMDFsSzJCT21xa0ZCZ0QwazVD?=
 =?utf-8?B?VUV1OXBWak5MUXprbnhIY0EyNFU1RWZ0OFJ2OEFHaXRUMHg5S2dNZTlZNzBZ?=
 =?utf-8?B?TzJOVDZtZm85bjdEQm8vZDRqRDB1OWRJMkY3NG4yYWFrTlhjRE00Wjg4RE5D?=
 =?utf-8?B?Nnh4Y1QrME5oM21IdDkzdkFKeGRScVpPTGVraDFkcjM3VXpKakVZNnVHeUNO?=
 =?utf-8?B?Mkk3K1FDYXV6OWhpVzhWb3RpQ1l2STdDY0JWVlEvVjlEQnBzU1lwNFhZOFBR?=
 =?utf-8?B?M0pKMG1kZ3NVREdMZ2VvUTBpK2xSbFUvRzcraGIzRGtJN3pPWmVJZnM4NnZ5?=
 =?utf-8?B?cWs1QTBrU0wvcTNzbkFtdE12M3o0a1hFRzNVdURTL2JXdENPR29sUHZzWkFX?=
 =?utf-8?B?YmF6dWoyVmluMXFPYVQwS2xzSFhUWEsyb01WakR6aFpPbVRpVHdZYjA0ZWl2?=
 =?utf-8?B?ckNndjVia0hTaytpU1RudnMySHJ6WnZtVVN0OVdEQ3ZTVmZxdGRSdXB0RE9v?=
 =?utf-8?B?SXpKOW5yQmVJZkxVSzF4TDJMTlcvSGNIaGM2OXRvaWo2K0dVU3luSzhXQ3k3?=
 =?utf-8?B?RndzUDdpTS85amhrQjBVVEY2VEdpR3c5cytYSm52U3lVWVdBbzg4a0MxZnVs?=
 =?utf-8?B?RXlpVkJzUmI1TjBhSkNGVWZRNzBIQVBieEZqemVPcXl5YVZrbWhBT2NkWkpD?=
 =?utf-8?B?czkzSjFmYTFVM1psdmJPMTc2QmRXS0ZybGhoTjVTbnRwOFFndnIzeGt6aTRV?=
 =?utf-8?B?VkEzdXB3TVZCdVdUMXM0SHhBVngxQlpoRG9oNERGMGtHeUxEUFZteWdIczhT?=
 =?utf-8?B?MmVseWc1NUdaM081c3pxekpFeGFIdGFMZW1UUzJ3WTlob1VoZ0VHMmoyajFa?=
 =?utf-8?Q?qZ7BmS3XYDYkNB/ZCgi3xiJPS7AsmH6evNRf+rU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5484f71e-84e3-45e3-72de-08d992cf2449
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:07:41.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zi/aHSR4yXV0y7Zz54bM9PUYWsSI6K23SYPMDLCmqtQkzQBw7Ejd4xI6hWU6JiHf3U65OjjNRiIbjIxlcaDXBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

From: Thomas Gleixner <tglx@linutronix.de>

On recent Intel systems the HPET stops working when the system reaches PC10
idle state.

The approach of adding PCI ids to the early quirks to disable HPET on
these systems is a whack a mole game which makes no sense.

Check for PC10 instead and force disable HPET if supported. The check is
overbroad as it does not take ACPI, mwait-idle enablement and command
line parameters into account. That's fine as long as there is at least
PMTIMER available to calibrate the TSC frequency. The decision can be
overruled by adding "clocksource=hpet" on the Xen command line.

Remove the related PCI quirks for affected Coffee Lake systems as they
are not longer required. That should also cover all other systems, i.e.
Ice Lake, Tiger Lake, and newer generations, which are most likely
affected by this as well.

Fixes: Yet another hardware trainwreck
Reported-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[Linux commit: 6e3cd95234dc1eda488f4f487c281bac8fef4d9b]

I have to admit that the purpose of checking CPUID5_ECX_INTERRUPT_BREAK
is unclear to me, but I didn't want to diverge in technical aspects from
the Linux commit.

In mwait_pc10_supported(), besides some cosmetic adjustments, avoid UB
from shifting left a signed 4-bit constant by 28 bits.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Fully different replacement of "x86: avoid HPET use also on certain
    Coffee Lake H".

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -34,6 +34,7 @@
 #include <asm/fixmap.h>
 #include <asm/guest.h>
 #include <asm/mc146818rtc.h>
+#include <asm/mwait.h>
 #include <asm/div64.h>
 #include <asm/acpi.h>
 #include <asm/hpet.h>
@@ -395,14 +396,43 @@ static int64_t __init init_hpet(struct p
             }
 
         /*
-         * Some Coffee Lake platforms have a skewed HPET timer once the SoCs
-         * entered PC10.
+         * Some Coffee Lake and later platforms have a skewed HPET timer once
+         * they entered PC10.
+         *
+         * Check whether the system supports PC10. If so force disable HPET as
+         * that stops counting in PC10. This check is overbroad as it does not
+         * take any of the following into account:
+         *
+         *	- ACPI tables
+         *	- Enablement of mwait-idle
+         *	- Command line arguments which limit mwait-idle C-state support
+         *
+         * That's perfectly fine. HPET is a piece of hardware designed by
+         * committee and the only reasons why it is still in use on modern
+         * systems is the fact that it is impossible to reliably query TSC and
+         * CPU frequency via CPUID or firmware.
+         *
+         * If HPET is functional it is useful for calibrating TSC, but this can
+         * be done via PMTIMER as well which seems to be the last remaining
+         * timer on X86/INTEL platforms that has not been completely wreckaged
+         * by feature creep.
+         *
+         * In theory HPET support should be removed altogether, but there are
+         * older systems out there which depend on it because TSC and APIC timer
+         * are dysfunctional in deeper C-states.
          */
-        if ( pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
-                             PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL &&
-             pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
-                             PCI_DEVICE_ID) == 0x3ec4 )
-            hpet_address = 0;
+        if ( mwait_pc10_supported() )
+        {
+            uint64_t pcfg;
+
+            rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, pcfg);
+            if ( (pcfg & 0xf) < 8 )
+                /* nothing */;
+            else if ( !strcmp(opt_clocksource, pts->id) )
+                printk("HPET use requested via command line, but dysfunctional in PC10\n");
+            else
+                hpet_address = 0;
+        }
 
         if ( !hpet_address )
             printk("Disabling HPET for being unreliable\n");
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1308,3 +1308,20 @@ int __init mwait_idle_init(struct notifi
 
 	return err;
 }
+
+/* Helper function for HPET. */
+bool __init mwait_pc10_supported(void)
+{
+	unsigned int ecx, edx, dummy;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+	    !cpu_has_monitor ||
+	    boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
+		return false;
+
+	cpuid(CPUID_MWAIT_LEAF, &dummy, &dummy, &ecx, &edx);
+
+	return (ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) &&
+	       (ecx & CPUID5_ECX_INTERRUPT_BREAK) &&
+	       (edx >> 28);
+}
--- a/xen/include/asm-x86/mwait.h
+++ b/xen/include/asm-x86/mwait.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_X86_MWAIT_H__
 #define __ASM_X86_MWAIT_H__
 
+#include <xen/types.h>
+
 #define MWAIT_SUBSTATE_MASK		0xf
 #define MWAIT_CSTATE_MASK		0xf
 #define MWAIT_SUBSTATE_SIZE		4
@@ -12,5 +14,6 @@
 #define MWAIT_ECX_INTERRUPT_BREAK	0x1
 
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx);
+bool mwait_pc10_supported(void);
 
 #endif /* __ASM_X86_MWAIT_H__ */


