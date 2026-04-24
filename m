Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDvaBHiN62lbOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:34:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F68D460D0F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293745.1571268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIXZ-0000qg-SZ; Fri, 24 Apr 2026 15:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293745.1571268; Fri, 24 Apr 2026 15:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIXZ-0000oV-O6; Fri, 24 Apr 2026 15:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1293745;
 Fri, 24 Apr 2026 15:34:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGIXY-0000oP-11
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:34:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGIXW-00EhX0-VK
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 17:33:58 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8d5c-bab6-0a2a0a5309dd-0a2a45019fae-16
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:33:58 +0200
Received: from [52.101.61.7]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8d65-c1f2-0a2a45010019-34653d07e22b-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:33:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7747.namprd03.prod.outlook.com (2603:10b6:610:23a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 15:33:54 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 15:33:54 +0000
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
 b=psi/kyokUD+9wQJVYBdHMchJT0jvdb/Vig2Zssaf0GyC6OhV23lCqwPKRVs+tXI0fy1dGg23XHnC0V5cWPqlvTOEkcFIA+mdaJiaVKLWQsp/ol7tw36jHEzF5KGCNH9nzS/L5JUx966FXDQ31e38QczUFKrDAHVVH+t1K+mBkGdiVN48bWhlNATfORMpGroaeU6aL6jpPynRI2MH2QC9/+zdAc+09jBZltOpCMbdsIxy6THrw2qFj9bdC/aIdqOmWU3WPsGe+Y4Vqy+AxQo/1Wtu7RtgGWVxGuyDBKuU0taBxPJl3u6JxPQu1MXJvzhwXSkn1YA7ZRF/liWNqSXxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DE/BHIikYq5tbOS2DaaMjqrjw+0xUtVCDg7y0Uqbn+M=;
 b=jRYlR4m7TrjkGe+GcbQ2yqIeCbCe7VG/KlxQiRyE1cC73J4ZsVMTJ1MigXPmQLU8zaQxuYF9NnTmfwU4LK/AE1prKUPQs4gNPlI2IwDb42J6aUJfCA8Y9eunWAPldgAry8lOU4tc7Vu04X7Ck4yj9Nf1OV4/bIevkpxx0K6JGID3y52LcV3W2VqeJfcS/VbFOpywVSeH47oHERfZGFf+P34FRPc1o2lqCpl5NxjFnredZ5XQN1axU31wY+aAi6BhOWCeZLOKv1GhUnkL7OD3cLrGC04k80MViefm0jFxk0E2myCrpFs4UHjG1/038+7tNkIT7PVrXHFCydkjDjbaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DE/BHIikYq5tbOS2DaaMjqrjw+0xUtVCDg7y0Uqbn+M=;
 b=rPGIB2EjvgoXE50Uka4jLkhQkV7n9A4K+17DwvdCNGZINNOWQPL2oXWx0PVex0VmesmWjC17kbiqCXP9zyr73nLOOTxNy3aOEsn2ndVEQgtzI1gmcFOsu47/WYq9eCkvucv9dsm6g13K/I/wqO3gVrFXQ9MSrWWvK0PYcFPxkSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 17:33:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] x86/mwait-idle: move pre-initialized struct idle_cpu
 instances
