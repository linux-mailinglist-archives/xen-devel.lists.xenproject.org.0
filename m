Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I4YxDH4TVmpYywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:46:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B2753898
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=dtoOIwa3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362151.1614071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaeT-0007D0-Js; Tue, 14 Jul 2026 10:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362151.1614071; Tue, 14 Jul 2026 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaeT-0007AQ-GI; Tue, 14 Jul 2026 10:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1362151;
 Tue, 14 Jul 2026 10:46:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjaeS-000766-6D
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:46:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjaeR-009uid-J2
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:46:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561370-2eae-0a2a0a5409dd-0a2a4501e9c4-12
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:46:11 +0200
Received: from [52.101.125.121]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561370-5984-0a2a45010019-34657d792ce5-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:46:10 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7347.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:46:06 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:46:06 +0000
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
 b=t8Ef3FD9pWRN0ERT84tbwVLPGPcp+pu0fDfFIJUl8Pvt4xiX5/P+R0p7ysV4yDoSvaC+eFSaKog3bQzXaHqaxuZ/kRJzm3NAGYPSzW7kL5u3TiWWBV3tdo/eby5XVaYZ+e7mkQP77+Jh3eo8Lqf+aJn6IsRD28w18Uq5nCmhnRsru46N9RW92b7HpNAmss79QY5WJe7xZp/NBdB5CLDn0Ud908BaOV8z3J3lTnG0pkEkE0AXsPJQSP9ApndmpNnqm/cO6VUj+OiLN7DWa5kCNyoRx8KDpXuy2q4lL+uyqf6Fx1JcTotePfxrQfTo7klUKwuRmzVGcC/7E2yEWmPPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1Oex6Jp2bEa6wsCxPupOWjWoJICYxBHDdDfwmwaE6g=;
 b=yTC2uQPs94XWNoLaIC44xaB66FGvU1hQcbe+OPiDOClzcpzSHAx3LKT7MhuGe0SYdgA5MnWq9Ofet0VtWMnHicR7f6mPUAAMb13z+43knT+C9hkymn7rOpCx9rRyw3iPqyGZdEIrKFAk5FEAZgAwESe5nbqwqWjCqrPvMQmA7Xgn73IkBovdZ2br2SHLX6avC/rAB31qTXam/V4bwyRvp99vYgSZF4yPEZ7bbFkhefPnjKLisajZhcsj0UohVoWpXmpvBo85YjX3aS7n3A/p5Lp/EXMFUxF35Bd6iprqln1FWb/yUpW6hnH4FIKVXYNuwYv+Zczwbl6DtFDq3oVN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1Oex6Jp2bEa6wsCxPupOWjWoJICYxBHDdDfwmwaE6g=;
 b=dtoOIwa3PkftxVGwpFPLWyyA+24ye0SAlKwV1yvM2lipFs68sG7/PVeIgilTgiFBheWJfawbB9FSfoFIl7UkgBkeK1RZOA5svERKLHvqizcBuC1Ghiwc+PfEjk6EwdTof7YJMj0BX5p+xyxL2nEg5i2Dv7/7EziPE3PQp3bWjEA=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 4/5] xen/acpi: Import PPTT definitions from Linux
