Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A469E3B4441
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147186.271133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwljF-0007a4-6m; Fri, 25 Jun 2021 13:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147186.271133; Fri, 25 Jun 2021 13:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwljF-0007Xt-2k; Fri, 25 Jun 2021 13:18:41 +0000
Received: by outflank-mailman (input) for mailman id 147186;
 Fri, 25 Jun 2021 13:18:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwljD-0007Xj-Fs
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:18:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef223325-bd1c-4857-99a5-a9f0a587314d;
 Fri, 25 Jun 2021 13:18:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-xuX8TIB7PU6wSEGD5cTtIQ-1; Fri, 25 Jun 2021 15:18:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:18:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:18:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Fri, 25 Jun 2021 13:18:33 +0000
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
X-Inumbo-ID: ef223325-bd1c-4857-99a5-a9f0a587314d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgEdhafpz8BW5gWdiXksunqCC0nVZhZBo0PaP6yDugg=;
	b=TeWlYzzqSGKV+9bnTHjldDvpHVTpR2OvfSSGpSSnlqh1G4vv7Jh2tGwm5SsHUaDwXKg/PB
	Lu5JbMBoPzajp9DSDp/sQz6uatVgn6l2UXEHYIuboFC61txJAzO+9xU+m84fMJhP9eZcuf
	vu+hbeEkgQwLDkpKLkEBfWBNUidLs7g=
