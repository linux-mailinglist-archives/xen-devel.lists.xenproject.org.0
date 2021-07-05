Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7263BBEB8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150334.277982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QJ2-00058T-Rk; Mon, 05 Jul 2021 15:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150334.277982; Mon, 05 Jul 2021 15:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QJ2-00056Z-Oc; Mon, 05 Jul 2021 15:14:44 +0000
Received: by outflank-mailman (input) for mailman id 150334;
 Mon, 05 Jul 2021 15:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QJ1-000500-Ev
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:14:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3a5f435-21c0-4ba4-b9ca-22911262f525;
 Mon, 05 Jul 2021 15:14:41 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-9Lb0hRRdNMyue3C165azGQ-1;
 Mon, 05 Jul 2021 17:14:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 15:14:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:14:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 15:14:37 +0000
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
X-Inumbo-ID: f3a5f435-21c0-4ba4-b9ca-22911262f525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOcBB1u7iiUx62PemDoqgBpbGc1Bb2Zr3M+3XNGrMl8=;
	b=ko3/0YDqAoRvn72VpeqnNpZdR5QSduRSkg2NoHhxy+D1HTeF7dASjtScwuMtpCviB338Dq
	dmKUkPx3i7KVzhabAam2pZEPOtUt2HM+hB76yIwPy3IQXpReQQkTdjPJVFblme4wFHE0jt
	0aZlblEOokiOa4vWFIRaSgScNwlYs8I=
X-MC-Unique: 9Lb0hRRdNMyue3C165azGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJeVtxo9ExmWSTBby4AsX50DdP0nFK7lP0mWnwtowEwr9gkPgzBjr/3PU1MpCdMIib2jV/RmUUzm2gjopj96l357AJ0DUPXFGaRYyS8mFHOmhoVAt/CexyvDNM+w4Z9OWZm8zgHIdW02DCO7JeQvC41vLR8IzQOWVpJ/zIX90EBmOzLCo4FadK4dFlI9cVIal0hKod3gWXMBqxwNgdmGlOf+e8K6KO3ggfofNPdtrbXWVNIoIKCKmTeY8xsYl3wsTvgPLZ2a82xluXnnGJJFAAQWMsZGxsAt9TzIR1q3riocJ6ldbH/VVfNHrtW4O6+l3VJqMbH8rZIFrBe2iwTh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOcBB1u7iiUx62PemDoqgBpbGc1Bb2Zr3M+3XNGrMl8=;
 b=eiNnGiNm5NXjHKjhBsIkWcn+MNtqjAvqC4MpPgyz0R1+AQi36hcwdBpdoOz6KxjeganchWBiEdNit9oH9HNkhxDA2c636FyaWRZSZtqbL3p+xuUpBAMvx7iVX0y1rNlK1uHQ/8mXC8hN/qxlrCk3WqWsXxkAklPf9Fuv3xjkA6D4Rz+aXJ3JxP6VibwJhymi7dP3wfoKefrWK+yfAD5Q4AxCZNX6IQG6wOyRd00DFXlykjkrJpByNS74Gjt+NB064fMWsEKrhv0t5ylh7AUpfbZfpZNAAsUs0FQkhsBNZlgOn5ko3QFqjVQF5JHkqfi427IZsRU5/kOf1mNHekxxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 06/13] libxenguest: complete loops in
 xc_map_domain_meminfo()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <8c7f94f4-98c0-f698-8cc0-0f7f93569ca3@suse.com>
