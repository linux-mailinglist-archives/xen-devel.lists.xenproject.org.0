Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ly0JLpIzIGoOygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:00:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B904E63853F
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:00:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jnXq8stV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326427.1591867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUm8s-0002NV-IT; Wed, 03 Jun 2026 14:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326427.1591867; Wed, 03 Jun 2026 14:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUm8s-0002L9-Fp; Wed, 03 Jun 2026 14:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1326427;
 Wed, 03 Jun 2026 14:00:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUm8r-0002Ky-1Y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:00:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUm8q-00CE4l-Cz
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:00:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a203374-bab6-0a2a0a5309dd-0a2a4506bdbc-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:00:20 +0200
Received: from [52.101.56.38]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a203372-7371-0a2a45060019-346538266dd2-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:00:19 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB7009.namprd03.prod.outlook.com (2603:10b6:303:1a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:00:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:00:15 +0000
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
 b=R/TtxUJqt6nAB9wy8pXQ7vhQQa66+UJyp3EqajF3LGrF2DOCgKZ7kfaOwmqg+Kcxl0H3dhL1YH0njcnqADQ7L6UQLRcmYUe0vHceA8reR4E5Vdarsnz/svmrMqK7umxxd+OIyBIfCIICGDjyzK8x89psHRVB3GPc3fGzV0kIUaXRimNX81uQz/AC7VpzXWbYbG/vFXzkHg4Rz1oBLHVw/xsUq8thBxpZqiCu/QNZe5gjD60YNRFtbzf9EUbw89pMfJ9Fo/NM9gfTsloWu7syhnmo2foLe5BrbHX9Wl2lU+nw7TI84I4ayjMRx8DwgIxe7LXp4hB1dTZTCC1fn421lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k62I5ao73ymlldYtGCt4PHrdalAsZ/sMJ96cXPD2vk8=;
 b=abaSLdz4fObdyq1uYYhh3K4GaHilDahLqI5oWAggmVt0NUHfLCy0Eh+yiJwMmUrKlzIclsPIUXJYNSD6W4s5sEP2SoTA5aVd4UfBWA/W8DS+Arisi/thT5Kodwil7rSgvMfTT23781fcZS6J0PDCxYpQT+B3VomuLEXDUn2c0cqzzrwhD0201DYYKnIB4T2NObRMCJAz6mnIfmI9/AWL75wYLtiu0GTWZ/2wrtQ0RPOQfTNGPSMcfvCCWpjyTNcrFLHkCmIADfAKl+q9BIH9Zb26dhdkCyczLLW+Ii/V9GLeeDrBbS7PPpbE8SfopsByO4kHJ6VhYqf8CgEYnsobNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k62I5ao73ymlldYtGCt4PHrdalAsZ/sMJ96cXPD2vk8=;
 b=jnXq8stVwg+/XnmkYzdOnqukYAqrFv+MqzH+XXYeK4oW/Iey9R3Pxenx7dmZ8WrxWgfgXKTSyJvw6sglmGS0fxTIDd0HRzxWS3+MSwp1A4pZqQl5M7YOTiCbrpUULzX7RCrZb5C3kdjb7N9tuxVFL8DMbsT5LJUTY6o6RrNuo0o=
Message-ID: <a53a9274-f52f-410a-8597-ff5a0fbeabbd@citrix.com>
Date: Wed, 3 Jun 2026 15:00:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-13-frediano.ziglio@cloud.com>
 <8e71b997-a695-41bd-bfec-fac2740db142@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8e71b997-a695-41bd-bfec-fac2740db142@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0499.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0f003b-49c3-49c3-549f-08dec1786fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BOkKEHilk4XkHwXdxGEKoQ5hD5BpsfxXxLRAlS8PqZgAzfEdHbZjX6UyZXqtC8x1M4umVRl4tS9nrvJflcDZEuQytFF+3WWMcUuuq1QNbsFHA2/OfJ/Kx/2U/uMFWVo743cWCeZtYVXKG2YUpLp0DexwiNtvJwzpnSrYFzheubJ/tbZjCO0ihSfU+NHUFoksW4IAVaS1HVe/TvUsrucsvzjXAxOwgByKFz0nujLCCn3Wcxst4+pPvFtfLwolNK2dhxTzCJdqb2Dojt1xuSOQEiPydzyPQhX+O/i6FkgU8WRmX+SzlUVyRZ8wONQOTVjsYg3oykYf/v9K2P1U4ZS1PU6WokcrQCLDEmif4hUZe22IyDYJ6OtdouOzdGsBwnCybYXpPlCLXVgl1QfaY3uXnmhOa/0XrTK/MfkA8xpduVC50WU7BquDgimCMdcJN+au9mnEBW5gNPmKSdCaL3qPA7B6qbx8NKMuc3UZCHXZVMrGGYCFhBcetOIE9SLrYXGVb7/egvzreDXAAe7g81MdxDgBWJoSoaP+UhQuBDxhZW7VKv1LaGyXdO4d4XkUPeByuPCxfjURcjcnMFcsuyT2R3i29aMvpZ1ZnJdYsgLWkaO/YECxLaAdg6ojW6v08HoPIUfNWdp8sPV/aAUd8DULCN+R8QIm3cE3CwbHS9H6+pOFdZpkJBJl3I11bgW8p1XQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmRpeEpvQ1JzV1NXZmNja1lZUVZ6dXBZemN6RTdqYkt3RW5McTJaUkM3SkZi?=
 =?utf-8?B?Y1Iwc3dxRkc5SVkxRU53d1pXMFAzejlwb1RXaXlIRmlJTC9QZDRBSE5LTDFI?=
 =?utf-8?B?c2t5Q2U1eUN0SVBkOTJSN2FidlNFZDJUdmNtQm83My83bXFYZ2p1RjNEVXg5?=
 =?utf-8?B?cThnOFdVSDlrSFVjeUdLSnB2QXRwR0xqV2UwRUVDRE9HOU5xcTRmY2R4ZFl1?=
 =?utf-8?B?T2JVL2hxWTBiMmhLR093VWQzbzAzUXQzdFpoVDZXVUNLNHRuRkVJUjF2QnBs?=
 =?utf-8?B?VGo5cFZIN3NoU1VjL1pnTk03TUJEeGhIZjVWa1hyNkI5TE4rN2czL1hZcURT?=
 =?utf-8?B?cXZBSnBJeCtGQis5TDhHMVBhNW1MYkwzNFQ0MUpQWUs1QWE0V09LeTlBeXFm?=
 =?utf-8?B?L0NpL1VWU3ZzS3hVbkZCNGxzSjdLb1pCUXVGbngzVDdrcXhiYTNZSks5cCs1?=
 =?utf-8?B?WGlXcklWbTJjVFFEcnNObitxT09STDVVWnRaVmRhdFh2TGZzUlJ3L1lIcCtU?=
 =?utf-8?B?SVB1NEJuRGJsazYxOVVEUkhCUE1jRWxiZFlYSmlqNC9VK0NRT2tzclZ0QlAv?=
 =?utf-8?B?UURCYjVuV1lYM2s3V1ZqbVBOQTR3ZkUxL0RlbWdEYWk3azZDM0RiY0VXYjE1?=
 =?utf-8?B?ZXprMVVsUVZuaVJTT1Q0UWV1V2hEd2tJNHpsOGs4SXR3UDhvRi90YmxScHZo?=
 =?utf-8?B?T01SVXVxTUROQTk5U1I0MDlTNk1HTGVIamNRZ0Mvc2NqMDNzL1pUZnBVR2xY?=
 =?utf-8?B?aWV1TlVZMWxmMUxud2gycWpKQ0pyQWg5QjRWb0o2OVkwUHBGRWl2b1BYNlln?=
 =?utf-8?B?NlNhcndnSUZra0Y1NHc3NDBZUW9lN2FBbEUrMGZsSGp1UzdXU0dpVlY3Wnd6?=
 =?utf-8?B?RUNDWVpCN3hIU040TjlwUE5tODMrSWltT0NicGZCZ2R3QTl0dmV2WklXRnlk?=
 =?utf-8?B?Qkhockx4MjNOOERQK2hveUU1ZWhaeVJnMlNWd21mRjgxVEd0ZzRIUFo3OEJS?=
 =?utf-8?B?c0JXbDFoS0N4RTNvQXlkRDNpTCtoUFZrS1VaR0VwQkRLR1l5cDV4L3ROYVlB?=
 =?utf-8?B?bUh0SnBsa3Nnb1B3QVBwV0pjY295VUc3KzRCQkpvU2c1dWV3S2ViRFNyTUNy?=
 =?utf-8?B?bDB0QVoyNHJ2cklxSzRKeEFWNFloMkZWY3h0UDhRUmlxSWN6UDl6ZlFxWUxk?=
 =?utf-8?B?NUNCM1o1R1BQTEhRNUlUVlRGMEFnSVBQMlhtSlZya1pRQWFkYXRmRCtWS1JJ?=
 =?utf-8?B?VmVpclZ6QXp6bzdUT2ZwWWFCZWdmSUVONVBURGdIUFlaWXlZVmc5TWVDMGJw?=
 =?utf-8?B?TElNL2VhYzlObWNNU3R1enNQU1Z5RWtyZ21UZ0RyUGlYL0dMWWxJMDR6MjRv?=
 =?utf-8?B?alY0Y2J2L0plTHpSNXlwODVBQkdnUERkNGZSVWdpYXFvblZ2bGtNR3BBZ3J3?=
 =?utf-8?B?QTBod2ZLaHB4L1hHMTBtSnQrWkl0b0dyU0RCYzRCcmtRTHZQcys0T2xRUGFG?=
 =?utf-8?B?YmJrdmxVM0k2UE5FQU9uS2IwT3poRVNuSzV1VEFvYjhVSHUvSm92N1dWRUJB?=
 =?utf-8?B?WUx6bW5OempjbVRObkFuRVdud2piVWRUVWt6K1R5UmFwakhDTVY4bDdjMEd1?=
 =?utf-8?B?VGRScWZlME1oMWhoN3E4T2FvWFhkc3BXZG4yYk40Y25yaVBzajJoT2hIV3M2?=
 =?utf-8?B?WnV5RytpWHU0a0ZBRERuQ01qWld1akNpOGxBSFFTdDBkRXp0WGt4L1JsYUxH?=
 =?utf-8?B?SUxhY1lXVGVYMVgrNlJXYmQxOW5RMms1bjYyTVBWenJIVCt1RWxqVEdWOUtZ?=
 =?utf-8?B?b0FBbEJ3N2FSNzFESHJHeFBhcnlaNUc3TDByQzdncEw3Rk5ObWtWbERpdGty?=
 =?utf-8?B?REozRDdZT3JaUWV0R2pxcjFrL0luRmI3YnpKOE9nZ3VTSkcwVTRYWmhSMFdn?=
 =?utf-8?B?ZTFLSHA5NVJGZ1ZOaFFVRHdnQjMvN0JzUEhSZWxNOVhTSTlBclYzaWZ5NjdF?=
 =?utf-8?B?ZTQwMTE3am9sZ0FINnlJcXNhRmdiQmJyeHJsamVQejR4ZFNtZHJnR2FNZzJ0?=
 =?utf-8?B?cHBIN3VSeHJJZDY3QUZMaVU1eEZ0NG1wWFAyZ04wU1YwcWhwWkI5aWF5VDBs?=
 =?utf-8?B?aG5vdElQOXpqSjlObjFiakc3RXcvdU1iVGtQYmx1ZEdsdlBILytyYVdIb0JG?=
 =?utf-8?B?dTE0NStkbTNEZDNvUnkvQmtYSTlrbVRNaUFEWEZqcGJ2c3ZjWStXU2NVRDJM?=
 =?utf-8?B?QjhCbXpYajdEMEpUbVhFeGRJYlFGeG1UdC9wLzE2Tkc1Rld2c1FoWUhuRkRz?=
 =?utf-8?B?TTdSbkFhL3BWNnpPejdLc1dibnNaTmo1R2N6OWx4VzlOQjcyMHoxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0f003b-49c3-49c3-549f-08dec1786fdb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:00:15.1833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzdhCcoUvVWvMV/4ixfrxIovioqTVjcopyVeTn5gPghn97hqSDfEFjikMWAYbLLwntCLxYYFvlnt+ffUlmohWt48qp28JH9disCJZ4Anq0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB7009
X-purgate-ID: tlsNG-16d1c6/1780495220-84F63D75-2A8DB060/0/0
X-purgate-type: clean
X-purgate-size: 1631
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B904E63853F

On 03/06/2026 2:39 pm, Jan Beulich wrote:
> On 03.06.2026 15:05, Frediano Ziglio wrote:
>> +    if ( rc )
>> +        return rc;
>> +
>> +    /*
>> +     * Check we are allowed to map and access these foreign pages.
>> +     */
>> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
>> +    if ( rc )
>> +        goto out;
>> +
>> +    do {
>> +        /*
>> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
>> +         * for continuation checks.
>> +         */
>> +        xen_pfn_t gfn_list[32];
>> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
>> +
>> +        rc = -EFAULT;
>> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
>> +            goto out;
>> +
>> +        for ( unsigned i = 0; i < todo; i++ )
>> +        {
>> +            struct page_info *foreign_page;
>> +            void *foreign;
>> +            p2m_type_t p2mt;
>> +
>> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
>> +
>> +            if ( unlikely(p2mt != p2m_ram_rw
>> +#ifdef CONFIG_X86
>> +                 && p2mt != p2m_ram_logdirty
>> +#endif
>> +                 ) && foreign_page )
> This is ugly formatting wise, and the use of unlikely() isn't very likely
> to have the effect you intend: As long as the compiler can't translate the
> && expression to something involving only a single conditional branch,
> which of the branches is it that is unlikely to be taken?

Irrespective of what the compiler thinks or may do, Eclair will hard
reject it because unlikely() is a macro.

~Andrew

