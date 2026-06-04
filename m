Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c5P/OnuQIWrvIwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:49:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589DD6410D0
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:49:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=WWpKr3EA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327984.1592644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Nc-0006cy-Fd; Thu, 04 Jun 2026 14:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327984.1592644; Thu, 04 Jun 2026 14:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Nc-0006bE-Ci; Thu, 04 Jun 2026 14:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1327984;
 Thu, 04 Jun 2026 14:49:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wV9Na-0006b8-TK
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:49:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9Na-00AImT-A8
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 16:49:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a219062-5cb7-0a2a0a5109dd-0a2a450994e2-0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:49:06 +0200
Received: from [40.107.208.2]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a219060-2497-0a2a45090019-286bd002c3ed-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:49:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA5PR03MB989652.namprd03.prod.outlook.com (2603:10b6:208:607::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 14:49:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 14:49:01 +0000
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
 b=XJQqXFTjfDUHBrZrtaUl9kAW77PsBf8u9VipYVu2LjZJegiaCHIAvdp5CbDNAyamgnqjZH7kqRRxlGx+Nonq8CdlqHDLNZ4uvSpdYlQgnmJbFJ/EP45HaD3AjEnY3Ch+HeGueiOWdBYyr/g+bDJo4WTKzmhZEieDDUWw0O9CBZDG1OblUjbUFbEZwT/FdPWHjVaRGsNAh/CWhPKU7pRnpMI0jWc+LjDnikOxXKe+RQsB94GDTAR5HgJ2CrC09zHoI5g6/vuR/eW66Knn+Oc1LedCFx3eYajmciNNzzssX6ROzDxWAkHm5/oRudSpeNL6tuxjgXtd2yIV1k2pY8MXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75F+wvI3uleLS476YuQiRyedW4gR9Iw/GsiZex6jug8=;
 b=TnsHz22YuNbzZXbBvQHKVSLxH8nfAa8NtjfE2aoSb1nK5CUd1OC1z5Gv6V+FSxYilAfeFuJh/d2DfAM+0tLe4hZai8OVEDUzR2wKj369+0ZVp5LpwwzUexhCmsHCBLmnrUBPRlHzLNBVRi+W739WU152HEeVeKeKDwk9OxGpTqVyYVEjQ0ndNZA7u828FX5y9p2gx6m0wA3+wy+9zJ+znupO0QocSE1kBwCQH7lbX8i8F1DZHfZz+2eiVekLrIciFAxK4GA/9RN7k0NnLH+NZ7jVh5TJi09Dfva2SjEMSOme/a07gKV8PgOj8CsTVjUH6RVcbkfbk0d7PSV5B/LwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75F+wvI3uleLS476YuQiRyedW4gR9Iw/GsiZex6jug8=;
 b=WWpKr3EAQNommz82htEb+BIhTUXHhlp3MbyKrw/HjnH4uo6kRyAuX2U8HaBY91EZp2gLDTXoT3t52wpXVcFQWTlW3jxhc4jvzdK+/KO4QdTwcpQQXcWuybCjaa4gL8AoxWzgYDu97IGqTOm34nMv8gU3dF1nc3eScQq2n0ruXA8=
Message-ID: <86898787-9b59-4976-ad8b-5dbe681e34d3@citrix.com>
Date: Thu, 4 Jun 2026 15:48:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/6] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-6-frediano.ziglio@cloud.com>
 <ddf972f5-fab2-4833-99a7-d008f4d2c7e4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ddf972f5-fab2-4833-99a7-d008f4d2c7e4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0300.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA5PR03MB989652:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fb7228-3ad4-4545-1fde-08dec2486a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|6133799003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ulAmnKWzcM0G+IJ3/a/fb/UbZ1nLmKQbcL6iPYh6n9rgKR2ZtDnWRg9+11YAGM/Y5EYbQF9wWM6by0xMnXLwi26o151BZ2v8v6BJcfUjJYuDklkczsXSl5Tw6quQJFiUgrE7CXD4W5jd31km0ySulPwK5WwhpeVEytE6sQeQP6nkCA36ilzh3S6nlZr0VWEHcB+PX27pfGnDonzKfmZoSpVj1qKttkPN+v/pDQAei8fNbOkxADzX48gjZJWxJF+5D6iZOTjdSMFd2G5fbD1BB7OWCBiBYb+JnTThwHKuuaquWwcx1EsQKQj9L1dMA9ZUNesxk2V01h7mEzzZhPGdemzLAB3rHTTYB7pVzVxdchrHcSMGBd/jpgxtby7ujTb4m97P0AFQbFdEZDLyC7MTb0R/1t48WPzVf275qC1hqHhsmPLeag5/vkyjSuk0WorRWRzNJzjIX6yuZ4ttcibKXVce8jM6ktkN7nPbD7lfQVZciwUQO0MNWOAz3ZgjlsnCUF6loeEj2kAZzf/er5UUZqexCbkpO1wxFUNHMSG+NwfcCgmpVY+qpJgi4Z7gInLIR3RIOVy2a0yd95SPdHW33NZ2jzEEwOXHvE5sXN4iT3six77msgzBgZgQd0NSyPC2a1cxuxTaJ1q7hqcM9yJ6zoK07iR4m40CDeMeA/uyFr9oOsQsqlD29FZATGQg7YQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVYyNjNNVVdVMWY3ckFzcW90K1pZRkNOOWliSTQvMGZsbU55WWZqMVNOQUVR?=
 =?utf-8?B?TkNiYVZHUlY2cGRyTG96WUxIS1h4bThnMjNzbVZsNFhuNXgzUVZwbjBrMVNM?=
 =?utf-8?B?S2VnSHhORnkrSmh1TDlZS29KLzVIQWFjaUNsUGxxak5zWmlxWm5VTUhMdHoz?=
 =?utf-8?B?MkNaMTlDTzZvZk15WUZMd1JtTEVRYXBpcE9MTVYzcUpKd3NlNmNlam1ZM0xj?=
 =?utf-8?B?RndQUThsTFUxRkVIaDZDeGdaZ1BvQXAyeGt4ZXFTY1dFSGlwL3FPQTgxT1ZM?=
 =?utf-8?B?UWxqUUFBdmhsT1lZZmVXUFl3SUNZN0N1ZlVuMEd0NWtPZ2VZaVJOVEVrNmhx?=
 =?utf-8?B?NjhrbWFYM1RqRGEyYkhCK08wKzlBQnhwalhnemVhdU9SQjk2TDVRTXlZTmZx?=
 =?utf-8?B?SlRIc2pnUGJVNG11dU9iMGVWWnBYeEsrUkFOb2plS2dPM29IdFd0dHZKRUZj?=
 =?utf-8?B?Y0wwZkVFajZVaXNGRDV6THdjbjJhRWIvQm5hNjhTTHhtdWFFRm9FMHNlZFVz?=
 =?utf-8?B?QnY2b0JxV3NuaWVOTEZoRzZTd2NXQnNIZGRuZmVUcHc4Q0ZuZWFFcWQreWNp?=
 =?utf-8?B?emlxT1NmSnJvMm1WWXlLRTJqK0ZSSzJNUjJsblVUMmgrSVp4K3RFTU5QTmpy?=
 =?utf-8?B?L1JVaFgxYnloL09WZExuQ1ZUM3VGcjVzY1Zqbkk0cWtvYlpNTUwvY1UxS2pl?=
 =?utf-8?B?c3RDQ2VIcFBNdFkzR2JIYTR5emd1Q3V0WktMZ0VTKzNiYWZSUzFpVkY1OExD?=
 =?utf-8?B?YUR0R0FFWEIrYlkyWkg4QWc3bHdQWGo0ZXhhQkVPeW02UmFvK2xpbEljVW90?=
 =?utf-8?B?cWVkMkE3cUkxSEZhVkJQUVlnWWNaSHFPQWF5dGgyQXd4SmZ2OHRoaXc1dEF3?=
 =?utf-8?B?L3I4ZmFTNC8wLzhHZU1JcVhVeERaUFRteUNNbGZGQjhqMFdRdythc0pXUGFm?=
 =?utf-8?B?a0RQZEZQcjZiSlZkRm13SWFlNDNHSE53cmE3WGVZbFZTV0tQYUorb1JKdHZi?=
 =?utf-8?B?Q0RTZE4wNVZzdE5aTUJITlcvUmxGRkhWZHVjblFrZVMranpSd3BoR2NpcEN6?=
 =?utf-8?B?elo0T0YvWUorMVpmdmNzdm1iTkxYc241VlJwYU1IN3JmdFFTMFB6am1obklw?=
 =?utf-8?B?R1JCVTFIaTF4akxPUEdQS3JaUkRLWi9ZcEZVMW50cFBlYWRmbUlPa28rd1JX?=
 =?utf-8?B?bEpxYjkwWVF3dFdhbjN2NnpzdnJPWk1qWVNGaExIS0poOGpMd3JxUXo0QUJK?=
 =?utf-8?B?bW0wbXFvY0U2SXNQQWVCUzVLekpudVJmdVpVQWs0cmFWeU8zdjVIUmtPenJs?=
 =?utf-8?B?SWJDVDQvQVQ1Yk1Vb2ZtY2s4L1phK2hNTFpsQnEzSitiSmdwSnNGTk1DRkMv?=
 =?utf-8?B?RHpCT3hyMVdJTWFvTWp4RU8xVk15d3c1c3RUWU5YZis1SEdZNVhEbS8zNmF2?=
 =?utf-8?B?OWxjMlNvWXVpRklJd2RFSDdoVXRBem9LMEN1a2FtTjlVMW9BcFF2NzhkeVh3?=
 =?utf-8?B?czJscVdjSkpLeXZCK2Rzdy94Y1I1dlFVS1ZtMjlvUFVXb3JTTGJNbnY2OHg2?=
 =?utf-8?B?Mjd2YW9MUGtEaXVDMSs2ZCttdFp3dGhwemxFRjVRSTVrdXRBQklSZDBIT0ZF?=
 =?utf-8?B?YWFTemxqNkN0NFNkR2NXcFg3L3Voc1E3bkxFMEFrWXdUYzhCZnZzMUdNVTBU?=
 =?utf-8?B?d2FEQmZLV2k3MXRJVVdLY3EwanBlOGdGVWphYk8zQmRZb3d0OG1GV1ArNUE2?=
 =?utf-8?B?NEpqRk9rOW1veVRBc1J5enJwNnFkd2lweS95TjB3S1BFTUF2M2hQc053SENU?=
 =?utf-8?B?UzdEb3ZINGIwcTZiVU40OXVlVlBXQzVDSGladDZJL2wyUEYwMjc0MTB5WWh1?=
 =?utf-8?B?MW5VUm1GYmtNUzlUZTQ3cExuc1Y3ZFZVcFczMjJRMHF6R3VxWXpBVWdrWmQ3?=
 =?utf-8?B?OW1ma01Bd1d1QnJMNG1aVTg0RFZ4M0doV3o3TDdkZHZQOVNPLzN2a0I4Wkp5?=
 =?utf-8?B?dnVRTnhNU2gvMmhGRzFGeWI4a3JXbU1TajhzS2V2amhUTXhLUHI3NG5mcDFM?=
 =?utf-8?B?a3pHaUlZenRYUThnUGtWaXozY29CUFdNUG5NVU9jK2hmUDZSVnIyT0MvVGtn?=
 =?utf-8?B?VTFFTHYzbytPWFY0dlBGR0pVMFB1WkNmbUZYd25qK0YrbTA2YklDMFBhakI5?=
 =?utf-8?B?ejNueW1IVlpSVjJmV1F6ekpOSHNPeGZUTTJIV25hM2M0NklxTDMvNVRGamU1?=
 =?utf-8?B?TzF3b3ZxemdCRmtXTDRFWEM1ODZFYXhQWFZFUjRlV0ZETjlYdVdpc1drUWRE?=
 =?utf-8?B?UTBjS21pd2JFbzV1SE1VTTZ0TGd2aU9CN2Z3WkJHNzNhRGY2eVM3eWpIakIv?=
 =?utf-8?Q?WDRw+/zTv889y2xA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fb7228-3ad4-4545-1fde-08dec2486a5c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 14:49:01.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwB/hSnv8D9gSYWjr/wdBhndsPerJuDdU6bvOqYvgDZj78HDg+3ubL0vLCHLgo9FTCnPIPi8Pm9O6d5+4v5CJTQCk8exenxYo1OQmHqq3J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989652
X-purgate-ID: tlsNG-bad1c0/1780584545-40B60A53-8E833C09/0/0
X-purgate-type: clean
X-purgate-size: 833
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 589DD6410D0

On 02/06/2026 1:23 pm, Jan Beulich wrote:
> On 29.05.2026 17:35, Frediano Ziglio wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Instead of using the absolute __start_xen address, calculate it as an
>> offset from the current instruction pointer.  The relocation would be
>> problematic if the loader has acknowledged the Xen image section
>> attributes, and mapped .init.text with just read and execute permissions.
> How can the loader respect what .init.text wants when it sees only .init,
> prior to the subsequent patch? Was the series meant to be ordered
> differently?

No.  Xen explodes if you split .init and this relocation is present.

It's the part where Xen undoes the relocation that the UEFI loader did.

Removing this relocation is necessary to make it safe to split .init.

~Andrew