Message-ID: <aeuNXj-ub5Kp9UJU@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <797f444b-886f-46ed-9672-a0f302d47336@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <797f444b-886f-46ed-9672-a0f302d47336@suse.com>
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: b895d283-f234-41f0-a9f9-08dea216e481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8o0qWNBuGKdxJj4Bhl3JjJjszEaz1+k8irvfHJ3T00g/MG1Rg8OQy/mUTC392rk68EZzd6R2OQHLjoXd6yRA6F1zmC/YbFMF1fr5D5T5e1TX0+USUCwZqYguY+MSbtnkYFrPUIlYJfCYtH7DS4a7xvv68yhfF4b6CPg9tPMRyjOc51h+ng95A1LoYExgBtbG1zi+sX8TAfYFNew5ehilitAQn3Pl02YsYBNX/8BLgBlmlN2QTyAchNQZPrS+wCV5hUwqvBdDj90hl5IGSGfruacwy1gtQ12sqkV/+xQCTS20PorKIhKPMyuztYHI9tz6LNfxuu5PWtpMs2MInslpyB7NhA44Rq2TaiqowueSaT19MuSIn66cQLy8YynZkmVQIIANDO47LgpU4uakyrerP7sj4ZBmimkKXUEvmIfn7akbdJytQrA4PpU76pHkoBDeYpsvx6/tcEMYqf0CaofkXVBguULJ0NgHkQyBJlXlHMqynsVHpixzghOXlYVcGfOnfrbBZRHwYfYSnPtNVv94oJmVaC2BSRdehcj5OB30r8ANGOE9PQ+do+GzhUeSqZ3gohyLs6am4JTUeKt0OuoE4hTdgWJm2HQAKPMcEx33pv7OBaJ7sf+/DPfKUN+h7qD0LNvsTYIqo240E+o0cVrRF939Z8CDzUNFty7Og/avKMmFLwONt0cp8yPFoUoJe7oqti27gi1yuYSTDkMylhPhcvMbEv90wLX7UVldCC2rLG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHhobjEva0d1WVNydFd6QlRmb0hmUDdwNUZYRnZBNTliVHJ3WEdrV2xQZ3R4?=
 =?utf-8?B?Q2E0N3N2eklFdVZPMkpycnQwMENxNWVJc2xwZWl3SFpoT3d2TnFuWVV0U0wr?=
 =?utf-8?B?SVhmZjZReHRxS0d1MVpRSjMzWWE2WDA5R1dsQy9sNkdGOU45c05VVE5IdExn?=
 =?utf-8?B?eTB2cEN6Yi9OSGhsRmc4bzQrdGo0OU9wY25FMnFmT2JSQ3lySFVDMVRqR3Y2?=
 =?utf-8?B?M2JoVis1Z095am1vZitKeWNRR1BBYVhhUXc1RnBodCsrUTRwaThEYUM2bmQw?=
 =?utf-8?B?WlozN0Y5eEdLbm51UFV5cXB5OEUybDY3SmZUNkYzNW1IOExTakk5a2JOb2JQ?=
 =?utf-8?B?QVFnZncrSExlQjRFeDVXUWdDNzhVTzVKNm5WdWtzRDBHYlJYVUt3WmRSTGI0?=
 =?utf-8?B?Q0Zqc2V3LzlCZ0FJMTRZQ3IzdW9SZW9uWkRWMnAyZXhCU0cvZmh6bDVGaEEz?=
 =?utf-8?B?bU5KNURGaTdBZXE3WlpRUHNiSDd1MmZQZ2hrcnU5RnZZZDJTNi9MY3dJYVNt?=
 =?utf-8?B?WkVHQ04vNjhiMVVwcFN6bmNQUk5DVDBUR293cEt5N1lIK0dJdm9NTDU2c2R5?=
 =?utf-8?B?eHJlV0hpZVA3UnZSbDRVQXEwM1FBUm1Oa2Rwc3FWTGEwSGkrMTlLL3E1dXJX?=
 =?utf-8?B?L0l1MGovaGJBeHJRV1FHRVZYOExGUkhOZllzQmdEZlh2VW1nd0IxN0ZnSG91?=
 =?utf-8?B?QzVPMHVQZHJFNndBMDBjWE1aVTdlQzNKQWhrc0xhL2ZHZHJVSXhmZlB4UzBS?=
 =?utf-8?B?d1ltREhWRTUrbTJjbXh0YjR6aEd0UFpPdlNSdDYxT1kwdW1pU0ZEeStvcTV3?=
 =?utf-8?B?Wjd6cCt1ZWU4YVNFOEhRZTNRUkxFMnpJVlFPVnVtRHRRTHd4VjExV0wwSFMz?=
 =?utf-8?B?MTFUb0IwanR0SjZVUGFYcEtMc25qVHVSeG9xUi8vdkR3T1Vyd3drdnl4dnV3?=
 =?utf-8?B?dk5ZSjYyZU1oVzE4TWdjWm9pZGptSWNBdXVXZDdIMmJUajRnSXU3SE8zUzIy?=
 =?utf-8?B?RGNMQ0JCYzZYYW0vUHh5bE5lSU45c3hDUkZHd0ZheVViQUJRQjlDbUdRMHRx?=
 =?utf-8?B?R2JncDl5M3BvNE0zei9STGxHTkFMWDVwQTlLSDZYaTNFRkZCYXhJNGU4Z1Vh?=
 =?utf-8?B?cVNZWVFkT2pUSVQ0dU8wN29lUmIxVXdNdmx0MXZvNGVIb2FCN0dxNWlLenJh?=
 =?utf-8?B?eXdacFR3TXRBNGFGbk9sT3FrT000TTNUYklOQWVPSXovZWkvRGoxdEZTak9j?=
 =?utf-8?B?ZXFIN0IrVmplNjNHRkY0NnR6NnFxK0JZM0hTZkJ1SkUwSFNuRldocEgrTGIy?=
 =?utf-8?B?eDg3d3BmZHdZcC92Sk9EaUdlNXpxSC95YlY4ejRGV2ZaWDl0TWNYWHFkd2lM?=
 =?utf-8?B?TzU2UVI3RkhxMk1QSXRIRFBCUjQwZmFOWENZOEwrZlJ5K0hGQmR5bzJaaVVo?=
 =?utf-8?B?R2twMktlWUpWZ1pGWmY3dTBtNlQyd0JEUkk2Zk5hV1lHMldka2Y5YnorTWNM?=
 =?utf-8?B?Tko1SWo3Yzd6UnlmdnJ4QThaaldZYnpUTDZ0Y3pOaWtnQ0gyWjRadk1IN3JX?=
 =?utf-8?B?K2p3bSsxNTE2TGhMcVl2VVZWZ1BtVVNETmZLOTJoeldqVVIxVFJ0NXA3bmR3?=
 =?utf-8?B?RktwNERnTHhSbkZ1VWN1cVNTSktwZXMrRFh0SEVjb1VETllwMkdjZUdGK1JK?=
 =?utf-8?B?SGZOV0k4cE9UR3ljTUhpWHJKUTNncUVFa0hxcmhaYUhpZkxXU2FuajJQbE1W?=
 =?utf-8?B?RlhaUEI2eTFQUWgyK2RoZEs5MjYvZTRaRTBpMUVMblAwaGRvQkVMK0tDWGFH?=
 =?utf-8?B?clJoeHBnNlcrMmRhc2JPUDNsanBvNkFBSTdBRjR0N0krZFNRYXhPSGJ2a3lV?=
 =?utf-8?B?WElhamZiaDVjbldQOEJkVW5aTGpWcWF6M0kyb2cwV2x5cE5LTG5tMkJJd05Y?=
 =?utf-8?B?NkFRMlowM1ZIZUhQZlFRVU1HVE9BakRuS2lMdDRSUlkyOGFNNnZWVTVqa2VN?=
 =?utf-8?B?bjJERU1sbTJsMGxrZUNRaWlXQW9wbmpoZWpIUUF6K3JHWDZVS1JqRWRIVjU3?=
 =?utf-8?B?eXhtamVQU3Z0MzA5dnVoMkZCVk5zQm1nNXVJaDJrRGJzUjV1VVdya0FFVEs3?=
 =?utf-8?B?TDdZbWVteTJoQklHcDBpQ3JqdnpZSFE0L2xoS0tBcXpLMGtUNHBjS05zUGZs?=
 =?utf-8?B?ZmxSUGFzRUxyTzJsbDR3RXdnMUl0T0QyMTRBSU5vY3NtbUZuTFdJMk1tRjhW?=
 =?utf-8?B?N2JzWEk1bzBQbzNzaXVKN3k2b0RmRnZtdHluOHhYY2pubG1zdm56Qkx4Y3gv?=
 =?utf-8?B?WEFyczNPWlVOdGdDdUtlb3JQalNCMWoyUllZSTZEYW9xQ3lGODJ1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b895d283-f234-41f0-a9f9-08dea216e481
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:33:54.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fofdPLmHnHNZ5OkmyoRXCindSdoymYH7DpmUCnY7LlkcaKxm8n7uuQiJieb1nruIGzzbew2FfHSkRiXoUlfJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7747
X-purgate-ID: tlsNG-d62444/1777044838-BDA69FF4-29900B37/0/0
X-purgate-type: clean
X-purgate-size: 650
X-Rspamd-Queue-Id: 6F68D460D0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:55:50PM +0100, Jan Beulich wrote:
> Now that they're not referenced anymore post-init, they can themselves
> move into .init.rodata. (idle_cpu_adl{,_l} can also become const in the
> first place.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Oh, OK, that's what I was missing from the previous patch, then for
this and the previous:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I'm still concerned whether us diverging (further?) from Linux
would causes more work when picking up upstream changes.

FWIW, I would also consider squashing this into the previous patch.

Thanks, Roger.

