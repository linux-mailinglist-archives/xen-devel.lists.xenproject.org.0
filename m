Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF74084DF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185440.334094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPff9-0001EN-Oj; Mon, 13 Sep 2021 06:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185440.334094; Mon, 13 Sep 2021 06:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPff9-0001Bq-LB; Mon, 13 Sep 2021 06:41:55 +0000
Received: by outflank-mailman (input) for mailman id 185440;
 Mon, 13 Sep 2021 06:41:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPff8-0001Bj-DQ
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:41:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ada51a09-145d-11ec-b39f-12813bfff9fa;
 Mon, 13 Sep 2021 06:41:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-6pMKTPYuMvO4DI8i3wO2Og-1; Mon, 13 Sep 2021 08:41:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 06:41:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:41:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 06:41:48 +0000
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
X-Inumbo-ID: ada51a09-145d-11ec-b39f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631515311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZ6Xe7LP9akiDNQLhl9Vn80ka02MrCwQlU4v/4KZpV4=;
	b=lVAj+miKOw6YsxP+Az5CUOFJivZjXeZb44a9h5CVJlZECFybfUqX6rqW26ScZ0aOkHxPvA
	WguGiWYyKWDt6S2hI4xERYjY6efTTBTwBLW20KfqjZDVCX5TcCFjzAS3nNpj4ZmMZ5VJfD
	LPR/OrTfi6/Aqgw35Zm4uq6GVjyZWf0=
X-MC-Unique: 6pMKTPYuMvO4DI8i3wO2Og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQduBnlLGrdJAQ7qJxOv5vgtTekongwViOJGMTHr/meOoGlSBX7R5wcnBYs5QJFt8egD87VM6ZmmZos+gbv7G4azq2VnJE2oQ4u30SaKrrmYIxqzu62QG5j0DchZ7DPdqe0HfFdPRlx8RgjcYY/51+8CBYSg8/NKZz9kixOYDeDz2+vXs0H7CSx2ooYHvBXKIYOT6URGs5pDzjmiIdobR1xE24IxGQ9omR/mgwMYOngtA0gIvh+miQ/dNREMheCyfcHch1+bAPou00PLw6yEPg5ZYDJ+CrMLRe4x0XIKRVjfFHhjC4Fo5le9FqYErfnhoZrYjchLUIVL2B/Bckt1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hZ6Xe7LP9akiDNQLhl9Vn80ka02MrCwQlU4v/4KZpV4=;
 b=i/ApnSjRabaBm28mIPMgsQcAiNsi6qT/g+0IcW1o/Iw410wIi/EmV0MqeAzq5Ir8xXL34gvgM5s18bbWwWS8umsQg02usXGQottQGTpY2jRvp11C4hfxcrQRHjeGuqofgIXDaGuntIsxMVE/DWP63ymXMMvailou5qyn13mTzBisLWrrKIsHeqhCWtQ4o2AvokJtGzLtZZzPb2bpYPm7P3wc2xtDOBIarzBMSj304ve/BsihciMVe6qDFEaFOMlxXBDK+qa4Xx2gPq6YDvK4+ee9QNBjFXUiYlkRqlo403JJEZnLQA5X/FYIlkQlyJP8ppJ4CTjh9eGur4K/sDVfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
