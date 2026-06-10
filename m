Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PuNjANpcKWrzVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E405669682
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=Z2xYLGRY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334264.1597373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKo-0001pU-Co; Wed, 10 Jun 2026 12:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334264.1597373; Wed, 10 Jun 2026 12:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKn-0001he-UH; Wed, 10 Jun 2026 12:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1334264;
 Wed, 10 Jun 2026 12:45:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJE-0001Bl-81
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJD-007rkt-Kn
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c60-e002-0a2a0a5209dd-0a2a450ce894-28
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:27 +0200
Received: from [40.107.162.84]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c67-62f1-0a2a450c0019-286ba25465a7-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:27 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:25 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:25 +0000
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
 b=XH0n3vjXwU05fwa3RYrpg47RDGakN+O+g/GkMBgEH3GV/EMSMA/BrE2WeQVBtG714k+hM5CcPoEGyltcEFA0vu0PePdK/k012TGL0Lb3bLzqpCqCpz7gihaqNp5/ByPQvkI+Y0bp3n9QJUahnf7b3xgfrUu8rndtIOKKfzkc967IPEKCSRGzADd1a6S33TefQRzoTYNZrFVAOvbBMtnI4AePsfDhav79x7muKzChvH5V0InUZ+m52o2jgaLrmrGitj8lDwGVjFIQRxo7aPJKBCiQVR+gqp3QgRrd8lNmZQzaiiuspoewgWpABHr248+uAYHpb90hkyob77I8xlMu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t1Xm4aK6uMytKQzSuYsfAastWOi/MneAuLBcif8+7Y=;
 b=r1q9FwhoFjZU4jcAjbXbvX66gRVlMTh5xAIYZhV//frKYZ0e6ZcBze9r0EjwshZIgOnd2W3CmezNiC2c11nQWFo9y9Z7mgM+8qT+h8txbzu+p6Q4eNK7P1CDcum6az/x0Pak4vErVq+Mijp6Gmo7RAMHGFfAT3OlzINBPW7va0z3xZnUwAuC2GlZk8/E17Zq6hJ0h80SUJs7MdlghMYyuncAKA8F6V+j9L95LF0HtpPRa8zfeIzjNM1BIrQ8oI90U467Tdsrds9nq/xnQj6zu2Q8ri7vcz17XSTs9MLpsiXTwb0tQvOJZPBVs+yO8DUc40NExMZdvv027HuPOVAV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4t1Xm4aK6uMytKQzSuYsfAastWOi/MneAuLBcif8+7Y=;
 b=Z2xYLGRYPkGXxQwxDOXF/Bv66E6wFw0LSiqz5kJ+3gCdzmW187R72KZCrMEuRGzylpg6T16TO7+Fn/9I/3CnSgVFx9/9jreYVYU9OiSQZa1M5u7SSjoB7meP45OQD0CXeCcaoxVIUcBD0Ms0BxPHXP/h7kVakuJsdXjleBE67+9mg1Eqb6XVcC/ZPgvXurHzok+1SCg4BjVSKD4C2Qz/ymuONdfY9bEL6YrB29j2y7yZKw6CMigjFsXbbc9/b5lVFmltXLT8ifmcPkmFOyOigeIBrJmwBghE3PqWcM7PkWPukqt2isVUvrta8z/C8Kt6NrHzGaJ9oDbbOHt2Qd05Cw==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Date: Wed, 10 Jun 2026 15:44:25 +0300
