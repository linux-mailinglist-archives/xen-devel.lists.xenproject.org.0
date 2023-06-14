Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189472F9CD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548652.856690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NAf-0008P1-L5; Wed, 14 Jun 2023 09:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548652.856690; Wed, 14 Jun 2023 09:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NAf-0008NE-IL; Wed, 14 Jun 2023 09:52:09 +0000
Received: by outflank-mailman (input) for mailman id 548652;
 Wed, 14 Jun 2023 09:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9NAe-0008Hm-Hr
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:52:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f39d96f-0a99-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 11:52:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9678.eurprd04.prod.outlook.com (2603:10a6:102:23c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Wed, 14 Jun
 2023 09:52:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 09:52:03 +0000
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
X-Inumbo-ID: 1f39d96f-0a99-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fY/uEuNp93tAcB0oZEYxiML7pO48uNenoCpm9kjIKspAjJy9Huy1h19jHcqlDVrRWGgCOoDSg2ZjATq4heP0An43hfCZW0k7en55QHsWuI2kLjoXkYF9aUp7Q4NUVNd76DfwlVcJnDlkCyd62O/t7qOoYdfCkRDppCqmy80aho2wcx1LsK6rac3UQ92AQ96q0Rb3AUeBgMpcZZRpRfL1/1NcA1NhNNA/agkBnvnEwuMbGz0ciVPB580To7zRcvrR2v4G53S9UztWqj3I+GATyrqneZdGqvaKcsjxUYECxaMh+iGoFGsg+4Ux2LqEnc9TbmR3Ga/bMFEHGBHLvLe1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emQ64Lv88G/BXXTzejJVzE/hH+/6Uqek0GKlq2M4ZaU=;
 b=DSeYLkFw/JtisFXjHTbbgvGhqejAd6VC0gRL+jF8zt5jrETnCknFcHAAsg5BS7ihxMs1rtAQ7Hf+yHMAi6eVEjSn9KS7HNHF+om4u/BlUABIQtwUKYiGRmAPa0uxT06ukN8aOIBgCgA23v7X64b7XgjFbkU7WptkHXLufEy5bGr3LyYpLWLoPAhjVE8xLdEoyjx+bQ4+c29adSl3QcJrJtN/hQByo42bJtZBk53T9LRS0S8OK/2XxNDwICWxhXohpmXYh6aCxAJxSdmr6Zg7OTmc4WJnEzSoSSpZngBoPwfddD3nnuftE42mrWnqsX6It7c5cERrlQfyIDFq7SDoDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emQ64Lv88G/BXXTzejJVzE/hH+/6Uqek0GKlq2M4ZaU=;
 b=gMd91jtYFcGdAVycMs5l0LWN1mNLzyf1b96lvEVi8rAdV2SNaizktXjCCTQazhimFwNJvEQrOq2/CZGE4bPHAQDistDUj/oefmqwGRinaniY98x1Do9+hFuqXTI8J5b5qu8g1hfuKjGd/XwXPJsdIGIvZOPJLIyDthKKBrj/VH4DJVnAEj0NqfBxSr+KgJ5yYiSwdnoBkRi9bvHgeHn76hICFvR9zJfd15RnIyB8s4cVMlQAMfXDudAukHKA/qbpo5uFP9lN3f3bzyl+quaHJDag0/Cqz6nPbFE9SecleP35+3PZU8TgtLHSFXjNWJkh31ICAkGCLRN6WOQtLSV6eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16aa7c82-7cab-8129-f995-3097990ab147@suse.com>
Date: Wed, 14 Jun 2023 11:52:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: Remove stray semicolon at
 VREG_REG_HELPERS/TLB_HELPER* callers
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230614094144.9533-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614094144.9533-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 797a9109-397e-41dc-9c7f-08db6cbd0191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JsSA4jQiMcHkMHHrjFMMGnvJSptuiC99+5XSexk5CNzYVE4dCZIZTqpFGWS7+DsbbbFm2+oURbapZDkAQm318q2+4cOUjiRT1UW2+JJ0xjuyfegmZED/VoQ0MRComxB8CpSSBbjeDOL29wjyPTFFCz4r2fothDUyvGGwk939dkTCHm1hJTHaynAmd3ddoeZ4DW6ii/hJ9fOrTXB6Nz78mBrs+HfGsjQTab8DS1POmQCd4TBBzTSz5CCS6ZpgjMaHDJnqG7IP9d2yDprgKw6yiVHa0ABboKs9FXAJbUVWSl9XyZnjvzk4Lm6fgJbUOetDeGbgOMvxTPQJxNA9PYzLGAHhZYKGM5fuS7LAwgLWQ2f5aWdVSf8lAXkdb36AeNLUlnXCEwZZIKowRnc864iQ85KyXDAu+gIhxJ4NVovj9kknTSd8gXpm20/dkPNKFb+XiPp/zbTd4ZCVp7m4fSpxr8SWIhg+695u0QzQC/LfJg5bjhXltupgAELfb5POqF6plVjYql90sp4yrazjdtp1FlRKgiXmdv6t6m2NwauTWJJkuiCpDkejWBaH/V3QuHipi7QLo2MN/h8CiMyz7LJi2oTm5Uw/wplPmX5yquUO3p7xpEccUJrEXeIaOIUijcOF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(38100700002)(5660300002)(31686004)(8676002)(8936002)(4744005)(2906002)(41300700001)(316002)(66946007)(66476007)(66556008)(4326008)(6916009)(31696002)(54906003)(478600001)(2616005)(53546011)(186003)(966005)(6506007)(26005)(6512007)(86362001)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkUyRVNMTCsrQ2drYk85enlEUEdMVmtpNkwvZi9VUFBrWXZWUC9SRmtWZGhE?=
 =?utf-8?B?czNDTUFBdjlaYlpueUZhYytaYzRWVTdEaWtSakVEU0piaXdWdGZHMGxLOTZm?=
 =?utf-8?B?N0wybHg3QmFKRnNKVkRKRFFJZXo0Smw3bThsZTBEeWdmUWlNcmlVNFYvSUh5?=
 =?utf-8?B?dm9rVXdnMERWcWFVNFJlOGxscUF0a1IzQU9Vd3pRTytyKzZ4Nk9FVDVnM082?=
 =?utf-8?B?ZGdXZ2FBWHBaYXhLc25VdmcxMlNEeTNnUE51R1dtSEFqSTJQWVVCS2pmODFM?=
 =?utf-8?B?Uk5CUytoZFBFKzZmcUFPbmFwN1VBTG1rMThkTlJ3aXhMZmE3bVBFVkJsNkZS?=
 =?utf-8?B?Nk93aTZxZTF5ejVicmlIQlhiNzloeEt2TVVtRmdEWmM5WENFQjI5cEtzOGR1?=
 =?utf-8?B?MnFsbm13V29BWkliZU5Qb0lBVXpWa0hUQTRKK2t1Y3EwemgxaTQxUGl2TmRv?=
 =?utf-8?B?c25iOXp4clB5azZ2dkpnNG01YUF2M3FnNVo3RFR4WGpRemN6Zy9henduVDJ0?=
 =?utf-8?B?WU1SK05xWTMrSzZhalVzNjJ0SHVTR1k4K0tONVlHclRISmloQzJ4U1Z3WVla?=
 =?utf-8?B?S3NwKzlYZGplcG1vbkxwaUJJKy9BbFd2TnFLYUNWcjJ1YkZWMHVqLzczVEl2?=
 =?utf-8?B?azIraXJDZkM2dkVHcjlOU2g2OXpkSEZxTmlqL3h0UUZPaExYaSt4dGpsU1dO?=
 =?utf-8?B?Y0dZWHB2ZitQdGp3VlJYczd2Y2pRQS9IRmpxYjNIUTlYNnU1Zm1LaGJUa0xZ?=
 =?utf-8?B?NnRwYjZGcXYyQ1lWUzlpMXlObzJqUFlnRHZkVGp2QUhUTDZJbXBWSk4vR0o4?=
 =?utf-8?B?bHRpKytwR2RoMVc5VWd1OWlPR3JMUDdSZ28zTC9tSGdIeUg2MUlYYTlrL2hD?=
 =?utf-8?B?RUkrSThPRFpGcFQzYlJpSHBYMHkzOHlDVGRrS3ptdlh3RVhHbnpoY2xMOHdT?=
 =?utf-8?B?dWhBWnZpTGhDaDdVWTZsbUZLVnhNOGlWZCt4ajNqUkNHaWtqMmRvU2l4UlpR?=
 =?utf-8?B?ZDIrbFBtYmk1cVdXcU5kU0V1R3UxZllHaGg1WnJaU0cyTFo0aHoxU091c3ox?=
 =?utf-8?B?Y2p4RmxjckNEbWdYZzBXNlN6M3k3cit5cDJBTlN1NnlCTnh1OWRVNEh5U2xC?=
 =?utf-8?B?akhUeEtYSEVaY21qZXczU2Zhdk5Qbys1NEc1N0Fna2ZWb3lvbjc1RjFraDJD?=
 =?utf-8?B?STVkL2Z6Uk9TVUo0ZTUwVVRuL1JvOTFlRHZzOTltR24vMklrU3pNRjhRRmhV?=
 =?utf-8?B?U2dUWVFybHFDZXZ5WlRncm5Ea3JJRzhOdlRHRVNWOGtYZlArLytja3BnZDlm?=
 =?utf-8?B?RFlUREpyaDBrWmJ2MDVBYklzY3hJTVVrUFBTN095RVo1bzNiUmpkb2NQRGto?=
 =?utf-8?B?a3V2REYwZXBrNHBCMkdiaG9hT05tcmlpaG5iekc3c2ZVR2ZYUDJULzdkS0Nr?=
 =?utf-8?B?WFJQQjRXUFRlQTQzd3pTMXRwa1YwSkhHenlneGIzY1czS2VETDBVdzBibkNC?=
 =?utf-8?B?SjV1RjhQMVlmTWtIUXgrK2lvNHd3N3E0YnZ0L25uc1lNRFdRNFRpNU5MTlRi?=
 =?utf-8?B?NHNFVTVvY1FseVVMZzYyWEVJN0tPZ3BJbDZXZm5QR3pyYkpkNjhwSWNzSzFX?=
 =?utf-8?B?S2FmdzZENGY3N2NqU241NEU2WjJYbEhSdnY5SjM1MHMvaWdHMVg3TnRhK2dI?=
 =?utf-8?B?bjdKRmVLeHhENllnb1g2c2R6R2JFQVdZdWkrNkhMSVovejdkUC82TlhyNkd3?=
 =?utf-8?B?QzloNmsxR2RpQm9KVG4yanlZb0dNZU5qMitwdnBmOW5HVXBVRlRBclcwZjRJ?=
 =?utf-8?B?aVIvTjJuWlMrSlAvOEpkaFQ1Tk1DVHB0MEZiV2R1RU4wOGlIcVFhOVM2K1RI?=
 =?utf-8?B?RUhDWkJFRXNUQmFxT0h6VUJyQVBWdXlrdURUNWFsdGxrK3Jabi8yMEdwM1JT?=
 =?utf-8?B?MVFhYXlLN0JNNHQzTzNNSHduTTcrT0hzMEtIT0tLajZqdG5rdVZ3b2trODdC?=
 =?utf-8?B?cHJZSldpSTlad1ZRVGZsc2pKbTBabFYxRTVPc2tBWmhGekNKR3ZtUk13eEZp?=
 =?utf-8?B?UXJtZzRuVTFtNDcvZFF6aHJvMzZIUEI2NnJYUyt5L01ZRk1VdHFNdnJub2JN?=
 =?utf-8?Q?iqNylZp4T3KuE9etHPLv0yVqD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797a9109-397e-41dc-9c7f-08db6cbd0191
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:52:03.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gwjJdqQrU/7mWvPxqW7H05tKvRRb3eu0WMV4LObhYIytTWloqhHp44tAuFrc2rhScXSkz9vJdHJAQ9qrvOE5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9678

On 14.06.2023 11:41, Michal Orzel wrote:
> This is inconsistent with the rest of the code where macros are used
> to define functions, as it results in an empty declaration (i.e.
> semicolon with nothing before it) after function definition. This is also
> not allowed by C99.
> 
> Take the opportunity to undefine TLB_HELPER* macros after last use.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Discussion:
> https://lore.kernel.org/xen-devel/17C59D5C-795E-4591-A7C9-A4C5179BF373@arm.com/
> 
> Other empty declarations appear at callers of TYPE_SAFE and Linux module
> macros like EXPORT_SYMBOL for which we need some sort of agreement.

As said elsewhere, I think we should finally get rid of EXPORT_SYMBOL().

For TYPE_SAFE() I think some re-arrangement of the macros can address
the Misra concern.

Jan

