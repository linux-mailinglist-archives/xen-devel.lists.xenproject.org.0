Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E619D49DD19
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261333.452364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0bD-0007im-SV; Thu, 27 Jan 2022 08:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261333.452364; Thu, 27 Jan 2022 08:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0bD-0007gz-PG; Thu, 27 Jan 2022 08:57:47 +0000
Received: by outflank-mailman (input) for mailman id 261333;
 Thu, 27 Jan 2022 08:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD0bB-0007gq-RG
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:57:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31253653-7f4f-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:57:44 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-x5LWBLMdPK-1BF6XDJn5RQ-1; Thu, 27 Jan 2022 09:57:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6626.eurprd04.prod.outlook.com (2603:10a6:208:176::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:57:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 08:57:42 +0000
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
X-Inumbo-ID: 31253653-7f4f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643273864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+LARHJ3Jw2ikV93/VgUD4DRI8yK6eLd4xIzdHttfjo=;
	b=mvSZ4IKvZVt5p3yyikga4hOPedMo7V1CaqSVztIMy82Fm2dkXsJ+3vIGduhPVfvxRPN3mB
	cFvRZ62kWVdz7rs1+wYtsIaVFbkESFZsUH5rioM9zi81aQSA1gCkscEGPXdZXpADs8ufBr
	3YwiL3+D4J0Ke2GS/jCBClIkzurkuzE=
X-MC-Unique: x5LWBLMdPK-1BF6XDJn5RQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3Fw5umCEIf910FgAFe1m5xVB7h5c64OZrflApoBnTkLiFtNjoFQU3WvVtQD+x5Z/rcUyAjAh23yRLu0cjvXqjekyqBYZk+XljwansZUJREz2R/hJ4HoOJL3d3hPbQxXo2qoVcVy0sSPQvN8B7GCP0JoB457OBWFWXIFHKZfb0bBjpVS61msgISudg9FK2InsD5kCgacJB9kvnhQYx0NxnxhEvFlIaMZJogaWqOkQbf5Td9M3l4Lt/1N3fWxfE1MfTBlQcCzfE+3bLmtoBUXbBD0yTWgT1IA8rewlS3lwIp7bGMsEO2MEwfI84SOHMSQuFJUEoF1qCZzUwq7HxXZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+LARHJ3Jw2ikV93/VgUD4DRI8yK6eLd4xIzdHttfjo=;
 b=ACqYfDRage8LNs4hN06DrfpHZXAs52Y1kJVbVI+89yRm5cvu2RGWEa/Ad1TD5k7OZrac7PS/TGAoy+cIPLyesaH5tCLgMANp4BL2lmHTkrtMQMDZbKVxFUWwvM96UtKlmPR2I9eknyVPA8fkdgkszrxcVs0zfuFX71Tqygv6vxwsIvKxbsJAToyZOIbD2x/uAOSP6AQUNFFVWthrJnW2UneUjIsJncGPMvZ4+juiIuRCZhhhkMewx6FUWFkuUuGavOwg1V0WybZ58fhOuAd1Wb2/dcDZpmJIK4zVWOW8zcCtzhLR0DA57fx+TgvcmgzzYsaY/5ERy9QbJfc631Q2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56f4495e-498b-960b-f8ba-5432896fe926@suse.com>
Date: Thu, 27 Jan 2022 09:57:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/decode: Decode remaining TigerLake features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126184758.15902-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126184758.15902-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0090.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0aa8ebd-e9eb-49dc-55f2-08d9e17313c4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6626:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6626F913D096CFFB4114689AB3219@AM0PR04MB6626.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wzcJG4jdRoPaWrKU5Cxg4/bVflThpYXB9mpJF5jMFlwHWc4n+L7S9Fh/jQL91sBXwsVdEwghwTfpeLLpk3iiIT8HkWxz6xssmZN2/aRkZmJMJOeE9z6D5U4KO7aipZsXkGmJmPyTTWlSkZ58ywaThi9EFamLrod26frV/P9LGTzLcgJ22fjzKTP1fKPgJZxma+5pHyaRrS9V9ATlng5SYfd7B1PxCFiAaWfCNENLyTvH724l0IlLlfFZXn85Hb5saoCqIBAe1u6u+ikTMFOgpA4FtuYJ8J+0GD9FLAGSLs2mLOD5CgbbywOyIw/NikNjO0fuwOowYn2/6heY/TnrC2lBiPyXpxlg3Gc87Qo5KrDQyCt8silKd1pPGwNuTdkM4RgNpM1+ir95U9df8O9ChzEGrtaAv5w2LxNo6b6mGN+p8cLaMFEEnQCaEuxoO0fybZbzJLhjZQfaIj3lSJhZQLPuBbA25mpX5Iz3qGv+7oFSmP6E63PXwuO+WECUeDxlMnlX0o9nO7lSoUEgrwauiD64TO2Z6WugHAKbq6Y1GaEE33Ut9ubP/SSb0+ug3F8XLBD1VXnnL+WSNgxuyPuzvRtAusKVnMn2/ex6ZEfwri8ATOxAksHI7CwgeDKW3408Qzu8lLOXieIuuNVjclHyOZIgGs2zzZ0GMq3Z1Q6FjFOSDLthITU6Zd2HPXvNamM1bF9UaLFhRMDb86+3MKatj8xULoghtNtwP8ZCrkRbxIaTPppftUlz0DcOB6WPx323
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(83380400001)(36756003)(6486002)(186003)(53546011)(26005)(2616005)(31686004)(31696002)(6512007)(2906002)(6916009)(316002)(54906003)(86362001)(508600001)(4326008)(8936002)(8676002)(66556008)(38100700002)(66476007)(66946007)(5660300002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJvVG1zVjZvS3puUTNRZ0V1dTcxTkkvZjNDL1JlVXE4UEo3TjlZOWhwN0hs?=
 =?utf-8?B?Z0owa1NGUVc0Y05iTU9VVk4vY0kwVytwN0JrZE0rc0JBc2k4dGliV1JPMysr?=
 =?utf-8?B?YW10WVZTZ2pwSE40TWlDaGpqZmJVZ2tPcUtqRXNZMSsyd0dNNy9nWDd5MGNS?=
 =?utf-8?B?dTJYRGFCQU5XK25HczcyekpxT2h6UVBNTkY2OEIwTHZaZlZERVh0MmkraEFD?=
 =?utf-8?B?Z0RkeXVHN2FlOTZMRlAwdXMvYnBsSXptT2Rmb1hSbWU5YVpUejM2SWtkdlJV?=
 =?utf-8?B?RmpGR3Q5QU05eThvTDMvTlg4NW1kS3VsL2tKSUJtck9lZTBNdUR4bTVoTVBl?=
 =?utf-8?B?SWJNM0hrK29MbnY3V1hJVWZOV3ZkM1RsRi8zNUQ5Zzl3Vkp6T1gzalJnZzdV?=
 =?utf-8?B?NHo1cTZSNGEzUldBWFFXRkxBSXpwalhUak1NQ2ZsNm85ZXhSS3ZqYTE2S3d6?=
 =?utf-8?B?SC8ybDVBYTBPOUdad0JWeklHZmJnWDdVVkNHQ2psd09seE1QdVJpV0lEZDZv?=
 =?utf-8?B?Rkx1MU9wVEIwaGU3TnRYcFFQTTFha3VxL3NiY3JiSXZ4cC9uUGxCa2xWT3ZR?=
 =?utf-8?B?WGN5NXBWdWJuZ29uM2EvMlVyNXplVEcxTGhSckFTVGd6eGRlRmFHRGRnTVp6?=
 =?utf-8?B?SmxKam5TR2hkdDY4cUhJeFRic05JTFlrWWcwb0tYVUtqVTlrakFUZ0Rack0x?=
 =?utf-8?B?OTZISS9vOU9GdldwT1ZwdmliZUlSVFc4RHNzMUtMdVN3QW9jWGZ5bGJCVFlq?=
 =?utf-8?B?UW02ZElpOVVpczBVTHJqVkxrMVpFTkF6bS9HTzBPOUI5bWJsSW5WdVlZNkVZ?=
 =?utf-8?B?enk5NGJNanV5dVEvQzFLOWhtQmtNM0NUYVduWlN5M3VFY0lURW1BTVlZTlgv?=
 =?utf-8?B?aUw3QUtCTEhpQ09pOVRuazFRWEJvUUloL0JhR0ZGUDI2ZkRmQ29WZ09vMHho?=
 =?utf-8?B?NEdsZlNqSEVNM3IwSy9RNGpEQkdON1l4Q25IUW5mMUJGeXJzSkZqczh3NHBR?=
 =?utf-8?B?TnBjUVQyOWxzRlBnRUNwM3QxNXl2VDU2Uit0TFZOZFUxcGwzbU9ueG1VSE9B?=
 =?utf-8?B?TGo2SS9DTUVNcTQ5QzBudG5LZzg3c2l3NGV4WlIxMm9NM25tMSsreTZlcEl5?=
 =?utf-8?B?SXBsQ3ErYlhLVWRNd0NxMVVZRytUME1YM3hmM3NSVW5HWGZPaTlTa29FeXJt?=
 =?utf-8?B?bElPa3psbXIyZSszbGxaUUFxQk9FU1phU0g5dzVLcVd6SEFPL0liNEE1WnpH?=
 =?utf-8?B?VEt5RzlKTmNZK2NUOEdwdnJDRDB1VnRic3JScURzN1lUQWN6OEI4QStidDB5?=
 =?utf-8?B?ZzRwVWNKKy9aY1Rla3JCNi95NkpFbWVOcmd1bmxzUVFjYWZaUktVa0ZNWTZ1?=
 =?utf-8?B?U0ZFVXQ4azZDTW5MSG16bm9ITnB3ZjZuQlZWMWprQjNsUEpJVk5NcTNMMDUz?=
 =?utf-8?B?d2hiSGRMWmFocXk0NERpeG9WVHpNeFJQNGFuWGQwa0NwcHFDYVNXb0lHc2NG?=
 =?utf-8?B?VGZlOFRyOU1oMkxIeVE4dTBobkREVGszL3RsY3ErR2xxbXlvdXRyVDcxeUs0?=
 =?utf-8?B?SWcvc3MxaWhGUjluQWhHOWRMU1BabnE0SGQxTGVpMmVOMWV5MVdqVnIvMkEz?=
 =?utf-8?B?S1N1U3RnYXBLV2ZObnZQUGR6azM5SHp2TEYrYVBGUlBPVGRzRmluVHY0MHFD?=
 =?utf-8?B?LzFJK3lVbVNveDk1YllCUVpLYUxaZDM3Qktha1hQYzU2bFJaalVMeVFGNkJr?=
 =?utf-8?B?alR5VXVpdWlyNkJFano1NmthZDJBb2V4TWdwMVlKVE0yc08vTG4zR2FVSEk2?=
 =?utf-8?B?MklXczRZeTZkb2dnL0w0MjhFS3dvWDZPdkpDQWFVN0hJRWlQaENSL1RpTnlL?=
 =?utf-8?B?Q1JFTHgvak1OUGZkZ3VOMnZYZS9FV1JGKzhhQUhHbkVWZitBdFc2QzFWcjNF?=
 =?utf-8?B?ZlNKRlVXanRxdHFuM3BVc3R1c3pCdjBhQmZnNDJKQVJIMTBTZEVyRWc2SW1H?=
 =?utf-8?B?RC9FZG9xNEJ5QmtsOGo3SUJkdXFQTEdBemZDaUxVK2F0MXZBKytFOXJoOHVV?=
 =?utf-8?B?aTdCT0VwM1M5aS9HUTdMb2FnYW0reGs1SHBGbUxmOUxxNVlQYklKUVhZdzFT?=
 =?utf-8?B?a0krd05UUCtRTGFvUEdPYS9Hb2laUmwrYkpiYzFLUGhHc0hFQzdhTksrMFRh?=
 =?utf-8?Q?xGzEY6g+FgNUVL+gK/GuW7I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aa8ebd-e9eb-49dc-55f2-08d9e17313c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:57:42.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxRYXcLWMH9VdzVYy2RdO8Pi44vk/KkQ63I+QUjFrwFJxXv6b1huSXn4bMtCv756MO2JVY82MynPXIT62g9GKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6626

On 26.01.2022 19:47, Andrew Cooper wrote:
> These are the two remaining TGL features which xen-cpuid doesn't know yet.

Well, for KeyLocker that's only part of the truth. The KeyLocker
leaf has further (sub-)features.

> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -208,8 +208,10 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
>          {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
>          {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
>          {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
> +        {"tme",          0x00000007,  0, CPUID_REG_ECX, 13,  1},
>          {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
>          {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
> +        {"keylocker",    0x00000007,  0, CPUID_REG_ECX, 23,  1},
>          {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},

In my KeyLocker series I name this just "kl", matching how the spec
refers to it. But first of all - this is unrelated to xen-cpuid and
not very useful to have without the settings actually being possible
to use sensibly.

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -127,10 +127,10 @@ static const char *const str_7c0[32] =
>      [ 6] = "avx512-vbmi2",     [ 7] = "cet-ss",
>      [ 8] = "gfni",             [ 9] = "vaes",
>      [10] = "vpclmulqdq",       [11] = "avx512-vnni",
> -    [12] = "avx512-bitalg",
> +    [12] = "avx512-bitalg",    [13] = "tme",
>      [14] = "avx512-vpopcntdq",
>  
> -    [22] = "rdpid",
> +    [22] = "rdpid",            [23] = "keylocker",

Like above, matching the spec I call this just "kl" in my patch.

I can certainly post what I have, maybe at least the first of those
patches would actually make sense to take. Whether the actual
emulator changes are very useful to have right away (i.e. without
other infrastructure in place to really make use of KL) is less
clear. I didn't post them yet for this reason as well as them
sitting on top of the stalled AMX series.

Jan


