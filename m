Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8AADOdpcKWr4VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9766969D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=jSEAsYmM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334267.1597384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKo-00028d-Vf; Wed, 10 Jun 2026 12:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334267.1597384; Wed, 10 Jun 2026 12:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKo-0001zh-RJ; Wed, 10 Jun 2026 12:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1334267;
 Wed, 10 Jun 2026 12:45:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJJ-0001Cy-NN
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJJ-00H9hG-3a
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c67-5cb7-0a2a0a5109dd-0a2a4504ad8a-28
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:33 +0200
Received: from [52.101.69.118]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c6c-1dec-0a2a45040019-34654576fec7-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:33 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:30 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:29 +0000
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
 b=NxQer9Uknijvh6HcxISJL7OOQ0b6FuQ67/MBVCJIip00SDa2vEHMGodboWBIQbg/COluM8RkR1QbOBoWtZc7+fjQAeqCwBwwyQCUy6UyuAbfJilToCCOnsYZe2iHvO3/FrQqSPcYMJyihAAnEw5LjcwS/HaswKLWJdzHJCQ+p7/664T2wh5HQQTYJVymz8avcAFXUvgciagLeAH74a5CzxwW4XvP4uirJR3GJMw01QDSzHOKmlSgW6nAJS5KzpCWhGWELSXF/IuxtEctsD8CMj+WlEXFIMo+MiFbPKY33JwJg+u8SynPxv9AtWPKHu6PiPe0NIAiMXUiVNGlxBPPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnPckwdgpBUr+17cYI0AaPCAdJVEhHccUrVHQZ13anc=;
 b=SKEttrGiRjNUFrHX92OMsYAitxJUi/94sZPIJ0XI4QknaKw22C9BTmEiNZadVpL864e0UOo1FmpOOLHvNP5aSDZJ6oWxvMHkXlUShZu+G+P1H4OKnlTtThCqazAKYR5b5pGKmoSOC7eJPBvz2QQD4i0lYuP9NYI41+gPAPwwe57gx3S/jba/9KZhggl06DVe9ZWI+/mD4c4QQEVXhmK3V35vNbR31IKVblBY901zrwZ9GM8QGkX3BJgztHPzqMpYTmwzVOjbFm8GKCdQN7kwwui8vjvFv3gqY1spRFcmwcnMTrxBQ1WVmwxkVkcrEvDK5XGe8p2Kuy2qVy/X0N1aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnPckwdgpBUr+17cYI0AaPCAdJVEhHccUrVHQZ13anc=;
 b=jSEAsYmMTeaqFQP6JTCcCKsITRurGOEGKpxaHsOzoBWFHqf81oQbeYA/dktRGUKisHHuTB5XSwCipxKKZkinWqbU5YehwYLahtF23AHU3eGErsDmXoqKDgDio7Xgyf+cpzh6TVuKmPQ5+FR08VqlpYyYrF7yLnk6MZtcpvV7CBg/81abFn+oJnocccA4Fnmiecwr7PpOHgcL3+ColnOaqSqF9zwlIbsScOJvJYOwwtZA+TCITvQzvryNfl8gEjU/X8fwLE7M10VSOYLyBdRakFjkHxNPtbvCuH7QhIp9aRSGR+CEbx8E2X880w8bpm7BT+KzLpHW1KRvVLICvkBe+g==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 07/13] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Wed, 10 Jun 2026 15:44:27 +0300
