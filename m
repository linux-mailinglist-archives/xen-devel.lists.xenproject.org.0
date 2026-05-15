Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHEFK+j8BmoeqgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:00:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90354DF07
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309842.1580870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNqHR-00057d-T9; Fri, 15 May 2026 11:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309842.1580870; Fri, 15 May 2026 11:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNqHR-00054i-Q5; Fri, 15 May 2026 11:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1309842;
 Fri, 15 May 2026 11:00:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNqHQ-00054c-AR
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:00:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNqHP-008Hfq-88
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:00:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a06fcbe-2eae-0a2a0a5409dd-0a2a4509aec4-40
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:00:31 +0200
Received: from [52.101.46.54]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a06fcc4-2497-0a2a45090019-34652e36ad29-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:00:22 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS0PR03MB8318.namprd03.prod.outlook.com (2603:10b6:8:28c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:00:18 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:00:18 +0000
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
 b=xyL45o3GMN0Rj5okErYcsWRfb/NNY/yA6yst65mNg354ws21GthfL7Zx02YaDMPM4lFuWFVoKS9peXkQ3s1xZoAUKO0frZAT/GMhVWl/oM4OQeG8siA+ci1D+bXyUsaGK3txbJy+BGHilYwSW7u6sU6cHStzrR/ZBg81wbuPveieeitrcDFGi5SK1jw+GWZdpOeKSd7Jo/42mp+LDN6mqalGGjkCR6hfBM0on737xRy6Vv2OipCL4Zw8RCgmH6duEft214LVs2XzbmNIEYXTjHUhlrlcD/04hNO1OXgqrgWBOCWs4m77I58PPWBm9x+Sfau9CC4RtZUrUSPjfAx/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6aqMWBiQ8PAsE41wGtdmXtdcraXcHn3p2QTAZPBRs4=;
 b=CfV7pQLKhKkusbuT3UhG6YDadqAppC00nawQ/ZFAOCgjx+9EUBIQRi1XansS2iSlgbQJNm6rN9t7tO1Qf15HsoIXFB0J3cyYyOmsd5eJbAaydKF8Qs6plvufmKvF/LmSP2f5M7MHZGgI68pvkl9cGTbOh8SQy+n3NgZBjA8LxaerMDU15ZbyHU0u7J/50Pa5MKvq4UGUujz/8WQ51Z3EYRBcEtLYtftECuQ0qJ6SMnVGQAkgHHUf1HIlJCOqhMJVUymkq0JRV1rWLDrJS/xX6S1PJ+6ZiEOT0i+LR/IuSKCFeD06J6OVU0w0FIikXbMuNzB5YbI/7Iy/rSA4w/yESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6aqMWBiQ8PAsE41wGtdmXtdcraXcHn3p2QTAZPBRs4=;
 b=M91/TiGg2OoYXpPcPnNqQ+lZp2Z1wZ/tj6EUOB1kko0TJTYu1D6qzz3qohrr5jJ3zYtlKUhjdiiwi4IpDkCLjoRVuvZF5jes+9XD9XsM32KYw6JQi0by6HrXP5m4jQYdSVyODXd3iRVHh6otoDoUyBv6rueqXezOto2WGD6UcjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a47e83a1-f17a-4de3-a1f3-d9e62be346ea@citrix.com>
Date: Fri, 15 May 2026 12:00:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/5] x86/guest: rename a local variable
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <ea005773-792a-4db8-a8d9-a88049006870@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ea005773-792a-4db8-a8d9-a88049006870@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::8) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS0PR03MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1b87fd-846c-4c40-b68c-08deb27126b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	LuCtL+GETXnVUqxjeaqMKMA715G9x3nc5+i3ahTkNY0AiCXmtLEKamwrQ4BOkXoLlBiTzIhYerZdXYJTY3Uxm0JmnzkmxilxFwSCoQ3wRGUVFsB/fWSxFi9h4UxJrbja31HN3T6Ox5bYiUIHGKPQb+rSWCpGFUtGiNgv9xHv5KPyEBouliOA7XXBc+Sx8YEmeBs2pORTURJBOjkN/CIpAelq304ZKS5ONH9CfuspILSWoDNKB/dQI4O/zNecj6nzn5f63dwac3hDLlNS55RI46KLCjNgTre0c9+WoK0AU01/fbez8OU/91vWbgvOry3W2pVCRUwXgy+GmjdJOg38/lAqq0vCwV8CMMfg/5/bqwj++UFGB73lTquxw5CuVv9pkSHsPge4pGqgjndrp1V5TuitYmA5UviDl/KASOR1a0/koTW1wSCiBY8LNi2IFlsi1VSClz9K0F9uvbxfOj7crt5c7Vam2yPBSBp0KRjfzvo4rjFnwVrFzFRThX7YcVAMHjdf8tqXV1i72L6CnV/tnjt+G9anFw7dacvDZCM4L24xKGxY1FqoR3NsYizXaM2VvIGjhIYTsxufOtxlyj1LfK0LRHe5qne0iJFBxwYRURw7GfJeOPR0+pF5hNUHg0IBYzm5vkyQqWMScsEJMLboF+gsf1mJfEBFOctXNqLm2MKEA6SNn1rGYuE8mxyB/g4l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtOOWNoWmE2OU5lcVk5ZjhaczRFZVUzV0wvL25vR1dadjhXTitzS0NyTHYy?=
 =?utf-8?B?bUphSHVqdHg3cGZwdy9Yem85TjRJUFhLVnpNeTROOHBvbWFDdE9YcjJaR3Fv?=
 =?utf-8?B?dmdxWEZrQkhSVWdKNHIzSjIzcjlFUEpjaldITnJOTHRmK0Y2TjAxRG8yd1RU?=
 =?utf-8?B?M3FRdDVjRVd2V3A5T0Ixbi9mMFdLVys1Y0JEeWszMDF5eFlZZHVDMzBMbFpP?=
 =?utf-8?B?RzgyaTZqTVpXZ0c1ckFTTC9RdlV4QWxPUkRJUXFIZUFTSVQwYmxINm1XMXdR?=
 =?utf-8?B?d1YxSmllUTNrVWhtY3lLTllTNEhQYU1OeEdqSDljV2ZaL2FBQW1Dc09HeXB2?=
 =?utf-8?B?VzNwREhBdHpYSllNQnFJV0pSVWtVZXp2dnVJVXlHcGV5ZzlYVWtrRVhHajJx?=
 =?utf-8?B?WUF1Z0xxN2NvRlM5QnlxcnhQR1BzZnc1ZTNpY0JBcHR4aE5EbFArS3lSSGlo?=
 =?utf-8?B?amlJYnVncTR6V1gxZW1YdnBqSnRRaW1BL2NSdWgzZ0syZkZNaWpxN2lDOTU2?=
 =?utf-8?B?c3h1RzZ2NmlNNmdXbXMwSTZyMjZpaGxHOWZ6R3dFdnNsSUNPSDQ0Ykx0NzBD?=
 =?utf-8?B?aUpvb1hINERib0NXd2RLOWZ1UVJDeHV0a3VZMFpjNUwxRHNyQkFXMVdiSU1N?=
 =?utf-8?B?ckpDaWR1aXZDb2lGUm9KQmNTOFdLczZ2cGRCMVE4LzFaQkdWbElGU0pPOVAz?=
 =?utf-8?B?OVdWQU5ZQWl6N045VDhXamRKdlYxaXVLWHAvSWZsMDVLTkZFYlV4WWNmdmVo?=
 =?utf-8?B?ZGNBODdqVkhPK2E1VWt5N0REOEpQUlM4ak00VlVoSDh3c24rbVJHTzk2WnBB?=
 =?utf-8?B?d3F3M1NuWGVGSzYyYlQ1a25TR1NZajlyampETXpqU3Y3ZW9TNnI4VFJaQWtQ?=
 =?utf-8?B?ZlVySnZrTXpJbG90MmdtYzhodm1oVDl0bDRFZTRtc3NGM1BCWFlXc00wTWgx?=
 =?utf-8?B?SkVhS3dyRG5qOEZXMXJ4REZTQ0lQZ1FVbXVBbmxDN2gyNWdiUHY4M3RnT2Vi?=
 =?utf-8?B?UStqTDAzTGdjaGZEa1ZZbFRBVWNrRjNmY3dsSGg2V0o0YVhyMkhRRDcxZWFq?=
 =?utf-8?B?YW5vYlNCZGcvWEJtdDhWRlovU25wSytROGJNT3hQWjlWVk04dHE4bG5BTUF0?=
 =?utf-8?B?eHhrbkRjQU44dUs5Q2NiMEY2V3pNb21paU5uNEVWSXFPaFErRCtnRm4rUENZ?=
 =?utf-8?B?RWo1MFM0VXArcVp5QndIQmc2bnZtajU2RldRYVVpU3pBaThoc3A0bGZ6alpa?=
 =?utf-8?B?ajB0bFVKbUVIVi95ckdPYlhIWmV1UWwrcG5OWm5LMWdMMytBVHlESWl4K0lN?=
 =?utf-8?B?c29ZUlFHam5hYkpWeGNrK29mcVV0ditsS2txNUp0cjlHaDQ1d1ZEVHQvZCtG?=
 =?utf-8?B?Z1Uwa1lxL0g1VWVvQjBTVHR0Mnh2aXhwRjk2TXdEdTk3ajhvSGhsT2V1MGt6?=
 =?utf-8?B?VlkvWTRyM1dnWmZLQUE3bVFGcGtZblBYaHJjNHYzS29wcnArckh1bGhiOEd0?=
 =?utf-8?B?OTE2aGJ1R2p1QWZoUDdKUWE4K1ZQU2lwRm5QL1BWNTA3dmVMVnhwandlKy9Z?=
 =?utf-8?B?WFFBQ3VObXBicUo2anlVRWVZNlBYZE8yakxTTXhLY0E2akl3cys1bzl0b2Y5?=
 =?utf-8?B?SXZ3dHlqMGw5MWNxSHZyUDRVcGJuZDJ5Z3hhVktiTnNTMGJwNlJVV0FXWW9a?=
 =?utf-8?B?R0J4UzhIL0dydGNjbUJ3dDFlUHFRQmVuNjBzU0NoaGd3L3lXV0VFajZPQkZX?=
 =?utf-8?B?Ym1jSi9rcC9kN1JoOHgrc3F4b2x1TzRvNXFDWUsvaTV3dFNqMUhVR1ZCT2di?=
 =?utf-8?B?ZTMxMklqSktWQW9YNjZINnlSN0FGdDZKRlNuTjVXQzN3NW9PenJxYlp0Ukhr?=
 =?utf-8?B?emxIQ2dmWmZmeFpNVzJzTFRiQ3lZSTVSRDJvL29qRWszbDhSYS95bXFPZEdO?=
 =?utf-8?B?RnNTMUdEUi9KcXZuK2Q3NWdYVTFVYzRlYnJpVHU5VmVsZG96b2gvQVRyb1B2?=
 =?utf-8?B?Y0k4V2pPcEpXVDVER1NSRWMxaVNjdVhLdWRtR1hDVDFlOUc2cDdTd0l2OXBS?=
 =?utf-8?B?UjV1dVBRTGQ0azc5cjVtZVZPWlBHZVRkeG0ycCs4eVdjMjlQUHJSUjhGVGRC?=
 =?utf-8?B?TDFtMXg5Q0xJdVdXbGJ0V1B3TG96TW9VSnByVVMrTEpvaC8zQjhrbFVKUDhB?=
 =?utf-8?B?dlJtbSsvOUlFODZERGo4ZWZQTElhNGsyVUNYVHkyemoxbkFjbVB2d3hCT3Yy?=
 =?utf-8?B?dTNxTHJOdkErZVdPRGZxMERFTTlRbGF5d0s5MS9TSW9EczlSdmtLNE9pTjhl?=
 =?utf-8?B?K2xaV2VZM0gxdXZoVUpNbzEwbHZVVlNnOHI3TzJUQWhtWkdQdk5rYkl3T0hm?=
 =?utf-8?Q?tGi/nbTs8sp6J+RI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1b87fd-846c-4c40-b68c-08deb27126b0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:00:18.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMcnwpVSbRdqOpmAsSrxWM7AQKlWXPiHomyHSqj72iZLaUg1Z9t/QRkINm+NhUOGdufEc8vqaGG2zGet7EbS505bQlwM3MjIx91OFPwwva0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8318
X-purgate-ID: tlsNG-bad1c0/1778842822-41F6EA53-E46153E4/0/0
X-purgate-type: clean
X-purgate-size: 366
X-Rspamd-Queue-Id: 1A90354DF07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 12:44 pm, Jan Beulich wrote:
> ... shadowing a file scope one, thuis violating Misra C:2012 rule 5.3
> ("An identifier declared in an inner scope shall not hide an identifier
> declared in an outer scope"). No difference in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

