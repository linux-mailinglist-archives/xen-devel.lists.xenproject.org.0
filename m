Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C903F75F7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172349.314419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIt4n-0003c9-5I; Wed, 25 Aug 2021 13:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172349.314419; Wed, 25 Aug 2021 13:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIt4n-0003Zf-25; Wed, 25 Aug 2021 13:36:21 +0000
Received: by outflank-mailman (input) for mailman id 172349;
 Wed, 25 Aug 2021 13:36:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIt4l-0003ZF-Kw
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:36:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a4de1d1-f5af-4a60-907f-abefd2d6aa8f;
 Wed, 25 Aug 2021 13:36:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-fov6KFOhN4Gf7-YcZbp_5A-2; Wed, 25 Aug 2021 15:36:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 13:36:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 13:36:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.22 via Frontend Transport; Wed, 25 Aug 2021 13:36:13 +0000
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
X-Inumbo-ID: 0a4de1d1-f5af-4a60-907f-abefd2d6aa8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629898577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5yBe8Hvv7zc3FkHE4IXqCzJ9+eCANw5xhSl8y3cF6o=;
	b=TJbjqbpZCRG9KeAZtaDErZ7TPJ3WzqUdKjcX9JKKKNimtPKLvtfxJ81jAd12/8SJp6YrsU
	0IQZOR30OFe35qN92G2eFTOgfkLw7miNMoyDqDhk3nNI4JbE8V7hEYBP+fi2jJESvLz1kG
	QGRySqmExvl6pq1AVoMClLCueLh8UZ0=
X-MC-Unique: fov6KFOhN4Gf7-YcZbp_5A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxRf7bjHfxz09Mrcle8HzXo6syWQMgBvwtUCMIuzBJsrRQiqnKGMM6HoBTYmMxC5buCZfvhEyqK36nhprMB74VTvxDWLJI/CMluC6+3QIHhBRQ0w7KoteG1l1CwcNpMKst3CqeIGReMkVN2dZa8fOIGXO4woVVfbE9941n5w0KWVMEP/0wMby1QVGLvfUUthUxcd9mQIcp2GBl+C7Lu5Lmk+yVQI4/BR7Ol+hXwY640u1dWCdKHSSTUg+7cGtpa99nJSmKzAKtY7nkOvvFanCetn7IWV8cpK4ffCpPafMEFtWJrvLwSukVCrdvnTV7nRLuQGWWxHvOoqnxwlKf+fkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5yBe8Hvv7zc3FkHE4IXqCzJ9+eCANw5xhSl8y3cF6o=;
 b=CA94Zi1L27u4lL5SWRfp4YmrPJGq20pyjLLJBjy0k6L0T88zT+A8vcjfT1k4mCa0P7PPJM9jSEE3vaEroSiS+kNcAuxBrK9dBxB1Axk32QsdgmFNA9j3PWuiRO6/0c/rs88+017cuvizdrvbZwfl2GgJE4Bty8SdpFN3igpckOiigbH3ST+bALH1iuJ7HSW/YvQxA1/f4IQhtqUBC78n6esFiHuONMoHIYlCh8vqEyDoGDRxbYt09sPE6LE6kFSMaO8F1jYW6wlp0kWSkRWXKwicYzUQt3IdPLGd9MNHrZ3JfSTwrpSZKekediyTcN/yIIJAzbCM9GtR093g0CWVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 14/40] xen/arm: set NUMA nodes max number to 64 by
 default
To: Julien Grall <julien@xen.org>, Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-15-wei.chen@arm.com>
 <dfde3e1a-be4b-cf14-8a75-8910760b2c3c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b783bbf-dd96-856e-a9ec-4ac250d3760b@suse.com>
