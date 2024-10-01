Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF398BA28
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807999.1219780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaY8-0000uQ-Gs; Tue, 01 Oct 2024 10:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807999.1219780; Tue, 01 Oct 2024 10:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaY8-0000rm-Dr; Tue, 01 Oct 2024 10:56:12 +0000
Received: by outflank-mailman (input) for mailman id 807999;
 Tue, 01 Oct 2024 10:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOtZ=Q5=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svaY6-0000rg-Rq
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:56:10 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c191d658-7fe3-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 12:56:05 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 10:56:02 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 10:56:02 +0000
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
X-Inumbo-ID: c191d658-7fe3-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP+Ebn/6o+3wuojRyOQhNt1TctCqxV8hndwCuP+X/KccvukWtESi0JF6Qo8v1dSqT3ZklU+EFFkq/ImINOzAVMz3K1YxAyGB1V9fL1Gqi1x04UV6Xf7Os441vRfZeNXGCcJ24UtwxFM/4mlyRcLWUu2dUeeVK+WDWDJDP5BJ4p7hM5Z0JJQDhNDdNOlyrBhzO5Mw4Q0/lPpdX6f20gJnT+sQBkI8UZtOBsU+YV7SpIhbb+OQFQVWxl62OawcpWBdH5bpzjeNky9UveP21Q6tur9RbDnVDEV/tGQWk5TSOx4wqnbzOlBgoBH7lXcQ8iOR6P3YH00zGYnZLE0KHfHwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY1cWoeqTg004FL28fLqPm2SsocyiN0Sm9IalwiR7dM=;
 b=VEthfYFGT7WWbNw1tGClsMl6zhkm/0donYKycq0+XXBk7IfWcKMJNK2UX2BttkD7M9jZlSe7Kh+4x2d/YTyHwmq/YwuBkwvfp4A6BBpso6teOQBvwsJy5ADYyQoFtOw40ga0YoQEof7eyaa3/ul4IiInqLq6OCWroktTEag7avkfvnNhUfektThPMBVhRpb52e8kfQidSoWRHfVVWy44GlG0bLEhg2m/1Q0IY1ouQJhG3cmi9IlUAqeVTRm1ccoh0+F2ekt/af4svoIZ+FAUVZIJZ6NlxkOgncPbPv3yAZS8mpDYoZ6s3O1GxMCP2p8wskd5pdkyAjnoAKi6BiZZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY1cWoeqTg004FL28fLqPm2SsocyiN0Sm9IalwiR7dM=;
 b=l1wjGEDkOHnhPjXIn03wBu3JAOMQJYhd0IrnWADtDAgzdN81eRVeRiwiVnSNJVKz4gd3wRSh5PwJtP7uoGE0hCf+r8zSM1FSyzU6xhihm2R3CKnf0dNrL2AtMpP8vxunzUhcDaO+RJcZjrD1jLdEdTvMudFwbzvHJIsnxBCt3b+Kw0pnxEnnaJj4HnDvCiWEDubW1dD11caSAluoIGlhP/wUzWFkdzKaNDqVEJ8wXJNvLtFJoww64kZzIkBFWVSfQfss3Qna8LQPVArkgt6Zfq5QE8g+Bqej9O6ArzLWVdaaR61s9q63dimbjbOGTHSO9XlyoFernEgqYY3oQTa+/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <737f810c-c469-4ebb-9b93-c5316987187a@oss.nxp.com>
