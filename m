Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1cRHDPJ9R2rPZQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E43700857
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Rtv2s3MO;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1353030.1609239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa08-0004qP-Kz; Fri, 03 Jul 2026 09:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353030.1609239; Fri, 03 Jul 2026 09:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa08-0004pD-H7; Fri, 03 Jul 2026 09:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1353030;
 Fri, 03 Jul 2026 09:15:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wfa06-0004QW-Gu
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:15:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfa05-00GN2P-T4
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:15:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-2eae-0a2a0a5409dd-0a2a450ace40-22
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:57 +0200
Received: from [52.101.125.115]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-e40e-0a2a450a0019-34657d733221-6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:57 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY3P286MB3731.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 09:15:52 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 09:15:52 +0000
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
 b=uULWK3Wp7UmAqolW0O87DbjhR/76XnHEmq8iiCnKPIqg+IQuQErTi+WLR4KqESCF+bzfbISpFDzpGQKxQcECrkbJaK2GDOgbXcxN4WHGyLgja/GaRNgmgOE/1uOrxEtgsQzC7Vy9GiuUGI7xJdKi+WLGyDm/2tsTRdiIDJaIdqIQVKK73M+ELsUfGhal06CjnOQSkOpja/RLMTLSmpgPWeZPlhY0aHENH2nrSoMgE75lu85B6PHjUpdESbpjxIJ4HsQg475Wu88x3c+A0gkOvahrX22et4ti1Baa2T8tiYs6CHa5Wevr0rbfKku4P5Z/VZ7YvoUexajQ+2QWn9y+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnhJk1GWwfTBQlXCmlfrD1hdxu7L/SP10nBbA09ZTac=;
 b=HyPVswMvWB7UuGHOlDzV7IzZLg4yHRpSjAGIOax7l8ipQDz+xgEg/5F4XM3U7BT04H8C05X5pkFa+i2T9/nhJnOUroKR0H+ZAkVhOTcK1MtnBEpnZP56mn7AOyOKlVvwU8nnuOelLDxiIX8GLmcb+fOPmzL8am59rucxG4jkgc1pL3mCRQO2NMOPwDt0d52AbifNr1GYJ0LmjoECwBr7O87TUxUa5iSVRCCy8v7Z4c0pILuBoa52ppF9S4jQ7lmL+sJbgoDY5b+tVO9CJQCXWEQO7rPolqRtJWCqD5ORKeFu7dsYZiFHdIOGk7SmYPP7qKJQ6WansCCOeaxjsN++ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnhJk1GWwfTBQlXCmlfrD1hdxu7L/SP10nBbA09ZTac=;
 b=Rtv2s3MO7xV10pJDpPuN6KUucd9DvuK2szy6i0Nhvf5B6dG1/eqi4APBIrbbRuJ6LQ0So01msRnZU9R0ov+XI6n7YQQ1kOCw+BA2qhkZV2ZkPyn22ml1HlXdhWoYWzCIBm5Dpu6WSIYNvAF7aDuPIbw7C97Sc3tKWfICK0BZi/Q=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v4 3/3] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Fri,  3 Jul 2026 18:15:44 +0900
