Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JJuyNRBSOWo+qgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9D6B0A5D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=kTA8Q1pH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343885.1603098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgOo-0004ZC-KE; Mon, 22 Jun 2026 15:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343885.1603098; Mon, 22 Jun 2026 15:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgOo-0004WT-Gi; Mon, 22 Jun 2026 15:17:22 +0000
Received: by outflank-mailman (input) for mailman id 1343885;
 Mon, 22 Jun 2026 15:17:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgOn-0004WN-Gx
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgOm-0052kV-Fh
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3951f3-2eae-0a2a0a5409dd-0a2a450bedbe-28
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:20 +0200
Received: from [40.107.208.50]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3951fd-5e53-0a2a450b0019-286bd0322be2-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:19 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:16 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:16 +0000
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
 b=pVJaTJkfVTvPU9n0hCsLWar1C6pjpJ3sIeIuKTy/tSSLirM6Raw8N8YmCINUq+suPy4fbU+rIdP4G31EJ+yCkQ9qKPXacFPEP7bh4nG/GXGJVvv8P9ZjVBTOia19R3WrEvuaYh+Ox6BjI0oQNQXECzg7nV/vaGSWYdLyUMkyLvV38/o27kBLDrbEMX0fnci3x2Ib7WQAGzpjsSjskP3/3vX2GkPz9ATKGfvQP1bew8pU0/Kbsm6dEJqoSgnhhEQTYrux8CDWlQve7xOcaLl/Un5Nfuqkn9OGphKagmsp8BHkYBte34mF+EaBB/BezXwz5tFj4DhTtstfHqYqMTV0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3Ov6AdvRabkOUvbATkA/nVuGftjBb+0S/UCnU4p9wA=;
 b=fPJUItO5fLrl1zqYWO20GJd22uTcWAXAro8DHhJUhWSXZE5jcq/TRwuw06eU1yPMskbtvoETLc09WkQfnEMcEF5Ue6HXrimRq0bgjD/PofZA2EcmQDvZNvj1j3YrIjcUFlFUuVp6XiQ2hTNTsaoTHC5IFGRtKef5L2JUn9boqkogfaqfIqttVtppfpK+GT2GyUPBjcaU7yKzC0DDP1m+2Zv/0tKkOoeAskv7gTIK9EYoo+BpBlw9zI/afx3ZOfA2OVwTUj1ZmDCS6vUV+2+MnV7bkaZZLt16qsfmEdScYFn9r6HEu1VoYzMYB5c4D4c8utPyxpwsmeFCslFciWo73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3Ov6AdvRabkOUvbATkA/nVuGftjBb+0S/UCnU4p9wA=;
 b=kTA8Q1pHkigNQQPGtpI2V64Ghb5B4p0yq/iBAwTZuSuXvkiaqmAxeve3g8rZQoSWhARUllHCyU9srla6IbCpydsKiGoSYe1FGEi3YdfqxZHIhMY5boW7Scb29Ntnw01FcWeiRORP9N3WOwnuUo9rJBppSGgWdx0r+9DnaXFeCro=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 0/7] x86/kexec: Secure Boot support
