Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HZCrBRtSOWpBqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685ED6B0A6C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=oahH6H2m;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343889.1603124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgP1-0005QP-CC; Mon, 22 Jun 2026 15:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343889.1603124; Mon, 22 Jun 2026 15:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgP1-0005Nl-8M; Mon, 22 Jun 2026 15:17:35 +0000
Received: by outflank-mailman (input) for mailman id 1343889;
 Mon, 22 Jun 2026 15:17:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgOz-0005Jd-77
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgOy-006hPz-Ja
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a39520c-bab6-0a2a0a5309dd-0a2a4502d4ac-0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:32 +0200
Received: from [40.107.208.44]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a39520a-fdf1-0a2a45020019-286bd02c8c05-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:32 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:28 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:28 +0000
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
 b=jZgDUZgRu5yd2xo7lyogtHif1/s5+Nd+wTEVTCC6yv7458SR2mNmpzsYkkumLkW5TjzlDF9XFeF7BAETKknkOlFAJZtWM/IP55pJAimaz/m1AbO7preO2hwnR1G4NbuH5C4qykTT/PMbXAvczwsRKvQJmxwC/AVIWo0/ka5gSeVYPhp5uDC0HjADCU2avJdR/0isqA+HmaCfMwpIbgXdX8CJM9OZBpkPGDEmP7Q82N8Tct3hA1nsDINsRMkyxz71melPkmETH2PuNsbNwHBFC9rCnycF21kXRmLgZbxE8EdUX7zm2ZEU0z9RhPBivtYvV29DgoGY8ZA3gGY6/YAfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8wWS/QFTT3jxmNODw0M8pTnOtiDA5oLNhuUJci4u7U=;
 b=AF9WNUB5C9WAJI8HOU0EaE6Y8N81ToKIvwmaAEvL+Yq8estFmkn/gNL0Li05Ph80nmLoGsgK53VQ6LluKCX510wPfgcPucV0uE8+OviGYZFh0gBwv/IB9m+6niU20Byi6GWBKQW4b9rXvfbGkI1cbU3FaVfT2lti28rkZ0DiaeRk9jbGntm9pTR71bLfyaF52gDP6VUa8Pni0JHu2kSfPqzmLEWI1xDUiMZsbNTJBUn+57hZBtx3u4U8WxyoXRGlyJ1QC2B0Rk9Iqw/E8RI9kiGlMvo6pjg3vwtIGlqSJKo/2qKvgOFp+flftu4s6yUAjulUy4zH8dqTX2hn7jdgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8wWS/QFTT3jxmNODw0M8pTnOtiDA5oLNhuUJci4u7U=;
 b=oahH6H2mKcsu831UvkQGc0Sng4MQubGqB6wYvR2cO/qmdO/mjkr5z360CIc1AoQHlHyEQKKKOnXl9YObpGAjkAL18WmzYjkr1z5ajEvqscxv6BaWPssF1/Hi+YHIynyQVCqICtm1l/EL+EF/8Fd7VePcTZeADtwqRxXKhpPBJ5s=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 3/7] x86/kexec: add new struct kimage_segment
