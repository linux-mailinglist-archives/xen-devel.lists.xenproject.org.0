Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJc7GtGBHmo3kAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:10:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C656295F1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324493.1590038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJG9-0004Xy-C3; Tue, 02 Jun 2026 07:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324493.1590038; Tue, 02 Jun 2026 07:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJG9-0004Vs-8w; Tue, 02 Jun 2026 07:09:57 +0000
Received: by outflank-mailman (input) for mailman id 1324493;
 Tue, 02 Jun 2026 07:09:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUJG8-0004Vm-95
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:09:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUJG7-001ylw-Ly
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:09:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e81c0-e002-0a2a0a5209dd-0a2a4506e8d8-12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:09:55 +0200
Received: from [52.101.43.48]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e81c0-7371-0a2a45060019-34652b303279-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:09:54 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6522.namprd03.prod.outlook.com (2603:10b6:303:125::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Tue, 2 Jun 2026
 07:09:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 07:09:50 +0000
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
 b=rklgMrdFLBEa8WMCtjA/CorMu9VoCZsOl5zO4r66l6CPPA612iF9PFQM91wTqNRTxT/OGWOLXAnv3STptM+ZxdvE4g6YEHnLInvsvLXrk8WyM00a1MsaUfUvdFYObo4k4ZZb849CUq7wY3bfK46sWXfXJHl0H83JUXj2m8O1CrxpKQkzbYFmj0eiuDFZ/j8aPAUH4rafl9mYN65Z6Z2vegWU9Nwa3Kbudl1Qcya48YX9FDlk1Ly0SB4GqXUg9NpE3UYakYZafa17mwG+mW3USGEuxiwS54u5e5qlKa7Qa5V1zuv3OyRLUSCD+154itZlXLqHf91HDqfP4PLYpWemBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzBOkVaS5wdUjfIL1Ju9DNol10hvtzZYhFiphFE6mlc=;
 b=SKQc2jSypIyqqydWm1wwwGpoUWdchivX6Xyb7vj00Lhnkkors9utS7KsEa8oTBjSCWXcddal+rseh/Ho6oY9Yf8qVtFm9cxxUyMa8uQoIP30v4DY6TQe1tX1hrCwBmzQpuPaTXKSDGVC8sg/ermV+fpdZikp1nZ86CCsPRBdqOJ8lAtqfglYpcYPnyWW4jyGajAAnHhEbE0E/whMpIlLHsXi7DBl9PY7QU+S7/LF4Kgb1cfhE5H5WcfxltZYPsYhP4aU18zBDXInO4lQpwKyZVcQ3d8hxSxnRZM0NReu2y2I3JxkFnm/pIhYd+SS24CLJtEuepLbea8uDNaMC2KpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzBOkVaS5wdUjfIL1Ju9DNol10hvtzZYhFiphFE6mlc=;
 b=ZlDFRQ2ZBS5bCBwtFZlxpizS5TzndapDeNihBUzulTZ1hoGxEYjcaveT6pvEbJOnZNDAQ+6BpFXb1mVNmz0uLOlUqbJyhqk6srlR1ZDx00BpiMm8ef9cCWkQv2sFdLdictTFF8KrI7KFTPoCH4dVmHms/KwiXPxYA+8ba5qelhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 Jun 2026 09:09:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/2] ns16550: add support for ASIX AX99100 PCIe
 Multi-I/O controller
Message-ID: <ah6Bu_gxwrZ9GzCF@macbook.local>
References: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
 <20260602053421.773149-3-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602053421.773149-3-Zhao.Jiaqing@amd.com>
