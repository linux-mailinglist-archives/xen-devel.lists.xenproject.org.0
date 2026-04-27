Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNVhGbUs72mb8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:30:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D664246FF0C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294762.1571462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIIE-0003Wy-Jb; Mon, 27 Apr 2026 09:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294762.1571462; Mon, 27 Apr 2026 09:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIIE-0003VD-Gm; Mon, 27 Apr 2026 09:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1294762;
 Mon, 27 Apr 2026 09:30:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHIIC-0003Uu-M5
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 09:30:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHIIC-004gLb-26
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 11:30:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ef2ca3-bab6-0a2a0a5309dd-0a2a450797c6-16
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:30:15 +0200
Received: from [40.93.194.14]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ef2ca6-229c-0a2a45070019-285dc20e2fe9-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:30:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 09:30:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 09:30:13 +0000
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
 b=A8ZkksxYOjjjKNuLjVofu5dLoNrlczeYzblm9rCTk2LdQLg/Ez4ezZXQl3pIoqZN9sQvupa0vxqnpCI2QoXemnaHL73hN8y5IqiT2cB8oeUsD1DMuZPiulleBRhduNruhsEFRsiw0Y0x2EiWldwteCYmPgqOLlOVC5RTwznC2kgoWRsWQvQkZuJZofiyJgWS5IvEmj4aoN4FaU6ub8IOfiCesQm8D4Ek+IJBH86QLTLJU39YvVRtuQ1wOvpAjm5Vi5CBDGx7mne/NCPQ9pWU5l7786Latr8p4BHLOuxI46yuX+0+06vQPu+qgFCqUhjRjxDciRpy8GvilvNRxpxMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNCHFnMxk8AkXV10V2WO4PobGx52g6/NGPrUDNLWXHw=;
 b=k+gwatWsd6eGrjqn74wvFhi1fGPIZOn44WBuoVVTZhEdeT93X8UzGEXpOLSqDzXJu2uKQMt8rMR6guo8ZBVfNmN43h4hH9TD/ALajGJskGE7j1SYisXCtKKv2GG7cFyWF0LGuwQoOUFTDFwKq5Vs8SjD7TX43D76coFxYwaXUW4oObBR7zz5VNfVRCw7A7UBWvY4Y8RYt0icl/BvPL/ONJqq6/48DzbWYOm4pwVNDs1kh4a/0ZMgDDiMKDPuIkbF/KKvLo64fNxL5rZGHWXCjj74bkQ8ADDqotF06SYwTjgIQRzWGxAoJkfgfYoPPHw1m8/W1W53uoINarsL7KIiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNCHFnMxk8AkXV10V2WO4PobGx52g6/NGPrUDNLWXHw=;
 b=nAVRWWfFaczAUL+7PEutBdNyOWt+o6x2i5r1wD2R7LsbgPcSeJhGA4+L2eWo3+FnJkT//88x6DxuIquTUxAolkwo00QMwLDrecVr54eP1nE4EfOsVuZqWXuMqNiVHvzmp5eh6WwvaYM0jnAL+xYDHu6hkBhum7HKZ/R1yiBm4rM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Apr 2026 11:30:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/shadow: reduce flush_tlb's scope in
 shadow_track_dirty_vram()
