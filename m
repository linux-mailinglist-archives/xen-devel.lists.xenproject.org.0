Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B263B444D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147201.271176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlkz-0002MC-GC; Fri, 25 Jun 2021 13:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147201.271176; Fri, 25 Jun 2021 13:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlkz-0002Jt-Cg; Fri, 25 Jun 2021 13:20:29 +0000
Received: by outflank-mailman (input) for mailman id 147201;
 Fri, 25 Jun 2021 13:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlky-0002IV-3H
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:20:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d30a404f-f236-419f-8445-83a68afa4d29;
 Fri, 25 Jun 2021 13:20:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-XLwUSQetPoWehQbf_rgoSw-3; Fri, 25 Jun 2021 15:20:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:20:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:20:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:20:20 +0000
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
X-Inumbo-ID: d30a404f-f236-419f-8445-83a68afa4d29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ct2KS5gJ4GCYf4vquepAwBJLuaf7rCN9u1z/krvGGpw=;
	b=jnKSTrvHrDhsdELbtwE1eux1ipwZpyXJIls3kfvNaw7JKGtsP/xDqwdenDYiO9E+GS8ZnZ
	M6chwYBzdHhH4sadQzUby500q+Gr65s2a81l4b6A/rFZ/mTpSZnAGq0N5YdbYgNQG4SuXg
	CYHXpT3E99JPbuVQP/DZUi7E5iMi7gk=
X-MC-Unique: XLwUSQetPoWehQbf_rgoSw-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVV7p73F8hl92UEJ1f/H06o3hrDpCSBpa+8VXWvyEsHErkjuyQqdJgykZhUGx4WTALHKqDrDlbL7Le/OJfL2pn8QmYquulk2LtX+TVOf2LWqICIjV5yUdgneJUlid5DHQ5C0+3C4iLY19E+4LD9VBwgZT5E91ogEgsw+IC0sKsBIq7R+0KBbBBSGFo7EJ+C1JUTHiq0I12hKVFTl3Bzqm6bbEDZa5nQZt5F/ehjfs9EM8Y38OD6CSpBJiPmTHyPYjDC2xO+k7AHj+jY6Tkvo7XNgjpbJG1tOYsab7KAw4VHE6gCyYq+2PNAbF4zhNVAb5mXJxbT6ItjVls9mZHCb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ct2KS5gJ4GCYf4vquepAwBJLuaf7rCN9u1z/krvGGpw=;
 b=GIMS7JnVw97NiH05HqjgQ3LD225I4Ys61WPC4Do7Dy0A+Os7CMMpR2zmKPZHiDKWeY3zVklGvGlFTEFFdUNAoDn58LFRrahiCvmm6VynxnN0OLD8Xtqon1FRO7vXeb7w51WxvAbazEbOYdwsGQOOfpBAt9xMCmuGcbpNfTdO64CwgJrSO1wv6YDkPiv64BWAjgahbPF0YzrpRpuInDFRnmJGpzMvbRpZLiV3uoCiB7rjDNw+NhAE8HFDOr4+myi0/erfUySvqLEHG+eFBxWN+7P0/m6Y0KWJoPMcZJpzL6xeZxOo3mnWR1KlfrNqIwbQ3rHEHSljVg5MMsllQlm8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 06/12] libxenguest: guard against overflow from too large p2m
 when checkpointing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <09e81b91-84de-6e49-9a62-eb3a6f392954@suse.com>
