Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C2372778
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 10:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122004.230095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldqdU-0006XT-CW; Tue, 04 May 2021 08:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122004.230095; Tue, 04 May 2021 08:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldqdU-0006X1-9M; Tue, 04 May 2021 08:42:32 +0000
Received: by outflank-mailman (input) for mailman id 122004;
 Tue, 04 May 2021 08:42:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldqdS-0006Ww-LE
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 08:42:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a38950da-1513-4ab9-aa77-0868ca61b5e1;
 Tue, 04 May 2021 08:42:29 +0000 (UTC)
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
X-Inumbo-ID: a38950da-1513-4ab9-aa77-0868ca61b5e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620117749;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=b/QYWXalV/j1/JHRl6JS+NRs5jZhyCw3xqOSqf1wfSc=;
  b=VJcPAwiFAmqYizRrUgEc19htr2ZM/uw5UcS8vo5XzZQzWjoYF1HnXO08
   Bo3YbSbkNLIWfkRAQJUKhHoyJUIvIj1rQQ/EkAIMD4DgsBxVr+T7GQt/p
   rD1yqgEIsTUQqmoMAcWJmXaSpbii6BIgkGrz5UMzcpWaFudOSgTAiHdW1
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NEaZF8caH4SgaFgcySI0XH26IojI0ZZTPaG58CE2FqYoFMCPxUZU2kueyKMD91lv2+4EiBy9GE
 T2s3ApWKcLhIiq/h7y4E+ebifhLigb8EMOUyUTbcvRRrJEfk7r6rgQMWVNJ+KIQg/DpK4sAoCY
 B49CWJGbGz7cIBAEaue5kxnarxZwFICleWF2da72F8SqE8Z1UZ+0/0ahBSmne8swBykPKDm/Mm
 9zldnro8qvpJKsfAmBYNMMGb75QF8Rdz1X9mtuysDasfausWlQ15uXU7IbwBk68T1sfZD/uej8
 k/o=
X-SBRS: 5.1
X-MesageID: 44520022
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KoFOvaAc7mKNcazlHeh+sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAH0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JbzqzNkFtXgFJCd4YOf
 Onl6l6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMQ9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m5efJ+594K+GnzuQQIjXooA60aIpmQK3qhkFInMifrGwEvf
 OJjxA8P9liy365RBDLnTLdnzPO/Rxry3j+xUSWiXHuyPaJOg4SOo56qq9yNj76gnBQ2+1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7XackD4ZvsM4y0BEXZB2Us42kaUvuHl7Pb0nByzA5IUuAI
 BVfbvhzccTS1+cYnzD11MfueCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w89yK4=
X-IronPort-AV: E=Sophos;i="5.82,271,1613451600"; 
   d="scan'208";a="44520022"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGQBlkrc4xCCl6vGAJx+HM2i0m3MFlfJAMbl6tPxM4241a1jLXP1sZIem1rL5ZM2nOTJCSbWCe+8wKeBaIUzBAaCHjL6HzdcWBubkghqT/pjhAR6xzgz6sN0+w/SgtSwZ8qkWVIZvUDiS4wnXUEqv/qqqQlohpqZYxJNyCWvgvlFAi2D+lixVVMlxRvftRmt91YoCHWAP+oMUfQ4PQAwnHr1KFidHdtmA99KAn73woN+FXfiianXqAURDKOMlYzYGzLa6CBdbSYT73l0iZAEIy+/J0o+oUQTVK1xgygzUofqbtW00EnP9jSsjx5Ym2RJQ6wUOB5C2DuhHRb33U5DCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMShm7y/KTJWmReJD3OB0IPy3SLCiCtqqCgQhb7UTzU=;
 b=h8wCtZjxkVoXHaG3IPcUkEc87gFz4sEqSNpZxEhEHEVk94aMtwU6fSm+5IzoqCB5J4BjUSeYXnbqMsVmPJjcxME1ZlmRTOsYUFDuN3fuBGO9g8dGSac3TMc9BTHaHgdMWzb3Q///zYy3fZf4apPyD3dmOcP0Rff+kfa1KpWlRHZyAYWOCSidgFtoK4ySQca5km6ISwlBOAKU1nIJhQJJYLTmjrgRRV9gpFaOWCoKeOEP3Rmr7c7j5kSRDpDrK0vdT7aUWC/16Y3xk6d4VYmrGCmECqdzvsY+pw3uEgi6fyaZekQBhcHHTIqmMSiJ4GIbo/PIQG1bhtnIF0dDX3uV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMShm7y/KTJWmReJD3OB0IPy3SLCiCtqqCgQhb7UTzU=;
 b=BQfjqD3SPFEx5hK99Wk/UtQ1DpMcuoBrLiz9fMSZk+Ad4vT2ja9/8iyJt+lIYtFCkrMV1JPjsJuReJqWoqLpcKXIWMdxU+hxV6XbSJjqocqH1MsnIfvULEBf22yz/aSGzg3AqwwEEknjGksWyNDVcjEAvojLAv2FFyKiBjxiO1o=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vhpet: fix RTC special casing
