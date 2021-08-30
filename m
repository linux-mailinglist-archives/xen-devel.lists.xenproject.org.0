Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C93FB6AE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175051.319003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgx5-0000ra-UH; Mon, 30 Aug 2021 13:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175051.319003; Mon, 30 Aug 2021 13:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgx5-0000pb-RB; Mon, 30 Aug 2021 13:03:51 +0000
Received: by outflank-mailman (input) for mailman id 175051;
 Mon, 30 Aug 2021 13:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKgx4-0000pI-HO
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:03:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed8b58e9-00f4-4875-a8de-124e7f6268f9;
 Mon, 30 Aug 2021 13:03:49 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-dQKk8fwzOvu7CkuZECsUVA-1; Mon, 30 Aug 2021 15:03:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 13:03:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:03:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:03:45 +0000
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
X-Inumbo-ID: ed8b58e9-00f4-4875-a8de-124e7f6268f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxe0bKR24hXFw8oL69FTgKPiPaq5fBdyi4Hvj6JwhJU=;
	b=Qc6fWHbrCT1mwOr8ePWFD4rmCpdvf/fju6TMi8F2TnyIJWI/gvokRpICoMyQZQE97bwhmk
	NNuhTa13WVrljjQ57fDFIZSyHy1cD5hXw6D/Z6rCsr6a4C7Pcpxt1+Rb3qVWplcdTNFbkz
	JTpfrfge4q37cr7hTGdsZok6Dt9cD6g=
X-MC-Unique: dQKk8fwzOvu7CkuZECsUVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWeB4F9zIiQoyGkaG1OeCefCZ7HyAfqW9oapo+ORPNLrBeJYtN8ShrOmxKrxYsO3XuR6T0OErfnZi6ZalZHJppN0v2RPjiaXMgBDlLQ2pMEi9LHtc3r4/yBcvexCF9TtXGym3J1M/t/XBztG6aX1zBm/FpISf9zfm7wDjLa/9Nn1Cx7lPq0RD1T9Yqfgmu+F+snL8xyRKnEfn9QKDENpgFeBHl62+NoNsZy435tVBqfSEdROgzZmY6CxhNVjwiJmYYEvNlqJFWJwvOljB11FwWMB/69UGWUD01UaOZtrGpSF96yVcC4bRNaDki48aqRBEHm9tmFg4kWQsjlKD0y5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxe0bKR24hXFw8oL69FTgKPiPaq5fBdyi4Hvj6JwhJU=;
 b=HkWCQLo2nvnk6rZtGQbFfYy9xt5umaUq0UG6NEt3wT8kmYXTCTgVGjFqEvJ3tr+AnKQqA2QL1nm1u0lQj9wQUMKW+x816HjrOPnXiQSu8rxaiCgbbp6ZY6FbfPeOikPtoZyvm/IYDVLkR9QZ5hLIyQ19tCGkCQmhtEtg756gNS0rDIECUs3sW2fh9LnOEgFBwsQddkVhd6Pxc5OO3ojg+SYB+WbOAvn936/8434SKq8fUcGXpigmRYNacFx0F+USI/NP4YQ54XRQwD8gR87FyB96v0RUrEB36M7j2nSGJ4T9Eiy7FJQssVobt362gJIXtjHoXMe0NrrGzVLvy+x0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/4] x86/PV: properly set shadow allocation for Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Message-ID: <35864b86-ae6c-f8ee-99df-cf78751d275d@suse.com>
