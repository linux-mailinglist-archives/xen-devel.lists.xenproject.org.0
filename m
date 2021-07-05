Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAD3BBEC4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150370.278038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QLa-0008Q1-Ig; Mon, 05 Jul 2021 15:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150370.278038; Mon, 05 Jul 2021 15:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QLa-0008NI-Ew; Mon, 05 Jul 2021 15:17:22 +0000
Received: by outflank-mailman (input) for mailman id 150370;
 Mon, 05 Jul 2021 15:17:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QLY-0008Mw-EO
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:17:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 937a7f0b-7ff4-4cd4-9c75-47175e6cd93d;
 Mon, 05 Jul 2021 15:17:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-qFzQzhysOZa-eU2zVNpaWg-2; Mon, 05 Jul 2021 17:17:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:17:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:17:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Mon, 5 Jul 2021 15:17:14 +0000
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
X-Inumbo-ID: 937a7f0b-7ff4-4cd4-9c75-47175e6cd93d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbQU7L3blROF4Klwca7Ybd+xUlO1Dcp9UzFdRq08MR0=;
	b=ZW8qpxCenTIqKu+Vrv/rjih+Vr4EQQDzigNqSENnfgyop1kATHCbIBo3SrNWxDeWSNeflI
	9cSAT50eS7LDDq+Uxjs5kF+K49BiLKque2G+6EWRmnQNlKo61lhfcfKcHoA1+zViTa6ERB
	CukBXHaStWzTXFWrEXF08b+Cx3lBYpI=
