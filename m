Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ma/RE4sbUGrAtQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D72735F0A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Ca1WBMXo;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358608.1612637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt0-00077N-I5; Thu, 09 Jul 2026 22:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358608.1612637; Thu, 09 Jul 2026 22:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt0-00075O-Ep; Thu, 09 Jul 2026 22:06:26 +0000
Received: by outflank-mailman (input) for mailman id 1358608;
 Thu, 09 Jul 2026 22:06:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1whwsy-0006sg-SL
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 22:06:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whwsy-004Qfb-9J
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 00:06:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b59-2eae-0a2a0a5409dd-0a2a4505bdc4-14
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:23 +0200
Received: from [52.101.125.137]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b59-4f1d-0a2a45050019-34657d89cdb0-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:22 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB2431.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:06:20 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:06:20 +0000
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
 b=ddcylcgjJoolLwrxCyh5MvBjIttF3vjAazw9DgxD9nb6Cl4zV6ofH7B1ozpMZEicOmxKBMQZx/Iabx7q0pzXyGbJFvKYANMB77GuQ6M9DIBVNZzt6h9dO5LexwXqc+a9JM67OcR+aFqkQoE8gtO8ubECdDOYeuyFtVT32bSm6+IwILIlmd4AfNvgFGQ+8oe8S/+Amr0QKDgNMG4ND363VhI43C59PvQvmeMeC8gPZn90Rkgnkk6ZHOI+d3m6Y5/PJG8W7lhVdSxEcsYovrJDVdDVubgdy3QUPbbDZcz1VeXQEd12XBkt6hPsT69ZaMgTTeKj8H0y91dFr3YMODZScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oglcz0WW3q4sUZQrDmPxJwR1NMDwnQUA+F3DbHSd7c4=;
 b=RggNqfYRUzqKEzNFp060JwwuM9sJIgRmpdTWNCSHrrOfcdAyuQLJvxN6lVd2jeeRKxBxWGfvgGoIrkMFG8UFKotb9/015BUt0Hshh7Tk0840/QO983Ca0Zmul1wXtD1JsRFUnxog13BGnjJXNyIA3O9Q9b8M7oIAqFX+5H9q+uyb2inyEOrgM95W4gAaf5xWA7uFrze1550ufj7LTHiZP+h7b4Kak3W7qlxCQ8IJIn0u1IW65YDTHOqbNpWbvoO2Pv3ypcqM4l2dXpa5QzB+njpORdFsmiUR6ra6TjHpeUiHXBAF6cdGD7VtUmuPkEJ8rCP/2liRVwb6/tCwk29dXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oglcz0WW3q4sUZQrDmPxJwR1NMDwnQUA+F3DbHSd7c4=;
 b=Ca1WBMXofbnVc8cksEKxJqmG8CvHcG0CMfBk87tCNSPPd6mECFenLunWK3j+aNJ1TOufhHe8cO9x9bOTnfVELIqQPw8Yh+vUN3AZW8KflOZ6QL1sAH/p4R2edv/YTcFMhFhJROmGqQVds7XpSiZqTfytzfqWCaMkfnHpq4fDeoY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
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
Subject: [PATCH v5 2/4] xen/sched: Link CPU topology to scheduler
Date: Fri, 10 Jul 2026 07:05:50 +0900
Message-ID: <20260709220552.646462-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709220552.646462-1-taka@valinux.co.jp>
References: <20260709220552.646462-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYCP286MB2431:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ad1b01-c3c3-4f6b-5157-08dede064e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fgmzJNUmnb+Xgktik33ji4Nrdk1S8YSxedVQzlKimahujFFhSWbf/hXxerbXvwLLksVIONo3LvHHxBfwBCDY15Iu28VsVHtxo377QXIWAUMOXJXmgmbbBjuBdjXCa6sLKXHd9s83nhqnSHCc2/5uwEVRLATC1YHfTm9OYDuWNQmi0pIOncIGO2mjNWB8/F/kEs7UwGLVB1AlJSu7rATUeCP8paB8uuSCszKYWbLNjQRSUq10fgZTkTz/G7krZ+t04fTaC8EhrtdARMZgo5SDBSGDib7oOD3JwDBAnE4S/KQMI4C3Ix/2fcQtjLY0hlYXuTk2PrzOFHr/Evn13nGAkTLdwAD/QW7lhQ5/mtH0nah5pQ5XXSdS7ShrOdFFU53hXPj6zoK19UgRCslZSpUxLrx2CgfvCl751dpghe5tIDgFXZpqLzI/cQlt/WwukvMG6irQxCcsZee/D3ZTRg7dcLEGEEtSIdZG+bmBjeZMs/X+Lb9Zd39P7W+z0qBNf99JIZY/6tbVrGGWmlks8Fg4eUnE/YBjh3LRwpjA3Sm5qtKEzWCFchv6xn6WqvIwTtHO9kma64FykrEvMGajA+Mpi8cb0YGk2k4F8jTQ7+b+V68YSEnJ97ci/SV8zokD4WwIv8PQJZobHGMwMEMF8D+sVfNYqZePnbyZC9C01spbvXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dpz26S4qdkHxvDgtN+5tDl/HSCu13K4QU6d8S+DG2ChsVka5ZEzTk1xpMnd3?=
 =?us-ascii?Q?me7d9cZs8G7rz5KL/ucQB7ZrVm9hDBN5BWywQZVJRJO3XlWq/M3ZQlD8MHT+?=
 =?us-ascii?Q?EPzAGDNkemNWganCGXdwQ88dbzWbhH0JrH2yO0tAT97kVdE5JEhD6bRMAGQ0?=
 =?us-ascii?Q?zIxERekabSEAPlMclRyfOEiCf7vFNd71D97oPV0RtcpgzAYGAS9ANHXUsSyK?=
 =?us-ascii?Q?Po1V4HUcR2rsIhMpzWlYrwtKBPkD/gCvxqbL9KDvETANgWX15ZR9EDh0je6a?=
 =?us-ascii?Q?IjAM1/hxQjqpeBVmT/FRt5k8pQLnCMoGOUoW4pgNhAp+W4NUzGWYWoINRUEX?=
 =?us-ascii?Q?ygvYtW/u7a8IKR+X6SmT7kkAECOSzqicfmK0c5ZCpN6CfSLPeb7cgY29uNCv?=
 =?us-ascii?Q?VQI3anzlqu92U6cGjt79AbvXxrzxPPBSFsE0YAbMSIZFQnnaNRKK7GcHcc4r?=
 =?us-ascii?Q?zaiwpN2Vbque30gyQZl/IEcdzSUc/PkJ8BL4nUR1rIQfbJOPbnOfrLDrz829?=
 =?us-ascii?Q?3ZzUIbUwlDNkIAevkjnugMO1OV2Po6Zdl+0fUST8zY7OBVNcJ8TX1j99HLVN?=
 =?us-ascii?Q?lGvdVCvdwaNmiWFlZGg9Gd9RQPGsK1nXEX407IE2ee/b+62+245DuHF9B5dH?=
 =?us-ascii?Q?Gx4xiLVTzw2LigYn2a1/rSh0ub85G4UI4CuZVrCNyNS3Ll/w6wjf6Gu15Y1j?=
 =?us-ascii?Q?6fFoqlXxDLiZJwnRZlMAohDeREnPNACr3wWXY/a6Q/1zUT4/SGeT0rMx2CGS?=
 =?us-ascii?Q?0nljuqox6iWUwKv22uLNmpD2rEr1m9VdNWXUdmAeveYWrSPxWO23x5KQypxH?=
 =?us-ascii?Q?zitrzy8zpmBa+LmfoEhBqkGMnHBBblRz9I6OO8Xbz6ROkfI6Cw5GfG1fglv3?=
 =?us-ascii?Q?5xmZ1Qz+ObtvVoSPw3ZrMeUrnA5sDscTK1kkRixtVuzPeYiDiStAtb1A/GBX?=
 =?us-ascii?Q?IdQHVMEXMlF8SOY+OMsvtxPodosnLD4Ga9878Cxjc0QHrc+GIIhSHDmpp9MF?=
 =?us-ascii?Q?qlf+o/wdGE2hYYUxG9FJyPIhqcxeBpWNZr2GrKTACeWWTmbIB+Ez9fvGQAXT?=
 =?us-ascii?Q?yF2KammW7NdbjpXgsPmVYQjnCAbsYAtmaFrQmox+LGX3ekFR0jKrc5OzlKLX?=
 =?us-ascii?Q?2/y9JEMXjCB4obH4DFyF/x7TVkH1bg+nLK6Rll3RdGl62P5ZI1Nlk7wNnbWv?=
 =?us-ascii?Q?+Mh2EUx1eSFFsWGzP2LTCEW7odIBkVKLUHoEt8BE4CVfUwkQzxxZeXbjehhp?=
 =?us-ascii?Q?mgUsnTV86+vlDT+8z3vqGSK16BFAkJTVCzudYuNgIFNzKZ7lFV/7tbDZ3RoN?=
 =?us-ascii?Q?v0J3iQsdfxkF+MApjkF1NHjducnMPcuttNjmf3pZmGwAx+jUzouh1BoiFG/I?=
 =?us-ascii?Q?RGWiSb+A478a401K/hcMjYqGxX1b/7nnG7wGxFNjJmAHw95VxhrG36NXrDDc?=
 =?us-ascii?Q?faJ/KfitLKmGH7wUVPF764JZZsJxOb1Bn8BzldCfga7M2m5XCF/CcRBMyE4P?=
 =?us-ascii?Q?4MUv+aG4yV2aIuoO02wLgCOdUTamCH72n3rTPlwmbSJpI/5WNvy/XQGNFaXD?=
 =?us-ascii?Q?u+BGcq40COMeUP7bgoD1AtjBel87VqY6PUYupIZWTiXSEESMRPKUZ0UO9N/W?=
 =?us-ascii?Q?XvUDk8Alph3bb9J2Uri8KD8+o30mPaTP6wrO6XebnfKVEDw52mU8Wic03ZoO?=
 =?us-ascii?Q?PdrlQDvyLf5/IEdnW7JetS63/HenAxPyBDxESEKhW+RI+1ajpaXjLhOuA5av?=
 =?us-ascii?Q?tZImScxqCgS3aVzKDzEEtTX/CGdFoObswlsG9piFtheO1G2E94LGNuD2vtt7?=