Date: Fri, 25 Jun 2021 15:20:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04bdc782-23cc-4c09-2ae7-08d937dbfbf2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59019535A378CF23994D2A8FB3069@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DXtRdePfNXwE3zIOtKKlitejkoh/GfeED9tKSmxHINOR6uu3J7Z/+Z0PdmsrWReAnrH9YlyAUrRiCmluAsbPvezSj1PtYkrKQV/vX4+aSEHx9qGapO/OXMrB7UWq/4BYeys+N5TldTiFwLnDA4UAlIgwfNU+xy6YUot1FrH423h7wHWUFg/b1/jktjtJYmzXW4lr0LziyjiFdxE5o2BCoeJT1Ddqlwf3smS4E+zU52MdcmaKoLoFma6/E+jFCo6yLzJNmQS8ustV60o9Z7qF0Y8uM3DfM5BDWcz6jbIbXAvRtztBcfqUXE71BQxA4sdXnyrYhGTCwy5sIHDwqaTBu1AhUWnCI7dVtc5IuYiW3XTlcmamXSsKU24ec+R7FOIBHRQ6JQtwjDVeUJVC0DprSW/lZYnCRTDjQjIOk0AWyP8rceeF6WKHVMS3s2gLt2BpPeJ+Cyx3GuBvFB2pNdIVPbLb8nVTkTFMC1QaJ4YRHXyFoeDB3NXzFgkVgA7JoqzfCW8MaBinfuE6FpFH5OYi8LWr12sX/nnTEG4fSf8poepK690+ISzgtEwrzMDQ5yd0uN+SKW68DiZt/wPjVqTohJcTWwkDQiVhNXLUWPUEhQG7Vx89QLbPio2pjnf3RbpAagaw0Ygme1d2tYmIrHqHzMllgS3jG7zSmtPgkoSoGliw6GFlx9lsmfBYd+FC/Jwu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(83380400001)(2906002)(66556008)(66476007)(2616005)(956004)(31696002)(86362001)(31686004)(66946007)(36756003)(186003)(16526019)(26005)(16576012)(316002)(8936002)(8676002)(6486002)(6916009)(5660300002)(478600001)(54906003)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkg1a0IvRjBZNXJRN1M1REg2UEFiSUhBOGIvYWgvTjVObUZHbVRqZEtJTEFD?=
 =?utf-8?B?V1l5WU0vQmdyaENzcmQwUEN6eUhoWVhRYnRSWlc3b0FnZm9KazlrdURGcHcx?=
 =?utf-8?B?RTFCUFVCWTFZVkRFVCs2QXBVM0pPUVV5NGVYVFhwY3UzRG1KSnpHdWpSVStt?=
 =?utf-8?B?VmZyOVJFZG5lcEVCWDdINTY0bGFlbHFaRlpGQzJ3ZXV1TGxwem85WWxlYXU1?=
 =?utf-8?B?SjloRDV5UkJqQ3U4OHhqM0JBNXZpNUxnWExyVVlscHFtSWhzNCt6WnBjSVc3?=
 =?utf-8?B?enZiVzd3a0hHeXlwRGovYVRPQ3dhZS9MU3FPR0pINE1URlZyckt4OWI3UzVQ?=
 =?utf-8?B?K0VveG16QXZzbzJwcjVDQTZhK21RRE5xaStvZ0pYMkJRWmJVS0p1R2MxWTRR?=
 =?utf-8?B?dUF2d0IvN1pYaGxYUFppZk9jNXdGZ1RvMm94RHExWGxEU3FyM1E3dEhaT09r?=
 =?utf-8?B?Y205SUgyWDFQUk5CMkkza2JoZWVjTmxVYzUzeGY3b1kwN2NzVldOYVlYS0pZ?=
 =?utf-8?B?VWd0ZDdWcm5XQUNaN0hhVHFmRnU5bnBTQUh0Wjg5Y2ExTVhEVitPUnZ0UnAx?=
 =?utf-8?B?MHVJRzUzTzhXZENZUXc5RWh3Q3Q1emg3MnVBbzlDeWc4a1ZYSmIxZUZLeEl5?=
 =?utf-8?B?MGxrdWhXSkVVZWdtaFlvZlVvenY1c0crNDRHY3VNSGI2MlVkMHhPcXhyQzVa?=
 =?utf-8?B?cGhCaFZ3UU96UytXVUVYVUU5U3d1MXBzOVlhV0YvVnBuOXFKcHNTRU5mOUZv?=
 =?utf-8?B?RGxncGswc21vR1VJNElSSDJRaldlU1NnSGFoQUVJVjV5TE04RWxtK3BkOGpo?=
 =?utf-8?B?bTVNT29EVy9HVWhiQTBwbEttekg3aUJONjFSbFh1MUdIdzlIRU91QnNHN2hz?=
 =?utf-8?B?R1FnMXh4d1lkWjhQVitralJGRnllRjg5bnBxT0dOTnFBVVIrcUVjaG1wWnFn?=
 =?utf-8?B?aGJJY1NXWFI3TVM1NGJwV0tzdlU2eFFhK3BIbW9hU3g1QjU4UG5JNjU4eGpU?=
 =?utf-8?B?MnNIUm4xR04zeEJ4TkViWkExRE5zTDNyTkk4ZTFOVEl0ZWpIbmVJRTYrTHVT?=
 =?utf-8?B?R0dCSm1LNXcvcWNsRE9kaDZ6MzVYMUVvSC9NK1BoZGlwZUFGeHN4WWV2Q3dF?=
 =?utf-8?B?OFVNQU1ZR09ITGoreVl5bDlhZXR0UHNRaTRwY1BrTWJjazI0b3kwQ0ZnOU82?=
 =?utf-8?B?Q1YybmRYZmhJVlpRNGhNSTJWS25YMFdORC8xNFRZQ2luWTZ2UlNLLzBacmN1?=
 =?utf-8?B?RGxrR2lPNzg3cVY5ak45eThFSEFwdVZ1dHJkNk0yN0NUZGZNRWluVGFadHBh?=
 =?utf-8?B?bitaMHBZMERHc1BPd1YxNkZNTnBWZHo0TlRsRGpUc1VHQnNOQkdibzhOdkMx?=
 =?utf-8?B?ajJreSt3YndWZ3dCdk1zSVpURlFXQ1Q1SjFicWtabk5aTk8vRGltWEpSajFS?=
 =?utf-8?B?Q0VmMjU1cHdQT042TzJHUllUWms3aU8xOHllb0xvYWRPeCtZVlBPaGJOMS83?=
 =?utf-8?B?OTlwK2dPRDI0amZwU3NUdUJBNGNqalJpUUZEd2t0emNHaFc2SkF2RFVqcVkx?=
 =?utf-8?B?UE9ZMUQ3YzFnR2MzeHdna1R5dHd6Z2dVZ2JOQ21JQ3BIZjkwQUdzdmpncW5T?=
 =?utf-8?B?RDh1ZXBOVkZTQzVWS1U0aVd3SDJiS1JKcmpEU1VTQS8zZjN0SkY4enB1OThx?=
 =?utf-8?B?OW05L2lLRm9nUkFhSXo2N2NSME10YmF3VlI1QzRBc1FIRDFDZGgxV2k0QVI2?=
 =?utf-8?Q?lWKTUi++iS5JP7d3OtGjnURSZsw6yrgrqqlci7g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bdc782-23cc-4c09-2ae7-08d937dbfbf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:20:21.7371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfczbUV+cMkP5OWrj/L/AzEVj36pPSJshbbM1l58I9CNZ+bCxXYSrvASkqEG2soGQDphPGs+dSxs8XKSM//flA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

