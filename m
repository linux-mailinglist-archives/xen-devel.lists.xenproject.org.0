Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCyRG47/kmlY0wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:29:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4D142FA6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234027.1537398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwmk-0003cK-1V; Mon, 16 Feb 2026 11:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234027.1537398; Mon, 16 Feb 2026 11:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwmj-0003aE-V1; Mon, 16 Feb 2026 11:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1234027;
 Mon, 16 Feb 2026 11:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5B6=AU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vrwmi-0003a8-VQ
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:29:00 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af940120-0b2a-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 12:28:58 +0100 (CET)
Received: from MW4PR04CA0090.namprd04.prod.outlook.com (2603:10b6:303:6b::35)
 by CH1PPFF9270C127.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::62b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 16 Feb
 2026 11:28:53 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::39) by MW4PR04CA0090.outlook.office365.com
 (2603:10b6:303:6b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 11:28:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 11:28:53 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 05:28:51 -0600
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
X-Inumbo-ID: af940120-0b2a-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/zUOt7jqVkG07Ucst04BU58N9suBc24Xu3FVoDp17BHsOGFSezr5JE3AyapWpzOrYX7V5ujIU8Bfn2XrgDlNOMS9B13Vo/v5ghtljuPi1tIj9BAv8l+OEPx72q19EQ/wKJuEsvEe76IeNwAxsJJ7Wzi9eMslLdPbgl+qAFQOgZYvFwFxFbmmvD6iPKTej98AFzwRmSw0axNVEpkqMYmD5tzRp7fXUjHWqtTuJ3D9zUm50RGRdYUMkbZOiz1M6kke2FX2W9o9pFsbLR3h20qKOshYrKLvGPrsTv9US5xdenS3wm6q9yHfVO677xcIhr8nZBYcoQ3XMQee+ylujQn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xG06cDwLBlADx0I4RZreAJkO9JY3Quht6dCqz6LPxF0=;
 b=WIjrpvI4rxFO/5LTVeXYRYDgoWV1vK62ilffQd5eQNaO/X86CVHMlq1v4UQ3kAA86xIzCqumvhKN22PUQV2smQtTRT96dYrOYzv3xIlYctKCawtkc3IGn8Xc4CHL06+r36uVumw7bqojwoLhd6bB0MEmVgPgm9+AvDyQiut0Sllyj9RPFxsekTzr9qnCAkIJizcspdWRQVhyCV8YebquHD7CiLZ6mDwOEeAa+pvtaJ7MKEJMHMtxT5+eGJelOuHO5vEx7UxSWEXDhB46+IiqdMbzHH7suUKrV2EVRdGxXtBpcD3o0BbQMZX4eQ5ubHVyjA6JeheOclN9YnWipUGbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xG06cDwLBlADx0I4RZreAJkO9JY3Quht6dCqz6LPxF0=;
 b=z7ugIgKzW+kxi7/toy+DY2Bn24ftLeEkpXujsuCNkOAEQ07LNQUxOYFTv2FFe0O7eBwOqEXokI9JwijXRhWnOkUG+FKMWvg34/Tuqy6JNYECtrpYi8yHGpA3CXXvAc/3W4eKzYZZFB++TXSNVdpS03zt8ssEC81Q3LI14uYU4RQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Feb 2026 12:28:49 +0100
Message-ID: <DGGCNDLX0AY0.2P9QP7NMYNR5R@amd.com>
CC: <roger.pau@citrix.com>, <andrew.cooper3@citrix.com>,
	<jason.andryuk@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260213220205.196179-1-stefano.stabellini@amd.com>
 <DGGBHY9HHXIA.C7GM5MX7ODLG@amd.com>
 <c0635184-6422-498b-87de-e6c3fa016a4d@suse.com>
In-Reply-To: <c0635184-6422-498b-87de-e6c3fa016a4d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|CH1PPFF9270C127:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c75d17e-720f-4ebe-a0dd-08de6d4e909c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk16bkJpZUZsYjZaditzN0poZkZVVm1BWkFUeDIxODFsT0RQOTNEb1RkbWtj?=
 =?utf-8?B?NEZKWUJhNTV6WVlGNDJsUGRWVk4wTW9lZys4S2ppVjVTV25NaTdpVmFML01Z?=
 =?utf-8?B?QXQwMkRBUk9LUE11bVRpZnJ1ODVSS2t1RjhNd3B5TWd0dmZLVUlNbGMvbkpI?=
 =?utf-8?B?Zk1BTDh4UmlFbXEzUEFHek1KZXQycGRZaXlreTJydDcwTWVCdlZjR1ZXQkJQ?=
 =?utf-8?B?QUxnWmdhS2x6czYyQVdGWjdIeDZaeGNrdzlxcjl1VHBKKzJNWjBmWkdqcDlF?=
 =?utf-8?B?QlRuRWJKY0FZZFZ1OEdsd2RMNy9mUE90Z2F4WUN5dUpxenJrRy90ZnZnbjRE?=
 =?utf-8?B?RnB4WjdMbmhKVFROYnNYZGVMME1vM2dPLzRseUtmdDd1MU5rcjhQOFNJWGIy?=
 =?utf-8?B?QXRNcXFvdFcrVC9RbnAySnNJYk5lWjlpSkxqSElVeWU3eldsVEFhKzdIdGYx?=
 =?utf-8?B?MEpsdXhiYWhiMENqaXp0cncyYktvNVN5dStDc2JXTGRsTHEvTno1dCticUtJ?=
 =?utf-8?B?c1pPY2U1THp4ZFc0ZXEyYTMvZzM4cUR3QVR4SGlhSW5xUTNRYzJnM3JKUEk0?=
 =?utf-8?B?QWxNOEVQQlFsTm0rT2J3SG5oSDJ6Z08wbEpsSnhKWDhMVVUvMVo4TTEzRjNT?=
 =?utf-8?B?dlM4bDA5NW94amlMYnB2NE1rWlFGeC9ONlZWcEFLbWJFNTNlbFZJWUFRUVFN?=
 =?utf-8?B?ZjlRWFlpNDFFencvNlBEdS8xTnBVMzNVbVhZdFRqalR6bnhuY3FLSUpMYTFN?=
 =?utf-8?B?dm4vTDRodjhIanFrTDI0TTA2MkdZTHQ1a0Q1a21KNm1ZSVhRQzVyT2tGYTFk?=
 =?utf-8?B?dkwwSWcvV3ByNVpsMXl3eFFQRVhqell6RzNnMVQ2SEszcytJWkhiZXNObHJw?=
 =?utf-8?B?YW1ib1NDNlEvWWJXZ1lpVy9NMjJ4YzZhaFdZaTZBMlR3dzhBZFlnMERQZlRm?=
 =?utf-8?B?eGRVMzcwckFRZE92NHdsQ3djcEcxbnFadmtZWnBic3AzckdYWnRZL2M5eWl3?=
 =?utf-8?B?anFTbW8vLzhLcTBtTUNYajQxUlFRdFhoV0JQYlU1WkJJQ1NNU2xyNWo3NHNr?=
 =?utf-8?B?eit0cVRGQUo5RWRacTlkOEJhZUUrMmwzL0NsbFA2K2wrN0lQRFlrQ0o0dzY0?=
 =?utf-8?B?RFNJMVZRQk51akdTbUk2dk9JZHVNVjR0TVoyZjl5VUVHUkF0QTZveHcraDNO?=
 =?utf-8?B?cmU5bWFIeGFrWWtYQnp0ZlpScXVtMEczaU1YdngzajdYaURoRzcrN1BlRTd4?=
 =?utf-8?B?YXJMSjkwNkNpUDJTei85d3NYN0g2TXRPTW1Jbk1CUlRSeGJ1bGFPZlc5MDdh?=
 =?utf-8?B?R2lWRmpNQ0luUjJMV2NKUUtJNFNPS0lJTGh5eHhXVCttMFNsV0RIdjVjOVAy?=
 =?utf-8?B?Z21UNDVrRFhwTDQxa2h1ZUxiVERFbWUra25semU5Q0ZhM0VZWFl4UkJOZjF2?=
 =?utf-8?B?NkRPdUFuOVlwRmg3ZWRvTFVGSFNINHNuNlNXODFaUS90anJFVkhCQ0FwdTR6?=
 =?utf-8?B?WWZ4aCtGYkE5VzBTWWVaRUNOQy9CSjV5elY0L3dCVzcxbzZOZkdtQ2FIRSti?=
 =?utf-8?B?b3FXOVM3K1NHeDVxN2dYZXFMUVFCU3VKQkR0bllCSnNBT2c1ZkVwcXZONDhl?=
 =?utf-8?B?WHh5eHowTEVnUjJKYlZsOGZ1bk0vVUdKSFZzWm1OUVh2b3J2eG9yT3czQTlL?=
 =?utf-8?B?MGZ5OTJ4K3BRUTFUOEpmbmZiMGdycHFTV3RtQnFtTURTVzZ5bUFWdzVWblFE?=
 =?utf-8?B?eDRJbVpRVGgzcEk0RHlUcktvYU5zWWR3eVUyQTJ4Si96QU5xY0ZocTRQNHMz?=
 =?utf-8?B?S0JrSWRZbTBaNVo2ck5DUGlPS3ZycXloSDFKRm5JREdkMjg3aFhNdXNGR3dr?=
 =?utf-8?B?aVFmYzkvS0hla1ZSR3NzcW10UXFzQi9VUHRiSHVqTmgyRFdkODAvN01xazVv?=
 =?utf-8?B?clNSVC81OGN5aDV0Sk10NlZSQXZxNGErUmgrUkpVcHRZUzNRQ1d2dkloZjFV?=
 =?utf-8?B?dldCWmE3a25DWCtRaHBCRVhqaWpDNlcwS0t0WG5NblRyNFl1VmZZblh5N2Yx?=
 =?utf-8?B?OVhDaTR5a1BCS1FxQ09MMlNwaW9wTlpwRkdLT0xqQVJWN3FWZnlLZ0FKZktu?=
 =?utf-8?B?U2dWNms1aWRmL1NQZUI2bzNSOUNmcmgwd2x0V1UxbHRwU25wZ2JmVjV5bzZX?=
 =?utf-8?B?bFJGUHpXSTl1RWhGdXM5dEVGZXJoWTNMeEFyajdxZDI0N2VQdi9tL3BaTXZh?=
 =?utf-8?B?STBkUU83NzlCSkd0NVFMZWNxR1pBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aObRhawvLLRBzUGwPepaXeB2a5+IsPvJhomvFxNWSBLZaRWJ4gqrg/qobU5c6fXeOEXGNND8+GtFNiE+0liwN84ukSART2+NDmiikgpuJfJzwlhGg/qam5KX3tB8NPikNTUoN3neZB/1ijbRnj1ZB/CAuNlNApnw0HWPnhlexloK1mVVTE/C0xtAfIAc6mX5wAT/qXEGCVSPQ2gQTVT4ENIIqYeFcnP0Zvxvk3wvnCVp0zLopDFLs+HndO2PYnS+95TkzxWTB2Nb8AWkuuIbHvX9mzVRcEHUVxIZfBD+9p36EY4fnI8E7ymFuZxjpeCzujUmUKDUpXgGn8sOLO8+prMaek1mjEbUtTySl5R18AzGsgrm4NDp0NlbgXOHrO4PD/WeZ4yoBnSYeo64bo2X2JuKkvuw7tfzVxSUlbeArrYbvYwhFU0RfsBdo2Fu6Jic
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 11:28:53.2908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c75d17e-720f-4ebe-a0dd-08de6d4e909c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D0C4D142FA6
X-Rspamd-Action: no action

On Mon Feb 16, 2026 at 12:01 PM CET, Jan Beulich wrote:
>>> --- a/xen/arch/x86/mm/hap/Makefile
>>> +++ b/xen/arch/x86/mm/hap/Makefile
>>> @@ -2,5 +2,6 @@ obj-y +=3D hap.o
>>>  obj-y +=3D guest_walk_2.o
>>>  obj-y +=3D guest_walk_3.o
>>>  obj-y +=3D guest_walk_4.o
>>> -obj-y +=3D nested_hap.o
>>> -obj-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
>>> +nested-y :=3D nested_hap.o
>>> +nested-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
>>> +obj-$(CONFIG_NESTED_VIRT) +=3D $(nested-y)
>>=20
>> Why not use plain filter?
>>=20
>> 	-obj-y +=3D nested_hap.o
>> 	+obj-$(CONFIG_NESTED_VIRT) +=3D nested_hap.o
>> 	-obj-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
>> 	+obj-$(filter $(CONFIG_NESTED_VIRT),$(CONFIG_INTEL_VMX)) +=3D nested_ep=
t.o
>
> It may have been like this in v1. Problem being that this leads to long l=
ines,
> which doesn't scale very well (and is - imo - harder to read). Especially=
 when
> you consider what happens when it's more than two settings that need chec=
king.
> The list approach easily scales to about anything (by using as many separ=
ate
> lists as you need).
>
> Jan

I'd agree should we need more than 2 settings, long config parameter names
or long filenames, but none of that applies here. It fits neatly in within =
80
columns and the extra indirection bumps the cognitive load (subjectively
speaking) way more than the single line does. Plus, it takes more vertical
space.

Even then, I'd rather have ifeq on the 3rd and/or 4th parameters and filter
inside, which makes the group stand out much better and doesn't pollute the
global namespace with even more names.

And there's the matter of "filter" being in use very prevalently elsewhere.

My .02, anyway. They are functionally equivalent, after all.

Cheers,
Alejandro

