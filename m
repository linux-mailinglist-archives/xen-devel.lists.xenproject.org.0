Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SqeSENm6HGqVRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3056182BB
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323472.1589237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxM-0007M2-2l; Sun, 31 May 2026 22:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323472.1589237; Sun, 31 May 2026 22:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxL-0007G0-S6; Sun, 31 May 2026 22:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1323472;
 Sun, 31 May 2026 22:48:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxK-000732-9p
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxJ-00BFyL-Mv
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba9e-5cb7-0a2a0a5109dd-0a2a4508c056-18
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:29 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbabb-63b5-0a2a45080019-3465e45c1533-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:29 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:25 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:25 +0000
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
 b=qkng8pdB40bOngRy4VPOI3CpFigMMbOBmcth24d84ePYynjcrkP/4beY0urPZKOdWSGECUGsf0igmW1cw7sb81dfHZXWHMZpGP4OwNZRFW2ScWcNOi+ojE+ZBWS8m3njBI82p3Ussohowopr82RCPkNevKd+T+9frXo8B2jHTu5uft6Sqqr4mGbzCmJNu/eccrX4jmQOHvl/5dL2kgyuAOpMVWm0T7bubhpj/cjQ15Ji3VYEfSRv9YX4x8dcR5e8GIFjxZml5371aTu+crjocPIo8dQtRo8dEyfmFpsLzNBpRES3GKA2HyMHw56VvXf8YrwdcSu0INjDqZL1kpDYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/1jjuePRl2BihluZPqQwpapSqp5qYBLP0RAoKJuUMM=;
 b=XdPmrDFCfAHC+6bEw3AzR9ZgmdgqGVHRullXTTPhlDoW8Vh4bHw3hgvEQIfzIwmdUwtyGxqM96TrfoyucODDEZELOH6V2lzbst+8x/t5MmDPtMb/4cqiwHEar1dcMN963BuqBywW66UuMJ7VFksphg6EQrwidyXUDHIUoc30nWOKSBL7XY/nzqEtuwBVqL/JYGX5CPvbaJhh5n7LP7S7SF1iBR3K8RulQXQJXYBfo85lKtPbF+TrDMIBmR1rR313xYroU6PoRHiV4L3ZB0VBcbeT8iCEy1iwZoXFNwh+fRmRCfUznH6kEnVkEoHpfHPf9YmGqh2PrYAYA9ZlgdAs/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/1jjuePRl2BihluZPqQwpapSqp5qYBLP0RAoKJuUMM=;
 b=V2t8hQQYfN9swYxsjRnEUMT7+FTLIJMqj4oMKtu/9mYVaujCyUpHgL+VOg0C+YiFUrXR6ey1/NeaOrnNV+aonoD/bxRPgoXrClNYFGaQahYOwiqaaiDldypuxqVyEDiZOgsGPGc0Z2EPLRrDNLZIOovnOFp5hOS3SfqQC0D9XMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 13/24] tools/libxl: Add 'numa-node-id' property to DomU memory nodes
