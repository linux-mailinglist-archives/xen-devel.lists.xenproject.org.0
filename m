Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E03BBEB2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150318.277950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QHv-0003Ol-U8; Mon, 05 Jul 2021 15:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150318.277950; Mon, 05 Jul 2021 15:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QHv-0003Mz-Qd; Mon, 05 Jul 2021 15:13:35 +0000
Received: by outflank-mailman (input) for mailman id 150318;
 Mon, 05 Jul 2021 15:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QHu-0003Mp-Eb
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:13:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 644898e0-a5d7-4f2b-8fb0-71d8cdace4d3;
 Mon, 05 Jul 2021 15:13:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-hwN5UErJPKCc14Nz71R6FQ-2; Mon, 05 Jul 2021 17:13:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:13:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:13:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:13:29 +0000
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
X-Inumbo-ID: 644898e0-a5d7-4f2b-8fb0-71d8cdace4d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgEdhafpz8BW5gWdiXksunqCC0nVZhZBo0PaP6yDugg=;
	b=bqjAtljegRBb6MUkqiE3AfSOJ5Wv3+F80VDzQHA5kvjRqSPFTvTlDPKn4QNajsxxbB+SEl
	TqpwmKH0Wwjl41QaxQ9p+XHybwmWy/ZoUfod3w5xg/tXA2MK0tuYPeCscryr/4hsxh9L0S
	yHGcMURAd78nT8tJcHTUi9YwN1evLzw=
