Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGvtHZ53T2oRhQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:27:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDEC72F94C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=mmYUxCkg;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357907.1612231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlyX-0001Mu-Ba; Thu, 09 Jul 2026 10:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357907.1612231; Thu, 09 Jul 2026 10:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlyX-0001LS-8g; Thu, 09 Jul 2026 10:27:25 +0000
Received: by outflank-mailman (input) for mailman id 1357907;
 Thu, 09 Jul 2026 10:27:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1whlyW-0001LM-2x
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:27:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlyV-002Q7E-Bh
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:27:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a4f777b-2eae-0a2a0a5409dd-0a2a450addfa-46
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:27:23 +0200
Received: from [52.101.48.47]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a4f7789-e40e-0a2a450a0019-3465302fc828-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:27:23 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6493.namprd03.prod.outlook.com (2603:10b6:510:b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 10:27:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:27:17 +0000
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
 b=SJbyOTEHap5J9dhCdB0lp3HGJCHxPjbw0qDpSnTFUveZAIm1ENVXWxScUeaZsZnyZ8vcFljbh2RfgifHDKXd8fBkxoEB+H555hBLB701nMi/5hPt8mwM9MKeXQW7GEJsINqC/PX/fAuZBwTvZ6Q0lDfskK+9/11BluKvmEH7c4jZYk1Rg7S2vFophDsZIqw/WiCZmKAmIdnHEHe5exvY5SUSTJ4tb1Xhd285TvFRpzE45w7arziJj5CN7sUqfAnc2EmtKF+A8kA1WWpQV0Q9wcKO/m+2q23iLu+kW4wtrrrAD8nwVL4goNLPR7DJvZ1TM8p4kcaVzEli3tJtMrkBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYmO5w03PfYnidaz0vUbo/qTsL63MCnQT79W8R9KlPU=;
 b=Wu34pl2pkLayXOWbu/haaSZc0bFUDNzzTzdVyA6XFodIMsi10wgvpzYTtYDqFoD167QDPKT2WMxQ3W5zan5+papOC0zFWrM9apj8byrY7FTXj6qejmqxDv2+2c+Z6yrGrBe8msywqy4f1suYO+xG4MjZO9kgd8KXR/CBwoDvbbGN8n36W1NLhAYhxrqt5DxoNpODbhJMm+P78EdBJCyVAqzi5mf07ossArG/7mmrs/iKnuIt3zvfCR+x+XkO6FSpVJudDvZSHRrptwCmBGPWJFdpY5qYT8SEzuWS1LBHkJPLTj5axrS65IJKSmT1AHVR5tE6kgrnnEDqjwhpARyT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYmO5w03PfYnidaz0vUbo/qTsL63MCnQT79W8R9KlPU=;
 b=mmYUxCkgzMf5NrX6WiepqLPQiwMEQZsZQXNMfOxI8sLVCGwNcrN2t1H8htYHLvAy+/dOzSd3yj0weF+gBp7ENKPCaB4pVVgXjDJ0DMkYsC1Vxwwr8zRcBMf/zLF3rnFG0QUK5WH/DGwp++ziKyd9wnWuFOdmhpKRsjZWLP6xU/o=
Date: Thu, 9 Jul 2026 12:27:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen-blkfront: fix double completion of split requests
 on resume
Message-ID: <ak93ggbNKsUEZq4H@macbook.local>
References: <20260709100853.7489-1-doruk@0sec.ai>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709100853.7489-1-doruk@0sec.ai>
X-ClientProxiedBy: BN9PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:408:f7::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c03735-475a-4324-f2a1-08dedda4a656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Td8XjHlsfxNND8nhqpYKyq8u5rInCcPpOgUBZPBG7IncHBavCmGNImsDN5XnczHhGCbkpZrR4a2vpDWdQTWeWDarkMTEr4GZtQbI3SnMxDdrgQ9LhTPFWMPrht9lRXCC70IZQ9PZ/PQhox2W7B/O8KiIAAgtt1/4oxB45jf0GaHUKB9MpX555d9zQYv2ot2mi/KEQkFmckZ84vjpFPJ/3JVxUUDWB/ZRMzvvhUePeV4Mc/oMBB7KgLNr7GGXrc0gw/8uMpNiThRbJoFStP3lHlr3fbJO8LqsYfprK+pJv39/SpUheZntJqgARW7dDuGlk6VJpHoiI6tQw/0HUSoKeOo63k5QHAfcZFAWoqCU9TIimXeRRgq/ZVfVlr5MRCZC7xLzt+2DrxW0RC0urSRKM+NA+tNPNzX0gqRBpnSfCcA3TzKnK4JJh8bi706uqgNLQlb+bsPPljyHGJ5dxnjk4vXc45WM4aquXyPO7l3+EEkB6nSJ4yyoe1qQkKcJJeWIV8iB/0MYSGw6hJMrj9aVG7+d3ys/MobjEb5O0RqAWkiQDwLazzSTevgD2I8GBWrMpcHW1nw/D5eG6H8L++FEC9XNzlo4d4XBAHBgdPmNyIA8zPBsdeRTMEx9vlX6p9EG3Dj+hJ3dRSSMVbsoK72wUIZeeUlvyq9idcK1UpOtDWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzVVTkZNa3JiOEtJamNMNXg0bzlZSHhjTTFod3VkeDY1SHNuQlhaZE5IbGZ4?=
 =?utf-8?B?cTJlYnh2UytTVzBLZ3ZKKzBrcHFieWI0V3R0cXlZR3kwRGhCMXlnRTgwaE5z?=
 =?utf-8?B?S2JnV21tOFgwWWdQT0VmRjhqbGpON2JKQ3hDc0drSlJ5OWRZaXo3Vk43OHQv?=
 =?utf-8?B?YWZZZ2VpWVBaQjhrSU9tNkdxNVV5b1N5QXlIN1N6ZHhVbmhmZXFGYXVRYnB3?=
 =?utf-8?B?a1pSTkFhcXAvOVV0RDFRaWQrRElWbHRkakhIRzJwbUw3V3Q1RWRNaE1jL0JO?=
 =?utf-8?B?Y2x4K29ZcFhxSXYwSisySzIxWWJFb3hOa01USW1yWUlvcU5jcXltcXZDdDIz?=
 =?utf-8?B?aHlKdW00SXo5UkowaGlabGJWVmZRdVpZMDlFUU1sR3lmLzg3MEt5TWQ5Z3JM?=
 =?utf-8?B?ayt6T3grR3FiZGxxSjRZTk1hQnVyZkRud2EzTlNUK0R1cldzUzNOTUVyVjht?=
 =?utf-8?B?N3VrUG5SWE9iMUZ6bkpjRjBUdDl1eTVia3VkMWxsY0ZCWGRuR1JZNjBqOWQ2?=
 =?utf-8?B?VVZlbkx0NTRJL3lreVhpNmFrVU1oWkpVL3lMWTJsSkJkKzEvMHR4YXVQcmNj?=
 =?utf-8?B?OW8xN2VYQU9PSFRuUFhSbHBuTk5lc0RZaDVLWlUrK00wMDIzaWJWaXlNZVg2?=
 =?utf-8?B?enUwRWpEUFBKVWJkL3hFdGN1dlBKMnE4eVl4eTFYdGZFbi9takhDWkZZVHhI?=
 =?utf-8?B?bmFHOXgrWFN5YnpLR21HNTJ4VGNsWFB2bm55aTkxOXJNNlhDcFVrbEQ0eWYw?=
 =?utf-8?B?Z1AyNkZDODBTN0pVVytkRDlONktZNkNhNnRRbWJIdmZJUjJ2WGRZbHVRMUdZ?=
 =?utf-8?B?OWdIYUpzaitVUkhrR01TWW4vYXdrZ2plUVdzc1kwN1VmTXVJRHBDSWlWckZt?=
 =?utf-8?B?WHJ5TTB1clc0clZFemlYUk1jaGxLbVByVmN1QkEybCs1eEN5bEVCSldlaHJF?=
 =?utf-8?B?NTE2Y0p5T013ZGVkTXlJWEsydklpa091Z3dVZEM1K0tYODh6d0hMeFBCOFhr?=
 =?utf-8?B?a0tCbjB3RkRYOWVPY01XQ1NQemZocHdDYWFMZTlOUU1nN1M1UlYydEwrQ28z?=
 =?utf-8?B?Nk5HTmJCZExNTitwYmtyMkk5RmZXMmV5cVNWTHBZK1dYL20vaFdaU3k2OEJ6?=
 =?utf-8?B?WjRBaGoxR1ZCYjdXbW9pb3VzQVFqN3FkdGtPYjV3SjdsKzN1Y3VOOGVLbmFE?=
 =?utf-8?B?QUNNMkJuN2NmenFUcTVUemVHa2IveW5jZ2FCZlZTWE5udTMySy9UMlI4bFVy?=
 =?utf-8?B?bVdoZXRiZVVMbnlBRldNNG5pWlZLOThaV2JDbmhwZW9qQTlGUEh6N0RHeTBR?=
 =?utf-8?B?blJnOVR0SWpHdUY4YlpZWHg3b0dPUGJsK3NYNkxDOWhFRGMvRUxJZkdra3Y5?=
 =?utf-8?B?T3UxSFMvL0hQNFlwWUN1RW1QWTN0U1VTNUZURCtkTVpLUVJTRGI5RzAxMWN5?=
 =?utf-8?B?NTFlZFRZRHRWdmhCbmkySXhnRjc3SVErbmZVMXB6Ulo2OURoSlY0RGJVRFpZ?=
 =?utf-8?B?YyswOS9TQUc0YUJoQzNVeVYvTWNnQjVFYTFQZW5YUFNOY3d0MmJZaGdVN2RI?=
 =?utf-8?B?ZlVQZVNCeEtpZ2R4QjV5SytWRHhSRWlmSWdTOHZZSjlJSkR6eFVUVTV5cmZa?=
 =?utf-8?B?Q1ljYmx5RXMxaHM2dUR3UWp5a1ZqbVBnd2lqeXVUM3hJRFB6MkJuK25hZUR0?=
 =?utf-8?B?NUEwMlFIdXE3QVVIVVZxV1B3QTVsMVBONThmOHJ4Tm9WaE9mUGE5ZG5EUjl0?=
 =?utf-8?B?ZVRlUzZOOXZpTEVWVXdQN3NKY1B6M2s3QnkwTlAvMDR2TkdFZGhEUXRCYmtP?=
 =?utf-8?B?dFZ2Ky9jVEhmdFRZdnZPMUNodGpXc0RzNHNvM08zSDJLaWRJekUzbFlQYnp0?=
 =?utf-8?B?VGZEVHRWdUNhWGRVS2VqTldSRFVXcGFlc0podFVKTG5GRk1Eek9kYkRCR2VM?=
 =?utf-8?B?ZkN5aXYzNk5wbFByc3FwUEJueUt2eWdwLzVBT2JwR0x4Tlg0NUJMbyszd3Fn?=
 =?utf-8?B?aDNCeFFUSkYwam1iOVdtakkwZXlZVlBRRG9pcVpQWWFHci85WU5JSGo5UUFr?=
 =?utf-8?B?UHg1blovMFlTc1VFSWUrQ0l3dXo0QUV5R0lUdDRKM3ovMHpRQXdIbmhGQ0NP?=
 =?utf-8?B?dlF3bUVVVVJHVzVlbWtuZGZlM0tyeERsQlpxMXgzb3FwQ29LZUtPYVJQYmxW?=
 =?utf-8?B?MkVIa253eE9oMmx0cGFhNTBJRENqV3ZYaGxUUEh2ZmdhK1BVd1M0dngwcm9M?=
 =?utf-8?B?OVVjOGp3aVF3T1lGUzRBUmJTQ0xXZlN4bDVRcGw0T0ljWkxWRld6ZTYrZjlS?=
 =?utf-8?B?SWdSYTFzcENiZEV1d1dXRENqWTZVekFITUptbXBYaTdJU2FxNUg0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c03735-475a-4324-f2a1-08dedda4a656
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:27:17.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0NdkSoXoir7baRzXkhT7vPXO+QLHvkRY9cChKqMZ1OJpUSQNXe2wJ0MJElJLaE1r8IqpYFdrEKtRCh2a/x7bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6493
X-purgate-ID: tlsNG-4011c0/1783592843-D7736DDE-BC5828F3/0/0
X-purgate-type: clean
X-purgate-size: 1663
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:from_mime,citrix.com:email,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:axboe@kernel.dk,m:xen-devel@lists.xenproject.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEDEC72F94C

On Thu, Jul 09, 2026 at 12:08:53PM +0200, Doruk Tan Ozturk wrote:
> When a block request is too large for a single ring entry and the
> backend does not support indirect descriptors, blkfront splits it across
> two ring requests. This only happens when the frontend runs on a
> 64K-page kernel (e.g. arm64): there, even a single-page request may not
> fit in one ring slot and must be split. blkif_ring_get_request() is
> called twice and both shadow slots (shadow[id] and shadow[extra_id])
> point at the *same* struct request, linked through associated_id.
> 
> blkif_completion() collapses the pair on the normal completion path,
> recycling the second slot and completing the request once. The
> suspend/resume walk in blkfront_resume() does not: it visits every
> shadow slot with ->request set and calls blk_mq_end_request() or
> re-queues ->request. For an in-flight split request it therefore
> processes the shared struct request twice on resume/migration -- a
> double completion.
> 
> Skip the secondary slot of a split request in the resume walk so each
> logical request is processed exactly once. The secondary slot is the
> linked one (associated_id != NO_ASSOCIATED_ID) that carries no
> scatter-gather list (num_sg == 0); the first slot always keeps the sg
> list. The bug is only reachable on suspend/resume or live migration of
> such a guest, so it has no local reproducer.
> 
> Fixes: 6cc568339047 ("xen/blkfront: Handle non-indirect grant with 64KB pages")
> Assisted-by: 0sec:claude-opus-4-8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

