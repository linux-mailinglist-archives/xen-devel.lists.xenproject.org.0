Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q1SzAXf4Q2qpmQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 19:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB266E6C55
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 19:10:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BRCGeh+i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349270.1607136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webxM-0006dC-GF; Tue, 30 Jun 2026 17:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349270.1607136; Tue, 30 Jun 2026 17:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webxM-0006bQ-DF; Tue, 30 Jun 2026 17:09:08 +0000
Received: by outflank-mailman (input) for mailman id 1349270;
 Tue, 30 Jun 2026 17:09:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1webxK-0006bK-N5
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:09:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1webxJ-000k9t-Oh
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 19:09:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f81d-bab6-0a2a0a5309dd-0a2a45069c52-24
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 19:09:05 +0200
Received: from [52.101.57.42]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f830-08de-0a2a45060019-3465392ab7d6-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 19:09:05 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH0PR03MB6019.namprd03.prod.outlook.com (2603:10b6:610:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:09:02 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 17:09:02 +0000
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
 b=eCNXqNEKTPjjO5UMyTFSbiIC9t7rQ2iUCLL6+XTnzBRRyVSceE88+uWkQewRbDwPQPKKvet7DjNOq+nLJMn+klTqfu897EOWhtl4pO7eHBwBmFsgBOq6ykHv/uIToeKDGXunWh5lOQdMA9aJby0nUKWMBMFOi5LRC9sbv70THJHevY89BmPaAmaLJY1+iorNIPPKY0PCxoVZwJqjk4Ro3H4/ZJwk9USVuuV30UbrkwWP8ksj9Q4we/1WvYueodWZIImny6Alf+x2Pqu/DXZ48oLDcXdV7bcDKcO+/LoS1NangHm+HuK2RDdNqu5DY/lz9g3lz9MHP+mfUzupIBVEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucFCkASotLFZ+/lSRlPe0gjVFCije0xgmN+KR5/eGcs=;
 b=wOzg6l8P+b3K96jAeET+VRmb1VzddRxgeYi9AIGOyV6Kt7/bDIRjpaUduDCOXsR3jIM/K3+yxtHWfAqoBL163kg7ZFmbLS4HOgylNvNf/ZnyUad/5zhQk5RU+sBdRghiyxvEBS91KOu1XZGJ1nrIjFMRRCKvg5EfN1fh/xIje+dAf4OMwtRfdNXf6/Ixg6hnRboOK34J07yCT7FxPU85nQN8CApA9MZ0Mc3IMp/aUmmC9vfXDf38CD3EMUTyV7NznqkGualrdh/adkrVpZ4yf4HVY3AGhhpruFCvYQdaF912dtZcAgCcBWef5MpqFyIAJBSxExyuD/IGhsrZnvJd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucFCkASotLFZ+/lSRlPe0gjVFCije0xgmN+KR5/eGcs=;
 b=BRCGeh+igRcI04p7Fexdceg/xbdohqNDytzHKVGWKOOCredlor81rPx9NcWZ+X9pxTlivWkV4+Ad4kf86br5aIs2NHHDuNVwjQKbXqKO5ps/smHsxOuWyD29dWOOYa6bZzGVWWlk3p30MDTUM/cugJ00lczQgEtQDTOJ+W/RL1s=
Message-ID: <f746831d-c40b-4af2-a69e-f6ec0f52b78f@citrix.com>
Date: Tue, 30 Jun 2026 18:08:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 09/16] libs/ctrl: Allows writev_exact to change iov
 array
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-10-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-10-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH0PR03MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 734802e2-62ab-4275-c134-08ded6ca489a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	bl0ht4e72iS7jtTobBddkmQQFFWjbzxcnXUZikzLhisKrBcoBCxUdm//UeB86BOJgQbalXFpj/pVnkENSleOl+Lj9sVpGWUjdceJMBoH5C/Gka2xDt4oshTbcm21xAoy0yKSuuWR7jx57G9M6AszH7l74R3/9TX2d+LjZqK4EcdDpfJ06UY4Vc7/jG+bP0xOBi5OiMQtAasUyycXCZVhndnXzwkPSMaab16LAUloRfDY3hPd/h6t7l3CG42xuuA2I0qSrLannU5Z2H8ncJlIUSNJWNdkXq+pteZfGvXqDKo/tZMs3O+g9lcL7U/clt+KqmcPSgGn7604C+qzpiRQP+mJdwXyLD6TxTe5p2aZuOwV7SeOGvF8/dvtyOaOS6ltIy4yT8tOB3lwVK1V4ChkYZxGl4pooSlmtJMV58bpacBjw0RSdPPRExdOLtXZ59/e7xs7x9skt+y7squY+jZHNNK9liOXLuhccCO718xDwDN33WUHrpK2Qa8EDw1Fz+aXGL9rNY0P0HWAwsXhIMaBX3ljNpcz3tMJSQfYb5jW8PX8NXYQOPj+ILUPREgvRXVVM1o+Vdb5PfeiZSln3yx8EOl+ZOBOuT8/Re5X5a1sNXBYY/UvAPuGS9yjYQqmzivWpL9Jmcnrk8khIEUVqmRNkWDuK8dg2vU3ZLvbC5YV9JI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2ZCSC82ZUZVejBqYkQyYUx4bmNYZFRuTzE4dnRlTnczNXhFZVY1SytmbVZM?=
 =?utf-8?B?MVc3UmJKcUpReWlaZWViM1NWcnNDaG45eHExQUxzZ2hsWVNnVmpCQ1dxS0lm?=
 =?utf-8?B?VG5QVUlUZ21zSXplQzJLa0NRaThURU5KRFE2dXdrRnhRN25WR25tWERCcmlU?=
 =?utf-8?B?WWJqdE9zZHBuSWg0bVJ1YXVtdkpOTHUyQVZYOUIyaWg0alg5aklZOEk5alJG?=
 =?utf-8?B?aTFwQ2lKWm8wM1ZIeUVKbDcvM1pUQ240bDQ2d0xPWFNWbThmUHlMcmNFQkF3?=
 =?utf-8?B?NmtYUTRBUGU4d1Q4b1loNVNwTFEralRyK2hkTFo1clJEUmhQNDhEaktZeWRz?=
 =?utf-8?B?SDZsbWNxRjdiTTRDc21wa3UxdVRkcW14cmpCRHd1RnNKaDA0RTZsY1FyWkls?=
 =?utf-8?B?SE9EMXBKL01lbHZ5aDJvMEpFWlBkT0s5TE9Qek5Ja2pXcUhPaXZVZHU2b1hu?=
 =?utf-8?B?MkdOaENFTnRjclBlT3FBeGhVaUdkWCtlYnRQNklGaFJuOTFXMCtJcmhpK2lu?=
 =?utf-8?B?b0hLU1RlcU01amZ0WkZreGxXMnRVLzR4d1NHSjNQUGR3bDNycmlhRDhWekFD?=
 =?utf-8?B?TTFLZVM2Q0ZDYXlkUU43TWlQSEVMR3BxaU5jeVVoRUNQM0wzc1RRZ1g2TGJh?=
 =?utf-8?B?MVZ6UTZOTjJxK0YxbElYVTdDbFBQcDhSRUlZZmtmSk5iT2Q1cjAwakdmbEY5?=
 =?utf-8?B?R3UwcE5QbVZqc3Z2ZWk5SEtZdjhzMWNhWExaNEw3czlsbkE0bFM2SWp1bVNX?=
 =?utf-8?B?NEtxMWVwVmJGUjhzaklxL2JPVlhDOWR4OEo2c3J2UDBXWHJlUkxVU01GR2ZC?=
 =?utf-8?B?QjBtWEJEWUVBS1lDeFRyUkluaTRSWnJoOXJWa3M3TEl4MUM5d0lUVHhZRCtk?=
 =?utf-8?B?ck92TWlrTXhhQ1Z5SnY4RnRSYkM3VHN2Ty9JRGtoL1NxbVJQZjB1MkhQdDIw?=
 =?utf-8?B?bVJZZWYwME9tQnJpamY3RG5kdlBvSWZ6OXI1eDkyNUl4TitmTS9mOWIyakx1?=
 =?utf-8?B?aDR1K1E3R0J0Qk9tQnBUQmp0UExHczRydjRiSFVsTno4cjNyazd5S0JadHcy?=
 =?utf-8?B?NXhjNnpuOEJDNUFNcjJON2VJYVd5RklISEtnUTROdytoMHIrMURjVUpjaTli?=
 =?utf-8?B?UVptMDRtcmdnRFBTU3lCemlFUDl1VFZ2QncxNUFTaWF1VjZYSDBCTVIzOUFx?=
 =?utf-8?B?TUs2TDhjSTZlcXdQQkNUNyttdFdWcDlFZ2NnZEdnSnV1elJ3clo5Wk8vUjlK?=
 =?utf-8?B?VVV6SUQ4RldOc3pzRnZCNm5oS3lhUHk1SUhhM0pHQXgyWFhWY0hFK3NTaDlL?=
 =?utf-8?B?WVNJYlp2TExnWnp3NHNlaFB1cFg0VGVvZGp1cWt6RitrRklLeVVoR2dXVW1I?=
 =?utf-8?B?dXpqS3BaUkZzNFVhZW02OEJmOEN6aUp2dE11Wk15dVE2N1lVYzA2QktvOVo2?=
 =?utf-8?B?UHk0RTVZOWFoMXRFbEdVRXNLWGJNWVk4a01UcVF2L1dTdWIvRVc2M2NFRHk5?=
 =?utf-8?B?RFdZb2NzU3RFYmpiaGo0Q21LR3RmbnJIWW9ITVE0dzFJZkpEVHVxKzgvR1lR?=
 =?utf-8?B?cTNRZUM2SjJKQmEzZHFpNUZHbEhQUWhHRzQvd2pRZ3ljZkVISm9LQ0JscVRR?=
 =?utf-8?B?Wm5Xb1NXeC9WbWR0VkNzc3ZoMkVlbkFDdS9GZS9SK1ZKWHVPNW1UOU1VY2N0?=
 =?utf-8?B?NTRWbHZrV1ByUVFxRGsveXp2Qis2eTNoWE5INExJUnR4aEJOTVFOVDFPbExO?=
 =?utf-8?B?a1QwMno2RVJMSFhIbFo5a3hPTDRLWkd6aTZKL2puY0hqUmYzeU5qSDd2Tk52?=
 =?utf-8?B?NkdGR0h1MmNheVowMGRabVc3cEhzRjNVbEwwbjlMbVBSa0ZMQk1lSkdYdi9s?=
 =?utf-8?B?Zi9DWDZEeEZwYTF3S2xYK1N5RlRQYlo4dWd4VzV2NitSRFVlYkRJcWJHdVdt?=
 =?utf-8?B?citHVmJZeWVIMURUN3FGaU1qTjYwdStNTjh3K2hHcVVBYWtWckJ2c0ZFSHRt?=
 =?utf-8?B?U2FLTEllRXRKSkhDN1lPV1k0M2RrbVV5QU5RVERma2FPN1NIVEZwU2dwdERz?=
 =?utf-8?B?UXRGdWdNNEJvV2tnSm54Z1hVR1Vjd21uTERDTlVlVzZJUVBSYnRxb1BwZ3J0?=
 =?utf-8?B?eEJOMHNXVjQzR2xNK3QwYVRudWJYVzY0a1RaclhYN0JTQkQ1NitueDFwNndv?=
 =?utf-8?B?N3l1SFJwNmhBSk9KMm9mZHhVbWVlakhuRUtLTUNaRlp3RFdJLzcwaGJkeXFQ?=
 =?utf-8?B?WWN4bldGSFZMb1kxbjdIOWpQaWprVlRvSksvZ0VRaTBTSmxTUUFaa01BZ0Ja?=
 =?utf-8?B?ZzJFZjBlV0dCM0NyWlVBdyt2Kzl0YnBRL09UcFB3TjFPd2tHRmtVemhleCtI?=
 =?utf-8?Q?mJofEyexalNC0iC8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734802e2-62ab-4275-c134-08ded6ca489a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:09:02.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwrcMXFvpTpfqgk7CrSu8ezubvH13WrWxNBf3zM20e0LI8FSkBxGaLcm9FYLw2kLntV3eWHNYEq1hR6bYe8NOo8gN86zxkPpQoJq/JVNCfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6019
X-purgate-ID: tlsNG-16d1c6/1782839345-F97EE68D-28C4B61C/0/0
X-purgate-type: clean
X-purgate-size: 879
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
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
X-Rspamd-Queue-Id: 5FB266E6C55

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
> index b5892ae8dc..3af996e900 100644
> --- a/tools/libs/ctrl/xc_private.h
> +++ b/tools/libs/ctrl/xc_private.h
> @@ -383,7 +383,7 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu);
>  /* Return 0 on success; -1 on error setting errno. */
>  int read_exact(int fd, void *data, size_t size); /* EOF => -1, errno=0 */
>  int write_exact(int fd, const void *data, size_t size);
> -int writev_exact(int fd, const struct iovec *iov, int iovcnt);
> +int writev_exact(int fd, struct iovec *iov, int iovcnt);

No callers care, but this is written with a const pointer to match writev().

If we really do want to take this change, then it needs to come with a
comment saying /* May edit iov to cope with partial writes. */

~Andrew

