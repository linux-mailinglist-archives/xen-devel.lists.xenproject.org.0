Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3Hc3Gde6HGp+RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F752618293
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323484.1589269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxR-000079-O7; Sun, 31 May 2026 22:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323484.1589269; Sun, 31 May 2026 22:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxR-0008Rd-1x; Sun, 31 May 2026 22:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1323484;
 Sun, 31 May 2026 22:48:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxO-00080R-PB
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxO-00BFyL-61
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba9e-5cb7-0a2a0a5109dd-0a2a4508c056-30
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:34 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbabb-63b5-0a2a45080019-3465e45c1533-7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:33 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpHd8jBPXdEwmyW+/QmQKZ8cRXwoIT6mhsCyqfFyjQBfBxs6htMGiMgaDjfAjwIGNMptSv+ZQ/UPIEPYcu/1cVz7W8WYb6XNIscen6iV21UwF50+CNMkJ+WrdlyphYU1kiGgEpFo8RhLfgR2y6XBeUSeUAJxFZ+QlPvV22l1z05fyH1txUPtfqaI2GXg44a98HqleEP3lhYJ4dVf6/Tj8sg9f1YEIz4pgAk/Lh4ZCDcSJYuS0AyxLBcDBnY2O1du/cLsFxBYeH9AWwwRys0h8FwvJybwULCLkPc24cWjVWaoGVfVenG53sYBRIaIzkWe/BhTMFTgTM2AlRDxPGZhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S1ZqEU1iZpAsWT1zego46VY83uaoXXJ+aqFDfCXlC4=;
 b=OdxHnWN5FfywG36/xtS9hEdLYQErrFfiobgHvq7DBYySZSgfdiom4W5YMAZ6lrkSfsKbpT09YN+QIcaG6/NeJMzHkQlUIQZurkU9ONqHP0fbKNlc82v1i27vunxAJ69GZHMUW0AIWRF0eJBl7m+RddNvHz5IUVuHiTpiIqz+IY6sCS6iVqwq5V4fMVQGGoeTLp2I+QuPq1k9oRISjTNTjpGi7A/HXWZzAeZrBOHGsNkwIyJFOOPFuAYZQS7+LyvE5reqBn8zPm39Lg7Ds6RHmmw/an0bWoMmXImrUqkOnTqGiLQ3iUMSc+PAELAbLGbnaNZhna7gw3PgJHGtB5Rnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S1ZqEU1iZpAsWT1zego46VY83uaoXXJ+aqFDfCXlC4=;
 b=TFK7b8Fp5eJ0T3jN9bwLONn9I65mslkUIFjjm5kHs2HgL0rdu5WS32BGr0yRHA1T9ROlbbm4fTCpNzJdujqcMqHApuAEG6gvNCCkxMsLjiVgHrS0DIFX81F9Bt9ZDsZCjWoIAWyTyeU4j703ohFN7BLg7muQVcF86XftOrr9JQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 16/24] xen/arm: Introduce dom0_nodes boot command option
