Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGlKMGOcBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3E5491D3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309336.1580350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqe-0001QU-N0; Fri, 15 May 2026 04:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309336.1580350; Fri, 15 May 2026 04:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqe-0001Nc-Ju; Fri, 15 May 2026 04:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1309336;
 Fri, 15 May 2026 04:08:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqc-0001NQ-T6
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqb-00GbfP-Qc
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-2eae-0a2a0a5409dd-0a2a4504bda6-32
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:24 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:24 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:19 +0000
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
 b=OJxL/IMpQJmUgRs5VxGI2XICEhI0T5gC1vXu7RVdLRjyOvg3Q1naipgsfgabtHM9Ubh05H06f99AqtlTozYNDO6H80s97StjGz7cXZGRpfFHn1ElYGNoNVUQ5bGeJFEiisXAZZkMcQnv6uX7ohPqNLb6U70k9baqPyCzdgCAX9EXgS30jm5xYheS5Ry24UvZgxQx6/ScXNyRte+7Psih6fLyLhiDYgemdJeCF/KwCFaIwr6N86CaX91MwL92UN0rFZsQ3RdfOjQ0EQ64nxUf8Af/zztrJ7mRjHJtvuMJ9eKqyS65f7v/2gcdlswp8NRp7kJmQI/xdwdk6hWWKlGQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRhAUy+m4ZSSA0NruENsBXlnXW5tyOZSqdGUD5wIM0s=;
 b=EpJZGwSGz6JOqw3WAskam2PoOMh0S4o9azLj8jWg3jRuW/zPR7KKX8VHbSEC9jQkVNOHguOMb/rc32PxvckU7SgTtA5yOJtqoc4UBCkoJU6kqkHzdRMs0hPPpj0a+oi0sAUTV/P+t6om8iiAidnJy7zQUyJcilylvgiZ/iHzy+bosQJRd/aqHBp5MLBTc1nkttoTTwpBNbrYbPDxtYE6asurPzfW+G/dDDnyY3Z9FkG+8a7mrPgj9egtchynQ16sBq1Ar3FRhM87vGAJOtOKvbljhJ4CML6BVKDhL92yCX6/1upFRfMVWkhTYJrvVWa6H+hrkPVPQ26SFm3KAGeYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRhAUy+m4ZSSA0NruENsBXlnXW5tyOZSqdGUD5wIM0s=;
 b=nuV4Os6NjRJN9CESTPR8Andtnci3UYfD0h6cIi7wBNyfMzXeEwO0DCpidsuKhUtgYa/JwQOneFKBa0+1XL6X5VOlTA+zZK57WI2f7gOOUms7C7tm68Fuqy+pf4id2KLGHAnQAKRvRXd1x0G2hnha1L8KF3qcLpA/8vLdjRoZXCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 01/26] xen/arm/cca: add RMI v2.0 ABI definitions
