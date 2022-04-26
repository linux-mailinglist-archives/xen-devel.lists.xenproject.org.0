Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2C50FA3C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313685.531362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIKw-0006V9-7Q; Tue, 26 Apr 2022 10:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313685.531362; Tue, 26 Apr 2022 10:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIKw-0006SJ-4S; Tue, 26 Apr 2022 10:22:26 +0000
Received: by outflank-mailman (input) for mailman id 313685;
 Tue, 26 Apr 2022 10:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIKu-0006S6-3V
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:22:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2aeb2b0-c54a-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:22:22 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-emKarZHHM46xiNh5QyzeEg-1; Tue, 26 Apr 2022 12:22:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2325.eurprd04.prod.outlook.com (2603:10a6:4:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:22:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:22:19 +0000
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
X-Inumbo-ID: c2aeb2b0-c54a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2D6z8DLOg+aZWIepU3LxQZQ51kG6eQiRLZZZoiI9SdQ=;
	b=TWK4NmAs0K0bkuB1jJafkyFRHV5+Q0zMShg4EobDJiTD8Y+/zX8yjSvt96GE15hkQtkIB+
	OJ67MZXKcsg+m9wCt6q2wlnerZpDCgfd4ss+Gx20/LkSdAahS2s+2KfhXfMMpes4wFsc3B
	IrMuToTS1PzIDBoRMfUXQM0wdmm7awI=
X-MC-Unique: emKarZHHM46xiNh5QyzeEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcfiAISGD904hY1BVLrMSBXTF1Fn2Dq5hmClD0/zX0R29JLFW77xLVZY8a9HTBL1DKH5CahiyzYtpQUKGxHcYf6sDUCv4xFc3ztVvyqBglVICd/X4UrJSrE51ZeF9JeRo4G2egcSI3fMlnFzC+QzzQ1Hp2h2VL23TP2GZccP6v9LUVqDOT7UP8D/TsONZA8idbo0RQrj3q3VlyApMFYroHZALftTCelF+p3gplnCGu77vHluvmOPrBeGyqvjEj+vtLdbMe3blPvI0F1jeCO1z+XmOXDohpxmA0awkxdUyp8dC1qddynvnBTrSV9oOvgk1WpmPKBAhfIio96lk493HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D6z8DLOg+aZWIepU3LxQZQ51kG6eQiRLZZZoiI9SdQ=;
 b=QxUJNP+ZfgXq0xuROprm48P3Vmwrqr7Tloz+6fwvLFu9vYJIPc/D7nF1wGo1VCLYaRX5TWyeT91kZjVAi8B4HlBr4bqz+qfGMvAGMcUboB9+JXrBV/IwcAnc+kU7zoQ/dtWylWWtIoiW/PlIHXMpHYqRahAlv1HzFZg/QpCcsyEa1vyDTePdVL+9WfJDtXyloMPKDU+DGP1MYYXNBC0K6INcXPBV04ByLQbtqtTVTW85JLeapDGiqOME+PppQ1xYviK56L2gfPTaKMh7wDEATTeTTqyJNXbjwiNK+XbHrVk3r/I3SEw/WnM37o7eV4V/Z2ZJR464UpvTzcDrgJcHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4b2b732-0015-e354-e4ac-6c6102e3fc25@suse.com>
Date: Tue, 26 Apr 2022 12:22:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 1/8] libxenguest: short-circuit "all-dirty" handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0101.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64e5fe35-b3a7-400b-e428-08da276ea51d
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2325:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB232500D226017D994E992907B3FB9@DB6PR0401MB2325.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FrA29hiqSta82wVniLc7JJvfOcp5uZKSocQ77MtamLuiZp1Le9LllPpiw8RupOEZgjYB6sH1PtM8/SVSwW/QzeepYLgO3cg8UEApVp2Yn6y1Hx+asS2ZQfqcbNWgjuFNnTnzM+TJq2NjXygQGAxYtmzQoK0cof142Co+StYfUh3f9WaAFqt5Eg2rNjml1+eA7vbhJxfzvxbRiHbKO3ZQsJ08lfdGaqnE3jhwzNT7ic4JEeciEnSQA35l1YaflFqr125+830sP+IoTszSiG6E03wU6nEx9GLIYmMvcBHT3IxT+hruyRmrpw2aTOQi93J6SYh7vXhPoiK5oX202KmcZzb+ir0uHCGIfMD09s7H3RR/Ul3Oea4E8obeO4GK7LHmvOyKyKNnTO2/4Q53dJ8QNi+fy8fCW9cNsC+SPHy14ij3veo2NpvJfTW0qca+OW/K9hlPVDjPQF0mAsgmUJKDRIS1hFP/3pIDAoM2Ol+6M9lCkW62KMVTceq8YZzAZA8c3L1kGNfXN36OFb4hdVAPDUTUqVaRt4GG8Y7pWxCUBQqGcxBFfpOriI6eKgniucbX1ei1uZmlyTXJwJ6E3SQq3WkON7A0zeJM7+lO9iLoHI9adn4zJZTYlMw1FzBuOzH8bI7pP29UO2pJV5rvxsb9JqHv65c2XkPhW5zPjBT2Bo8WjABj2r/rcmCjULoyHSjqshrhhHnrkaG+Dg5GBRdUFKpOd/CLiLpTOIlvs9GCfQAASlWfJnTCZD++cW85z5qWYWPSjXNlOOnfLtIDxNoK1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(6512007)(5660300002)(8936002)(2616005)(26005)(66556008)(54906003)(6916009)(316002)(2906002)(86362001)(31696002)(38100700002)(6486002)(508600001)(66476007)(4326008)(8676002)(83380400001)(186003)(6506007)(31686004)(36756003)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjNmODg3YjF3bk1uWm5ydFVUSkpDdlFSZW9xdUowdFoxVWRSbThhL2Z0cEc3?=
 =?utf-8?B?STh5Yi8ydkN2dVpTMm1ReDlRYzB1THE3VnRaMitINW1XWTVndWQyaEdGemdL?=
 =?utf-8?B?dUFxODRmSFp4Y1lYTTVRTlZrMTl4bzN3K2N0eG5iUXpGajBlUGtCU3hqc0I2?=
 =?utf-8?B?alR5c0JpLzRxeUcxRzFCV3dndktHUW1kbUlRdjlkNDVkblgxR2QreUJXOXpH?=
 =?utf-8?B?S2RVMUhRdG42d1VJVXFGcXV5MFpTcUh5SDIwTnJhd0Y5NzVwb1Q1RjJHdmhv?=
 =?utf-8?B?NUdidDVEbHVtTXFSdHEvSkJlNkRrR3FrRktleHpMRWs1TGlDMjZVQURuRThB?=
 =?utf-8?B?UDZCOE1zdWRMRGk4Qy9CLzVDV2RncWdDR0lXV0xCUlc2cjhWK3QvQ2V2QTNx?=
 =?utf-8?B?Mm91SU0zTVVPMldUdGtZTnFJY2tDVVcxbmc3UzhUblhlbXhqcDVka0VxeFVv?=
 =?utf-8?B?RW5CQndkZFFzMXhPbmt5WDh2dHFXbjVuVGJhNlM2dkpzdm5FYU5rOFNnOC9j?=
 =?utf-8?B?RWhjYlBDT08xbkpqRm1vUXNUdUt2WEFNblcyYVJxbXd3MnZLM0tNblc1bnIz?=
 =?utf-8?B?Q1NFekZBSS9MSGhlQ2E1eW1veTdJTkU4VHRmUFdtL1lHNW9qVjBWZTlXZVIx?=
 =?utf-8?B?WVRGYk4zcFFaMk9yNWVvSE1IWXpvTUlUK1NNZVp4NDZJeU9HdFlRdXVhVzdC?=
 =?utf-8?B?Y2ExMGU1RFJ5eFN4bnZoZXVMWThUazk5eGhSTnpucit1S0JwSW4rWHlxQ2lO?=
 =?utf-8?B?WFg0SXVIYkJkUjdVeFpDRnNRbkk1ZjB5RnN0QlYzTjM2LzJNdXZGVDlXVmdp?=
 =?utf-8?B?TjEwcVFLaXJwNzZxQmNlaCtqRjJCTkt3QmxJSy9Kc1lNQnpiVVNwM3p5OGFT?=
 =?utf-8?B?dDBNNGFoQnNCeThUVFY0NFp2cVpjK21hZWdMdVpGQ0xMcWlNdXB2OG5GdFNZ?=
 =?utf-8?B?MmR0QlVjcHV1YjFjUTFkVzFxTlExSjdReWpaK3ZNZnVCY3JiZHdiZUlpbDVL?=
 =?utf-8?B?cC80b09nb2J5a2c1TFlBRGZEalpXeWtzU3g4WDJOTFVDZUJxL0xTNlFicWlh?=
 =?utf-8?B?RzFuV08yR2MzQzRqcEoyYmxNSnlmbUJxeUJsUHZIL1VVanplUnVyL2JYaWQ4?=
 =?utf-8?B?L0hLczlWVXJxNkpGR2oza3Y5NVozSExEU1UyaWVJa2NjbDdoMDZnZks5S3Bp?=
 =?utf-8?B?WG1MSmduQUUvQ25sZGJhd0tJRjk1T0t2NTBPRmx6SCs2ZXdENktMVWxaYUF4?=
 =?utf-8?B?YkhoMGxBMldVZ2w0Q2ZDSzI4Q0o0blpTQTJuYWJRNEY0VXBZckQzKzJ3RTBC?=
 =?utf-8?B?VWhkTnZZM2JqVlloUWZIaWVVcjdQSXhxQjUyVHlOL1oxdWFCUUVvdllCK3hE?=
 =?utf-8?B?dUx4d2d1eXloeVEvMUtJU3hLdzdOS202aUx3ZTk1MUd1aUhnNUpiYVJZeFFD?=
 =?utf-8?B?UmhvdVU4QStKVWNhNHRjWUdNbFN6Sm1HdWY2aEZlS2cxV1hvVFpCUWZ3VzNQ?=
 =?utf-8?B?ZWhBcUNSaDhZZWhETHVwaW1yKy93VDYwdGs0aWlDMThNN0FTaktielNNWFJL?=
 =?utf-8?B?bFJ3ZEd4MlZpSWFQUFVFc0NrNC9CdVkyU0hsZHczVENROERJeUp3Zi9GaDBZ?=
 =?utf-8?B?VjE0bUtCMkNsMlNXNkc4elJQUVFEWkdzRGd5d1VtVXl3RGJVL1RTbnRXUVFq?=
 =?utf-8?B?M2oyMmkrbDErQzRBQWx0MEU0L2FHOEpuM3YyU0c4Z3JXdWNTbEx2QkVWSkRW?=
 =?utf-8?B?ZVNuL2poVEZMUDRobTRuWENBU2kxWkhkMVJXeTYxN3ZsUVRzUUliZGkrRFZC?=
 =?utf-8?B?TGt4ODA5bDR4cFJrWTZ6dU05Z0pmcHgvbi8wanBhTUlKM2phY3FFL0tZR2Yx?=
 =?utf-8?B?eXNvZUU3bEhKNzk3STU4eXlQd3pvN2h1cFhrYlRVZmpMQ2pvMTczdWIzcEor?=
 =?utf-8?B?Sytrd2JvL0doMlVBQkxKOENlWFhMam12eTJzd2p2aFoxdmkzemZsQTdzdnRy?=
 =?utf-8?B?SGN0dmxHVmVxMk8yUnhFUittWHZ6VHZIRkxBSnFOZTlJMWcwOGhDWXBrMkdE?=
 =?utf-8?B?T0xHNmNXNGtTTXdpME5zV3U4MVFzSzExYkhiOHhDMndSeDdBRUY0S3Rwem5I?=
 =?utf-8?B?SFE5NjdEWVR4Tmx5TVAwbmR3QVd0c201aWNzc1pRUnR0Zmp1QS96L3lINGJu?=
 =?utf-8?B?YVVwWld4dFJqeGxYWHIxNzhxdzBySnZjdkxOZlR5ZEJDSFFjM2tTUjd2aTcz?=
 =?utf-8?B?bllUMzM5NzNyeTZnY2w2aWZETHhsNzU3aW16b0V0YjdzVlhvbVpuYVUxNjRt?=
 =?utf-8?B?bnNsck1XRWJuc2ZqUXp4ckdjMjhJQ3c4VmpnVWxKMmM0N2dKQURpdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e5fe35-b3a7-400b-e428-08da276ea51d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:22:19.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouC7P2uP3uskeKkA0NP9JBtxfd+PnQVCQCCIx8v6sC469xCKHqjsBcXyvuk2I00cmeq5seqRG0mJBNWFXpWbPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2325