Message-ID: <1e1bc01dad04d8b4e94af1cffc0afef51dc030e2.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: dc3e2d95-a38f-4a51-4f4c-08dec6ee2485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|3023799007|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q7S7CoxM+LJEIRmx90GfBtOwlhR1+EaMSWPqOMZMNGTai4TULCEzY/5NXQrOZOQETZZDTb0gZ512NUaUZz+MovmGy9ePLzHKH3L7CSut52WcTptZ6zHGoUB+6XoyVCDy5Ni2uqtvFvtIYJzaS6WmtMkKFjMMyXqJt0+2rv2sF7BYBupkZrDPYM/yaYa32mh1g8CeNdyx2s1/d3hlkTcWXIA680dtbhMgId4gxQXowTjexBdXJhYp++Sz2PjwY9pqCnvqfjpWdFymOb1Lg3Xj1BpUvZ+gvRfzud3J4oKES+vxqwpB9/AHjiX/5r0nMpO7wuQka4M+FJEYdSGqpFXv1za8tOzBZiuvxNe64EXsap8sE+Balyvknp5jxnpCt2EkbeEVhro4NUF41gdzMg5mAVXuH9L+a6DbcGwEUqNK96CVaV5DiQr2ZMLbbS7CVnowSxS0xTdOXW0KZ30WC3lOZlCbiEI+TT+hNjmjWVr4pG2TPyn4uzXrUEZn/GeRzIQFztItlH/5PlJCflmJevPeAUNVB41IvxlJMo+cbqEeVrZp5Dzzy9SF8lhV+zqCeAy3xMfZkqi53GP33Vy67JCGE8UMumAfUdj6VBcP8pqnWT3ynM60jb+VVOuetUWkfoPlMLSXlfVwS3gg5ng7yofQLZ3izhWrojDw9mpxBdvnFdAjHBtNNbZqBhNYnWVXvm0w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/w0eVdyQGbDQYXUqymz+rM1c/3NQdeDR0ujAgM/vV3Lv7s4klYu8qVffzyDD?=
 =?us-ascii?Q?Qpq2dINklpFfnix6oV5SZy4Wn+iTdYk+q5iD7jAO3W9gXYmeKh9k3IfZ04aR?=
 =?us-ascii?Q?lFrpPD7gMtrq1BwC/rcExIF/48+Ek85lO/zjbd5bEodEilnZUnlgrxLH7yk+?=
 =?us-ascii?Q?MiQwEyUrfgNwpHh7CtfznSF67iidSkRI8bE961vmbKMpEACPwM6+ZmEFt8Jt?=
 =?us-ascii?Q?A9oevqzAwDivcQqESsVyfEGpph3ERPICM1zoGVTMdcIv0bsq0AYhrUEyG/gV?=
 =?us-ascii?Q?wzdSUfRbSdi4D17cdBouQdxg6uOx+xqbfaOBijWNOfruAfIrnr7R4YcD8FWo?=
 =?us-ascii?Q?EraAZ4mKRJfis9aPiEAbfOiFEd49fCLN9WW2/HJOque/U6Tn1AspH9rcXCNN?=
 =?us-ascii?Q?JrHsLCbsJclwQY3Ngo0Te1W+o3mZknIfEqcWWQAK0MsMuBPM0ZozX7422780?=
 =?us-ascii?Q?OpaH4+JhVolIDstaTAqI0WaQYSqfSnI8u5OMvyj14B6mDsV9dF59g+0Wv4iS?=
 =?us-ascii?Q?F3Be8NnOH/t6G2o/gEeM1skmgHNzxe9HXJHpLhkIsT36/JKvSvcfqVWAWy4N?=
 =?us-ascii?Q?EAJtAr226H/HWrfJozTrMMozVUzkDlrv/VQcLv0rA0QWifKAAMEqKiiR4veF?=
 =?us-ascii?Q?82LpMSE7MnwOSoaEmhw/OU2EgZQh1TKNLVFNoWwrCW8rukEMPyYmMiqWD5EH?=
 =?us-ascii?Q?486wz/amP5cM6euk8dF/Ty3ZphS3NVQbgJi1yhY0DxXM2fsTodFNX/19ZTsw?=
 =?us-ascii?Q?rkGugQ0zPYGgKYxL0OhH5RRB8atR7d923Oqtnuf0IpL10zP/y6eHNbcE2tOk?=
 =?us-ascii?Q?c9PVM8u7RjH15IRRjNeZ06wkmVQ/LdV+OOAXUVFymfL+ha/w2j/cK/IfBYpV?=
 =?us-ascii?Q?FQv7QF6gE7ExB7++3Eq6A/P/c7OU8jJ0mQr8cjQEI8x3rf/ScEw7xoRqPb3K?=
 =?us-ascii?Q?cnekAbYVEBcVKEsytCARfvuM+isGJDzxiqQmFnl4o83P4VT/E4xknYtiRvWx?=
 =?us-ascii?Q?b0bU4eIO7ailaT7MwF6fjCMk9fQGYP2XbrpVDN8bjoqkOKGmawfc2AmjECod?=
 =?us-ascii?Q?I2LdtcB2qsvLHUlIU4mrxjvWAohNObXGrt0DU2CwZE7uiPaCmNIlpbVoe4vS?=
 =?us-ascii?Q?OZc6UHp1m7wDTJN3g29gVZ5Vejs607cZSVLWcgH3Pl5HzcOE0ttO/f9lOyxI?=
 =?us-ascii?Q?utMAbn4a3MDuwkkEElT6q7MY8fNCc2reEyEIXO7pQ64RR0rz0eRprw4fT01f?=
 =?us-ascii?Q?pqy0UkmyCphyRtCsYn522zlgqq3NgdMVciypk1Gw0ZOUr4dbj59cgeMq9Zmf?=
 =?us-ascii?Q?XqiWCzUJ8EwsLQxwfK+OTcXKKf2PELJa5onc/dTfHomiGCPK9agaWhzfJWQN?=
 =?us-ascii?Q?DXpq4ZfkUgkHqol6tBTntEHYMeVTqO55NLUhkPa64FPKQCNi3tb5fQ5yCRzY?=
 =?us-ascii?Q?kY3Ilwm5pwCaS/USAGFhY+6SanqV5ULHFHsEzqXjWAlr3FgGTwCQClz//UrU?=
 =?us-ascii?Q?1thhsr//+qxq7x+2/o9VdrYPJ0Y2FEtCkFXlR6yBLeaK+GKWSWAdiTxIkIi5?=
 =?us-ascii?Q?WUVG4o8JRzAdPd5tfUe3MAKeOlZjLKcrAqnQLekxzSJenPnoygki3js5iIli?=
 =?us-ascii?Q?KBRs514EMWcQyJsq+UcNAML79N72Gail85h3RH8d5tDNJXi7/tdeKjFEtKBU?=
 =?us-ascii?Q?oNGzXEdBwNkH+AnckhzqBFFQ8nbzMb6UxGJ+pCTe4HBKky5fQmtAukiWtl/w?=
 =?us-ascii?Q?mN1LduZDoQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3e2d95-a38f-4a51-4f4c-08dec6ee2485
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:25.1911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrxE3U82P20y9Dk+/x/SeyNY6FfyUrpEKLuqh/CaCIAXP+A5mP3jEQp3RUCyM7P6uAwBaun8IwslSoNTfjhUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-d25034/1781095527-E3370CF5-5006A541/0/0
X-purgate-type: clean
X-purgate-size: 11113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E405669682

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down.

