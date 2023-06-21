Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB03737C71
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 09:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552497.862620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsPU-0000X9-4N; Wed, 21 Jun 2023 07:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552497.862620; Wed, 21 Jun 2023 07:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsPU-0000Uj-17; Wed, 21 Jun 2023 07:37:48 +0000
Received: by outflank-mailman (input) for mailman id 552497;
 Wed, 21 Jun 2023 07:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBsPS-0000Ud-Ax
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 07:37:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8277aed0-1006-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 09:37:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8688.eurprd04.prod.outlook.com (2603:10a6:102:21f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 07:37:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:37:40 +0000
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
X-Inumbo-ID: 8277aed0-1006-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbdCG2AldNJY3vGUEcmUDiKB9vsQO1iQHUkyycDkWZFKYbP7vOwWY9JxTZkhz3gVNAfwoskPR26omo13HMlh0K0Vrq9ZLqxI82EcaiNEZpd4nEtYZ6VTGzYdsly4/B30LSBY/kr6/UmAcOIr7vIEXFV98ncKXOVlEVEYSERJ5qC7qw7SHnVg5YYy69OIww5S1UYOVnpI/bo/tgLRGFMFJKsBjyiYf9ZsjwovyDvx5XyHx1yqx4L1xfnfi9oFdYN80lOTidA0FY9Rbk3I6J33AvYLDWnIJInK3GpyQngJazyPvJCkgrY+bnYXQoo6zfaEgn0tFa5D+qgMWin2Z5B/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvIT58V+xKK+dwMjcJKjNZS1UgUeGFEnreN1wDt/KGQ=;
 b=VAA9yoagcfCxpqwgUhrlfMVbCLUPbYxk4Lis9Z06yXqI4Sb4lO/7UAlFJbcFtD0fK/4Hf4geitunh5Rws/eoB+z1mF2VlHhAs/4mCyktV6Ldt7+y4gZFHXLaJU+m1nzdWZ+oBw+qZQcrpNTfYHg/hGJ7k1oDA4wni46U/r8edj7G5AxZkLbmXpEO4IjFkUiSR1GnxQxSi+9aEDazdfTmcQDfcW7T/8x27NxsVKGdVnyt8T0YT+w3TKPyFzRfnqArjOGMK0MecLftJNnj2vzVUfyJKtV7B3Bq5qR3Sq9rC7GKFtX5cOutVkXzq3bOWAM2Rcq37gryXk9IfZ3X2Z6Njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvIT58V+xKK+dwMjcJKjNZS1UgUeGFEnreN1wDt/KGQ=;
 b=GjAeV2CIYV8hXa4GB/YQbFyOT9PRJLzl1lkchwT/hYu8bUnvX1Vpdv52YzCXoU1i1B46ad2XuKlFoexWH+sTDctQ6O2tWa65KFB7h1XIJ6SDkauBou+0tU9FftJrmFt9563QB0SNYecWEA16Q/7v9Dope4foSdDV62XoebSBfCHIJqHKRPfi+tbNsH53Jwg1d0bE00pfJuFFNRtFRKKpQ2kHJBnCQv/5W4ORGdkMVWsTY3VMHiBCggtCFZPyv95smkkdNxgqCluS4ytCK9z98HDuLFCMLqP9ZTQxPEkWbobsT/99PDSBHeey3lWfbk4rVuDMtLG+x6F8RhQt6dYkiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3daf5b51-cf5f-b9c7-b02e-0db5b48aa03f@suse.com>
Date: Wed, 21 Jun 2023 09:37:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86: Drop opt_pku entirely
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c193e8-979c-48f7-8ebe-08db722a642d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6FyQDnjlPC9NsO8Y7RsHiTfz0pdzpVjac6trnFrzT2FnFyb/7HJXC9jXSVcihInwHqZA54I19UJqZBrfYL6gscpM3+bfRe1gbNOqCARBO6dbH3pxMktXmeMBj4pshoSEafnGQtlIHHkl1u7+D3KFNIVzgeGLpRxW8m+zzcZ08GTkRjwIiIJICj1NWtn/ljsrtMZ3MF3qhAT0Lhu8aZQKtTpc2hA8IpZLGbFsNDPQEIlRQyv2GMZuT8vsJ6yl7FaJk2/qNiP0hs1KiQG7AhsAfqBLd1/5NO+IyJqJQFUNO4qt1u50nCTIF+KJbr8WnhjfjCIaN8ebtaWcB6OV/mmc40A/CqbH1Y4cC1MbuyRzUxHoGkIravo7fQrdjyyMIfndGeS4MQtr34F4FddAVdaAaZRpZ2CgnbCIU54SmZ+hffQHcQCqyY28XLFyNz78BfhzHxRCQSgoP9bbgAjkxZnGP9E44VSJr7nJkQNnhbLrHfm3/4gYQqDjoCkIWh6eEGiXsMYegrM5kIbO0sMP8gVQQ+sBP9yK4fpI8NSCgSH+0W84IEmSHUD+TWeq4DQYKnT1y2zyLeXUFDMNbIDSZ5ZRJZsoOOxHSe6bLz8HKoA6A9LZrI87s5Mbkg6QPSVmObgYwcnajGVokVY5XeTujLc2LA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199021)(6506007)(26005)(6512007)(53546011)(186003)(6486002)(36756003)(86362001)(83380400001)(38100700002)(31696002)(2616005)(54906003)(2906002)(8936002)(316002)(8676002)(31686004)(41300700001)(5660300002)(66476007)(66556008)(6916009)(66946007)(4326008)(478600001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTkwOWFLTDZjaU16T0dCN2Y2SHhHbnVpVENVZzR2RnhPSjZkYjJJQlV6aGNW?=
 =?utf-8?B?T0djMGV6TERENEtNNHpZeW1RbTg4SDBkVlJRcWVJdDN2NUZhVmxQd082RXU3?=
 =?utf-8?B?Q3JPTGh4Z3lYVitDbmhMWWEvSG93enBkNGIwL1F1K0ZHYy95QkZ4RFJjWHF2?=
 =?utf-8?B?VFd5TWlvT1dnOXhyNnNGcGpsQnFhcHU5YSsvR0VnQ1Z5M1U4TCtNcURlU1NR?=
 =?utf-8?B?NTZKVEp6eXh1REpuVkxieU9ESnAvZW9uR2ZlUFdvWTdlVVMxeVR2azFWV3Mr?=
 =?utf-8?B?UVB6ckVSQnVJTXV1ZGp6b2dNWDh3Y1NwTTV4QjlkSnh5NlhsNytDTWlSR053?=
 =?utf-8?B?bUNPN21XVFFJblJRemthTGZSNG5CNkJhcXhXUy8ybmRsNlBxaUZWZnRqNjhE?=
 =?utf-8?B?ZXBLVXQ0VmhFVUlKb1BncTJ2R3pNV0ZQTGthMnRKdDYwNXZwUHU1QWFualJk?=
 =?utf-8?B?M1RVWTk0Rk0rRzQ5RHpVWmMySXE4TUNOS3ZIVjlpcVB6d0N3amp4N3NqbWEy?=
 =?utf-8?B?NkNTZEJnZURrRjB5Q2crNkV5Tk4yM2psSUxtc2RnM1hUYjFrdjVacXYzQUE0?=
 =?utf-8?B?M2tFZ3JLQ1NlS0UvbEhtaEc5NUtVZWxoYXIrNWNFbkNyMkYzL0hta1pMVVE0?=
 =?utf-8?B?L3U1SHV5TVAzU3RPU1NsODM5UjFadFpSbjJSUkZRdkxxcDF2bEdvZTNWck40?=
 =?utf-8?B?REFpWFhxZk5hRlRoNytYbzRFOHhCcy9IU0U1bDNwQ3ZLbjBERDV1ODJRMEI3?=
 =?utf-8?B?WkxIVDdvczZPdVpPREVPU3FoYllzbGlvUFF2RzU2KzlIemhpQllDdDJQWVps?=
 =?utf-8?B?VFgzTEtBSWVrRkk1anR4eDA1cDQ2eTZWekdzS25rK1dwZ2NpSjVvUUk0Nnc3?=
 =?utf-8?B?Mk41VVoyZHJLdXZhd0lCeEs3aDllRUdLTW03Wk03c056bE5VdU5EbkE1N1FC?=
 =?utf-8?B?Zk8xMmxMV3pCVlpla1BuS29CY3hWdUNaV0hHc09HZlIyZHB3TU5QTGRHTXZF?=
 =?utf-8?B?alJjWWs4eGdFd3RtOEM1QXN1M0pRVThNYVpuZUcwMWo0anJWR3J3YkJlbXJa?=
 =?utf-8?B?TUE0YUgyM05yMThtbDZXU0FVcm5aamFVNXVzNFRpZ2M4WXNVbUJSTVBrL3Z3?=
 =?utf-8?B?MTVrVzRuZG04dXpUVjZpSjRYa1FkUUMzdGQ5RGk5VStGZWpWNFVXN1krRHZ2?=
 =?utf-8?B?Z05wYlBSVDluZjliUFFBWktZNm0vVWhRd2lNVTdIM3dET0tMQkxVQk40MzlQ?=
 =?utf-8?B?d0ZCU1cvTDJkZnAzR3RaRWh6dEM5WWNYZ1ZiaG4yRE1KNEdDQzlVOVJhdE9s?=
 =?utf-8?B?bXRBYXNqbUV2NEJSaWNHMGs3c09OdjBwNG9xN1g1Y2t1L29ycXF4VW9oSXVk?=
 =?utf-8?B?aUd2TU01a0ExemdHK0kyQW5HQmUrWVhEaERWNVh1WENuR1NyQmdiNWtXazdv?=
 =?utf-8?B?OXRMdmlJL1IyRm9jNjlxMVl6K2IzNWFFRlJSU0NJTWFWTmR5NlhTYUVRZ0c4?=
 =?utf-8?B?YVA2aVZLSExpcm9rdGhPTVFGbTZ3UWpYZTg1MlJrL0JBWVBMWllQSElHMzVj?=
 =?utf-8?B?eGpvMDhEbEZwSjQvQ2VpMVNwQXdHc011eHBSZnRrVzdtSjNMaFVhbHBQcDdK?=
 =?utf-8?B?TXh3NnFLVytINVdJZ1lZcUhWYmRXaTRrYW5VaGZ4RjQyVWdNRHpEbWFDVUFD?=
 =?utf-8?B?WUswK2xodVpiN04rUjR1UStFeXMvOUZKQldaZ252Vm9GNm1mRWZHVGV0L0k4?=
 =?utf-8?B?UEc1Nm9abFVjNjIwNmY2NHNWR3daUktoY1dvZVJ4RUtlbmp5M1U0cThxUkIy?=
 =?utf-8?B?cElvNzByMWYrR0RHV2JHcVA5N2FnNEdwbFdkTDhoQm15UlJ0K0ZLVHdWUFBi?=
 =?utf-8?B?OHQ5ZkRMYXdTV216QlZYVWtwVzFORE9UdDd1QVFoc3F4TitlUU1ObWZUbzgz?=
 =?utf-8?B?dlVnNVI2dTRIZE1GM2s1NVlTenVURUR3WDhremRlNmJVNTg3MEFSLzJET3RS?=
 =?utf-8?B?ZWY0d3NPUUF6RVo3bWJlcWFQcGFGbURHdWd5aWE5Vm5LRjRxYXA4Sk55TVJv?=
 =?utf-8?B?SlppYi9SRUhPZ0VNak1MZkt0b1lBNTAyY0hvSGxhTFdmUjJ2WkRKekh5cWVU?=
 =?utf-8?Q?EWN6KEM0XpzlZXbcMexx31kVy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c193e8-979c-48f7-8ebe-08db722a642d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:37:39.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nv0CBA3afNlft0005O3IzADrh02MBkwVm4H74b0MWKxI/CMX56g1+z6YtXn6cRxTtDd8TKVH8MA4ZC0XKYLjYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8688

On 20.06.2023 19:47, Andrew Cooper wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -25,6 +25,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Add support for AVX512-FP16 on x86.
>   - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
>  
> +### Removed
> + - On x86, the "pku" command line option has been removed.  It has never
> +   behaved precisely as described, and redundant with "cpuid=no-pku".

Nit: Missing "was"?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1950,16 +1950,6 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>  those not subject to XPTI (`no-xpti`). The feature is used only in case
>  INVPCID is supported and not disabled via `invpcid=false`.
>  
> -### pku (x86)
> -> `= <boolean>`
> -
> -> Default: `true`
> -
> -Flag to enable Memory Protection Keys.
> -
> -The protection-key feature provides an additional mechanism by which IA-32e
> -paging controls access to usermode addresses.
> -
>  ### ple_gap
>  > `= <integer>`

Elsewhere you said that we kind of imply that only the explicitly named
sub-options of cpuid= are supported. If that's the case (which could do
with saying more explicitly), you will want to add "pku" there in order
to not regress what is (deemed) supported.

It also looks as if the speculation control related enumeration there has
gone stale / is now incomplete.

Jan