Date: Mon, 5 Jul 2021 17:14:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb444dd-2b52-4394-84e7-08d93fc79ac2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608603F69FC8E0441E52534B31C9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cWWjtm0cmqKCQKCQOBx4t1BI3AVJX5fzDg9LmTuZDH4RjYoHwOVL7ZpaUPzQpIU/yBjqx3Re6joFkzFw4J6Zj3AaQKiIadW1gKYPDb1qZ29eY2O+puicKTdYpyr4B1ZQ6W0p4+RaNWG+SeVwK2Ad9Vc6TtGKOe/MaQ0wvhdm9MyRZJa6ydnJI9InQE3fpnFADj+IZyP/2x1842kYAEzUgkGES57sLvarf40yepJKw6m/qgfLSH2+FaqpByFNHcLbkf7WbKWthGVdWuFJCcoC6pCpVBfTNkO1Vw2aQeAiPYrkvjkGiWNy5v/2ridjWXHWXbs9rVMXQWc2EiIl3YacYWCiatyQDJtXDdy16ssi+ZRAxOlMCWn/cfbDtRGIzV2D2DZ6hn3UogmWky7cM4lye4sHR2o45x2x7qviyd4MBQqQ/OIhCPrdUHQWTqeUJq9qpB0rAn3Ga1H0vkWME2JupF7vsWxITiZRfjl14IkvMHgFT+nyjQ+SS45LVmLz3MCCGPh3VvqQdboHrPVyX7m1syMQUyWPLWeQVqrUw0WbDcYNbBQh/q1IohTdaXMDJUUU11DEwEUNISyrwvc9MBXmxZs85uOaGdKxTOy0RwAaPKKxx6527C4kulk3FRT9HHRaZl3MqJ3GIf+pEyXcEmpqT/9eJsT4vR83NwT/AF8q6xDESse6Ma54mDTE80NKfhjrod9U0p3N5fSVPNDWebqytGc7/D2MSa+hvhHAoS4BHgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(376002)(136003)(396003)(4326008)(54906003)(36756003)(8936002)(316002)(8676002)(6916009)(26005)(2906002)(186003)(66476007)(66556008)(16576012)(16526019)(66946007)(38100700002)(31686004)(478600001)(956004)(2616005)(31696002)(86362001)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUc4NXVOTkYyQ0diNFp5RXZBYk0yQWlTblNYRE1WVkpwVHF1a3N1cndjSFJr?=
 =?utf-8?B?QUduNlVlSWw4dDFJZXJyL0RiTGZCdUhta25rdDJMeWRPZFk1NlQxbVhnYXYw?=
 =?utf-8?B?Q05qWER0NTNqeUFINm9BWTcxNk1IWFd0a0VVSWRtS3hYeVFrbnJkOGg5WFFR?=
 =?utf-8?B?MVpoODV1dnhWTFFHMVhvSWczbGFXenBhRk01MFlMSUdRa21uZGxqbzdWNHF6?=
 =?utf-8?B?ODFaQ1EyMHQyYVdFbmp3UWdZcnczRld0RmVpNGdlNlRCSENKdnViY2srTWdL?=
 =?utf-8?B?NTNsVHBBN0lXb3hPNG9Oa25JNFJER2ZTejNzWTFEcUZrUDJiNEVqWlJFZS9O?=
 =?utf-8?B?a2hlTmhFUDdQUnpDeDY5bFJxa055SGR0TFJkMU84T3lsNW5hMFVEL255WWZk?=
 =?utf-8?B?QW9HYjRPSVFqaDQxRHlFOVVRVlFvS25FdVRnK0F3d3hzT0pDZjBCRDg5K3FD?=
 =?utf-8?B?ZVlvMFoxY3hJZ0tTd0ZjRGpqckVNMUtFT3kya3ZSL0JLZkRWRVVmUVUyaFE1?=
 =?utf-8?B?a3o1UzgyT0daWUx5eXZxQUdtbmVkaG43TkN1TlBmRnB4Z1ZSYkpCd2MzMGpN?=
 =?utf-8?B?b1I0dWYyd1BLb1JmNXQ0RWxqcHpOcksrWU9UMlBFVTBoUm9FMzdkOTQwZUpj?=
 =?utf-8?B?K2FsMXBEamdGWjZSVmw1OWJTY3BLOHBybHpOd0tUQ094aThTU2QxbUJ4K1g3?=
 =?utf-8?B?WGFuRWhKTXNYYUVJZWtLQjR5bVF0bDVGMjZNSEJEaXErc2VOZGhLYlA1Y1Ur?=
 =?utf-8?B?OXcrMmFMTnYwSmlXZjlwdXRUczkrUVFOeWtnam1hOTk0WnZIbWNEaGl1RGFE?=
 =?utf-8?B?dDNybmxaV0gzUEJkRUpFNnJXY0hUTzFKZytuWGkrVVpCaGNKQmZaOW51MFZM?=
 =?utf-8?B?bDdyZkZnZU1ScGhDeFljRmJtRnJybEszdkMzUmJ6MUp4N3JFWVdNMGJYOUhH?=
 =?utf-8?B?aGIxNktHRkxzRjFZc25WcFlmeVEyZkhQRFFxR2pReDgyL1pvMkQyY1A1VS9Z?=
 =?utf-8?B?ejQ0bnVwRkRGN3RLL0dUa3ZIMGVnK1d2RThtSVNVVjZZMG05YzY1Z3RkdWY2?=
 =?utf-8?B?L3g0TW04ckJBazZQMmd5Nk9BMVpoakw5MUgyb2x1aktTUG5EL0hlVTZGRGUv?=
 =?utf-8?B?bjluMDdtbi81SUx3THhnOVdsd0JRT285UFg1UUZCZzFuVFZpZ0RwUjNZRnlN?=
 =?utf-8?B?MnRINzNYcUE0YXNZT2VEODQwUktrN0UvOVljS0krU3JWdmpyTEpmMVpMN285?=
 =?utf-8?B?NUpDOUkyM1o5OXNVdVMwZm8yeDl1MFU0ei9sbTMvbDhYdUNzbElLblVnVUR3?=
 =?utf-8?B?K0FWbnJ6SDJhaS8xR1JUd1pqWldXZmVyZHg3UEJ3Q29MbXJvdGEydjZidkUw?=
 =?utf-8?B?RHZZbDQvSStlOWs3eFdRQTg1VDhFb243TXdhMVpzTERmTFBkNmkxb21JdE8z?=
 =?utf-8?B?OTZLVWxiVWxieGF4dmprZ001bTUrYUZQL0hpaUMwV0dIUGtGazRmK2hVM1RY?=
 =?utf-8?B?Y3Y0RXVhY1NvYnlxV25NNTZMdkw0WkxSRHh6UGtjYjdrODRmMkZJVHVZUUcy?=
 =?utf-8?B?K3hKUDhaQVZ6aHJEQVMvaS9EN1NROC92NTNqZDRZSTBxOHlnajZNdXhJVkFV?=
 =?utf-8?B?M29lRXUwcWhNbktUT25zMXAzMHQ3WmYvc0VrWXJXNGRSVWJhT2NsM2N3MTc5?=
 =?utf-8?B?VC9sTDk0REtSNU5rUURNdXI2QlQ3YU5JdHBiRGF4Y3o4UEpmOEpFSlZSdG9r?=
 =?utf-8?Q?JdIdFoL+cP9G0haMo0EssXl+m2ko28xGiDgjNhN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb444dd-2b52-4394-84e7-08d93fc79ac2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:14:37.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruZDRgJQLQPhF11lssuJ2lVXjR8LG1a1dv3b6RJN0kWcnFs6h9/de17kEnYjkGYxCqRph8HRfzRwhrW8kHr0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