Save and restore the ITS CTLR, CBASER and BASER registers. On resume,
re-establish the collection mapping only when the collection is held in
the ITS itself. Memory-backed collections are restored through the
restored GITS_BASER tables and must not be remapped unconditionally.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit dba0bc7b76dc:
"irqchip/gic-v3-its: Add ability to save/restore ITS state".
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- Replay MAPC on resume only for collections held in the ITS itself, as
  indicated by GITS_TYPER.HCC. Memory-backed collections are restored
  through GITS_BASER and are no longer remapped unconditionally.
- Make the current Xen col_id == cpu assumption explicit in the ITS
  resume path.
- Use "unpredictable" instead of "undefined" in the CBASER/BASER restore
  comment.

Changes in V9:
- fix the ITS suspend/resume coding-style nits;
- preserve the saved GITS_CTLR state while masking the read-only
  QUIESCENT bit.

Changes in V8:
- Reword the CBASER/CWRITER comment to match Xen and drop the stale Linux
  cmd_write reference.
- Clarify the list_for_each_entry_continue_reverse() comment.
- Factor out per-ITS helpers for collection setup and resume.
- Restore each ITS and re-establish its collection mapping in the same
  loop, so a failed ITS resume is not followed by MAPC/SYNC on that
  un-restored instance.