Date: Mon, 22 Jun 2026 16:18:29 +0100
Message-ID: <20260622151833.3397692-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2600fb46-b394-4313-960e-08ded0715fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	EzoiRf+2XyVx7ElfXFPOIwMC+ZD0AE9koothaq0ya7Tpeyo8yKLB9W/k9Bt7y3s5jFqWwN/jmoyJPorszKL303QMAVIYVPPUmnIkynTkW5yOUBKXCU4W30y6/afT8BGrxkiYCI6rIt4fvQdNM9AhRez2UX124XyGQHLuSvioRUTDVVRmHSQR4eYGZFZuphD463zmbbffMI0YMQYTSYFEQq0SB56nl3aqFAbrclolNV2JQXSh1sFmcD2QRSBvV6Fj8NkRtscAeGWS1C+iSy6euiuTnlqIz4BhpB7K9NF7HEoWAzCIeAOi2f9+IC7GtYvy4ESlIlcinn+sE0MG6dNQh+X+7OV1BbRevKjGPUnMpdEeLlhYk1rfFiFZNpzwrRQDgAndoOgqL8n2v5NMQzXFvdRzaZxQmq2zMbyTM80WTysDzKwVHp3FbZnz4EMfZNaVWnGnZ5mTujEYp7zizYexJxCZK5KctuBYQMQ/PEueXixWFTlo7d3z8no6dE0+TdbKeeM6511koRIj5/V75qFCinc+Yo/lqcE0VWEEHiTNHvmOhcEkLNIuDSNlQGLaOz65LP125u4m+uoF+tt6156l2+Hjbp+tfA7VTx/en3Lv8mzf4QF1NT1YnqKF7LCn888iGxGBGrrj+d22ddCQJYm7Q+YYlnZnWUbI48/Ieypr7yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q5zVZjgLBWSf3tvUIS+srba9E1afCQ31szengy39CgMiwIKeTjwvBjQ8SblQ?=
 =?us-ascii?Q?7OO6KdGP/+3obIdPjKXJzI9Jq52UOqWOOX45NgUatQL1LOudcbq3HQ0ubGrL?=
 =?us-ascii?Q?GQr3/CN3nScKo7nIp1zJdEj7PLMVgTUsOjuVHCcHE7rAgdDERzrUYceKKEHb?=
 =?us-ascii?Q?t0GOdmzM2IihM8Spftvaa0aIHekMfYa9rjNmcJZAcmw9OaU70CB0o4CLAbYI?=
 =?us-ascii?Q?sum/mEfECoTozbtwsKnCYAeIrRWbAaoe+GADp27oK71wp3n6J0HZV2yzuTvn?=
 =?us-ascii?Q?OSTs0jrqCHL+SMEN4dro4lwapX06v4B9460Su74uf6VOk6MOOPMABj/7Mf7D?=
 =?us-ascii?Q?kdW4PpFpzMORBPyMGo0XHWgL2oJNt9d1A5IPlHL3IaxGwMxBDBl9opDNUqGu?=
 =?us-ascii?Q?pMoBXfXo+iL44XB52/8+fm+iMsX7syMZ04/O82IbCoKGH8gQXGwyKKeHkIRY?=
 =?us-ascii?Q?OCo/3LOc8lb/RXIchkOBEe1h5KkibKW3CLAQInk+bLiDSb3WQy61TaNrnaD0?=
 =?us-ascii?Q?EK9umAczOk32xD6hjNu9qF5n3Ko3Ja4kOYbA2rrVoA05sio+f6AOSnAIXzJX?=
 =?us-ascii?Q?TszOXEIwuHbTRORB6EgFTUJfAEL4ERdf5MKjCuwUzj+8jPVy6cxpnDSTuhzA?=
 =?us-ascii?Q?lrRKuGEhnO/JvNPQtLpikW8ANhMI7ZQqTg6greFRzT1P0zam1/XmkaSMlWfM?=
 =?us-ascii?Q?mGrbbHXypAd9cTAgOEtWpX8oxLVJjI5Wgi9wu2L1mgfbaPZvavTa1tlA7l/E?=
 =?us-ascii?Q?Sll7ngAAgbUxhVLmacCFCpMpXpOrCBqNPhwBrGjbzN1YdWh3YSWFjw5Hp1QF?=
 =?us-ascii?Q?WtNorzWQa7H4z/WfWfzMaA3BUyTEkrB1/dFlby6je/LAmDZn7WOT9wjIlaM1?=
 =?us-ascii?Q?OqK0xKr73Xza8S72qcwyT59jFjAojt88UE/EAIHWA8HAL+qvG7i/3LGaG7eM?=
 =?us-ascii?Q?cOZxlJ4107WKz+IICsRXTESH81vo6ZnocssrneGVGVyooyFADhKZAXaRRkO8?=
 =?us-ascii?Q?jNnMnkSZVQg7KEXeZmsbEvX5Liij89boUfLW2CHeC0nimO0RREIPv8DQhUL8?=
 =?us-ascii?Q?2l1JEWQRIlBf2KhSXTLUFONFolE1afickSMz5n8RzSDJWGPm7Y4ipatSPMG1?=
 =?us-ascii?Q?Uv/R+WX3LCKJlt7FKmwKWolQYhGPxfxXz0doeCtoD+kVS7/WbTwD+6XBMd9z?=
 =?us-ascii?Q?NDIIn/IPRHJ/+5ibc9Dt2N24k9tzrnSap8DQvuIdZCIqPccoE3LOMoglgD8u?=
 =?us-ascii?Q?Eba9CGyS6nBbQDKHe2XwY+zLw96KgSbaLB0woUFGzQIMw1yORzSfkOOoOxQn?=
 =?us-ascii?Q?H3DbW5DZBBqlYOaOuszJKMmuuIM6sPazHPN4KqLsPu9qiI3NjQ7uuonMwl8Y?=
 =?us-ascii?Q?WY7fxK/gnsT8CKl3acsJt11xXwCS+MnMje/5ySCxu3oBJqFCK4YuxZuPNyOc?=
 =?us-ascii?Q?PYWyXK7hYVklErNDowNusOpdGonWrN2zgbzeIX3cbbwmja0fNJLbsnrEj4je?=
 =?us-ascii?Q?0NtPYuoxdjRQsaesMYmTNI6Qhcppm0ME78p8ZMmIxkXk3hFvVpQqSDyrXsXj?=
 =?us-ascii?Q?bXkurcNoVA3QL3Fr/jdkVS/4qKEZUIvGOC9x1Nm6fbbCco6NpBWOZSiQjD5i?=
 =?us-ascii?Q?EWUDdeNGtMb/lng7O70xDCeREq+DfHF76xLy4WlivaCYbS1NxN2RL2HFF63a?=
 =?us-ascii?Q?a8Yny7oFdfxHgi4ukL1OfzZjZngicH2qA6lpy8BlFj6QvRaVi5HNxActOsIC?=
 =?us-ascii?Q?Kg84sxr84Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2600fb46-b394-4313-960e-08ded0715fab
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:28.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYySxmIoFh0p1HsSpEIcEt4DK5BF2avFOEUspP8hcV5AS7ZSmXn+lkkdgVrL+Wa/P9BJl+9f/L6f5K//ZVr9ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-720697/1782141452-460643F3-658BB274/0/0
X-purgate-type: clean
X-purgate-size: 7964
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 685ED6B0A6C

