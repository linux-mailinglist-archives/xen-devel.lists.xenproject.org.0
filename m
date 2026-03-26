Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC71EsvzxGnv5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2276331A6C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263524.1555458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRm-0004Aq-RB; Thu, 26 Mar 2026 08:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263524.1555458; Thu, 26 Mar 2026 08:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRm-00048v-MT; Thu, 26 Mar 2026 08:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1263524;
 Thu, 26 Mar 2026 08:52:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5gRk-0003uC-Nu
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:52:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gRk-00HEad-3y
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:52:08 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3b0-e002-0a2a0a5209dd-0a2a4509a5ea-32
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:08 +0100
Received: from [40.107.208.54]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3b5-e484-0a2a45090019-286bd03694a7-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:07 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6130.namprd03.prod.outlook.com (2603:10b6:610:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 08:52:05 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 08:52:05 +0000
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
 b=BAl/0Wo4RO6Dp5ROoPlzt2DYDukI7FQdftIE2AUZlW+rG8i+XLNuwpd/zp//KogPrEjEsTpvfwiZqM0lfurctsITp1FsN4FJPaZQI2/D8dEad+WJpbzUBNSagoXkOrVDzM95qxC7w0fM38LzfZp6FdoXBeDdTr2z0t3W40Db6skaxshgJDZfkhRllrnyRNa16jS3RabdMFTMw+ZE3HxIMLkiKFQ7HG+FRZDAKKDxapJUsS9yQIzluCmxJhR4BHqZ/dbY2ZLf4E8YjOE0mYiRxYpHs/sDlRHiiwwJvTY1SCDvIfUdmTpTEfiwoIDSpqocQLEHxQh1TFiSipB2DeKOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRuxAg7+DFWaBUvv3afEF63Z3k/Yz3QGkGiV9EBbvyo=;
 b=s5+9rhvNzvmH1pLCTsvebd9eznNYEASebndo8oYJ9M+0SylPkUwlMP0Jr20F8XlHh/HMTbZCEcKmljZszi4o17kp8PW2neywoK+8OJqbaHO3cJ5T3gE2ghc80sazKvGLVFrbJvzDyIUQfR9NiI5jCNGZZi6EMrCbIXoExStrcETaJYzN7OhfBq5E42FGOj9GJUHe4CWEQsqZyIlOZkQtpZ3/B5kary7zaY16WSzocF1RMWe1HqVTTT7dU9DjT4olBsJwe4VMBjwbMZhuRzl04Ilz9x5AteHxUfxmlvBtN3u4zH4Ld0qAo+J9gB43eUiXF1MAiVnGxYpRSeX5kQ6p+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRuxAg7+DFWaBUvv3afEF63Z3k/Yz3QGkGiV9EBbvyo=;
 b=UNPL776QEzAfGZ26fR+oewYCQHcDyEtQFg2hhiYk0tuoSnT1Dr+lEp1jxeoGa4QkS8DHoYXXSovrGUej4X7Gi5+TwqBx/AdgqysBKP462mOArhDGjNPs0IMzy4sp/lOgCCSvJCZL7V0mLDfwnpAErFVexOEUqlDk4A24w+ahnLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] xen/mm: improve freeing of partially scrubbed pages
