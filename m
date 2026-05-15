Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMq4HgmdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF54549221
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309423.1580477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtp-0000fD-UB; Fri, 15 May 2026 04:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309423.1580477; Fri, 15 May 2026 04:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjtp-0000ck-NI; Fri, 15 May 2026 04:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1309423;
 Fri, 15 May 2026 04:11:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtn-0000aU-EI
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjtm-0052Iz-Qq
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cda-e002-0a2a0a5209dd-0a2a4505a2ee-12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:42 +0200
Received: from [52.101.125.85]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c47-aaa8-0a2a45050019-34657d55753b-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:42 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:37 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:37 +0000
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
 b=I+Mwv9doEpL2dG4jZioqU2Kknggnd98GpjjzPGosMa2iRRSIp6O/nfW0SyX1YVmZ5bVDOxQrL6auDQDck15aeaymVVih2OZH0UpegmKXsSo1Q16LjKwR8nMg3vNTMkH/62VALPW4e6tpbkqzDRWEGckPJr36d9WiIbus+TZ34z1wsztEUBKMv0+z9WGAxikikzD+WFC7odBPh9wT7Kc+kep3K8aXT7rFVaP1dKLo2E6zNmBjwEqxusqN1FBTCOzUNfPQ9DdLTtNOL6cN5hJTnG6CXdj1o1hOQ0DmR0b96e2K2smWXb9UfsQ9xK6HYPCYQWucLaUISw3ExLj6CTQQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GEQq9mUrsUO2xmFWtA16fpenonSWpgtrYzSVQj3dvs=;
 b=Q5s2yI/O1dtr+dmoLh13LvNx5cH63OY4ijrIl6nw7vFPLyLa9c8ToSyyeL+uoQdFPwU6sDj+hC+FjWppeNX+mErOPTrtkJPbRSQW76a2b+bG9guohPOsxjRR99TERYSucUp1zlDgUitCgmsMegTD2gy+CCQnhSiCYzRoq0f5O38mQ6R+t5Q5aFr0W157+GgmDOAYMPzVI/B8xn6QyilAOfKoXAbA5F20Wb5V94bZ1I8DIz4W2iAc9TQ0BV1EVzmMAlm9p0hA/RmRuly402F20go1Bzrh65IY4ikDTsODxuy28xVGxCh6KohNVn2k+cVybBNqQV4yQB4oo8sJBlWthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GEQq9mUrsUO2xmFWtA16fpenonSWpgtrYzSVQj3dvs=;
 b=RyEXpRN6OGjpLer46tyyDBhwLNmLMLbql9h3MIev/DmRhiuOOAFcX4gjsbXBvBgrSQCidx0WgvJxeWzEDfrlgX+Ljpli6fMm5sRl6+7S624Ha28MNiuNuOy/sb+wMMVJwLy8WKTxgjnw7GjbV+GVNukR7U0nMDltN2hqWRbLF44=
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
Subject: [RFC PATCH v1 19/26] xen/arm: io: add register-backed MMIO emulation helpers
Date: Fri, 15 May 2026 13:08:05 +0900
Message-ID: <20260515040812.983626-20-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b2df52-2116-46b7-47cf-08deb237a16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U6VlV6gaUUfaFI/K38P8Q6Hk6DXv19NQxfciuaNyiSVmmkDP55JiTinpy1unUtgqIc5jMOxDxSaXST9+O1wmei5UluCUisXXAry5Uv05ltp6INJ/pCEI2IEF7uvPCTsnJ/3pW+C5tQkzf9IN/swiEckqisKgZm5tG2kEqATSyNLXnQiyJRmY8UuJDekFkWzjvMBENBKDdYyPn01v0vg6U5gQgkBLqkeMaOpbg7cqLUMBpEQL/QCi5MykHz0b6+T0mmHMg/7r0a+FSQzs3nKa7/LWyRMXDe0CU8z628rZQk9IrUSatm3yAPctr8XylnsBnl/f5pjpBAi78HXKWdlwZ8bQqvB4us49hZhkNPPP6Mo3yOnaGzJ3zmZP2ikPcJyid/DL3EqswIv/oVuR8YgFGQsFNKl9J10niu/I1ft8q55a7t4kKmXpFdBZS9S8rRieX2zVtbwmfcrHOB2QxS8FSKdCSmmkF0Tp9whvNBiIIKziuwyoZhH1/jgLNO88jnTCXvj+qs3/2BndH8nd2K6EFttzH+dAhpltLoBCtfzDAiNtzkxqqB3xc1UHBXahfkQ2vJgCFZYa1EGxMJxjL8aMv8hByZ+aKeCiyVhkl3RLV+snHlxqBMGRBPGR8kjKEXQ0sKCVkcurqvyMEOrgO+7jIYhmdN3nj2jeswoYsyDXmopHqDNJvSu9lbaW2Cr6W5Km
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1TmzJpbSXKjXTSC1euq3fKDSjNjFiE5+1oHbFYwBkUmWEVChL4zbTi2qzGjj?=
 =?us-ascii?Q?LbEtSSHiS/uGghDQ1R8v8PiV4uAl52fvzGtlDOPKwX5LwpI+SdNy5SsaTsJe?=
 =?us-ascii?Q?eGFXzd9MGV5W22RAeWguEdz3Kofaf5Dr1NurRho8Ag1UesFO3wizzppFjOkr?=
 =?us-ascii?Q?mEcztkSwzlH9Gst7IAscjZvKGRKrat/fy1EgEArMc0gId8t23q4oHmIbtIKA?=
 =?us-ascii?Q?mhuEo6CO2CqaDKB16jRdRqYN66mrSom0YMBRY6N/NOGLNy1do55IIvfnlMNQ?=
 =?us-ascii?Q?fiMRCBuHGgplKrFmMgvdbiAgDf4y86TZeHmtbE0QcoalAS6t/9CR9V7NFhs2?=
 =?us-ascii?Q?l4Pk5n/QGQ76RXKe5BaSpYkjh/v1y6Ji9DPNCCE0oUnSPCutuuIEmghdjclo?=
 =?us-ascii?Q?TuRJvaevy/gIj2UP+mydXKiXsSn/yenKmK2s4oaEDGesWH9EwoJvwJCUF6NR?=
 =?us-ascii?Q?Y62hZKEue61y38nzzizqu/ct0wYiXRhM08Hgzzd8QjF98NXx8sqW5/HOkaOY?=
 =?us-ascii?Q?hII6i5q68MWjXoGOfazvkH3gXNX+qSWDeuIUoRm17jlWCON298wuTXbNjZvg?=
 =?us-ascii?Q?0vg4kocY4XKhtiAUMCFgfoZhaP8xjSC8YFZ18T4KgivTIPzMX+XhLFOMI2lE?=
 =?us-ascii?Q?EjWQtBYydDVIMb2a9yeZaU1oX45KUG+JYw4eZAoqCr/y2wBiZ7A7OERYUZ5H?=
 =?us-ascii?Q?yEB/ddC/DDSrgzMZkdqgrRPHV4Aw5namRSpmTciWdIVfePBO4b3XLBKwHxSs?=
 =?us-ascii?Q?xRa9kOpZxhCdATcMMXA04OWEQQ7+cAEXCH+IJ9n0mUiCRiFWqCNXKRuRQfSC?=
 =?us-ascii?Q?iP2965Pii0Aj63CuBsLS04o6SSlIvY6+ZeiWALVZTFqigaa5qSMjp8HIcTtm?=
 =?us-ascii?Q?ADIy32Bj9IMQTocHB/yPZWGuQeoTNvKLtBZe+EwLv0tdjHO5L7BUddXwMbf8?=
 =?us-ascii?Q?5S3duTHG04GeWaLg3NHmTVwVC8tKTyAwzLSrSzR1lYL92KYJNPBVTGdqKE1j?=
 =?us-ascii?Q?FPGxOnBm3tVhWyPu9T/4Pka7l3vXBtb3AVq1TBNLXlIL3oXThbmFCwPEbxSS?=
 =?us-ascii?Q?FHgqlMMLOHzZ+yYuTlbcqa7xivCqivMTjHwfgNUp8TOOzFaemlhZL7L9O8av?=
 =?us-ascii?Q?SL0WXjhGRLxlOV0RVriHhy5Nv42W/+xpQuDARMcnxrdwcEs2gVE7aA7qtX2i?=
 =?us-ascii?Q?XggeGia70bvB/F9z5b2qUeSvRXJMyB2QAod9iV3QGUt5wNy6EilrOa2+66T1?=
 =?us-ascii?Q?eV307le+48yue/0754eO8letHWAOXxN9NyThlq2bFuAYrfXM8dNjCPZ0nELO?=
 =?us-ascii?Q?Qz4Q5udw52kNT8cIyeYs04je0ARpT+tMdZYN0BZQ3zcaC3bUcDqJl1KzE3ab?=
 =?us-ascii?Q?dZgQr5iOYVLhZOABicGwpuquTZCAd8K85y3HhcvK48aewXxowz1Q3wGCmZTZ?=
 =?us-ascii?Q?tDqNB7bIe0GlXBdipqsJb/y1s+wWnogKKEGcuB4fj8zNj5/vpZGMXjtPtcM+?=
 =?us-ascii?Q?196Erg1KBOZbftqXPewyNIZTcmNjf8DvmKVZf8LYiYMuH4wDXr8/nwoqgdDX?=
 =?us-ascii?Q?1JxWrPM2s1b/tny0RwdPsGWN3P0ICmSLOHMHwY7DKi4uIXHvRtoRLBtmmEd/?=
 =?us-ascii?Q?Z0tyAl7GHdfLhWQWRFj2mrRtoLruPyqGnq7ngM4HHBtu8QGrQ7KYbsLLlmf/?=
 =?us-ascii?Q?0BBpPP06UtzbyArFRY6tRIA0lPXRhGtAVqatH2Lk0T3FI5YKW6AkD9wt8O7b?=
 =?us-ascii?Q?puTOoYoj5cn2X1zj9UP57WWmHNMRdp6n6foyw4FU+i6unmiAF7Cq?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b2df52-2116-46b7-47cf-08deb237a16b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:33.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWJX4PNgNnE8pIFC2EfpPAEqrDSr5j/1uJl6p+6iMhtMBr9RaIllisFo+4Kkx+r7hxxb5bfwzio9e8Clq8qm+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-c201ff/1778818122-E1B9E443-EA4EBE55/0/0
