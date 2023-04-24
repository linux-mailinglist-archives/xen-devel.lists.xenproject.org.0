Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF816EC772
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525178.816216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqzr-0005VP-UA; Mon, 24 Apr 2023 07:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525178.816216; Mon, 24 Apr 2023 07:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqzr-0005Ti-Pv; Mon, 24 Apr 2023 07:52:27 +0000
Received: by outflank-mailman (input) for mailman id 525178;
 Mon, 24 Apr 2023 07:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqqzq-0005TW-PN
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 07:52:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3717dcc-e274-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 09:52:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7378.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:52:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:52:22 +0000
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
X-Inumbo-ID: f3717dcc-e274-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX8ycvLbvVdasf5KuV6h5plbd+u7Qu9xXYkzFXLYA4KrHiXulk1yNWqeGC1Wb/wxxokeYJPctJjtXIBMaZEd6fHoww6FWOJAf45KEpa3I8iCzu+n6YQGSrbrl4MFLjyU01d1i8Nd4YJyDUgQQQf8kL43n8XvhCA4nNGBbqUWkaV3oxqwSu5zNlDqGqAzdRUk4byAACtSw0NavQl+NfJ2W8K38CuW/Ovfrk2VSiWiJwzDfEkzTTEWlZT6XFCVzGZ2Vlv+3NXmrsH1iJQaNTaB7UO2HQP0X1/fwmmptHjYjXQIuJ/VHuZQUkCgd1BzsdmMBWHtJoMAAFwaujrbpHhbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dwj6XMKKQa/hrCE0rpy93vapUt0q65wfw6orRzgCE8=;
 b=jclBd9XD3EPXTMoMNw/K7BKY5dOPRfrwwfjet0MOQMUAxSu3wLi+qds0AbfNw0WBx74oVyiftX0R3luYUOazRr1N369z1f5t3tILVRt7vMxP/0xnmV0sXTyA2nZSLbbDa5PzXFLTyP0XuCWafPj75B2xZOfrTesi+1AbWg8e5NEj0OdhcrdXAmz1GySF+RovoJgczGJGOHVtJHBpxvbuDF2H9xkbjr6BlbLiUwhfQU+Gj1v7beNypy9aDQKCvNqlHZg4aBb0mHnASndv4eR9ZVQZg6498Ay0IasBtvcQkiIKeYIQrPsdGmvGOMnONaf/AmI0EZ5cLxOn4t90qQfRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dwj6XMKKQa/hrCE0rpy93vapUt0q65wfw6orRzgCE8=;
 b=pAPUm9oW4ZaemTBp13Kfs2qHUMc/igB3KIKVvekMoZ/c4llYooa3eJ3BwbYHWWbOTKc6kLQgMtBIPyr3OSiDu0ySaRzL0m+vnASdS+f9P8QRZ9npLY0fp0E0447APBSq2kftJfyZLlKxF5vbmTSt+eSqQUgzQvWQ7FD7yeK08HrqVzNWRS8nAuKYjsoSlo8uu4fMa8vSmpMVuBdi8vdVBVrh0yt91/c9l8IIQfYdlK6d+fIuTlq202SfqGSmsHkEoBPlQNueSqp0Hjm7n7aVRNcgUqGwBfG3Khp5hhObMG0k+uoLwiwjqoEI3rfO5aNsEi4VthL7whd+ZKk2RhvFQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5329c881-3113-3740-79c9-18dd0afc7011@suse.com>