minfo->p2m_size may have more than 31 significant bits. Change the
induction variable to unsigned long, and (largely for signed-ness
consistency) a helper variable to unsigned int. And while there also
avoid open-coding min().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Use min().

--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -40,7 +40,7 @@ int xc_map_domain_meminfo(xc_interface *
     xc_dominfo_t info;
     shared_info_any_t *live_shinfo;
     xen_capabilities_info_t xen_caps = "";
-    int i;
+    unsigned long i;
 
     /* Only be initialized once */
     if ( minfo->pfn_type || minfo->p2m_table )
@@ -116,12 +116,11 @@ int xc_map_domain_meminfo(xc_interface *
     /* Retrieve PFN types in batches */
     for ( i = 0; i < minfo->p2m_size ; i+=1024 )
     {
-        int count = ((minfo->p2m_size - i ) > 1024 ) ?
-                        1024: (minfo->p2m_size - i);
+        unsigned int count = min(minfo->p2m_size - i, 1024UL);
 
         if ( xc_get_pfn_type_batch(xch, domid, count, minfo->pfn_type + i) )
         {
-            PERROR("Could not get %d-eth batch of PFN types", (i+1)/1024);
+            PERROR("Could not get batch %lu of PFN types", (i + 1) / 1024);
             goto failed;
         }
     }


