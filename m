Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B56D0171
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516584.800936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpi2-0004xt-LG; Thu, 30 Mar 2023 10:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516584.800936; Thu, 30 Mar 2023 10:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpi2-0004ui-Hd; Thu, 30 Mar 2023 10:40:46 +0000
Received: by outflank-mailman (input) for mailman id 516584;
 Thu, 30 Mar 2023 10:40:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phpi1-0004uY-0o
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:40:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5197738d-cee7-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 12:40:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Thu, 30 Mar
 2023 10:40:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:40:40 +0000
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
X-Inumbo-ID: 5197738d-cee7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYPKv6IYaqhRgmEuNfoaXE8yNmg+e1Gr1L1BL+m57KimD9U1ZDuiRJQrrOYf9WKclcuMOWzmWCcMUeRjoft7euogWT89uV1K250qKS53QKZJjbJNWU+30xN47tPNimrdGMeNd1Hlirk79/zS8f2AmpRe4eoBDWOnE0giR39BuiWjjJ+sMG4Ei/2ZKqkVcjuHzDGM8ZMGAvPRv9zDlIxJ+bJpT9aTkYF+XHxdmusFr+aZ53QbA32zEwKglL45pEOqOFT6trPFp2gFW8pla2FB3IlLHm7Us3QpiOoMEutxF0bkR7oHFnfcshnWcSJTPJMqEdhTPE3RYKOdrx4HNKBM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2rCHLkcV3nX2xu2lyRhhhsfXfAAvjvQuVeY+bD0syg=;
 b=NW6GL1cQSmLYLIqx5k6W9Fz7niuuiat7F/nuDgONTcaWfE/oV26dAe7tCSJULtCArCWRtoPaNwrXUbM3agHszVm6NoQbSHmBhSrHfuSoRl1FIBP4XWsThyl9pwOrXd6CX1y8mfqvJnymLdNfS61Y+bfFcZQ//Xx06qLpdy0cK49gmfmSkWzBItLdMfcL1HLDzXBb9v4zAI7nF2oK3BtmCT76ziOZSu3eLomooJTD0TDFdJzfmjDAoT9565OHjfM0vRyhhBhn0Jc7rJ+vKI2Yd/34NkztpUK7mCbYV/xuJjeJhtkgB2mhwkWGuqA4zgYKy17xf1oPTMKmiepUTwNPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2rCHLkcV3nX2xu2lyRhhhsfXfAAvjvQuVeY+bD0syg=;
 b=uYCtjWZ9Op0CwWe45phSj9/mxISBHss3nrluuLGKKZxiUsByBeSY1asW7jTFHX+6J/qRYOAMxEtL+Gh8nzLuO84WcRap99RoTRM4rtrdeIt2WP3JwqahmPTqkyzVduStdMmHJjhINHa6dgaoJdwgp4QIO4zqIOC4sFm8FUovmmAQdIbshYV5fU/KACS3BUHXD8grv/exrwwWEz4UnVCNlncp0GmFf4paOabedHaN9CWry1hxRxi6Yhr9U8Hxundw+I2uZdT6P1VukGYbL9PRSI81bv5XDJWQz+qHn4FUvi2rZMbmn0SwVv9oYPRNQ18Egek/sOHjKue1r+X7/IpphA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f2fa47d-89b7-b39c-e60f-edee1de5ca82@suse.com>
