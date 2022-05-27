Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B8535F2D
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338013.562764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY1l-00062q-C0; Fri, 27 May 2022 11:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338013.562764; Fri, 27 May 2022 11:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuY1l-00060P-7K; Fri, 27 May 2022 11:21:09 +0000
Received: by outflank-mailman (input) for mailman id 338013;
 Fri, 27 May 2022 11:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuY1k-00060H-2E
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:21:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19e57dd7-ddaf-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:21:06 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2177.outbound.protection.outlook.com [104.47.51.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-1zjZN68sNRC4HqIvRuFawg-1; Fri, 27 May 2022 13:21:04 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2522.eurprd04.prod.outlook.com (2603:10a6:3:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:21:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:21:01 +0000
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
X-Inumbo-ID: 19e57dd7-ddaf-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr0SXJIhqPFcpvsJUpdSD/Fb1591DtjkDEfmbHUCDiI=;
	b=F/cRumbzNzCbFN833TDbFSLzxr3W54dszlPH/EYYJTBT6EOmBodRmJ+ht2Y5oE1q5PLz1g
	VH/SLfYghGTBhVMgRNdLax6YlQkxqPLKT8oxRXjq6trN6/wXVdhrJtYKxPsDi9bqexHf3q
	ZEVPZPMrHtVU3bm2R1CKNjtJBURSH1I=
X-MC-Unique: 1zjZN68sNRC4HqIvRuFawg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg5GgiQK7GxnOkQBy0ekPu4MajoVvJEV0hZqPj61oyOnlfAw8SUGjztzbKaiiZkWbjkj+q7o/yqqWFcOdVzC22oWYZV0FigGAOK+5NGAflc+lUZZtAgSWrrLYo/ozcScRZkdbEsr7AMUpD6ZnTg7EiH5pMEnd/D9VlIJdQAKjECYIGwB0azW10B0dzai+kQ0WT5FdYeJtG8JLR+vf4nSuy0QcgOuuqWTW9wMrF6yi0trptsV9TpKchhhzcvDfT6Znrm09meiC9eaMcWqK9yYCj15bLchntAlPgLP7arZqbkcF8YZvbo1b3CA45vvYTatZkjOEnMpKgbwUN/+3t5qpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX82Sk7UOiPch4uhVxxmVUF3Sh6BPeVOjcXNAE8rHco=;
 b=QPIhT6f5jvDnzNwQejsIhmtXyam2qq8xHit2VlT0uIdtJRC241ZgoTulYURYOn8xf7M27yiZDPORTGRK40ij+0Kc6xNqQGnLef+OLfBVu97fY5Ah3Wjej8MfWWNj6LsnoPz7LDH0LycSg2x0zR14HWGbHMRM/xw+4fiPFo3X5XLDVmZFDfWf9Z8ANGiEeKKUxhHj3mSQ3IAI5TWrkbykEIPufVRHS8tC+Q2OzH/mNkiWRWBtDqhlHARCgbwuBI4harMfZQwGnXm7LguXcSKgAUMNylc8wBezuvVhd8mwi/hPcBlGgWLc+nxLFHZlJ8rB3zZL+5prowiWqVrsufnCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc038ea3-250e-cb3b-ccd7-0904a0972f66@suse.com>
Date: Fri, 27 May 2022 13:20:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 14/15] VT-d: fold iommu_flush_iotlb{,_pages}()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0056.eurprd06.prod.outlook.com
 (2603:10a6:206::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6041e9-9271-47c7-00f6-08da3fd2fac5
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2522:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2522090F288B8B7036282D82B3D89@HE1PR0401MB2522.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGQdM8r22Jw/tfmi6W3x2n6Z6RtW9U86d+8vQ+xEiB9Jp3M7V0/tGGDwn2ga2l62ee6nrSdKpp8yZ+/eFK1nOS421dpHOP6KxwisknegyAkYzpq9CMzi2jPuFyrleYZJMbA3eBolHQwxGioCEcWRHAM8kV/yOswG4xWfjMUZR5FV6Y1wcZDPHJtq4M9HqpepbC/5/snZXJtEsebjEIIYRuS/pMSkUya2Dba17K+OEuKrjW69YoKpHOrISrFGREceOQ02kQ7PPBKwqOrnG02zpADDK7Xr9COACLptoBmSP7bzmDFbAsjur4/L9tlNiOlyNct1fAcgYwJ1WTikkDRyHbIYedw/03mzCI/vlP2Bt/XyKu1MkCfWFLdJsf7Yi94TSaCu/tuNidf8cxMEZvLLhF37iCqfdknZmS21Y6YNl0qIW/cCrenQq6pdTc/L9RM1k7d+e3tlElpPFsFE0TIfaWDjOsKB70+WKBoVsXsDC7z8bQ2CrDYTzA0MQmfinGpd7lQt2LtA80B702+CqXaoEvsG7ZrF3YjkXAzannXG87E0pKtf4G7MVzEBg4ITnRu2Oj6JIMKxYA6Uu8okfOd19wncZgYGeCvhx+ph1nOZ/3C0rKqR5XwaWRVUPZaDZLijoVZF/gFqmkGHFXz2Ep+UriDsdR3uuGn/9ZO9o7sN/4wBBx2R5fbnvgBzxUzueudIn0v5BMfsO03vz2yJyZmiuoEV7GLBPm3ZgVJ45zec7t0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(26005)(6486002)(4326008)(6512007)(66556008)(316002)(66476007)(508600001)(6506007)(54906003)(8676002)(31686004)(2616005)(83380400001)(6916009)(38100700002)(186003)(36756003)(5660300002)(8936002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dKiQNOXR4eZDvv5LlULs8+oMhayf/w2YR+63S8APNo7JEKozvak+491+3nrQ?=
 =?us-ascii?Q?noIGsnYo+k9AJf9h2WDZK/7FnsNxzZh/lgBf1LWSpBf1K5MaleynO0zbLfgE?=
 =?us-ascii?Q?2Nqn0/D7hf6JlbruOe/hicb2Vx1NQxJNnNDSnPqr6YSDtwixxTtaEG0C5zGB?=
 =?us-ascii?Q?Mg0Y/7M5Er3II0KPBPrYeE+l6MT5JisT52jsbGSnzbLvsv/qPRtA4keuPBDm?=
 =?us-ascii?Q?e8wQ6NY1grRZOHwh08lDGdHQyQHUmZdNTPKTbiOaa1KMB5mzseLqbRj6DF5E?=
 =?us-ascii?Q?vZ+t92ymo0s5NvayrtVEVKPiI4Z/MYNqLVh9krYnUP3zC1wBd3bEIX548Pww?=
 =?us-ascii?Q?QH6+ak13ERX4ySp6kDYXj6G8tklPElJEbnhEEtk6vj2GLnBFRAoeY6Wh7lKq?=
 =?us-ascii?Q?WvyQuEnAYbXmtkU3gLRGMB3tN63tSTXb0Wj1YdQDqj3E6oq6M3UEMWWyRwlU?=
 =?us-ascii?Q?h2s2LluyKx8/sBIIlsm3x5Csigt6rBpHGTA0YT2A6/wEmbS3OZjYJ77aebe8?=
 =?us-ascii?Q?tRehojUnvQ2ToJ+wKdb7KiwqeIRVW/ARghEhPFfpcWGqYpy1tlmnF27oxcNu?=
 =?us-ascii?Q?iIr4Jp3kgkBaOB7JsL7izhAwCMmHHu9Cpq6Xik7hDOUPNO/QSGj7ULVKIhNk?=
 =?us-ascii?Q?mBoSu06m+sRu7/N5JNIvh2+QYLMLhKRn2fz/or4ec78JqvuH+0ci0jB/v2Uu?=
 =?us-ascii?Q?96wb5QWCS05V6eyTKgT60LjqgIBGEMj+GDr9XLTugRSW5Li+SeemN8lS5GsO?=
 =?us-ascii?Q?7+p66sy49EFzEt8xzx7qhsCsuWpxDuXnbPMVKPDU9eW6q1zEzrfL1FWuTd8w?=
 =?us-ascii?Q?hdepZ/4vqHfvhl8bGIVhm3ML/7usMTJLb78NN3hrhXxcrMb0rpx0FHLs4PS3?=
 =?us-ascii?Q?9bJQI/fB03IRxi2zIwt+xDSLEbQFIcd5kg0nHZZd3HXiolVUxvqKaQ4KNQVw?=
 =?us-ascii?Q?nSkJtfZOv8GLRMFRrE6OjMTCPcR7wSj3DigluxgURlwrQepUrUKYe97zil7H?=
 =?us-ascii?Q?kTcrzg8UtdgtJqNDRbAop0RWr5Pma4L8iw9npva5LdyhMhI7gJap5NABYrXM?=
 =?us-ascii?Q?vD7PKjb5xFM9OgG2O6iX5ezGWzRT0ybHSnYiCOxwfpdEMfwy4IWZK2G/By+z?=
 =?us-ascii?Q?lIkWRYy4d6NwZkSkl2AGBUrCVa7zAVlPBAY9JoXU5KGGyJvM1Q/rzfF+zZJN?=
 =?us-ascii?Q?nUGhzEA7RVQciAOP196qHcTTJwhAT9nmx5YBapHfSeTaS0Wm7RXOn4z0cUqv?=
 =?us-ascii?Q?angAvTfghB8JWNu9hHBjRPkDiOxZNX0zYoEcEEPvG1M3qc2QH1cRbaevTv9y?=
 =?us-ascii?Q?yXd/EGR4fh4TkuN1JXmTOhuap8cjc2NJkJnxXA5Xs8b+XeSy+72pLTVEFoJ5?=
 =?us-ascii?Q?ed5JM3oYmYDB5id/ViA6hYu7GkkxvDY7hmJ2/gGdeTwFPbJlPRhgiIjMLM7Z?=
 =?us-ascii?Q?pSJnaDfw1L4H/pYOYXTBPFgmzoCSBsuYaDyt5DSdv4cPf3ZcsasPnd4wUvBF?=
 =?us-ascii?Q?uPwE8m9vMLQ0XNoVmwhhwphZeDjjBkshODkBrqNSpb8b50RzM8B3x6r3QK48?=
 =?us-ascii?Q?Lt2fOaO7LdJwSnqh+ATUdKK684Zeb1ZzQt2xIVDNriR/6VRYgwrf1/ZmW2LF?=
 =?us-ascii?Q?0u42cbROInt2oon/p8lxPFOFxUZdgxobIZtXAs6S4vLA/UCEZEYHlCwy3Wx+?=
 =?us-ascii?Q?04IQD8sp5QxYHqb2IuHdaoMCTXUJQSUzrAMsOLDqZqyy8fjAhwTHH0vcLS9o?=
 =?us-ascii?Q?SbLXncSdRg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6041e9-9271-47c7-00f6-08da3fd2fac5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:21:01.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/m1hy7JSQQDdrgO/ndP6seZWS2YMqSzgbJe71DfsVA3tBk9r8y2Xdlpgnf2YYP2ysYQTgvc+kRBAaLra8PmwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2522

With iommu_flush_iotlb_all() gone, iommu_flush_iotlb_pages() is merely a
wrapper around the not otherwise called iommu_flush_iotlb(). Fold both
functions.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v4: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -728,9 +728,9 @@ static int __must_check iommu_flush_all(
     return rc;
 }
=20
-static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
-                                          bool_t dma_old_pte_present,
-                                          unsigned long page_count)
+static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t=
 dfn,
+                                                   unsigned long page_coun=
t,
+                                                   unsigned int flush_flag=
s)
 {
     struct domain_iommu *hd =3D dom_iommu(d);
     struct acpi_drhd_unit *drhd;
@@ -739,6 +739,17 @@ static int __must_check iommu_flush_iotl
     int iommu_domid;
     int ret =3D 0;
=20
+    if ( flush_flags & IOMMU_FLUSHF_all )
+    {
+        dfn =3D INVALID_DFN;
+        page_count =3D 0;
+    }
+    else
+    {
+        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
+        ASSERT(flush_flags);
+    }
+
     /*
      * No need pcideves_lock here because we have flush
      * when assign/deassign device
@@ -765,7 +776,7 @@ static int __must_check iommu_flush_iotl
             rc =3D iommu_flush_iotlb_psi(iommu, iommu_domid,
                                        dfn_to_daddr(dfn),
                                        get_order_from_pages(page_count),
-                                       !dma_old_pte_present,
+                                       !(flush_flags & IOMMU_FLUSHF_modifi=
ed),
                                        flush_dev_iotlb);
=20
         if ( rc > 0 )
@@ -777,25 +788,6 @@ static int __must_check iommu_flush_iotl
     return ret;
 }
=20
-static int __must_check cf_check iommu_flush_iotlb_pages(
-    struct domain *d, dfn_t dfn, unsigned long page_count,
-    unsigned int flush_flags)
-{
-    if ( flush_flags & IOMMU_FLUSHF_all )
-    {
-        dfn =3D INVALID_DFN;
-        page_count =3D 0;
-    }
-    else
-    {
-        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
-        ASSERT(flush_flags);
-    }
-
-    return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
-                             page_count);
-}
-
 static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int=
 level)
 {
     if ( level > 1 )
@@ -3266,7 +3258,7 @@ static const struct iommu_ops __initcons
     .suspend =3D vtd_suspend,
     .resume =3D vtd_resume,
     .crash_shutdown =3D vtd_crash_shutdown,
-    .iotlb_flush =3D iommu_flush_iotlb_pages,
+    .iotlb_flush =3D iommu_flush_iotlb,
     .get_reserved_device_memory =3D intel_iommu_get_reserved_device_memory=
,
     .dump_page_tables =3D vtd_dump_page_tables,
 };


