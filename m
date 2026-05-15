Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Asx2AWOcBmpNlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363C5491B7
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309356.1580440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqy-0004PK-9h; Fri, 15 May 2026 04:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309356.1580440; Fri, 15 May 2026 04:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqy-0004MU-3Y; Fri, 15 May 2026 04:08:48 +0000
Received: by outflank-mailman (input) for mailman id 1309356;
 Fri, 15 May 2026 04:08:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqw-0004BB-Gt
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqv-0051ua-Td
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c36-bab6-0a2a0a5309dd-0a2a450c90bc-14
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:45 +0200
Received: from [52.101.228.84]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c4b-62f1-0a2a450c0019-3465e45466d0-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:45 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:35 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:34 +0000
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
 b=arrFO6a2sjzq/3ApCdKsYNAQyoNnWnEDCNbpZPW7MwZTmuB+TIWfpAtskWAJT0cFbiq4eTuRuGbVRplyuU8JFqD9a9FaXqUFn6AJNb+WGSOnTzAONlx+wCXA/kde7frUyxSbVT6wFiKBogR+rJt2YYPuYJH2ItwAy/7wHJx4FuSZ/OpFxCtybYLrdF+f3pfI9uypYvoYVQ2nQIAEyJDYZpRsYxkhtnMNg6ZrQnVU+PUGg78mXvw1S2DQ7+VL+3zHVYJjyrF12YyF2wRWhWeGt1nYzOCKRsyC/UAFjnBFS87LH16Lczu42+BVj8JBVoHaYZMQJhFCtfEvS83rYhhi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiTfP5ChOZW8sjqcWWmT0T9qF7NP3o4lD8/7QRCmBhE=;
 b=CjnNAGqTHYoAbp1Xe64vovWBsdR0EY58EwBsuMQNcshiah8wBa9/vhUNjaFE6RMwIDzXsZG+aLraYVOlPCBNiuSNarQtOERkgoXhpx1pNIxYmEAs+JYErPPHWNOGQkU5E2omK0JvWMf0XfMv/hLW/U5C3yD75xcgDr6/Xf0+SnLvUFwM9cuJHEWuuyyjjK2STsE8V9ZROq1RSVTf2Iu4CMFiBmjETQhtERONrj7Lx/8t/POAlJRqm/pLJjl2r2lxHpBgpZRU3XV3hAdi6I4D28J9s+ge/ELHMrmuTfuo8d1nuHLNzqFwn5ycuhjXkYXQjkcoWrYaQjiZY5vFtNZiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiTfP5ChOZW8sjqcWWmT0T9qF7NP3o4lD8/7QRCmBhE=;
 b=OU8p56epggxR3lOdRHCHF9J2jpw97Vb+Eb5pywnrAtbdGMaP13EpZlEEmgjhEGMwYwRA+dGhPhBbDpuoq/zmPmnlCoYgMUWmsCGvDFOFKHU2zqsT7J6xAUoHjUq4VEbmZt9Hntos7L2SWThCP1aJhIOuRHECiH0FcUaxz4MmdRI=
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
Subject: [RFC PATCH v1 18/26] xen/arm/cca: create RECs and activate Realms
Date: Fri, 15 May 2026 13:08:04 +0900
Message-ID: <20260515040812.983626-19-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: fb795c32-8e36-470c-25b1-08deb237a0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u7BvWJ4Xum8DAsKkj2EhOWUimA2PvaUXZ/mihCxXPz6O3MGU28JAI22PMl9z9REpqTBkD8NIhqyKzI18H5x5vJgv9k+s1W54SYUAgMA/G4fslBR4/LEuczWBK24e9m4gxjom/BQua4Pprwdm02ailsBEBR1d1Nn3okyZ04LK1Im3VGAh/aDve9rqhTysArYSxb5oqGsv5ueAAAXIRKliDFvkyPRvbzd6B6rCqGF962Lpf85exNd+2mgEeAFkZb49sKXyq0hbWatLNmaU7coqvePS/dSkN1o8O3Y1SlQrpbyBFHhNnIJ0b+dgjyyohPO2V2d8bwG7uiC7vfKXIoiya2sWvgrC3EaD4F/FtkUrq3yz9y2CY2Z0ucXUmxOTsz10JtSc/V6JrbLzGsjADmEfTX2Ub9+XQd5EVtVRWGP8Rf7tnE4EMHQ8hZo8uvjzFdB1X5LkyDJ5Y2Yq1b/S2MKcmogbD0eipp6VwP5Ft3xwOv6VzxPmV+97ewF7Tr5ZEtNQmmy7LK+MF6BtvfjPP2ayGKJukqj5zgT18kXPdn2nAelINIxqnV7Yz1+dTZolQ1Z20JjpIfQe4CzLccn+w+swNhWhNOVPIgXgpozOG7djZH+90jdooOfVDEqzx3nKlG7Bx/sfJRAfYyksXX1xSnzUtJhAUbjrXSrtf9HxYEq4jyjAgwYrdcXCozVcalHTM00V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nI6bvk9tLDVNkqMhy0HhrNlnaKdZzQbiBTU9Hy1FyD20e8C2kmeUi8G2tJDh?=
 =?us-ascii?Q?qdJWDj3LGF4ny/BfWG5SMRRoObC9t/lkh6oiDnOrtnhtAEuAnUXiGxwYe1zi?=
 =?us-ascii?Q?VixVjxxGZRmRZtXGuCQaZGiosTjVUuuAUSTO6BZ8h7PKGonIj3tCEHIwbKS8?=
 =?us-ascii?Q?bCTsWNqTSdnEIw6Vn4CJG6E+xKrOJFp1PdpGLpWsZVPNlCU0vpk37noR9K8t?=
 =?us-ascii?Q?pewT2oI3M3IkTWwRkre4bPXhkrTrV18nK7h69ZVKXV5hUxqgnajxhnffiqND?=
 =?us-ascii?Q?vDmGh6mH6kE2UX7jrpsAVxDrXcalvA0tqZlqXr7a8Vj0Ypc915EHt5mDJ2pp?=
 =?us-ascii?Q?ey0vME6/X02PrYHCGrXusMTSvev5n8IPK03rJO5NMInnEoXn+ltm3MbSpGeU?=
 =?us-ascii?Q?c3ByP2W7AaX27ovnsCucYBKQSPnXRlKUfPZPtKD8XAWg5ZGEtPTMgxenNA+Y?=
 =?us-ascii?Q?y/25Ss44hNo1xxl61ela5NfXlP+dvYHq2iliWEgn6NTrv3CUrukf8CrYAjQE?=
 =?us-ascii?Q?nNgGLGZIbdx36HuQ8HKt9butCDcu9wgx7gP7je+zlUGrQrS72kQZx8S/fyuI?=
 =?us-ascii?Q?eI3lhtUsqlkinoYr/4+5i15WSiHY+BUcf5Y5zt63XdA6C5zRCburkfOZrSUY?=
 =?us-ascii?Q?4so5xyxd2OZYjyX1EEd3lfbzOwyoSivUHYWwqeN3pHvnacvcWCccz2zplXQI?=
 =?us-ascii?Q?J6oZf7U1WMtCEtAWsp7W/S0BvYsW0MHvVFJUyuDIT6QQP3xLfI452XgCL8sD?=
 =?us-ascii?Q?tlozVIscK9ge4FgJOvDcZi7JQNnuZa1y+vFdtyHlf83pPRkxXB9gD4I0vlsB?=
 =?us-ascii?Q?WJ/4WFvL/HV/xvDw1/LjfVs5199JecMh3BjyRMw89dCoAV8hQwkbFTT8ufPO?=
 =?us-ascii?Q?Sg70vqq1PGbAx1hDLu7xksGKu1ObIdiu1BOJdgJboPaOrESbQ2gukqsjVVtK?=
 =?us-ascii?Q?TYehlUmdYFAQm6R4516vIiJ9uvmjcoO1B8QeO+EAvjmuD0g/CWat7cCV6ruc?=
 =?us-ascii?Q?IBePCdBYlnDmqHP8o+Ue63pFXGvNUdgZsScRK6ZLhxrifvwhqTxgnzso6hE/?=
 =?us-ascii?Q?1BNEZ//0Y7H7qq89MtCKu19aaSYBWkFLSi74nej8rjZyYwxo4niil498LeLI?=
 =?us-ascii?Q?4prKz+CZENkNDpkdtZVQNc1f8ET5pIB9Tirq49vhb2fO6wTng6JfrRPpcGor?=
 =?us-ascii?Q?h5yMC0a22wKDT2VqW80o1uEwPdH7GJJHUVZGtgJSSMeasPhBUIZxF6sN+cr7?=
 =?us-ascii?Q?lOGBxhOSONIkjORaLr7YVkum7+1dOKqzhO0uhyr+JR/za+oR95fKZhXbYDbg?=
 =?us-ascii?Q?NaME434TDhz0WqdWBxUi79bDiQqxXJjk8iF1eXyNYou76qe8Wn4brv6xq84g?=
 =?us-ascii?Q?BBcKx+mt3j3NVdh/RnCh+k6qnyzxeh3a3z4tehTlGzMiupUrhlskw43Y5ehV?=
 =?us-ascii?Q?382JzTQGocwj3kdo2fs+dJTKtW1rSbYxJ/a2XR/nDih0Ctfty4Vo3ghYuyVF?=
 =?us-ascii?Q?dShHG5+1BZ6pojjZFIKY0O72IKBODWXfrkPpVEFvus/f4UJ60JZS50wyDnNS?=
 =?us-ascii?Q?2k8Yn497mYSSI323+VOvgmubbLo2KBFfqa1VbuGs5FrUH41uZzRfMWaqs0ck?=
 =?us-ascii?Q?fSj4146h6pwCBgvqWSlUFX670sIAfN9BfDa3jGD5w+wSeIgLBK024LrMLRuQ?=
 =?us-ascii?Q?1HUkx26q5TRf6ebj+c84O4SFAa1TOY9gJa0OTuqueLUnd5E8pspvrFM3grfJ?=
 =?us-ascii?Q?4csUPIhSLEuQmjPCHVWToGqPaf/RFw4JZnUoqH7S0inp6zRv6mmx?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fb795c32-8e36-470c-25b1-08deb237a0f2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:32.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyQwljqCxvJtSjUcUkD7Y7JW7k74wXQFr8l4xs7a/waImBRF6pysRyedWtULpXhNQkITK+7vPdcCrQsnZ6C6hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-d25034/1778818125-F5784CF5-C1540339/0/0
