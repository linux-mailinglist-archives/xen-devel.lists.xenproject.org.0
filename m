Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B93F852B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172886.315476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCPJ-0001wG-PB; Thu, 26 Aug 2021 10:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172886.315476; Thu, 26 Aug 2021 10:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCPJ-0001t3-Lj; Thu, 26 Aug 2021 10:14:49 +0000
Received: by outflank-mailman (input) for mailman id 172886;
 Thu, 26 Aug 2021 10:14:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCPH-0001sS-A8
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:14:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddbc5c8b-ed69-4b51-b381-f72220f832c9;
 Thu, 26 Aug 2021 10:14:46 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-B93ypRdbOw6tdmWNspo4Mg-1; Thu, 26 Aug 2021 12:14:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Thu, 26 Aug
 2021 10:14:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:14:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0186.eurprd02.prod.outlook.com (2603:10a6:20b:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 10:14:42 +0000
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
X-Inumbo-ID: ddbc5c8b-ed69-4b51-b381-f72220f832c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2sjXwCL60nDv/ojF/gj3Johk6K28uhN0OKh7D6Mr2I=;
	b=N5mEGIYrA2/TMPh6Z0/6j2t0vR47FpfU9xYN79RKQ0Hb7jNp3VGAWaWoqSnp300UpixRHp
	wy/fo9G7n3lFHlXTn2uGq2cWre5Pn7sXNTAnzpCdamUDlCmeuiwN2e5FFhFPpgEsekyP+N
	l3tI2vFiOgLteiIqpFTnJ5EbfeC5QW8=
X-MC-Unique: B93ypRdbOw6tdmWNspo4Mg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihGLYjelhPhpMT1no0tTX19iqqSiwiUh+wm4Zi2gXRrgfLrJdZhvoAPNQqCliPeTGMPkGbSwUsdSrlMRUgdjqdjeVZVanEKXS6F1WoO+hH1AAGCgJ4r/oASjZ3bhL7uSUVS5qWHmKuMrYmNlJzBEQmZuzzavCOQnZ8m3kn86t5GzvrGgQCsqTpIF24DvGOV7RbDOJtIloMEb5eea+4oYxCqKIj5VZLJU24UgXpOnM1PumYZj9+mH7BKRoMgsdRG3TiGI20K0j1GoAPkL3lFXt6dDPtwKII/QhxAI9R8A7SgjTaY6774oqYxWx/LvtxOVBpLcS4QMPSEy4iyV371Tow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2sjXwCL60nDv/ojF/gj3Johk6K28uhN0OKh7D6Mr2I=;
 b=XCqJPRgtmC0i5kPEJVegZCSG2hRtM4mZIkA08Ef4tK0ddx3jdhBK+hwXzHSSM8D0JVZQvI0KyAjkMplLWu5uI6U1upOFv1BfcRI6kliD2isoUkgE296EBvEr2uDQ78IkJc1cm8xsou9EszS0ImaCvKV/EiYr/yvNqf9oN0N/iLXvA90pKa+db/n2KP8CYXH2wyDF71183d1eqzHOz8iZMVQzy+Dg2yrTzeiTIcADIydo/9kjT5VPbqmCXs/fn9uscCfYVoYmLMwPfbhoYO3eYpKWECM8O2fFnqhwWAGD1sZNQdQxdUi6bq9a10XwcXt7zynDBhz6gPZ6kt4PgcjXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 8/9] gnttab: bail from GFN-storing loops early in case of
 error
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <61775fdb-bf56-b6db-563e-81820e4248fd@suse.com>
Date: Thu, 26 Aug 2021 12:14:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0186.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37bfb835-cfee-42ed-2720-08d9687a526c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901E1997DE163D9B2E2CCD5B3C79@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8HpSZa7gnpkaKTdm8+zXglA2Eb8d13ynMgrWCrZjQpXGDVzt6VjGXVmxPa00W6L8Ctz5FyzXoi/5BPlWMDswZG4qqfLUn61RJL2GVQ+X5Y3TpcQKTcs9kB4wi6Yk9rhhIN9skaG78NUoqICZqw51dPoQ6F+Yg41jp3zqJoEZqfkoYWaXi+Be7x47pbLHr/G4oPYWXBpEDqXjKEOxQS15VsxLaxm5VCYmfDbq3+dMqD/MYsaYATNROXJ4fnqTAbaEyfiFBAWzR/0bSe4BwoKbcQSw2xyj4CD+YPLH9GQGHQoakrRgIG25HrLpJBST9cXsKf5NEKJx9dyf//npen5SjHuWM6fzC4o9oPRdz5Rt85CmuVhyhsCcQ1y4fU1kyKeZDPmPFIih3K9pRDeh3c3woQ8iJ5A00Y6tk+Jr9RuUeOU3yywV6HZkM6JPxf+EzMMUlFm1ECqPXgisDOlfJL+B8Bq4F10WbfQ5aYOhfUL9knXZvViRWYEYGlYVTGXN+0CLPNsLKcBrbRjiznDn7B9ba4TR7Fha3KTY9r+lkCkMKilmwR8TnaU0wrSLUpDAH+XTh9oBXFoa1itVkEw+w5ncMCIYUjQoSR0neLpx4sLSI1MM/iHmex5MIdK3N1Rim8AjKdUTjYweuuypOoKB2SRBAWRz0jEYU38iQHxVkKEcY16wp/bD/avDapZx7nfo96lT8PuhIW8pNki/Ue12n06SrC5k2f7zpZFSsPWLRP5bDX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39850400004)(376002)(346002)(2906002)(8676002)(8936002)(31686004)(186003)(2616005)(956004)(26005)(83380400001)(4326008)(31696002)(16576012)(316002)(54906003)(478600001)(6916009)(38100700002)(66946007)(5660300002)(66476007)(86362001)(66556008)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdvVkpjNXFoMFZtcE1uRzV1aTNDdnB1Mm1CNGp0dlR4N1JOVy9QMVVBWGFk?=
 =?utf-8?B?bFduWFBmS29OSlI0bDFidXhzNndhbndCeHNlamZ6Q2pvQytRSFg1Y1ZqQ1lX?=
 =?utf-8?B?NXRQNzFTbnBMOWhzTnZEdXN4MXN0NlozY3AwaHMwaTk5QzEvQXk3cGRnNnBv?=
 =?utf-8?B?RmdXNTVlSjFXRXNnRmpBU2RHSG9mRnNEU0hLWEhtc2NiL3hzdDMzdUZxVmJM?=
 =?utf-8?B?VnJteDRDMkxJN0dPTEZBSTFobis0MEJtMk9HV1VPYjVwVW9pQ1oxS2VIQk5a?=
 =?utf-8?B?bnNKL2JuVHlEVXZnNVJ3MkhaekF0TUNxMmV6RDA1ZkRPRXN0MTMySklpK2g4?=
 =?utf-8?B?bXQ3VjVSWTk0WU9GY0ZKaXVXQ2hDdnFkZU1xbjJPK3FVUERKWlArUFlGNjZ3?=
 =?utf-8?B?cmhDaFlFU3UyL2FFRGN4Tk5ramo3ZHpYeVFINFJZbWxRalBMR0FIYXk2c0pJ?=
 =?utf-8?B?TkxOb293d1RRUm5SNm1pbFJtS0JpYVN4anVUMXJzN3ZZM0xQOTdBa3JJSWF1?=
 =?utf-8?B?K0VDdGJ6dTZEWE9hZkRnT3cyYWpNUjRwOVQzVXBObEZpakpYVFBPcnplTzhl?=
 =?utf-8?B?Qkh6KzQ2aFFXTzZDUWZ4OEVHS2pKV09pMUF0cHdodjdFdkYza3FUcXg0UElw?=
 =?utf-8?B?RHE4Y3ZDa2ZNWXRTUmlTL2hseDNudUF0OWhldWNwRCsrQnBtOGpOQjRLbVZU?=
 =?utf-8?B?OVZTMGhPS2xNd1R6YURLTnZIczVpMWhxSXJHS29od0VGMWFlSkJZMmhWdjE5?=
 =?utf-8?B?K096dVRWUkpOODdhZlViWXhQM2xDNGxaaDdobi9wVWlrdGtjb2Q0WE9jR0I0?=
 =?utf-8?B?WjQ0UW13cGhKMkVUS2RQQ20rS1dKdW5RdWU3L0lvcjluNHd3czh0KzJBMzkx?=
 =?utf-8?B?SWdtd1JaL2ZZQVRKWXRPbFdpN2svK0t4WnRaU1pRcnlLa3FCZnBMVFpuV3NH?=
 =?utf-8?B?cXk1WHhrQW4zc0xrcFVQdUk3WDBOa0RmSStKOHplZVNaeVRZVDdmWk11TGNv?=
 =?utf-8?B?Nk51UytMM3F0d3BzMW5KbnBhdHFxejVZZWtRbkhhMWVqNG1sMGw2U2gvdGEv?=
 =?utf-8?B?aGtJWmRlc3g1OXozcXA5Q2hsUkVSU1UwelhMVS9Ccm96d290U3ZPeGFXS1Zm?=
 =?utf-8?B?QmU3WitOWVozOXM5TkxkUlZTYUprdEY2b1UwVktJY0VhbGpra0FIc1dIMWY2?=
 =?utf-8?B?eXBhazRUOGNqOWttQnRlRndGZEJyMGhZWkRzTVZzVkgrUDJ2UnFjRVhVR1BP?=
 =?utf-8?B?eWFCc1VFTE5xdldPbEt6dEJmTXhERzg4VmFOZC9jWUtSQzJhRmtsSFVBZVp4?=
 =?utf-8?B?MkZ3MEREb1E1TkdQYlY2bzJKbld4SU9ROWNGbUcwNi9HVCtYaGtxZ0JQQ2RG?=
 =?utf-8?B?OUtyWi9nM1N3SEZmTE5pUGJ4b0sxVnRYSVkrajdYdVF1bE1RYVJNSG1GZVNH?=
 =?utf-8?B?bVpLUTArODN0NTBwYlJKUlNUTlk3UDh1V3hlNFRQM1FRa3pjZytmVnp0b3Rj?=
 =?utf-8?B?aDFvaUR4TkEyWlRDZ2J6eEFBMm01WjlhZ2g1bDdBbDZNT3FFUDBQbjdnWkUw?=
 =?utf-8?B?aWdOVXl0YUtJTUlOcmdVc1A1VWFmaUFuakNGYkwwTU0zNnU3cjMzOWY3R0k1?=
 =?utf-8?B?U0xJRjJSYlpGR3c3Sjd0eEZqeDgzVWg5ZlByd3NjeXNCYTlIV25rbzNQNGhq?=
 =?utf-8?B?R2Z4STVwai9WVmpYVUpTelJ0Mmorblh1UHRUdlZmVTFJRXgzYmM3RUh0bjlw?=
 =?utf-8?Q?I/7v4oo4QYUWPDjF41O6gbI0Y9fwwNFgkAqibno?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bfb835-cfee-42ed-2720-08d9687a526c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:14:42.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZoY3MqCXqlwDxkqL8eA0tCCz23IR8zXlR0zmFR81EqZE5rcwOh889kOYc5I3ww29Y0Vxb/E9k589ICkR+q8ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