Date: Mon, 22 Jun 2026 16:18:26 +0100
Message-ID: <20260622151833.3397692-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::9) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: 029bb763-f34c-4893-1829-08ded071580f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1dCvW72nFox4JLKFG3w/m5NzYyRW2psW6hpouabnBQtMFFNSbeRyeaBBhpUB2XBxtUMSVKQuhx9VlrUimq+TBvfc1F1LleK0CR452AxoQmIf8i4XtxJMJ4axqgLodDYXEW3s6nOPS5ukDhAnYFdIAuaBglseiRXXG8/qrQAfHp9TQ98c2s1sSG1oRhcTadZGDKjsD4aB8xxs6e7Dw6MimokJDlCHE9g1jDNuBpBax+5vpjmfouPfV7Fp0OTwyJ3R0BstYqT0PDH4Y7h3FfdcMtw+pzwOtybQGgbUEf5+QCnXZuYU1K7QxEwgNTpDG+AJ8SaJiLt7zlBhpJDvPmfZXU357zQ21oUQfVb+Exzvgs/ILhYb9zrRYGjRfN2khuY3bdNBnxwvPWq5HIDQvNXVwXjMp1j6RWuQ7SJxG60ibhsSVKBRLZnj4xP/zapoNfH6fSg1VdbWNkGufnI9UoFmOKsik/toQA4KtODzror+ZFiXJhmIpoL69/F2+9NqRquyQwAVkLI85poA5652cSXW6bqMqgCIVZbHj0HdTH67FEMOEEmGRHCsQ70yQGiaRlF9qBDusoDL57ggR72Tbt73r1xRtTM+a16HZhidJzFN7wDUynLL09lt221yP0OlyIU9qxTayjbfVjQZ40Ifh4/0Lwsh3Lo5D64ey52Qp73khbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H6u9JjC1NvGY5J1AzfeXZ+l5hF1+tETh7glySdPfvFuOUcBXdovbNamJJP3H?=
 =?us-ascii?Q?nixDtEnlR5dyvH6+Tt+n2l2tGyKLuv0vDJv9bchcbX48LPT34hGeo1b/qiQI?=
 =?us-ascii?Q?liaoYUit3WjFsXBYMFPUt2wnZ4fLIMU4OQgKtVsP0bkAFt87eI/QVj80UI5y?=
 =?us-ascii?Q?y2EeeF5R/yGiNfJq/Fr42KNPLawwdHpMXMbNVfrPvL3Ht7FtkEIsYfOrEzce?=
 =?us-ascii?Q?0PHSL8D8mhEE/qMDi6Q4rsaXJghK8GmgTJ7y5Ic3+c0rSkTzhLkiHnKOxHai?=
 =?us-ascii?Q?lfAU/IBrfrdkyx3eW99WiOarJ0jyFr2/8rBx+Z9eKkWQhkYCzZohxAAQTD3w?=
 =?us-ascii?Q?APCI76atMBzJBTWxX4Ulti9p+n5xaF4hwBFD/FNlPTpfXklT2TyafQVzDoNS?=
 =?us-ascii?Q?RPq7krorSDVCVegTd5XDUQto2ActAfu413S/22mCuTdsh1JiZsn8ee1HV4Bk?=
 =?us-ascii?Q?s40LeGjOJUhlVurjRk8rxOUC7nR9sR0G5lJB1QZSJUssVPCU+CLZuBtArD/d?=
 =?us-ascii?Q?N/j1caylGeiOGJmEMBekHBFnGcOIN+YE1ZdRhq2KyBmWJqTQNjM6whE+AihD?=
 =?us-ascii?Q?ibZVycpFFC1SWWT1GHA1ZACpiKgz9Xc26JU1S0gM63ZSfwMWwy/IfyClbS+t?=
 =?us-ascii?Q?s1T4e+0Kd+7eZ5W52TB+m0eWmB102bRiuh1bC5OzEytKT0ns3/hTv7Szn6bH?=
 =?us-ascii?Q?vMqzG+XG1mZj6O292GimvnuoO2uoC/5gD1eUmdMUBGVAhmc2AdD4j6Y1D4uD?=
 =?us-ascii?Q?JCMD+Pat/UByOdoEsZQbdJQbH7BHVPo3jECLRgiGwoU4lcT+EB136EOpkU83?=
 =?us-ascii?Q?nhr2angGpBSh/6KS8li+1Gnpuq1gBxIscxeM3/sLxQ7xbgYDl5lupDhkFUPW?=
 =?us-ascii?Q?JZZzHU9Vr99VPa4Wu9e5ut9RpUsy6jXQs/8zHMuX+nDEaphlnH4nlZc99MKl?=
 =?us-ascii?Q?xh/4hP3u1Y88NKrCeSlpStQF2iYrAN3nk9H+WyCEeRcjUQY61tC6t8V1Xhww?=
 =?us-ascii?Q?zUvfNUCqT/rhKhFPQqbNakw2iiys+bOWTD6Eg5rt3J2R/PuoNWHgdn5kq/sQ?=
 =?us-ascii?Q?CM2unaBpyJRDsHYMIb8xHDKYa3BTOE6w9wdX3LxSDzjnZS489mK4pPZFyhZe?=
 =?us-ascii?Q?WKBw6w93yPScr7QCvbzv6A83BviV4ena19/PQRah8nBAXsMSbngZhOxyhzb3?=
 =?us-ascii?Q?m4hL21oPSBoIT53LwBNgrkYOYebvpCQwP6FFnvLcy5iFn4GesY3OmCHE5rpm?=
 =?us-ascii?Q?Tvou8Z/2igNxdFlDoCGG++eO4LmpMLiyPRxkLyQsLla2l/98Ko0HEpvaD7++?=
 =?us-ascii?Q?dAmhx2HtAgQHeHf6vynt3XoNVoyCj9Z3OGRu3Wrp5GHqTtFfJDy2cNlo/CY6?=
 =?us-ascii?Q?xxWz0A+aJoFI6Dy3PwtJm9DPkbNjF+1HP0gWvjxfH8JHxgmQdUeia33Pio0k?=
 =?us-ascii?Q?XMHhs11WLmPJvy8+rcMBoSJvVSUgyyO7wI1aL10VA1VlVqZrDsMLrfh1blrO?=
 =?us-ascii?Q?ybTJi4u0TmwBZab9vXrZLw2X4k9nM0l8Le7y7fWqoEALG7GDzkNJ6BEJhfME?=
 =?us-ascii?Q?6FyTKyOhKa727QC8/AZnTV8WCXG4PzkFOPMaAaMNJBtAzys4DRJyIlZC6os/?=
 =?us-ascii?Q?NvvJUyF5bO1C07sTXBKiq+fi7wg8R6y9pyOlcbcgDFL84X/1ng+U5CcISgII?=
 =?us-ascii?Q?9AGwDJ8VNDzzvgqNTB+XH52E5WCdaJxrG8k+3w8mbVbM8Ba85OLmLJBLXMiL?=
 =?us-ascii?Q?EPHPZCgKpw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029bb763-f34c-4893-1829-08ded071580f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:16.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIgheGg2bw1g8CjcB3gjPJr7JDmdiWYDraUJTGSxX4Ig12jj9wHjFC/+PVKm/sQFUqyXAgUWINXyX8NqwLkPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-42698a/1782141439-4E3FB00E-9785385B/0/0
