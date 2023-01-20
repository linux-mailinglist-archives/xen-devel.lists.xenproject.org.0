Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF10675542
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481757.746859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrAh-0003nn-Cr; Fri, 20 Jan 2023 13:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481757.746859; Fri, 20 Jan 2023 13:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrAh-0003kw-9Z; Fri, 20 Jan 2023 13:11:07 +0000
Received: by outflank-mailman (input) for mailman id 481757;
 Fri, 20 Jan 2023 13:11:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIrAg-0003kq-4M
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:11:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e4b0cc-98c3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 14:11:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7393.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 13:11:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 13:10:57 +0000
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
X-Inumbo-ID: e3e4b0cc-98c3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7n1z8eYi/+aWch+JavLwwMv03nPsjf57AOGdbdqOXLGTUtaTvevudja2JPOSlqpZYCQdP4gXPEHs+ialQ2bW4gIP8ocY+rafo4qlR/D7ORtim2Atu6CazHxuyCDpEgOwGLzvE3NnBw97teNrgqzQHuQfKZd9hsrabfbSPdMSXZyyaI5T/0c7lyuoQydBSKcxcfx5em1tLXEMKICgGq3OlatDpI82XILwHv8QuKktZm1vtEa6mkHfYqVReIEvO3FbSBoABM+Qs/uvkTKfhcwC7bgSozV91oPrks8hxL+RjiwYe1Bab9G1GHf5mFcjvUtWnnLTIFMQrSDmAsW8I/LaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twFvgIgQ0t0sucpxXPX0REiwICs0MBYEdRKZ5HyJ2cY=;
 b=c5GelhtO6tdM6RVbulT1XxVMDo1Y7GifM1jFHGFDFWV34IJFd97o5JCEm0uc+B/L+X1bPNQomqLbdCJIFHJ7IGr4s7aGxJ0nO4GVvHHwglPT4UxG8B9RSzkia3hUuAe4zeQn4JIwlIYRyXYidnONUsaMFGWLLdI6SbtoDzyXfzZ0gguQLajpT8csiY6MI668XbFC4dO3PtvQrOuHVjj5lLzLZscgkGw3uHUlTOCoKXTodjehFXI6e2v1hUMyGkEbxEco1GwO8ohauow5paWbOamrc36ed7I4PPAGpcUPXGNj4jECMk3aqAM7JvS2TCwSByFMRWEyKDbYgbPoohtRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twFvgIgQ0t0sucpxXPX0REiwICs0MBYEdRKZ5HyJ2cY=;
 b=iUvLDzXOTEpw52GnC8pOvBY0nnR2p+1NXsX38oGI99O6ei9RxtukXdJi4fipLUg5vZC0x4fDkRvpqU5Sk48qto6lFA62bND1fARuUokcu7YyEeBN4/ttAW0cDocKmt/dY9kGZxqOM5yj/sa9IGGqC3hd7Onu73XjMe5kndikAELyq9xeIw71KQ/9vk/sGJciwNkygqqpwgrBVzaSE8Hwfk1Zes0gdrFMLrImzVdGzLXtJQXzOsQtBd91hWeTal8+ibX/p/geAOCUuxuKAWDvqhC1EJOEJfeM8pg0oncFWonaOohjJgNzbWxcKBbQdnXYKqT6vePff4hJmuJEI8j5pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f530ddfc-8f97-b913-e838-58cc352f6372@suse.com>