Date: Tue, 14 Jul 2026 19:44:44 +0900
Message-ID: <20260714104445.919830-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714104445.919830-1-taka@valinux.co.jp>
References: <20260714104445.919830-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY6P286MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffacc93-b212-4e0b-533e-08dee1951bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10070799003|18002099003|22082099003|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	0zwsD2pXdiR7YW1mAo7bqCVZtrKLTcADMSO1H2AYVpLozNsyIVJHbW8b8W4JSwuHmqxLX8lxfB+/8p1RlP587c3yw5F+a2bgx2o3TWcZ38WDvNwFdC1a+zbtiajN7ImalxwPawBI4dXHGCodqYrBLRezhlUd8YJyxvyYY/NK0GJt4ZMfvKYKC49eGo/0WQgV0YJ4DZB8C0tgix+LuHSaVTqzlSZ38Bcj+AY+mmjKMHrNqfeBWsHILoxMs4zmUcCfzcKX3FtI3TKyKFJ0MyO8a8cpHsWRxzimQ5fQWx3c/QKOL/jRcfNVqIgqpZ/KJnAJmfc0K2ADCcABcvcxVonBPKq2HDPg3bugdUUiOiz4JMaPoE86abyF4/Z1MhFDCMRiVygT8hctA+ZV8hh/o8ASVPLEb+iwyoMZVWiHRi1uFWVK3xcj5Bjtfrsd2Ha9eYlsy3kyf5JIJEhQN0x+etUuSge5LIFO32nR9ntackcDZvbcAC3x6xuNeEuknJZ4WQVhk0necRHLKCo0xAMy5c2VXbYXasScvZoR2utVut4OXPZtVcwnxjIyqjDKuxKY+X2dIiyoTtxAbzwpWRvawYO1YudH4mhyNPju/vNbFApnvvE06oVy1PVM8BOY+IJ/uuFHwIqlQtmb83wuBXoS+2DA0bIHfF64El31q062dkDVfvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10070799003)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A662HdYSgjRZej7vh/5BIbK9aoAhcdeRu11j6E/KsIbT+IHq9ND3nav7rpD3?=
 =?us-ascii?Q?nCpyethdapQOwbTDwHKSq2jsBOEwF7r3jTWzTr7az2bl6JyUT2gj71F/HsGu?=
 =?us-ascii?Q?EhoosDA+HTiyVkiBEVrwvOmPT1YMmg0WZUjsiO06KoE/GtQ0+PWYox2BEacn?=
 =?us-ascii?Q?SEoUTPc6D95X5RlZ/UWynkFplJ+guHn+vQQJYWvTQWi3uhDZ9wrpiOiMAKM9?=
 =?us-ascii?Q?wrkiLE0TiapUiFQ4FqoLBiOOememkeDfYFTHDNRQhk8eDsWXDaBYqhcpq2Ix?=
 =?us-ascii?Q?Xmi+YqpFTzMHmlXsRllKrxGL14ElGQLuVwDW3mhjmxBdaP1zlHi1eH3MVpK6?=
 =?us-ascii?Q?ShiB0BoFOHXJSpwzmFOmQBC2ogIjIP5UxaLTwZ79EwKuRi8RFDAjZHd1xFjx?=
 =?us-ascii?Q?KZIBXjTylRm7fwEESNB38Lk3sHU5ZnnbUkhZ7HSejR5HP4POG7ks4Znl8eOe?=
 =?us-ascii?Q?q2YeaQpbaMfSPpHN3wvsRIXaNNnEbVMyeC+NtocuZ+z/N9FmwN6dzBVkCJt6?=
 =?us-ascii?Q?uaxmV8bzELVGzhjJT9Rb6L5TKCJ3++w3It73rVtak5gZRhsyc9yIzb/Ni2mu?=
 =?us-ascii?Q?fsWPO3bGgQgn7K1wIHfwI4mquCE0UtKhjpv+KvUrgAEQtIzynlbgZElzCX2b?=
 =?us-ascii?Q?Q1+HSxE7gfppbXQmR44FuGEO8QnL5JmOzTX6fuSkX/FHFUoZFCmhYSbOEQMJ?=
 =?us-ascii?Q?FeHk+fZhVXfYWHh1BUeV00b6Al2HNXTSfQPXckBc0O1zoBabuA0v/WR0GncZ?=
 =?us-ascii?Q?jDwSBxHHc3tkEqC51ZEF21eKSRwPSsfqH8g71X3gLqSUkZQoeDnUe7P/E/WL?=
 =?us-ascii?Q?XOAmrmolnfjLNonhkogFC+2CjDKkYuXKO+xBwBp/N6vDtjwRRBTx9Z+YwiB8?=
 =?us-ascii?Q?sLhKlhVx1JLZGguwwFxCI3TNOfulfhRlR2bZoAjaMJkWnpxL+JxSniHZGLJ8?=
 =?us-ascii?Q?J0A+KR05YY2kZub0gZWTnGedmZg2/SohY9EeYgoHXHTKLJfUYPJ7Q1g+CAOo?=
 =?us-ascii?Q?b91HkjXbJIV5VYsXxkH3lErETIvXE0Zzz3xCeDR8ZZnAHPI/0PfiRBbfHG13?=
 =?us-ascii?Q?eS9r8dUcoSB5Jj7lXiAgs34nfk390ZMZ61Kmu1bUCi5NKCwLcmA9bwKMucYx?=
 =?us-ascii?Q?bRWVxvM/kasFFFXiQehz0Lc5c7ju2ajSOV6i0wtVm+OWdFfhZ93KhoRy2k34?=
 =?us-ascii?Q?auvjj0skdeje/ImoOIzAmddef8HQD1NBfGVcwCPKEwESQODz43xa0273KbbH?=
 =?us-ascii?Q?/8N+58z6DaENuN9GIn73WfnxYc3qz1VgwBN1GOmLhkTyiqXaJg1kiKTU21Wh?=
 =?us-ascii?Q?9F/pIPGVQa6XJMAsghJKupJ5A6cObFU9MLbpmF3sIdwIeqie8xy111S5R+Js?=
 =?us-ascii?Q?mr5bzq++tXzo6TkgogCCfwq1Xb8lgKYcIU2lPbco6IGE8EqYeULWD/ffo066?=
 =?us-ascii?Q?tvZDJjGDF1rjecimxAmzlKiGSX1JsijSi45M1nBpvinaQ0Bo4+5NKrQk/7IW?=
 =?us-ascii?Q?gOZ0z+L5j3v+gAH00Ki3BDhEtuhOr9QhIMVToCww/RJqJtTNZIGIPgJfDchm?=
 =?us-ascii?Q?OjvU0EQ2cQkbQ9NZA8j+3XMOSKeWZ2azpF7slvmOaZ+S+UJHsZDNPrsZf42W?=
 =?us-ascii?Q?8N6b+bUksPG22v65PAornRZaku7GzkhgCJ+/mwdNMfTOOQy5ghiTPxsnYEfs?=
 =?us-ascii?Q?82zKN8q3CtqS+YkxAkeqo77sTbojYw1lNtyuagRswMKadlHh1joVcmB/CXli?=
 =?us-ascii?Q?Qn9LdofOiNAexP9lQ2oiT7K1rX9/Msnbjxzo4EZylch2PSm1hQ7dBq1rbgcb?=