Message-ID: <ae8soeRS09818ulY@macbook.local>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <38581c16-e2a0-4f7e-a08a-3517063a27cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38581c16-e2a0-4f7e-a08a-3517063a27cc@suse.com>
X-ClientProxiedBy: BN1PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:408:e0::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 799fea73-dfca-418e-1aed-08dea43f9546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5nA3uQ0E7OVEUzjXpaihwELnMElpRi6eFIoQ766PfhfVMaU3YOwRX7CdCBKbPKQTssAqbKOiEGO4flPYKnopZ6Das64+gXr7V8rcDIOJEr/93qWH+jYkwj50UVw3wtclQz5YtK/wuLSmH7T001VdOv6I+6JLFZar7wFz0AfQaEl3061seGpLaTcJtme5VENG6G3p76MSrHdUB6xc5Ddy2rYEYru2SUzZdy4kbW0em+yEr1gC6/cAoZRlQD026Yfu9w2Tt6MOX7BjtSjrtLZw8emUWHaIaeJAlffRiRA17W8KeKvumy1M9kwidfTpHMOgcSLt0GtQGbTxCGeKkQ8DKNzG57wOft3kwKCIv50Pkhwf3C+L7bJdrN1amIf0c4hmajetzzbnyqW5vwlpSB/TzrNgA+sqjIwZmYdgyVe9ww3f7vTJ/SKEjOQ5Q2aORKuwDb/D3VMK9PfkCv/3jFaa8FxM867ncuyGF06bE+YMEFfN2wNWACYWXFkLDkPCyTwnSxSxzni7ISUUF7y82YDJiDwr1YGQ09ZsSM+PcoyqPKURGVwCxjO9yvs0XqIWysvqi1E2hgAl3m6LzrhErb/0tA997nYQWLlZKtcYRBZygj8caFgiC2JXbR4dd77YqORa/1vwSPwbYybPNydfMttAJ9dU3VtLvldsP51Ne13pplK1XXOxaAktNmUXPzYSUvOjSjm+KA/KhMXsDNWxtT5hLWPTpV2E5fnRIT5CMbmxuGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVZpZmpZc1ZMSkVDSUd1bjViU1lpWUxpTmZPdVkyRXZiQXNJU1lOU3JOVlU4?=
 =?utf-8?B?d281eXZLRCtSc202c2g5ZE9RTDVUbU56K0FPcVJoVzBsRGZpZVh4S3FxRlV6?=
 =?utf-8?B?N0J6K3JyNzI2emRjbVZaRTVOajRrNUpLM1E1cGEvT2M1eW1NcG9qOVVzV0Zp?=
 =?utf-8?B?dnFHZnpST1BuNS81Wmd3aS8zOWlKcDZudnloQjZIcENoOU05QWlrcnhDMXRy?=
 =?utf-8?B?WTlSajJiOVhReVVRWU5qSVRHd0ppSEh2UFA2eW5vcVRtOWV5bStDRGdxOU45?=
 =?utf-8?B?MUNaTUo4RzlPaWRScmRvNGM4SzVndzFIK0lQUEduVUtkZHRTSmFCMzNKSDZl?=
 =?utf-8?B?ZkR1cTljdEUyeGRtdXBrNUN0cHF1dVpPV2ROMVJaeHVIWi9aTmVZeGhoSlMv?=
 =?utf-8?B?ZmxiVjllMjBNb3Z4WHl3Y0dJQ2NmeTg4UVhhQ3o5dHV2TGFSMXpmZGZ5WkNI?=
 =?utf-8?B?NDNSYmI3OFhJN3NmcUFGZ3pCNDVLZm90dWllaXdIUmtDdFg4L2NqZ0hxYnpY?=
 =?utf-8?B?SFF3cDVBQ0krRmp0MzlvZk92bmJoZlNRNUtYKzl1eU5vN2hoUVc3MWVoTXRz?=
 =?utf-8?B?am1HUGtiSExvMXpxNXVZZk13Vm5GelVZRlZlOFBwZXVFSndYQWdLbGFadDVH?=
 =?utf-8?B?K2taT0FnSzViQTdSRVZ6cTZMMytZVTExTis0UXNxYU9FNno5dmdjY3VkbTVW?=
 =?utf-8?B?TVZnNTFNUkJDZHk1eWNkc3RUSGFwNUdqank5WmpmcDk3MTJzYkROUTFXcC9U?=
 =?utf-8?B?cDlIQkdaNUNNTkE3dmRBMUVMVVppOW0wNkZVWSs4N3lYczV2SDczMzVSZ1hJ?=
 =?utf-8?B?NnlMMHUwTXN5UE15UEw4b3NMb3JHQ2dPa0o3Ny9oWmxSZVJTVWNGNUhhVVRP?=
 =?utf-8?B?VzJXZkVpQTN0QldDM1A2dGx4Z2FTYTlWOUk3eEJ3ZUxxUXBKTzN3bTBVVi9M?=
 =?utf-8?B?WkVVR1p1MUZJbzZrcEEzdG5ZekNZNXVqVHNuTGs3N2VORGUvclNPZUt2eExY?=
 =?utf-8?B?N3VKckxxMFgrRlJ0bFFXdUFYM0cvWHFFUzZ5TStUbk00YzROVWRJOWN1YzNs?=
 =?utf-8?B?UWJsS0ZWZndvQ2lZQkVaNWtrc0tCTkxJdk5PSzRjRUtBdWZmT1NhYVhCeFZp?=
 =?utf-8?B?L1lEZkhnQ3huMlVzUkNENTJ3NDFzaVVWODdxNEwvN1lqWTcvTjJ6SXE5ZElu?=
 =?utf-8?B?dXhjUWdCcS84Zkx0dFh0TUw1YlFnWnBmcnNlOEFzeTVRWURGZ2lqbVpxVk1q?=
 =?utf-8?B?YUF1bFIveTlTTEtTYnFkRzFhU3pCOHNYbDNlQ3ZDS3krNGRCU3ZxYTdtUlFZ?=
 =?utf-8?B?NjdhRnZjb3hVakZDa1lMdC9pMVZ5anNCWFNMaFUxVHFnYVZuWno1bnNUejFR?=
 =?utf-8?B?OTNubTBtTFVlZkZFUkduNlZEcStYNjZaWW9DVjYweHNxanhzQktDTVNGQThS?=
 =?utf-8?B?MDYwdys0U2FYc053dExLV0I5bjZudWFlQnRCRTlPekFIMldPMDNTU1pYMXQr?=
 =?utf-8?B?R1ptWnBsNmZ2VUZJNnl1Q0ZEZEtyVEhySGZoMkxqL2hleWdtbG96OHNocC94?=
 =?utf-8?B?RlpuMnRJajZpdWVyRFI2WFR3UzUyd1lzcVBGU1Mvam9yQklQb3JwV1lGYTl3?=
 =?utf-8?B?Q055K1NvWW1Xb1dMY0RQM3o5RXBHWXBzdEtLZEI1TnpNWUpCMDNFdk50MHZn?=
 =?utf-8?B?WGNKVWdQWWozWEk5RnRhdjR6MTZRRCswUE15N0xMdXlCSVFLQ2kxL0Z1VDh6?=
 =?utf-8?B?MnEvb3o2N2JOaEl1bEZGVEFBRTdpRGtJeXM0LytoYlM5ZzhaTzZCbmlZbHRp?=
 =?utf-8?B?RUJ0RXBjbjRQcUF5K1hSb3M3c3hlZlF0SWFxN3k4WHdlWFplWk9pY2VaRzVx?=
 =?utf-8?B?cVRWb25FeDY0aUxMdzQ4d1ZtWnZWVzR3dTlKNFNmSmRNcWdmdDdHU1MzU0dy?=
 =?utf-8?B?ZnZrQXU2ZEJpYUExZjdxSytzYzlDWVlSTktwb2hxMTFGRmJYUUVVRTN1RDFW?=
 =?utf-8?B?V290ZVZGUUtERjNkK2tjSFd3SXM0YjEyeFFTSHVpeUVKQjlxVEZTdy9ScjdV?=
 =?utf-8?B?aldvY2FuM2NTN3E3dERERnNzY3FSN29VWXdXZW10OG80cXZONjRrQVhvb09j?=
 =?utf-8?B?bndpclhOYWZPOWxONjJKYjZRNzNsQmZtU3lQd2lkN1MzU0JYbXNJN3poTzF6?=
 =?utf-8?B?MFl2RUsvMTVpVG15NDdlZ2IzYlMzd2hTOG56WWl6Z2xOV2g5bExaN283WVJ5?=
 =?utf-8?B?SzBFWFdOT0xPMDA5M1F2L1Iwc0l2SDh0Sy8ycDBrV285VStrc20zVkdIUFl3?=
 =?utf-8?B?T2dSZ0lha2N2eGt4MHJHNVZBaTlmenNpTEVqYThHWDA2YWdhTTZnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799fea73-dfca-418e-1aed-08dea43f9546
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 09:30:12.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcU72IklvYx8BhQOocKL3IN9IrbSr+Kt9iTpSoxBz8eNCs6MM5lmM4Yal++ZbuK1ylPqlvr3xaFhUSJg2dnkog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6368
X-purgate-ID: tlsNG-ef75cf/1777282215-ADD6FC48-49DCCD0C/0/0
X-purgate-type: clean
X-purgate-size: 387
X-Rspamd-Queue-Id: D664246FF0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
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

On Tue, Feb 03, 2026 at 05:50:31PM +0100, Jan Beulich wrote:
> It's set only in the main "else", so the declaration as well as the sole
> consumer can also move into that more narrow scope. This may in particular
> help with possible future locking changes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