Date: Tue, 1 Oct 2024 13:55:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/arm: Add NXP LINFlexD UART Driver
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-2-andrei.cherechesu@oss.nxp.com>
 <b0e2f8d8-5cc2-46dd-90fb-47c61d79f703@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <b0e2f8d8-5cc2-46dd-90fb-47c61d79f703@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::19) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b58207-8af0-4a47-2c73-08dce207a3ae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3NIcmwzKzBrTHRBdnlyZUQyY2Y0Yk8vMHBzVDdpNXFCOVJUa2VrclRZdTdu?=
 =?utf-8?B?c1lwOHlCdjdHWDhTbTIwU3ErZkNBc0NjSUZNSEJxVzJ4LzNUUE95cHQ2MTha?=
 =?utf-8?B?eWpPYWpWWC9ndXRBTUNRL0w5a3drTlhFSHdTZExSSkpCWk1GTk9KZ0NqVUpU?=
 =?utf-8?B?bUg1UFU5eE1HbjVlSFpsbEZJQ3J1Q09pRjhkdDBDbm8yaFdtN2ROVVM1WFda?=
 =?utf-8?B?N2JTSkY2OHg4N0hNZmZ6alB0M2kvVG5IZGp4REdxc0dZTXlxcHkwWHVBYUhr?=
 =?utf-8?B?ekZEUnFVMU1OZFh1UFJQSnVnaUNORGg3cDBzUXhYRTFnbnNITTU3UXhQSGN2?=
 =?utf-8?B?elJYdkNVR2dyQ3FQRjRUVlR4ZXZhYVE2RGJhUVlRMWRXRDZpWDZXV0w0Y1dM?=
 =?utf-8?B?SjQ1MFErZjRxSnRVVklJN1d2Z25LMHF4NnovMlJaNVdrTXdSM2w4S1RxbnUw?=
 =?utf-8?B?cEh4azlXMFloWkF4U3J2MFp4bEpXcU1SMERXaDFWRzJicy9Ub1BYWVhMMFdS?=
 =?utf-8?B?TW5CWjFzTjBsQUlYUzcrUmtxNUdFOVRPSSt2eUN1YkZPZUVabW9aYjFQWm9O?=
 =?utf-8?B?a1lmcWszVzBkYjZEVmxkeGRqMi9JNFVQU3RYV0hkK2ZMOWZzanRxR3FOUjcz?=
 =?utf-8?B?eWZqMDB2azlEalFtVnp2ek04c0RhTVhuN0xPQXNJaDVCNHNJa2ZmSndZck9z?=
 =?utf-8?B?S2JzZVFONmh4ajc3bTNkWWNNU2ZMNGVDR3B6aTBQMmczWS8raHVRM2lwbUxj?=
 =?utf-8?B?VWNZYzFZbEc4VmRyZDVLU2VsdFg4cDJGcUNzUm96NFZTWTdmTmJ0S2kzRUlX?=
 =?utf-8?B?SFFrS053MkRiZFBlbjVpNUhVZGV6ZnZlWjRZTUhOSi93Ryt6d29qWWpqN21L?=
 =?utf-8?B?UjAwTnhPTzNTNk9adkYyVm9uRzZoNnp2SDEvRWE4eXBGY2haSGNNS2psTC9q?=
 =?utf-8?B?K0hVdWpUWDV6VkQzeDgwOS9OdnNqaDJHRmNnTW9zZzRVYjJTUUNRaXhpSlFw?=
 =?utf-8?B?ZFgxU3JHSm5kZlhaNmQzYkZHRGZVb2tHWUtjRm5ZME9SblRibTNWK3l2UEZm?=
 =?utf-8?B?K1ptV3ZGY2JiVjNKblU4U0RpZjhZYzFXUno1b3NsSERTVkpyWE1OWWN2TWJ6?=
 =?utf-8?B?dG8rM2JuWEpSeU9nK1JEZ2c3cWhPMXY1N3g2dlF2ZkxWUzhrVmpVMW94blNy?=
 =?utf-8?B?enJHNHg2eTV4Y1k4VFZGenNrOGlKN3lNNm00YTQ2cjhqQytCMFhmUkZKZU9I?=
 =?utf-8?B?UGNiN0FNNUdRSEpFWHg2Q1YrNUdBVW5BWktIbEdrVFVoYW92Nm1lV0ZtZ2d3?=
 =?utf-8?B?RzI2dFVGLzlCVlhZVTdDTUYybzhDdmVmSTRVMG9FNEVHTW5lZE5Ia25KVy9V?=
 =?utf-8?B?azhtRlNnVTdWZmJSaThUZHlWR2c0MytpZnZvdUVlUzdNMCs3VFFQbjcwTGIz?=
 =?utf-8?B?UVc1Vm9VSmM1dWd4UG9KbllhcHhkTnIyR2lGUGkwYWVZeVd6YWFxQ1BzUDJJ?=
 =?utf-8?B?VzNueEIvNEZCd0xtTG1hbXMrRzU0SlV0UC9vTGdJbFFGNW5sSDhlRGtYM3lS?=
 =?utf-8?B?UjlLM3BFNDdBTW9aQ2U3WG1OaTRoMW52QjhBdEpKWkxrelgwOWt6MkdHaStL?=
 =?utf-8?B?d2ZscncwWFVvUVlVRC9NU2VZOTFjSkVPVXBpYVdLWGQwUk04alJITTd0ZTZS?=
 =?utf-8?B?TXdNT2VNaWt0aTFMVWhmaUMwY2ZZNGpDTTQyenNwbkRvOVAwZ1pQbXNkczRw?=
 =?utf-8?B?WnNYM2lPUStRRU1CZmVVUFVKN0dsME5PZ1gxdWFocWdMTTRBMlhRbitxSXBq?=
 =?utf-8?B?T0tDYjNrRmdmV3ZvcWdvZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhISlloVzc2RGh6dk93V2FkeitOV01CcUdXT3hxYk5YRVF6UFJ2V2liRDIr?=
 =?utf-8?B?QWMwQk1EVi9nMUtBZnA2bmtpUlk0NTExQmYreHE4V2UrN0RTck0yVVZSRGIz?=
 =?utf-8?B?UnZERE9jM2JjRzNqVjlyNk5iM2t0N1V1Z09iK000NWl5SWk3Q0xEVEYzUnpU?=
 =?utf-8?B?RXV3Nmk4aHlEWlJHcDN1b3RFbnlJVDVNSVJ1Nmw5a1RxdW8vMVI4Qm0vcjQx?=
 =?utf-8?B?M3JHcDg4cmlMc1pnMjZWb0dhYXFVb0lyWWx3b3VQSTZPMzl3RG5lOUZqUXVY?=
 =?utf-8?B?V2EybFBZYkwyNEE3TUc4aTVsQWFCVVpzR21JL0NlRWVkdnhORW9WeFJKRUl2?=
 =?utf-8?B?QWlWRTJ0MStaekpReGtid2tyc2l0ejgxTlY1SEdCQnl1Qk9aTnJGeW5TUUxB?=
 =?utf-8?B?VlA0ektRRjJhMWpqWDkyWTRCNGZLVkZpZGovQndUdnJRUE4waHZuOGVGckdM?=
 =?utf-8?B?a3JYRHlNMTIzYlFuN3cxeDhQOUtXVXo2VlVsbWdvampXazBuaDhEYjFoUGhu?=
 =?utf-8?B?QWczaTRjdkdxZEZmbnMrdVhjanJMSGdLZjhrcWtxbTdpbzZuOWN1UXEwM0JZ?=
 =?utf-8?B?YXkreS9CVFVFUFVaQ2RmUGxLQSthUWppbDRjSEQzc0JpeFM5b3NhK2pZWjlY?=
 =?utf-8?B?RVQ0RUNsUmMxbk9jQVVWY0tqdklCTTFzWVZoeVhEaUI3LzQ4SGExaFFhbkhx?=
 =?utf-8?B?NC9UM2FmSmNnUzgrNE8zWjlQZldxRzlKNFB2WFhHazRveGV6SzEyRHdOdHN1?=
 =?utf-8?B?a2dLY1VRVFFmUlRQbzlTSHlYRXRLK0tqdDFISVhUUDJlSURxWUVqYTJxTkho?=
 =?utf-8?B?M0VidHBWd0s5cWZvK2tEMVRuLytFOElqZkZWcHlMN3FSeFU3WkV6SnF1enFK?=
 =?utf-8?B?WXlGQy82Q2tmazdocTJwT3ZmL2xtNGFGMnRlSWNtWWhSdFpDMjY4M21Zdi9J?=
 =?utf-8?B?Ry90M2w2TFhlL2ttdWZMcGlCNldFMnZielh3QXp0K2I2VEpPbzBRWDB1YW9u?=
 =?utf-8?B?eFBCUXRTSzc4a2k3TnVPVG5qRDJVYVFIVjM5TWQ3M3prODZwa0xERkQ0REZO?=
 =?utf-8?B?YnBINzdORlZiWk5pVVpyeG82S05Da1N1L1QxZEo5N3dwN1RKM2xST3J0WENE?=
 =?utf-8?B?a1V0SzVPTTh6QThiVGw5SEM4cjdicXY0SFpTdEtQc3NxMkhtY1hhVjRKUEE5?=
 =?utf-8?B?NWlWeEpQWFJMNzRyc2lpZTlaRzd4UFZvZE9XbUhObkZOS1NzcFhhRGcxOWJt?=
 =?utf-8?B?SVJrQ1NKbWR0dytWaFVaTUVCaXZzRTY1U21yUlFNVi9rREo2VlgzTE5IS1VI?=
 =?utf-8?B?eXRwSm0wbEo4SWVNK3UvVU1wRWRQbE5SY3ZDeVpXejhyY3ZjRGZFQXVzOGN4?=
 =?utf-8?B?MlA4bVpLUERQWlRrTkp3aXBlank4eWVrZE9GcVdaNDhDV0IrQStoQ3JVTHpl?=
 =?utf-8?B?aTk2cndKcWV6UzZjd2N1cDhrN2t6ekhXUlp0MlJaOE5raTFNR0pOKzlULy9M?=
 =?utf-8?B?T2xDc2w1aG5TMVY0eXM2L2N2ZG9Pdmtsclp6Zm01eENKeFhzaCs4c3lkU2kw?=
 =?utf-8?B?S0cxZjFoVnJiSmMya2h1RVk0ZEVTdmlJWjlXN0Mzd25MZjBzaFFBSjEzYnZD?=
 =?utf-8?B?YUhvQmJmRFJYR2d4NWU0eC9GUjV6blR1UVZSU0U3czdrMW91WlJxL1NPMHJ1?=
 =?utf-8?B?Q0xDamh6QWJQOWpYVWJtaDBNNWdoUWRDejI5QU00Qks5b0VnMVB6dWdZMEU1?=
 =?utf-8?B?NVFpZkl5bkhxMi9CVC9VM1YxVUU1enQ4UHA5OFVBL1Q1S2lCWkltZ2RqQU5N?=
 =?utf-8?B?Nko0NU5TakNJZWU3M2FMalhZSStmS0RmaXRVSyt1cFdWSGtLRDBNd2NObnVa?=
 =?utf-8?B?dk5ibnluZWx0TkdqZmVJUGVNVWZHWkZRTlZCTEMrMzM5Q01zUmN5UUdhZDNC?=
 =?utf-8?B?Qjg1L1lYWURlQzFCS0dzQVcxdXVQYURyNkZqd3RMVEhCdW10WEdsSkJDdGxj?=
 =?utf-8?B?bXo0aVFLS0ZHSDlvdC9KL0hvSHhlWlpsQTdLdGRKbXQ1eGZ6aHZvMlM1MVdz?=
 =?utf-8?B?cHM2MnNSd25nOHFCVDR3MmVnWXo3RVZMWW5Wb3hMb0RmYjRzVWxtb2RkTkJK?=
 =?utf-8?B?UWlaNGN6M1Q1eXFCcFRDVnRuMFQzR0RuVTB2aS82b3hpem11Y3lpZFdPMzhl?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b58207-8af0-4a47-2c73-08dce207a3ae
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 10:56:02.1130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80yNBeLhjsIB/ij+9OYE7mDm5F+4qpEW/KiOwyhdA05foozUwmGWZSkURMqnzLBuQkEJLfMOSAeNyRwf4y2lgL74lB8ORH8OoPvtExjEfOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

