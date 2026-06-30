Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zGyaNRuFQ2rWZwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:58:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503F6E1D91
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:58:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=HSU3rAUc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348544.1606279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUHq-0006OJ-RJ; Tue, 30 Jun 2026 08:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348544.1606279; Tue, 30 Jun 2026 08:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUHq-0006MA-Ny; Tue, 30 Jun 2026 08:57:46 +0000
Received: by outflank-mailman (input) for mailman id 1348544;
 Tue, 30 Jun 2026 08:57:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weUHo-0006M4-Oq
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:57:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUHo-007CeU-1a
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:57:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a438505-5cb7-0a2a0a5109dd-0a2a4509d202-6
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:57:43 +0200
Received: from [52.101.61.30]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a438505-97e6-0a2a45090019-34653d1eef93-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:57:43 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB5471.namprd03.prod.outlook.com (2603:10b6:a03:284::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:57:39 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 08:57:39 +0000
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
 b=X6quaLiGB5GS6+ssFzD+mnbydKoZX2jeRgeFKKKNzIXGvyNUfD4bUWL/ElPN71QaMe4kwwbqq2i6O76zhCpkhzEqRZMvMeMnKYOOYlDiMw3zhhJc5i+sWoOUbsMw3EDMnhfUVVEgCPadTQek0ZEmv3DfgkUX3uWPIkFbArMqKPxGTZEk6+35rRX+TvVT9MWOI1JoZb9V2ymCY58VRVe4UiMyanr59rlOEIFhuY7p/soHzXcIB4GJrxVbsXydo9gfEuXjhgdAFTGLfU0MfmEMCXq9PPd0OrCDBc71TakxRw4hC5lR7s0SiaVsKhKquYldiruHxLxW9FwlGpkbKk1M2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP1+YY1cfzwctvHSp7uXVkXoCiwCr6GeG7KjdKwJ5wI=;
 b=QnqNW3Kf9eq7YbNEDjMeC7ZV78dHgYZF4eFz3wjlW+qgGB2MxqQbwUuDadt7w7UvuvYMhyKWe+Po5SWRJJyJNXHBXFRql4OSE1l6R/2hzhyf1n+8DfGuBfxhagGhUu7dEvGcgholNbqMr29mYcDzx7xoH6n4pqMwS9q6eacA3SsAvSAxqV5UwEbJtRpZKGTW01PW459Mz3Jz3xaIRNMSuqJvhitZxjWBNVCXij7vdpJL5MRBD0bzPs/GEtxtZbYb/QscTJS/Pgsmpp1vDq/q2EiNjQToMFwSY1u7Q8HRp+kHxXdps/wRcZwJyAcvTC1fKBApivGZoOQAqSA3h/GXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP1+YY1cfzwctvHSp7uXVkXoCiwCr6GeG7KjdKwJ5wI=;
 b=HSU3rAUcKhZufaOQMDh4B8vt9w6iCAhVeCEHHVeR5hH20h/dr72OlU70CyKd0Flx9AM+72ts9Vr7xeqdOQWdYJ2tlwoD2P9QOl5ypj45mVY7Go6Zaj1K43To07P9VIHY6s9gOfVrR4BKYyrV+wPWZlUNSHDYxrfYCYHMwSh/BV8=
Message-ID: <fe2a6a17-9742-4387-9664-271934f93ab4@citrix.com>
Date: Tue, 30 Jun 2026 09:57:35 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/18] PCI SBDF Refactoring
To: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
 <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
 <1782809635.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1782809635.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: f02d306d-59aa-4afa-7251-08ded685a35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Ta0TrhtPtXCOb6VnE3tAQW1Z7HJicgbmfDwMGqN0kdBS4pZTh/I/IDcCf3pRSoE1xZ3c3XDFkLtimffuBggVTgNxL1D80cOu48EgZvX3ardpAQGKXt8xuabSSXz5UE83NuxzWfhL5/JRYOt0ReN0VmVuXRnEBeneQVv/e63DwiR+2J9t+DG4Sl+89BoN1P9fyQ6FBPUn0JVxGdvbLq4Zzw2PpLlSfVDIra8g/gVIYFpqrFxMUlSovSd5UwuoZPR4G1uIGJrYKZ5jJmDFioJiZked4v6AXuaOhumYZzDOVLtq656HMQhL1qgmmYnZfCVV4uy2IEQzZ8lVVlbPll9tO3q98GGdtZpqjxedCZYS/GpL48kIis4tS5xM5Y+lUzUw7RaxCoMABWXitrksEYbATK9XVkBaXiL7M/5p8bjrDz4GBEBeLbyugtNW3N+1Kds645bQQxCScjbei0O8rAZUcWWCU31Z44WUetHz0N06sySioRgchXZw/tGdDseVKBcag+yLuctpwxM/56oxf9YEZYC63vz2IAXBCUKqFtWEgTk0ViQogwsx71SpdDJz/aEF2PyVQ4Hwl2LIAfzolGdAcZbO5qSnT5zRpxHQy8XvwAfXS5oyKb5gcY3XOC7UX46w7m6ak2XZsCTLzf+6wdDprY6HbLclPZNGLGTp150vZ9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU9Wb1FZeGloN092cFBDVGdUMGpoZkxlaC8zNGxVWDBQdnMvU09kV3B4S1h6?=
 =?utf-8?B?OEpQOWFrV3hjZEphbXBWVk1MTnh3RGhmWG81Q0lmcHFzWGdreU5URW0xQmI4?=
 =?utf-8?B?TlJ1aVFobDFJUGp6NmZmcE9UQ3A5Z2JlVVdFOGRFdzhnZTRHR3hCTysxYkxQ?=
 =?utf-8?B?VkZpdEhPampZU0U4Y28rQzVtQVdWTThPUEJ2eFdYbEVPaWhNSUJTVldLdnVx?=
 =?utf-8?B?RmUyb0hlaGtsL2pCNEhiWlVtTE1YbXdjWUFKUy9GYUdUbWJDdkQrdVNVWVlG?=
 =?utf-8?B?R3g4NGtJKzVzRm04eXhCUkh5ZUVneGdvSmdIR2RUcjBISnl4NjRuZXVJeEZs?=
 =?utf-8?B?YlVoZmZjSkVLMnk3ZFZnSUk3TVdOTjFqRjQvbXJzVzhKeEJUOGlGRXNrbkl4?=
 =?utf-8?B?ZXlhY2pYT3M3VTZsNW1ybW1hSmZXVmlVMUdSY3hOUlkvU1BUSFk0Y2RKQXda?=
 =?utf-8?B?cGVpNVJGSkZjMlZ4cFJuU25uOFlUZTcvSVViK2gwTFd5TFFCNVZjUVJ4Qlo0?=
 =?utf-8?B?bFJxdG4vd0R4cmUxSHp5a0RpVWdQUDhvelVUZ2svMHZ3L2xEL05QaC9sMVlZ?=
 =?utf-8?B?LzN5anNYUzQwZ1ZRUFlVemZpWndQbUR0MTJGd0NJUm5OWVNrTld1M3V5Snlz?=
 =?utf-8?B?MitLN0J3RU5HT0R4Umpqd0NvNVQ1d2RuMDRmS1NzMzMzeS9wN2k1c3lGamN1?=
 =?utf-8?B?TCtrenB0OEVCSGxFTm9lUktsNVhscXZyMlRxeDFQUlVUVE5PN2pBTVU3WXdK?=
 =?utf-8?B?TlYxZVBNTWI4SkJYUDJ3WU5XMG5GYkNCWjlSTzNmL2hMV0RscjJHZFZzN3RI?=
 =?utf-8?B?VmNhcHdOcmwyV05OeU1oNzI4NUUzM0JLNDREcWxpZjNEUHFYb3R4V0hseFg1?=
 =?utf-8?B?V1FZZWNFQ0dlWTc0dlh0ZUNLRTl6UGhRTGg0bUhaTS84T0svWHZlODhQN2Zz?=
 =?utf-8?B?OTNPZ041RDd1MUxhc2pCL05GaTFKMFZPQzh5TGNlRkN1aGt1c2JCWjl4VndW?=
 =?utf-8?B?bHFxWWFuRGp3Tkk5SUpXZVc3aGJCTzNVbTRuWWJNTWRRc0J1aW1lV3J6Tk1Q?=
 =?utf-8?B?ckU0NDZJeHkwVHp4eEFSNjlPSlBTODRGZVlzeU1OS01Qbm5JMnc1SjhoSVBM?=
 =?utf-8?B?eVdOL3Nua0l0T0M2dHNDRW5kRHoraUhHZnBRcnM4c0RFajRaTytDWlZHN2lC?=
 =?utf-8?B?Y3pzM3B1alVQMElhd3BVeWxWK3VoY0NrdnM2RGNpUW5BKzFpajFtcGxSNEp2?=
 =?utf-8?B?WkxsaU5HOVlqUEpTQ1U3NWhhVENmYUhETkNiSjZrNE1OL3ByQzhUaDJ2cC9J?=
 =?utf-8?B?WFlrYVBWM2VZVS96dUNOK3NQd09mNWZqY3VaUXpyVzA5dDNFZTJzN1RoTkgx?=
 =?utf-8?B?TXJJYzkxYkFwUFlwNEVDb1RtaTM3a1grRXpXT2c5V2hSTmRuZGJlTFlmc1I5?=
 =?utf-8?B?R1o3a2J4eUR6K05rcjZHWE0wMDBQU2VPM2RITnVQRWpzWi9FdlVrd0FQSVNU?=
 =?utf-8?B?UDdEbm9ScU5kTmNUNC9HZ0plYnc1dFRjbW9QWjNTcnhhbUdOVURJcWtscG5B?=
 =?utf-8?B?RHNEa2s1eVZDUkFEcHV6ZG1aZDlBRVpBcnFsaUtxemplMkk4M3VJSmlBZlZF?=
 =?utf-8?B?aVZ6M2ZIVnZxY2hqYkMrNTV3aGQrMERWN3U1VUZlZE5MZ1VTSUd0bHJHUS9S?=
 =?utf-8?B?L2p2Rmcxd21aR1pGbmpmS2RhYzZQeFBnQkhsVEhEaTRjTEtCZWJXQnpjeG1E?=
 =?utf-8?B?UlNBN2FXekVSajVpWlBCajZONXVrMHMwdkxHL0FPYXZ4bXhEaDMzY3dQOHp5?=
 =?utf-8?B?dEIwZFdjVnU5bkZjM0FJeUVaclE0UjB6emVLMFVTTzZHNzV6NGhQcmJhZm55?=
 =?utf-8?B?b2hrVHUvRXB4ZjB2STE5RWFEQTkrS2lIWnd2Q01OTGxXMEthbUEyaTd5ejlS?=
 =?utf-8?B?OEVwRVA3eU9Lb2xwUHoyTGFiZnFmZDkzN0RLa3lZbzM1cHpHd2d1Y1lVUkQr?=
 =?utf-8?B?eXE0YjlZNnFmSDhDaEUwSTRoOHZ0bGxXc3ZKM01FVlFuK3RNR2NaNnBsaU5u?=
 =?utf-8?B?ZFA3SXliVjRVRmFUYThYMFM2S1FaaVhiTk1ZeU92VG91R2ErU2Riek15VVNK?=
 =?utf-8?B?NGl2T3NhazRSeVB5U0ZPWFpGell4b1JvdkFtUm9sWFMzelZuSUVkeDFkTjk3?=
 =?utf-8?B?L0sxbVlTZmNueTJvdXh2ZTZMNHFSVVhCYmZtdDZ1YXlEdkM2U1l6KzZkY0ZB?=
 =?utf-8?B?dUk3bFRJam04L1E5Q3hOSEsyL29xS2xNNWZpTVlGL1dDVUs1Y3N2ZkNpOHda?=
 =?utf-8?B?bWZjdzQrSHBpZlBnY29scTFPd3p1TU9NSHFNdEwxVlJrMW5kWjVwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02d306d-59aa-4afa-7251-08ded685a35e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:57:39.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRdP+xrjVr9alr5qrVHczsl2nYR+dJxL8EfrPgNV2Fbts506XnNbRMiJtuXBAbyWl16xa/0JIhbNRcqE9yOSMgwO8mWyAPsA/ONe/gHHWAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5471
