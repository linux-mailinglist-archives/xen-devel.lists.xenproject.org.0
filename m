Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244585AF750
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400394.642123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSi-0003AK-G9; Tue, 06 Sep 2022 21:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400394.642123; Tue, 06 Sep 2022 21:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSi-00037f-Bx; Tue, 06 Sep 2022 21:50:28 +0000
Received: by outflank-mailman (input) for mailman id 400394;
 Tue, 06 Sep 2022 21:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgIe-0000Cs-Jr
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:40:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51fdf2d6-2df7-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:19:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5538.eurprd04.prod.outlook.com (2603:10a6:208:116::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 15:19:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 15:19:35 +0000
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
X-Inumbo-ID: 51fdf2d6-2df7-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYMGqPpnjogP8Al98+icrL464+9P70ZKJCnJa/r82Dyp+lFCcv0x/dqqPjGpMWmz1e7SN2H6kPOeD3wzW/TSnWRIvWoHzaGF2uwl6cHXApr2g02VF3PUchaENodAn/E+VrXrRJmTv+EMXUxChNLmj/Ns4flnSkcBEs6kFFmrrJllR98BAg8xECTAem/tD/g3GLp6cx8yHDjgB0+BPGszg06xqTxM7JMEarPnrs90a2xvB1ZDDpOLMdjaWlLVr4/DRryOjST5jolRS4qy4c2dTEexNwzQaXHWR8KYuu4bZ3UPV7Fa+0xYskFj9daKo7VogoC92BJmQV5XmJkzBCuyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDEf9qVEL1hTifWUUb4Tp4Q2nMlfRlUG6qWgu15qKVg=;
 b=SyNWjMDV/pr+03Z6X6Ya9ZNzUbdVrrCyMVcuDUnds/p540nJo5Zyj7s71KuT9WF4bajXmTb/s7YU36i7XT/xU9s2o06EKoWXKYz0JQkFGoo0kSFhajHxnOMfuPQYBtyGbtdzQKTzkRjHbBd8gaHNxt6abBCVktsyacFupP0ZCMUsPqOiEUQYZXIt8wv7QLcEbRkNSlwLN6lueNb+DCxPT70md0juLDKnJhE34wW0VW6sK8Mq2bgARwzfNBPEMK/7MiLnUplx+PGywpWjYDfzyq0IpQ5OHZQspiwAODX/YWUJdqqCQAZADzF8wzAK8W8NUMrtQg9y5aItzFT2jq5tIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDEf9qVEL1hTifWUUb4Tp4Q2nMlfRlUG6qWgu15qKVg=;
 b=iqGOwWYCgXg1y4HHPBoYuj/s7aD4mmsJjXh5x0rQIjT2E5o5C8UrEgMVYcqSPJKEmVPUSakkdLT4/k0NMjiOQuLKFzKnJoPvQs0gceYr4tSbIfRgGMh47ccxWpJF+uZEydMSKqYZZ4gcmsPMyR3hDmw3ZvaESSTA+noAe6It7k2ZhNOF+vMsRCQWHglCoSRVxebpWUhJHY81qrVttHZOYlRTHh7isc7ZU3AK5LYwH/mPO1+WmbyT6FiO5u2wW523xmxE6vnkZaKw1kGFF9ajYtzwwf4K8aZXJMmLHnXouZnZ2+7X81mf49w8s8GPGn3ijcDLYIjbrc+ee0js5lTcyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <788681d2-123b-8af1-0f29-cae0c72a920f@suse.com>
Date: Tue, 6 Sep 2022 17:19:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1 1/4] automation: Only filter build-*/ in gitignore
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1661352827.git.bertrand.marquis@arm.com>
 <b51e0e7682cf45e5844de8e0f1ef1593049b6c05.1661352827.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b51e0e7682cf45e5844de8e0f1ef1593049b6c05.1661352827.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac93ecb6-e7e2-4eae-aec9-08da901b3528
