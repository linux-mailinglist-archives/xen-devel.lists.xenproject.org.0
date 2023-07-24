Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456D75F3AC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568725.888545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNt2J-0005sK-JT; Mon, 24 Jul 2023 10:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568725.888545; Mon, 24 Jul 2023 10:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNt2J-0005pj-GX; Mon, 24 Jul 2023 10:43:31 +0000
Received: by outflank-mailman (input) for mailman id 568725;
 Mon, 24 Jul 2023 10:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNt2H-0005pd-As
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:43:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec52bbb5-2a0e-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 12:43:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:43:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:43:25 +0000
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
X-Inumbo-ID: ec52bbb5-2a0e-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7RkoT7QsftZogJL7Wgo5hX6vObQT5J9zyIyLjin9HBNHgs+zDzp8HK4B11F9boE9bsVaPtwjWVFHpoIiBcxBsdNpwYO1a7YtIZEv5pSEy1oPI/18OEzcBiMsP0Of2yLytMBQ0hRb33rPetqjYw3hPeCOFdeKkcUH696lbQZGPgS12RY4ZzvDO83EWZtzwdUTe8TJU8hyAAOF67qPvJb6+UPTIMXjIe3nx7CtpzHpfjN1WiqIuFXs2a7MSm08568Zg9cIVWrkOEAer5tK3uAI8eUWhlGbtol4VFDeQpxEdbh4UrffpvQfl3v4jG9WvIILa00SddQqQhUTaHtkyk+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6wO8FBEHzc5PzmCi6rSpI2LcKx70ml1aeaqOcxC6ik=;
 b=AIdSeRUiSr+yRxCn3gkT+buefQmRdybCfc+PKi95MsQWAiB5yShxF2EGSxgU7DSJqjGXbVPWQ/2yAe1kPxRHMCUoRIT8q9X2oKTOifmNrXaO23JVifBzRRlxis9Pepv8pCX70VvKz5TQi+7DpgXDxnR0FkdD/un9sPkmlOxa+QaIMDOXiQqH0cunBN2T4i8+BJWyqwKzL1Ppzw9S2yjWvicbfoJcu/jM1eCF31adkA8OBweLg+i63rX7NQOPV+EwLGGA44mEvxxZiDwWXtQGeMd7bgmD/+iJfeAfl/oZUZZpn3NUAsd44houdcTnhiYk6HU5noaSaTUuH20gm3KclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6wO8FBEHzc5PzmCi6rSpI2LcKx70ml1aeaqOcxC6ik=;
 b=ITxnBZ2B9nkFFLR9OnphPlrR9zjj8+7KkZdjunONRcljTXEvtZbzf7OdknX/As3gNqePT6FzeuJWnUUTUVo5IF2Mo8Ox2DLydYcOKDhip9mbFDek6ihqoQqgPmi1pHTgez2bUcd7dvNRVKi01nSECf5qdKruJUN+vQdP3W0vnNf7Jr2aBPtgoSMW6IHw/plD6Y4VNud8TwhCkH7lQQp6ofeMMrXI/P5g7c4QB0uVmMvqP0Syoba306fut5NYmXuZQR1Dvb/SGdIHLZbKrYvCXRm3HZHgTRSmcieTSvpnj3gCbUtKzpqwdV0gm26NN9cEyNXqxcvfv4eST/gZvZ2aPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2b8945e-cedf-3b38-042c-7b1288cfcde7@suse.com>
