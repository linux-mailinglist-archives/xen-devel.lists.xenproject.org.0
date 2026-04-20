Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM0QIH/c5WnNogEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:57:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC57427EE1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285462.1566490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjVc-00021n-Bp; Mon, 20 Apr 2026 07:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285462.1566490; Mon, 20 Apr 2026 07:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjVc-00020n-8Q; Mon, 20 Apr 2026 07:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1285462;
 Mon, 20 Apr 2026 07:57:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wEjVa-00020f-BO
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 07:57:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEjVZ-006KBn-Np
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:57:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e5dc58-5cb7-0a2a0a5109dd-0a2a450bcc7e-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:57:29 +0200
Received: from [40.107.209.47]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e5dc67-212f-0a2a450b0019-286bd12fa6f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:57:28 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7504.namprd03.prod.outlook.com (2603:10b6:408:19a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 07:57:25 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 07:57:24 +0000
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
 b=l9t4++CW42blXUCmvYluEzOxzBNvApAg/9+vTg4O5HmquPbJ952jnAnf6qKFqEksUMyuwMqL4JiF/cRoxDE8fD2usr15gp7BrLffMTOnzqCBUoX3Td8p1sVOMGIIevCkdb7b5bwGpHtq659YZ4BOW6X2PDE1eDrsNLm8EIxqcvvVD6wG7SigLbocnxvcfyNluwn1H5Vf8J3VJ1VOzpq6n28aZPyFyl10LTyPuQZEney0U0TU0SCUnVAkc1n2yS/R6I+QPZOEN5FJIi5Dl+JFYqNXUg1DOi8Rijd6m31ne1qkMLJQ7S0rpPkuNNYDmWcg2ojhTBBJaLeI92OFjNhWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U3C+MeKhh6Xwgw3INE79vNzEqtjx6GNUx+rMjSJ9DY=;
 b=Yhmj/208JT7VYDvIL08Cv+bAkHfQZ2UaO7136mHQWG7U3Pxn4lOG1DoyuT80eR/SymmamG71dueqANS90h+l+Z/SgbsIoyJ8pJlNC8OXfOijmna71Qy/wXV8e0epBSsEfpg6JeZjOtewTygrki5pSPl9TSnGy5kI12Dy4opg903PTPY6NGv5CXz5wEk9s8ad+uHUSvc6sS4/duhPg8NKMqc0/KamGzZQTQj0pg2sqjg8B/RopCU0kHVHeb0rdY+3seHYNTHoviDWdFT7/Gt0vOEtAG4I7KlMc3fV+LOWrkg/WUm7bhjXrlhZ/k1NA7aS4y7CcLe0eXKqJvTzormE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U3C+MeKhh6Xwgw3INE79vNzEqtjx6GNUx+rMjSJ9DY=;
 b=qBE45lIGwg+E034Nzb+MbVIEPJ0swKuRjGXozKQHBSKh+evxUg4nbRprsb0MOWktbmfmaUTbknEC+HlG6UfHXocE0Gv5oC37JuyJGliHqUsxshVcbsYmuKI6y3ZHFfVxCcNMjzCxGMi9Avgtw/WZX+rTJsCqX0rNYCb/lheDYf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <139eedf5-b30a-4978-bbab-9d400e7ff9cc@citrix.com>
Date: Mon, 20 Apr 2026 08:57:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Force error checking for reserve_e820_ram()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260417160828.526063-1-andrew.cooper3@citrix.com>
 <85625a6f-8d04-4863-8f74-461c9a85464f@citrix.com>
 <2688ce14-9d25-4374-83a7-dea3ee508f71@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <2688ce14-9d25-4374-83a7-dea3ee508f71@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0040.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e44330-a661-4fd9-a10f-08de9eb27566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mhjVIxdgAz5IDC2RgtdGGAld1yZ6vjDUH9m32ZmBg9UmoPw6B06KdGd7dNuRyKsko3CbBZxASgZDN3ZV43G5j9f+2PmUloclGHEnQgQlWegM58gRLiKahUr88XviQf7TaQwAoPK2Go91pLDux066sDRgcq7uN1Bt0wHjuLIN/a3GA7PN3uJqskobWbNr+M/balOTbc2j7UxgSQbTU4vx2EiLfEMGuZDh1gQx9HyU/jt4f+78UXdWnsz6dwRngcC7YEvHAEVTb6r7PWO8MwDzo2DoiLO7lpCoF9ijDNFGxOPR4veFavAFai8iUqpDagxjgsF+Tz3f88Tv0uomEqdYlitX9zVBrWuAe1wi3PtyAbOyNDoxRaFaxfg6e/KXGxkyzHBPc6kiwGDW5Emp1VJXkUTaVnVcWbmDdv6S9TYJdqW4nzGICyMQNtc/iQXGD5qA2oDTw5MdOxrQVsrPMAJOjn2IvXPHC0g8fQ3Ml5T8NLrhEQJ75bHTIMK83ppN+Zox/AjRYyPDhYonLYbEeq8y/UckGkgaqZEewX5kcY4Jqo/kfjxv9MQgOqMrNMELFLxL25o1XQSoKjeUpZhcFxMEHEfysXzno5BgBtMPltH5xlqyul7vkuQjJLpVFLF5YvJ643isBSFqMenC7aHIWxvlulnUePS5PIrKM090b7YEEQN3+4BQIp9NmaTTxpSDrjc8eYg709PCREkSbughD+k4/c7PcLoAS2+atUk4uFB/ihM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEk4VjNkUUtwNHZsazl2WW1acGNGRENvdzEzcmM5NlVVbnJXSW81NE5tVDZq?=
 =?utf-8?B?MDZ5TlhwU1lKa0gxQ3JEY3NMZWJMMHVINE40TFBjdDducG1RNDZYKzlDc2xF?=
 =?utf-8?B?N0JhS0c4cVVyM0VBQUhxSjFlVVpTd3VYTVl3ZEc1WU52WnBDRlRHMWxsL1lC?=
 =?utf-8?B?SDR5S2pNK2VSZjBSWkR2ckZ5VFVyQW94bHZPY2Z0V1FHRTdjUlNuZ3JJSDFj?=
 =?utf-8?B?ZlU4aDdlb05FdmQ2Q3pCL1RLa0dqdmxTU3NyOFAvaWlJL05PMkJUZHJ1b200?=
 =?utf-8?B?Q2NNN1RmSTdjYlhVQkxhZ2tZWFhTNkRHTkFvVEtBN1NkdUt1RHRTNUlJYkt1?=
 =?utf-8?B?WFY2TXBJV095N1lQSy9KNVAxQWdoWTR2STZaalI3WmQxYU9ncTNwRC9Xd25t?=
 =?utf-8?B?cXhhK3FYSHNEVWxwZjc0N1hIWElSeDZQcWNlRTNPdFpJQWcyTzlWR1N1VHZI?=
 =?utf-8?B?Lzl1VGFadFg1azlpWitmODZER3h3UW5CbTFyWEJzUHFWU05qcHFLNUlJVGUz?=
 =?utf-8?B?M3ZhQWFaZnNSQjRVMGF2aXNtSm80Vm1qclgyb2J5N0VacjV5ZFVXTEZjazZI?=
 =?utf-8?B?VmR2OWFPTGNXWm5ML0tOenpqOXhXbzJQYVV3Uk1NNTI5U3NuaGdzcmM1dGNw?=
 =?utf-8?B?cWtQOWNPZHJjKy9lekpLTnpjR2JvZk5QWFFqbTlGRFdyRFdSbndkUzZGS3Yv?=
 =?utf-8?B?dERzOUtOWFNXdmFvaWRNb2VXQ3RNZGZ6ZG1lZUFSZkxZdXczQWo5VUQxRVN5?=
 =?utf-8?B?cEpVVUk4cytiOFV0RmNpM1FxR2R0aEZXV3JMaTNBTjNDa3RFT1dYUWVVSVV1?=
 =?utf-8?B?QjlRRGs2dDZPQ3Y1SE8wUXlkTkRzM0IwVDI1cEZGbGt0NjRrajc3N2FwRE5s?=
 =?utf-8?B?Q1B6bXJxdGw3dUJ2UklZaHo3T3FQSi9DN1VzZS9vR0lJUzNtdEhUYVFFZHVZ?=
 =?utf-8?B?aTljWkkvSmNsT1dGWmREakxKaHpESitWVjc5bHhlWVczNFhnRTQ5bTZhMTBi?=
 =?utf-8?B?S2JaekQvSFkzeWFvRVVMcm56VDFBK2RXYm1vc0tCWDlCc01iNVVGWjFQMUY5?=
 =?utf-8?B?SnhjQWlieUNDTVJ4ZmNkUFVXWXVLVGdIN25xZTVlcDNTSlg5THlDc21pWGox?=
 =?utf-8?B?QmdtK3lyTFpjZitlZy80T0FMR2FZSy9vTDkxMGgrY3lkUUVvK2NkaGp4cFNH?=
 =?utf-8?B?NFg0YWJYOUxuUnlJd0lmbVdBVlNqVVl6K0ZKQUxqN2M2TzJFTTBGbEc1U2U2?=
 =?utf-8?B?RE1GazlSR3k0Vk1nTUJMVU1MYVRCUFZIaVV2MnlSRmw5aGdkbHMyNWoySkJu?=
 =?utf-8?B?dkJtc0pMZmRPcVpoVjgxTGZzR2JHMHFDZkE1cElacmJ1TzJaVTBwenZVNVZ5?=
 =?utf-8?B?ZkdoanZneEFERCsyeWd3MTBUSlRXc3NMQ293TXNmcmgyQmkzaGV5NXlabDFU?=
 =?utf-8?B?SWR2MG5SVHg2VEkwemUvZnN3K0syblJkZjNxd05vTjZETVBuMzNBaGFYNm8x?=
 =?utf-8?B?UzVGeGtJcmlIY3J4ZW5RSkRBZGlFRGVJVmtTaCtzSXd4aFhYTzkrL08rdWRl?=
 =?utf-8?B?SVhNN2MwUGZjNVdMaUVFNUswTTV0K1lUbGMvay9lVGwzbytuRU5mQmFkU1dr?=
 =?utf-8?B?Qm5uZVBkSjArUmMwdlVUdEwreUJJWm5QN25JTGxkSCtFdEtaLzRZWVpSZCs2?=
 =?utf-8?B?bkcwS01ZRlAyc2g1eVA1Snpnd0xjZEpzWHlTV1ZLaWxrM01tQ3pFU3VhcHhy?=
 =?utf-8?B?NTZpR2NaNWNYemMwbkt4YXgrRTlNVkxQRFFpYzd2YS9yM0Z3N09HSzhJZ3J6?=
 =?utf-8?B?NzJraVZTL0poa0phVUVNcVJTZWNwamZIdWJxMzVWM3h0SjZqQ3Z3MHBzdEc5?=
 =?utf-8?B?ZkMrazdrQzgvdVRIQy94eU5FSThKY0lzbTVYam9hcUVqQWxReS92RWg3bXN5?=
 =?utf-8?B?ekpnYThOY0dydFV6QXloU3ptbzc4UlhIOEZqQUNIamdaeHZCV3RVTDAyZnEw?=
 =?utf-8?B?U2xKMktKUWJROHBHVFcvOFdTQVAyRnBhcE52d2NFZHNWZmtNU0hwZnZVY3R1?=
 =?utf-8?B?Z0tIWnNkLzE3QjBiWmZZSjBWRVFGcEpMZ05qRGdQMUJZa0UzOTIxRmN3VHhv?=
 =?utf-8?B?OHhadXpxYS9EUUMrOFljSHh1aGhtdmZYMzhGaWMrSGJ2aU9RRDFibEJGM3Nk?=
 =?utf-8?B?VnhlUjZwL0VDWUNkL0FsUml5U1NvcXNjd0t5K1dpank2WWt4SGwxbFYwVHhT?=
 =?utf-8?B?M1lwcy9WTm4vcWx5K21jQ002eHJKU04xMEg4SWV5d0YxY2VjODR2UlhmTmo2?=
 =?utf-8?B?UzFtODE0UTRnVXFWTWpOQjB3enJJM01sdm81UVg3KzArdXJDTnJqSGFPaGVl?=
 =?utf-8?Q?7wkjgJyzpF1EzJ/4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e44330-a661-4fd9-a10f-08de9eb27566
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:57:24.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D96sQvBnZR4h3wo2muAtH4HJ/5UM4BvcTuqb2e+2nfxJxG/8QUXfa00fw98JvLI33SFQFQ5KxG63dLLYoHPXahTCCKWZlf1TSlgOtBcCz3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7504
X-purgate-ID: tlsNG-42698a/1776671849-7D165F3B-DCBE7D72/0/0
X-purgate-type: clean
X-purgate-size: 4580
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DCC57427EE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 6:05 PM, Andrew Cooper wrote:
> On 17/04/2026 5:27 pm, Ross Lagerwall wrote:
>> On 4/17/26 5:08 PM, Andrew Cooper wrote:
>>> Failing to mark Xen as Reserved in the E820 is catastrophic; RAM
>>> regions get
>>> handed to the physical memory allocator for general use.  Similarly,
>>> failure
>>> to mark the boot modules as reserved is not going to result in a working
>>> system.
>>>
>>> Mark reserve_e820_ram() as __must_check, and panic() on failure.  To
>>> avoid
>>> opencoding the range in every caller, print a general failure message in
>>> reserve_e820_ram().
>>>
>>> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Teddy Astie <teddy.astie@vates.tech>
>>>
>>> Slightly RFC; only compile tested so far.
>>>
>>> There's no obvious fixes tag.  This has been many variations of
>>> broken since
>>> forever.
>>> ---
>>>    xen/arch/x86/e820.c             |  8 +++++++-
>>>    xen/arch/x86/include/asm/e820.h |  2 +-
>>>    xen/arch/x86/setup.c            | 11 +++++++----
>>>    3 files changed, 15 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
>>> index 872208ab3722..f09a01f0c50a 100644
>>> --- a/xen/arch/x86/e820.c
>>> +++ b/xen/arch/x86/e820.c
>>> @@ -670,7 +670,13 @@ int __init e820_change_range_type(
>>>    /* Set E820_RAM area (@s,@e) as RESERVED in specified e820 map. */
>>>    int __init reserve_e820_ram(struct e820map *map, uint64_t s,
>>> uint64_t e)
>>>    {
>>> -    return e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
>>> +    int res = e820_change_range_type(map, s, e, E820_RAM,
>>> E820_RESERVED);
>>> +
>>> +    if ( !res )
>>> +        printk("Failed to convert E820 RAM %"PRIx64"-%"PRIx64" to
>>> RESERVED\n",
>>> +               s, e);
>>> +
>>> +    return res;
>>>    }
>>>      unsigned long __init init_e820(const char *str, struct e820map *raw)
>>> diff --git a/xen/arch/x86/include/asm/e820.h
>>> b/xen/arch/x86/include/asm/e820.h
>>> index 8e7644f8870b..a86d60ce3e77 100644
>>> --- a/xen/arch/x86/include/asm/e820.h
>>> +++ b/xen/arch/x86/include/asm/e820.h
>>> @@ -25,7 +25,7 @@ struct e820map {
>>>      extern int sanitize_e820_map(struct e820entry *biosmap, unsigned
>>> int *pnr_map);
>>>    extern int e820_all_mapped(u64 start, u64 end, unsigned type);
>>> -extern int reserve_e820_ram(struct e820map *map, uint64_t s,
>>> uint64_t e);
>>> +extern int __must_check reserve_e820_ram(struct e820map *map,
>>> uint64_t s, uint64_t e);
>>>    extern int e820_change_range_type(
>>>        struct e820map *map, uint64_t s, uint64_t e,
>>>        uint32_t orig_type, uint32_t new_type);
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index d041cbd5f6f1..9c1f1eafa0d7 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1639,7 +1639,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>        {
>>>            uint64_t s = bi->mods[i].start, l = bi->mods[i].size;
>>>    -        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l));
>>> +        if ( !reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l)) )
>>> +            panic("Failed to reserve boot module %u in E820\n", i);