Message-ID: <20260703091544.183548-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703091544.183548-1-taka@valinux.co.jp>
References: <20260703091544.183548-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0070.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::8) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY3P286MB3731:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dcbeaa-84cd-4c33-485b-08ded8e3ae2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10070799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oo16E+eLbXDUCFPcNBT4Dz+rz9LjNOoPYtNKSgAMBOMwG6HGOVTNXWMNYgm4QYXWWpKimioYbo9CBtYbNVXw4K4aRW6pdx/BNYTfuyfnD5x9I8WhxwmmRoV3h0F9uxmZI/v4A7YKCZC/cs4UGECp/cugJbwM2r5/oMH4V6AYsFum3fLjSkWsh5z3360Qyq8cXJCeVtO71zMFzSSZZd0Rs5nVUuySmWmWFNE6w1XNsSS01Bjq1/b3bxGpyIWCWlIsoBEVvdj1+SVUhom0G6ESipmXGH3xeW1N4xwl7pdnXc5fxM65/UKJxols15pyTipDAfhSuWVJXH+4OKTpvAJzUcm0kmePpe8M+53vyHOnUNdQVClCNDIlnStaJafpRDlBzyzhIloBUj4ySPrbUS3AAn7qFBSFdjAUBQUOQWBJ3oM11AdTjgRg8Q8Zy3pdH4l0CHoV6w/5mmsyK1QmM8Rb3RPnLnCKU8Twc1Xxtq+Dj6ioZIln+nLsZh1h8mTGoBlmK+q8EVEKJ2pLu2OnUBS5JClyJ/WJYhJu/zZ5X9daDW49fUe+gdDXPmkksE2wGMgho+SQG8Y75U3Jo5yxhkDfphfHfsSlD71g1SfxB4v4yWSCg/z/WafnMGiq4Zwptz1+qfDI2oFJlgjQyWs1j/p8jKCFLkr9oPFaBEZ2B4aPh3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10070799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kmcPo6fmRptx6CRdZrK7XnS12tnW+Ob00UId9DjIEV1N2xs62uS9SlfgGNT5?=
 =?us-ascii?Q?I7oFiec8X1WEBIHDcwFYrVPnzakYEBn1+hqNY3y/Np+k9UfTM6dlQcDGcwOc?=
 =?us-ascii?Q?KSsmtZiOSib5f9RBgWKYWhPU8avcKxt+v1V0PaKsyZ4luexRibTU6BMu3kkb?=
 =?us-ascii?Q?sh2hmngLYWqZBbVxBur6zzMHpg5ojxM4uT6eGFE7n7JttVNroLdsVpOCZNpi?=
 =?us-ascii?Q?wR1WIUYNOo3c1RDggHXVCTOsu3nBYeiEto7Tq6/i5+wmuFuE7JVmrdV4Wxd8?=
 =?us-ascii?Q?D33+MqXMJiSOA9sr2/DUKv0FJE5QI2UeijtaBNo6R/AwOaDgY/Pxn+es65rT?=
 =?us-ascii?Q?WxXlGOrO3uWxwcnh0Qp24TN44rCCYwU8yXNvlxXgE8OTMr1wayaiErG+Hq24?=
 =?us-ascii?Q?X5A4o+HuDFsiZSWASCUJT1IOkvGHssvzMArZIai7xNGsC9R/JWgqAK1veGFU?=
 =?us-ascii?Q?9cSwVrTZYTbMWMeKkg797YMqIoIwCwu2qlIDreNOyeHdiQgTkM8nBI7u7IJK?=
 =?us-ascii?Q?p7bsHI3Vjk9W9SgOUnAT+SfZg282Ti/88WWlam5mDP2e7WK3i+dSrB6F6Gw0?=
 =?us-ascii?Q?GfNjDlU1odXMXA3w23x8s9cBukOy37CU/kwoqAn8qziCE+hRxJvUFdqLwbUT?=
 =?us-ascii?Q?QcrmuqsF96tOwCvffNbelqIjSTvLFv/yyzmyVAZ9Llmxejjss1VuGz0sf1xq?=
 =?us-ascii?Q?VDRMWPW2cLCMyI6driJKXIuoLOk5fjn8GYAMsS3bT1ks66E2JaMZoqldYTVR?=
 =?us-ascii?Q?CRE0gRfUPweDfoRhX1sMQC/jPuoBVPWKIYnx+B8BDqMqHFIa7Q2NWIh++ATu?=
 =?us-ascii?Q?uEz5pVG/IaOzXSJLAy40x2aCWUf+6QdOq5WL/BkEiM8csQLPh+xiP7SdRJSJ?=
 =?us-ascii?Q?hkKTkqW369bilv5688Ehh2xHbVcaQne0D5xn6p2D9QPW+2iemmr/GaMN/aof?=
 =?us-ascii?Q?cSF5JsTFgkJCJhOl79zifRH9V8DvcG+WcUXGw2yDP5D/nXzTBqFm55p37L/A?=
 =?us-ascii?Q?H77dj3hwjEeCQXqRCRVtVQACc5raRj5QtJAshCyrA+hPZmh2ac148MMq33SN?=
 =?us-ascii?Q?LB77Ff90lf//5ldWHAnNXYFBIyfTcmCMViLhpAZtxV5luwUj0mlxEX52wWaI?=
 =?us-ascii?Q?F8h+gKxM8bM8Oxxc/jjbNqYOx0COMY88Ie0EvfK+pwNJG+hIYX1KiL59OJpU?=
 =?us-ascii?Q?EmahtrpOvqD3DKIoWm5gl7Sa9GrEDm0I46eqOR/APbrcL/li3cE21YQb0L8C?=
 =?us-ascii?Q?OanVuhtrKG1Vid4ezwGZONnV+WFyw5nw0YOvDxjsPgcIbKkdYJswSmVJragm?=
 =?us-ascii?Q?z1AAzr1ffezE74IYSc9Ipfe4bPXGsGtDl+QZcB+Vs7nrtdwur+dE6D46aGGC?=
 =?us-ascii?Q?Klvdfth8FLujQbgWQhGQnlZSmVqVzZyxvqYq/VKmNFxhrJxCnOBl2j0qMG2O?=
 =?us-ascii?Q?fq0fBs+4uBAZzWjf2nmhohiIlwerFlHmRxV1/CBerMpZHpxyyVwfwcPAoRa6?=
 =?us-ascii?Q?T9QAtyq9eV58HW2G1MGzM87kXRNpj44qQaVn/bPcOo3B06XkPK77km917hwS?=
 =?us-ascii?Q?+oXUVZccU9P4Q8DFGpy0qJlqHe5cd/1uGrHjMy1p+yt2TM5CZnizKr7Jq2KU?=
 =?us-ascii?Q?L3OJ+CJ8i3LmH2RNCAJU1hPWISDDwKvtk8pufEB8ZMUlOLe9C2VlLzkQd9u4?=
 =?us-ascii?Q?boHrg+DkH+xzNUfXL3BO4C5gjdWtTAMPCIdUriZ3CjCNDqxbArZipulOCvly?=
 =?us-ascii?Q?428BzznIgc6P4uOl2XRqpLv6u4wFqcXZGNHimO3dDrod1A1b2fqNmm91TybR?=
