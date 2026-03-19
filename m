Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JecB2devGlxxQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:36:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879242D23E2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257570.1551938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3K6j-0007TO-7F; Thu, 19 Mar 2026 20:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257570.1551938; Thu, 19 Mar 2026 20:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3K6j-0007QP-48; Thu, 19 Mar 2026 20:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1257570;
 Thu, 19 Mar 2026 20:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3K6h-0007QJ-Du
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 20:36:39 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5354dfab-23d3-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 21:36:38 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 20:36:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 20:36:34 +0000
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
X-Inumbo-ID: 5354dfab-23d3-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mly8D0/+W6IpUxJwwwyrct5azIz7YkHMUVBlVXE+oX8tqCuSmBHIsUSsgIlyD4GSPubVqasGJB7gdHyqThV0OTzI3qlhWrNbzZr8jElxFq5pp7BScYUnXB5yWgrAuaN5EuqFUz0aQQIhYXnYbIxg2oBklcgGPUMmji1uOtrFmH5At/quJy7BrbOL3IrTFYX7/Y1G4VYfw9ESbxZnkbRxspXtrOqm1AKGLvRakQ3jp55udSYHe3eJbEF1YPvFXZ1aSs8F7pFABRfKTMWr51TJsRfZB+m1wbNAZCYpTM3ejqVsAbME+iZlpPOcJLFK2CbwKfRm/RqnEck0bXlQZdisaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U/PgHv9boJwLmz8AheioOrvopZsBlDOdmhw/eLy48g=;
 b=b6DOGAT5I59n8szbZPjbBeIJ8tNZ/ZJaPp3dENYWDYJWsKKciV7u/Oi2TpORHvweMkFoDYio/PwfaHSpni8dmNeYEwYMtwlER05EFXysqMMgi3d5eMe23NX9kV3ptR/K3ZsuuMufYej5P+ezJwxHnuzZBcrhlKRrFnlYdPFHjKqaakjzohdWjSlbptrIdK0qsG4KaVElMQXi2m5XtLie7KbIRcwed1WdKXERrIhKAz/rVOvoESPzs+gixBBxYpkswTgfyFsj0eorCNlHUuhnBX8GYHSHLWkx8m6Nxmt1fsKIHtIStiE+UiLQ9P3Up9twZzuyyi3mU4WOOajJJHx7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U/PgHv9boJwLmz8AheioOrvopZsBlDOdmhw/eLy48g=;
 b=BOqgMy8a4PgHQc+rG/C6Q39aUp+QM/A0HxrIpXoqLA5MKqOTBqiR55HwEE8iMzSRFiFiNUymg7qLS8kuc2AdHFrcPchpFOxQ1jfp2JONOIpdPpAI+C+sh9HIpGEaY4zAUn2kOg3Dk1L3Dk+z3x4V8mNZHDyV11HArJGrhxG5BXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <82c12df3-3e14-44eb-b45f-34a74e17d710@citrix.com>
