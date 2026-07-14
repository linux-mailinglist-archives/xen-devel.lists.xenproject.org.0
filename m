Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1HC5LmMTVmpPywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:45:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD075387A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:45:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=OJXMr2mP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362130.1614053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjae2-00063M-V7; Tue, 14 Jul 2026 10:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362130.1614053; Tue, 14 Jul 2026 10:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjae2-000617-SA; Tue, 14 Jul 2026 10:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1362130;
 Tue, 14 Jul 2026 10:45:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjae0-0005md-Nx
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:45:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjae0-00HHZm-4O
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:45:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561351-2eae-0a2a0a5409dd-0a2a4509a954-12
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:44 +0200
Received: from [52.101.125.100]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561350-be1a-0a2a45090019-34657d6404e0-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:43 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7347.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:45:42 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:45:42 +0000
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
 b=TnnagTWpBkoHsU13BMR9jqYUkWrcXplbMB43zC/nq3Gp8VqWkTDnG+R1YqUhY6eueVfJSt1aNxuihBFcna32Bi+yqQr2n8v+yYmq9/II5zxNPXPaLd4vYWHx1JTJLBYNI7kyKEjUGH/UH1l9LyfkcH8/GmTK3xXoOi0lMXKpu6I64ojqgnjkVqlyPpx3c0zKFovcURmu1a2ksrvw0kza+Um2JGO+6tmBfyks3CMR01i8zVg9fXRtmVj0x8I5NbnapUkVtOzt4anBPxsWT8CmfGBeii1moL4zoVLFzErZ/QHcTS0bxTKQsze99au2KIQYGOuVToaXB92hlzowclxsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrblDw5uEnhXPxxiY8E5MhWRyS6n6kgC3oSPKKTLtMs=;
 b=f2xI1m4YUIY2KbRxtXsb3jhJ/RZwE2C4lBhZ2aYXKySFUx7879HUbV6QxlO1Bj/y59JTaphxmfkeNr6lnNciTNv7d2R5LSk68P5PH0Ot9b92NzcsxgKoiDxItsS+yh00QUuQnZ540kp2SUklfatOBkpzoiDzAGj7typ1NbBGiVK3Y0O+tVW8uWulLK2XXrtpeKF211Zy5pv5caEhIQjgQla7Yf989L4ys14mq4xXLUww0Q11gmP2EkS8H7sjeqQlFSkqR8ie2xvTYPdeVC9pmDCGg+PE5nmY6qa/vl7RlTX3sdHs7/mdXZY7oWFz5Z2gcN9Zy1gjdt27rkVXspr0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrblDw5uEnhXPxxiY8E5MhWRyS6n6kgC3oSPKKTLtMs=;
 b=OJXMr2mPwWaGsOpK7+6xe4N+frArLEehIKY8PHnSbVOLp2pfydGwH2f99GEx2sGWnkxotI8aZ71SS19bD8LzHHu4qfHurwJVdYlKayEDSmhqZbnFu22NaFkZRc/fQ7/oBRptOLCFCcJc1U6Ha4US59K+glXtDRYczmBrS5A1fWQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
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
Subject: [PATCH v6 2/5] xen/sched: Link CPU topology to scheduler
Date: Tue, 14 Jul 2026 19:44:42 +0900
Message-ID: <20260714104445.919830-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714104445.919830-1-taka@valinux.co.jp>
References: <20260714104445.919830-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY6P286MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: d1796594-78dc-4920-b071-08dee1950d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10070799003|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	sNc9PFKeUkvXPrjgLJEuyg4RQekOJoM9kPCG4lq5JEQ4O8Ca2iLwerM9X5AjPo9FL/MfMihJqFh5jNx1FzT3qhscRXSWbUg8+ADJZjawT5ASBUw8AgZdaANXyi8c2eoNK+/zF6AiyAR3f2rEDLstupilP9Q0JLxT/Zn18tx14NuEsfjTU0mGRoEBRLbqlpqU5FwwkFLu+N21sw3hYnn1RRcNNBNgl8vFBVJvoiWj+yhoZT1W4oCuG8jJzes52hxJLaYlF6UZ+J6T5GCo/dkSmJH0lXN6t9ycylbQrBNiQrh+YKJ3Tdplr/zjli/Yr8qAdaFLMYdEqIBmBBetUY4hIGB+s899dQtXFioDsuvKoBcN6ubkkD8VKKf0EztGuP8u3KFr9H38/IqRiaDIg4OEpvTQ5tEFkwlxEKzHoOpAKyiaGpkTqQjH2jOZwTOw+71+pnBrIPyqbBBWRry+VTy+PPuP5y5YVXqni5r8RhplV0dAnzBi55EeeAab7AllrxXIegiQOpcRTvo+i4eXll5KLZavPh7SwpE/iKUhZCyVX/Ek8ypYMiMPYkeYG+nnwlR3qlv+eDa+JtmbReoSLbOJAypilHRgyoQdNFxvQYTjo/7gTggin0mSpEgSUs7wv0WMQn+niMxDMHMGNodtdCGFNGfBXVIvaLhMlEEtam6TwoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1SJGapLDJPB/WiSNpnpE43ngNIfHdbai3xAiCL9nLiX7hnDBBrg/g4QiPTsF?=
 =?us-ascii?Q?pjkdDbUf3t9ABWqfkZir1eR6UTJzy4UkM+eQg39I4Bsej7Rf7AW+DJmcaC0Q?=
 =?us-ascii?Q?V087MBnKyUSu2/wGp4yfK9TxapvVDlshRGkSwDTcGH0jSXQdJbUc8PUse+U6?=
 =?us-ascii?Q?wBs5eBMP7jEqsKSCimbmc9TxaLdtiHp7/tvQ4iamKxD9RA0is9n4owdydO0b?=
 =?us-ascii?Q?gdRc9rg43kX+LrQdEAxMAs6EnjZbBE4+pX2iyGUwRHx8kDtUKZAxfyif8yYl?=
 =?us-ascii?Q?DQNggonqdrPusJaoYS3mWo22IJJu6XGZ+6TQCo791T3kWimeBmKVr3KK8nqU?=
 =?us-ascii?Q?IGBbu1pq7WmlYbfhPFlKrXkxKFjr79hSmYV1LNAbYiKzbLQ2bbmqC+iFy6oD?=
 =?us-ascii?Q?aNCNSHa/elagsYAyXc5xJz8b7lLCpqSUYwLc724yIm/JNCQv1lwUoESqeG3z?=
 =?us-ascii?Q?uow9mrFH4wSVk8hIoa/4HqeE1359zLlbYlTQY1dcJRAB8V/iY8f0qBSMnqxl?=
 =?us-ascii?Q?MMwvMD70SoqmolnhRqHSKj3PIuW/U8ePKTGC4Brm8NpFAve2kKARHWYFY6qI?=
 =?us-ascii?Q?wNJHznkQYOFvEElBbumqP+GiXXPEgPpdFVai9H9puw3Xsr3r5YrwtXcvvRf6?=
 =?us-ascii?Q?tibfvoVClxVYP9ZeRvsy+CHDiyhu1z0aLxFTmeEZ+jDXnNfMz6jzfADryVuo?=
 =?us-ascii?Q?ukpj4Ed/AGKMhB3RrhuQmzW6ZUhndhMtHzLvebGcIc6om+dH9g3dSXnGYa0e?=
 =?us-ascii?Q?XbI0tNACAYNMysKtoKNI8iE/zrSlEDqOnfa5AyGcgbWzzh0TZv0H2szmvwfe?=
 =?us-ascii?Q?Fcr/ZHe9fMXzUmYa7FAFO4MPfPWpFh/qWv+RgM5kSq9En3wk6eJHHfEiuWPp?=
 =?us-ascii?Q?fDBlXBzE7kI0lU3s3BGAbWU8NlNsKg+RfP5iWDQlgEKSAMoKRaPqwBqsnp6A?=
 =?us-ascii?Q?IUNzWRqdAl3RzEoeiOS3LG2oW0oWUMm6gPnczUedfymQUjm5YhnisevJmhAr?=
 =?us-ascii?Q?Bhe991l1t6gmNkSgcuaesK08hfzG3Ous7q7ejoEETDf086KNoQoVNZF3DSJk?=
 =?us-ascii?Q?lTNPX9RUaScdZM2gC7CJNj07H9wmdfIbVqpyhjyHvXvylnVKYk2lWhVtjePk?=
 =?us-ascii?Q?bTFcWCuNoXHlh6ZOMOWOPnozlXrdFui61hiPiPAK0pOCo0Cd7p2ZnMlwR4rZ?=
 =?us-ascii?Q?fbEm54ctELPhj61kh2AChQ7nOX/EqcAf5hPu/PxDzUOWYsvaU6lsY+Sj/ggF?=
 =?us-ascii?Q?77iB5NVcfeU2T1ki60V+UUowWpmFG9IDC8PbC4Pycb7wof1jVvaIBu3R9vhs?=
 =?us-ascii?Q?olA00LJsiusUw/XXxuXeHHv+hWHRFjGP3VJmkg9JsLghG1A1I7sB+Caq1qNx?=
 =?us-ascii?Q?O+eoq48b8JRPCOalYalgDGD2fyLcCjCHxj7eC9Jjou/fndBkcPFWKQ8NwGUT?=
 =?us-ascii?Q?jJo2prn1eNUnnrOOhGbKejXXwaL4vVUuXAYZ4iBv8r7sFWAZuyOmVyvOgcRE?=
 =?us-ascii?Q?+zy+Ij40cxXDrDQcvXO81TuODUghNPBYCXgxMnfTn0AzxTFM1RNhTfie/tco?=
 =?us-ascii?Q?rjJjWTKdjFMk93X8l6v3J6/uDRG3N0+KHfH7IOcXf4xCayM8V+NldN3EHa83?=
 =?us-ascii?Q?kshlpS7NVPTNvaYTSgkzmc77GsQaEyJAYuG8SrUlu46rSQG9xf5236/WL42t?=
 =?us-ascii?Q?5YS9N9n7y/J0JTrerAyaHD25KGSfpt5OYlUv4qSyeo4DsRrXJqlTAd0YXXGM?=
 =?us-ascii?Q?TIzkiZqHgi7HBU5suiI8zd7hSqvgaKUZcl3PpwAFj7og9+ku7/bcHhdGLnBL?=