X-MS-TrafficTypeDiagnostic: AM0PR04MB5538:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A9ApIci+jiV2kEub7pv5WKd3kL3zkZQ+eWlsTC8SR9ypdK8mY3vEAbBYZ88jc8Op9XlvGyjcxaHoKQpexOzAHYTXoq7IaJ6M3BzvHFtK8DpaOabKU420G/kzdfEIuZntFx33wU5xbbR8J9dkfGCeCk1M71fkVpU9CgEf1PHzStjlR8czFsQDm3ceMIn/4hz0lZ+URVsdLCFP3Won3UuKq0uB89WU5a+OnZRn6FXJfQDlZKNqzcS0xfHi93Xnd1p4kOSrQcsxM8TGy1KmmPXgidr4OQlHnh9WJ60iseiITl9P3xgCewBNA3q2HLC/FD2/ofDOYtDtmAX5CdkdITXk9kmI9F3ZPbY22gCu1HPqedH4o9tObKAnUAgc3vKsw7qTEoIsiE8yEchlDkeLw7yp8IymaCQoT6GqUcvHwdXPMOWchcDtlbdB5P/9ab7VUno0FnQVsUAQMefVBrTnP0a/354KBO2qUqT6AZcPv1wUoznhTAAWBrqEAkG92nkYAn7PuIsnXqmmEmKhao24SQmHceMyxHHoOpShzXYotslknGohcaRcrnc0rVZZTJ2AVfY8qx0pTmqNGoDdmcrkl7fyBP/iYLi19/siHajQYqpUcLofpoyeC1CRZpEJsCVomcZQiNtiaZnK3WsJ4EwbCIQCa3V4d+mEuHoWB5GV3Bz3siCYPQPfZEDxgnxpk+O3z2ITnDmm3FsQ2bpzALByFHVWF1HyDWIq9gXW6JkXvlqu40d5ME8bLMX7+ev9cmJwRCFKYeDfMM7a35IT7ArL5QFWX1aBapalvEL3MhM2ditjxbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(396003)(39860400002)(346002)(8936002)(5660300002)(2906002)(31686004)(66476007)(36756003)(8676002)(558084003)(38100700002)(4326008)(66556008)(66946007)(316002)(6916009)(54906003)(86362001)(31696002)(6506007)(26005)(2616005)(41300700001)(186003)(478600001)(53546011)(6512007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDAyZ0N2dUVmRFdVMnNraTZ6eFJpQWJoNGN5dXhWYm93Zkh6QmNaMGdLVHNx?=
 =?utf-8?B?UFAyNjhXOXJMN0xvZ3ZGRm5tb21RclpTR3VQY3JGcSt0c3FDdEZ6ZEhKRHhT?=
 =?utf-8?B?ZW5Wc05ESmxuUklCQnZ2d2V2MFFZR0Urd3g3UkN4U1NJZ1BGSUcvdFJXc01j?=
 =?utf-8?B?Vk1oSmtkQ0NUSzM1bXAvVlhUcjM3cU1nOHpBTzdndUdhV21QTUEzRy9RWXk2?=
 =?utf-8?B?SnRjZHZ5dWg5dG1oTDV3WHlNQ2NYQ1FsT3JaVnU5VkUyR0N0eERjN0gvZWMw?=
 =?utf-8?B?dnh1YlpKQXgvK25lTzNYaVBXQjlmY0N4Y21LT0ZXejRXWW9BRnBJR0dKZnha?=
 =?utf-8?B?VzJNbXdkOUUrRy9wNnJnb05lQXpwa0FSUmdPZmlKejBoY2NmUXhFWHhHbldS?=
 =?utf-8?B?Um02TFFyaEMzRUhVR2JSSEplMU52Slc1cFZSS3JaTUV1dWQ1eFB4ZHlwZGJn?=
 =?utf-8?B?MCtENHdsL0NwNE0vVTFBSml6dzg1dCtvWVNKQmhTeC9HRGFCL2M5VnExSGZJ?=
 =?utf-8?B?V1QvM1NuczUwREFtZGFaQkUzU3NSeUNOTDZjZ3ljc2xlMW13Y05yQ1ovdkdr?=
 =?utf-8?B?OGFoU215Mlp5OHU0NkdyUG9ZaGQxZWZNdmxvcGhva2MvM1pNUExneWJ6OFkz?=
 =?utf-8?B?Y1NwWkRsRGZTbGpOQWV5anJzNnFmOEI0aDBCd05WbXAwVjJtMWpmdEEwdnN5?=
 =?utf-8?B?eXpoOGFvR1J5Y2RJWVNrdWZ4UzU1SHl3dE1XUFd1VTAyaUxEZXJWYkxXRjRm?=
 =?utf-8?B?eHB0dnBEVlZxaU04bTJyZVdxUlFRZ3pLZHV3bjJTdUJaR2ZSdkx0UWFoNnFX?=
 =?utf-8?B?U2hUREJIVXRCS2pBSUN3TGh1d1FuenR2VzdYanVlQmVKeUNkN0ozNjVvYURm?=
 =?utf-8?B?cWJ3K0xRQi9XQXFycmZXbnFTaDNBc3BiMytYWCtic2Vvc1pBcE4vRndpZmhp?=
 =?utf-8?B?a2JpakZTVC9ScmVLeFBYcU1Sd211MXNaV0pINjBGbXhUTFZkWjBJNWE1Zll5?=
 =?utf-8?B?M3FRZDkzbFYrVjRlMnM5b3pDaU1ITGs1eUdzZ2ZpVVpURkRCMisrcFJaRno2?=
 =?utf-8?B?dXVTcHdOZnZaRngzUHo4ZTAveEFKVUpSS1FEcjZkMDQwdStyVjNvSzlVUVZu?=
 =?utf-8?B?by9wZ0I0VW1ndkVwOTVCVHBEODdNYzZEMjlwcEEwbEdPTTA2aTB5RC9UdXlB?=
 =?utf-8?B?dTdYc3VlOEYzbUNMK1J1dStTNXhqUU5zMWs1T0ZzQkN5VjhoQk9XL1dOakl6?=
 =?utf-8?B?OXVrdHVHcTBWbHgxdzg4L3ozNVRnK2dFeTYrSzJ1WFVCekxJSUtoeHpXVlVE?=
 =?utf-8?B?NlNVUjIzZUNFWk9QL0xRUENFeW1lcVg3em5yV1lUS0dqa3BPcXorSW1wcVdT?=
 =?utf-8?B?MjBvaysvakZhRUU2Zmc1RDdueklnRG8xeU9DbXhSaDdndUpSeW9xaSsxa0JC?=
 =?utf-8?B?R1pWNW5nSzA4T0FLbyszVDcxTGxRNmV4TlZNZE9yL0UyTzQ3ZzY2QWpvcU5q?=
 =?utf-8?B?UVNuQW82U1NTaCtTZ2ZKRVhmOXF5elREYUtOWnMzcTFKVWxHZENaMm4xd2l1?=
 =?utf-8?B?TVloOHAzdEFjNUZHdVI4VUl1SUlueWZyNWhZTkQ4UnRPaXMzTGtydzJ6RCtu?=
 =?utf-8?B?VnB0RjRVR0VucGZROTU5b2pVRm9QN3FKNGlBMU8yVWk4SGFkQzc4SVdMZWVD?=
 =?utf-8?B?NFlqMU50bStmcS9BaW9STDlnYnpsck8rZ3ZYcVRaeTNrTkdkRTJlZFdsUFhn?=
 =?utf-8?B?UzNZZDdNblExRzJldmpTOW9ROEdJK2JhMmRhWkRsbElGVHRQcnFrNm1jK0ZB?=
 =?utf-8?B?a2dGMEx6R2ZJYkErL05lTisrSkZ3eTBESlQ4VndkcnRPbXhVYXpiNmFteW8y?=
 =?utf-8?B?T0Q3bm1EaVlWYXJtVGcvWHg4djdQdU9PTUxRMzN6V0pjNWNXWVY3TFAzR1M5?=
 =?utf-8?B?L2RNS0k0dVlZekJNTUN4ZlZYb3lUNUhLZk5qRGhnU1h2dlBZWlk3ZjMxWHAy?=
 =?utf-8?B?MjZQVC91WXRtcDBsdlFNWXl4T3k0d1ZuNjdFakZBR2ZBb3BYbWVWREhDSitV?=
 =?utf-8?B?MFFzVEo2VG5kWHZITVVnWSt0bnI1b1NtQzh2VnV5Z3hZd2VzVmdScHE2d1NJ?=
 =?utf-8?Q?mCkowj4y6tzko4fkxH8YWfGxH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac93ecb6-e7e2-4eae-aec9-08da901b3528
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:19:35.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5sSqjRoWgWOJ/RJ/gtlGqVUYFa4JlwuWdEyoo5kC9O9zeVXBMGN8Bgm6rC34heIGekrkQVzxg1EkqpYBBdylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5538

On 24.08.2022 16:57, Bertrand Marquis wrote:
> ...because there are some script in automation corresponding to the
> build-* filter (build-test.sh and build-each-commit.sh)
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