X-MC-Unique: qFzQzhysOZa-eU2zVNpaWg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9zeorFJ8Epf1KxcHwClJfJjkymJMMAMpws/Ju4tlJf5zKoRheap6QkbevTfEU5Roht/feojKrqFT1nD274PVT1hxRI7/Mkveklm/bqxB5+sHPGflJnwqOsumaxBEwxZjpyNHZGQOdW+OkXbpPsnk8yinsQEwp+GgDUYFQg2VfMJmYf/92CZbJZmvo2IeJyE2dp34cBR6zDaho6G97ysrTstiNZiYowA/K/buQ0ECC8g2z3f+TNUB8yG5JrC9aFsjs6+6I2JSCxDEMH1c+Z95xpYVCDBrUjsyeQo3mX+wNPct4fCtuSGgo4F47fwerKzGz3WOoTOVtx7oIIYssi58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbQU7L3blROF4Klwca7Ybd+xUlO1Dcp9UzFdRq08MR0=;
 b=N+7UFuQOTk93zw2pkkJes+XwD2JeqW0/KviOm1THMFqHaqGcv6IVEuWM8tT0XiQIQ0q1K4AnGPuKk5g3ib8bx7ijtqkrxD4TLX9Z6RhVVjZXyKx0LzL+5H+eoZKA+0gLCg+FrNNSj+RRVGxraEal+5KJbXaIa/0UJNAW6m71gR9gV4cMUX7WYMHv8N1HAcDH5vdvOpO4IAbiW1levWDJ5FZOnjoZqPCncjo1ESOjMDXIiWjVJVCRKjzZzQhVLAdM/uPvoIG67G+AMShM6vTflXpZvVRcqLycEnXN9V+gPVwUglGHPdZEhWNTHkf+UkQXydZx7Wt9EeY0P2AiEf/pFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 11/13] x86/paging: supply more useful log-dirty page count
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <6473c419-f989-3307-f6be-7144fc9b35b3@suse.com>
Date: Mon, 5 Jul 2021 17:17:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96dc78b4-f40e-4e24-4647-08d93fc7f839
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547227741211156E02565F42B31C9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwjQuGee4eXl9jSzCyMj9LHR6jjHJ6I1mpMxvdMgfku/QNQpFNhjM6n1mSLSj9lDOe8xVwR0eDGsnJThf1Cj+zmHiRs8B5oQQ0Y7q+sIN1f7y82EVH/CY+awY+k3abmPJArA+NR7e9wsznh5caJ6yAcs4BRDbSeT1ZzOcDYDL/dpIEvLLObqAU0OQCWCZ8by6pXx1LAbjcWOWpKj9OZVrqWGckQEB/uGVrtVTd3AYkShfQk+cWKxcSmU1hIf6qUxk+r06LDf26zZW23J49qL2mRAG1IQZxQAxP/HwWzlK2DNH6oE156GY4FvocwPuS4+NQSLwdqbLTsoe/YCiB5sO/qgSoEb/C5tHJHDrSS+sOREa02d4yixxfqA7kW53yB4DrtIYH+PeDBP0s2Uibbe411pLUp7krUmodovUuQwRH6g99W59fe3Dclc736Jpjy5scCqyO4zsPrErGiUKcLGDE3j7HFuXBWrnibDQYIkVWATPCXg26pifIJpXaVwzLf4V5PkOHAVxb5IrCHsJRk1EYMt1DFLwNXpiVVus30eGao88w+J2+N4uoFHqMw0CnmsriFF5DwuBI1gMVXe5xz4KzW6FKSbY6wF4Ps/141ypt3SPTMFUc2gBd7obC7S7RsnP9j/ni/Y0KFdalGFTIYOQL3/5Tp7DrPJWBU2wn5cw3sMgHqdGVcuaVyLsxxAZwp8Eknryn0F1zEm0J7ifC+erzSEUZ3S4euG+CinkrY/0BuYjHbGi+TH4serhI31bv5V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(54906003)(478600001)(6486002)(316002)(16576012)(2616005)(83380400001)(6916009)(8936002)(2906002)(8676002)(956004)(4326008)(5660300002)(30864003)(66946007)(86362001)(66556008)(66476007)(36756003)(38100700002)(26005)(186003)(31696002)(31686004)(16526019)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWo5VzRDZUg2QTNDUzc2KzRYd0RaeGE1SlB3RWdPSkVUS2MwUmdVaFFhTDNF?=
 =?utf-8?B?KzZCcjNGeTZ1WTB4d05DVXZlZEMzeVlmR2M1b3hLdHZBWmgwRURnb2FCY3U3?=
 =?utf-8?B?NHo0ZWV3TnBaVXYwSVhQbXUzTnZMS1B0dzNZTnZ5U0p1KzVkZkNwRVY2d01w?=
 =?utf-8?B?cVFnNlUzRWw4Z3VaWnlPaXUwQ0Q4SU81c21iUkpsMm5uUHRSZmFiZ1pUR2tz?=
 =?utf-8?B?Nm1sVW45NnpITGYybnZ5WlEwZXVqWHJuaXdsTEl1NUVRR2RrbTBkenAwOGNj?=
 =?utf-8?B?U3ZZQXNPQURPZmxEUjNXSDE2bDFLRHFqakdGcmpWcFZIZzRTV0F0Rit3YktN?=
 =?utf-8?B?VVYvWHdwYytSQ2k1ZzlUcE15aWtZSVBKSHJEeFVCakx4TFFlYTU4MDB3NERQ?=
 =?utf-8?B?UzBWMVZIcGwwSUNXMDlTTTdGb1FWbmlmci9oQ2NWaVZjcEoxSEtiV2lBdmhr?=
 =?utf-8?B?OE0wb3lkL1pnNnVSUXBXQ3dPSTBmMjBxN1ZqbllEbGhuMWRYU3dBR1k2cmY2?=
 =?utf-8?B?NldKUTlrNWNTaERsZGhBbWVvMnpncStMWWFDOXRYdmRGSDVZdjF0U0ZWR2ZG?=
 =?utf-8?B?eUhCUm5Ic0ltdlkxbUZLbmw1eXYyVVduZS9ZTDF5Qm9VTzdIK2JXWDU2dGR5?=
 =?utf-8?B?akt4N3Jha09oK1ptbHM5N0l1U0Zvdnl5Z05sUVAyUjd5NEJpS3EvUXJ6UDhS?=
 =?utf-8?B?NjI3WDB4dHV2STVsUDRyc2Z5UUJCY0JVbjBzNTR3M0pLNklrZHhnZ1ArTk1P?=
 =?utf-8?B?UFJCZHZ4a3R3alVRQWE2ajZKWDRZU3d4WnpDMk9RcEhJV0hScFBCallZQWND?=
 =?utf-8?B?VWVqdzgxT1NqSkVsRHBhOE9oRHMzRWpvU2tDK2piOHpicE5LeDdYM3RHaEI5?=
 =?utf-8?B?NVdQeTgxbmpya0ZZa1JaZjVBNk5xci9SdWhKQWJBdHdWRzhqeFdlQUNRZnpE?=
 =?utf-8?B?TDBVeWlKZTV5YzU3RVM2SjVzV3cxTy9LZWJYeDhsNmFOME5hbmFaQm5UUmYv?=
 =?utf-8?B?UDZGY0ZtVmY1dVVsZTFiWDFsUEFSY2xDWlZsR0FpMmtwNkFtUFN6ZlltdGZF?=
 =?utf-8?B?dXpxcUZzZ1prK2l4QkxmK3l1WGdPWll6YlB2UGlOMXFVUU4xaVM2RGVqMnNG?=
 =?utf-8?B?TnlQNjVuUlJ0UjlLQnkvaXVpYnp0VEFOT0FNYlJ1TmQzdHFtQXJLbWNpeFIy?=
 =?utf-8?B?REFXOEpMWjBjdnVOdllOem9COFhSbTZ0NE4xRHNYYUVlOFN5ZXVjcVFWTFM3?=
 =?utf-8?B?Z2VTWWdFMjZ0bHh3b1M0ZkZvVXM0YUFGWWwrR09EYmdRQncvcUVQL1o0YS8w?=
 =?utf-8?B?bDFuSHZpQlcxNG8zamZqdnFlYXRzM0ZwVFFadmxHWERUUHdadGR2Z09OYVJM?=
 =?utf-8?B?eTF2VWdwQlY4dVh5VjRBU21aRjBLNnhBanhiTzRNNHFrU0NRTWJacGFqaUo1?=
 =?utf-8?B?VytCYktEZEFDYnQ2RSsySFFrUHZ3QUhnbWwxYStlZzJUQjRHZHpPL212ZHY1?=
 =?utf-8?B?WlYrWTlKWHBsSk9JUkwzZ0tJdGtkK3lwTE9jTWRDZ0ltTVFXOG1nOHBUbHUv?=
 =?utf-8?B?SXJJaXJwQm9YcThGUytrWHUwTXVBSVZNVkJEUnBubCs4L1RvQ1Q5eFlzajhV?=
 =?utf-8?B?dlU0OHZ6VDJZaFNtVGVkRXcwWlkwVEprMEllSURqOVdDVmZnaVcyMUFza01y?=
 =?utf-8?B?eTA1RTFrME00VzN5Nlplem52bjNGK0lkVXJuMVI5OHVYV2JjWStKWWNSZHFy?=
 =?utf-8?Q?fsX4i7sC3dsjxzCMyVEi/l48lT27vjO/xu8h4A3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dc78b4-f40e-4e24-4647-08d93fc7f839
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:17:14.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zCDBfAyrX+pE5z4UZAUcfkvEsWOeth9g+GFEtMrkM91wdKIUkGuSwrE9X3Hwa9pZRDwtk0+UWLPjuSMm6UAAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

