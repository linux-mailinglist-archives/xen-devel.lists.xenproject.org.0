Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF923BBEB5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150327.277971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QIe-0004PY-Fy; Mon, 05 Jul 2021 15:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150327.277971; Mon, 05 Jul 2021 15:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QIe-0004NT-Ca; Mon, 05 Jul 2021 15:14:20 +0000
Received: by outflank-mailman (input) for mailman id 150327;
 Mon, 05 Jul 2021 15:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QId-0004Lm-DK
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:14:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8756202-6257-4c6a-931e-638f4a36f2c6;
 Mon, 05 Jul 2021 15:14:18 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-lQHOshOtM12pyZV8-3IjVg-2;
 Mon, 05 Jul 2021 17:14:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 15:14:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:14:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0148.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:14:13 +0000
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
X-Inumbo-ID: e8756202-6257-4c6a-931e-638f4a36f2c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iL8ZT2omFXp+d1U+Xk1s2GOJXrPw9iN7waqPNcfkxZU=;
	b=bUE3/fk5eW3NSgkfoPc9keY+MIxwwHFZt9ozbwr5KykCFaY0mPBvilKcVC7iL/zvokXOGY
	xPb+sYCDthLE8+B7N+JQwGO/yIguxDXvFBKzyMb9qvDWR9/mr6Ecru5/ywYOmRqqa/JbrA
	ePphAgdcp1Yv6JFHWNbXLU6SIf9Yg5s=
