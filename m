Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RjK8FzVSOWpHqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:18:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F86B0A83
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:18:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=P9Eb3CdK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343922.1603161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgPT-0007mL-MB; Mon, 22 Jun 2026 15:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343922.1603161; Mon, 22 Jun 2026 15:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgPT-0007iP-HW; Mon, 22 Jun 2026 15:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1343922;
 Mon, 22 Jun 2026 15:18:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgPR-0007aY-Fk
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:18:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgPQ-006oqV-Sq
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:18:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395223-e002-0a2a0a5209dd-0a2a450caa9a-10
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:18:00 +0200
Received: from [40.93.198.55]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395227-94a4-0a2a450c0019-285dc6378e5c-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:18:00 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA3PR03MB7394.namprd03.prod.outlook.com (2603:10b6:806:3a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 15:17:46 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:46 +0000
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
 b=EMmB3QhPtYDJbH2qE52b5UXC6m5xhKlXJd6UoFjPK+4pvd3PRWU850Fdsyk22ipVjWTYoOVKG/ji0VPQIyE1uoM0kKDgOeTbOmJ2CkYwrep+sjoDDjsoxpOjk1/mZ4OQKyqeVOjzpw5+2vT9n9aEMA6L13EXrYbpJY2/wsAsPjC5KU1HKU6ncdihS+iA3EvFbvOHIdEDqZVxtr4/mZuBRPSqpg68EPhEoH013SVJLcdQfs/KBsmvlI93I+LCBkDIqL63u4CynzYxUBvcoIaFTHunmXQ2371/Qg9WRhjxydklCzOPcuFv0lOhgZfNJFhFFTK7lhwRQQKAv6ASkQE8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka899mqYRjHfWYgSOCloGz1lQeceEJ3Vxja9LrEfdBM=;
 b=XxZppfaJPPFSmFCsog/D3osF4z/7kmhg7iN6N/+HTlL9NcA2TPrg5xvX032tA44+SDC4mKl5Gas6XbKtIQk+q3gNXIblIk4Lj+/uWfn/Mqadye9OPAzeJMco0YF4jHkFaJvTNtraM9NH5IoO07gp4ntbqha2xtyX7knebd24R83DD3A0wCzCSV/6CKfA0IGyYQnpMBctvvIF7Rrkbks2i1ZnZt1WiVWw227mpUzCFlUkl8Z4wSBMuwo4ZwQ+7lWTZGBzHnXy5fbzuKU5hkXJsdW+fjNCmQ5cnkA9RLh2N0T6F03listTW/rL/b7KWLMTt93nU5MMmF042N2DGRSyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka899mqYRjHfWYgSOCloGz1lQeceEJ3Vxja9LrEfdBM=;
 b=P9Eb3CdKbMlDT0JSQqxdNqH9DAD/ESXx8Tn82kQFnq/EIFoO0yp2stYYUWXmU+H3AEh6D5+hDzqwQAvDjy0DpIKFTQMlL+vqVoqu3uoXJRHvrx568ZlGTP06wpVekdW8fbs27ifa/uiPQIKp0q4gx49mKwos3j2cvg565ZmVlzQ=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 7/7] x86/kexec: Zero GPRs before entering new kernel
