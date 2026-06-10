Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKHcG9ASKWrjPwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 09:31:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA75666A86
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 09:31:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=LqbqEyW3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334009.1597120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXDP7-0008Kj-4v; Wed, 10 Jun 2026 07:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334009.1597120; Wed, 10 Jun 2026 07:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXDP7-0008IW-1K; Wed, 10 Jun 2026 07:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1334009;
 Wed, 10 Jun 2026 07:31:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXDP5-0008IQ-Gz
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:31:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXDP4-00AWd5-Gs
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:31:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2912b8-2eae-0a2a0a5409dd-0a2a4505b698-22
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 09:31:10 +0200
Received: from [52.101.56.47]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2912bc-aaa8-0a2a45050019-3465382fb4df-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 09:31:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5583.namprd03.prod.outlook.com (2603:10b6:a03:28e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 07:31:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 07:31:06 +0000
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
 b=Um64GGzMUSASEAcjCGMW5bj04+pto7PpyFIrbZe9eQOFfQy0+SSeBGXeIEwk6WQelU32lMr/pev/T4GcyQ02VZp/3z8nRF2MXuvrabtDQ/UQeDjcCrvapwZyj1IqP2gFz61SgU6sEnQA692A7ADnoRho5E8eHPhxQRvUz6fKthcUCsWsbWACybyXcYVee7DkbRPBECB8vYvFyyYXXWK9GF7d02HwJ8uDdQy7AdgcdOP4TTR16l3N2+N7Z3mNhpiww2Jo5/CrMqbB9WeDlx7Gi3H/cyuq3n5EU4iYyE9Yjv5yCJzIaT561Il9sYC1+IwN4gPFhUt3x7Nf6x1dbT/IIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qCusDfXLPo6FSyos7dqcr8VokFVlL3Z45lxOvArRpg=;
 b=tHskxp83NfPYuu8ui5jiugXA2i/gLFebwpT9fiWUMqMkjI9odB3xSD8fDaAfPKCHX51xb+1UvA8NfqYFQ3O6LazLoLFc/AoCGMAWNNMn+8v/Wb26QpQYk4YGz+rHDBENLtHSngTYQsHDyjUMb7XZS375bX0BLTHSIdOd7FbqzAvdGxCT7joy6Rzg3LgzOUcdBky0I1BAImr5sJlERIlKeE02kqrdPa/bvZStLRr7vAFDrbtJ9Ed2m4NAtOtvnu2ynZcpfnhKJePo9uPuZvpoW5wbRaL/+YT9q+1Lz7nsT0ypdw2Vh27mrt9gIK/sYUKmKGKct8qYOCUAcqRYZYVGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qCusDfXLPo6FSyos7dqcr8VokFVlL3Z45lxOvArRpg=;
 b=LqbqEyW3fYeQ3cSI9tHy/3Qhp8DaakZ3Mg+JnrumdDiXKbSFZKyj+T6d5lRePVY0tO0d7J+3GKwTwuNcKtOZGraolffRMfoZcXAbx8v0/Yo4mAsxx5qllGnCXZIQbMyC98tfDfqs21tPq6yTscidZE5tpT7WAu+r6FDN61/tN6Y=
Date: Wed, 10 Jun 2026 09:31:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
Message-ID: <aikSt8UeUvOFWtUw@macbook.local>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: BN9PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:408:fc::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: cece9693-2bf8-41bf-d369-08dec6c23b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	NiCsZnjw+TnGhnT+ZmHanamU9y8eMZWG4xueXRl/ouB/yvGOncp/piB5Vuv5lPCuKVZV96aVxN3ppbeM3dqp3hRa83UIV0yhCBCYAFQba4p9EWO6NGD6QNRsBGBHUyYWRhZLXDFtEksoeua1Ht5vatIKAj1xW0qz8y2Af/FnE/b8Lu74CtLuYuw2aXw9tdmFyn1HrZBh/nGYmvSBkp0SKiUYyeje3svZABuOH3UJ2LVgDE8DopN0sryShafEdy2IVIEX7u88UA5Scy/fVJrV1VrlOWaz6VNFNuZ32bP0R23nUjPD4g4MHn7zavk2tg6mdsGAZSJ3jRrhs3U4ErXZm7JzylCff6dLlXMu9Mi9NByqlo9CdzhRVD80uKR9T1XnkPFFtxLl3lTAZ84eXoxmSCf36hFGRztBRiGxDZN+5zGLNXF9AwjzyBCaXutEZT9WfAwRdcEvuVvcunIJaC7sOgeBNs6/Ki0MwMsfgdqAbDS6HlvDekpiNsbsDs6X4S7ItcLGylvUaOjDPjhzQIpXsGyNagM60zSzubOO6nWCvRn0Hqm408uD8ZXjHEvcuzyxNby5y0WQH4tWBCYpZDKWw+/nB3EaMUrndqmH/kncd15r+fqQOlleDjPNFeKWZaFT+Z5etJCkeVQv4snOkBwNFgkBnYal1iaCmfge5VkSkMmHe7hh6QqRB3z3wPYdWiwY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW5PL0dyR3pyM2p0NnZqVWx0WGpxL2lWVlZaSDZsZ1d6ZHQ5R25HbXNmQ0NK?=
 =?utf-8?B?cDkyMTlTNXU2NVBUTVhhQXJOZnlibW1WbTVWbkVxL1ZRa3dKNnFaQjNHdWp2?=
 =?utf-8?B?TTVnMm1sZFdJNmVYR1lZV0F2RnBIbzA0YkVzdFZZUFJ1dHRNdGwwVjg4aVhI?=
 =?utf-8?B?YWJmbFlXQnhESjFpWDJBcnNROEJqNGp6ZlV3NUM5ZGs1Z1dpTjVuRFgxMDYr?=
 =?utf-8?B?bHp0UlAyUmVkbkJ4UDI5MEYyTHM3OTI1RFN4dUpKT1Y1bWQrblhPYWJRMkxY?=
 =?utf-8?B?MURLY1lqUmpQODFGSnQvNVdxS0FqM0lRU3pXTmtJR2dZemRGS2VUSEpKcHVW?=
 =?utf-8?B?ekI1N2F3eWhIRGRMbkZqaUdKcFNOb0tuTDhtZVdyZUxwdkNOSGFzQ2gyR21t?=
 =?utf-8?B?UmV3Q3FieUNYdjNucm1JZFRVOGJzNk42MHFmdDloWjg2VlhmT1piTjk0dVVY?=
 =?utf-8?B?UUVweitzVU4vN3d6bkxJMzJRVGlsWDJyVHcyMlpyWTJuV3J0QnE4dVZsVXVu?=
 =?utf-8?B?V1lwRG1ZNFgxR0xlVnVmcEZhVkVzQVU1SjM5eWZ6TkV0eVFjektMV0FVdHZM?=
 =?utf-8?B?NVdhZ3NpTjg5cUk0YlF6R2Y5OG0yeXFPaFdzSmlEQjN4ajBXcFkva0pqSC9T?=
 =?utf-8?B?NHl3MVp6WU9CWW5lSk1paWlnRUtQRWZaTUxjUFI2MVRuU2Q5ZkExZGloZDZP?=
 =?utf-8?B?NFh3VlJuU28rNHozMEgwQUdTK1dmS3pBTWxtVHRLZHNLNW1jU1NXdGE0NXln?=
 =?utf-8?B?K05hM0sycjRpNmdVaWxldkFBRHhueEV1M3FsOGI4RHFVbFozSnl1a25kVlZX?=
 =?utf-8?B?dTlZZkZSY1BNOG9Bcko0SG51aTliMU5VUHhLelJpdXBRZHNGMUpTY3FhNG1i?=
 =?utf-8?B?bnduMUVTUFd0RzRyck9EanZJTk5GbjZEb1dHQjdEYVl1Q2RRMlUzSmhMYzk1?=
 =?utf-8?B?bHJVUExEWkwyK2ZiK3kvNW9hOFZ3VEtCOSszSllmQkt2TlQ1ZzliQVk1N3Rp?=
 =?utf-8?B?eU9CVDVPNDlmVjNCdzF6cldHamtqTXNpS3JXZUMwMnZYbG9SeEYwT1RaZ042?=
 =?utf-8?B?NHBQaWliVjFPdzJscm9vV3FBTkc1Z0lKbHpSdzlta1lhNk9vbHpvcGJVS1dq?=
 =?utf-8?B?a2RxMnNOZFh4Z3ZKc21wMHBsa2pYKzhBRTNaZnFuci96dzgxajRBSFc1ZFVC?=
 =?utf-8?B?WmhYZ0IxMVJNWTJOaGJRVnNGdkFEbG5HKzA4RkprdEUyTnRpbGpEOUVOcnRV?=
 =?utf-8?B?UlZTeEtIZUQwM1VkUmdMVW02U3R1TVpPa1REcHNKQWpsRE9VbGc3YmVoc1dU?=
 =?utf-8?B?YjdxWUxMcENOR3Y2ejJtT1pqTER2M2ozbDI0bXVPRXJjcXZoRjV3Q2ZlVDAw?=
 =?utf-8?B?MWZ5Z24razVnRmNDdDdVOWlmOStLZ3VZUW9tMVFzQ3VUdEs4WVJDZUNIY3Y5?=
 =?utf-8?B?NUQxMjFrYkdJV1ZVc1FxRkIwbVp5c3B0Uks2ZFdVS1dQNXpmTWVJSzNNUjNK?=
 =?utf-8?B?Q3A0RUpVSGhaOUpIKzIrc0gzRDlWVEJtSDJWUU4rUVdXS2U1WDdaeUlYcE5W?=
 =?utf-8?B?SFRwaUs1MWpwVDVTWjIvMXRaUHdUNS9keDAyekt1NzhBSzU3VmtkS3gxdUZQ?=
 =?utf-8?B?OEdFdE9YN3lzaUdqZTRZK3FEaUV0SHR0d2drRytjazNkemU5M3lFb0ZQNHh4?=
 =?utf-8?B?QXA1cGJ2ME9UMXhvSitRb3k3aXFleWlSakpJOXB4Z0JubHpZTVFpc3RzT290?=
 =?utf-8?B?YnVETWVYdzIva2x5MGVTVXJPM1ZMZGF1V1BRandvUDlYM2tIeEtWTHFINkRo?=
 =?utf-8?B?VWF6aVFPZ2g4bGN4V2ZlT1hlQUZaOFUwSU1NQWNFTU1Ea08zWHpZTmV5d2sx?=
 =?utf-8?B?bWZlVG1kTkNaS2p5T0VIRWg0cEVNSkhTZk03Q1RQVks4OHBNLzNvMHg0bjhE?=
 =?utf-8?B?NjBsSmNsWGVOR0lmK2lXdk5FckxnUUkvamJ1c2hvclBFTG9jRWtHaHRTbXdt?=
 =?utf-8?B?MWFMYmdFYys5aUNOVE5BYzJmNksyQ3ZMMjVWVUhtaGk3R212aWZIQ2J3WDRO?=
 =?utf-8?B?aGYveElsMDNzK1JGLzFEUStMUXZ2cXoyeVIyeEFGYmY1VHBCQTVCdFV2MHFR?=
 =?utf-8?B?VTZFSEFZVmFYUzg4QjFIdkphOTVwMDFlOGUzTkQ3UXl2WkRRMGZ0RHFnSzBy?=
 =?utf-8?B?U1o2TzRYRHptdUVQN3pkNnVaYTJjSUFsbEpqZHRYMXh2aXljR3pKOWI0YlNq?=
 =?utf-8?B?T0ZYemdPRHFSK2tpMUtsY3p4Zk1ORDNNNkU1WXZYUmZqb0pxNDlueG55TXlL?=
 =?utf-8?B?UjlqNEpEbU41eDNpMDJTaHk0Wm1oRlFLZnM3UmRZUXE0bnVOV0pSdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cece9693-2bf8-41bf-d369-08dec6c23b89
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:31:06.0001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqcXPqExz1BUZkv08kLSUvBYrpal4i6cEsqT05OOJk8jju5pNphH2XRlJFrgP96t2ljQnGovKktMqKaETdWB+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5583
X-purgate-ID: tlsNG-c201ff/1781076670-E318B443-169A5A8A/0/0
X-purgate-type: clean
X-purgate-size: 1199
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,suse.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFA75666A86

On Mon, Jun 08, 2026 at 06:31:08PM +0100, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
> to boot xen.efi when debugging symbols are included.
> 
> Either way, having debug symbols by default is abnormal and contrary to how
> the non-EFI path works.
> 
> Produce xen-syms.efi unconditionally, just like xen-syms.  If
> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
> then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
> 
> Some old versions of binutils ld managed to produce efi files which the
> matching version of strip couldn't process.  This includes Binutils 2.26
> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> less broken toolchain.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

