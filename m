Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIlYI3KW1mmiGQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:54:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BCC3BFDFB
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276471.1561935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAX6N-0003Ye-AN; Wed, 08 Apr 2026 17:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276471.1561935; Wed, 08 Apr 2026 17:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAX6N-0003WK-7k; Wed, 08 Apr 2026 17:54:07 +0000
Received: by outflank-mailman (input) for mailman id 1276471;
 Wed, 08 Apr 2026 17:54:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAX6M-0003WE-6t
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:54:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAX6L-00GEIJ-Iv
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 19:54:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d69629-2eae-0a2a0a5409dd-0a2a45048cb2-10
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:54:05 +0200
Received: from [40.93.194.12]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d6963b-bb33-0a2a45040019-285dc20ca07b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:54:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7796.namprd03.prod.outlook.com (2603:10b6:303:274::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 17:54:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 17:54:01 +0000
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
 b=kmatBLpbgfd73eJyAeLNYvhUqAH3H115PzjOJ0FufJk461+Aw7zncCvf/Lm1p2rAWIU+R6DE7jpM5n1mr/zfyz0dRY35seok7Do/AGM9KEmxjqiNwkk+W0ykU09f1aV3ZQTVO5BuYlhQSdJKWDVpgoKoM/VKjS9KA0zrSh3v92K9CvpySzqIckQftn8SLFxXW+7YSlIcJrIbyn3q1VxdCchTnDce559L3bAdXV72F/B4tit8IVpEgqWOUguhsm8qaem38UuYmB38HCEly9rLRb+BM6RcJX4Vgh35JPoPZcK4/B6R5gcYqhKKG0KVGkWq5tjG9ziCv0KCwBlPSsEnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIMrzchhdGia6eH2W6vZNViMK6HO3jKFZOOV2fmad9E=;
 b=qsL+T81q3PrCicYYtnS85I0qF0yUSe4p14qwmjT5HaGdSgW/YWPk3HokdAfHRH5FQHGQ4goP5tCiu/5+VahbjFZTR4JNotxdBWQkpcZVd3uug83tXcWxPyXEbqUg1amznihpPdpmyGZeRSDXesys4232KPE+7SXzu9HxxeQy0qGSbgrx4DRJHV62Botzciy0mdLcnErYp/PntFzAeF1QGWOdF5QaoAXlO7Sxonsp8uHPlXrjcd8WDeZPDzq6zEF8KsCMXerKbLJbUiRiZZAXSqo+aRDQKuhxUt7GecklIdTJ1Sk/+qjJRhb47l1Z7LAWxcwtriB7tWWcWXvev5o11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIMrzchhdGia6eH2W6vZNViMK6HO3jKFZOOV2fmad9E=;
 b=t9GiuBh/37R6LWpm0GW69NThyDetLDB/t4N4VzqD4hbu56s4BgTvgHnb72HBeK/TSFEobTRdgeW/asWQnFpwkogr7wHkzD3utGY9W8swhBRMPMva20cF1A8PZvCu234hhI10T360mffpXEwbtMYrp0MaxWrEp0NQ7jbaok33B/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ca7679f-c160-44c2-98ed-f1b1761255d4@citrix.com>
Date: Wed, 8 Apr 2026 18:53:58 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/3] x86: prefer shadow stack for producing call traces
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <4bcc73db-38da-446e-b277-cf94c49002a1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4bcc73db-38da-446e-b277-cf94c49002a1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4bcb27-151d-4de5-e2db-08de9597d134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fdRh96ogH9IpmQ0YoWs03SUkJ0MH2lsj7dDwJSvj1B+pdYJX8dCcFqGEn/epxGxu4PKsNwyvLsCmA9SXBiTRuOSW3QJKjIU1a7szDBFrv23LSrI16yZrcyoowxB3C6bv85VahEYn2gh3x9PKGlC+j3KGe0Gg9JXiJA4lRFK3Qcnhr2BpOGqCNuMAi9HjeE4+oHtz+Q6LQHG3qEtiHwtddjKUxE2yaM0JrshagVAtt7bontn23THRQO8W+8EkjgePTKANYb54laYkTQLA2kIw9GyJix2RZ03kE7HlHQUSZfOBk2p2flyS1sDobAXJdx1M+Hi7LEVBCfQyBW0rIl9rDfcg02zcqalVInf/DzU+KU3ZIiuL3EBZl/zSJFKIjfwAYRgohqWV6KHGFWWvq5f0dN5wei1mBkgXgsFTVZUTL2aYDgyxJJ65N0gdD0hrvGZxcaSHZzxBazsLNNhhyGKJWF1RVua40UlmI1tFtFPlGesUQwfugVvvNDHaZ4uEWv0OBvTHm3rXSmqloptsjxGkD0vsdzo345zp5pzCk+Y/Tf5/wGr29UTq5JPsxMTyGYS98yo7JdJ0R7Ch4D86B/vx975uJVDuVP4XtfSs+YAqx5ESscP3P5Lj1LRAky2uhL7tV/C5z3ZMdkh+c0x04uEWDPiO3gbBxgl2Q6mQvSrZMBW3j+fVzfWF/b+k0eMY3cFKzQ4WEjMVveRwX8itcBOoTKR0BmHIpZXFbrU+O1eLT88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDV5V3EzcERTTUdwcnJjVDV1ZEZZdHBqTkI2YW0xNGpVVzdpeC9TUFVrVHZm?=
 =?utf-8?B?NnVRMXdPRDJmTzRHa3d3L2pqSGU1cWRGbTR1SDJaNmdjcTYyMGF3ZmJtVnhz?=
 =?utf-8?B?TEdlYW9YUzNGYnNSNDl3K2J4NkxLV2FEVkR5MzBwN1RPZ056YnRBUmZQa08r?=
 =?utf-8?B?M2FuSm1vRUdyKzgvM0V0ME5xZlR4bzBYcytOMStUalhCVE9oeHpDTHdJY2pG?=
 =?utf-8?B?ZW00TWVKL3VyRWl5TjFuWnhuaGpEUUVoNGdVVzh6ZklVcW9Pa1RMdHZQS0h2?=
 =?utf-8?B?YTc0NjlSN2trQjh2aWpHbHVCN3o0Vi9BY1grVnpsNmFXU09yM2lqVEl4U1E3?=
 =?utf-8?B?bmhVMHgydTg4MFR2Z0FGQW1pNmhVUnFvKzFZeHpxL0l6UVhKMEtxY2h2bGVN?=
 =?utf-8?B?Q0NlYUJiMUlsbE4vMU10UE1kSUlsYWRscmVCY2Rxc0Z6Ti9hdXFZUUlDbEk1?=
 =?utf-8?B?MGxhVXNVRTkrZlVKNWZaeDlJTnZNdE5NbEJKenNMRTVva0xqMisxSE1DWHVU?=
 =?utf-8?B?d040SmVNcEc2R2JYSDdac0g2VldtbCtTTzJublpVZG15cFl1UUlBRXlLSFd4?=
 =?utf-8?B?dDU2ZWxSNzF4NUdyR3RIeGd6T0FxMzY4WGdhUkdTdXAxOThjV21KdkdoSXk0?=
 =?utf-8?B?M2R5aDdJbDBrK1o2b3RobHlHaWRLc0FZMXFYT2l3WGpkbWRLL1ZWdGNlTS9v?=
 =?utf-8?B?ekpoVXMvZXpES3o5MTJJY05pTUsvaWEzUVNjVVlmWitYTVZOdGsxdDVwTkNx?=
 =?utf-8?B?Njcyb2plWWNkemYyVytoVk1tWXN6OXVvRTJtSEJ0L3J6UENZS25GZXBvSzg5?=
 =?utf-8?B?aXlJc0tzM01yREN2eUVZcUp2cFhDUFExVFBQdDQ4L2tlUzNVVzRMTys5dXhl?=
 =?utf-8?B?ak1vTW9IRGJUbjlwbTVvTEhJa2hhZ3JzZjVSNTNxQUNSU1hDZVNZeWJEaEZx?=
 =?utf-8?B?MklYSTkyZW5lcjdRZFVmRGQwMytXYVpJQmVJU2xRZWFuZDNCd3FOUDVKblBE?=
 =?utf-8?B?eDh3dzhFSER3SHd5VHpRdTcvdDYzaWZ5N2REZmhvekRIRjMwZHlvL3NmaUdp?=
 =?utf-8?B?UXBXVXBoV3RCTGdWajZjQ2xtSHdqbFBlQnk3c0ZsRDBZSHkyM1kwL0t4eDFL?=
 =?utf-8?B?WVFERkpkeXM2THBQM284VXYxWHlZeW8xSDNYWkpvZGw2RTBXYktNUmJkU1BC?=
 =?utf-8?B?TTFMdFBzZlJzVGNqUTF4M3VqSm9xWVhkM3RJVzZheDdLdGpGcmhlUmRvc0pt?=
 =?utf-8?B?ejNZUjhPVDZ0ekFtLzd4cHd2NEYraXZlZ2RCWDVrM00yNkZ5RzJHUzh5VDMv?=
 =?utf-8?B?QzhJZWwrZVpSVlFjTXkyNWZNTXhadzlZZ0RvazJ0K3lJSDdTTlZLZEwzdWNP?=
 =?utf-8?B?V2pCTDlOWTF2UU5MMWtNSzdadlhkT3hlYk9LQXJpcEwwYnhjMU13VUIxMkVX?=
 =?utf-8?B?WXExek9XdnRpdzdNbm0yUHpSMUM3NHk2dEo0N1hnck9FU0p4bk1UNHBXSUdi?=
 =?utf-8?B?ZzlTRnJNelpEazQzR21lTDhsQmVOamtFTHBlOVFsT1dSWG5kS3Vod0dvc0VQ?=
 =?utf-8?B?eFBlQUEwWVNzTnErYmhLOUp1OUdxaW1rR1ZVbWNsdStzY2hUWG5PTzVEWEEv?=
 =?utf-8?B?aTNnUHRFd0IxVHdTTVZjT3g0UW9MTWdFWXU3bVV4YkpLRTdkcGpzRmNIRmdQ?=
 =?utf-8?B?TlFFc1Q4aUc2Z0liYkpOWi9xVk44c2xSb05hVmlLaGZacy9rRjRGUU1IZU45?=
 =?utf-8?B?VHcrS2lyUjVhV1hMbXNJZkxHbDl5bktXeXZDNHEwMjB4SW51aVBoYTVtaHZF?=
 =?utf-8?B?MHJ1VmtXNWtpcUpXYllQdWxPaEdWWndSdjVwdldBRzR2eC9qR0hXWi9US1dG?=
 =?utf-8?B?enZ5V2NHRVpYS055K3g1UkVVRGdsaUpCd3FkVHl4M2lmQmhaY3ZjcktEODd1?=
 =?utf-8?B?RXE3OTNzWmdTc3VhMzZsbFFnQnN5SEI5MStJbkQvZi9vajRLSVZBbXRCUElZ?=
 =?utf-8?B?VGlnY0NwUk5IbFhBSTBpd1YrUDlrSCtPYURhZXl5c1ZrWCs2amVOejN1Vkxh?=
 =?utf-8?B?aHc2L3NDRGpQNSt0dStldVBTU3VFZCtYaFVIbWJYbE9iQ0pUL2pGRDhpdFJK?=
 =?utf-8?B?ZisxVVYyR29hZXdXYUNGTGluMDBTYkc4Q2JHWkFqWVNIb0Q1MHpNMnlxOHpT?=
 =?utf-8?B?MmFtZmJ0NllUK2tSSkdGNTFkUmFCWmlheHlvazJVRWNzMkZyRDdaUmRRM2g0?=
 =?utf-8?B?WUIybTh2VGZWMXNmT1NOeHVjbE5OblZOWlRQbzdUWkVvRGwyQnRaRW9LN0dl?=
 =?utf-8?B?ejk3RE94ZndDWVVZSXpObWUzYng3VXZmYlFQUjVuSDFxZmVudVdSZE5NSkcw?=
 =?utf-8?Q?k9T236w1meGAmkNY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4bcb27-151d-4de5-e2db-08de9597d134
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:54:01.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNXsbJNhRb0I0SluYdbHEDZfJnrnwQwBf7i3JnJoTa9WjIga2y7gqyqTmIqKR8YxpkMbyDEG/OJGz+KWYnNM8JlHg6kfBpd+RIVCECSv2QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7796
X-purgate-ID: tlsNG-ebf023/1775670845-32F3E51B-4112A7F0/0/0
X-purgate-type: clean
X-purgate-size: 2096
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E2BCC3BFDFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 1:23 pm, Jan Beulich wrote:
> Shadow stacks contain little more than return addresses, and they in
> particular allow precise call traces also without FRAME_POINTER.