X-MC-Unique: xuX8TIB7PU6wSEGD5cTtIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dky+8mgM99Sq/rpaXeUbtHhTizAalE/7p09a5fM/p5T1xZaeuBaXpi0m+WvIbU5q8s3HuDf+VFdOY93CMZPfPeafr12ZVw6QUo9LxpPVImwZvFFX0KADtRd88KNo/QuJKN2TNh5Ay11KuCy8xiRpN6HglZDyXRdfBDe/xMyDg8vHXDmJy1XJ7bXoOfXY1MLYA43Fj2Sh6vbkQjzsOzRn/+mPELj5S2NhydoQ3pU9iHXOVgsyBR/eBx+8taYucA1lWPZ1hJRjPULWqVMSt3ayzLRQIwATHiegJwkCymvB9WMqT07Wa4e2HPoUTt8odrTrgNPJkjsdq3ERoxmf5uC9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgEdhafpz8BW5gWdiXksunqCC0nVZhZBo0PaP6yDugg=;
 b=D2BHOFzM5L5M8RbUGpkcrKRX3gqDEIRX4VBGa0gv9tMqSW5hgfpL3y6hda5tPdqLCQAoVmYY6K37m5iGAy4ZBXnkqv4l9FPcQmZFTICl+0fKfcQfaBrDWx+eB4QPWPtr5Eav/J6rECqN99hg3bM+C6kuEPhG3LAsQ2avbRpHxWXT8dYDmYJNxtPlqDFYHa51tFx/fspHVwlQA8AL59p3pG9N6qdK1bD0CXAt/v0aofLpjPTx7+EZPksIGhX7qY9+14nRUfic29jfn5cl5TD6+C2d28m5OmEQ4uHbk/grxhhl2JQAOV1zf5yIhM4xLL5VQ6BxdSU58vJNfHrS4KvDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 02/12] libxenguest: deal with log-dirty op stats overflow
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
Date: Fri, 25 Jun 2021 15:18:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf8d2562-1189-4f96-cd43-08d937dbbc19
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384959999ED241920AEECA9B3069@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvU1rfxwoEtl13yhhM8NNYF3EpcBoxUjiur2xo3b/lWEeINTTbPIunfda0uSdfnvrgfMxzG1wR5Bltl6lImX9FzzHd7l5fOiNkYUN6N20tNiqmc8kL1q2zfmrgxiV63Ac9Cl9fmsFtm3WnI/kTJl72VKkk07dZkGytP2s2OKP2rJMKNxdIDY8YjCfrM8H7JJEHEBE3vfpOBNS3751MdDXj2h8Mz0j5Bl0NTmVcf9xdcQ+9EBx6NI/A45uOsDovsoE3+kmurn02YXwBbfHcmp21MBLodLnaU1wbF47lnxG3qVsYQfnS1zHLis1s9rc+A2RwOHgO0+4GQvWehRQQ8iNNuZPqNX5aNFJQcbtcapPrhoUq4KsBLnRnVgTrpnrkUWDzp4FVBWUYwuDhFFBBmI+oT2o79sfRtqo8iUNvjgoHpbIL3D4MezLBbJ56AvlAabJKur2OccHDefk9EUjdUcI0ie2nLdiZzduP8x0QtUMiTIjwMcMeoOnkYZryDDyjUgeMtQuRgR2Pq5ynZkDCQ/EVPUKAcoqGw70DpyYunj/VOpC89oX3t+wKv/ITbxwRKuXbvdQHnYfWS8T3AWG+zYGucaJFxoj+keg7Pou7/agTOMpQ5kuFXBxVc//7fggHmlprrKfGFjyu1xbISUsKhnE5fxMNZ9OOWDXXGxgvQMQmpG/iI/MbNtm9YQNvneFm5QpULVVtKwp+Lo231s4ImGsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(54906003)(83380400001)(316002)(16576012)(2616005)(956004)(186003)(6916009)(26005)(8676002)(66556008)(66946007)(4326008)(16526019)(66476007)(8936002)(478600001)(5660300002)(6486002)(36756003)(38100700002)(2906002)(86362001)(31696002)(31686004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEFaRnNuWjVXMlFXK1dzcGVOMy95THJXaHVZajRBQm5zK3BKbFg1WktoYWpL?=
 =?utf-8?B?SGVESFhCa1Y2alJRUzB5TU01amZwWVdseUFTeTRCRWNCUkI2N0YzWnNXYWNT?=
 =?utf-8?B?cFZkTWFrVHRYeUZFNTdGN2g2QnRuVjlyWExhL052b0hMRkN5YnQrMjR6RVFh?=
 =?utf-8?B?RGE4QXB3REtmRDBwQ01ndDMyUjhtcHkyazZPVXRUTGVMVmZ6MlpLaE9uU1Iw?=
 =?utf-8?B?bXFsQlVIZFNkOFBid003VlNIdUV6MmY4RmpaMTc3dGdLTHE3RlZBdHJaaURo?=
 =?utf-8?B?WEZ2WTdTRGZ3WVlGeTVmb1ZsYUY3WlNjZ2J0Qkc0WHBNWWl4czk0Q241aUJ0?=
 =?utf-8?B?d0hlbXhTL0Rmb1dwM3cxMG9MQjF2dDdUYXF1bkZjRmZZRG1xWWlpa1lvcXpY?=
 =?utf-8?B?bXcxaHp3NCtYUUhDOGlMMWhvQy9SQ1NSaWtmVHRYclczekRBVjFOeDZFdEs3?=
 =?utf-8?B?aUdydFF0eEN1OFBIOU5YcUVwSTFHQ3FreWgwNlFSLzFERXJsWnRJQjhFUmEw?=
 =?utf-8?B?NDR5UGU2TXZuK3huYmhsUEg5ZFRVd1FkUCtPSHFyVWtsendQYnFTUU1LcmxG?=
 =?utf-8?B?aEU1TUtlMkpnTjdvSWFaS0Z3MW9RWDlMWGcwcHlyZXZ1QWZUTEUzUXJiOTBC?=
 =?utf-8?B?VHFTdi9nTUNETUplYllBOGN4RnZ1YjZHdytMSXh0b0svcFViaWxOU0xpVVdF?=
 =?utf-8?B?aFFXNzFiMHNhWk9iMDdiOGVxWURlVmhwWEtaVytlTjZXRHFZREZtaE92NUJW?=
 =?utf-8?B?UnRBNDFndHY5ZHpLSmpXYXB5dXpidWpSNzJEcDhhTHVRMCswbERHSTk3UjFk?=
 =?utf-8?B?UHJ5YXlhR1JXYXY0TVZSckhnK3VveWJtcUJQdU92d25NMEdqeXhtY1plak5o?=
 =?utf-8?B?MUFGQWQzYWl0NldXeXg0bXJ0R0ZvNmZ6emlWU21TaWNERm52cCtlWVlWV2xx?=
 =?utf-8?B?U0xCQTVpVGl4UmZsK1NoWXhVOHcwcHZYSmQ0dWxlRmFwN0NIQXQyaFMrd28r?=
 =?utf-8?B?ME0rb0NjMVZQR214a2hDeTRiL2Z4aXZoaldNVGFiSU5mVytBelpXOXcyL1c0?=
 =?utf-8?B?MkgrZHdkanIyNHE5MFgzbmxhUlpyaE5XaFI4ZzNrSVRJODFuN2VZZFJkNVYx?=
 =?utf-8?B?blRQZGFNR1NhcVFxMTFJa3hPcFZ0Z1dXc1FYZXRaS1hmWlRaR3pyaVh1NGcv?=
 =?utf-8?B?ZFZ5MmloT2J4d1c2QmxiUGUwWE9tNHprSUxIa2hTR29WSEprQVJqMG5DakJL?=
 =?utf-8?B?NnpPODkxV0QwOXI3c3pOb2J5Y2VNaFJFamF4aWc0OVYxcVhwektWQVZpTWtS?=
 =?utf-8?B?YWtFQTVVLzBnaVBxdURNMlZPWUFnQmw4S014WTkrbm0xaTEzcGk4QlY3TXpZ?=
 =?utf-8?B?NnNtVU5XakVNNXk0L3VnS2lHeTA4OWVIekd5UmZRZThuTFJrUFZxb21zdTQy?=
 =?utf-8?B?Y2NqNTlQdGtQL05UVXk3NitkWloxQ1lwN0tTVW5EeDlkcEpLT0JSVHE5akhP?=
 =?utf-8?B?TUxEMVg2UmZZenZPcVVnT0dEUTlJdU4yT0NJdXdBMXJRdVVzSGRuaUpUbVhQ?=
 =?utf-8?B?SmJUV29XVGhoQ1RUSUgxRCtHeVJIK2xVSHdObVg3bXpaYnFkbzhTTWdxWGxD?=
 =?utf-8?B?amFDM2E5ZG5DVk1NVTNGWEhBcGNqdjN3cjlmLytaZEk0RmxkYmJhcGdrK3Q2?=
 =?utf-8?B?ZDlSWWxOOTd3djY0OWJVbHVkY2prRGI4TXo3eWgxbk5PWVpoejY5ZjRBY2ZD?=
 =?utf-8?Q?2v5mqXe+OhIbk+xZHoFfrPVkjW5QzJMfmocPOQU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8d2562-1189-4f96-cd43-08d937dbbc19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:18:34.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTqHcuDP8RwEgiHRS4hskHNh5+8xqRsxKXp8klsZOzMR1MFGE4EJVJEFvlLiAFhhedVCPZ3x/DiPQU8Y3ZpCZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