In paging_log_dirty_op(), always update the count of pages field:
- if more pages were specified than the guest has ever accessed (HVM) or
  marked part of the p2m (PV), there's no point for the caller to
  inspect bits beyond the one for that last page,
- if the guest's p2m size has grown in the meantime, the caller would
  have no indication that it may not have caught all dirty bits.

Also exit the loop once having passed the last valid GFN. To balance
overhead and savings, do this before inspecting a new L2 table.

Adjust libxenguest accordingly, albeit these changes are necessary only
for guests which actually alter their P2M size while under migration.
They do, however, additionally open up the option of the hypervisor
eventually zapping large ranges of trailing zeros from the bitmap when
providing it back to the tools.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this still is far from ideal: At the very least a perhaps
large tail of zeros could very well also result in a reduced page
count.

--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -237,7 +237,16 @@ struct xc_sr_context
             /* Further debugging information in the stream. */
             bool debug;
 
+            /*
+             * Counts of bits (each representing a guest page), expressing
+             * respectively
+             * - obtained P2M size,
+             * - allocated bitmap size,
+             * - range actually filled with valid data.
+             */
             unsigned long p2m_size;
+            unsigned long p2m_alloc_size;
+            unsigned long p2m_used_size;
 
             struct precopy_stats stats;
 