X-purgate-type: clean
X-purgate-size: 14710
X-Rspamd-Queue-Id: 0363C5491B7
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

Finish the restartable build path with REC creation and Realm
activation. Keep enough state to continue after preemption or abort
cleanly.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/Kconfig           |  11 ++
 xen/arch/arm/cca/Makefile      |   1 +
 xen/arch/arm/cca/build.c       | 333 +++++++++++++++++++++++++++++++++
 xen/arch/arm/cca/state.c       |   7 +
 xen/arch/arm/include/asm/cca.h |  26 +++
 5 files changed, 378 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index dc99020c96de..3635a79af272 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -132,6 +132,17 @@ config ARM_CCA
 
 	  This support is experimental. If unsure, say N.
 
+config ARM_CCA_REALM_DEBUG_VUART
+	bool "Debug VUART console for Arm Realm guests"
+	depends on ARM_CCA && SBSA_VUART_CONSOLE
+	help
+	  Allow Arm CCA Realm guests to use the emulated SBSA UART console.
+
+	  The VUART is a host-visible clear-text debug channel. It is useful
+	  for Realm debug access while there is no better guest access
+	  path, but confidentiality-oriented configurations should disable it
+	  and rely on attested in-Realm services instead.
+
 config GICV2
 	bool "GICv2 driver"
 	default y
diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
index bf6d9b58ebec..0e66280012b7 100644
--- a/xen/arch/arm/cca/Makefile
+++ b/xen/arch/arm/cca/Makefile
@@ -3,3 +3,4 @@ obj-y += realm.o
 obj-y += rmi.o
 obj-y += sro.o
 obj-y += state.o
+obj-y += build.o
diff --git a/xen/arch/arm/cca/build.c b/xen/arch/arm/cca/build.c
index 8e607e97b99c..29eb0c6057b0 100644
--- a/xen/arch/arm/cca/build.c
+++ b/xen/arch/arm/cca/build.c
@@ -788,3 +788,336 @@ err_page:
 
     return rc;
 }
+
+static void arm_cca_adopt_rec_aux_pages(struct vcpu *v,
+                                        struct page_info **pending_aux,
+                                        unsigned int *nr_pending_aux)
+{
+    unsigned int i;
+
+    for ( i = 0; i < *nr_pending_aux; ++i )
+    {
+        ASSERT(v->arch.cca.nr_aux < ARRAY_SIZE(v->arch.cca.aux_pages));
+        v->arch.cca.aux_pages[v->arch.cca.nr_aux++] = pending_aux[i];
+        pending_aux[i] = NULL;
+    }
+
+    *nr_pending_aux = 0;
+}
+
+static int arm_cca_rmi_rec_create_complete(struct domain *d, struct vcpu *v,
+                                           paddr_t rec, paddr_t params,
+                                           uint64_t *rmi_result)
+{
+    struct page_info *pending_aux[ARM_CCA_MAX_REC_AUX] = { NULL };
+    unsigned int nr_pending_aux = 0;
+    struct arm_cca_sro_mem_xfer xfer = {
+        .pages = pending_aux,
+        .nr_pages = &nr_pending_aux,
+        .abandoned_pages = &d->arch.cca.abandoned_pages,
+    };
+    struct arm_smccc_res res;
+    int rc;
+
+    if ( v->arch.cca.nr_aux > ARRAY_SIZE(v->arch.cca.aux_pages) )
+        return -EIO;
+
+    xfer.max_pages = ARRAY_SIZE(v->arch.cca.aux_pages) - v->arch.cca.nr_aux;
+
+    rc = arm_cca_rmi_rec_create(d->arch.cca.rd, rec, params, &res);
+    rc = arm_cca_sro_complete_mem_transfer(rc, &res, &xfer);
+    rc = arm_cca_build_record_rmi_failure(rmi_result, rc, &res);
+
+    if ( rc != 0 && nr_pending_aux != 0 )
+    {
+        /*
+         * Accepted REC auxiliary pages are returned only when the SRO reports
+         * RMI_OP_MEM_REQ_RECLAIM.  If it ends before then, Xen has no separate
+         * reclaim operation for them.
+         */
+        d->arch.cca.build_unrecoverable = true;
+    }
+
+    if ( nr_pending_aux != 0 )
+        arm_cca_adopt_rec_aux_pages(v, pending_aux, &nr_pending_aux);
+
+    return rc;
+}
+
+static int arm_cca_create_rec(struct domain *d, struct vcpu *v, bool runnable,
+                              uint64_t *rmi_result)
+{
+    struct cpu_user_regs *regs;
+    struct arm_cca_rmi_rec_params *params;
+    struct page_info *rec_pg = NULL;
+    struct page_info *params_pg = NULL;
+    bool rec_delegated = false, run_created = false;
+    void *va;
+    int rc = -ENOMEM;
+
+    rec_pg = arm_cca_alloc_host_page();
+    if ( !rec_pg )
+        goto out;
+
+    params_pg = arm_cca_alloc_host_page();
+    if ( !params_pg )
+        goto out;
+
+    if ( !v->arch.cca.run )
+    {
+        v->arch.cca.run = arm_cca_alloc_rec_run();
+        if ( !v->arch.cca.run )
+            goto out;
+        v->arch.cca.run_pa = virt_to_maddr(v->arch.cca.run);
+        run_created = true;
+    }
+
+    rc = arm_cca_delegate_granule(page_to_maddr(rec_pg));
+    if ( rc != 0 )
+        goto out;
+    rec_delegated = true;
+
+    va = map_domain_page(page_to_mfn(params_pg));
+    params = va;
+    regs = &v->arch.cpu_info->guest_cpu_user_regs;
+
+    /*
+     * REC_CREATE takes an RmiRecMpidr affinity value, not a full MPIDR_EL1.
+     * DEN0137 2.0-bet1 - B4.6.68 RmiRecMpidr type.
+     */
+    arm_cca_rec_params_init(params, vcpuid_to_vaffinity(v->vcpu_id),
+                            regs->pc, runnable);
+    params->gprs[0] = regs->x0;
+    params->gprs[1] = regs->x1;
+    params->gprs[2] = regs->x2;
+    params->gprs[3] = regs->x3;
+
+    unmap_domain_page(va);
+
+    rc = arm_cca_rmi_rec_create_complete(d, v, page_to_maddr(rec_pg),
+                                         page_to_maddr(params_pg),
+                                         rmi_result);
+    if ( rc != 0 )
+        goto out;
+
+    arm_cca_rec_run_init(v->arch.cca.run);
+
+    v->arch.cca.rec_page = rec_pg;
+    v->arch.cca.rec = page_to_maddr(rec_pg);
+    rc = 0;
+
+out:
+    if ( params_pg )
+        free_domheap_page(params_pg);
+
+    if ( rc != 0 && rec_pg )
+        arm_cca_free_or_abandon_build_page(d, rec_pg, rec_delegated);
+
+    if ( rc != 0 && run_created )
+    {
+        arm_cca_free_rec_run(v->arch.cca.run);
+        v->arch.cca.run = NULL;
+        v->arch.cca.run_pa = INVALID_PADDR;
+    }
+
+    return rc;
+}
+
+/* DEN0137 2.0-bet1 - D1.2.4 REC creation flow. */
+static int arm_cca_create_recs(struct domain *d, uint64_t *rmi_result)
+{
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < d->max_vcpus; ++i )
+    {
+        struct vcpu *v = d->vcpu[i];
+
+        ASSERT(v);
+
+        rc = arm_cca_create_rec(d, v, i == 0, rmi_result);
+        if ( rc != 0 )
+            return rc;
+
+    }
+
+    return 0;
+}
+
+static void arm_cca_build_state_clear(struct domain *d)
+{
+    d->arch.cca.build_phase = ARM_CCA_BUILD_NONE;
+    d->arch.cca.build_unrecoverable = false;
+    d->arch.cca.build_abort_rmi_result = 0;
+    d->arch.cca.build_base_gfn = INVALID_GFN;
+    d->arch.cca.build_nr_pages = 0;
+    d->arch.cca.build_next_ipa = INVALID_PADDR;
+    d->arch.cca.build_rtt_level = 0;
+}
+
+static void arm_cca_build_state_start(struct domain *d, gfn_t base_gfn,
+                                      unsigned long nr_pages)
+{
+    d->arch.cca.build_phase = ARM_CCA_BUILD_VALIDATE;
+    d->arch.cca.build_unrecoverable = false;
+    d->arch.cca.build_abort_rmi_result = 0;
+    d->arch.cca.build_base_gfn = base_gfn;
+    d->arch.cca.build_nr_pages = nr_pages;
+    d->arch.cca.build_next_ipa = INVALID_PADDR;
+    d->arch.cca.build_rtt_level = 0;
+}
+
+static int arm_cca_build_state_check(struct domain *d, gfn_t base_gfn,
+                                     unsigned long nr_pages)
+{
+    if ( d->arch.cca.build_phase == ARM_CCA_BUILD_NONE )
+    {
+        arm_cca_build_state_start(d, base_gfn, nr_pages);
+        return 0;
+    }
+
+    if ( !gfn_eq(d->arch.cca.build_base_gfn, base_gfn) ||
+         d->arch.cca.build_nr_pages != nr_pages )
+        return -EBUSY;
+
+    return 0;
+}
+
+static int arm_cca_domain_finalize_abort(struct domain *d)
+{
+    unsigned int i;
+    bool fatal = d->arch.cca.build_unrecoverable;
+    int rc;
+
+    rc = arm_cca_domain_relinquish_resources(d);
+    if ( rc != 0 )
+    {
+        if ( rc == -ERESTART )
+            return rc;
+
+        return -EIO;
+    }
+
+    for ( i = 0; i < d->max_vcpus; ++i )
+    {
+        struct vcpu *v = d->vcpu[i];
+
+        if ( v == NULL )
+            continue;
+
+        arm_cca_vcpu_destroy(v);
+        arm_cca_vcpu_init(v);
+    }
+
+    return fatal ? -EIO : 0;
+}
+
+int arm_cca_domain_finalize(struct domain *d, gfn_t base_gfn,
+                            unsigned long nr_pages,
+                            uint64_t *rmi_result)
+{
+    paddr_t base = gfn_to_gaddr(base_gfn);
+    struct arm_smccc_res res;
+    uint64_t abort_rmi_result;
+    int abort_rc, rc;
+
+    if ( rmi_result )
+        *rmi_result = 0;
+
+    rc = arm_cca_build_state_check(d, base_gfn, nr_pages);
+    if ( rc != 0 )
+        return rc;
+
+    for ( ;; )
+    {
+        switch ( d->arch.cca.build_phase )
+        {
+        case ARM_CCA_BUILD_VALIDATE:
+            rc = arm_cca_validate_domain(d, base_gfn, nr_pages);
+            if ( rc != 0 )
+            {
+                arm_cca_build_state_clear(d);
+                return rc;
+            }
+            rc = arm_cca_probe(d);
+            if ( rc != 0 )
+            {
+                arm_cca_build_state_clear(d);
+                return rc;
+            }
+            d->arch.cca.build_phase = ARM_CCA_BUILD_CREATE_REALM;
+            fallthrough;
+
+        case ARM_CCA_BUILD_CREATE_REALM:
+            rc = arm_cca_create_realm(d, rmi_result);
+            if ( rc != 0 )
+                goto err;
+            d->arch.cca.build_phase = ARM_CCA_BUILD_BUILD_RTTS;
+            fallthrough;
+
+        case ARM_CCA_BUILD_BUILD_RTTS:
+            rc = arm_cca_build_rtts(d, base, nr_pages, rmi_result);
+            if ( rc == -ERESTART )
+                return rc;
+            if ( rc != 0 )
+                goto err;
+            d->arch.cca.build_phase = ARM_CCA_BUILD_CREATE_DATA;
+            fallthrough;
+
+        case ARM_CCA_BUILD_CREATE_DATA:
+            rc = arm_cca_create_data_pages(d, base_gfn, nr_pages, rmi_result);
+            if ( rc == -ERESTART )
+                return rc;
+            if ( rc != 0 )
+                goto err;
+            d->arch.cca.build_phase = ARM_CCA_BUILD_CREATE_REC;
+            fallthrough;
+
+        case ARM_CCA_BUILD_CREATE_REC:
+            rc = arm_cca_create_recs(d, rmi_result);
+            if ( rc != 0 )
+                goto err;
+            d->arch.cca.build_phase = ARM_CCA_BUILD_ACTIVATE;
+            fallthrough;
+
+        case ARM_CCA_BUILD_ACTIVATE:
+            rc = arm_cca_rmi_realm_activate(d->arch.cca.rd, &res);
+            rc = arm_cca_build_record_rmi_failure(rmi_result, rc, &res);
+            if ( rc != 0 )
+                goto err;
+            d->arch.cca.build_phase = ARM_CCA_BUILD_BIND;
+            fallthrough;
+
+        case ARM_CCA_BUILD_BIND:
+            d->arch.cca.realm_active = true;
+            arm_cca_build_state_clear(d);
+            return 0;
+
+        case ARM_CCA_BUILD_ABORT:
+            abort_rmi_result = d->arch.cca.build_abort_rmi_result;
+            rc = arm_cca_domain_finalize_abort(d);
+            if ( rc == -ERESTART )
+                return rc;
+            /* The original build error is gone after a continuation. */
+            if ( rc == 0 )
+                rc = -EIO;
+            if ( rc == -EIO && rmi_result )
+                *rmi_result = abort_rmi_result;
+            return rc;
+
+        default:
+            rc = -EINVAL;
+            goto err;
+        }
+    }
+
+err:
+    d->arch.cca.build_abort_rmi_result = rmi_result ? *rmi_result : 0;
+    d->arch.cca.build_phase = ARM_CCA_BUILD_ABORT;
+
+    abort_rc = arm_cca_domain_finalize_abort(d);
+    if ( abort_rc == -ERESTART )
+        return abort_rc;
+
+    return abort_rc ?: rc;
+}
diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index 72dbb83841d7..d85a20a9e7d2 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -32,6 +32,13 @@ static void arm_cca_reset_domain_state(struct domain *d)
     d->arch.cca.nr_data_pages = 0;
     d->arch.cca.relinquish_data_idx = 0;
     d->arch.cca.realm_terminate_done = false;