Hi Julien,

On 01/10/2024 12:20, Julien Grall wrote:
> Hi Andrei,
>
> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>> +static void __init linflex_uart_init_preirq(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t ibr, fbr, divisr, dividr, ctrl;
>> +
>> +    /* Disable RX/TX before init mode */
>> +    ctrl = linflex_uart_readl(uart, UARTCR);
>> +    ctrl &= ~(UARTCR_RXEN | UARTCR_TXEN);
>> +    linflex_uart_writel(uart, UARTCR, ctrl);
>> +
>> +    /*
>> +     * Smoothen the transition from early_printk by waiting
>> +     * for all pending characters to transmit
>> +     */
>
> Just to note that early_printk() will still be used by secondary CPUs when booting which happens after init_preirq() is called. Will this be a problem for you?
>

No, there's no problem with that. At the end of init_preirq() the
UART can still be used via early_printk(). I know the secondary
cores have a mechanism to print some messages themselves when
being brought up, otherwise their initialization fails. 

But they're being enabled correctly in our case:
(XEN) Bringing up CPU1
- CPU 0000000000000001 booting -
- Current EL 0000000000000008 -
- Initialize CPU -
- Turning on paging -
- Paging turned on -
- Ready -
(XEN) GICv3: CPU1: Found redistributor in region 0 @00000a004003e000
(XEN) CPU1: Guest atomics will try 13 times before pausing the domain
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 0000000000000002 booting -
- Current EL 0000000000000008 -
- Initialize CPU -
- Turning on paging -
- Paging turned on -
- Ready -
(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005e000
(XEN) CPU2: Guest atomics will try 13 times before pausing the domain
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
...

> I haven't compared the code against the specification. But the logic LGTM from a Xen PoV. So:
>
> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
>

Thank you for the review!

Regards,
Andrei Cherechesu