Message-ID: <cba6e41f56c242085ae468e91a59181ecfd403eb.1781084290.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781084290.git.mykola_kvach@epam.com>
References: <cover.1781084290.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AM9PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 19837be2-0888-44be-7fff-08dec6ee2733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	F3c2389LQyrlBaOy0bblq/YWqdTtTp/n/Wh8B/hxE7aDRPhg1OQyvnkRyBG69eFDjJ5xvZTrf3lNGNDzxto3qyZh704TVWsPbFnc+/QX071VbL1+vQYkXTPzGp4FoyZkcXtnxlhks305gBuCYvcU5qq24GSi33iIoy7RCoJFJuFdg6va7D7evVFk7kslOjARCgpyuDTMedP7GbIQo91v48QItY2l1fJPbHV2FSna38SLC7EBAYzAz+XPxvnkPRLlXe7UjQe4IHBWzLtExhFFtoz5P+OavUZPDI6FaWcdV6b/hvbYLs5INEaFSsoMdZUWPA8GVh0rgzKBWODbksJoO+S+1WCtrG78bF6lruHdpkAvfiMkLydSzYPqhEVoEvBrM97IdcTasTmiIQLAfaD490d8o5e+AAaF6V/VWVU5t0Z/QuOkJy+wCdanCEByFSMwbqpVejAAGy40y5OA4uyIaO4EsVDywd8VWF2akTAo/haHJWRHw3EuZnVbNhqOyDZ4/q6jqgKRVY+BLSjvS3Ohc5DuYPgZGLCa6piIWBFc+xNpUNgbal1NZRXQEUpLfry4m7iwDQEYRU0I5CzgSymiswjn36zbF35CWZ76knha+R4K3oZd64ebrfgmDzEBzRdK62L0kcFA64oneZLU5IYH60aMH93t0JXElpBtUJMRM9IDj6v0Kv31+WHTdcHJyDvJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qq4SH96ykzfGTIbO3hQQY8QHBLz98ep31Vfdtpd8GKtxHShv3UXYYQnoBAZt?=
 =?us-ascii?Q?xudISUqK93oxrtDfX9zmgNjsnh1YiUaxWEHWHXrg4LCoRnac1Gus+3os/k1s?=
 =?us-ascii?Q?kBtvYmgeipTWMrdKtUdsw4EEByU8a1FWmEEoE0Fl7KI8ZSgXUUP9f6UfE2hK?=
 =?us-ascii?Q?EUvGqeKtc2SijvR5V1R1t6LQuw/BDIXe6M1bwiWKZ7g0AAnAZ/TAI7mb8dt5?=
 =?us-ascii?Q?Dn6ew2n+PR46FMsE92pm8hbqHGQP5DuyeuQMtsB8aOW+7Y27bsq9S/9D33pd?=
 =?us-ascii?Q?2OiPyhLhh5Dh3Wzk+N5ii7xxWgM/noOEePn1OVlk8AdFs3sDUNc9cwGOgYeH?=
 =?us-ascii?Q?7OE9NHqSZrAICuHQASas5i21uWXGTsu8JcuKddGRwsdehoR7e6qz1znRPOOI?=
 =?us-ascii?Q?u2AB4gHF9noZpnmJJTFMfcasQ+IffvbcsEZR1B1Q6pfLM9ARmMauK+gGvQED?=
 =?us-ascii?Q?+wBF/Rldr3tD5S/8dk+WKGeRRyWBz0A6+98I3QV4uDaR3BBB+pScvqHXfkZ1?=
 =?us-ascii?Q?SWESYgJ2Bd1brpB/V+odfJ6clv2+O9LNcD+PqXVXd6pSPzxnBkW7RjHz50TY?=
 =?us-ascii?Q?NkVsMwJtv5iNmmBhQnxGe3JS9ZYU5RZjEJvRcNdUcFcG+3iN+Ao0HNTj7HeV?=
 =?us-ascii?Q?2PJbkZ2C/4x2ff2Z9U8VLelFQtXqOqbM3r4QSWdxWw6LoXJzzH+nik+MW32Q?=
 =?us-ascii?Q?aZQCHZVLBEEwlizKVFWbpEqAZeC3m8kD6+OBjVXmPiCZFXEFrIK7AKSkhwBC?=
 =?us-ascii?Q?/sfYyZQnOoiOXdeNl/IpomH1rmeqTGhdYRjs0DNTqKegOShehnsah8RpyLoq?=
 =?us-ascii?Q?2DgCWofhiYlqx7/b4aqAVTCSmtDRpMSRSrwmWe/UdtxnaJjP55CYT3wBicRP?=
 =?us-ascii?Q?nwGrcjpjejq2XRTCbr/P4ZrufjqlVbz0H8t5eAK5F1hmTq5X9Qj+3AN7UDGP?=
 =?us-ascii?Q?7rthE7bpeC/6mTz3rLVuxEA+aCbzHfcLA4/l1X1F5Jp/CsoNl2EjLx5v41Or?=
 =?us-ascii?Q?twmX5eec8QpDXYDoPkmr1H5G4oV4UOgPbQ7naoFSdpEeSaBi4SFNufzqKNkx?=
 =?us-ascii?Q?5ZxzJRgsnpkv7dAyGyJIar8ki0EVUXF8niuSq7yt/euvURyNO0PA4yY9fso0?=
 =?us-ascii?Q?KnNnq9e0YVxYH0C8fXnMsoiLBzjQE7JOeoXVJxze+lm+FxcJp6C7XfqqZp+w?=
 =?us-ascii?Q?sucOJfWSQSOhITSZ8Cla5grSo5bsVW4k2iosdrmaha19M5XdJv4Cd3VNpXET?=
 =?us-ascii?Q?ja5MmotDhMoNcm124LuKAuB2YHbcx+x+VFgIOZ/U/ZaHtleQH6spU2XgygQ+?=
 =?us-ascii?Q?LXcvKh2CiofCNlsquGlxb7/G5Qdneis9/lgmGHcn9Oi4h5Po8gHRkBdPVtkP?=
 =?us-ascii?Q?9e/SnLB+zCPGqRQtHL7nlv/a+KWbAaONlj8woSjnPcP+Qv7PuA7asEJSQwaq?=
 =?us-ascii?Q?ThivFGrZdtms9HCRPxNCQTwwwzSZ3pK0tbSBX0NOeK9qXttQi2OUJrE0oHEI?=
 =?us-ascii?Q?7xt0gNB2N/X0i2a4GWQE3Cs1VgaKpR+a+nte1Uksxalz+V+6uaFJW6mVRaC6?=
 =?us-ascii?Q?FFp0Le7uH5jqmWCoiBMFHxkRLIQHANcSDIydzPHsvtJjY9cDFhu+xjl61P7o?=
 =?us-ascii?Q?wbtDo6OuzqhkI02W3Mcs5CIiBaph6p4y4vZBFRRgEOwwiKkGof9Gd6pEB5Vo?=
 =?us-ascii?Q?U+YUeubz7WrtIJTZibPGGhaHlQxQ1omuy52wFvxWXzpu1GbtxK9KX3S/DqdD?=
 =?us-ascii?Q?kRdSgLX1aA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19837be2-0888-44be-7fff-08dec6ee2733
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:29.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfXX71M3T5cFAkjR5wXf3mIx7TJcxftI0a5lZ4BbO/ilOT9ekQwX5bWPlFNIJr3ksF3UjZ18o9yY+xDnPbWBlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-ebf023/1781095533-413773FF-9C015285/0/0
X-purgate-type: clean
X-purgate-size: 3654
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,arm.com,linaro.org,kernel.org,xen.org,amd.com];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D9766969D

