Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCmBAeIDxWmM5gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:01:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A76332C76
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263610.1555486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hVT-0006cX-5U; Thu, 26 Mar 2026 10:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263610.1555486; Thu, 26 Mar 2026 10:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hVT-0006Yt-2O; Thu, 26 Mar 2026 10:00:03 +0000
Received: by outflank-mailman (input) for mailman id 1263610;
 Thu, 26 Mar 2026 10:00:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5hVR-0006Iq-Oy
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:00:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5hVR-00HX76-2D
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:00:01 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c503a0-e002-0a2a0a5209dd-0a2a4504bd20-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:00:00 +0100
Received: from [52.101.201.22]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c5039f-c823-0a2a45040019-3465c916825a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:00:00 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6955.namprd03.prod.outlook.com (2603:10b6:510:172::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 09:59:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 09:59:55 +0000
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
 b=Go4IpTjZRB2iIRE9BgIZ7vcvNAwqvfPZNbOCfkq+9wPMvcFsCUXXsR2jB1fdL8DrMzUUMaSrrPQ3ouR/kNQyRQ5adp+YEXyI6oJCR6N7l+CGwhWkS8Css8HyGMc76kz6cFSyZx5zD/ebyQkEiYjlN0OdfpHcP5FM/UgYTKQtbF5iwW8NSE9k7TVCf8mLDxy5RofPlwquA4X8TaP5thzI8d/AB86+/egMOJsvf5wf8gHQxY+4dj+7KYmPCL7SGAiHFPSOMXnyTLz1cAZURmMQKC5NCz38lUV+qnOrmJNiwJL9PNnYk2JaPru7AKceJHbsVA8bYC0WDTo6kQ0IN3G24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pQcyiS2okaqviuBzxQ6e8ze4ASPicCKknHoycmWre4=;
 b=R3Q4Hh9VutEjauyx0q9eks5lQhMq+sOUpRIdl41GyIuDlFJjI/kAYyxozmnBfkKMJabRec4otRXOZCNjY6P7NjfySeSNcqMW5tno6RPXytjZwlhtSRCr57gTd/WZJ/iQWKI2CtOvSXcvx6JOaKvL0v0ZpV56eUOcuzcglgHZ07EsAQfgSZ/RdkLfwcMAVrF5djkjcn5MSnvI8k/eDH6SoTD3Mpo9KzEVIeiYoNBnPYPF484Vxagk3Hl7ovFEWGF5JJRoxqfmpPXSAnmR03+HD/X68Ogq3NVfSIFFwvENcfYGMKTFBjSF4H9lG4lbLm8YVPHKbgxaIqMM3+Vm6RRmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pQcyiS2okaqviuBzxQ6e8ze4ASPicCKknHoycmWre4=;
 b=QI4YV4io58A/ohZ2ylOfr7xk07txBMtt4TI2bnGgx0TQrUEceDDdDKYLfMvSMWaLUggLQk87IWCDpF4zLU1U4mmIl2sqn4VSnYLP0TMVebnv9mJoTH1bT21Fhw1sQ6cDySRmDbAGkMB4jaCvar+t2P84v7LJ4/jm7xlbtM8luIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 10:59:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/x86: Check supported features even for PHV dom0
Message-ID: <acUDmOqvggJfmhHu@macbook.local>
References: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
X-ClientProxiedBy: MA3P292CA0040.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: ad68f575-f96b-4a99-531c-08de8b1e6e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	amwsoERPjosawLvknjukpe/QW+pHeA0elzEqHcdNJVemaC/5cAzsGBPmkc4R/aMqGSJJOdFf1pmQXadwKaxviMeaOxPArXCbCC4nwMtuUBO5OhanyBCEwszOnZbYs/5EywLoaVdaz0ZlOiZaZE1pO1QXTdix7/5lhZCT6vuO3tKxCoij3fttygtaYCalPubKPCnOBr04OgxdqaMM8/mVV1qDcCmgb/26KZ9qxvRIAmURjJL8eiF1qI5qTYeClX7eoJPcdRsvmjjjAaiwYpxoLe5ooDGopQ0BakjcXq6SlX1J5Ov00kvBrkV0U/93AriGiAM8EAkTrg6zMXzMfL3+zN7qaxrsqSow1ID+nwvB3bHaRw/TZhBKdi5gn6Gsyg2qtqJ66A2au68dVdb3RuhDPw7JRutuK6ALuMslrouUK2vrzibdmiGMJ7l6MjPr487iZH6VBzRduNJKqTMMCZg1m3lFKW/iwm5MP2GsPws+bwNuRksjrAxGHrTL46JJiCAhS01dBKkRtitUzCKqiyZm7014ukITtvZ2+0WexVBYC+tvZlNREwzBgDu4GoXzy0DMMqGFh5W91nGyXUZsVQWEcvAXkBsopLrQ44HdbQFLs9/aABuYu0AUgf8ZLRLeYYfYbmYtXrpkoe84cB+fuwT1lXlxLoTEdYsw42OeH1HTUXKvPjD0chnrVn3tjUk1CggRjO9OfQbYslvSn3SZ2OsOGfOajXgsRoT594A+mSnJWxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TndUbmlQTjVwTCs1UmI1dWNHZ2txZW1sRi81eDZLNFU3TzVPbFB5R2xGMjNy?=
 =?utf-8?B?bytZL2F5RjhqMFUrV3pDK0JqeWNobU82Q0FpSmtBYWVlZlV0dWkrNXN0Wi9E?=
 =?utf-8?B?VGY0T2tmMGZMS2tmcjNoTkFjYUFMakZyb1EvSEo1OU40UkxxemNqL0tKMjIw?=
 =?utf-8?B?RmhVY0IyUW44cHJ2OEc2bnRJODBkTjI1ZnBjZlEzSDY4VmI2SkZnaHVhTW5m?=
 =?utf-8?B?VU9RcWFqbTNpZGtpSmRFV2xsU2NzQ2JoV2dIYkg5WkdJbm9CWkVVZVZ0M2JN?=
 =?utf-8?B?T052MHBNQWFLTytTdDkyWEpKT3VZZCthRzQyNUcyQURkTFVQVXBFRmdSRGYz?=
 =?utf-8?B?VjR1d2xrZWhWcVZ2ZGxEWnhKZ09DblNNbHZSQ05sUEc4aWRaWHN3L3JBdElR?=
 =?utf-8?B?NENuMzRWd1JrU1MyQllnMFZxek5sM3B1Qzl6SHU2TVBHUDQ0MUEwcTlPVDV0?=
 =?utf-8?B?aHo0NGhsMnlsckZvZ3F0WnRqMDVkTkZMZ01yK0NHSkk1ZGpPV0hIQUVmUVFh?=
 =?utf-8?B?UnBmL2k0NE13TjFlSHlVOGtLak1UOEVVSUN2TGVmMUhYOGE5TkFPRmtjbUhi?=
 =?utf-8?B?SGlUcWZYcDVDQVYzZC9ESk0xNnpxNEI4RmpPRzhOTFlWR1B0alZISk43MGQx?=
 =?utf-8?B?dVJZcjdoYkVZTU9Hdk91R0ViQ05wM0l1UkxjUTZRdGxxT2x0eXNiS0RQNllG?=
 =?utf-8?B?QUp4YmlTMTg0VTRmTHlDcHBscllBQmIxRUxFZ3RLREYwVWx2SkF5Q1kwekp4?=
 =?utf-8?B?anc4aWZlN3BiK0hsZ2ZQUHNpSVdZeXlkalRCZHVDMHV2RFExMVFkUnB2S1U2?=
 =?utf-8?B?bzVzSTkvZVd5UE51SEV6Zjdaenh6Q3pPL05GTHl1dnBVRjIvZ2hNU2E4NHU5?=
 =?utf-8?B?QzlXTnNYaHppTnkzZHVqMkhrWS9kTFNla2hhRzJMNUFoQVRtdGI3UXRRZ0hJ?=
 =?utf-8?B?VDR1dEtKdU1qTXlyUmpGcnI5REdvSHNUeVlEVVdrOHhYQ1dMcnZsZ2htQWZB?=
 =?utf-8?B?bldWRUNzOTZqT2dMU0lPNnpiM0prV0JYcURIeC9CVWZIWk16K0VTeFZ1Ryty?=
 =?utf-8?B?UEJWWkFPaG5ibmxSTUFjSkJZTE1od1Z1UU5QUnprd2UzVGNvUU8rWHFKMDVq?=
 =?utf-8?B?THBtT1VjeFlXUjFQRHk1dlp4TEdwSWpEekRGWldURHA0TnNJZ2tRTHdQYWQv?=
 =?utf-8?B?RzE3K29sQ3FvWHBVWnJTelg3U3FpUXZLL1dsZVpwcWxpVXlhc0h6YkZ3RFlH?=
 =?utf-8?B?VDgvSVRybTc4a2gxWHYzRkR5N01yQmJGTHhpR1BUd2VxS1RYN1RuR3dwWkhO?=
 =?utf-8?B?RHJFbVpWaGl5V3FhNTg1UzViUUJpWmZBWW8yM082WnhWVHRQekx2d0FXM0tX?=
 =?utf-8?B?SUV1WG1YWjR6OUtiQ3d2Ymc2TUI2dDlGNHVIRzY2Tlk4Ukh4Qk9uZk9UeDhT?=
 =?utf-8?B?d2IyNmhsKzBtdW4vRnZvaGcrS0Q1VElRMndDTEZBNklYRlNyQ0N4NDdyeHkv?=
 =?utf-8?B?KzVZUnRKdUpyV2wwd3ZGcm1Vek1LNmQxS3d6N1dTVFgwUisrRThkTzZGRkpI?=
 =?utf-8?B?ZStLb1c4ZjRqaXFHMWpHN2hTSThjOXN3MzhMbkplc083UklwTHYvQXl6cWRh?=
 =?utf-8?B?VHI1QTM4OEZ2M0FHR013OW9MdVNiOTlQM2Fqc1pzNzVJc3RPY2IvUHhBRzBX?=
 =?utf-8?B?dU5LNW0yWG9HdlpTYVE1b05wMFVZQVFHVTNVR2tnam5DVzk5RHh4VTAvbkk4?=
 =?utf-8?B?eXFjRGM2MllhcVN1YTczUjIvWHo2bnZUbU9XM3YzZFpQTGpFVWpBMmkvNjdB?=
 =?utf-8?B?RzRXY3NZRnZ6eDRiQXk0b21NdXU3OWhseFZCSnNiRmpvaEMreXJiNHZaU0pj?=
 =?utf-8?B?d0V6ME1jYytPMVRsMVNRY3kvZEV0WHowN0o1TEc5RmNIV3g5eG5hSVczNjJ4?=
 =?utf-8?B?TjJXRkRFcHQ5RzJncWdINXZPdWVZdTNvN3dzdUxlbVROa0UrcmdHdmNSV2pE?=
 =?utf-8?B?OUhzQ3ZKUTJEZmxzcUM3TkpIRGN1Z2JqVnlaMXBNdDhRcURaSndwZzkrZjNx?=
 =?utf-8?B?empZbFNSSHFDZFMxWVVVUVBlc0tUMzdQOGowMXFuRlhEb2RUbzRhZUUvL3hj?=
 =?utf-8?B?L1pSOTM1cHVHbjFvR3JtWGt3RDAzYkJiYTNvNUxKRVkxWDZMRHdJMU5BcXdQ?=
 =?utf-8?B?NWxxdlZNc3hDVHh0eExNWXVwa0M1YmhIWVphWTRWT0U2VENETkE0NXduMjJm?=
 =?utf-8?B?ZVA1a0puMktnb3hMVXZraktkR1pXQUpVOGdVaGtCRW9UOHpLVGd0Z2tHRGdF?=
 =?utf-8?B?S05RVENGZFpyU24zZVd2eThCblV2eDNNMHEzeCtkK0V3c2h5MzJKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad68f575-f96b-4a99-531c-08de8b1e6e76
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:59:55.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dmOJSmz4QwUsmPrI383+ebvvP0o1rFgy3/wVAOrqfcY0WUpHPw/hjp8OeKbsxUWuj/QCsSp/fTxfVljjQC25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6955
X-purgate-ID: tlsNG-ebf023/1774519200-B8E889D1-68A58FEC/0/0
X-purgate-type: clean
X-purgate-size: 3927
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email]
X-Rspamd-Queue-Id: B2A76332C76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Typo on the subject s/PHV/PVH/.