X-MS-Exchange-AntiSpam-MessageData-1: xp1tSVrhMWjjqA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d1796594-78dc-4920-b071-08dee1950d1c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:45:42.0221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUefYS8E0GG3pCvH1sORiuQQiV1bO8LZH4rXRo2NdAR0ljVmYo5FrmBkNsN+097MqZxkAHa5xPOFvVWB/mE8hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7347
X-purgate-ID: tlsNG-bad1c0/1784025943-BCCCF034-CECA9430/0/0
X-purgate-type: clean
X-purgate-size: 9491
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,valinux.co.jp,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:from_mime,valinux.co.jp:mid,valinux.co.jp:email,valinux.co.jp:dkim];
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
X-Rspamd-Queue-Id: 2ACD075387A

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v6:
   * Set the cluster ID to 0 when the cluster definition is missing from the
     Device Tree `cpu-map` node.
   * Added bounds-checking `ASSERT`s for values returned by `cpumask_first()`.
   * Added a blank line between `<xen/...>` and `<asm/...>` header groups.
   * Reordered `#ifdef` blocks to prioritize generic logic over architecture-
     specific ones.

 xen/arch/arm/include/asm/processor.h   |  4 --
 xen/arch/arm/smpboot.c                 |  8 +---
 xen/arch/ppc/include/asm/processor.h   |  4 --
 xen/arch/riscv/include/asm/processor.h |  4 --
 xen/common/device-tree/cpu-topology.c  | 65 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  5 +-
 xen/common/sysctl.c                    |  1 +
 xen/drivers/acpi/topology.c            |  3 ++
 xen/include/xen/cpu-topology.h         | 44 +++++++++++++++++
 9 files changed, 118 insertions(+), 20 deletions(-)

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
index d957553a44..88b01bcfd2 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -92,13 +92,7 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
-    /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
-     */
-    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    init_cpu_sibling_map(cpu);
 
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
index be82272c14..03cad06303 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -316,6 +316,67 @@ static int __init parse_dt_topology(void)
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
+        ASSERT(first_cpu < nr_cpu_ids);
+
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+        {
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+        }
+
+        first_cpu = cpumask_first(topo->cluster_sibling);
+        if ( first_cpu >= nr_cpu_ids )
+        {
+            /* Clustering is not supported */
+            topo->phys_cluster_id = 0;
+        }
+        else
+        {
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+            {
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+            }
+        }
+
+        first_cpu = cpumask_first(topo->core_sibling);
+        ASSERT(first_cpu < nr_cpu_ids);
+
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+        {
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+        }
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+}
+
 int __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -326,9 +387,13 @@ int __init dt_init_cpu_topology(void)
 
     ret = parse_dt_topology();
     if ( ret == 0 )