- panic in case when resume of an ITS failed
- cleanup baser cache during suspend
---
 xen/arch/arm/gic-v3-its.c             | 146 ++++++++++++++++++++++++--
 xen/arch/arm/gic-v3.c                 |  11 +-
 xen/arch/arm/include/asm/gic_v3_its.h |  28 +++++
 xen/include/xen/list.h                |  14 +++
 4 files changed, 189 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 7560d46c6d..dd53209865 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -335,6 +335,22 @@ static int its_send_cmd_inv(struct host_its *its,
     return its_send_command(its, cmd);
 }
 
+static int gicv3_its_setup_collection_single(struct host_its *its,
+                                             unsigned int cpu)
+{
+    int ret;
+
+    ret = its_send_cmd_mapc(its, cpu, cpu);
+    if ( ret )
+        return ret;
+
+    ret = its_send_cmd_sync(its, cpu);
+    if ( ret )
+        return ret;
+
+    return gicv3_its_wait_commands(its);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
@@ -343,15 +359,7 @@ int gicv3_its_setup_collection(unsigned int cpu)
 
     list_for_each_entry(its, &host_its_list, entry)
     {
-        ret = its_send_cmd_mapc(its, cpu, cpu);
-        if ( ret )
-            return ret;
-
-        ret = its_send_cmd_sync(its, cpu);
-        if ( ret )
-            return ret;
-
-        ret = gicv3_its_wait_commands(its);
+        ret = gicv3_its_setup_collection_single(its, cpu);
         if ( ret )
             return ret;
     }
@@ -1211,6 +1219,126 @@ int gicv3_its_init(void)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void)
+{
+    struct host_its *its;
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        unsigned int i;
+        void __iomem *base = its->its_base;
+
+        /*
+         * By the time Xen reaches gic_suspend(), every domain is already in
+         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are expected
+         * to have been quiesced by the owning OS before SYSTEM_SUSPEND.
+         */
+        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCENT. */
+        its->suspend_ctx.ctlr = readl_relaxed(base + GITS_CTLR) &
+                                ~GITS_CTLR_QUIESCENT;
+        ret = gicv3_disable_its(its);
+        if ( ret )
+        {
+            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+            goto err;
+        }
+
+        its->suspend_ctx.cbaser = readq_relaxed(base + GITS_CBASER);
+
+        for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+        {
+            uint64_t baser = readq_relaxed(base + GITS_BASER0 + i * 8);
+
+            its->suspend_ctx.baser[i] = 0;
+
+            if ( !(baser & GITS_VALID_BIT) )
+                continue;
+
+            its->suspend_ctx.baser[i] = baser;
+        }
+    }
+
+    return 0;
+
+ err:
+    list_for_each_entry_continue_reverse( its, &host_its_list, entry )
+        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTLR);
+
+    return ret;
+}
+
+static int gicv3_its_resume_single(struct host_its *its, unsigned int cpu)
+{
+    void __iomem *base = its->its_base;
+    unsigned int i;
+    int ret;
+    uint64_t typer;
+    unsigned int col_id = cpu; /* Xen currently uses col_id == cpu. */
+
+    /*
+     * Make sure that the ITS is disabled. If it fails to quiesce,
+     * don't restore it since writing to CBASER or BASER<n>
+     * registers is unpredictable according to the GIC v3 ITS
+     * Specification.
+     */
+    WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
+    ret = gicv3_disable_its(its);
+    if ( ret )
+        return ret;
+
+    writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
+
+    /*
+     * Writing CBASER resets CREADR to 0, so reset CWRITER to
+     * keep the command queue pointers aligned.
+     */
+    writeq_relaxed(0, base + GITS_CWRITER);
+
+    /* Restore GITS_BASER from the value cache. */
+    for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+    {
+        uint64_t baser = its->suspend_ctx.baser[i];
+
+        if ( !(baser & GITS_VALID_BIT) )
+            continue;
+
+        writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
+    }
+
+    writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+
+    typer = readq_relaxed(base + GITS_TYPER);
+
+    /*
+     * Only collections with IDs below HCC are held in the ITS itself
+     * and lose their state across an ITS reset/power loss. Memory-backed
+     * collections are restored by restoring GITS_BASER and must not be
+     * remapped here.
+     */
+    if ( col_id < GITS_TYPER_HCC(typer) )
+        return gicv3_its_setup_collection_single(its, cpu);
+
+    return 0;
+}
+
+void gicv3_its_resume(void)
+{
+    struct host_its *its;
+    unsigned int cpu = smp_processor_id();
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        ret = gicv3_its_resume_single(its, cpu);
+        if ( ret )
+            panic("GICv3: ITS@%"PRIpaddr": failed to restore during resume: %d\n",
+                   its->addr, ret);
+    }
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index be223dd915..05e42cdd55 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2189,10 +2189,14 @@ static int gicv3_suspend(void)
     if ( ret )
         goto out_enable_iface;
 