i is an int, so it should be %d.

>>>        }
>>>          if ( !xen_phys_start )
>>> @@ -1652,11 +1653,13 @@ void asmlinkage __init noreturn
>>> __start_xen(void)
>>>        /* This needs to remain in sync with remove_xen_ranges(). */
>>>        if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>>>        {
>>> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
>>> -        reserve_e820_ram(&boot_e820, __pa(eb_end),
>>> __pa(__2M_rwdata_end));
>>> +        if ( !reserve_e820_ram(&boot_e820, __pa(_stext),
>>> __pa(eb_start)) ||
>>> +             !reserve_e820_ram(&boot_e820, __pa(eb_end),
>>> __pa(__2M_rwdata_end)) )
>>> +            panic("Failed to reserve Xen in E820\n");
>>>        }
>>>        else
>>> -        reserve_e820_ram(&boot_e820, __pa(_stext),
>>> __pa(__2M_rwdata_end));
>>> +        if ( reserve_e820_ram(&boot_e820, __pa(_stext),
>>> __pa(__2M_rwdata_end)) )
>>> +            panic("Failed to reserve Xen in E820\n");
>>>    
>>
>> This condition is inverted.
>> Otherwise this looks like a sensible change.
> 
> Oops, yes.  Fixed.

With those changes,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

