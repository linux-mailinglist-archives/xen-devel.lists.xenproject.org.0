Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988B4C1651
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277425.473918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtMa-0002Zu-Ur; Wed, 23 Feb 2022 15:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277425.473918; Wed, 23 Feb 2022 15:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtMa-0002Xy-RT; Wed, 23 Feb 2022 15:15:32 +0000
Received: by outflank-mailman (input) for mailman id 277425;
 Wed, 23 Feb 2022 15:15:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMtMZ-0001xo-KR
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:15:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70639974-94bb-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 16:15:30 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-3dQJ3TB0NpCTqpojnSG21g-1; Wed, 23 Feb 2022 16:15:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4624.eurprd04.prod.outlook.com (2603:10a6:803:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Wed, 23 Feb
 2022 15:15:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:15:28 +0000
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
X-Inumbo-ID: 70639974-94bb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645629330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=juNOMnTTaHYlj1GzEVqLULFZt9qHfroO97X6sGnQeak=;
	b=JCjfno2Q+m+5NNs+lhBer8yZhmOZEY3ExCpzdNszbsS/bymiO+McQ6OqLDKzVp3OiV5XUP
	A3XT7ztvlU6zZgOUIP3ZFC+RXdfRFT6QBz9L2HK3t0yIA69Ru79YJD1IpbdFz4LfOtXMkh
	adHcSFyEEKh1JiE+XxSpscNHgesNPVU=
X-MC-Unique: 3dQJ3TB0NpCTqpojnSG21g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIVaUBF7YAcQAIFyN3rLPE2mXM3gkyPE+WI3IlTzB+l04gNhbd5gU01PsYa6h8E3vX3KejMfjJYXVpRGJV+53AnSY7kb30O519xNGaOrZ74lNcVfwzd0LM2/eYi+tS4YFkjECk97U8zdbqP5KrgxFBzSeQf1IXdpWMPBnrmp0Jh2D7Jp9YBSAE8Jm8JiO4O/2WZm0393XMsNwWnFyQI+1SktvXYWPAUHOsHBqF3c+W78EvoKTjkp6+yboCK5xkKICquGcxI4/eUOufHvjjuWPOmcGno9DDONdSI6CeeUQT3YVHKjXDGZVZfWOiCOX0n2Cibm06u1/PBtkAe3Dfbv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juNOMnTTaHYlj1GzEVqLULFZt9qHfroO97X6sGnQeak=;
 b=mxWQJaWfT87S89A/JU4FoATAQB2xWAqR2MWw0Hnf/n7XkdZq/pYMazFmxsvP6JVtb1Jyc2v2/Ye6O3mLqN9Mh2ADug4wnhb4Y5t9wdhOj074Xdj24mvd9bqZvMPDAk2cxn6RCF7twhFlvrzQHUSUpiahDaTAgU0tGQR/VMOUkE38Qd+ZABJf8dSd6d+avG5mdT7n1VHjWedp9CpnVYJNmBKSfi74BT5nVMEjOmUFVOP3KNrEfu6B/Az8SMk92IzpTfB6bBOPvTGiECPNaN9k9pjIw7qrg+xhhMIdefff7W+PlVkvblhM4RCcsxDRE4KMaDZAlP5T1JGoMhy5ag9Ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0273a69d-0c51-cbd6-e5e9-da861d14cb06@suse.com>
Date: Wed, 23 Feb 2022 16:15:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH RFC 2/2] x86/p2m: aid the compiler in folding p2m_is_...()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com>
In-Reply-To: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad62a710-c668-476e-dd3e-08d9f6df532f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4624:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4624E6889EA38BC6F527E679B33C9@VI1PR04MB4624.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kWY5kXiURfwJAi82lGTxa33Zn33gFFmGWCyOLAb3Ve5hBgElGSVsSfxs/4I6HDvTOtjU3IfSa0vGNeh3cMP46V+bfbxuQyv6Gz7ZhY1KlAmokD2uaJPCvUXGEwrGf4dA+GLjTfkadvKGsOBSrd+Z+I+Kb3eYgqGOE3VNF+7h8K/3X1EahX6jC7in+TIi7BOZN6o8IgRphsX3/9PrCZorICq/HsDaME9cxsQYeC5dlq4sj5ID/iaBKm81lgB8gF5IBEUwGTJFzsnMO/dfGxEZpto30cNppaohOc5AAZDNTTbFRpU+YE3WUprVxzd0SQDFfEyeH3u4vuOXpCvlfw5H5PZyc8v7iOUEIVdAs0HKx4kVziGD0Q4W5npW9yCJ9PwFd4Jj6xfRS4YfshHYZN3Fd24ILCJ0u+l7vjZvwO339OMT9+BxS/zx8b35q+dF6JS3jWbgE3a0Bopop7oPnhverTAfXMDUz+MlYiLXOzhKDrmGeRceNDucFOgS552IgtKwESRgEict4jWoKIGvu0M7rMhFpz0QhXNcw8VX38ITTohS0St3cE7wtpr7ahtr1PxG0MSjn5Cs3nK+63leENK27uBoQ2hj5CStM/o3OMCdcgOchRyaIUrC9EPn9W2t/NvX4KcNIoiMVQdHz0kjB1RvAMW+IkgDNUra0vvqgNMYWBMInbb2+mbwIoViZ7ZPJqc6DQEKO7f7XC6fe1WvI0LDSOXJCj8aVar3d1J/2//fogI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(38100700002)(26005)(86362001)(31696002)(83380400001)(54906003)(5660300002)(8676002)(316002)(6916009)(66556008)(66476007)(66946007)(2906002)(4326008)(508600001)(31686004)(6486002)(36756003)(6506007)(6512007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDRtYXIxeVlTYVd0bmxmcHhIQUNwU0p0NW1meE5WeWNtU29EVWZQb2p2VXBv?=
 =?utf-8?B?OXRoQ0ZoOWN2UXdDeGJaNXBqUndDeXB6ZGhCMENTVWdkYzFLTjZEbm1tOUov?=
 =?utf-8?B?TUl3T3Q2Q0ZQWU95R0JaTUxBL0pjQmhQT3V6K2lFZ2NnajJVczI4amd2T0xD?=
 =?utf-8?B?M1loVUtacEJWWW5DU3E3Z0gxRzBjRVgwRXFFQ0l4a1ZqZmY4SnB1VVRjNDFU?=
 =?utf-8?B?WThsdXJraEQ1ZVJBYmdmWXhCdUkwaVcxRGU2bDA1K2dKanlDdkFPTjhqWTlY?=
 =?utf-8?B?am1ZdS9kK2d3cmR5TnVuZXR6WjdzcWwycmprN2x0emdXN1dhVUpUa1J5ZEpW?=
 =?utf-8?B?MUUyV0RMN2NVV2k5d1hGZGxBNFNKQzdjaloyZXJqdVlzaTlTK280UkhPdjQz?=
 =?utf-8?B?MXZXMG9iMTJYTStBS2tHVHJIdVpTY2R2VU13QlE2Y1lKUlFjSyszZ2VWc2h0?=
 =?utf-8?B?QnowSWdibjc5SEQ1dml5OXp3aDJtUlZCZFAxWG1wbFN2R0JjUVdFUGZVbzVh?=
 =?utf-8?B?NCtmci93eGkrR2JlR1JCNjhjM0g1Q3lCZUY4bkJRQTVyRnNXbTF1VWU3SnpM?=
 =?utf-8?B?a052N3BEMGNPV2xHNEtQL3dRTDFOVjU3bVdBRFVXV09ZL2lMZUY1NElXbGlt?=
 =?utf-8?B?MlJXOElvSlZzVVd5d0trNS9tdXM0Sm4vQ1dsYlhuNng0RW5KUUsvWUphc20y?=
 =?utf-8?B?MnVZc1EzUklTNk9iMVhndDdSWWh0TTBHS0o0WWxhcmJzbi8vczM0VXk2eDBM?=
 =?utf-8?B?TlZvUWZONk5mbnFzM1dtM2NwSXljcUp2UEJFQ0czNTIwN2N4SVNFTkR3ZVV4?=
 =?utf-8?B?NEJHZm5rSGQxU25pMGNoZWx1a200NWRvelhrWE9JajB6cGt3VVlHcjZyTXMx?=
 =?utf-8?B?WDRGVHo3RWFibG1FbGxUa0c4Z2VSSWpKaWxFWFpsWGZpNEhYUGFWczdNaXlO?=
 =?utf-8?B?MEorUFRJaXZ3dEMydFpIUWFCK3FJbG5ucmFOMkZtYW8rNkZsYTVPcnFYMjNO?=
 =?utf-8?B?L20veEFQMTlTZnBISy9WWVliK0lDU1dPYlAzY3U5NVhXbFdzMkZkR2Z0Mm9D?=
 =?utf-8?B?cnZWREJQMzdpaUVUak9IR3VXQk9FMGpCNm5aU0FqcnRrc2drY3VzZHdkUUR1?=
 =?utf-8?B?SDFBOE84UVlnaVducHdNdmVnV1VRdjIzQlR3ZGFpT0wxOHJGcnM2dWpYL2Zy?=
 =?utf-8?B?a1dCTXA0SEs4UWRXcEZZZk1LaGN3ZzlYQ2dXMGdDQWJnZ2ROUTduWml2Tmdz?=
 =?utf-8?B?UnJZQkN3c011aXkvNWVWcTh6ekZIQ05UeTdNNkxvQm5uSXNSZHhpNHUyc21q?=
 =?utf-8?B?SnBOeEpadDJFMWZDNUl0SlhIbVNyWWp1OFFaWlVwc0JBQ1F0cU1qUzU2MlNO?=
 =?utf-8?B?SEd4SlNZcTJ0QmJyWWx3c0RTZGhFcXZ0VzFVV21ra2NENFU2bHJLWXUwWExI?=
 =?utf-8?B?enBKZVNETzlKTVlCYkd5N0t3OXFUVHhFQ0tNMmtJcDVzVmZ0MmJ6ZmZ2WFd1?=
 =?utf-8?B?S1k4cjJiZFZLOUNwNUYwemVqZXkzaFJ4TDdBZlhUK2dxSGhScGxQYllZS0JJ?=
 =?utf-8?B?V04xckQ2QUwxaW4xRFVvRzFQUTZXclVoSmFXNk4xQ1dsYW0rZmVzMi9xQ0No?=
 =?utf-8?B?Mkt6aTVLeit1bUl3ek01NXJ3WnlXdndsZGtVYzJkRWtqMytkbmZmdEtnRW41?=
 =?utf-8?B?d0d3S2h5NzlYL1l3NXFlZFpnemM2UnJFdTRFSWxQVWxudm9IWnhpTTZ1eHl4?=
 =?utf-8?B?Qml3TzZBeDhOamtzVzgyTlBSZTNpdnF0V2ZTSHZLTmxDYW50TDIreDh2Nzgv?=
 =?utf-8?B?MWZjeDIrbENOQzI3dW9oK21DUHc5QnYyUjBQRW53alZ5amJ2YUdkTFBiaksx?=
 =?utf-8?B?Zzl6ckduZCtjQnUvUGdEVjVMWWx4T3NsYXplTURlK2dweUpVVUJRbGtWNnZN?=
 =?utf-8?B?N1FEbCtudDBxbGZPVFlINjJzQ1J3NmpxWUI0a3M0Tmo1cnByMHM4L2o3V0Rn?=
 =?utf-8?B?R2R3UXR2ek9ESG93VkpoYUVSbnZUR2h0SzN5bGQ4dFJjT0ltWWZMYllXelZJ?=
 =?utf-8?B?M3d4cUpBQ0t6dFFKem5rUUlqV3NTUFZJbU12c3JnZUFZNVdPY2k2TFJ6TCtX?=
 =?utf-8?B?N3JjVGtrTzdNVHJpanBEcU1CSVMzdWp2M3d6WEt1b0V6VEV3SDlrenQ3Z3Rt?=
 =?utf-8?Q?yArU86idvDzFyJAmjhvFw54=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad62a710-c668-476e-dd3e-08d9f6df532f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:15:28.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIiUXxWVjq+7PVi8HpT6nMDjEC+LT5wTt74BTQOEFnkPQUVSA1g5lQThNJEPHoK25i31uOnEfIZJCAnjyYw8Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4624