Date: Thu, 30 Mar 2023 12:40:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] x86: detect CMOS aliasing on ports other than 0x70/0x71
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Language: en-US
In-Reply-To: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 1959a24f-0087-4809-63b2-08db310b34d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uiqp/BcH8Fii9LGvandaExhzKxEntlkfPKGJIilOcKghKAaQ6iH0wW9E1vgn5ISF5pdqsSmiKb6yrfly+MXslTUbKEjz1UVwTbb52Pv4wCdiiF+yP8xX2b0KPUw3FPbBQE8/4Eyx+ih/A+I2sSj/SeCzsI6RDIO3NYKFmNj1eMpszlxX8/B7M7QLQ6GyP4PpPux6UMlq1Qg5ZGZr093TRpK1ksrwV9/ZPvgm8nX9SBIAGcJ5C8b0ybJZ6L81rARbf6k+puRhhxuX9PMmvlloAC6ZPfDJaHLkKv2pPulkRtdEr3R9SWmGqaBcgyq4qcBcuPIZt1W4tkJzkWKTX5bxg8CP3qhe8z1HjfMfANnZdYTNvyTwBIF+g03X9QlcdBIs0cXkNDybvwo9DPxtJZ9AJ9wH8ympBwHTzAphCQ7nkRlY87K5OCx7WpB9z2njSgTgMrYWIaEtkjzz1hICp7wEjJnspF2GrrQOwlLY/3VKtlVYNDlWwe14j7JR91mADQPFgofhE1vwWzWkrv8rPQbFOja8BIt1hBhA71W+Gg0b/16uN0jtj/KlqEdYBli+KDER2tw8wOxY+LSfaAwQnBA0DHMkAdI4lmXiBZ4t3N/SEo6Udl4cgIza3sQ2OxSI9Hw9SyXOd9kCyJ7uU0jNp8llJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(2906002)(6512007)(2616005)(83380400001)(6916009)(66946007)(54906003)(8676002)(66476007)(4326008)(478600001)(66556008)(26005)(316002)(6506007)(186003)(36756003)(86362001)(38100700002)(31696002)(6486002)(5660300002)(41300700001)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0NsUHJIZStEVGJCNDcvM3lwaUZvTjc0WVozWGVvNHN0QU9HTWVucWxpaDBG?=
 =?utf-8?B?Rk0vTGpVQVE1clZheWo4eStpNC9DWGZQOVlRWXVVZWJLMlBzb2c5Zms4Ymoy?=
 =?utf-8?B?enY4amdGUDBINWxNOWxKRENPcGxRT2lQRDFveEJGOVRKM3RZOXFCWHhXU3Fy?=
 =?utf-8?B?SUZQWDZKOE40dnVXNlpNRzdpTTlPaUVaU3pZMmUyeDk3MFBjck1CZkNCS1g1?=
 =?utf-8?B?c3lYSXZQK0NXT0dlb013UU9GdGVKZjJRT3kvU3lwd3hwV3pGZ0xRNHZPM1hm?=
 =?utf-8?B?VmVkbGJ5TzEyU1FhaExIQlZmZDRXQ2kyekNpL01vNlpFMGdSdUpNendnbm1V?=
 =?utf-8?B?TTl1UW15dC8wTFpORGJzMEpJSkZTa29sMzRWcXFxMHI0Sk9kZXo5eU5MNTJ4?=
 =?utf-8?B?RWh6dU53dWVPamFvT2E2bWJPak1IZTY5b09SemQxckpDZ2V6aVZneFFyWURT?=
 =?utf-8?B?UGxQbi81dGNtSEx2d25XSDljVmIxMlpIQXllUnZhQ3RNWlRjWmN3ZFNReGNt?=
 =?utf-8?B?dkEzaFQ4TjJsb3BKem1qWVQ5Sm11SmpsSFlTL0JEQVltTXgreXFySnpCWWw0?=
 =?utf-8?B?R3FwUzZHSVFUVWplWldyajQwbXprMzV2N1dEcmVScXh4RW1hRmRmRUNITmN6?=
 =?utf-8?B?cnA3VXpBNWVUMEc1L25oaU1mN2J3L09HNkhDSXpvUmgrdHdoRnpsSGxLOVBp?=
 =?utf-8?B?dGUvU24vMThoTlFDY2d6STNNSHc1OGQ2RGs5N1hHQ2YzY0w0eEpNMUtlYTJ5?=
 =?utf-8?B?Rk92WFhYZHFjWldRQ05CWkxldzV1WFRYWHM5aCtudjVPNVAzQTU1R3FyMnlp?=
 =?utf-8?B?byttVkhVcmd5SzNQeEJGbjFTbnBncC9DQUpHVGowRVIvZzYyM2I0aXpJSngr?=
 =?utf-8?B?am1LOHdPL0VoMXdlcENJbUc1Rzc4Uzl0eUp5R2pwdzJuY0tnTFl2RklMQzM3?=
 =?utf-8?B?eUtFamFZb05RRzhnYndOdStTMTVmSnAxZXRtM3k5YWY2QUVkL1hSVkk5dzJI?=
 =?utf-8?B?Sjh4WFgyNHpjeHloQVkvMGFSWGF1dUZ1T216dExrblBVeC9XSW9iR0REK2sy?=
 =?utf-8?B?TVBZaGZpOC9JVHZaQVFNNFhTQ2RoTy9JZ2RpVHgzdWQwd2pMbU9GMHFzYmpn?=
 =?utf-8?B?eXRNRWdFaTk1UU41alZjMUJHd3RTejNnWEtOMmR0WFl2ZkpQRm1DRENNaGgx?=
 =?utf-8?B?a3U2OXBkSkhpOWR5NTFqQWFRRVhHa1VTbFNnWXNzalRsdFVFUE9lc3owOVdI?=
 =?utf-8?B?NlhVYU1weEM3NGRTZFVvNmtNWDU1ZDM2NVRMS0pIbS9wZ00wRlloNmxUcDd0?=
 =?utf-8?B?RXVzOW5COEVOUVJkYW4xR1JOdUZ1bkdyOHpuM3pRQmFhQk1LRXIrT0xRaVJ1?=
 =?utf-8?B?OTdTK0dhZytrdVI1Tkx5QndDV2ltYkZ6MTF3MFREZDA5ODE0VkpjOGIzdXhC?=
 =?utf-8?B?bWE0bzBsN0p4dTZlWXh0Sktqc3kvY25GWnBzM2Z4b2pOZnNXa0ZPWjc2eGNV?=
 =?utf-8?B?SUNqd2NTTXFKY0M5Q0xXQ2RNenU3L2lEY3U5SzFGT3JRVU5ENGhHVDRBUUtx?=
 =?utf-8?B?c0lqVURycVVrVjN1bjlHRFRjZnlvV0Fhb1JNMXVjK0VmU0ZkV2RvUWxtdktR?=
 =?utf-8?B?bDlRbEpLK0dEL2JYYWI4Rk1ZQVdOY3NnTisyK280Kys4ZzFFMmo2NENTS0RT?=
 =?utf-8?B?MFRzeWEwVStNak9JZFR5Vy9mbHVIQURPSHZ1Uko4SEVPM3B5aU9IeTZEa0M3?=
 =?utf-8?B?QVdTSVZZaWt5eVI0cmhha3FyMmpsTnd5Q3lZUG1adWI3NkJHRmhqWTVlQzVp?=
 =?utf-8?B?RFNILzlubXFHV2pNbHBrWGwwS1RwR3dLbUJjbkFHS2QxQWJLb2xqbUQzNHFW?=
 =?utf-8?B?MXdMdENwbEl0M1pGcFZ6S3Y1eEhySE4zbEs4UFFDVHU2L3NxckF1aGpZMDd1?=
 =?utf-8?B?c3Y3YVRSTnoxb2w5SUljZFhLYzZCS0J0SXg2d3JpQ0tMVk9oZDBDOUh6cWZL?=
 =?utf-8?B?WVpOMVB2dTRXMzNqaElSY2hhWnhYRVowN2YwOGdGY0xCZUtwUk1RNzJEc3h0?=
 =?utf-8?B?NUszWG03bng5dXR3WkV3b3RHS2N1VEp1Nkw1TlB5cmFZc1Q3YlpJMEVVaWlj?=
 =?utf-8?Q?mSn7aucvRqxg6yOn0uusca/pl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1959a24f-0087-4809-63b2-08db310b34d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:40:40.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rjDgtC5lIVZq5Oa4OXUnpAESadZ5q/JGPjelpKKWpbX35OPsm9QfVqRr/ooSRoWK+LSFFBe/ZPQ/HiSWQ4qAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291

