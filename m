Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tHFkGO70NGoZlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13066A4744
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=GgtkNk+e;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341807.1602187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU0E-0003Ft-J2; Fri, 19 Jun 2026 07:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341807.1602187; Fri, 19 Jun 2026 07:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU0E-000369-1q; Fri, 19 Jun 2026 07:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1341807;
 Fri, 19 Jun 2026 07:50:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waU0B-0002kI-Pe
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waU0B-00Dy7y-61
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d0-e002-0a2a0a5209dd-0a2a4506dc90-42
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:59 +0200
Received: from [52.101.125.91]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4de-b690-0a2a45060019-34657d5ba6ec-5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:58 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB6155.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 07:50:55 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:55 +0000
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
 b=C8c8wyeC7ZcppBS0A3hkTYpajo8E2NiJVi1Q/JTkX8B2PfVeH+wnhaXJyXtiF75P5xwAt3PLLpoU3Ls/igCZqeYHjCJKvf032nsHm4YUyRySJL4LqhGJ+Hc0OhJm+56bIiyWds8JN7R0AhuSdWWBIoqvpmev1WIvjfTiHKZMXKn2ksEF675yPN/XitOSF1P0QQTJp8waPdfGhxADAOnEY+zJf+lQ5n3LmZj1TomBJ6WoN4SMe/JgeT9KGXcjyzJBzgAFidvEEtF+/9+HcnYHelil+lxETqA1vmtHy6XXIcNYBHMk9gpUqFSqQZ0gxCsPx9rw0Pynare7P+bt0TaREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2uO4CWFN3sk+OKUBgM2NipSp0voK+WIqimBi6qcm4A=;
 b=mvhHa6ccb3TnhFzGq9K5s04MXt+Z//9wdAJjjgLQdbo7RJQ5Szjf4bYK3AP+lYpSyi91/nIONC6si6BR3teg18bJU8g9ycATQwQtQG807LVpP7KA29IrFsk8N6nFbPD0xH//7a50ud+D//pR9UJl0W40V9sGwwYo6jA6EW+OLBuWs7rd5KMbg1jzp3Ibmm155B0XbtfTZkUxFMzGL4rPMk14dY6PziagqmN4BoVnYKgY3ATu5m+Ky3i7rkhnCd4LmptOFJFxUXD84j9Yph+NqPojGjTRr59mA+qNO3yxOnz5TjWhx277D2kYwoVqgzyI8o3AXrCdakvjsiL6Il2xlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2uO4CWFN3sk+OKUBgM2NipSp0voK+WIqimBi6qcm4A=;
 b=GgtkNk+ek8ITO5qac5LjSUDo/Aq/zz+tYdus5/5HpmFSt/I1ve9kmezycR9KysVDRF4rCTO6plKw41Kjzq2gka9HkzPpjRa/vC2V+Wbj3WVTUxEkdXjBaBzsjG2lnwrGws4kEB4ZGEID0VHsohezeVF4dnP0N039UDhheq6wGrA=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 22/22] xen/arm: Support numa and dom0_nodes boot options