X-purgate-type: clean
X-purgate-size: 1695
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34E9D6B0A5D

These changes allow loading and booting an EFI kexec crash kernel.

For this new EFI kexec type, userspace won't provide purgatory code.
Instead Xen jumps directly to the new kernel.

Signature validation is done by the dom0 kernel. Xen then calculates a
digest for all the segments stored in memory. This digest is verified
again during execution. This digest check obviates the need for Xen to
verify Secure Boot signatures directly.

Changes in v2:
- Addressed review comments for specific patches

Ross Lagerwall (5):
x86/kexec: add digest checks
x86/kexec: rename setup_header to bzimage_header
x86/kexec: add new struct kimage_segment
x86/kexec: Support non-page-aligned kexec segments
x86/kexec: Implement new EFI load types

Kevin Lampis (2):
x86/kexec: Pass boot params directly to new kernel
x86/kexec: Zero general purpose registers

 xen/arch/x86/Makefile                    |   1 +
 xen/arch/x86/bzimage.c                   |  47 +----
 xen/arch/x86/include/asm/bzimage.h       |  44 +++++
 xen/arch/x86/include/asm/kexec.h         |   9 +
 xen/arch/x86/include/asm/machine_kexec.h |   2 +-
 xen/arch/x86/kexec.c                     |  58 +++++++
 xen/arch/x86/machine_kexec.c             |   3 +-
 xen/arch/x86/x86_64/kexec_reloc.S        |  23 +++
 xen/common/kexec.c                       |  36 +++-
 xen/common/kimage.c                      | 208 ++++++++++++++++++-----
 xen/include/public/kexec.h               |  11 +-
 xen/include/xen/kimage.h                 |  20 ++-
 12 files changed, 364 insertions(+), 98 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/kexec.h
 create mode 100644 xen/arch/x86/kexec.c

-- 
2.52.0


