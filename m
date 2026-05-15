Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDJTNmKcBmoylQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D45491B5
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309341.1580391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqi-0002Ic-LA; Fri, 15 May 2026 04:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309341.1580391; Fri, 15 May 2026 04:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqi-0002CF-FQ; Fri, 15 May 2026 04:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1309341;
 Fri, 15 May 2026 04:08:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqg-0001oY-DC
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqf-00GbfP-PR
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069bea-2eae-0a2a0a5409dd-0a2a4502b15c-48
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:29 +0200
Received: from [40.107.74.73]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3a-af86-0a2a45020019-286b4a49ea93-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:29 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:22 +0000
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
 b=mtKwuIZPDKs9Nc7vf3KMSPtl+i/TN1cJbJ9RR4x2hRnLhZqU3r0MYSpZXelSshVm5oNGx2lcqAB8+pUqVfVD2I48hE1ct5eK/2OcD4KzOFIji/dflXpu9zUzQFBYUo7EipgVqUY3HILJvVtx1ZKb5hdV6PuZuIEsC0W37KjXkxaxfjcC8Bram4bQMIGZYnAs3Sk6+iDqFFhzaU63JgqynQGVkAuY2GJgTS2eLumEeKLgnb7v1SrbtcCK3Smu7KjZRNnW6c8HTexLAVn1MV2+bQfnvuMy1wLZE9cEPnfrDe994k8tkKUoA/eXMAy6hhjKEMSZRRysqyeMn7GOiFSVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=je+2e5JLShwscO+d0I1NHDPQJTM0lMJ5BSNSbA846H8=;
 b=odapd3Be5VkQtBbRH1uwN0il268YOIwXXv1evWs55d2udpriuVqsx2pB2WfSpdh8gFKBUAQ+Y5hqfT6O1DXyVwiKjJNlZ+vETnhk1ujADMbouvgWhPs5ppegHYVMNohvVQNshqz2pI1+PEhuALw2xwjB31+BUkV5O2Abx+P2jgvxn+Ow3ksIetfAro5577HNpYPIuPQC0m+glR1KXQ9uoLDQcZTzRTlnXqVs1OBIDvONWGMJ0r/HIoxM5b8yLvI3imNYRjltq5TnsQIueq5abrKpXu8no37bAicm8vvwm7e9UxHV6/XJ8DBqUITpxetuVyW7dwNPE6oSm5weOPz0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=je+2e5JLShwscO+d0I1NHDPQJTM0lMJ5BSNSbA846H8=;
 b=ZjirFkkQx98rdoyoHp0f1TXHftt87gcG3KYTcEP61fQd2vmJ/dTCo8A81If/K2yshUT+/4YYD6QNQB+6GfBkc1xsl+9PIO0Ui78D3XCxqbIlAA4bMo18FETDWiDWHVidYLizcRYH+77bBvAkfHhmTw9JWsYwfx7W/TBiJovVK1w=
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
Subject: [RFC PATCH v1 05/26] xen/arm/cca: track Realm-owned granules
Date: Fri, 15 May 2026 13:07:51 +0900
Message-ID: <20260515040812.983626-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 195e6b72-698f-43dc-46ea-08deb2379ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2hFHo+3ayg7fpGrZMm0jWxN7Zm35WD0WjW6Cdb2qx6y6Q7uGZVOCBvspdVSOkAjCOw7XmcHKPWmKBte02VClaozk5MuUAw0J5dzrS85nAATMINjdPplDKYuL/hihsgT6mEfzmzCVjXDO1/8PVs0YrvC00J/EDGvIlpEVUeCPbaaGrEq2iznV4YUC/HKwXwelpK3EvKGQ93Go/z79mWvppy84OkeZprGzI5XkFXL++azUM3ABCbFGhsRskZJiQtwD3keb4kz+4lYgk8lctqhWcryhh/SkAdWTqQcohBqT3auO+MUROWKIFAoR1TVEts93GcBa9qDYkzZs6Ei3jkZhHz5ttjz4Wv19n9DEK3GJYjjZK3byaQRoAI2myqxJZTBN0if+ivHZ0SbfwP2z08odWRfNNpVM37LyglMHBbXbINCbPkPySBUwqS+4D8+T3ACOOZmsoi76u8psBIHYxTXioSt6YdKxXi0i6efceWlBp+tH8R8NC+wqF5p0dPTs/dTV1jhEmJmG1L4C8BamxoR2MCiJ53J9v8veKlYxSWpQXWjFJzNVOV8j3b72ew6LvRJALskkCdDHZstLw/DRJL+IVAigarzIW6nHHR3X72/1glVjJzXgvlNERJv4OLu0fyqpY7T19s5X5A/DGoalv9UxFlQQpaAuOYXyTgSFsYLUbkE5aO9iAVVt5x9LfJS+oiNF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CFB7Kx1jzuSfLvky5aP3ky6Jos3A39MnUy7FeTnwnRlTHp6bOZe1kFRrcN/+?=
 =?us-ascii?Q?eh1/cu1EWgp3+u7ECQWEaJH4JJLE896OLSNz8iVa8YnpHo0a/wUnvHk2Rn5P?=
 =?us-ascii?Q?+4/qC2ATxC8h8WeXFMCALapu4HiYNgKBisY4sKnHp80mFTlR1DkoeGRSvhXK?=
 =?us-ascii?Q?Pn5jZcEZHLkCgqxZ7wCy9YVKiRjIKb94vyXmZCOVcQMig4pp/MmR4XTPBqNE?=
 =?us-ascii?Q?lEO3aD36Fqu2OpIFSYmP5LKmH2zAt8Y7yCkC5+b92kqdRRoSw/WgwwgB4PhX?=
 =?us-ascii?Q?gmtve0U0xvJVRk/D0OXHSffmalfTa8SKRV7BrouobU1lXp9tfahiDlqqKKCi?=
 =?us-ascii?Q?ZD/r6SIqA5davDU0zMw4Uar4eiC/93qrNEfCDghKnOLTRo8+T7DkC4na9xB3?=
 =?us-ascii?Q?kVzgAL3e+QHkF8tbTeo3PT0KBv7wbfFKPGHmVL2MNgoDEY011DQ4qgNLJHIg?=
 =?us-ascii?Q?6UcGbdFMlQcY9rNvKxYAwnGy34dMD2jDetwnjQmssvgPDdaVpCzdGjfaV6NS?=
 =?us-ascii?Q?Ye/jZ2/HQXqHqTArYVXWnkje5uuZrHsH4cd99iVLF7tl8TabqAHuVfXW/s0g?=
 =?us-ascii?Q?Rmd2wod6RLy2R0c+ZAtEHEl8JAYbqoO7ag66pj1PFpZdnmUG7ld4RvsxsoJU?=
 =?us-ascii?Q?V9mwDepUjUkAaq5CUhflV+u1JvUd2fHJMiDXBtD4sNQKN21hXON51d1f12Zi?=
 =?us-ascii?Q?LTDmfT4b8GBXJi65wEOsGHrO7DLEQsZoUzC/EpIswlwLVUDh6ueBEEZTjtMC?=
 =?us-ascii?Q?ZyvXzdGysVwHA0QgBQ7P1eCS5BNVhF2evR/qga6XHmgu8W7r4EdGl3vPqzMP?=
 =?us-ascii?Q?OCMz26SIcUCE5CSXINZ8cW4TWIJ8SpSiNSV2EUDYP1RBsqtwqf1Brod0EmHq?=
 =?us-ascii?Q?0IfGZF+FAeNM9wcsO2i91kuuypt98+DR9IboIrCAvMvHM7P3+J7M71WKJ2i7?=
 =?us-ascii?Q?oebUweVruVgcGMaeEvzS1WP++5s2yKXy7xJe2r9UR6nARl98KRDyOoRlBXP0?=
 =?us-ascii?Q?Fn8ua5B03VIW9NVRBZcjphIISuHnJY6IdqYLV19ZNvxGT/Km+125E071BdTG?=
 =?us-ascii?Q?H3XSkjFichVOUdyXaJ1aYW2CRKIrDLgiaEgvvcnFgfawFkzD/pYVOZCJcLQ4?=
 =?us-ascii?Q?y/oJfjSNFfGajpp5zZL00H7MBcpHzKCB/lUDlzU4N+S/oKfSHFj7Ab8nB5qm?=
 =?us-ascii?Q?8PNakP9AEsxt+sTZ8SScuTXusNVQEyBnutVo20xBMIFusazNnNBG2g9Cvw1I?=
 =?us-ascii?Q?rtJ5V0V5r+1t+qxbDL2gttM+lVmTqfhWzp8nuERkOQCyiSlfwjKMcHTpY5TP?=
 =?us-ascii?Q?YY0tsGoYq3fepnP0Ko40kBpwv8dS+lJz2pOmbY+g/TklZ75w7NfFBdmH7Dhn?=
 =?us-ascii?Q?+LqRtNYDJ4GUiEOuyOGo7mD47dzKtKOk43vO+VDsHrJHgrDVxaIgAvMrkhWk?=
 =?us-ascii?Q?jP9WX+0C5eBnN80QANHXiyqi52wRDnMBzHT9PJ1kP3yhtle+UywJAToPG6bO?=
 =?us-ascii?Q?flEW7aMVFaae2Kj8ANQbcsUqUld4lghfs65duSHl+p3nMKXl9+ZQn1i0R0w2?=
 =?us-ascii?Q?cL0la7sEgRiKB8C5MLhsqm83biMnE1k7GHYBzmI3QzLXtiw4dcMG2iCDVQMR?=
 =?us-ascii?Q?v5y/pwL1d3BmefNcrUASQciZcrQfhwgXiXdLAX2XL6c/MSEF6NaZfceLZGY4?=
 =?us-ascii?Q?5f127H6r4lX3fdaxIIWBDlpRRIUToK845t/Lp0q9iLyG4FQIB1icrZ3gEqfI?=
 =?us-ascii?Q?VIOwiKq1TCPGsgL8UeVYMjxHNoh6dVd8F7QM/V64PgDj+Ty11J9H?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 195e6b72-698f-43dc-46ea-08deb2379ae0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:22.4995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rCZAjq2hWD5AJr7kBSdfXtjpNgGfB1UlAcHYKWBwy0zr5swQeMBHDYsnyYU61n22k3YYKy/1RX5Mz24G4GZbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-720697/1778818109-81971161-745DA4CC/0/0
