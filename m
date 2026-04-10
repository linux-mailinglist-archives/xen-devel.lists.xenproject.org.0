Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFmjLRC72GmmhQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 10:55:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2855E3D4603
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 10:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278491.1563305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7e2-0000VW-3g; Fri, 10 Apr 2026 08:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278491.1563305; Fri, 10 Apr 2026 08:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7e2-0000Sq-0D; Fri, 10 Apr 2026 08:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1278491;
 Fri, 10 Apr 2026 08:55:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wB7e0-0000Sk-A3
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:55:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB7dz-00BRhC-Hl
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:55:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d8bae7-5cb7-0a2a0a5109dd-0a2a450aaac0-44
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:55:15 +0200
Received: from [52.101.48.21]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d8baf1-ee98-0a2a450a0019-346530158cb1-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:55:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7268.namprd03.prod.outlook.com (2603:10b6:510:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 08:55:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Fri, 10 Apr 2026
 08:55:10 +0000
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
 b=uUrrtux+Jx/TA96+RNy9aj0EgNUveo2+EEP8t1yOtzExP+X3DO+8FOUm5dfyowzrC4Ov7sYcmMMbouW2px90byPcbKCBqx8xJWd1ZTZy9sdXVuZBe7Szj8OaYAdxBKoomUxDYav983kWzz9y9QFu2cHNge7k+5ElsGBLJZPWPx+lB7q93Nnt67Ytz4jwmR/YXZEACDkUw9cajAUtKlpTXSfYARRyUwgMojE0FUlGLr3v3Nt4XPllwIW8/mwrGORSByAHSYtpeMak3lf/H+C9e8dvaMCIaWKesF1b3OQKSZBly5n1FFheViFzy3H+H7awvXZC2PaIpEFUoOqyYQae/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XJEhgp4BVZNw2sqSQY7yoDG2c9i7xv0t/nv/VfKyOw=;
 b=yH+DiJh2FosRl0zhENm6T0ExQrR2tn/yEyodiSXIG1i96g4jPqVcSWrbjr2BFNzEm9Q+KJK3r83lQHKg8d91N/TFpd5/SiFBLgeIVj+UesNTydXvqPo2jPXfpxChjqH0kIqhG7mCkvcgPODPECi8xXez/8MUdf0EIb7gTyiutG52I6UGmaX9i3SJB55zYd4GXTk0xgcp96RxhgyfDgqSwFZt3G7eSy/M1WoWgg8Og8N2Kl8X1BKJDIOgWTDOky+3C1l5R8m3sjcyGkorPFSc01F8Dpw/hKM7/VonIa1fetjMAY47DgU/4g2o6Y9Sv+3CMTUZSwfcJib1Lk0cP3u9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XJEhgp4BVZNw2sqSQY7yoDG2c9i7xv0t/nv/VfKyOw=;
 b=IQvOe9VYnk3yCPVJcQ3CTthhSD4pVaEZfXGuklhFkuEnXA9UHXX+PiSkxxlS1fStviaOyA9bDcXmEXFKH/LDTm7I4o7OnlRgcSmXUhsJfoJ8oFaGQSvW6UbZ87a+38ycUh36ztRMj/B0XRSWr+9nZ9JgeN9joV3hi4mykZsB99I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/time: do not kill calibration timer on suspend
Date: Fri, 10 Apr 2026 10:55:04 +0200
Message-ID: <20260410085504.32925-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0005.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aad0e8f-f0c8-4c63-ba40-08de96dedf55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HPTd0SFg1bAeagrvAMGTiHt+x2XOA8Q0afzRwhhC0SmThHoNcJskFyFMdsAwlHaDZMoGK4bMVDqwzzChfRqNVbGv9/+qbt5cr+6LcuXJns0G01CICVIemylvNQ4FSWFUQSkhrL+PFx82OeTTJyeK0H+8zWZ+6e9z/ykrg8dFMMhEBhy9l9/6KEQuYfjfZm/m9J5XfMc1MbSPyg3BWdESjDAKzC3tGgVx92mlo9tDEGERCwxWNAcVKAVIyTtC+RVKw77QOw97O1UxlVm1w7JQ8tJhe0ZXQoc22h0Yz81YzEHsReqmw76FrXTkk5A9V0lxItmNL9rzB1pDkXWNk+ML9rqOPCCaD3avG/5DkYuUyRR5u5IAbcSNL9mslWNk6hjZ5KXjQEt2J3Jykb+dq45nO1FRh/3bAKv31EnNPZtWvPF0bkpNRqDIW56qwNxfq5a0M3nQnMjeMOhsDc4p49jbvaPrP1B76SxiDN2y5UDnIvBfXl68j+QJPKQ69AcD6X5ZNRLUxhT9sIs/ZX2R4+n9FIpthkl//BDDDuOzOWDe2x3SySf/6yEuV7vsjej3AWiZzWS3FgIkWFEtOLAmwCZwEZi9nNn94cv7/LJalr9dwV8BpO65IrItOoPYdF8uMWlAnjEfxa6H+VSbBFYJ6LKj7T1oMP7u7N5/DC5MzXkHui04+twoIBSl9ty/62LLCa2QUaZ+YeZsLn0Hf+fvMdurPyBRcf5RjKG/gJLCk3GCA2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmVwVkpvRlo2a2w1RE1RYlppaTVLQ0tqR0xVNkxmK2ZBRWFmSURlcDE5RWlD?=
 =?utf-8?B?OGxmdWV4Vlp6eUhSY0ZQamE3dlYwWlpVY0JCNlJFc2s0ck1Bck0rdzl6R1dy?=
 =?utf-8?B?aVVmMEM2TEZaYkdQQXpkU2V6elhxL3d3SHRaSU4rWERWZTFaSlhwQkdXc1Zj?=
 =?utf-8?B?MVJkbkdxZnlzdmFTSk4vTWhmVUdBR0s3NEN4dk9QTFUvaWxadWYydW84N3py?=
 =?utf-8?B?YjdWbDYzbTJnL1pBU0lDdGlQOUhxWG1ITnJHYmlJTFdUcGRodmYxZWFFWWJR?=
 =?utf-8?B?dTVFOXZWMzVCQnZtT1VBaGN3dU9lVGhVR3NhQXhPVmhsNkEybTdEbUZMQ1FK?=
 =?utf-8?B?SU9xQXZXQTJWbDd1cFZQSlRnTHR0aVFpayt5YWJrcnVxcXhic0svczQ0WHpO?=
 =?utf-8?B?Ny9XUldhY0ZKU005OFhMbzVxM2VDK0p0dEJnYlRzMFA4R2NqN0lQNWxzS0xO?=
 =?utf-8?B?cXJ3eVNSTEFKcGtvczJUTTdiOUZtQ205WG5aMWV0Zk8rRkMzRTJObTlXMDQ2?=
 =?utf-8?B?c0U4MENzUHkrVEx5NHlWMWNCWmxwcStSVTdGaDBjd3NudGJMaklxWmx3ZG5Z?=
 =?utf-8?B?NkZhWVRteEJuRzg3dkdIK3VFbWpjenRVU2J2a1pwK3p3a1NFaUI5V0hoRGF2?=
 =?utf-8?B?Y3NCMk9GSGRDditraDBFV3IxZWMrclpEa0oyZTM0TkdJSzYwbi96dzhhZU40?=
 =?utf-8?B?WThYTE5XS0N0bEtyMzkxV0xQY3hIekExV1Y0MlU5TmluR2xmR0J1aEJORHNY?=
 =?utf-8?B?c1RvQzhCYlp5U3U3NVExK2QvNWE5cSt5M05kaGRxSEtPVTdtSTRQY3FlSjcz?=
 =?utf-8?B?TUVuMXpJY3Y2M1pQd01PTHg0RVlFRXo1UFZWTE1pMUl3ZFBueWxwNW1FWTUw?=
 =?utf-8?B?dlNVbkdncVFCUHE4QW9ZazZMVEpCLzZvWlpNTG53Tmp4ZW1taFNuUXBHMnlk?=
 =?utf-8?B?dXBLZ3h5VHpIMmhzUmZFV1BQN0srQmxBSTBPTjJON2ZKL0FsdTVxQ2c0b0NU?=
 =?utf-8?B?NlA2dmFmcUdKczZoN0F6L3d0RHZuZG16OE5UNmk5OXB3amY4d0V5RmxmSjJT?=
 =?utf-8?B?NmxuYVBUVitXSm13YlhYL2pDRUJydXJTZERUZFdMUVdOYVpwS1hYS3J0YUpG?=
 =?utf-8?B?MHpaQ3gxTENzVjljY2oyT1VRbGZRTUxCeTNlUEpKY0JpNXNtWDBlam4zVnlk?=
 =?utf-8?B?WkVkczFLc1dVQklWZzFMWE9xa24vTzhvUjhyOUhibTJYOWFzQTU5MlR5RkxD?=
 =?utf-8?B?QVNXb2dtaEZES3UvMnlXMU12NHpucWxqVEpjcjBhOEtwb0pyZ1ZXdk5rSzFT?=
 =?utf-8?B?RThvRCsrQkVjSVlrZGJubjJPbW9QMzdsOEY3S3Q0Q1ZHSk55UUFFMGErU2tO?=
 =?utf-8?B?UHNWRm93SUhOUWYvVFNMNGRJY3hWVkphMURaanJwZjhiWUplcDdsZ2dKMVht?=
 =?utf-8?B?WUF5T0RmMlZvY3UrRWtIaVdvN2toNDdCM3FQSHArQ3h6MytRUUdlUkZxeUxa?=
 =?utf-8?B?K09VWkoydThyZG4rekp1NW56RGFGNmhyRlFWNmc4OGNXWE5aL254L1oydnhq?=
 =?utf-8?B?MTR0ck5PbUlSSlNwc3lRKzZtb0VmWE5YeVQyWGJuYWlGK05MdkZiZ0l2bzRR?=
 =?utf-8?B?KzUyRkhIVW0yVWdsdVBMU3lkQ2I0R2hiSnprR1dEU2xYRDBZK3RrTVF6RUsr?=
 =?utf-8?B?Y1NQYk5VUW5wR3RwM0xQQUNLYWJWS2FmMzFnVzhSYU9SVDN3Um9oV2gzc3Ez?=
 =?utf-8?B?S2hLQm9HanpzODlsaFhNV3B1TlZYbEc0T3BZd2lnTGNFN2ZSRmkyQlZYd2pK?=
 =?utf-8?B?NkgwTDJKQWdxZmFPU0pTRkVqbUdZa3NIcHk5b2RWN1FWcllxOUhQa3BpdjNz?=
 =?utf-8?B?T0dUZXBxMW02cDdmUGZBTnJxcFR3WVV0cko2MWpWSmowZVZ6RmdmWmtqekNK?=
 =?utf-8?B?MGFKUnNDVTdJY05GVEMza01CVGtjb3lhYzArZmt3UFFHWE03bVE0WXcxL1N6?=
 =?utf-8?B?MmUyMnIwNzNaN0VXR2xac2ZLYVpOKzlNdDFyblV0YUVKUzBDZkF5WkROWHdV?=
 =?utf-8?B?RlhwT2Fpa25nTXpPSkJSdlFPdEhDQWEzS2l1Q1N1NVNpbmxTY1AzQ2gwYTF6?=
 =?utf-8?B?ZndBdXM1eWRjSFFQYXlUVUdVUXdBQktOSVZqVXoxMzV4UG1STTc1SkxDaXRh?=
 =?utf-8?B?eEN6RUdXem82MUFkd0ZTWERDWkdUb3Fjc2VLOUE3eGtjb3Exdy9MdWRSQ1pN?=
 =?utf-8?B?ZXNqTW5IRVdQc29rWlVZbFcwc1RoNHNQUEhiRlN2UlZOR2p5TCtOY1BVR0tO?=
 =?utf-8?B?UnJ1UXAvYzNwRUlkWS9HbXFJdm1kR2ZtNEVVR3YzcmN6eEk3ZEZndz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aad0e8f-f0c8-4c63-ba40-08de96dedf55
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:55:10.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6HbWh1o4XWPzhlrJhej0EcdpMUSWh47ktHgAAfvmOyx5euDtDoEcH2qREcRF0F7/R0ZH7xvNCbkBLmtf+9yhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7268
X-purgate-ID: tlsNG-4011c0/1775811315-C481C0B1-D6AA8038/0/0
X-purgate-type: clean
X-purgate-size: 1124
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2855E3D4603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A killed timer will ignore further set_timer() calls, and hence won't be
re-armed unless it's initialized again.  Use stop_timer() instead of
kill_timer() in time_suspend(), so that the set_timer() call in
time_resume() successfully re-arms the timer.  Otherwise time calibration
is no longer scheduled (and executed) after resuming from S3 suspend.

Fixes: 6d90db1a2ca1 ("x86: rendezvous-based local time calibration")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index fed30a919d2c..4233ea507d40 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2728,7 +2728,7 @@ int time_suspend(void)
     {
         cmos_utc_offset = -get_wallclock_time();
         cmos_utc_offset += get_sec();
-        kill_timer(&calibration_timer);
+        stop_timer(&calibration_timer);
 
         /* Sync platform timer stamps. */
         platform_time_calibration();
-- 
2.53.0


