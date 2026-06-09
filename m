Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfgZFQI1KGqbAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4419661ED4
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=y1EmouhV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333575.1596686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydM-0000HR-EB; Tue, 09 Jun 2026 15:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333575.1596686; Tue, 09 Jun 2026 15:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydM-0000Fy-9c; Tue, 09 Jun 2026 15:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1333575;
 Tue, 09 Jun 2026 15:44:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWydK-0000B1-IQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:44:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWydJ-004xC6-VS
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:44:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834df-e002-0a2a0a5209dd-0a2a450bb8ae-32
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:53 +0200
Received: from [52.101.62.6]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834f4-212f-0a2a450b0019-34653e06e59b-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:53 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:44:50 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:44:49 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5PN7uAN13m4ejfpeyRYNUUUar+8YCf7cIRLk2vQiZQJsSZn8NPjlnK30l8hXxVJcRyucQzwjwN6sy3voe+zz+YXWCKtSv/y/nfVAkPx6arCYKDaoMNPhwzqlRF10MXnH9lEjr9wanO8XPR2mYGBzJiUOtCIMb4bG0xcmDeSK82Dh7GpLwN8BSYJEInz5sAAWPux7BKl1v3ZEkODnWPK3V1lekQYTCNwAM5QYQqFFgpk0zx4UnxdqW747xrp6VauaJpfBCj739+LgOwqKr54ZxwD4TYDwAD2Bi3TGMunvg/PN7BCsoSRWBRFzAqShw/lpHrCR1aiDEJMtvQVw8HSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oRcVjU3CohvWdlNeXdCS9k2NhJswH1Ylop2GchbfSo=;
 b=N9C9ZucCGP6DgHMp/LkHC1JGhxB4nQH2edApf9zkugGovvt45AsLSlxbOwRPhWPxnkfl+1KHRqaY/wQkdT6egtJ+Mjm1/Q1AegVTulEHRK62ejE2cApf54NZLrn4AyOnY/d6NqwhafivinyXKDFyp84cLnL+wyi+4WpUsSaAuPmt0ExpK8P+M390ipVZWgnNhV0+BrNXX8ib9Z9JlcOvEz6+ymZ93URYWCIuAyyFbxpgI7P7oC/QqzdfuzhwNIdEefg0K7gfrpdK5SruDn0k6pOifGst8FA+MwmI56a6vZn992at6RjfKa1NW78jYl4bLKq/cH7einnX2cAGEjJtlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oRcVjU3CohvWdlNeXdCS9k2NhJswH1Ylop2GchbfSo=;
 b=y1EmouhV7pzH8kA9CwabFtsUTiV2Jd5CK3QswLAYC3+IIRCPPF2rC4eFBkk/ZfUebS7kIAKMqqheip+eJaTBtBgG/dPzabDF26/yUflxn/JaVDIOxHoNLj9EoPAB2NjtxLUumpfMSnHarqKJhcQm1s8Dhw8CDb52dG16H7vuYwo=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 3/7] x86/kexec: add new struct kimage_segment
