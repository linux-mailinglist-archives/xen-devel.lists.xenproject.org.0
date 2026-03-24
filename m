Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PEeJdrVwmllmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED431AA9F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261240.1554326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56M1-0003j9-NW; Tue, 24 Mar 2026 18:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261240.1554326; Tue, 24 Mar 2026 18:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56M1-0003dO-KK; Tue, 24 Mar 2026 18:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1261240;
 Tue, 24 Mar 2026 18:19:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56M0-0003bO-Qs
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:19:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56M0-00Db5a-4H
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:19:48 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5ae-bab6-0a2a0a5309dd-0a2a4503b5fc-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:48 +0100
Received: from [52.101.57.48]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5c2-1947-0a2a45030019-34653930eb5c-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:47 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:19:45 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:19:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHQy3XKvoar89pFgfYPY/6C1iBO7Hs7Kj3oMHwa1Kpr+UwL1W90ZWK0N8broURgvHrzftqZeO4OgVjDC+ZpNZz2ulcKr7JUD4VkX6XlnvbDJPSw6hIW00T5QfI0IYB59ExrITW2jd7aEm9xytMCyEu1vQXxFBH1hDul7ApsK9rJVzbQ/j+VW3tXyecmi6yFVUEiZqXJhszC+5trCjZfpUlnECYI39mH+JHfP0ZZm2gSzQCIFINzl9CmkNQwkwpF3yPZx8bwhRDFvjQfc3+aZND076Uj0oVo+DDNSSgFOOJQVHbH5VQDbcCO337g32tlqWo3IG/AKr7NuF8GMJQCYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQE140WqrdSbZEDIjgDe1+jOyuXiUrVJVSGp4gkd+CE=;
 b=ev18N0TTZBxMDe1uMOuTwdGtBhbssjMFREYdRHGirjCjxCMPFkN59MZuzoIGYV09HeQYOm0lrsjT0V1KlMVPA19eAOpJVOiRRTIy5vrxyFp7nvFnJhEWvWT5q2ZEwVTINZ4Zl/aoWX6PeAvcOVg6GYT20rvhQPBm6pgSJgqJOTVUfhlkWRhOy+Bo2NbhloMHLZNxwlbHzirvP++iz6Yb0/mii9+JEMhOL7yOlC95T22R4GviyD9/LN6XlM8ADdsCXue0X+aNpYEil2a8Y2zpo9+LXoEL6ePBI+DnX7whkbkDkMzdLW3FbtMwv+gZtknCd6JzBnWetB1KK9B0Uve4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQE140WqrdSbZEDIjgDe1+jOyuXiUrVJVSGp4gkd+CE=;
 b=vl+35MLWDchl4U5KtuEd7K37v73uglMfsiJkMFwzLkpFtFVBali8D0rKEmVZlcfVnLIZLkVnl5oAkMx6EhXLki+vdpyWWnlJ3klcA6psYh6OkValxkDc7TAymcmJxYw0yJKNImeHlAo2Q9+HTLrwUM9rECoXIbeyEXR5M0cdhuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 1/9] x86/domain: Ensure a vCPU's FPU is reset early
