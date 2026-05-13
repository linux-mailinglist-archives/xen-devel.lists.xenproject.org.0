Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G1sAIDMBGrMPAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 21:09:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D192539A09
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 21:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308406.1579855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNEwj-0004yv-N4; Wed, 13 May 2026 19:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308406.1579855; Wed, 13 May 2026 19:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNEwj-0004xc-Jj; Wed, 13 May 2026 19:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1308406;
 Wed, 13 May 2026 19:08:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNEwi-0004xW-DE
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 19:08:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNEwh-00EGvO-Qa
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 21:08:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04cc23-2eae-0a2a0a5409dd-0a2a450983ec-16
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 21:08:39 +0200
Received: from [52.101.43.67]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04cc35-2497-0a2a45090019-34652b43ece5-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 21:08:39 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6197.namprd03.prod.outlook.com (2603:10b6:208:30b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 19:08:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 19:08:34 +0000
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
 b=TKc9Kdr9DVNFC+qHeg3Jbk1AD7v6RGHiYvTwnvUxSBHi9VEWApS5cS/y81/XkmnGShzNEqPGLt1n5an2Wdp/RWDKGEUnfE6QBexAStWy1VgutIx3l3ukG/OVXOdA/0PjaB80aiDLRg9w1spKBD9yvI69PsK5KLZLZlzEoFk7XV7TlBVV9Z53XkmIzX7y4wnd8U28a+cDG0KgcoNLIc7w/670M7ZNPlb8217CqClCvBdDR2DTCBsoIIHDA1tsz3F98IekqbIhSwWmZ7FPJhMt3ld28yC3RxIKntoapet+3smsql1ZNX7QgZJroIsH9dW+drXYJqo/PycKqpEc2O+9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz4vYBXMwChhlORcTPcnmqpu/FXpRscHXrRtQggSTOM=;
 b=xHDSb4sWuCP1z+QvRsMQ/1PHdAD2XorRHsQQO53SQuemcSr4UyZrOX6gQYyuFWX4+R4WU0/7q9ufgCHtgG/lD7Npxd/WqoibTCCjTOH/W4PZ60a+2XA2Ysz4g9LuApBGvXHaUncj7wrNUoO0Z7Tp6ynP9aZMxXpqyNWab8fRtDq73WrpM4lWqt/q659Mb8rkWTjEpujlE5qbvHH+0qdVtzo8Ti2e01kvdPvsrR/ZShCHHXOfTlQuseH0vfxFeRy3rM7n/LsJwubNrh2y8BKFO07zlyYzyA/VSbcufc1iCN965plOYDJpDJaRUrWlVPeAKFhBJdq/Kt1fr9hak2Pseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz4vYBXMwChhlORcTPcnmqpu/FXpRscHXrRtQggSTOM=;
 b=D1JBRtcic080k7ukMuaKxRV2gzEiTV6VFSDINm2Um1fv4tzXb9uf9vRRBuG6YcpAVGeFZCq/hEJo71iGCyYz+z+dd4cCjokBy9X+40mWhKvEb8m4mP9SlenT3RHNQqriLpxPLXJyyToeXVlgimBwRQDb3RojeYWpj1nzLCm9QyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 21:08:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/5] x86/time: move BCD_TO_BIN() uses
Message-ID: <agTMLgTwsKf96IpL@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
 <agQ8tRY3Kya6RasY@macbook.local>
 <d37322ac-fdf9-48bb-91e3-3e8d560fa758@suse.com>
 <agSRm3T0Y3EfuqFb@macbook.local>
 <d70965fe-5039-4a9a-a470-a9d2a0bc6ebe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d70965fe-5039-4a9a-a470-a9d2a0bc6ebe@suse.com>