By using | instead of || or (in the negated form) && chances increase
for the compiler to recognize that both predicates can actually be
folded into an expression requiring just a single branch (via OR-ing
together the respective P2M_*_TYPES constants).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The 3-way checks look to be a general problem for gcc, but even in
     some 2-way cases it doesn't manage to fold the expressions. Hence
     it's worth considering to go farther with this transformation, as
     long as the idea isn't disliked in general.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -606,7 +606,7 @@ struct page_info *p2m_get_page_from_gfn(
             return page;
 
         /* Error path: not a suitable GFN at all */
-        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
+        if ( !(p2m_is_ram(*t) | p2m_is_paging(*t) | p2m_is_pod(*t)) &&
              (!p2m_is_shared(*t) || !(q & P2M_UNSHARE)) &&
              !mem_sharing_is_fork(p2m->domain) )
             return NULL;
@@ -840,7 +840,7 @@ p2m_remove_page(struct p2m_domain *p2m,
     for ( i = 0; i < (1UL << page_order); ++i )
     {
         p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
-        if ( !p2m_is_hole(t) && !p2m_is_special(t) && !p2m_is_shared(t) )
+        if ( !(p2m_is_hole(t) | p2m_is_special(t) | p2m_is_shared(t)) )
         {
             set_gpfn_from_mfn(mfn_x(mfn) + i, gfn_x(gfn) + i);
             paging_mark_pfn_dirty(p2m->domain, _pfn(gfn_x(gfn) + i));