Date: Fri, 19 Jun 2026 16:50:10 +0900
Message-ID: <20260619075011.377116-23-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf4e9e1-ef19-43a2-a58f-08decdd77e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	C09t+UlrxXZgNnSOsxEPF0t/AllcRkMTwuKZHRLHxLtTuNBMgbVZG9XAxmGlIgwP+BEirLA5+pNeX//N8D/Le54jLFzSSmMi7ZdyBaSnFPwZK1ZoS9uQpu7dwcgWJxNvKCzJRsQcgnCmzASB2KD+LD2VioDNl2PSP9UgE7nRrpML5IzG1/y6Ufg9XiiewyaGe4wdCGb8qLbeGXVp/x0Dl0cB/f5jq2M+8+gl1RxUDEIDCR0yn8Cy1CGYLJ0bIzuHLSMTW0WSYh5tSPJ/+bBnMNadh0nLrFm1kL95VMVgxHDDrm40vMOZbs0AspM9pI0phNfM7Ozjvq8V6HIeUeLJPHklOJi21FhzrHVrnVVdC4HVylhk2uw5pIfKTjPv35Wb0hPbeCjXyaZKdWBGdpJGhk39zKXGPdB325MSSCkunwTKBTaBSbDmxIXQMPITNzeGpUfnLnK1N2mxBhEINI45wG0I7Q9PU2NaP4t90otw5kyCYSoUXxBOuNCd3mdS9ZSFAy9keTiHt87jKXSbSFiNPUGu7TRn1LZG4qHMB1xiiLPmEGm1jaaHKzSnDeQFPVDbp3IJRKv3/KJcqsw4MsEOAtX5Fakw+R1edHtx8Iezh4K0HwmADq7VnGcszATidBTlgjYmjZc8k5aqqOloy7mAaofSPqd2P5VrJ3XHpg3R5IE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tfs9ytiYob4Zz9mzEMQ1gtb3ilybgU00zq768cT/qPe/h/YpR8qX/aaoJlpP?=
 =?us-ascii?Q?CNKsMLEQHULEALOQHBUL0qDf0WFHmO4WPQOFTnMfXiQHsYTNjZtxwcBhs8z4?=
 =?us-ascii?Q?HKcoOueP6xmt+kN9SmwyctESMIJne9hDHFNK9Ue6g83lHW493vc2CJd9NU18?=
 =?us-ascii?Q?pi+k7Fqg/gRo9Z0rTebd6aT4zyyWpCj/g2iBgarffPemv+kY8/4n4+01Xl1t?=
 =?us-ascii?Q?zdLHKigzafGTtvyVBQuwOhqH/juMCaBibHhGw83tdezgT3Ox0bv/5SkNURMc?=
 =?us-ascii?Q?irLEXnj2cTnokbRNiIKb7Je0w2j+xUlMCL9sl+dfbH0UJ5cJ4fQDiWVbLoMD?=
 =?us-ascii?Q?LINXiCF5vx5vWMHVsBWy8tSnsNe1sDAvFnZ3gFNmJCd3hFTzUSmOf+iPf8zs?=
 =?us-ascii?Q?g9c2faxhyJdPQDYVdqZTzrzTiU1vW0U+fAzUfkU4dvSLuwam+DwqCTXn5DHO?=
 =?us-ascii?Q?3rxlCZC32WLHUeG4ikr9+wkDnX0REnFTkclIGDoPERqBG0G6hMy5LcfoGpRk?=
 =?us-ascii?Q?XfM68RIOwS5L5kMF4lyeBYhGpvgG3esaE3Dg75EM0PHsKo63+XuGGAVuEFle?=
 =?us-ascii?Q?PcH+6rHGgz4d212gX+bqxgNa/ombxYU32R4XZbh5A68AtWKwCOBeZ3q2y4vK?=
 =?us-ascii?Q?f2uUTjeO1myRZ2IgOHe5Ufv7CMPFNtTG3x5pS+Ehdbp/1sCiAWxxphk1A5ha?=
 =?us-ascii?Q?SZvhtAqfL0kBh+UZ7qQxOHX5o2Uc8YfzlI6DaWPM7vDUacmPaVPHDZdhwnxZ?=
 =?us-ascii?Q?mqDla6YMHb3ZPSgJD1GjREE54bwM320QJOioJN1qMQGK8WK8YODhv5nIg3P/?=
 =?us-ascii?Q?T2dEPUHr6BOYiIfUSJVntUrLchO5QTbaXjFTgHukocFbvCM0OkF3SaDlJ7VJ?=
 =?us-ascii?Q?7zaAQxCMk+XHPqloIMfWBZ0PdDm1TFD/4fXbNtwijzGEB6o8RCD5VyH0F+dn?=
 =?us-ascii?Q?FX2eWFS0bV1Vr12w10z42owcQtbCpHmtFc5+w7M4VpfWthmcQl41m+m0w83O?=
 =?us-ascii?Q?KHB3a/FQdwWMRUxdNEJMMkunQVQb3E/AlP24iNfypi+x+Bddi8QVeHHkCHGO?=
 =?us-ascii?Q?+7jzh+Bjpn80/XBgl86jXD/q9t75Qz6SdWjagyYGdcmPXNPsqkF/tb/+d5FZ?=
 =?us-ascii?Q?sjrjww3q935nGZXxDFtRm9tGMZ6fWBUzT8AbvQFZV9SbTZaiFmjBCYZqIEcU?=
 =?us-ascii?Q?GI9+61fb3OT0STe0CsWmb9ifWmprJokXrndoW2CzhT5BgJt+NZ761Wu1UjCT?=
 =?us-ascii?Q?XHihFNvWf4nceHKsjKDClLZfZ/+eHCL8XyVaC7dHRKej4oyULOgSxwK0Ryu/?=
 =?us-ascii?Q?oTii4TQoEJcdrgLXJkFGhtCkH1sAqeHbcJUpgAZL31m7HRm1DVF7B7pqrPmN?=
 =?us-ascii?Q?WcdOgN4AoBmZt8eUljd5JF4uir3EygzVn8jQULYPDRx0RnMYvES5jWcpObvZ?=
 =?us-ascii?Q?KNQUXnvdCFgoJHRgP1rVoAVdupcGTniR2SX+lx//oSJ8P7qChVYudkIQZhcD?=
 =?us-ascii?Q?4sGFmM30MmaNXu+Dbopk1NW4liV5/gDOmgWkN33wN6DG6cwAYLQc4SUMFSUe?=
 =?us-ascii?Q?FskITqVtBjbKUophSGIzMIM+oK9v4Ei3Y0yoGCQ00yNznjuk2ltOW5aIEXKP?=
 =?us-ascii?Q?5/h4MrxIB+GRKTFOamkypEWuseIFYM6te8LmTurev4rWaPtREewZ/b090MJ+?=
 =?us-ascii?Q?T5v5JB4UBX1AO/P6ReR/kcU+QDJl9ShuRh0WtuJYSzZmuUiCym4awHe+qlnk?=
 =?us-ascii?Q?pczbALI2diCfAbRLZjp3ZWK5ZhiORsn/OJjhHLftvq6NBhn01VAOrSps3vny?=