Date: Fri, 20 Jan 2023 14:10:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230120114556.14003-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230120114556.14003-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b44ebab-3b62-46af-24fc-08dafae7c4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wtqdzgmx795jWgJH6evNCF7zZ5n+W5dS1bAAHp1ckgw8PbKv1FUgGj3ShFLuaoYRbJQvArNfi5Uy6Sfg5Ve868zJXGZj2j5qdgMcA4QSDHG6U8rNCCWTMND4I2j6yT6/zl1CzBQlwwfownL4DsRYjmSh6yiMsLdZNPPFF7KaXQv1Ngbu7LycaSojDW8JJX6sGwiQ3q2IncAvKC5g75Yo+VSjW5zPHRaRnKa/3d6uuq7WMzygRkerHZD0ZhGzRRdMrZwP8hObH0p74WnhYeGBAu9lW9z8GE2ebNB7h5tY67snybN4AR6/Ed8xNXItwJg1eK3EixNpKoXq/k3ryLtWzpp+MCg0fZyQ7SaQDZRm4k0oyFbZAXZGgaVxvsWoBQa+ro7IhM7XS2ZzweRrv7AuzC23urqYZBH6u1WSU/pLWFiAqMPPXFInipt/r4B5g4Ugn4WpwJLrdDhqvAMLcWkWTZoizQ/ZXMTOevFMOARbqmiLy9d7kzF5mAZwaMxZW4WrMRRBfE7/jqlI8mx1L8yeDNzWZMWxN92LuEQkY/RAtis+W/JRjBsLpso/+YBakqmGtB3nSGYLOvOqDpXgNK/+Aw65wsr8IbUAjqLt0qX5smbHWRJvXXQM1SAwkysyTsS3JpiKLe/kdGdriBQEKLL5AJ8OUTtwqBiRkpXHAKUaUcko9S0UFj4c6lYxN8rMslB4wemplsytwhocaKFVzaMkVSmDOxVAkGswwNeCuWWuwDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199015)(6506007)(478600001)(54906003)(53546011)(6486002)(31686004)(8676002)(66946007)(6916009)(316002)(66476007)(6512007)(26005)(186003)(66556008)(4326008)(8936002)(5660300002)(2616005)(36756003)(41300700001)(4744005)(2906002)(86362001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVhWVGxPZXdTTDR5Q3A1ZTg1dmxYclQzZy92RStCMDJtSHNBa0lOVWFuZXhK?=
 =?utf-8?B?L3crWWtiNU1iaXZjWWNhS0xJdkJEdG9va2FPSFozRTMrczAxUlNMUmpsVlNa?=
 =?utf-8?B?azMxcUQ2Mk95enluYnl2cFFJUlBrMkRrRndPdkpidDkvWnIzUWx1SEw2a1ky?=
 =?utf-8?B?dWUyMEFsSzgwc1R6VWRnMTNiVStqSnhYR0pEMzhkVXQ1aVpBZ3dId1UxYS84?=
 =?utf-8?B?SlVNQWRMYjVHYkhwZ3Z6ZG1uWnNIZVZ1VnJ5WEhTWlJ3WHMyMVZaZCtQM01a?=
 =?utf-8?B?clpyQWZxbndKM1RRSFZZU3U2TDF5OG8zVlRWMEtCU2wxSzZBanV4am44Vmtr?=
 =?utf-8?B?MzkxOFQ0U0N6SzhSTU9mT1R1SkUwYkw2Q01QZUdob3VKQzRjU3B5ckV1TGli?=
 =?utf-8?B?YWh5TUNOS2VzQ2QxcGlWTVhKakx4NVRnT3BVQ2tiZmhHbjRTR3RoaHNQYWlj?=
 =?utf-8?B?ZTBaa0JlcmVTTGNIaEZmL1dYOHVXR0hQb1hqNXgxaUpPVE40VEVDekxQc3lQ?=
 =?utf-8?B?VVVDSjYvSHlqTkRKNTFoTUUrTlJ4SEg2YXJhVG9SOUgwU0Q4UUQrRFpqM1RU?=
 =?utf-8?B?N0R2QmFZWVVnUUcySlJXdFptY0VYRkc4MFJjNzhxaVN1OHp2bTNyTCt2Q2ZP?=
 =?utf-8?B?UHFoMkswdGM3SEVuSnU4dlA5OGJNUkZFdDBTWGgzK25QbzUrRm9rMjNUdWp3?=
 =?utf-8?B?djZ1b1dUZjVwRWdrK2ZnTWtqcS9KV1dqditTUXMzb2VnamVvU2xSK1RyaWJi?=
 =?utf-8?B?RFg5bk1qTnE4OGZHL2VOMlQvbVJ6bDFiSjV1RTZkYkZrejJhNVd5TjU2c0dD?=
 =?utf-8?B?Q092R1p3ZW1TVlB1QVV4bVA0S0pZTlh0RHMwdGxLd0VWdHJ4UWRsQ25pSklF?=
 =?utf-8?B?NUg5R3hDUS9USDBIb3R5cEJKMzVqcjJOSlJ5VXJwN3k4RUdaV2NBR1gzZ0E1?=
 =?utf-8?B?NGtnNHljeXptdTQzcDlhb0p1eCtEV29MS1pQTFVVc0lsQlFSMFY1MEJmallV?=
 =?utf-8?B?UDF1WTc2MUdwSUsvNnVUNGMvOWdrTUxYdFgxRXkrTWsrZGVvMFYrcFh4Y3hx?=
 =?utf-8?B?TUZObEN2Y3NPMy9YY3hSbHFMNVI0MEhwa1U5YkxQRS9RSjJzWHdXYmxjejRp?=
 =?utf-8?B?SEc5SStLRjQ5bEY0S2xwMmZBSktURUs0U0dKY1RneDkraHhtNWlaNGpJcUpO?=
 =?utf-8?B?Tnp0cE43UHpyLzJEQndaMXAvUzBsVHA3cXNhUEJ2Y2xrcVpFOURDb1FwTkhP?=
 =?utf-8?B?T0hXTy9NUjJmUTdaaXZCVURBMzJDK3F6OW00K0FpWVB3MWRSQkNHcnVBQ1pN?=
 =?utf-8?B?L0ZjZ01ZUndxd3J6Z2xJS2tZUnEwZVZqQnZ1cVlpNzdpaTBhNTNjaUlSS2w3?=
 =?utf-8?B?VXFIb3A1Y2hVdmhTaFdCMnRlaFpOR2d0Qk4xdDFTMkYrRU53VDdTU2tBUDZp?=
 =?utf-8?B?UUdSUk5MMWNsQWp1Z3lWY2huTzM0UDJHR3EwUXcrN3Rsa3ozUEtKd3BlaGtP?=
 =?utf-8?B?ZTBucC9wb0NvdlhnOEErMzlTaTllZUV2RWY3TmttVk5KZk1sVG1HZmNRbWVp?=
 =?utf-8?B?MXdLb0UrckFGdmEyUlJLZUFEQTF0b2ZzSWRINjJFcHhnQWJvWjJURFBRSXJr?=
 =?utf-8?B?M0Z3MVVTSzVSZ3NKMVlvMUd6MTY0aUcrb1pIcEFFNDAxN3daQkhadVpnR1RQ?=
 =?utf-8?B?d3VxTkdJaVNnZVpvazdReE5peCs0MVpQdUZyU1MxOHY5eWdSOEc2MFdaeEFq?=
 =?utf-8?B?T2pXWUoreE1xbVYyV0dZNGhIRU5wdzlhaDBZMHkwWENsTUZScEZ6RzMzSzNj?=
 =?utf-8?B?dWsvQWdNMFJGbEU3UVVMUlh2dENMTWJTWHlPNndpSGhPbXQvMFBtOWNGQXNT?=
 =?utf-8?B?bEhnMyt4em1BRkgvTmVraWU2cVZycmNQTDc4Q0RzWU93Z3JxMEhBQU5tMmI1?=
 =?utf-8?B?TXkrc3ZKY3JlUldzVi83S0N5eFozUCtSQ25kaTF0UTJOZStLWldGSmRMb1g0?=
 =?utf-8?B?c3k4YmhkVXFLNWVTK0hSODFnaUQ1WmswbjRyWkZkV0RTbFVEQXhoclRacEFy?=
 =?utf-8?B?b1hURC9LTUh4Vm1hMnltd21LRm9vak1yNHNQb04vZXdtRFJNTVo4TXdqTC9y?=
 =?utf-8?Q?MnjHiwJHfHbxz2MkVVDSMecDl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b44ebab-3b62-46af-24fc-08dafae7c4eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:10:57.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80cjgQaP62C0YmSwvcVEED1LvDs2+GipiT32+4rO+S25Z5FF3D63Vgo6JtqYc2iVYG3AUYiutwG1b4n98b3EHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7393

On 20.01.2023 12:45, Andrew Cooper wrote:
> This is a global variable (actually 3, one per GUEST_PAGING_LEVEL), operated
> on using atomics only (with no regard to what else shares the same cacheline),
> which emits a diagnostic (in debug builds only) without changing any program
> behaviour.
> 
> Based on read-only p2m types including logdirty, this diagnostic can be
> tripped by entirely legitimate guest behaviour.

Can it? At the very least shadow doesn't use p2m_ram_logdirty, but "cooks"
log-dirty handling its own way.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with the last sentence above corrected (if need be: removed).

Jan

