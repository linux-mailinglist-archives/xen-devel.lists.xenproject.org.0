Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5873B4448
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147189.271143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwljd-0008C2-IT; Fri, 25 Jun 2021 13:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147189.271143; Fri, 25 Jun 2021 13:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwljd-0008A2-Ex; Fri, 25 Jun 2021 13:19:05 +0000
Received: by outflank-mailman (input) for mailman id 147189;
 Fri, 25 Jun 2021 13:19:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwljb-00089g-6i
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:19:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4dd75fb-842d-46e5-9aa8-31da860c64c1;
 Fri, 25 Jun 2021 13:19:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-eaRjTwZzNQmLSfrWdTfcrg-2; Fri, 25 Jun 2021 15:19:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:18:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:18:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0114.eurprd02.prod.outlook.com (2603:10a6:20b:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Fri, 25 Jun 2021 13:18:56 +0000
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
X-Inumbo-ID: e4dd75fb-842d-46e5-9aa8-31da860c64c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQL1vwy7ts4g8z4e13aIolGoDY7pl/cPWGBcYrNuYnE=;
	b=gQZxib/zmcwV5HCIhJJ0nVp7979NOykdZR8C1q31Vagw01jz89RObyGrwOkVxJS/DygtWC
	vvryCpRZ6jeRv4sQyfU9QCtqXBANz+Rqu9NKvxXUWPqfrNqh7ZYVHlbQML5v/oF+tRxF0s
	SnWLZGs4cUsw6g2uP3FSkcPyNgt1Yfc=
X-MC-Unique: eaRjTwZzNQmLSfrWdTfcrg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNwmP2YsC9T0W987CpTTWoiLcipbJSRU+xEM+SJn/CdB5gny5Cc7qGOc04gAJPSWTNPeDuDGAQT0vQ48FlRE2710/AwnNj6O64Lq3Y5a9L5hkycMoK9ilGkEvlJ9pxD22503wmAsSY3Ut1iWNd333ik7Y/kiDVmUXl050ddZ2ldCQ/FuA4kgEo0OcWu5oYBtniyPrHnxM+/mpzFTxAFdtQBoea4CUy3eD91iQqvJZwJ05JHY9n7UI/MEW5wM4+rU4IhPDwMVWc65BxtynWqZE5H9LidLISLV/1NksRXDqVnWY6lxlP7WKj5VURAJbCkv47KxdfzDIMvBJvKU3a0AuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQL1vwy7ts4g8z4e13aIolGoDY7pl/cPWGBcYrNuYnE=;
 b=mjrarlw+2WB8tAuYjeyDcZtfEv6z+kET7NwbflCr2ckKR2mQW1/mzWewMXGWBg3sMm7cTf0B6ldheJ8u0jUG0dNDWCGpSHIpPw1ynun+vmtEz9RglyRe+hTkkx+hKEvAk26wSAyC7m/dKMB0/fKcwiPdYmk3H1k+7hy5N6UEBG5PpWiByPrMCcErvUfYSGBZV8C2+63BH6dMi7X2irrqZJecxwbzEWQqLndB59fZY9msdo8hqEUnIrDPY8qKUw4oN6dvS7rjkxnTODaTOiq7POv49RJBdKhWt0NMbtoqT58vBgDm6BWNqh3ZVX9yIZ6UupdzyICJJU5IeqeiUBURRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 03/12] libxenguest: short-circuit "all-dirty" handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <55875a26-7f1d-a6d9-9384-b03b3b2cb86d@suse.com>