Date: Tue,  9 Jun 2026 16:45:14 +0100
Message-ID: <20260609154518.779757-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To DS1PR03MB7992.namprd03.prod.outlook.com
 (2603:10b6:8:21b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de2c4f1-df6e-47e1-eb19-08dec63e0946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	EHzQi2XFnEvM40mpBdIp/uxuQzS4PF+jm3Rswy0n3HDLR0j37dw6mIRqHFHb4QPRVL+mLyKGfqpk8C238ggvdSZozrN5Z+S3QEluU4LUct1LTs9VLME62Gw22GlFqBFJlIxMKixh4GAuEbmfB96Y8YTQDBGtw56QXjdHkCAVFTzSxNKUvkxFEbw3YEZacj2gotnk0rKZI6KOZkxQgKKYwVyGEGT7HPFzXXtg/MsnteojvXK8AcftZA8u2Dkf14igyQ7vHfnE73crToye66kPOCPBeCsrwBUQ3JC/fVjqIcqGmXHKROD2zemR6NAtJ4hIcmfHAmtBYlhEjBUbk7L1+a3+4VCu+zmicGLXWBASLJ+kGYovsKvLfs7OulSo+OpJmTozWZV099pbtD1B16q9qL8VzqQFftEJOojqBFpajkqd+MMXrZWFvLQpG+GzmBAjZdf4XCU+epCu9qNdN4lMpTsmlMaAshNPwzk6etvw9HcAP+Srz50vFOQ2CC0fezEwcOTIGh+hR/LjI4e3e5gR1q+su9BIHbRrIrdJ+VU7/drBP0V1ts7rkH12V81HGCywcIvdUYN3AnzXHQDuOJCkqB6cgyN2abPA5fda7vdTG+e8Y6nPOQsTgRLZK6V2X2O5EVYkIr79HqFjpt4e+VZ2CRkq8uOoWJiz+cdmV3hycW+dBcScBOsECZQ1k4lvRdOX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fdfAbbArMKmmE3/rBTtxzcl/uoyQE3yMVGUGmrsCpoTc9RCHvZyKuCE5HSn8?=
 =?us-ascii?Q?I1e36PvBaYWw4y/nR0htNL+AHZXwsp4SFeaUBGmc70LELCUT9E6yDarDfsQ9?=
 =?us-ascii?Q?uVLEBCaAhYjnE6uGS7SW+Ha3qZd1IfNVLDgT2lXNWaHKnXJbD6phMYFFZXN5?=
 =?us-ascii?Q?KMwkV+VnuiT6RgJvprVi/2GFUuI8czd7K6nlVXnnrzmdeE/Os4/W51YHV1kf?=
 =?us-ascii?Q?dhxFjXYcWLsKDSNT51HpLdDNvq9WseQprnHnoQHTZwYHw3RqOB46YyqWzSAM?=
 =?us-ascii?Q?+3XnzCE8zNbJZ4EuwcL0RQ01pMaaCqEl1voNJgManfXJugIHEiXvAp5FgWwl?=
 =?us-ascii?Q?hFDp7NEpzWBuGcfEcF84NOd6tHg2QYc1BZIU/gXwACtA9eCVCQWKvDgA8vCN?=
 =?us-ascii?Q?Td4qItzdExYpeQykPUL8WasHn/5dfgQjEbJ10oe/GPlmXF+RGx5szFnOb/fW?=
 =?us-ascii?Q?mL41GiC5agAm25peeDOiRJP/5LiXqUdlIdnUQLf7nnSiKbfzp07A1CVuVbkP?=
 =?us-ascii?Q?Fdb4tO3BS2kyNKU3v8eL98iOsaULcsJkIMt5LBR5a+HBY8SD/EYYJZKjLsWb?=
 =?us-ascii?Q?ReYQxDzJHJvdKGGVA5wvAn9MwiMU18ezYFwnWrwsppVN77V3OHwDQt5FCeat?=
 =?us-ascii?Q?8pO8b1kgvTDkTtOJu7aa7dTZ6By34KQiDFuSpCmgjS47Xd7/1ng1lFeHlUN9?=
 =?us-ascii?Q?CG5QeMmNuG9iobRek8x2nNxjRsPx4R2oYpAd+cbO8GMUsvxhfldVFurXITmX?=
 =?us-ascii?Q?rKmZ+6nPOi/dBAknERjmmjDsGo6DHov8sWVnKi+8SXs2ShpZ8zXhItkU98e3?=
 =?us-ascii?Q?ytH7BgJ+/veTs8IsxESIu8bz51mgjz5Fbs94EqCvJyBniSpUxKnzC5bKW20P?=
 =?us-ascii?Q?rj59K4YPf+4DM9VbGRJP6v3M+U+bLgf0CHLcQqZaP+IXrVBN1ALZEkrm/wEs?=
 =?us-ascii?Q?uUBKshGZi4gw/+SlgtCsnv5LpVllu2oBL43e6+YHleyoeLkuwcPYVNuMLjMT?=
 =?us-ascii?Q?QOCQMbzgIF8hLdwoJ1g1Ob33AzJo6jqChQ3lBPqa4wlC/4M1bB6OWIseI8/b?=
 =?us-ascii?Q?xZPaxmNGffNaR68vEY8e0Rsi5g3GSy62e7Zj+wqpzsmoc3WD/sA5pmWx4/9h?=
 =?us-ascii?Q?LqVyXDSeJjUOEjNNEoY+dVnQ0cSwqPy0OVuiICsdKld90/+iZuNsMkOgIcpt?=
 =?us-ascii?Q?1wCyHyp/fUEIkHzoCbEsr67RFxySLS6TYZY+mqUH45TyZReVk+SECvrpYBxr?=
 =?us-ascii?Q?gGVvr2LpEBsUrnBGKxSKOrSeU2JtC42mJQR+aT4gFXkKm0LC5+Fd1cQvExBi?=
 =?us-ascii?Q?HNJ1on1naUVD6gwz9yoax8KdJL+ub4+FrEHxe0XI2Z8Xzfowo0Szd+fod3dp?=
 =?us-ascii?Q?tfaKltK5838nYB/j8ItoMu5KsktKcLJAkUZkp7e0jvetUW83TzWU0cv0c9kV?=
 =?us-ascii?Q?wcvp5nNi2sgxTfY3n+1/foNAwfD5C+vb4yBXk3Z4KetJWABHOFY9opn0MdkE?=
 =?us-ascii?Q?bxaPrW8zsZlDXI5Ws2PSIpiQPgLPXcf84LWisw5eN2/SjNPO48CiDrdPLZ91?=
 =?us-ascii?Q?H4ic+mwkH/pvfK22C3+Y2lHvhNutsACaPElsc+lMWm4pG5kwObMbE3WyLZHS?=
 =?us-ascii?Q?URWB/7V8AIKn64JxIK3F2bC3341B8aT3W6dhNnXp4AVPlYqgyWZJ720CeSSi?=
 =?us-ascii?Q?rKbeUPV76Xh9zaeakb84jCLqB+CES7DteI1zTZX6ccV8JSqilwb0d4i7/5rx?=
 =?us-ascii?Q?G3T/wtkPjw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de2c4f1-df6e-47e1-eb19-08dec63e0946
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7992.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:44:48.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z55srGJRne+5sNe5AkkB1Tubnr6edQJbPqtA5Wl6OxSNrpqPp/y1w/C7rmmE+shh3nN5oajFXm8z1RvIh+tK1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-42698a/1781019893-18D67F3B-00693EBD/0/0
X-purgate-type: clean
X-purgate-size: 7774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4419661ED4

From: Ross Lagerwall <ross.lagerwall@citrix.com>

New struct for interal use because Secure Boot code needs to add an
extra field in a future patch.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/common/kexec.c       | 23 ++++++++++++++---------
 xen/common/kimage.c      | 17 +++++++++--------
 xen/include/xen/kimage.h | 14 ++++++++++++--
 3 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index c920bc6d8a..00346fe616 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -916,7 +916,7 @@ static uint16_t kexec_load_v1_arch(void)
 }
 
 static int kexec_segments_add_segment(unsigned int *nr_segments,
-                                      xen_kexec_segment_t *segments,
+                                      struct kimage_segment *segments,
                                       mfn_t mfn)
 {
     paddr_t maddr = mfn_to_maddr(mfn);
@@ -942,7 +942,7 @@ static int kexec_segments_add_segment(unsigned int *nr_segments,
 
 static int kexec_segments_from_ind_page(mfn_t mfn,
                                         unsigned int *nr_segments,
-                                        xen_kexec_segment_t *segments,
+                                        struct kimage_segment *segments,
                                         bool compat)
 {
     void *page;
@@ -997,7 +997,7 @@ done:
 static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
 {
     struct kexec_image *kimage = NULL;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     uint16_t arch;
     unsigned int nr_segments = 0;
     mfn_t ind_mfn = maddr_to_mfn(load->image.indirection_page);
@@ -1007,7 +1007,7 @@ static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
     if ( arch == EM_NONE )
         return -ENOSYS;
 
-    segments = xmalloc_array(xen_kexec_segment_t, KEXEC_SEGMENT_MAX);
+    segments = xmalloc_array(struct kimage_segment, KEXEC_SEGMENT_MAX);
     if ( segments == NULL )
         return -ENOMEM;
 
@@ -1109,9 +1109,10 @@ static int kexec_load_v1_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
 static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     xen_kexec_load_t load;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     struct kexec_image *kimage = NULL;
     int ret;
+    unsigned int i;
 
     if ( copy_from_guest(&load, uarg, 1) )
         return -EFAULT;
@@ -1119,14 +1120,18 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( load.nr_segments >= KEXEC_SEGMENT_MAX )
         return -EINVAL;
 
-    segments = xmalloc_array(xen_kexec_segment_t, load.nr_segments);
+    segments = xmalloc_array(struct kimage_segment, load.nr_segments);
     if ( segments == NULL )
         return -ENOMEM;
 
-    if ( copy_from_guest(segments, load.segments.h, load.nr_segments) )
+    for ( i = 0; i < load.nr_segments; i++ )
     {
-        ret = -EFAULT;
-        goto error;
+        if ( copy_from_guest_offset((xen_kexec_segment_t *)&segments[i],
+                                    load.segments.h, i, 1) )
+        {
+            ret = -EFAULT;
+            goto error;
+        }
     }
 
     ret = kimage_alloc(&kimage, load.type, load.arch, load.entry_maddr,
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 018ef66451..2c3fd3c3b0 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -86,7 +86,7 @@ static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
 
 static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
                            unsigned long nr_segments,
-                           xen_kexec_segment_t *segments, uint8_t type)
+                           struct kimage_segment *segments, uint8_t type)
 {
     struct kexec_image *image;
     unsigned long i;
@@ -211,7 +211,7 @@ out:
 
 static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                                unsigned long nr_segments,
-                               xen_kexec_segment_t *segments)
+                               struct kimage_segment *segments)
 {
     return do_kimage_alloc(rimage, entry, nr_segments, segments,
                            KEXEC_TYPE_DEFAULT);
@@ -219,7 +219,7 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
 
 static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                               unsigned long nr_segments,
-                              xen_kexec_segment_t *segments)
+                              struct kimage_segment *segments)
 {
     unsigned long i;
 
@@ -669,7 +669,7 @@ found:
 }
 
 static int kimage_load_normal_segment(struct kexec_image *image,
-                                      xen_kexec_segment_t *segment)
+                                      struct kimage_segment *segment)
 {
     unsigned long to_copy;
     unsigned long src_offset;
@@ -722,7 +722,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
 }
 
 static int kimage_load_crash_segment(struct kexec_image *image,
-                                     xen_kexec_segment_t *segment)
+                                     struct kimage_segment *segment)
 {
     /*
      * For crash dumps kernels we simply copy the data from user space
@@ -768,7 +768,8 @@ static int kimage_load_crash_segment(struct kexec_image *image,
     return 0;
 }
 
-static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *segment)
+static int kimage_load_segment(struct kexec_image *image,
+                               struct kimage_segment *segment)
 {
     int result = -ENOMEM;
     paddr_t addr;
@@ -799,7 +800,7 @@ static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *s
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment)
+                 uint32_t nr_segments, struct kimage_segment *segment)
 {
     int result;
 
@@ -824,7 +825,7 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
 }
 
 static int kimage_calc_one_digest(struct sha2_256_state *ctx,
-                                  xen_kexec_segment_t *segment)
+                                  struct kimage_segment *segment)
 {
     paddr_t dest;
     unsigned long sbytes;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index ad52551ba2..258349d774 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -18,12 +18,22 @@
 
 typedef paddr_t kimage_entry_t;
 
+struct kimage_segment {
+    union {
+        XEN_GUEST_HANDLE(const_void) h;
+        uint64_t _pad;
+    } buf;
+    uint64_t buf_size;
+    uint64_t dest_maddr;
+    uint64_t dest_size;
+};
+
 struct kexec_image {
     uint8_t type;
     uint16_t arch;
     uint64_t entry_maddr;
     uint32_t nr_segments;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
 
     kimage_entry_t head;
     struct page_info *entry_page;
@@ -44,7 +54,7 @@ struct kexec_image {
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment);
+                 uint32_t nr_segments, struct kimage_segment *segment);
 void kimage_free(struct kexec_image *image);
 int kimage_load_segments(struct kexec_image *image);
 struct page_info *kimage_alloc_control_page(struct kexec_image *image,
-- 
2.52.0


