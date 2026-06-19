Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P9yZEur0NGr6lAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB66A4700
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=uAANTgeo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341760.1602133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU01-00008X-63; Fri, 19 Jun 2026 07:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341760.1602133; Fri, 19 Jun 2026 07:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU00-0008R4-UC; Fri, 19 Jun 2026 07:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1341760;
 Fri, 19 Jun 2026 07:50:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzy-00083F-Tu
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzy-00Dy3W-9J
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d6-e002-0a2a0a5209dd-0a2a450cca78-0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:46 +0200
Received: from [52.101.125.75]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d0-94a4-0a2a450c0019-34657d4b8662-5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:46 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:44 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:44 +0000
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
 b=Gp8JA4+kxIF32ysJQ8pj0FBqzgfOJxHMTpPvzuhbcMH/xALe41hDFfdN3T8RjvQoSq61rFdEZkWNurhU2kB0TPFbTDCeOdw6h6Y6x5RYYKuGs6g1soraNLtyZhkOsX4Ypl9Ukzj/p3m6iOzXfSzcvFrEY1RaU4kEEq+nJ9PnelDIsDsoz4+4tR0GFg4S5yMM+oV/3uZE11gsCrJF2qFKz3GSpemIFbvttFXO7qqWR5GF3NNbWzphXDrlFCI3y4HxAjjny8HGqpHwxU57/y5mwO2Zj3jKMIjQtm1ohGy2/8zd85Q+a8FdP+g/rmgxPA2DGEATAhtE9eDOXhxTMss/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EUdtkaW4UdmfPYk5bJ/HzEBP4a7cC3lP5IBYmpCtIg=;
 b=C2lq/6iwTRplQOi4X9AXCtoZK0Zts2cEMwElkKxpUi/dnLnk9ZjmW9ftpK4tO5ntNJ4GX5ySpL1dB2/sKeoN4SYWXNFfttw4DxMJ7kUuLctQusgcXx+39lOXPtA3x92BczTV74f8St5YMz5qZQtYpWQYzg1adHFBv9mnuD6BgY2+vvUUK/dPM9llWxr9LNTFLl6Uy5ID/3mG9tV49BmoPo4ilb7ChU+RKqEWEHAlu5AUJoQtbBkbc2CQUsiL1LFi0mp1JkiBIs5Zv+825F8vA2X8rUqvzjKKL4MSgxRGbL/wICgUF281D5zLi8Ql+naANnCX6f7mWy2y6tEYuCgSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EUdtkaW4UdmfPYk5bJ/HzEBP4a7cC3lP5IBYmpCtIg=;
 b=uAANTgeoKP7A1iUkLMEcIIueSKbG9wrDy2Gf53VU38hZIZN/mBQLOEJA7ML5sMt5B+tQEfv2UjQQfSzLriULDdsFERda7dsJlIRIcsfwfSz9d99Tyx4B086ASMntndsN2ayFsweQbxRL+MeeoUkKoLsnK+oStyVkGDpY5bw8vxU=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 16/22] xen/arm: Use dedicated function for Static SHM Device Tree creation