X-MS-Exchange-AntiSpam-MessageData-1: HF2eafndh9FfyQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dcbeaa-84cd-4c33-485b-08ded8e3ae2c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:15:52.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KYaUN8VH2Le7wWtViC/OOGIMQYPFVDfpI6KJdndlSqIv3cnEqd3dQwKcaomwQlYAI0oKYiYxgDdbDiZYPcPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3731
X-purgate-ID: tlsNG-4011c0/1783070157-3C67BDDE-406116AF/0/0
X-purgate-type: clean
X-purgate-size: 3386
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
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Queue-Id: B5E43700857

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 22 +++-------------------
 xen/include/xen/cpu-topology.h       |  5 +++++
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index ada430f262..6c645f0e21 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,22 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#elif defined(CONFIG_CPU_TOPOLOGY)
-    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -882,9 +866,9 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
 
 /*
  * Additional checks, to avoid separating siblings in different runqueues.
- * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
- * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * This deals with Intel's HTs, AMD's CUs and ARM's SMT. An arch that
+ * does not have similar concept will just have cpu_nr_siblings() always
+ * return 1, and setup the cpu_sibling_mask-s accordingly, and things
  * will just work as well.
  */
 static bool
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index ee34425680..646cd0ff04 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -41,6 +41,7 @@ static inline void init_cpu_sibling_map(unsigned int cpu)
 
 #define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
 #define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+#define cpu_nr_siblings(cpu) (cpu_topology ? cpu_topology[cpu].num_siblings : 1)
 
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
@@ -64,6 +65,10 @@ static inline void init_cpu_sibling_map(unsigned int cpu)
 #define cpu_to_socket(cpu) (0)
 #endif
 
+#ifndef cpu_nr_siblings
+#define cpu_nr_siblings(cpu) (1)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