Date: Mon, 24 Jul 2023 12:43:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4283c4-b581-4f61-62f4-08db8c32cf32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4A974rIDwJp/Ej1bnXkdbbFCHV+Q85e7DiA/Sjxzk7i+nz7L70Z3+QYxllbJZ1CLw9189SWgu3Sm66tfpQdZ5vYfTowk6M83ydsaABiT89+akprjtwhgZBOPX6dtFeD9EDtJo5CxQmyKpQjkCW+vhjWNA/zNcn8SA+2co4aupTFX2zGq0ZiHKkGmifN2FSoSGVqODXFQUyRmj4P4Jx6rmSkhYFZnKWWnA0HM4GBFV7lX0uMuQ64A0WKSYyiUJ2+BpHn3x6aNcJ5tENkyVjrf4GToGxyxXsFYKrDpkH3SdaM9KwPfYmN1amgbA4jA1lwJGk2IaAKqWudSxwfEAqYCACIQ3MNyOWZWzwigOremXKHjA9vodG6//JLjRdMvNMEP71/PRJt8AVNvbfmJOCWuJxMfuGiUzQUTJreajCwPlAoqcchZrQA7bGnRd5j2YlP2AVqo134r4rAJNStxUKcLxI1yozOB8/AlDT/CMHtMrys7uNZOAShyLEmzE+nnVhAu80paxJQ7/Dyd9GJt9cNrkjcourOZRskfFlZOQ7PadQQq+ytTtAQiY1wruXGMc4Z1nYV7/b+T1qjS/CoP83PvKD5umAef0735ubAd2nj4XrWr96a1+52/GTqMB52JPGvI0qRfs6uNnBsLwy4I711N1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(136003)(366004)(396003)(376002)(451199021)(38100700002)(66556008)(66899021)(36756003)(53546011)(2616005)(8676002)(8936002)(5660300002)(54906003)(478600001)(66476007)(6916009)(4326008)(316002)(66946007)(41300700001)(186003)(26005)(6506007)(6486002)(6512007)(2906002)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUp6emg3a2xuekllUHdOZG81c1FVYmdBVm5Mb252VWlWMDZWdURCWVlLMnJQ?=
 =?utf-8?B?MGJwV1NYWjU3NjlFZVl3Z2xjUmpJTEF0dFY3Q3BQT2l1UW5jQ2hPTWU5OUJJ?=
 =?utf-8?B?cXVSYVlKanNEL3l5ZlNmNDlmaXFROUQ0aVBTMzR0anB3TEE4RExRdVlXczFt?=
 =?utf-8?B?ZVROb0ovbUhXZUcrdEhVTDUybDc0OVY1ZVg3Rkp2MVM2L0NLVGZxN2RPYXV0?=
 =?utf-8?B?RC9nWWpobFpqQzNHRTRrQURjclc3UjBBbUx2ZFRaNXdTMUhuZkt5Y2hLbm1o?=
 =?utf-8?B?NWNLWnoxUFQxOTZRcm4wM0oyUFR5OWd5cmJmandheFovc2VvRzNpMkNDYUNB?=
 =?utf-8?B?ZUVoc0tKeUJYQzlFK1ZCcUl3alF3RUVqQ1NDTnFWejVmM1VOQW55blUySll0?=
 =?utf-8?B?b2FCUTN5cnJ0WWNCbXZmMm5yL3llZHpKeWVaVG5xdldTSFhLWlhJc2tQQitK?=
 =?utf-8?B?K2M2Z0pjamsxTGVRYW9zMDJIQS9YdTlKaU1JRm1GMVVZQmJCbkc2UGxWeU9B?=
 =?utf-8?B?aXg1UG9oZWxTTUtYSWpqWFVuU044TWdDK2FLQjBqempGYkJtN0N5Y245RFdx?=
 =?utf-8?B?a2szdFBXVlNmNWFlMEZINTJLUHRJVHdVbnB1ak8zd0dCNEtSRXlyOHZGOTRQ?=
 =?utf-8?B?QS9PTlBJaS9ScTNoTWRCS01FV1BnQnY3cGxCWERDRW91UHhtWklrdE1VWFFY?=
 =?utf-8?B?MjBHZFB3YURvNlRjbXRKZnU1REFDS2FOSmFOSHo2WmlPbnNJeDFHam5XakpG?=
 =?utf-8?B?U25lSlYzM2NMaVEvd2htaUNjR0RqSnU5RHFvVDV3S1dpTzNBZ2lzVmJBVkpa?=
 =?utf-8?B?YmFiZ3Q0QjlacjF6Qi80VysvQmh2cUJkNkpabHNtU1pqbFFQcjl2S2E5QTFJ?=
 =?utf-8?B?QWQzTk1uN3FUdE9lSCtoYldSRmhzYkxMTGVtN1dTUi9tQlZId1RjTUJMTjNQ?=
 =?utf-8?B?VjR6Z0hMTGNOYk1iQjNuWCtWWVVZa3VYMVhKOHNXUEFFenZRZTR6a3pwRFJX?=
 =?utf-8?B?bXN2enQwUjYzRXhEZlRnRC9iTHhaemovQS9BczZ5ZWFHa3MrRm52V0hJbDRp?=
 =?utf-8?B?ellWL3l0aUNGWllMQWtSZU1ldzZIbUJ5NVlNLzVYM0JXcmJTbE5CRUlvY2Zk?=
 =?utf-8?B?NjZHWUNhenEvMzVWdmpZT2hmZ0RxVWJQbXh3QWFVWEVKN2kraUhSdGNkM0Zu?=
 =?utf-8?B?RHhKNFQ3bWR0RzFhbmdtNHJ4UEJoYUdRanhBbTREbDNjZFgxUHNiWmc5VGdu?=
 =?utf-8?B?NVNrRXZFaHpVdE1FVGdLQ0tTdlJWUEgwYTY1bGtKNUpNY1VYQ3RoR3NjTHh2?=
 =?utf-8?B?Ni94NjhoLzdLLzlEWDBnYWp1akJ1TU5oTmdLT29zdkxmdWp5cWpTTjhUcGM3?=
 =?utf-8?B?aWRVVzJXWUFBR0xxUEEvdTZtbGx2akR2aml5NEs0UlBYbW9NeXF2MmFITkRE?=
 =?utf-8?B?Rll2VkxmeWtyazVSQWdtVW5PUzEzZi9wY0FnOGZoRlB1TGVEbnR0ZTJ1eWJR?=
 =?utf-8?B?TDBibjZPVHVyckVSRnViV2FzS0RRSlFBeTRsRzJTd0RrbmFZMktLUklXdmlt?=
 =?utf-8?B?Vy8zVFJlS1Fpazc5Rmphd09heFNyaFFya1NuazVHZ01WNTFpTnJIMCs0THN6?=
 =?utf-8?B?NzRSdjJqWjlzY2I0VkZwTEFzWElyVTBxS2I3RG53cnlXL2dNeGJ0dUVzSk5P?=
 =?utf-8?B?OHBUR1d4dUdDVCtnKzFSKzh3ZmFVOWs2N2JCVEF3ZFo2RVVuM2RldzJFM3dR?=
 =?utf-8?B?dkxoY3ZaYmNHM2M1OTd4VHN5RkZLc1lrOGpyb0F3RGFPdTNZZkJpNmFHNTU4?=
 =?utf-8?B?RjQ4RlR5NjVKQkhheURXRUxBdDVCV0RyTmZoVTFkQmlEbGExbXdLQUVLN2Vt?=
 =?utf-8?B?THJaNVExNkcyZWJMNno2YnpKSURkV013dzRadzFhc1RjL0lGSHl1bHBiaDFV?=
 =?utf-8?B?Y1BicWRMa01VcDBZS0k2cDdUM2hTcVY2RnVrMlU0SzNYK2JuU0JxdStOeklT?=
 =?utf-8?B?R1FlL0hnZnBuYTU0aDMwQmd2dC9pWTJFdEFUbTFidjlRandRV2x5V2drZzhw?=
 =?utf-8?B?Mk9hak9ocjQ5OE5PdmJZS0dINHFoYzJZc3gwMThMSndxdE91NG9PYXpCMFk0?=
 =?utf-8?Q?R+PiLAaKrojinOTQVa1xfFhWk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4283c4-b581-4f61-62f4-08db8c32cf32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:43:25.6683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcPvL9Sc/xAoCdxA+twIZnuHi3VyMTCWOAiTmrHbUVjiu38uhtfIRdvWEia/C5R0m6QzUVf2xFC7ta7cNfXRDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> @@ -52,8 +66,8 @@ static int cf_check map_range(
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
> +                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));

Aiui this is the first direct exposure of these functions to DomU-s;
so far all calls were Xen-internal or from a domctl. There are a
couple of Arm TODOs listed in the comment ahead, but I'm not sure
that's all what is lacking here, and it's unclear whether this can
sensibly be left as a follow-on activity (at the very least known
open issues need mentioning as TODOs).

For example the x86 function truncates an unsigned long local
variable to (signed) int in its main return statement. This may for
the moment still be only a theoretical issue, but will need dealing
with sooner or later, I think.

Furthermore this yet again allows DomU-s to fiddle with their p2m.
To a degree this is unavoidable, I suppose. But some thought may
need putting into this anyway. Aiui on real hardware if a BAR is
placed over RAM, behavior is simply undefined. Once the BAR is
moved away though, behavior will become defined again: The RAM will
"reappear" in case the earlier undefined-ness made it disappear. I
don't know how the Arm variants of the functions behave, but on x86
the RAM pages will disappear from the guest's p2m upon putting a
BAR there, but they won't reappear upon unmapping of the BAR.

Luckily at least preemption looks to be handled in a satisfactory
manner already.

Jan

