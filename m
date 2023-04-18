Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6BF6E5D42
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522678.812186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohZc-000212-0y; Tue, 18 Apr 2023 09:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522678.812186; Tue, 18 Apr 2023 09:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohZb-0001yJ-UY; Tue, 18 Apr 2023 09:24:27 +0000
Received: by outflank-mailman (input) for mailman id 522678;
 Tue, 18 Apr 2023 09:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pohZa-0001yD-Am
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:24:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce43d655-ddca-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 11:24:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 09:24:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:24:21 +0000
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
X-Inumbo-ID: ce43d655-ddca-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct2ZB9yNtnG/eCNJ2G3d13A2mKG7Uv7CANvQz2MiL5unDGLOowiSbJagU+4lXlqkluiiJg9rtCxQmV1MDIAYdlyM493SwTk5n9CjyQQ8lSX6TLD6i8bjGgMhhShpDuZzreiHpibJfa1tXZ/wg6mT4qqBY6q7X7prg4cGW5zsYPI3saGxgB28aiAnkaAvO7ChyB3Cm99QzE9XCKt1PBVgJtbS9RmPWuFqi3awNjuUwSW0GL9D47YIe1APWlLFZ5v4pBzZfYGapioeOWyfFR35pt5lkX/uKWa4Z0KDMGuloKXmEq8SDQWrW1ifXozc4Ei1BI9LfkALVpFFC0RdEw/Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=055egUZjzSFCS8fr7d/bRVeiYickat/ngXv8tNqa6ZY=;
 b=Dg/63OXyRkImB5h6ATrBZc4lkQMARvajCApe0kT/SPkMLaYvPbnqc3Fw8UtTXCbcbw2WRpYsOPeDrFNC+iDCKbE+L+VmgQ9f5MSApVxWk7V9tc/yDG3KpNYR+fm/7zopUA183v+T8YCNKI0uxVAIwOA27wumzINhezMkrt2sRMv2yMPf7pHXAk9ZOewccpKTSUj1kOsSzBiTncQgWGUaJcCWSdsHfzeTlydEpBrWWYChcEyMtzhWQ3pkIVWWOaXZyJd2z+tDGQpNKxvFaog1DRh7hYqFfYSv/1aCzCcAejxC6eqcSehhI22o+NYPnYNy/AcJYaZSRrt+SSVGc2vKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=055egUZjzSFCS8fr7d/bRVeiYickat/ngXv8tNqa6ZY=;
 b=n0LTAF91Z5E31qRuvbi3bM/BqSBx4iyWKwk7bsM1TnvS718r36FghqRB11nWt0AChWSbIBoEm/43f7PxZmuN9IqVQFMgVvtxsJkB2oqlWSvdD/PD+MOyHTlFuBS9XSgq8qP38fJKMYlIKioZztSA+U6hzput7wxYGbtvF1A5AoHIKQBphAKpPqNbHIJ2Ck2duJAJQYMw7tCLXJtWDKO0SyxQFOjx7+2nf8GhHvc40vtLO2NGWQEpNLo41y8NLiVATVZWj65Bur1dHcRLJ5KkKQvigTaV9s8lsALeQck0rygOP1UgAhwL6JdiqqVHzH8ORs3z5ajCMBLEJwFnbU3QvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
