Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAYDO9U6ymnD6gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 10:56:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B8357987
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 10:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267333.1556854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w78PY-0002vu-VJ; Mon, 30 Mar 2026 08:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267333.1556854; Mon, 30 Mar 2026 08:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w78PY-0002s7-RN; Mon, 30 Mar 2026 08:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1267333;
 Mon, 30 Mar 2026 08:55:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w78PX-0002rZ-82
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 08:55:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w78PW-00DWdV-EP
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 10:55:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ca3a93-bab6-0a2a0a5309dd-0a2a4503a7d2-10
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 10:55:50 +0200
Received: from [40.107.201.38]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ca3a94-1947-0a2a45030019-286bc926c4d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 10:55:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 08:55:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 08:55:47 +0000
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
 b=msopv0qdPJjXrBKToM/neH28ymxDscT9YZW4+q3fyzZH/ty+3rZAUM/DqjuW/4re4+jVTf/7Dq8xGWuH6/P8wA+T5ZLSB9wcB1//h73M4gPV5MpQb8ZQRvR6qKRUJjo3WuQXUB3O09DtZE4X9n7SN0GC/ScTb6DHsoWYwURYRs//6ekvcMj4AW0NhMT9qS8KrRY5YZNcBshnpkvCEJWbwOz5HtwaJgG8yHWgYXGkxruhKoTf6/spOuum+/UJzl96WTuq5LaIaxAotrS828ZzIb/ox9YZ3G/VN0SGov5POMKRe7fxGMl3F7w0nqsjOj/CxQ1MEhuOjVdBajMJa949gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nTwyqSj+xjYcrFYb6izSYsz2D2CD87r2ZLpDVT2Jfo=;
 b=wX7xKQllVTBU8Gyfb42Fn58IuTT+vS7i1FAFXJ1j6KMjIr2aoqDCigZEAxaWN4LCazjM6Km+l08hvYDRWcD1a/aCsL0jPpBvkWpEE3S8gxtsExc/S+a/fSVi2ShlJK0lRx1dZrgX1Vj7s/WVmnXgLQYegF/FOoaccIcOtGsODX9j0b1o+3zDqV7srWIFl/J0WUe6blzpmvzUgG6naTVWYLwwc7TC7NLK6qG2IubghFz1W585+vwtJJ/+WO91kjnq7LoxUJa6v5XxEGUuZWI14S4ykrCTCc+GXVTqIIY2lexiWD3B83ZoFTwwPqQ3H8TVWzJ7QZk7IDNvEjhrrClKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nTwyqSj+xjYcrFYb6izSYsz2D2CD87r2ZLpDVT2Jfo=;
 b=E41vv+uPXMo7Csk/txhGvK5YqPBBZ2mZpXNhLiOiO+TAzv3xKeNrVtVMEORNSA6JxqFh4s51q8LMUUfwcSdgY4ek1rQf0pzlpIZkF0+6X36PVdlVPyzfTNZZW3PNshW1oeGdo1nbbjjwh3lqkOPh+j6LvjaMfl/+HvkzLq4RSW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <20f9a41f-2a81-4ea5-acd6-85313a30db9a@citrix.com>
Date: Mon, 30 Mar 2026 09:55:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Configuration for Linear Address Space
 Separation