+    {
         for_each_possible_cpu(cpu)
             setup_siblings_masks(cpu);
 
+        setup_cpu_topology_ids();
+    }
+
     return ret;
 }
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..a69327c808 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -9,6 +9,7 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -35,7 +36,9 @@
  */
 static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
-#ifdef CONFIG_X86
+#if defined(CONFIG_GENERIC_CPU_TOPOLOGY)
+    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
+#elif defined(CONFIG_X86)
     return cpu_data[cpu].x86_num_siblings;
 #else
     return 1;
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
index 45d1f2c5be..56fcfa4945 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ int __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1;
+
         cpumask_set_cpu(cpu, topo->thread_sibling);
         cpumask_copy(topo->core_sibling, &cpu_possible_map);
         cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 7cfe3752cd..82608b7789 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -4,6 +4,17 @@
 #define XEN_CPU_TOPOLOGY_H
 
 #include <xen/cpumask.h>
+#include <xen/percpu.h>
+
+#include <asm/processor.h>
+#include <asm/smp.h>
+
+/* Assume all CPUs reside in the same socket and no threading. */
+static inline void init_cpu_sibling_map_default(unsigned int cpu)
+{
+    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+}
 
 #ifdef CONFIG_GENERIC_CPU_TOPOLOGY
 
@@ -11,15 +22,48 @@ struct cpu_topology {
     cpumask_var_t thread_sibling;
     cpumask_var_t core_sibling;
     cpumask_var_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_cluster_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 extern struct cpu_topology *cpu_topology;
 void init_cpu_topology(void);
 
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    if ( cpu_topology )
+    {
+        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
+                     cpu_topology[cpu].thread_sibling);
+        cpumask_copy(per_cpu(cpu_core_mask, cpu),
+                     cpu_topology[cpu].core_sibling);
+    }
+    else
+        init_cpu_sibling_map_default(cpu);
+}
+
+#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
+#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 static inline void init_cpu_topology(void) {}
 
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    init_cpu_sibling_map_default(cpu);
+}
+
+#ifndef cpu_to_core
+#define cpu_to_core(cpu)   (0)
+#endif
+
+#ifndef cpu_to_socket
+#define cpu_to_socket(cpu) (0)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