Date: Thu, 26 Mar 2026 09:51:45 +0100
Message-ID: <20260326085145.61380-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326085145.61380-1-roger.pau@citrix.com>
References: <20260326085145.61380-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: b663659f-4802-4fa5-0797-08de8b14f4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xv5Fl0CrAzzSXUVDivKF/tsc1hLgXDFeu+CVRRJZTErI+TRzZtJC890FzyDf3FbSUz8G0B+tzrNqQDUOedyFsEkiX84TPqTqpJfGP8Fxf75U/VIsdDWOJ95Jc8orR1zW6fIQAhyLoRO+U1MXvxdWnP11FvF66hXG8zCCXzK+mCycr4Qyz/iRHG/sxHCdNvV4/h6SjyeluRTXAfbjCCejejj63txpEmKmEA5rR95o9eljNaWEmqZeD+m6iva8Rb3pDqQIeRw1W+XocD3Rebnymg85iI7Pjr1VFoiAlOu2sCVf6G/oi4V7oBX0+bAFf3xmGGYy4L+t6dS8qBeKVek88ZDUF7xOhFvBjlRvLOXua3JcxcAUgu0AwB1WSDH1SZ+L4jPYMuAGE36EFdpzZM5PPhNWBC5sHmnNaOLCmkIN5Fw9GNLisaoD6bSMww3B7NIV8mBbhAIGwlbYc0q7wvq9RTE4qWSaxEXI9LUO9V5V8INJiGVldoYy0L+WS1nLczoNdKeWsCKjeoVgKfyk37UDPorzze+W0bekwSROh7VQs10Z25gXjCjIBH4X/xVYBcSvXwPazesYBQQ70epxsUSc12f360/iraHjLaFvTUY2wyR33zj7rl4sJfpO6/AHhwKYpc5o2oWvLf3VTnltg4QRxWoVAiOydn1NFMt2AdyLqGBftCwiryig9K73eres3Yw3v9EyNUg1/dyc+BR/cx+mEmddJTdqKgvDGXhiGMqmvcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVhvUWdXOFZyNmZvdEUyVmQ3b3Z1dUpYby8xRDNxZXNZbDlTdHBTdjhWbjZh?=
 =?utf-8?B?S2p1aEE2ekFtcU1PZ3hEZWFMU09vZHE3ZHVxS2RUV2F2NTJjYTZzb0p2UGZV?=
 =?utf-8?B?c1JUamQyMkxMSVZuQUZ5MHZ1TFlkVW1Wa21KbFcwT2JYMGRZV0duQXFEVzdi?=
 =?utf-8?B?MXZDQlJrNGlHUmZMZnI5dENabzRjZEFHa3hWWXdZNkFCajJQVXFXVmx4M2Rt?=
 =?utf-8?B?cU1FRWVkREpqeFRnOERaQm9IblU4QTRrKzkva2ZLZjkyOTc5dzF5dnZtM0RE?=
 =?utf-8?B?Smp5cGpEd2llZDRmeW1EZkVQZTR5K3hRUXoxY3B1QlgyWHhSdmIzYzNLQ0k4?=
 =?utf-8?B?eUZYb3NkVXI5UHVPZklIbzlhaGphRS9PMCs5dFFFOTNJTy9heGYzeWJoVTcy?=
 =?utf-8?B?VzZqU3VVQ3p3K0ZMUkxaUE5pdXM0Q2Z2ZHlaOFZJMWN5NDB3dW5pRTRhV2dq?=
 =?utf-8?B?NzkzZE5VT095WmlYUTA1dUFjeGVCdmMyOHdjaExEU0hVT0xtL0hYU2tzbjBR?=
 =?utf-8?B?dkF3MmhRNitUdG0wWk4rU1RxV2ZuRUdha0QzN0RJc2w1Zy9YL0NiVlJYbkdW?=
 =?utf-8?B?VHdnM1dSUjRUcXU1QTBZUU1ybndLM2J0TlJCNDdIbHpSZWR6RTN5VGlQYXRM?=
 =?utf-8?B?dUJuSEh4YTBNV09iQUhaMXJyTTIrMWlwK20rSDFBcDdiKzd2MjZNOFgxSS9X?=
 =?utf-8?B?ajVCY2lGZlhjVFdyYk93cnRSL3lTdHhoYWdhbHJvQktFYVNrdWVqWlNZU0FL?=
 =?utf-8?B?ZTZ5b1ZibGt1Q3FRc1hJM0N4MHJMWHFQV0dVaS9xemJEdXlsMkZrL3Q3Um5S?=
 =?utf-8?B?YUg3TnV4N1ZiR1AwMWxleXQzMkpxVzdWL1cyc0dtRm1xUnRNQUwyWjhHK2Jj?=
 =?utf-8?B?NlJ0bSt0eVRoZmZTMFhFeTU1clFMR01ROEpWTlpEK2NDVHBEcGN6Y1oyR1Za?=
 =?utf-8?B?VlFkdGJFcXNOYlJkSEVhS3dYaHJRZElsanlYbjVuZkd4Y1ZtWjB6eTBuSXZZ?=
 =?utf-8?B?bjVjUmV4Z1pETGFFRjJCRlFOZmh4MUNoNUVydW5ieWhXOGJoWDg5S1JwbndF?=
 =?utf-8?B?V3Rvbm55V1ZPTGp0ODJGT0hXVXVjNWs5Z2ptbmc0Sit4Zk9zRHl1S3IzQk8w?=
 =?utf-8?B?dnh5a0FWb1JnZnRsczhMN3psQUlxSGFZdFpveGpoYUNXNlZMMm82aExQYVd0?=
 =?utf-8?B?UUxvL012c2lIalNwWk1FN2xJWks1WFByZmIrVTR1V1hKbVB5QVNyWlhkQVEx?=
 =?utf-8?B?NjVBakZKSlBhUnN2Ym1iVHB3cDdMa0h4M1poRXRoUnhKRW83QmxvTDhDWUhO?=
 =?utf-8?B?blZPVmhKcllEaXBzSlV2eGszQXU0L3puRDdrVHJZbTlkUk1acUU2U3NwNWIr?=
 =?utf-8?B?eXpuNlpiTmtldVgwbmpkUXhXSHY0eFk0YWJ6QXlKRmh4NXBxaDE3bWxwOWIx?=
 =?utf-8?B?R3BJbFVCNG1MMDJQU1g2UHVHalEzbTcwTUhjUXAwRi9BbW5PcjhyZlFpd0pv?=
 =?utf-8?B?N2JaM0tYQnlyb2pwdlltbWtSazFzb05TU3dGVEVOVXJxOGp0V2QyK0tnazYv?=
 =?utf-8?B?ZzNlZkt0L2x2TGFRaDZHb29HZVViZWFxRjU2QmF2V3VtYjZHMnRPVlpIMllw?=
 =?utf-8?B?dWJqcTloczhRMy9RYjlFVExnWFU4UGxUS2kwckszTnZLV2FuNno0cVFPRWc5?=
 =?utf-8?B?dTdHTUZoTjJqdHVqdURzT1cxU0dyVDRIT0FINmZ3WkZNaGNpR3ZOSDFUQXJm?=
 =?utf-8?B?THQ0T21xd0Vzb0NIZ0xOS1l5QlhzVExNa0tuTkQ1TnIvcVBJNFhHM1RIZnJw?=
 =?utf-8?B?MEtZb1hzRUUxeWp6WWV0TFRqQ1dRRlVzN3VRWElnY0oxaDkxWEdVZ00vc21o?=
 =?utf-8?B?bG5uNjhGczVKcm1jWXBPRjV6eTcrNG5xTTlZcVQwZDBPbWFNdkZqTTcrN1Zq?=
 =?utf-8?B?M1J0Nkw1cUxJL1lZVzd5QkIySHFkQjJBVHNBdk5yU0p0NjY0azhxZ2N2Zjd3?=
 =?utf-8?B?dEY2d3dlMDh3L1k1dVh3UFQ5NmQ5MUpxM1docXpGb3VadzJ6S1B6dkkvZERK?=
 =?utf-8?B?cEFGSVpCTUNGTnIxL0hSeE5aN21YYzdpbUJUeGtpYlBlanJzZUoyZmZYTVRE?=
 =?utf-8?B?OUZlSk90bnJmYVVEOEhaNCtGTTBpWllDTHN4dG9tbVlHM2RPOW5lWVhWTzVu?=
 =?utf-8?B?WmI2dURUNUVlNzNweElrZEJxZmxDclcxWEFTd3h2WitSNFNKUElsVmZIZzEw?=
 =?utf-8?B?bi9oTHpQQjFQTkgxWXlRcU8wZDBDenNXZklnaWRtQ21tdnQ3MFQxbEdHSExy?=
 =?utf-8?B?NjA0SXFCS014dzlYTVJCa2tiQk8vMDYxYlNodlBJeURDbWVZQUsvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b663659f-4802-4fa5-0797-08de8b14f4e1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:52:05.8482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UZrsKbBut4UlHxfk5eRXaaT5Nw3TpY57mY4aOV2rnOoJW2xJ0cPeTlue3Pq1PEZVD9RDcGxdVovRjJ0fCybRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6130
