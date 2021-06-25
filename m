Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730963B4449
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147192.271154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlju-0000EW-QQ; Fri, 25 Jun 2021 13:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147192.271154; Fri, 25 Jun 2021 13:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlju-0000CO-NM; Fri, 25 Jun 2021 13:19:22 +0000
Received: by outflank-mailman (input) for mailman id 147192;
 Fri, 25 Jun 2021 13:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwljt-0000BR-A6
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:19:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3876b446-720e-438f-8a23-29219d538974;
 Fri, 25 Jun 2021 13:19:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-nVKnUX0mNEqqLjsdmkd90w-2; Fri, 25 Jun 2021 15:19:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:19:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:19:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0033.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20 via Frontend Transport; Fri, 25 Jun 2021 13:19:15 +0000
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
X-Inumbo-ID: 3876b446-720e-438f-8a23-29219d538974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kW3iCE9fvyJLe9hO7RfRRXOuY/QBfyW7eYF2CsurNMU=;
	b=aGWee49w4Kkv/xZDcQ2uxbMoIa4dQ9k1Vdzd2/6sbue8TxSkjAo98ILL6FYvtJTcHNG2R8
	2bujOMptxXtzXrj3fpTniSvKel+RLQ3gUC7QKnp3oG4Jc7H2e9PtbBSwxtVx/FhUwZ3HOm
	Ngtkux4dg5K/NCcdsrGF89VxEwm/HLY=
