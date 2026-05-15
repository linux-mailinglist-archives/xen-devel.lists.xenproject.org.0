Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI+PGg2dBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA15549236
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309432.1580513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtu-0001fv-8P; Fri, 15 May 2026 04:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309432.1580513; Fri, 15 May 2026 04:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtu-0001bm-3n; Fri, 15 May 2026 04:11:50 +0000
Received: by outflank-mailman (input) for mailman id 1309432;
 Fri, 15 May 2026 04:11:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtr-0001A8-Pz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjtr-0052Iz-6G
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cda-e002-0a2a0a5209dd-0a2a4505a2ee-22
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:47 +0200
Received: from [52.101.125.85]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c47-aaa8-0a2a45050019-34657d55753b-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:46 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:39 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:39 +0000
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
 b=csRRytBgoUiTNTiGYAWfRvR038K87mpAVDc1ToAnhFL/4PRstmBF1oSwr0rGUBDgj+5kQ2t+sOliElPlg2B31xfhU6ZUKFmoexColqKyfnYZorqK1mcSccwUSgyfAKl/jCrsBAXsDwGNYIodOGsUh6co3RLZoDfdCibJ2c5KiDkUK97bihHGWn9lMVTCKKAN1JHXHXbzF5rc8smiTXf32CeVjBpsVhNBrlwF3wUrc/mG3n5dw1d7d3aqsfDXV4XgU0uWuXIxcsjUf4by4UQXMd7xCGRmRbuwLyCdr4wINvaPyR12G3cEIGc53LqhR7xmPC1SqadM+HDVEg1jF4MhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPhd/zOT+Y6mzSTQOAaKE/lOmvaSbNYRD4sELEkar04=;
 b=GoLx3Bim8gBqVZhpHe2XXSE0zlTspOgiBoYZLXy9RKB0AHUaKCf1p8pLZZAxhy0IvelX7it+wYabXB9fufRGic8avukbSn+x/RZ7D1T3e5y9O6Arl7QaS2dovdGpQVpLKvnifioKt0zib+VTsP3t3LSjJpN9MxLNC72VZLhBug4C5do3jbKkd03qRqqf+Q9bEJcwG3sIMhPlvVzDZIb9OwXT3HEQfh5+YmzEcIfcDXAKw6dzfVZw4BvW7pTBkLTZW7Y98gbne0PXclN2g9XQIW4cAoIc117blM9+cXWwrt9QqNZ+jrEZMhyPeuDNJzWH30VSbIB76q1Q1qq5bKYyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPhd/zOT+Y6mzSTQOAaKE/lOmvaSbNYRD4sELEkar04=;
 b=jA92sWMZwZvPzmmMQvhDvVPHZ491YctGlVZNjZFPsR1LkZtbHrE/zuDCQcx5p/8HGPhok4X9/ZG01WROQVQHjh6j6gbsBNISSnILdLo5IsRn70hXiwtFB+0tC5Dm0sGjj7kgkf3BN1+u1Thp/vH0MeJ2rdUjG30uIcsPEAF1g0U=
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
Subject: [RFC PATCH v1 26/26] docs: arm: add an Arm CCA Realm guest guide
Date: Fri, 15 May 2026 13:08:12 +0900
Message-ID: <20260515040812.983626-27-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f853f27-7630-47c1-8aaa-08deb237a4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iG8bhiNBf3L8V91D6ZjRADtT05IP3NeIAIxnrwgEgThks037t9/K0NWSIvIkwYIMdxKUPblV+RCYcjUqDXW/mS6Br0Sn0JiKr5gdNjLTvrrhz+smyV/xkIlsl66IE42sanTvwQQ1pDFisboRRm63GmT6cRWpsj8PC5q0V+c3APTsxp8lVB6gGtOnyY5b0aAxqA46Zf2HjYkYu3M8NupKk0GiEmglngnuD8Y33RiaVT7mEl0ZNKVP0zyOGcpWDryKIaS3wIAasHCbBT76As4QowBy7f1D/DDoX82xlLF6hejB1QRvEOp5bNUHMYB7ljCdb+ZCFo1ue0B45ZMN82WC0+C3rW1S0FBB2Yt6bt+CGnIlHq/veZB0/wo38LoB4m6sczAjxFrzP6CwKHfOfyeOW1wPwgdg3dULR5mUBgwI9jhWRxRUEmMS+9gv5o5BmU9CDGzSkhTH03mDjFXW4OU+KLMhX1N4kyqgoStDU5EnSgGTzOJi2BcEXcfPXFyRKgOzb9bBlnjoH85LK7lolFD0x7N94N9d6zWwzKzFkmXVslXSNG/iSFxFhmag8Lzqeq/yIhlCX3+lVphHahYOY9Nw22yRheDrcxGEChEKsDCiWzQLpO1hV1ICvILnVmfCMNwwMTJCF12s104tg4kr00N488GaHn8B34+fG98W2l7oERB25v9uvHHKcKi2IPCLFVzv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+cJcZPgjEmq59e9SLGOzXici+gJsDcvJRdrWGxJt6Qd31+BTNcKaVRuolP7D?=
 =?us-ascii?Q?Ndw7DdpT5auWAD7MBEjttse3rEqyDkA31DhHuX6qKvU7/uFsv66u70SgTXxA?=
 =?us-ascii?Q?Avn47i01nOsWEB2k9zdRaJCpBa/LVQRVDZp7ixtnsvuJzwJmBe9G3W/cPwZk?=
 =?us-ascii?Q?zPJes4mSvKnm09u0qr5mg4vOaXAdfVv9MVeA7eJbxC8pyPoEzQYFADw7edTi?=
 =?us-ascii?Q?MgXksWbbmGNFPbCEYIjSmfOd8sPWbAK53hqvkimj1cEeDGxTJPUHnjr80e/k?=
 =?us-ascii?Q?R2wxBsUUlCsMlRIQjdBuNcRpqqLzcduAm8oyOrawJaabpNecwLlzIMjJd+aR?=
 =?us-ascii?Q?/YNz9LF3oiJjLTqmVUutYOnTQZYQ6vcCLvFSvit3c6VJ3FaiuZvJFvlv4fQB?=
 =?us-ascii?Q?1useXdN6P1I+SGUNXlCs/r0KXVl8SGFlPWdh6lXJV1EJsnVp0biTg/lbbTH6?=
 =?us-ascii?Q?PTMkp/Q9u6LLWmOEfiU1KhoAUPuZa5bECGkwi3+V1szxf7frKR5TnIoPu3ig?=
 =?us-ascii?Q?IugdqaG5GfUV1FnKPG3EKBDXTGeiAuI9mAesXazQthnqhISj/VV5H5X8NJFj?=
 =?us-ascii?Q?oe0u4fhiM7mFsbGr/HyJi+XP9wNXWOC2+pgs/3gGbBqp7G8aVfwj/mgJWhsT?=
 =?us-ascii?Q?XsV4WO3T9kn4dClRdJCcjqlXxcRyhLVsJvNKaqWHSzrhunJJmO2XSS2SaDb4?=
 =?us-ascii?Q?6XNPrzRTwvTJAQ/aPiJ1SQpOeSOoaPhYtZ/P8lVpdIC3qvQQl/V1aXmF7XuI?=
 =?us-ascii?Q?BznPcOR9Sq4BzRKmEAO+oAWgTdH78Gx2pKXlbRb7FbQpqXpBhFHHEPEtCvZ7?=
 =?us-ascii?Q?UeQVXo2f7t99JOX+JbI6g0yTkcaUiBH9Y6WxgdheJyIlu/WIXK5ErCqTavg5?=
 =?us-ascii?Q?3dJCYvdktLYagDJFjBKrt4mEWMsH9nVB3GeEeBMnSbkM9ZUKQJ+ODY29Po2A?=
 =?us-ascii?Q?K6f9oVq/sBcC1zr0PZQCC5hu1HT9QXadn3DwNwVCkuS76C2PST5c75TR9jN2?=
 =?us-ascii?Q?hMt7lrBuRRpadZWJAzy9p76icSdu4c9kUXKFpWN+kVtvjncBsnKJ9pUJ9Zgm?=
 =?us-ascii?Q?FyFArrCVacA7iS31fnWH2av7Y50GmQSs6PePfeB+Txyc6N7ipKBPcGk48EX9?=
 =?us-ascii?Q?oNr1hz4CKghCFCt9U4eIxrWI14v0pTuo5SI9X4JlCr0E5f3YN2z4Qr/KF5/L?=
 =?us-ascii?Q?ZSef8o6TTHYCSHcw/jsBKF9OaCAa29DDEHi2xCj757ySUlp9f7ezJzivdsCC?=
 =?us-ascii?Q?jJ6GZK0glNoPHaPF8+WRj9nazDn/7PjEyqOAMz94UGG3QH5GR1KNfevKcWqj?=
 =?us-ascii?Q?f9BLtwZpVlrrgKRc/SEpsno3SolOoo5RV+0XZ9wf4VZea53CMJEffPfNcgq+?=
 =?us-ascii?Q?b+oaYAxS/2P5DZJb29ZzQ9kSiGfi6M9KG9zfKsbYo80m5WRnY0PshHJauFXI?=
 =?us-ascii?Q?YpQmTcI3qpHh4B1YcFgi/C4l1J3bA/KxeA3Pzpq/Y1oO+pWBUl8Eyj99A84t?=
 =?us-ascii?Q?JRib/ResCZa1UjaODlrqrSpApLUN4FP/x4e8xNXA//XIsckBqe8E7DQfSI1C?=
 =?us-ascii?Q?m5bJ+3XgYVdTiG75b7dzT9z+A5nl78UbJYhl/mDUSiR6YgOrNJfKu8PG7xGJ?=
 =?us-ascii?Q?LzB6/05j0zcJUz59qaJ8WSKAi6/opkljyuJHpJIdAZEGbKFu0XwO2zUr47Tf?=
 =?us-ascii?Q?Y3+K9Ht1V8cRhw57NRCqSgRRMRlvdcjXTrnDkKOg2gxKJmOB+eMbz9ngYm7m?=
 =?us-ascii?Q?EOkCtAR68DoVEgdOv86he2kkunFAKhbBW+RlrWXpheRSQIoeIXap?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f853f27-7630-47c1-8aaa-08deb237a4bf
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:39.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dl9+tJWufWZGF17Cg5QgYTJS8Us9TpfUQYut/AxzExUGFiCwHRlgcdZumL7OfD5i4IugtkhIS3zXtrzGt4Fm7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-c201ff/1778818126-DAD6F443-8A34C642/0/0
X-purgate-type: clean
X-purgate-size: 4119
X-Rspamd-Queue-Id: 1DA15549236
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Document the Realm guest model, the current build/runtime flow, and the
limits deliberately left outside this implementation.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 docs/hypervisor-guide/arm/cca-realm.rst | 83 +++++++++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst     |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/cca-realm.rst

