Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93A4880C06
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695749.1085771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqOj-0004FH-7s; Wed, 20 Mar 2024 07:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695749.1085771; Wed, 20 Mar 2024 07:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqOj-0004Bf-4j; Wed, 20 Mar 2024 07:30:05 +0000
Received: by outflank-mailman (input) for mailman id 695749;
 Wed, 20 Mar 2024 07:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqOg-0003na-U0
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:30:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn20801.outbound.protection.outlook.com
 [2a01:111:f403:2e0d::801])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98e6809-e68b-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:30:01 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 DU0P192MB1844.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3b3::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.31; Wed, 20 Mar 2024 07:30:00 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:30:00 +0000
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
X-Inumbo-ID: a98e6809-e68b-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imYAOP8wLMA7v378eGHPL8P5DfZOkDRPQVWKRuUagiQTanuzzn1HIMjmij5WrISRchlZqVUiWn7usQECTQmwwnXVg+sRDjW3aUYoMoOWK+SMRl3Yy3BxUHnAl6amp0NCEz6ZaV+E8Fq5xTuRT3kvOw8ZsRCtAry1OfUvnzO51EkavEtB6tDWh5xxrnNOuT5q1fCshEADjKjpWYB5FGeuwaACheizrlbAKo3otiSqIhmaFam45HQsS95mOUg9GECYHw7Ks4e3O8cziYkLXtg3/uN1uAAhiYZln+icuthlcoNhtJiF2AHfOLf8wrYj7b5GFzy5EmT/vIJMuOvNs5m3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxLIUiM0054MdvrI8eeLLF2BMgfWdKU/mFub7eAj0wE=;
 b=A9n6izB/4D2wKW3ZS3X1vx0CrNBmaOarsOn3U3u7cwi1ODec7ZQylorLEZEctk03oQ3JBODaXdp/qqNekR35ZuQsDO2DpQ1h7XttcC8BTb3Ced5puwF3qUOaXcAVvI1cmRkGHGTQGs0lnP/uzSEeeoVGC0xXflp7fdzIe9IZm0n24DXcrmLdiK7oLh3O7Jii11hyt+z3UQiAA+ZwBKSBM3iEoEP66INMhdG2fIbeCAMniuCdXpudOA4ZSS9CZqLpK2dq1u+A0FYcX1ZbiBpp9nzPR4aS6B51smHBR208e2/mc1xlR3hsw24+W6MXdxxXIhUEBR4YN07jSKpqNc4NdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxLIUiM0054MdvrI8eeLLF2BMgfWdKU/mFub7eAj0wE=;
 b=EeuqysqV3imK89N8ng1wdM38wqMBQ6qPz7EKAVjRlcjVetEQKhVQrXRFNRmsZ18gf9yUYP8cb01RKDMisB8xPDZjjTcLRCEXE9gR0GHGw2XIhNhh5ixnOhJw7x5AbAu4QAv1I6elaEsDCiGbUG2QcUqfEzw6hym3Fz39NksOrpPowf8oKAHly65fkJ/JzW9XI+93YX8DFBk/qZvOGjIjp2fa2MIKrog0XcVW6gXpqSq5GuzjKm/44r86GrCkJpFPImXIlwqExEDILOQ8RdCcj2r7G40n3GUHICfb8fReWrptgxyc4/51Moqlc7bPS3Xf8iKYU2/B6WdQyPQPXhZc0w==
Message-ID:
 <DU0P192MB1700591AA22DB4D4B1CA3B19E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Wed, 20 Mar 2024 08:29:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/1] tools/xenstore: Add missing XENCONSOLED_ARGS
To: xen-devel@lists.xenproject.org
References: <DU0P192MB17004F56DE9EB04D3F4D8D8EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Language: en-US
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
From: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
Autocrypt: addr=rafael_andreas@hotmail.com; keydata=
 xjMEZHDtHhYJKwYBBAHaRw8BAQdA4C7O72UZHQbhHNm1BUkAM/7+KQKN3tupyuGVGyj2dIHN
 KVJhZmHDq2wgS29vaSA8cmFmYWVsX2FuZHJlYXNAaG90bWFpbC5jb20+wo8EExYIADcWIQTv
 ioHnE84MxV6adj/iFi3SALEToAUCZHDtHgUJA8JnAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJ
 EOIWLdIAsROgP80BAKeJdh3YQ5l3gxGp8R9wIvN9Ac3vsMfy8I4kZ6TXksLKAP9vLRV4G3yw
 z7/seKhWc27Jjl4uI/+lIWhWaWrUYZmjAM44BGRw7R8SCisGAQQBl1UBBQEBB0DE61lbAezY
 NhOlHgxdZ9V4klIhSajeU50O8wHIPQnCLgMBCAfCfgQYFggAJhYhBO+KgecTzgzFXpp2P+IW
 LdIAsROgBQJkcO0fBQkDwmcAAhsMAAoJEOIWLdIAsROghHgBANU4dj+WnuSaWemAHVkjERJg
 m0FQpmZzNI8hdolS3gYdAP9zGK65ilpHMDj4pGvfALabruZA4NPJYxSqeamHvOuhBA==