Message-ID: <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
Date: Mon, 13 Sep 2021 08:41:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcc9d8af-6676-4208-c431-08d97681901e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447C7ED7562494EE01B58DEB3D99@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LnLJnzedASeS4C/cq640GpOj8nqHir8EJRPZTrg6Tq721xOqe+ngyEAN5Rmn6r0Soo40JztGTmFjQrLXfw3a6AwXvmP6nrzVigwHZ/I4QfI8WRvG9HgTWOcZEEXy6wPheqApvXO677GVgQLuFIberKMu+kKEyy5JmkYs54ca/jOfWB89J0uxNnEOs1bd/RWZslaNfSVxFF4hazV5cw0euF4whBnStqJlPNKuq4v3P+6Kx8BJcNbX7yXsuX8Piju1N6nUB6Zi0ZJXY9CGE7p4cW3ap9pOPD+oEHyqN05bjBa2gn6jxtRQQMkukbumJchhAt18HihkLPE8uj6AqNIgTE4bGwy7fvFfGnNvWz2bMu6OJYzhLX0C3heUsS9lVsGmm4/cGlvBX+QgUAgAg/0/b2zLUgVOt1LxmyPxZTnglfL2jU+4/bZeGbhkh6HCXj4uanEAHcdJ0PulmPJU0R+8hPxfZU4sJom01rtPjbb455/RD1LN8Lus9QkOqwuJON/hiZhASkG2PJxz+wA6s2TjQBiG8LMXLcsgVWia+lil061g6l++WQao08ARs7ZJd9B4guUi4yh1pElUUp+V3d3c/EBZNjoyYSWNZypGbjqzeljEXMgTqj24FoNHugNPu1UFqw5HqhFbLOTJVv62aYioIrprLUVRRjwkyx+ur40ZrViwB/X/9yjC3z4NYdnUbXtncOdbLiXJXD7DgwjZpIyiF3ScBtyLcXCf5YJV6nayI806GXWsMh5ZXu+FY84CZQ3IXEfJ/BX7MFn/HEwfEGXT3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(366004)(39860400002)(346002)(6486002)(66946007)(31686004)(66556008)(2616005)(956004)(66476007)(43170500006)(5660300002)(4326008)(54906003)(38100700002)(8936002)(186003)(26005)(6916009)(31696002)(83380400001)(36756003)(2906002)(478600001)(86362001)(16576012)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHdkUDdsZmVBMUNWVE5OSUZaZEwxcUdFZmVLMndWMHR2ajR3L0piTWRZeFc0?=
 =?utf-8?B?QkhzM3FTd1gzYTBOMUY1cnBmNWhrcVN4Tk5wK2h3MktPRjdaVlNoVmhVaGw1?=
 =?utf-8?B?ek0rNDJPRm9LNzliL01RRE4yMTRUUTNFVTJab1NaZ3RUcG4vOHdVay93TU14?=
 =?utf-8?B?d2FoSW5VM1dxZ3BPU3V6MFlqdjlUVW5yZGVZbnlpNGFqdVNqSnh2Mmtmb0VC?=
 =?utf-8?B?OVNiTC8xWjhjdWFlMTdqTTFUbWwxcisrTTdxVXd0bXNDRjZCNUViQnArc2dQ?=
 =?utf-8?B?VVkwRG5vS2hPNHVvQ0xyT3RNSmwyTldoQTVkRjJnaDNwT0dSZ3l5aXphZWdu?=
 =?utf-8?B?WVF4TFAzd0U0NE9OdmRFV0ZZeU1FZENVNy80T1BmdlJJY0ZGQ3A4YXN0b2pq?=
 =?utf-8?B?a25yM0VrdEVpUnNoOVRpd0VwSkl4U1FuME9iaTZzQmhMZUlQeWZwSHJLMkNU?=
 =?utf-8?B?VmpiRHQxOUZ5REg3RnljVkZkT1dwa3doRHBLaVY5dmhueGtGNXhVZ05qS09W?=
 =?utf-8?B?V2swS3MyU04rOFJwNlBZYytmaVNkYXdxZDlUUXd6YjJCZGNKdDl0YndiQUNN?=
 =?utf-8?B?RFBYMHdPNkF5bmRUT2NvSE9LMUY5UUNLRmQxOVZ0Z3Y3Z2g4KzliOFhTOWxw?=
 =?utf-8?B?aVV5eDRTdmVwWGNwT0I3OWRSSDl5MnFyNWp0MDdZblV6RTVlaDR5NDNwZzVp?=
 =?utf-8?B?b2x1dE1NRDZZb001UStQTGpGSmNrTndWYXViRmFHbzJmNzJrRlpMV2E2YmtL?=
 =?utf-8?B?WlVscXBkRTBhTGtpZ2JmR1l4bkxUYkphNWVSU2JQK2RXcmwvd09Rajk1UWo4?=
 =?utf-8?B?V2Z6UDQvTzQ3d3dTci82TzlmTEJJWDcwYi9iQTVQMWlmNUVxcnd6RDFEVEdP?=
 =?utf-8?B?QzNiTjQ4YkJQL1VtUmNSUTd5bjBQamJwR2Q1eXdlNWxuelhPV0NHK0k2ZnBX?=
 =?utf-8?B?L1BWR3QzamhpNi9aL0Vmb0xiMWF4S2FrVVJ0MmNvUnhQclpnRGVIai80ZmNp?=
 =?utf-8?B?ODVFajZPUnpqcSt2dGxVSTBMNk1LeFBnMVBHbmFkZlN1OGVTRFYyMVYxdGp5?=
 =?utf-8?B?RU5aOTZkdkdHRWU5M1R4YWtLS2JmNGZrOWVrdkZsVEZSTUtaeldub0V2ekI0?=
 =?utf-8?B?bU5aZHpDNDZMZU9pRG1iRWh5bko1ZTBIZEpKc2tPQ0FWeVkwMk8yZWo0WEVu?=
 =?utf-8?B?ZG5CbkJVd3FlSG1VZEVuRkZzSDIyYTIvNzZOMlBlMkcwaWk4cUFmSmlpRFJp?=
 =?utf-8?B?cWhKYjFXcjBhNXNzTThKR0QxWkI5dDZWdmMyZHNTNGJ0VWlMR0JHM0dXYVlv?=
 =?utf-8?B?TzIwZldWcHBPeWFZM2NGV2kvalgwVGZqMzN1NnJuSG1kU25uditSOWNjdGVK?=
 =?utf-8?B?MXE1a0V1S0NMYWFjWmxsUFZmR0xicVNUck5lUFgycHQ4Q0p1TE00YWYrYmY0?=
 =?utf-8?B?L1ZDVmVDYVlFY1UydmUzM2hKYjkwY1V1SGFVb01aVFRZT053dkFVZEFKNlBs?=
 =?utf-8?B?dlR0cFJ3YW1JaU5DbTFDbmpsS2k0anBNakFscytvWHhROUlDcVVtTzh6RmVx?=
 =?utf-8?B?eGFaTWF3R3NRWFg0TEF0MUxqN21YbGNBc2NRZjZnN0dDNURxd1ltek8vU0JV?=
 =?utf-8?B?V293b2lqOHZmUHVTeVR6M2lNSEJjaVRPYi9ubjg4MlY4d0xEQTk0TnVyS1Vn?=
 =?utf-8?B?TUliSE5vMTcyT2hUSngxYnY4VytJMFFuRHE3ZGNHOVRhWXFrTjdTcUwreG4v?=
 =?utf-8?Q?9GyXbSXbrPKgfFAFcXcAX4nJVn/dNz4jg0zm6GI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc9d8af-6676-4208-c431-08d97681901e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:41:49.1149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBH1A/l9p1p3++jdcLr5TO7eJXRM9dEpslvlf7RW3zfY7EOWSbYw/eSYRx2mtTmVC18NpLAXQdymaMtPOJy03A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