X-purgate-ID: tlsNG-bad1c0/1774515128-5AAACA73-DF0D5578/0/0
X-purgate-type: clean
X-purgate-size: 4597
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F2276331A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When freeing possibly partially scrubbed pages in populate_physmap() the
whole page is marked as dirty, but that's not fully accurate.  Since the
PGC_need_scrub bit is preserved for the populate_physmap() allocation we
can use those when freeing to detect which pages need scrubbing instead of
marking the whole page as dirty.

This requires exposing free_heap_pages() globally, and switching
populate_physmap() to use it instead of free_domheap_pages().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Jan: I'm not sure if that's what you suggested in the review of v1.  I've
added your Suggested-by but I can drop it if that's not what you were
thinking of.
---
 xen/common/memory.c     |  6 +++---
 xen/common/page_alloc.c | 16 +++++++++++++---
 xen/include/xen/mm.h    |  6 ++++++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1ad4b51c5b02..68eef8291571 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -177,7 +177,7 @@ static void stash_allocation(struct domain *d, struct page_info *page,
      * interface is designed to be used for single-threaded domain creation.
      */
     if ( d->pending_scrub || d->is_dying )
-        free_domheap_pages(page, order);
+        free_heap_pages(page, order, false);
     else
     {
         d->pending_scrub_index = scrub_index;
@@ -210,7 +210,7 @@ static struct page_info *get_stashed_allocation(struct domain *d,
             *scrub_index = d->pending_scrub_index;
         }
         else
-            free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+            free_heap_pages(d->pending_scrub, d->pending_scrub_order, false);
 
         /*
          * The caller now owns the page or it has been freed, clear stashed
@@ -391,7 +391,7 @@ static void populate_physmap(struct memop_args *a)
 
                     if ( assign_page(page, a->extent_order, d, memflags) )
                     {
-                        free_domheap_pages(page, a->extent_order);
+                        free_heap_pages(page, a->extent_order, false);
                         goto out;
                     }
                 }
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b1edef87124f..8fc9b5a27f1b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1529,13 +1529,13 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
 static void free_color_heap_page(struct page_info *pg, bool need_scrub);
 
 /* Free 2^@order set of pages. */
-static void free_heap_pages(
-    struct page_info *pg, unsigned int order, bool need_scrub)
+void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub)
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
     unsigned int i, node = mfn_to_nid(mfn);
     unsigned int zone = page_to_zone(pg);
+    unsigned int first_dirty = INVALID_DIRTY_IDX, dirty_cnt = 0;
     bool pg_offlined = false;
 
     ASSERT(order <= MAX_ORDER);
@@ -1552,6 +1552,13 @@ static void free_heap_pages(
             pg[i].count_info |= PGC_need_scrub;
             poison_one_page(&pg[i]);
         }
+        else if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
+        {
+            /* The caller might have returned pages pending scrub. */
+            if ( first_dirty == INVALID_DIRTY_IDX )
+                first_dirty = i;
+            dirty_cnt++;
+        }
 
         if ( pg->count_info & PGC_colored )
         {
@@ -1571,7 +1578,10 @@ static void free_heap_pages(
         pg->u.free.first_dirty = 0;
     }
     else
-        pg->u.free.first_dirty = INVALID_DIRTY_IDX;
+    {
+        node_need_scrub[node] += dirty_cnt;
+        pg->u.free.first_dirty = first_dirty;
+    }
 
     /* Merge chunks as far as possible. */
     while ( order < MAX_ORDER )
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b80bec00c124..0b192caa07bc 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -153,6 +153,12 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
 } while ( false )
 #define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
 
+/*
+ * Most callers should use free_{xen,dom}heap_pages() instead of directly
+ * calling free_heap_pages().
+ */
+void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub);
+
 void scrub_one_page(const struct page_info *pg, bool cold);
 
 int online_page(mfn_t mfn, uint32_t *status);
-- 
2.51.0


