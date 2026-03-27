Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNgAKOF2xmnwKgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:24:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671134429A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265530.1556385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66Dn-0004SQ-8n; Fri, 27 Mar 2026 12:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265530.1556385; Fri, 27 Mar 2026 12:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66Dn-0004Py-5q; Fri, 27 Mar 2026 12:23:27 +0000
Received: by outflank-mailman (input) for mailman id 1265530;
 Fri, 27 Mar 2026 12:23:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w66Dl-0004Pq-Jx
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:23:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w66Dj-002Vfq-CK
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:23:25 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c676b9-5cb7-0a2a0a5109dd-0a2a450acb0c-14
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:23:24 +0100
Received: from [40.107.209.63]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c676bb-1772-0a2a450a0019-286bd13f2ffd-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:23:24 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5833.namprd03.prod.outlook.com (2603:10b6:806:114::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 12:23:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 12:23:21 +0000
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
 b=lDcxe0yhvHeM6sJJYBtYMhqQhHerZ60EJ9dTjZ3VOcEMnoB7WdmMW+4JyGJfF887auxxyquG/fyno6Iy+tzuIwbk+FrFPvTC7C6eKYl3bbpFb9jYaCIuERffbJ7K0gMPLRcGK5wyWNPIa3sBEIPGiF9+L+uedTW67sPY5SmS8L4KusO/AxSsiDiJFNikwHOsxaPYepQ/TxTwWF9cs7z+WIIVfszA7Vb6nuBngeUeOYFemr0j9muY+5HkS5xYwiXrQEoNlQ69UJJfrgYM8aJgtQ3F0lPyQu1ylQGqNKxHjJrc0dnBvVHWbKcR/fo2sZnfyTkP3rKw7UrsKm5zijnjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsZnhq0sZwcOoKP17KmNt95ytMCuW07FZhhsS//8P9Y=;
 b=IRMpWaH4aYpsl1ebpwAjTRs161TLa8RYQ7sXDrBUzieq4rIcEHqMYmL4JBZKoDXbJI86+Ydty+9M/O+PXYKF3r1TOR6AsSXJI3oq4mZDGetVGNT/twszlaqvaHcLpNSEzxwmXw0AbBEam/BdihKz4e1KD/Sfe9W3YsSrPE7DyzLQja/WEfl1HYwEO8RXK/xrwnh3ZqCj3ljYgzcYDxs+8U2UowJKGtD0o3H5qH9iqt8Pke45Tfo173D4P55r5MQJwA31YZgpeInYRa+faq9MStCmIYrg2Jrm9e35o5XXCVQKMcqNsywAmlWaDcQ34VlHYFdv9utC19yrabaxXyuxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsZnhq0sZwcOoKP17KmNt95ytMCuW07FZhhsS//8P9Y=;
 b=JtoNsJVze/U5fPs+CYcu7cxu8bSH4DeqZ1r8Fx6n7znalxuxktAHSxp30BfJ9deuawOi3XifV8D+quArWFSAv9/M3HAG5obw0qfEpeGO78Yq2MYr+94h5+HffEnkijDrtVUI2iqlNS5dBuEB4awgpkamqLy8HxKK7pE7lEKkhwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a7303981-ac39-4562-9899-205c281d3ea3@citrix.com>
Date: Fri, 27 Mar 2026 12:23:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <acZZmGXIJlmN3KGm@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eeadcb3-0043-4a28-1fee-08de8bfba28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AfTKaR3GBdSVygyXD663ra7cRl4BXWRJBEAQfmb0Sf6uFdifyTsSd5BA0tiz2wHuoOFuEiGoMKG1blsBiTOL82ASR6pMCUgyLCAMHejTNQ0tAG4qzsvQFEnAf9jkQsLBQU9lyjKysC8/beFCeiQRPQE6lU54KNg2AqPehph6mWQIUqDpJljgQnPND9ZQ4ZgnGy21+MwVEEFS/xexXOeH4N4FmmZ00R4WvZFqRDzZJDwp47k/BU0ur7QvcjyhcS/7d1Bs36gBVaVsyXrN+OfGMtdbNUHUMksAiCcdYCjzge9TOUOkB39aJfBfBGTorOSskGDL9iIkHVSmOpfKMKK/Q594cPrBoNkUoWamSlaCnqLyg5HYEvnr4rInUS9sOYH2qVFCEUNGz+n9bYt53sSGKYtOXVuHgD4UVdjIaWS1ZNgyvS6WPgOjX64njArcBFYBzp2U3+mfEl/JO+l3Yrz2w3XamtJkKyJXBb7wDzoWDsB+0q2LEg4RdkaSJMnbUyakMnon1HBUP8AEeW7v4/SVWR5RwijEHOLC7KLASGNPYc0w+QzwLEBUuEEl1WIBO0gz3T3Mh5oLEAh4H1yqoV1RPs6MylC+Gz+TFPQ+Hq6ib3Qw+63ZFgQeN/urcTw5xaCTA8I4ZQ6AbHZlky4S9PJT98yitq0no0/5WHDdr0WKEdiGywbsetQVrnr85JvasFW/bF2bN16f+LB1zJ+hvalwsUiIDJnFGKdYMwNd72nG/VF6QywqZGkh5mYSx26houEa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0ErRTZFM0IxZkprb1pnOWR5Zkp4T3YrTFUxR1hteGovNU03U0RZWmw3WUZH?=
 =?utf-8?B?dGZWZmZKUW5JK1dOcWJwd3hJOHB3Z0JBTUFvUHQ2NTdYWENRSEVrVkxneUp5?=
 =?utf-8?B?UngwbDFNNHZEQ05ydzVyRG10ZE5veXB5UGtRM3RMZDhEMTg3T1BtOUJLb085?=
 =?utf-8?B?Y0lqZ1ExSUtpMzhOdzFtR251V2xLVnZNN2Zzb28wdER0VEJicmN6cE91VUJL?=
 =?utf-8?B?b1duNXl1RHRDUTRWcHdzT0VjdC9EUWtPMDBrREF6K1htRWU4NG81dkt3dEJz?=
 =?utf-8?B?VzJHWENTV3M3QUVCVlhVMmhBcXBPSS9XQlNzcTU2bXFtQXZnL2tUaVJPb1I0?=
 =?utf-8?B?Z3R5MiszVW5yTWtXdkpsOGdaZDlhcEJ3Y2U1dG5aY0hYYVRjMi81N2dqTmdS?=
 =?utf-8?B?TW1ZblBSUkZ4dFJ5TUc2QlE1M0pqcGtFU2k5QnVqSWxkZHJsNkJXSVIySlJX?=
 =?utf-8?B?VkM3STNtZHhSdkV6dHpkVnRiUitPdmkxY1JkTmpzRStKMGJwYkx3UDQ2L0V6?=
 =?utf-8?B?MCs3WDBJc1NWUHBkQ2M3eTZpOUh4TEJDRGF4UzEyYXlUcldzN2xsRG5oZU93?=
 =?utf-8?B?M0IxNGNmVnVWR2R5blFRQUZpQmxZVnU3T0JNRzIrQlFSYWM2elFhQnVSYVZF?=
 =?utf-8?B?R3ZkWXlDbHJRVnRoNGIzTURRYjh1S3FyYTFDdFhmYk0ycnNZbjFaTS9mWjd3?=
 =?utf-8?B?V0E1VFBNZ3lYVWhsYlh2M3V6MHJLVEpVc2xOK1JnNzRuMWs5ZXc0aThlMXpi?=
 =?utf-8?B?Y3o5a0h4ak5CU0Jna1Fvc0hpZlBPUkk3YzYwNnZscFk0eWFZN3hzQnBHZDQ2?=
 =?utf-8?B?ZkdJbGxMUkV0VkF1azloeW5aUHRld3JKRTFoNGE4aHFCOFh5UGFWU0pCSzZw?=
 =?utf-8?B?ZmRORmVDRERZRFg1Z3FJNWVJeEkxdWJXY2tjQVV6dDZnUjRYdUhxN0IrMjYv?=
 =?utf-8?B?ZVhJMklhdHB6NkpNS1Y2L09HbUUzNmJGRW1xc0FvZVQyaU90YWxqOVZwZTVw?=
 =?utf-8?B?ak5rajcxRm1tVlczNUtMeEN1Qzl2UTluaEV1dmFWbFhSL3h3Z2IyMnJIdFRS?=
 =?utf-8?B?T1NtQ2hUQitxQVRDaHk2bGRvS3pPbmlGR0hObVloZmVFVVRUMFlXc1R5emhB?=
 =?utf-8?B?ckorSFVOK25xNnJ1cldkQnpOL1plZmVIcjlrNjRsQW80L1R2WTFWeXk1U21C?=
 =?utf-8?B?ejhad1lqZ09Pb3cvTEYyb1k1aDFISGM0NjhPaGJHODlLL1loR1NNZ1JQanB0?=
 =?utf-8?B?bXFNRjVBRldBUWxPL0lOckpMekZnbTE4SHM1S01vRGFVNXRaUUlHM1dOQ01N?=
 =?utf-8?B?ZWEydXBmaldaMHYwbHR0VC9hVTFDMzd3NXRlTEY5bUhINDZwWEJ4K2RSamQ3?=
 =?utf-8?B?dHlMWWZXdUlucnl4SzZ5MFI0SXg3aEN1a3NsdC9FRDBLSVlIRXlsbUFKblJt?=
 =?utf-8?B?MzBUMVVhbEVEMlNNbkpNYU9UeW9lTEFhOU9QV1hRRkNBanpKSEtvQ0czQmhj?=
 =?utf-8?B?N1pZT0tRRStVWWJuVGdXWTFDemR3K0x2MUg2ZFJmaU9jREU0VTFDL1V6Vndx?=
 =?utf-8?B?QmdxUy9DeityYnVYVW5BUUR0TVNEcnBTT1poN0R3WVcxK3lDMkU4YStyZ2lL?=
 =?utf-8?B?SFlzVHZRRUV1WTEyT2NaUmluUWZtNW13bVNiY3VLZm9ISWZYell0MVM2NVdP?=
 =?utf-8?B?SDJCOHlaSDRBMXVqQlMyVGk5WENxeUp6RUlIVWpCS1hCeWF1RHVlTXpsczVo?=
 =?utf-8?B?dVFEODBIYkNFOU1LdVE0V2NxZndoUmp6akVQYjJqZ2VFRTE0QTkwUXlDYnRC?=
 =?utf-8?B?TGg2ZEluWXpqb05RcFNoYTgvRmlQSlRCWkRBZytpMTlGcktkVlluaEc2ZWUw?=
 =?utf-8?B?K1BwaEFYS3RQc0pvVkljUEhHNTlGWW1SUlE2M3FQeG9EYUQvWHNEMVlMYlNL?=
 =?utf-8?B?SEp0ZUU5SkNpVTFMdmJiUzRFK1ZVOVdCbEQ1bnZHa1d5UFh5bFRFWHlDVnZy?=
 =?utf-8?B?dDE2WWVSSGtQK01mcVRoTEdIK1gxL3JodFZqRXdOVjR6N0VTUXZINlA0Nkkz?=
 =?utf-8?B?d3JZUnNnSlgrbXROL2NiWHA3NVJJS1RFaUc4dGVObkpJZ3VFTytoU1RHcUNh?=
 =?utf-8?B?aU1WbFRrdXRBU3FjcGNHaWVRRDhsWDBNY3NkTTZnYVZHeUpZYWdsQnJzdXI3?=
 =?utf-8?B?L1lna3pzU04wZHFuMjg2Umx6TGlWa2M2TlpPeVZUa1RQMlZ2Z0hLbnJRQnIy?=
 =?utf-8?B?RHpFSytmWUdGa3BmNnF4WW00ZFBuVlgzM3lZb2FUTUpBQTNTUkx6TW1MeTJE?=
 =?utf-8?B?ajd1Wnhxamp6RngvQU5OLzc2STRrNVVreFFUZmtJd093eFlaVHE5V25pOFp5?=
 =?utf-8?Q?/Sp2ov+aoHWRAPP8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeadcb3-0043-4a28-1fee-08de8bfba28c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:23:21.4058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVjJ64w62IzZXrTCRgbcly1bm4pgWqQsL8/Fs4mcKmA+6SfpwPIAwk5h9URrJ38QUyVkoPyFP/2cleA57Q4sAbR/Tla+rgNb1pSPF3SEWyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5833
X-purgate-ID: tlsNG-4011c0/1774614204-BF096900-CC7185DA/0/0
X-purgate-type: clean
X-purgate-size: 1447
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0671134429A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 10:19 am, Marek Marczykowski-Górecki wrote:
> Hi,
>
> I noticed that on some systems, there are a lot of IOMMU faults after
> S3. I can see it also on a laptop with MTL, but it affects also the ADL
> gitlab runner:
>
>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>
> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.

Ah.  HPETs and IO-APICs get assigned an otherwise unused PCI address for
the purposes of interrupt remapping.

acpi$ grep -A7 HPET dmar.dsl 
[060h 0096   1]            Device Scope Type : 04 [Message-capable HPET Device]
[061h 0097   1]                 Entry Length : 08
[062h 0098   2]                     Reserved : 0000
[064h 0100   1]               Enumeration ID : 00
[065h 0101   1]               PCI Bus Number : 00

[066h 0102   2]                     PCI Path : 1E,06


This is information carried in the DMAR / IVRS ACPI tables, and it seems
to be the same on a random Intel system of mine.

~Andrew