From: Ross Lagerwall <ross.lagerwall@citrix.com>

New struct for internal use because Secure Boot code needs to add an
extra field in a future patch.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Read into a local xen_kexec_segment_t variable and fill in segments[i]
  manually instead of casting from a different sized type
- Remove union and _pad from new `struct kimage_segment` type
- Swap xen_kexec_segment_t to struct kimage_segment in separate patch
---
 xen/common/kexec.c       | 19 ++++++++++++++-----
 xen/common/kimage.c      | 25 +++++++++++++------------
 xen/include/xen/kimage.h | 11 +++++++++--
 3 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index f31ab3fa07..5caeb19819 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -920,9 +920,10 @@ static int kexec_load_slot(struct kexec_image *kimage)
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
@@ -930,14 +931,22 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
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
+        xen_kexec_segment_t tmp_seg = {};
+        if ( copy_from_guest_offset(&tmp_seg, load.segments.h, i, 1) )
+        {
+            ret = -EFAULT;
+            goto error;
+        }
+        segments[i].h = tmp_seg.buf.h;
+        segments[i].buf_size = tmp_seg.buf_size;
+        segments[i].dest_maddr = tmp_seg.dest_maddr;
+        segments[i].dest_size = tmp_seg.dest_size;
     }
 
     ret = kimage_alloc(&kimage, load.type, load.arch, load.entry_maddr,
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 6e009529ae..dc47306223 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -81,7 +81,7 @@ static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
 
 static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
                            unsigned long nr_segments,
-                           xen_kexec_segment_t *segments, uint8_t type)
+                           struct kimage_segment *segments, uint8_t type)
 {
     struct kexec_image *image;
     unsigned long i;
@@ -206,7 +206,7 @@ out:
 
 static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                                unsigned long nr_segments,
-                               xen_kexec_segment_t *segments)
+                               struct kimage_segment *segments)
 {
     return do_kimage_alloc(rimage, entry, nr_segments, segments,
                            KEXEC_TYPE_DEFAULT);
@@ -214,7 +214,7 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
 
 static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                               unsigned long nr_segments,
-                              xen_kexec_segment_t *segments)
+                              struct kimage_segment *segments)
 {
     unsigned long i;
 
@@ -236,7 +236,7 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
     {
         paddr_t mstart, mend;
 
-        if ( guest_handle_is_null(segments[i].buf.h) )
+        if ( guest_handle_is_null(segments[i].h) )
             continue;
 
         mstart = segments[i].dest_maddr;
@@ -664,7 +664,7 @@ found:
 }
 
 static int kimage_load_normal_segment(struct kexec_image *image,
-                                      xen_kexec_segment_t *segment)
+                                      struct kimage_segment *segment)
 {
     unsigned long to_copy;
     unsigned long src_offset;
@@ -698,7 +698,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
             return ret;
 
         dest_va = __map_domain_page(page);
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, size);
+        ret = copy_from_guest_offset(dest_va, segment->h, src_offset, size);
         unmap_domain_page(dest_va);
         if ( ret )
             return -EFAULT;