Date: Fri, 15 May 2026 13:07:47 +0900
Message-ID: <20260515040812.983626-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: aaaf22c6-02f3-4dbc-8e00-08deb237990c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CDvH6HKxcW4p9SA4LCABu0v1dAiH/jgC9IM+mY7LlKBUCGsxTOx8fMURl/ppDiL8poSiMMdqwqkMtdQooen6h09CMtLgKEMChCNI5QMgq3wWE6xye2FcXnX4YqZD+sjNy3BlFgU46ur8mEeqbUckzrdxTbl1vqLYo90EpdA0RHjCWch9+vV7OvaKRECeh+pCiQLrj90gODXXnGpqXPrQkVEfiE0EIerTjaEooTNXbZ+u1NJUDwAg9E+JK/sibBzOsSIOjCZp53swQJ/GR1YCNipr9xYeickySCdh8nkyC0PWXmbYPC8bjUq7QubC+khiUpzh9ZPMKcfJOGMBjkaiPHawl471ihWnsg9hBy/ITFN/0DnDp4g2h3oMfR4w+u951aWWeZocq69gjHcHB35/+hxDDM5MhvSqw1b+ope18BpcGUCTQWq+LZOsBceZI4s745e1CLkKAdLEOtHsnBq50v2tpSiY+NWy7GNa5vlxAxNFF+AytaVx0SbTeZ2qR7UqDiIJtPx+XkLncCa3JaUA1g4U5yilTTKGbRHzX5oFiQiLy6hmZAue1dyEKu7Kd7/RzDUFyhU1lFyn6zRTWJv83VZ1XuuikIQqtaw4eQlCbD5kGkmmD+p/dRzt1jK8Ok6H9suJkvK1SJUiNa43l2S7Yh8FjIu1KmH9GSbCCwewMSHzKg8kZIMBhaAsHciwfqA5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F4Uk3HRBrs89kPJMw1ucVJGpiLhQIu8FXgafrnPGlA6zgVBYrIXIj0BjkHyM?=
 =?us-ascii?Q?wMYmw+O08osWDQg3rDKmQphNs0tvHBwgHFF2IMPOKq00WBHQPChYi5naUMHh?=
 =?us-ascii?Q?zOUMPPsVVL/VadTKF2Q3VLVZZXFuK6W+seHy4PEokKtlA1RoP5odeHkDecyZ?=
 =?us-ascii?Q?cUUKSAZddpkrZlEAmXmqx5IWs2pviYEZADXtXtQzb3yMxLhLdUDSyPdZyagk?=
 =?us-ascii?Q?1KlGYi7kk5+aAS3D+CYig9rAA+S90up7xKwJUvkVFzsoJIYbyUHl9MQwzcJL?=
 =?us-ascii?Q?tbCCS2IYL7pE33OULr3XZjv52aJ99XaRqvUElf6pbdlji6GEAhOwhts7F9qJ?=
 =?us-ascii?Q?a3uBW4EXSc+ARrM1yoBouuNGSDtMc+RpWbiDAF1SbvNXPYAwypBCHfWeqtP0?=
 =?us-ascii?Q?GbvFMg8neVzg00nl6d5aa9bUqD1jrw15fwB9T8iVuSTSiqcNd0VkzaMfjSLg?=
 =?us-ascii?Q?qln/lH0O4W7L5jFtj59srCxnyny7eTUVS2Eaq1K31yspPmNmdBDhlN2vAXxI?=
 =?us-ascii?Q?ZBM897AC+VO/iLZBI6ezR+37NoZg92kFFAGVSM2OuDD1pb/8Q5pQGTGI6z+t?=
 =?us-ascii?Q?yQ+pDenq9wp5HXcnAiT5Jc2FN6uTliTtBq6NpJN36TTrr+7LxoXt5LlIHMij?=
 =?us-ascii?Q?5eZRq8/jaUyme5D4lwA21eopCU/8HNqEeZL2CjTVQw/U/QrT4dSsfoSsLpjp?=
 =?us-ascii?Q?8t/+FKUZgW9xMlk/eRi4C4w36v5slQ9JA1mlMzC4bIdqrnpWvd93H3575xss?=
 =?us-ascii?Q?gOIRarah30GhLYE1ZjMjukwU4tdQ6PJbw3nznQOdAeZ4+/ZucopGsCXY3Ykj?=
 =?us-ascii?Q?sPErhRWj6cJWiIALNQEm8unZuzJvPz6rzY6ryothstpvHXxC4G2e1BoLQj6y?=
 =?us-ascii?Q?XSobeozkxsB8KpbknDaXpv5Z63cTU2bf5KrWej8Wfm2isqlF/ls42QRxSl00?=
 =?us-ascii?Q?7PCWlgBBAUA0yr/V6G6B9yrXLs7lKIpY+bZZBI+mxYHkvMiWlMTIkHylGSf7?=
 =?us-ascii?Q?dzlSVRWxSSBHFqSSHrX9/zwDTqMW9cAh13ANXC9z5jxNHUHf7iVvcv3lNUIa?=
 =?us-ascii?Q?Z/ukZN9zI0r0PWOsaY4uRoJAU4sw6KI5zo7QeXnijuUzMR3ADZcrcMY92gsI?=
 =?us-ascii?Q?jC8gOK8iqeNzv0sA0vdMMbo1QS3hG0dQEba6oQw5hoq7bvbRncPAMiHSYbHi?=
 =?us-ascii?Q?ofbamnfmJYRFiNrVFr4G8bjsRdXzNX5QYdLNaDkRHwj8jU6dYpxsJQqghQIN?=
 =?us-ascii?Q?TpyqYh3ToC+6sA4ovF4Xj3+py+fgo9gtC0XCItlDL0hZ5dicE/d32qRCT4m4?=
 =?us-ascii?Q?MUJf8OdRzrKHY+QDdGozroAOBHcZLMeJiKHunWtDZvjwbuPj5FlyBimMQhcV?=
 =?us-ascii?Q?oqQ+W0Nf7tiUeKn4pyEtXWsx3kragq7UnMov29wa0YP8F9+bCmTcqHFcnDl/?=
 =?us-ascii?Q?re8SYwL/eNvXa5ViVZI+a0ob1RU6+a9ZRFwi+xGcIBUS6HmqyOCvzjat5GYZ?=
 =?us-ascii?Q?cioa98kONJh0E8Ilj6UDhGW65blhIsdiaMkHjVtVutMZDWmNwPTZQIlY1BOE?=
 =?us-ascii?Q?hauhJ6StGlw87IHOFP6AMem5F2KMpDCLt/GVqN5LOC2n8OW652vq1qCHcFhH?=
 =?us-ascii?Q?tp21yC4fXKMESbqOG+ANQWePA9kL5Ixq184/2j554DMdeSOw59/zDoc71dh9?=
 =?us-ascii?Q?x75TTW8ic9sT49q5D4yArE7bc2fT3xaYHRnC/UdmiM6/X5UBqZTlAWAGGEQv?=
 =?us-ascii?Q?EuYo1HqNuDXEQviKxU2LR7ZgntV4X5/M2bk93Pq2HpJ7bGx7UyJR?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: aaaf22c6-02f3-4dbc-8e00-08deb237990c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:19.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0zwo4KnvoNu3ZI3OGRLcjuWw3kuT1WDQJYqyygfFCuhX3Zi5687kjxNYHlblNPcRoqYi12+EeuTbPLi0CRN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818104-2B3673FF-C2C68BD9/0/0
X-purgate-type: clean
X-purgate-size: 21249
X-Rspamd-Queue-Id: 3EC3E5491D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Define the RMI v2.0 commands and types Xen needs to manage Realm VPEs.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/rmi-abi.h | 433 +++++++++++++++++++++++++++++++++++++
 1 file changed, 433 insertions(+)
 create mode 100644 xen/arch/arm/cca/rmi-abi.h