The contents of the output arrays are undefined in both cases anyway
when the operation itself gets marked as failed. There's no value in
trying to continue after a guest memory access failure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's also a curious difference between the two sub-ops wrt the use of
SHARED_M2P().

--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -170,17 +170,14 @@ int compat_grant_table_op(unsigned int c
             if ( rc == 0 )
             {
 #define XLAT_gnttab_setup_table_HNDL_frame_list(_d_, _s_) \
-                do \
-                { \
-                    if ( (_s_)->status == GNTST_okay ) \
+                do { \
+                    for ( i = 0; (_s_)->status == GNTST_okay && \
+                                 i < (_s_)->nr_frames; ++i ) \
                     { \
-                        for ( i = 0; i < (_s_)->nr_frames; ++i ) \
-                        { \
-                            unsigned int frame = (_s_)->frame_list.p[i]; \
-                            if ( __copy_to_compat_offset((_d_)->frame_list, \
-                                                         i, &frame, 1) ) \
-                                (_s_)->status = GNTST_bad_virt_addr; \
-                        } \
+                        compat_pfn_t frame = (_s_)->frame_list.p[i]; \
+                        if ( __copy_to_compat_offset((_d_)->frame_list, \
+                                                     i, &frame, 1) ) \
+                            (_s_)->status = GNTST_bad_virt_addr; \
                     } \
                 } while (0)
                 XLAT_gnttab_setup_table(&cmp.setup, nat.setup);
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2103,7 +2103,10 @@ gnttab_setup_table(
         BUG_ON(SHARED_M2P(gmfn));
 
         if ( __copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
+        {
             op.status = GNTST_bad_virt_addr;
+            break;
+        }
     }
 
  unlock:
@@ -3289,17 +3292,15 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
                  "status frames, but has only %u\n",
                  d->domain_id, op.nr_frames, nr_status_frames(gt));
         op.status = GNTST_general_error;
-        goto unlock;
     }
 
-    for ( i = 0; i < op.nr_frames; i++ )
+    for ( i = 0; op.status == GNTST_okay && i < op.nr_frames; i++ )
     {
         gmfn = gfn_x(gnttab_status_gfn(d, gt, i));
         if ( __copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
             op.status = GNTST_bad_virt_addr;
     }
 
- unlock:
     grant_read_unlock(gt);
  out2:
     rcu_unlock_domain(d);