X-MS-Exchange-AntiSpam-MessageData-1: fwG1NlQQUUbllw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffacc93-b212-4e0b-533e-08dee1951bc0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:46:06.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7usOsSE5IwirrrBqMxw4WjGQAQshAV5JyIZZLd4xFdRfOrV7Rq0r5IbCLDBu7hOUerWFKwj5y5lrnr3Fr6KtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7347
X-purgate-ID: tlsNG-d62444/1784025970-1D47D757-5AD2A1A5/0/0
X-purgate-type: clean
X-purgate-size: 5269
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:from_mime,valinux.co.jp:mid,valinux.co.jp:email,valinux.co.jp:dkim];
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
X-Rspamd-Queue-Id: 865B2753898

Import the Processor Properties Topology Table (PPTT) definitions
from the Linux kernel header (include/acpi/actbl2.h) into Xen.

Origin: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git 091c4af3562d
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v6:
   * Split out the import of ACPI PPTT definitions from the Linux kernel
     (including unused definitions) into a separate standalone patch.

 xen/include/acpi/actbl2.h | 113 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/xen/include/acpi/actbl2.h b/xen/include/acpi/actbl2.h
index ee96e990d6..4398d98e00 100644
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -72,6 +72,7 @@
 #define ACPI_SIG_IVRS           "IVRS"	/* I/O Virtualization Reporting Structure */
 #define ACPI_SIG_MCFG           "MCFG"	/* PCI Memory Mapped Configuration table */
 #define ACPI_SIG_MCHI           "MCHI"	/* Management Controller Host Interface table */
+#define ACPI_SIG_PPTT           "PPTT"	/* Processor Properties Topology Table */
 #define ACPI_SIG_SLIC           "SLIC"	/* Software Licensing Description Table */
 #define ACPI_SIG_SPCR           "SPCR"	/* Serial Port Console Redirection table */
 #define ACPI_SIG_SPMI           "SPMI"	/* Server Platform Management Interface table */
@@ -937,6 +938,118 @@ struct acpi_table_mchi {
 	u8 pci_function;
 };
 