Date: Fri, 25 Jun 2021 15:18:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0114.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83c55d88-8442-45e9-6d45-08d937dbc986
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59019F222CB5AB422428F0A9B3069@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:249;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uOJOvaTv/hzHcsAeuycdN3POoU68RRbn7eA223F7+xUILj5LXdg58c7k2FcSEcX9ljTfUyD7EbqiB4Z6c6om5wO5wgCGTMqZewDA3GsR1rYLYzH7rYyN8VLGYqb1MZzD+si0PcLzsU1+dfDulnlmRkJh6v1qP3M2d7gv49YNvvpxkQKRkzoorfE5r4jjGEizbJXzIzed7HStrYKYGRgyINg0AzmHPfhRVqpQKfHmAq2morshAXTkakf+qz9HcV51q1r/TL0CHYEBQFTEA7WAND7a3JNkQlNoW9gqzo6bOuL+zt5KFYEJZCyIU++WyFbiAFsYQZ+UwMvqAKk2s0AlXhvyudzZDQDPBOhKNTzb87Hq7KLkjNbV53dhm7GxklHN9jkuKLSp4Z2MnBk51D5oYUgM4pobAnUGbJB4fXpBhbCxov0OiFU5cvFo2qOo0AJmFrS5uIHrZpdenveFifaNxoiinh9cmT2bqa5hi5selNSq2WZZXQENLMA2B78yjCx6Rx3av2Ic7hBfAnf+oEb6UJ45WN1i3rkNmL/pG+MsjITz+fG3GYP7xq+/6OuyhuXOtmHtMTdYmHO7xqRUVhUEEB959BmdDv+T5qpCq8nwJEIfxQaRtJx6PD5dBLMDM/Pvn8UXBNdwVaBp2HqZd3iotutlU7dg7dIVtjPHl5uFFjQD2/wZ29YN80cJh8KxmZ88VU1rsvjFkWIOd1LrUrChKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(83380400001)(6666004)(2906002)(66556008)(66476007)(2616005)(956004)(31696002)(86362001)(31686004)(66946007)(36756003)(186003)(16526019)(26005)(16576012)(316002)(8936002)(8676002)(6486002)(6916009)(5660300002)(478600001)(54906003)(38100700002)(4326008)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0lRdC92cGs0Rm4rd0pWR2tVaTh3SU1NUXJOTVUxK0U0UDlzd0RtYkp3a0Jn?=
 =?utf-8?B?Yk96Y2pSTGs5WHJFQ2grUDhHZWRCZVdzVmw4ejVmNUl4L3ZPN0NINFNJbng3?=
 =?utf-8?B?anA3VW5lT0RpeEg4WlhETUlCQmZuT0VKNnBtTll6aWNhY25qWWZvSno1UW83?=
 =?utf-8?B?VjlFcmQ3alFndS9WbXFOQjNiY2FRMjNLN0tHbm9Iem8veTU3cU1UZll5aGpI?=
 =?utf-8?B?TVpWbm1oOWJkQXo3ZC9MVVlqTE01cC9rU0liWW5DMWd5T05CMDRMYzEzaTc2?=
 =?utf-8?B?bDhXVks5eDJwSEV5c1NVNkRidERodDFsSGNkT01KVjJtdGliU3grNEdJMjhZ?=
 =?utf-8?B?cG5LaFNyNWhKZVBwMDhBRTY1TXhSbTRsZ2kxaUVWRUFGZ3NkSjRHZmMwWU9j?=
 =?utf-8?B?d2l5N2E0VzhiamVJckw3alAwWVhYNmNoR0tQNDk0Ykp2aU1ualR3QXBjeGZU?=
 =?utf-8?B?QUp5ZU5CVmN0K2VWRDFsTjBoanNJeWhRV2FsWTdDbjRKMG5aVjZLdXhBcFZ2?=
 =?utf-8?B?VUZjNDN0L2RFaHdjK08rNGFBMEhzS2FIM1FtRTJuSVBYc1JUcWRQRFlOeXFI?=
 =?utf-8?B?WFYwc0RPZjFIdGxnY01PamcxR255VGt1U242UEFJS0ovZ2tMNHVtMVVVckF4?=
 =?utf-8?B?YUxjdHJBanQ0NFdFc09UR3kzYlNaSzUweHR4dTRubjBJekEvQVhnZlBObTkz?=
 =?utf-8?B?bEVFTUtDWmhJWi9hd3dycEgwYXpOWHhKNHdXSFlVOG44c3FmV0YvM0NRNGlt?=
 =?utf-8?B?d0ViaEh1akgwaXNFV1NjbWFpVEFUeEo1NTdpMEFWRXlxNmJqajRSSk1VSGx4?=
 =?utf-8?B?eHQ5czkxY1lDU3RHNUxJd1ZWNTd6L1RaTUo0alU0U3ZvZW5uWnZEWmJaaWRE?=
 =?utf-8?B?Z1FUQTNaZThlSEpJUGNmTWl6VUhyY2tFRGFLd1NYRDR1SWtBL1VZc2JpQWhp?=
 =?utf-8?B?a3RoRkxBQXlSQ0xOcUc1MmlzVit6UzgvLy9tdkFRenRjSlBzRFhhZFpaNWwx?=
 =?utf-8?B?ZWNqZk4rTEk3dVU2TnNYcmxvM3dMN3A5ZnhGUnVrOHgzRU5hOTFhbkZKSkJW?=
 =?utf-8?B?dXdZVWtUY1FXblVTblFuVitJWkkzYVdHTnYzQyswSlpPZjFLZnYwQ2V4Mm9J?=
 =?utf-8?B?YlRqRWMrNWVrTmdDbzRXd3IyS0JKeE5UYkdDblpGODNnNks4OEx5eVppNStS?=
 =?utf-8?B?NVh1WDc3ZlMxdExSZ1RtaHVGbFZKODRyV2lQdG5KeDlzL2g1ZzkrQU1TUmhZ?=
 =?utf-8?B?S1dURzJMM2xxWWdLb1h1Y3BUZU15M2h1YVhjNHF1YzNhNlg0YXR0RWxVVzZB?=
 =?utf-8?B?QXl0OU50d29BdTJXU1h0cmlhcG54RTdXcFplSkk5aUU2cGxneXNZZ0s5SVNv?=
 =?utf-8?B?RFBEZyt6QzRJUTFPY3lhZW4rcncvcjM1Zk5KeTdJTGFPNHJQYy9CMHE1K2t2?=
 =?utf-8?B?ZjZVbFJ1cmxZbHlhOXg2RTJVR29Jb09nQURWek4wM21VYS9ZMEJYSlVPSlVR?=
 =?utf-8?B?ZUx6ZlRJSUhmOVIrM2lBaVp3TENNUUhTYTBVWWpkZGpneFZTZ3pvUG5xTmI5?=
 =?utf-8?B?TlhlT0J3bVBxOHZZelRCUERkVHdLeHZHQVZXS0Q2WCtwc0F2MmtkUXNDOUZ2?=
 =?utf-8?B?azcveCtRUnM1MVZ2SFlqbjZ2R3ArVGszT1YxRDh2VElsKzJpNGxIVmtaYTdl?=
 =?utf-8?B?dEVHei9HUnIvN05Lb0pxZ1YzNHlHNjZLVkFkYk8wdXFhdGVlbCtrek82OTA1?=
 =?utf-8?Q?FnfLI9YY3rYxgOsR6yKasOvgMkVpOrxMGNbozgF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c55d88-8442-45e9-6d45-08d937dbc986
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:18:56.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvGUnKf9pEd0JKM3jjrLR6nEpfozfE1dJzaxyqNjcGQ0FEVYcyCLiJ8q7KkAkpK36p5Qdwm7beKwH2ddilYptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

