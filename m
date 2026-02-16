Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCs5GaXbkmn3zAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:56:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D9141B9C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233780.1537135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruOW-0004ft-P1; Mon, 16 Feb 2026 08:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233780.1537135; Mon, 16 Feb 2026 08:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruOW-0004eG-Ly; Mon, 16 Feb 2026 08:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1233780;
 Mon, 16 Feb 2026 08:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRIP=AU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vruOU-0004e6-WA
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 08:55:51 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 498efb82-0b15-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 09:55:48 +0100 (CET)
Received: from MN2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:208:23a::29)
 by EAYPR12MB999156.namprd12.prod.outlook.com (2603:10b6:303:2c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 08:55:43 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:23a:cafe::c9) by MN2PR03CA0024.outlook.office365.com
 (2603:10b6:208:23a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 08:55:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Mon, 16 Feb 2026 08:55:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 02:55:41 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 02:55:40 -0600
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
X-Inumbo-ID: 498efb82-0b15-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBh9sI2fmtgUmibeOK8PSrquTUCutg2zukY60nLuksecXh8imhIQuitpDnaVqRDAXik1tgN6+kObOjLqJV9SFVynIfeYBqcDldFdd3YBljcwX59At/YpUmuRuv5A494tDZXfCp0BgIwbSkRFz8B/VY/skYxFzBrcZqtGW8ru2MMMdw69WJuQGb05OJt9V/cd4x4OoMqJwgZhLpQ1T7F1BM/oY3h2Vh6+r+6HIADjqIR0TvcIT2t5E7eoWbOaiQVsAFkAeUNP0gWqNWhtENXVEnGbPhTSV6l7k5YMZQi8QQ2KUyTgba+m9DHy09KtHmHw+bqoPzMPJRZCKnCqpTWkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEBhuw3Tfe8hW+O7V9arjEU1FikK2bIIB7UGfDGp2xY=;
 b=m27JtPb4JRoKgQ1W9u7PbUX+CkPDYZ0c0sUf7GQuty6ZLc5P52j8nC6diOB8pGM6fxuC1Ek3YWhqROMOS2jRn8zFK9S73HwAN5BmAakIGdd6M7tdSSwNfiWeIr8zY8xlfO2bf74Xd6KF5OTVO//vzO9qB9YTotaqlU7l+l1gP02v+sECPITuB4tOSlHVqCvy7Z3SZgI6HjjVG1BP3cg+FZw26dUgXJx9xnBcme0bOoMH4x8kAml5OZdx73styYBvXLFA721jZCg2lBNpiDVscZH3aCR+eKDWhg/wd+mXWuCviKmyS0wPl9skrmKH/qkROvaC9/nXjvS1gGh0bvK4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEBhuw3Tfe8hW+O7V9arjEU1FikK2bIIB7UGfDGp2xY=;
 b=xhFYHAOMjyPla4Js0/b2AU54wijED6EZi0WMXwQQOXZDim75MWC9R/NcbA3qssX1mOrCn4GuhGULhXhmVWcvakZfcXgREeGnsOogYmHUiCqyUkxqwj4aBfeL8NIH7Go5zc7sxcY08pAkyhnt8AJL1QIGX4tzHQ4vRpsiZ0zOupI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <87e02fff-1891-42f1-9317-786906425171@amd.com>
Date: Mon, 16 Feb 2026 09:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm/mpu: implement setup_virt_paging for MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-2-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260206090155.68466-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|EAYPR12MB999156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3538d096-4b61-4590-e459-08de6d392a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXJycGRnS096Um0rOWVQMTZWNnB3Q0hPd3llWS9CU0FBaDJWYWQwM2EwVFFt?=
 =?utf-8?B?b2RmZmRXMDNxMjZhdUlzekxUR1pneC9USzBqQ0I2cVdnUzRiQlBnaVBXODdm?=
 =?utf-8?B?VzhKQmMxd3U2NmIwQU9UWlhMT3gxK09WcVRyQ05vcGVhVFFqc0Fwazlwazdh?=
 =?utf-8?B?QnR5MXRuMGpqaWVvM0JYRGw4YmExcEovUXdWL3M5alVBakE4TzkxeVBtSm5T?=
 =?utf-8?B?TlV5YVd6dTk0UVJlOUh1NlBNNWs1VTNIamVRSEJVNW9kK2tteTJ3aE1CTWdM?=
 =?utf-8?B?aDhxUG1JR05xNm9vMFdaWVNSbmdZQWt3VzlHcGQxelNqQzNKTnR5VVNRb1c2?=
 =?utf-8?B?YWFqVFp4eXdjbkJUUnlweVI4eUZNQ0R2TmZXcll6d2l1Z3JkR3dKWHVVeFU3?=
 =?utf-8?B?MUw4Q2VHZ3FsQ2F2Qy92b2RjQU91eWFwRnplYjNlVjdwRmdvSE9zK2Z3RDM3?=
 =?utf-8?B?WC91RDI2U1AyK0N5VG5PWVNtejZ4cytDQW1tbmFDblFKQzJVaEd4MG5vRWdD?=
 =?utf-8?B?eTZHWUNRWmxOeU1pb29wRWNXTy84VXpVckYwOGlCSXhsbFZEZ3lBVDIvRW03?=
 =?utf-8?B?WUJYSVZwcUlrTTJDQk9aZEFEbW1FTmFmWU9Ja2xyZmZvb25YTklBTVBCckNZ?=
 =?utf-8?B?T085cVBWSkRtUEZuQkYyTmt2TTNhV0NhVHpDR3F3NzZkck4vMjhrWXVhMkZ0?=
 =?utf-8?B?VEdMd1Y1encwVFArSnoxNDNTMnpNUWdIYzh2ZE4zTERHQmxzYldjY3JnNTRB?=
 =?utf-8?B?NTVVdjdtcTEzTkxOdk5xTmlmNHdEWnZnMjZUUlJSZHJTdjE2UzYzc0MvU2Vr?=
 =?utf-8?B?ZTllQWZWUnFzRG94TVRiNjQ3YTd6UENIR2xCQ2Y3WFA2YnpsT1RmVVphdjVH?=
 =?utf-8?B?RGt1V0RjYlhBalhXV1FnY3lCcGRmc21JbUxBZVZuM3lLMkxlUXdBUVFuMEtB?=
 =?utf-8?B?eGJVWFE4UmNKSlc5NzcwVnRta0R5dk4vYVV5OGhsUEE1YVN3SFA3SEpXckhG?=
 =?utf-8?B?ZGVhZHdOK0pSejlBaDBUUXcwcVdQUGNIRkg5SFVINmJSTCtWTGVCTml3U0lQ?=
 =?utf-8?B?a0hqZTYxaC80Vk1pdWw5UnZoNXJ6TWpkZzVMREQ3VXJQYnJhVExpVlpLd25y?=
 =?utf-8?B?R1c3b1RxTGhOSUR5dStHYldFaFlVS1FQUFpVMnlpcEluTlc3SlJEcUt2c3hp?=
 =?utf-8?B?THhCQUY0UkdEYm8rU3o0U1V0czBpUllHOHBxYVoxdGRVck5zSi91dXdkRWU2?=
 =?utf-8?B?ZlZxNHFibUNCdXI2TDFTRzlQZGFRODg1VURMbjA4NGMxTXgxM2RuUDc1VS9J?=
 =?utf-8?B?RHBuakZDTXYvTHphV20wc1Z4WWViZ2ptdEtyaU9MVUV0eXVIWlpaekphM2E1?=
 =?utf-8?B?WW02d2x1OW9PRnp2Z28ydUJKL1hnQWpvenBJRHhlOHY0RnZVclp1bDNHR0Mx?=
 =?utf-8?B?MW9aRUcrUXB5eEFWQy9UZzh2MkZHVUwxTG0ycW5PV1RVK2VRTXIxNkIxT1JC?=
 =?utf-8?B?Z08wdHk4dzAySnYzZFlLSS9TeHVkcGhMWXJmQUF3VjFzZFp5U3cxVC9OVW9r?=
 =?utf-8?B?LzI1NnNBV0dmL3JDcTB2YzhmSE5MbmdoaUN1dlNlQWIrb3hrN1dBUDNJd2tY?=
 =?utf-8?B?TVU2WHJGUG81UXJ2N0E5Rm04dVIvWHpINVJISEpJSkhKd1ErUi9HeUhkMU40?=
 =?utf-8?B?RFhMT2pERS96ZGdqcUk4dExjTnlrc1kvUC9ydHBGWDBBbnV3S1BEVEJtNFpT?=
 =?utf-8?B?N1k1ODFXbkZEdWV4YnNmbFU4SmFVVUlWa1ZBWk9pREZOUk82c2xNTnEyckFB?=
 =?utf-8?B?TDl1VHB1ck1LbjUxK2lyekxOUlpsVXhma0VTNGg3bVY0Y2M5blJPcFBTVFBj?=
 =?utf-8?B?VTBYK09nTXhmdzArSjlkcENPeWNUSVVvVnJhRGxsVmVESE9hditqSXhiY1dI?=
 =?utf-8?B?SklReXUyU1dQaGRvWFFBMXdmbGpMejdBdHB4Z1VwVzlvbUxYNUlXR0JmM0lu?=
 =?utf-8?B?N3UvSWx1Y3ZIQk1rdGx4clRuTTdLNkNPcGpZS00wbk1IR2hHcTYwQUg2aEJh?=
 =?utf-8?B?ays1WjZzWjl0YXVIUnJ1RHdLaU9YR0g2R0pKdlRETVhIOXRlT2lHY05ML3pk?=
 =?utf-8?B?ZCt6aGJScjZTZ3pKbTdoK2JyTEZaZVNGN3lOWWFab2hZcmhDTm9ZVUp6aWtN?=
 =?utf-8?B?TUM3K2VjMFFuY2QzU1ZxdnJCRkdsczZ5SllkOHpnUzFLK0NoWmdPTHh4ejVV?=
 =?utf-8?B?WTUyL1llMHlZVC9KcStNQStkY0x3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x5g/MQM24tDuSdjHiwV4bYAOX6knH+O1v7xV3YdTuUDkfPhf1t2PQvKV9Ggj2HLKJFBp7tj8rS8wAKCAYLinNiJdw0WL7lkC5acb0G0ezuTj6FVexXhBsW1KpFfiAYzLYi/SqUq2M1LLa/ZQuGya/JVRx1u7OvCd7OqZWfO8zM/WeGfZfVU6PftH40ZSU+CTraCxPoCPEU9VMV881HewF7Uv21w+ybPnie84lUUaPRx1nPdIe3B4XQfN1jU+1+8IHXbxBYQ36SlscBrB0J6Pb5FHp3Bgf9ThWdR1jkBr5AreaUQESzIT1IQDjFpcCtQueq4EoozMzl3z3TukNgccXFzisZqM5JKJ8l52kaBwypHKW/5Nkdra/QrmyAqUCEjMhXgLfWkAQqJSY5VBL5mMCWrb9+NluSF3+rOQsNdlR7IOZVA9nAp8ntHoL29QqNCM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:55:42.3352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3538d096-4b61-4590-e459-08de6d392a51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:harry.ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A38D9141B9C
X-Rspamd-Action: no action

I guess this should be send as a v2 with listed changes between v2 and v1.

On 06/02/2026 10:01, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> For MMU system, setup_virt_paging is used to configure stage 2 address
> translation regime, like IPA bits, VMID allocator set up, etc.
> Some could be inherited in MPU system, like VMID allocator set up, etc.
> 
> For MPU system, we could have the following memory translation regime:
> - PMSAv8-64 at both EL1/EL0 and EL2 (default)
> - VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2 (enabled with device tree
>   proprty v8r_el1_msa)
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/arm64/mpu/p2m.c             | 67 +++++++++++++++++++++++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>  xen/arch/arm/include/asm/cpufeature.h    | 13 +++--
>  xen/arch/arm/include/asm/mpu/p2m.h       | 12 +++++
>  xen/arch/arm/include/asm/p2m.h           |  5 ++
>  xen/arch/arm/include/asm/processor.h     | 11 ++++
>  6 files changed, 108 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index b6d8b2777b..da8f0553c1 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -2,11 +2,76 @@
>  
>  #include <xen/bug.h>
>  #include <xen/init.h>
> +#include <xen/warning.h>
>  #include <asm/p2m.h>
>  
>  void __init setup_virt_paging(void)
>  {
> -    BUG_ON("unimplemented");
> +    uint64_t vtcr_el2 = READ_SYSREG(VTCR_EL2), vstcr_el2 = READ_SYSREG(VSTCR_EL2);
> +
> +    /* PA size */
> +    const unsigned int pa_range_info[] = {32, 36, 40, 42, 44, 48, 52, 0,
> +                                          /* Invalid */};
> +
> +    /*
> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> +     * with IPA bits == PA bits, compare against "pabits".
> +     */
> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
> +
> +    /*
> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
> +     * address space to access the Secure PA space as Armv8r only implements
> +     * secure state.
> +     */
> +    vtcr_el2 &= ~VTCR_NSA;
> +
> +    /*
> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
> +     * memory system configurations supported. In Armv8-R AArch64, the
> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
> +     */
> +    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
> +        goto fault;
> +
> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
> +    if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
> +        goto fault;
> +
> +    /*
> +     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
> +     * are supporting it.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +        max_vmid = MAX_VMID_16_BIT;
> +
> +    /* Set the VS bit only if 16 bit VMID is supported. */
> +    if ( max_vmid == MAX_VMID_16_BIT )
> +        vtcr_el2 |= VTCR_VS;
No need for max_vmid assignment. You can directory do:
if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
    vtcr_el2 |= VTCR_VS;
to make things clearer.

> +
> +    p2m_vmid_allocator_init();
> +
> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
> +
> +    /*
> +     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
> +     * To make sure that all stage 2 translations for the Secure PA space access
> +     * the Secure PA space, we keep SA bit as 0.
> +     *
> +     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
> +     * configuration is checked against stage 1 NS configuration in EL1&0
> +     * translation regime for the given address, and generates a fault if they
> +     * are different, we set SC bit 1.
> +     */
> +    vstcr_el2 &= ~VSTCR_EL2_SA;
> +    vstcr_el2 |= VSTCR_EL2_SC;
> +    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
> +
> +    return;
Shouldn't we have a printk message similar to what MMU has?
printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n"...)

> +
> + fault:
> +    panic("Hardware with no PMSAv8-64 support in any translation regime\n");
>  }
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 19d409d3eb..a4b6eef181 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,10 @@
>  #define ZCR_ELx_LEN_SIZE             9
>  #define ZCR_ELx_LEN_MASK             0x1ff
>  
> +/* Virtualization Secure Translation Control Register */
> +#define VSTCR_EL2_SA                 (_AC(0x1,UL)<<30)
Why UL and not U?
Also, please add spaces around <<

> +#define VSTCR_EL2_SC                 (_AC(0x1,UL)<<20)
> +
>  #ifdef CONFIG_MPU
>  /*
>   * The Armv8-R AArch64 architecture always executes code in Secure
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 13353c8e1a..bf902a3970 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -248,6 +248,12 @@ struct cpuinfo_arm {
>              unsigned long tgranule_16K:4;
>              unsigned long tgranule_64K:4;
>              unsigned long tgranule_4K:4;
> +#ifdef CONFIG_MPU
> +            unsigned long __res0:16;
> +            unsigned long msa:4;
> +            unsigned long msa_frac:4;
> +            unsigned long __res1:8;
> +#else
>              unsigned long tgranule_16k_2:4;
>              unsigned long tgranule_64k_2:4;
>              unsigned long tgranule_4k_2:4;
> @@ -255,6 +261,7 @@ struct cpuinfo_arm {
>              unsigned long __res0:8;
>              unsigned long fgt:4;
>              unsigned long ecv:4;
> +#endif
>  
>              /* MMFR1 */
>              unsigned long hafdbs:4;
> @@ -267,13 +274,13 @@ struct cpuinfo_arm {
>              unsigned long xnx:4;
>              unsigned long twed:4;
>              unsigned long ets:4;
> -            unsigned long __res1:4;
> +            unsigned long __res2:4;
>              unsigned long afp:4;
> -            unsigned long __res2:12;
> +            unsigned long __res3:12;
>              unsigned long ecbhb:4;
>  
>              /* MMFR2 */
> -            unsigned long __res3:64;
> +            unsigned long __res4:64;
>          };
>      } mm64;
>  
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> index e46d9e757a..d165585d4e 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -5,6 +5,18 @@
>  
>  struct p2m_domain;
>  
> +/*
> + * The architecture allows at most 255 EL2 MPU memory regions. The size of the
> + * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
> + * and 16 bytes on AArch32 (requiring one 4KB page).
It would be good to have a BUILD_BUG_ON to validate these calculations.
Conversely, we could define root order with these calculations but it might not
be well readable.

> + */
> +#ifdef CONFIG_ARM_64
> +#define P2M_ROOT_ORDER 1
> +#else
> +#define P2M_ROOT_ORDER 0
They don't seem to be used by this patch.

