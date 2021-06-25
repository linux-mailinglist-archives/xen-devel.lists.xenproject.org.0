Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F33B4451
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147212.271202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlm2-0003dY-6t; Fri, 25 Jun 2021 13:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147212.271202; Fri, 25 Jun 2021 13:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlm2-0003aW-1D; Fri, 25 Jun 2021 13:21:34 +0000
Received: by outflank-mailman (input) for mailman id 147212;
 Fri, 25 Jun 2021 13:21:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlm1-0003a8-8o
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:21:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 280a3dba-d588-43ab-93e7-58afc64e532b;
 Fri, 25 Jun 2021 13:21:32 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-9MKHCehGP_eK2JfivLeiCQ-1; Fri, 25 Jun 2021 15:21:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:21:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:21:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Fri, 25 Jun 2021 13:21:25 +0000
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
X-Inumbo-ID: 280a3dba-d588-43ab-93e7-58afc64e532b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wy8FFzMhJLtSUZVcqiSIXfxNx8LKO8CGNT1Vso9BXnI=;
	b=nqMZWISyAmTsVdNnW38Cn60dfeLZnCDS+dXQNGOT5wDW6mRYL4c9kFfarVezvi5UZUHz50
	biPg8TUXlLfLCMAaGWBxkm7PuDRzZcC8zVoITFW54ZRagwU933pjeqYvYmzJjdfLLOQ1Fn
	8I7e4zcpQQkpFELwafq3D8qHmlYSb8g=