Date: Mon, 24 Apr 2023 09:52:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [linux-linus test] 180384: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-180384-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-180384-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6e6197-51c5-4f5a-cfcf-08db4498d63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22dR0GbxnNFDCHyk9ULs8LGYGp2s3DI9R4e4ijBUs53fiTcq9vP1FHMb+gRuE5/mRmw3gbAFpmjZwDlO4boFpGuotV608/8kfadpQt47mKpZYrLF0Jepr5wMemXpnmFiLuhsunSRBTtLFXVlfU5dIRkq4s8BNT2LiSiW30zDHOnvktRxmsVF0c1n5uGIyVRvqVEmdbrF5OuIDZc2G09zW6cgORB1NbcyWbo3T0Y/KY99zrPPged5rsbtngaptMq6sifQvmWNoZGDwA5tRMv/miKQLq2/BQ3jGAdUonCzbfOEDQXXHcUfPzX11Wf6gkwpyc/DH+8qBFWcf6pcwngFXusCWfu7Jrb63E7p4gPeHzVjEzUJUiqT2VN7HZN+/+AGsbi/r0XvDG02BVzVdgCg/ylb+w0XN84FFoUse02LIr8WZp4DGKr7/XYiC4icgQMyfOnnwAD67pVNPKrTROVMSiytWt9muvQWAaZixdPUq+/DEJ8Fu856l7MxKLnhP7exekIzZsZD7A8jRSyZKUCSA9NbjXN3n7+HKQLZAj7GUN1q9XjA7f1E/yEDcrq6MLKAiR2efbm8rte5/5BrR8mBNLyfrvDhC3wnOnFHtMHuHdEsCo//5rpwkvZiK317wo6WEe8I5QWdPF3miPL140tl5NhrbSishkCaVmkhob/4FcbvPfL7ZOCFQcnTwory7ZkH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(4744005)(6486002)(966005)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(54906003)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlRMbVRXVzJkb25KVml5djZaMnpNcStRV2F3Q2VGVHQzZiswREZSSkdtSWVE?=
 =?utf-8?B?bzAvdHh0RXFIZWZyelVUNzQrNlNIZDJSakgraVRhZnErNU5tcXVVMzdlTFhm?=
 =?utf-8?B?cXZJank5c3A4d0k3NHNIVEhqdVZGUDk5QkV4QTRPV0lsT04yTWlZemxtbkZl?=
 =?utf-8?B?V0tCTjZzR2ROSGVsVmYyNlRib0ZSbXo2d0dKUjhRNjZVWEhLemRoMmVZcHdM?=
 =?utf-8?B?ckpkTHpvNlhDeUZUYnR5N0xoYkd2V1hmYi9ieHlwOFV2NDBKb3NrMm5aZjhs?=
 =?utf-8?B?T3VnemRwSEVDaVU0ZDNtRlA0YnJhYVorbm5MOWo3T2M0K01jWk4rWXMxZE1M?=
 =?utf-8?B?eVZPSW5oYTNIYk15bnVYTFVwWVIyblN2WnUrdnpRdkFudjFVV3phVktnd0E2?=
 =?utf-8?B?Y2tFT2ZTQmlCUWluejZXUTFWcG1OSkpZY1dpYkZWMlRUMTk5b2QvZXgvclVj?=
 =?utf-8?B?dUppYytrbHBmR1hJbU9uUXlWYXNpTDJjNFBQMXhZWWtSYzRvbEhvN0ZUYnBn?=
 =?utf-8?B?V2U3MTROWXAvSDJLbXUrSWlwNno3SG9KSnVRWGRVMDBWUk9YUnJOT2FHVDE3?=
 =?utf-8?B?WXNBWm95Y0svSG02c29pWXZwK1FRK1V0MnV5RDBhaEtqdlFVT3B0Nm5JL3Jz?=
 =?utf-8?B?VUZhRkJvcGVzYkJGTXJYbEkvKzQxT1pSTW1Zd2x2VXRBZHBMTWxwUEUyZG4x?=
 =?utf-8?B?WDlyd0RxNEc0UzA0SXQxcENIbFpvaEpLc0I4OGtEejl5WUFKdjJyQkxVcFRD?=
 =?utf-8?B?MjdHa0Z2aDVWV3EwSGt5SnNjQmRsd1hVTzJteFAwam9yaVVyL3V6RlRrUWdh?=
 =?utf-8?B?a3NpbnJtSmVWZno4bGd2MEhNdjNQSGw4RytNMTlURXo1dzQ4YVM3ODEvQnNT?=
 =?utf-8?B?YXJtUDBYUXJ3aksxTjJYa20wb1dTQ0tUSGdXNHlLNUNUWFJIOFRaWDY1VCtY?=
 =?utf-8?B?NHROWnV4cGVjTnBSMmpXU3dmOHFabDJMcTZyNDhmK1BYM0I0UUZQZDljNFZX?=
 =?utf-8?B?TSs5REF5V2VVNDZPWDBhNW15cmhGem5KWVJUZ01vajFQRFpSY0x4T3JCOGpm?=
 =?utf-8?B?RzB1RnpOdDhUUEZGN3U0dXlWR004VHdCY1hlbkx0YXRWK0p2NmZwTlJDcFU3?=
 =?utf-8?B?dUs5aGd0eGVDd0lpMEhsQ2VVTFlieFY4ZEV6YVlzaWxuWSsxVXpaaTg2MXpW?=
 =?utf-8?B?Nm53OUhDa1FrUElUNDdyNnRGVHBwWTlpdzBHYm85T2Q3QnExRXRlTUcwbDNi?=
 =?utf-8?B?ZTAyeDhxcCtwaUVLdExTV3ppaUwyODR1cnlwZlBtWUYzc29MRWczZm9mazBR?=
 =?utf-8?B?UWdETlZlbUN5OW9aWElLNU9DcHhOTUFVaml5NHRFalVwa2lianh3MWhXVVpz?=
 =?utf-8?B?UXBUdllQdDRRRU5wbUJiOVRKL3BLQ0tQUDY4cXpzRldmN01KbWhyQ3U4NSs1?=
 =?utf-8?B?ZnlKSkVaY3ROTWFUM296Ny81VFZDU3ZoK3pSYi9LalJyb0lNVXVFd0c4RnJ4?=
 =?utf-8?B?dlYvZENuRWE4Q01xSklZZlV5c244YVpYejFoVUZKZnhLZHg2alVuUXZkK0Zh?=
 =?utf-8?B?OTgvendqSFdWNnBGQkdoWTNMUDM0dGR0RXBSZUhVdHhjdDVRa1oxRkRwaXRP?=
 =?utf-8?B?S1ZuVHFjZEdGN3paWXRHYi9PMzMyai84di9xeFcyK3ZWWjZLcmFXOElkU0ov?=
 =?utf-8?B?Ukp4emJDcS9ZTkMraHF6MXVPL2pSSTNWVENSUWtSOHVRYlFmeTBIa2tEZUpn?=
 =?utf-8?B?TEdSa09iNDVVMDBIU2l4Z0FtQUhldEdDd0ZoY0JROTdHSm8yTVhha2JKRTNu?=
 =?utf-8?B?QlpBTWhEaGN6dkdJQnhBUFJxL2xCT3cxYmpIVTNUdVU2WE5kUjFjN3ZzcFhu?=
 =?utf-8?B?ZHNvKzgvcGlncm5ZMitlbmRKVHEvbDdmVzd6UVczemJXNDNlVTA1aVFla3Nk?=
 =?utf-8?B?V2pIRUxPOG1PUXhydXBsOUVWTzc2M0ZOU2wwTVV4aW9sNU5ZSGkyempMSFV2?=
 =?utf-8?B?TnBRakhJUmRnNHA2QlNGMno4aS9PLzVWdDBtTEZYQ3ViQndBU1BCV0d1TG91?=
 =?utf-8?B?eDFqRVZObVU4S0o1RThmNGkxOVhEM1JYT0lGSGROa29JejBZMmpEbHYxd3pL?=
 =?utf-8?Q?lhR8F+GVybGn9HKng6q8++zoI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6e6197-51c5-4f5a-cfcf-08db4498d63a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:52:22.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IulKFUiiRpOJtCfdC1PtLMKI0896uYEoXG4hyK+QBfxOaQH7SwuBO6llashvxQbVJeIZ0b8gd31UmLRIzzAj8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7378

On 24.04.2023 01:33, osstest service owner wrote:
> flight 180384 linux-linus real [real]
> flight 180387 linux-linus real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/180384/
> http://logs.test-lab.xenproject.org/osstest/logs/180387/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-libvirt-qcow2 19 guest-start/debian.repeat fail REGR. vs. 180278
>  test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278

Looks like the earlier problem is back, just in a more limited fashion
(affecting only a single kind of system): It's again "Volume group ...
not found". Of course it could also be that this is now due to an
entirely different underlying reason, but in the absence of other error
messages (at least I couldn't spot any) I'm again suspecting that some
required driver can't be loaded, perhaps because of a missing dependency.

Jan

