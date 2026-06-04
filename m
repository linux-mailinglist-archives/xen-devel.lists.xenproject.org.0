Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bhK6IDWMIWq3IgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:31:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF81640E75
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:31:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=joJjcUMl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327945.1592627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV967-0003WM-Rl; Thu, 04 Jun 2026 14:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327945.1592627; Thu, 04 Jun 2026 14:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV967-0003TX-OV; Thu, 04 Jun 2026 14:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1327945;
 Thu, 04 Jun 2026 14:31:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wV966-0003TP-CL
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:31:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV965-001muy-Dt
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 16:31:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a218c17-5cb7-0a2a0a5109dd-0a2a4508821c-24
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:31:01 +0200
Received: from [40.107.200.52]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a218c23-63b5-0a2a45080019-286bc8343b72-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:31:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7161.namprd03.prod.outlook.com (2603:10b6:510:2b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 14:30:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 14:30:53 +0000
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
 b=cKWg/7WK+/nDHQzWkVh8J+0Uyj3kH8Tr7OiCv+AOV7LyoJT9+tsWG+psGiTQf41RReR3KmGNksVy2HJa+r3fFPnERpdo04DyiRT+o3tJ0kmzRyIfKrPx2BQUazpLgEoQ97n5zJJQ7i0EHwyE3DnxprHwTsAEt9L8AoJWRmoP6Fp8vZw6SNgXBVdGbyQOX+2t/zTTDuBCwfg6eGuto1bKtywDsDfijKlexCKIu5gyR6x8YpGEVMuKIzYDB3FWOVEjvRwxxjBd70gY2wbO3nPZkxtZkRB1+6ooooHf9wANkX2T0uc/6zQvuSNZMTcVJI0gRqQi6e6joeMbsx8iokf9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BphbvABJUryfPhCaykGoNgNi+Q/lBSliHIJosekGqJY=;
 b=v638Dd35g3Y4iCGhcF9E45nAT8Oajp8LVlQdo0GAofarSUaYKlUCpatLyMjh6PP8oBn0a43qpd18EfqkKul4srOhoeuYm2nuOy54/G9RAE0VzBGnsK+bsQ/nCMAlorN3FNkcNjZr/ZpTrsnC2w/Gi49UrljIEXJ5IOZGpMEGRz9jTYgqwcMA1Ae61huEX4gT+FhN/VYev8TYXVZULuTJK30o3MCUlLH31CQv7Q7xaMI1Db7mVMECTeGwVkxGgRq4adl4dYPBYt0ew2y3Q6TbUoA3RllGCAnt4DwJZ064KON3B1EFTb60qdmVH3//RULVAcG3yzu+J+QVskec5RJcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BphbvABJUryfPhCaykGoNgNi+Q/lBSliHIJosekGqJY=;
 b=joJjcUMl4CF7NOR9Ol23RPNPX44a5OFshqDEmns9+C6lvwkxRfUUefXtcG1KYZxlktZmtoJTnWGjx3AY0lEwd4IMJwh+5oCj2AOqLc0J7EwwCmBFwhbJTLGQlzFwOMCaEmzwOOEqThYBgnjr5cQK9Ycr9AyIIXnYPt5x3OKKyzI=
Message-ID: <9859bb92-d532-4169-9b0d-1d7543491d6c@citrix.com>
Date: Thu, 4 Jun 2026 15:30:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/6] x86/efi: discard .text.header for PE binary
To: Frediano Ziglio <freddy77@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-4-frediano.ziglio@cloud.com>
 <35a67929-aaef-4b1f-8370-7dcdf096fbb1@suse.com>
 <CAHt6W4fXPy9o2VzO-E+PkNv+VA2FcRPTzJzH6gAyqwXuV6ytmg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHt6W4fXPy9o2VzO-E+PkNv+VA2FcRPTzJzH6gAyqwXuV6ytmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0279.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 92707fff-6f7a-45d7-6e6d-08dec245e1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|4143699003|3023799007|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aikCUGI73vu5RO/diMHBHAvhW/1GNMD7qu+d5Uo/B5ZTV6c0Ffo4ZcWsHFkpoiQggQHag5FFCCe667RFJgAqqTolmrZSfzjG39KqHDqgEtddsb3QVvfgPWmjNYr674lATuVSAygZnAx2dtz3vEUQdSKf09J3Oker3GPu6USHxG3HuL20+C1Zt79AUFrifcza9tOv3iWDLPHf5beLyratkTLfPZGNH0ivKrYA6EOIYLPXjDoSgKkp7ZkAHkHgl789ItqjuSkg7uDfcgEclkGf+vg28DBYE/5WJf0iyvu99fo3r9Ptu9Vm/OmM7J4HrOM+xmY6YD6RyBTmztUG71cJxKQqDNG5bKwFQrAuMvFpAQrdm15FYP6PesYs1TCe/AyWYNxQW7i6YuRkzkwaPl216vFdtLX8+CZJDiZgiVYBXWgox5zl7gzI8AGfuOMJQH6nVRyDIHHgvH0g6G6OHciqdW0zDJcEESG4sttORLlrve9Cr5Pgw6DTZZwn0qWN+S0wKtCFL6oHQweArRdPL+Izq4yCNdXEUucz6oAVbyVOTlOHiq+U5yt+VgL1lh4MUkTSolg9YCj2ZuPWnpedrHq1L7hKBF1ecZTMQjBB1juOS58Q2pjJQWue8poVVFcbv06cTB67Uq2gdSgRoGa2cI49AZ44CL8//ZU4RaVRUTOmRfCIb92eOoxCUrBuhYxIB/tu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVd3YXFDSlg5enFTVERKdS9wL3VOVXIralZJZVNrRTlSajFETkU2WnZTYkJV?=
 =?utf-8?B?dDJTL0haam03eTVFdzJjQWN3anNZdnBBcnJzMVRRRW1YaVQ3VUsrTVZkbHBL?=
 =?utf-8?B?RndITjltUVAxN1lyMUYrQ2lQSmt3dGxISGIvUEtOMVJvb2svSVoxZDFRbHlR?=
 =?utf-8?B?SE44QnRubzRyN09DRGc5aWJYMndOWVhXRnhxR3U0RWpiK0RLNG13b0V4bGlJ?=
 =?utf-8?B?RHJvaVJvUFdaNFRQaHBuOTZJOHJCVVFVbmtOaEVqZkpIYThVTWUvelRCcEZ0?=
 =?utf-8?B?YVMvRHBLazhIenBjcHZnMWxvZHJrWnFzQUhVTmVwVFhBL3g4UkhVUWFvVXFJ?=
 =?utf-8?B?RldteFBlTnFtUVVIU1RjOXhVYmZ2Q1ZGVlJKV3czWUVyZnYwT2o2NGJabTNm?=
 =?utf-8?B?ODgxbjhublREQXhCV21JMWlXL3NkSjRHRVdNTUU3elNqNVU1Z09JWjFLaVFT?=
 =?utf-8?B?Y3FqTTlZQ2d5VFY4ZG4rOFJhTG8zNUVCbW5kWmdFeERPMDZyeCtNTGNwdEY5?=
 =?utf-8?B?V2h1Z09CdTRIZTNaMDZBTEJ3cGxZZ21KcEtjUVpySEtqa2lKQXN6V1lVRm85?=
 =?utf-8?B?Nm1KOXMyZVlqL0lJbk1OVENtOFlrbE8xdi9QWVBnWnEreHFCUXd0UlRyZDBw?=
 =?utf-8?B?TU1pMHVxL040bDNnb1Izdnh1c1d2YVdLc09zam5rL3BQV0dVblhoWDB4Ylk4?=
 =?utf-8?B?dlZybWRTeEFla1kxNmNlUVJZVFpCREFXRW9ubTR0cjd5VUJPSlVoeTBIaVZk?=
 =?utf-8?B?QXpwSjRJcC9RWnU1NUFOZHZUZnNKRThxbnBReWpUbU9tS1pkNk9TK1JvWTl2?=
 =?utf-8?B?eTlmbDRiYlZGbG9BVkk2V24wbU9ONW55aVBnTG9BRGNhNmVFRmp0RXRQYk8z?=
 =?utf-8?B?bFRFbkY0SFhteVZZQnN3Z1lUZmJZcnFLd2lzellDK2JzTlZxQUpPUndDaVRS?=
 =?utf-8?B?Y3A3VDg0V0N6S1ZwWGlQN05zQXF3eVNHNzRtOWhKNUJUYWkzd1F6UUdZcEZL?=
 =?utf-8?B?WXplUHR4N1htd3U4VG1sWkp2Z1E3SXpjZGY5dS9KVjAvSzVPcFhZL3dUaVp2?=
 =?utf-8?B?N1o5Rk01VVVaeG9PSG43WFk0NVJkb1RuQlVBNE1EdXg3Tkg1UDZRVGg0OGxN?=
 =?utf-8?B?cXZ4OXZEM1h3MUcrWk91VTFHVzhCblVIbHhzT0lCUmlyV1N4SEN6RjNoajVI?=
 =?utf-8?B?c0NzTnZGeHljalhweTYrRXZMS2s4VXVzcEQrVXRzLzIxUWxaMjFTcXhoWWNM?=
 =?utf-8?B?ZHZlMkk1OFY5WkN0ZmNjNmY4N1ZmUFJCSk9tbU1QRUJKY0NmN3JLdnM5RTdE?=
 =?utf-8?B?aTc2WW8yOFRTVkxmWUpxdXFQMlduOUJ4Lzl3VDBCdG55VWgzNnVBdUFxWXZ2?=
 =?utf-8?B?NW9vWGQzUEkwek54M3RxRmROYnRxdFE5UEgwQ0d4SmxyYUF6SGMxT3p6dEdz?=
 =?utf-8?B?OXIvUTBTU1A0QzBSZldYdHJ1aGpjK1pLdEo2MUluQ2MyNGdNaEd3NHlGWGtB?=
 =?utf-8?B?a0RsRWpJdG5QMW03TzVZNDY5VWdkY0gxNGEzQWRaVnhEOWh5MWtRZ2ZQdEJm?=
 =?utf-8?B?VkdYSjY4OW8yMHpabkpxdSsyNFo0Y2xOVDduNEFTeVY0eVgzams4WFplZnZM?=
 =?utf-8?B?bnZkQ1doMldoNGFYR3F5TmhUOTM0ZUtRNEFIUndOY0NxeUJnbGFoQkFwcjdn?=
 =?utf-8?B?SjI1QW1KVlZvaWJBSGppS0J1RlBGQnZUaTFZOXdwOGxiQzdObC9QN09hYkR0?=
 =?utf-8?B?OXFXeW9acEIzb2J5ZlpxUmJXUzY3ZUFURWlHYm9nSEdVMHdBWDBOeWFuYW40?=
 =?utf-8?B?azFPY0F3YW5ub25PZVNhakkyK0RDRzl6L3RFMHFFQ1NPaEpBci9SL0ZRdWVY?=
 =?utf-8?B?V3VpR1RxTHl3YWIxZEVCYm9ZdFd4WmljUTJZSWhtVEN2UmJJNW9sRjJRNXFa?=
 =?utf-8?B?Z2xWYWgxbFJzaVI4b2NCVVdqajZ6MS90MVMreTJoNm5MN1RveGp2aWVhK25a?=
 =?utf-8?B?V1gydUx5RFpRV1NuTzBwWVRNS05hTjF5RHdjREY2bEhYNjk2MmJUTTRub1VP?=
 =?utf-8?B?anp2ZENFUkZYMGF1MWV2bUNHL2hZZlZLNXBPTEdieHl4KzdyMjFJb2J2R1F3?=
 =?utf-8?B?SmhGODcybmsyK05tRXkvMERoZXhHc0YyNVJwNU41OXRYbmR2T2NQVWxJdnBl?=
 =?utf-8?B?OFdxNTVlUkY2L0NJNnB1WHNrYzV6NG5SeThEU3M4cW9VNjNNNnBmLzBEV0N3?=
 =?utf-8?B?VGhLTm1ycGFJQVhFWjdlTW9SZGVaU0ZwZWlpazFkakNqUTdvWFVRRktCaFR3?=
 =?utf-8?B?ZUEwcHh6ZDU5a0Jha05pVHV2bjhMbUJBdkhBYkVxSXJTRzFGUFRVbmVhcTVN?=
 =?utf-8?Q?DzjXcoD4QUvKVaFo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92707fff-6f7a-45d7-6e6d-08dec245e1a7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 14:30:52.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTD7+L46UwhdyJmXm4TIzYT159R4auY8CjdPZhjolO4MaDYjdI76/APBoPsJzU6KwqxMKzbJYul9BhnTguPJOfpdwSyCh3TedHOh6CnIk18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7161
