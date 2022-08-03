Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFA588BD5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379883.613738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDG5-0007vY-Fl; Wed, 03 Aug 2022 12:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379883.613738; Wed, 03 Aug 2022 12:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDG5-0007se-Cc; Wed, 03 Aug 2022 12:13:53 +0000
Received: by outflank-mailman (input) for mailman id 379883;
 Wed, 03 Aug 2022 12:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJDG3-0007sW-UD
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:13:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc02bfc3-1325-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 14:13:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6682.eurprd04.prod.outlook.com (2603:10a6:10:10c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 12:13:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 12:13:49 +0000
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
X-Inumbo-ID: bc02bfc3-1325-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa9rSq0Uro6zoTxFy70ozEJhJEdbTDqLxEHGwuuWYQNaeecghUEICtWKoI8b/vRrFlpYZMYGhulWA+zmR+RVcwF5gi4tZBu5QEU0kb65h4CeqeXuvgKtlxsLY3sMKeuc6dcnbETr1SASBJM0okaYDIQWdCmkrvJ+5Ls+lvR9ptUjNZKATYhC7O+CzpK5mbm+fU5wwsN0hb4Ad6c0K8a4mnof/LzCuzdFuVHh8vCiDuMQaC8olHxPZXD51LxTvq309NQtXz4oCPkFdkU8rBhOKOxJoaek7S6XVZco7IIIOf/mW09ucLjATXTWrnfvB4AiVuL47QqOKSGxK88zXgPzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl2JhSmIMnd9IWE3IZoSu6cJOSzVsL10e79SR+Bny9Y=;
 b=gRizj/0Qic7BAbuxDg0wgjcfRjdSdfBZ8mIR0EGc/xIa9xBNzM8vASsWf1NeYJd78G87dElernO0YzrxKUqx6ey5M5imFyOfmGEYLXQFOLNHVwrFRcOaDdavLdrzvYGQ7WzkmPu+egISbNmHPfO2f1/usBPSXLyn9gpUN2P4uP2DQZMEz7I+O8m1E+YNmU2OYqRFyT9pnjnS0H2tVP0b2vuXYHkAx1Vya5PjHcenXnN6iKfun8CVmjthpqKf7VlkbtQRv5/aNkrOzLzam8KnxrTdIHtvP5+Ehfm/SeFL4Nzrb8cceuesD6vax+nPxVcWZfxLLzvuhnCOYsrCTV7IOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl2JhSmIMnd9IWE3IZoSu6cJOSzVsL10e79SR+Bny9Y=;
 b=rGr2Asgj1TKysf6Z/faEUSBoz6WJG1ixB8pUQKLNUeVfN2SuCSnmTpjiKdSTQV6AfMlKY6TV0DahwrTvC/SqzP6FTVbjN352C3RCHMI17jON8DVpZm9afN2nSzdh5OdVw5yJdnVewm8htzuKdK5CmyuSf0VBdiJYfGgCL3+C65JF67WAuUdCvVt1GOGRjFujtxgajfHXUgQ4/h0rU2g0XN97UJPurls25i7Out70jAaOPHpU69+sQQfKYbCBYRN+mumVe+FA/N9nJZvUMGVpovOHjGLoTbB8Eh/DmvS2WjU/FdHBYyEm6jRie+fGZJRpxL9qr2ch1Ks1eBsH1ag0RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5f37740-aeee-8cb1-7377-a92d43fe1898@suse.com>
Date: Wed, 3 Aug 2022 14:13:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable test] 172089: regressions - FAIL
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-172089-mainreport@xen.org>
 <9a72a1ef-c332-7dd3-b84d-baf34f9d7d9f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9a72a1ef-c332-7dd3-b84d-baf34f9d7d9f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72422137-cd08-4161-6b70-08da75499f48
