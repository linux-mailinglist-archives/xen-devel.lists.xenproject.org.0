Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZEzWBgkkIGqlwwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:54:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906C637B9C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:54:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=WOAfmRU6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326181.1591609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUl6w-00019R-7h; Wed, 03 Jun 2026 12:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326181.1591609; Wed, 03 Jun 2026 12:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUl6w-00017o-4Y; Wed, 03 Jun 2026 12:54:18 +0000
Received: by outflank-mailman (input) for mailman id 1326181;
 Wed, 03 Jun 2026 12:54:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUl6u-00017i-GN
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:54:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUl6t-007GDr-R5
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:54:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2023de-bab6-0a2a0a5309dd-0a2a45099ed0-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:54:15 +0200
Received: from [52.101.46.59]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2023f5-2497-0a2a45090019-34652e3b8a90-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:54:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN6PR03MB7549.namprd03.prod.outlook.com (2603:10b6:208:4ff::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 12:54:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 12:54:10 +0000
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
 b=SdPvP9HgQUHEBtdZABpkW1ZQeHCEcRdjPO++JewEd3LEUEet5/OTreBk4ase/Ig4szcrodbJwNDeMMJ2vI/mr5RA5q6hFRhuGYIUoqVh/QBdjJKoDoNE86unPTXkz+6Ti/4u1tKW69aPbLTuSxYou6p7jF5CRZofJ6lsKXOEZTsPT3qVWA5n4iFpQf1ny072KL3uN/jJTq2teso8tBXXYjIfwMbrpDEL9a778+QJ0wzeJTuW1pSYlWCSDx4bHK4jbfwjfIW0vTE1SNCkgbSDR0QFyH+0pu7XUVlJuTiRnV4JmYXB8R88nUvsPbNkpuLUYerBLjlA85KmbCu+GIp1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL3RIXDMCtM0cBuZhK+7J823er5L2gyNoH7IMykRSPA=;
 b=Xl4D8G46IyXtG+hJvS5quGKloCt7Pfa9C4Nl16Qv2zsdJU68tas7A8QipyQcQaRQWGZcFEKAx6hu+m1TsWbMgY/rfHoFxsLrMJFuYZ0LsdeZr6mZn7WE2DT+WciC9XaOJsMwdDxGhHchc2PGUdCET/aNhbZDwIZqlRDMmDCUZFvz7f0ny3Hsdn/yABMe9iJ2XG7A6JSC7XkPvftDniIg66ZSVvWxVKwOTEIpXt6b3bIukHHkAKx8A5Prn5BEFm7CyQprXkK7dkybctMUXDqqeGrxgK8XF8YBbweuyLA3orOLk1NqKZHkH5FHiYsXpJzFNV7ZxSEix7oho8bMSLLBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL3RIXDMCtM0cBuZhK+7J823er5L2gyNoH7IMykRSPA=;
 b=WOAfmRU6r6GLoJs1Pazcu52EJ8ohvsG62FeVdFAsNue1x6auO9qRRdbOgb7j8d/7vHm2rCIhLBlbsTgiuadaYx3eyVWRwT8g30T/mtWN+x7jwpkz1RVFj3k2JR7bjLV6cl1iJfH1wrUalMEFq3YUWcX7MRN0J4EoBMTaS8jgF3Q=
Date: Wed, 3 Jun 2026 14:54:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
Message-ID: <aiAj7duOGUAkbB05@macbook.local>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
 <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
 <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
 <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
 <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop>
 <b443469b-01fe-4196-a79f-811bfb6e17d8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b443469b-01fe-4196-a79f-811bfb6e17d8@suse.com>
X-ClientProxiedBy: MR1P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN6PR03MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d75de7b-7e74-41ce-82b1-08dec16f346d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|11063799006|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ihn7pLTmIE2kn10Z3myL9YBd5oDs/0agz/64mEMbZZ2c3MS+nTE2Lln6keCX55pdlcQ1Z3fiE+1p50is/wbOvv4OLkGAIaaf9pm3/+REip9GN2Jl/evrlZFAhE2zGpO4zxEug25oPyhlqK3+XP4xDvp7pfL5iZXQpW7cpgh33nlUhgaUQE63//2JR05odzaX9IbgSo1bMZ3eQWaLcTeJfCK6f8NhLdvYu6FEQovrJkOdg1X1B/ZWZONVAFZ10PUYmyRNMCD2FiHneL2VmEv/nSO5le1NYfhZEVI9aHkRcH47qi/0WS0v+kFfa2I2aI71IIq8TRL3daj4vLF5H3eu/88nEvNZPNEnAravTvE/9clZvovI/kkoBOFLuq4kOOaGmZpJyeI3qB4GUFk4q1U952APK2Z8zJtfmN9HeBz7etLUV/40Xctn2nyibINVFRjXL64E99rVt7db9i4EhBQ9iRx51uLut/oSx3jlCINgta2XdLvAYlIN8pZLw43VPQi+6C+fV7x57cl4nJXSH/7NAUY+lFerq3oNTBZme3C3Q539SInR/COlnn7/lk7k8n7O21nTeoCKj3Pnvir6c3hEhea15fJuJBCUfKjc9xg6k6qnpElVezT1MCIne8Z1Dv5fCT+1MPdZ08kiFhEc2Q3MCVnTEMZYDzoZPgS15De0W6IUgAFcQv2fiu7WvYmO3LH2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(11063799006)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3lDbDJxL05hTVdmbHpUcE5ZNE9wdVl0Q1RLQzFrZENXSWYzZ0FPemFPQ3E4?=
 =?utf-8?B?YWdySGRZVnR1RW5GWGcwWFFER0dEOUhkTmNJclFMWmxrc3ZQdjJPaWJjbjgv?=
 =?utf-8?B?ai9Nb2R3ZmJJb1VtWTEwOWo2aGNseHllUVllb203SldCdTdjd2k0Y08vZ0tJ?=
 =?utf-8?B?dVBaWlFsWmpnN1ZleXZwL1JiSHdTZENCRk1EaUlSd0NpY0VzZjZjMnA2SmJw?=
 =?utf-8?B?VURBbkJ1WGtxUkFMbTFQd2dRL2E3TWRiZkVzM2ZreEl6WkVxNkxtMkJvSXRx?=
 =?utf-8?B?UXRuZHNLemtmdjREcFZnUkFVUjlBZ2c4cUU0NG4rOXprTkFEQmovcXdrK01i?=
 =?utf-8?B?V2NmTElDVFdoK21LNnZYck12aVJ6bC92aUxpbzl5bjhGbG05M0xOczVYRUMy?=
 =?utf-8?B?eDVKSzJKWU4ySTNQMlgzRlk1S1NNd0lVMk43VUNjWUZsWko2MFlYaDVONGVD?=
 =?utf-8?B?Rk9PakVYb0E5RkJqUUVHOWJhRlF1cngyZlV6RS9tMGYyalZuZzk4QUxDeFl1?=
 =?utf-8?B?ZE5SNlZMaERCMVNIdFdwWmc4WGV2b2ErSWplTEtic1B1LzdXQURMY3F0YVht?=
 =?utf-8?B?MHI2WnpmZG9udDRoOXhLV2dDMVdUWGdSb3ZLbmlsbzJMZmhRNzNmVG5JMUtx?=
 =?utf-8?B?RXN1Tm81eSswanNGTHEyOWNQODRtUmZ2NFBGOHlqZ01xaUwybDlFVnlsSXpt?=
 =?utf-8?B?RkZiVGUxVURVYkF5SUlOdjJ3SzVMSnc0VVNSYmlPUW5wMTVSNFZBYUhsQnJG?=
 =?utf-8?B?dWpsYTV5dyt2RmVVUWVwd2RQQjZRT2dkYmN0cVhTSUd3TjVRTXNMRXBkN0tX?=
 =?utf-8?B?cDkxZlIyTTJxbGdMRHJESG9kUFEzQVY4UTZBUVU0TkJ3c2NWb0diOHhMUVZs?=
 =?utf-8?B?d2RJVDJlTXF0OVduNEJlaTk4VlNaSmdnWGxldTFMcVgzZ1pkV0cyOTRvenVI?=
 =?utf-8?B?TXFvWmN6UUwxM2ExZktUWDh3aXdMa2wrdncyc2NXelMzR21OdFBQWm5XU0xy?=
 =?utf-8?B?NjlST0E1cEprcXROditMWU1uTHBKWStpVGNwN3NwdHE1Y3cxZkJCSG80OTVO?=
 =?utf-8?B?NGFXRnE3MnEwbmVKR0ZMMFh2N294TytrWUVSZ1JnVEdiMVpMZVgrOXB6OWlv?=
 =?utf-8?B?SENycm9IRXE3WUN3Q0QzUjZONHVxbzd3NHJGT1hiL1ZqMWpqdWlaS1o0bnBm?=
 =?utf-8?B?aEZqN2k4VFlNRHVjb05Od3MzNXphU3VjWGhQY2ZsTGY5dmwwd0s1OFRObk5Y?=
 =?utf-8?B?aWRVMzZ6c3ZMS3lHT3ZNcnRSRnl4REFKN0tmVGJTUTc3OEtGcUU0Qzlvdkll?=
 =?utf-8?B?VHJKRk9GaUp4RzZZZGJpc0JCQ3RmRUVqWTRmR01FZWl6L1Q5S1UzRWNOU1ZB?=
 =?utf-8?B?WjF3RWZiM1pnRnZ4RlhjVWtraUJBVi9WSnhUWFJwK0pnQkJYK0k2cjdWREp2?=
 =?utf-8?B?V1RjUDdoVEZDeUZZalJBaTg5elQwNlVGTkVRL1E4YTFybVM5K25ManBuemlL?=
 =?utf-8?B?UzkySDNqYk1PQTh4QTh2ZzhJbWV0NVc0R1ExdmwySVpjMUZvQjRUVUU0UjEv?=
 =?utf-8?B?R0xmZXFYOHJoYlNjVzVUTk1mWVFUVm1tZW1LaEhLdUlXSmg1L1lNWWlEZHhh?=
 =?utf-8?B?VXo4ZlJSUy9VNlBXd0Y2M2I3SDdGc0dnc1JoUCtpSytNK2hyOWdKR1ExNnAx?=
 =?utf-8?B?Nk4xM1I3UlBHNG8rbndYbDZpTmZuTUY1d1ZzdjJEWnFkdXNRUFRvM0FtcC83?=
 =?utf-8?B?Y0ZZellmaXZCZkhIcVlhZTBUY21YNUYrdlc1RlBqOEd2WW1NRWo4SThxVkVz?=
 =?utf-8?B?ZDQrcmgwL2dQbFBFRFpmUEJDVHNrR0Q4dlB0UmdBamtQSEQ2eGNGRWJDNEtG?=
 =?utf-8?B?T0JQNnliYTBJVVpVQWZkOU9DalJwRk5KMWFWM1VBSmF1M25kd3JFdlZ1MVpW?=
 =?utf-8?B?ejN2MEwwbmR5OXpZSHJsb1NIQkZZSmI2OEZod09QYlp4VFZybWZBa0RwcHRk?=
 =?utf-8?B?clRjUXdhWUdrMjJUdy9uaWw5UUNkWkliTkt2bUhsWFl2Y0d3RUxVWGlhR2hR?=
 =?utf-8?B?SzhVTlhOaHdwL0tQMUgveGxxV2xDbEN6S0g1TStpQ3o3V1hqZTY5ZkxDb211?=
 =?utf-8?B?ak8zWUQwSUUwSnc5d0tUZE00VGxlNHhsU2xpZkRuaFRRMUg4dEx3TmMxdENq?=
 =?utf-8?B?TGU2bVRHb01ZTy84ejduN1RzRUFZSGFueUlxYm4xT3poVDIxRldZN1BpMDhG?=
 =?utf-8?B?NGtMSUJmUmRpN1dUdlhlQnJxaU9YMWZESDkveElOYjZ0WVp5eEM5aUxBcUxw?=
 =?utf-8?B?VURqQ2JZUXA5c29FTVNsd2owSkNDenlBTndOQzUzb2J5UVV6aDB6QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d75de7b-7e74-41ce-82b1-08dec16f346d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 12:54:10.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unyMzA2j+Zr8t3DjrRokoSFoaNHD1m1ZGkBuVyfR18pwbw0nU13Vsy2/Ltx8ihV2Bp75tZoivGu+le5DXSKd3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7549
X-purgate-ID: tlsNG-bad1c0/1780491255-40D67A53-17483D3E/0/0
X-purgate-type: clean
X-purgate-size: 4065
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7906C637B9C

On Wed, Jun 03, 2026 at 08:04:25AM +0200, Jan Beulich wrote:
> On 03.06.2026 03:41, Stefano Stabellini wrote:
> > On Tue, 2 Jun 2026, Jan Beulich wrote:
> >> On 27.05.2026 00:12, Stefano Stabellini wrote:
> >>> On Fri, 22 May 2026, Jan Beulich wrote:
> >>>> (extending Cc list)
> >>>>
> >>>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
> >>>>> --- a/xen/drivers/vpci/header.c
> >>>>> +++ b/xen/drivers/vpci/header.c
> >>>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
> >>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >>>>>              gprintk(XENLOG_WARNING,
> >>>>>                      "%pp: ignored BAR %zu write while mapped\n",
> >>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> >>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >>>>>          return;
> >>>>>      }
> >>>>>  
> >>>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
> >>>>>          if ( guest_addr != bar->guest_addr )
> >>>>>              gprintk(XENLOG_WARNING,
> >>>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
> >>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> >>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >>>>>          return;
> >>>>>      }
> >>>>>      bar->guest_addr = guest_addr;
> >>>>
> >>>> Well. If I'm not mistaken we had discussed situations like this (long ago).
> >>>> Imo the added verbosity gets in the way of readability. If we absolutely
> >>>> cannot or don't want to deviate such constructs (of which I expect we have
> >>>> more), then we ought to consider alternatives (like changing the variables'
> >>>> types in the case here).
> >>>>
> >>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
> >>>> shifts would be okay to use with a bool operand. What's wrong with also
> >>>> permitting this for other operators?
> >>>
> >>> In my opinion, if we are going to treat bool as its own type, it makes
> >>> sense not to silently mix bools into arithmetic with int types. I also
> >>> do not find this patch less readable -- I actually find it more
> >>> readable, since it makes it more obvious that hi is a bool.
> >>
> >> Well, okay, we have different opinions there. This reply of yours applies
> >> to the first paragraph of my earlier reply though, despite its placement.
> >> What about the aspect mentioned in the second paragraph?
> > 
> > You mean "then we ought to consider alternatives (like changing the
> > variables' types in the case here)" ?
> 
> That's another option, but not what I meant. I simply don't understand why
> some operators are okay to use with booleans while others aren't. Adding
> (for example) booleans can be quite helpful. Take this example from gas
> sources as example:
> 
>       if (overlap.bitfield.imm8
> 	  + overlap.bitfield.imm8s
> 	  + overlap.bitfield.imm16
> 	  + overlap.bitfield.imm32
> 	  + overlap.bitfield.imm32s
> 	  + overlap.bitfield.imm64 != 1)
> 
> And then see how the added verbosity would hamper readability:
> 
>       if ((overlap.bitfield.imm8 ? 1 : 0)
> 	  + (overlap.bitfield.imm8s ? 1 : 0)
> 	  + (overlap.bitfield.imm16 ? 1 : 0)
> 	  + (overlap.bitfield.imm32 ? 1 : 0)
> 	  + (overlap.bitfield.imm32s ? 1 : 0)
> 	  + (overlap.bitfield.imm64 ? 1 : 0) != 1)
> 
> > Other alternatives could be OK, but also this patch as-is is OK to me.
> 
> I'm not going to veto it (not being a maintainer of the code I really
> can't), but as per above the transformation imo is setting a bad example.

What about getting the BAR index based on the register value, and
hence avoiding the pointer arithmetic plus the boolean type addition?
I think that's clear and doesn't violate any MISRA rules, it would
obviously not settle the discussion about boolean type abuse as
integers, but would be fine to solve the specific issue in vPCI IMO.

Thanks, Roger.

