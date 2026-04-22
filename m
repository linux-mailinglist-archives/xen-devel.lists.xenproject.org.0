Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNZ7Ckj76GlNSgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:46:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B048448D32
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290905.1570344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFahf-0006OI-U0; Wed, 22 Apr 2026 16:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290905.1570344; Wed, 22 Apr 2026 16:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFahf-0006Mp-RA; Wed, 22 Apr 2026 16:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1290905;
 Wed, 22 Apr 2026 16:45:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wFahe-0006Mj-3x
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:45:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFahd-0018xp-DE
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 18:45:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 69e8fb14-bab6-0a2a0a5309dd-0a2a4507bf0a-40
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:45:28 +0200
Received: from [52.101.46.5]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 69e8fb27-229c-0a2a45070019-34652e0580b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:45:28 +0200
Received: from PH8PR12MB6771.namprd12.prod.outlook.com (2603:10b6:510:1c6::6)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 16:45:23 +0000
Received: from PH8PR12MB6771.namprd12.prod.outlook.com
 ([fe80::6536:1008:9f96:f3eb]) by PH8PR12MB6771.namprd12.prod.outlook.com
 ([fe80::6536:1008:9f96:f3eb%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 16:45:23 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzT4oI68ElZo1p+9Skwi86f4MbIO+sciucspNiurSe97fRT0I+Ks0WCiyX6TIA/WufWEbgudPyIs/MfE3CWglcPFPJtzaMpqlAhP+tP3uhMc6HTFOSs96fm1pmJ2KEPPCPeQEbo+HTpuHyzAz6uU50HcWT+REJMGbwT08he8YOxLOu/Y4Z4WbYuCHepWiIZqEwehQWEU6UNVIcNKdm8dJgT+rQtEtmTulsvtFICbfHFp5i7M6PS26b5FLxH97eSn9N9nDDBaZ848rGjFcuvP9Io+o9ipj7X/VQmbnf4mIbTlt3F0AhCid8VSlCF7DePQDMF3KYyvCw5NDcZY7Z6VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXYTPr286/vW4QR7rsApjLMHIj/fupcV6bZIGJ5DvLc=;
 b=AwoKZKBGuDmBGxJrL0YqW85I+p1CryVLe2FRystXQ2urqjrnrzuh996Pm26zDsUFzBmk++zxMcF9vrzYZ3xG13SsAh4WmHRHoygPiaZtMOJB+XVYbqYuSLG1sf5QPfS4+Ne/2bSEooy3M2stVOG6LhSiXSqobw2LC4YcIpByJP8vHDfVCd7CrQFL5r5ACgQQ7twOFdgCgyIbqfRAxR2XQhZKxTtLDAKhiG/imUU9IZb1mU9TU8iLRYKDWHrBDYlCxLVR+Jwl1mrLcuUaVuipagDv33O/1Pf8WkodHQ8Sq6THUFJvPw4q9ZXJTMvk0mH1XndyY0P96QKt0DYNHmI90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXYTPr286/vW4QR7rsApjLMHIj/fupcV6bZIGJ5DvLc=;
 b=a4ocRZXOzgutPfbc3+geljuQ9iEWugCRsjG4NptekteQQDLYD0nHreIslEFI08SuxaaLbo6p0qHP5wGQhIiKO6RYChizXBmJho60b5wb6Zid8i/8ofuahR0sgxt8RIqk/UfvHciiZpP86DwRXNkrqY4Jp8ZZzEZp2Oh34t+vBYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 0/1] arm64/insn: Avoid undefined behaviour in branch offset decode
Date: Wed, 22 Apr 2026 18:45:05 +0200
Message-ID: <20260422164506.2234095-1-edgar.iglesias@amd.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0055.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::13) To PH8PR12MB6771.namprd12.prod.outlook.com
 (2603:10b6:510:1c6::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6771:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: a787fbe6-8a2b-4eff-01b1-08dea08e8c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZJBHSs4m0LMgQ666TLQIv5jEeDF4iz6vbf291JgeiKE2Tb+o/R/UG78tx2SQDs9snMnQ94ZMvFRozjCcsOr4OIjtMW29jKZg9sDDgnDq8x26OQmC7Ynx5X7/MtN1snzTN/jdeMBPEkOP/druF7ZmU4cPBrJY+D0FDTdKL8LP0krMRCm10Iu1ZfSOx/9yDzJREhXb4i5w4Dm4yDLbdzDCTGJJUX69qwc7cKIAsbODhurCO2xugUjFi+1oFzbTesCvbZD4+8DNCZmmp6LlqO6ugjjDEJLna4TCNoia71IqaW+kTScMhZJhkHSUq1Sza8eWeEfFWwQp4ETtNhfxM89PQC3uBqJ/hSDms8KsJC+kVmA1WIBL18UdYnYmx2B5GOWfRmWN2xdcFhrODmlDLRJj5gpfhEuPublcEaoh/a5PggG+N3US6KK6duRzZ63VSp9OuzxLnQ/wV486iVG+tT8P7xmI6LuRmTTYHPy0Wg5c9jjm568uSS2uqh/Cb7U1DrmoQXSbrTwJPp31WQvQbAwqvEkW4PcCUF2t1ev/d1EHdbSRthzBxKM+wCEOJYCxhQ2DZFbxAK7Gp5VaECl6HVzJO/yIZo/giQ9tea0zAXEkXrpvUfB8w4s7pdqo6WsmkGJ1T51qCBpvr58fiEJSbBTu6ZoM/HjcCI8rhU4YjVHDqaje6u0P/qOlhYzo1YX/h3inFlQmuspErL4bxzh78C3tMCqh31j2pvSr6e/9i2aTfNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qLVAiSvXcgOtHzE8JEJoBNwUGZxE+YDiVNjoVXKDbmMf3OewoUMyz+1JO6C1?=
 =?us-ascii?Q?IHQHh5A8R32js8CU6K6Jh1e7OZVijLq6nE768pSSuepY+OPCmG1JyKouvGO2?=
 =?us-ascii?Q?y4cK3ElZz3/Z/DZZmx+NLl0LxjKhQqoruqsHwVJPHrjwuofD3tlS857ACrMH?=
 =?us-ascii?Q?CF6hgLJxadGlkE5dqrHT8uxsY7W+CwtIVDYFHjxpmAxL9qJBPIyY6ei9zUke?=
 =?us-ascii?Q?835KRJuwLEWmQaYoLPf6OK4haKyZhaXTFF8Hx7u53uMvrd141jEi4nm5NQ7l?=
 =?us-ascii?Q?TKxd4ugswgohkPnx/Xo8w9tac/0HKLLACu8U4ArMkTNBf5RCfjc+NM9foEVZ?=
 =?us-ascii?Q?bT0WY5TKJCDvmH8/0NTLbIkaJC5wkP1HSZT8bXA6gvNX/TT2mjQgP8XuDeCD?=
 =?us-ascii?Q?nGROXr+hD209qAj/D/XN2fPwtkP08r5yaCN3uvrLzD/kUoAxp+K+j6xYK9Zt?=
 =?us-ascii?Q?CT3Aa3BaIHEq6a0PgvpDKMjIK+eTJMAH2zLwbxIThRiJ4J6XUh8/54kevuBA?=
 =?us-ascii?Q?9CV4bDKzbhV4EvZWsx9SE9Io7Z+IzYif7t01l9WruVQh6LrBCFV8YI2wrQIO?=
 =?us-ascii?Q?0uM9qX4jbx6+rM8HFOewXpXM+R3wNSuZBVb4VtFUrhpzAg0m3qcF6G1/HpPv?=
 =?us-ascii?Q?cJTRVRFbTwWij4PvoK0YtBHRY8IGQ2/PpNaswP+F7+vzz5UUWNKGF6OyI6dH?=
 =?us-ascii?Q?gHoT+Zwe3bVWqqmfL2ozsKxGwL0XLyMTCznhRSQkhWXyGqS8W0ZGaI7T3H9n?=
 =?us-ascii?Q?xHd46cnjyYGJz0KnVuwk4elmTmmnP9PanCgBcaTVmSf7QZNRjZC7gIGBr7wN?=
 =?us-ascii?Q?PcEisJlvqNT/lkH08X7WBwJ6SyLvau5jVOz1k1wbzA5l2KGU8oeBy5501Kbd?=
 =?us-ascii?Q?olF1EQt8xUUmsHFCFFudgpKDNrFlGtZiMi6oglhCZug4oAkBbIkXwAKwYHnp?=
 =?us-ascii?Q?FhFg+XNzpF9pPLu+vQH31UFoqqQoLGlN8KPs3TvY4WJ3vsH4dVVdzPbl08CK?=
 =?us-ascii?Q?+g8+jExTJpuxmxvtJoDc6ILOGe+De6TwURJjslHis4GQ2yEU2SBbRPLjs32f?=
 =?us-ascii?Q?HnbVuphe1pd0n/k5UF3RISqXwtO4eWguiOSpsuNW0MqwSk5xtdt/GqlMvGur?=
 =?us-ascii?Q?DxAQ8Nw65OSE0cuYRBj70tfHwIzDqxcamsaYDZius3fbu3kdXngtuHFr3vP3?=
 =?us-ascii?Q?kc7/XSdwWLsIJiZsOblqSy19UfwMjx9frMAWmB8DbzZrZmMUKc9Xf077NryL?=
 =?us-ascii?Q?p4kDYQKcvBryl53TWZfzM+3kEmebLXagVRYMPr1QsG1489Wu0K6jIBOI7Uuz?=
 =?us-ascii?Q?D+yafPlAZuVxKJBM6T71CGwEOrrACbVI/TOnx/ehJ+JNL0zQmflC6hw7LHxu?=
 =?us-ascii?Q?JTBFu2GaSRQ+Xk2JQMCvq6WKGFf5lw7GP0TreXI2HrDNKqj6GsMtJGiNrS8R?=
 =?us-ascii?Q?feZMMCQneKIYVR5bQHCrAzgPIDTp4m015AyZ+wqX2HaH7m8BMsIorzjPVSK5?=
 =?us-ascii?Q?n8Wi/myQIP3j4HrkqxMxkGe0hmaPIUF+2bQru3D2iTkn13tw/Bio6LdxAQao?=
 =?us-ascii?Q?p1jM/rUsNzHDEuCWqGALBjethBtVyfJNnGMbnCYPQdiPpkAdBjIcb05L8W/x?=
 =?us-ascii?Q?TskQjEYf2e1z5fBdfgpOKBklkTcr5Jqg6l8OdEICnb/O75nH6wd7NGC4BHbI?=
 =?us-ascii?Q?vIC3mCY0KovWc3mNcquKp5Ljy35GIEvxMmoSgyDsXeXqf+S/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a787fbe6-8a2b-4eff-01b1-08dea08e8c28
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:45:23.1869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69qjXs9G+Z6SB/XzanXbmNlrhVCHTkZN9qCqEbwPz3qxSuDZ2fLWbv1pP0hFUmgP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
X-purgate-ID: tlsNG-ef75cf/1776876328-ACF66C48-23A4F23C/0/0
X-purgate-type: clean
X-purgate-size: 1225
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 6B048448D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I hit a UBSAN failure while alternatives patching decoded a branch with
a negative offset.

The branch offset helper sign-extends the decoded immediate by shifting
it left into bit 31 and back again. Doing the left shift in the signed
domain trips UBSAN on negative offsets, so switch the intermediate to
uint32_t and cast back to int32_t only for the final right shift.

(XEN) alternatives: Patching with alt table 00000a00005e7298 -> 00000a00005e8894
(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in arch/arm/arm64/insn.c:232:15
(XEN) left shift of 66621055 by 6 places cannot be represented in type 'int'
(XEN) Xen WARN at common/ubsan/ubsan.c:176
(XEN) ----[ Xen-4.21.0  arm64  debug=y ubsan=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00000a00003432e0 ubsan.c#ubsan_epilogue+0x14/0xec
(XEN) LR:     00000a0000344a58
(XEN) SP:     00000a000061fbd0
(XEN) CPSR:   00000000400002c9 MODE:64-bit EL2h (Hypervisor, handler)


Edgar E. Iglesias (1):
  arm64/insn: Avoid undefined behaviour in branch offset decode

 xen/arch/arm/arm64/insn.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0