X-MS-TrafficTypeDiagnostic: DB8PR04MB6682:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PiAVGsxyBTuj7xkh7GSnGaADQlAXV4GTdglmO/GYSbT2JsSfSRQPrUJMIuHn6D8bLfKo5femJyix3Jv6Mn5Tnrp8McLIcTuy+dUuhaa4qvqfVeFiblx7gnnW47bzBnEXaQIp/E2uy1wao/vWrHZm/fmVHdX+0uC1ALfm/Lz0WHUdfCaSglM4pkOnJLUDDekJYEINYaqSMaUcKFrY11C57lgoO2xbBDI5eH98SWfb51KYpA6Fkp8Cdvx+Ks7yKStGYx5SQUg9ZUlIAijcFegU/FhUoXbAHj/Zc37DCzb3hWEpo8eSx0UPd73e6vBDDAe5nf3iJmkMDD9R9r7WBwBuigglBkr6FlgFgKQg9czKiCQJlmRWQ2TtMLKgTEppLuCImFpKdZVGOnvzIizRdaslNbgpRJbOePc/5SI6c/rr0vonbtc9IMNnjSdF5auTTfqA0s9XbYEpcQt0kLVM2MXL7Ch4W9xh9UHO/FkcPRWMVBiKJdY978/+8fDLhxxAx5EjGKn026uaFtYf4tY7hmuDDHZ6c4OqlTKD+9MvO+Bad4RQtu+emwxMfJoa1tJFluZ71cwidTmCbJlsd5lTfM0ef3rmc9opC17SSt3q9yNM+x3Cq8cY9XvbSf55WLHnLuzouZs6uf6PRfeXFhx+p3foqOQyXNlc8rhcT0z9ZQi34TurCj7DGaS1XP39GM1h1LKD3aVjff7UXzf3fAaO0ZZ2q3raW2Jluf9SGcAiUnnt4g5nfVFeTgC7Uz2LjT66eh0CzXXZ4bokN2tdkVV13juOl1hgKDVuhOHkAsGq5Gv2ewl51PtiqJwqHdne0F5mhNciznbwdL/RZOwwu7wj/MsbHEpOlIYjh9armnoWSMbJMWgN4uWBYPd6TkXiCBKeTyMK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(396003)(346002)(366004)(66946007)(66476007)(8936002)(66556008)(4326008)(8676002)(478600001)(38100700002)(186003)(5660300002)(6486002)(966005)(316002)(31696002)(86362001)(53546011)(6916009)(6506007)(54906003)(31686004)(41300700001)(2616005)(2906002)(83380400001)(36756003)(26005)(6512007)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3B0a2FSZ0VEalJKcXBOdXRYMGFjUXpBQitEWExRaFBuZXNtYlEzWGtnWUtn?=
 =?utf-8?B?QW5NL3JyRzNWYmQ0cGw1VjdQeFF2di9wVEhZZUdqM3F3T0JnSDVxaVpBL0Zx?=
 =?utf-8?B?THBKbldlWnhNYVV5cm1ZN0VnVkV0MkRjL1Z4UEJpcU9RM3R3cHEzVFFQOTIr?=
 =?utf-8?B?QVBLZENQMmFCZWxsaFQwVUtkM0lmUThsU1V6a1haN2YwY1RpVmNqUUN1bHR5?=
 =?utf-8?B?eEFMdzQxeHFGUTdoSnRlTWYzVWdVNGxMNldqOHRsVTVwdjNUTVJiandIdXJP?=
 =?utf-8?B?OXMrQ2xxZDdBdEVQWC9zeXV4K3NRaEpqcDdnYi9xOEJQaVRlUWRyWGFTK2p3?=
 =?utf-8?B?YUFYQ0JZdlExSjFHcnQ1Z0xqYUY1UzdaaklRZ2tERUhjQ3hiZG5NK3JFRldr?=
 =?utf-8?B?MEtGRHFGendOUUpINzZQTlBJM1M1UFhJb0F5cFM5N090OHRJZkFDYWF2TFA1?=
 =?utf-8?B?TFQ5d3NZVVNlK21qWXpiVWRKYlBERXdsbmlhYUZhbGRQeFA3UXpHNGRWNjdi?=
 =?utf-8?B?STBVS3hhS2xZSFdIOUNWR1JZeUw4WXA4aUR4S21VTmZ2Z1grRkl6Y1RGelVq?=
 =?utf-8?B?dWVhbjd6LzVYR2M4c1krbU94NXk4em5qOWc4MGxFOExsQ1RwREIyWHE1NWhi?=
 =?utf-8?B?OWtRcHRxK1lnMm5NTWJzWEdScW1HbFVJeTlqVVI5NGVSZG16a000T3VJKzRE?=
 =?utf-8?B?Vi80L24vL3hxblNZZWttNkNKOUJVSXA0WFFZSzVrVlh6eGFtU0FzWkVIdFZC?=
 =?utf-8?B?c1Y0YlZQYzRIOVUvNkdMUW1vU1Y3U00zYVVDY21IOUF2K1hMeTZabGNFdldi?=
 =?utf-8?B?dk1iYUtBV0hjTXJPNjBkYUwxbm1YQjlLY2N6dWhYT0VsTCtWOUYvTis1QVJz?=
 =?utf-8?B?M2VHRCs1TzFhOFo3ellOYmg2amtrU0pHdDc1S1JFTHlvemVIZGtXeFV2dkZT?=
 =?utf-8?B?dS9IZFczSEtjclhDd3JlTHF2NGpTVmJiZHE4SWVHTDNlUTRCZDl1S2NtdGcz?=
 =?utf-8?B?WFVHdlVXYUxwMW9qakVBRWJRcnhrRGRYalJKZkdFaWpVSFZUZEYxTDNMSFdS?=
 =?utf-8?B?SUUvb2xwQk5NZ0dWYTdIOExzeFRrbHpBdGlkcGc0V3NSQU5VWUlEUk5RWkht?=
 =?utf-8?B?ZGNWL1Q4dUFMbDFTNnh4V3dSajc4aUNNY01OdG0wUGE5cEgydHpId0VmZDQ4?=
 =?utf-8?B?bWdLSVp2Rkg2OU1kb1hXdHAyQWNEZjJ4dzlCRXY1VEVXaFFNZTB5WEx5MFZR?=
 =?utf-8?B?UHJPR2czV0xMTWU4WGhJSExJay80VWJJdXhIUUd6NFJXaTRBL095azU4NjdT?=
 =?utf-8?B?OGY1WlJFTWRlbldhQzBGSjVHSDJaRlFIbjJXZHhMSnJ2c2NmUW5XdGppNWcr?=
 =?utf-8?B?aklRc3AwQzVIQklVb05iK0hyZEoxUDk3MlVORHF2YU94YWtnSTBiZUZweHNj?=
 =?utf-8?B?UXl4dU14SWVHb2tZM1VPeFB4MkNhUFI2WWJWeHpLdlhiME1DYXBaTjV5SGNq?=
 =?utf-8?B?VDM4RHJlMWo4akowcm5maWoxczRNWkZVdXMxZVByWWUrMUVGdXp4dWlSSXJw?=
 =?utf-8?B?L29ta1R3aFlmZWtPQWNKNm03ZFRGeUNkMXQwZk8vaGFPSXdGTFkyUFFWZE5N?=
 =?utf-8?B?dldvajVRT3phNnpHM0VZL1NnTmt2L08wendCSDlTQ2NEbkgzOUJCZ0tXbk4r?=
 =?utf-8?B?MGN6SlJ2bXU0SlFUdVBkTStuUnpCSUNBTU0vOGFsWklYUXVmeDBnOS90RE9q?=
 =?utf-8?B?YTJlc1VGQXJ3RlM2TVAyenhqN1RUTERPSGEwOGF4N05BU0tIbEEyN2JVNUdV?=
 =?utf-8?B?NlgyZWhTTllvcmRyWFJ3SEZYMUY0WHdoOGFpQ2lEVktUUDdMcnJpZUJZeUpl?=
 =?utf-8?B?c1ViUndTbzIxUFZLT3VnbnRZajZEYW56NE1JWmFLY3MwdklaYWJqMDF3azZ3?=
 =?utf-8?B?Q04zMHJZRWliS0FUR3hoT3NuU3V1eDRST3MvOW9IcHFmSlB3WDhXa20yWlIz?=
 =?utf-8?B?cGUrSzNuNlF5SFhnRkZINDZCdk1YcC9XMXhXYUs5RWliWUlyMGpmVHlyWmcv?=
 =?utf-8?B?Z1BLUUk2VWZ2VEt3ZXFwNVFyc09jRDVXUlRZMlZqeWlwcEd1aWVuTGNHd1A5?=
 =?utf-8?Q?gytE5LD75/15FWRQV1b3bKLIe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72422137-cd08-4161-6b70-08da75499f48
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:13:49.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGiEdK0OM7xRaYBj/pUawlOD6RWBCSJd5Dwa+xtT9obKWFT1C7Qt9eNX1XPc0wYKzOu/wZDzTwHZ62WpW3HILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6682

On 03.08.2022 14:02, Julien Grall wrote:
> On 03/08/2022 08:13, osstest service owner wrote:
>> flight 172089 xen-unstable real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/172089/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172073
>>   build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172073
>>   build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 172073
> 
> I was going to force this flight because of the libvirt issues. But...
> 
>>   test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 172073
> 
> ... this is not a test related to libvirt. Can one of the x86 folks 
> advise whether the issue is benign?

This test has been failing every now and then; whether for the same reason
cannot be told anymore as the older logs are gone. I would therefore like
to recommend to wait for the results of the next flight.

Jan