Do you have an example of what such a backtrace now looks like ?


> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While the 'E' for exception frames is probably okay, I'm not overly
> happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
> but we use that character already.
>
> As an alternative to suppressing output for the top level exception
> frame, adding the new code ahead of the 'R' output line (and then also
> ahead of the stack top read) could be considered.
>
> Perhaps having a printk() for the PV entry case is meaningless, for
> - no frame being pushed when entered from CPL=3 (64-bit PV),
> - no entry possible from CPL<3 (32-bit PV disabled when CET is active)?
> In which case the comment probably should just be "Bogus." and the code
> merely be "break;".

Yes, PV32 doesn't exist when CET-SS is active, and PV64 doesn't push a
frame.  regs->ssp will point to the supervisor token (IDT delivery) or
on the boundary with the regular stack (FRED).

> Quite likely a number of other uses of is_active_kernel_text() also want
> amending with in_stub().

There are very few things which can exist on a shadow stack.

1) Tokens (supervisor, restore or prev)
2) Return address
3) Old-SSP
4) Old-CS

Intel recommend not allowing code or stacks to be in the bottom 64k of
the address space to prevent type confusion between Old-CS and the other
values.  Xen matches this expectation, but it might be wise to check for
it explicitly.

Notably, we cannot ever get a value matching in_stub() (outside of
general memory corruption).

On SYSCALL/SYSENTER, SSP is set to 0, and we don't re-establish a proper
SSP until the SETSSBSY after leaving the stub.  Similarly on SYSRET, the
CLRSSBSY sets SSP to 0 too.

An NMI hitting these paths should find regs->ssp pointing at it's own
shadow stack, with an Old-SSP of 0.

~Andrew