X-purgate-type: clean
X-purgate-size: 3368
X-Rspamd-Queue-Id: A79D45491B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
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

Track pages once ownership has moved from Xen to the RMM. Teardown uses
these records to hand them back in the right RMI order.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/state.c       | 19 ++++++++++++++++
 xen/arch/arm/include/asm/cca.h | 40 ++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index a47d9cd7b6fd..66375965a1b4 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -10,17 +10,36 @@
 
 static void arm_cca_reset_domain_state(struct domain *d)
 {
+    unsigned int i;
+
     d->arch.cca.realm_active = false;
     d->arch.cca.rd = INVALID_PADDR;
     d->arch.cca.rmi_features0 = 0;
     d->arch.cca.rmi_features1 = 0;
+    d->arch.cca.rd_page = NULL;
+    d->arch.cca.rtt_root_page = NULL;
+    d->arch.cca.nr_realm_sro_pages = 0;
+    d->arch.cca.rtts = NULL;
+    d->arch.cca.nr_rtts = 0;
+    d->arch.cca.data_pages = NULL;
+    d->arch.cca.nr_data_pages = 0;
+
+    for ( i = 0; i < ARRAY_SIZE(d->arch.cca.realm_sro_pages); ++i )
+        d->arch.cca.realm_sro_pages[i] = NULL;
 }
 
 static void arm_cca_reset_vcpu_state(struct vcpu *v)
 {
+    unsigned int i;
+
     v->arch.cca.rec = INVALID_PADDR;
     v->arch.cca.run = NULL;
     v->arch.cca.run_pa = INVALID_PADDR;
+    v->arch.cca.rec_page = NULL;
+    v->arch.cca.nr_aux = 0;
+
+    for ( i = 0; i < ARRAY_SIZE(v->arch.cca.aux_pages); ++i )
+        v->arch.cca.aux_pages[i] = NULL;
 }
 
 void arm_cca_domain_init(struct domain *d)
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index 1be43327119e..6bf644fbcee5 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -14,20 +14,60 @@
  */
 #define ARM_CCA_MAX_REC_AUX 16U
 
