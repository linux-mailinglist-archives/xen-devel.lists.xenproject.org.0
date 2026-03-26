Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIDHNcAaxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:38:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0343349E9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263789.1555631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5j2O-0007Wu-HB; Thu, 26 Mar 2026 11:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263789.1555631; Thu, 26 Mar 2026 11:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5j2O-0007Tx-D1; Thu, 26 Mar 2026 11:38:08 +0000
Received: by outflank-mailman (input) for mailman id 1263789;
 Thu, 26 Mar 2026 11:38:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5j2M-0007Tr-4H
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:38:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5j2L-008VIM-GG
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:38:05 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c51a88-2eae-0a2a0a5409dd-0a2a450c900e-32
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:38:05 +0100
Received: from [40.93.196.12]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c51a9b-f93d-0a2a450c0019-285dc40c5f9a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:38:05 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7779.namprd03.prod.outlook.com (2603:10b6:408:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:38:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 11:38:02 +0000
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
 b=CQsCnN98EIQw7jnSpiAUMQANwSEHxKaZ4L00X89p9iBI6MVs6L3POgQslq5BPnXwFC7CYpIk+EC+GeQZwdZHtgiNqNwH3OiWpOhBajN6cRUBRaUtxYR79DE4xLTtgAewgG4yoqijbGzyJW9x/PfVFLohikUlJRKOIjlyUngBYc3GU9RD2a02JMJwnwR1fmrDPfoGhrymk2XMrPZXu5YmpenKzTnURcyBzvtbaAtbnC6ka5MjvjD+Fa3GQEQ1dNl7isdcOI4WwcQWVIx8Ag7QjvRzNAe23b31F1G7mvcN/Qxb8uDdxcCT2ExIbsY7+ruANLY29kzCZy93qso4VLWoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sanxqKrLqAYJ0gbEbLvkMm7LZhfwJXghu37CCGww30o=;
 b=qIb60jFNB2ostRGaHtjCTPHtIB7JT9leK6hZTztPU9Jgi/SjeImfXeOAa6GYYaqxLHvtXHpYum54jfNfDJImNKWA8btyPNqqf8hgKy5WF5ycGF8SEk6BpeSHtPGYagOJJTW1L23Ugcubz7pKzIxUYl2H1zJ6dQp4YChe/ent2IbeJ8+i97L8Kt4J+EwyWvjoFFNou3JjXwy8p1Vpn1G99NDzlYMhC8tJz16YKFPU6WC9FlnUav565U5VjUYeo7xH/xV4sxbWM5bO5UQleTHw99eSyC7kSO5Zr3z/g2HuhH/mnRYYbTKSNYpW0Ei3gy2puevgreFbwtJTTRef94ne8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sanxqKrLqAYJ0gbEbLvkMm7LZhfwJXghu37CCGww30o=;
 b=BrU/tV7GpQ15ccpdd26GLigWZPtdH6OjYh7mw5I7s4VoJh3jh/rXCFExar7Lxfkr+71k7jbBxQptFcQkdCtuhRIVqhVmYeJMhRSbm2/l6KCgxepOuFkSHU7sCkSOFIPOeoGOIb93eGVmvsJiDLLtsvP5fjCzmJbQ5a1oeDoSrK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b3b63ebb-eb4e-4de0-99c5-ecb8b8ca882f@citrix.com>
Date: Thu, 26 Mar 2026 11:37:57 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/4] xen/uart: be more careful with changes to the PCI
 command register
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260325145824.31601-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: d07d3a4e-9bab-48f7-a162-08de8b2c2331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1jADih+/K+W6heNHtHI0LRgVwMSI6lyyEl/fPN+pJC6KeFzvDo0S+JH9lBpDbPBa7hUyq8dFOTNivuAq0mIbwPLL9M6ez634IzmbDjeporXeL4CxPqh7MJXJbRYCBwZU6DdFFKq+Lda4YJZVXXTE1pnnBoDEcHxloUA7+uPFMOuWDeNHli9mutIQf4PkXr7OWwlR1nHvoCIuSJ1RZGMM9Qbgi0IT2hDADf79j1i/5Vlum8BHhkA5HyPo2HTm/4U5eesCg6fB2CWDCAB7FFvISA1XQ8tcsq9LgrHqA3sbUSrllwZHDI+deAlbbq2li39ArWCSjY7plIOsU/hzF2doREdMEaVicRFrWesv0fwavMKsY2MQUtO7MRzpIIbBUnRzcwHjRIOby1xn4lJ84F5/Ts83o8+T+yZnSyzf1L9jMC105S80+oheETSnwuekPtD3vUBTC+dsVfT62tBRFA8xo2uROos0N7ZMxH2tsx8RFelwi8XZ6KCY8rPKo7xDjDqPyQTKfNISjCJTIzN/iDhon6jdeFKuNd5YoeTZSqny2n6tHva8UzzdKLWp+xp57bvPHPMswTrjqN16tiySmYUJmRb2XPPcNAk4IoWA2N1MpWSBpGCZRnLpKLPj/TD+gbnM6iYzBcvrHhn3Gvr/zalDwau504pQARYA6gdfH7+pGD7XYzykKYnNUAQZtWaHQ5z/wq5kBxJpKDWtn4WAFdPyy+7EjW5/4pF6HZVerxiq0Uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBERnVaNFo3NUVrU25wWjJmK29BZ0YwZ2RaeVZlckxHNUR0SndPYXBJRzMx?=
 =?utf-8?B?VHB6ekNnQTlwS0NLMWw3Rnp5akg4cTMrWnBRckNVSXNjWkpDM21HY1lIS2JK?=
 =?utf-8?B?ZjV3OHlTdmQ5Y0x5clViaVZlYUlEOFFyR0Nzd3dTaHN4OHA2ancxT1M4SXp4?=
 =?utf-8?B?cDRkSlB5RGZHR0htMm1WOTJ0MU1udi9lRms5RDNPaUF0SThhTSsyOExKNFI5?=
 =?utf-8?B?T3p4MGw5MVd2dUYybW9uQ1J2RjBoY0lMOWlvL3p5Z0FjNXhSTG9iSmUyek15?=
 =?utf-8?B?a2cwaHJhVnZoYU1hdUxyYityTXAvSVJaTnJVNUJUOGxQcjh6eTFFbU83R3JU?=
 =?utf-8?B?b1NGTXJvZHVSalkyb3M4c05CM3d5eUlod2FtMWRzV2p4QWRhVG94a1d5T2xo?=
 =?utf-8?B?dmtmc3NrQ2I5YTB5amxHQlBBYnNFVko0SHIxZ2FXU1RaZG5JY3BMOGc0Q3dv?=
 =?utf-8?B?VTlSYktQZkFFL3ZRN1lVYklPNFhzUy9jNFZpK2REeU9OZGtDTzFNVldmZWZl?=
 =?utf-8?B?NDdLUVl0UUxKVEdmeDdkczFXWlErNVd3WlE5b3BiVVZGZUovY094WGo0VlJO?=
 =?utf-8?B?bG9IVjFScnNvRnNBdk1yS2s0ZzBibXMrWlpzL0xVdXRCMFBTeTUyK3c2SmxW?=
 =?utf-8?B?dXc5WFFlNk9IekEvUzY5WTlrcGhueFo0RTdnakNudmNhR1h6UUNNVWhnbjNz?=
 =?utf-8?B?a3RnUW1RUHNkcnZacFY2UmxEN1MyOTNFdTlzRS83ellIZUpaV2pxQ1VxMmli?=
 =?utf-8?B?SzBVVVlKUXlXWkJhblRCbFdnYjZsV1dhSWNPeWVHaUJBaC9tbW03eml6WUJx?=
 =?utf-8?B?UkdySGs2QkxST0M0UUJyWnJkVStTeUdJUW1rVmFlL1JpRi9xQlVKd2ZJMmor?=
 =?utf-8?B?NkZ6eGk1VDAzemkvTDNVbnF1aW45ZXoxSTV5eEJXUTlSTmUwenBrSWJXWnZD?=
 =?utf-8?B?czd0aCtoTklSdmR2K1FHU3czR1M5N01uOGF6ZnpGQkFRbmwxZFd3MGgvaEts?=
 =?utf-8?B?ZW43WkFLR0JZZE9YeFlmaUFrV3prNWJPSmtXakRiSzJyRG5ObU9YM1RaTHhq?=
 =?utf-8?B?RDJiTmtId1BsRExzdEJwc1pYUVlNN2FPWnBvSFZScHFId1hUZE45RWpyQ2hR?=
 =?utf-8?B?bFZsYWZXdnhIaVJuS1U0STMzeGJQdE5sVjA0VUx1UEk4YU9lVEZFMGFMM3Z6?=
 =?utf-8?B?cG5ramFDd3dNN0VjcHBjektxbjNsejZ5Zm40ai8rQkV0Z0hlbDNHcmZ3NXhD?=
 =?utf-8?B?YnF4dTJleUpKdlg3b2hyNXNWMkZidFhQdjZ2bmRheHV3Q3pDOEFUV2hxTklQ?=
 =?utf-8?B?V0RaL1FtR3pCNUFjWlR3MVRBbHhUbmN2UUhGd0xHNFZsSDN6QzhYNEU3aEQr?=
 =?utf-8?B?Tk16VmViOG1TcUkycE1CNktsNkpVTFJ1cHBVVDZhRVhNOEE4QW5ySVhla1RH?=
 =?utf-8?B?cWlUdkFpekcvYmNpNDVUUmdIdHcvaU5XUFRVbXdMWW1rL0k5R0ZLb3F1QU9G?=
 =?utf-8?B?K1FwbEU3elROMTJGOG0zRHNyTHRBTjRESmZFYUxXcVpYRTkyaFF1NmpuNmpt?=
 =?utf-8?B?cDVpYXRNUUU1NFJERHRaUlpJQUZ3V2xkdCtzcitteG4rU2h4OGVTZElsUVMw?=
 =?utf-8?B?bGM5a2ViUmE0enptR2lubS9FOG13eWRSbzlKMDIvTU5LMURUN2ZzUFpCOFZN?=
 =?utf-8?B?QXAxK0tOVFVweUZrb1I0bHRPcXBhMFdpZHZsSnlDOC9IVTZyUDFKdzBKNVNO?=
 =?utf-8?B?Rkt5UFFNdUlDWkl5TEFKL3lTVkQwQ3A5aHdPSG56bEI1eUFYVkc3czhyaVRx?=
 =?utf-8?B?Q05UdUpyYU5kVjkwYmQvSC81MGdObTcxSHB3b09NZDIwbllGdlR2QmFQWjNP?=
 =?utf-8?B?a0lZZDBKVlYrNmYxeVhKR2tTU3RZQmtMZXA0MTNPRTNMMVdPZXdiNkNzaFFM?=
 =?utf-8?B?QXM2NC9xRjNJQUs2WEs0VW0rVTdwTGNNUVJ2SGZoakdpbytENlFtbVNtUEYz?=
 =?utf-8?B?T09XWkRTTk5ldDN2WlFieEZ4N1VmQ011OFlrYTJZY0xNNnpwOTRBVWZ0Z2Zw?=
 =?utf-8?B?dk1BRlAxdktCTnZyek1XUlF0cjFVY0g0SU5RL201TmZicDUvNzUzQXk4OGFk?=
 =?utf-8?B?ZWEzSDhPdnZUYTdrNk9JS3hUVFVyT0s1RTJrYXd3QzdyYno2WEFJbk5CRG9I?=
 =?utf-8?B?ZzVVT1F3L21BdlFDNkZrR2hOQkRiTDkxMGlwWXhCcnpGTGU3bEFyMFppSllh?=
 =?utf-8?B?aEI4cmJVTnNCREZkaUQvVVNnWFNWb1ZNSjNtN000T2xBLzdKa1BQd2RMdS9Y?=
 =?utf-8?B?NkkxM1VOTDFFeGtDUmJPUllMSFJwL0NBYVBHeWtwelVTM2Jzc1N1RjdJL0h5?=
 =?utf-8?Q?vEim7Xss01FyAVe8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07d3a4e-9bab-48f7-a162-08de8b2c2331
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:38:02.0372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmsSUa06dxQigveNWeKK7F7sCjmf998xNfmd2+Oelag76DrU5LK76pvJwwaFnO0W1jHq9ysY+Sw2RQ+hszekwOdGpHtOuB5iWWzKhhaolgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7779
X-purgate-ID: tlsNG-d25034/1774525085-FC82D734-0F9297DB/0/0
X-purgate-type: clean
X-purgate-size: 770
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4F0343349E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
> Read the existing PCI command register and only add the required bits to
> it, as to avoid clearing bits that might be possibly set by the firmware
> already.
>
> This fixes serial output when booting with `com1=device=amt` on a system
> using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
> Device ID 0x51e3).  That device has both IO and memory decoding enabled by
> the firmware, and disabling memory decoding causes the serial to stop
> working (even when the serial register BAR is in the IO space).
>
> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