Date: Mon,  1 Jun 2026 07:47:43 +0900
Message-ID: <20260531224755.9481-14-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5f87ad-c412-4a6e-129f-08debf66b9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T1mouqI8oX/Qv0sQojux+Q+ytCkgl85Q9fvZLZOLnYkYJV2mUj5a9kWB0azAiLzGJcCqAO5+naCdTHueAvliFdp1k6gwxe6IvqSL84HpHcRqPAozpmtWqRtVXpapyrKcS46MKz26OF9caIMKEU7p+jFxJY+8p1/kdQMM6MWscaXn67orgvJdI/s2CcdszKqXkgffXiwb2Xvi4LgJwHMzMzxEwTOTERHSJLk9JLf+vFowQRQrcboNUl7mgl141+4nqvZPhR0ILu/5GR+wt5eRxzkV8kapaC7rCkSrWJT/A9gJSw/bTsRC166Jo1FpTQbzY1JK0db4wPS9mSac/gdpCZOcLDKoQ/wyQ2UZUB8jT5iN4AivFQ6u8KQ+HMUDIMz+WcOAi9KfWxV3rKQ2bhwo/7bi52lb2EtafmnocvUIA1jXOL9udgCHmGX1Gma7Ucjiw9p5ayBPwF/lUOOT9eRBIQ61PLRd837XqCWnRZLq+18MwWWWVC0YM5fQKZIahW8z52KW4NYgXCj5R4vw0hLLWJJd+VRSOkJ8LQUoM/nHVOgUKii3iYoZ1MWWAOs4mpj8lOgmLn1gryq213BaOP/N/9M0GuEgaVceQN67f20OJXinRI/TbDfzt5ej0TYPfsNjR8GqqGKoQa3lxtR7B85oDOrBVnUTXHbTFud/GrhzaTuT6V8+RFCe+6XO6+bLP1Qd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5xlKcwDJXm81g43lhZ56okgF6RDlsU7ejF1YBUJymdeUYpt460qyoR6JyM8V?=
 =?us-ascii?Q?RN/yQYQDjNYD/UysF2xXUerkQUjl4Yp4mgSfx13ocKVWPSbPypyyCBOx4MFm?=
 =?us-ascii?Q?it2T3UOEvts5pzArVIDCvRfcF7W/KD80qmHSZsM8VXowKwJCJVJ1AIgcxVlC?=
 =?us-ascii?Q?SubyRghV86vWjBxAL2TMQ6qD0mejhLE8f9HTi7q+kgjyr2ioqOpbL1eHUiPO?=
 =?us-ascii?Q?DTjDU1fctMnzyJtqTgkEdr6K/gQ78IEFcn+ao4Z+bCuMi27MncEgGxoZ/uIh?=
 =?us-ascii?Q?LDmtEBfjvJa/vmrkB8Yrr468n22ZIyikQp6hL3f6FwUZywKKmj39xpfwAbrH?=
 =?us-ascii?Q?RqY/3IPTgIzHtdA95UrUphYh93pfBrXdCrH91p3uDrYUhEujkbq2YsKhmm0h?=
 =?us-ascii?Q?DFjdptvOpr5+iduUOy1avB1Pr7WvXck1tcsJ1Krbyvs3Fch+WKLYTTPVqF8W?=
 =?us-ascii?Q?no+x6VD8/m2JI461KQ9fQ8uHHqeM5juKX9mdsWaJ3npOwjEf+jzKc8grwtpK?=
 =?us-ascii?Q?s8aFXS1iSvin6gYbA5SNkvKl7+gCInyT+5t6fhmU69837u99qj2PQ0l8SMqa?=
 =?us-ascii?Q?2RfsV2OV1Q8El8IxGZARQtNJiW2hl8HD+EfFIqKP5wJyD1cVy/mOYWitYBA6?=
 =?us-ascii?Q?wz+5RT/tLztrf5wZSvBCerCoWUmD3oNUOsCxl3LwTXvUAtuVuK7RL3b9NBkA?=
 =?us-ascii?Q?4QaB+4g9a0IVKekInluv+ay661VPRZ9alcidPOiJYeBxdGgopK5ceHPhEtdv?=
 =?us-ascii?Q?GtCUyKiJfJf7yyiB4FLhKfVVIUHUZoanxuISkegIHjYMjTsVqJ2eECg1QQh4?=
 =?us-ascii?Q?qAHo3sxYrww0atKylWfDfBxKT2NrnaQB15MtcUecoEQ8PX1NYe9fjwIuDeEo?=
 =?us-ascii?Q?xkd5LcEk1vVHE2VM1WQI32HbruEAAaXAjGlPOHR5tmiLVNvqQsNvN175fJFD?=
 =?us-ascii?Q?KQhLFS2ucMd7vhMl8as96LXeR4cavjm/7bY94kWCX0BurvKBSqPG7gG5dQQa?=
 =?us-ascii?Q?f9ignM268TTAokrEzSDM5AhJmaegCQZAVMIUT41s8tOByTVLS150T+e2Idkh?=
 =?us-ascii?Q?4HEecqm2eN24CibH8s5HPcZFY1PVJ64dUyLYNeAQzvwJxT+kq6QlIAPOCCiL?=
 =?us-ascii?Q?pK6jcMD59IVK0jCAo2clKnuvBkY0FdMT+HHr5wLDOzgNNK7DM9azwIFFz7GX?=
 =?us-ascii?Q?Jszn9TofACwZU9tLdZTbf0Mcn6dsYkPCqhi/KS+Sh2RmnuJitNXZ9NgVgIxN?=
 =?us-ascii?Q?dTPrlTVBzmdgq5s8PsdD2cam7D4clgbzLzsl+eiSMMo4kIPRRNsG9e5ozyTC?=
 =?us-ascii?Q?8R4rB7LB28LvfnhG/1NI++edGzUqbynK9jKR/tOrY7ND713iu6HIWjRkXC4P?=
 =?us-ascii?Q?6mKVQngIh1geu8MuDuvQ/HIqgP9eKC1CeazkyLMzAdxJG3zoBr546twbtG+W?=
 =?us-ascii?Q?nmD+TszW15VahJ4ohgz5CHyHFMEdGmShSo/s2DWmAmD3rOAnaLY6HcFoVxBU?=
 =?us-ascii?Q?iV4/ssZhPHlGgIOV6Q9NhW09Xf+lYWchf8FjTPIAJatG9AQUPqNO1IQe2++e?=
 =?us-ascii?Q?g20UAaKqxMOC8ASQcxGSpXQL1cC6tfw8D1/681jYso2aX3GCCbRq+t/PFJbt?=
 =?us-ascii?Q?n/ZyNhVIDTiXFQw2cLjzeaDPptRIAhekKAn6YRcQQJvqSE9A+akDQjPCWTko?=
 =?us-ascii?Q?6QNSoOUztbmMNqyC4Oc0oYXmf3RZsiiqG//6Sw0VnX3dIbpsCrPtZHWkH29D?=
 =?us-ascii?Q?DxRKZFaSQ3sfmLhyFQLHqpiDyuWESf7p6peFMTOIN2uD31Xq8vq/xdNE3kMM?=
