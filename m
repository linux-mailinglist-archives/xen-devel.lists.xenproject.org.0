Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7C6F586C
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529190.823299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC4q-0000i7-FG; Wed, 03 May 2023 12:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529190.823299; Wed, 03 May 2023 12:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC4q-0000f4-CG; Wed, 03 May 2023 12:59:24 +0000
Received: by outflank-mailman (input) for mailman id 529190;
 Wed, 03 May 2023 12:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puC4o-0000er-RD
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:59:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523fdbba-e9b2-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 14:59:21 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9588.eurprd04.prod.outlook.com (2603:10a6:10:31d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 12:59:20 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 12:59:19 +0000
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
X-Inumbo-ID: 523fdbba-e9b2-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7+7htrPsnZscAy77VQ0DrJY/CD8rQ4wZmA0MdDLqXalaiuJW3skRaZlbwLn+vFOXFx8+mY649YFJ4I8Fk12MK37SQu+DvNDh+Pkzdy1Ihv7VepmTE41poUSmYz8tfMyK2C5ZSNBiqXcsbYgwKy3Eajwygzl8BTxVpVxSj4IjqcpevCkCFq+X14PxEcVd9O4vQIOPXDb+3k5iz7e0G1/IAnhF1eKsM3LIgk4GNQeQLfplJg4ZfU2r4RzBjjSccgdrZQfReQUFanI7ErbVa91sKdQRTdOZm8OirHITUjxyUD5+UVcEL09EsmDaoT5boucGscQGmHhm3fXZKz21u0VPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTIfjDGnj3/WeqbrCcUfjD6T8DjZ2Pu0a9/w7OnCY6E=;
 b=RmgKJ0brgpFDbK67k7XoUoY26A7/mFZAwcz7fCoL7gtgbjlhH5hjAAmLsR4zg/IyItyVK/103JFxDylqaFHQ4YSM2UmMZ4pA/ZUgRw2Hf5mCgpPrCsI0iBxTw8kCnzb5uuKsUPnVnSIj8FIcV/bcUYTb9FWT3TC6vCVeXHSu9SdyMN7ssiChWAsprIeMQvLllGdnTbnxvH+o5k/E0YWdnSj9cBAoehQBPoAKmly/9TAvYmCZji+oeZ7xHw0UDxT5/GEAt1ErQ4r3KhACQUBEIBXfynAw+vaIqfMaJQK7oZ/G+QjhB5Vh9GjjBE5PUyQXgPlgJkdjJaqdR3RKzxALVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTIfjDGnj3/WeqbrCcUfjD6T8DjZ2Pu0a9/w7OnCY6E=;
 b=qQBxlO7FegaZrQp3PBWVF8O+EMLWrgP7oAh0GXt6bREjoxgEYI+LzFJdxPMTA2L5DZVeypprssBxpdW8T8ltxZqXbPgqXvigUv0t25DLRitVZbTtFY2iIdIwIXYLzpRXYkVC5a8as7BHD8FtSgSIcFozkThz46ZKGs+yWFCyfeka6BdeswJinjzBpht7vmk46GTymk3GNW4NfCBcULMp6CSsSzHaWErL7jQWzaxvi4DUF17cjA9LlTZmkCrOSZ9O4Z+dLy0Q5N3ld/NrrkO0al103LTSwK1koKR0f6hZhd5N0Oz+OUvYRThbUZnsyrm/2134tB5ujjFyhrk8Go6z8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e21773f-7178-5c8c-f7bc-941308d0297a@suse.com>
Date: Wed, 3 May 2023 14:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: xen | Failed pipeline for staging | 0956aa22
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6452557e7028b_2a54f38959a5@gitlab-sidekiq-catchall-v2-bdc885877-cd8zv.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6452557e7028b_2a54f38959a5@gitlab-sidekiq-catchall-v2-bdc885877-cd8zv.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: ad911d4e-1aaa-4f7d-d1ab-08db4bd6358f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r98y/HrmxbuMqatbAL87ofxAqeI9Nl1FNyqitSZz+pIn5J+lskyc3b9Qf7zb4NYoU/NjLtqCa2oMddGh0JDWvGETFWCrhzJGgowSnTFDo3Dpy5UGVyDAe/khv1MG14fYjBVvfoqYhejf+RjEagf60LZ7/Tcn/sWVDjGLLDdbpZzzQsGjlYDgf9RtYuDCJjAEXWljKWMPdYaRZIPLUG5UsKeuFj442qjHwtd6ZdvyNWNBy11dtd1cgtc9FpYZvMrRE0n0SuGU+JD1QkBujI22lLwhzN6Nt5EtvN1lyAS1nqj2Lyt9gkum9zNswVAdiXpKDZ44r/6OJ20/fEEnqA6U7dIhGl628MhEh2L2huAL3Nq3mQq4LKbzuxVUznWrUpltOp5+q3fEwu9z9gUXYn6uyiLZKQKl8FLU52BTizj4l/76P59cvw9HhLCFAxhxk49aZEMW1nIS40xYM0FbYMLGBajEZzPFsT1+dSeCMP82iuT8NFkoc3J/qY1A56ZCLG8a2/E1Mht8u4oOzksfN9odwQJjIouaEe4EbOhNToEqTYBEN4m+zVh7diVsj4LmHIwkmE1wkK9P5sxQgNhdWzBlwUkhq26XPO+bF83VUoYhncR/SiJfM04Dpah6jt3ODWEc0IrE2i11nltiDAvTiEQiNtl56a9jtGetOgTsO7PDJfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(53546011)(31686004)(2616005)(186003)(6506007)(6512007)(26005)(6486002)(966005)(6916009)(41300700001)(66476007)(66946007)(66556008)(316002)(83380400001)(8676002)(5660300002)(2906002)(38100700002)(8936002)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2lHcGVwOXdmbmgwY1RVdTRoaEdjKzFLaE5qNGVIMEFEV3YrZlRYM2k5d28v?=
 =?utf-8?B?R1pOVkIrR3Vxazl6Y2hRcXQ5eU9ueVV3Q0xHUE13VGdwWUtraXp0cDcxem9p?=
 =?utf-8?B?VFErN00wM2dRWTFTWTh0cG9QaEJtUkRUS08weVg4R21UTnVPUFdIcTB6Mlpa?=
 =?utf-8?B?U1U1R0tFRHpMa0JXSHlGOWpQbHRDdUMycVNYcE1pcEpIVmREbE1IcmFVbC9k?=
 =?utf-8?B?RHZKSEVObFlvNVFER2tSYW81MVJDL2duN1d0di9SbTJSRk42clNhVzBNNHlw?=
 =?utf-8?B?c2ZRTmpyb21XN2M2bnBubWVRYU9lbmh5Qm1OQ2U3S1RIRWNXeTRYdFMxeGlx?=
 =?utf-8?B?ejg1S0pwN25GKzVqdCtTYVh2cGtPZ0c2bGdBQU9UOXlRZUF6QUllaXZiRWRn?=
 =?utf-8?B?dU1JVHpDa1h2VWFBQ01GRWdkNml5Q2Fpdm0xN3hLdk9JaGZYdExucGNKWWZD?=
 =?utf-8?B?YmtNUmZFcWVQLzA1cGFCaGJoa0g3YkptSEhGeVZCZXFBd2NNSVlrQ0Q2MlVV?=
 =?utf-8?B?K1krYlJxMGhhZlZwa1B5RmVHSURSR29RRGNSS2thUlAxTDZOMGNXQSszd2xh?=
 =?utf-8?B?K0NGeHpwd2o5bnY1TElRSGdaS2Y4WWVYUW5TWXpCaGR0eUxHRWo0Unh1Uk5B?=
 =?utf-8?B?TUZJYnA3ZUZWL0t6Sko3VW1aNzhvc3VqaU84U2MyWHU3aXQ2NFpYR0pIZ290?=
 =?utf-8?B?TzU2d0ZQRkNRaFhQS0pqRnlVbmUyVUQ3QXBMMFhaSStWbjI2WUd3QzBkczBB?=
 =?utf-8?B?RElSZjFVODl0aHhOWVI2cm4wUzVJc3VIeXZPQ2ZKbytHbWI1dzFJZ0xMVjdT?=
 =?utf-8?B?NmxZYzlhcGZSQ0ZueVo2Vmp5V05jWVhhRndidEx3OCtMNW9VaTRlL0k5UG5t?=
 =?utf-8?B?S1BNWDBzNkF1Z0VQWmNDelJmS1B6S1g0QkJKVi9WWEZOK3B3SGV3MzYvMllx?=
 =?utf-8?B?Q2NpOEhxdWpXTGExczYrL0hWSHVDWHY3ck4vemRUOXJZS3ZIS0Z5enB0NkJl?=
 =?utf-8?B?QXRnRXlxR3c4UG1meGkxR3JuZjZnL1ZXRUh1cTNJZDUrUjlodk9LY1ZVY3BV?=
 =?utf-8?B?WkNLRmtqaEV5a2V4ZDEza2hHckgvVkE1Q2hvSitFLzBRajhqQXN1M01waUdk?=
 =?utf-8?B?K1lJZ0UrN2pDVnp0a0ozWEtTU0RYZXZ5Q0lsNGRXbEJwMHpyRG93Mkpudkoz?=
 =?utf-8?B?aysvVnRiZUtZMHdLdFA4K3JnbEtvb3N2dVZzbkx3VEl6czZTRzk5c2NrdDBQ?=
 =?utf-8?B?MU9vOGphellXcDBuK2hLS2IydlhRT0F6QVorcTFEZkVvSjR3dkxzcWdpMjll?=
 =?utf-8?B?U2NlREVsWmZKdjFBZURTYVM4MHpzckRodGlYZHFHbDVRWlBmV0hTWDN5TEpv?=
 =?utf-8?B?SE1MZ3p2Z3ZJN2oyYXRHZDUwNFdiaFlwUkFQVnVKbitxaW1NZVNIOHFkNUVE?=
 =?utf-8?B?bVRCOUdzL0lWVldkaldDSGtIOG9abEdlU1d3VVpGaG10RVdZYlN4dTExNDRQ?=
 =?utf-8?B?RlB0QmkvKzg1bEJOZ3VIT3VLc0puNWFPemYwTUY3NjJTbnArZHc1ZEYzY0NQ?=
 =?utf-8?B?QUNoSm05RVNvVzRBTEU0L3lCQnlaNlBSOFNhcksyVzFadWtPYTJ4UmhEY1lQ?=
 =?utf-8?B?ZjI1WTBFb2dQcE00WXVqQ0NURXhHUElBUE0vbXpIZ3lTL0FWcHQyc0YzdC9y?=
 =?utf-8?B?YURkTkxzdHhRV2Q0elNYSE0vc1l6UStDN1lYVTYyZThTdnZ4UGVpZmNwTUhP?=
 =?utf-8?B?Q0VhcUpzQitmUFhiVnZ1RXB2TGczUjk4U0RrZUJMSjA5TWExalJ0L1VZNkRw?=
 =?utf-8?B?THFoVEROMlpOUVNRZDhYdkQyeVhBN3hXOUtmckJlODI1N3ZVdEN3c3dtWGhY?=
 =?utf-8?B?V1ZkOERxRWtGTUxQekZnV211VkszVzlOOTdZUDBNVEJUVFRsb3N5QVVoOTNw?=
 =?utf-8?B?bW5mTHdLWjl0eE5nWmovQTZaOHp0bkE0VXMxV2FNVGlCVXhKem5ZaldSRFVO?=
 =?utf-8?B?U1FPa29ra0F3QnJpY0xzeDNzMEh1WlVHWm5qekZpTTZpaDJpaTBiU2gyemI0?=
 =?utf-8?B?RlRBTUNqZzJ1My9zaC9tZkZrZEN4SXVmWXhIaWxKNFp6Mi9IbTFCdHF5YUV6?=
 =?utf-8?Q?TQmfYbtoL4zfep+Jpz7eXCz0q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad911d4e-1aaa-4f7d-d1ab-08db4bd6358f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 12:59:19.8471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+hZby+46q7JDSxKMmQFztqVZEzX6VBkJm4GC+En5o3m+zDcFXgPa3vvcORFyZPbxCSiFVqvoMg1TpIOCkIIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9588

On 03.05.2023 14:37, GitLab wrote:
> 
> 
> Pipeline #855820014 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 0956aa22 ( https://gitlab.com/xen-project/xen/-/commit/0956aa2219745a198bb6a0a99e2108a3c09b280e )
> Commit Message: x86/mm: replace bogus assertion in paging_log_d...
> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> Pipeline #855820014 ( https://gitlab.com/xen-project/xen/-/pipelines/855820014 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 6 failed jobs.
> 
> Job #4218447934 ( https://gitlab.com/xen-project/xen/-/jobs/4218447934/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-clang
> Job #4218447943 ( https://gitlab.com/xen-project/xen/-/jobs/4218447943/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug
> Job #4218447940 ( https://gitlab.com/xen-project/xen/-/jobs/4218447940/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc
> Job #4218447966 ( https://gitlab.com/xen-project/xen/-/jobs/4218447966/raw )
> 
> Stage: test
> Name: adl-pci-hvm-x86-64-gcc-debug
> Job #4218447937 ( https://gitlab.com/xen-project/xen/-/jobs/4218447937/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-clang-debug

Two of the build failures look to be addressed by Olaf's still pending
"tools/libs/guest: assist gcc13's realloc analyzer". I guess I'm going
to commit this with (just) the two R-b that there are.

The other two are less clear, at least to me:

checking for openpty et al... configure: error: in `/builds/xen-project/xen/tools':
configure: error: Unable to find library for openpty and login_tty
See `config.log' for more details
configure: error: ./configure failed for tools

Jan

> Job #4218448078 ( https://gitlab.com/xen-project/xen/-/jobs/4218448078/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm32-gcc-debug-gzip
> 