Date: Fri, 19 Jun 2026 16:50:04 +0900
Message-ID: <20260619075011.377116-17-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 7409005e-b715-44c2-0586-08decdd777b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HOgZWb9cuHFJ73YwZHSDxytktqjhRCaROoykrLUFI2meZ1/5u7ZpJHzOFculLQi5GRN/FOgy8wZarlRjEtwZfLeZBZEN9omUaAJfMDikBjWxLTMhNB5iiFVLlNjb8HkKR4T1L4uQ4E+drzGNraWrGbgZGVpNquy5hCXM/rmpZ6fsRNuY30VOaCxWcRghARA+mhOEg1apCEJ4PKEGZAOPrmQMYcYEsoeF+dQudXU+zozgin0T3Y5tXtfWUPdub2r+JQ4/Ke99hyemb1vMNu0h3RKSkJAmkqnqRENTeFRZeuHgjfiZxQUsKshrVo82KrDukVngTu9SrgdW3YmqKI7m0os58C91jZleXbJFdo077SGdEC9pBZoOpHk1Kfiqz4X2EeML/uxMwSgqkRDHfUD9o9w4sDxb1ZE787WhqzGq+DiZe/cPyyXv5a86d71BK26qySMsfiqXpup5Pgc6FjDzfvAEYsbSJAomFs1MWskkoZgR9yQIrda3MQRAraR/qBGVVZNwQSqpqxUD3AjWIDLYkV+KudrLOxZlG2Qp4P+fOzCvjvHeLD6g9e89YbNGY14vSKSEziaqs8kipV30oYUF4NxLdQH9iJNL7mtMMSgaEmxwJbUm/NmT+lsv3eo5tnvrmyG2YkGg5iuje6e2EOKyOkCcL5GiAC07Q9WUfl0wTqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+ozkdHR+q9z9xG8RbJDnw9HDjdsoTvONPvBlRGnfj4+XK0owX52bQHnmLJ0?=
 =?us-ascii?Q?0feyPxNrkxDKC6qKPt/Fzw6kAJIGzHtKa/TECPV3i+2LTmYaOr4oEJIq3UUB?=
 =?us-ascii?Q?nZCc/9uX42lC4aad+QRlpwVF8z4eAxdt/CIktAI/4BGbY/CQhWbrmcsGWxFb?=
 =?us-ascii?Q?/qX5QsbQzpI6sYYleE8zguZqDGWow1sLKXCrdnbkcVBtojobi0YUqH3kcSj/?=
 =?us-ascii?Q?eZVC3kUUbZINCC07edkl4fMtzblLBbFGlxGjtZBoJujepMaZ/eLYUq+ovm3b?=
 =?us-ascii?Q?qncGAlZpf55k1ZmGyTfPf3/r3VhQDzu7ektlAqhCcJn/AiYUV2z3L2xN9Toj?=
 =?us-ascii?Q?n1r2FqYa90YYmpDuW/BtaHrxyZAI/gAg9PovA3s/FVvqpS+sFGUhem+EcsvV?=
 =?us-ascii?Q?yLIPjBb8LyJLFx0cQCkBfFT4Hly8i2Eo0KMawH9ufjLlOyvPN2wAL0q8g4wh?=
 =?us-ascii?Q?it/pBGsdh+FqgGdAJ9gtRSlkYgd+mB9SAz0Y87HgnbRQOjYf9ijkNTffwCKR?=
 =?us-ascii?Q?JNVjo3HI5YBlYojQJd6WGhKdT5plfiR18bH8ep8m/3HPhT5S48U5SIs76Hcm?=
 =?us-ascii?Q?+fbHaKsjFUc2pdmyqJsMip1hLXZgED3LNd3cmd2vBQd11ZJpV1U3aY3gQsHl?=
 =?us-ascii?Q?EmR6shUm17ElTe63cKIjxoIksHqrJLcp/EoINCEjNRwTI5Vgm1CacsGpGiJp?=
 =?us-ascii?Q?1AQnqbnApOykBTeADVte+zJcfmRLaMRs8ETOaqOzjM5LPJ2uMm5FcoPRqKjr?=
 =?us-ascii?Q?biwwlti9pbcvHd2wRKfD9DpnD2jujKdSNdv2vWvbRwBNGe/q65YfIzj+blUW?=
 =?us-ascii?Q?WpzH2Emx0mmdOb7oNFKEkVcjmJXylW7h6yzAQrCudrQHe9vxOKcPujBWGyrx?=
 =?us-ascii?Q?Py+iLiI4ZM5XCyAHBoJTNIgVkpWas2N8MXiC3Awf8mVE3l5yK9iwozqRQ804?=
 =?us-ascii?Q?PJsFHD8ecnVRv98/VJKVoEtKaDDD8CMkV7mL1bVM0Ba64UcIbCab6WX4Sijs?=
 =?us-ascii?Q?cRO2YTj61/8aLNv+GpkAeHBscpm9C6XyGms+pLJGTx90NzDszNkyeVmQY3g8?=
 =?us-ascii?Q?nG7qb7e2rS0UiC8weqIO7heq23PFtRzSxkBq4cTix7zVGamULNPQ1SznLFBo?=
 =?us-ascii?Q?6oYDkD9307MMteokjWsyz+8ltXT/mfpnPhaiei3NN/6fGMygipVGGGAqwICT?=
 =?us-ascii?Q?+vu1Ho4deBuCTQsTg5u1Svxnc6lTgQK67sqkABiYEQiWUwM2feiSPeQ786DN?=
 =?us-ascii?Q?r74PO4KICzLb3azABrAjJJlVynNQk0VkhvzHEB7ichvDvyVwAh882rflT+W2?=
 =?us-ascii?Q?AT6VluV4pF+uwmBngGP5MFZidciGnPErkhUERDSEBSFITxrOYNzeBLY6KbJt?=
 =?us-ascii?Q?q1n9lHaMwQGbMoUevXXCenftadoU1+KPvxWAFREWeVrjv+6NYXDv9dRep5ap?=
 =?us-ascii?Q?hdkJotF7itqWqbtyqdHaBrw84EaRrxSnLjpH8X41UuJYP7VunRPb3GtAx0aQ?=
 =?us-ascii?Q?uwTFQehHpG+Bnybh/YNl7e2YMgwjOJ2EaY92KH0W6rgKCPEyJWPJ7l0ok8s1?=
 =?us-ascii?Q?7JQXRPWC3E365x9j8SLvtj7T9mLyoiU3erFisHxBCmTborviJMA35wMayofP?=
 =?us-ascii?Q?g8xcO5gymYsIke4w1OsQdpYqGLKRBGhcGPS9tsjwIXwQNI7gRC7t9rVmZNOZ?=
 =?us-ascii?Q?7wsCzzioVZVryevZVe4SlC+TUm+SjOWjeEGUqq0Hy8GFmZowg6Y7yrJUoeGz?=
 =?us-ascii?Q?w3NFeKYFt7e02Ml9vIsShWr2f5RFKeg0GgrtCzzbqVhdQ2HKQu6vaYwsPFec?=
