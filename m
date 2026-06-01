Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPucOBRTHWp/YwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 11:38:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAFE61C92A
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 11:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323775.1589440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTz5C-00047s-0c; Mon, 01 Jun 2026 09:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323775.1589440; Mon, 01 Jun 2026 09:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTz5B-00045M-TY; Mon, 01 Jun 2026 09:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1323775;
 Mon, 01 Jun 2026 09:37:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wTz5A-00045G-5Q
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:37:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTz58-006KcY-Nu
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 11:37:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1d52c3-e002-0a2a0a5209dd-0a2a4506acf2-40
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 11:37:14 +0200
Received: from [40.93.201.9]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1d52c8-7371-0a2a45060019-285dc909fdd2-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 11:37:14 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7683.namprd03.prod.outlook.com (2603:10b6:408:28b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 09:37:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 09:37:10 +0000
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
 b=ibwZ7HD8s8VgVuxSPEMfa2iHPTG7b0258XJkjWDxahbKLHc3rZNr8+jH7pkiqvNE3itwwGwYfof3fwNHXNL07W5+XWULL2/hXGBH5NKog5Ew72C1EwXAWrlMiC6dfKcDH2CTzjJeNiEbOQzuXuW9h5XObnKCqMMBHL01iCI4oXV2TXV6Yggt9iRCTjzWzpIFQcPDp73iYX2KvgN9zAV4xejC/hX+whSjDWJo6IR4oC/bhFLeijo4hVsqfp3SLMhxOFc4M+//euRjUgziTvB97aJjFguEJOECKNuhzG06dY+YCPJaH0z/aU8l6cqXICXtiQeRrQMN0IlmvxINUAEiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEJwoE+XHk2E0jaeeYL94RroyqjS0Gvahhgs576DixI=;
 b=RndXhecucq3B1mMptME2MlxBNq3SAOUMmPl5o8VLSnwkyFaQ1pxgtMq6E8DRjnSgATnVe9P2LmIKY2+dijxCemVCwRemhiY19CN7D7Gt0KzIvs8Rm9Ru0nBa3Dz6zuSJijTz3ApLaOELsbAH2yqZnU4f4jAPpPCZV5Obbbiqps+ZIIT2Y1UCGwU/cobWzMXABrTDrNcep3TtvRTsqG8JFlLMbMvgk9CHqaUizwylgyAou66lBkCWJXUDsCUX23Ur88yy/BOvcU6GhmTp+SUh6iq9obOrzIRFeaH0hlTnxE38d75drRMi5y4YWrl+TqhrYXZfFlxy3EVkeRUQJLiDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEJwoE+XHk2E0jaeeYL94RroyqjS0Gvahhgs576DixI=;
 b=TLCn2AGLGTpYEV0fKLiAPBR3OHRiOg7v5v74i2c4P+YQr7HvQkzwJTirEQ5hWX2xFMLKBj1vJe7u1eZxpuU23TnsUq/ZcwQzovBxoLSMgE0Ue01EDNtV+2KiOxJvZqSikwDQElOAhOeze7CUjk4iTwOe0GqB2yK0TiCVOnWcvj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 1 Jun 2026 11:37:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com,
	julien@xen.org, sstabellini@kernel.org
Subject: Re: [PATCH v3] docs/process: document AI-assisted patch tags
Message-ID: <ah1SwhXGOVcGPdoJ@macbook.local>
References: <20260527174528.27903-1-cody.zuschlag@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527174528.27903-1-cody.zuschlag@gmail.com>
X-ClientProxiedBy: ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 0328568b-a2c4-4d3d-b643-08debfc15a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|5023799004|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+K+o5EdageHrA9dkMlB5xGjJARhy20LeCGvN2S4picyTJnDRbd4guAkAF5+EoFr+Mva5zQrx3HRTVURDTa5nrvWbwzoPAO6X6C2cjsayOg0zCyXbif0VJkUn6/lRlNgiOrUk7Wz04yAecCrf0xc2XuMRBkfeM0SeA9u80rNyqXpkiiUkJ368fk66yeApNVi7uwlD7ZGVXBzXvr9m9g8Jv+kyJpkv2DLEqOoh+1GBEgqCTEN92V+X3XfLgU2luzWDVLQiBP21SxTIse2NRMKYvAb+scXdjVgmxbrhKBni5CXeOIi2MMznEOZFopxpy9sfJknAcF+iFM5H035oQMDQUT4sCCIOp+wFTHy5b6jfWyBWy/JqqBAI45bXmxOMwGIQ1KocLYmVUbx20VtjGdmlJ9hKElGd54Ewzr+VDE7WH/8dbqiwTlcW10u5htCtwdm7AHdY+NiCJ5ih0MPLlUT8XvDKUAdxytkD0q2y8M3EoG9nnAgijkrNTS7jrHPLKgiHbgWKGbucF1sde/cjbwnzPqgmIb68MlWGjbngUqq98loKo6YpFL5k893tNwTsShnSqzl8S4OeblkshpGWB3uGYaBQahBa4ma/CkY1UX7TP9Br/Sf2XLvxjXOIVMgMl4TTMJcdInrkCuItziA9nV7yeiEK+4b7zrBKrFPpgF2wFqi7/J+Ej++1dg5vvolHsCDZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(5023799004)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHRycExNb0lwb0dLaW5EMFQwaDlkSnZCMjMxOEtOQXBSejdubFc4M0hVRFZI?=
 =?utf-8?B?TVVNNm5KOCsvU09JWlhpR0RMZXp4RzNBT0J5NXJRYmk5YVcxektoSndxZ0N3?=
 =?utf-8?B?ODBQeWFVOWl1NDZLZzN6Z3FyWFZMbTlZeWpwNWJSYVNiMm96UENiMUhNT1VR?=
 =?utf-8?B?VTZpWFhub096V1NoVGZsTmlnYXNWU05KY2hkYXZxNFpEQ0paOExRUnorS0da?=
 =?utf-8?B?MVBwOS9GdGlydWhrZXArMjkxZzNvZXhTMVlaZjR6SU1TNmFhQy8rWldQZGVH?=
 =?utf-8?B?RXo0OGpNa1pqV3BUZHZZRG5iNzJid3B3cmRuSFExRzVYNW9EMWdSMjdFcllN?=
 =?utf-8?B?ZmF1V0FuL005UHd0a1U1SVdXcUpGWEduSlFUdUZCZlZuQXJDY2VWeTZmMm04?=
 =?utf-8?B?cWhLeXBvd3E2NG52NVUzQ2lEYlQvWjUvTTVpNjR2VWROdlJzWEc1NTQxUldu?=
 =?utf-8?B?V0dWS0hVQ2h5TWdhMnlXN1l4dzdPL0ZSNUtZVm9vcWZKS2MxMmE2Mld4TmVn?=
 =?utf-8?B?dUlDSnJKVHoyMnQxZTMrVTg4QlZPeXZwNXRoZjFsQXRlNDI5blpvQlBKMUlP?=
 =?utf-8?B?SWV1YVhXVHhJWDFEeVhLMlRzM1laSGd2cU9tMEkrWjJvOVhDcmp2dGJGeEtF?=
 =?utf-8?B?cWI5clI5OHdrQ01PSkV0VzlETWczZms4RWpESzAvR2J1K0pHbHBIK0E2d3Rh?=
 =?utf-8?B?K094YmgzMnBSYjVlNm9hcFFZK2RVZFNhenp6S3hZZnpra05IejN0aUFiU3F2?=
 =?utf-8?B?bmQ0ZVZmNUptQ0VGZENYMUsvaTE2ekU3SmxQT1RoYTlYQUV0ZjIxa1R6V0JH?=
 =?utf-8?B?c2hkUzY5UXNYY2FGTHBQYVdURTZOQm1uUm94UG9WOVlVNkgyRmlGVDJRV2lw?=
 =?utf-8?B?bXA4QTEzakhRangzcms3QlhtSHZLb0ZvZ0tvWHZYVFZRN1U2UDJ0TTZ4NG8y?=
 =?utf-8?B?WXBRZ1BDWGN4eklVNlF3UWhUSnhyY3R2MnEwSldjL1Q2Wi8raFRvWk5WbHBB?=
 =?utf-8?B?V0tkb1ZKbFJZc3pTZDZXSVcwTU5rMDVJaXNEZzJSUzUyZDZmZzZHMndYSlNJ?=
 =?utf-8?B?V0drTmlESStoTUN1ME0yOVNkQVNvUGJocUlPaTNiNnJUREROMFVGaCsxZ3JZ?=
 =?utf-8?B?ZHV6TGVGWUd0Q3NIcmVabEYyamNYWlJjZEdsRTVzMTMrNWVjenE1ZDlxZ1gv?=
 =?utf-8?B?K3ZjQ1J2VUhRRndYbDN2aW4zMjkxRjVYYzVUREFxb01RenkyUzZsVTBNekxT?=
 =?utf-8?B?UVdPU2hhdjRVY3NMYTYwOHlMRlUxVzA4OW5BZGdzMnhSa2NBakY0Z0psN1ZR?=
 =?utf-8?B?UG1OcGMwb1RwRXhYRjd2L1N1YzBWOCtJSG90ME5Nb3Y0ZjI0ajQzMlE4ZVZt?=
 =?utf-8?B?c1U4eXZSMno5Zjc5QmdkbURzVlRiQ1dEaGg5VVFja2JHQTNXeFdQVGpLNmY5?=
 =?utf-8?B?SlhMamF4Q2xZbnFqb1NGS3dtLzJDU0dOWUhEWnlZbC9VaGE3Mis2NG56VDRh?=
 =?utf-8?B?UjMzRFNZandYMTVKRmNoSXNTNFB0b2V3YTY3eXNmWStaeE5qY05wckQzR1FH?=
 =?utf-8?B?WW9LRVFtMG1DQnhZcUFKVkxWMzZRdHZTTDRobEFhbUt5Tk1zR1Q5L3pRUy9Z?=
 =?utf-8?B?N0UzVEladlNHaXFHZnBpYThVa3o0ektLZmxPYVBsK2xVVjdKZlJUOWJxNDh3?=
 =?utf-8?B?ZHo5SitncmZKWHJDamZFK05jTDBrYnMvRDdZakpBNDUwbi9yYW91QXorRTVQ?=
 =?utf-8?B?WkxlOUtORms1a0lqbGFnRERsMDArYklDbS9yMFd4QTVMcXhqQ29XQkE4dzg1?=
 =?utf-8?B?MDdncmQ5ak01Vkhja0VPRjNZVmcxMEh1R1lhVW1hQ2RVRFdBMVVrS1JGdDZ4?=
 =?utf-8?B?dDVQK0c3dXY3cnNGZHp5OFR1MFpCMENSK3g5Y3Y1TjNtbkJvNkxVUHNHaGcx?=
 =?utf-8?B?Y1RmSktCMVlZMGNNZldxUTFqQmFUUlE2aG8xc0VpK0NtRlJaM1VUendzSnlm?=
 =?utf-8?B?UWFVYW9lZDF0TTc2d2hTSUhrdktKdm5KV1lDRm9Gd0RtaDJET3R3cW04bEhW?=
 =?utf-8?B?ZVpPS3JiTGNsRko0ZXhpa0NrQTEzcnFFNURWR2tseUdjNWE3VGY4RlUvYUg1?=
 =?utf-8?B?TFlkeWFqWUpxbUlqOVBPd2NZR000YnMwK0lOL2NaQlVFTGRkd1RlVFRET3dX?=
 =?utf-8?B?TkNyMW9FL044MHBtUGZqU3RZVEorVnAzS3pNTTNGOWd3N2YvQUZPKytZWXZZ?=
 =?utf-8?B?MmpGWkgxbWd5KythaHoyOVVobG01ejZUVTRuNlJwOW5Eb05wNGJHRGg5ZWxQ?=
 =?utf-8?B?Q1R5UTRqY0FrTEpMQ1diYUsxQnNOVm16YXQ4TUFjK21nem1IRTNJUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0328568b-a2c4-4d3d-b643-08debfc15a7e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 09:37:10.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqNdyUnMpSQR+BbQXNCDTHha7gldgnSLonHQawQ+yTuYEMiJxZZ8gtAgax833ptzw/yL3KZiMEAaF2wjMqvbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7683
X-purgate-ID: tlsNG-16d1c6/1780306634-85160D75-7C9D1B47/0/0
X-purgate-type: clean
X-purgate-size: 405
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3FAFE61C92A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 07:45:28PM +0200, Cody Zuschlag wrote:
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches.
> 
> The guidance follows the Linux kernel documentation.
> 
> Assisted-by: ChatGPT:gpt-5.5
> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