@@ -717,7 +717,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
 }
 
 static int kimage_load_crash_segment(struct kexec_image *image,
-                                     xen_kexec_segment_t *segment)
+                                     struct kimage_segment *segment)
 {
     /*
      * For crash dumps kernels we simply copy the data from user space
@@ -747,7 +747,7 @@ static int kimage_load_crash_segment(struct kexec_image *image,
         if ( !dest_va )
             return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, schunk);
+        ret = copy_from_guest_offset(dest_va, segment->h, src_offset, schunk);
         memset(dest_va + schunk, 0, dchunk - schunk);
 
         unmap_domain_page(dest_va);
@@ -763,12 +763,13 @@ static int kimage_load_crash_segment(struct kexec_image *image,
     return 0;
 }
 
-static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *segment)
+static int kimage_load_segment(struct kexec_image *image,
+                               struct kimage_segment *segment)
 {
     int result = -ENOMEM;
     paddr_t addr;
 
-    if ( !guest_handle_is_null(segment->buf.h) )
+    if ( !guest_handle_is_null(segment->h) )
     {
         switch ( image->type )
         {
@@ -794,7 +795,7 @@ static int kimage_load_segment(struct kexec_image *image, xen_kexec_segment_t *s
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment)
+                 uint32_t nr_segments, struct kimage_segment *segment)
 {
     int result;
 
@@ -819,7 +820,7 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
 }
 
 static void kimage_calc_one_digest(struct sha2_256_state *ctx,
-                                   xen_kexec_segment_t *segment)
+                                   struct kimage_segment *segment)
 {
     paddr_t dest;
     unsigned long sbytes;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 8ed89d4fa3..0841b6f321 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -18,12 +18,19 @@
 
 typedef paddr_t kimage_entry_t;
 
+struct kimage_segment {
+    XEN_GUEST_HANDLE(const_void) h;
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
@@ -44,7 +51,7 @@ struct kexec_image {
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment);
+                 uint32_t nr_segments, struct kimage_segment *segment);
 void kimage_free(struct kexec_image *image);
 int kimage_load_segments(struct kexec_image *image);
 struct page_info *kimage_alloc_control_page(struct kexec_image *image,
-- 
2.52.0