X-MC-Unique: nVKnUX0mNEqqLjsdmkd90w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0adlsIZDwqut6iKJRexBGQ7RlufCXEPL311HT+XMQB1cl11Rc57/HFl+3uj9PebXiMF7rrvoBG8xLKbBxrueR7+4IbLEFSmYhx1JA3WPGpunmN/OMOnvtm6eRDcofwTldVUIFYYVte0SbgshlGBlmHIizbbQk7rhB/2bk2Fl5+cj7ICHAdBeIwk00mihicVKfyyAkhVqLTm2V6R37fes3nTv1votHfGLH9nF0iFWE8ag9fQpTBQ3lFASXnu88zNTA2qmN9EDnG5SGPvDv5tmJrylgAFV1x15rBbsshuS74lIm0QP5VYQ3PyhqYefDRpxHMcIzcnnd54Hdh5NrOoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW3iCE9fvyJLe9hO7RfRRXOuY/QBfyW7eYF2CsurNMU=;
 b=UG1rKIkZkbhAkORRCxDol9hed9azsbjGim89dcmK69dX+bxo37XcpKJkcn3q35wCUCqvTZ+zCFEoIrzsd64Vww1NwXjgwNNLgQ6EaPxMrma6imrsWpp5fc5ahM1uRGZPEaGL8lL6Jv/PQ40EHhiRnIe+ktk9dnPe2gOnGZMXSGVsAA3voKb6yo+IjEwb13fN+kQh/0dI9zF8FjQLvSprTzuH+IrwQUDyLN/kfikpcVDbZW5iFrx/dUguz53J2053XLnJqACijAr9YNqVZY5gZzomosE7qFO3wCB+ePQSUEo9maTh24YpgvAHGqlUgLVrPGR1oR+viSg7xioRmC+LDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 04/12] libxenguest: avoid allocating unused deferred-pages
 bitmap
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <61ff4f26-a9cc-d123-98a0-be6c23f21e9b@suse.com>
Date: Fri, 25 Jun 2021 15:19:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0033.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa0caaec-8a0a-47ec-6d9c-08d937dbd4ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59012318B3BEA6FB88C068E2B3069@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2HN5GcRqtmDaS09naiM8ERfwbwRWg/xYvfpGCQvv+DeTf9gDB3TTFsem3L46kh2zius2NrPfSLdsSJEq6CG9uxYb3rQN/JRJksCekcM4V07SmvXEpC8RXmK/k8lIlyzJeoadIRJzpIPjMRq2zmCNRmft7G40uSBlAswXpssEU2SAPsI2rHb35y/KD1gtHYCIv8C5WuPQJb0QwaJMfNU8LxD2Je4TzBJAuj5lEHudO63s9ndcq4g9NXEmcTwwodZhGze0G8tL+IYbMyrRtU7RBJ4TfJgOR92Hmu4BamJbrghc2YrOQTFNfMhfoV6VqpgAtiOGvl46auQBNmziVfQghwqkmQ1nNw0NComru9NUOXZFY64i99sHBYhBWq9UaMklIUAv+pl07r2qaIyRr1DrN766gOE+Yr6mKGCxXwWtZL2j7IXClQaQk3fGS8G0PKM8vZzJitkVHJud7fTfza+hhzu3GE+sI1NlAL9zNpU4RHepz6wgGXbLw78nLmX1zJeea9ceh4KmON+TDSCesjqL9NLWbTsrDEenQsntNwDO1xothBBWpDpz2Tv07L/5TV0u9xDJylKVy6VLS3Zsq4G6ERB1spPS46N83jN7COFcyrQmPGcE8Qpe/aOYXNa7nQg7KRiMLBf40avMVP6q/xG/yApKyT1PBNH8n9UttmZZmVud9PiqcjcqPdinkRMmCqXf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(83380400001)(2906002)(66556008)(66476007)(2616005)(956004)(31696002)(86362001)(31686004)(66946007)(36756003)(186003)(16526019)(26005)(16576012)(316002)(8936002)(8676002)(6486002)(6916009)(5660300002)(478600001)(54906003)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekdkWmE3Ky9weERpbWJEcWtOVHAyWmNXN3ZBcUs1M0tTR0pLOWc5QXdqT1B0?=
 =?utf-8?B?RDV0WmplRUlBS3F0Y0J5UkkvMFk1U2hZVXg0dUpiaWR3NytFNmZKV0dXYUtn?=
 =?utf-8?B?N1M2S003TEY2M2JMeXZKbTNGcDRuNldkY2Z6aE1lOTRMSmNMWHBQWDYrMC9Q?=
 =?utf-8?B?SGp6SkVDbTFxRm9WS0cvNlc5V2hRUlFKMUs3bVc2ZzI5QVlFb0FtNWMwdHdr?=
 =?utf-8?B?RjdhOWJRMEVMYWptVWtucDFlQmpVbS9HaEQ5L29RQ0dseGF4MmhrWk9DS0lE?=
 =?utf-8?B?QWZxeVV0S0F0NzArQ0pBYnFHSTZ1MGhuQmU0cWF2VWVOQ3NsUWphcWxWVDda?=
 =?utf-8?B?OFlYblUwWTlwTG5jdTlNWmhPL2tXWHoxMUlCcVBpRUo4RVBrRDRTalFyaG1a?=
 =?utf-8?B?aHl5TnZkVHlIaCtKNm5PS0x3RjZGOGkvNitmaGEzQzN0THcxYzVaV2hKRzF5?=
 =?utf-8?B?L1ZaMGtXcmZNUE94ZlI1VnYzc3U1K0piMS85SE1lVW0vc1F0dEJCbG8xaVNP?=
 =?utf-8?B?clVqZzN2Vlk0aGloZUhBN2t0RlZhV1Bqb3Rtc3N6MGxhbGgwVmEvVHIwOEpC?=
 =?utf-8?B?ZTYybklOVllQR3YvYVRQM00xL3lVL2J0NEROblh6elp1dlNjNnFpUE9FUjc1?=
 =?utf-8?B?Q1BYa0NxbVhNd25uQ215VGhJMGN2R2drb1B2ZHZJaXFqNVNQRkNCWHBWQ3Na?=
 =?utf-8?B?Q3V3cU5WbWlZbVY0SVQxei9HdTRhbmFLWkFZWDkrV3VZQVkzZXppRk8zV08r?=
 =?utf-8?B?VExQUitjcUxscUU2ckkzYWxoNXc4Y2dkSW9QWUxua0RrSDU3Wmdzb01Ua2Rx?=
 =?utf-8?B?WFFybkFXNVVINkgyaElzYjZmSXN5eUZuODdaVEtrWERzWFYvMnZ5Q1d4TzZB?=
 =?utf-8?B?S2VQWTFPcVpvZjBkZFpOYnlqbUJuVVkzSHhtK3JoekpUWXlUNjhSMGFwL3J5?=
 =?utf-8?B?TUVNdjBpSlNKblJrVXZRc1l0aEhIZUdhMktHUFJIOFBtaGRaKzNnS1ZQbW9I?=
 =?utf-8?B?c29GdmtFbHQrTlJJSHltRUY0dWcxVEJPUDJ0YzcvaGU5WTlLQjBsWlVnanB3?=
 =?utf-8?B?WE9JL2o0R3l3OGNPNEFUbDFLanNRQ1Y0d1hiVyt4YzlGRG5mblBYeEticUJi?=
 =?utf-8?B?TytnV2RPNmhYeTBTcUpub2pWdkVhcXdNcTdXVkhTVkF5MHkvNzFRNWMxdFZM?=
 =?utf-8?B?ZXR3bTFXS1JpalFtUXlSclBTYXRiZGlPcnJQQVZiUFJlSXJHV2lwZmRNRHZ1?=
 =?utf-8?B?T3NrUVltdXgyZFppZk9jSXN2RGlkWmZvaUx1RU4yR05oT2doa1lhVVhISUQ3?=
 =?utf-8?B?MWVjcmNWQzljZy9NZnlNL1NFNXU5Vk1HeEZQckJJN2lyWW1LSUhyRlJ5eThy?=
 =?utf-8?B?c0VvQ2cya3RzbU1mQytQNXZuOHROa2t3ZFFsd1lKc0Z5c1lET3FzTFFLdm9u?=
 =?utf-8?B?QTBhSXF3YmlwT3FweDFETVBOemhLaHVVQXQvcCsySUFSUGhaYUpERFZSSjU2?=
 =?utf-8?B?eURMK21qWUxOZTh4V1hkMEdZN3lWTGhvRGlOR0lCZTlaQUR5WkV6THlKYXdV?=
 =?utf-8?B?OWpLc0EzMG0xTzNMZGh2M2VzaHRXWHo1YnpaSWtZN0o5dzRaTkJuWXYvUHl0?=
 =?utf-8?B?S2RGdWFhemhqUjN1S3lTL0xwMVZjdy9rOCtUVHlkRFU2Qjl2VGlObFJpVVhh?=
 =?utf-8?B?Uzd6dVBLS1dxbXR6d2hxSFA4RVNtNGJYWThDTE0wVjlhaWJMN3hRc2ZaTWRG?=
 =?utf-8?Q?PqgaEz4YHAe3hVLRNlqUphePYRMpgiC3pHWQgm0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0caaec-8a0a-47ec-6d9c-08d937dbd4ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:19:15.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piVoYQ0WmFCmSEyjix2zX79A8CKVn+S90U/2PfGsGZ1nu9ga5ypiF5xMC/LJ51p5frhKRpxGYsfNnMC0Ihe9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