... in order to also intercept Dom0 accesses through the alias ports.

Also stop intercepting accesses to the CMOS ports if we won't ourselves
use the CMOS RTC, because of there being none.

Note that rtc_init() deliberately uses 16 as the upper loop bound,
despite probe_cmos_alias() using 8: The higher bound is benign now, but
would save us touching the code (or, worse, missing to touch it) in case
the lower one was doubled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Simplify logic in is_cmos_port(). Limit the scope of a local
    variable. Adjust a comment that's being moved.
v4: Also conditionally mask top bit for guest index port accesses. Add
    missing adjustments to rtc_init(). Re-work to avoid recursive
    read_lock(). Also adjust guest_io_{read,write}(). Re-base.
v3: Re-base over change to earlier patch.
v2: Re-base.

--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -27,7 +27,7 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/save.h>
-#include <asm/current.h>
+#include <asm/iocap.h>
 #include <xen/trace.h>
 #include <public/hvm/params.h>
 
@@ -836,10 +836,18 @@ void rtc_init(struct domain *d)
 
     if ( !has_vrtc(d) )
     {
-        if ( is_hardware_domain(d) )
-            /* Hardware domain gets mediated access to the physical RTC. */
-            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
-        return;
+        unsigned int port;
+
+        if ( !is_hardware_domain(d) )
+            return;
+
+        /*
+         * Hardware domain gets mediated access to the physical RTC/CMOS (of
+         * course unless we don't use it ourselves, for there being none).
+         */
+        for ( port = RTC_PORT(0); port < RTC_PORT(0) + 0x10; port += 2 )
+            if ( is_cmos_port(port, 2, d) )
+                register_portio_handler(d, port, 2, hw_rtc_io);
     }
 
     spin_lock_init(&s->lock);