Date: Mon, 22 Jun 2026 16:18:33 +0100
Message-ID: <20260622151833.3397692-8-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::16) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA3PR03MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 03eec23d-4321-48ab-15de-08ded07169f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	KNUazDw/LFgwMtntvO351kzv8skJxW5b5/9spFGZKy/MJhSYsloNhF0c8f5poLacPhrtpJ3Er9Zyy7eWdXtUDVsCgUOs5XgXEVSLj/BswKJ4eFXvxB2UeUuITjKbBZGofTwbZBNnEBGkB/UN3VVBHZDmUAxu5EpYeJ9YueOW5q/kGbtnb+S3hH+biYtEWfs9xJRut0WGEI4SOIVLPdElsmY12T+Jcx0QMZ6A5b7GaBhymXAKff3a2W4UhU8i0EBcccn+VBgdn6fl6Lh13Y+Aw7HwFlmF6IIMIIJzTyq4XkdSLXGjIlsLduLqquISXmK4xzABB3WKad9F/dl1sItmzfmZ6NUFsSHLG5fyFvSVV96x1K9CNG7IwalKLC29wLSSZg9RiFZ0qW8VLlGyyvLtqQ1jEmJohitiQDh1gjYw4ThoTvvUlIUPqMrQ1AgldBfOVcFIL9vyr8/NMWiCz25heGMRfX6hcNB3Z1kLsr+wt0kanBo/X5PZNBgYQ+c++MtGHS9kP/5hKoZawyjvqEJOCHKctoow15z5j/N+ohpuZHOTBB0HtH3REa0MMOh+Xlvf7QLu0v+3o5yQg765QXcXd5oBP986qd8d9Guag64QWsTMhC9myBuiFlsIlv575S/0MqDvpTrb0BlKhud+mY1cLSXiBWBwisoIGp39haLcYsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wOFM6likpv7DLjCYcAcMeE2Iqu7Dzl0GjQ/BjONcL1WgIIKMXQw4p81kUjNx?=
 =?us-ascii?Q?+ddOh94uWJDto5Ja0SOpHIHsfEjQTuPawPobTsQzRKKXgE3vdDH9fvFU8aHL?=
 =?us-ascii?Q?joie/z5XS5uK8HRdTV4R0hRNAbr+8bgIb3rYOBasS6jpgD9lGpTWzZceThoy?=
 =?us-ascii?Q?bvb3YrL35+IIpYge1haPZa8baA5kbjrc4jSbJqx7nRJ9PX3JZU64tsEVFvnW?=
 =?us-ascii?Q?StfzvaVUQzDbhPZdOHO9kPikwT30J8U7nGjbI2LttCDN0vd55NAxdyzC03Tw?=
 =?us-ascii?Q?S8OtVyqMoqnwaliaMwXL9ZwTqRHiQQ/Up8h4mthKMPsomUpZD3ODNan9u7X0?=
 =?us-ascii?Q?1Mo79ry1hOJa5X/Ry/K6JM1QtF3+wOa7csq1JY7f5DJ5MXxX5wj+XhtDF7Lg?=
 =?us-ascii?Q?aVXzE3H+dVZmenxgOBBqQvAvNuKgPw07WKr1FBCqkZCD/ZLM/BjzxLTh11Sk?=
 =?us-ascii?Q?HjIpINN4N+vAkv4ww8f9NyiM0/+h2TRsaYx9TWrysIlwlgtayb2Nm0BuvnaD?=
 =?us-ascii?Q?ifRWahZtiCGBrEea8ZNVXzLldXM1JizJos2bkRGmu9eDS9RlaBRdTalCwQhF?=
 =?us-ascii?Q?ohDKt3VRaPZQJk+AWxJcn9d2OyT5SZlsyFVnImi2+eERMpn1P1QMjjYPA5H7?=
 =?us-ascii?Q?Jjug7GaPVuVz/LzFFEJ+e0MSa1Kcoqcd277FYf1tsD2DQ8SHvijIM6lyQtX0?=
 =?us-ascii?Q?fk1xDMPRv3u6r6gLz88+r9L6vXMm6fjhO+c61gMak5ZoYtWBIFhTTVI/h9dG?=
 =?us-ascii?Q?Ci1+Q7RP3ou7Gg3TrINUAgBOPSt3/KB1+MdEj+qx7PAqN3+KIaTErnXcaOU1?=
 =?us-ascii?Q?MktGvsHVC8C0Z9tWbBTER8bswlbayiy868F1/0bIbyWC3IbvNEYXPMP6b3De?=
 =?us-ascii?Q?vp0+9NU+waeBo+IfQZtOJAsWhkMQWDDRQgU68VD/l5e4cMKn5BRPiy6Fd/b3?=
 =?us-ascii?Q?7lq6ARV+D65wCQ64qGYR7F4QNLH4lqff9E1i6fVvQH2kw6ry+3XlEuqtdiXQ?=
 =?us-ascii?Q?csT8NxgFdzk9jhkAMpourgPlaD/lZdG9mcdyeedfGZBjmW3r4yLdspWx4hTQ?=
 =?us-ascii?Q?XSIxQdDOvw4mkw6qr+fG1HNYWA9FZ8XRJ4yjaboYwOoprMnvnn6JeP9loQZv?=
 =?us-ascii?Q?jX+kHOMrw2/CNglBQQoS+n9Nt0LAt6qrhnLxpNuQzk+t8FPF3xwUeU9r76tp?=
 =?us-ascii?Q?jvdgkRYNaO4v64y4X88RbgTnf6BwQ1YDga+2mbrYfab0xMSTm6b79CTJzUIX?=
 =?us-ascii?Q?C1E78GOP+JPj1/Yave9HS7t620Wxz0+/2cInOEQFlgIcxBqSSJe0jukUPehl?=
 =?us-ascii?Q?5y8lejxVKTkZ9hM1wL5rCjxa5o5A/IbOiVTMVcgWF7zJmLAtrx1Dbl+7JXZr?=
 =?us-ascii?Q?gzLxpx9dbA6Tq8HgEEPCjC+sFeOmxHnc0r6xyeOGw3HXde8uUDGeZenwxj1i?=
 =?us-ascii?Q?EYlycCkS2/0rWzR12Ecc6FnakrMXCvVksC67FEk3P6z6m0lwvlWPPZ+1w69g?=
 =?us-ascii?Q?qD/ZI1sRDWQwSXegSsalCSMwvc7s9VsVxuRuqqDQeUU8xPZTaAqdhOQq1CTp?=
 =?us-ascii?Q?sFy8jZktT5VVy38oOJJEkwpRSUN1+QuB/yLC8ulvnettKhuaKiz4yTlre7OL?=
 =?us-ascii?Q?SlcWsxvfDCJ2bTc8DNkRCYZI+RofDLl/aaOhqQve5IpLwk0/0C1dRnOtmgyv?=
 =?us-ascii?Q?kok2i0eVTzCD8OgbRAPBCml2GVTOioiCUM0Qf3XoL7rhCV63rAYknZlcN8JW?=
 =?us-ascii?Q?20etX7ShSQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eec23d-4321-48ab-15de-08ded07169f5
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:46.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3zda2tPHQaVyS/0nIdpuQY9rja3T6T4CSbw4fPI7JZyMCP5hb7UHfWhctHO0qwwi6tUSMeMdMeTZmRynOB17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7394
X-purgate-ID: tlsNG-d25034/1782141480-D89FAABF-0CDEC1C3/0/0
X-purgate-type: clean
X-purgate-size: 1864
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
X-Rspamd-Queue-Id: BD2F86B0A83