X-purgate-type: clean
X-purgate-size: 7058
X-Rspamd-Queue-Id: CBF54549221
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

Allow the Arm MMIO emulator to use a caller-provided register backend.
Realm exits carry GPR state in RecRun, not in guest_cpu_user_regs().

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/include/asm/mmio.h | 11 ++++
 xen/arch/arm/io.c               | 99 +++++++++++++++++++++++++--------
 2 files changed, 88 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index b22cfdac5be9..b8a640dc6ee7 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -62,6 +62,14 @@ typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
 typedef int (*mmio_write_t)(struct vcpu *v, mmio_info_t *info,
                             register_t r, void *priv);
 
+typedef register_t (*mmio_reg_read_t)(void *ctxt, int reg);
+typedef void (*mmio_reg_write_t)(void *ctxt, int reg, register_t value);
+
+struct mmio_regops {
+    mmio_reg_read_t read;
+    mmio_reg_write_t write;
+};
+
 struct mmio_handler_ops {
     mmio_read_t read;
     mmio_write_t write;
@@ -83,6 +91,9 @@ struct vmmio {
 
 enum io_state try_handle_mmio(struct cpu_user_regs *regs,
                               mmio_info_t *info);
+enum io_state try_handle_mmio_regops(struct vcpu *v, mmio_info_t *info,
+                                     const struct mmio_regops *regops,
+                                     void *ctxt);
 void register_mmio_handler(struct domain *d,
                            const struct mmio_handler_ops *ops,
                            paddr_t addr, paddr_t size, void *priv);
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 9707cadcf80e..9ce9fe1c1528 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -47,12 +47,36 @@ static const struct mmio_handler unmapped_handler = {
     .ops = &unmapped_ops
 };
 
+struct mmio_guest_regs {
+    struct cpu_user_regs *regs;
+};
+
+static register_t mmio_guest_read_reg(void *ctxt, int reg)
+{
+    struct mmio_guest_regs *guest = ctxt;
+
+    return get_user_reg(guest->regs, reg);
+}
+
+static void mmio_guest_write_reg(void *ctxt, int reg, register_t value)
+{
+    struct mmio_guest_regs *guest = ctxt;
+
+    set_user_reg(guest->regs, reg, value);
+}
+
+static const struct mmio_regops mmio_guest_regops = {
+    .read = mmio_guest_read_reg,
+    .write = mmio_guest_write_reg,
+};
+
 static enum io_state handle_read(const struct mmio_handler *handler,
                                  struct vcpu *v,
-                                 mmio_info_t *info)
+                                 mmio_info_t *info,
+                                 const struct mmio_regops *regops,
+                                 void *ctxt)
 {
     const struct hsr_dabt dabt = info->dabt;
-    struct cpu_user_regs *regs = guest_cpu_user_regs();
     /*
      * Initialize to zero to avoid leaking data if there is an
      * implementation error in the emulation (such as not correctly
@@ -66,22 +90,24 @@ static enum io_state handle_read(const struct mmio_handler *handler,
     ASSERT((r & ~GENMASK((1U << info->dabt.size) * 8 - 1, 0)) == 0);
 
     r = sign_extend(dabt, r);
-
-    set_user_reg(regs, dabt.reg, r);
+    regops->write(ctxt, dabt.reg, r);
 
     return IO_HANDLED;
 }
 
 static enum io_state handle_write(const struct mmio_handler *handler,
                                   struct vcpu *v,
-                                  mmio_info_t *info)
+                                  mmio_info_t *info,
+                                  const struct mmio_regops *regops,
+                                  void *ctxt)
 {
     const struct hsr_dabt dabt = info->dabt;
-    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    register_t value;
     int ret;
 
-    ret = handler->ops->write(v, info, get_user_reg(regs, dabt.reg),
-                              handler->priv);
+    value = regops->read(ctxt, dabt.reg);
+    ret = handler->ops->write(v, info, value, handler->priv);
+
     return ret ? IO_HANDLED : IO_ABORT;
 }
 
@@ -183,10 +209,13 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
     }
 }
 
-enum io_state try_handle_mmio(struct cpu_user_regs *regs,
-                              mmio_info_t *info)
+static enum io_state __try_handle_mmio(struct vcpu *v,
+                                       struct cpu_user_regs *regs,
+                                       mmio_info_t *info,
+                                       const struct mmio_regops *regops,
+                                       void *ctxt,
+                                       bool allow_ioreq)
 {
-    struct vcpu *v = current;
     const struct mmio_handler *handler = NULL;
     int rc;
 
@@ -202,17 +231,22 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     if ( !handler )
     {
         bool trap_unmapped = v->domain->options &
-                                         XEN_DOMCTL_CDF_trap_unmapped_accesses;
-        rc = try_fwd_ioserv(regs, v, info);
-        if ( rc == IO_HANDLED )
-            return handle_ioserv(regs, v);
-        else if ( rc == IO_UNHANDLED && !trap_unmapped )
+                             XEN_DOMCTL_CDF_trap_unmapped_accesses;
+
+        if ( allow_ioreq )
         {
-            /* Fallback to the unmapped handler. */
-            handler = &unmapped_handler;
-        } else {
-            return rc;
+            rc = try_fwd_ioserv(regs, v, info);
+            if ( rc == IO_HANDLED )
+                return handle_ioserv(regs, v);
+            else if ( rc != IO_UNHANDLED )
+                return rc;
         }
+
+        if ( trap_unmapped )
+            return IO_UNHANDLED;
+
+        /* Fallback to the unmapped handler. */
+        handler = &unmapped_handler;
     }
 
     /*
@@ -228,9 +262,30 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
      * instruction on the emulated MMIO region.
      */
     if ( info->dabt.write )
-        return handle_write(handler, v, info);
+        return handle_write(handler, v, info, regops, ctxt);
     else
-        return handle_read(handler, v, info);
+        return handle_read(handler, v, info, regops, ctxt);
+}
+
+enum io_state try_handle_mmio(struct cpu_user_regs *regs,
+                              mmio_info_t *info)
+{
+    struct mmio_guest_regs guest = { .regs = regs };
+
+    return __try_handle_mmio(current, regs, info, &mmio_guest_regops,
+                             &guest, true);
+}
+
+enum io_state try_handle_mmio_regops(struct vcpu *v, mmio_info_t *info,
+                                     const struct mmio_regops *regops,
+                                     void *ctxt)
+{
+    ASSERT(v != NULL);
+    ASSERT(regops != NULL);
+    ASSERT(regops->read != NULL);
+    ASSERT(regops->write != NULL);
+
+    return __try_handle_mmio(v, NULL, info, regops, ctxt, false);
 }
 
 void register_mmio_handler(struct domain *d,
-- 
2.51.0