Without holding appropriate locks, attempting to remove a prior mapping
of the underlying page is pointless, as the same (or another) mapping
could be re-established by a parallel request on another vCPU. Move the
code to Arm's gnttab_set_frame_gfn(). Of course this new placement
doesn't improve things in any way as far as the security of grant status
frame mappings goes (see XSA-379). Proper locking would be needed here
to allow status frames to be mapped securely.

In turn this then requires replacing the other use in
gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
x86's gnttab_set_frame_gfn(). Note that with proper locking inside
guest_physmap_remove_page() combined with checking the GFN's mapping
there against the passed in MFN, there then is no issue with the
involved multiple gnttab_set_frame_gfn()-s potentially returning varying
values (due to a racing XENMAPSPACE_grant_table request).

This, as a side effect, does away with gnttab_map_frame() having a local
variable "gfn" which shadows a function parameter of the same name.

Together with XSA-379 this points out that XSA-255's addition to
gnttab_map_frame() was really useless.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -92,7 +92,7 @@ struct grant_table {
     struct radix_tree_root maptrack_tree;
 
     /* Domain to which this struct grant_table belongs. */
-    const struct domain *domain;
+    struct domain *domain;
 
     struct grant_table_arch arch;
 };
@@ -1795,8 +1795,8 @@ gnttab_unpopulate_status_frames(struct d
         {
             int rc = gfn_eq(gfn, INVALID_GFN)
                      ? 0
-                     : guest_physmap_remove_page(d, gfn,
-                                                 page_to_mfn(pg), 0);
+                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
+                                            page_to_mfn(pg));
 
             if ( rc )
             {
@@ -1806,7 +1806,6 @@ gnttab_unpopulate_status_frames(struct d
                 domain_crash(d);
                 return rc;
             }
-            gnttab_set_frame_gfn(gt, true, i, INVALID_GFN);
         }
 
         BUG_ON(page_get_owner(pg) != d);
@@ -4132,6 +4131,9 @@ int gnttab_map_frame(struct domain *d, u
     struct grant_table *gt = d->grant_table;
     bool status = false;
 
+    if ( gfn_eq(gfn, INVALID_GFN) )
+        return -EINVAL;
+
     grant_write_lock(gt);
 
     if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
@@ -4144,24 +4146,18 @@ int gnttab_map_frame(struct domain *d, u
     else
         rc = gnttab_get_shared_frame_mfn(d, idx, mfn);
 
-    if ( !rc && paging_mode_translate(d) )
-    {
-        gfn_t gfn = gnttab_get_frame_gfn(gt, status, idx);
-
-        if ( !gfn_eq(gfn, INVALID_GFN) )
-            rc = guest_physmap_remove_page(d, gfn, *mfn, 0);
-    }
-
     if ( !rc )
     {
+        struct page_info *pg = mfn_to_page(*mfn);
+
         /*
          * Make sure gnttab_unpopulate_status_frames() won't (successfully)
          * free the page until our caller has completed its operation.
          */
-        if ( get_page(mfn_to_page(*mfn), d) )
-            gnttab_set_frame_gfn(gt, status, idx, gfn);
-        else
+        if ( !get_page(pg, d) )
             rc = -EBUSY;
+        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
+            put_page(pg);
     }
 
     grant_write_unlock(gt);
--- a/xen/include/asm-arm/grant_table.h
+++ b/xen/include/asm-arm/grant_table.h
@@ -71,11 +71,17 @@ int replace_grant_host_mapping(unsigned
         XFREE((gt)->arch.status_gfn);                                    \
     } while ( 0 )
 
-#define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
-    do {                                                                 \
-        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
-            (gfn);                                                       \
-    } while ( 0 )
+#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
+    ({                                                                   \
+        int rc_ = 0;                                                     \
+        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
+        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
+             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
+                                              0)) == 0 )                 \
+            ((st) ? (gt)->arch.status_gfn                                \
+                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
+        rc_;                                                             \
+    })
 
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
    (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
--- a/xen/include/asm-x86/grant_table.h
+++ b/xen/include/asm-x86/grant_table.h
@@ -37,7 +37,12 @@ static inline int replace_grant_host_map
 
 #define gnttab_init_arch(gt) 0
 #define gnttab_destroy_arch(gt) do {} while ( 0 )
-#define gnttab_set_frame_gfn(gt, st, idx, gfn) do {} while ( 0 )
+#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
+    (gfn_eq(gfn, INVALID_GFN)                                            \
+     ? guest_physmap_remove_page((gt)->domain,                           \
+                                 gnttab_get_frame_gfn(gt, st, idx),      \
+                                 mfn, 0)                                 \
+     : 0 /* Handled in add_to_physmap_one(). */)
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
     mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
                       : gnttab_shared_mfn(gt, idx);                      \