Date: Mon,  1 Jun 2026 07:47:46 +0900
Message-ID: <20260531224755.9481-17-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c8d835-c04f-422d-03ce-08debf66bcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|3023799007|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kIID5X4oQZfjDpnc0Qs6y3LPfOqS39JiyOd6d4WlLDyqq40WcR97wQFpVQZt3aG81lW4+958RbKjDnUTl4FjdSUCKTJUlEd/VkjLT9rv0vMeKt5Um2+01WCCyVxbVvyK5Q9u81hRR8dZvs9CSOGrYXPya+9PIJ4yJy7tOfxBfXYMwXW6W/4kvoiNm2rOFPU3uFH7Y8Fg7G7X3KMBizly+P10jOJVGdjBSpsbz4Vxv/K0MfyqYxLg15q4a16NSbrwqae1sDDkjVnG/ot69TYBklDwnQT7378eAwO8TRuYFFB3yBecUrs8tYKxE20yN+Qk+ALD1gwHp5ur7mC5h5c36hXBAIUyeiD6hlgRF4PkGYrS2qi7oVSKd8Nn18q/zwLPfavJVQ20d6CPUf0VqRqkpTk4NNQQ1W3KSF3ISqjXEqfjrDApir7YMa0P24gf5xMOM0KZVcxY8hDXvYMMlAiZlcgLfpDvdYYDFhALNhOhUx5l9mxWuiM1PpogH01FcqgGkxXTbY174lYdSeX1C1szKIiGCbRJS0jUNm+3bEAqQrl/kUUtTF2CVegTjohcsD/pFDN+ssVjcA8wMenpvieaaCxlzB+q6mTWaOmfHrSAe98aT21p0bymvNI360jYEfIXysAXSbDzbgsh8zzRqqm5/4Ntk26P3rm8pUXGPVr0nBzymu9JL2R2irYgai3yIgRN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bs5TU4A6cqwI5/Dao5ubP2sKGtWx845cY7rsjYinYIGtrxIH7aDGj0J4lMTv?=
 =?us-ascii?Q?f8FP/AyVWCjNRLpylAvyTRp/K4EJRMv0D0/vVk1WUq9m8HaKCLLnsuYLXpKE?=
 =?us-ascii?Q?EUoc29Jv/5CpJr1FHaRlHYFCzEf64GkGNsWPmSZnX3yZe/+Do+PEiglNgyKE?=
 =?us-ascii?Q?NnFUviok7PdW7qg+6MX+zGFISZEpk+v5LRF2mf3akTG3nBluU7Ssb1qY4VoO?=
 =?us-ascii?Q?1UjdwAo90TYGORNXn02We9YMLbMI9u+l2XKqxSvDrH43Fjo3EqLg+RrOKwgo?=
 =?us-ascii?Q?NeiVRoyCf3lwMj4HoNGW+hUP2O0eDQUNESYo3UDXXAdN+ynhfv2rsr1foCPD?=
 =?us-ascii?Q?StYu0wO6Kf28GdA7jP5Q82CqFFtrUsEoFMSZxkA+jef5v8C4CQ5Drm0+eaGw?=
 =?us-ascii?Q?TR1wSyi7twuwNvQry3TFFHvHR5rHdx3I9nJ8BBLYhe/p4XAdNdH1Gp5Y66XO?=
 =?us-ascii?Q?P/tx8d055gcapz1fKkp79ZCh5R0+JR408RJ7/RzJl9QrQT5wuG4zMi3MYDv7?=
 =?us-ascii?Q?iASMKzpzeoufs2pHrU64ctTgizPU4xeBNYF6ZAcqFshO8K1Rm7q1eNI4e7il?=
 =?us-ascii?Q?d3TxV66JCT343+Tm7W/+DmwcK5bBg+0ITNpCtOwWjoQ0KSfKFejBfaGU81i1?=
 =?us-ascii?Q?RHECT18uWvTt7VVbyLq8qcYZVflodGsH2tNbGwQPDzTZskz5ebKivFFTktya?=
 =?us-ascii?Q?kq0OxhD5RIILJ9AIPl8MagiVkW9J8llQ1oczpupCEgowMm0rtIOt2PTjy4tJ?=
 =?us-ascii?Q?PyaMLquU5aVfDAPy1MHnlrMcpZP0xhpGEHs3i8PmHtNKegqfrUXQwcFGLjIm?=
 =?us-ascii?Q?uI3K1+cVTPomSnGXMdU+2Ry78Vv1nypbjIZS6l5yLZqLnKrgNboX4Dqj+s5u?=
 =?us-ascii?Q?TsZfVURGvq5OX1TGgC3uOogmW/vnsUGVEhcaHikE4oBtWnVjg+02JH9QUJl9?=
 =?us-ascii?Q?PdeVcqts8sZbFYzLntDAiUw3JZWI4tEolZLMTmZ09V/ePofELNCL9apYRI1q?=
 =?us-ascii?Q?LTczOVYYj8L4RS4lLjdCBcxzsHUr1p3L+9t+QiRSGWq19CNCbKGGteU9HBwD?=
 =?us-ascii?Q?AqTOHWszUEuM38J9Gb+RMkrN1dZbPVbFRhs+acUECjxisvxW83rdyKDu+Y8c?=
 =?us-ascii?Q?wD9zEz7JDFSY7CcNE9H4hE6mp9W6cl5sB1xr5+u6zpCRus1/hzfk+2P+1dyC?=
 =?us-ascii?Q?i//qz6VLnAiNyeEjRdzbknbQflm6zmOlA3F44jMHAU4L81z12+zJIHbbpoCM?=
 =?us-ascii?Q?l3mRZPzGtqO5eV9/hx9cTonupzHpVwTeh0Y5k2JZSEe4bOhX/qPJILIOTWt2?=
 =?us-ascii?Q?67zdazKKCR/FyktbOZYfgNOy4dsN0KEyQZ3T54ACOEdPz2CnqQoVlL4GfBLh?=
 =?us-ascii?Q?w7GmuIBtHfTwPphyDBz0V57PQOX/mHrrYR/wThy64WyYdZW+6txruXtHWrgP?=
 =?us-ascii?Q?RWFaUuWw0B1hVc02by0fzYX8d0GEgbL1L93gptww74TQ6dPWrKIDDGc2q7lw?=
 =?us-ascii?Q?6iFri6zC3YZsf+ojoV7sL/jFx7m4T5fCPfk/9RaHQ9i4ciNYDgDZlrH1v/kt?=
 =?us-ascii?Q?F+LXQWqRyELhyCkrY8qDBch5CApabd2AOyrj9rxMo8k7mAd+QUYFNgYeWduU?=
 =?us-ascii?Q?q4KAID6rluX5Y6zV3c3p1LHNccXY8ahILv5dvQ6qPKmMcXnw1Z0JF8FdZvVS?=
 =?us-ascii?Q?6PrD7j518X0vApaNuL8GZTAg73re0OpmXQh8SCTig/QM87/FFUrhwmAu66oR?=
 =?us-ascii?Q?xG4HmTsnfYYLt3PrIdcv7Rl5iUgTMIKSTb53v8RgIWpM40xWu6CdrnvrsJBM?=