diff --git a/xen/arch/arm/cca/rmi-abi.h b/xen/arch/arm/cca/rmi-abi.h
new file mode 100644
index 000000000000..7afb1ae05bca
--- /dev/null
+++ b/xen/arch/arm/cca/rmi-abi.h
@@ -0,0 +1,433 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * RMI v2.0 ABI definitions used by Xen from DEN0137 2.0-bet1.
+ */
+
+#ifndef ARM_CCA_RMI_ABI_H
+#define ARM_CCA_RMI_ABI_H
+
+#include <xen/types.h>
+
+#define ARM_CCA_RMI_ABI_VERSION_MAJOR      2U
+#define ARM_CCA_RMI_ABI_VERSION_MINOR      0U
+#define ARM_CCA_RMI_ABI_VERSION            \
+    (((uint32_t)ARM_CCA_RMI_ABI_VERSION_MAJOR << 16) | \
+     ARM_CCA_RMI_ABI_VERSION_MINOR)
+
+#define ARM_CCA_RMI_VERSION_GET_MAJOR(_v)  ((_v) >> 16)
+#define ARM_CCA_RMI_VERSION_GET_MINOR(_v)  ((_v) & 0xffffU)
+
+#define ARM_CCA_RMI_FID_BASE               0xC4000150U
+#define ARM_CCA_RMI_FID(_off)              (ARM_CCA_RMI_FID_BASE + (_off))
+
+/* DEN0137 2.0-bet1 - B4.5 RMI commands */
+#define ARM_CCA_RMI_VERSION_FID                   ARM_CCA_RMI_FID(0x0)
+#define ARM_CCA_RMI_RTT_DATA_MAP_INIT_FID         ARM_CCA_RMI_FID(0x3)
+#define ARM_CCA_RMI_REALM_ACTIVATE_FID            ARM_CCA_RMI_FID(0x7)
+#define ARM_CCA_RMI_REALM_CREATE_FID              ARM_CCA_RMI_FID(0x8)
+#define ARM_CCA_RMI_REALM_DESTROY_FID             ARM_CCA_RMI_FID(0x9)
+#define ARM_CCA_RMI_REC_CREATE_FID                ARM_CCA_RMI_FID(0xa)
+#define ARM_CCA_RMI_REC_DESTROY_FID               ARM_CCA_RMI_FID(0xb)
+#define ARM_CCA_RMI_REC_ENTER_FID                 ARM_CCA_RMI_FID(0xc)
+#define ARM_CCA_RMI_RTT_CREATE_FID                ARM_CCA_RMI_FID(0xd)
+#define ARM_CCA_RMI_RTT_DESTROY_FID               ARM_CCA_RMI_FID(0xe)
+#define ARM_CCA_RMI_RTT_READ_ENTRY_FID            ARM_CCA_RMI_FID(0x11)
+#define ARM_CCA_RMI_RTT_DEV_VALIDATE_FID          ARM_CCA_RMI_FID(0x13)
+#define ARM_CCA_RMI_PSCI_COMPLETE_FID             ARM_CCA_RMI_FID(0x14)
+#define ARM_CCA_RMI_FEATURES_FID                  ARM_CCA_RMI_FID(0x15)
+#define ARM_CCA_RMI_RTT_FOLD_FID                  ARM_CCA_RMI_FID(0x16)
+#define ARM_CCA_RMI_RTT_INIT_RIPAS_FID            ARM_CCA_RMI_FID(0x18)
+#define ARM_CCA_RMI_RTT_SET_RIPAS_FID             ARM_CCA_RMI_FID(0x19)
+#define ARM_CCA_RMI_VSMMU_CREATE_FID              ARM_CCA_RMI_FID(0x1a)
+#define ARM_CCA_RMI_VSMMU_DESTROY_FID             ARM_CCA_RMI_FID(0x1b)
+#define ARM_CCA_RMI_RMM_CONFIG_SET_FID            ARM_CCA_RMI_FID(0x1e)
+#define ARM_CCA_RMI_PSMMU_IRQ_NOTIFY_FID          ARM_CCA_RMI_FID(0x1f)
+#define ARM_CCA_RMI_PDEV_ABORT_FID                ARM_CCA_RMI_FID(0x24)
+#define ARM_CCA_RMI_PDEV_COMMUNICATE_FID          ARM_CCA_RMI_FID(0x25)
+#define ARM_CCA_RMI_PDEV_CREATE_FID               ARM_CCA_RMI_FID(0x26)
+#define ARM_CCA_RMI_PDEV_DESTROY_FID              ARM_CCA_RMI_FID(0x27)
+#define ARM_CCA_RMI_PDEV_GET_STATE_FID            ARM_CCA_RMI_FID(0x28)
+#define ARM_CCA_RMI_PDEV_STREAM_KEY_REFRESH_FID   ARM_CCA_RMI_FID(0x2a)
+#define ARM_CCA_RMI_PDEV_SET_PUBKEY_FID           ARM_CCA_RMI_FID(0x2b)
+#define ARM_CCA_RMI_PDEV_STOP_FID                 ARM_CCA_RMI_FID(0x2c)
+#define ARM_CCA_RMI_RTT_AUX_CREATE_FID            ARM_CCA_RMI_FID(0x2d)
+#define ARM_CCA_RMI_RTT_AUX_DESTROY_FID           ARM_CCA_RMI_FID(0x2e)
+#define ARM_CCA_RMI_RTT_AUX_FOLD_FID              ARM_CCA_RMI_FID(0x2f)
+#define ARM_CCA_RMI_VDEV_ABORT_FID                ARM_CCA_RMI_FID(0x35)
+#define ARM_CCA_RMI_VDEV_COMMUNICATE_FID          ARM_CCA_RMI_FID(0x36)
+#define ARM_CCA_RMI_VDEV_CREATE_FID               ARM_CCA_RMI_FID(0x37)
+#define ARM_CCA_RMI_VDEV_DESTROY_FID              ARM_CCA_RMI_FID(0x38)
+#define ARM_CCA_RMI_VDEV_GET_STATE_FID            ARM_CCA_RMI_FID(0x39)
+#define ARM_CCA_RMI_VDEV_UNLOCK_FID               ARM_CCA_RMI_FID(0x3a)
+#define ARM_CCA_RMI_RTT_SET_S2AP_FID              ARM_CCA_RMI_FID(0x3b)
+#define ARM_CCA_RMI_VDEV_COMPLETE_FID             ARM_CCA_RMI_FID(0x3e)
+#define ARM_CCA_RMI_VDEV_GET_INTERFACE_REPORT_FID ARM_CCA_RMI_FID(0x80)
+#define ARM_CCA_RMI_VDEV_GET_MEASUREMENTS_FID     ARM_CCA_RMI_FID(0x81)
+#define ARM_CCA_RMI_VDEV_LOCK_FID                 ARM_CCA_RMI_FID(0x82)
+#define ARM_CCA_RMI_VDEV_START_FID                ARM_CCA_RMI_FID(0x83)
+#define ARM_CCA_RMI_VSMMU_EVENT_NOTIFY_FID        ARM_CCA_RMI_FID(0x86)
+#define ARM_CCA_RMI_PSMMU_ACTIVATE_FID            ARM_CCA_RMI_FID(0x87)
+#define ARM_CCA_RMI_PSMMU_DEACTIVATE_FID          ARM_CCA_RMI_FID(0x88)
+#define ARM_CCA_RMI_PSMMU_ST_L2_CREATE_FID        ARM_CCA_RMI_FID(0x8b)
+#define ARM_CCA_RMI_PSMMU_ST_L2_DESTROY_FID       ARM_CCA_RMI_FID(0x8c)
+#define ARM_CCA_RMI_DPT_L0_CREATE_FID             ARM_CCA_RMI_FID(0x8d)
+#define ARM_CCA_RMI_DPT_L0_DESTROY_FID            ARM_CCA_RMI_FID(0x8e)
+#define ARM_CCA_RMI_DPT_L1_CREATE_FID             ARM_CCA_RMI_FID(0x8f)
+#define ARM_CCA_RMI_DPT_L1_DESTROY_FID            ARM_CCA_RMI_FID(0x90)
+#define ARM_CCA_RMI_GRANULE_TRACKING_GET_FID      ARM_CCA_RMI_FID(0x91)
+#define ARM_CCA_RMI_GRANULE_TRACKING_SET_FID      ARM_CCA_RMI_FID(0x93)
+#define ARM_CCA_RMI_RMM_CONFIG_GET_FID            ARM_CCA_RMI_FID(0x9c)
+#define ARM_CCA_RMI_VSMMU_EVENT_COMPLETE_FID      ARM_CCA_RMI_FID(0x9e)
+#define ARM_CCA_RMI_PSMMU_EVENT_DISCARD_FID       ARM_CCA_RMI_FID(0xa0)
+#define ARM_CCA_RMI_GRANULE_RANGE_DELEGATE_FID    ARM_CCA_RMI_FID(0xa1)
+#define ARM_CCA_RMI_GRANULE_RANGE_UNDELEGATE_FID  ARM_CCA_RMI_FID(0xa2)
+#define ARM_CCA_RMI_GPT_L1_CREATE_FID             ARM_CCA_RMI_FID(0xa3)
+#define ARM_CCA_RMI_GPT_L1_DESTROY_FID            ARM_CCA_RMI_FID(0xa4)
+#define ARM_CCA_RMI_RTT_DATA_MAP_FID              ARM_CCA_RMI_FID(0xa5)
+#define ARM_CCA_RMI_RTT_DATA_UNMAP_FID            ARM_CCA_RMI_FID(0xa6)
+#define ARM_CCA_RMI_RTT_DEV_MAP_FID               ARM_CCA_RMI_FID(0xa7)
+#define ARM_CCA_RMI_RTT_DEV_UNMAP_FID             ARM_CCA_RMI_FID(0xa8)
+#define ARM_CCA_RMI_RTT_ARCH_DEV_MAP_FID          ARM_CCA_RMI_FID(0xa9)
+#define ARM_CCA_RMI_RTT_ARCH_DEV_UNMAP_FID        ARM_CCA_RMI_FID(0xaa)
+#define ARM_CCA_RMI_RTT_UNPROT_MAP_FID            ARM_CCA_RMI_FID(0xab)
+#define ARM_CCA_RMI_RTT_UNPROT_UNMAP_FID          ARM_CCA_RMI_FID(0xac)
+#define ARM_CCA_RMI_RTT_AUX_PROT_MAP_FID          ARM_CCA_RMI_FID(0xad)
+#define ARM_CCA_RMI_RTT_AUX_PROT_UNMAP_FID        ARM_CCA_RMI_FID(0xae)
+#define ARM_CCA_RMI_RTT_AUX_UNPROT_MAP_FID        ARM_CCA_RMI_FID(0xaf)
+#define ARM_CCA_RMI_RTT_AUX_UNPROT_UNMAP_FID      ARM_CCA_RMI_FID(0xb0)
+#define ARM_CCA_RMI_REALM_TERMINATE_FID           ARM_CCA_RMI_FID(0xb1)
+#define ARM_CCA_RMI_RMM_ACTIVATE_FID              ARM_CCA_RMI_FID(0xb2)
+#define ARM_CCA_RMI_OP_CONTINUE_FID               ARM_CCA_RMI_FID(0xb3)
+#define ARM_CCA_RMI_PDEV_STREAM_CONNECT_FID       ARM_CCA_RMI_FID(0xb4)
+#define ARM_CCA_RMI_PDEV_STREAM_DISCONNECT_FID    ARM_CCA_RMI_FID(0xb5)
+#define ARM_CCA_RMI_PDEV_STREAM_COMPLETE_FID      ARM_CCA_RMI_FID(0xb6)
+#define ARM_CCA_RMI_PDEV_STREAM_KEY_PURGE_FID     ARM_CCA_RMI_FID(0xb7)
+#define ARM_CCA_RMI_OP_MEM_DONATE_FID             ARM_CCA_RMI_FID(0xb8)
+#define ARM_CCA_RMI_OP_MEM_RECLAIM_FID            ARM_CCA_RMI_FID(0xb9)
+#define ARM_CCA_RMI_OP_CANCEL_FID                 ARM_CCA_RMI_FID(0xba)
+#define ARM_CCA_RMI_VSMMU_FEATURES_FID            ARM_CCA_RMI_FID(0xbb)
+#define ARM_CCA_RMI_VSMMU_CMD_GET_FID             ARM_CCA_RMI_FID(0xbc)
+#define ARM_CCA_RMI_VSMMU_CMD_COMPLETE_FID        ARM_CCA_RMI_FID(0xbd)
+
+/* DEN0137 2.0-bet1 - B4.6.1 RmiAddrBlockSize type */
+#define ARM_CCA_RMI_PAGE_L3                 0U
+#define ARM_CCA_RMI_BLOCK_L2                1U
+#define ARM_CCA_RMI_BLOCK_L1                2U
+#define ARM_CCA_RMI_BLOCK_L0                3U
+
+/* DEN0137 2.0-bet1 - B4.6.5 RmiAddrRangeDesc4KB type */
+#define ARM_CCA_RMI_ADDR_DESC_4K_SZ_SHIFT   0U
+#define ARM_CCA_RMI_ADDR_DESC_4K_SZ_WIDTH   2U
+#define ARM_CCA_RMI_ADDR_DESC_4K_CNT_SHIFT  2U
+#define ARM_CCA_RMI_ADDR_DESC_4K_CNT_WIDTH  10U
+#define ARM_CCA_RMI_ADDR_DESC_4K_ADDR_SHIFT 12U
+#define ARM_CCA_RMI_ADDR_DESC_4K_ADDR_WIDTH 40U
+#define ARM_CCA_RMI_ADDR_DESC_4K_ST_SHIFT   63U
+#define ARM_CCA_RMI_ADDR_DESC_4K_ST_WIDTH   1U
+
+/* DEN0137 2.0-bet1 - B4.6.10 RmiContinueBeyond type */
+#define ARM_CCA_RMI_CONTINUE_KEEP_GOING     0U
+#define ARM_CCA_RMI_CONTINUE_STOP           1U
+
+/* DEN0137 2.0-bet1 - B4.6.12 RmiDataFlags type */
+#define ARM_CCA_RMI_DATA_FLAGS_MEASURE_SHIFT 0U
+#define ARM_CCA_RMI_DATA_FLAGS_MEASURE_WIDTH 1U
+
+/* DEN0137 2.0-bet1 - B4.6.13 RmiDataMeasureContent type */
+#define ARM_CCA_RMI_NO_MEASURE_CONTENT       0U
+#define ARM_CCA_RMI_MEASURE_CONTENT          1U
+
+#define ARM_CCA_RMI_DATA_FLAGS_MEASURE_CONTENT \
+    (ARM_CCA_RMI_MEASURE_CONTENT << ARM_CCA_RMI_DATA_FLAGS_MEASURE_SHIFT)
+
+/* DEN0137 2.0-bet1 - B4.6.22 RmiFeature type */
+#define ARM_CCA_RMI_FEATURE_FALSE                         0U
+#define ARM_CCA_RMI_FEATURE_TRUE                          1U
+
+/* DEN0137 2.0-bet1 - B4.6.23 RmiFeatureRegister0 type */
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_S2SZ_SHIFT          0U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_S2SZ_WIDTH          8U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_LPA2_SHIFT          8U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_LPA2_WIDTH          1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_SHIFT           9U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_WIDTH           1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_VL_SHIFT        10U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_SVE_VL_WIDTH        4U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_BPS_SHIFT       14U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_BPS_WIDTH       6U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_WPS_SHIFT       20U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_WPS_WIDTH       6U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_SHIFT           26U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_WIDTH           1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_NUM_CTRS_SHIFT  27U
+#define ARM_CCA_RMI_FEATURE_REGISTER_0_PMU_NUM_CTRS_WIDTH  5U
+
+/* DEN0137 2.0-bet1 - B4.6.24 RmiFeatureRegister1 type */
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB_SHIFT  0U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB_WIDTH  1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB_SHIFT 1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB_WIDTH 1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB_SHIFT 2U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB_WIDTH 1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_256_SHIFT     3U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_256_WIDTH     1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_384_SHIFT     4U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_384_WIDTH     1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_512_SHIFT     5U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_HASH_SHA_512_WIDTH     1U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_MAX_RECS_ORDER_SHIFT   6U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_MAX_RECS_ORDER_WIDTH   4U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_L0GPTSZ_SHIFT          10U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_L0GPTSZ_WIDTH          4U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_PPS_SHIFT              14U
+#define ARM_CCA_RMI_FEATURE_REGISTER_1_PPS_WIDTH              3U
+
+/* DEN0137 2.0-bet1 - B4.6.27 RmiFeatureRegister4 type */
+#define ARM_CCA_RMI_FEATURE_REGISTER_4_MEC_COUNT_SHIFT 0U
+#define ARM_CCA_RMI_FEATURE_REGISTER_4_MEC_COUNT_WIDTH 64U
+
+/* DEN0137 2.0-bet1 - B4.6.29 RmiGranuleSize type */
+#define ARM_CCA_RMI_GRANULE_SIZE_4KB         0U
+#define ARM_CCA_RMI_GRANULE_SIZE_16KB        1U
+#define ARM_CCA_RMI_GRANULE_SIZE_64KB        2U
+
+/* DEN0137 2.0-bet1 - B4.6.30 RmiHashAlgorithm type */
+#define ARM_CCA_RMI_HASH_SHA_256            0U
+#define ARM_CCA_RMI_HASH_SHA_512            1U
+#define ARM_CCA_RMI_HASH_SHA_384            2U
+
+/* DEN0137 2.0-bet1 - B4.6.35 RmiMecPolicy type */
+#define ARM_CCA_RMI_MEC_POLICY_SHARED       0U
+#define ARM_CCA_RMI_MEC_POLICY_PRIVATE      1U
+
+/* DEN0137 2.0-bet1 - B4.6.36 RmiMemCategory type */
+#define ARM_CCA_RMI_MEM_CATEGORY_CONVENTIONAL 0U
+#define ARM_CCA_RMI_MEM_CATEGORY_DEV_NCOH     1U
+#define ARM_CCA_RMI_MEM_CATEGORY_DEV_COH      2U
+
+/* DEN0137 2.0-bet1 - B4.6.37 RmiOpCanCancel type */
+#define ARM_CCA_RMI_OP_CANNOT_CANCEL        0U
+#define ARM_CCA_RMI_OP_CAN_CANCEL           1U
+
+/* DEN0137 2.0-bet1 - B4.6.38 RmiOpMemContig type */
+#define ARM_CCA_RMI_OP_MEM_NON_CONTIG       0U
+#define ARM_CCA_RMI_OP_MEM_CONTIG           1U
+
+/* DEN0137 2.0-bet1 - B4.6.39 RmiOpMemDonateReq type */
+#define ARM_CCA_RMI_OP_DONATE_BLK_SIZE_SHIFT   0U
+#define ARM_CCA_RMI_OP_DONATE_BLK_SIZE_WIDTH   2U
+#define ARM_CCA_RMI_OP_DONATE_BLK_COUNT_SHIFT  2U
+#define ARM_CCA_RMI_OP_DONATE_BLK_COUNT_WIDTH  14U
+#define ARM_CCA_RMI_OP_DONATE_MEM_CONTIG_SHIFT 16U
+#define ARM_CCA_RMI_OP_DONATE_MEM_CONTIG_WIDTH 1U
+#define ARM_CCA_RMI_OP_DONATE_MEM_STATE_SHIFT  17U
+#define ARM_CCA_RMI_OP_DONATE_MEM_STATE_WIDTH  1U
+
+/* DEN0137 2.0-bet1 - B4.6.40 RmiOpMemReq type */
+#define ARM_CCA_RMI_OP_MEM_REQ_NONE         0U
+#define ARM_CCA_RMI_OP_MEM_REQ_DONATE       1U
+#define ARM_CCA_RMI_OP_MEM_REQ_RECLAIM      2U
+
+/* DEN0137 2.0-bet1 - B4.6.41 RmiOpMemState type */
+#define ARM_CCA_RMI_OP_MEM_DELEGATED        0U
+#define ARM_CCA_RMI_OP_MEM_UNDELEGATED      1U
+
+/* DEN0137 2.0-bet1 - B4.6.60 RmiRealmFlags0 type */
+#define ARM_CCA_RMI_REALM_FLAGS0_MEC_POLICY_SHIFT 7U
+#define ARM_CCA_RMI_REALM_FLAGS0_MEC_POLICY_WIDTH 2U
+#define ARM_CCA_RMI_REALM_FLAGS0_MEC_POLICY(policy) \
+    ((uint64_t)(policy) << ARM_CCA_RMI_REALM_FLAGS0_MEC_POLICY_SHIFT)
+
+/* DEN0137 2.0-bet1 - B4.6.62 RmiRealmParams type */
+#define ARM_CCA_RMI_PARAMS_SIZE             0x1000U
+#define ARM_CCA_RMI_RPV_SIZE                64U
+
+struct arm_cca_rmi_realm_params {
+    uint64_t flags0;
+    uint8_t  s2sz;
+    uint8_t  __pad0[0x10 - 0x09];
+    uint8_t  sve_vl;
+    uint8_t  __pad1[0x18 - 0x11];
+    uint8_t  num_bps;
+    uint8_t  __pad2[0x20 - 0x19];
+    uint8_t  num_wps;
+    uint8_t  __pad3[0x28 - 0x21];
+    uint8_t  pmu_num_ctrs;
+    uint8_t  __pad4[0x30 - 0x29];
+    uint8_t  hash_algo;
+    uint8_t  __pad5[0x38 - 0x31];
+    uint64_t num_aux_planes;
+    uint8_t  __pad6[0x400 - 0x40];
+    uint8_t  rpv[ARM_CCA_RMI_RPV_SIZE];
+    uint64_t ats_plane;
+    uint8_t  __pad7[0x808 - 0x448];
+    uint64_t rtt_base;
+    int64_t  rtt_level_start;
+    uint32_t rtt_num_start;
+    uint8_t  __pad8[0x820 - 0x81c];
+    uint64_t flags1;
+    uint8_t  __pad9[0xf80 - 0x828];
+    uint64_t aux_rtt_base[3];
+    uint8_t  __pad10[ARM_CCA_RMI_PARAMS_SIZE - 0xf98];
+} __packed;
+
+/* DEN0137 2.0-bet1 - B4.6.63 RmiRecCreateFlags type */
+#define ARM_CCA_RMI_REC_CREATE_RUNNABLE     (1UL << 0)
+
+/* DEN0137 2.0-bet1 - B4.6.64 RmiRecEnter type */
+#define ARM_CCA_RMI_REC_ENTER_SIZE          0x800U
+#define ARM_CCA_RMI_REC_NR_GPRS             31U
+
+struct arm_cca_rmi_rec_enter {
+    uint64_t flags;
+    uint8_t  __pad0[0x200 - 0x008];
+    uint64_t gprs[ARM_CCA_RMI_REC_NR_GPRS];
+    uint8_t  __pad1[ARM_CCA_RMI_REC_ENTER_SIZE -
+                    (0x200 + ARM_CCA_RMI_REC_NR_GPRS * 8)];
+} __packed;
+
+/* DEN0137 2.0-bet1 - B4.6.65 RmiRecEnterFlags type */
+#define ARM_CCA_RMI_REC_ENTER_FLAG_EMUL_MMIO        (1UL << 0)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_INJECT_SEA       (1UL << 1)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFI         (1UL << 2)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFE         (1UL << 3)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_RIPAS_RESPONSE   (1UL << 4)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_S2AP_RESPONSE    (1UL << 5)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_DEV_MEM_RESPONSE (1UL << 6)
+#define ARM_CCA_RMI_REC_ENTER_FLAG_FORCE_P0         (1UL << 7)
+
+/* DEN0137 2.0-bet1 - B4.6.66 RmiRecExit type */
+#define ARM_CCA_RMI_REC_EXIT_SIZE           0x800U
+
+struct arm_cca_rmi_rec_exit {
+    uint8_t  exit_reason;
+    uint8_t  __pad0[0x100 - 0x001];
+    uint64_t esr;
+    uint64_t far;
+    uint64_t hpfar;
+    uint64_t rtt_tree;
+    uint8_t  __pad1[0x200 - 0x120];
+    uint64_t gprs[ARM_CCA_RMI_REC_NR_GPRS];
+    uint8_t  __pad2[0x400 - (0x200 + ARM_CCA_RMI_REC_NR_GPRS * 8)];
+    uint64_t cntp_ctl;
+    uint64_t cntp_cval;
+    uint64_t cntv_ctl;
+    uint64_t cntv_cval;
+    uint8_t  __pad3[0x500 - 0x420];
+    uint64_t ripas_base;
+    uint64_t ripas_top;
+    uint8_t  ripas_value;
+    uint8_t  __pad4[0x520 - 0x511];
+    uint64_t s2ap_base;
+    uint64_t s2ap_top;
+    uint64_t vdev_id_1;
+    uint64_t vdev_id_2;
+    uint64_t dev_mem_base;
+    uint64_t dev_mem_top;
+    uint64_t dev_mem_pa;
+    uint8_t  __pad5[0x600 - 0x558];
+    uint16_t imm;
+    uint8_t  __pad6[0x608 - 0x602];
+    uint64_t plane;
+    uint8_t  __pad7[0x700 - 0x610];
+    uint8_t  pmu_ovf_status;
+    uint8_t  __pad8[0x710 - 0x701];
+    uint64_t vsmmu;
+    uint8_t  __pad9[ARM_CCA_RMI_REC_EXIT_SIZE - 0x718];
+} __packed;
+
+/* DEN0137 2.0-bet1 - B4.6.67 RmiRecExitReason type */
+#define ARM_CCA_RMI_EXIT_SYNC                  0U
+#define ARM_CCA_RMI_EXIT_IRQ                   1U
+#define ARM_CCA_RMI_EXIT_FIQ                   2U
+#define ARM_CCA_RMI_EXIT_PSCI                  3U
+#define ARM_CCA_RMI_EXIT_RIPAS_CHANGE          4U
+#define ARM_CCA_RMI_EXIT_HOST_CALL             5U
+#define ARM_CCA_RMI_EXIT_SERROR                6U
+#define ARM_CCA_RMI_EXIT_S2AP_CHANGE           7U
+#define ARM_CCA_RMI_EXIT_VDEV_REQUEST          8U
+#define ARM_CCA_RMI_EXIT_VDEV_VALIDATE_MAPPING 9U
+#define ARM_CCA_RMI_EXIT_VSMMU_COMMAND         10U
+
+/* DEN0137 2.0-bet1 - B4.6.69 RmiRecParams type */
+#define ARM_CCA_RMI_REC_CREATE_NR_GPRS      8U
+
+struct arm_cca_rmi_rec_params {
+    uint64_t flags;
+    uint8_t  __pad0[0x100 - 0x008];
+    uint64_t mpidr;
+    uint8_t  __pad1[0x200 - 0x108];
+    uint64_t pc;
+    uint8_t  __pad2[0x300 - 0x208];
+    uint64_t gprs[ARM_CCA_RMI_REC_CREATE_NR_GPRS];
+    uint8_t  __pad3[ARM_CCA_RMI_PARAMS_SIZE -
+                    (0x300 + ARM_CCA_RMI_REC_CREATE_NR_GPRS * 8)];
+} __packed;
+
+/* DEN0137 2.0-bet1 - B4.6.70 RmiRecRun type */
+#define ARM_CCA_RMI_REC_RUN_SIZE            0x1000U
+
+struct arm_cca_rmi_rec_run {
+    struct arm_cca_rmi_rec_enter enter;
+    struct arm_cca_rmi_rec_exit  exit;
+} __packed;
+
+/* DEN0137 2.0-bet1 - B4.6.73 RmiResult type */
+#define ARM_CCA_RMI_RESULT_STATUS_SHIFT     0U
+#define ARM_CCA_RMI_RESULT_STATUS_WIDTH     8U
+#define ARM_CCA_RMI_RESULT_DATA_SHIFT       8U
+
+/* DEN0137 2.0-bet1 - B4.6.74 RmiResultDataIncomplete type */
+#define ARM_CCA_RMI_RESULT_INCOMPLETE_MEM_SHIFT        0U
+#define ARM_CCA_RMI_RESULT_INCOMPLETE_MEM_WIDTH        2U
+#define ARM_CCA_RMI_RESULT_INCOMPLETE_CAN_CANCEL_SHIFT 2U
+#define ARM_CCA_RMI_RESULT_INCOMPLETE_CAN_CANCEL_WIDTH 1U
+
+/* DEN0137 2.0-bet1 - B4.6.77 RmiRipas type */
+#define ARM_CCA_RMI_RIPAS_EMPTY             0U
+#define ARM_CCA_RMI_RIPAS_RAM               1U
+#define ARM_CCA_RMI_RIPAS_DESTROYED         2U
+#define ARM_CCA_RMI_RIPAS_DEV               3U
+
+/* DEN0137 2.0-bet1 - B4.6.78 RmiRmmConfig type */
+#define ARM_CCA_RMI_RMM_CONFIG_SIZE         0x1000U
+#define ARM_CCA_RMI_TRACKING_4KB_REGION_1GB 0U
+
+struct arm_cca_rmi_rmm_config {
+    uint8_t  tracking_region_size;
+    uint8_t  __pad0[0x8 - 0x1];
+    uint8_t  rmi_granule_size;
+    uint8_t  __pad1[ARM_CCA_RMI_RMM_CONFIG_SIZE - 0x9];
+} __packed;
+
+/* DEN0137 2.0-bet1 - B4.6.80 RmiRttAddrType type */
+#define ARM_CCA_RMI_ADDR_TYPE_NONE          0U
+#define ARM_CCA_RMI_ADDR_TYPE_SINGLE        1U
+#define ARM_CCA_RMI_ADDR_TYPE_LIST          2U
+
+/* DEN0137 2.0-bet1 - B4.6.93 RmiStatusCode type */
+#define ARM_CCA_RMI_SUCCESS                 0U
+#define ARM_CCA_RMI_ERROR_INPUT             1U
+#define ARM_CCA_RMI_ERROR_REALM             2U
+#define ARM_CCA_RMI_ERROR_REC               3U
+#define ARM_CCA_RMI_ERROR_RTT               4U
+#define ARM_CCA_RMI_ERROR_NOT_SUPPORTED     5U
+#define ARM_CCA_RMI_ERROR_DEVICE            6U
+#define ARM_CCA_RMI_ERROR_RTT_AUX           7U
+#define ARM_CCA_RMI_ERROR_PSMMU_ST          8U
+#define ARM_CCA_RMI_ERROR_DPT               9U
+#define ARM_CCA_RMI_BUSY                    10U
+#define ARM_CCA_RMI_ERROR_GLOBAL            11U
+#define ARM_CCA_RMI_ERROR_TRACKING          12U
+#define ARM_CCA_RMI_INCOMPLETE              13U
+#define ARM_CCA_RMI_BLOCKED                 14U
+#define ARM_CCA_RMI_ERROR_GPT               15U
+#define ARM_CCA_RMI_ERROR_GRANULE           16U
+
+/* DEN0137 2.0-bet1 - B4.6.94 RmiTrackingRegionState type */
+#define ARM_CCA_RMI_TRACKING_RESERVED       0U
+#define ARM_CCA_RMI_TRACKING_NONE           1U
+#define ARM_CCA_RMI_TRACKING_FINE           2U
+#define ARM_CCA_RMI_TRACKING_COARSE         3U
+
+#endif /* ARM_CCA_RMI_ABI_H */
-- 
2.51.0