Date: Tue,  4 May 2021 10:42:08 +0200
Message-ID: <20210504084208.62823-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2953a0e9-0df5-4598-581a-08d90ed88a05
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB47623C69267A3604A5674F9B8F5A9@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eQ3JzgteGPuWkU1jQoCcCqhwAUS42mc7bxfui9yqQfG9N6Gm7ffpQQrFGqQTW7PZ8tLNw5aCw++yLRgHbmZP0Lqk7jnFK4TKUuzZyIBQ/dwYer2NrmsPwl6/gEWQV5wY+83P6vNGK74Nih5vXDU0WwHHKP+WiOC1+9RV19tehFqcByLqXHvLfwb/1EFEJ6A9gO2PkGMzma14Z3Vkn2xq4VpMAv2krobk+4wBYbsGGj24PIitAXQJowz2Pf+jJkuVnjyKM4CTxgPJdLfn4HMTpTr4cYyUqOQtF7AGr/su6vhS3SCWqNl47Wp+tFAuO3VxgwnDeLRJwmqk6oh1HEm6novMB6T2xUlPkO4GkjqawClac+shzRACHIA0U9uEJ4CKcmQet6ORtqZw+R/ZizMuVSAeAjdnm82jtejyph8+OOJ2ZaDIa0+520EAy/yuJc3GOZQoiV+d571dNdvqmZv86C6Dc5CAdIPRh7fIgqOh1Me+nPih16/mj/yab8Skarng/WiN7MeBgf+fM5U+ksHlvcjAZxSBR0IMD258LcRfn+sW5XYkzh9Baq8Pu3IaE0LdFHw1sj6r+RAhOLaCEYJZ1d0BhdRvK5CjRzjrMAyNIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(6916009)(2906002)(38100700002)(66556008)(16526019)(1076003)(478600001)(36756003)(66476007)(6496006)(8676002)(66946007)(4326008)(186003)(54906003)(956004)(6666004)(86362001)(2616005)(6486002)(8936002)(83380400001)(26005)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlRtV1N3bkVIV1ZJeXl5djRCVDg1MEwyL2loT05xWCtnbTZ5NnR3M2ZTcnhT?=
 =?utf-8?B?Z0NLd0FGc1U2Z0h0UStBN1E2aERtRTk4d1ZjRVdhanRZSTg5bW9yMWdaQm9u?=
 =?utf-8?B?N2FWYUI2ZzNxVVd0SWY4QVpDcXlqQmRJYUQwdmpwT3haWFpvaFVOVTBSWSt5?=
 =?utf-8?B?b01kTUk0WWdqMURXdTNqam95VExzL1h0VFduTnZXMTMvTU5XU3MvbE9qV3lT?=
 =?utf-8?B?WlpNMldOUFlBMDJsSk03Qy9PNG5CV09XaFlNQlJtdWoybFN1aG9lMmtKRGI4?=
 =?utf-8?B?NEdTd3JkUVNoVDR2L2tzV0l4bUpqSWl5ckRRT1hYWjVhYUZZUnFoVmxaZjNm?=
 =?utf-8?B?RGVwSC90RUJWbkRZYlo5Z3FyUlJkTnJlTUdoWkltRGQ5S21pNDdqWUxIUjFP?=
 =?utf-8?B?aGtiYnNzdC9jSnJWK2l5LzFyOENpOXl1UnFWOWU3eEJMd291VWVJeXFTdEVI?=
 =?utf-8?B?Y2pteDZaV3Vremh5ZW9Yay9yZlJGTmZ4bW5QUnNMTFhBYllMTStXVVBPcmMz?=
 =?utf-8?B?MGtRODhkM2hsOVhMTk9meDFmRDNqWkI0cjhMODAyVUhVakh6ZUdBYnlCMXhE?=
 =?utf-8?B?dlZ4bWdFbXEvSWUycGFMQnFGeGZ5MHcyNjJKaUl1N3VSK3dCZmxUNHN6ZWdL?=
 =?utf-8?B?NGZmYkJLR2pXRkJHWnh3R25kSDhTaEo4SDFJWGVWWkMzZWc4d1o5YUtKQ1RD?=
 =?utf-8?B?R1hDWktycXFRcndJR3FUQllzMmxDVXh3dlBETGVJTDJsTEdRSCs5ZkUzSnlW?=
 =?utf-8?B?STA5SGdJTTArcmVRYTEwY2h3NVFJN2JsQlorQzg4ZS91a3lDUVhGWmltckFX?=
 =?utf-8?B?VDlKUEtZdklZOTU3NW5UZmxBUFBXRVFFQTFHdGUvclJkeUJBNzJGRVNuRzRq?=
 =?utf-8?B?RGUzV2MvbWIvdk4wWmdsQTVIRW5OSTI5Z01oekhZejYydmYrVEtMNTZ4OU16?=
 =?utf-8?B?ZSs0cUFXLzBuUTJlaUM4eVFoSzJ1RURnMlZpd2hJVThjRktrcXVKUmlPZlA0?=
 =?utf-8?B?OGl0TFltRVMwd3J0RE8xUkRkR25Sd1M3d3o5ZzdScnZBTUtRaWJjYklRODI2?=
 =?utf-8?B?Mm9zeUFrMU55czRHN0NwREM0WUp0SXRSV0dZekh5eHllK0Jjbndxdng4eUxk?=
 =?utf-8?B?UWFqTW5kZ1FmdTB1UHd4bytwM29waDBiNlVadU5QNUw5SzNiV1FOYzN2RHB2?=
 =?utf-8?B?dzdKMnhMeVBZYXBUQ2RmYk5pR0NEeFVXUkRiYUgxd1pXSnZvWndnSU1OeUNV?=
 =?utf-8?B?UjVFZnBRYXAzTE1ZRjJYdmJBWXBnOWVIUldQeVVTTnVlaDNEeWx4VFhnVUsz?=
 =?utf-8?B?bUxOTG52NDFmRXNjdzFGSU9iZXIrQmxrUkRjSytMZXpobWhidUpqQ05zZkN3?=
 =?utf-8?B?SXArQUpUbllEUEZMUHlGNFAzTCtRZ0FCWVpFOFV3dlExU2pWSnVXSWxRcEtR?=
 =?utf-8?B?YTV0OWJtVlRzME1lUzlyVUlFN21KNzc5cW5idzV5ci9qQVlIOWZuT1VkYWZ0?=
 =?utf-8?B?Qm52VldQNTdYZ2U1QWlGQlM5ZWZXWUQ2YXRIenh0aXJ6czNac1FBV0NFQ0hn?=
 =?utf-8?B?Q1FUb3Y5VmVsc2tLY2dUNy9VSVlCZHl1NGxXbi9jalZSSFFhQ216cWNzZFp3?=
 =?utf-8?B?Tm5HaWEwMks5SHdEMUlmenB4UDZvTDRhZDRWcUNDMTJobGd4TG5EN2lqbklF?=
 =?utf-8?B?c2NIY0FBL01IcUhOdFo1MGcweHZ5U0hTdjZ3VnlHZFNka2VBN2pvRHQ3MWQ4?=
 =?utf-8?Q?w57afasZp2+Kk8KZkpuUPsNk9m2bxmDolw/tfIW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2953a0e9-0df5-4598-581a-08d90ed88a05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:42:24.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DXWT9E0hbOKHZpsGl6ODksplWi+lVRjk5nrCb5Niw4TZWTmGE6VawNAEnTApZTV5tf5Ktx34NBivyUScbFcKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