struct xc_sr_record's length field has just 32 bits. Fill it early and
check that the calculated value hasn't overflowed. Additionally check
for counter overflow early - there's no point even trying to allocate
any memory in such an event.

While there also limit an induction variable's type to unsigned long:
There's no gain from it being uint64_t.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course looping over test_bit() is pretty inefficient, but given that
I have no idea how to test this code I wanted to restrict changes to
what can sensibly be seen as no worse than before from just looking at
the changes.

--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -450,7 +450,8 @@ static int send_checkpoint_dirty_pfn_lis
     xc_interface *xch = ctx->xch;
     int rc = -1;
     unsigned int count, written;
-    uint64_t i, *pfns = NULL;
+    unsigned long i;
+    uint64_t *pfns = NULL;
     struct iovec *iov = NULL;
     struct xc_sr_record rec = {
         .type = REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
@@ -469,16 +470,28 @@ static int send_checkpoint_dirty_pfn_lis
 
     for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
     {
-        if ( test_bit(i, dirty_bitmap) )
-            count++;
+        if ( test_bit(i, dirty_bitmap) && !++count )
+            break;
     }
 
+    if ( i < ctx->restore.p2m_size )
+    {
+        ERROR("Too many dirty pfns");
+        goto err;
+    }
+
+    rec.length = count * sizeof(*pfns);
+    if ( rec.length / sizeof(*pfns) != count )
+    {
+        ERROR("Too many (%u) dirty pfns", count);
+        goto err;
+    }
 
-    pfns = malloc(count * sizeof(*pfns));
+    pfns = malloc(rec.length);
     if ( !pfns )
     {
-        ERROR("Unable to allocate %zu bytes of memory for dirty pfn list",
-              count * sizeof(*pfns));
+        ERROR("Unable to allocate %u bytes of memory for dirty pfn list",
+              rec.length);
         goto err;
     }
 
@@ -504,8 +517,6 @@ static int send_checkpoint_dirty_pfn_lis
         goto err;
     }
 
-    rec.length = count * sizeof(*pfns);
-
     iov[0].iov_base = &rec.type;
     iov[0].iov_len = sizeof(rec.type);
 
@@ -513,7 +524,7 @@ static int send_checkpoint_dirty_pfn_lis
     iov[1].iov_len = sizeof(rec.length);
 
     iov[2].iov_base = pfns;
-    iov[2].iov_len = count * sizeof(*pfns);
+    iov[2].iov_len = rec.length;
 
     if ( writev_exact(ctx->restore.send_back_fd, iov, 3) )
     {