X-purgate-ID: tlsNG-bad1c0/1782809863-47B33986-4EA4255F/0/0
X-purgate-type: clean
X-purgate-size: 1919
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.82 / 15.00];
	SEM_URIBL_FRESH15(3.00)[ioapic.info:url];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[citrix.com:s=selector1];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[citrix.com,reject];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_ALLOW(0.00)[microsoft.com:s=arcselector10001:i=1];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2503F6E1D91

On 30/06/2026 9:53 am, Teddy Astie wrote:
> Le 30/06/2026 à 08:12, Jan Beulich a écrit :
>> On 29.06.2026 19:21, Teddy Astie wrote:
>>> Teddy Astie (18):
>>>    pci: Use pci_sbdf_t in pci_device_detect()
>>>    pci: Use pci_sbdf_t in pci_add_device()
>>>    pci: Use pci_sbdf_t in pci_prepare_msix()
>>>    pci: Use pci_sbdf_t in pci_remove_device()
>>>    pci: Use pci_sbdf_t in pci_ro_device()
>>>    pci: Use pci_sbdf_t in pci_hide_device()
>>>    pci: Use pci_sbdf_t pci_check_disable_device()
>>>    pci: Introduce parse_pci_sbdf{_seg}()
>>>    amd/iommu: Parse into pci_sbdf_t directly
>>>    vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
>>>    drivers/char/xhci: Parse into pci_sbdf_t directly
>>>    ns16550: Parse into pci_sbdf_t directly
>>>    vtd: Rename acpi_ioapic_unit.ioapic.info to acpi_ioapic_unit.bdf
>>>    pci: Use pci_sbdf_t in _scan_pci_devices
>>>    pci: Allow ommiting func when parsing with parse_pci_sbdf()
>>>    ehci-dbgp: Use pci_sbdf_t instead of (bus, slot, func)
>>>    pci: Drop parse_pci_split{_seg}()
>>>    RFC: docs: Document support for PCI segment in dbgp and comN
>>> parameter
>>
>> Just to mention that your patches still arrive in an odd way (same as
>> v2). In
>> my inbox, the cover letter is isolated while the patches themselves
>> show as a
>> thread. On
>> https://lists.xen.org/archives/html/xen-devel/2026-06/threads.html
>> it's even worse - all patches show up individually.
>>
>> Jan
>>
>
> We're aware of that, and hopefully trying to get it fixed on our side,
> but it doesn't seem that easy. Otherwise, I will eventually try some
> workarounds if the situation doesn't improve.

How are you sending the series?  Your old double-delivery problem (now
fixed) I can see being the intermediate infrastructure, but I don't see
how that would apply to this kind of issue.

~Andrew

