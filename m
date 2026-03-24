Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LVOAwYZw2kUoQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 00:06:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A9531D9F2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 00:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261412.1554428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ApX-0001tw-6e; Tue, 24 Mar 2026 23:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261412.1554428; Tue, 24 Mar 2026 23:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ApX-0001rb-3T; Tue, 24 Mar 2026 23:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1261412;
 Tue, 24 Mar 2026 23:06:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5ApW-0001rV-5i
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 23:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5ApV-00CCyo-Hi
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 00:06:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c318f3-5cb7-0a2a0a5109dd-0a2a450ccf14-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 00:06:33 +0100
Received: from [52.101.48.0]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c318f7-f93d-0a2a450c0019-34653000544a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 00:06:33 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5075.namprd03.prod.outlook.com (2603:10b6:408:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 23:06:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 23:06:17 +0000
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
 b=aJozst9O3M87v2lZ2nIHcSYrdrtXyk5y6FEYQALlAQ7zWXoB2z1cgSko2QleShZFAxfPtl+S+E/UOjCb36fdgnAoHhXsdF6rZhkXSFPzxJOhRr1z9T/4lk7E+oflHevoLfvxrxdoYGKnXGSOjmMAVNUkXazGtCQs5OtX1fjykLakaLrwyeFLskDRznEkcx22ZrHdCCvlfD0axTvfmiOGTnBWP1YlrVh4dAlHn3mx9T3pnezeheUoIxGdvaHP72PyJbLTq8CQQl6f8lmR7KWYEiZdn7s0h91Q9XHJ2LfDMQd05PvcmantWkreQvycS29X36chCtuT/crmlWhY0mvxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3hE3kjxXjWhaZlJa7ok9Meu56FGPwW/AwBCYLkZ6iA=;
 b=MeHrff1w8ooTTc8GBF1Fw0wQhoBOZGY2GGiL8M+XU0pRzaN5LpY1Oq6MqZtblNgfl/1+0wX8QQIJhYFQFYaaXhVu/wwfYSkaxIrUAW0WZ6SmEqmlYqZ0nlvPD5x2eaxkFlUqMYImJBH3StRvbzTp0bfpM9GqkDBjtXau3witLlpJXxVX6sAVNIT00/FNI9/uC8rJT6ynqUmi6LvKSmRuQ8jZ3jUnqdrTG8xYqr0nINCOfr02XNnyqfW/7jPjGh+eE2qOQWdsyiySKEa9dwljKKFgAZa1iGkoGl6+KtivE3jF2P4PAEWrPkm0c7hDAyeActpqjZVH2WTeQTV9ovMSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3hE3kjxXjWhaZlJa7ok9Meu56FGPwW/AwBCYLkZ6iA=;
 b=f1WO5qjNIZASs0tyVLq0btWtEJIorX2R1T2cAKrRYmXiNVf6gTKdZAolL/tl3LgV9d0fShB8JwCA4WMGLZeWJFrlwSRSx9PPp/qtD6v68QBLbX78bhYYtu2X+qHaRK5gEW1sk2uMiRt6pv7VtRsqoIb2UgmpVU0eJeKe7VBlkjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <954f0aaf-bfc9-466e-aa53-58a35fc54922@citrix.com>
Date: Tue, 24 Mar 2026 23:06:24 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 5/9] x86/traps: Remove lazy FPU support
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
 <20260324181937.2465574-6-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260324181937.2465574-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fe698e-6b37-4631-215d-08de89f9f441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	98MZ0zYUv30TOhYYD8oSnnkeDA5+9sVFkX2O2EEy0NLl9CiZnZSxgH4+QZH0FgkpVwlUrL69Di/73wfOYeNS3UDPyiQ4wqcsQD8NgelCuJghQzR5mVm3d4I6FRPbv5Ych6gO0Zke2FGs1kUaaXnCVC9oUc9HJ6vvMgb6ZbKruBRq7OytohJoYgA/hfU5JNr4UdeYuP17XziTrMNfEeEERo2K06NQdkJWy5uuu5rGr+xOduUagOEYzl/phd2eAfmqXzmkNJl+nsBFDXQBq5LtS7NA/aAyHLGyZ1nCjhQkTOsgSS3E2f8A6X6LzdiKyIMH2lEC5b6SVSEwTCOI7VBfQOfZUxn7lGaXyPmMYvgXUXMFYQfP49cG4xqNymBqEl+Z7igsnwJGMOid5Jh0ZWs53ACx/TG9h0E8U1i89DDkztGocUdkjlJ4i1yjaCEdUtgEhcogYXzoYRmUFslJVhlpP4LkDhs/pXSazoKEhN1rPSobZVXx7TztpN4/ZpNuS5nK2kK2iDSm2u6OGrSU8ixfYp6T//YzVPpVbHM+XGpoRhXKa/mEYHpi0V/qo52D77VuMJsG3eyO2Zc2oNDP69Cx8Kv6mPw+1Sq7oLyXgIptLvdA3EGKxYzsctVfIi+3T818LUb5Ab6w5wsgCniVQ/tmUWT1SisbUkcnVN/ueNcGxQKKUbz3O0K0ITSn5d+4U+QGIBI/JIXEK7GsJY6NJmfkx51Pz8tsQPAaqgQtPCZx0Xk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3RPbGFWMmFmK1FFZGl2WFRzdXUyeWZOdHY3eDQ0OGpGcjJBVkp3bWVsZGUy?=
 =?utf-8?B?VnE3QytIblV3cE03aGdKVUVqWWkwMWJFWHdjaWJWQk9aam5weHpoWlB6allJ?=
 =?utf-8?B?eGNTTzlZT2pHYTVqRWZwdzltOUR0L05iY2ExQlhpZytOaWZkcUhEbWY2TEIy?=
 =?utf-8?B?STRGUHBpR2ppbEFPQkh0NUFsL1ZnRWRqWENoYzZ6NG9vVU5rSUhCTlNtdmlM?=
 =?utf-8?B?ZkptT3VpVDV6WEhOWFIvNVZxVVVSMjZ1SjUyWHZmM3Nic0hhbzFhcGJJbGNO?=
 =?utf-8?B?OUEwZ3l0NXNNZmdJTTNPUFdyUm1LUTBvWWttcVFBTVQrY3cvNEdjWWVqSmFs?=
 =?utf-8?B?TWRnOHdacjZoSEkyQjVTdjBHL1JMM0JGQTZoRlRqeUNrcW9TdC9SbGl4L3Fk?=
 =?utf-8?B?cHhnUy9zanpjbjdFK1hsaXRvRisvQzdnWTVmMTc5NUxBMzJQYzFCREc0ZW12?=
 =?utf-8?B?UGxmZjZhWVBoeUpqMzdIUU1obmZYTjVKNzljRWtsQmhPbHVHcFFOWVFhcHJZ?=
 =?utf-8?B?dDVXT3pVQSs4bnlMSnQ2YUsxRVp1eHBKQm1MZmNrS3FGMVZGYWwxWDFrNHFK?=
 =?utf-8?B?VXpndFIvcU0vcEVhbkthZDdFS3BTYlJKNmhBK3lNZjhPN2dTTit6TldKZ2xz?=
 =?utf-8?B?dktFci9RbGlUNFNVQnVnK1hITGk1VEhpeHBMSFloMzNvNDlyTTVuQjhCcG1F?=
 =?utf-8?B?R2NLZHZZTnNRNEJmTFZpaUZjL1BTeUpyU1hjaitPT3dmU0FBY1ZjYzc2KzVC?=
 =?utf-8?B?S0pyajcybmFZMVoyK0NIY3RNQjJXRHdkNGxyYUMvNW1qTXRDNVVZUmhaMTFZ?=
 =?utf-8?B?a2ZPelNnQlJUdEJFdUUyS1Z0VFpQdnlTVXdpS0FJRlRpY3hzaXh3RXYvT2Zt?=
 =?utf-8?B?a2o5MnIwMUlwelZLdEZHTjBvUll6QXZyRUN2WlhiUTZWd0FoRm9BeTRJSFZM?=
 =?utf-8?B?d2lVVXU3VXV0eDgvZWhWd2h5RWpoWTNsYkJLQ2pQTDFxZEhCS2cyR2VaVUVV?=
 =?utf-8?B?VHpJS3BEN0l2UDlNSzFjcTdldktFOCswclluNlZXMGxLMEltZXBpZTJrQ21T?=
 =?utf-8?B?bUVtRjlGUmF5VDhST0tQb29TTmdjc1lmOXM2cFhFL3NFUlFiOEt5ZGlDc1Vl?=
 =?utf-8?B?RXFGSElVdFRSMEhCdm5NOTBMU1RvelpoTG1hdm9OUnFTS0xiNVdQVVhtZyta?=
 =?utf-8?B?RjQxZHBpUmhVU0YzM2wyYzRNZWwyd3IyVXFpM2dwYzFRTFJOZmgvSjBIMkk4?=
 =?utf-8?B?YVNWM1lSWS9JT1BYRU5jV1hobXNmV1dtbkk0TktDcXVhZGJuSTlHOG0wLzdM?=
 =?utf-8?B?RnAzeDI5Y1U2MGh1ZW8xTmFOdDJFQkh4LzVpdks0RERycWJjOWt5ZG5Qczc5?=
 =?utf-8?B?OExlcW9FYTR6bk00d2ZhdnBYTkhCTDZzb1ZLZzlMcW9aTlo2czJ5UlU3cHky?=
 =?utf-8?B?UnRrN3JUTG9mZkNtV3IydzJUc3BtQVlLeVgwTHd2MHNmeVBMUE12SCtJQXlK?=
 =?utf-8?B?MW8wWFN4ZElTT1pnQlUrVHkzK3RtbmVoTDVBM05YV0M4SkQrVENzTXc5WjBo?=
 =?utf-8?B?MHFzWHByQ0ZtQlk1cm40VVRLRVI4TE9Ca3dNakhuNFhlcy9NK3VmdGxVeWtk?=
 =?utf-8?B?ZnpsZnIrWWNPMndtdm1pT2pFWkpvN3Y3MHRiYVBEdVg4L2d3WHdBcDZ6WWUy?=
 =?utf-8?B?MThIWXhOT2c1NHVxcWlwUjE4cG1LOHpsU1BhekRNQXkwWjBMdXU1VFJEdnRL?=
 =?utf-8?B?TW1sY0pnbzdmUllaWkpLaUtRRElLSWxoOXJXaG5remswNEtkWDZLQlpQbFBH?=
 =?utf-8?B?Ujk4ZzRRYjJ6K29LUmtibzVMVHNEWGZKTEc3RzJEcDNndzBoZjFPU3YrNlhJ?=
 =?utf-8?B?cVp1MzdzODhQbytCNG9UVTZ0Mi85Zyt0dy9saVQ2MDhidUNsK0E4Y0dpTXlZ?=
 =?utf-8?B?NmRuYzB0VUxqZWh5N01HNldVYko5NThITXlpWlRzT3lva1ZGUnlHYjJscjdU?=
 =?utf-8?B?R3hoanhab0Q4N09NcGVJVlRmTkY2b3VxNVBILzlhMXVNUzhLMHAvNGlMMWc4?=
 =?utf-8?B?eHM2NEJHY2NBcjFrT0hxUlMxZW95L2M3L3RhODdXQlA5NHVnbmRBN0tyVlFh?=
 =?utf-8?B?YW02bXBheFkrSCtZL2czK2NSNDhlYklPMGQ3WjlDTm9DNmFHQ2xIdUI5MUta?=
 =?utf-8?B?bVJlN1gzeWlER1VpRFlxcEphdEt6dkE0WFB1ajJ0MHVzcmpXZG5GM25hSmpN?=
 =?utf-8?B?dlpOVG45aDcyNVY4WlJPbGdZcTBxNWJwUVRVdE1TZDd6Q2ZCaHh1OVh4eFhv?=
 =?utf-8?B?Qy9CQ0Z6eDdVcFAvYnk2SnBYWHdVSTREQjkxeG5JazJ5TVVpYVpXVnRrMVMv?=
 =?utf-8?Q?aAu51fUYN1WxqU6U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fe698e-6b37-4631-215d-08de89f9f441
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 23:06:17.2526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7R7dekNFjK4zNKzzfNM1ouxhlBZjoe21goKI5XTWASxeSNWxdeYezTPgO90kenmM7ULL8eZE7dsQ6oNo0GHV6kNBfRv5EkJTcUwyZJQOvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5075
X-purgate-ID: tlsNG-d25034/1774393593-6F8A4734-1D89974B/0/0
X-purgate-type: clean
X-purgate-size: 379
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 71A9531D9F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 6:19 pm, Ross Lagerwall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
>
> Remove lazy FPU support from the #NM exception handler used by PV
> guests since fully_eager_fpu is now always true.
>
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

