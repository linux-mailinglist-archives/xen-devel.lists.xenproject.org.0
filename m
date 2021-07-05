Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E971F3BBEB4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150322.277960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QIK-0003wI-78; Mon, 05 Jul 2021 15:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150322.277960; Mon, 05 Jul 2021 15:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QIK-0003tX-40; Mon, 05 Jul 2021 15:14:00 +0000
Received: by outflank-mailman (input) for mailman id 150322;
 Mon, 05 Jul 2021 15:13:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QII-0003tA-EY
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:13:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a1febcd-6349-4668-9704-c8963c68a6f5;
 Mon, 05 Jul 2021 15:13:57 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-hhwCXXzpNOC5omsRL79SXA-1; Mon, 05 Jul 2021 17:13:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 15:13:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:13:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.22 via Frontend Transport; Mon, 5 Jul 2021 15:13:52 +0000
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
X-Inumbo-ID: 0a1febcd-6349-4668-9704-c8963c68a6f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQL1vwy7ts4g8z4e13aIolGoDY7pl/cPWGBcYrNuYnE=;
	b=aUdJsjqcQRwbpVliZU8rwYGdn+I+avxFQYyjhhgDzP24CjgF+uHKcoFSNJj+HATt9GDY4F
	28zPMVkXzWVy+l4CSEg5706vX5GQQcVD64nZJWaNCaFiKsQrdneKeq89hiXfKjVDWdmgbS
	guz/huJGPbCHtf0rcNt8dnk8PqI2xpo=
X-MC-Unique: hhwCXXzpNOC5omsRL79SXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmqiP8LnOksTs/mereAZLfN3gTIlwt9HR38ltzLHUKGLXb8vBNckzbhHABp/hBGcFofBGbr4Asu2G9abxy+GIFvJodWqrc0/iMZ/OzRmJFbJOhZ0rww6h3v3x+yDoWuC8qOu+f52pKMzZOgfZTssMGM6YctkDxsD1JMkri1PSS4tH3L2Y83VdqigB8lO6wOsRZeLc0oSLzm/HOPsb6a2ghkfdtvKsEscYNyrypjCfMTQnAkSbKL6aEfPkpJBKstrtRDhg7tXcsnNDsDwqiMfL+N4VV1V9s2mfpvxwD+hLJMHYMZQ3BLG35EPwqP6pUxQ/KfURoguNEfMwDAkTTpwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQL1vwy7ts4g8z4e13aIolGoDY7pl/cPWGBcYrNuYnE=;
 b=AlBz13sPUFz8GqO2DNgim6pTTk2JqzWmsE2TJRq+Ncl1tsFoFS+aqqrzrR/Eps+4bh+GlFSQise5h5z/qxwCk2YRvYK0g7Vc/rNu8e+FZRFHWjnJVZ+u4tjuf/ONimz0T1T9wwQcnj9SUnIFYE/9v6AOSVNHbsxgxvoNJJhf0sDNJxz8GdXns1Fo4jF8uDlL7uWgE2nschRswgyqbpECTNTAlVYpJXTIDBfynkE14Mfm0HuEnnolaWBGOBcBhHA0s/iavwIi1lA0mJFrg4/51a+VN2uiIs0KZkoFen7tRZvPE2zLohj95bhvB83usI8CCA2pS4YntiGpBQ0D6zVpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 04/13] libxenguest: short-circuit "all-dirty" handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <709a0dc1-bb68-4f06-b73b-fbefaa661c77@suse.com>