In-Reply-To: <DU0P192MB17004F56DE9EB04D3F4D8D8EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [bOaI1tFtjtIl8tumCIO7+pX+qdsA52Z/TDb9I9Xu2xbVf3Mzk6WEKCUSKeegnaXp]
X-ClientProxiedBy: LO4P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::6) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <27a2a7d3-647f-44dd-96b4-1771dd94d77f@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|DU0P192MB1844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c406ff2-275d-4cf8-de07-08dc48af8cd8
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVMHQwHL2Y6Z03kJoUnJnLRn98RWvgv4h4QAFNqzvOFEO1CBUDQU6PpQv0nVge7CA73tBsQyVcEiDFoIWv15xN/jnh607qoviTifikvLzmFd2WEpq3HOEfCjs1HOm6/T7ThP1tEeVPxCOyIleCnU9RlY4FSH5Q6U7xngxfMay22ATzpwY78xKxWrGjmDjNTjFbr4fmypG3lyNAUS1t35uTSkfZR5pKNP5rOJEG3ytan9XMLdXSmbzLDl4OVDeeB1WT7fABuicdOjVhWEFV42Xng98L3kl1O4p6DkNowbwqeKRB3BCmT/akEsfe58rJJkCiCkQCAOFbjPADXKhJ8ycA2TNyYQg9fa6LtcnntPV1tZ2nWewnw05Bj6QKm/+A2z6kZfq8abKqBvFsco/rERZf+wBwzXyUGHTgeZLkGpBtGqc9zzEW3Ee9Lsv77oqQ9qsMk6QnNjn4FgbEXs9FjIeLpOrVSFhyLW8N/Hgo6ARkBDXrv4v2hfqKvVhm7CQob56YMhrnIetixTofVywBCcZLHF/bENk25D8p0TQQMjCx6cWr+fv37PQzFLWrSpC23PwmBFJeO+aN7FZXAZ8hvzRpGtuJdvC2sWabr1EFmx2dokTaV0drKOQkuT2jSwl7KQwRXGIDwotIcgjHeo7YJxkufggTZguM59bq/iL1JmLVjhOt7p07Ux4i/DjnTXxpognlqHlHt9Z7vGupujCpJgWV5Z7PA5WCNVcNSjJCjRIKfj8Wy2RxZDb/RCRsPkdinD5Q=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D+u+k+yk2nMDmXxvePcE+pVrm0OBDbNWWDH567/G1QP+p/koruQZQqJKuLRJnvcKC9tIqi11qJ6D7+bJLw7yx7LNsWr6IIlrlRETo4itFbdeI0MiQP2Ql2pB9K6cLvtM6UE8SkO0pWjzGswD5HNbiAxJ88xIhoHHzaTf00xKUNAWsSl65YNGWUnGvS2iLXBLFpEFJe62Kuy5X3ABBhC1ImZMeq9rbA4SANZZMLkVaTJSWNEk9YgDWSfFQUJwbFgZmzSjC021+FwZ/vjXGB3XquPFFlbJjWJCk1+V0+CYQLWzfeP8UEA7Dr5atydjfKnVFEEEy01IpYlwLmPyZPPmG5tSnB20S0nxlZtSeQM1SNTBaImDChpyV+lJOPOAI02vsLsslym/FBAeAUBmfs4ICFWDjrEvX35ha7/kmwaM5LygqCt7jVZKSNzi3zYgebTNaLm/Tvmotr+1Q4sg0thBFKNh1IdcYu1KiQpQedh2rSADCJD/CUp90zMX+52NkhgAiegfkfpS13qi8cOsxvDwPnIZb4qVCBQL9FSa2ey8+QiY1Mc5BeEhnhQS1nmTDFC5
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEVDVktRajdFTzFhN05YeVJpZGt3UzR4STNyZ2ExVkxiT01Ba3NwWWd3NzNP?=
 =?utf-8?B?MmxCQ3BzelV3cDBwdHBFYkJyNWxMUkNjRUNsM0ROMlp3YWhuQjQvbkNNK1o5?=
 =?utf-8?B?MWV0TmtCdFRtRFRyM0hVN0pMdm5sZEVidUVZWERNOVJ4MGlwMVZMR2UrelF1?=
 =?utf-8?B?N1ZhbkNrZEpPby9HSzdEL1RZT0JXOWxTd3RHNWRHMXJkNGRWdHFEM0Zya25j?=
 =?utf-8?B?V28yYnp3WGNwSjZxNENCNjRveTVrd3d5dnc1U3JXTktqeUZPLzBqWEsrVWg4?=
 =?utf-8?B?UFllMTJsZUdrSFcyS1ZOVzdGTSt1M0d3ODQ0d0RaSDF3QjBkVHVJNmg4MER3?=
 =?utf-8?B?WXVXNFJ6eGZub2x1OUhOVk5JOE03Vkx5RDNYZXVrbXJVSUVIbmNiWDJmNzlr?=
 =?utf-8?B?K3ZTaEFEbzVxbUZEMUx0bW14WEsrcGp0V1A5NXhRY3dsSWJGOHRpeStzZlJM?=
 =?utf-8?B?Nzg1NEp4YkF0VFhoTlJsdFZESGNlajBneFIwZkFvR3JDYXdIUkZsdGFnQjVG?=
 =?utf-8?B?cGY0V0VTbGhteHhTMlNuQmJhV3ZuRmZYdEtKY2hRS2MvazFFODdQV3JacTJH?=
 =?utf-8?B?VHFINy9zZGVmT0p1TGZrVm9DcW5GQjJNdXdlOUNQWFk3R1gwZFdkODgycHNm?=
 =?utf-8?B?RHBXellOVmxJVmhKajRjTlV1ZHpiUytURUlNZm1wVTB2em8rNjUvbXJRaytt?=
 =?utf-8?B?MlZsTmVxTUVDM1ZKMVpYY2VLZUJOVUdtNW5pYldUZUpZRDVSWmtpUG9odjI4?=
 =?utf-8?B?WFl1UE1XQlc5Z04ydEtQdEsvMEQ0dUhDRVFBTVR1Y2NOT1pvZnNoNnIzUmxy?=
 =?utf-8?B?eTQ1bWw3R3A0WkJYYjNxT0FSZ2JndFJidy8rU3BYUkFsMTZCQStyVjdvL25i?=
 =?utf-8?B?b2htcW5ZSHByZ2p0T3BibFNJNnVlNTVWQnZFbXdkUmdCbVpLTnlaMXVSTE5z?=
 =?utf-8?B?RUdLZWRVakUzNWNCbkdIV2FsMW5UbmhDZUdlejk2a1doS3h0VUhrUDRFMFhI?=
 =?utf-8?B?TW4yVUFLdkU2dDh0b0ZrMk83Y3Z5b3BpQlRZeVN4MTU1Smc0OW5lREFzMTN5?=
 =?utf-8?B?SkFLQkRSN01oVy93cTg2UUNYZzZtSndsYS9rQXpBSVpRdjhYQ21OWk51M1NB?=
 =?utf-8?B?L2crN21WWGhzaUN6NmRqaGVXMXRucEdwckRJaTZCbjU2RDgrb3dQeldmZDVM?=
 =?utf-8?B?UW1pWEUrQ3N4aVdWUzVQeVFySHNxNlRvSHFQKzkreTFiN3ZkTTRpM0hZNmNn?=
 =?utf-8?B?aG9QRlAwOXRaa3Q1MDhOODBtdzFKOXBOcjJwNjh0THh0TXFEd0Mvd3plV1Z4?=
 =?utf-8?B?L25iRU1tUDRlUzNZakNaK2FUNjFZbWZLMGhwY2d6V3VXYS9mSGwwNElLZ2lw?=
 =?utf-8?B?WWMzVlBQMGxRTk1wRFdyRVFOY05BdGFPck5IRUZ4a1YzU2JFeGZiRTU5dW5W?=
 =?utf-8?B?TE9IYytxL1lIZnI4Nllia29ITEdQWGQrcVVwZDE3QXl1alp2bUc1UlQxQVJ4?=
 =?utf-8?B?WGRqdzFKR2g4NGU2aDRsd2ZRSHU3TWhXU2MyTVVrK0ZYVWp0NGxLY21pRWtI?=
 =?utf-8?B?R2RaanVzTzlKRmU4V3hCWWJDc1E4VnA3cmFyRXk5OUM4U21hWmJvQXpYbXhp?=
 =?utf-8?B?Z0ZKTG1udGdxWFlhSFp4UVlSVFhJUWFvcXlnM0VWVFh4bzM2V2o5aEd1WDUz?=
 =?utf-8?B?UkZxN0lOZTJHZXNVMUtEK2cxNkkyZlF5Q3ZVOU1IVUZLVGlyUmYxUFRqQmx2?=
 =?utf-8?Q?lvOEimrgcOUJqhs1Q1ZpJ39uJccGUIFJDAdQjSi?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c406ff2-275d-4cf8-de07-08dc48af8cd8
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:30:00.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1844

Apologies, it looks like my test email ended up on the mailing list
regardless of my intentions. The title should have been:
Subject: [XEN PATCH 0/1] tools/xenstore: Add missing XENCONSOLED_ARGS variable to xencommons
And Wei Liu and Anthony Perard should've been CC'd.

I'll try to do it right next time.

Best regards,

Rafaël Kooi