X-purgate-ID: tlsNG-c1860d/1780583461-BE169DB1-8F913A40/0/0
X-purgate-type: clean
X-purgate-size: 1402
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,suse.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEF81640E75

On 04/06/2026 11:28 am, Frediano Ziglio wrote:
> On Tue, 2 Jun 2026 at 13:15, Jan Beulich <jbeulich@suse.com> wrote:
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -57,6 +57,9 @@ SECTIONS
>>>    __image_base__ = .;
>>>  #else
>>>    . = __image_base__;
>>> +  /DISCARD/ : {
>>> +    *(.text.header)
>>> +  }
>>>  #endif
>> We already have DISCARD_SECTIONS, so I think it needs clarifying why that
>> can't be used / extended.
>>
> Yes, this can be done that way. Roger, do you agree on this ?

You'll need to add a general ARCH_DISCARD_SECTIONS, and have x86 fill in
{ELF,EFI}_DISCARD_SECTIONS conditionally.

Also you need to fold this hunk.

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index 8b3229005cca..b6d852050a0c 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -82,12 +82,6 @@ When a PEI-capable toolchain is found, the objects are linked together and a
 PE32+ binary is created.  It can be run directly from the EFI shell, and has
 ``efi_start`` as its entry symbol.
 
-.. note::
-
-   xen.efi does contain all MB1/MB2/PVH tags included in the rest of the
-   build.  However, entry via anything other than the EFI64 protocol is
-   unsupported, and won't work.
-
 
 Boot
 ----



~Andrew

