Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bz2SKvpnKWpYWQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 15:34:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F220C669C9D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 15:34:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="PZsKO0/K";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334386.1597466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXJ3z-0000gZ-Q9; Wed, 10 Jun 2026 13:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334386.1597466; Wed, 10 Jun 2026 13:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXJ3z-0000fA-N7; Wed, 10 Jun 2026 13:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1334386;
 Wed, 10 Jun 2026 13:33:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wXJ3y-0000f4-BU
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXJ3x-0080RQ-I4
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:33:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2967b8-bab6-0a2a0a5309dd-0a2a4506ec78-6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 15:33:45 +0200
Received: from [40.93.196.58]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2967b7-7371-0a2a45060019-285dc43ac4d3-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 15:33:45 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5512.namprd03.prod.outlook.com (2603:10b6:5:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 13:33:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 13:33:41 +0000
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
 b=WYuyi9D9IDK7kdSaqbyfXLl5ZgLe52XVSBp5GqHNi2XETzhfF5eNdYnhosU3kxo42ZYR8BTQJ51NvYhjegySF8mgQ8xY9em17GSRkF3K4gWYT5SJCbpWsaZ52drAafobj8mOlMpNzy2V6XHeCQMW253O3nRcghr4dpz6G71oJKzSP8cMncmbxPFtuFtlY/F0x4urPmm/+94onP+qU25nySopkXwB8JOzFxXW/jhwn+Pw/w9Tn1zkK0EE1pSNNzlnTg7XzvhEUTN4JjUoA0KqMXPXSIALOQRrHLtAkRnVTlV5d6W6YculilHZ7v6EroZrXJgfXqeDKb4GmWccP+hLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0wyc0bMJKv2g26ryzfS0+whRcSWZGIub50sR+BDb8A=;
 b=WndswmutNJ0FzmbELJ9vqkCJwta6CSxTTIXCpFDXza1CZtIgt4WAXukw4+4Cw3pIOCW2xmbPPFGdmyIg+43hXWS210zpcYMPvlUyYmLodZUj1MZYhiVn2I9Oq4LePsyTwExF+82YbEkXBq54mgGOSIflTUdHgjYO/3gMmGUIqQSyDTvahujIytMbVDutjaM0t+vBSjfdR0fn2hNhC9HcyYMsWofS05Yi+p0V9MZrNlMhVlGOktS8Ipx9CEuXWKbeijfYZsxmgugqVvlaym8yU6ubFIaQc20p5IJXAqx8tWqkDBRlQnpuRAh2PVD7FUvJGToCYjTG4TlIjOZB0F4doA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0wyc0bMJKv2g26ryzfS0+whRcSWZGIub50sR+BDb8A=;
 b=PZsKO0/KIzuQwbuZ6y8j2dRcTa0yarKyXRz7t4lr7cW96vN/YUK6I735wMknQ2GAbZWDco2QCzk8LtjKGcoJLB8dij7FZsHRiNsz/o/o0XppyMXl3X7G5VzYGOoR2+Y/zqwOtPA+Zk05vuC1oeVQGSOx6sBNZblgdUaiVwqehq8=
Message-ID: <5c397f5b-cd5a-4218-92b5-074e52be5f11@citrix.com>
Date: Wed, 10 Jun 2026 14:33:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/4] CI: Rework the archlinux container
To: Anthony PERARD <anthony.perard@vates.tech>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-5-andrew.cooper3@citrix.com>
 <1781091028.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@vates.tech>
 <45a5e1d6-0262-448f-a415-d7b1b3135d87@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <45a5e1d6-0262-448f-a415-d7b1b3135d87@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b961fdd-b070-4120-4593-08dec6f4e2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|4143699003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Tj7lTqathidpFV1CquvUWARZeTNhD/h7rGJaO7E08ZznXrkcE0Z9fGUTv6GYXGDkrZubp5Hm/vvjhuYZXt3abNW17qnO/wLmnXPiWyI8qX0sRxeH4pZ7HbeyczguVBvYX41dRQowGw+vVHJp0khN1YhQThc5J5U5UAHuGC8bYM+Xl7jIiQqTysoTxRZbirdicyopUyZhvUmBu1cJuON7qDWYe1UwSqr21iBO5BIW06ohFRM0+O50XkT4T+Eoz7EEgw+5bK6E+ufAqTeJ9Cuyzj5TnWt9Nvp1GEnoCnpaaIp45Lk26iXpRjSP85/pwr351pLrQjIWmRK3rQG3/LeIu/97fExbQ3AY27f55AR6HFybhDkq3grK/sgdovYTkYAWE2+zKhhZFge7ThsglpCcDncjthAu6Z0iz+Vq+GKT1F52ZmqDjiM/xS4ERH0pSO1iFshjBsr8I0icxQpORp0JsEC0+j6xkkc0BbPNOyjWMXpqs1OGfmQEp6sM1MIQZDYDviLFvNUe9CbXn58dKaR/H7CPQqbNAqUze4R5IiWKupJKGOzd5d0h50oBvbn9hutvl11Fr6c325bQvgS6G0j5Ry4BahfGyaNYjlFSIRTZe9XbByCxRbJkAeXs//ZohpiwkWTKK2E1a/aaqu5oPesFc8Jp85wLU/H90fz03bbup14oA14iOtj4zSHmuCEEltvw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0Z3Z3hkZlU5VG8za1djNmVQQVZId2d2cExYYmxIZkdIbWJHK3B5aWVyU2lo?=
 =?utf-8?B?K3hGbUI5WVlRUlBNRHNxNHkxSFg2cVl0bHBHcnRMOGdCZFhKaVYzMFdxV1Nu?=
 =?utf-8?B?R0cvdXc1L3JKeXJqM09oeml3K0daRnNqdnpWVjVSWE5tRE9vYlA5bnBaWEFr?=
 =?utf-8?B?eHJLVmZDZUowZEh1OFZVMmFsbWVsL0tTNU1rbmlLemlyYWlsVWIvWUdsZWVE?=
 =?utf-8?B?ODNKRUtDUlVtYmw3NEpDc2RNQm9FZEJ1OCtnNUIydjB2eWN1Z3VvS2Z6WWN3?=
 =?utf-8?B?OUdmTVNPZjRUSWdPU21XU1V6RTV2Sk9MVURhNEtqK2VtQVQzVmdqdXF2Nyt5?=
 =?utf-8?B?ZDFZeVZhWUlta2s5VWpTV3VCdFlXUW1ldjVHVDZBWTg0L1lLeHZjN3lJcFFx?=
 =?utf-8?B?M0hiYWJaMERsdE53K0EveE1ZK2Z4bEg0RkZocHltWTdId0hnbE93dlFNNXpt?=
 =?utf-8?B?TVBybWM1THJ1ZWVFNWRZb0dheXRuTlNnU3NRRmpUUDhuY2ZGVTBGcVhaaEpZ?=
 =?utf-8?B?S3prTFlNT0c3MUNBamhKRUNWNWFhWUhTYmFWSm5KR0w0R0tCR3JYeUJwV0Zs?=
 =?utf-8?B?NXRRME1IYXZWeFFwUitRNmRmazdGbks4cCtnNitVSGlYRkw3RTJVMi9NbFc4?=
 =?utf-8?B?cmtFUFhFQWgrZ2dYaCtMZ1BzQXZNMGtiWGtBbFRkR2tpaDdZcHQrdW1DbWR2?=
 =?utf-8?B?MnlGVGdaVndqbjJ1ZHJJaW5CWEh2bTd6RXIveDJPRWsxS3lnQmFWcW9QeXdC?=
 =?utf-8?B?Y1J5a0ZSN2toNnVPUDByVXMrN1RaQVpWSkN3bTRhS01CMnRJV1doemN0U1pz?=
 =?utf-8?B?MXpWWlJYYWJmbWtyM09jcFU2VDBoQVNscTZkN2F6TFFDZEszM2FYS3Y2U0RV?=
 =?utf-8?B?QzVCRWh0aDFrRFpVSmg5UUF0UlBpRmluenRacUYySk93WU1oa3Fpb0RiWnV1?=
 =?utf-8?B?T1VXRHA5MlpYQWhBQzF1blFnT0I0U01TOWkrZVFmdFNvL2YxeHFnN0M5WGtu?=
 =?utf-8?B?a0g4R0o4cUs4amlwRUYrc09qOUNnWEluMTU5Y29KQWV0ZTRTVUFjOENET25Y?=
 =?utf-8?B?MHhBc2lrSDN2S0F3MXZ1cUh6a1RRMWlEcEh2ZFZQT0ZSK0t2ZFhoRm5BZnVz?=
 =?utf-8?B?ekJxMUlBdGVkWFY3NFVhd09KUEpDVk1vZ0JSUi9xZ1E1L2hnZFhlSWY0bGJR?=
 =?utf-8?B?N1R3cDRhbG1ScUV3aTF3b1lTdzJXK3dVNGx0V3pGL1F3RlVsZE5uRm4zWGZP?=
 =?utf-8?B?YWgwUVBYeVZad0xWZ0U2SnJOT05iUnZqTURmQUJiRnp4Ly9kWHE0ek1RR1lM?=
 =?utf-8?B?WC9GQ3lBSTBWbnozNXVaVDVzY3NvV3hqYmdNYWk3YkFuakZlMnlRMExCdzVi?=
 =?utf-8?B?Z3FlZWltWnRHUVd6RkxrcW96ajlKd3Fqam5JejFlUjh6dWNRWlEwcDY3Yzdr?=
 =?utf-8?B?NnhIVkR3amx4REllQXk5RUN2QkIwSXpCVThiQU9FVzVKYXF4eTRURGI1bXJy?=
 =?utf-8?B?dzFDS3lWOEZaQk5VUzZNZjIvSHlMZ3h2bUVNNXVuNTAwMjRmQ05vbGUrUnVh?=
 =?utf-8?B?Sm4wd2M3NkEraVk2MmdpeS9SdzFWWktoclpoRXJ0K0ZpMHZHa0VDV29iVnNE?=
 =?utf-8?B?dW0vdkhmM2JlczFGbmZpSmJqVmFscE0wT3ZQL0VLcnNFcDBqWWw5cGpjR1Zh?=
 =?utf-8?B?WFJDb0VCdi9vYjdSSmFvYUlsSUhOR2gyemg2OTdEWUw1d2EvWng2Z2NDZ1Y4?=
 =?utf-8?B?SnhBVTFPWDhYamdCWlhOY1pmSDVqZ2xLeFl1RFhPSjBUS2hUUG9lQXF0RG84?=
 =?utf-8?B?RU9oVWVuNm1VS1JDeFNUUWkreGduaEwvTUFBUDdXL1o5ZmFIck1OOFp0c1M2?=
 =?utf-8?B?Rlgwb3E5Ri8vR1lvWjRBTGIzOExoOGI3NnovSTJGVXMveXlGQnpvUGhjVzJZ?=
 =?utf-8?B?aUxxM1pDRHd4ay9SL1RJTHhQNGpEajhKNncxVHZnMWJxRHRGZ0I5RkdQazha?=
 =?utf-8?B?bzZiWmwxV0o1Z2ozUm9hR0ZPN2ppYVhsZVY2K1J4SDlOVWN6T25DM01jbnE5?=
 =?utf-8?B?MUZnQlNEUUkyV1B2dVFaT2Y2aFJtZ3h3WFhDaHpyTHZLS3RUcVhsYXI4NHV0?=
 =?utf-8?B?TmtKQmt4aDNuUnBaZVVZRURtSFhTc2JoQ3lFekZHL0MzRElqZDhxVERGdUJW?=
 =?utf-8?B?WU5ISEFITUwxRGtyZDN2aG4za0JkbXJRY3N2TWdvaUhJRkVjRWVmMnE1VDUy?=
 =?utf-8?B?QlRPaE5Kcnp0SXFxOWpiTXpSSzRTYnpEMzVSTUt1RStBWFFoTlFDUUUyaWM1?=
 =?utf-8?B?bEVHdUhQRGp3SFJ6RlI4Rm9GM2NMMVc3UFozd2IzYVJjMVk0T0J2SEpka3dn?=
 =?utf-8?Q?FufprYMcGwW+xvSg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b961fdd-b070-4120-4593-08dec6f4e2ab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:33:41.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mfg3Jfc8hNFJi4sY0M7jyyE0Yv0QdOAvZl4Z3EGXxe7V+1+Ei7nSr48pO0c+XOTnMj4jU3k5haWn9Zxc/KsGxNIn2kipQZF6tf+0FddfGiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5512
X-purgate-ID: tlsNG-16d1c6/1781098425-8E38FD75-D0DB1151/0/0
X-purgate-type: clean
X-purgate-size: 948
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
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F220C669C9D

On 10/06/2026 12:38 pm, Andrew Cooper wrote:
> On 10/06/2026 12:30 pm, Anthony PERARD wrote:
>> On Tue, Jun 09, 2026 at 06:31:02PM +0100, Andrew Cooper wrote:
>>> --- a/automation/build/archlinux/current.dockerfile
>>> -    && yes | pacman -S --clean --clean
>>> +++ b/automation/build/archlinux/current-x86_64.dockerfile
>>> +    pacman -S --clean --clean
>> The "yes |" is needed, otherwise the files aren't removed from the
>> caches.
>>
>> I've only got, without:
>>     :: Do you want to remove ALL files from cache? [y/N] :: Do you want to remove unused repositories? [Y/n]
>> and no messages about the files been cleaned.
>>
>> I tried --noconfirm, but seems to just get the default response, so
>> nothing is removed.
> Lovely :(
>
>> With "yes|", I drop from 1.32 GB to 1.26 GB on my machine.

Gitlab says that the "yes |" alone shrunk the resulting container from
427MB to 380MB, so a substantial saving.

~Andrew