X-ClientProxiedBy: MR1P264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 776b8db9-2af4-4036-9c4a-08deb1230773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	p01F5VaFxSceWaZEFZQvRanMQZT7BkjKE0VAT0Nq6Y5duXe0MZc8q0D6yJyuAEqQ8xQLFqpkruUlK+e7ecbxbS1sxiGPnSTN0uXictL3LyZFSjlsvOPuYQ04ce4MomFNCQ62nVfyDwTyXsv6/YMdpixpP3jd2hoxFUQVt3iVutgLX60oRcUinxrjkimWYpOFhe7U2/LLwdHNtJditRL9EckbnBATBTzbyqPVZuteJTT1HRvqXBvl8A0c4hPcJcKyr1x1VIXxh4TMiTAtI08wSK+JoG7fofXxju7s8LW1d1cROW7zg/LQeDEwLl+ZniurygYqqSeMTvYQ8yHVZVhXZt4gcJSuPod+QOda7oi5mzHCP+EZ+58d9/jQIEPq14SddkJUcYOGE7OxIkwuZrUAcZSxETiLNZ0vxAdEM6c2xXbmF8hqiPF9WHQNbKIGMmawFUojvNE5mjKUpIRWxTRzSeKcPUeMjvnZHfrzxFQ1clS16cHp5Ul1XN1jrCyNXKDM3uugePm99xIWDVHnVjdKbKDDWh516BxaUEHt2zOBhQCXj93zdKSIy03wICRZbSKa3AR3v6UwU8Pm2RqGBmWe053Eye7dCdZInfOZ5uR0oSKup7etdj08oqBfSsi5LqeBgjxlDyRFPr5rJC2ThEagWvqNaOU/tsbaWbSKx7JQZMW5K+VmoOCM01MlMYyqI+5P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tWTFlaNFhhNno5dTFVQmMwcDBwMkl1YXB4YU1qdTNBM1piQUtNL1R1aVZ3?=
 =?utf-8?B?TW9NN2k3U1hLVFJtY0pKRmVWbkZ0TEluaTM5YkdSTUNKSXdjUFQxSEQxbEln?=
 =?utf-8?B?aW50TXdMSGVsMytNMUUwM3kxc0FtUjBGSEJWNnlhYmtGMG5GZzhRanl2QXM1?=
 =?utf-8?B?VmRSVlozQW0rS1gyeVp6SHVNcmg3aWRibVBBZkMraUd5QmV6dU14MEVmOUhi?=
 =?utf-8?B?VEUrREZnWEtDYTc0ajRvWG5tcmRhUFVob1l2RExRalp6QWR0aElZcTR6Rm5k?=
 =?utf-8?B?QUZMM0Z0TStaK2pOdUJQTDkxN0gxMTEvM2FtM1U0c1gwTTVhVVlwM1ovVVk1?=
 =?utf-8?B?SHI4c2hIMGdrbzJNMHRFUWtLa2F5YVlIdWRhRGRvdjkrY2RGd2F2Q1BXNC9t?=
 =?utf-8?B?dGtGR3kwT1NCZTBjMjBPb1Vxa09TNllJUTFpRXIyQ0FBeGZQUUZQSmFkYUhz?=
 =?utf-8?B?a2ZwWTV2bkpERkxiL2p3dDBFL1ZOMWdleUpxbFBhVzNCYjd3bisrMVB3ZHNn?=
 =?utf-8?B?cmVZVlIzUEhZYVlPUURZL1NDZHBZRmtCc0V6c3p6S2lSMjVxZ09mRHZnWTVy?=
 =?utf-8?B?RVp1ZlJHTXBDWEh2VERsVDR0dVFuT1FsOWxsYWJsWmVDam9zb0tXeHViNHVZ?=
 =?utf-8?B?UGVwQXpkdGMwT2ZIemlFWW50c2JLdlRSUHQyeXVySEYzMVNPSmgwRHZNQ2JT?=
 =?utf-8?B?bC9TUVpEVzR3K0wxdUtWV3hNZGdweUhMYnZqclZCckVQQ3JITUdkTU5mRUZF?=
 =?utf-8?B?RkVvQTdBSnFJWVFMOUxYRGdEMjltdjBLSDRCT0pwMitnTDgxTjZTd3VEU051?=
 =?utf-8?B?ZkNweXJrUXE3WEJYSUhITHdWaWhDT2lDMHl1Z0EwNzNqNXovVnFXeEhXM01N?=
 =?utf-8?B?QXZLd2VEMDZUdTR4cXlpa0g0YVViSzZEaWhnaFBhbkVEdlE2dVZzeUN5cWNT?=
 =?utf-8?B?UE9rR2hsbXVZd0xJZHhEYUNLT25ZcG92eXdRRXAxN0taNU5FZSthSkRlazVt?=
 =?utf-8?B?WTk2MEdzMVNkZEplN05wWkVGWDNpNUtURVgvZG9BOEo0dXFwcnV6S29KWWlr?=
 =?utf-8?B?NmJ1clMzTUJ6aVNpcnV6Y3UxSUczbUZGVHUrNzVhWVAvT1lOMWUxK0hDa3Vj?=
 =?utf-8?B?Q0gwNmJxREZBNG9XY2ppWlp1ZFZXM3JVK2VDM3ZNNmUrSDQrbUVvVFdnR0I5?=
 =?utf-8?B?Z1dzMTNvSmdVNEpNdnpOd2gva2RqRlpBS1huUVpQNytzMWRmWlU3SzJvUDUw?=
 =?utf-8?B?S0xNV2IrWWhmZFM4UUlRVnRxRFNBcmU2TjB4d2ZuaStsTGF0ZTQrZ2V2TjhK?=
 =?utf-8?B?TFNXbHFLOS9SOW9TRzljWGovOWNsb0dyVzNPc1NKbEIvUVd5K3Z1SVQxdVU2?=
 =?utf-8?B?WGM0MUJPeGNMczBUM0gyb3pBRlErY2ttY1A2MEdpUFkveHliRHpwbStqYW5n?=
 =?utf-8?B?ZDFsZTl0MXY5QjJFaGN0NElqQm9VdHpSM2xPVytsYmwrcnBRSGozb3ZwYjRp?=
 =?utf-8?B?Y2FGVkRiaGZoT0RNOWJlaitBMjZTeDZ3Uk50VXZvZ2trYkV4WlJLT1Uxb0Jx?=
 =?utf-8?B?aFpZQzg1N2tJL0hkcTFKRGhzS1FwSE9EMm80MU5tdG5SK1V3a0RicVdBUnhX?=
 =?utf-8?B?SUFYaXFpeW5LSnZHRDZqVGdUL21vcHdpRm5HMnVZTklNdkNnckhvZldzNW5z?=
 =?utf-8?B?TmtqeUg0cXl3SGlZNlZ2clAyVVpST2tmSk1Ndm8xeXB4ZEZJNkc3WEdyNXM3?=
 =?utf-8?B?SU9SUjNMbHBSTVgxZWVhUng4d2Y0RnJ3dzhOWEd2eGpqbEw1OGFPNlM3VEpW?=
 =?utf-8?B?UGNKQTV2djA1RUM4SkllemJySUpzNnRnNVdnNnVVRnh5WnViZWZudnE5emlI?=
 =?utf-8?B?ZHRSaTNmNEZIbFpNWm5DcytUTkJhMldWY2VZKzFKcGlqaWwyc3ErQ3lCRDFL?=
 =?utf-8?B?WDVtNDI5bDR0OCtCVlI5cHFmVmpEZ3ZQTDZGYXcra2tvcCt2N3RVNEYxbmZS?=
 =?utf-8?B?RmpzQU1rb0RCNVRINTBndmRnSCs4UkVQVnJtVzJTclZ0UlBMUlBONEJMeXBB?=
 =?utf-8?B?ZzFuNXNSOGsyMW44TmFrSmFGZmxtTFI5SGZDTk1kWFZocWxMc1RsVit6SnJ3?=
 =?utf-8?B?VEY1UUpzcFR2WXg0RkFZcUZlZWw4Q2hOektSWFpEMEp3U2tLMlc1cTB2Z3gr?=
 =?utf-8?B?NVhkM3RKUm5INFdHay9qREI0eGV5dU9LOUdTV3NITGtDeVpLYTFOVHFuUm15?=
 =?utf-8?B?WTIyZ1lBcHVzV1hEbjZIR1ZKTG1VNVBwTGZzQVFMejN0eHRma0JSNGY1K3hr?=
 =?utf-8?B?YmxBbE56SnpQa0E2M3pIdFhQaXNxbkE2V2VrSE1Jd1hQY2RDT0N1Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776b8db9-2af4-4036-9c4a-08deb1230773
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 19:08:34.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3Vy8S5BWdknRYZLk59j+lDKD/DzfDAV0sP96w03h3/2GybxjmLQIIHk5pynQhpr0v9rKrnSiElibCW5Np9D/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6197
X-purgate-ID: tlsNG-bad1c0/1778699319-43374A53-AF92DEC5/0/0
X-purgate-type: clean
X-purgate-size: 2519
X-Rspamd-Queue-Id: 5D192539A09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:15:41PM +0200, Jan Beulich wrote:
> On 13.05.2026 16:58, Roger Pau Monné wrote:
> > On Wed, May 13, 2026 at 12:39:46PM +0200, Jan Beulich wrote:
> >> On 13.05.2026 10:56, Roger Pau Monné wrote:
> >>> On Tue, May 12, 2026 at 04:59:03PM +0200, Jan Beulich wrote:
> >>>> ---
> >>>> How come RTC_ALWAYS_BCD is compile-time constant 1? And then even with an
> >>>> inverted comment? Looks like we've inherited this from Linux, and even in
> >>>> Linus'es current tree it's still this same way. Yet all half-way recent
> >>>> chipsets I'm aware of properly implement the DM bit in reg B. Might this
> >>>> be another 32-bit leftover?
> >>>
> >>> *shrugs* I don't know.  Seems like Linux is still doing it, so it's
> >>> likely safer for us to continue doing it also?  We had no reports of
> >>> it being problematic, albeit one could argue it would be best to
> >>> prevent such reports by doing the right thing.
> >>
> >> That's my point. If we did this as specified, we'd unbreak systems with the
> >> DM bit set correctly, but we'd break (hypothetical) systems with it bogusly
> >> set. Like with a few other fixes, perhaps we should correct it, but provide
> >> a command line option to restore old behavior?
> > 
> > Possibly, but I would do after 4.22 has branched, just in case.
> 
> Of course.
> 
> > One thing I've noticed, is that Xen don't attempts to set
> > RTC_DM_BINARY in REG_B, shouldn't it try to set the bit when probing
> > for the CMOS?  Since it assumes BCD mode it should at least try to set
> > it?
> 
> For one - don't you mean "clear it"? But then - no, that bit is purely
> informational aiui. Changing it won't alter what the date/time registers
> hold (only how they're updated). Hence by fiddling with it we'd corrupt
> information (breaking OSes which properly respect the bit).

Yes, sorry, clear it.  The (possibly very outdated) specification I
have contains:

DM – The data mode (DM) bit indicates whether time
and calendar updates are to use binary or BCD formats. The
DM bit is written by the processor program and maybe read
by the program, but is not modified by any internal functions
or RESET. A "1" in DM signifies binary data, while a "0" in
DM specifies binary-coded-decimal (BCD) data.

To me the "DM bit is written by the processor program" reads as if it
could be set by the OS, but maybe that just means the bit is writable,
but it doesn't affect the format of the field really.

Thanks, Roger.