+    d->arch.cca.build_phase = ARM_CCA_BUILD_NONE;
+    d->arch.cca.build_unrecoverable = false;
+    d->arch.cca.build_abort_rmi_result = 0;
+    d->arch.cca.build_base_gfn = INVALID_GFN;
+    d->arch.cca.build_nr_pages = 0;
+    d->arch.cca.build_next_ipa = INVALID_PADDR;
+    d->arch.cca.build_rtt_level = 0;
 
     for ( i = 0; i < ARRAY_SIZE(d->arch.cca.realm_sro_pages); ++i )
         d->arch.cca.realm_sro_pages[i] = NULL;
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index d69e95a10010..5e6b11a3693d 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -2,6 +2,7 @@
 #ifndef ARM_CCA_H
 #define ARM_CCA_H
 
+#include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/types.h>
@@ -41,6 +42,18 @@ struct arm_cca_data_page_record {
     paddr_t pa;
 };
 
+enum arm_cca_build_phase {
+    ARM_CCA_BUILD_NONE,
+    ARM_CCA_BUILD_VALIDATE,
+    ARM_CCA_BUILD_CREATE_REALM,
+    ARM_CCA_BUILD_BUILD_RTTS,
+    ARM_CCA_BUILD_CREATE_DATA,
+    ARM_CCA_BUILD_CREATE_REC,
+    ARM_CCA_BUILD_ACTIVATE,
+    ARM_CCA_BUILD_BIND,
+    ARM_CCA_BUILD_ABORT,
+};
+
 struct arm_cca_domain_state {
     bool realm_active;
     paddr_t rd;
@@ -70,6 +83,15 @@ struct arm_cca_domain_state {
     /* Realm destruction state for domain_relinquish_resources(). */
     unsigned long relinquish_data_idx;
     bool realm_terminate_done;
+
+    /* Continuable Realm construction state for XEN_DOMCTL_arm_cca_op. */
+    enum arm_cca_build_phase build_phase;
+    bool build_unrecoverable;
+    uint64_t build_abort_rmi_result;
+    gfn_t build_base_gfn;
+    unsigned long build_nr_pages;
+    paddr_t build_next_ipa;
+    unsigned int build_rtt_level;
 };
 
 struct arm_cca_vcpu_state {
@@ -85,8 +107,12 @@ struct arm_cca_vcpu_state {
 void arm_cca_domain_init(struct domain *d);
 void arm_cca_domain_destroy(struct domain *d);
 int arm_cca_domain_relinquish_resources(struct domain *d);
+int arm_cca_domain_finalize(struct domain *d, gfn_t base_gfn,
+                            unsigned long nr_pages,
+                            uint64_t *rmi_result);
 
 void arm_cca_vcpu_init(struct vcpu *v);
+void noreturn arm_cca_vcpu_run(struct vcpu *v);
 void arm_cca_vcpu_destroy(struct vcpu *v);
 
 void *arm_cca_alloc_rec_run(void);
-- 
2.51.0