X-MS-Exchange-AntiSpam-MessageData-1: 4+Zoe5w4u4Mmbg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ad1b01-c3c3-4f6b-5157-08dede064e94
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:06:20.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yROMzcQ7jO+njZ+pednF33VJgHw624MXKZd5hJ3ZJqxXxdp94ljCCGpbDEUi8Uu6CQ33lWxmiog2x4oYESkDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2431
X-purgate-ID: tlsNG-c201ff/1783634783-D855412E-D702061C/0/0
X-purgate-type: clean
X-purgate-size: 9028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[valinux.co.jp,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 48D72735F0A

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v5:
  Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
  CONFIG_GENERIC_CPU_TOPOLOGY.

 xen/arch/arm/include/asm/processor.h   |  4 --
 xen/arch/arm/smpboot.c                 |  8 +---
 xen/arch/ppc/include/asm/processor.h   |  4 --
 xen/arch/riscv/include/asm/processor.h |  4 --
 xen/common/device-tree/cpu-topology.c  | 51 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  3 ++
 xen/common/sysctl.c                    |  1 +
 xen/drivers/acpi/topology.c            |  3 ++
 xen/include/xen/cpu-topology.h         | 45 ++++++++++++++++++++++-
 9 files changed, 103 insertions(+), 20 deletions(-)

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
index b653227ef4..43322a153f 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -330,6 +330,55 @@ int __init parse_dt_topology(void)
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
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+
+        /* Reuse the calculated core id if clustering is not supported */
+        if ( cpumask_empty(topo->cluster_sibling) )
+            topo->phys_cluster_id = topo->phys_core_id;
+        else
+        {
+            first_cpu = cpumask_first(topo->cluster_sibling);
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+        }
+
+        first_cpu = cpumask_first(topo->core_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+}
+
 void __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -342,6 +391,8 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu(cpu)
         setup_siblings_masks(cpu);
+
+    setup_cpu_topology_ids();
 }
 
 /*
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..3d4cecd5ba 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -9,6 +9,7 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
+#elif defined(CONFIG_GENERIC_CPU_TOPOLOGY)
+    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
 #else
     return 1;
 #endif
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
index 6bd2d96ebb..9155edc0be 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ void __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1;
+
         cpumask_set_cpu(cpu, topo->thread_sibling);
         cpumask_copy(topo->core_sibling, &cpu_possible_map);
     }
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index f64820febf..ee34425680 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -4,6 +4,9 @@
 #define XEN_CPU_TOPOLOGY_H
 
 #include <xen/cpumask.h>
+#include <xen/percpu.h>
+#include <asm/processor.h>
+#include <asm/smp.h>
 
 #ifdef CONFIG_GENERIC_CPU_TOPOLOGY
 
@@ -11,16 +14,56 @@ struct cpu_topology {
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
+    {
+        cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+        cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    }
+}
+
+#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
+#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
-#define cpu_topology ((struct cpu_topology *)NULL)
 static inline void init_cpu_topology(void) {}
 
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    /*
+     * If CONFIG_GENERIC_CPU_TOPOLOGY is disabled, it is assumed that
+     * all CPUs reside in the same socket and that SMT is not used.
+     */
+    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
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