In send_memory_live() the precise value the dirty_count struct field
gets initialized to doesn't matter much (apart from the triggering of
the log message in send_dirty_pages(), see below), but it is important
that it not be zero on the first iteration (or else send_dirty_pages()
won't get called at all). Saturate the initializer value at the maximum
value the field can hold.

While there also initialize struct precopy_stats' respective field to a
more sane value: We don't really know how many dirty pages there are at
that point.

In suspend_and_send_dirty() and verify_frames() the local variables
don't need initializing at all, as they're only an output from the
hypercall which gets invoked first thing.

In send_checkpoint_dirty_pfn_list() the local variable can be dropped
altogether: It's optional to xc_logdirty_control() and not used anywhere
else.

Note that in case the clipping actually takes effect, the "Bitmap
contained more entries than expected..." log message will trigger. This
being just an informational message, I don't think this is overly
concerning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -452,7 +452,6 @@ static int send_checkpoint_dirty_pfn_lis
     unsigned int count, written;
     uint64_t i, *pfns = NULL;
     struct iovec *iov = NULL;
-    xc_shadow_op_stats_t stats = { 0, ctx->restore.p2m_size };
     struct xc_sr_record rec = {
         .type = REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
     };
@@ -462,7 +461,7 @@ static int send_checkpoint_dirty_pfn_lis
     if ( xc_logdirty_control(
              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
              HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             0, &stats) != ctx->restore.p2m_size )
+             0, NULL) != ctx->restore.p2m_size )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         goto err;
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -500,7 +500,9 @@ static int simple_precopy_policy(struct
 static int send_memory_live(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xc_shadow_op_stats_t stats = { 0, ctx->save.p2m_size };
+    xc_shadow_op_stats_t stats = {
+        .dirty_count = MIN(ctx->save.p2m_size, (typeof(stats.dirty_count))~0)
+    };
     char *progress_str = NULL;
     unsigned int x = 0;
     int rc;
@@ -519,7 +521,7 @@ static int send_memory_live(struct xc_sr
         goto out;
 
     ctx->save.stats = (struct precopy_stats){
-        .dirty_count = ctx->save.p2m_size,
+        .dirty_count = -1,
     };
     policy_stats = &ctx->save.stats;
 
@@ -643,7 +645,7 @@ static int colo_merge_secondary_dirty_bi
 static int suspend_and_send_dirty(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xc_shadow_op_stats_t stats = { 0, ctx->save.p2m_size };
+    xc_shadow_op_stats_t stats;
     char *progress_str = NULL;
     int rc;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
@@ -701,7 +703,7 @@ static int suspend_and_send_dirty(struct
 static int verify_frames(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xc_shadow_op_stats_t stats = { 0, ctx->save.p2m_size };
+    xc_shadow_op_stats_t stats;
     int rc;
     struct xc_sr_record rec = { .type = REC_TYPE_VERIFY };
 