-    ret = gicv3_disable_redist();
+    ret = gicv3_its_suspend();
     if ( ret )
         goto out_enable_iface;
 
+    ret = gicv3_disable_redist();
+    if ( ret )
+        goto out_its_resume;
+
     /* Save GICR configuration */
     gicv3_redist_wait_for_rwp();
 
@@ -2232,6 +2236,9 @@ static int gicv3_suspend(void)
 
     return 0;
 
+ out_its_resume:
+    gicv3_its_resume();
+
  out_enable_iface:
     if ( gicv3_enable_redist() )
         panic("GICv3: Failed to re-enable redistributor after suspend abort\n");
@@ -2358,6 +2365,8 @@ static void gicv3_resume(void)
 
     gicv3_redist_wait_for_rwp();
 
+    gicv3_its_resume();
+
     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
     isb();
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..0f8cb16e41 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -43,6 +43,11 @@
 #define GITS_CTLR_QUIESCENT             BIT(31, UL)
 #define GITS_CTLR_ENABLE                BIT(0, UL)
 
+#define GITS_TYPER_HCC_SHIFT            24
+#define GITS_TYPER_HCC_MASK             0xffUL
+#define GITS_TYPER_HCC(r)               (((r) >> GITS_TYPER_HCC_SHIFT) & \
+                                                 GITS_TYPER_HCC_MASK)
+
 #define GITS_TYPER_PTA                  BIT(19, UL)
 #define GITS_TYPER_DEVIDS_SHIFT         13
 #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT)
@@ -129,6 +134,13 @@ struct host_its {
     spinlock_t cmd_lock;
     void *cmd_buf;
     unsigned int flags;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct suspend_ctx {
+        uint32_t ctlr;
+        uint64_t cbaser;
+        uint64_t baser[GITS_BASER_NR_REGS];
+    } suspend_ctx;
+#endif
 };
 
 /* Map a collection for this host CPU to each host ITS. */
@@ -204,6 +216,11 @@ uint64_t gicv3_its_get_cacheability(void);
 uint64_t gicv3_its_get_shareability(void);
 unsigned int gicv3_its_get_memflags(void);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void);
+void gicv3_its_resume(void);
+#endif
+
 #else
 
 #ifdef CONFIG_ACPI
@@ -271,6 +288,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static inline int gicv3_its_suspend(void)
+{
+    return 0;
+}
+
+static inline void gicv3_its_resume(void)
+{
+}
+#endif
+
 #endif /* CONFIG_HAS_ITS */
 
 #endif
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 98d8482dab..2aab274157 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_head *list,
          &(pos)->member != (head);                                        \
          (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:    the type * to use as a loop cursor.
+ * @head:   the head for your list.
+ * @member: the name of the list_head within the struct.
+ *
+ * Iterate over list of given type backwards, starting from the element previous
+ * to the current one in list order.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)           \
+    for ((pos) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                        \
+         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
+
 /**
  * list_for_each_entry_from - iterate over list of given type from the
  *                            current point
-- 
2.43.0