Date: Thu, 19 Mar 2026 20:36:31 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 7/8] x86/xstate: Stop tracking nonlazy xstate use
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-8-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-8-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b8e1e3-ea1f-419d-cf53-08de85f73601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZS/S7znB+JRDyyQYq84Sk++Ky0C/FRJJaqYLVF0hthiqDWzFX+q1vMwdX/MbJPNcEGFTEu7sOzWwOx0O9L8V/N+bT7vZkuiKJXEowWUffy4jBJ0llXx8xoI0MEASOAxrMVSSWgNYLfGcP5/tSD7cfBZqD5imVAr7iM4yWKJqHDj6xnZYF6WXyS1P16Wt8mS0RqIeIqWGMQd4YLd9JcVAZg1d/FtraB7l0ceWjIfLslGKQ6P9hr4F69QDt2jijpjjjFd1z03xZdpB3ZIEX3W+JkNC9vpgZC/VwmGw0HudTzFtQndGwoHXWh4t6Mw9KYOJ2Yx1O/TTa4dX0FOGhsMkPFxOei3QLbRrWpkO0hQF3g8pMotMFvcwSEIf8/6cAf3jUntfPW6yoBTORsOXr+1/G7/OBZ0HFCS2CuH7AsJJmYkIAMxgETLVqWuzfOKzvZXZEPfaYWedAKQBGjnmoMpEV6E5zrTzuYF7u1gJhkpJtxlpK5eMIHnRw6OH/oa3o4wYQxunhZOaw2aqAKKUiVRa714i+a0LtuOeRm8UW8KVkDjDaXPbPORy884d3g0Mj6CI+0QhkvVkbcdNevVQ+SLboS1HtJJ8CSEdUR/h6Q9V3+VU6WB9gmHu5iyQTI3B/PStWPuVfO1HyupUS7bdjKxwxCM0mE7jyTQmuXRczzCxxIp0odSb5f5y0r8LE0FlaBnDD0+i8ee+3WOT9nJQKLoF6ybY5gGLDtqYG3qTdSacGBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enYwcTA0SDVFb1M1OFZYYkRHOGYwNTd3QzAvaDE4ME5CNVJ4SWNoYWsxS2Y2?=
 =?utf-8?B?Q0JKRGE3Mk8rcUQ0dDYxU3FOM3A1VldIa1N6U3NiSFFPNW1EVTJ1em1pVkRo?=
 =?utf-8?B?QjEvb1dhNlovNW1lY1cvd0h6NnNMeWtGaW8xN3AweU9zOXY3cCtsNUV6eGVr?=
 =?utf-8?B?aGZ0c0MvUEtjejMzYkx4dHYwaTZrVzJvamFUaTUyQkNFZ2pZSGpqWXVQTFEv?=
 =?utf-8?B?T1NvWW4xRlpFclV6Yk9hOFJtRE9IaVB5djZJLzhwQ0JQNVpPMEJTcGsya2RJ?=
 =?utf-8?B?bTZTQVlCY0pvNkNic0lLTStXOTNKQ3RZUWtsSVpGSzI5WVpkbDhXZUdPVENM?=
 =?utf-8?B?cWlIVENYM01vd2I3MmFRTzhrbEppY28xSWtiT2oyOGhIaXRpTW9jRk5iUks0?=
 =?utf-8?B?NVA4LzNoNnpCTFk5SFhTbUpEem4zRGQrZ2JkRlRsaldRSmVHdnBpTnNwQk80?=
 =?utf-8?B?Rkg1VDU1SnBUZ1haMGRIQ25GaWFzS0pvYlBuRVZsSnpKdkR5cUJLUnpWTWdG?=
 =?utf-8?B?SzhRcDNmclNsZzIraU1Uajc0ZkQ1WHVzUVBEa0loekJFelVPdWhUOVk2MUNB?=
 =?utf-8?B?ZC9US0ROcnF1cmJlWWdsa2hjVkJDczNQY2RiaGI0SkJleC9BVnl1dmlrY0ll?=
 =?utf-8?B?UHJ4V0xHYWUwSmtnRnVZOTVHZTV4by9EMmUwQnZNb1hhY2FzaDBsNU5xRmJW?=
 =?utf-8?B?SnNEZlhKeHRZc0RKSGtDUkNid3ozQURQTTdtUUFqUTFGQTdzS3ZvZ2RhNzhm?=
 =?utf-8?B?Vnk2ZFZZQWVxZGZ1Q0FmRUpzZ0xwb2lEVllkcEJ4TTdXWC9vdDAxWmdFMWxH?=
 =?utf-8?B?ZFpLMzBIdjNHY3BBeTU5RmdSY0xXWlEyNEwrcGtjamFuR29IdnhvSlZyRCtm?=
 =?utf-8?B?VmJIbjVFd2VnL0huSEhGTzlFSUlRM2l1RFFubDBSZ09abWZqbCs4dlVGM2FS?=
 =?utf-8?B?RUIzV0s3bDhZWlREZVdORWFWa0d6bUxZWGo1c2lLSlc1T1crWFlxZ1JpTU9M?=
 =?utf-8?B?aElRVWVNNHJ2dDN5aVd0aVh6MDhEUnRxNk1xVWJRYXV6d0s2TnBmVE5qRVRI?=
 =?utf-8?B?U0QvQ0lORjNEYTM0K09abzI3eHVsVHFYRXBuakpLY3U1amxUYjZ0ZWZnNzY1?=
 =?utf-8?B?RmRQZGcydG01UEpTckl0WVZZd0hiYWVNSG9SQkRSNWZ0djl3WkgrWDBrUlM4?=
 =?utf-8?B?ZjFzOURjcjJabklMeHR4RlJwNVhVT0tmN1NSaitKaEU4citKYitvS1VxbWlY?=
 =?utf-8?B?d2IwZXNTZ3NNMmdVVC9VVjZFV3BBMFphdEFTZjFua2UrdVVsTThzV1FXeHhV?=
 =?utf-8?B?K3VNZWxjeC9DdEFaVER2eHFMeUNDQVpRZit3SHlKVVNMcktDRk1GSmViRXJS?=
 =?utf-8?B?OVQyS0hpU05BalROcE16eEcyVmI2WHM3MGp4eEpHRnJMajJLMFFEcmZmMFdD?=
 =?utf-8?B?T2RvZnNDOUZFZ3FqcUhGaDFlb1R4WVcvZmR5aVB5aU9sbWhsT2lLZVBGZmRR?=
 =?utf-8?B?VTlpQ2dXakRwaEx3VWczTjIzMldpb0Y3UUU1cE84T2VRYlpZak5CNGExQW5C?=
 =?utf-8?B?ajYzbGFkZXdVa3JnRzJsOEpuck9QNXByVzdqZGJ4T0FWZ1hPcmZ2dWxJSVp5?=
 =?utf-8?B?WXBhazRqaFFXRlNJY0VMRnlCa2FRQmNpZTY3bzBhSEhseWtUR3pDNFBtL0pS?=
 =?utf-8?B?OVFYMTBmNmdtay9senV6TnU1Wk9xdm0xZnpXck0rb0xUNkE2czRlWndSWVAz?=
 =?utf-8?B?VE9mbDl2c3RFM2ZSZjJFeWxXbGg0Z1pwQXNNemJ5NzFCaGdhRWtoTjVVQ3hG?=
 =?utf-8?B?Z0xBV2hMS283NmNZVVcrK2w2cExHRnpDNGhVMTdldEZWZ1Vpd2VGczlIK2Z5?=
 =?utf-8?B?RkdhSzJhOG1iMVdiSDJ3a1Z3dUJUNnVUR21NMW1tMEFZVzBUQi9HdUlnK1V2?=
 =?utf-8?B?SEl5bkRkbnAzd0FodXM0Wkh3cm16RE9tVXJ0M2J5T1lwOXIwM3VuaGF4a2FP?=
 =?utf-8?B?TGs0blBlblBMQURRcTRzUjhmb3V1dUlocW15RitTbjY2NE4zWVN6YXc3WWNu?=
 =?utf-8?B?YmxaU1dKYzAvMHV6Q2wyS0xTdU85WGtNNGJHbkt4Vno4WWwyT2NwaHdJYVZm?=
 =?utf-8?B?ZnU1ZS9WUGNHeGxmcUwxZWkrcWhJWDN0RmNQNVp6YzhsM2JCdjJ4K1M3dDNs?=
 =?utf-8?B?bzdDeWR2ck5ycEZnaldYR2ZlTlJndUszd2FNZXMreHlmUEdPK1ZEWmxIaHM5?=
 =?utf-8?B?S0lwRlR1VUl6ZTVmU0NyMDZTajg3L1gwd2dsRlY5NWdzaUJiYVZoUjFsZnY4?=
 =?utf-8?B?V1VJQkR5eTQ2NDJ2ek5MT1pqdHdnZ0p1VE82TERZRkhHdyt4NVI3UjNiaE9L?=
 =?utf-8?Q?VdpvWBJnnK0mVl0Y=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b8e1e3-ea1f-419d-cf53-08de85f73601
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 20:36:34.3463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBu6ZtFupNt6L7ir7V7Ivsn81c0NjUCBI/wQ8PLNczCLP85m4qcHlKO/Ugs/Wco5a76yY9+iQe8LzUfWOSEi6DvwBw301bYMx735AwCfZWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6208
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 879242D23E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> With the removal of lazy FPU, the full state is always restored on context
> switch so stop tracking whether nonlazy xstate is used.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

