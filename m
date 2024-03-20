Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A57880C98
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695774.1085842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqrT-0004ih-T3; Wed, 20 Mar 2024 07:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695774.1085842; Wed, 20 Mar 2024 07:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqrT-0004h1-QE; Wed, 20 Mar 2024 07:59:47 +0000
Received: by outflank-mailman (input) for mailman id 695774;
 Wed, 20 Mar 2024 07:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqrS-0004fI-A0
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:59:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03olkn20800.outbound.protection.outlook.com
 [2a01:111:f403:2e0e::800])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0bb85c8-e68f-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:59:45 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 DBAP192MB0874.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:1c3::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.29; Wed, 20 Mar 2024 07:59:44 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:59:44 +0000
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
X-Inumbo-ID: d0bb85c8-e68f-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNvhJBdQu216tyXQ69qSuUMI/vqq9uO7+CBTcn0jD5CbPbgW9zFuGXcyTDQy7y3yqaPPcfFeoOV0JMsG8zoXYN+HXOYlW+ilcJgSLwWEHSDg3zdSLFI9pPwoU0PjoeDfLbpsfp3hRb8K9VKeGEOCVVXLVO7voxGGRsmSpCb9IFZehY82DR3IF7xRHAA6C9LkwphBfV5uWgb7ZGqHA9NnObZnAroMi2sgGXQE/sUUZQscLa+sQygpDThm+V9Z2hVZEn3tYcwKQERnW8DAcZe3Mm3AKqqwrRzGENv1PQKCAD2z7HCLUyau6yfTbRrZPNiQGlfx4/ZDi1SV92guXVCXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJNgPfgCjWQtDCDawue7cOj8VGYfozd4SWGE1P7Rf4A=;
 b=NgvQpowl3k+1ujp3aVyL1bXZ3QCEEoz2EffUQJoKFZrBPaALyqeSPPmt16KioiEH1u9Mf+MPhuIab6APh1ZYqDzexCPLHEpUxDTgQslqAwYFdo/JiUdsxT2x6krTnDMeKFuBqTFNhrxfRmlfGSFeUo/E8zF5K4jodXEYGfWjrxanzoQwVH67s1ik3cyxyElORPMoTUgeTKnCHvVh4WyUlmZqO6udyZFii6Oq04dvNadfdUed5Hy6cGAMYwBn6FP5D7NrjVcYzUSVRDS62tUk6K92gI8TpJ/hzHKKqn4BB1ZpO95HN4J2l1cYPmLM9r8mTP1qbFpOiMhn60entS/Rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJNgPfgCjWQtDCDawue7cOj8VGYfozd4SWGE1P7Rf4A=;
 b=QrlIY1lW3ecDlrz2i54Evs2TzANM+lXaPo8PAveKTxMQQnFUvpbEPANK/RhBLsZLP9ROYP02WpmgOqW0RfXq4YgNQ0D3H2T6EjYXT6HbIulgpUVLTzH4p4f1diDnTk5qdh4eROVzrs7+1bBGfIj/bDx8uqHeewoUfkgqyaoxL14torhc7s7C0U3G9QDnp+4IvVJYA7ks1jFkoH9fRtx8TAmyZun1vcvRZVQTsaJHR/CgzjDhvaBZ08zXg649vO7406oz1ovXZ3nwebw7I43Z6u+Yrp9rcw/hD/89STm/F5CQW6xAYOVpcJ7R12kxCml1K/Rx4P5rs+SOKsweLa5boA==
