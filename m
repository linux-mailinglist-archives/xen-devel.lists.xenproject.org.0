Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spkWDur0NGr4lAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290ED6A46FF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=KFbxb2eL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341778.1602154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU06-0001To-EO; Fri, 19 Jun 2026 07:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341778.1602154; Fri, 19 Jun 2026 07:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU06-0001On-5n; Fri, 19 Jun 2026 07:50:54 +0000
Received: by outflank-mailman (input) for mailman id 1341778;
 Fri, 19 Jun 2026 07:50:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waU04-0000zb-5k
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waU03-004dWx-Ig
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4db-bab6-0a2a0a5309dd-0a2a4509a6d6-0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:51 +0200
Received: from [40.107.74.95]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d7-4999-0a2a45090019-286b4a5fdda3-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:51 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:48 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:48 +0000
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
 b=TkwvEVvyMsy+LI73IDyrjrDFhHj4Yus+Ney73trNKHbRh+aeESnw42gpzTSDp3aOwWRkpD1U5/z13uCOxZC/OcdoTtbaicZgTE+znu0GQ4mfisLBHKtu4pd+tCgsHB8SuG6XD1G/tef6IwjXvULboOITa8YN/pI8kS4D6rLcQ80ILkVO37Lq93aJ/OvKAQFv0Q1qwnsul1nfxaqOFATZ7EZ88KDWcIwAi2sJ8QwAIEvBYpYYMSh3ds6yOlofgMxpXnpagfZ8USc8iTs9bIqI4H+ZeR49TvFKesL92g/CyxLWmlLXHnv6VBBgt+d+qMrxaWyMwgCMFAvbFxlwT/PiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE4gf47/RBMmpv7EH5Y8kPK1UQU4p2tJ9S1/Os3vPHo=;
 b=HvrzQkKHzZmPmnun+3zL/cTZzsPbZSUzVRsKYIvdfQbVBucfOm/WdS02WE97fXsMCJ/S/oppVyaqjN+F59e5FjPPmDECRFwOjTzCNdLyNgwSB94B/sg118lTiXkypBZeHX8fPCblbqHegoMBvVjLAl6DlCMTckwr717lYbUxpwleyuNs2FJkY7zJo+lFntF/IDDcTU5LKZY5hitaYFjzIXUc4P9uAfTH5SoiWVUB7GjX70xHf19bkeGgHZiDjIRsRBe5t8AVZZEyTFEhTxgDDHxhzzcwo/wP9nBy70wWqCfeE+yhZih481sQRAu5CyTZLEwdTvpKhezEdUy48FOdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE4gf47/RBMmpv7EH5Y8kPK1UQU4p2tJ9S1/Os3vPHo=;
 b=KFbxb2eLItC3QG1cJghKK+9xRpMO0P6etAP5mPWVAjU4Tn9VhwHwb7BK6HTojOvoHlOdjiSe55CoryuVZxdtqqIj7ZmxfQs0jbneED32kDRoBXRZ4bCTsG7zew/OfocTdkU4MfEhPAv7Xo3y70hzRHCufbeQ4rcdI5O1u1E373U=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 18/22] tools/libs/guest: Allocate vNUMA memory from associated pNUMA nodes