X-ClientProxiedBy: MA3P292CA0034.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a9dc87-c506-418e-7278-08dec075f015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oRLZvalio+AuXHo83Q7Gm/hMe+YTKm+jAxwqtmaaKH+EyqiISutfrKPdkWLB0kLuxGGJE8/fiQTTOILoe6GiYhf8/aO2r1gnYNh34GedRl8Dulmm3P5bvuRrgfxRTyODhwhtlY3rTd+E0YibqfEzjMKbYYLOHAGW8ADvVKdsPa8hhipPMyp6GnNLMqyf77EijZ5tYn4Dry8ur0tlzOmAaDSM9ePwoZgB1ubmtcsqXcYUzKPizWfy6BWrGJVDa89thk1mK+EKFBlUeg4qXl8KJA7L5y0PThEj+EtwW20GUVqbrLlCDPpWCHWuk67e/AD57pfeWcz162/GBYRk76F9qvg5omi5Sc1jzQs/wfDs18ylEvBCm0bYfVE4t5XWE0ulaUQV1goXBSewqymClHZ4kL1mD/hy5Ug6cRGDiymPiYpbq8tY8TGQ5alUg4MoU5IRjwkTPZddpnFjgnpNF7y6cu8x2CD9TKoLKqMLEbwaQZBaDRsjzzA/KDNLkKQRzV/AOTL/e8yw2dbKOMrObe+6tMFLWlI13yOIGzM573oVVm6DCk5XQ63m1ArZyFSJ6Xaz8cJXTeXp3dmY67HecatO9dVCppado/ntACum+BafA2nc+fI8s0yMd38pTfjn5EHiMzngteeEqOGattCUhJu0zX+OOuSBywgB4ioZgmxkqegMd4R4Dd2LvK3gZgONYhz6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDl3Y1orWWxyUUNkVy9sVTd1TGsyZEl3T0FaNklrU0NvV1dDa1FpMnBtL0I5?=
 =?utf-8?B?TS9SVG1ZVUZxOXc1alJCd29CRU5DN3BVU09CNXpGTysyVElxYnMxWktqbEZm?=
 =?utf-8?B?SWIxaU5rYkY4N0RZT0x3aElqejk0UnVYeHI3RlZnQUdPRTg4YnhaTm1hL0dX?=
 =?utf-8?B?bUJsT2tGT2VXc0k1SlRjRWgvcjlPK2pmenNIc3BtRUNsUXpZWlBxMVhEUEYy?=
 =?utf-8?B?ejRiemVwRnhKbWN4Vnh1NTBJUTR1MmtDbXZSd3FNbHRDZ2xHbTlYK1k5SE1L?=
 =?utf-8?B?THpZNXhZY1VjakROQ3QwQTZ0aXdOY0RwVEExVkVRL2VqckFreTdydGVYQUFC?=
 =?utf-8?B?aHRIN2V4SERXNGtISjRyN2thcVNwcnVXNVlPaEp2M1Rmc3VxN29zampEN2M2?=
 =?utf-8?B?V0tjM0JQd0dIdVEvbDBHRzEzdno0VVpjanpFS05yRTBHcGk3aVZRK2dmeHNS?=
 =?utf-8?B?b3JUTFBuZUpGcnh6QWMrNnFWN0d5UDA0ZzlPNWRxekhUanM3VjNmS1gvYXFm?=
 =?utf-8?B?ODNSN1pMelV0VCtlRFhFZ2ZLR3JSdHZzVmZGRXJzVFd4aVkwZDFUS2dkSkd1?=
 =?utf-8?B?dThveC9GV0Iyd2N6L0k3QStTcTFYTFFHNmorZ3ZxMWU5dllzOGdPYlZQU1lC?=
 =?utf-8?B?UmYzUmFHOHJlaGZaYnluS0lIbm5BOU9NUEFGNXBkTWpaM3JXaFFpMTFvMWFu?=
 =?utf-8?B?SHpFd01xZ0NaRHEzcW84RFdWdVJuTms4b09QRTRyTEdhRzQzeXRZQ252bDlL?=
 =?utf-8?B?d3pNemJsZ3BOc1VmTWxwTnRnaXdjd096YW5mRmdzRjBkOFZ2Qk51cFlLRHVh?=
 =?utf-8?B?S0s5TFI0WlpmU3U4NWNvRDVCRDFTMEorOXNyeXVYUE1GdmRCTmQ4QjFISkJt?=
 =?utf-8?B?a2JyWktQS2hCNnBqU3NLbDRqaTFDR0ZoWHdpMFNxQWJkblUvaVk2TlFxQ0F2?=
 =?utf-8?B?UGdJT3ZBMzllVjZ2bWtOeUVoUDd5OGhncVpuUXM1eFlva29tNEZwT3c5VWhX?=
 =?utf-8?B?NjFKRWdnMExwaXJNT25OS1E3cCtQNkU2aXl4SFJRSXFUSFBKbWMyREE5Rzcv?=
 =?utf-8?B?eVZGbmtyaVJTQVJvT0VydHpZOHF2MmpGMmR2ZFJYWVpCaFN1eWZ2TXc4cW5B?=
 =?utf-8?B?MFhOL1d2MkRKanRPK0FuODBaUlZtWEkrUXM3VTNQVUlxRTVnY2F5Y3JGemE0?=
 =?utf-8?B?dkRMaHRQTjZEU2g1cjFndGFrQnFHMkhzM3ZkdHQ4Vkl2TVJONWk0WHJTWTk1?=
 =?utf-8?B?bnBTUHhsSEZBdEs3bDF4aERNNHZKN09ZeFY2ektHTG0zWndPOWx1dzhvcDhF?=
 =?utf-8?B?bHN2bHVXNVE5TnFmN3VrMDVIVTdab2dYZmpVUXNObGlDM21xNlU5Q1pkbkYy?=
 =?utf-8?B?NmJsdHBWMFNhZDNGcjFNWk8vYzEwbEM4WUJqKzB0V3pmOUlZck43WVUwZHpm?=
 =?utf-8?B?UTlHdTZId1hlN0FCV3BGcXB0YXp5U2d4K25BWEJjVXNhemE1aVNwZE5VM2V5?=
 =?utf-8?B?RnVma1VmaFZMbjJoU1oyYXc4SFFyR3A1U25Nd2JSeTVXeVdDTWRJTVNLVyt5?=
 =?utf-8?B?Sm1aNjFPUXovcjF4QXBjNGc4VVMxTXBKWU1Qd1U1UFppekhBaFFCUlNOSXBR?=
 =?utf-8?B?NkhlaWtXaWgwVmd4QjM4cTkxck1FMkNySm9iaUVXdWhJY0hsSG9mWVBHOXhq?=
 =?utf-8?B?eVZDOXA5em9Lbi8zVnppSkxwbW50TERhaVQ0ek1wQy9LcFhiSFBZTjNnbis1?=
 =?utf-8?B?L1MvVlkzRTdnRTJLOG1VUzNSYzZiY3lLQmVrZDgzbWdRWks3bDRFZGxsTXEr?=
 =?utf-8?B?czBVWFNNY1l0dDBxeVpBanY3YW1jMFV3UVNTaU80VEZJbnYwZlMvejhTN21J?=
 =?utf-8?B?SEF6WGxWUnJVa3pVK1VLUVRGVElGMDNQU2ZWQlliWFNPMkFMbDBldys1MDlD?=
 =?utf-8?B?M1l6K2xtY05XaEhBOE5xZ0dZLzdlZlVBVmpQb3g5bUhrdmZRbW5GUnA4UW5H?=
 =?utf-8?B?emNieUk3bE5kdENaNWN1UisxQ0JxQUhMZkhBRnBSNmlKYk5mR3FBNnhCZWxa?=
 =?utf-8?B?NFNISitRRkh2VVljb0lPd2lwSS9aT01CL1ZrdEEyU2NPT1I3VmxPTjUrUGtz?=
 =?utf-8?B?OVR3U3hjMFI1TFZFYkZHbWxuU2VzVDNKSFIyMlltNEgxZ0pmT1lKUEVwaUxF?=
 =?utf-8?B?bDNNZXI0RjM2WURtaUswUThLWVBRVFBpcmg5di9TZDFsWXgyTnZCYzJ3NWFp?=
 =?utf-8?B?Q29OU0w4MEJmNDdMZlNwL2E0Tm00QmVTb28wZll2VjQ5ZFJLeGpneWQxazl6?=
 =?utf-8?B?RmxXc1NKY2NxZ3N5S21ociswcVZVbUs5Tk1IOWVXOFU1b1libEpjZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a9dc87-c506-418e-7278-08dec075f015
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:09:50.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt+cuVYSlkMWdpsm/lcexhdPKb0YV8qd7jHO/hUOxMyrio0MMcqKpw8cN3pV0sS13yPI+ULoTge8etDt+hnbsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6522
X-purgate-ID: tlsNG-16d1c6/1780384195-8FD7AD75-79004E56/0/0
X-purgate-type: clean
X-purgate-size: 1388
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 26C656295F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jun 02, 2026 at 01:34:21PM +0800, Jiaqing Zhao wrote:
> Add a PCI device table entry and matching parameter for the ASIX
> AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
> chip is a standalone PCI function, with UART registers on its I/O
> BAR0.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/drivers/char/ns16550.c | 15 +++++++++++++++
>  xen/include/xen/pci_ids.h  |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index cf10a06a3d..26503070dc 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -96,6 +96,7 @@ struct ns16550_config {
>          param_exar_xr17v358,
>          param_intel_lpss,
>          param_wch_ch382,
> +        param_asix,
>      } param;
>  };
>  
> @@ -872,6 +873,14 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .bar0 = 1,
>          .max_ports = 2,
>      },
> +    [param_asix] = {
> +        .base_baud = 115200,
> +        .reg_width = 1,
> +        .fifo_size = 256,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,

Same comment about using 1 instead of true, the rest seem reasonable:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

