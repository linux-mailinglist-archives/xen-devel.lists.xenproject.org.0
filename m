Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMEvLqrqQmqbIAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69A6DEF78
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=GOo6io93;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348268.1606084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzm-0002ue-C9; Mon, 29 Jun 2026 21:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348268.1606084; Mon, 29 Jun 2026 21:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzm-0002rb-7i; Mon, 29 Jun 2026 21:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1348268;
 Mon, 29 Jun 2026 21:58:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1weJzk-0002iT-8y
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weJzj-001eUD-MM
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 23:58:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea72-e002-0a2a0a5209dd-0a2a4509a9aa-10
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:23 +0200
Received: from [52.101.229.81]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea74-97e6-0a2a45090019-3465e55169fb-5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:23 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:58:13 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 21:58:13 +0000
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
 b=csryaDGfkdKwSJiQf9//K5KBRAlDKdCx/Us10E7QG1x96i2oAvNxpOLumYh+Fybdh0oD3neGBYcufk+tiytMD/F3Bbs/OZnLddugaR6ZDeCjRUFHwQ3VXN2zXYB58J3NeSr03KjNqTLAjSNqBk/qVqubK4732bIpiZf1LpR7aeBUBwNy4xhGTt+SLs73/OoiJNPQz/cPfrb+bljIwDxO6xFZC7w24b2P9ojcEU6Fqi/ezHUT7BWStlqry3Ws8ml4gdvNCuCA0ZWeL8rYulDD5AaUePaX0/92RGSlUk+WO9/AoiJRac/U8cupbW80CLli26jEmpPJ2VB4rjhPt+brag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KocPHXm+RQfXzllv77nczBCcPoeJP8pnY/53SvFqybc=;
 b=hXKL6QvfQQ2CD3n/NEIy2byR6n0t9/33c/HVm5/mqVoAzsT/dZsmjhJiv8BfxIqzpruehOHv9x6xHL89BQH3+TbyCmIxinrbFANFSH1LRp+/aTHB8HG/jZuRiCcZMhhcnF3UrQ3PC14TorkpTuZ8QKRMp9+H/xcBiBNsGJvz+3aRsPzXmE/SntjDZ8z2L/2x8rGGRX7rbVbWTxxvddNr4iQhVPMUzVNGFrUkkyOe5vcONwL82CuAQYvdNuPRy0d24XyqkmBfHGMzvGKoDiyliMcpWrWMoZLDONG6TGObmWsn5HBls5fef1/PMU1x2mzz5HDZALVq/LBC8eqaXJANDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KocPHXm+RQfXzllv77nczBCcPoeJP8pnY/53SvFqybc=;
 b=GOo6io93zxDgR5HerdnHS/cYHmZAPcsh9xs1esEo9l8TA7Y8qZ3a+Yf3RexpWga81luM+Rk7WKeRpC51J2rtJsiPMb7q0dE3USarJ0KHYWDWy+o859iZQn9+HFlY030yCy8Kv3JE0pmGJdXalMk7OffwueMApAjdWWCgUnl4Pl0=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v3 2/3] xen/sched: Link CPU topology to scheduler
