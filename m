Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEBfH+MYFmr2hQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 00:04:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06605DD111
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 00:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320235.1587605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRzsc-0000V3-Bm; Tue, 26 May 2026 22:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320235.1587605; Tue, 26 May 2026 22:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRzsc-0000Tb-8p; Tue, 26 May 2026 22:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1320235;
 Tue, 26 May 2026 22:04:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wRzsb-0000TV-29
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 22:04:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRzsa-0052Wr-0U
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 00:04:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1618c7-2eae-0a2a0a5409dd-0a2a4507994e-10
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 00:04:03 +0200
Received: from [40.107.209.53]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1618d1-229c-0a2a45070019-286bd135065b-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 00:04:03 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA2PR03MB5788.namprd03.prod.outlook.com (2603:10b6:806:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 22:03:58 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 22:03:57 +0000
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
 b=iED0U0ew3FD0v5EHsdmlZgwWrQHB1LxoyXqhAgY8468F81IPR6Y+zzW66EYmJ9yKyz2iTUWCw5P0lyJ6WR1hBlW9nNWx2gNAG/D+JAe/xJAVTdRToxmSLhueQFw+DaeFR6e4nN9s7JCaEvELHeeGR7WeRKk2uoIgCfTUylc1HLySau+W4Hm9y/bfzLHHveDJHKuYUi1sjR+IzIF4PxRneCm7lt9Mn0nJ6YbAE6LZAdHwn/hMClWIAahFAl5iTnnP92mCQ3lngvGyQMZ7KDSsOI8947L1Q0IyT0nJwKtWAEVEvMvgthC8ptPGIxYsZV/r1VkBq70LRbyf60PC3pjL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOy/AqbXeovok4ykGoQQ3myNOqYLlbfxWNGEqTiD2j4=;
 b=Ju0SLjxxHsLICePg9CZxZ7RDl/gPX2R0TmGdsk+mT8TJoM4EP+QfFIsLP9w2dlgvcuAFUmOnvFyx0wq1LCbcVIyIaFqJgx+PsTTTiSnJZjHr9JqBPHRWTVUBlO1eviQKGt9jIHoCK+sQcX008rcU8FcC95SFgCg7y0GnBCXtKWs73BelxgNKrmL347LM2Zhj1avyHch8yo1gEiJTFbbWAmawIz62YFc1SHRMxfonf69VAfPOxbns/xLIRyU0Krn3Ru2DBm6Vm2Qw3Y8hYM7wekwDk6G5GXGoGwM/HJwY8PqrKJ6p1DrIsKyE2gtZB5p+g/XLHG5Pc/5U0VSbl9UhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOy/AqbXeovok4ykGoQQ3myNOqYLlbfxWNGEqTiD2j4=;
 b=nFtPYNcPQibPqiXBGzuBSw6/KAyZboiAtm8KtCI6rbMjzu6BX59CaRu7KgUPwzqdyBee5BhT91aaCJeJPxNrhhq/iop2L08xnN+daPo1KjUD8GZIOz2/DS0biZIMbhaUg7UTt5j0rrne/M/6MLbDozR0g+W9lLB+IPcS/Zy2eYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7a0f7653-a299-4ead-af6c-944b8ffbb73d@citrix.com>
Date: Tue, 26 May 2026 23:03:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260526203114.40882-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260526203114.40882-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA2PR03MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 9563ff34-6be4-49db-d979-08debb72af45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jLPzkqERwVuHkYia0kyvxUidSAvw67L7nQWjM2HHicqzCCF3yJgU3Yz0pGIbZGQE0lh+CpZjCz4VbeEyKpmphI960wdXvW5WtrEEb+S7ZRVc8vCFc3U3qRJ5dcvsIyFZi2XQIP6DYcurDtyiDBKfmHsGajyNoV+HsT5Kk1xMRwBi4N6LDYrUXdAtqe3SzDNsizDqtfskpA56SXQJpiptmTu3o4Fu1ZkogEr+/b74GUDnxPjoS7NFZ/m/EWebu663guIy6IZMGuchpdMPG6hrtIQ+3dsh8U0DW7+1Wx30NzMNWXcEKnmfa3OPSzimcqMQDd+0OfWWQVHuA2zRlNKeCFk0CpW8tggg0MaY1r7hV2b5kxjLMxKvCQ+xR7GWKomR9MQqwQqUlH7P/S73nZEuQrcqrtvPx/i8qPbGaz6pk1BCRRLpbgYfSMuofMciEWK0uRems7sTRAr3KXIUkodOEzJuO5UuSCSMOZMDU13Dioma2ZAnCS2//aiK0xPz83NR1GV9gwToo+XPlV82CJp75NNxM4UDMaZBLbKXNMZ0atP8XANk4bnv2JXo+6UfHs6sfZOx1XcmoxGX0ePQymQiaU0LLHR7S3gthrG0YjbMI1lNUlJAWmNhooVuccUq3OyYUMPuWaIUI16SOMGDgEMBzj8TZd6RZXcQdCQN+9XwY9w0kbJt+TFbKqbMeEAD3P60
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkhjalVEUXJ0TlpJY2VUMGxZQThNRUErYXlYOUxKdmRtamoxNXN0aUV2bmNY?=
 =?utf-8?B?UEw1OEV5ODZKVEtpeG9zQ0xXb25CNGpDSXF4MjYxNFZRai9EYlVoQlRPL0Vy?=
 =?utf-8?B?Q2tDcGU3c3RLYjNVbngrQi9lTXd0TzhKamJiSlhFeEVQMlk0Sy80aHFGV3pO?=
 =?utf-8?B?SStNWXp5QVVsVW83RG9aVDZzWGpMUjZ3T0FYWHpvUndvVzZBdFYraU92K2Nm?=
 =?utf-8?B?UEJnNU1yZksrMUJOSGRINzllWDhvRndVaE1SOXcvcnZsY21UWTBXbWE1N01x?=
 =?utf-8?B?bVJYRExMWGpQNWRpdVZVK0dyZEJVdjNuRHBrdkwrT3lFbUJ1cm1ubkNldVZ5?=
 =?utf-8?B?bVJLOGRJcDd3dS9RV256RDRJMmlJa05JVHNpci9hMmZUa0lpVkZSbHJMUkRO?=
 =?utf-8?B?WjZPanB0MnhxajAreGVtRmVxbWVYUTdqZjBJeW5kZjAxWFFQamdLK1p1anUy?=
 =?utf-8?B?OHE2aHJNTGRaU2RxNENhT1Q5cVFUSUFDRXpRdklobnZVSFRueUt1dUZhUEZV?=
 =?utf-8?B?WVJ0a3Z0ZG82anRJRWhFaE1mUGtKem1NSGcrbTltdlRGVi9ZUmMrV0VXUjR2?=
 =?utf-8?B?eU9udGh4TXJ3enQwbVpOaGpRdEltenpJbXQ0cGNJTno2QXlMUi92MmYxRWNT?=
 =?utf-8?B?RUh6VGtJQWR0VHVaYk9BcWQrYkNEc3QzeE9EdkkvV0dxaGxwOHd0TlQzUEpE?=
 =?utf-8?B?aDI0bTZqZE1iMXBlWnd3NGl1anV4UlhyZzlUTFBnYU1pbCtqUmZwMHBWUDVn?=
 =?utf-8?B?MktrbExwMHhDVkpVS0Mrcjh6b21vbThVV1pVY0poTFBiVkN3ejgvYkt1QVg4?=
 =?utf-8?B?MmdXM1BRLzdNRnlpYXVZWHEyc0psS3RVTENObm80VmRzZms2dU9YeEpXT29C?=
 =?utf-8?B?YllCNitUSlE2NVd4S0gxOFRLdHhaR0VtbkRNRng2M0plMlJPSFEyaExSTWd4?=
 =?utf-8?B?UkhNTVhxbVFBVm82MVVVLzVsQWp6d3AvUjhGUTFDRVlDTVNjVllnWTZKRTUv?=
 =?utf-8?B?Yk8yR25SZVhHWVhQbWZXVk5QV3l4QmpQRHZTZE41SXRmeGwrYUM4MjNIc2hy?=
 =?utf-8?B?YytBTDR4VWZKYk95QVQ2eXB2dGl3TmVzTjY5SllpK0dwdDdHUDJ2Vm02cisv?=
 =?utf-8?B?c0RINVVrazllRzA3cWE1TlFsSGxmZTNNdnBEdzduS1NsN04zNS94SHcvUW5i?=
 =?utf-8?B?anlaQjNNNXRxS0NkNUdLWnRvMm5kb3RHRTRXczA4T0JRS0hHYnpjWDBndXVG?=
 =?utf-8?B?Z3JxRlpiUFREVUY2TVVnYjlqR3JRVzdkMWdnYmJSOFZkSU9JVUtYVWF5aml0?=
 =?utf-8?B?aE9mTStZTHRjS2tIODNaUFI0Zkt0dm91WXhpT2Y3TGFCem1Ib0xRVHRUL0dN?=
 =?utf-8?B?YzVMZ1IrcWNKUDFtMjFpbTRWNkZGS2FlemE1UVF0cjl5blMvMjlrSjVKNHpC?=
 =?utf-8?B?aWdqSGJ0R3Z1NUFQU20xWE5rT2grQ1FmanM2M2dDOE5RRmxzaTZNMHBib1l2?=
 =?utf-8?B?KzFZYkJIWXRKc0c0WFhtb2VzMEJBZGs0ZnA5YWdEWUtGeTFtMnFlS0hRWTh1?=
 =?utf-8?B?ZFFDTjlQQVpZZDk4QytzMG1NYmU0Y054M2ovRytCaFd6aVp5SlBHdkxMMnNT?=
 =?utf-8?B?UWZwU1pEYVNtM3orR3loM0FPc2lRUklKNE5yYUlvVjNZVWNTZW1iVzVKK0Vz?=
 =?utf-8?B?ZFFoaTFXaEU3bFhDa3A3T2F2TzExdCs5ZXA1dFAwa0xxb1NIeEtMUEhsMnU0?=
 =?utf-8?B?Z1hYbno5cGlqbmVxUU81bjI3Zlc0L05CWVVROXVBWU93Z240anJTd0JUb1BQ?=
 =?utf-8?B?VDc2czBwaFFlSU15cDYvc0ZmWC93SzlXVG14dDNpa0d6QldFSFNzQVJBSjdz?=
 =?utf-8?B?Z1pNbERwS3RQVUdqR1ZCRWRXcElGcm03WEhnTHBGeDJMenllVnZ4KzRqazZB?=
 =?utf-8?B?ZHExWElnSStoMll4aFlEU3pzdEc2b2FYMHdDYmxuSXhlUkhuK2l0QWY4WTVV?=
 =?utf-8?B?a2hqby9tbHpXcFlBaHZvM0N6T3o3R0lUb2tjd2pNMERCK1FjM2M4bEcrYll6?=
 =?utf-8?B?UUNldyt0WTAwdjVRbTlQS1cvMUpuaEpsam82eDNqc1hEZXYreDFiSFRNNWtk?=
 =?utf-8?B?Q0lDcHV1UkpNVHU5eitVTnhOOGJ4aXlGdUhRTFdVYUFXTllUT1N0YXArbEJj?=
 =?utf-8?B?WExGVHFCSE5VakgwV2FGQzQ3U0NCWFNzcHZXRVZNM2Jha1FxenNoY20zM3dl?=
 =?utf-8?B?WlVXc2wrbU1PODA1eVFKOFcra25yMXZyWk5mSERQKzNKZ3BLZGVsZFdiM3RB?=
 =?utf-8?B?RmNmQmVxRWlrY1BPVlBLNWNmS3U2d3AzLzR5V0xnSGhiVjdMOU5xekRNNktU?=
 =?utf-8?Q?LGij0r1X1hFU1KRw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9563ff34-6be4-49db-d979-08debb72af45
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 22:03:57.8597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlo/RQFEI1/C4nbPKPB9ncJzDRmBxhirN7aGu5kftTCBRsMcEbvhVv0MGS5F8+aAHvRDje+el8Uxxs7v14Z10t1nPAQDyCUGySY0vd0M57w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5788
X-purgate-ID: tlsNG-ef75cf/1779833043-0AB70C48-2FB5D9EE/0/0
X-purgate-type: clean
X-purgate-size: 4311
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C06605DD111
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 9:31 pm, Jason Andryuk wrote:
> A single stubs page is initialized with 0xcc and re-used, with multiple
> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
> each stubs area is checked against 0xcc.  When all are set to 0xcc, the
> page is freed.
>
> Booting a system with smt=0, CPU0 is initially setup, allocating the
> stubs page and initializing to 0xcc.  When more CPUs are brought up,
> CPU1 is initialized and then immediately brough offline as it is the
> sibling of CPU0.  Since the page was initially memset with 0xcc,
> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
> However, the page is still assigned to CPU0 and continues to be assigned
> to other CPUs.

It's more complicated than this.

With CONFIG_PV (and !opt_fred in 4.22 which is perhaps newer than you're
testing), the LSTAR and CSTAR stubs guarantee that the 0xcc's are
overwritten with real instructions.

In !CONFIG_PV, the 0xcc's only get overwritten by the exception recovery
selftests (CPU0 only, and gated on CONFIG_SELF_TESTS), and "complicated"
instructions in the emulator (which in your safety environment, you
likely have compiled out).

So, in your environment, I think you probably can exclude the stubs
entirely and trim even more LoC.

>
> Meanwhile the page can be reallocated, which can lead to misbehavior.
> The particular instance was the stubs page re-used as a page table which
> later faulted when the entry was all 0xcc.
>
> Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
> individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
> 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
> 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
> STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
> partially used.
>
> 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
> use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
> (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
> should be okay to use here.
>
> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> It would be nice to use get_page()/put_page() to let count_info handle
> reference counting, but they require an owning domain.
>
> The listed Fixes introduced the use of 0xcc, but the smt commit may have
> made it more problematic.
> Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")

Honestly, I dislike all of this "try to free data for going-offline
CPUs".  It is both complex and a non-stop source of bugs for tantamount
to 0 benefit.

On x86, we must boot all CPUs we find in the MADT.  You're seeing this
behaviour already.  This is because if an #MC hits any group of CPUs
where any CR4.MCE=0, it's an instant reset.

For this reason, firmware doesn't hand APs over to the OS in the
Wait-for-SIPI state (which resets CR4 to 0); they're in MWAIT or IO-wait
typically these days, using firmware provided stacks.  But firmware
cannot handle an #MC intended for the OS, so the OS must set up stacks
and at least an NMI and #MC handler even for those CPUs not wanting to run.

This what park_offline_cpus is trying to do, and while it's set for
Intel and clear for AMD, I'm pretty sure this is a bug on AMD because
you can still get MCEs with core-scope groups.


Beyond that,  smt=0 is an emergency bodge for speculation safety, which
is always better done by changing SMT settings in the firmware. 
xen-hptool is useful for testing but it's not a thing anyone uses in a
production system.

ACPI CPU hot-add does exist in virtual environments, but hot-remove is
theoretical at best.  I've not seen any evidence of ACPI hotplug
actually working on Xen, and I think the chances that it does are slim;
it requires AML execution, and is right in the middle of the split-brain
problem with physical vs virtual details that dom0 suffers.


So, lets just allocate the stubs and "leak" them in testing scenarios. 
It removes bugs and removes code, and has no effect on well-configured
systems (where cpu offline is not used in practice).

~Andrew