Date: Mon, 5 Jul 2021 17:13:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6007b3c0-351e-4b85-cffe-08d93fc77fd6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26084C4D9E7C39F555B882DDB31C9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:249;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+uHPurXfOSMgMITzyhxz0W1k1xcmX4Lu4CzX6t1zBB6aSO/l/nJ1DRH6WbWahcKB7ZRM4nQkmj54u2frF8LYBbVDX6bsQc8QnaGK7SZxdMzt4ECxGM/6vzfv9XJl/MttKcksG0g05+7CGJlvslTqM+Ow4Gy6pJTFoWBIzRH8SBt1+TRAdBgBEvVdeFFhp4d8pgzEX3aYGr8F4EsNYl1TKPlBOb8+Lfh6a6k0j6JzZp5VV93w3X68pd6ZyigM8SWcm5aqTPDW0OlSL1x6fR2Pdr+M0VW8+6q9K5HekB7/7XNmKzNiXzc9Og4OQJwObQSSJYADFqQtol+LNyy8FCP5KvF7lE//hKVLQXrUfnxnlpcHbzKOzhnw4JCL4pqogWd67QSrKIvcGlnmZ0bAb0rtM3MKl7jmGo0q6JmZhb4c6rXzd1kZMaF8je1rIfXoIthh6lMHbvPX1RzV4KNzlBgRz8trhCHh7zd4uM86UI747CXfKNUbw7EfylCd3cIwX/NnPyeD+t6dl3E9C0HX3rQDntrrDDMu78wUVo8t4XO7M5uoQ31Mz0siRq2t1Vm3pCGAbV+EhVeYAz+5pEIqBfNVhhoirIjzyKy64Gnyp4WKq0MymlrkOdb4RxQA6udEtfpjVUQqlJP1hH+r0uTndHzo0PtiueN0RbQqvvKujLr2OqT6mgB75IFN2pz39YmOpNJj5v6gu6PI7W12NjV5+5xYNYGUWBrBzHsiX7UQHMceDZ9wO8gqiK7tad7D/H9DS2t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(39850400004)(366004)(83380400001)(31686004)(5660300002)(6486002)(86362001)(478600001)(956004)(31696002)(2616005)(6916009)(26005)(2906002)(186003)(4326008)(54906003)(36756003)(8936002)(316002)(8676002)(16576012)(16526019)(66556008)(66946007)(38100700002)(66476007)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0IvUUxmL0lTM3FuV2ExcWpaM25jckk1VHNIUk80THRxUDFlS1RQWHBsUkVU?=
 =?utf-8?B?MVNmUHJ2UUFhV3FVekhDNHRLcUJVQVllYmU5U3JGYlJJQW13ZnBPN1FFTnpL?=
 =?utf-8?B?SGtwclNUNVdHMFVlcGNRd0s2eE5pR3QyTlRpbTRENmc4NXpKZG9WRm4xVE9o?=
 =?utf-8?B?cGxJaE1jOSs2SVVOWUFjS2tCWmxFbUpWS0NybmlmSEd2MGVVeE8xaGZGYUlF?=
 =?utf-8?B?VVlSREJqMkF6aXhHYzM5REw3NlZHUjdqTzczQjRydE1JbSs5KzF5R2ZMbVdL?=
 =?utf-8?B?N0dqekNSTGxKbGdTdUJqbmhETHg2RW1mNGMrQkR6UDJQSFhDaHVyM3ZwRGVY?=
 =?utf-8?B?UjFjWnNZRXJYUEltV2RwaVVxZ3hqUW92TzdNT2hKb2ovcExnMGNxc1FrbDVO?=
 =?utf-8?B?b2tvUGpUTE1ieFRPa2ZQRURDdmdkQW90b0drT2JlRE4ya1UyM1BQbUhCOXJ2?=
 =?utf-8?B?U1RXUUx4bUpZQUFDa2NncURwc3VQRU1TSHBWbENDYXdhQXcwV3hGbDk0bVpC?=
 =?utf-8?B?RzNXK2V1MGdSdTdhM3JHRVNDRWVNZUw5M3A2ZWkxWDM0c09NZ0t2SVFKdkpS?=
 =?utf-8?B?a2VXQUZENjRRbVJQT0hyRlBoK2RJd2xRb1NpMTNORTBiaVRnKzcxNDJteEJz?=
 =?utf-8?B?SHM2Yy9kZC9PMFUvQjRPSmRCVEZQQ0NGSHgwazVWREp2ZDdRbzNqMWRYSFFT?=
 =?utf-8?B?MkppRGNDM1R3ejBzWWltZ05nKy9vc084TlY0dDVFSHhzVDNMbW9QTmhHRU0r?=
 =?utf-8?B?cjNLa09SbTVYcEM0aG5uRnQ5a2drQkg3b25ad1pESzhwdW9BNEZndGxmWVlz?=
 =?utf-8?B?MVJEUWI0UjM0QnRMWFFGK2lGdW5oa1VtLzEwQWVLK0wzOWVUeEcxT1puYmtn?=
 =?utf-8?B?QjlTTit4Y2NUc0RWTGg4c0FXUGdhQ0pQTGtXNVlNZnBxR2lUV0MxR3BVMTdF?=
 =?utf-8?B?OVdGY1ZkSGlBZHlKYWM5czJ4bmttZCt1a1poYTdCempDV2t6S0dmSm1YWHBj?=
 =?utf-8?B?LzY3dmJYdSs0T1FJcmZaVXdJdFBqclFwNnhqVEdJQWY2bHVoc2liRFkrV0d6?=
 =?utf-8?B?YkcweUhyQlMyUm12VnFUaEdTdFdqdlhZZ2tOK2RBM2VyU0xoRWdFYUNDdlRX?=
 =?utf-8?B?T0NEUDE2L2xFckFsUjU0ayt2a21aVDd6czRHYTJOWUdseEcrS05mU1pRUU1Z?=
 =?utf-8?B?UThUazVZQXZXdlFYWGpidHBJb3hsMnNORHB6ZE9peVZqc1QzTk5odEEwR1hu?=
 =?utf-8?B?d3JlLzAyZVlncUc1NjR3VHhXSnpBenFvMzEyY1RZMnQwd0lNQnc2bkVsR2tn?=
 =?utf-8?B?WHRhdWlEZW1UaGliaG9LWWsyS2JMMGlnVjJMSWxGRUNFUHV4SDFWQVNMbVVt?=
 =?utf-8?B?clNYWkVIanBEYlRBT2tySTl0ZGR2MHZNdHZncGZ3SkxFdVlXWmJhb2hhSlpM?=
 =?utf-8?B?bmxCNWR6RWhvbkpqR1doV3hSZkM4aXJ0M1QrWUpxUTl0MmJaN3RQK1pGTS9J?=
 =?utf-8?B?Y3FZWHBQOUc1TlZsMGtNVkU3aHh3YzhqMHduSEpTNklnaHArdlQyejZ2SnV0?=
 =?utf-8?B?ZWVnY0gzdldKM3ZGUmJCTE84Q05kTmQrZFBpeWhINmlPOFpRb0I0N2E2YnUv?=
 =?utf-8?B?OVBEdFhzMEloc0s2SjB3ZHdSd0VBWW52eURFYzIyV2xva0NEUFhybFdDeWsw?=
 =?utf-8?B?VDVpd25YRkJhTHAzUjVZTEFHcHkyYnZMZDh4SUd3NTB2T3MyT1F1UkpvckZ0?=
 =?utf-8?Q?y3WyZKqRtBOK+NF/uH1mxHFxR3M5XUlHNmAaSBy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6007b3c0-351e-4b85-cffe-08d93fc77fd6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:13:52.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXTtsMRLmyPFQ1gje2FBFzgVe6Y9j5O/9VkvSmklTHTVq12OdPyVo6NZdZsDcS/WGYCMUR/CGf4mr0v++Mt3Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

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