Message-ID:
 <DU0P192MB1700C9098AD44A62F123A5C5E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Wed, 20 Mar 2024 08:59:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable to xencommons
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <DU0P192MB1700AD4C3E33FF8F5D6E90F0E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <fafea1a7-c5f0-4e9f-bf49-3d0e6ad26ffc@suse.com>
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
In-Reply-To: <fafea1a7-c5f0-4e9f-bf49-3d0e6ad26ffc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [o2Dv5Cz0zieNe8+srK0KuFvfaFQ3QvGOMg3mTlLxnq1g+D8sVAJjZ5X813uNsM0v]
X-ClientProxiedBy: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <5e10fb09-12a2-4500-85f5-de0b2140405a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|DBAP192MB0874:EE_
X-MS-Office365-Filtering-Correlation-Id: 98be0696-29d7-4e6b-c2d6-08dc48b3b42e
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TVoUMj8BWYCuE6LiLTPpwRJv8uizpVsrIErp2ChADy58sPN0I79IB8IhVmfPFaxHKUrIrswQjSqkUWXlqdymPeuf9Ev6+fJ613+82ZFj38jCVNXhCuns11ct/31fl4XCiRw73QGdMXlYWkse3UiDp1UpNovnfAulGYy7fcjkZcSz8MRdJF7ekgFpu2M2vLUm9SqgtWihlqppOFIdyuMyr2h17BWwUpv70xgtNFKWVvRbYir+/vJ5ul5oshbVqokjZVd6Df6VhfGcDy8HOwksSBuPIwRoaXVCEsoaQ7YoPy2LbC0BK6fCwvdbR1aWp+RELb71Fd2YH7CuCaAxd+TfZN+37lsAHDkAMc6lJxTiQn3f7jx8M9EjwqDSIjMMl1tOtkr1dZ15OCFc1sYI8t/s1lMTQwhQqR4VniG8MfS8aJs8gSbz3PYg8L83n5CqlLBEI7RMkwkSElVif/T0cWB8eVOcEn4n35iYjLQSi5r8YplWVwwpAJujsjICXW/p9i+hUcz6gXObe/EwGBLAE06lMY9M55K5VRoejsnqc1ugslhLnKTfjIr+cknIqR4CQtArJ/TTJjf+0mdzlNq3yxOk7b1GqUSnC5W3Q/i2akMNlEF+jNhs+wIU2KUfFae2Sl1m5Lvowyk5eJOjgkLjyX8TLcQAOAX/bspZnHw6LOL85OU9mCCRuDx6mWsrlb99WZV+qeexMjiPc7vHmdD8uKOLgDamupfIpPR9ZIrfY+MjrNUbQ6pTfRkWA7NNHTiK5OTZq1wNb4gIRK6gNgfNOxOLvRlq77FKkqZqmw=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWaOgCfOaJrc0owJgYxbPNI3V1y6wXtOQkkChsZ2MIt/DHv6ysyGStZgZl2JdhkA5Fqg+M5w/BMTeiShRagQnr4zM8wAgz7Xfy2R8jErBJDVMKlg0SEbq82WiLubRZ311IIf+kfo+LKn0uSpuzu3sHXBQYieODQK40RHYPjBnsSffJqDCnaa8Ld7Jt/XG0a2Zk/6CJt/d6AbQ9tpX216kwJcLtDmK2lyFx2yJpVgeysCIclsGyVwFGNv1VdT7eZAvshI7jL5WECIRbFpR3A8qNw/+k3V4uc4OxN9MnqyEJIKxDeGH7QGSgBNUkVnFDhvGHX3gxFOf3g+1MeDXWy4ciUxaVMbVIjXBAcFS/QooDRWwmrSuVBe2z0FxFkdzjGNf5mrXisjgpeZjOCSVuifclqdsii/UlopJQwAeXf+YWyagd+pYjayUNZmA56w/H9LW0ZKOiNe3WEwTq3HakVB9KJD8xcK62opmvFdg8HM8o/BkesengOuicjjgr1TFXAYqJymt4OcJt0Z1HB8tw4zM1YjyZvKRN1qrjZCIGMjtdfZif5iRFokNx7cpy+TpsxT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3RGcm1qL3krS3htc3pxUDFwUWE2aGZ1QTlTYmw4QXJ6dzNJQllzYmFVb0RN?=
 =?utf-8?B?blFsZVJyMGlZQjBtRlFXbVlEQ1lxVFNLWlVJYWhLVk84V2cvN1Z5ZDl6dXdG?=
 =?utf-8?B?VGkxUGhCOWh4TXVtWElLakxXT0JnZklBOWhjOXRHSEpTY2o1YTVLZTMwMDJ2?=
 =?utf-8?B?enArcjVWRXJGQ1hSdFgxU0RqMk9WQnA3dkpZY0pRVUlFR0dCdzhLNko2aFBP?=
 =?utf-8?B?M0NtSC9xSlRMMSsvL3duL1pLSWUraWd4c1BhMGJIR0VIM2pYaUxhQWdOM25s?=
 =?utf-8?B?ZDhoWnJZTDlOZ0NYeDBWUjZLZ2xkUTRjNXFUNXJyUzFMclRScVBzV1hYbHZ1?=
 =?utf-8?B?clpWWmVOdGlFQVA5cDhJb2c1alpNa0JwREd4cUt5ZkRWTURVVFA4b01YUnhO?=
 =?utf-8?B?bkc1anRwVVNHc0syVEg3cXV2R3Q0dFBEZlgzaHZVOExPNGJ0d2FkL1Y5bDVv?=
 =?utf-8?B?TElrb0wyamVHOVd3Rmd6VXk2QWdtdnlVcERqQWl4RE1XeTd1cmoxTGcrS0Vz?=
 =?utf-8?B?Z0ZaNlB3enFob25zV25NbEFHVUhGUGxwdy9HZkh0RWpDZkRPM2dnUDFtUVJG?=
 =?utf-8?B?Yy8xdHdDZzJMUkF6dVJnRS9PbzlRN24zTzdHVHkzbVFoanpLV1BKbEplVjlB?=
 =?utf-8?B?ZWZHZ0hKSE1CL2wyWWRCZGJ1L2x2ZG8vRTNtUzMwVHVpbXA2Q2JJdDJWdWdo?=
 =?utf-8?B?SlU4UE5RNTZJNEJVOGtZOTRwNG1yOUdjUXJZdGZoalVweDY4MkZqYXhHUGM1?=
 =?utf-8?B?N3NucTBtUXlGam5SVk52dlZmWTVhclhhekI0VFVOZ0xqVDdVU3R4Zm1xQUwx?=
 =?utf-8?B?SUZ0UkZjU0xUQm5lUTY1NDVkZjNTT2t2ejNmc3d6Tmd3ZnNnMDB6bmtEaWZB?=
 =?utf-8?B?TkVHQlpnR2pObkJlS1dDSDVUaVVnRzRLYmpIc0xqLzQ1Q1hUZFpKRnZrNkdP?=
 =?utf-8?B?T1BuZmZEb0UzclVDbmtvZGpZNndlTVFEZUJNbkdobnZqSDZYQ0puc3JDZ1dz?=
 =?utf-8?B?eVI2UVlnY2p1dVU4djNFdFZoaXZuaTZ3bmg1aTZsMGxxOFhlSlVTdmx2bUtJ?=
 =?utf-8?B?YVVPT2t5QnFSaW03emJpaXNxS0xOOVJzK0Y5U3hQbHNRRUZBOGVlVGprTTFR?=
 =?utf-8?B?TWtoNGtVczVybE5qL1lObk5HVWFEVkZoWnVEMVVzSzk1cTFrRjRNNEF2NHdS?=
 =?utf-8?B?eU5EVHdKcUtKQlF5cUVidjJDY0IxYzJoRmgzUW5vWkEvMW8zVXo5UW5ZOG53?=
 =?utf-8?B?bFdrejcvT2tnamp6TnhKSHRQRndTeWZaVzFYM2MreFdlVHlJelNBNjF0SzJG?=
 =?utf-8?B?N0h2TEg0K2tGb2FaRk5mNlRza2tEdWRQRzIzRWQ1NXJZN1oyRDlUWHJ1NlRn?=
 =?utf-8?B?L1plTHpybi9HS01lR3BSNVlJdjh5WDB1NFZSbktqK1NkbG1IU1hrbXp5NHJP?=
 =?utf-8?B?WWFLbWxoSkxtcHltYXdXM29hVWcxN1BkUVdSR1ZFQldrRE0xaWo4SnV4OGpU?=
 =?utf-8?B?WjhsbmwyZnV5c1hNQmZyZjRrWnJEYmp6ZmJZa25qQTh0YnkrandXSlZiZm1w?=
 =?utf-8?B?cklhR2hkcDdZOHZQbTZyd0N1c2J1aEZOUmx4RHVwcGJYd0VRWHpDT1V2cUd4?=
 =?utf-8?B?OGFpb1JWVG1CNnpmdXFvRTJUUk53VkJBckhYZURNcXZuZUxSWE5FYVUrbXpC?=
 =?utf-8?B?ZExiTzBrLzJYMm85dDdkVjJOQUZqNys5R2cyOVNsNzdtb0FBaUUramdYcUJE?=
 =?utf-8?Q?aEljFMACTg44JifPpmRNFjJ7jg5ebadIXTQb+sf?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 98be0696-29d7-4e6b-c2d6-08dc48b3b42e
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:59:44.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP192MB0874

On 20/03/2024 08:55, Jan Beulich wrote:
> On 20.03.2024 08:48, Rafaël Kooi wrote:
>> V2: Now without test emails ending up on the mailing list. And with the
>> correct title prefix.
>>
>> I noticed that the systemd services referenced the XENCONSOLED_ARGS
>> variable, but it was missing from xencommons.
>> I actually ran into this when experimenting with a Qubes patch where I
>> thought I needed to modify this variable. It turned out to not be the
>> case, but I figure it's good to include this for sake of completeness.
>>
>> Rafaël Kooi (1):
>>    tools: init scripts: Add missing XENCONSOLED_ARGS variable
>>
>>   tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
>>   1 file changed, 6 insertions(+)
> 
> Two further remarks: Patch series want to have the patches sent "in reply to"
> the cover letter, such that the whole thing appears as a single mail thread.
> For singular patches, generally no cover letter is required (thus avoiding
> the question of threading).
> 
> Jan

I don't understand why it's not present on the mailing list, the
"In-Reply-To" header is present in the patch file. Maybe outlook is
stripping it, I'll have to look into it.

As for the second point, I'll make sure to keep that in mind.

Thanks,

Rafaël Kooi