Date: Wed, 25 Aug 2021 15:36:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <dfde3e1a-be4b-cf14-8a75-8910760b2c3c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb977a47-3ec6-45dc-0620-08d967cd4ee1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480636CF0A75CC9697E44C6B3C69@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pJnNXXqZWXJOR+qPl80c8yOxJ1QvyR6clfKNAzsSRR14fhP+L9CgnvGEQ2kWesXZTr+3snZyBCSgQrxvQGem7N3M2e2Caz4mgOgRqGHk7Tq5pJaX13nYl4OBw+FUhszD0U5uxwL0w8xwaClyjutzFgtx4h9/fyaRuQPi0Bgj0CT71Pa434jkRf6yrqbO8d5DadqQG39C7H74ZOKDeaCgt1s5Ti7oe7mGl/Ocb/bZujSE5S2h/1zZGKWJ5Fy47f6OdrGdb7OignN/wppkS1/+2jh3j4zRMfQnr+xKVDhIPD2jXnYtcGP1a8RMNodhlBiThqAJRPqyNNagHu7glHY6B+BQs2+Wo/cdF1+DlCbDwh8XhUMcYmYeSdhJfDBc9bSFR5ujazAr9kR/ksXBKW87+euo4+j4n6ChOBVePq3z+2XRcvHTXKauWwoWWjpCHbCKilSnk2cmou8MJl+z6WpQV6ah2ouAn1HttA6EvRydK9delkCkYgSJ4m9kjeUGYIQXy4wjuT6cNXkqcL88RMVPcarIZG0KEoO3nQtHhs98OyiD9DZywoUEr7IBNs6HhqOx5txyPrVDjrHdAuioBrF4dxxTFjniu52J2lR1iVQvoyArpy0ISk04G6LeZwwBil7hwzRUiJe2GUFHkN7JoekBn40oc/npzjg7pcxujcUd9wuGxhsLF/vXpthR95b0U49ifRFPO1aFLYu+xK6HLjKju3MpIf013DPrTrl0lqm8ZKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(346002)(39860400002)(396003)(5660300002)(478600001)(31696002)(38100700002)(2906002)(8676002)(31686004)(26005)(66476007)(66556008)(66946007)(186003)(8936002)(53546011)(36756003)(316002)(4326008)(956004)(16576012)(2616005)(110136005)(83380400001)(6486002)(4744005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2pxb3VIa1hHR3lyVjZJYTFieVgxRDlYV3hOWVZpVXV5UGUvbmtZclk3NTNr?=
 =?utf-8?B?L09Kck93WHUrZE1ZUmRoaW5qQWdHL2w3NWxQMWVoMThTQm10dTl0cDlKQUVm?=
 =?utf-8?B?YmhEb1hrbVB4TlRmQkkvdGtud2NxODcxWGZEWG1CVE1ocGgvME9wcjFSV1U4?=
 =?utf-8?B?SnFKMDVVQ2c2N1FsNjBTeXVJSEl5SWtYTmg0RkxZVzl2RTFDOFg4cTNvNDZD?=
 =?utf-8?B?VVlPOENIUitYNXlxNFdDejlyVnYwR0d3Q0V4UEc4V1dJMC9RNHFHYVVJUkNC?=
 =?utf-8?B?bWdIUlFzVTZIZ3lYaEE2S3ZwR0x1K1N2ZzlWWjRHSFFIcDFoUm1hSjduZGtq?=
 =?utf-8?B?YmlLa05jb3lWd3lKemdnV2V1UXpCQmtkUzU1WURVTjJZNmZSUnRMU3Q3ZkVO?=
 =?utf-8?B?MDdXczlOVlZpU2ZZV2c4eVpHU2NGSCs1L1l3L3ZKUVdNT2Z5d0FNUHdBakJG?=
 =?utf-8?B?T092d2lhWUp6VG5EdmtrNytaU0ZiZXdNemM4V0MwZmdiUGJwczVrdWU5UGxv?=
 =?utf-8?B?UkltK1NETnpFMHNmVWFxeXkrdWVIOXVjZTF0bUFHSVk5TDFvU1pBL1VmdzJk?=
 =?utf-8?B?NElkait2K0VxOUpxSjBTUCt3TmoxWGJJVlpXVU1teXV4N1FUVHNhSU9rcGJ5?=
 =?utf-8?B?Y2NPVElDYm5QNGE5WVhWWEJzakJxZEVUbVVtcExPYWtvbTVUSmhHb21wK0gw?=
 =?utf-8?B?eFZocDFkdTRQV2w4YWNDNWNScGV3TlRVV2MvbUpHbkxpVkJiMXpLZFlla3Zj?=
 =?utf-8?B?SzM3cmt1YkZicWpNa1VYTkZnU0dxSVYweDJZeTBRNHB6VWpUQ01LSnpwWS9p?=
 =?utf-8?B?R1NFMkZJNEsyRFBGWkM1c3p2bU5zYlRIbXpxVUpsL0lwR0Jxc2J2M3RWelBY?=
 =?utf-8?B?NjlHZjgwcS9IS25mTVVBQmpzbmswelB5NDU2YVR4QUpySXhxMmRaUXRzaFVM?=
 =?utf-8?B?dDA4SUswUEtxQlk2cWYvUG9sTys1NmdJeE91dWkrcjFvYkhZTkQvVkNuNWdr?=
 =?utf-8?B?NkJwODFaYWhJUjdJd2MvcnUwM29JK3VQOEVCMzRaTlY4dFZaQUQ0enZpV1lS?=
 =?utf-8?B?R0s4dUxtMDUwcVJ3U3AyVVBlUWFVY0tpVjZIN0xzaWQzekYrY1FDVHZsa0x3?=
 =?utf-8?B?RGpiRlFWOHNwT080WFROSldVaHE3U00yUWpKd25zSnJBck16RVoybklJa0VN?=
 =?utf-8?B?ZVg3bjlxUTlIWXVCQWtvVnNFemF2cHlaa0ZjZVhRYk5qMUwvbnREakcvWS9W?=
 =?utf-8?B?ZTdtOUtvY3RxMXNPYllNTlFSZ1dCb0ZqbSs4Q0FoYytJSzVIQXR1WC96M2ZN?=
 =?utf-8?B?ZW1MRmgvUXJEc0xPV291Y2FSTEFseE83VWNpZW1aUE9HbUhPTW1SNXhOMzda?=
 =?utf-8?B?RjJKMlVtS2lVVlBXdXBrWnBTejdRd2ROTE1YS1ZzTlZRNlRSYlB4LzhxY2F3?=
 =?utf-8?B?NEUyZFNnMlY2TGVhTGhsY3ZCMTJBVWo1a0tsOWNkQzJpVlg3YTRoYWxZUFlw?=
 =?utf-8?B?QU1OU0RJT3R5bFQ2RHNROVdTMDZFZldtRHJEKyt6czdkcE56dTF6Z0F6cjFT?=
 =?utf-8?B?T1FRMERNU0h0MXVKR0ZOWHlXaDdLcEh4UEVlbHBBMTFlM29PT1owelBuTmNj?=
 =?utf-8?B?Z3BJRzJTN2x1bGk2YTBuaXJudlRXcVFkRzc4OE9VMTV6NDNiRmJxUzdremFY?=
 =?utf-8?B?bE5HWHNWdlNBbUUvcTBQTjhkRXdhME1FQ2xrbitUdC96cG9wSkNSZVZHYTI0?=
 =?utf-8?Q?3JfJJGqevPD6TffqFFh/276HWhEHSr90G/lrncQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb977a47-3ec6-45dc-0620-08d967cd4ee1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:36:14.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ks5J4wvtMTfQJgT8h6ylL84AxBWRNzwN0jWRaQOgW6W6+sVNGrsKJbW6UQmyGBlFER1U9l2pTGpkD7v4qLcz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 25.08.2021 15:28, Julien Grall wrote:
> On 11/08/2021 11:23, Wei Chen wrote:
>> --- a/xen/include/asm-arm/numa.h
>> +++ b/xen/include/asm-arm/numa.h
>> @@ -5,7 +5,15 @@
>>   
>>   typedef u8 nodeid_t;
>>   
>> -#if !defined(CONFIG_NUMA)
>> +#if defined(CONFIG_NUMA)
>> +
>> +/*
>> + * Same as x86, we set the max number of NUMA nodes to 64 and
>> + * set the number of NUMA memory block number to 128.
>> + */
> 
> Such comment can rot easily if x86 decides to bump there values. But 
> given the value is the same, I think it would make sense to move the 
> define to xen/numa.h.

To be honest - if this gets moved, please at least consider making it
a proper Kconfig setting. Just as much a the number of CPUs can be
configured, the number of nodes should be possible to choose by the
build manager. Of course - if it's not too much trouble ...

Jan