X-MC-Unique: 9MKHCehGP_eK2JfivLeiCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hITg0nLH8FX36vG+D5jEqUK+gRj4dHHHtjvjWuaI6VG2nGyMEA/M/w7NftCeDa/lDWdk0L/51FHA12J/Rskt87kDwCAZR+0Bpi/4SbfXMbCjd41+HOt6DkwWuz5O2KiBdrjqPo/Bl567Ohhgyr97jgtt4ilOjOcTxzI6gs1Q2VMfNcmVjD2RkwEoY/Fp6NueC8KRjQwsPmdUhWq7YYaKVxGc2H1CAp4DOSlhWUQxCmcP27tJPSjfPsnjvIv6YVFFXWpRVpkZJOoptku58zC+AMmCkY1taq/xfzaPt6kO4CKIWz/pCt5+58Ls4qLLHA/yuOkKdMbtMWCKDItjx7//zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy8FFzMhJLtSUZVcqiSIXfxNx8LKO8CGNT1Vso9BXnI=;
 b=ZinHXSqxSVhYHFx3OZw2itEst3JyEsRHnobEngK6WPHFDF5Ka9np8Xo78CzcMaPsRYQYD5/7HJ9BDvUmtxTTGI5lpGzMvy7aZ4bN8w0HAIceqJjY3CcI8HGJTCoZTLTfkM6dpgZDOdLaAc4QULArxnAiKf4iLs9L0pCMOetfxtrE7MLY/nSWwfdZD+uQLrqdCkduPyKo9Sj0EX/e5pS9oJB1CVpXX1Pd09KXZf1a6zPRcWiPLjd1ySYSRRaGqK2DZaRV6btblYoCcHiEbmNlAZ3K2AGTKoBNeo2zKnyqoKeYcb+G1TykQl87A9POINdM65zyX+yJ3IJH+t3pkQn/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 08/12] x86/paging: deal with log-dirty stats overflow
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <92968d22-f3e2-4eb2-59fe-b1f638c60133@suse.com>
Date: Fri, 25 Jun 2021 15:21:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f312f3-c034-41f3-7614-08d937dc224b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33900F821539E4A6C2DDA161B3069@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OEJLIWAxy/5iSwwdH0/avC12CnTX3yttMGvS/bAiBhAhsHocA7ZNHHrYTcwG2A38um1RvSGYNf1zWeacaeBNNreIYbDQ7bbNQofUoJU4Gkh7jjhx67nfYasXTJ7vcQRq0hsxqOR3BHfNjyUx56IpW9uF+ZT1JURWz2GuKdIaO8j7Mc+dbXKJ1S6nqvQoBbMHZmWvSu4pOuVZBYZqPfF/gGUgD4v/pLCWeF4+mHd0B8lKx9hB4730zYFAX0dN59N5cgOlpg3M1eBW0J+jPHUYCXF65jDDDwY9y1WGjIJ1cMOF/7ZCyOu2RuSWaSOzZGSiWsTkEU9GN7N24R6EdOFmDAsF2YUnqiIMvCmvF/+BjC1gvFAPzBewGJbZhLhFyBLBQbi2+7B7+X28WFX0Jf/8Lo3DuNOFYu0SrGbr/6voTCreBzHfBF+uzUHgp4PAZzSj5YPDNBYzWXAsAK/3UGr2BG0gH3RRRU6lPbycpGUGzAf7Hy6IvwFLREq5/0UXmQtB7iDK4ebd53yavXnWOeDrqwLDMk0NDV0yWajJOX8VATvwge5Tlzna8vixKKWU5Ni3nE+yrFpbciRZ2zN5i+zc/jEtYCz92627F9cynIWphvdPdSIOip9FCwDFIx6FxzXZROI8bIB4lSjcVFAmAxp370N+qoa4pvc5hdBl6E3nDgbdBu3lsL7b0PqfEcrciFABgx3cs0XDUdaDNoUDcMNjaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(366004)(396003)(16526019)(36756003)(83380400001)(26005)(4326008)(186003)(31686004)(8936002)(478600001)(54906003)(86362001)(2906002)(66946007)(38100700002)(16576012)(956004)(6486002)(8676002)(5660300002)(6916009)(66556008)(66476007)(31696002)(316002)(2616005)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlMN2ZGd2VPa0NHdUxqMkY1RzlpcnBmYnl1NFBNQlo4b3RjUDJ4T2Q5Z2dP?=
 =?utf-8?B?U3BqRG1tVEhscmRPd283YkFYYXk4UW9aOWFBYVliSStJdmtqMDdMWGhPYjVJ?=
 =?utf-8?B?Q3haWmNnYis3R2x1dzVHYXlvQnUxNHVkdzFDeDFweHc4Q3dTT2p0S01PVm9J?=
 =?utf-8?B?WEtQV21VeFZwKzVzaHptQUN2M2UrY1VLRW82TDJ4STRCVGVROFdXTWVTK0d0?=
 =?utf-8?B?MnNBeUZacUx0WGQ2ZFNuc3RRd1pvNUZEb1JWNHd1M0grWDByZENXa0cwL1Bs?=
 =?utf-8?B?UzV2TEw1bW8rM1V5dXV3Tk9TdEJ6RnFUTDB1Rk0vcm9uQ2J1ZVJEak1XVkJU?=
 =?utf-8?B?bGpKQmt0WkorQnpPZ1JuYnRieXNCbVQzcUt2N3dSd09jVjdGaG5GbytwVkdW?=
 =?utf-8?B?eEpMMnVTcEt1OTkwNlhNcGp4RTRSQzI2MjJkR0VWYThNWml2WVo2RWN0UytH?=
 =?utf-8?B?QlN2SWpUbjB5bEFpT3VvaDJGV0g2aWRUYVJMOXpGd3FjbWNYd3U2MVVqNkN1?=
 =?utf-8?B?bnZWVHVJajJ1QUZ2WnZ1Ymt1dHFLTUs0dXJZN2N0Z3k1SFpZc0FiUmNsZWF6?=
 =?utf-8?B?dFE5dDRyMFlFUldGL3dVZnZtanU3MEFCNXZVYWFBSDJaVWlGOEF4N0FoQ0d2?=
 =?utf-8?B?eWtGMTFJQXFzT0hHaW1tS1pHRzdXSVl1SCtXMFNxeGVpZnpiWkRRQkQ4cDZa?=
 =?utf-8?B?ODJNNVp2M1p6Q2pkMUpBdGhZUjJ5a2wzTjFUUG5JWnR6WjdUL3pPOG9UcEt6?=
 =?utf-8?B?STFTWUJKclFmS1BuK0thMnhIT0FzSkpFUTVWcGRaUmJuZzN6V1JwY0M3andi?=
 =?utf-8?B?cURuTlFSVGZmdlZjQm9GQ2pkelZGVFllemVHaG4rZnJWSWRXRzg3YW5BY250?=
 =?utf-8?B?alc0MEVQVzJGakJlZ3AxMTIyR0g5N1hNaEJwdUZTU0d3Q21zamxSd096bS93?=
 =?utf-8?B?S3c2T2ZGZU5NMlJGNGFza0NLQ0QySWt3WnFjdXRhUHpoOHJFRTR4KzRpVEF6?=
 =?utf-8?B?THBFaEk2QldKQ2ErVEFKZ2VqaStqU29Xam94TlIwR011ZFRyQW1RMW16RCtk?=
 =?utf-8?B?UTJwcWhvWk5uaUJiK096YW1uditNTzBCT2VpQnczNStNYit6TFA3QUxLVmJv?=
 =?utf-8?B?RHlydnN2bVdBdklyZW9zd3NVMjFKNVlnODU5N0QrRCtESHNoZ0hkM0FnSzBD?=
 =?utf-8?B?SXdVYkx5Q090cTdvNXdOMVdDaEF3WW9ZdEIrTWc5TnV5ODhiaVF0eFl6eVQy?=
 =?utf-8?B?bXYzVUVHZW9XeXJibWYvNTg0TTMwS3crVXppWGtMOGpzOFhIckJVYlRzQndJ?=
 =?utf-8?B?OGRwOHJLRTdhWGYrb2pEQTZPR1NRbUlMM1FIVXNjTFJ4bnpReGlHcGk1bEp3?=
 =?utf-8?B?SlY5NlB4UTRUQ0hDdmw0YTRsY1Z6VW1PMmlCL2ZJUHVjemRQbmpBYmswUXYw?=
 =?utf-8?B?bW1oRFBJS0g5ZmV1NGtTZlRwdWdLUCs0NUgxaUxwVHNNdHJrNlVpNGNpSTV2?=
 =?utf-8?B?dENiQWdBd3JVRzZ6Zkw5RjEzSGE1dlRHY2NtM3FnQUZVMEpiZkE2VDBNSk1I?=
 =?utf-8?B?YlMvVnJ4bVV0Zk4xM0gxT2tmSlh1YXF4UEF0MWdZZ2FGOU9DMFRJeGxDTUh5?=
 =?utf-8?B?bEdLa0xaQ0VYVVhtN1UvRUZWVVdISWNnU1djc0tmVnpPMGgvcDVDOEJpMFls?=
 =?utf-8?B?eWhGaE0vTFFkZ0oxZVZlWUJpNVJpVXY0R3Q0bjRWQUlPWXdOTEVnejJYUGRj?=
 =?utf-8?Q?kXEyCUHubfcW1tuDAW3bEEy8aHhq7Gu6qwIoEHx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f312f3-c034-41f3-7614-08d937dc224b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:21:25.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMFUCFZ2+7dTIgbJPDM//0gMPrxElBUVvuQC5PBZY2uV6ovHDHJDpspHD3t4nj3WcMpMINm8A4m8r83/7CgTDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

