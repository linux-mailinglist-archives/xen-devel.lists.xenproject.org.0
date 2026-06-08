Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIB5DRTVJmqGlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:43:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B36576F9
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=kqXEUHsh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331679.1594242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbC2-0007qJ-Nd; Mon, 08 Jun 2026 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331679.1594242; Mon, 08 Jun 2026 14:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbC2-0007oJ-KR; Mon, 08 Jun 2026 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1331679;
 Mon, 08 Jun 2026 14:43:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWbC1-0007oD-7W
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:43:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbC0-003DrR-05
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 16:43:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26d4e8-bab6-0a2a0a5309dd-0a2a45018b00-14
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 16:43:07 +0200
Received: from [40.93.201.55]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26d4fa-c1f2-0a2a45010019-285dc937376e-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 16:43:07 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7959.namprd03.prod.outlook.com (2603:10b6:610:20f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:43:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:43:02 +0000
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
 b=ndmgXiJvwzl1lpRJXoFURez1eslBe0BxI2ra72KJcYKnzhSGkS1FGINE1JGKmaZgRpfJZHceaJ+FCWOD+eC92BvuM0uddPTo/axlE1/JR8uSDpHZWlwe1AiLudL/fQ/VKWaO9Hb6ayA+BmJYHTNJGeJ2y+sED/Yz2kSUv5DtnY2z2nrpBpx9iUiFb2NBgMbEDbQZTWdYrs2kEO+Q6KwZgp9tNikPZe6ObbXAU3RzaCoWQe39mm+GEtfSoTxSGQ2u9JUgWEvzeB6NBCNVJYWoLBH9ZFYpTnoaiKDXIkcrp34ssexcvrswxHIECZsPdiG4iLmrJTBUUV1je4A3jG15Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbl95lkjS0V1HHhBKlA8uuMnCJLdQI5AjAf0srsGBfw=;
 b=yoNwlxG9SRXuZ8TtiEwzHX4kZjau48g491psy7U9/2Md3xztoVXMyBJrugTBm+yBt2z2R242YZSEFh2QBnevjpuVUG2uCxUV7oVxUrlHq1dxPv+3qODw2X1t38tjTc/SqHUAr3fkMmOZvc9tpCxVeSNea96ZjECKT+QvMYKRrvunz23RAHnds/uKvivkebgfesYLvi4evA8euR6qoSnEQnnApo6nWlUzg1YMExInCUikFOoFWGOMcTFq4IerEqqph56fk0436S+/ZgSD6ecU+vybXwBK5y+DoMd5Brib7n9AXkprffpKu52XW6bBcAGLtwEwSRdc5XJBD7sc6MmoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbl95lkjS0V1HHhBKlA8uuMnCJLdQI5AjAf0srsGBfw=;
 b=kqXEUHsh3qHtKV4gf4pD7+MaZ0mhnMsQq6TgmEbet9udPmxUmmCghaeDyWyJqAg0l+96qFutQD/3f6QKogi7AHVt/W0fitG1Y87ZDTEfL5Tv8eK69HIDIpiU9cwOvqwV3yLSzepBqwUoIoVDDJOccO3GsVPJYORyo/BzV6MsLIg=
Date: Mon, 8 Jun 2026 16:42:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 02/16] libs/guest: Reduce number of I/O vectors in
 write_batch