+/*******************************************************************************
+ *
+ * PPTT - Processor Properties Topology Table (ACPI 6.2)
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_pptt {
+	struct acpi_table_header header;	/* Common ACPI table header */
+};
+
+/* Values for Type field above */
+
+enum acpi_pptt_type {
+	ACPI_PPTT_TYPE_PROCESSOR = 0,
+	ACPI_PPTT_TYPE_CACHE = 1,
+	ACPI_PPTT_TYPE_ID = 2,
+	ACPI_PPTT_TYPE_RESERVED = 3
+};
+
+/* 0: Processor Hierarchy Node Structure */
+
+struct acpi_pptt_processor {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 flags;
+	u32 parent;
+	u32 acpi_processor_id;
+	u32 number_of_priv_resources;
+};
+
+/* Flags */
+
+#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
+#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1<<1)
+#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1<<2)	/* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_LEAF_NODE            (1<<3)	/* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_IDENTICAL            (1<<4)	/* ACPI 6.3 */
+
+/* 1: Cache Type Structure */
+
+struct acpi_pptt_cache {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 flags;
+	u32 next_level_of_cache;
+	u32 size;
+	u32 number_of_sets;
+	u8 associativity;
+	u8 attributes;
+	u16 line_size;
+};
+
+/* 1: Cache Type Structure for PPTT version 3 */
+
+struct acpi_pptt_cache_v1 {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 flags;
+	u32 next_level_of_cache;
+	u32 size;
+	u32 number_of_sets;
+	u8 associativity;
+	u8 attributes;
+	u16 line_size;
+	u32 cache_id;
+};
+
+/* Flags */
+
+#define ACPI_PPTT_SIZE_PROPERTY_VALID       (1)	/* Physical property valid */
+#define ACPI_PPTT_NUMBER_OF_SETS_VALID      (1<<1)	/* Number of sets valid */
+#define ACPI_PPTT_ASSOCIATIVITY_VALID       (1<<2)	/* Associativity valid */
+#define ACPI_PPTT_ALLOCATION_TYPE_VALID     (1<<3)	/* Allocation type valid */
+#define ACPI_PPTT_CACHE_TYPE_VALID          (1<<4)	/* Cache type valid */
+#define ACPI_PPTT_WRITE_POLICY_VALID        (1<<5)	/* Write policy valid */
+#define ACPI_PPTT_LINE_SIZE_VALID           (1<<6)	/* Line size valid */
+#define ACPI_PPTT_CACHE_ID_VALID            (1<<7)	/* Cache ID valid */
+
+/* Masks for Attributes */
+
+#define ACPI_PPTT_MASK_ALLOCATION_TYPE      (0x03)	/* Allocation type */
+#define ACPI_PPTT_MASK_CACHE_TYPE           (0x0C)	/* Cache type */
+#define ACPI_PPTT_MASK_WRITE_POLICY         (0x10)	/* Write policy */
+
+/* Attributes describing cache */
+#define ACPI_PPTT_CACHE_READ_ALLOCATE       (0x0)	/* Cache line is allocated on read */
+#define ACPI_PPTT_CACHE_WRITE_ALLOCATE      (0x01)	/* Cache line is allocated on write */
+#define ACPI_PPTT_CACHE_RW_ALLOCATE         (0x02)	/* Cache line is allocated on read and write */
+#define ACPI_PPTT_CACHE_RW_ALLOCATE_ALT     (0x03)	/* Alternate representation of above */
+
+#define ACPI_PPTT_CACHE_TYPE_DATA           (0x0)	/* Data cache */
+#define ACPI_PPTT_CACHE_TYPE_INSTR          (1<<2)	/* Instruction cache */
+#define ACPI_PPTT_CACHE_TYPE_UNIFIED        (2<<2)	/* Unified I & D cache */
+#define ACPI_PPTT_CACHE_TYPE_UNIFIED_ALT    (3<<2)	/* Alternate representation of above */
+
+#define ACPI_PPTT_CACHE_POLICY_WB           (0x0)	/* Cache is write back */
+#define ACPI_PPTT_CACHE_POLICY_WT           (1<<4)	/* Cache is write through */
+
+/* 2: ID Structure */
+
+struct acpi_pptt_id {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 vendor_id;
+	u64 level1_id;
+	u64 level2_id;
+	u16 major_rev;
+	u16 minor_rev;
+	u16 spin_rev;
+};
+
 /*******************************************************************************
  *
  * SLIC - Software Licensing Description Table
-- 
2.43.0


