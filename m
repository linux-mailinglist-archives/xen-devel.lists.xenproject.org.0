Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLrIBfoi+2lvWwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:16:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CD4D9A7D
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301600.1575861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKaEH-0004Jx-2G; Wed, 06 May 2026 11:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301600.1575861; Wed, 06 May 2026 11:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKaEG-0004Id-Uw; Wed, 06 May 2026 11:15:48 +0000
Received: by outflank-mailman (input) for mailman id 1301600;
 Wed, 06 May 2026 11:15:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKaEE-0004IC-RY
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:15:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKaEE-00Fmjg-7q
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:15:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb22ca-2eae-0a2a0a5409dd-0a2a4501c9fa-34
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:15:46 +0200
Received: from [52.101.193.36]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb22e0-c1f2-0a2a45010019-3465c1242d1d-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:15:45 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5601.namprd03.prod.outlook.com (2603:10b6:208:293::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 6 May
 2026 11:15:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 11:15:43 +0000
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
 b=MMU/6AJQR4xE8gCUcKaU8jbiba/JdBal+G5iFSZNDbC3PLov5WsvKXaY61HuXFevqrUB9TpPoHm1PCANwVzwcKiB4FE7HABb5gm4vaK1g3CU4TXS6p1qmps0m5Yd6TaaLlZi+5r5Z7hDDidoJ3vLcrTQIqE9dmFOC3VJ4lwsaZM+oicJCVN8gdO9ja2YaKtMmCtsyEesLIsM2VQ/gr1OnV/ABCNYb7wt8iu17dTzSAbIAzimHvjAAcaDVwvQqyWxYOIjENM43NaDuK+OZa2RBXq5n/nStXt1xIhruaVuDRO4C3rAExZqnzPPJiPZgd79APpMSkKnLAlUI0kNPs+o4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8X8hMLfFknAlmgCNi2ki0dDl+m1GqSyXOvkgTWewH0=;
 b=STRzj1MkXHkoVn3wmMbqIMZxOWt7MU9KBK2NxhlNOihRTzdWDDWZZu2flDe4am6JLmy4hKpQxMkP9KxmLJVKTdcPq0sPDbTgTDvWU2m2uL04vq/9Rmgj9cspB6ti7UT6iR34G20XVp7CLPlU+vtaeAr0iMYEB3TzQlJdoj/MmoZNx/sUxwbfdMlMrwVbDb6VkXeiVckphUFLg7wOgRUwzKlSaHQ/7jEeNcx4c9mxhQEmN6hj8vA+4LmzmrTKt1uzD9b1YtDOHp490K3PDaKBuXs+od6pDIa+udyyrBGLykP0WcHak3aptu/fftPTv/pBDCOY9J6XLlgjxm04jGoBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8X8hMLfFknAlmgCNi2ki0dDl+m1GqSyXOvkgTWewH0=;
 b=f6sJccM8a0A/kWpRrZYN4/pNaqSeHUMfOr56mfl/TwcdevMCKnnLbsyPb+JEqKXbzQBpiGwRdegzIcWqTkP6Gz0EgPAfU/JidjvpXDMxtGfburEbDxUgUZViSlD3Uw8D8D35qAyhCsfonZUuiLNbR+ECH/7xJb8vppuduHTjOdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 13:15:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
Message-ID: <afsi29_wLi_P7G4t@macbook.local>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
X-ClientProxiedBy: MR1P264CA0073.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: cccfb327-60d6-4e01-3005-08deab60d045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MfgryfK08tmHWxEeCSqk/SCeiTedi8UATfywSPnDZpkcUD3Dys+hYyekKZE7abR9pn45fnYLQ22W8T8fB0WF0n40Q2Fx9U7uLwW22tym44xuuVG/DruRO5jZa+jwe2id5dVXbCjTkXhp8UMR5k9s4saMUhodCJ5uBb1PCVB1YTSZB4955sqybwcBEZHGeIInckjhxTp0141o9NyWPWkt2GIY6uIxa0DypeIB/W9sEyG/pDdPlAtI4VFxd0S8exRZFHFxKHXF0Pm23gTFgQLrTHoWcIM5u57W5/LWhlIX7V/Pn2/QUf1IGrHZ1ClGl3kjlLLBm8cc3qeL3ZEJtqW0N37nJxb8+L1Mmfu2zxs6g3ezx8y8ZsYUmwBeuiKpaOmOyWBmpldTqBAAf/xEegWBfujM+W7b0nQrMdRO7LAk73Up5gxWkzyMlpp60lfjJy7GwzKJ4YMiZj/BKTUdhDB/mecLBO21Y4GYGdD5tfQYyvzkfLJYc1+qSV6jbIzX0inXJZdwnOh7k4C81k2mMyvnDujRJEAAs634v+T2m0pjDrLccltYoqtkJtY2vmsu42qo+m/302sXzvp5m+OjdGANCAUFZnys1Y++iWz+XIoWE7GETFE+I8bWVr1GbxHnDTv4YrMgGuPfj/1OKSX1TPkIbilfV+g0NpV7563wzIh1y7ni8Cok+BSqbsMyWxdzjDhq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm1yMERqLzZyaUZ5SWRJUy9mZ09EaW5mSkNFT1B3a1lURW1kMmtIbXJ6U3ZR?=
 =?utf-8?B?dHh5WC92QVhMVGptc1d3T2Qxak1BUDBDWmtVN1FXUUFGZXBLV0xEdTlMbVhP?=
 =?utf-8?B?SE1lcDFiZzZVcm5uaGhlL2tPY1dCUEVXSlA5OHRTUXNZSHBSRlo4TVU4NHdX?=
 =?utf-8?B?U1MzYVlyTlFtTFNCWGtnckxTemJBbkY4WjUyWCtBYi9mSm9LWVZWZUZJM0FY?=
 =?utf-8?B?M1hMdHpSZnZzTzhMQ0xPRkN0U1hINjhXdXFadEd6eUJRMldaa1pPeWNKaUlM?=
 =?utf-8?B?WCt4SjArMTlNT3dHai9jam9xcmhlbWRZbG9NUmhST05XQ0cvb0k4ZEYxemJD?=
 =?utf-8?B?eXh0cCtFQ0dZK21jbCtuWmpES3l3WFo5b3RkeXFjQ3p1ZS9LajRpWmhycy96?=
 =?utf-8?B?djFuT0dVQ2IrQW5yTjQvRmpYR0d1OE9TRnp1TzJscTZlOEdyU2NUSGc1bDVQ?=
 =?utf-8?B?bXVILzdnYmx6Tm55R25UY2pkNUNtVkI3Z3JVdE9hRURPcWpLTkN6ZUhPbUVn?=
 =?utf-8?B?TS82ejlWSUlwandJK0JnZlliUDBZT1FCbDl4UnNpSTJEYXhhT0VoS2ovemNQ?=
 =?utf-8?B?d1RBM21wQ05FWTFmbGRhVG9GRDUxb3BPTG95aUJWK0lYSXlEOSt1bStvYUJH?=
 =?utf-8?B?cU4xTFJpcXRqSlR4WUlFTFhmMmhVTTU1cnFIQWhnL3B1d3NndER0TGFSQWpV?=
 =?utf-8?B?ejdqWjc1RGdhYWg4S3ZZdGRodGdzc0R5bDZJK2h6UzVERzFVNEJ2VkFQMTBW?=
 =?utf-8?B?U2tkaDY0d1RPUnlvelZaVXptRGxKb1UxN3BCSW1lMlJtK3lzSU1NampxTThE?=
 =?utf-8?B?NXBKYlZIU0VOYi9mS1V1Ym1nQzJKVjdDV2JISXVhL2RjQ05vTmhJcWQxRm1U?=
 =?utf-8?B?NjBYZ1hSdTkzZVplU1BlcE51TVozWkNCYTdNd3NJV1h6U0g2bXJ3L0kyRklJ?=
 =?utf-8?B?RUd0VGVzRDJhSHRueVhvdThYOE1GU2REWVMzQVRIVUI3bDJ4VU9FRXZBSkUx?=
 =?utf-8?B?em03NHJGTTc4WTdHMHk2ZlF0aHBPUGdDcHI0Tnh3U1o0WXZGL0svbnY2akZp?=
 =?utf-8?B?ZVZGWndVdWdqby9HNWhqZjZGZkZVQXV6c3JVUXJRQVd5S1JDZTdra1E0UVhW?=
 =?utf-8?B?Y0RwdTVDVDZMNjB6OHh3dlcxWTE5ZU16a0Z1SVc1K0IxTEtteWkvMjFaTzZG?=
 =?utf-8?B?Ui9NN0I3TzRRMGtCamY1WEcxY0d6NEZCU3c1SUFIRE00OTFMK0ozNndJRC9s?=
 =?utf-8?B?ZlJEeVY0UU4wWVB0bWc2eFBleEYwYSt6RE1zdDArUndlUE1UZFpIZHA0TGlM?=
 =?utf-8?B?MVZmR2dPdThPSFVoaGxJRjdZZ3pxWEI4Z2FCc0dIOUJQVVdiS0dEVDVSYzd2?=
 =?utf-8?B?NDBTSk1BenV4am14T1BEOC84L3I5bXB6bFVja2ZtSkpNTmlyalRZa0JDK1lj?=
 =?utf-8?B?QmZ2eC9ONDhVRk1yY3hJOE0rN2VWbUVtUVpVUVZvM2Q3OWl5Y3U4eisyL3di?=
 =?utf-8?B?R2w4K0d3SHFFZHE4SnJ0UHNxcmcvZFdkMVNxS3lJbnJBclROd2FiRXFVR2NB?=
 =?utf-8?B?ekswakc4UmRBZUtOakVaRC9Yekl1Z0tFa0ErRk1JWjkxUnp2QyswZVBFVnc3?=
 =?utf-8?B?Uk5MY1lsM3VJbCtWd3pDUjF2YWFCUWp2dVo3WnRmYjF6U3dBVmNrTUVoZ3Rk?=
 =?utf-8?B?bldmU0pob24zQ1RaWjNKQkNVaWZGdTltancwekdEVWc1UjVVYkZPZkYrRStO?=
 =?utf-8?B?TStnKzkySEV1TkNtY2h5aUF1bjhBdWY2NUZHSjB0WjhIZmhOdHVPN1dhR1Vi?=
 =?utf-8?B?My9hNFBncUYrU1NVaFl4QzVwYXcxNkIzWXhjdVAyRDRjNm9BY3Zwemd5anI0?=
 =?utf-8?B?ZENiTGpXUVN3LzZZaUIyUkZlWEdsN240NHRxbEFWcldJY3RTaGhzOWRMZTVE?=
 =?utf-8?B?cDRpS1FKSzNkL29FUGdTWEhuWXAyN0JqV2VWWnVQZGlpa2VCTmRYVUZiaXpl?=
 =?utf-8?B?NXlkMTVVT1lNWVhqTzNmNkozME8wdmJ2UHFrVG44SFhQS1psTnFVVXQ5em5K?=
 =?utf-8?B?RHUwWkd5WGVtbFFxZGNtUEZLWmxPMHV6Vlh4UHFleTF5SldvZzNnWTdDd0E4?=
 =?utf-8?B?NmNTNFVDUUZnNWJiaFVScHBhV0lTNTd5MEdWdGlQMEJ6MmtuN0cxb0ZySXU5?=
 =?utf-8?B?emRRcWs0SzBlOFJ1Mm1JRmdHbXowN2FGVlAycUxubGVSTStGaWpUanFGRnFS?=
 =?utf-8?B?SzBNME9pV0ZBemVUQXlxRzUyeTQzQVJCNTFucEVPVWhOU1Y5RGxqOVQxcGpK?=
 =?utf-8?B?Wk9vOERpMHpJSlBNMFR0RjBLRWlVS1VMMzZGRGpYbmpNYTJqQ2JQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cccfb327-60d6-4e01-3005-08deab60d045
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:15:43.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJF200RKcSO5RQIKjgLZQ3eYl5/WdhyMxsjQCRWrvtegFXRdt+p+CBAQju/xRBz3x0Va3n+7BVYDQwxlBQKJlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5601
X-purgate-ID: tlsNG-d62444/1778066146-B4F48FF4-79B49BDE/0/0
X-purgate-type: clean
X-purgate-size: 1923
X-Rspamd-Queue-Id: 6A3CD4D9A7D
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 11:35:45AM +0200, Jan Beulich wrote:
> As a comment next to one of the invocations states, get_wallclock_time()
> can take over a second. The order of evaluation of function arguments is
> in principle unspecified; in practice at least gcc looks to be evaluating
> them from last to first. Hence with NOW() invoked first, the respective
> value passed to do_settime() can be off by over a second (which is in
> contrast to __get_cmos_time() attempting to get the time exactly after an
> update, i.e. [pretty] precisely at a seconds boundary).
> 
> This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
> and its persistent side-effects shall be the same under all permitted
> evaluation orders") violation each.
> 
> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course the time it takes to do all the CMOS reads (or whichever else
> wallclock time source is in use) also results in an inaccuracy. For
> __get_cmos_time() this might be solvable by having it latch NOW() before
> doing the 6 reads, but in particular for efi_get_time() there's hardly
> anything we can do.
> 
> As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also can't
> find any deviation for the two instances fixed here. What am I missing?
> 
> For __get_cmos_time(), tangentially: Wouldn't we better use the
> century byte if available? As it stands, things will break in 2070. Which
> is a long way out, yes, but still. (Of course this would mean a 7th slow
> I/O port write/read pair.)

Seems fine to me.

One further note: in __get_cmos_time() I think we want to read
backwards, so start with century then year and so on, so the last read
is seconds, as to avoid extra skew.

Thanks, Roger.

