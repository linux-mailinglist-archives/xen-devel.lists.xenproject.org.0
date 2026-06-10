Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K9SgJ9pcKWr2VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9D669697
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=H+8w52V6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334266.1597376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKo-0001xa-IR; Wed, 10 Jun 2026 12:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334266.1597376; Wed, 10 Jun 2026 12:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKo-0001pM-BV; Wed, 10 Jun 2026 12:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1334266;
 Wed, 10 Jun 2026 12:45:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJJ-0001Cs-1Y
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJI-00H9hG-EE
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c60-5cb7-0a2a0a5109dd-0a2a4508dcb8-20
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:32 +0200
Received: from [52.101.65.132]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c6c-63b5-0a2a45080019-3465418425f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:32 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:27 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:27 +0000
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
 b=LDBR4EgiHWDfctDyQOFveoNwrGy3CE8i7ESuRVWF8++TtRjyAw8ymU8kq74AO8//3ErQpBu1ldjcTc74xz/eQgmYEbbNZFCapJbiptAzOrwBC/c41Ur7O1ZC8c/T/fBTtNQMMCw2+jLPRkxE2gOAUVw9G6iDBgir0pZP2MQJsKznLsR54WB3iU+8UZKdX4caWQEplHSVHwSyjtzkXsELRCCAaGBfmY0FrSlmwrEitD3oMKD774QTjHWShYFTEvFnmMnA/BruLoF0OenJxWF4xd+BPY4lay0HKa3hJc9Vl0g1DUa880ZUyjrk4rEysvoveun8I2jiy0V9d/X0subAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRVpxeM0gaRhUjO9d6z4tc/MJuoIRCJQUNdQDfFlEeE=;
 b=F15kTgcSYiPMEC+vHRL41Dq8itkZ9fBRXWuFmMbQtxQf87I7tFsZB43QFxBPNxgCD4CL5NkKKkJPyhK4PBDkJb2zGSz2VWD0MEAjcYvmKDdx5+QK0ulJfaZgoguGpALyCcYIbPvsWVI6LAUes5OVNna4oKUgQRBRuV4FvcTi1NpNG+Waj3fDk0CwMIOcihTkwLfX5NhvCxluZoMzUjkRqKAZQfuTNVqawp+pk5RWIjJPnAJhER2YdyRax5jUtYDshOhCDYLgR4Mgz4PE15torZ+UoUA2+J1pRWyTGAbINpShCaa4RnKJxj17zTtr/giFpzsRbClyQnz+P/64CHt+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRVpxeM0gaRhUjO9d6z4tc/MJuoIRCJQUNdQDfFlEeE=;
 b=H+8w52V6eKOybGENTInrgbg97nlNH2OWQbHacydgKopkvWP2fT0t/tJ8HVKA1N6+/iVNv1FfqTajabgs5SQqEcJbzM6lMuoJj+5zE3qm1OFwBIKWXqOvjscawWtBo0QcvWpVx1dM/x0W+Jb5hIc6xPu21JQ28X9KCWgouZzRqCW0M4DI6GjrykZgACIBcTsuOg3lZUJZmmnBkolKHA5UnduCqEzz+S8wtiR1EvgM7lhgYXRHj+4RpikNVe2SQrIpfTSmBZwzItVTXW9O/UGcUfGa62LN4esPJLTDy5aUY6gSeFSByZFuPqBaix/yQjK5gH4BH9S9n1ulLF5HxOAIVw==
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
Subject: [PATCH v11 06/13] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Wed, 10 Jun 2026 15:44:26 +0300
Message-ID: <839baea8d07b4de595296c274cc0a5a4867f4e5b.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: d3c62d1c-a63a-4cf0-a84c-08dec6ee2604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E23G6cjbq1oAZKJ0MJQa8O1b2LlIA1uoHyd71vnM4ZqRfy0NXyD79t7668P8mgO/DA2n1TUgk2p9lXw/nYrSAsYnZ7nZZgwP5M3ioJTHSjF7XCOuYg1Z3pjJ+kF8IKPFuPAj2cd2RDRishb+tr8DchMDgOENxeS3SuwJ9fUJyniuBue5T3DThCSfXK83Ge8/ZVrOitfU+8qy9Gfxr6BVolxRX97X6RLKZlDtSibV/DG5qJnISw9gQS5s6WaP92pYLF21N/XPFTu2KVqj2PbpN9pJ0HfeTqWeMy59lum1ZWZecOhPCmUb+8v8W0TDtqji8/mkiZsdnrVXDXrYoe/Uzyknpmv4+xOESTka+hItDIVKeEXl5q0SF651iK0zG4qqBAGKK5OPoaveJ6/5YVwpCM2JdE6OY6nHxb+dZXpY8SZWXduyrmPHaxgVBM+JoklJ9bW3hiFdE+53+XVl3oQWCdBhpAP0MIQByhmnHoRyoGJouzyjPPMUCKY+k5rOdgaCeyKbmPiF5kyepFPvNtbJ4Ax+BIf3JXJgBcMJDHD4YREJ6xXuBxCAi2XCqaSaUNQ65WcrCLXnl+YZ9T15RRJ/KSCU167fJyyqx9gqKwLczv6JBVrOuXye/jvrPooL7pmlKqFsxFVyqk2A0ipmS1rR7FerOwjZeA3HZtlLlnlmINX7ZH2I9PmHyTDJsOJh/99i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x8D90J2UWMsVuGFgnW/t9ATE1N3GyB/zWFkv/MFLFVki5/Q+CV68AVjgcTlw?=
 =?us-ascii?Q?eP7ayugwJJvLQfm+2XkxOw5+P4QcSaTtVR9Bq4BasDhc/Lr5Yg13PJ3Q2ufn?=
 =?us-ascii?Q?wKY0eGaStOU79FpN3wihaUFjO7PPG2GbbcbsVvmxhhrsUc0HbzxsOTqxDmyN?=
 =?us-ascii?Q?iL0AlgUgaIycz+IVlclct3s7n09+SFSwHsL481WrjI76/ZoIIDFsVJmEwX1D?=
 =?us-ascii?Q?cSdd06nAdeg1FQXcUHAQKgXf5sOEnmYiL9fJ9rHdAzCQPnP5NfBR2tMs6lQN?=
 =?us-ascii?Q?J52kE1qIAUkDP3BN0x9kjW3dvRFJmfhzJSqdl1qBg0KxwfWgQawKYRxn7TRz?=
 =?us-ascii?Q?VSiJuVibffh1+dUUiCO9DI9JOgns5UY8WaawhCXuPZBAdbCCB4aTmaj/Xjvj?=
 =?us-ascii?Q?CoAplESNz+hP1+tI8YRNqCkuuQepUheOB/k8sVc8JUiDDWDSA7PUegDjp2c3?=
 =?us-ascii?Q?rJHdoPGTd0L+oayvb4y7mB5eo6L0JW5bKF8MFkSYd8RstjHubjTrIKDjulOW?=
 =?us-ascii?Q?E0NVJd1bCwCvt2uWfEQO8lmWhkGeqPVhHo5upcwW28nk+bG98mmOf2GuYJQP?=
 =?us-ascii?Q?IAIJ0WxAp8MdITPmPU2v0FJKA7UdZyg097lOjdrPMmVhN1hJECRc8pv0yLYD?=
 =?us-ascii?Q?1LRMhbpxAJAr1Ewy94ml2SMCqYpFvso1DmphPgzKdZMXifEw7A7OHiWnEC58?=
 =?us-ascii?Q?twXxCjNFuLEpUfcdK5uV+TQ91aWmDInuGd39UAAHj8cNer66j4tiJ7rIujAk?=
 =?us-ascii?Q?KM6VNE0TpEIsvU1XDS485qdTCLJ4/JFfcRNdlXZtsg7mOrI7IZItfzK0ZNVA?=
 =?us-ascii?Q?Fb1KD9MkrtmKuhH5+eabSHoCsqxYLCE2Yp+A03JYDTqKjbu46XfxHsJGZqES?=
 =?us-ascii?Q?R2Vd+V4BaI004j88HMARk7jPBvgQLoDrB2qJ7MT1Im8XUabfG1C5arEOGrxa?=
 =?us-ascii?Q?2Mi9ivr3UUOvnX3x1wHjbza4osMo7uZos6KqNj3u/IsvlwAI+3oNoN3ab+MV?=
 =?us-ascii?Q?SqcRYUk6l2aZha36FsCZhUswEZxxAUcUNvke+z4d+SSHP2rueCgDnuBNrW5b?=
 =?us-ascii?Q?fNCeaD3O9Xg4Vz/g+dCMVcOqghsC5mLm5ePFta6yxL8J9yA1QEPqLc+KCkTp?=
 =?us-ascii?Q?mnN8lwQDMilotE8RpZbmOFRMYSEOVplwoncA9Tw6YoE/5RTbmTSOsE8eHucZ?=
 =?us-ascii?Q?kP9U7LGKJw6K0EXrLGmL87X1Nb19eJVviEB0/mWH0bQVMke8w67MRTswTdFL?=
 =?us-ascii?Q?dLQilSGQuODTwrBl40ZcNrYwvzPp8cn8rlZo67SUy/l5TtChIxTg6VCkKTdz?=
 =?us-ascii?Q?wL58A0NmJFrGMnaf1nUxiBW2lYOaVV4e20DTIhcJLENUusrn92o42aXjevgM?=
 =?us-ascii?Q?zInAJOjfHwip7rWTpTMgfunSX9fadjMhR5QS0tIEQO0rtPBmPLMsVJo6LI9L?=
 =?us-ascii?Q?QlnH+X3wvIVi0Jv66nYCftBuxVZZWYf5Aam1S/nysbMtQ97GrFKnGUluXgQX?=
 =?us-ascii?Q?2Jkk/Jdt4GYHXgN+KNrPDEpSFVkxOJNG25UfUMdfE9uPOxug2fltv/MF8nTd?=
 =?us-ascii?Q?uweS7YwhKHcFCV0p6mUIpMPq4O7DgcVDL0MaWi+KMuq6VcYlQYS6BVdrNhQi?=
 =?us-ascii?Q?M5gYJ6bCQUYPibTxTknHdqmgJxj2b62mC3RLaIuTV1KpbYdrUrYkmHVexy98?=
 =?us-ascii?Q?qHeIuyzjo+rg5Rsr6XzW8dMNN+A2tFPURoTEi55WkW96OVZHmJ+kMa7RzasW?=
 =?us-ascii?Q?73JKOqtMUQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c62d1c-a63a-4cf0-a84c-08dec6ee2604
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:27.7725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckLFgBP/SdiGUKkGfCt9UQsdciqEBk4CqGpfLhClOL8W+U/S7MsYwDPm2DHQx8pmFiYzLy2zab7ulStFnORxDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-c1860d/1781095532-C5F80DB1-4340F1EB/0/0
X-purgate-type: clean
X-purgate-size: 1017
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
X-Rspamd-Queue-Id: 33F9D669697

init_tee_secondary() was marked __init and freed after boot. Calling it
from the CPU hotplug/resume path then executed discarded code, which
could crash Xen. Drop __init so the TEE mediator secondary init can run
safely on hotplugged and resumed CPUs.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/tee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..00e561fc78 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -128,7 +128,7 @@ static int __init tee_init(void)
 
 presmp_initcall(tee_init);
 
-void __init init_tee_secondary(void)
+void init_tee_secondary(void)
 {
     if ( cur_mediator && cur_mediator->ops->init_secondary )
         cur_mediator->ops->init_secondary();
-- 
2.43.0


