Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8pbDCJSOWpEqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CB6B0A79
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="nlvj5j/i";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343898.1603152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgPD-0006eF-E7; Mon, 22 Jun 2026 15:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343898.1603152; Mon, 22 Jun 2026 15:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgPD-0006ZT-A9; Mon, 22 Jun 2026 15:17:47 +0000
Received: by outflank-mailman (input) for mailman id 1343898;
 Mon, 22 Jun 2026 15:17:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgPB-0006Vy-Jx
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgPB-0052r4-0b
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a39520c-bab6-0a2a0a5309dd-0a2a4502d4ac-20
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:44 +0200
Received: from [40.107.208.44]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395217-fdf1-0a2a45020019-286bd02c5fd5-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:44 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:42 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:42 +0000
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
 b=qmiDqyb9GoAiYoUjjeO2g1/IqKUoTE7zfc7yF90FrmPtt1v4gEzAyG21ctOUpmjc6nh+u8lvGjcBurOd5IZT/6w6J1b7hupngUhGGTB91YNLCAoK4/Pwp26rr7eJZu8YVvkOxRKWssuCHqIF/JvPOhr84wVuUwYV/ISNBZcEas2g33zA3PsY3APhuyifb2t6k3oovsLa7GziU2uJIoYCNJnfZiUm+VMKtkkl79m6lW1O8sWfjFMxUUvz56XEVenEH4gcxc34glMoEavsv5RKt30Z7Y/bq253aqb5BMgJ9jJToNBRr+jfMiF62WYS0aLw1B79Kh/BJeTj2EIu/sQN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eteaBeiMzsuqrMWkmjhp+ii2ze54srInlQVvwTckyo=;
 b=JbzOvB7okD7Ft4vSVjrrAJewxGHTjL77GY45SduYecB0OUO4WSqAzfcvIHqogjD2ZMUU3xGa21HntjqRYqvg/ONrw1VaqT0b6FzIpC6TcRrCWcHN0VIkBNTqVpjZJRfi81H7bjuV5lCU3qBsdSrnA3FXTDGWYGeJrASchHPhq4t0pWAbuxlYHr6EIDoQKqvectE5G4LNq2eAyOuM5wxtqjneiUGlZ8O0fFn9kam+qCcrJxLchNPoGJGz9jxfcjwxEvWCCuzaXQR7r+jBp6SJEJHABzk0ygLZPpnsWx4e3ys5Zdh3Uu5Fu6ieY/5FpFLD8wrrcW6XdNv6a1FUpzSmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eteaBeiMzsuqrMWkmjhp+ii2ze54srInlQVvwTckyo=;
 b=nlvj5j/iURdUMR0YgCpp8IlbYq6M4PNCn6RZjRvwWvhaAuJawKmvKc7OuunJx4krUzbOLv8qr/LOD6tmA79JY/UlC0Qk/y2lsoRI2wVr58UeHvUEjAD3Tm1+IRtvq+/1PPkXgrrdI3FzBleIjvxiaA2ngtPNHAec0WJVNDHLtsw=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 6/7] x86/kexec: Pass boot params directly to new kernel
