Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lCMeNcMPNWoVmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:45:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD166A506B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:45:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BwqO8vEg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342001.1602299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVn1-0001Mj-12; Fri, 19 Jun 2026 09:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342001.1602299; Fri, 19 Jun 2026 09:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVn0-0001K7-Tz; Fri, 19 Jun 2026 09:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1342001;
 Fri, 19 Jun 2026 09:45:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waVmz-0001Jy-58
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVmy-000RHO-CV
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:45:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350fb2-bab6-0a2a0a5309dd-0a2a450c8b0a-22
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:45:28 +0200
Received: from [52.101.56.49]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350fb7-94a4-0a2a450c0019-34653831c771-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:45:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5113.namprd03.prod.outlook.com (2603:10b6:5:1f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 09:45:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:45:25 +0000
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
 b=uMO1MX2X2OJMscgnIpNrYKsJoGwgedoxt+1opbQRx2DXgFrQSSYn0Gd2/UcdSFR3eo56ThJ/Igm6MrHQ6H9H0aoOctcSCS16sggNXN0QQZ80JhdvkDvTf7+J1eOFPv+3nVCTGz2xElRrlFfP0raEHN/MoY2rDkUNnpkQUgfclOJc7nb0dBGpu4ffK3FUhRcU/VTtMDS4my0fuqyapztSYm3WK/Szjqkw18TT75XrOfSTluihMGIZB4EgEEkMM9wT5s15SB2eIbmlTzftjJh19y1GHf68HCcDGBlN+Teg2ei7lALs9onPivAqwibmIyFPc7lZd1DxE2bAGEdqlQ5MtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF+b+mK/pq0ibKGfsuhXPasEE+qThQxB8ux8RuMJ08Y=;
 b=VEmD/aJMig0D6ZJz/s7N1irJ5TazD+6ogAMaP/ZhwFzWZqi9JwRyg/cZrw6Mq6jhBs5LpyS2CNzE0kMqUCC1gHpFKgyeAqTAdAGiVrC5d+6LBGejASJZTHXvm9PmWpd08v5T5PNowtN2ZsgssDlcnaZ+2DaikDP5oopf7NADdPnhLEtfKpf+b2FXccjVwM1aCNlcUhJzn/GL5ARM1a6z4Gj75WFhJGsspCsrFr3j62AVGhffysgX65mo1kI8c/elIzzVArLAnT1Wbd1nKaeaWALgvSV7Afkk0OT6hOXM6Ik0XIDZYHRF0iR9kAMKZr1Of+hRI25tLc/WSUdQdxNyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF+b+mK/pq0ibKGfsuhXPasEE+qThQxB8ux8RuMJ08Y=;
 b=BwqO8vEgWsF5W7MqJ9pXw3MRgA8eSjTn8ap3ArCzSwoJHyG2f1cwMvrp82oJ1aya3F4HFM23ZvYr0c3XkaWQg5a7taiLdU1hQJ0nl99alGuPUmHA3SkPxdtQLCnqb2Jjjdk0+aNsmuwgFgQxzC0uJ1nwD9r8MSO9hs+gIj0sGKE=
Message-ID: <c76d49a6-013d-40d8-82c6-1b20dfa0579e@citrix.com>
Date: Fri, 19 Jun 2026 10:45:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 09/15] pci: Use pci_sbdf_t in pci_remove_device()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4c9f000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 72508ce4-e94a-48b0-5b33-08decde77cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	EHfmthxi4KcQ0tBQijp1KNkvU7Mvsfnb+qowybhLsYMsfxKWaHM3beOkUDAd9/BFOTLL2yekEls1z3f28zoQ0JHdkfHKPj28Ej3Fx6SXH6cZ0Vwnk1gjMToRatxD6R+WJmhIq0dm2c6ys7qcfOi+OpFFma1tmEbMl/0XmIj58iSf4DBFUPcbBwrit1NwfOoCO+TEeTItlzHmTfSiwgwSckxa0SQ8DKQfolZ5zrs3qoHJm+slpAQKzmQdrUVzy1pvbkWSrb/9+yOFyji8IUe6sg9GcBfXFr2bL+qYJOpA2CBMyxpSnywtZwe0vzq73bzjgnWNNJHvzidTxBDO5qpr+Zyxu949fr1i2VW+yl080VfuMvb4aoBgpybuo9J0jPklp5/b4XRlEDOCBLaLF1bDhZ/dEvePmSLDS+qwYgn+qDlhv0a01EqpnkwMaTlrN3+4mKnh5AQB+eHHoAQYs7UcdEenkp1JNQwNmF+a3iertY06WyfA6wEyrOlrzfikQZhwek29+wsr3b0/IqAG8V/qXLTZiojFjAtQCG92NB0dPVDWzhDE+2/YE6DJYGf+BwNMLp3IJABffqeF7mSpbK2y4EEs2uZvf5DfEqbeteEVAXg+BWeOXLvl8/BDOP5zhgNGjVwUQ1EIb6zEH9knopy1QPrDIwEJHbUm5JoZ6bRT5cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xDelgvVU5DWlI2VWNTbGQvM3BvOUt6RG9pWWErcUZJQ0dqcS8vRVpjTWhv?=
 =?utf-8?B?dU9jOURCMXRWdDJ0WnZ4djY0VWxub1NrdE5hQy8xMXJBblJVc0dXUGRGeFlZ?=
 =?utf-8?B?TFYxZVI5ZnJTcGtJTG9UcjVxakdjOGE2ZFdYNm1QdklhS1BDcW5wWlFvL1Nw?=
 =?utf-8?B?d0cweW9ZRUd6QXo3cTJma2c0UHNsY3FFNTc0Y3NNK3NKR3AyODQ3MEoxQm9N?=
 =?utf-8?B?Vmx1MDZqcnJYdlNtOW5GektWK0Y0dlFWb3VnbU05c1ljQThlSDYrbitONTZT?=
 =?utf-8?B?NGprZmVvZnowRXVLR21LSFR2b1UwZ2JjZVVHYkxZcFo1MWJ1ejZHKy9PVmFB?=
 =?utf-8?B?VTVYakw1Vm1lY2JUVStoWkQ5eElDV0pxSnp2REVSWmFlWkxnMzFvSW5GREEz?=
 =?utf-8?B?b2RUT2RxOFdXNld2ZnBWdUljQ29UWDJLUThUejVWVkJvTnJQekRkTVZuQkhX?=
 =?utf-8?B?ZjRqSUdBaEwyOTZoY3hJVUxEQmdIb0xkOWJEc1JWRDNYM1NpL2JjOGIrMk5p?=
 =?utf-8?B?c3VvWmRWVmRDUlBrWDRKYmtKY3FBY1BDTllzSVdYTHB5aHBxYVBvRHV6UVlh?=
 =?utf-8?B?MGsrbmx6aW93TE1MOXF4Y1VDZlBzYnQreHFRQ0s1Wm11b1o4Q3Mvaml4UDI4?=
 =?utf-8?B?RFRsa3Rvd091bHFFRGZtdGJIOXJWbzZvbmhya2NUTWxZRGptT0Rrb0Vzc1Yy?=
 =?utf-8?B?b3ZWSHZsNEVtRlZIYmQzSDBqWm1UM1JSaFRyMlpDRUx6OUNyV2h2RW5tQytH?=
 =?utf-8?B?WTEyMkVKaC9OckNJdEpIVWRIdm5HR3F5azAwbHJNaHhiZkVDM0h3Vml0REwv?=
 =?utf-8?B?R21ySEwrS3hOSG1wOWpJSWRmMVhoVnNxOTY5cGZwajBJczNyS3FhQmVVR1Jq?=
 =?utf-8?B?M2lmWi9nNHI0eFUwMTZoTEJhaVU2ZlJEYlZML3lQSHkyenFzRjE1Q2VWVkxV?=
 =?utf-8?B?b2VjZ3g0ZVBOREZyemFPeTRmMFVjWVk0aGVSSklxQ0dNRitPcG5PN0lxY003?=
 =?utf-8?B?OE1OcUJCelI5Zi85U21zWStLMy9WN2pPQjMwSXVhdTVqUTcwdkZua05CNHZI?=
 =?utf-8?B?TFFiY2VYMk00WVoydFZXV3NTYXNOYzRCRzVQckJwendFYUtmSFJ0WXdNNmZs?=
 =?utf-8?B?MUtzMEJ4MmNZSlU1Nm8zKytlVThST051MWZZUjJLRSs3djNCUjBYMFpWQjdV?=
 =?utf-8?B?bGRtNm9TTENyYkxpUkpRRTBKR255RW5BYUU2TW0vVlNBSWU1eFh4UmZFVWRX?=
 =?utf-8?B?alRuZU43WktyOUlYTVFRUzc3UFBRZVVCUFlmbGN2QkdkbWNEYXcyMWJSWWxp?=
 =?utf-8?B?SFNBdXdtaW92U3hzY1VKNXJYVDdDeUVKOWROZnV2UEFZdVIrSjcwVStzY2ZS?=
 =?utf-8?B?bFFhUFBJZDZ4SHlFVmx4WXk4cjVkcE9LOFZtdUJxU3dIQ3lra0s3cWdRQ3R6?=
 =?utf-8?B?b1JQKzFpcUlKWjBqSlZyWTJsYjJHMUNpZ095a3RuTW9zZk1WQSt0dGVCU2JK?=
 =?utf-8?B?eUJuVUdDclFOUTlXdXYrb2prTkJnRmVWVStCdEN6R3VmVW1wdy9mZzZEb0Fl?=
 =?utf-8?B?dWQzdmNuUWN2MUowckpkaGJGVExwc0g2RStpMW5CWGFmYlpsUks2MUVOQm5a?=
 =?utf-8?B?SFFucUV1U0xsSHJ0dXRrZVA3aXBaRUJ2TTBPRTZ6MVFYeDZxdEozc1UxUEQ2?=
 =?utf-8?B?azFVQ1I2aUNlcFUwdkQwQTZLQlp0M1dqRFl1WkI3S3p3UENvLzVaVXVPTlFV?=
 =?utf-8?B?M3Q4a0prSWJEYm1IeUwzMGRKZ1Y1d2daMkkxOW5wYWkrNE9WTzM4a3dCaE41?=
 =?utf-8?B?T3NiTytWZjN3WDFGOWZiTUY0ZnJEUXN2UjFZRFJWRXQxWktDSmRhRFUrczh6?=
 =?utf-8?B?OGNPUnhYT1FsK1pUOUhjSkc5VUZlOXlmampITENWZm5PRTM2NWNRcDlMWXp5?=
 =?utf-8?B?a1ByNU5jRkhMOXpvczdhOVJkVEk1ZG96cEFDNTJVNHBOWFpEbGIvMW16OUNx?=
 =?utf-8?B?VlBwK2xBS3g1KzRJTksrbzJjMFdvaVBGdGQ0TUx5bEVEanBmT2pJWXhnT0VD?=
 =?utf-8?B?T0pBMEdRQTNHOWRLaEd5bkF5a0tZWVdKODdrQktpTlR3VGFpU3h6MjJGbVc1?=
 =?utf-8?B?TFdmUXJGd0hlb29DdFBqSlJuTE9pOVZ5dTM0a0dTd2plUGhrdXhVVkhLL01l?=
 =?utf-8?B?djFDbGh1dFhzTkx2Q0NOWGh5Rk1aL3VXcnZoUHdWbXZ5SEpaYm1ZMzlLSWRh?=
 =?utf-8?B?bkNjWldpaTIwV1FNUXBsS0R5VjlRQ0wyV0x5VG5nWWNwa2FpZVhWYU1YcUd2?=
 =?utf-8?B?eERMd0g4WmhQc01SanVsWkZFV3didk9qNHZ1UDYzUzh1VkR0WGM1QTVnaVor?=
 =?utf-8?Q?qAW7/arIdIj8G7BE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72508ce4-e94a-48b0-5b33-08decde77cda
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:45:24.9646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY54mJM0SrxXqP1hfDZQBAmvV2YAycRdaRbK/b0r0drlhKe/0u0Ll+9Azg6LuZ6Y9/7sJB2XN1kvFrVTMu+G/ZxDKS2kBoY2ca7Gh0IdXdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5113
X-purgate-ID: tlsNG-d25034/1781862328-DBFE5ABF-465CC666/0/0
X-purgate-type: clean
X-purgate-size: 193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AD166A506B

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> No functional change intended.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