Date: Tue, 24 Mar 2026 18:19:29 +0000
Message-ID: <20260324181937.2465574-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: e974cbeb-4719-4c35-3669-08de89d1ed54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	z9ZTi9k0gw1fUgsJ1Htew8lBbCSxZnualftAs3TRX3FdPD9JXLriVLNx4FQywgXWVAxNXCCwVWXFa52RoG+x/CRK4AATQzXguSZsAz21JSYzObQV7Gz5IXtw45IDq8fydifvDpYN/8PlBoQj5x/84nt5ehQ37PXpGisoFM+gNVD0EPJ8zYUZqwg93LDXjECE/cr1E5yYz3GfQpd4gDpXdJK+KNvPkzvHKT1E/0BCI8p9gHq8N5QjM6PvFLROichWzOnPpVNois/a7I6JIL3iJ5urEvFju2p/0kpmSmF0val9SDLJ3i4l1S51Tkmz7BSn3rVc10B86lxyp2jTGV8EQnmbm1nFO4A2euGJGmHj+Llt+XgU6PTZAW+zAgF3FfzVbclrm/ABISun81FPBcAzW1ogQ2ov5Nx+Q6IWP7oFkxrKaXdc1cyUd0TQV49ix4M/nCr7HxIrHtHDKvBVdJFcjLmJLyZbu/uJHtYEeAQK54O5X+x6G7qJoiI1EM5NsvfqgJevXs76zzrDCjrO00suy5qm7f0ZFWxR4QncyvF/uSeAyI/UR5RpdzCSTQ5lezjTX+29Sf8UOWo/Kkd56ikV6AGyEDLoEqV4mR5/Zs9PDD4TRK5586Q1X5QvazTqds+YVDPW+Upv7nDblzEhBQubRsJmBJTee2I1zuo6WgPXXIwIHFQRU7SGdJfuwEOR0ZEXypeJHLsz220lgdGN6BL5FdEQbKUyQp+/ZViGrUu8EbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aTHjmrtyWjQUFahxtTpupdo8SYcU+zoHLfJpWLbWcuFHV6TrEhh8T/1YVe6m?=
 =?us-ascii?Q?9nEZM0myHevCSwSOUxB841kaJ2Cg3dpaxWCCInPyw6/WgpnUxAnERLqTN3rX?=
 =?us-ascii?Q?FEXMwOX976ghy0trEs+t0OMRhEh6zDtkuELu3s4DI8q/XBMLv855ZL4wgX0l?=
 =?us-ascii?Q?fg7kpxmV7WYB9U0HgB7dU8ERJYmVwBjjV+nIBHSj+rwQpnLDpJV2GWT5K0Tb?=
 =?us-ascii?Q?OtDBIWZui7ds1iFTknXNfXAk6IV1E5cz85Ti6UglatQQzXHUZlA3mTCdBs87?=
 =?us-ascii?Q?2/2Kw7442AM6fbp2qnGD1+7mIWUnMjdk94ZNBW+KuxnVy1UkF5vP1TTgVxPH?=
 =?us-ascii?Q?KjNzcSTZ6IWMd+fsQbb+GWBd9fXuAMZd6Rxgwegxa4lZ0jb43L6d/MO6dmJA?=
 =?us-ascii?Q?aLPSY07ZCTjQSFFEYVHDsyzcHV8V81RWb96OBHTz44t5qRocwY3yjcj/2eu2?=
 =?us-ascii?Q?9YvgvR51GYGxKlu9AYDl/xbKfNpodssO/UzFiZXthl//WYKoKtF9F5G50ar8?=
 =?us-ascii?Q?xGx6BPSwZoJ4ELmrC0NAjhMTKLP1omaM5Bf8afbqP+OAAypwL6hFyFqTvffY?=
 =?us-ascii?Q?h1qquOXXeNmh+bYnZKl99CaCSAGGItBpfpAzjfPFmIjN8XCp0Ei1H3O1byyz?=
 =?us-ascii?Q?v4f8ykbDRP4iVVY6HjK9gIKSXZ7PsgZc2sgONfXj8q2vqUyE4BTgaMxFmCI2?=
 =?us-ascii?Q?8uMk7lOCUnRtsaTM6ehjQ58TNttUqSLJnxfsAvci3E88bnT7zI3//H5TGllJ?=
 =?us-ascii?Q?1fWBq+zikvGY0hNlLENLNglAjhwf5fbVIJhEqX3yymDIQnlds+X7O+zNevTe?=
 =?us-ascii?Q?2J/Ufv5s4Fah5BHGxhboDHUNoJ+ZybbZPS5IIdFSSOrhap/ncVnPrNsVAXgy?=
 =?us-ascii?Q?bwA9g14nQWL+nCSSuHTMAsZZ2ykli7t1/u2NZ52UoAADpe9PFQHcPPBgN50N?=
 =?us-ascii?Q?RXH6ctblG6N61B/3dJLSxlKg9i9/FJH3JJR+ghW+ztvQnuyVrtIqDODBB8xI?=
 =?us-ascii?Q?8YWVHYn95XkyVCpn7LSacNOVe/yw26xNJurMOVCIa+Z8ok3uHdpX/eRHwSQq?=
 =?us-ascii?Q?Jg+36PLOgcQ+BNgz/yMNbbXAee1vprKIP+rbqzgMS2T3dkHV9sK3DeALHdMj?=
 =?us-ascii?Q?WoZDq8FSPXudVMLtJ4DUa6nmYWkDYRi8lzV256zFsVGCZJkLDUaw3iXGuJUO?=
 =?us-ascii?Q?m1cZZylRE4deSA1a11DTFnDneiRnO0hKXlxIJUCCdMhNX7o6Yl5u54FTlZje?=
 =?us-ascii?Q?PbX8x61nZdEudwK9gimeLHbcGlyPVHdHxTCo50A910JHcnS3M4qojQyTZzVn?=
 =?us-ascii?Q?CuLBbhZAAEQ91iQKAM7Y6gDOSa+pvZzUXb3wA6IE1R3bOtqxqRkbamtsjVFp?=
 =?us-ascii?Q?cGXrEnWIrNLaZmRQEkHBaVXurwLgi92xo9k81AccsH7OyS0jwKY+BCU22ppf?=
 =?us-ascii?Q?1CI29R+fTOBf3XuQdO2gVXBVpubRduWjnyOlQufWLFzOzQlBivIaIMz03xj9?=
 =?us-ascii?Q?wHjktCQeMaujkVjGTu0iF0MQrseqYxSLZgIjOcR5ycTo+zIqtLRc/VnhJXcB?=
 =?us-ascii?Q?8Fp9Tzx+Ts4EqI6Cb1T5MhArj6FUQWpd2CckbSDg5ebWjAJU1T0//Btplsg5?=
 =?us-ascii?Q?fLJ5c0gW+WTebBkPH43Sw0iL28MLLY0u9HjBhLhoUruYUInD4Fy5TXkD0+VA?=
 =?us-ascii?Q?gjzFun/q3BNMrCvb8FcbFbbBeUxNx0XG6Upvni3lCL4D0dSwc71Vynxqdb+j?=
 =?us-ascii?Q?8/mv5dwcKgl3Zj74ubwRP8xHXWNDnVw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e974cbeb-4719-4c35-3669-08de89d1ed54
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:19:45.6738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtQWYFt+6ELIxK//J1rt6nPoWAdT0xjwdeypliDYJukgaTPW01sYf/L7AQqFpy1Jaa5sZEunJjaRglljTxyN4IZ2zh0qY5TCrG7x1I/24R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-33051d/1774376388-4846E72C-DFA12B32/0/0
X-purgate-type: clean
X-purgate-size: 911
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4CED431AA9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When using eager-fpu, a vCPU's FPU is always marked as initialized on
context switch but it is possible that neither vcpu_reset_fpu() nor
vcpu_setup_fpu() has been called on it. If that happens,
arch_get_info_guest() would return a block of all 0's for the FPU
context claiming it to be valid.

Fix this by calling vcpu_reset_fpu() during vCPU creation.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
New in v2

 xen/arch/x86/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 9ba2774762cc..82da1c5d7b38 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -522,6 +522,8 @@ int arch_vcpu_create(struct vcpu *v)
         if ( (rc = vcpu_init_fpu(v)) != 0 )
             return rc;
 
+        vcpu_reset_fpu(v);
+
         vmce_init_vcpu(v);
 
         arch_vcpu_regs_init(v);
-- 
2.53.0