The FF-A notification SRI interrupt handler was not correctly tied to
CPU hotplug and suspend/resume. As a result, CPUs going offline and
back online could end up with stale or missing handlers, breaking
delivery of FF-A notifications.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..513c399594 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -360,10 +360,28 @@ static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
     return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0, 0);
 }
 
-void ffa_notif_init_interrupt(void)
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, sri_irq);
+
+static int request_sri_irq(void)
 {
     int ret;
+    struct irqaction *sri_action = &this_cpu(sri_irq);
+
+    sri_action->name = "FF-A notif";
+    sri_action->handler = notif_irq_handler;
+    sri_action->dev_id = NULL;
+    sri_action->free_on_release = 0;
+
+    ret = setup_irq(notif_sri_irq, 0, sri_action);
+    if ( ret )
+        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
+               notif_sri_irq, ret);
 
+    return ret;
+}
+
+void ffa_notif_init_interrupt(void)
+{
     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
     {
         /*
@@ -376,14 +394,36 @@ void ffa_notif_init_interrupt(void)
          * pending, while the SPMC in the secure world will not notice that
          * the interrupt was lost.
          */
-        ret = request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A notif",
-                          NULL);
-        if ( ret )
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   notif_sri_irq, ret);
+        request_sri_irq();
     }
 }
 
+static void deinit_ffa_notif_interrupt(void)
+{
+    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
+        release_irq(notif_sri_irq, NULL);
+}
+
+static int cpu_ffa_notif_callback(struct notifier_block *nfb,
+                                  unsigned long action,
+                                  void *hcpu)
+{
+    switch ( action )
+    {
+    case CPU_DYING:
+        deinit_ffa_notif_interrupt();
+        break;
+    default:
+        break;
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_ffa_notif_nfb = {
+    .notifier_call = cpu_ffa_notif_callback,
+};
+
 void ffa_notif_init(void)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -392,7 +432,6 @@ void ffa_notif_init(void)
     };
     struct arm_smccc_1_2_regs resp;
     unsigned int irq;
-    int ret;
 
     /* Only enable fw notification if all ABIs we need are supported */
     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
@@ -408,13 +447,11 @@ void ffa_notif_init(void)
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
             irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
-        ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
-        if ( ret )
-        {
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   irq, ret);
+
+        if ( request_sri_irq() )
             return;
-        }
+
+        register_cpu_notifier(&cpu_ffa_notif_nfb);
         fw_notif_enabled = true;
     }
 }
-- 
2.43.0