X-MC-Unique: hwN5UErJPKCc14Nz71R6FQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBu+sH1Y6YKiyXeLuEDh+3FrBdxRwMWkVpOMJ4cNLZKWL9mlRMaZzt+VduYb17kb4o1xhdTvlyfAEqo/dxZwMZk9qvyXhZx6aw5AVDwm4EX3aErdpTDEwV/3S3i2/YZGZtpvnL8LgUpS+tCry9d6tc6cIsoY9TGZT5yugS0G62keOmdMF1U6w7P1wIYCfChDC1LT6OoKTUhlGav9jZp27kHYNOvYes3i3HUVR5S9phjtk5prkvLkmgCEnJRXLeaataBo/iZyivHFFqZy1WOVUbRZB91aoDcUkeR9xbSTFMBveeQSO+2D2YkLgSxABlFRASvTcaTCS2RSsnywp0qpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgEdhafpz8BW5gWdiXksunqCC0nVZhZBo0PaP6yDugg=;
 b=kOyXOgFn17Jo1+5VXXaiNlvbi/bF64KSbRDUNdJKlM8+pnsd2UkflyKkk0BPVi1kvfkBCGT+8+IiFJQ+fVeGKRCzIVR7eYRS+eiyRb+IhtIuvyytH2XOKFS2S5CGMh9//Cs/CtCC2jk2kNfYeDP0b8sUNgep762ReHki1W/wE0wmkoqouvclSgD/IFGRrwmBgklZq3jWMMOdQbKUNvmUElt92Gt29PCEeOUzeVyHftcbeUj37wTRiJ2VTXrNVrGvQypIaXo5pw2CCJoEijw4uUoWqDvZtAnkzIFkEdZ6safuDsbzjaWj/+Mr8iQVxj2R0XUPSXYlriu/BHHcyKRQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats overflow
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
Date: Mon, 5 Jul 2021 17:13:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5a04ec-d716-46ca-9682-08d93fc7723c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743A3EF74AFE3D68C2465C5B31C9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l4OjnwNaBl9c7JjrEEwEEvraa5XiAT+KoX6gruMCDMFCd0hTNpNvyYr4J1MoOPP9xg5BAg0qyeztZ/SdfniS8CtpyLmY8vyYadIFrqpRjSuxfe/eWjoVXdBNytfrCzBolaNTWfHAZbHDnNF0Iq0iaU/XJQY6X0h3aq8P9Y6MblIbC6KT9mRuxsg5AioUQ4HGuvIXLVAMXIu7F8tJDaz2FI7yaZKD2cYGgtbA0opr4cfYQKmuu88Fa6SIX8fNonr4i6DNwfw+wdPYUkz+W8cVlVhkXhzeiThV+Bu30zZPwc4g47ZP/hWakF/V4oijfYHpy/U++sSPQeMuKWf9OrYloA+FhdCYekCsM56TGDu8m+HGXVNcbSFoxDp6lyJhCQbGRtDhM5HFWKiUthYekMl2slt0weag+acA+by1I5mvj9iWqV5oQl59Uqs3l0xrL+jI7gE4Hh+ZB6HvA8pqdnIhe0MLt+er/bpAtrBy0syKhRLs5jexV0kuepELQRB+C2NYCn6VV4OcTdhkTe/I+oHelQXxXMy0NUahFrcNSpPo8gco832Ifs/auzrk+Ee25++GDdQOE+gA7GrnC+O+60xoBj3vTufpX6Um0RoUojlDWhnDYT+oCELHQlPwXv1ASdnfC8I/gJs4phesfw9UB0ZuTvH63WVfA43O2O2mRB1ucojD9zyCIr/8bkS5kVhB7WQe7ZvmRVo7rSmXnO8yDJjzA+PSqlsKgedHFtCNuO2g9EoS8SpBuc+jr4mM3JMcfDI7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(376002)(366004)(346002)(16576012)(83380400001)(6486002)(16526019)(6916009)(4326008)(8936002)(8676002)(186003)(36756003)(478600001)(316002)(38100700002)(26005)(86362001)(31696002)(2906002)(66946007)(5660300002)(31686004)(66556008)(54906003)(66476007)(2616005)(956004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUVkdmVxM29rbFV1aG5adEc0b1U5NEF0UGpuSHZzeEhNODVsUGNDdXBGNXp1?=
 =?utf-8?B?SUg5dGZxK3pGbjZCVUNUZjFoNlUxVlFEM0tjU3ArR0ZBNWs5WU5Ld3FjWWxW?=
 =?utf-8?B?L1paOU9NblQ2dEJwQ1NNb3Y1RnhXK2UrTjNYdWtRc2J5WmkzU1Vra2ZvUHNl?=
 =?utf-8?B?QWFNYTd6aE1kTUFZWkh3T1Y3Y3JoYytzTStjUmg2bHBKSE0xMHozZzc0UWM4?=
 =?utf-8?B?cktlYWhsY21JbTJBOUhPM3AzK1o1K3hoNmRvL0I0U3B3a0pYVXFYRjZ6M0N1?=
 =?utf-8?B?OXQyRnorYnk2OGg1YjFvOE9OMm12NXhYZDIxcjFkMS9oQU5GUG81cTlGbXBo?=
 =?utf-8?B?U1pEZC9zWnEycm9mTjZ3TEhoM2UrVHcvaW5ja2dZWDEvZHVQNlVvSG1wc1pQ?=
 =?utf-8?B?UTBXU3lwOHdrK1g3enp6TFhPTnI1NU0xZHF2VUJHcjZRdkZ4V3FFeGs4L3R0?=
 =?utf-8?B?cFdaZUtIQU9GUkpDRFMvcTBHMjNITmVsK1hidEE5M2RFZHkvYWNVeGJBTXBy?=
 =?utf-8?B?a0pqeGRDTnRYM0JkMm9tVXlSR2FGNTMvY000RENOZ1JNQ0F0ZXJxUWNRRVZ5?=
 =?utf-8?B?Z1ZOL3ZieDVqSWhKbHlOZ2ZhbEwvdUtHN2NpWnArSjlFTTJHZlNFMHRVMDZv?=
 =?utf-8?B?bHdEd2VCM0I5dFJza3Z6dFZoM0ZyeWw0VUZ3Zzd1WFRjOVlHUndjL2dWcXhP?=
 =?utf-8?B?Q0dDUi9VaEFmSHpleVc1a2tjcFE4ck5hVG5OOHdLSWhnc3JyOHBibGRCeXh6?=
 =?utf-8?B?czBudTl0MkZjTU1SdFdjODN5LzlEVExVbmpqazJJV2dHeHlXVEVhNDhEMWFS?=
 =?utf-8?B?R2xBQkZCMXQ4SXR6QXBzdlJRdU1qbjdPeW9oZUJhMWx2WVYwMmJQbUcySTB0?=
 =?utf-8?B?LzBQNy9ZMCt1Yy8vNllWUlVBYUs5Z0RJWXhOUmZ0Q2lGRXFOL0tmNmtPdmR0?=
 =?utf-8?B?akJROGtoVXlBSmFlbkVweFpFRnlrd0NBak5OcU5Cb2JaWWlxK01hcFg2UFZR?=
 =?utf-8?B?bDZ6ak1uQ0JSQ3ExaFNDaGJMdThBU3hnazR2YmMvUTJIcS9kUStsSWVKR20z?=
 =?utf-8?B?QzNHay9LcUdhQkNBVFFOeWYzazRBNDZsYldmcG95S3M5WTdGL200cm90RTdl?=
 =?utf-8?B?Ri8wTzZnbWhKc1hsWDQ0cmt3OVNRWUNpZzgxMzRsa3orT28wMjFtLzBpRU4r?=
 =?utf-8?B?RDF0UHVLL1IvQmZqOWptUzdlOWJTb2dlOCtoL2E2WVZQazEvUkNtM0hyendJ?=
 =?utf-8?B?WHJBOGJqVmpDMDVrSHU3UkVEMUdKRFJ5ZkN1OGh6YXpqb2JDOGZsOHFST3R4?=
 =?utf-8?B?NVpDYXdEV3pFeG9zRVpSdU1pdnpoZ09pcy9qNFRmL1p6bG8xTm5HNjFpTXBw?=
 =?utf-8?B?YUFOVDlNZm5ONENtSE5qRGwrM3Qxc3dzZVhGU3VBczUxQytoYVEyVUxCNmJO?=
 =?utf-8?B?MWE2emVzZHZRU3dpems3R3Z6Snp5cTJuRFlmZTNhbzA5MFdLLy9QYVNDeWVK?=
 =?utf-8?B?YmR0cTlYSnRHbFBEeHI0azJKVlpVeXpCRGorTXplS1dtVWFGNXRrT3VSWUoy?=
 =?utf-8?B?VVQ3VnRiWE5SWDBhYTUvMEJLcFQvZEFzbWdDaG9BRSsyZ3dTUW10YlBVUHNl?=
 =?utf-8?B?YVFFMlFQNjRTNk1MWjF3UWFwQ0NyN3hYN3dJR0Z1Y2pZa1dHZVByZytWOVBE?=
 =?utf-8?B?K2NPUmZEMGRkOS9lSWFFZmZNVExIcVNHMW15VXBFZTJBUklzc3pzalFMZkxk?=
 =?utf-8?Q?rUnFVNylta5c+wHRWAC46Z6FyOTX+Bt9mmGg36q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5a04ec-d716-46ca-9682-08d93fc7723c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:13:29.8500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCkIymuHFMTS0pHdpfJWJIxVTYmkcOpq9sLwqXQQip+xU4LUGJeCbiju0FJFcR3s57kW1W5KcNd21Eu+pW9CLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

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
 