Message-ID: <aibU8lzNpMQme0kr@macbook.local>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603130603.776452-3-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MR1P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::34) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 207aad51-3421-4dc1-5a71-08dec56c3e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hsxihSv38FLKw8EOs6Mt+zQrusP05slXFSEVZix1ectw3zoADVyGygPeHVncC9QoifnlsNEVxzGElDTIKz3mi1sWrlO4ESk1baO9Fy+9SfW/MpPn3hQMYn4/c4BuvgbUL0ZDTdxYSw84RF3Ht/1Qp/OTrKSk1jW7aggR3zGraflyu4818ZoauJ2PvGBiRIlEafWW8stdChQQPuVpsp2WbloJwzJFrbZSvBdESSydBpqfoXT3mMkPfwqPjuMF1zVvsrvHLKZeFZ1eCdp6Fk0hXQzI0bMlZRUd1k97mNKdPrZnuKowERwWOj++ECypG2GNQFx+2zR8joy7cILaFsUA8qqndnzqoOjrchmtk98Fewd/iq2yK242OOie4uRp2qsGyY2ozuRiW4V0NBWiUNMhOCPC1HvcsQ2yYA3f8WkeUiumC7SHLmw/5Ff8KkaghJmdJTqT+4ysPEw3jPFlOHSDupi91qRnAv9i0Zyf0a4q6V42KHM8pLrfjRmetoAv+ejjkfcIbM+DZQUVvFRdtwyo1HHiu7bVbWJVNnmXrfNwKnyexL7CKIGduV7gN62uLYOZssp07yMfIXD6aGhLmBrTIXUKGpR0xOQ7o9eu8+fPovqEbuvZ1ssbL8DpH9UcB2NOqC44w/8xNXsCEMz/otz2cd0rJtGTThoJy3I6tcUrsMzX2CBgIJT3gPjLitvMZvEs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHJxNDh4TFkxL1d4N3E3azlzQVJYTWpSMkRTM1pNbENodm9zYlA0OFFRczB3?=
 =?utf-8?B?bDQ0MnZGY3lCNDRpU2x2NEY4N3hEWFdwb2xlek80WVEzNmI2elVnSXdiTmdz?=
 =?utf-8?B?dFoxTlZ6c2dOZjFpbm1MdlNsaDRQUUpBazVjWUhZc25nYWhDSjV5YVQxS01t?=
 =?utf-8?B?eCtzenVzK25mRktrTE9JTmNFYVkraFp2VVNjeUVkVDRTVDlNOVNwa29sVlVS?=
 =?utf-8?B?ZTM1SFQ1WXozWnZBd3EzYTdWakhya2pkbU5aVDl0QXh5amRQWkd3UExRSEg5?=
 =?utf-8?B?WVY5eVFsS3dSV3ZVUlBDN1hrNk54U2kwWnJUMGVqQU5JUTVjbjJvUnlTZ1hl?=
 =?utf-8?B?ajk4cG1RRWZSTG5SdDJ1N2JHeW8rUFFzRmpDb3lqV3hPSGxuc2pJUUR0Y1Ew?=
 =?utf-8?B?bFBYTCtUdDV2SHB1NmxqOVlXQTBackNQQlNWcEtDSUk1d0E4ZG1MNEZaOGhh?=
 =?utf-8?B?QXZOTzlDVnRYWmg0Zm02aVMwRFYvUnZBeEVsQlp6Y3hvYk1Xa1B3a3l1Zy96?=
 =?utf-8?B?OXlFejkrcDJpUU5GZWxOYzR3T2lRQmlscUEzSGhpekdEUVppcUwyRzBKVDJJ?=
 =?utf-8?B?N3huUXgzaitIcUw3NEpZYXdXVjNpdVYvKzQ4Q0VVVHh2czNwaC84N0tPM1l6?=
 =?utf-8?B?Y2REcVIvSWlYTE41dXNPQXBGZDg4YzBVd0grcHlQNjhwR0QwVis3b0MydmtS?=
 =?utf-8?B?YXdpWDBMSjdiSnZSSkprOU9POWdQT0d0MUttQzBGZkxHTkZsL3hPUlhreWFo?=
 =?utf-8?B?WStEUnp1MlBncXZSb09Ta0NObkUxbUF5dUZ0OUswVm8xRi96TktSQ00vcVFt?=
 =?utf-8?B?TUNTVGJqTkFCWWh4MFN0b09hZE92cnVqbi95SFZVb3dTVmIyUlpwQ2NmdS9v?=
 =?utf-8?B?MkkzYVR3UnNLSmllSHpPby9PSmF3YVQ2aVViUXhwQitUcmNqeDBpaE4vREhm?=
 =?utf-8?B?dG1ySkNoVExJNnN0aW9CcmQrWGNrRi9MNk1FYmx0SFo4cHlSSVBRc3JEQUFF?=
 =?utf-8?B?aDhQdjhiakxaa0hYR3RzM0FEb3lGVmZjS2xwOTNCL0lsWFd2VlN1TklPU1U3?=
 =?utf-8?B?MWVRV0FJbmZnT1dxSnJ0a0RGSVV4WUdNeWtGZVdJMWN2cjdiWmNBRkNoMERW?=
 =?utf-8?B?TDRZZkRhVUYxb3JEclh2eXoyZG0xZTJ1b0h5QnpkdVhITUhIZVFFbWsyWnMr?=
 =?utf-8?B?WW1KK2Y5cWhwdmd0M3FxVFRwc2JZZGFVZVpQMjJkWkp0MGN0MTgzVzlVbzdH?=
 =?utf-8?B?M2FzckVGU2RmSDMvS1NhQ2krYTA0bC9tekJYZmdvSUQ1NHVCV2RlbDAvUGhT?=
 =?utf-8?B?eHA1Y1hwOUQwVm9aTlpBVlk5RmVXNm9QMEhRbHFFODdZcE40aXZrbm9CSHB4?=
 =?utf-8?B?ZWZ2b0tJd1htQzBWVis1d203VWtQNmt3bWp4M0o1UkVvaDQxcEw0cGEzNDQz?=
 =?utf-8?B?Z29NVGdqL1FaaURVWjh6dVdvdkM3MkUwTFdCSlp3Q3UzVHkyUE1qV00vTmZ3?=
 =?utf-8?B?Uzk2RG9CWUpyUS9jS1hWVFROdVQ4M3FIdG5XbDFCZVZXRVFjMUxuaWhCRHFM?=
 =?utf-8?B?Yk82L1pZNktlOE9oWWdnNE1aMGhPMStDU2lLVVpRTVlsZWY2bjZMUFdxRGNn?=
 =?utf-8?B?S0NYOExxYzJmUXluNFR3NzExdDduQkdYNXc1S1JoT01PQW1jYmpBMWg2eFhC?=
 =?utf-8?B?Z3NKVldvejJ5eURuWURaU1JlS3V4dGhGNHQzTUREVnpFWE8vN2JLbjV5ZGhL?=
 =?utf-8?B?bVF0TVQ3VHhaY2x2cXRiRk1zQ0RoSkJQYWtFK05NKzJDTWJEcHM4TXhvdUt4?=
 =?utf-8?B?NmN0ZGhlbFlDakRmQXdwR1lwM2ZxUVNIVTczVnNDNWtWanE4bmVNVk1xMmdh?=
 =?utf-8?B?eEcrVDdDUVg1K01tMEJVMXdQRTE1VGJTME5KWnJTekhYZmVpT0dhOTFHN1RC?=
 =?utf-8?B?SG1RK3hucHl2VmYzZDltTXhYSm80a2s0VjZZYmVDWGswZEI3WCtkQmxpd0E2?=
 =?utf-8?B?T0c3d0V6Snp2N1A3c2l6MSt0WStMVGNXcEtheW9EcXJ3dTcvTmNHbDdhRkpv?=
 =?utf-8?B?YmNjMWN6MmlhY2RLU3AydWlCOUFMYWcwc2YydDB6SEJnQ3NzL0RjMHdDOE5r?=
 =?utf-8?B?WEdOamdBa3BXWnErc3Rwd1lJOUFoZmVhamd5c2ttZEFPL0sxTlVaTFFRTlJ4?=
 =?utf-8?B?cDhES3FCa3VNamhWQklhWUdJRHFBZjROSkdlNXNVMjNwUUJFbzdUd2hXZkZx?=
 =?utf-8?B?UEt4aWFEODhnZk5EWWVsMS9EdVpSM0d4QXFDUmh6RTRtUjl1aldhT25FdzVR?=
 =?utf-8?B?SzFqZzBTMHVSYWR4M2M1U0JwdXJTSGQ1VmNYKzVTbURBenJQdHdQZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207aad51-3421-4dc1-5a71-08dec56c3e56
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:43:02.9017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/xvgoDPe81FXGejF/5+gGInNbZls3rqFyLf9hnrm4Ze/T81MCits09LMkBsselQvKj+df62CuOMUKeriM14Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7959
X-purgate-ID: tlsNG-d62444/1780929787-B7754FF4-0299BD7F/0/0
X-purgate-type: clean
X-purgate-size: 1994
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 915B36576F9

