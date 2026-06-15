Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X7CUKwVRMGqnRQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:22:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156986896B4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:22:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BdcaQdGP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338536.1599586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCtJ-0001UT-CL; Mon, 15 Jun 2026 19:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338536.1599586; Mon, 15 Jun 2026 19:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCtJ-0001RW-97; Mon, 15 Jun 2026 19:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1338536;
 Mon, 15 Jun 2026 19:22:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZCtH-0001RJ-No
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZCtH-008Ihy-1A
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 21:22:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3050c0-bab6-0a2a0a5309dd-0a2a4506abd2-48
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:22:34 +0200
Received: from [40.93.195.14]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3050f9-7371-0a2a45060019-285dc30e8cff-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:22:34 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7588.namprd03.prod.outlook.com (2603:10b6:408:282::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:22:31 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 19:22:31 +0000
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
 b=bUzV4oU2uLJH+tMvBJTA2VCId8L7vC1wEhHLzmQfXR/sWqYHTgra7ISS8CrbRpu31LpwKTDpYLYeaQgmuuUs68c3zUmn1AUHm2tATyJGWYBxWc6l344TKNtg5YDAdii10W+5f+Ql9mJdS/D+nA0faLMWGH/4eiayYRkmCXXCh6xFAMGO9swBBiFQpe6IpOhA4kNscK+iqqjV581NM1BkDwilGgEM3zO2S+dI35kPQoO57YBNwriAqtBBzyxZL5XiomWsYfEk14aVamsKO7OfFw3NvH+v+a6QC/PNRQksAXJplYzkigP4hQaPxO9gGEizYJVHobmuQD7V20wQvo3Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FecxwQS6kcbeT4bx3k9WML8Vxo1g1CpGIYKKV8HUbgM=;
 b=qdWnaBpNEDv+POC/WzF/Nyfv0G75/MovK93HOOKAI+NIn3xnPzrNheNqu8APmaDx8PPImIhrDV6QUxuvfhyeZ5Q9kywsVup+6gFuAjXmdIOX82aWzgAqOydUFMWghfUVMKnPKWs+yObXyq1PgUzKVg7QfEBOSH5yx/wC6MNb5ufVA5QTkV97hoSkCgOSnseoqqn2uMLaL1uPyTF5uU8bPHXVqDD6MC9TLIzQHHYUaG53Oi6DdnF/C49nerH+4ue8LIyOKGGnmN/zdvCWgQ3P9s2FRHG59wpUbAKZ3yjTkfy0Zc8jfeI1bm4jW1KjwVpeqsKMsM4HsLIXnYMhLQMmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FecxwQS6kcbeT4bx3k9WML8Vxo1g1CpGIYKKV8HUbgM=;
 b=BdcaQdGP8jvfiUNePPkVaSUfQX5MQaBVjCctPWqr0o3V/ErZgShQ1vR3ZxmB7XqF5dztAeqVU5/PsuWkubaJa69SnWp8qCHR6Dm2o+FgmKTLfwMVLKNBUweUYCGEoqAyQHmWUUHm07iqzouUON1KLuOxUNphIUz4vyGixplhi/M=
Date: Mon, 15 Jun 2026 21:22:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/cpufreq: fix usages of align_timer() in the
 on-demand governor
Message-ID: <ajBQ9G0_M8WIdUQn@macbook.local>
References: <20260227073259.1200-1-roger.pau@citrix.com>
 <20260227073259.1200-3-roger.pau@citrix.com>
 <d00f8d01-33c2-4b43-9ca5-c7aa98488ff2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d00f8d01-33c2-4b43-9ca5-c7aa98488ff2@amd.com>
X-ClientProxiedBy: MR1P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c27d66-3946-4c47-6638-08decb137226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3WwGcXB3OmJtOfLgCfbsoNI+3RVYO70IZ7Jd//QMhHPGA+t1j2SV/r/SubizMMuzDZuhOLqqJei4e3YCUwDH+0wf0bROBRZLRMu1R5kbM19YGVlnS5fkztz/nrwR4QpxTX1JccQVUtD7AM2WwcfosR0rTBUWSozucarEG/VNH2NiLebXhgHmuX/HAIinqjvmZCjatgPV/AKnZaXrcH0VZQWjujzD67x7Js1YsTB/PiIymtUKqqqujUs7KETeQ0yav/oP+YHFmy7K8D7UoQ+bxvpaDqKPAh03J9QQWM+JwU4s3xT3O1Px85OOWD5yVk513qJsiFxmGKKU/TtulykLZ85JV9NT0CdtpCwJBKt0PACBqyto6aeGQGhtFCgYrNMmZeIF1WH73X12A4caaC3YJg25WPhfm/6gg2tgo5kmswGDUepSxEuMSCV+wbvt2CSu9XpMEgWnXsK0MCIxUdJ5ZD03MJS1U1N/leveOoSiYQLcrcilSGP/UGWgabT58+GUe16AQkiiVZQHiN5RTvXqfiWqQvOYT5QlmthJUjvVSjyI4MwE/6QLMCA7TP2O2boedKpci99ShqkvR+krMJQOPobZJEjXPMh0FbAUSjkt4BdwJojjIGOTxitpFLuQXzTpPB1NuicLhH47dqjx03pn4YEVDRwuWlT9lPGGf/pBRjy5SmJIKzQPfNcXrbiwnfgJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9NRGZzNUxGTTdLTVlvVzFlby8wMEJOcXhodStabFh1MjEwTVJiY3FLU0VN?=
 =?utf-8?B?WlpSVnkzekVwQVM0NWt0SktHaXJhckV4Z0s5NERib1d6MzJhc0ZmWm1GS09H?=
 =?utf-8?B?M2xlZUp5SE5sTzYva1A3a2FUVVB1N2hNYldXZXFMcENUbzdUUndpS0lZeUJN?=
 =?utf-8?B?bW9FZlBYRXltVWpEUGRXUmpJU3c4SERMeVBkQXJsZWl1d0V0R0VjRVFuTURl?=
 =?utf-8?B?bysyTURQRTdWQ1JTaWhtVE9Tb2pQVngza2xjcDFPbFZnYUxXS2VNZDBBck41?=
 =?utf-8?B?MGN0V2dEZXFjaHRsazgxMnhXMVJlQ012dEF0L3FQT2N4bysyMEt0OTU3TjUv?=
 =?utf-8?B?MlhheGVxOHhRT0xuQitIeDBKMURBU0sxc1Erb0hwR3lIUDhzQlk2RU5MTXJV?=
 =?utf-8?B?Sk10MFBlbUQyc1gwR085eGZrcUFPWnFNdlV1UGJSZURRUXJRamhmMlJITWlh?=
 =?utf-8?B?aFZ4a1V0VmtTVnFmbGJZTmJpc0k5VmlUam9la2VoaG1oWnVxWUx2N0ZEZU5z?=
 =?utf-8?B?cGZMZXJoVk5pSVRmd3ZTdThpQXcxL1VoUmRrWTk0Q0V5b3c5REVRSm0rRGlE?=
 =?utf-8?B?WVBnTnBDWFdRbEhNaDJlQnBodnpSdUpxa0d2SDRrdmFOMi9ZRCtlbUQ0SzlE?=
 =?utf-8?B?NENaanhzRUFLMzQrWlBPa1NDTkFjVjFyeVZ6RGdaazE5L0JZUkpSdGxOUy9w?=
 =?utf-8?B?NWpZWW1aK1dmc0pFT3BFc1lJbjZtUmdXZWZLR2RsTWZvUFZ4QzBQOVVjd3k1?=
 =?utf-8?B?ejM1THBCK0FBTGxoRldnU0cxeGo4cWozVHFPQmZMTWpOLzRFNXd0MDV2aTdn?=
 =?utf-8?B?dkFYYk85akdJdXZ0SUNOWDRlajdYOWFPNXNIVzM0QTlXbzU3TlljelUrV2JM?=
 =?utf-8?B?VVpmKzJRVGNNenNydHlEVzdhby8wYWJpcXVJZHhEQXNyUWpjV0VyUm5RckMr?=
 =?utf-8?B?WWFKOEJqZkl2bXZMd2ZqcnJsZngyZWR0amFHWUx2WXFQVWhiV0trTVYvTEpF?=
 =?utf-8?B?SzB6dEcvQjQxS3NhNUpFdkNXc3FDekhzaGdkZW5BTzFjWGdKbERReXM3Skx5?=
 =?utf-8?B?VVhMQi9ORW9DN0ZpcVhHbmg5R3IvMlhVTnlQYlJxeGQ4Unp5OU55dTFtUlpy?=
 =?utf-8?B?aVYremRCY2JRMlNGalBrZUd4ZmNUa3VEMFBzOEpOMkZoQkZMbUFFd1BLTTdE?=
 =?utf-8?B?MTg3RXVSd3lVdC81d2JQM2Y3aHNTS0VzSlkrbHJKYjRETWhtQTBZTEVMbkhn?=
 =?utf-8?B?RzJEdFVncFJBWjkweEZTcXJrN1Y2M0JBK0tYL0FESkhxOU02WllyZWdjSXdJ?=
 =?utf-8?B?Um5vSjkreUMzYklBaWtoeDZiMWE1QlJ4S2VQTmxhdTVlT20zTXJQVGpXZnFn?=
 =?utf-8?B?U1d0N1RxYTNicGxGMGJOS0xyMGJKNlJzNU5sNjUrdUNCMTQ0QWhsMlRTem9M?=
 =?utf-8?B?M0gwb3drVy9OYXNXSWgzREE4ZFIvK0JlcFlaN2xYeWVjNWpxbDFlQjkyMFhx?=
 =?utf-8?B?SklMcEJHQzJJTmE4eW10MkhDVStrSkdzQUd3cnZaV3ZWMUxyUkJzN1pleU9S?=
 =?utf-8?B?ei9QcVpFdmxKdURiK2RXU0FqdHZWdGJnWnV5U1p3TU9NKzJZNkhCcU5hUzVB?=
 =?utf-8?B?ekw4YzBwTnFOZ3lwRGtmWGl4bTJlenZKQ2FYdlJTN014eStnTnh5WHFZazBK?=
 =?utf-8?B?d29SWGFJd2Q5MEk0MTB1WkpuZ0hhcmt6RlIydGU0bGJ4S2ltWDhTUGlJRkx2?=
 =?utf-8?B?cjNydnRWeGUrQnBvam4vRnZWdm1lM2lkRWVXdHZKQmFXRWtpS24wRmdkYmxp?=
 =?utf-8?B?dTV6QjRZdWtvK3UzNjlrQlBpb3lSbVFmK3Q3eFlOL3VCQmh1RlFIdXNnUnJs?=
 =?utf-8?B?RkpRZGJnN3hlU0thNWtLVmJNNVpZTmJGenZYMDlRSENTQWtQbldxdHI4OUN3?=
 =?utf-8?B?UjVHOW43dnNqVmVqV01MTUMyejltb0wzM1JNTDZiYWVhSFJ4b0RyTFdsdWYx?=
 =?utf-8?B?MVRoODdHUVZmckhQMThnYUF5RDB5Zm10NXVJQmhYaDVaY09MWktzdEI1ejRF?=
 =?utf-8?B?SjVXb1JPd096VEVMQnVxc1hCQXdWMy9LRnlHWjJ5VDgxSGtDRjVjbGhYU09D?=
 =?utf-8?B?MXh2WGlESXFrdGZ6Z2hNMDMzZFJ0U1c0YVhOY3pLYThlbzc2L0greXozL1Bl?=
 =?utf-8?B?MEhTcHdZbENyWXFLcUtSUlNKM3dRMTZvSnNHM2oxZEFiekxSblNKa1RaOFZa?=
 =?utf-8?B?dndEeWgrRGpNWkZSSTlJNEhxWVh2L0pQTXFBcXV0TlpwMTMzUFdQOFJiei9a?=
 =?utf-8?B?N29UM3g1UlFzczFVenNONnN4WmZnV2J0UmNJN1k5STgrd3Z5TStoUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c27d66-3946-4c47-6638-08decb137226
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:22:31.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RXkv0cZc7//lIO2B0Gx8HXqc2LZcvTRGFAijCrgrxGk3cACJajW++R4gJeUuQ0xQ02fDSAZjnRH+Pt48e6qCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7588
X-purgate-ID: tlsNG-16d1c6/1781551354-7FF7BD75-577810C0/0/0
X-purgate-type: clean
X-purgate-size: 1543
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 156986896B4

On Mon, Jun 15, 2026 at 01:44:54PM -0400, Jason Andryuk wrote:
> On 2026-02-27 02:32, Roger Pau Monne wrote:
> > The first parameter passed to align_timer() is the timer expiration, not
> > the current time.  Adjust the calls to align_timer() in the on-demand
> > governor to pass the expected timer expiration as the first parameter.
> 
> Internally, we have a report of a benchmark regressing ~6% with this change
> on 4.20.
> 
> s_time_t align_timer(s_time_t firsttick, uint64_t period)
> {
>     if ( !period )
>         return firsttick;
> 
>     return firsttick + (period - 1) - ((firsttick - 1) % period);
> }
> 
> The code rounds firsttick up to the next period:
> 
> align_timer(0, period)          -> 0
> align_timer(1, period)          -> period
> align_timer(period - 1, period) -> period
> align_timer(period, period)     -> period
> align_timer(period + 1, period) -> 2 * period
> 
> With the change of this patch adding the period before calling
> align_timer(), the timer is set for two periods in the future.  The only
> exception is when firsttick % period == 0.  I think that is unlikely to
> happen since NOW() will always be a little after the period.  Even if it did
> happen, the timer would fire immediately, but the next timer would be set
> for 1 period later.
> 
> So I think we want to revert?

Forgot to mention in the first reply, as I went straight into the
technical side: thanks for finding and reporting this, we can
hopefully get it sorted before the release.

Roger.