Date: Tue, 30 Jun 2026 06:58:05 +0900
Message-ID: <20260629215806.11610-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629215806.11610-1-taka@valinux.co.jp>
References: <20260629215806.11610-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 1874d940-64db-47d3-90ae-08ded6298449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|10070799003|376014|366016|22082099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	sClA3/thNtpqFJ95R04gieT/0g5QVeB1vlfj0R5TM9VLvT45C9LExkmuBouApXH9dDKtJhOVXV0/aDckYpdCpsOPNnSejZGevNuAehdEnv+PsnAsik7AhSAa9lWT3phaEGoLyF+OzGTzDAwT4ZpDQp90L/sCIni/BesqmfaLsKHl+8v1Knu7lwvnOdaQPheH8hp1H5GNCO2k7TiIpOQERE8nIrAyF1NOOoTHbtyUgOcOx5vTXI3tBf3hAJhzSXKfKXYmsfaA1hSR/0eUcTKjprUpmDYkeDxdaSqwuPChjbms2K9aanT2O/4RsN+1W47C+MTbA4F0M96qORqpF0v2USrVzEDsjiObCEdwAZgjLclIPO+XMppTqvkR+6S4xWHXtj43waGc9RJzuWkyebnVCJFSuZi4c5BJu+TZgHvGh6UgM9XZnnZWXiDyRKq1h1uoQym2FnhVMnHLd6rGMFP1blEOJHBA4tikeeKVfU4KylzCOTELGvJf3rcxs5oyt+KIYFUYafr95CousdpOgO3alqtcHrJGF5uhn2/f3wni3bfxc+uDcLZkKnMfGB2juoZEdQsa237MxbNAPTDwbsTgr8camO4ckXhLDGFBQJWCGQ5V6sl4v9j9hY5zAMQSqoyvdzqbKjVskk3U83vPFm3tMNzUOqKJ9MNxFXCjj0jmorI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(10070799003)(376014)(366016)(22082099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pM7+pUXgM9sOgSCd5ZgIYER1dT7io2ndlCEwE053Q0MDs1UlUvyMlYR6K626?=
 =?us-ascii?Q?aoqJC0uCcj9wzIr6u8i9RwmHzsZFxKjWik0yjZmiLxtw+bNzmK8+eZAjDhpE?=
 =?us-ascii?Q?Q7953/IsoZVNII2PN8mtsQluF3z1P4A7IJEGZIfDOKuGGYV9qcu0Fiu3I23L?=
 =?us-ascii?Q?rNJ7fpuqN2Z418VuxlCO8XUNGaSJA+nMesyBe+dth7vZ2NBxfSQH6p3YNi7M?=
 =?us-ascii?Q?JUBQgBjI7/RcSB7XXY0R/d0VEfv1OStJyvpb1M9m9f3P8fKeCZ1/Ko//04U+?=
 =?us-ascii?Q?OAQqok6UOl8SRS5qIOew/7HJI7Ut1mwhQPmfcaIaJvzxYmuCek+UyJXXMvIB?=
 =?us-ascii?Q?T0pdxE+lCz1Wnr772SYZV3Z27zbZHTvBzpUJ3kJ48cCg8je7h2y5zWpW0qsd?=
 =?us-ascii?Q?o15TWnGZRyyqGYR0/TVgrh2gnOOvTVQVnSkW+FkjDe2GgSABdFbfOIC8YzDn?=
 =?us-ascii?Q?QPonV2iqNpUp8cTWfzaeh6+SqZOuRJLXtXpPu9uuYJBGzPO8cwyAEDroO1Yx?=
 =?us-ascii?Q?/VpKsrQ4AFa27a6/9w5q/2QJTD7Es0uJKi2DbZAphpWzY+P8SvJbe8kFgERq?=
 =?us-ascii?Q?Dx3Mo1am+Cx+kz0Z38oOQTHhviuxJqWSv8v2kybSDsNiMrIjy3AlG2h7gCzv?=
 =?us-ascii?Q?QuIh28kWMDRXPLyxmRTyNH4HDbNvENKLAAJKjjyl/3C+YaWmjENNcHzsW/V7?=
 =?us-ascii?Q?ut+5ohUZ/guQSStJnEsyUC9779vFGF53NakpgfZaVDWCyubksJN01t6kGvCs?=
 =?us-ascii?Q?jo8T4VSxyD9W+/jMin6PrsDwTegd7LdSoJk6j43ib97+6B+sBSmlCcYtS2QD?=
 =?us-ascii?Q?gIwdy6ivdFr6qA0vMhx/eYkfCbTDqCfJm57m1QTqL5WBFYhoHLCd5YO6o3Pk?=
 =?us-ascii?Q?OeVuab/y98cID1DnTpEQCUHAC6BWfTrvkt7tfd7eMq45t0bFPKQEwk+2qjVQ?=
 =?us-ascii?Q?kqe9T58ut+QOsow1FE5trbi+Ca7pQ+OulH0v92HSojupes/ts9EhSiWNgDpu?=
 =?us-ascii?Q?554HbXzau/4q805MGb0hznRfwl5jm2DaRAkvOkEpj7MKy1tCH45rhuKmBuLN?=
 =?us-ascii?Q?TW4T0oXQ1cQ3HvL4U5xYO+uuQhsHlzWJUpKMkb8T+goTszcuacXTtSyZ/a/A?=
 =?us-ascii?Q?Q712/FE3I/rvy8pVkk3dIN/zBxj8QJsvJ4kgZxvRBt6j6l2g7U2BcdUy0zeY?=
 =?us-ascii?Q?4wtaCHptJ0g7Ib9+6ufdSJ7pn4yRINKsZt4NFAwMfXJHxwgcHuyMQHg7G3DF?=
 =?us-ascii?Q?d8q958Syb/OgjtYnkIjboFdOaRtWVcNq3nIYM4K/kjLQvzvn30lveArGVubE?=
 =?us-ascii?Q?tdk13a8VXSzG8nvwr6QmpzsL+ZCpGzYOLhbinKBgnj3Ikk/zqgA3I6C3wVqi?=
 =?us-ascii?Q?Xe5GIkInKL3Wcp4mHG2xVuFWTZxX5yoyIFKpXzdDgHTZYh3ZeDRsypJerVmR?=
 =?us-ascii?Q?5RcE5gFgJ3tGaRl4VL3Fc6dDdkTAnZyrj62ST0y2E4vazb6tm20oJfIQw0ig?=
 =?us-ascii?Q?69r+rFmhsznxKeLIYfU+UGV2Hn67J682mWL282CD5cSBWkjxREuwrKEc8V2n?=
 =?us-ascii?Q?UJS6Ygt5ED9IBMf/2dln1TBkdz0ICOe15bcJAiDdtlULsJq5X5mceFFYvsH+?=
 =?us-ascii?Q?pG9XIyxLqd7ztJ2RYclqwbBhix1jrnu/W7K6oV6LhKdeywGF8P/DdoNw5gKn?=
 =?us-ascii?Q?Nc9DuzxSfilYw16XdhNGi72mTELfZ0pDHDKV8p9S6HSvW6+/jRG/gPAdjmRm?=
 =?us-ascii?Q?s1/2aW9BN/XxxG6B/4g8HKMKAzaGwD/uaBMnIoO0FgWpDVtJ0csTDxjw1gry?=
X-MS-Exchange-AntiSpam-MessageData-1: v3aJ1IZsn/Kxyw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1874d940-64db-47d3-90ae-08ded6298449
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:58:13.5274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKWsFgH8X+XTD180MEgB2nFGjUwLtfJfaNzt1ajpwynaPRycje8H7KkyhpAXayYytLeSjsRee7gxWzvh1He1Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-bad1c0/1782770303-45922986-245F55E0/0/0
X-purgate-type: clean
X-purgate-size: 8467
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[valinux.co.jp,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A69A6DEF78

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/include/asm/processor.h   |  4 --
 xen/arch/arm/smpboot.c                 | 23 ++++++++----
 xen/arch/ppc/include/asm/processor.h   |  4 --
 xen/arch/riscv/include/asm/processor.h |  4 --
 xen/common/device-tree/cpu-topology.c  | 51 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  3 ++
 xen/common/sysctl.c                    |  1 +
 xen/drivers/acpi/topology.c            |  3 ++
 xen/include/xen/cpu-topology.h         | 15 ++++++++
 9 files changed, 89 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317f..41fa73cfc4 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 3a77f1d33e..41cef34194 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,13 +91,22 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
-    /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
-     */
-    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    if ( cpu_topology )
+    {
+        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
+                     cpu_topology[cpu].thread_sibling);
+        cpumask_copy(per_cpu(cpu_core_mask, cpu),
+                     cpu_topology[cpu].core_sibling);
+    }
+    else
+    {
+        /*
+         * If CONFIG_CPU_TOPOLOGY is disabled, it is assumed that
+         * all CPUs reside in the same socket and that SMT is not used.
+         */
+        cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+        cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    }
 
     return 0;
 }
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index 242346cab9..1bf6f6c66c 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -141,10 +141,6 @@
 /* Macro to adjust thread priority for hardware multithreading */
 #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
 