X-MS-Exchange-AntiSpam-MessageData-1: TqHC9oKjf7KDZg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7409005e-b715-44c2-0586-08decdd777b9
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:44.4322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfqlW9+iICzWj5k7yLnPcrKfRekd4i+kXeH6WrvEie/ezE/3qJDsNtfJwsS0njSylDGFKun8vfI6GHWQq4+FTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-d25034/1781855446-53FE5ABF-9A3D01C8/0/0
X-purgate-type: clean
X-purgate-size: 2934
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31DB66A4700

Use a dedicated function to create Static SHM Device Tree nodes instead
of reusing the generic memory node function.

Since the memory banks managing Static SHM repurpose the 'type' field
for a different purpose via a union, separating this creation logic
keeps the implementation clean and significantly improves maintainability.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c           |  6 ++++++
 xen/common/device-tree/domain-build.c | 21 +++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h    |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6828cfc46a..7d32249826 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1815,6 +1815,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
+#ifdef CONFIG_STATIC_SHM
+        res = make_raw_memory_node(kinfo, addrcells, sizecells, kernel_info_get_shm_mem_const(kinfo));
+        if ( res )
+            return res;
+#endif /* CONFIG_STATIC_SHM */
+
         res = make_distance_map_node(d, kinfo->fdt);
         if ( res )
             return res;
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index c3452a4037..16924b9645 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -576,6 +576,27 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
     return res;
 }
 
+int __init make_raw_memory_node(const struct kernel_info *kinfo, int addrcells,
+                            int sizecells, const struct membanks *mem)
+{
+    unsigned int i;
+    int res = 0;
+
+    if ( mem->nr_banks == 0 )
+        return 0;
+
+    dt_dprintk("Create raw memory nodes\n");
+
+    for ( i = 0 ; i < mem->nr_banks; i++ )
+    {
+        res = make_memory_sibling_node(kinfo, addrcells, sizecells, &mem->bank[i]);
+        if ( res )
+            return res;
+    }
+
+    return res;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 671486c1c8..6a809f3f86 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -31,6 +31,8 @@ int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
 int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
+int make_raw_memory_node(const struct kernel_info *kinfo, int addrcells,
+                         int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
 static inline int get_allocation_size(paddr_t size)
-- 
2.43.0