To: Jan Beulich <jbeulich@suse.com>
References: <20260326131815.1139203-1-andrew.cooper3@citrix.com>
 <7ecad1d7-75ff-4bb7-89c1-7f51398b156c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7ecad1d7-75ff-4bb7-89c1-7f51398b156c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6ab3c9-ac6b-408c-a0ae-08de8e3a2276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ml1VL3teoMxawg1w5hmI7HePQTiLnKPiVFHAYh0o1J8XUrWTeIAZvLXTEM9IlVFhXa3dHwvB4GQd9AqFEYrMAWKu8699PcT4AVDRf0hnP0KfuhbZnOTgD0v6BhAreSQv/NaXbfa4L0lgmNaUOPJ3u7jTzRDWu+Qk9MWyVJPgDdk9Bru734c42sPWWOu9+0rkVxU9xqV8ZBQYk9DceLBOsei0wKdPaaZUDY45DekT21mGKsJas3j3K+geqLFBbH/MH67Nd6VsTlBWshIRChHdXDokHMagfua2hrMIrMYsvTag1eQTY73paDyyWCQRwQ21UEPvaI1kkPXKg5LekyN/UrY4pWuN7jOE425aNbPmV7++a6X+dvOSxaqgingbNBjnPhakiZQh6L21O4oyb8H3uRIvKZXDVNELCHLA0eBs0DYYaMEjOrEn96xe2EmuFaTbJY6n327sPA3xZMMkfxmXeBo2QwRTR5bBTABTlSjxKaIGPXq4SehzOe2vrWAsfKPCZWl7yN4Ypy13iPWeciXWUBcmtRqoU9RhEHlKwRTzv3b7/7yN2YK6h14/MzNn3V0KByxFK72OzoPLxBJYp412Hju+FQ/u9T/XdNgno4cV2qy+P8tQVhRiyyE7968AG2jHX57N2K3HQzcEZwjL08U3qES/Ve9auB8zU+TslltIASe8b6ap5Mpq7m4CfXD26/MjgnsG5nSE4B4Cu2i9aJfCgPOGS32Triyg2TBH9BCtbk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUxXc25hNWU3ZHIwcmFEa0RvSDdJd1czOFEyYlVBK1M3OFFtNW50WUYwR1hm?=
 =?utf-8?B?T3Z1UUhaaGZvaFdkVVN6MTB1TDVCMUMycVFkK2QxNEVDRUZZdjJLa3hVWDB2?=
 =?utf-8?B?aFV5dkhzYWVUNUJ0bmMwM09LOUYxOE42a1p3TTlCREVRZGRIcXkvSlVRRlhK?=
 =?utf-8?B?U0JNUEJadk5FVVg4UDlUeWpHUGU5ZndmdDM3YjRyVmJiTytuUXBiSWhNS21i?=
 =?utf-8?B?M0tjRjRtQUF0UHoxM2pBZ2xzNE95a1cwVmw1WWFLcHNZbnhKUi93SnJQdkpz?=
 =?utf-8?B?NGQzd0ZmQUdzMU51NHVzUWQ2QkVKeHlzRTYzbTlFWmdjV2MzRkJiRVNWaEY3?=
 =?utf-8?B?bCtYZTdSREIvZ3luSXZ2eHFOL2Z0emljVys3QTBscnFKZndFSnAzTy80Q2JN?=
 =?utf-8?B?WkhHYUVZOEpjU1I3UGFCNVJVeDhDNmk3c3ExdTdYc1V2VWN5Q2pjQUxuSzAz?=
 =?utf-8?B?VUJ4NTYycmJBU0NoWVhmclcxNHBUaHd6aTFCRW1sbTBGVlBvMEFrUFEvTVln?=
 =?utf-8?B?MityM0NLb1JyeDlzUnlrTkNub21yazAvc2l6YzZzRlRralQ2UVVTSjJjOXZq?=
 =?utf-8?B?WFZEUVgvYi8xTUR6Z0M5ZExGQlkvRVdpbEVqNlQrY0x4L3d3WldQSlM3Y0dR?=
 =?utf-8?B?ZWRJZTF4cVd0bFNGWjVQMEZTTWtQZ1YreUhyS1ZzOFdNNUM0UldFUnAzUnhI?=
 =?utf-8?B?RlBvblhJeFRQbitSakJyek96YmRTWW9sWm1XRlcyY2xYTzdHdlFqQUdwWXpq?=
 =?utf-8?B?d2lpWElEanRTbW5idkwwd2xPU1FXdzB2bHRzRS9na21XR1E2aHhIYjVSWXZM?=
 =?utf-8?B?dnNzblZSZmg4OEZZRU1HWS9ia01JUmUwT0w2YTBZL1l1R3ZpaXFMYVc1NDQr?=
 =?utf-8?B?eGpiaXo1L2tTRkNDRHFSamxvZzdBdjRBWUxTRlFSVk91MmFlNVdRekcvSHVO?=
 =?utf-8?B?N3JGZXFUM1R5eGYzNk1xQ3JWbUJwV2ltNTJrWmtHcis4RmtJVjZNTXg3b1Jt?=
 =?utf-8?B?a2hnUE1JcWQ0WkVDR1lqdW1UZ1ozUVpJb2QrUTNSZ000bG9SQ1ViVWF0VnVU?=
 =?utf-8?B?WVBBZW5oYTdsQ2FEUENrVXIrSTBmR2I3TjAzK1piOFlVYmZTLy9oVkZVamlU?=
 =?utf-8?B?SDJOSHZOU0Ercy83bzJwaXF4ZGI1V3k1ZjdSLzE0RjllUzlHakw0ZzY3TjlK?=
 =?utf-8?B?SjBYM09nVlhRNzNRWFFpTzgxcHNBeGlHYUd0UnVJa3dNMGw1N0ZRVVBvM043?=
 =?utf-8?B?NXdUQ2dWR0w3OWFtY2lTaDVLQXVFNEQ4UzlabjIxOVBSRmVBSWNDTlVscEhZ?=
 =?utf-8?B?QitVWlFoUmd6aDdUUGdMV0E5UmRnQnJGeEtSUDZSZ1poTStiK2VGY1FrZkJP?=
 =?utf-8?B?U2MwZTRINnVlODdiTDBDTDk4NUJGblRoUUxxSUxQQThCV0xFaTVsL0tiOTJr?=
 =?utf-8?B?R3FqS1FNcm9aZVAwTjJmVzFsVVQzWERwQi9EbXJDelRBUTZUaDllOEdnV3JQ?=
 =?utf-8?B?ejZaUEpCTGZtcTlSYlIwUTBUVG1WTGF6TXExSm9qZlJTZmtoZlNiek9iUHZy?=
 =?utf-8?B?WEVmTnFObWdFQXJtYVN2dHYxRDE4WTk5WmZPVHEvVy9BRnVKWGJESzZEWmVp?=
 =?utf-8?B?WFpLQmthSFJtQ3Jpb3pCSWVOOG5ucGpwdmtRMnl5RDFTK1J1SWx6WnFYaXA0?=
 =?utf-8?B?L3F1OG1NaGFJUFJ6RElNTjh4QUZybVV5Y0FsNHlYclFwUFFIeWxxRVk5WWx4?=
 =?utf-8?B?b3pjdzhwMGN4Q3VVK1lCNWNBV1B0Uk03UDh4c0Z5QlZRbmsrTUdwNTVSTm54?=
 =?utf-8?B?ek1CY2ZUV1liS1QrT3dZMytnNXAwdFowS1dRc2lyRjBYN0djSGM2YnE1eHZ1?=
 =?utf-8?B?ekRyV25SUGVUMks5cXdEWnc3TmdIWFpnWEZaaGI4dThwS0hNTnYxM1UxOFQ3?=
 =?utf-8?B?UmJNNFlScllLeEMva3p2UU9qZ0pUUTZOQnRJVVdtUjU2MEJ3d3E3WGZ4Q29v?=
 =?utf-8?B?NlVpWm5TUCtRczBTY0VsYXdXMmVEbnM2UzBYZDNOamtUTGZ3QzdxRkxVeS83?=
 =?utf-8?B?VzJwY3dERHhsZXJnSENhZ1FscEY3bW5kS2t4MU5aM0drcWNQb2JNUmh6QkRx?=
 =?utf-8?B?Ny9Ick1uRUJCNENvdU1HVkpnTFkvTG1qMmRJdUlFTTF0c05OR3FwT0VRenhO?=
 =?utf-8?B?aXJ4NjgwTlE5ZWhpY0ZkY2tsajNKRHpPZC9yOUVUdlpsVjlrRVFCNkVscXhW?=
 =?utf-8?B?WklYUHBwNnBEdG9Pc2g4Z0czS3ZYUGhlSGVYNkU1NHY4c2h4UXROSDhPN2ZX?=
 =?utf-8?B?SS9vOGRERTdJclJSN3RLNnplNVIxTWxXUC94cVlTNnlYYkhQTCtFQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ab3c9-ac6b-408c-a0ae-08de8e3a2276
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:55:47.2009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJhwOKXrpZh/i8Hww7dEu+JsC4y0F4OZoryH4BoLKytsdQ0w+rhTkOMkDYQ8Bw8sliIow+5k/x6U8PZARlYi0Wy4r/BI5iB4ADmECbvERJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721
X-purgate-ID: tlsNG-33051d/1774860950-76E8572C-9BE84566/0/0
X-purgate-type: clean
X-purgate-size: 1256
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4D1B8357987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 8:52 am, Jan Beulich wrote:
> On 26.03.2026 14:18, Andrew Cooper wrote:
>> LASS is a feature designed in the aftermath of Meltdown, which codifies the
>> user/kernel split in address space in order to block entire classes of
>> sidechanels.  Specifically, it allows the CPU to terminate any memory access
>> into the wrong half of the address space based on linear address alone and
>> without needing a pagewalk.
>>
>> It is available in CPUs starting with Intel Sapphire Rapids (2023).
>>
>> For now, allow LASS to be opted in to, but leave it off by default.  Some work
>> in the emulator is going to be needed to enable it by default.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, although SPR should have been SRF.  I'll fix up on commit.

>
>> Abdel is going to look into the emulator side of things, which is going to be
>> easier with this patch already in place.  I intend to get it fully supported
>> for 4.22.
> It indeed as "as simple as this" if you leave out the emulator part.

Yeah, quite possibly the easiest feature I've encountered.  It's a shame
we need so much plumbing change in the emulator to complete it.

~Andrew