X-MC-Unique: lQHOshOtM12pyZV8-3IjVg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1dw5mxrMcoY+tJtBimpxiCoAYlNvoSPOT7HIWBPjDKqOzbibIz+vsOM7yKteoglxcBomNnCYljfyH0SLgcs+jtgWLj4yAQdlGMAcKsY9G3xH4jjwGjXVfkSks0M2KMJs5nluOHEUEbZuTwEZvNn1ajm3lF7Gu2aQwyP5IlPuL0QK1oPzzN9fYdPVKL6Uhjj1ivIv4bP1sWY4Ai8ZrAk6HC4n9vdP1aQOLVo1q1McPn5lj6U+Ai/YVVSVfAiJTmCSly1pNuDVt6JemnvYFWyr3tEv2GYHyPZK53edSYJa3p6VPl2L/Hg0e3XH5+zLte5R++3IbmuYtRNOd5IvtVa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL8ZT2omFXp+d1U+Xk1s2GOJXrPw9iN7waqPNcfkxZU=;
 b=ee2cBQ++HOJ8CCk7ZtbZUD24mTjCsLv8zOEpiEWMn12ofWtjPSuRh4f224nCSgemd0c18nU7d4wDrPgdEh6+KSHTSv16dB4f6Osx5XJbGLdfyUkIip/9OaPA9W8sc8VSPr6CP/+PdSKsxu7ztEONc8/62kEHdYxoa6cKe0ivLAdoB/4fwFIF2tCsnLRIwPJ7tHoxN2Hc3YDbzcbGI8GoQBIDItWZz7QThREP6NZzGRH3jN/VJx9XJ72PYHJN1Vv2M5HNgWhWBa6OnMlgvwXS41acCCW6lEbfJcseFsQlqLsH4DosUtx122DfUEOP+dsK5ko84Fxye0XTdpqAbbwKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 05/13] libxenguest: avoid allocating unused deferred-pages
 bitmap
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <7996fff1-b004-b1b0-fc35-e1307340ce18@suse.com>
Date: Mon, 5 Jul 2021 17:14:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffe4b2f0-fc0f-49ca-3e32-08d93fc78cab
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608DA4DE18D076EB04C38FEB31C9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j7nzRRTI1MXEGp9c9RMM8ehFHtlAKdak507vvYZoO/+jpr/NNl1z9cqF0174zZy+rRw40NiotYPGeixkQA+xkltlEiJYvjp6+yjkLTWaaz0ddZhlWE9l5bligFxiMnwFYMJhx0wR9aIQ8HIfl8vHXfcs8a6vPehVVrbyZLV/0rOjQHncQuFRJxYtnSsQlPWN52+GEzkcP8k8UWbLWxToKnWZ5XFP63TvYOv3n3nbVxFx10rOE2Mmbdh3XpunNL5RtNkP4fle7oNdppSAeITW7kKVvfE9ripiX8H5TUhhZvhEZLQFk0hbUtyms5kqBB4Uoi7gYn7er1EdUgzu3UkD4slkcjMZCUQLGLTme79Pehm0JIGD8RAJMLYf9r6OCthrv+fl8bqY8t7tgfaVih9EJbVjX2NRO109x20EyLJYrfJazy4OcxD0N4OCpODnOpzREMmzbspSGN8JisWRT2s487CwBm7iJHcb8h21qV1kVLgSvBkbqeDMl0S7QBCKfnbOLbcvgx6G02Gc8X4zaLTObgjmN0oBcsvlt77BBbqZQ2T0gJ/62FpWjIPHN79APKFdjlnOZzVBLC4ru70a4BvyWRogC3kZNMLZzW3n5YCoEOaQVYJDXd/sEOiNwjyrBwrpHJzEYSoKgzvAgT7qiDP6nRbh6E7k0RFCsS5OUoXX/+sjebV7y/e61yEdMFqGw9BVzsHW9DnIMRL1alsQBd8RwHzCZsRT1yjRm6CKz9ydE1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(376002)(136003)(396003)(4326008)(54906003)(36756003)(8936002)(316002)(8676002)(6916009)(26005)(2906002)(186003)(66476007)(66556008)(16576012)(16526019)(66946007)(38100700002)(31686004)(83380400001)(478600001)(956004)(2616005)(31696002)(86362001)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZklLQmxCanhOZmRhVU9SWjZuemZEYktnTmZ2RVpKZVo2M1EzT3NuWjZ2N1B6?=
 =?utf-8?B?UFpyd3YrSjQ3MjJGYzRtY3V5RGw3QzFXWFhCZW5NblVrNXVTL1BuWS9sZWM5?=
 =?utf-8?B?WmNMSWMyWXJrbEFTNkt3bTZmMWVhSHRKa3NtN1lQdXlyQnRVQUxJbWhQejZW?=
 =?utf-8?B?ZnJqdFVqd0E2blcvOVVvVjFKdmRZRXhPTkQ4RmdkQ0M1VUh5N0FMNjVmTmdK?=
 =?utf-8?B?a3ppQURyMzBGVDhDSnhFbm85UndRY1cxNnpWR3A1UnY5RStrRTVRcGFDaDU1?=
 =?utf-8?B?VjRjUkxXN3A3YVFrL1lYaW41TWxwNDU1dWx2NWZrTTNFZkZ3dGxUYjlOb3lI?=
 =?utf-8?B?MFhXMFE1a015ZFpDZTROQkxyS3NFTndmTnFobHkwWGRjMU9wOHpueDljM2FH?=
 =?utf-8?B?M21GUy9FbStOMjRUNE5EQTFORjJPUS9KcWt5WmNkWUFqdExkalNITU16Y2NO?=
 =?utf-8?B?NlFPM0dpWGJLa1JDWTVlZWNzdnpSdXhZdzhlRDQrSVQxVXlqWWpuVXRwOWRy?=
 =?utf-8?B?eVJlN0t0bkNyV0VaY1lROWl0SDlGUVhSaStjNmgySlZVVWdQUlBObkc1eEs3?=
 =?utf-8?B?Znd2QkNJajV4L0cra2owanFHRTEvZXMyTmV2YkRmRXNFeXpuMCtVME16bFgr?=
 =?utf-8?B?RTd1cmx5STE3a0hUTHU0emhUQitIQnQ5dzl4M1FtdEorSU9UdDJNNVdXb0Zy?=
 =?utf-8?B?ditWM0lSZ3pneXM1NGZWNUE4MEJsdlNSdS92VmZ0MnN0NUdGZm9SeENOZHMw?=
 =?utf-8?B?ZWs4OU1zZXY2NTBOaVBsNlMyZmI2QWdkaGY4NHRmZUVTOXlZc3RBUzhyUUJZ?=
 =?utf-8?B?VVZmZzM4Q2JIYzFYcTJLS3Y3YkpQWnJhSWt1d2RSVWRNUWdENGRSUGhCbEYz?=
 =?utf-8?B?YUpoaWpJNW1zVElOWjhRVm1KYjJhWlY2eGpYV0MzL2wrVEdBRExkUlBHOW44?=
 =?utf-8?B?b3JjVklzMjVQL2tmRzZMMXZlcHlyTjV2SWdpQ2NWWk41Y08zZFBCMThmYVNI?=
 =?utf-8?B?Z2dnWFF4UGlPZmJadzNkUXV4eUdGbUkzcTA1S1dUMVZJbDVqeHArK0Z2QXpF?=
 =?utf-8?B?cHRNeTExK2dKWmRlVndlTkFGZ2pIQTYxclBzU1RmTHNiYk5kVkdRaUlwVFF3?=
 =?utf-8?B?RUFFY2ZyeHBDMFFSdWovRHFoUXMwQnpEUGFkK0w1R3BnWHZHZ2ZmdlJkMG5r?=
 =?utf-8?B?akROYVFvc240RGEvS3FTSTl3R2FKdlFGQWFBdFFiUkRraStabUxHRU85ZXhM?=
 =?utf-8?B?MVEyUE9XcWFNZGgvOHo4THNzNndOYTFxS0wvVDMwYTNvRFp1cmhjZlVEaFlw?=
 =?utf-8?B?dGZSNm54U2tqLzZZM1IxQWVsR09uUVQ4c1ZIYktPbHdIRVd1aHhyb0U5UWdU?=
 =?utf-8?B?Nk00WUE1YkRBTk9ZdGNPejU4dHpwQ01YWjRHRnV4WjM1RExNcGFjZ0tGUThJ?=
 =?utf-8?B?OFZUcjhvOXI3Q1JXK3RrZUU5WWpzdGFZc2dvVndIZ05GcmRpekZVY0NhUjdi?=
 =?utf-8?B?ZTNlVEF0cU5OakI2UzJ6c05GZ0xBUUxzTHo2c2xXaDYyVkp2Uk50bmZLeTM1?=
 =?utf-8?B?SkxJZklIdm8vZWY5aVpyanM4WkFTbmlZRnRZclJ3OTlaejlYWkZtcHBJU1Y3?=
 =?utf-8?B?VFRpb0Iwb0s4TlVpNzNScGlwQzRBM1N3L3p1MjZNU3VtRTY5ZTVMeVJnU2RT?=
 =?utf-8?B?VnhRdlBXSko0SkFuV3VscWxESS9iaEIvWDB2bWx4MXhBRTUxd0hLRmFDQlBm?=
 =?utf-8?Q?H7wxR9d+NVttwpil7tjRXeAw4WHOymRYSA3AyZS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe4b2f0-fc0f-49ca-3e32-08d93fc78cab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:14:14.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVKn15NHPsn5wcMcbr83M4Pwb68L+URkGV6rLzZ7huzbck47ENiX4vj+2Y4y9pQa9Qx8h2ZTWRFjD38jftpMFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

Like for the dirty bitmap, it is unnecessary to allocate the deferred-
pages bitmap when all that's ever going to happen is a single all-dirty
run.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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


