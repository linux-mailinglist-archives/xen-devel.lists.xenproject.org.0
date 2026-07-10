Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1kHBRvcUGq36QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:48:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4E73A67B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:48:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=o4Zf9LM2;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359207.1612898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9iR-0000oE-Sj; Fri, 10 Jul 2026 11:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359207.1612898; Fri, 10 Jul 2026 11:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9iR-0000lv-PJ; Fri, 10 Jul 2026 11:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1359207;
 Fri, 10 Jul 2026 11:48:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi9iQ-0000lp-3r
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi9iP-006FNh-GR
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:48:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50dbfb-e002-0a2a0a5209dd-0a2a4506ecaa-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:48:21 +0200
Received: from [52.101.84.130]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50dc05-0835-0a2a45060019-346554828801-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:48:21 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DU2PR03MB7927.eurprd03.prod.outlook.com (2603:10a6:10:2da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:48:18 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 11:48:18 +0000
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
 b=XnrcGPUWrO8UwJAhM2HIRQhusMnvjeEiUQ3hwL5t7vtPgH+bvLt9Ifrx5NmjY+5EVeMphaucZc5RFSb1iZvo1XTsGOAYjBtCncU5XmdVq6o6OHpTAD07IqoxaHrF8bJLo6sk+nWOlBFZ4x/SU0SbFwcMGHUb1FN62bjqYVr/JLqvjdxvk555wuntkwVCGC3Ytg3M+Wb11tawVJd9+Ft08ChQi1YjFH4RlEl+dfhl7hUB5xwDz1aLKgSrZHKyaEJZqFbOXiWtYsBNm8KtKs6Yqssogs704lDIWqv/x+ar4OQfWxBJRqpMP/2ccQj4pN52dULXqRRsPbkFLxvE9L7yDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc9m+btl+oEKpV/nf/s1JzhByZUao75FbmBmv4o57Wo=;
 b=YUyEVA8Snwr+7AaKyfn3v6oL1uUToH1gRWQXFyoEKuoBpp5pVHV3xRPX7iQ6uI4+020YvrirNQQRCDg7fAQz4/INGpMUclZ/+r1Udh0ex70oFvVhi5IEWQIBEO6PhkOmxkcJWOzYZL1l9wQc/tY+F9+jk1REL61SknCwNMMOaAXOn4bvO/sgJlN7l4H6hKtYKIZ52ZWfcuWTcYGp1DzW0DlLmVba4TOLJpSBPNYHT40TG+o/RiekrYwJ6ztmwPAZuFdYSiueutmd+iMb9urUdbfbw648LvxS4cqi+vlAWtcNFc4i3PKd6zxNmy7JdctNyBi8EOyOu44BjftFQl+jwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc9m+btl+oEKpV/nf/s1JzhByZUao75FbmBmv4o57Wo=;
 b=o4Zf9LM2dynbpNwGgkTHt82FFwOJT7zuNCilwhbeFRpfEJwkvCt5bDrJcHy6PwbLjjJDEgSADBRaW4XpKp1yrEZ1ItZND5mP/r3VOwz8r/Wp6lRrOA9L8uuVuyvAx80GXHlKw5t7sYLMvcPcPEWzFO/AxFOzmq+RIGiODu/gUAF3CtYhTt62daLwcsJHI1Bpj6mxWGiSVLJVK3TNFwn1PylaNdXs/DHivkMOwEHn26Te6i5SkyY1XyBOm2U5yF+/ZJsbZ4QHo7IVMuKdrQijqWpf3Ur4nku1Z6yGfBxHuox5dT+oAJ4svt9Eg6Ghhtlbgv/O6DnJYfClSzZyC2tgxQ==
Date: Fri, 10 Jul 2026 14:48:13 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
Message-ID: <u46k277cxsw53rb2d4pnxksbbwr35rjp54vwxqm2phbrp2ywll@etlvezzojxvi>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
 <2ba97094-c9c8-461b-adc4-64cca978dd6a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ba97094-c9c8-461b-adc4-64cca978dd6a@amd.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DU2PR03MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: d6aaef40-1d86-4b8a-f772-08dede79225d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006|27256017;
X-Microsoft-Antispam-Message-Info:
	ZHauIDty1FJKcuCkbWgDI7WKhpTgO6KUdj2M8ZFcNHjIufcn6mmTksrH+ZJ+mVYnnswCIvwRiSmbV5l9MX2k9ZdJEzg310vhB3BkqD1ojNpGt8LFlZR06uup0r6kaWiQCacXvbZPcv3tYQe8r08d2IAARG2TzVovJ/0ECt4piAX5tmSTO8HqV2WFGUZ5+PWcw+Je6YdNpmJlB6z8/pEfZu4baAIYDj+MYQf05fBu1HCJ1HjfD1sijcwAvIVnm/3J8edSnFQBNx65mHImHwBBr8dKIP4btMFANLpCIO/3D3dCGAicHrgdKcuZV2nxFoinwGClSAjC2YntADIg52OnJxNXvdR48OMobAqFqGRlMPNUG5YoosPu23zYOmpxf2cDwAgB1PbdKx7G3/OKB8BP5oddvfHb3c3x9qfrXj8PFBoCfxnH2SbVQP2H1Dz9cf3C2f45/ZyAw5YyzL6N/EmGg+bkLxEH4QYu1o6ATw1LQycMFJmHDjBeQ7dW9NUL5pwn0CybUw8qyuxv3uS3H537rQUGCEV3ONux174t3eAZNhRruCU9PxIljcVtln/UVSh4MeiJCByma70OZQ48UzpFUzzqkuEdCxdXGtxMaBVxjFMk7iMmrd86Xi8zr049KFX67BKb+JP2GkTnv1c80VR3Vy0TqRmUYeyRTpdCSbsLhCk8fG8KjYzWPgrxGp6sscKrosqLadaL+1W2PkziDPNf7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjB2WGhPZW9UQWNVNTdMSXh1M2NOMnBMYWZCR0hrT040aVIzNjVXWVJ0M1VH?=
 =?utf-8?B?OWVTZW9na0RGUngxdEUzSVRRRTR4MGZjVmtScUVPSE5LZUxEL3VjclVqVGxh?=
 =?utf-8?B?b0R4Y3BUN3cwS3VkZG91YitRL1g1NENabElwMFpyRERXTHJ2NUtyS0RlOHRz?=
 =?utf-8?B?S2JKcFJqL3BxalErTm5BTHpCMWdpdXhyazM4YTFQaDd1bk9RaUYwS2ZheGlN?=
 =?utf-8?B?bHU3KzR4TUpVeHJiVTlvKzNNdE5HQmUyTHBXZHo1dFJsYWdMN0VvZkJ4QTFO?=
 =?utf-8?B?dGowTlpFZkcxZXRNV1JBeW15U3BNRmhnQ0NXZk96TjY4VmM1T0l4NnJ1M012?=
 =?utf-8?B?cHJLekRXVGhTZlZCMmE4c3dROWpvdldXb2MwMlZGNS9haXhuU3N1bCs5UUdS?=
 =?utf-8?B?OU5tZ1dRQkxEeHptYVJsM3RDbDFmMkl5a0REMitXK1FCcnNPYzVXOEhUZE40?=
 =?utf-8?B?UlBVOXRaTW9BeTU2ZmVRTVlLVlFxNW1PV2xST1JKdFBIU0xxM0xaditlTGdJ?=
 =?utf-8?B?aHNqbllCV2pyeHBmTXAyS3d0NjZuU1JaUVFHZ1VNcm1VTTF2eTBuWGU0Z0kr?=
 =?utf-8?B?NndhaWtFeDZNbEJWNlZNNzc0L1YxSk8rUzhlWC9qdDRGZkFkeUNTcXFQUFB4?=
 =?utf-8?B?MjRmWUlmU0JaKzVRaWRheVA4M0k0WStMZzdIK0cvcG9sQTk4MEdFV1FxUy9B?=
 =?utf-8?B?OEhhVkhUS1NxWUdlZnN4S0drS2ZlTnVpS1V6Uy83elFmRWRqUUhNdi9xcHF4?=
 =?utf-8?B?WWlaTTVraU04Q0RNV3FQenI3WDFabmxEUUd3MEs4bEVicVpEY2FOVmZtVlFn?=
 =?utf-8?B?aFZnZWlxYU9BTjJRTFhUSjh5d2xLTDNqRWZ6c0Y3WU9ENzVVSHJSMlR3b2g2?=
 =?utf-8?B?U0Y1RWpuNmJoR2lGd2dVYkVhRVhzNHN1UnB2dkRBSEZpR3RoZjFmL3BQUCs2?=
 =?utf-8?B?a3N1UUtmWlZHTEkveGwzbkM0QTVaaGF4ODJoaEtkWWhkQUVMNE9US2R3dnRW?=
 =?utf-8?B?ZVF6ZUU3ekY1bDJjaWtrcDBSajQ5MWxlQjNLQjZYWnBjbzRVb2ZYTjRpNitp?=
 =?utf-8?B?TjBHWjFLb1RyUFVnNGt4V0QxSnNrMFFNQjJRaGRmYVBpVWlldUVZRTAwOVJz?=
 =?utf-8?B?TUJDOTZOQ1JLNEhJbFdEbS94UmNrOVN2U2dPOFJQNnI3ZktzNVlSbm5jRlRO?=
 =?utf-8?B?dnBKRTFPYko1eUFpeXZ2cWZHdnh1UEhDK2JybGI2RUFVQlo5WGZOVHdxSFZJ?=
 =?utf-8?B?Z1UyWHBESFcxVHU4QTFPZUU4blJLdUZBSW9lUWpQTVRNSWErS0l1QXdUQTFF?=
 =?utf-8?B?US9qcko4TUJZSEM5WU9BTG92UnNWMzBhbGtEdm04a3B1ME55MFdJM1VhUTFh?=
 =?utf-8?B?U2ZuemZsZXdsQm9MQmNOVlJFRXFsT2xVcXR4NFRGbTV1Q28yam1zeElKd0M4?=
 =?utf-8?B?ZTA2cXdIbVU2K1RXZGFyeXYycVVpV01pOUJRcDQ2cHEvMkl4R1hQeU9jRTA5?=
 =?utf-8?B?WklKeHFCL2Y5ejlWR01WYXk3Mi8zODVJR1R0OTNUeHpXYXJ4Um1JcU9tNE1h?=
 =?utf-8?B?U1NlOWNFbkhJRGVPNi9FZDUvRE5TQjJneHZJTUR3RWpHeE84aTY2K01uY1hv?=
 =?utf-8?B?TVRMeFh6WHZ2WTRic2FGTmhVeVJCZldadFcwNFdzZmlrQkFPYU1OZ3pwT0pt?=
 =?utf-8?B?NXhIR0t5RjRXZDFrVWV0MlMrMnA5Z0tta3YrcmVQNERJbVo4R1FUb3c0YUhw?=
 =?utf-8?B?RUQreHc3R2ppcThpNVBUTFN0bGQ0Y3JIalR3dUJYUXF4Y3FPWm54a3Zyb2NI?=
 =?utf-8?B?WGFPTGpYWWMwRHJHYWFZSHMxYlNPMThZSm8wcy9FSUpFVGZLNlZ0NXlqdUZ5?=
 =?utf-8?B?Z2ZsQXpSdHJWM0YrVHpoTk5SUEtPNVd1UlhtSi9KVmRMcXVLSjFSY0xPdm94?=
 =?utf-8?B?UGFpS3ZFVTVpSXNSdVpKekpHam5PN3lFY0RjUDBRTklyZFNpcnRYY3BpN00x?=
 =?utf-8?B?MnlTbWVHM3IveHNGeWViT2NldVVOVVpPblRZYUpEblNhR1pLNWt6a2U2L0xv?=
 =?utf-8?B?UjdsaUFFVFJXVHY5OTNQbmpCWmlvM1MwRnlxUXFvMGJkVjByUnBaVEpXckhC?=
 =?utf-8?B?Z1hPRHFkQUdsNVZTT2RMSFJyUnhUZFBUTlFrMXN4TzYvN3NjbG92L0k0Mzdz?=
 =?utf-8?B?M1k5NGg0ekdhbUlESkRpMVdVWUJNZ1pKcHI0bEFLMkwwSFhkL2FDL0JheXlj?=
 =?utf-8?B?S2JBS1NqV1REZHJzTWd0NWpYNkZhSUZOcldxb0pER05lZExBMTNrQXdlaFdv?=
 =?utf-8?B?dkJCMjdkYTVYblpiT0ZwTS9nUndTS1RjL1ZLK01Dc2xvbE1kU21zUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6aaef40-1d86-4b8a-f772-08dede79225d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:48:18.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvoKejKY+h3SHIgSeqO00M8tqxdblg3reE5GK9Iuze0MWj3r+2+TxmOjpTiz7pLvcv9vFDz/1YOmQzcHNkAEcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7927
X-purgate-ID: tlsNG-16d1c6/1783684101-510BE617-116B9287/0/0
X-purgate-type: clean
X-purgate-size: 1525
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etlvezzojxvi:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60F4E73A67B

On Fri, Jul 10, 2026 at 12:44:44PM +0200, Orzel, Michal wrote:
> On a tangent note:
> I can see that you pushed quite a few "for-4.22" patches. We are approaching the
> release, so afaict at this point we should only be taking crucial bug fixes.
> Moreover, when sending "for-X" patches, please include a description with your
> analyzed pros/cons of taking a patch in.

Ack. I understand. For this patch specifically, I consider it a crucial
fix for 4.22 for the following reasons:

Pros:
- It prevents an out-of-bounds irq_desc[] access which may corrupt Xen
  memory or crash the hypervisor.
- The issue was introduced by eSPI support already present in 4.22.
- The change is small, and valid IRQ handling remains unchanged.
- I tested CONFIG_GICV3_ESPI=y and CONFIG_GICV3_ESPI=n builds and
  reproduced the issue on FVP using a fake DT interrupt with reserved
  INTID 3000.

Cons:
- The trigger requires either a malformed DT interrupt specifier, such
  as reserved INTID 3000, or an eSPI unsupported by the Xen build.
- The demonstrated failure used deliberate fault injection rather than
  a reported production failure.
- The patch adds validation to common Arm IRQ setup paths, although
  valid IRQs continue through the same path as before.

Assessment:
The hypervisor memory-safety impact and the presence of the affected
eSPI code in 4.22 outweigh the limited regression risk.

I will include this kind of pros/cons analysis with future for-X
submissions.

Best regards,
Mykola