Date: Mon, 22 Jun 2026 16:18:32 +0100
Message-ID: <20260622151833.3397692-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a5e4a9-71dc-4d8b-7000-08ded071678f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	oPUIW9+8ztQv+7REV3ubRx3+58nezB9Xy12MYg3PjLLmlKfxMr6YyhUd/gHl4+ZxHc7M0Y7/7ss/vcslKhxRCN/csjm0qh9qObTKuH18zjzxBeg1iOfS/0GnbKiGMjyDaiA8Oh63jInFumtFLfVHIGiIf9KqxlG9qbTm1MCHH5w8kAIb5omdTR9qvLY5zeD4QVFRrzZiLAewOutOZ8iSENPZLRXdOyK+DjE1M9RB04NKPvgeHM9uB7UWRZ93NF1vdNvpZuP74/5UHsMp5+FE7vRjoszlBu6YKYrTXf56JrtPiqZfKwC0cpQbFX5ytd7xenfYKz/MCvEpe9Zh+gK03Cjj86HeJ7KXqDSjkD76hstAEOU+rgVtrwa2UoCVzpYXUDMUZvxqiKhVGo+caQLsvND7BdbvYnvcYZgVYUNdfL4JrcbWgZJGx72Pdr1B9gMAshZhxCtg7wYTj3+GqbbBdowglN7Y7RnkRzCqk3P7hN5FFAmJyJKGv3MBDBhfuPyTzPmu2ValtWC1zlqPp1GIRPeBkMOjBydI5LRSpJLk0u1m63FY7Lo2vvi4z77baXHhfPSlWDey39dNhnmkCXsPlv2A44hPjVAocECvpSeHlvz0yO4sS4JYwnkhm/XffzHhbKXc4jEjBEloL26iMiNgFS6c2SH3r1vkwai4sqEApXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0O6/emUMAC3aBM+wtj5lGRpwODv5UhVb4Ud+TKXoWB2jYdhalTwzYsISimU?=
 =?us-ascii?Q?ZSzLvY0hE71KUOY5gkJO80Czks0HbtN9So24B3waLVs/qdIYAvsX2ExRG/s9?=
 =?us-ascii?Q?xg6JQUJs67fXvHzCTonJqLMTEbDpBQZ1O7nnbvA+Wj0UeqtlAuZeRFVoDP9r?=
 =?us-ascii?Q?1vuCneL3PKJ7tvVDjCKveu66M8/gm/YvHffkfT3CIikQX6ZOqqPtD0FmdwTz?=
 =?us-ascii?Q?XjSP+awncPVvOdn6iKlVuKA9wAi5tzreZtflvVL054LFYVSSuAlfqpC+LP0k?=
 =?us-ascii?Q?3n9YxlipFrB/Kb50pc4wygNIl2dm7r4nVMfihSK7yIspzDQr/QLNITb7ti2Y?=
 =?us-ascii?Q?dUiD0uMUV07L+ZjFUDO0Xnk7p+r+ymFUMU71if+0nm6W6eNj/vLngnOEQ7Sq?=
 =?us-ascii?Q?evH0FUFE60FDEZ4faNuh1XxGDuWk57dBWI85Q0BtiX6GMvY4EaYnDsTYzERH?=
 =?us-ascii?Q?0kirGyRguNehBTtdD955CEsoKcklN7xZluZCZxBkeUVQs+3nCHzRm4P9qTKY?=
 =?us-ascii?Q?6FNDSzJgq9zX2Cgsr2VlwrZlrUifc3aZcGUOuaxQN6BvOvl8zl3GZA4B+a8c?=
 =?us-ascii?Q?gXn+BYLxRWZKT6Dnm2oxbL7FVCBwYBU2LFiBvk3UsSwEcBQv6oQqHSj+hT0r?=
 =?us-ascii?Q?lhpsamrJGyuecrJ9ie7I+ata0aLg+ndO3dlaxuvfQzjUNFaXSAUVE4VEjiex?=
 =?us-ascii?Q?Mx7tdomWH1n8Bn4JT1f5dCcJ3d2kp4voKHChyGZIkBOVQRGnkfdJsY0XkdVB?=
 =?us-ascii?Q?arj1Uh/B3aTYpQdgxyTjYfH0Hcb2vk6foFrJOVDs0hI8+zCt+T6wxR5uQ9VM?=
 =?us-ascii?Q?wismybibdSdYxbBLg1g2E9jcrpN4BvsCcfndjrlX5gM/Dn+xGzXfpLX2SbmJ?=
 =?us-ascii?Q?XPHaUJGJeZGLZuAkSrmRLYBKyNVfYnfNsS6vPvZd+67JXSwDQbmPBfUtm2ah?=
 =?us-ascii?Q?bBg2lxAZTP8o5b0JlH8bPGmOpFiyidjRlvs5d/7nLKndEOJoWH1VJwOzpUwr?=
 =?us-ascii?Q?dHVQoOiiw68sIjbIJqjfNED46K9p7Ecy82x+ovh0ahe5UkG0NYUhUL+qH3X5?=
 =?us-ascii?Q?/TA4aj89cRsc89HuRII8skAr6SSeiizaiS2C14GGl2Bv11QCuTHNHSsSRFXl?=
 =?us-ascii?Q?LZ2EZj5J1iwXREJ/Y4arjZ03OVP7vXwnNQkgPopVjKb9q1gujdHJLTzIH7vJ?=
 =?us-ascii?Q?x8iQLUh6XvDDWsKHguIX0x/x/AgoSbblGVlRQCjknQEDYs0i8fHXGvdxClRS?=
 =?us-ascii?Q?djNrNZvVWmO38t+hi8Joe465kEbmBlRsetUEwoX5X2MeAFHyUT5Yjj+mszgC?=
 =?us-ascii?Q?Tc03mLOvKoxLAmG9GfQTki784uJ0HKCbpQYKCJF6+RmlIBg0r1PJ4kNKGznf?=
 =?us-ascii?Q?UyYaFQjQlidNQOQA1lfCByhBJ6Re88F/ckHTSojfKNR8OinC78UvWZ+TP1dW?=
 =?us-ascii?Q?NHSk5MPqOzlHya+r6gHNzUx4qghPv0LLBwVgIkcDq/bRTuWUJb2KJ7fkdWnC?=
 =?us-ascii?Q?QhB4xoJUA2uDsKY1Ap0Qcsyy3srFn111B0GIWPbuwZKzibpL32QeDIPuzjZ3?=
 =?us-ascii?Q?TqqVqci25hcHFsfU6OpCljTg2Qw1u42/vbFY3m99miI0pPfL4BNh7P5jgQH4?=
 =?us-ascii?Q?8/tR7bLXPz1H5TITc30LNnm0zENwKx/6mat2OIL7wZ9/Me5wzumtrEb6OaRg?=
 =?us-ascii?Q?GGsPAM6EXRLQ9lqFyXwVTnVxIlyqiTFOf8DeMHWZaC1ZI3ToBdPe68JMKJrL?=
 =?us-ascii?Q?P9XxWaW6Vg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a5e4a9-71dc-4d8b-7000-08ded071678f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:42.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GJ2ly2eu7zhQvpZChqNACmRLqZB9Z4TfSIU5RwIPS4i6G//xSsXD+7zraqV5aEjf2VAEQfmsBbC0ia/ZicWMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-720697/1782141464-4E4623F3-F3AFD43A/0/0