Restore setting the virtual timer callback private data to NULL if the
timer is not level triggered. This fixes the special casing done in
pt_update_irq so that the RTC interrupt when originating from the HPET
is suspended if the interrupt source is masked.

Note the RTC special casing done in pt_update_irq should only apply to
the RTC interrupt originating from the emulated RTC device (which does
set the callback private data), as in that case the callback itself
will destroy the virtual timer if the interrupt is ignored.

While there also use RTC_IRQ instead of 8 when the HPET is configured
in LegacyReplacement Mode.

Fixes: be07023be115 ("x86/vhpet: add support for level triggered interrupts")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hpet.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b4538..ee756abb824 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -22,6 +22,7 @@
 #include <asm/hvm/trace.h>
 #include <asm/current.h>
 #include <asm/hpet.h>
+#include <asm/mc146818rtc.h>
 #include <xen/sched.h>
 #include <xen/event.h>
 #include <xen/trace.h>
@@ -290,7 +291,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
         /* if LegacyReplacementRoute bit is set, HPET specification requires
            timer0 be routed to IRQ0 in NON-APIC or IRQ2 in the I/O APIC,
            timer1 be routed to IRQ8 in NON-APIC or IRQ8 in the I/O APIC. */
-        irq = (tn == 0) ? 0 : 8;
+        irq = (tn == 0) ? 0 : RTC_IRQ;
         h->pt[tn].source = PTSRC_isa;
     }
     else
@@ -318,7 +319,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
                          hpet_tick_to_ns(h, diff),
                          oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
                          irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
-                         (void *)(unsigned long)tn, timer_level(h, tn));
+                         timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
+                         timer_level(h, tn));
 }
 
 static inline uint64_t hpet_fixup_reg(
-- 
2.31.1