--- a/xen/arch/x86/include/asm/mc146818rtc.h
+++ b/xen/arch/x86/include/asm/mc146818rtc.h
@@ -9,6 +9,10 @@
 
 extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
 
+struct domain;
+bool is_cmos_port(unsigned int port, unsigned int bytes,
+                  const struct domain *d);
+
 /**********************************************************************
  * register summary
  **********************************************************************/
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -220,7 +220,7 @@ static bool admin_io_okay(unsigned int p
         return false;
 
     /* We also never permit direct access to the RTC/CMOS registers. */
-    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
+    if ( is_cmos_port(port, bytes, d) )
         return false;
 
     return ioports_access_permitted(d, port, port + bytes - 1);
@@ -290,7 +290,7 @@ static uint32_t guest_io_read(unsigned i
         {
             sub_data = pv_pit_handler(port, 0, 0);
         }
-        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
+        else if ( is_cmos_port(port, 1, currd) )
         {
             sub_data = rtc_guest_read(port);
         }
@@ -436,7 +436,7 @@ static void guest_io_write(unsigned int
         {
             pv_pit_handler(port, (uint8_t)data, 1);
         }
-        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
+        else if ( is_cmos_port(port, 1, currd) )
         {
             rtc_guest_write(port, data);
         }
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2131,37 +2131,36 @@ int __hwdom_init xen_in_range(unsigned l
 static int __hwdom_init cf_check io_bitmap_cb(
     unsigned long s, unsigned long e, void *ctx)
 {
-    struct domain *d = ctx;
+    const struct domain *d = ctx;
     unsigned int i;
 
     ASSERT(e <= INT_MAX);
     for ( i = s; i <= e; i++ )
-        __clear_bit(i, d->arch.hvm.io_bitmap);
+        /*
+         * Accesses to RTC ports also need to be trapped in order to keep
+         * consistency with hypervisor accesses.
+         */
+        if ( !is_cmos_port(i, 1, d) )
+            __clear_bit(i, d->arch.hvm.io_bitmap);
 
     return 0;
 }
 
 void __hwdom_init setup_io_bitmap(struct domain *d)
 {
-    int rc;
+    if ( !is_hvm_domain(d) )
+        return;
 
-    if ( is_hvm_domain(d) )
-    {
-        bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
-        rc = rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
-                                    io_bitmap_cb, d);
-        BUG_ON(rc);
-        /*
-         * NB: we need to trap accesses to 0xcf8 in order to intercept
-         * 4 byte accesses, that need to be handled by Xen in order to
-         * keep consistency.
-         * Access to 1 byte RTC ports also needs to be trapped in order
-         * to keep consistency with PV.
-         */
-        __set_bit(0xcf8, d->arch.hvm.io_bitmap);
-        __set_bit(RTC_PORT(0), d->arch.hvm.io_bitmap);
-        __set_bit(RTC_PORT(1), d->arch.hvm.io_bitmap);
-    }
+    bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
+    if ( rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
+                                io_bitmap_cb, d) )
+        BUG();
+
+    /*
+     * We need to trap 4-byte accesses to 0xcf8 (see admin_io_okay(),
+     * guest_io_read(), and guest_io_write()).
+     */
+    __set_bit(0xcf8, d->arch.hvm.io_bitmap);
 }
 
 /*
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1234,7 +1234,10 @@ static unsigned long get_cmos_time(void)
         if ( seconds < 60 )
         {
             if ( rtc.sec != seconds )
+            {
                 cmos_rtc_probe = false;
+                acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
+            }
             break;
         }
 
@@ -1249,6 +1252,77 @@ static unsigned long get_cmos_time(void)
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
 
+static unsigned int __ro_after_init cmos_alias_mask;
+
+static int __init cf_check probe_cmos_alias(void)
+{
+    unsigned int offs;
+
+    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
+        return 0;
+
+    for ( offs = 2; offs < 8; offs <<= 1 )
+    {
+        unsigned int i;
+        bool read = true;
+
+        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
+        {
+            uint8_t normal, alt;
+            unsigned long flags;
+
+            if ( i == acpi_gbl_FADT.century )
+                continue;
+
+            spin_lock_irqsave(&rtc_lock, flags);
+
+            normal = CMOS_READ(i);
+            if ( inb(RTC_PORT(offs)) != i )
+                read = false;
+
+            alt = inb(RTC_PORT(offs + 1));
+
+            spin_unlock_irqrestore(&rtc_lock, flags);
+
+            if ( normal != alt )
+                break;
+
+            process_pending_softirqs();
+        }
+        if ( i == 0x80 )
+        {
+            cmos_alias_mask |= offs;
+            printk(XENLOG_INFO "CMOS aliased at %02x, index %s\n",
+                   RTC_PORT(offs), read ? "r/w" : "w/o");
+        }
+    }
+
+    return 0;
+}
+__initcall(probe_cmos_alias);
+
+bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
+{
+    unsigned int offs;
+
+    if ( !is_hardware_domain(d) ||
+         !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
+        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
+
+    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
+        return false;
+
+    for ( offs = 2; offs <= cmos_alias_mask; offs <<= 1 )
+    {
+        if ( !(offs & cmos_alias_mask) )
+            continue;
+        if ( port <= RTC_PORT(offs | 1) && port + bytes > RTC_PORT(offs) )
+            return true;
+    }
+
+    return false;
+}
+
 /* Helpers for guest accesses to the physical RTC. */
 unsigned int rtc_guest_read(unsigned int port)
 {
@@ -1256,23 +1330,25 @@ unsigned int rtc_guest_read(unsigned int
     unsigned long flags;
     unsigned int data = ~0;
 
-    switch ( port )
+    switch ( port & ~cmos_alias_mask )
     {
     case RTC_PORT(0):
         /*
          * All PV domains (and PVH dom0) are allowed to read the latched value
          * of the first RTC port, as there's no access to the physical IO
-         * ports.
+         * ports.  Note that we return the index value regardless of whether
+         * underlying hardware would permit doing so.
          */
-        data = currd->arch.cmos_idx;
+        data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
         break;
 
     case RTC_PORT(1):
-        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+        if ( !ioports_access_permitted(currd, port - 1, port) )
             break;
         spin_lock_irqsave(&rtc_lock, flags);
-        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
-        data = inb(RTC_PORT(1));
+        outb(currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(1))),
+             port - 1);
+        data = inb(port);
         spin_unlock_irqrestore(&rtc_lock, flags);
         break;
 
@@ -1288,9 +1364,10 @@ void rtc_guest_write(unsigned int port,
     struct domain *currd = current->domain;
     unsigned long flags;
 
-    switch ( port )
+    switch ( port & ~cmos_alias_mask )
     {
         typeof(pv_rtc_handler) hook;
+        unsigned int idx;
 
     case RTC_PORT(0):
         /*
@@ -1298,20 +1375,22 @@ void rtc_guest_write(unsigned int port,
          * value of the first RTC port, as there's no access to the physical IO
          * ports.
          */
-        currd->arch.cmos_idx = data;
+        currd->arch.cmos_idx = data & (0xff >> (port == RTC_PORT(0)));
         break;
 
     case RTC_PORT(1):
-        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
+        if ( !ioports_access_permitted(currd, port - 1, port) )
             break;
 
+        idx = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(1)));
+
         hook = ACCESS_ONCE(pv_rtc_handler);
         if ( hook )
-            hook(currd->arch.cmos_idx & 0x7f, data);
+            hook(idx, data);
 
         spin_lock_irqsave(&rtc_lock, flags);
-        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
-        outb(data, RTC_PORT(1));
+        outb(idx, port - 1);
+        outb(data, port);
         spin_unlock_irqrestore(&rtc_lock, flags);
         break;
 