X-purgate-type: clean
X-purgate-size: 2436
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
X-Rspamd-Queue-Id: C19CB6B0A79

When doing kexec on an EFI image there is no purgatory and kexec_reloc.S
hands off straight to the new kernel. To facilitate this the Linux
kernel boot params need to be passed through %rsi.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Rename kexec_image->boot_params to entry_arg
- Fix indentation
---
 xen/arch/x86/include/asm/machine_kexec.h | 2 +-
 xen/arch/x86/machine_kexec.c             | 3 ++-
 xen/arch/x86/x86_64/kexec_reloc.S        | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index 3e189acf24..010e0c7046 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -7,7 +7,7 @@
 
 extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
                         unsigned long ind_maddr, unsigned long entry_maddr,
-                        unsigned long flags);
+                        unsigned long flags, unsigned long arg);
 
 extern const char kexec_reloc_end[];
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index f921eec5aa..03776f4723 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -198,7 +198,8 @@ void machine_kexec(struct kexec_image *image)
 
     kexec_reloc(page_to_maddr(image->control_code_page),
                 page_to_maddr(image->aux_page),
-                image->head, image->entry_maddr, reloc_flags);
+                image->head, image->entry_maddr, reloc_flags,
+                image->entry_arg);
 }
 
 int machine_kexec_get(xen_kexec_range_t *range)
diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index b52d31a654..ab9fa7f2b8 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -33,6 +33,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdx - indirection page maddr */
         /* %rcx - entry maddr (%rbp) */
         /* %r8 - flags */
+        /* %r9 - entry arg */
 
         movq    %rcx, %rbp
 
@@ -71,6 +72,8 @@ FUNC(kexec_reloc, PAGE_SIZE)
         movq    %rdx, %rdi
         call    relocate_pages
 
+        movq    %r9, %rsi /* entry arg */
+
         /* Need to switch to 32-bit mode? */
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
-- 
2.52.0