Date: Fri, 19 Jun 2026 16:50:06 +0900
Message-ID: <20260619075011.377116-19-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c86f4d4-2fda-4861-a9a6-08decdd779fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Fap9pP+m8eTufyzAXJPEKjhI8pg70WskgGmAGX/cAmzfPbgA5xrzofNuk+c8Zo7W9D59PPb0Bwj5+UkCehsq6vzKM+A9EH65NFYeQ+7Rdwfg+GkNg7Lyh5c4tHuFs5mJU/hCD7Uf121zAUrOHCNw4h5c1GnIs0IN1x1ItJfLS61w8KW3Kln6MvY0c9KUaDnGUjJHHJUFCxxFVanMIE6xUwy8tVxKcA/Z4JMU/AS9oAtmah5DcIT2DQACOa2wn2qTu8jzgT90t3z+9RVAkddOcGKNyqsCnx+/Oj35xltvdunaJvcxmziDYWoT2/e9+B0bkfWVny3R42ZK5i36/ob9Ddy7cFWVQqxmhVCBBGLW1cquD810ZppTZ9l1PFPgqTbjtmfwnMT0uFzst/jnrFtZYp39tEXT2QMikKrYN62JD0p9hpfdDq/DgZovMxzrBqBPykkLmdzOOQwXrlTuOzrKj9eYQhTiO76bip+9jRrw2KmH1XhjwoGT56qoYp2M1Apa3cx9EukMNa5YM1grVKwd+Wgi+I2XyvdhlGGoFMSyx9vMTSmsnsSiljo0FtG9HuZYIdiO24kQMUvbPzxO3uNW1OUJi8xkgMYCM/tc5yL6qQrJ+540Vf1J4EvRJlNliH0CR5xoNEOfvNqpsLHaJIFswltfVuxlJEG1prkwPscZFiA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8miG2rAIjvgt+vDIh7XVrUQfRjWTNMIlgyfaG6Y2eH/zTY5gQL8iKqonAA/u?=
 =?us-ascii?Q?6r0/ViGnfVk3SsJ2KLbSvYhaldYQY0RP0PdUrWrB/878SJlzCRP1aObJLy2T?=
 =?us-ascii?Q?Ls9kzOBQM/MAGlnwyPf4oP1QSqQtI4o8KBPOHkh10qRDU+rOP7/JHv1OT1rc?=
 =?us-ascii?Q?uqFcxMiLi0c7r5lLSuPW1obJZo8V3g36hVC2gRRjZFHLHcTNTBG3SSeKiI1z?=
 =?us-ascii?Q?7iFfGxT8W7vux2Ef21NzwD0PJEEew4feH+EpB2/29aX7z1OKn8Ilo8G11aR1?=
 =?us-ascii?Q?y9hLBdK/aBv94ccyzA/G6AcY1/5U0CfPHYuQACZHqIy53cC4o6B26qxoGbMe?=
 =?us-ascii?Q?BP3YYGDLKt+MVsRWIYa5MBi9u44cg7KKx9K2Ci4id2UxcwiGggqkqElHAJgz?=
 =?us-ascii?Q?GpnCH9Rw3PQDq614kP4Pmf9J6jEu8j0dRyMW/VZlYtUcJ0QW1gwN8AqAHn7R?=
 =?us-ascii?Q?hnR3GWiaVJ2a1KU5liaGBJI8rP4kG2wpHmgnW6WchTDbLw+7ZL/DDenWRYjz?=
 =?us-ascii?Q?snjavGO3TJbUwAkChV+/cSS/xJEpTDF42Sj29ctA8GQHR80vBnsJQvu3rbCC?=
 =?us-ascii?Q?O//N7G6TimbyTsmSYq28cCZtOkj/AFte0L+lkb77qesqZQ3v3tNYX6eNowpz?=
 =?us-ascii?Q?r/0TA7endjingn/qlL2OvVbSo8br/N/HY9R5Dl/xadR4Y9I0dF2GQK3wc644?=
 =?us-ascii?Q?AQ8N5HMSvRQjVveYhGMlMZDam/EyfpIpsa1rwU+fxoTI0ZvzjJqzWn4LGwbs?=
 =?us-ascii?Q?Jcuj7T4bfTsdYQruC5jP7+jSR1qh+OJX+toX2oklvgvFmIy8B7kMWh/L/GgK?=
 =?us-ascii?Q?ZOYkzvc8at08Vr9jhsfdVHS+5GlK67AsNjgYT4tNL0go+LquxgYCUjHY/MQN?=
 =?us-ascii?Q?y9ta8GRe1BOviKkxS7uPDOscZysWkl/uTe80kiMfs0tWJfYvcUNt96cIJ3M4?=
 =?us-ascii?Q?5lr7iZHb3nhW+QiI/nH9l2YZAhBZv+iszp23ZDAbS2I0uRIkZAKcXc/S72ct?=
 =?us-ascii?Q?UKwm1JEpMBO/Tvul2qhh0GAe2ZULcv8SGbcMAl908SgDIj+9TL1GDQviwhdl?=
 =?us-ascii?Q?njH2HGznbKOeU81Nq0RQ2DKZJJccJSKYeeho92Yv3GTO5RakQx7OoEvq0Ne0?=
 =?us-ascii?Q?Xax8hOV/n9lnq0GlmFZzbHwyf53V98Mb0G06kzsf//sTZ1MqSzGUZmcCqj4/?=
 =?us-ascii?Q?Mh5ZH6guM8Fyoc0Kj96tiD56WGrHaTNzk+LqqMhUpGTKCdyBRO/aU4I1mj/1?=
 =?us-ascii?Q?V58BUSdjtjRDaX7vbQHnpWwGCbUqQgK+t9EsGP4q/RjmYW7JUlZ5csT7iLk5?=
 =?us-ascii?Q?yw3sm0onoIhHpdLdQEgkeDZ5gv6jpfcd6n9iPYvUxuUL8Megwra/NNKUQnz7?=
 =?us-ascii?Q?RdJDQkI5yUTkJxOs1OZKfTJUtQ/HYK2TrIVyQtvJim5uDR0dMt7ZhFkQiRen?=
 =?us-ascii?Q?z9c8JUBabt6Joa1rllLw1dlFhgUM25RA1mwSaldBPqApslvhfx++humEOxLT?=
 =?us-ascii?Q?U2DP6aM10cUmOezu+m8I1UyJUupL+hhAsrzUyQrRt04ipzE1yu4dIIR1OYcK?=
 =?us-ascii?Q?SpLllHA66g8S2UhKcnQyAah0dBTD105r1IBrig3URiNVoYxsj7QSYMz1LJsV?=
 =?us-ascii?Q?gBI1/ou0C8BBoYIyrZxNcO2+cY0ort+79hnOaN3Yj9aMEWKWAxJ+oqBN+QUQ?=
 =?us-ascii?Q?kUWNJZUvoCQ66x1KYqB3MJgnKQBUb4hGeNPOENYQPdqx9N6zMeAsTLUEyQ/N?=
 =?us-ascii?Q?FaEBNTmnzUm/fn0u6aU8ifVgVnrhyj5MY9kT1b8KQl1/3vgYdXrj/xmfIFGp?=
