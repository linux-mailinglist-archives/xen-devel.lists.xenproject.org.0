Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RWJsD6F+JmrIXQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 10:34:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CBA654198
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 10:34:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Qc1tllTk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331446.1594006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWVRA-0003ij-0x; Mon, 08 Jun 2026 08:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331446.1594006; Mon, 08 Jun 2026 08:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWVR9-0003hK-Te; Mon, 08 Jun 2026 08:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1331446;
 Mon, 08 Jun 2026 08:34:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWVR8-0003hB-1u
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 08:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWVR6-008zLO-TR
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:34:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a267e87-2eae-0a2a0a5409dd-0a2a4502c60e-24
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 10:34:20 +0200
Received: from [52.101.85.33]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a267e8a-af86-0a2a45020019-346555214127-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 10:34:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7290.namprd03.prod.outlook.com (2603:10b6:8:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 08:34:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:34:15 +0000
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
 b=U7WasXtvEQEf64nUiSNCRbemeDKMFD6w7UyKcxI+YKOiP2a1VkSTMAcpQqZarIwj+DhwexWsgkrQ6eCZPAx/XM9kjmFUAJyaF5D78W0hY0TcRobekcF8lxyRaj9PZzaYiev6BQgLCwf9kS20fqasAAmJwzMLvHo6eBidEtJx5QxV4+uX9pl8tR6dRLgXhQOxm5EqqGohn7+gP6n7oAE5QHXAm4S+7xkxlX5ReIkjn2FmDl8FRVTQ84bf66W9v/iFGq9YinNFIRuzsYF4x2KA1o9k0WwxsYN9N87srHB+FydL/Y9VhxufwdWmgtLJCYtEWze+rUFinbhyoAqDuHf+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k5g8zUmb/z14zj49djEo162KiUKiTLA7m7LYTuSalE=;
 b=cE9m/Aapq4nOtwhZhccdordBGhGRjG27+wEkFVkubmVeQ9cXvUx7dyzkvqfK4uS7E0Wa6bnCtszZNqAF02Ym1DN3mJob/JuYSevHRcyjP3Rez1ekbvL6J2Uo4Uy8CBYgBl3c9CJBQ8eDFwAl2V4xY4cjUbDAa3wtJciWCDASr5vrw30SefySdC2++dW8RCJy/kuqLu1ENmFJCgTfco+At5w/4HFCCJH9DVN10UgsDIQPPnR0ZZSIDwtGVolTUcST/saNkQThwVr8KtvONln+ZXxeiEQisMg2xf6OnUTpeKBtEb9pgbss81NyfQSIwKiUrHvZ0A08hl0UVsfZm9RaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k5g8zUmb/z14zj49djEo162KiUKiTLA7m7LYTuSalE=;
 b=Qc1tllTkN23x5xKrceoPC3DglcxmcDACYv/+lIjecGRx2oYb7smXJdKtyuqx0npj1TaKg/Wz+lCqWisfCRxhbYvNZGGShAC/zhzETuWoAipucd6RQktJB9kGb2QWzTWJF21P384O/grw3z+HqrzvCXP2CRYHQnFa7ZtImFYN6jE=
Message-ID: <d16b8962-a4af-4b9f-bfb8-f075cfba2f1f@citrix.com>
Date: Mon, 8 Jun 2026 09:34:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22] docs: remove non-breaking space from
 xen-command-line
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260608082440.73415-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260608082440.73415-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: f93d8c05-8e6c-4f6c-d6ad-08dec538b953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IM5TtfxZrlUq86Z2CPJ1PBr2C+dsRnV8J03HOTYWdm8j7NJXsmxJuBJSHOBblAueTX/c871m6pKRsYT740SAaZ79mw1iv2OIewV7dZqYJAUPhmtk4ajHq4S8KrZGy8Rf7EmnMrAiHyjerxk7umoBbaD17KDbhJUMFIOemneBSbYYZDa6ux6pHjp87d/l27BMOhjU03a5Xa8X1yZaB0Zd6YwM02m9uMo36tgS5GidxoFor3QlLQQjo3nYXN7IrsmMVlfJskE3xnsBlTBqdItlmJCT586IgT+flq1WNnJAbKOUFzBeIzbU3tkcGjVTEdOaDBdow1R2S/k4GttemygsbFm+/FYR+8lFsw2bo0l93RaU6q7v9DN64zCh0QrfJvmYiARNq+3xOzWGBx3H0+KQ2UfFH/6ckx7rV9MHrwcpD2JltQcpc02q6kIvRoiw++ji1z+9w1L4rh90asDTv0+23hp6AkA0Qp4+pkiCHyz51rGlYFOWmrXOrgzUvXnKVHRerpvsJ3w/KLIzhMkLza2TUnCw0wqFFqDC1jVE1z3X+lhxOb593xJShKxxKq1zr9uO6rIEJzW6iQVM3lfdAeZ5H9qFIf5u7MSE/+Sx0OIlLupi8/3DrGPhRJnVP34q7BbrPYjXSvSOEaTRdOIIRy3g2lHii4IvwgoH2i4qkjutBVVpuaH9/xbD27+lJ+WhYluU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2F4Q0JEVVlrZkpxdnk0djJkbmxhai9PVUE4OUp3eHhPTjQ4TExFRW9PUmdH?=
 =?utf-8?B?R0tGM2ZkZmNsaStFa2JFWTloK2xLK1FETC9wZWYzckNYd3NvRWw2bkxJNnY5?=
 =?utf-8?B?Z3hqZllsUGFtR2VVVlNXS3J2RVJVMW9maUhwcnhYSHpHRTB1dGNqbzRIM2Yz?=
 =?utf-8?B?MXVJTXZXVUhpeTZQc3cyUTNrRi9TeHB6eDA0R1MrT0NERDhBd2N3NmJxOGs3?=
 =?utf-8?B?TjhwMCs5eStmeG5FSFViYzZhdGUwVW9qTmpaa1MrUGxKSk5XNW10My8zY2Yv?=
 =?utf-8?B?MURyWXhhYlRtZDVoYVNJQzVySjRqbFMwSFNqVnFoakRUV2t6bXdGTDdCdUpP?=
 =?utf-8?B?MVgzcExmWUh3Rm1tN3pOMVg2S3RhWldncFRMM2F2TEhsS3lPME5vdlljNEY4?=
 =?utf-8?B?cnBtOGxHNHlvODJ3MTNjRU91YjVJUEcwbXlDdC9MelpVZkhKcmhIUlBEVzZ4?=
 =?utf-8?B?YmREa05KbjJLNExyaVNYaGgrV0dISFAyMUpEM0dNeXNpSFRXdm9qdk5OWG5O?=
 =?utf-8?B?bStoSE10K0IyM1BleHhCWlJQOXVNZTJCUDFZYTkwMUI0UG9FSDBicXdMTW0y?=
 =?utf-8?B?Y0FOVzBLRzRxMDZ3TStQK1JSNVJkN2VnYlRVbXpQMCtHdnJBYlFEKzdNWnkz?=
 =?utf-8?B?RXBuOE1wOWlMOUU3OW1PZHNxUnZmNUhuTVozLzJ4WmtvT1VlK1JYSjFuMDdJ?=
 =?utf-8?B?UW5DUEpJbi8wdEpRWVBVaW5BWHlSMlVDTnVVVE9xa0dYZzN4aytWMjVMQ0c4?=
 =?utf-8?B?dXZ6QkpHaWlDcHAwc3duMURiSjV1azJRQWdodmc1dEU0Q0lGbGxnNXl4UG5Z?=
 =?utf-8?B?UkpsUFZFdHF0TFB4a004WDQyRjJzT0g1QkRWVkNGcGsyWlJ0eC9zQlA2enRV?=
 =?utf-8?B?NkFnSE4rYlR0TEVWQlBaenlWZzJiZzRHeDF0TDAvakxjNVk4M3lXdm43TzdR?=
 =?utf-8?B?YTdvckEyamZiR0JUZU1wRlQzMm1Wb09VUFRBc2U0MnYxbnVkdGljcVhRMDZB?=
 =?utf-8?B?TGRDZTlzUHlFYWZ0YStURS9PWkRjZ0YvSmdIcnVCdGR5cDRGYzlqa0F5WkRG?=
 =?utf-8?B?elphd3hkcEF6ekdORWFOaWNlK28vVjhCRHBOZE5reFMyMTVZWU9yWUpNZjlF?=
 =?utf-8?B?NlNxd2R4aTYvem4yMXlSNnRqbFRQaHlBWWF0WTRZWUJ6QTd3UGJIck15VjRJ?=
 =?utf-8?B?SW9wazQxenJKRUFJaGs0WU5qb1pvbHQ4VUQ3SExhRWNNUktWT0xnK0R1Mmlk?=
 =?utf-8?B?RmxkbDR4eGdVaFhnUXpOd2ZXWlZadkQ0TnM3K3czODdLSS9LT0tZOGxjMk1q?=
 =?utf-8?B?QjNhZFZCRVo2UzN3cFZyWDlBTGx0aFQvcUpFa3JxY3VZZnk2UXFHV0puTTdz?=
 =?utf-8?B?ZTdUZi9sMjNqZTlmMGlUbTRIZWZhY0pKOC9ST3JRV0k2RFhwd2F1YldLMXBj?=
 =?utf-8?B?T21yVWpNUnB1MFhlalN2V2FlVzloTkszSVRRRHhhbGRLQ3FUOHpyS05qVkZT?=
 =?utf-8?B?Ni9xZEZmMmF3T2VBb1FTZXEwQUJmWW1LY1A2MnN4dkxqeXc0T0g3Sm9yWU5k?=
 =?utf-8?B?eXE4djY5akxVT2VqdmJpK3VQbXd2WWJjYnV0L05BamVCbmRZeEtaaC9VS1JK?=
 =?utf-8?B?c2tLNVQwRzErTEhPTjFZU2lNTkxLYUxhbUJzb0lWNjBMNm9hZHZiMXhvRkpw?=
 =?utf-8?B?ai9Fd05nall4eXgyZGVmQVNrNC94eUx0cGMrbnF3YjhXRG5SQW5PcEZCMDlo?=
 =?utf-8?B?WnVVQnFQeExKa2dNQlc4SkZrZHc2WHFBYUx2cm5CZnIybVV5VXIrSmtKKzJh?=
 =?utf-8?B?dmFnSUNGdlBtSTN0dWIzOHZJUTRlMk9MTGkwQkpJV0NSUFdDOTQydlUranBQ?=
 =?utf-8?B?Z3dES3k4dGNPd3pLNDFJZG5mWkErZXhGNy9xOGRZMnRiOG9uaHJrMno3d3Zp?=
 =?utf-8?B?MWVzbDIreVNTU1J0N0pkd3FWOFRSSEp0ZjBwSmgvZEY0MWFibEFZVzV2L3dv?=
 =?utf-8?B?TGU0UTluVy9tdzArVDVkbXBuc3ZHcWxxaGg1dEVjT0pkblErMEpXUDRkZ3ZS?=
 =?utf-8?B?bGh5SnJ1c3h3Q09CWTc0U3U0VzI3UGJjQ2c3N1pzQU14TE15WW5vSnBTTkNU?=
 =?utf-8?B?WG5ScEh5cXU5TzFqZ290aUlNOGdyaXhOQWhZdFpYVEQ0TnNWQzhtTjNQdlVH?=
 =?utf-8?B?T0p5USs0VkdTeG9Rc1c5REU1R2YxK0pVb2ZuZ0pxNGRzVmJodmRaak9OWWFW?=
 =?utf-8?B?R2VibXVUeXluSHFLc0JQb3pUV1NqZ2xIR0FuNnZzS1NNaHVndmlIQTVMSkRs?=
 =?utf-8?B?Ukk5RlhPSlU2TTNQdjd3OUhWRUJLZE13N0trbjNRNG15WEtRM2MxUVpUL3lI?=
 =?utf-8?Q?z94PY0LGtqaTCXzM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93d8c05-8e6c-4f6c-d6ad-08dec538b953
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:34:15.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uNDtGVxvy5l/m85r6AyaXyAx/GzNXKdECSBTgJWj1ldCjtwlNujSwTYW17WVV5godnmF08BwaMqJSsbkbfzO3l/XUZCu193gW95QgOXvDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7290
X-purgate-ID: tlsNG-720697/1780907660-A8D7F161-33775145/0/0
X-purgate-type: clean
X-purgate-size: 278
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99CBA654198

On 08/06/2026 9:24 am, Roger Pau Monne wrote:
> Fixes rendering of the generated html.
>
> Fixes: 31d9c88a3857 ("pdx: introduce command line compression toggle")
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