For one it is unnecessary to fill a perhaps large chunk of memory with
all ones. Add a new parameter to send_dirty_pages() for callers to
indicate so.

Then it is further unnecessary to allocate the dirty bitmap altogether
when all that's ever going to happen is a single all-dirty run.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
NOTE: Ian demands that this not be committed without also committing
"libxenguest: avoid allocating unused deferred-pages bitmap" (because
of the ugly -1L).

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -364,7 +364,7 @@ static int suspend_domain(struct xc_sr_c
  * Bitmap is bounded by p2m_size.
  */
 static int send_dirty_pages(struct xc_sr_context *ctx,
-                            unsigned long entries)
+                            unsigned long entries, bool all_dirty)
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t p;
@@ -375,7 +375,7 @@ static int send_dirty_pages(struct xc_sr
 
     for ( p = 0, written = 0; p < ctx->save.p2m_size; ++p )
     {
-        if ( !test_bit(p, dirty_bitmap) )
+        if ( !all_dirty && !test_bit(p, dirty_bitmap) )
             continue;
 
         rc = add_to_batch(ctx, p);
@@ -407,12 +407,7 @@ static int send_dirty_pages(struct xc_sr
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
@@ -502,9 +497,6 @@ static int send_memory_live(struct xc_sr
     int rc;
     int policy_decision;
 
-    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
-                                    &ctx->save.dirty_bitmap_hbuf);
-
     precopy_policy_t precopy_policy = ctx->save.callbacks->precopy_policy;
     void *data = ctx->save.callbacks->data;
 
@@ -522,8 +514,6 @@ static int send_memory_live(struct xc_sr
     if ( precopy_policy == NULL )
         precopy_policy = simple_precopy_policy;
 
-    bitmap_set(dirty_bitmap, ctx->save.p2m_size);
-
     for ( ; ; )
     {
         policy_decision = precopy_policy(*policy_stats, data);
@@ -535,7 +525,7 @@ static int send_memory_live(struct xc_sr
             if ( rc )
                 goto out;
 
-            rc = send_dirty_pages(ctx, stats.dirty_count);
+            rc = send_dirty_pages(ctx, stats.dirty_count, x == 1);
             if ( rc )
                 goto out;
         }
@@ -681,7 +671,8 @@ static int suspend_and_send_dirty(struct
         }
     }
 
-    rc = send_dirty_pages(ctx, stats.dirty_count + ctx->save.nr_deferred_pages);
+    rc = send_dirty_pages(ctx, stats.dirty_count + ctx->save.nr_deferred_pages,
+                          false /* all_dirty */);
     if ( rc )
         goto out;
 
@@ -801,8 +792,11 @@ static int setup(struct xc_sr_context *c
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