On Wed, Jun 03, 2026 at 02:05:49PM +0100, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> Small optimization.
> Reduce number of pieces passed to writev.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> --
> Changes since v2:
> - change prefix in subject.
> ---
>  tools/libs/guest/xg_sr_save.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 3b2c5222e4..1700d81905 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -97,9 +97,12 @@ static int write_batch(struct xc_sr_context *ctx)
>      void *page, *orig_page;
>      uint64_t *rec_pfns = NULL;
>      struct iovec *iov = NULL; int iovcnt = 0;
> -    struct xc_sr_rec_page_data_header hdr = { 0 };
> -    struct xc_sr_record rec = {
> -        .type = REC_TYPE_PAGE_DATA,
> +    struct {
> +        struct xc_sr_rhdr rec;
> +        struct xc_sr_rec_page_data_header page_data;

Is there a possible worry that the compiler (for another
architecture) will introduce non-zero padding between those two structs?

> +    } hdrs = {
> +        { .type = REC_TYPE_PAGE_DATA },
> +        { 0 },

Do you need the explicit initialization to 0 here?  All unspecified
fields in the initialization will already be set to 0.

>      };
>  
>      assert(nr_pfns != 0);
> @@ -115,7 +118,7 @@ static int write_batch(struct xc_sr_context *ctx)
>      /* Pointers to locally allocated pages.  Need freeing. */
>      local_pages = calloc(nr_pfns, sizeof(*local_pages));
>      /* iovec[] for writev(). */
> -    iov = malloc((nr_pfns + 4) * sizeof(*iov));
> +    iov = malloc((nr_pfns + 2) * sizeof(*iov));

It would seem more natural to use calloc() here, but it would also do
a zeroing that we don't care.

Thanks, Roger.

