Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDE66C0C48
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 09:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511759.790980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAwR-0003R1-7i; Mon, 20 Mar 2023 08:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511759.790980; Mon, 20 Mar 2023 08:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAwR-0003Ng-4S; Mon, 20 Mar 2023 08:32:31 +0000
Received: by outflank-mailman (input) for mailman id 511759;
 Mon, 20 Mar 2023 08:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peAwQ-0003Na-3n
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 08:32:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf612014-c6f9-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 09:32:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8804.eurprd04.prod.outlook.com (2603:10a6:20b:42f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:32:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:32:22 +0000
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
X-Inumbo-ID: bf612014-c6f9-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou8osTkq/UpMRJLYdJoBw3gx33ZPjwE5rRRVatsFpmdrNrHj02O59QSlHkIhvKzsVp1ZNVtWpS4qC4IfMJSDNefeSuO1SIIDoGRmaC+pphLxrg5XEOMBpLsFC2BMih586ZG5me+VRkM0I5dwNZYRFD2zo3db9GoZOo5f8HCEGsqhS0e5Jv6X12X5I9pxeZY2bnY/zm5r8ItFcqqTTfejyB3VwK4AUwQtkvABzskEMEqstZNd0nbCtjf+5byWtXabl4GywOS3PdqiS7jN6gUFUc3T44LPivbEgxZXr5CHv3ZzOC6N1Mq4dd1oyFi8oqjtMZCS+cnSsCm65Vd4c6e6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTpCBMa8NzJbWQ9OeibEZHOFWtUwjRfdd29CEHFng5g=;
 b=Lj6/P+KUGHnBeh//0RrPfl+0jtjR6B0BQSybFN4RAN49pq/4A2NWUyZJFl3AVJ65kq9OStIw0+uUQ8IIm5I44VEFmHHkirKko8RT+oygcx87ubSkQpKjApdY6uIbv0jiHsc1HRCqrQV9uQv9iuX9nzvJ0wqClKrQl5DMov3HYCi7YMWaR6x+7cn64qQk8gdeKkxajSbdE0p+FrOFvK5lWduWPUwfT3T5Y7/5FxohZElUfGrkiVZNf1iwhbZt6ZAZ9//BwnGbJWEojKRj2iJdRESyH2Opd/fSdJlVyj68xJEb46PLQGJn8GAx2ozPi0CHDn2Ygy25iJ8gquVw9jQ+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTpCBMa8NzJbWQ9OeibEZHOFWtUwjRfdd29CEHFng5g=;
 b=G0oEy9KJ3zBMALzaBG/+i977SVs3SFkee7QGPnphlE8LisVouFdjLf/meNdROpE+anRl+Bavf03wo1ocWcr/TaLXG8kvXs7k2SjFdOoIlWZBwTGC21d2wlDgOsMtWA6ehkmoKT3c3z83J1onJ7bRYXda9g/HnAJQ9XAX+pVPcM+CJ8/rmCLtgwT1Dr2enCeYNwvbd+gJ6COqtO/WSSfgDKv2bhu4RL6LZmhBDRyTbEDAus/gKVTmpVUMwxNq+JNcuDfttvTNlIUWIkhj9CVJ8V5+gu8di3XU6EIbmfWIONf2DvxqmYCqVbQwvo7KadeRl3jtgM8YC9ofSmLohxF4aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
Date: Mon, 20 Mar 2023 09:32:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86: detect CMOS aliasing on ports other than 0x70/0x71
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Language: en-US
In-Reply-To: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 74271051-f8a8-4c2c-9068-08db291da04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W+u/YnIfrJGJKTfFit9cKHNNKRj7tAAkEhPrXAr/ZcUhfFAG7sVCPZmQsOSayfqZJ+/tQJcChzbutYeEf5Nsdr38lQ9H/MsvIBksUp5Zngd9nri+oH0frPmOqGdSNGCIqsXU84HpjybAOPo7bZTjWPDwifbokgWPNyUAxxnFlpuY5m0dYVEZmJurdIMaDQXddNQ8k3Rxz/u85OSbR9YQjy/pj2gn1b53Z9GzMfi1QlKzj4rOpeY4DthCe8Ff13PTHpuFnxrve+ev7YUQdcbcgBS+8/sLmMRaih3CgtpOyvPwrqCXbGTcPxymKwcWB4yAd0DjbKmEXqNtbLum+O+gz4QeF6B8kfLQHLYZRmLD+FM9ux8hwBqk6v4i2AMT4pg1e314PVrkdMqVeX5WAkkVnohR3RgNDpFi4V+p0CkpKzv9llau6/W99haBRzBbRbs0oNybBgzCGE7voT1VGjR+KBJ11Ype1+sXv9GL+mwQbMcSbrGSDrdo56Aow0prxAjPnyOZAkn6XjVVEnB8GLExiAzgQI30zd1NllTLbhluyHRx//hBqZ6ZXM9OrHrRn8vZVIgmcgE0ItnwyemveFP1MUGuihHk1RwudL01LOZecjvIw6Ww3uvydswyMQoimkJogIanXqsmiF4YlZ7SiSHlSh4MfZytLGZjszAFMeZY+505KLo/SY0YIlAwQUrNH0r+h+IoyB41GNXLFxw7zrtN++rSHze5CF7n97aRfXFrZ9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(2616005)(6512007)(6506007)(26005)(31686004)(6486002)(316002)(8676002)(54906003)(6916009)(66946007)(4326008)(66476007)(66556008)(186003)(83380400001)(478600001)(5660300002)(41300700001)(8936002)(2906002)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2xBZE9aYnk5djNkRlR0ZnJJWnMyVXJTQVNXRHVRcm5iN2lFTDI1WlFrNnZY?=
 =?utf-8?B?M0QySHUyTFJrc21NY2E0Zmxac3VtOW1HKzJqT2h4dk1QNnRKSFJhSWVKT0dC?=
 =?utf-8?B?bGNZWjNma094Wm1XbGhkbWQ0YWl6UXVTcy8wYVZNbDdzcWpja3E2NkoyNmZi?=
 =?utf-8?B?M1lic1pwbzBZZ0gwci9MbUpuMlVmaVJueUU0ZitMc0FDT05zUDRQc0F4bEN2?=
 =?utf-8?B?Z1U5OEl0ZXBVTXdIOTZFU010WVY2ZzhXS2s4cUpweVlHaEpwd3luU3FUU3cy?=
 =?utf-8?B?NUVadjBNcE0rWUVoSWVaZ0JkaWlpR2tWb2tlU1hEeldWMDMrengrK0NqZ0hu?=
 =?utf-8?B?eFh2N3pwUkNacFVoUURTamxDNFpvSHVMcmNWaitXeTdmVkIwcnozL2tkTmhR?=
 =?utf-8?B?VnNGRjBTNGJ6UGxVb1pjRXcrMmx4L2Y3Mkx0dSt6SEV6aWRNVm9xWG9DSXhu?=
 =?utf-8?B?OHNlUFgrZkovRDFDZy9WUkRpdVUxeThmalR6T2dIbXZXaHdrTFRGQTcrTVFl?=
 =?utf-8?B?MllVWHVjWDVzUmNjYmtUSHo4Nyt0ZDV0LzdWcHl0MlNQQnJQUEZxRnllNWxJ?=
 =?utf-8?B?a296ZHdGTnp3NzUyN1p0WjgvWFBnL1JhMThPNXpwM1B0cmgyUVJ2UUo1aks5?=
 =?utf-8?B?RHVRUHVRWUNPNUJGaTBDS3lNWnpxWG81eWVLY3FIWFdCL3dhUmVnc1NUb2U4?=
 =?utf-8?B?anFNTWRRdmhMWW9hRnZlWUVJSXVlNXAxd3FNdlRnaWJ2Nnc2TFA2K1QyRWlq?=
 =?utf-8?B?Q1AxakhqcUtTMXM3b0J6V0U0VytSZFZwVkxSVTdxd0lHSEZlT3BjTjRYMm9C?=
 =?utf-8?B?Y1pocEJTOGlpRUpDT1ZFYzdjZW9MUmo5WnlQY0w0bkdsRG10RnRpV3A0WkJy?=
 =?utf-8?B?NklKTmo2Q0h1ZXduaEVuK3drVGhLOE1iN1RVSlFmRXJMQlRBSU1HVm5zYkxP?=
 =?utf-8?B?MHV2a0tjV0dKdmpaam9VQnE3YkRZbzlCSVhBV1JDZEkwekZzdDdJN1F0T25N?=
 =?utf-8?B?QTF0NzAwS0pTN0xxQ1AwQStUTTZIMklwNnRZYkdEdzNXVmFvZzh6c0JEam1K?=
 =?utf-8?B?elFEZTVqbVQ3OXo5eEdtUk4rb2ZmSEtlUCt4emt0bUVuQjdMUzhib2JBS2RP?=
 =?utf-8?B?eXdENWlneFRSalhUN3BPSnBwSGNJWFRsZHZOZG0zRkRZOUVOS1NDVlhuZFY5?=
 =?utf-8?B?UjRlQkF1VXhJdGVzRVowN1FKZmswbVZpd0pzTGlrOG5DQUEyZ25UdHRpNk5S?=
 =?utf-8?B?YW5BOCt6OWFrb2VHVVMvcWgyR1FkQ284RnlOaEwrK3pXM2huOU90U3ZHZGdZ?=
 =?utf-8?B?Q0VTOW1pYkVoSlU5TDZ4eUkzeFgzSFZ0VWlIaFNDdllpRGgvZTlPbUpkb2ly?=
 =?utf-8?B?MTZtbDYvWDhaU1J6TTNyWHRncEhoak8wbEFTTVhlSlNNb3J5d3VSdU04SHdj?=
 =?utf-8?B?Y282aWU1RlBoNTl6VVR3d1M0UFZZQk0wY3p4bUJ1ZmhjczN4Q2hCa1U1Y3I1?=
 =?utf-8?B?R3J6VmNZdVQyM3R0TklHZExCMkFLVC9keG1hZXhhNCtOdFlaMGxxY2daR3px?=
 =?utf-8?B?ZUNZQjVOanExWFlzRExLNUo4Umd1Tkt4T1pkWFovUUtUQ3RDeXpXNDhFRGlX?=
 =?utf-8?B?RGhtUWpjNVVxb05VckJkbG9zbzlydEZzYnRqWDRYMUxwaDg2Tm1KcHZiM203?=
 =?utf-8?B?OW1xZWQxOEdGWkNwRDVwejNrY0xVZGpQWmRsamFqL05xcG4wbTBhZXRMbHh0?=
 =?utf-8?B?cGxLSHE4MmlLQkdidjhMUlRlRWYxcDVOYm5rUFRoZEpZR2xWeXJ5b05PRSsz?=
 =?utf-8?B?TjIyZ3NMeVRRSy9FTXhOa0lxYWZUSktpVGFvd3pVVVRXK25odGFWS0RqTUhm?=
 =?utf-8?B?ZXlQZHRMVHlTOFQrQUNWaDNhMlVSeDlTOVdidUNNVUxsUms0QnFlTWlIYXdu?=
 =?utf-8?B?OFFrdHd2OWNPWTZvVXpSRE42bVJqN0k5REdVTnY5NVdjb1VzRVFTMkZSZGM5?=
 =?utf-8?B?VktWejhPVGZuR0EyS0pzOElONnVmemVZL080cyt5Mm1qWksvdXdYaXhCL3lp?=
 =?utf-8?B?b1hjaDBNM3pQMFlyamNiV0RUOWNQUnYxSjdNWE8vR09IN2JUOVF3MnUzTzZR?=
 =?utf-8?Q?T6GWXr3uXoQT4Ehj8myTQY7E/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74271051-f8a8-4c2c-9068-08db291da04c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:32:22.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIRD+eUpb1YEVFJL9Q0o5tTWUaulAswOedK64CmocXTRjLWYKzISw/Cacl47+8kLimbE23+hsIeC8Zaatp2lqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8804

... in order to also intercept Dom0 accesses through the alias ports.

Also stop intercepting accesses to the CMOS ports if we won't ourselves
use the CMOS RTC.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
+         * Hardware domain gets mediated access to the physical RTC/CMOS
+         * (of course unless we don't use it ourselves).
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
@@ -2072,37 +2072,36 @@ int __hwdom_init xen_in_range(unsigned l
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
+         * consistency with PV.
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
 
@@ -1249,6 +1252,80 @@ static unsigned long get_cmos_time(void)
     return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
 }
 
+static unsigned int __ro_after_init cmos_alias_mask;
+
+static int __init cf_check probe_cmos_alias(void)
+{
+    unsigned int i, offs;
+
+    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
+        return 0;
+
+    for ( offs = 2; offs < 8; offs <<= 1 )
+    {
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
+    if ( !is_hardware_domain(d) )
+        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
+
+    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
+         port <= RTC_PORT(cmos_alias_mask | 1) && port + bytes > RTC_PORT(0) )
+    {
+        unsigned int cmos = RTC_PORT(0), nr = 2, step;
+
+        while ( cmos_alias_mask & nr )
+            nr <<= 1;
+        for ( step = nr << 1;
+              step < cmos_alias_mask && !(cmos_alias_mask & step); )
+            step <<= 1;
+        do {
+            if ( !(cmos & ~RTC_PORT(cmos_alias_mask)) &&
+                 port <= cmos + 1 && port + bytes > cmos )
+                return true;
+            cmos += step;
+        } while ( cmos <= RTC_PORT(cmos_alias_mask) );
+    }
+
+    return false;
+}
+
 /* Helpers for guest accesses to the physical RTC. */
 unsigned int rtc_guest_read(unsigned int port)
 {
@@ -1256,7 +1333,7 @@ unsigned int rtc_guest_read(unsigned int
     unsigned long flags;
     unsigned int data = ~0;
 
-    switch ( port )
+    switch ( port & ~cmos_alias_mask )
     {
     case RTC_PORT(0):
         /*
@@ -1264,15 +1341,16 @@ unsigned int rtc_guest_read(unsigned int
          * of the first RTC port, as there's no access to the physical IO
          * ports.
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
 