X-MS-Exchange-AntiSpam-MessageData-1: Oa0sjPdA6MLlCQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c86f4d4-2fda-4861-a9a6-08decdd779fe
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:48.2416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PSzjwwWZJzCyTSRYCmvWoAE+T5+MiFeJDhZT9Y/IcBvLdHeD1z6VcbHkDqoUgMzV7CxFnPuqQU4y07KnzY4aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-bad1c0/1781855451-F79EF744-1D6DB7F5/0/0
X-purgate-type: clean
X-purgate-size: 5685
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 290ED6A46FF

Allocate memory for domU vNUMA nodes from the physical NUMA
nodes specified in the domU configuration file.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 tools/libs/guest/xg_dom_arm.c | 57 +++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index cb0af9f35a..699b5e749d 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -236,7 +236,7 @@ static int set_mode(xc_interface *xch, uint32_t domid, const char *guest_type)
  */
 static int populate_one_size(struct xc_dom_image *dom, int pfn_shift,
                              xen_pfn_t base_pfn, xen_pfn_t *nr_pfns,
-                             xen_pfn_t *extents)
+                             xen_pfn_t *extents, unsigned int memflags)
 {
     /* The mask for this level */
     const uint64_t mask = ((uint64_t)1<<(pfn_shift))-1;
@@ -274,7 +274,7 @@ static int populate_one_size(struct xc_dom_image *dom, int pfn_shift,
         extents[i] = base_pfn + (i<<pfn_shift);
 
     nr = xc_domain_populate_physmap(dom->xch, dom->guest_domid, count,
-                                    pfn_shift, 0, extents);
+                                    pfn_shift, memflags, extents);
     if ( nr <= 0 ) return nr;
     DOMPRINTF("%s: populated %#x/%#x entries with shift %d",
               __FUNCTION__, nr, count, pfn_shift);
@@ -285,10 +285,12 @@ static int populate_one_size(struct xc_dom_image *dom, int pfn_shift,
 }
 
 static int populate_guest_memory(struct xc_dom_image *dom,
-                                 xen_pfn_t base_pfn, xen_pfn_t nr_pfns)
+                                 xen_pfn_t base_pfn, xen_pfn_t nr_pfns,
+                                 unsigned int nid)
 {
     int rc = 0;
     xen_pfn_t allocsz, pfn, *extents;
+    unsigned int memflags = 0U;
 
     extents = calloc(1024*1024,sizeof(xen_pfn_t));
     if ( extents == NULL )
@@ -303,6 +305,14 @@ static int populate_guest_memory(struct xc_dom_image *dom,
               (uint64_t)(base_pfn + nr_pfns) << XC_PAGE_SHIFT,
               (uint64_t)nr_pfns >> (20-XC_PAGE_SHIFT));
 
+    if ( dom->nr_vmemranges > 0 )
+    {
+        memflags = XENMEMF_exact_node(dom->vnode_to_pnode[nid]);
+
+        DOMPRINTF("%s:     on pNODE%u for vNODE%u",
+              __FUNCTION__, dom->vnode_to_pnode[nid], nid);
+    }
+
     for ( pfn = 0; pfn < nr_pfns; pfn += allocsz )
     {
         allocsz = min_t(int, 1024*1024, nr_pfns - pfn);
@@ -312,7 +322,7 @@ static int populate_guest_memory(struct xc_dom_image *dom,
         {
             allocsz = 1;
             rc = populate_one_size(dom, PFN_4K_SHIFT,
-                                   base_pfn + pfn, &allocsz, extents);
+                                   base_pfn + pfn, &allocsz, extents, memflags);
             if (rc < 0) break;
             if (rc > 0) continue;
             /* Failed to allocate a single page? */
@@ -321,22 +331,22 @@ static int populate_guest_memory(struct xc_dom_image *dom,
 #endif
 
         rc = populate_one_size(dom, PFN_512G_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc > 0 ) continue;
 
         rc = populate_one_size(dom, PFN_1G_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc > 0 ) continue;
 
         rc = populate_one_size(dom, PFN_2M_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc > 0 ) continue;
 
         rc = populate_one_size(dom, PFN_4K_SHIFT,
-                               base_pfn + pfn, &allocsz, extents);
+                               base_pfn + pfn, &allocsz, extents, memflags);
         if ( rc < 0 ) break;
         if ( rc == 0 )
         {
@@ -415,12 +425,33 @@ static int meminit(struct xc_dom_image *dom)
     assert(ramsize == 0); /* Too much RAM is rejected above */
 
     /* setup initial p2m and allocate guest memory */
-    for ( i = 0; i < GUEST_RAM_BANKS && dom->rambank_size[i]; i++ )
+    if ( dom->nr_vmemranges > 0 )
+    {
+        ramsize = (uint64_t)dom->total_pages << XC_PAGE_SHIFT;
+
+        for ( i = 0; i < dom->nr_vmemranges; i++ )
+            ramsize -= dom->vmemranges[i].end - dom->vmemranges[i].start;
+
+        assert(ramsize == 0);
+
+        for ( i = 0; i < dom->nr_vmemranges; i++ )
+        {
+            if ( (rc = populate_guest_memory(dom,
+                dom->vmemranges[i].start  >> XC_PAGE_SHIFT,
+                (dom->vmemranges[i].end - dom->vmemranges[i].start) >> XC_PAGE_SHIFT,
+                dom->vmemranges[i].nid)) )
+                return rc;
+        }
+    }
+    else
     {
-        if ((rc = populate_guest_memory(dom,
-                                        bankbase[i] >> XC_PAGE_SHIFT,
-                                        dom->rambank_size[i])))
-            return rc;
+        for ( i = 0; i < GUEST_RAM_BANKS && dom->rambank_size[i]; i++ )
+        {
+            if ( (rc = populate_guest_memory(dom,
+                                             bankbase[i] >> XC_PAGE_SHIFT,
+                                             dom->rambank_size[i], 0U)) )
+                return rc;
+        }
     }
 
     /*
-- 
2.43.0