-/* TODO: This isn't correct */
-#define cpu_to_core(cpu)   (0)
-#define cpu_to_socket(cpu) (0)
-
 /*
  * User-accessible registers: most of these need to be saved/restored
  * for every nested Xen invocation.
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6b89df4a2d..d478ffb76b 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -54,10 +54,6 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
-/* TODO: need to implement */
-#define cpu_to_core(cpu)   0
-#define cpu_to_socket(cpu) 0
-
 static inline void cpu_relax(void)
 {
 #ifdef __riscv_zihintpause
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index 0409e7b87d..8d502087dd 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -327,6 +327,55 @@ int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_cpu_topology_ids(void)
+{
+    unsigned int cpu;
+    unsigned int next_core_id = 0;
+    unsigned int next_cluster_id = 0;
+    unsigned int next_socket_id = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        unsigned int first_cpu;
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        first_cpu = cpumask_first(topo->thread_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+
+        /* Reuse the calculated core id if clustering is not supported */
+        if ( cpumask_empty(topo->cluster_sibling) )
+            topo->phys_cluster_id = topo->phys_core_id;
+        else
+        {
+            first_cpu = cpumask_first(topo->cluster_sibling);
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+        }
+
+        first_cpu = cpumask_first(topo->core_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+}
+
 void __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -339,6 +388,8 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu(cpu)
         setup_siblings_masks(cpu);
+
+    setup_cpu_topology_ids();
 }
 
 /*
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 77475ee363..6ecc19cc4d 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -9,6 +9,7 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
+#elif defined(CONFIG_CPU_TOPOLOGY)
+    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
 #else
     return 1;
 #endif
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..81a68fe24c 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu-topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 6bd2d96ebb..9155edc0be 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ void __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1;
+
         cpumask_set_cpu(cpu, topo->thread_sibling);
         cpumask_copy(topo->core_sibling, &cpu_possible_map);
     }
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 698d148def..1cd73b7ee9 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -9,6 +9,10 @@ struct cpu_topology {
     cpumask_var_t thread_sibling;
     cpumask_var_t core_sibling;
     cpumask_var_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_cluster_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 #ifdef CONFIG_CPU_TOPOLOGY
@@ -16,11 +20,22 @@ struct cpu_topology {
 extern struct cpu_topology *cpu_topology;
 void init_cpu_topology(void);
 
+#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
+#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+
 #else /* CONFIG_CPU_TOPOLOGY */
 
 #define cpu_topology ((struct cpu_topology *)NULL)
 static inline void init_cpu_topology(void) {}
 
+#ifndef cpu_to_core
+#define cpu_to_core(cpu)   (0)
+#endif
+
+#ifndef cpu_to_socket
+#define cpu_to_socket(cpu) (0)
+#endif
+
 #endif /* CONFIG_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