Date: Tue, 18 Apr 2023 11:24:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6] x86: detect CMOS aliasing on ports other than 0x70/0x71
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Language: en-US
In-Reply-To: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: a887c8ee-cec8-40e4-09ea-08db3feeb126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9bCZpffYh8vutX5neDnvtkK91h1DnNx3+C167IIvm+wmBGuUau0exkSk9dME7cyfuQbLdOb/WwlN7b3V/Yf72XO2vo0hL/vi+BGBsMS0TnYP25GC9b9UUAzkfV+V0osqiwCJJC8Q2+J8EJ7p3wohU/qFLmo78NwLDUyL6ntAWhl08Lig+9o6+9czdTUKQIPyzt504OvGfGWdsTh9Xi/DjEksBr4dVKguDEpWocfFixkoQgd5RvTN+BUhSoDFWOyCaAeAToFNNkcBDJ6IHHBcEBCydFYGpbLb8FHPNIwTtBqXHL+FyacyJ1vtHzFa/EI1niR+u2bNUbgg2Z0oXZ2Gvo7cpGupik+MmqcPLzX2id/6yvZ20SObLo4/02JcM+57FkIs6RzOHKergKzyTeUz8CzhhNf5V0Rbb7va7Tx23qbQh923YZl6PBCNWiPzn396lIbbfh0zPFqgsS68pNAYO0sgrCzx8Wvhu+SONWjs/WVfGMb9aC8mL1n60u77S5zzaYb+FVN/EMsQ50TjWUtEOuq1XPh/rzhzsBAIGCPujMKJ+zsLj3oZ6o5d5oskOJgKcuvxUHInuYh2zfJnuIjuDR+EIUlE9IRFm6uSIuXdh9b8SNTHgYGGped+diRGBI8FlNbiyf5BsqXzToVR/gHxOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(366004)(346002)(396003)(376002)(451199021)(6486002)(478600001)(31696002)(86362001)(36756003)(2616005)(83380400001)(186003)(6506007)(6512007)(26005)(38100700002)(6916009)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(8676002)(8936002)(5660300002)(31686004)(41300700001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNTOVZJclIrT2trd0NjempLRU9NSTRnWHVNZkhqVXkvZ1hjeDFiRU5ncU9B?=
 =?utf-8?B?aFRJUkprb3VSbTM0UWszY05VK1dsZG5xZnFQbUtXWS9EVGVxc1hPWmtyWjh2?=
 =?utf-8?B?UVhNWmw3RkMyUkJzRHlVTDlVemtETVJ3Uzd0QU9uUXRzRUpkMkRaSFdyNHBU?=
 =?utf-8?B?M3ZIaFlLSE94WTdhV2ZxK3hqSEFsSXc3WFBiR3kxQ20yOXVxYzg5bVZxOUdP?=
 =?utf-8?B?enNtclJVaDZKMG9IaGZTNnU5aDZTdEdraC9IQ3YrV1lQazdIZ0p4OTVtaVBL?=
 =?utf-8?B?QlRpSG9MeThaTXpnQjY3S1c1bG05OG1DNnVIMUM3MDJlVFFOY09lTCtIMHpu?=
 =?utf-8?B?UDFqb3ZkeWNLZElZMkYySm9FaGJVKzJmRE8yYk1MRzB0aEZ0TmpNS1pzeDVL?=
 =?utf-8?B?bE05WFkrSnBUUE5HWTBDNnpuNkdpMVliQXhoUFNCTURYOHZrTEFMZ2xZYUE2?=
 =?utf-8?B?WDVSL3BEdU1WSWptS0xoVzJXdng3U09Nc0wwdFFTRW90Ymh6eU5nSDhkbHVo?=
 =?utf-8?B?K1hMT2laYmwyY3d1M1JTNnFibVJqNWh6cEpaVjdZVnJsM3hUVENxZGFtNTV4?=
 =?utf-8?B?UXBzNjJPZzFQN25JMHdIU2ZoWHR1VlljSXZBQXZNdVltM09Icis3TXhhR2lm?=
 =?utf-8?B?TVprVW1RODNKaVJzTmQ0YlFLeXZ2cHpVSGRDaFF4aU1zZFlIdFFpQVFvZFhl?=
 =?utf-8?B?dnRlaHRIRDNBQTMyZk8ySUVUbnF6MEVBMXFRVEcvOTRDaXZUS21qN1RKQTJy?=
 =?utf-8?B?NzRxN2FUUHBHR0tMNFNZU3BGREFRekIrd3FaUzNsVzJod2hNUUMwdEY2SzVo?=
 =?utf-8?B?SittZk5lVm1IdzVCTmhIYXpEUDVHLzhFYWsyaEs5Rk9jcDB5UE45RS9CVmVu?=
 =?utf-8?B?V3FHNytZS1lFSEViek5yWk1NYk13RVhtbW5OYnJDUXB6WGV4YUNWK01naHhO?=
 =?utf-8?B?Smg3QlpzbHlCZXZMZmV3NVpkbGV2TDU3eFFVY0VoellydjV3VnUyc2hsWmpZ?=
 =?utf-8?B?WUxUdWkwRlZURHN5VVlZSG1IV0pseGVrNjhYTFMrRElBNTcyZ1R0LzhLdFZo?=
 =?utf-8?B?c3kyWVY4eUNoUWQrZ21KQ2dFM09XTjlEMjB2QWJCbzNNTnZrcTRJRnlRakJV?=
 =?utf-8?B?Wk8vZW0zYTFWVW5UWkttYjJhSHZHZjIxZlNKcTB6UnVoMm5TUzdYR0l2K2sx?=
 =?utf-8?B?NWM4a1NrczJ6Y1QvZnlHT0VRUnhZTDlyRFNoeEphUWcvSmROcmRXUEdvZDI4?=
 =?utf-8?B?TjN0cFgwRWJKbS9BQ0Y1eUF0VmtwL3BVa21pLzJKVEpidjEreG5hcXdGckZz?=
 =?utf-8?B?Nk1vYU5PUTE1emttNmRXTytrNG05RXc5Y2JlNmhqc3k2SHFtbkVpWjdCdHhR?=
 =?utf-8?B?clZUZFMzUmRaaU9wdmM2aFRRS2NZeDFXYk1GUjdodTBvT3RxYlB6NG5YZEVW?=
 =?utf-8?B?MGdPNU5BV05ZT3drVFhDY2VHV2R6QmFSUXBPS25JY21TMi9vSjZUT1poWEpG?=
 =?utf-8?B?ek1VTlhDK0M0QzBDOWJHa1lrdTR5NXVOY0N5NzFicnJFejhjWlFKZTVKcEZt?=
 =?utf-8?B?M1RGRUFoVEZ3L09hNzlGYkFIOERURC9jVzhzMXVrbStFYzZrcWRjTkRLK1U3?=
 =?utf-8?B?d1NkQkQ2dHpoY2NQNzBMSktnS0VYeEhmTzlxb3hyMUt6bXkyay9vL290WWwv?=
 =?utf-8?B?VTlYMXIrNlNmTjdrY1Uwa1preDdveEFWZ25HbVdRNjVqeFlJWTFnV0VyNGVw?=
 =?utf-8?B?MjIzOHRIeE4walZ0UFdrVDdXMlVVYXh2cTJBOVFxMEl0YTRPay9NUVRXN3VD?=
 =?utf-8?B?K0ZNRGorWUI2WW9CY3lVYVpCSmtxK3RTdXpyM1JONm9CSW9sdE04UCtkc2tu?=
 =?utf-8?B?WTAyZU05T1FMcHJtWXpVNXoxUUhGVDMvK2V6QlEzeDVDNVlRUTVpeGI1OEZU?=
 =?utf-8?B?UFFBMW11QjBub0VtZks3b250bUdCdG53SXpUbVBYZFVHdlFRWmJ1OXFWcnZY?=
 =?utf-8?B?TG15ekhNbk9NYTEzeG1TKy9EUUkwMXBhTGwwZy94dDJGSm0rV0duT3ZpRE91?=
 =?utf-8?B?ZnA4cmxjRi96NHYrampXT1ptMHpTd0E2OGM5WFdsTDJIc29oVmo2Mys4TXRH?=
 =?utf-8?Q?2EKB2+4nCdNj8LqiT2S/P2Omv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a887c8ee-cec8-40e4-09ea-08db3feeb126
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:24:21.2169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jij+uMjj7F9SHa6OcnLpeNkzvHS0hgufqPGzWWvQMI+Om7n5MPb5NCANz889mANF5FfeVyB1B3cmHLjp6R65hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189

... in order to also intercept Dom0 accesses through the alias ports.

Also stop intercepting accesses to the CMOS ports if we won't ourselves
use the CMOS RTC, because of there being none.

Note that rtc_init() deliberately uses 16 as the upper loop bound,
despite probe_cmos_alias() using 8: The higher bound is benign now, but
would save us touching the code (or, worse, missing to touch it) in case
the lower one was doubled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: Restore lost "return" in rtc_init(). Convert printk() to dprintk()
    in probe_cmos_alias(). Correct is_cmos_port() for hwdom.
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
 
@@ -836,9 +836,19 @@ void rtc_init(struct domain *d)
 
     if ( !has_vrtc(d) )
     {
-        if ( is_hardware_domain(d) )
-            /* Hardware domain gets mediated access to the physical RTC. */
-            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
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
+
         return;
     }
 
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
@@ -208,7 +208,7 @@ static bool admin_io_okay(unsigned int p
         return false;
 
     /* We also never permit direct access to the RTC/CMOS registers. */
-    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
+    if ( is_cmos_port(port, bytes, d) )
         return false;
 
     return ioports_access_permitted(d, port, port + bytes - 1);
@@ -278,7 +278,7 @@ static uint32_t guest_io_read(unsigned i
         {
             sub_data = pv_pit_handler(port, 0, 0);
         }
-        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
+        else if ( is_cmos_port(port, 1, currd) )
         {
             sub_data = rtc_guest_read(port);
         }
@@ -424,7 +424,7 @@ static void guest_io_write(unsigned int
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
@@ -2130,37 +2130,36 @@ int __hwdom_init xen_in_range(unsigned l
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
 
@@ -1249,6 +1252,79 @@ static unsigned long get_cmos_time(void)
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
+            dprintk(XENLOG_INFO, "CMOS aliased at %02x, index %s\n",
+                    RTC_PORT(offs), read ? "r/w" : "w/o");
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
+    if ( !is_hardware_domain(d) )
+        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
+
+    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
+        return false;
+
+    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
+        return true;
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
@@ -1256,23 +1332,25 @@ unsigned int rtc_guest_read(unsigned int
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
 
@@ -1288,9 +1366,10 @@ void rtc_guest_write(unsigned int port,
     struct domain *currd = current->domain;
     unsigned long flags;
 
-    switch ( port )
+    switch ( port & ~cmos_alias_mask )
     {
         typeof(pv_rtc_handler) hook;
+        unsigned int idx;
 
     case RTC_PORT(0):
         /*
@@ -1298,20 +1377,22 @@ void rtc_guest_write(unsigned int port,
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
 