Date: Mon, 30 Aug 2021 15:03:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6ee56ab-a4ed-4980-43da-08d96bb69a14
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901EA525B187A0A34EC5160B3CB9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ZfAZT6taxcLXt3lQyO5VvQxkgP6Ocm6a9oLizp59Xnfjt7pTe1+E4KX3MVRkyt9YDQ9q1CVS72wgCSOv4qsJ+ezuCEWaTkjtg7VqTKKcvdlsd9C6TPi2QmwnOMGScqEHu0TvHyJya6yHjF235jw+J04NDfzUlujN9FYG4h9P1M9JSsfzvc2K006l/xdR8/8PaeNMjJW93MAMvvi8rXLcannpeV6rYUBeUOFnZewkUTlA+Ls3rmJNlRAf2WUi9PzvMsZMhBeFG6+kzjAytQ45hmvhor2d7ic5XDYEErZwkMjBU04s3db3ydVxm3za8NU/LX8SmfJ70qCADB2+w8aaQ91XI4Z7FVxlDfx11rKY5620H4/fT/LQgSdSD6I+MeVqoPwt+x8MQQEsUe/npfRZVSTYF+kLK9Trb013eXxgWvo93JqGiQj76rvGxez8BU2EEJTlKl1kjx8z0/euvGSo28QXUKi1vSWYz8nuJJvNmKB8r6lSUsvDs5JQ5x20WfbIqR5Jq0ns3hbmSKJCnKp2qbFt34XpXG3eoNupCUilFd/ycYTtUNMa/rTSSFkehKqd6YnfCld+Sa3NlQV2QJKGmAeO6qZPEZXI3aDl2oCCEt+uMTM8Skj7cSTpGd016B8H5lszGJUzIzTUgP8R4ysmCHoKQoSm309iQsA90Jg9jXPcboUgezHlRLRaQ9EKzxcOYFVlGLoLnY0wgsu7NdTQRY9BKswXqlW0rxHoFrF0W0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(316002)(66476007)(6486002)(66556008)(16576012)(6916009)(5660300002)(8936002)(83380400001)(54906003)(8676002)(36756003)(66946007)(38100700002)(186003)(2906002)(4326008)(26005)(86362001)(2616005)(956004)(478600001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWp5QnVubkE3TWU5Tk9jNFJPZVRDMHpXN3FwYU5md3kwNUJCVEkveFc2Wm5r?=
 =?utf-8?B?ZGhhc2RLVHYyU1BlSG9uVVI2RU9hMFBaZ2ZDZFI1cVlPOVEvbVA3QitwVmdh?=
 =?utf-8?B?ZmpSSi9KNzVyR0tSdzRyZHU0M1FvQVpKUDRJMDRIWE1QTjFYTXlDYUROankx?=
 =?utf-8?B?cEI0em5BbXB6TVJKUEEwS3lBelc3Y1BMWkZxQ3JRdUNHS2UxalFYaTFOOHlk?=
 =?utf-8?B?Y21hWXFKRzd1d2E2RmxFZ2pwdkU1TkJRTkhYdnloaGVGNDAveW1JQndpNjFp?=
 =?utf-8?B?OHRLSncwR1M2Q1R0aGRwV09kUXJEZ2hKZlN2Q2lRamhiOUE0c2d0NjNmS2hR?=
 =?utf-8?B?WFdOWVE2dVV6NUtvVDVQbXF0UUV5cXlPUTZMQWpWSXNxc1RxK1hlUUpnSldH?=
 =?utf-8?B?WTR0d1JyT0MrOFQ1NmxyZzNNWmNxa1lPYnNhaUFHRTdjQWNJSGlkcmd5U2hl?=
 =?utf-8?B?L3BwTHpLeGxrcTR6Mkg1Umxvdnp0OTYvNjVBNGowRHkrbG1XZXFNNUtyekZY?=
 =?utf-8?B?NXV4SnJ2Q3Zsb0NkUnRhMW1IbjB6L1NjVjBuN2NFY3JHVDErTW9XL3gwRjNN?=
 =?utf-8?B?OUFmS25QaVdod25NMTUwRTJseWpsbWxSVjlSelRUODByems0enZOZlhVeUtB?=
 =?utf-8?B?LzRWV3A4ZTUvNHIzazVzVzdPVEN4NkV4TlNzWUk5MDRHbUtZaGhDc1hpTzN5?=
 =?utf-8?B?SGVvbUZQU1hoZnl5R0Z5dHlUWHBFbSt0NEp2YkQvSFJsYWdqVE9Ea0lldWJ5?=
 =?utf-8?B?cWhWUy9HTVY5QkZXZmN6NGN1YnM3ak5mZk1DWWlYMzJJNG5KcEdqS2dxSUFX?=
 =?utf-8?B?Y1hxNDFNb2x5UnJuOUh1eFNRYnYxdExVQ2ZEZ0JwNkw5U21pK09ldXc3QjNQ?=
 =?utf-8?B?ZG9nV2JvdzdvT0Fyb2Z4MTVaQXVSVlpPamI4WjhmQ3FscDl2YW1zZmZBMk01?=
 =?utf-8?B?T2JtMytwdlhheFVRS1YvS3NLOFN4a080SEo2YjhkMWNDR0dtTFRXODBzMjRY?=
 =?utf-8?B?ZHVxWThYcFBKblUzcXBBdEk4dUlpS3oxQk9aeVlaOE5CZnZSRVozeHlLbXEy?=
 =?utf-8?B?MkhSNXMyNzNrRkVJRFNVZFpwUEFqbXB4cWlyaGNzRjVGNHVicGhmbG1LcEdm?=
 =?utf-8?B?akl1WXlyRU4yNi9EMm90TUJrdG84YVZ4SVZYYnhqUjNUeTBteDNpNzRwQ3c2?=
 =?utf-8?B?bWR1ekd6TDJqYXFNN2NtTXYwK1Izck9EUGRHak80Yy93OUpVU2dmOWNGb3oz?=
 =?utf-8?B?RVhJNTVaVk5qVlQxTVRYbExEOGd5c2ZHYlgxUXF1QTYzM0U1RjUvL3FhOEYx?=
 =?utf-8?B?Mmw5R2lNemY2QzJrYk9xY0FQT3U2VWdEWDhQblhaYVJQbGo2RHhrQ0ZFU1dG?=
 =?utf-8?B?WW4xUGYwbWw1d2xDaHFuSlhqcTR2UkpJSG5aNFdCYmVwSkkvQUswV25Dbk84?=
 =?utf-8?B?bUtDeFpadytabVdFVVk0bXRnU2xqUzlZSGpiM2pVbFJVMHFDQTVpOFYzOUZZ?=
 =?utf-8?B?V1hiNjJlaHBMbHVlWXRUQUFGWGI4MkdpODh0Y2lLRS9oblhRMlVPRzlZZ0Yr?=
 =?utf-8?B?WEtXSW0vVjZmOEFXeDRiNC9PVXdGd1NLN2ZkTXVtVGVEN0IyL2N5NkNBZU8r?=
 =?utf-8?B?cXNibTV5WmpJSnVIV3JvOTEvY2JWcW1WQVdmR3Rqa0hCZHlta3cwUVcvVEwz?=
 =?utf-8?B?VmgvazVieUV6THd3c29FQmxQTmd6QjNVeTQvT2pMdnNpWkZsK2NXLzBHVisr?=
 =?utf-8?Q?zWKm6eStQhGSh4jWUQYjkVj6HEWSzySY+7c+RpM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ee56ab-a4ed-4980-43da-08d96bb69a14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:03:46.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxIyXZIOxUFeRCuiF1QgEFSb5xgYyuc+Y5534HHDjQuSlNhA2zaxfpzNpQvB74Or3kQVWYtX22b3jfVkFJlX9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
minimally acceptable shadow memory pool, rather than what normally
would be used (also, for example, for PVH). Populate the pool before
triggering the tasklet, on a best effort basis (again like done for
PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1298,7 +1298,7 @@ int shadow_set_allocation(struct domain
 {
     struct page_info *sp;
 
-    ASSERT(paging_locked_by_me(d));
+    ASSERT(paging_locked_by_me(d) || system_state < SYS_STATE_active);
 
     if ( pages > 0 )
     {
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -21,6 +21,7 @@
 #include <asm/page.h>
 #include <asm/pv/mm.h>
 #include <asm/setup.h>
+#include <asm/shadow.h>
 
 /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
 #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
@@ -933,7 +934,17 @@ int __init dom0_construct_pv(struct doma
 #ifdef CONFIG_SHADOW_PAGING
     if ( opt_dom0_shadow )
     {
+        bool preempted;
+
         printk("Switching dom0 to using shadow paging\n");
+
+        do {
+            preempted = false;
+            shadow_set_allocation(d, dom0_paging_pages(d, nr_pages),
+                                  &preempted);
+            process_pending_softirqs();
+        } while ( preempted );
+
         tasklet_schedule(&d->arch.paging.shadow.pv_l1tf_tasklet);
     }
 #endif