X-MS-Exchange-AntiSpam-MessageData-1: Grn5BGB+LaerfA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c8d835-c04f-422d-03ce-08debf66bcf2
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:31.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TerW7po7DWIrWZTxWPfWeNzvCy6G75BBxSu8g85YlIKHkNEU907r/RKgLHrbf2+Zzlg/BETZ/d9fpcLiObL4Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c1860d/1780267714-C487BDB1-D88EFF32/0/0
X-purgate-type: clean
X-purgate-size: 2009
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F752618293
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow ARM Xen to accept the 'dom0_nodes' command line option.
The syntax and format of the parameters are identical to the x86
implementation. The logic that actually functions based on this
argument will be provided in a follow-up patch.
---
 xen/arch/arm/domain_build.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1efddc60ef..f4187512b0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -37,6 +37,7 @@
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
+#include <xen/ctype.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -66,6 +67,48 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
+static nodemask_t __initdata dom0_nodes;
+bool __initdata dom0_affinity_relaxed;
+
+#ifdef CONFIG_NUMA
+
+static int __init cf_check parse_dom0_nodes(const char *s)
+{
+    const char *ss;
+    int rc = 0;
+    unsigned int nid;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( isdigit(*s) )
+        {
+            const char *endp;
+
+            if ( (nid = simple_strtoul(s, &endp, 0), endp != ss) )
+                rc = -EINVAL;
+            else if ( nid >= MAX_NUMNODES )
+                rc = -E2BIG;
+            else
+                node_set(nid, dom0_nodes);
+        }
+        else if ( !cmdline_strcmp(s, "relaxed") )
+            dom0_affinity_relaxed = true;
+        else if ( !cmdline_strcmp(s, "strict") )
+            dom0_affinity_relaxed = false;
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("dom0_nodes", parse_dom0_nodes);
+#endif /* CONFIG_NUMA */
+
 int __init parse_arch_dom0_param(const char *s, const char *e)
 {
     long long val;
-- 
2.43.0