> +#endif
> +
> +/* Not used on MPU system */
>  static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>  
>  static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 010ce8c9eb..ed1b6dd40f 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -48,8 +48,13 @@ struct p2m_domain {
>      /* Current VMID in use */
>      uint16_t vmid;
>  
> +#ifdef CONFIG_MMU
>      /* Current Translation Table Base Register for the p2m */
>      uint64_t vttbr;
> +#else
> +    /* Current Virtualization System Control Register for the p2m */
> +    register_t vsctlr;
Why vsctlr and not vsctr?
This does not seem to be used in this patch, so maybe move it to another patch.

> +#endif
>  
>      /* Highest guest frame that's ever been mapped in the p2m */
>      gfn_t max_mapped_gfn;
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 1a48c9ff3b..7344aa094b 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -403,6 +403,10 @@
>  
>  #define VTCR_RES1       (_AC(1,UL)<<31)
>  
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
Would it make sense to have CONFIG_ARM_64_MPU to avoid specifying these two all
the time?

> +#define VTCR_NSA        (_AC(0x1,UL)<<30)
> +#endif
> +
>  /* HCPTR Hyp. Coprocessor Trap Register */
>  #define HCPTR_TAM       ((_AC(1,U)<<30))
>  #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
> @@ -464,6 +468,13 @@
>  #define MM64_VMID_16_BITS_SUPPORT   0x2
>  #endif
>  
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +#define MM64_MSA_PMSA_SUPPORT       0xf
> +#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
> +#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
> +#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
> +#endif
> +
>  #ifndef __ASSEMBLER__
>  
>  extern register_t __cpu_logical_map[];

~Michal