@@ -245,6 +254,7 @@ struct xc_sr_context
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
+            unsigned long used_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
         } save;
 
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -450,7 +450,8 @@ static int send_checkpoint_dirty_pfn_lis
     xc_interface *xch = ctx->xch;
     int rc = -1;
     unsigned int count, written;
-    unsigned long i;
+    unsigned long i, p2m_size;
+    long long ret;
     uint64_t *pfns = NULL;
     struct iovec *iov = NULL;
     struct xc_sr_record rec = {
@@ -459,22 +460,29 @@ static int send_checkpoint_dirty_pfn_lis
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-             HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             0, NULL) != ctx->restore.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+              HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
+              0, NULL);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         goto err;
     }
+    if ( ret > ctx->restore.p2m_size )
+    {
+        ERROR("Guest has grown its p2m too much");
+        goto err;
+    }
+    p2m_size = ret;
 
-    for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
+    for ( i = 0, count = 0; i < p2m_size; i++ )
     {
         if ( test_bit(i, dirty_bitmap) && !++count )
             break;
     }
 
-    if ( i < ctx->restore.p2m_size )
+    if ( i < p2m_size )
     {
         ERROR("Too many dirty pfns");
         goto err;
@@ -495,7 +503,7 @@ static int send_checkpoint_dirty_pfn_lis
         goto err;
     }
 
