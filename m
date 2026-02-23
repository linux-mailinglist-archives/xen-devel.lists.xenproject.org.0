Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMUkL6MWnGkq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:58:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD411735A2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238527.1540136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRlJ-0002GM-TK; Mon, 23 Feb 2026 08:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238527.1540136; Mon, 23 Feb 2026 08:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRlJ-0002Eh-Pm; Mon, 23 Feb 2026 08:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1238527;
 Mon, 23 Feb 2026 08:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRlI-0002EX-1n
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:57:52 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb28abf9-1095-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 09:57:50 +0100 (CET)
Received: from MN0P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::19)
 by PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 08:57:16 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:52b:cafe::9c) by MN0P223CA0001.outlook.office365.com
 (2603:10b6:208:52b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 08:57:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 08:57:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 02:57:13 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 02:57:12 -0600
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
X-Inumbo-ID: bb28abf9-1095-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNNIqXzAHbPd+QrfoXNc9tZMzsBguYCAME7ilz6HNHMVBIofaefO5JBlxPXNqL/ktObt1bw7bUl+wN/46mNwrBQUPXAspbc1pi4+cQu462n+1bhohQTb6fky5rbri2V5SpXPbQlD1I99HXWEb00IF1LzRKfYdRfcw/hS3V3t7cwVrUMlMAC1tFxM7zmsTQV4ij9xjSvJrX/2kFKqhEBJSwUvhNPJMQCzLjMc09NytqfuvLFADMhemZB58aye8O7wu+Dbis7oYzz4t3WRguzSomMDuj48CkMkDdHPkF8RgCWShTJJaCJvze4XDqtQ2giuwTbZEJGV1SP0+EnLIhVPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stF/YritFek5zLZBwT3fj3JD5xDuJ5dMscCRf4my5yc=;
 b=HWYC54olfNoPxZue/QWilnZnXa/zcuXp07QXDTXUt1jF6FzjDiyNqugPzQmdBov5tLhOGM8M414Kx9x6Hb4TwmYEygn0eC18xSOj3N3lZjy/xKcZJkjQmhdV8CO2ZIUPHCXI0qmS8+biGHfZaG2zV97Mg1CgvU52r1p2nUj5pWWqdk0ghOzk2k9NMkrAW4AAV2KjVLYvfzima8BJzplswSFRbTiTIW1UMmr6Mizs2omadkRVcx5pyqnZQdc2zZBPFG6Rvdxi8Jc6X533L5fyx5ATZfJGMQT3KN67aJfR5pJn3sgsEjiCqppJN0fDkf37rUxxCWPx/DHzgmhisj99gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stF/YritFek5zLZBwT3fj3JD5xDuJ5dMscCRf4my5yc=;
 b=X1+z89TEZyupGmVPucuKNalVKuFja/EAb4aYdw4zKt+U1fuO/+6PYWu4GqXbH2i4j8vrrZwXuzaradzvoZWSfHx/cVAVKIq9hH1gjCIPzVyFapqkYdcUj+Bjyg0z2ax1/2ubkaT7TRsGF1g4hM1/eAg/gfmVHwY1B/nNQxkKg40=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <652e3747-76bd-41aa-9d2d-ecb57d206a31@amd.com>
Date: Mon, 23 Feb 2026 09:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] xen/treewide: Adjust suffixes on integer literals
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-3-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260220214653.3497384-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|PH8PR12MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 5127120c-4f68-41d5-4c24-08de72b98ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUN2ZEtlRWRhbTh1VXFVcS9RalJvSlNYeDdRSitCOFhHeFg3YnFObGo5OUNl?=
 =?utf-8?B?TEM0Y2hNTy9yV2V5L3U1MG1MaFdQNzFUTjlpMDV3TXpFMlZaYndEeHk2Z2ha?=
 =?utf-8?B?V2NFMGdhM0tEbGZYWC9IZEdEckU2NkZQWEI3QnM0cDBQbGJHZytNN1cyNmov?=
 =?utf-8?B?SmlLWmgwOHZZbVlicTczVTYvR2lNL2E5MStlM1FDLzNNT0ZXZTZLN3BiQUpP?=
 =?utf-8?B?VWdhcmx6Y1hpdEp5TDZKenllMG5FbVErcy8xZ25yaWpNazdacmtRTUxGWDY0?=
 =?utf-8?B?eUovdnhwRVhjSm1tY2dDbDkrQm8vZmZ6WnkrOWFIUTVRQUJRdzFqMERNbUdF?=
 =?utf-8?B?TU9ZVUxISEtvMXUyaiswM2tBRWhpNWpzU0U5RkV3bnMwMnVjZ1A1MURCR1JL?=
 =?utf-8?B?M01GRnNhcmpZYXUwRmtvd0xwN09nSUoyUUdqcDF0ZDByT0hsMWYvNFFTd1hx?=
 =?utf-8?B?ZzdxbEc0Sjg4R3h3T1RzSy8zRCsxdXZ2Q0t6eHJ5bHo2ZnAwcllVRVB0NlZm?=
 =?utf-8?B?VGRPNVVTMXM4a3ZUQ1NHK1RXR1FmdzhlSTA3MS9FYTVIY3p5RGduN2hibVVz?=
 =?utf-8?B?Vy9hL1plaFJJMjAzYUVnc2FJUnc0K1VXUG01QWVjYjRpbzhsTEpuZHRReWgw?=
 =?utf-8?B?QlNZaW5pcms4Y0ViMThocnkxZWtjQ1pNdjNVaEpOZFgrNkV4cUlTaVhaNE1J?=
 =?utf-8?B?eVBJak9OUmNpdUpjTjRtQjFvNnFlWURZT3U5VUdEYUF3Nzhnc1F6SzZ5TkR4?=
 =?utf-8?B?MldMVi9QaTlkYlVXZzRZVlRGSTlJc3RybkoyMitBOVdkczBncEpaMHpaVDlt?=
 =?utf-8?B?NHBNRnRySWNnNFQxMlhIdnpTZGhwUmhKemdMWmw4ZS9pbWZnczZYSE05ZzJW?=
 =?utf-8?B?SmJ3TXg5OEYyZzMzQ2VvSWErb3ZESDhZaHg4ZTFMS2U3WjlLektTZUxwMEMv?=
 =?utf-8?B?em5JMXdPekZEUUNLUkd2NHE4eEdCT1pBRVo3T0FZVzE3RjhnRVlqZ1lJRFVD?=
 =?utf-8?B?VElGWHJNNE1zU2JqZG1vM0hjdFhuZW9HNG1YUmk5MjN5V3h4eXB3TytueUUv?=
 =?utf-8?B?eFZKc2hkcGFIYld4NStLZHJsS0NUZzBLMklWa00yaWxaa05aRUNvdUxISnIz?=
 =?utf-8?B?R0VWMERnV1VPdUQvMENaQXI3d1V0RUdNTFdhcXZueW1WUTB5R3hoWWRDVC8x?=
 =?utf-8?B?N2RKdEJaYkUzb2FOUEJ6RW1Cc1h6RGlTdjRqOXBkcXRFRVVzd2doQkEzaFhz?=
 =?utf-8?B?ckRxbCtGWjF0ckJoeFJPZ095d0t1aGNlTnIvRUdETitKUmhEVGxnWUZJTFVq?=
 =?utf-8?B?bWpnY0RqV0pBZjI2dUJHaUh2UEhoaEV6K1dEVFRjN0FXS2pmdld5Y0VXSUxS?=
 =?utf-8?B?clJkRXlqY0JFUXQ4dUVRcDF2c0lOcDlaUHE3MHB3V0Y5MFJKQ3ZEWEJvNlZ3?=
 =?utf-8?B?MElVcGV0Y1JpQVJvU05aMjJ2elV1UzFMcWQyNmREQmxQVzVuN2NCdjFsNnBo?=
 =?utf-8?B?Zlp1NUFycWZNTSs0MUtHaWFSWVRBei9pSU9RcXRZcDNtV1l1UVVrZFp4WVMz?=
 =?utf-8?B?MmU0RVFHRk00Tm0rRW90T3RwODh3ZzhyODRES3Z2bFBIZTZxZzF2VUljYWNG?=
 =?utf-8?B?eHZDNVd4RU9rQ0dENlhrU0g3Sm5KZWRKYUV2UnMwbkhRUHBzR2tqZ2tmdlU5?=
 =?utf-8?B?dU02elFyQUtKd3BybDJKNk5ja1FwSWVWSjNJaFlWMDZEOGNiS0wzWEdTRnox?=
 =?utf-8?B?YnJicWl0WUI4dGtQYUhsdHRxZTkxNlJuV1MxcitwZGgxaDd6M3dEMm9zemw4?=
 =?utf-8?B?N250UVpmc2ErNVNNNmNidnpZZXF5VDB5SnVwMFF5aktuU1Jma3E3UjB2YmVQ?=
 =?utf-8?B?U2dkUUNTWWkvMy9yaXB4V2trY2lhaHMwYVhTbjJ1YWVnN1FrQ25ZS0F2SE0x?=
 =?utf-8?B?cW9WSUltVjBoS3lXZUlmVm9BZmhJbm5TWVF4N1MyTDJzYWdPNUI0c3lKakhj?=
 =?utf-8?B?SkN5emZFYWZnaHR2S3dNbmViVGlXVHFvRERaR0QvMXRwUGVhTzBVUFIxVEIx?=
 =?utf-8?B?cHRsMFp0WE9uS2Z1YTlMM2E0bk9XMWMrMzZHM3dpSjRRNFFBOGU3cVQ3QzNs?=
 =?utf-8?B?SEpOblBsc0pTVmxZd1U5NkJyZGFLYkN4TWdJZCtTcmg3N0VyRlV4eFpwcE5J?=
 =?utf-8?B?TFpLUncxc3Y2TU5VZ1NaMk9GVnFoOUtoei9OWE5EN012VSt6K1hvTlhiUjhq?=
 =?utf-8?B?Q0c5OTZrS1pTbmNsajZLMXR6WFJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BPnXX40zj/hMj9Rd9csRqBDvnGfTAthuxdRUTqjg/OuDGXf64gs5NNGfnzPVYedPHMfq9/QiHuK8xnBlOMxMe5fVtEGNMP4yJ4BWk4qSGPPVy+3TQeEN2G+8nb0i7HfRxyKa3STj8YrNzsniiTrNmlSfSzcgHNfajqf2GhN9UyY4LP78iMFYP9Ij6QSXMJwUcc1Y7Tgziso9eJWpnBnrNcfNW0gzT/lAMH9A5Ma5q2icWs2/g0o8qG1MdE2SHmXNL8xX9clprptA8yTW8O2Q20d9U/TgxlYLtR4gMNZ9MrVLhDu+sQsLGx8gb9oyWopuvhZFk9d2Oh1zkltlj7lKTsNQjEW6ROBtdq+1SEzSFr5pIL1426B2+UkT2EtCzHLmBKuhKwbrjJPhDN43zSiTlsnlE6sdsrqL9ZnNKe6pLZ1E2vRWH5Ikd/NL9yqVn40H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:57:15.5210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5127120c-4f68-41d5-4c24-08de72b98ac0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2CD411735A2
X-Rspamd-Action: no action



On 20/02/2026 22:46, Andrew Cooper wrote:
> Use U where necessary (Misra Rule 7.2) and uppercase L (Misra Rule 7.3).
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