Like for the dirty bitmap, it is unnecessary to allocate the deferred-
pages bitmap when all that's ever going to happen is a single all-dirty
run.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The clearing of the bitmap at the end of suspend_and_send_dirty() also
looks unnecessary - am I overlooking anything?

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -130,7 +130,7 @@ static int write_batch(struct xc_sr_cont
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
-        if ( mfns[i] == INVALID_MFN )
+        if ( mfns[i] == INVALID_MFN && ctx->save.deferred_pages )
         {
             set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
@@ -196,8 +196,12 @@ static int write_batch(struct xc_sr_cont
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-                    ++ctx->save.nr_deferred_pages;
+                    if ( ctx->save.deferred_pages )
+                    {
+                        set_bit(ctx->save.batch_pfns[i],
+                                ctx->save.deferred_pages);
+                        ++ctx->save.nr_deferred_pages;
+                    }
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
@@ -665,7 +669,8 @@ static int suspend_and_send_dirty(struct
     else
         xc_set_progress_prefix(xch, "Checkpointed save");
 
-    bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+    if ( ctx->save.deferred_pages )
+        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
@@ -682,7 +687,8 @@ static int suspend_and_send_dirty(struct
     if ( rc )
         goto out;
 
-    bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
+    if ( ctx->save.deferred_pages )
+        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
     ctx->save.nr_deferred_pages = 0;
 
  out:
@@ -791,24 +797,31 @@ static int setup(struct xc_sr_context *c
 {
     xc_interface *xch = ctx->xch;
     int rc;
-    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
-                                    &ctx->save.dirty_bitmap_hbuf);
 
     rc = ctx->save.ops.setup(ctx);
     if ( rc )
         goto err;
 
-    dirty_bitmap = ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN
-        ? xc_hypercall_buffer_alloc_pages(
-              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)))
-        : (void *)-1L;
+    if ( ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN )
+    {
+        DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
+                                        &ctx->save.dirty_bitmap_hbuf);
+
+        dirty_bitmap =
+            xc_hypercall_buffer_alloc_pages(
+                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
+        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+
+        if ( !dirty_bitmap || !ctx->save.deferred_pages )
+            goto enomem;
+    }
 
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
-    ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.batch_pfns )
     {
+    enomem:
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
         rc = -1;