X-MS-Exchange-AntiSpam-MessageData-1: ITtX9Vx1/3BWQg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5f87ad-c412-4a6e-129f-08debf66b9c7
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:25.8217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: age/xR9+c2G4rxOvGrucGUSC4Wz2Ae83LE0Wr5Rz/vxYKGvGCdjt6ZsJOWC5t0B1EvdeVsUHJ/RCGTh0QPmBUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c1860d/1780267709-B757FDB1-1A447DF3/0/0
X-purgate-type: clean
X-purgate-size: 3839
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EA3056182BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the 'numa-node-id' property to the memory nodes in the Device
Tree passed to DomU. The NUMA node to which each memory node
belongs is determined based on the virtual NUMA configuration
specified in the xl domain configuration file.
---
 tools/libs/light/libxl_arm.c | 50 +++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7e9f8a1bc3..6eae33cdd2 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -670,25 +670,53 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
 }
 
 static int make_memory_nodes(libxl__gc *gc, void *fdt,
+                             const libxl_domain_build_info *b_info,
                              const struct xc_dom_image *dom)
 {
     int res, i;
     const char *name;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        name = GCSPRINTF("memory@%"PRIx64, bankbase[i]);
+    if (dom->nr_vmemranges == 0 ) {
+        for (i = 0; i < GUEST_RAM_BANKS; i++) {
+            name = GCSPRINTF("memory@%"PRIx64, bankbase[i]);
 
-        LOG(DEBUG, "Creating placeholder node /%s", name);
+            LOG(DEBUG, "Creating placeholder node /%s", name);
 
+            res = fdt_begin_node(fdt, name);
+            if (res) return res;
+
+            res = fdt_property_string(fdt, "device_type", "memory");
+            if (res) return res;
+
+            res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                                1, 0, 0);
+            if (res) return res;
+
+            res = fdt_end_node(fdt);
+            if (res) return res;
+        }
+
+        return 0;
+    }
+
+    for (i = 0; i < dom->nr_vmemranges; i++) {
+        uint64_t start_addr = dom->vmemranges[i].start;
+        uint64_t size = dom->vmemranges[i].end - start_addr;
+        uint32_t nid = dom->vmemranges[i].nid;
+        uint64_t regs[2] = { cpu_to_fdt64(start_addr), cpu_to_fdt64(size) };
+
+        name = GCSPRINTF("memory@%"PRIx64, start_addr);
         res = fdt_begin_node(fdt, name);
         if (res) return res;
 
         res = fdt_property_string(fdt, "device_type", "memory");
         if (res) return res;
 
-        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                                1, 0, 0);
+        res = fdt_property(fdt, "reg", regs, sizeof(uint64_t) * 2);
+        if (res) return res;
+
+        res = fdt_property_u32(fdt, "numa-node-id", nid);
         if (res) return res;
 
         res = fdt_end_node(fdt);
@@ -1365,7 +1393,7 @@ next_resize:
         FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
         FDT( make_psci_node(gc, fdt) );
 
-        FDT( make_memory_nodes(gc, fdt, dom) );
+        FDT( make_memory_nodes(gc, fdt, info, dom) );
 
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
@@ -1716,10 +1744,14 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
     if (res)
         return res;
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
+    if (d_config->b_info.num_vnuma_nodes == 0) {
+        for (i = 0; i < GUEST_RAM_BANKS; i++) {
+            const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
 
-        finalise_one_node(gc, fdt, "/memory", bankbase[i], size);
+            finalise_one_node(gc, fdt, "/memory", bankbase[i], size);
+        }
+    } else {
+        LOG(DEBUG, "vNUMA enabled: skipping memory node finalisation as nodes are already populated");
     }
 
     if (dom->acpi_modules[0].data) {
-- 
2.43.0


