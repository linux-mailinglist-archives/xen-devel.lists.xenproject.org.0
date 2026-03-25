Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDvXOnMTxGmfwAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:55:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964832971A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262789.1555161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RVN-0006v0-5h; Wed, 25 Mar 2026 16:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262789.1555161; Wed, 25 Mar 2026 16:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RVN-0006rz-31; Wed, 25 Mar 2026 16:54:53 +0000
Received: by outflank-mailman (input) for mailman id 1262789;
 Wed, 25 Mar 2026 16:54:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5RVL-0006rt-SZ
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:54:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5RVL-006ene-8B
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:54:51 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c41336-5cb7-0a2a0a5109dd-0a2a450ba650-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:54:51 +0100
Received: from [52.101.57.45]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c41359-ef63-0a2a450b0019-3465392dca84-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:54:51 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7178.namprd03.prod.outlook.com (2603:10b6:8:126::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 16:54:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:54:44 +0000
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
 b=SW/3Bb3lRgCnWW+EzWCGPgr+J+vIqaSGMNTzOtub+7S0qifFDEeUto+4GRWNDWTdd8XBol6H2GlbmvmNOyk2X41QI0z07UHp7m6SaVPu5BqhYsUgBdHGP62E1LObRQ/Cdj5uf42wYv3j/jVWbX8ZUtEaO92nGfoj+fBl27CqcMo3bab0pErMtUt5HjqE9aAx963MU8yyHoK7+CcxLTLs5F3/MqOXh08L5zkeH9BEl4IrmweyV2X+OVdb/nfiSYCkNt0LDf+In7BV1ewnKCrfe8sw+4/uhyxaJHpPv0uPPZZpi1nP3uEG12oeAC5zO/cgOCedj1sTh3xwd8n92d/doQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5cIfIRVdeZwC68hmSTsf+2fF1KF+UXOKOFvWyEOsWs=;
 b=m45+VQrdb5Lmb/vvDXwciztg8TqIXBPacNv29XBte8zGsOsccmVwdWuUH5PaM77boS1K0lMcmpOh88dBmZQYI9CUj5mkmM53NuTGqP1BOygbTnnD+H/JemQvFQHSKRMqmRGDLK9EiegcEFwuLfmcBZ3c81q92LUCUktuUnI7+9DVEznLMwwBwZbh2otkZdHoUN4Zf/7+itZ27RN1tZysgu0QuJxszvLu2tFz3cQLuZOk+fNZDhObRpCl4WqV8Q7GJLkNh/Ugpb9L4YN4jg84APPPcun1QbY1IVw97D/MGh+2BRkKZErnNOADqvhDk8P0bE3rsfHngnPFlTBr5Uj9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5cIfIRVdeZwC68hmSTsf+2fF1KF+UXOKOFvWyEOsWs=;
 b=YKrcnHPJFtHWaKXkwndKAwrKhYl3Z300ieUasjU1i56sq6vbPnv3407PkM3cuaYY1KSIWQICcxLYhOurf29uP35D/7z4K3IcElDgOaJBQcqZECb6f6CniS2Ctd0w2kW6OkxUI/4CkNxYFXurSKAIbGpqFxftMOfx8RMr4nvRIT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Mar 2026 17:54:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/mm: do not assign pages to a domain until they
 are scrubbed
Message-ID: <acQTUE3Lm7-KIcRj@macbook.local>
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-3-roger.pau@citrix.com>
 <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
 <acQMmXyOGFe5AN2i@macbook.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acQMmXyOGFe5AN2i@macbook.local>
X-ClientProxiedBy: MR1P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d45430-568b-4e60-34e6-08de8a8f371f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nK1xo6YUSrIoC7Af6j/I85n6VxioQrSOnYU50yQ86Ekgjc1tEqadKc7sl5y+Rt0nkInjUf9WRqKk2l0WcXasKK+ISr0ZXWkDX7oR/ZjMfF6+EeZ0ho4CaEWcudyXS9Ko+wDYvBLgDLM4LrE73kiradbERBJ6r7tIxrHvXO1gdW/Lm3BAhDIrgoBRvACVQTVtBWO9Nk5f/UWsNnYKwIYmiFn1XcaxQwm38xQO2R9k/3r5+mb+s1rlq7rXBZWG5NNLxQrdyHMXmkWh4YVeVQlmVVSoXOYU/5lSSD7mEPSShT0gNFq6KeWFw4tu1V6eorB2/Fd8cYjBFwnt0XJhssMy2dZrRfKQxxN6U0X44ELVkPWXH93RJMY/D+bpH8FNA/Yrl7yLoaz/nFlXsqsWOGK4dyakCKHSz833I8ighzihvE5eTxcTTpPSWfAdscEv7BeWm9HobEOOPqAT8IX60WWqkwUif0b6U4iPm5NltepniflkzC8YF0gLo2aMZm6KS4vYiJaxNVF73A9mYyiAr6MdGRCNZwceCMpUjbWwRC201GLkpJ44BObJ2vZoXEDbdSvYjzBPGuKDVnVdDYF78j2rZHQD4iUgYDAvRJPKh+TwuQxBxtHX1rIoim9BkKkpYmY39dqZCLak7gK1eJcAPkjbMxU7E5yaJoLgR657tWWAlGffL9WD6R1TwKtdLO3kguLuaXo+5Wcz59PA3LlNH1AQk1pkeDCO4JErrlL7EDi2TSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGdLakZFb1YreUo2M1Y5TVBUNThQSVRJY0tRaDBTSkFOM2tpVnJ2em9uNWJq?=
 =?utf-8?B?ZWp4T0RmODBnT01tTTNLbmNDQnF6YWJXVnBaQmJNVFMvamtrL1hIVXloWHQ3?=
 =?utf-8?B?TVJydHYvRmV4UTFlVnpLbXIrWVAxTWs1cWlvbGgrSDVBeEJiVVlGZVUvYWk0?=
 =?utf-8?B?dG5ySWxoYkxVUW1jTXFYQjcvTXc2V0ZoTnBYME5JS1lPVmwzcFVvalh1Qmkz?=
 =?utf-8?B?RDhMcGVzMWxQeVova010bE1ZTThFZzZ1dTI3R3pqYll2MDlkNUNaV2Y1YkMv?=
 =?utf-8?B?T1o2c2VRSVAwR1hOYUxkRnhTSkdHWGNUQjV0N1lPVmF5dXNNMjBCWWhWeEhX?=
 =?utf-8?B?UG1lMmVrV2labnFUNkwyeFN6dnJjU0VFUzhYWldmYStoTXJlazhDYXMxV0c2?=
 =?utf-8?B?NUxwVEJXUWhBWDN6Nng3bTdsZ2FVOTdXc0tGSG1lL0RnL013WDVnZXd3RDRG?=
 =?utf-8?B?WURlTm44dG5qRWhjU2FWVmU2WXd2dEJROEpaRjYvbHhBblQ4RDBTMUF5ZTJi?=
 =?utf-8?B?eGloSUNNWE8wL0ZGMUk2dThiZmxQM2R3MDFaaEVsODAzZk03T3dIUWJIbnJW?=
 =?utf-8?B?VmhFTFdrUmEvRjRCaFNycXIxdXNHTUsrK0lHbmFxczJFN2EvZlprN2tOYWJ1?=
 =?utf-8?B?VjBIKzRKZ1l4MjE2SGcxVGRpMkJiZVZSVzdOclBMZlRNTVp5UWlyMmYrcXFU?=
 =?utf-8?B?TGlPTVZraUZadFNEUjAvWk9Gbm41T1EwbWRXNEpuUVJLUkVsT25UdGF2NGdo?=
 =?utf-8?B?K0ZwaEpJVDFEL3RSK1pwWlRIWDNpQUxKMWFva0ttRWxodVFlNCswUFZ0QTJG?=
 =?utf-8?B?YnFjRUhJWHRINktsMFZLeFk4Zmw4bXQzWFFmSStMTFh1bG55RndzNkRRVW9C?=
 =?utf-8?B?TnlXUXB3SUkvQkY1M0hMRlVuSEtXTFNYTW1lcEFIS1gzVHh5RWhvY3F0Qk51?=
 =?utf-8?B?ZFhLNzJ5UTYveHZSRTFrejBuTkFnYzRTbGNGNzBiQUxwQjNlTVFoTnJMTFlV?=
 =?utf-8?B?MkdZUEREYVpKdHozQm1qRGVFdGY4RGRiSk5WendrejU5VksrQldDaXJ6aTRD?=
 =?utf-8?B?OUtzWDZsZmtMVnpLeUJOM2YvWWw2TmR6bmg3SzJjdEVyZWpseFNKOEtFbFdl?=
 =?utf-8?B?RFNEellscGlKOUs1cFY3VXZnWjdWQjE4UldsOVJIL2dkdlNpdnNKQlhIYmRP?=
 =?utf-8?B?QjhLelF0aHZPbUkrVFlGM0xTWWd1SXpoUGM5MHZuaWp3WUlhQkNVNnhyQTVE?=
 =?utf-8?B?T0JNT29Qb1lBY3ZyNldUenhubm9tTzgweXAycEp1YldlbVl5Z1UvUnZqdkF4?=
 =?utf-8?B?RmNITnBGT3ZDMm9ONi80ZTJvU054d1d1ZDNnc1FLMjVWQkErdTFHWWFlZXdk?=
 =?utf-8?B?NEZ0TXFpMVY0NVNwczZGNFNCUjdoTjhjcmk1NU5BQXpBSmFyUDVRdzNGdTha?=
 =?utf-8?B?YU0xamp6aU11UldGRWlTeXhab0V6Wm1Sd2FPM0RQVUY2S1V3czZ6bXVJNXVx?=
 =?utf-8?B?RGJKZi9TbFNId0d3UkR6WTdoVnNDQkJGN2RWaHBXWG1QbDhDTEFkWlVZM01i?=
 =?utf-8?B?ODcrSTNKUUx5U3hCRUFmYXVjcVJRbWhqWU80QTdoMXZxVzIya1BKRk9ZeHZy?=
 =?utf-8?B?Z0xOdTlmSVoyZ29RQmVpTkdQUit0Z0JsTTVsZGNERERDVDVnZzNobVZKUEo3?=
 =?utf-8?B?Mkhwbkk2bXA1QitXRlFITlBnVTVtK21LcDI3ME1JakJNM1YzcTUveXJhcnpk?=
 =?utf-8?B?dmd4eFJ0czdIaUVUd3ltQngyNklOM3VmSUNjOWgvSk56blErT0dVRkNTWkdk?=
 =?utf-8?B?cFRlYmRtNGxUcTRRWHZ5MWoyNVJqVzhBaDVqbmQrQVBuRGE1QkE5RnM0U01v?=
 =?utf-8?B?dGRvbXU1QXRiZlg4dVk4THJ3YklDWVk3S0xGMHhIRzdrQ0htaVFzdzRyTzB0?=
 =?utf-8?B?QlhvRHUxa0N1NXh3YVJZcnJZU3g4YlZmTFhiMFZ4MTlRMFIwVkZ2NlgyTkNR?=
 =?utf-8?B?RDlEQitFeUREWUVERE1KNUVua2VsRlNDVXF1WklnUG9FcFI2M2Q5ekdEQTRS?=
 =?utf-8?B?OGwvZFFSUCtWMXZiTXozTDBWd25XQ0RZRHVDYVBDYnZzOUorbjlRYkI0SC9G?=
 =?utf-8?B?ZGM5eklRemhuelNRbEorcW8vbWgyK3pOU2ExR1BDK2pqNWxNTjFYenkyTnVl?=
 =?utf-8?B?dmxvWEhiWjJiQ2dyRzl5TEg5Z3pha1hGUy9XK1B6cGJBMzl4S01vWHN0MTlN?=
 =?utf-8?B?NWl5UVFVSkNwbndHSzNUb1MzL1h6RVpaMm16NzdKYVZzUG5ieUt5UWhmRGZy?=
 =?utf-8?B?bFo3b3BxZng4eFN0MFE5ZWZzd25xRXE4RDQ4MzZQTk5JNm5TaTF6dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d45430-568b-4e60-34e6-08de8a8f371f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:54:44.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/0FLL0m6MqTWNVXFE4gVga0ysThkLamu0c0wL8uRhnaTqNtCDKhYp6cu8SLpUgIfr3gqOO7D6VoKC30PNoFsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7178
X-purgate-ID: tlsNG-42698a/1774457691-98ABC112-F8D7B9FF/0/0
X-purgate-type: clean
X-purgate-size: 1732
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5964832971A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:26:01PM +0100, Roger Pau Monné wrote:
> On Wed, Mar 25, 2026 at 03:56:05PM +0100, Jan Beulich wrote:
> > On 25.03.2026 11:08, Roger Pau Monne wrote:
> > >  * Disallow XENMEM_decrease_reservation until the domain has finished
> > >    creation would fix the issue of pages being freed while pending scrub,
> > >    but it's not clear there might be other usages that would be problematic,
> > >    as get_page() on non-scrubbed pages would still return success.
> > 
> > I agree this is of concern.
> > 
> > > --- a/xen/common/memory.c
> > > +++ b/xen/common/memory.c
> > > @@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
> > >                              goto out;
> > >                          }
> > >                      }
> > > +
> > > +                    if ( assign_page(page, a->extent_order, d, memflags) )
> > > +                    {
> > > +                        free_domheap_pages(page, a->extent_order);
> > 
> > The pages don't have an owner set yet, so that function will go straight
> > to free_heap_pages(), needlessly passing "true" as last argument. Correct,
> > but (for large pages, which the stashing is about) highly inefficient.
> 
> My bad, I was sure I was using the same freeing function as
> alloc_domheap_pages() on failure to assign, but I clearly wasn't.  I
> will switch to using free_heap_pages().

Coming back to this, I can export free_heap_pages(), but then the call
would also unconditionally have need_scrub == true, as the pages have
been allocated without scrubbing.  So I don't see much benefit of
using free_heap_pages(), the more that it requires making such
function global then.

Thanks, Roger.