On Wed, Mar 25, 2026 at 03:55:28PM +0000, Frediano Ziglio wrote:
> The supported features ELF note was tested only if the dom0 was
> PV. Factor out a function to check ELF notes and reuse it even
> for PVH.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> ---
>  xen/arch/x86/dom0_build.c             | 16 ++++++++++++++++
>  xen/arch/x86/hvm/dom0_build.c         |  3 +++
>  xen/arch/x86/include/asm/dom0_build.h |  2 ++
>  xen/arch/x86/pv/dom0_build.c          | 10 ++--------
>  4 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 864dd9e53e..c6bb2f8067 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -321,6 +321,22 @@ unsigned long __init dom0_paging_pages(const
> struct domain *d,
>  }
> 
> 
> +int __init dom0_check_parms(
> +    const struct elf_dom_parms *parms, bool is_pv_shim)
> +{
> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=
> XEN_ENT_NONE )

The patch seems to be mangled here?

And the line is too long otherwise.  You might want to consider
returning early here, to reduce the indentation of the following code
block.

> +    {
> +        if ( !is_pv_shim && !test_bit(XENFEAT_dom0, parms->f_supported) )

I think you want to pass the domain being built to this function, so
you can do a check like:

if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
{
    printk(...

That way you don't need to explicitly check for pv-shim mode, and
would more naturally work with things like
Hyperlaunch/dom0less/late-hwdom.

> +        {
> +            printk("Kernel does not support Dom0 operation\n");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +
>  /*
>   * If allocation isn't specified, reserve 1/16th of available memory for
>   * things like DMA buffers. This reservation is clamped to a maximum of 128MB.
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index d69a83b089..ca96f32acd 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
>      if ( !check_and_adjust_load_address(d, &elf, &parms) )
>          return -ENOSPC;
> 
> +    if ( (rc = dom0_check_parms(&parms, false)) != 0 )
> +        return rc;
> +
>      elf_set_vcpu(&elf, v);
>      rc = elf_load_binary(&elf);
>      if ( rc < 0 )
> diff --git a/xen/arch/x86/include/asm/dom0_build.h
> b/xen/arch/x86/include/asm/dom0_build.h
> index ff021c24af..a322bf455c 100644
> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -8,6 +8,8 @@
> 
>  extern unsigned int dom0_memflags;
> 
> +int dom0_check_parms(const struct elf_dom_parms *parms,
> +                     bool is_pv_shim);
>  unsigned long dom0_compute_nr_pages(struct domain *d,
>                                      struct elf_dom_parms *parms,
>                                      unsigned long initrd_len);
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 075a3646c2..9d0310ad91 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -494,14 +494,8 @@ static int __init dom0_construct(const struct
> boot_domain *bd)
>          return -EINVAL;
>      }
> 
> -    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
> -    {
> -        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
> -        {
> -            printk("Kernel does not support Dom0 operation\n");
> -            return -EINVAL;
> -        }
> -    }
> +    if ( (rc = dom0_check_parms(&parms, pv_shim)) != 0 )

pv_shim is a global variable, you don't need to pass it around.

Thanks, Roger.