-    for ( i = 0, written = 0; i < ctx->restore.p2m_size; ++i )
+    for ( i = 0, written = 0; i < p2m_size; ++i )
     {
         if ( !test_bit(i, dirty_bitmap) )
             continue;
@@ -739,8 +747,10 @@ static int setup(struct xc_sr_context *c
 
     if ( ctx->stream_type == XC_STREAM_COLO )
     {
+        unsigned long pages = NRPAGES(bitmap_size(ctx->restore.p2m_size));
+
         dirty_bitmap = xc_hypercall_buffer_alloc_pages(
-            xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
+            xch, dirty_bitmap, pages);
 
         if ( !dirty_bitmap )
         {
@@ -748,6 +758,8 @@ static int setup(struct xc_sr_context *c
             rc = -1;
             goto err;
         }
+
+        ctx->restore.p2m_size = pages << (PAGE_SHIFT + 3);
     }
 
     rc = ctx->restore.ops.setup(ctx);
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -74,6 +74,16 @@ static int write_checkpoint_record(struc
     return write_record(ctx, &checkpoint);
 }
 
+static void update_deferred_pages(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    if ( !ctx->save.deferred_pages )
+        return;
+    set_bit(pfn, ctx->save.deferred_pages);
+    ++ctx->save.nr_deferred_pages;
+    if ( pfn >= ctx->save.used_deferred_pages )
+        ctx->save.used_deferred_pages = pfn + 1;
+}
+
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
  * is constructed in ctx->save.batch_pfns.
@@ -130,11 +140,8 @@ static int write_batch(struct xc_sr_cont
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
-        if ( mfns[i] == INVALID_MFN && ctx->save.deferred_pages )
-        {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-            ++ctx->save.nr_deferred_pages;
-        }
+        if ( mfns[i] == INVALID_MFN )
+            update_deferred_pages(ctx, ctx->save.batch_pfns[i]);
     }
 
     rc = xc_get_pfn_type_batch(xch, ctx->domid, nr_pfns, types);
@@ -196,12 +203,7 @@ static int write_batch(struct xc_sr_cont
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    if ( ctx->save.deferred_pages )
-                    {
-                        set_bit(ctx->save.batch_pfns[i],
-                                ctx->save.deferred_pages);
-                        ++ctx->save.nr_deferred_pages;
-                    }
+                    update_deferred_pages(ctx, ctx->save.batch_pfns[i]);
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
@@ -369,7 +371,7 @@ static int suspend_domain(struct xc_sr_c
  * Send a subset of pages in the guests p2m, according to the dirty bitmap.
  * Used for each subsequent iteration of the live migration loop.
  *
- * Bitmap is bounded by p2m_size.
+ * Bitmap is bounded by p2m_alloc_size, but populated only up to p2m_used_size.
  */
 static int send_dirty_pages(struct xc_sr_context *ctx,
                             unsigned long entries, bool all_dirty)
@@ -381,7 +383,10 @@ static int send_dirty_pages(struct xc_sr
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
-    for ( p = 0, written = 0; p < ctx->save.p2m_size; ++p )
+    if ( all_dirty )
+        ctx->save.p2m_used_size = ctx->save.p2m_size;
+
+    for ( p = 0, written = 0; p < ctx->save.p2m_used_size; ++p )
     {
         if ( !all_dirty && !test_bit(p, dirty_bitmap) )
             continue;
@@ -526,6 +531,8 @@ static int send_memory_live(struct xc_sr
 
     for ( ; ; )
     {
+        long long ret;
+
         policy_decision = precopy_policy(*policy_stats, data);
         x++;
 
@@ -552,15 +559,23 @@ static int send_memory_live(struct xc_sr
         if ( policy_decision != XGS_POLICY_CONTINUE_PRECOPY )
             break;
 
-        if ( xc_logdirty_control(
-                 xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-                 &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-                 0, &stats) != ctx->save.p2m_size )
+        ret = xc_logdirty_control(
+                  xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+                  &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_alloc_size,
+                  0, &stats);
+        if ( ret < 0 )
         {
             PERROR("Failed to retrieve logdirty bitmap");
             rc = -1;
             goto out;
         }
+        if ( ret > ctx->save.p2m_alloc_size )
+        {
+            ERROR("Guest has grown its p2m too much");
+            rc = -1;
+            goto out;
+        }
+        ctx->save.p2m_used_size = ret;
 
         policy_stats->dirty_count = stats.dirty_count;
 
@@ -614,7 +629,7 @@ static int colo_merge_secondary_dirty_bi
     for ( i = 0; i < count; i++ )
     {
         pfn = pfns[i];
-        if ( pfn >= ctx->save.p2m_size )
+        if ( pfn >= ctx->save.p2m_alloc_size )
         {
             PERROR("Invalid pfn 0x%" PRIx64, pfn);
             rc = -1;
@@ -642,6 +657,7 @@ static int suspend_and_send_dirty(struct
     xc_shadow_op_stats_t stats;
     char *progress_str = NULL;
     int rc;
+    long long ret;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
@@ -649,16 +665,22 @@ static int suspend_and_send_dirty(struct
     if ( rc )
         goto out;
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-             HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_size,
-             XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=
-         ctx->save.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+              HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_alloc_size,
+              XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
         goto out;
     }
+    if ( ret > ctx->save.p2m_alloc_size )
+    {
+        ERROR("Guest has grown its p2m too much");
+        rc = -1;
+        goto out;
+    }
 
     if ( ctx->save.live )
     {
@@ -670,7 +692,8 @@ static int suspend_and_send_dirty(struct
         xc_set_progress_prefix(xch, "Checkpointed save");
 
     if ( ctx->save.deferred_pages )
-        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_alloc_size);
+    ctx->save.p2m_used_size = MAX(ret, ctx->save.used_deferred_pages);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
@@ -688,8 +711,9 @@ static int suspend_and_send_dirty(struct
         goto out;
 
     if ( ctx->save.deferred_pages )
-        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
+        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_alloc_size);
     ctx->save.nr_deferred_pages = 0;
+    ctx->save.used_deferred_pages = 0;
 
  out:
     xc_set_progress_prefix(xch, NULL);
@@ -702,6 +726,7 @@ static int verify_frames(struct xc_sr_co
     xc_interface *xch = ctx->xch;
     xc_shadow_op_stats_t stats;
     int rc;
+    long long ret;
     struct xc_sr_record rec = { .type = REC_TYPE_VERIFY };
 
     DPRINTF("Enabling verify mode");
@@ -715,15 +740,18 @@ static int verify_frames(struct xc_sr_co
     if ( rc )
         goto out;
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
-             &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-             0, &stats) != ctx->save.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
+              &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_alloc_size,
+              0, &stats);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
         goto out;
     }
+    if ( ret > ctx->save.p2m_alloc_size )
+        IPRINTF("Guest has grown its p2m too much");
 
     DPRINTF("  Further stats: faults %u, dirty %u",
             stats.fault_count, stats.dirty_count);
@@ -804,13 +832,14 @@ static int setup(struct xc_sr_context *c
 
     if ( ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN )
     {
+        unsigned long pages = NRPAGES(bitmap_size(ctx->save.p2m_size));
         DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                         &ctx->save.dirty_bitmap_hbuf);
 
         dirty_bitmap =
-            xc_hypercall_buffer_alloc_pages(
-                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+            xc_hypercall_buffer_alloc_pages(xch, dirty_bitmap, pages);
+        ctx->save.p2m_alloc_size = pages << (PAGE_SHIFT + 3);
+        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_alloc_size);
 
         if ( !dirty_bitmap || !ctx->save.deferred_pages )
             goto enomem;
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -397,6 +397,19 @@ int paging_mfn_is_dirty(struct domain *d
     return rv;
 }
 
+/*
+ * This is used to provide a rough (upper) estimate to the caller of how many
+ * more pages we might have data for.
+ */
+static unsigned int last_valid_entry(const mfn_t *tbl, unsigned int idx) {
+    unsigned int last = LOGDIRTY_NODE_ENTRIES;
+
+    for ( ; idx < LOGDIRTY_NODE_ENTRIES; ++idx )
+        if ( mfn_valid(tbl[idx]) )
+            last = idx;
+
+    return last;
+}
 
 /* Read a domain's log-dirty bitmap and stats.  If the operation is a CLEAN,
  * clear the bitmap and stats as well. */
@@ -405,10 +418,10 @@ static int paging_log_dirty_op(struct do
                                bool_t resuming)
 {
     int rv = 0, clean = 0, peek = 1;
-    unsigned long pages = 0;
+    unsigned long pages = 0, extra = 0;
     mfn_t *l4 = NULL, *l3 = NULL, *l2 = NULL;
     unsigned long *l1 = NULL;
-    int i4, i3, i2;
+    unsigned int i4, i3, i2;
 
     if ( !resuming )
     {
@@ -479,6 +492,15 @@ static int paging_log_dirty_op(struct do
         l3 = (l4 && mfn_valid(l4[i4])) ? map_domain_page(l4[i4]) : NULL;
         for ( ; (pages < sc->pages) && (i3 < LOGDIRTY_NODE_ENTRIES); i3++ )
         {
+            unsigned long max_gfn = domain_get_maximum_gpfn(d);
+
+            if ( (i4 * LOGDIRTY_NODE_ENTRIES + i3) *
+                 LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8 > max_gfn )
+            {
+                i4 = LOGDIRTY_NODE_ENTRIES;
+                break;
+            }
+
             l2 = ((l3 && mfn_valid(l3[i3])) ?
                   map_domain_page(l3[i3]) : NULL);
             for ( i2 = 0;
@@ -502,18 +524,36 @@ static int paging_log_dirty_op(struct do
                         goto out;
                     }
                 }
+
                 pages += bytes << 3;
+
                 if ( l1 )
                 {
+                    if ( unlikely(pages >= sc->pages) )
+                        extra = (PAGE_SIZE - bytes) << 3;
+
                     if ( clean )
                         clear_page(l1);
                     unmap_domain_page(l1);
                 }
             }
+
             if ( l2 )
+            {
+                if ( unlikely(pages >= sc->pages) )
+                {
+                    i2 = last_valid_entry(l2, i2);
+                    if ( i2 < LOGDIRTY_NODE_ENTRIES )
+                        extra = ((i4 * LOGDIRTY_NODE_ENTRIES + i3) *
+                                 LOGDIRTY_NODE_ENTRIES + i2 + 1) *
+                                PAGE_SIZE * 8;
+                }
+
                 unmap_domain_page(l2);
+            }
 
-            if ( i3 < LOGDIRTY_NODE_ENTRIES - 1 && hypercall_preempt_check() )
+            if ( pages < sc->pages && i3 < LOGDIRTY_NODE_ENTRIES - 1 &&
+                 hypercall_preempt_check() )
             {
                 d->arch.paging.preempt.log_dirty.i4 = i4;
                 d->arch.paging.preempt.log_dirty.i3 = i3 + 1;
@@ -521,10 +561,21 @@ static int paging_log_dirty_op(struct do
                 break;
             }
         }
+
         if ( l3 )
+        {
+            if ( !rv && unlikely(pages >= sc->pages) )
+            {
+                i3 = last_valid_entry(l3, i3);
+                if ( i3 < LOGDIRTY_NODE_ENTRIES )
+                    extra = (i4 * LOGDIRTY_NODE_ENTRIES + i3 + 1) *
+                            LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8;
+            }
+
             unmap_domain_page(l3);
+        }
 
-        if ( !rv && i4 < LOGDIRTY_NODE_ENTRIES - 1 &&
+        if ( !rv && pages < sc->pages && i4 < LOGDIRTY_NODE_ENTRIES - 1 &&
              hypercall_preempt_check() )
         {
             d->arch.paging.preempt.log_dirty.i4 = i4 + 1;
@@ -534,8 +585,19 @@ static int paging_log_dirty_op(struct do
         if ( rv )
             break;
     }
+
     if ( l4 )
+    {
+        if ( !rv && unlikely(pages >= sc->pages) )
+        {
+            i4 = last_valid_entry(l4, i4);
+            if ( i4 < LOGDIRTY_NODE_ENTRIES )
+                extra = (i4 + 1) * LOGDIRTY_NODE_ENTRIES *
+                        LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8;
+        }
+
         unmap_domain_page(l4);
+    }
 
     if ( !rv )
     {
@@ -562,8 +624,8 @@ static int paging_log_dirty_op(struct do
         return rv;
     }
 
-    if ( pages < sc->pages )
-        sc->pages = pages;
+    sc->pages = min(pages + extra, domain_get_maximum_gpfn(d) + 1);
+
     if ( clean )
     {
         /* We need to further call clean_dirty_bitmap() functions of specific
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -261,7 +261,8 @@ struct xen_domctl_shadow_op {
 
     /* OP_PEEK / OP_CLEAN */
     XEN_GUEST_HANDLE_64(uint8) dirty_bitmap;
-    uint64_aligned_t pages; /* Size of buffer. Updated with actual size. */
+    uint64_aligned_t pages; /* Size of buffer. Updated with actual (or
+                               potentially needed) size. */
     struct xen_domctl_shadow_op_stats stats;
 };
 