While the precise values are unlikely of interest once they exceed 4
billion (allowing us to leave alone the domctl struct), we still
shouldn't wrap or truncate the actual values. It is in particular
problematic if the truncated values were zero (causing libxenguest to
skip an iteration altogether) or a very small value (leading to
premature exiting of the pre-copy phase).

Change the internal fields to unsigned long, and suitably saturate for
copying to guest context.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -446,14 +446,16 @@ static int paging_log_dirty_op(struct do
 
     clean = (sc->op == XEN_DOMCTL_SHADOW_OP_CLEAN);
 
-    PAGING_DEBUG(LOGDIRTY, "log-dirty %s: dom %u faults=%u dirty=%u\n",
+    PAGING_DEBUG(LOGDIRTY, "log-dirty %s: dom %u faults=%lu dirty=%lu\n",
                  (clean) ? "clean" : "peek",
                  d->domain_id,
                  d->arch.paging.log_dirty.fault_count,
                  d->arch.paging.log_dirty.dirty_count);
 
-    sc->stats.fault_count = d->arch.paging.log_dirty.fault_count;
-    sc->stats.dirty_count = d->arch.paging.log_dirty.dirty_count;
+    sc->stats.fault_count = min(d->arch.paging.log_dirty.fault_count,
+                                UINT32_MAX + 0UL);
+    sc->stats.dirty_count = min(d->arch.paging.log_dirty.dirty_count,
+                                UINT32_MAX + 0UL);
 
     if ( guest_handle_is_null(sc->dirty_bitmap) )
         /* caller may have wanted just to clean the state or access stats. */
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -190,8 +190,8 @@ struct log_dirty_domain {
     unsigned int   failed_allocs;
 
     /* log-dirty mode stats */
-    unsigned int   fault_count;
-    unsigned int   dirty_count;
+    unsigned long  fault_count;
+    unsigned long  dirty_count;
 
     /* functions which are paging mode specific */
     const struct log_dirty_ops {