+/*
+ * Xen implementation cap for pages accepted by one memory-transferring SRO,
+ * not an RMI architectural limit.  Switch to dynamic tracking if a real RMM
+ * needs more.
+ */
+#define ARM_CCA_MAX_SRO_DONATION_PAGES 64U
+
 struct domain;
 struct vcpu;
+struct page_info;
+
+struct arm_cca_rtt_record {
+    paddr_t ipa;
+    paddr_t pa;
+    unsigned int level;
+};
+
+struct arm_cca_data_page_record {
+    paddr_t ipa;
+    paddr_t pa;
+};
 
 struct arm_cca_domain_state {
     bool realm_active;
     paddr_t rd;
     unsigned long rmi_features0;
     unsigned long rmi_features1;
+
+    /*
+     * Host references for granules whose RMM state is no longer represented
+     * by Xen's page allocator alone.  They let relinquish complete the
+     * reverse DEN0137 2.0-bet1 A2.3.6 transitions before the pages are
+     * returned to Xen.
+     */
+    struct page_info *rd_page;
+    struct page_info *rtt_root_page;
+    struct page_info *realm_sro_pages[ARM_CCA_MAX_SRO_DONATION_PAGES];
+    unsigned int nr_realm_sro_pages;
+
+    struct arm_cca_rtt_record *rtts;
+    unsigned int nr_rtts;
+
+    struct arm_cca_data_page_record *data_pages;
+    unsigned long nr_data_pages;
 };
 
 struct arm_cca_vcpu_state {
     paddr_t rec;
     void *run;
     paddr_t run_pa;
+
+    struct page_info *rec_page;
+    struct page_info *aux_pages[ARM_CCA_MAX_REC_AUX];
+    unsigned int nr_aux;
 };
 
 void arm_cca_domain_init(struct domain *d);
-- 
2.51.0