For one it is unnecessary to fill a perhaps large chunk of memory with
all ones. Add a new parameter to send_dirty_pages() for callers to
indicate so.

Then it is further unnecessary to allocate the dirty bitmap altogether
when all that's ever going to happen is a single all-dirty run.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -368,7 +368,7 @@ static int suspend_domain(struct xc_sr_c
  * Bitmap is bounded by p2m_size.
  */
 static int send_dirty_pages(struct xc_sr_context *ctx,
-                            unsigned long entries)
+                            unsigned long entries, bool all_dirty)
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t p;
@@ -379,7 +379,7 @@ static int send_dirty_pages(struct xc_sr
 
     for ( p = 0, written = 0; p < ctx->save.p2m_size; ++p )
     {
-        if ( !test_bit(p, dirty_bitmap) )
+        if ( !all_dirty && !test_bit(p, dirty_bitmap) )
             continue;
 
         rc = add_to_batch(ctx, p);
@@ -411,12 +411,7 @@ static int send_dirty_pages(struct xc_sr
  */
 static int send_all_pages(struct xc_sr_context *ctx)
 {
-    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
-                                    &ctx->save.dirty_bitmap_hbuf);
-
-    bitmap_set(dirty_bitmap, ctx->save.p2m_size);
-
-    return send_dirty_pages(ctx, ctx->save.p2m_size);
+    return send_dirty_pages(ctx, ctx->save.p2m_size, true /* all_dirty */);
 }
 
 static int enable_logdirty(struct xc_sr_context *ctx)
@@ -508,9 +503,6 @@ static int send_memory_live(struct xc_sr
     int rc;
     int policy_decision;
 
-    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
-                                    &ctx->save.dirty_bitmap_hbuf);
-
     precopy_policy_t precopy_policy = ctx->save.callbacks->precopy_policy;
     void *data = ctx->save.callbacks->data;
 
@@ -528,8 +520,6 @@ static int send_memory_live(struct xc_sr
     if ( precopy_policy == NULL )
         precopy_policy = simple_precopy_policy;
 
-    bitmap_set(dirty_bitmap, ctx->save.p2m_size);
-
     for ( ; ; )
     {
         policy_decision = precopy_policy(*policy_stats, data);
@@ -541,7 +531,7 @@ static int send_memory_live(struct xc_sr
             if ( rc )
                 goto out;
 
-            rc = send_dirty_pages(ctx, stats.dirty_count);
+            rc = send_dirty_pages(ctx, stats.dirty_count, x == 1);
             if ( rc )
                 goto out;
         }
@@ -687,7 +677,8 @@ static int suspend_and_send_dirty(struct
         }
     }
 
-    rc = send_dirty_pages(ctx, stats.dirty_count + ctx->save.nr_deferred_pages);
+    rc = send_dirty_pages(ctx, stats.dirty_count + ctx->save.nr_deferred_pages,
+                          false /* all_dirty */);
     if ( rc )
         goto out;
 
@@ -807,8 +798,11 @@ static int setup(struct xc_sr_context *c
     if ( rc )
         goto err;
 
-    dirty_bitmap = xc_hypercall_buffer_alloc_pages(
-        xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
+    dirty_bitmap = ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN
+        ? xc_hypercall_buffer_alloc_pages(
+              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)))
+        : (void *)-1L;
+
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);


