Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A14686DD2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 19:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488400.756468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNHlE-0002Wu-4n; Wed, 01 Feb 2023 18:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488400.756468; Wed, 01 Feb 2023 18:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNHlE-0002U4-1s; Wed, 01 Feb 2023 18:23:08 +0000
Received: by outflank-mailman (input) for mailman id 488400;
 Wed, 01 Feb 2023 18:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMue=55=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pNHlC-0002Tx-O6
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 18:23:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b9bb88-a25d-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 19:23:05 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Wed, 1 Feb
 2023 18:23:02 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 18:23:02 +0000
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
X-Inumbo-ID: 77b9bb88-a25d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGgrSY68mqhhyfbIfc9q+zjV/5nePDs/2KSqI24GpjzFsqaha4xtqT5ezmiRwgjsH0HSE2kPvc6I4c/B8sKLl5bMT7HUsQL2r1LHp8iRcLoEbh9uvpIGGaC18/nKFlTsoaU4MQm8Vvb/g4i7j7+QNNbrfo9rhblRnP2wMU1SwMIyRuRRUoTefcwLwXTuq6Oh0yPvDR7k3fbH4mzd4vaJqp8bXFAUYAd7GfKwqbjL8mKqPM64iQXYS7ViZUGSpY7efi/RUZM62KUepRRVRDs48NgBA3EnwtULxhBpRgD5JxsCahjMtrR6Dkj6jkr3ADWM7SSL8Y7KG3fMq6QMNXZ6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJHdhOt+uWK46pydYRq/wR/+sKCJiZxU66jmvJ8H9eA=;
 b=Uto7vb5JLW+1+5urJo4XCwDwASxw/6ZW0J3RtXpK1F3EegMpO2Fo8tYpQVuwYa9UwBR8Oj5xZ9xkdhnCfFhYyhl9x4U0lUiPOTb2LpKZk4xTxEvEu7xIyK7S4fFsDBxM6E4JpTsIKELoxRqy3h+DdhNtzg3wsTQYcxX1NFJvW1xaZQ1U/C8zlDjUq/h9XFlyiKrQK4MmuhJN21VJ5FalVEl0pZvyU1jUR8JXP+YGPJeB/SEYJf7L6lILIpAh0kyAa34zemnxPb6GZZH0ZUPti1/PWbStVN0/gAW6N5Z/8Yrn0GZ9GTdEbk+WJ0LMLaVz3c767wRwJ25NyIMiRNxKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJHdhOt+uWK46pydYRq/wR/+sKCJiZxU66jmvJ8H9eA=;
 b=EmE66mEANAA5VJ4IKcvQeWjEeFl/P6w4TFbkfZS5b8w2FvYOqV+pUrNhURCN1wsExy77R0uh7JkEfmvPfKzVmAZYNQzdh+tMO9PueRmawcGyy/vmzfcu2EotVouuLkG3UOSkdMbYtsBjkgyaDkqfGvvL6Wo6i3z5r5dnrwnIXIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Date: Wed, 1 Feb 2023 10:22:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: paul@xen.org, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
 <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 760ecaa7-c0d4-46c5-2387-08db04815a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZHu1iQgamGBPEfZITCcBxKY0f7ZFz3qjWjilkrPh/wH6o3DP7sk3l3wG9/nbmcdTpm/B9Zr4evdhBg8pHj72xEsWUVBCK27SQDj0rxMMi9p+8wOzStDkXUG/jlw0T+gH1eMQVzXaOlowFH2t8NuVS4rGMdmjsuQCBef/3BDXd/c0OlTpW+dhaDbWEjzLYhiSlxdcknpgjO+HycSWAp4sivXaMTjWxQcHv8Tu41iCwDXtY7mlVipjAz4xSAQrxjMn3jScm9poQ5Ui0OAtoPxiFFDIp1p/pQjNKUknr/nK9FxXGb0PrD7fmdKW6vbfZc7yCl5jHepaZTj4RvhOkDEU1IyJq2ed3AhaFYln4XvpXC05rNneIpeYUovlefdwt9GpGytBMrYjAvG8J8vVLEnvHycsyk0HezkpFlB5GlmaQLh5hpPbxuDqopFh9F1eysLUUmyH64lAGdoLOXgfZVtcL6i6noNBml6G3esKa2ncXDnXQhc0ARy+j9OdcQgZzLGtmMD33rsBAs6qz1a4ptYSIYingSQtkRtBGmzsG6jhf75qSCl9dqurRgUfOCvjEBzNiPjdBwJ8J2zZmZ8SvehvOYa4BCuRgGNifw47MjWm/0XFICf2EwMa1AGOrAEYNjYSQzmtUixpNRshSdDtY4FDv2u8lKq9yZAIIntLJ62DYvejpmDWwqObRI4V0/YUjqKYIUyi17lwjUkJZPjv4RO60ppa+c1A3kBTGKl5PjmTAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199018)(316002)(38100700002)(2616005)(186003)(6512007)(26005)(44832011)(36756003)(6506007)(54906003)(53546011)(6666004)(5660300002)(2906002)(478600001)(31696002)(6486002)(86362001)(66946007)(66556008)(66476007)(8676002)(8936002)(41300700001)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bldORmx1TWlPaUg2TmZVdjlsWVNJZFVYKzExcE1JdGZJZW9GSVlJZENSUFc1?=
 =?utf-8?B?Y1JaeHplRFJCbnNscWVBeHRLVEpBdFpUY0RnejFoSDMzV3luakxsMG5KQXl4?=
 =?utf-8?B?MWpiemo5L1VrMWV6TGxJSno0WFNIcW1mOS9kUUhZaCt2NGJIanQxampJWTUz?=
 =?utf-8?B?OHg4bGNmcjQwZjJFZFIrbTFRdHFrUWg4NXdiYm9qZ1dUazF1UkhtZGQ3ay8v?=
 =?utf-8?B?dWFXUFRsQkgrN0pMcmJ0aGpLbU1LQTRXTHMvbzRSTlpBcnNQaEFReXRGTS82?=
 =?utf-8?B?MGlUaGFTK2cxeWVoaGN2SEl2NWx3NUpiRVowQy9Od01Rb2wvL1hiekpNaUJX?=
 =?utf-8?B?NUtETHlEWUpvMU1WL3hsVlRhWktra1ZqUGFGRDdERUVGR0ZET09tZDVGM1Fv?=
 =?utf-8?B?aXdFTm5jTmx2NDdNQXh1MlFnRFV6MVNOdzlQN0t3NGFlVlZTZm1OU3JaQS8x?=
 =?utf-8?B?a0d2eTh3b1o3eUNybHRwU0ZLWUJNRTRKWlJBNEJKL3hhcWZQVHJPMzErTFVh?=
 =?utf-8?B?STZkWGhMbHhPYVZGWjZIb1B0UTQzano0b0JMbWZmMTY1MjJKakdMZTljQ3Jp?=
 =?utf-8?B?N1A5L2NLZzhvZktjN2ZUcHNiYzdnSDZaaUp2SUZEOXhWUW5ST0VZalJFZFJC?=
 =?utf-8?B?dFVlQ3UrbGw2UDFsSlpweGxkMnljdFdFVTA5R3NVMlZBTXNESU13M2pXam5a?=
 =?utf-8?B?dVRtNkl0M2dSNFFIWkRUWFZLTi9seHo0QTJHbUo5N0hRakRRamUvbE12SlN3?=
 =?utf-8?B?N3k1ZEcveGZ4cjUwNENYcGdyMlp2VmFuVzFXVVBPWGtuc3gxMlRYKzFzOXVt?=
 =?utf-8?B?YXd3N09vR2RXZWZGdTIxdVBsVFpPZU9vOEVtdEc5WDF1YVNqNGVPV3N1eFIv?=
 =?utf-8?B?Q0RHQ2p6UmtpemtoeGNJY1JVQXhRdGFaaDM0SmQxTmRiV2owVllyY3dySnZC?=
 =?utf-8?B?NFFvcTNuZ0hSWUxLeURGT29HQkM4bHZBcFY4d0hwWHdIYURzSGdQcThJbksw?=
 =?utf-8?B?RThwR0V4aXJ2UDhEV3A1NDZZNzVMSjZEOEZUQndEcFExYkJBeERqVHNtU1Nv?=
 =?utf-8?B?d042Vnd5R1UzOXdaQUJaVUJEMmNnR29HWVBURnBxSWdEU3Vqc2YwaFd2R2ww?=
 =?utf-8?B?RUUyUUEzYkwzczdQbVllcE5paElEWkE0ZklWaFZpSGxBZHVoWE5Edm5Zbytj?=
 =?utf-8?B?VFVWQ3hJaEZTNHlqMmloL3NDa2ZiN0dMVmFUOVg5Tlc0Wm1Eb3VqWVcwMVFI?=
 =?utf-8?B?d0xTYVB0WVZVT3p2YU82NGN5aHA4QjM2Ymd6NlRJNGFhdGxleVUwSzBobksx?=
 =?utf-8?B?RmRtMld1M0d2MTVxTVp5SVZwbFNmVDlVY2k5SUt2MHk3ODhldk1kSlZjZkN6?=
 =?utf-8?B?TGwvWXJic29kcHZ2YW1VUjFjZmgzS3ZvcGZqbFVQMEJ3UUVYdkJ2cVo0S2dy?=
 =?utf-8?B?WnNpZVFtdHlIZFJoRWhNUHlaMWlSaTU4cHdSOVJCV2lqV2xRc3h0VWM0RFJT?=
 =?utf-8?B?OW1CN2lWbk43WmhodlVzOWtPYjlFYkhsSXgwMHNVclBRU0xRa09pemtSVFlC?=
 =?utf-8?B?eFQ0REpJNkFiWis4aVMycHEveGpNbE9mUzJRbSthL0pXaEtnNDRsYkR2b05k?=
 =?utf-8?B?NkhCTTVWUlFUOE11dGFxaGVMU0NaU3I5S2hhOHY0djBERXhLQVFRTTdaYmc1?=
 =?utf-8?B?MHdKdHJOaElqWWtHbDYyVGloQkZ4elRKZHpjMTA5QWY4d1B2TzVLN3hBSmhI?=
 =?utf-8?B?SFo1MHpBUEtkZlN4VXlMUlBsLzF4UU05R2Q4amwzSVRLWm8rb3lZQkJIZ3Zj?=
 =?utf-8?B?V2NSUzh5RWN3NjdxZWd4VmhZSGZRTmlMUmswZi9tQkZ6WXY3THhqb3FSN2Za?=
 =?utf-8?B?R295U0FDTW1RY29PTGlmZ2NDYmpzR0ZRU0o4YnhHcE10RzFHUTQxZjYrMTBk?=
 =?utf-8?B?YWJvSFlqdC9NYlVqdk9JQmpNSjg5eit3QVlPMTVoVnBaMExFYmhSdEZwWWJQ?=
 =?utf-8?B?N09UMXkwRmJ1WFZyaUFrdWtmd1NJbmlKYkJybisyNzE3ZDFnajVxcExjQll4?=
 =?utf-8?B?bkFsMmJRcmFNeE5KVEg1ZDB5K3k5bEdhTURBSTk4TGVlSHFGVG50eXV1VVFE?=
 =?utf-8?Q?OGiRDZjShbHz3jMKTJLrux+LJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760ecaa7-c0d4-46c5-2387-08db04815a73
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 18:23:01.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPGV15H/KqjO1Oh/cUXl/zOk8gR0HQET2K9SGL8/l1+nbaTzQTrwCua9nW+ftlLN+heG1d4d3swMXYsXRpwzHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571

Hi Paul,

Thanks for reviewing this and other patches in series.

Please see my reply below.

On 2/1/23 12:30 AM, Paul Durrant wrote:
> On 31/01/2023 22:51, Vikram Garhwal wrote:
>> Add a new machine xenpvh which creates a IOREQ server to 
>> register/connect with
>> Xen Hypervisor.
>>
>
> Is this really the right way? Is it not possible to do the Xen 
> initialization (including ioreq server registration) off the back of 
> the accelerator init (i.e. AccelOpsClass ops_init function), which 
> seems like the right place to do it now that it's no longer 
> architecture specific.
>
There are few other machines using the "accel=xen" option and few of 
these machines aren't using IOREQ and other Xen related initialization. 
Example: /xenpv/ machine under /hw/xenpv/xen_machine_pv.c /and few other 
machines under /hw/i386/pc_piix.c//.
/So, that's//why we moved the IOREQ and other common initialization 
parts in hw/xen/xen-hvm-common.c and call them as needed for the 
particular machine.

@stefano, just checking if you want to add any other suggestion here.

>   Paul
>