Purgatory zeros these general purpose registers before jumping to the
new kernel. When doing kexec on an EFI kernel there is no purgatory so
we need to zero the registers here instead. This change shouldn't affect
the functionality of legacy kexec.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Move the 32bit lines to the correct place
- Reword the patch subject line
- Fix indentation
---
 xen/arch/x86/x86_64/kexec_reloc.S | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index ab9fa7f2b8..f8ec457a19 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -78,6 +78,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
 
+        xor     %edi, %edi
+        xor     %eax, %eax
+        xor     %ebx, %ebx
+        xor     %ecx, %ecx
+        xor     %edx, %edx
+        xor     %r8d, %r8d
+        xor     %r9d, %r9d
+        xor     %r10d, %r10d
+        xor     %r11d, %r11d
+        xor     %r12d, %r12d
+        xor     %r13d, %r13d
+        xor     %r14d, %r14d
+        xor     %r15d, %r15d
+
         /* Jump to the image entry point */
         jmp     *%rbp
 
@@ -94,6 +108,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
         lea     compatibility_mode(%rip), %rax
         push    $0x10
         push    %rax
+
         lretq
 END(kexec_reloc)
 
@@ -171,6 +186,11 @@ FUNC_LOCAL(compatibility_mode)
         xorl    %eax, %eax
         movl    %eax, %cr4
 
+        xor     %edi, %edi
+        xor     %ebx, %ebx
+        xor     %ecx, %ecx
+        xor     %edx, %edx
+
         /* Jump to the image entry point. */
         jmp     *%ebp
 END(compatibility_mode)
-- 
2.52.0