X-MS-Exchange-AntiSpam-MessageData-1: ubWYwCNSQRaOUg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf4e9e1-ef19-43a2-a58f-08decdd77e6d
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:55.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sVeGywfWEbwzIUFjwjTIV/w7me1QZJZzPiI0APw6TvvsgMyhf5UsCJvJ1WRimKeoMblrDxlK9F5oICfqSthrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB6155
X-purgate-ID: tlsNG-16d1c6/1781855459-B37E3853-0963C665/0/0
X-purgate-type: clean
X-purgate-size: 1768
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D13066A4744

The numa_nodes command line option is now supported on ARM Xen.
Its usage is almost identical to x86 Xen. The key difference is that
while x86 uses ACPI PXM values to specify nodes, ARM uses the
values defined in the device tree (numa-node-id).

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 docs/misc/xen-command-line.pandoc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c711fa980..bb23f1fb15 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1050,7 +1050,7 @@ Practices](https://wiki.xen.org/wiki/Xen_Best_Practices#Xen_dom0_dedicated_memor
 
 This option doesn't have effect if pv-shim mode is enabled.
 
-### dom0_nodes (x86)
+### dom0_nodes (x86, arm)
 
 > `= List of [ <integer> | relaxed | strict ]`
 
@@ -1059,8 +1059,9 @@ This option doesn't have effect if pv-shim mode is enabled.
 Specify the NUMA nodes to place Dom0 on. Defaults for vCPU-s created
 and memory assigned to Dom0 will be adjusted to match the node
 restrictions set up here. Note that the values to be specified here are
-ACPI PXM ones, not Xen internal node numbers. `relaxed` sets up vCPU
-affinities to prefer but be not limited to the specified node(s).
+ACPI PXM ones, not Xen internal node numbers, or node IDs in the device
+tree. `relaxed` sets up vCPU affinities to prefer but be not limited to
+the specified node(s).
 
 ### dom0_vcpus_pin
 > `= <boolean>`
@@ -2018,7 +2019,7 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
-### numa (x86)
+### numa (x86, arm)
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.43.0


