Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jYkgIDQiNGqdPQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 18:52:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D188E6A1AFB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 18:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=rzb5zUga;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341473.1601894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waFxH-0005WA-22; Thu, 18 Jun 2026 16:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341473.1601894; Thu, 18 Jun 2026 16:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waFxG-0005Th-Uo; Thu, 18 Jun 2026 16:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1341473;
 Thu, 18 Jun 2026 16:51:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waFxF-0005Ta-IC
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waFxE-002fL7-VK
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 18:51:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3421ea-bab6-0a2a0a5309dd-0a2a45068e00-16
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 18:51:00 +0200
Received: from [40.93.195.71]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3421f3-b690-0a2a45060019-285dc3474650-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 18:51:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5326.namprd03.prod.outlook.com (2603:10b6:208:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 18 Jun
 2026 16:50:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 16:50:57 +0000
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
 b=M9L5ynOPdWYgfRIEp7sYcN+1m6GX7ZyMO60l5zbc5pwXFxHCkvUa8Y4iosIgerPawypryN5Fnq3KXn+oPnx8cnXmBD7IAO5Fsb4JmltTorU+hL2DqSN4OMWKCCh5a/BbrilM0sCAWwkNp8hzzvLURMM3nypXLGAmatc+BCB60+dnqynxOvon4ZbKIq9hrtJDNJwRBTpJ9KHrI5Z7fkavw2q836MvDEwbYIirGrnNNNSbseF9gsoRaHCrCQtu7pGHfdU33XSW86g7ME0mdUej7JyrhpaTTy3a75eyLropejOO0tHV6GZvnmXHImFC1qasM9TwsifWQqnf0mi+KzQRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM7TE2FjDEYUmBd93gStHLgyWWSEKi45D882ZuzVl6w=;
 b=UBBtbR/R1UzcW8YQAUH6X7ao3xV+oo8MJK+LrUSn4dtikdiUH048uxX3vDJ7FSOam+izMyoW5b6IpJZfRQ9FcmBadtV3N+bebLOgWgjErqN8iqd5kVWkiPw8FAu9Tk18qpwiDO4j505Bg1PEJHiec1J/GyymE/tykTjxJKD2/OJX25EcXMmrsy8OnwQiDpifYH1OmEE1b7D8ss2+6O3I9kCnpRdTka9J6hfgWBzqvcyWH09VzyPiBDht9zIBGRLgXQ0m7YgWi8xFdtAvN6KBVd8aBkSgjhgwk3ixORoxZfAOQFKvTIRFf9Fc6Ayo+xhO05jFJrvobgIh3GUTMwngsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM7TE2FjDEYUmBd93gStHLgyWWSEKi45D882ZuzVl6w=;
 b=rzb5zUga9jSALMyAeeyyG8ENcMGlFuCylztgHc8UXQJlbY+vR9pwWaAiJB1F015JzIFLJhoQ4xJEXPHGoBpk6sjs8UUUnYSNVWcFhOCll51D1sURwtseVVxbIT9UdToh+yhqvRCM7LCB6XuDTuuYBA1oXZ7WJNGU+/Uihc1aNWM=
Message-ID: <401ae47c-b55e-4ca8-b764-9e6fd17444ec@citrix.com>
Date: Thu, 18 Jun 2026 17:50:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 1053aad6-25a2-4ad4-3a98-08decd59c4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|6133799003|56012099006|11063799006|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	gb8XqjwHRUAXlJu+1fEQizcaIxPixjFJ6zpBkPwSC6JsWS76zE9P8dhkuOCFZ/rJs/z/HGxqal494xBHJJrIPmHWJoJNItfpMzpz2O2E5uRpAoDUUUbnvoGn/2rEJKSB6+oncTCZcH5+E7SxCb6pNCkClbKEjsiULUU10DVRMm0cQtRW7egET3eJ4mV/t+wjslV5nQzT3P7844uE70/IlCMC6mFKQhJHbDQv57F6bGRfcAvIDPfkTZji/ZoR/ZedMQQfTcVEPhG2IQmiiS47ihGPs/9sdHZSb9m32KJYt9zlgsZztAUHyvPWocvJG3NDvBKQxS7M2tQ/D1qY6swA0s5Lh9AQqHqfGgUjxVhxLGs4cvYFCmnbqklEiKYGcy6ON8LkJbz4OQIjFXWu3ZIai9SifPxDhtR5DdGWALmnzXJmlMEvS2ofCQdCdOcjg80hbmAzut+720A0xA4jDxAvoOqAh+s2L5D0kWVe0XerKHg2pFDTmvhppXbeWZRo8wHjFuVFQlrYlfsGpsNK/dU1enLP6yGbLDV0uItdaUfUypshs2Kc1xg71efWWM1r/qFSOX+Np7sGwYzknYsQGGwn8nmPTABzrsc24unpyzij2J1hp4SFLapBtSanezmugujBUyFP423uDW3+5vZV5r5hOmjbFNAe32RRjr1naH9BS+BBz6nqj7qmsmnYwDGm7MVz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(6133799003)(56012099006)(11063799006)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBPQXgxTkl6RERPTEUvYUl2WkpjdEEyY1E3QXdxc0RwakpBMGRIeTNoYTYy?=
 =?utf-8?B?cWJ2TFpOa2FFM2hma0lsMmEyZk1pcHRUdGRNYlc4Ukw5eEc5SFFZeVppMVlF?=
 =?utf-8?B?RGdzeUVwbzFIVURVK3c3RkUyN1lWNkZnQUN0YmZjSUpMVlFvQ3lUcXFEYXlt?=
 =?utf-8?B?L0Vic2cza3BsSHRpdEh2U2hvaFQ2aXlmTnA5aUhBb04reXlmSzlkVVp5SnRh?=
 =?utf-8?B?UWJsVWdIVlByOGJtdjNzWlY5S2pZUDhKNWpXZE5oZlZaLzd6VCtualZDUFJK?=
 =?utf-8?B?Y3Q5RVJpVXhINGNqNlJ4K1BjdWZFUXVWNE1tdWViQlhwZ0U2QlVPYVpjZytt?=
 =?utf-8?B?eEhvMDN0a0d0WGdGQlJ1Yk4wYURKblZFK2VBVHdyNVczRERPanlJRmJYZEwx?=
 =?utf-8?B?ZUNBNytTWDg0NWlNL3NrNlQ1WjFXanNBSm0vc01Xc1NhMDB6Z0Vuak5SV0ZH?=
 =?utf-8?B?bHlYQTltNTFHUEdtUC9xcVFEb3VEZUxGbmVJRjdHazlKdTFFRWF4WGFmU1JF?=
 =?utf-8?B?Umo3MGFGczJQVzNBSDNKdTBsZ3FQQ1JoNmFWWSs2bERjdk4vZ3BwY0J5T0xL?=
 =?utf-8?B?d0NFSGZ1NFp2dTZpclZ6MEIvSXI3U0JiNG5FR1hnOG9tMXk2SlBlb2RzN3Rv?=
 =?utf-8?B?SHZ4TFMwQjY0TTV0cFo4clRNNktBeUhjTzBmTUpqak1yTFZVSno1UHZkMUNS?=
 =?utf-8?B?eVUxa3g2dGpRbWw5dGNieCtHcHgxRW00YWxCK2t0OGRRcC9TT29xcStISHZ0?=
 =?utf-8?B?S0xFdGN0NFBhTS9BL3NrdFBMY1lESTliSGRaOVpMUjRyYjBNL0ZsazdCMExq?=
 =?utf-8?B?VFJ1alVEVEVSNEY0TDVnaElFVUpPa2RPUXhTclpaa2JtdC95elhYU0MzT2I0?=
 =?utf-8?B?cEZkbndSZzlzbzJtTU8wT29JQ0pnNForR09TbTBtL3RBYUJ5ZkU0a2FRZ20v?=
 =?utf-8?B?eDJxS3U5a2VzT3JKQlV5ZlU2OUlRS1JYSzdEZUxZUWtmYlZtTnBERWxKdG04?=
 =?utf-8?B?cXRTYjRXLzViVzV3cXZiYVFBMDlJNVhneGpJR0t0MjkxalJIU0lNN003Tmx4?=
 =?utf-8?B?eTZTNVFHdmh1M0RqVUxkRm91M25vdUV5K09tUlJEQ0pKMyt2VzFhR203bkJV?=
 =?utf-8?B?MDFKVUlFNHlXcWk3VEl2YUlsNnp1SDFENmZ1elcxTGQ3ZDR2UW54YXdESUdG?=
 =?utf-8?B?eWtJNXBlUkxqbURQazJHWUlBL0dKQmZXem9EMlF3eHcyK1N1QjlMeStTQ3Nw?=
 =?utf-8?B?YWUwcUpRd2pOUnJmNTIyVXRQSWlPQnFOWERCT1JkbWxkUTdURjRrSi90QUVJ?=
 =?utf-8?B?Yno0L3lUTEhnbDZxelNBMXhtN1BDRlZvNy9KdmRuNGxva2hWaGd6OHcxTllM?=
 =?utf-8?B?WFdRbkovMG5PUWVyajQzVjBQang4cmcwQ25oVnZwQ0RhWHFUcFBpd3dBSmhX?=
 =?utf-8?B?RTNBejgyVjNuMi82REpzOGxzV1B3RGMzdzMzRmFtVWdQbUl0LzNlNzJ0MGNF?=
 =?utf-8?B?OHBCK3VOK0F3UTFHY0x4Wm8yWGozbnB6YWZGRjlHWW1QSXY1SEtZMzdUUytF?=
 =?utf-8?B?d213OS8yZENBOXVPOVBwTzYyZldCRER3dlNMRk5EMys4b0lXRWZ0UlI3bW50?=
 =?utf-8?B?STBmaDMrdHQvbStvMGNhNzR3T1ppa2lOU2tkK1VqMmtqd3o4SUxjR2hLZ25w?=
 =?utf-8?B?TTdRYndxUytrVjAyZ0h5bkhRVlpGSk10TnpSMmRKYzczSVltSDAxYXEwcTA3?=
 =?utf-8?B?blBPOFJLUmpkRXpLaElPWE83ZW5vR2JWMzVnTi9VRmxvbjJrZ1FYY3g4TGhu?=
 =?utf-8?B?YkVCZmI4aGt6YTlucXVuVXA3bWJPMXVTMTNuWXg5V0VQYmViQ2xnU2JmejQ1?=
 =?utf-8?B?d01HV0U3WE5MU1gxTjZYRjVMR2hIeGdGWnREcFNKVGpxN1ZuL01GWjlTU0lL?=
 =?utf-8?B?SGJZeDR0OWxSTXZ6b3FZNVh1Q2pqVW5RQ2t4eEo2YVpodWlmMXJCc1Jnalk4?=
 =?utf-8?B?ZjBhTzNNQkRjM1B4OHVKTXVRRDhRSitVM2VkekRzaU55WDdHazVYd29FTTNr?=
 =?utf-8?B?WXVKVTd1NHVEM0U1dFVycS9Va3RSeUk5YWM3c2o1Y0JrN3hDTjRqSTlOU0Rv?=
 =?utf-8?B?ekRHYTFydU1TR3U0TmJVNC9iZjBnYjFDRmpzWnpyV1U5Z04wcTd6cVNnMDlx?=
 =?utf-8?B?cjZ4VXcrQUk1b0NmcWN6THdxdHZ4K3VaeFRlQTY1Y2VJMWIrWFluRXkwRCth?=
 =?utf-8?B?U2hNS3d0QytDOXMzRUtBZWZMY3RUdFZpamdTeDlZN2xzTHc3WGJqQ2U4YWEy?=
 =?utf-8?B?d3ZKbmRvZkVCajJlWnBjK2UyR3RNaUxUWFV0Ri9ocjQrYnVOQmdXdHZOREVj?=
 =?utf-8?Q?+zyrtOghnhwRqoR4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1053aad6-25a2-4ad4-3a98-08decd59c4c6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 16:50:57.1102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMogpnOAnIhEikYtFaaOj1c/FJByQ9UmpHJKzKUWQ41pL4cQmXx+I90OiIVINTzPMqQr+Jylzs+/I/taYlIU0mi0huDRGsm7CTkezYH1jzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5326
X-purgate-ID: tlsNG-16d1c6/1781801460-39FF7853-CE7FE7A3/0/0
X-purgate-type: clean
X-purgate-size: 1168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D188E6A1AFB

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
> index 084be3880c..1d06cb035b 100644
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
>  
>      return s;
>  }
> +
> +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}
> +
> +const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}

You correct it later in patch 13, but these want to be __init from this
patch.

Also, if you introduce these functions ahead of parse_pci{,_seg}()
respectively, then the diff in patch 13 becomes far more simple.

With that, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