diff --git a/docs/hypervisor-guide/arm/cca-realm.rst b/docs/hypervisor-guide/arm/cca-realm.rst
new file mode 100644
index 000000000000..9a0a63220bfb
--- /dev/null
+++ b/docs/hypervisor-guide/arm/cca-realm.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+======================
+Arm CCA Realm support
+======================
+
+Overview
+========
+
+Xen can create Arm CCA Realm guests and run their vCPUs with
+``RMI_REC_ENTER``.
+
+The initial support implements the DEN0137 2.0-bet1 Realm lifecycle: Xen
+creates the RD and RTTs, initializes RIPAS, populates measured DATA granules,
+creates RECs, and activates the Realm.
+
+Guest creation model
+====================
+
+Realm guest creation is exposed through ``libxl`` with ``realm=true``.
+
+Realm guests are currently restricted to:
+
+* 64-bit Arm PVH
+* GICv3
+* a Xen-generated device tree
+* guest RAM fully contained within the first guest RAM bank
+
+When ``realm=true`` is selected, Realm DTBs set the PSCI method to ``"smc"``
+and do not include the Xen hypervisor node, because Xen PV interfaces are not
+exposed to Realm guests. The only supported virtual console is
+``vuart="sbsa_uart"``.
+
+This VUART is a host-visible clear-text debug channel. It is accepted only when
+``CONFIG_ARM_CCA_REALM_DEBUG_VUART=y`` and is not suitable for
+confidentiality-oriented Realm deployments.
+
+Runtime model
+=============
+
+Each Realm vCPU has a REC and a ``RecRun`` buffer shared between Xen and the
+RMM in non-secure memory. Xen enters the Realm with ``RMI_REC_ENTER``. On
+return, the RMM provides an ``RmiRecExit`` describing why the REC stopped.
+
+Before handling an exit, Xen synchronizes the Realm-side vGIC and timer state
+needed by the host model. The current path handles the exits needed by this
+series: host interrupt returns, emulatable MMIO, a small GICv3 sysreg subset,
+``WFI/WFE``, PSCI, and RIPAS changes. Other exits are treated as unsupported.
+
+Current implementation notes
+============================
+
+* Initial Realm RAM population currently measures all populated DATA
+  granules.  There is no separate interface for passing measured ranges
+  from the toolstack.
+
+* Xen tracks up to 64 accepted donation pages for one memory-transferring
+  SRO. This is a Xen implementation cap, not an RMI limit.
+
+* Xen checks that host RAM is fine-tracked conventional memory and ensures
+  GPT L1s exist before it creates Realms.
+
+Known limitations
+=================
+
+The initial support is small in scope.
+
+* No Dom0less Realm launch at Xen boot
+* No Xen PV, grant-table based, or virtio device exposure to Realm guests
+* No passthrough or Realm device assignment, including VDEV/VSMMU handling
+* No ACPI support
+* No Multi-Plane Realms or S2AP change exits
+* No Realm LPA2, SVE, or PMU support
+* Fixed Live Firmware Activation policy, ``RMI_LFA_DISALLOW``
+* Shared MEC policy only
+* Fixed zero Realm Personalization Value
+* No non-4KB RMI granule or non-1GB tracking-region configuration support
+* No Realm shared-memory mappings via
+  ``RMI_RTT_UNPROT_MAP`` / ``RMI_RTT_UNPROT_UNMAP``
+* No ``RMI_EXIT_HOST_CALL`` handling
+* No hardware-backed vIRQ deactivation in the ``ICC_DIR_EL1`` emulation path
+
+This document should be updated as the Xen/Arm Realm feature set expands.
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/arm/index.rst
index 7aae4a0a0301..feac2b4230c3 100644
--- a/docs/hypervisor-guide/arm/index.rst
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -6,4 +6,5 @@ ARM
 .. toctree::
    :maxdepth: 2
 
+   cca-realm
    firmware/arm-scmi
-- 
2.51.0


