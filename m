Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40946E735B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523140.812909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1OQ-0003bs-Jg; Wed, 19 Apr 2023 06:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523140.812909; Wed, 19 Apr 2023 06:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1OQ-0003ZT-H1; Wed, 19 Apr 2023 06:34:14 +0000
Received: by outflank-mailman (input) for mailman id 523140;
 Wed, 19 Apr 2023 06:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp1OP-0003ZN-86
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:34:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 325617a6-de7c-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 08:34:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9805.eurprd04.prod.outlook.com (2603:10a6:102:37e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 06:34:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:34:10 +0000
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
X-Inumbo-ID: 325617a6-de7c-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmATe0gAi7pdiWwHuTfksl4bDpXDVlIiOui+1eHA7HJe4r6P37Ue23arT5g04ZopCdz/70UqQCnDHgqUPuRdzOI9aUDXCGnSJah0WN/TqPGOHU3ApZYlM+GcvfliqYSB3kavEsp3bMr2lFaD2VD291TSB1va0nwHn2KhMXNEZuFcwOgpgDfZMlNPF7CgIXQyE+QcG2qFaLkwbYOf/myERU5WR8/kf8HiHvIz/d2nRGfT3qrQBQQT+zpH+95HqhdnUhi7IQL5OD0FY5eXByXQnlnuMzfumOfmfwpgKuKfTV6ktDJcIw4ZsXthD9vbvRP7BzEvqRxsMyfPqo8YQm5S8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iv6XBxAGE7g6mX4Zf7J1MBL4jIBjwrJDI5W2QHdeuz0=;
 b=nX4msxL/LPVy5+o7PXgBFTCOG7UqAFZzYG6wnCvtJ39ypGW9BcOonTjFHLpoXunLomTPjWec53JohnFbRdd9AT7N2TNY4tLdFNn586sGlIDRkFfWe3tBWm/dD8ZfcI00HOYt7To2UuClyX3QYF9WrZx0v46TDZ/O7z+BssBWxCD45pxdlK3p5SJG4g8bUxYMEHWHNPKZd7nqrq3Brap1dpO8GbFn1LKIsWGvb9y259zw3iMOe5NK5MACouWBsEJTTnQE0DP2kqUCd6VBoGxdgCbFw/Ixt+OqFDB1xX4YLHsrguVIqDeOKUOXy/SUEf36pxxqqDhnzIeW6BUX+ks5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iv6XBxAGE7g6mX4Zf7J1MBL4jIBjwrJDI5W2QHdeuz0=;
 b=jRssQ7vs4UCbzhJMKtxvU949dlOUD7mBO7h8+yoLMTW0BrSnZr1/rXqRGCssrAEsAdWXCR43pC9rGWoDtNdRbWFDn8GR009WKo2FZ42yYSW3NROAmiES7m+XTKFMgbxx3ZPtf0sM4wFQ8b3NRL9vDO17lEs5pU3AEa1XENFQlPqD5rlB2eKJ6POTOH7MqStHScITeSseB/t98mbKkimL0rnzBGrErzKkwlZ+kiKY0Er29V2qNM9jGuzNx1a16cRYk1pl0t1c5JRS41y+tDniEUzyIM/qK3PZ+wsoZjZ3H5tmbaaS2N3nZqYH69pNkDSj9wPT1wPwQvyf3lerlmtrOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7969e744-bf32-94e9-0607-b16f36edac92@suse.com>
Date: Wed, 19 Apr 2023 08:34:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d5df46-7ef4-4498-d7b9-08db40a01560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i/mISvn5nSigCfJISABXvX8pTwzqH8e+JhdqXfBqDUTcUkg/KSwuvWXnnZr8CAKeS7F9L7+VBf1jZEoKXD/Sq/ubOhqMrwoneZCxxpPjdS3zUnJcBHmYUicULud6/6sZV1nrrMmMqkpulxB2fC8sEWN4FgjSk1/WA/8OsD8MBQ4b73sYlJXn+xA7MPfOEjenRvtYE0FW2UQgmTvQ33tRD+e1vjra9hVapsDWnBWeqxjv7gWivGmiK9xcTYMljgiWLze0Q/bne0PDQcPRGOr8R9lvGcyOryOLFetSFqMO+f0xogxnE4XP3Oi+b0Jt1ZDgMb4Z+WGRhgjaNGJ9ukBLEg/TMWxwqAj1ZyfAannL4YHCx1r9LHQ3tPGEsoP81k9eocRYBF0vT4WhH4LIRCJuSOLqwGQM0V5ZEfZ5GFF1p0g1zSZIT8A72zPThGZMxSSJSMP3gQ2TSGvwfzIacMeXWcWvYLpygfr/vW5J8m9K3dPM9KtqOd6S00XbeYMhdkYCC5SACVjyNs2DKATRFAbTceLLDghGQYHGD3z2A7HQIRFvCk/WHeqUI613mGaFP4eA9qTmZDnSvgeMSfSsccW6Awh4zk3n5beWMutBnLmrHkNbsf/JvccN8Bi3yd3H+zgUAAcEwsY05zk02AhfEcL5GQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(2906002)(8936002)(8676002)(41300700001)(7416002)(38100700002)(5660300002)(36756003)(31696002)(86362001)(31686004)(478600001)(54906003)(2616005)(6512007)(26005)(6506007)(186003)(6486002)(53546011)(6916009)(83380400001)(316002)(4326008)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dSs1TVpMc1BlSkpoaVQvMHNYREVVL2pIUmVOQ05wWXdpSUhoSVRtWkFYM1Js?=
 =?utf-8?B?ek1qVzR2SDZzRXNRTFJFZU1KL0psL0lnOU9hbXRjYUhRblBCTUZmWHduR0lm?=
 =?utf-8?B?dGdZSTBaNTA5TlVmMExaeU1udXRHTU96QTV3cGtlSlFtQUovSWwxVmFTRVBN?=
 =?utf-8?B?bElVUGl2N0YybkM1b1pYOUhyT2UzeTlmWjVKSThwWmhtc1NXUUlTeUgwNmM1?=
 =?utf-8?B?dEtkK01hOG5OZGVRMnByaEVwWWs4ZENSR21zQUFUYW1GS3lTY25YSk5TNU1R?=
 =?utf-8?B?NWh0b0YvWUhZM2t1N3FHejYyZ3pwYmFnWGpNcWZLRHhDUVlYdlE5WW9EQmhh?=
 =?utf-8?B?SWV1UmpUc0txcG90VFNzaU41TEZuRFVFOFQ2cTRsbnRXSU5Id09TMnBveS94?=
 =?utf-8?B?MmN3clNvaWlJS0MycFFPYlpCYmptTUhvZlNTaGlPVWhJVm9xaERDMEdRS2VP?=
 =?utf-8?B?NHB4dlZrYlYvYWVNLzgwWFlNWnA5c20wOEthUDdkU0l4aUlMWlNZSHNCa2Ez?=
 =?utf-8?B?b256WlhhMzlyekRsVFNKUnl5dlVMUHJra3NlWERBRGRhNDcyL25ybkUvRU55?=
 =?utf-8?B?aTRZNk5qWm03VXhrNm5GV3p1L05JN0srUFgwNTRxNHNLZEdDNU5YcXRoNUww?=
 =?utf-8?B?b1k1SmNKdFd0cCtKaFNwZVV3YnorcnlBais3MkFmVFQ2Q0RuWHI4SXhxUjFO?=
 =?utf-8?B?cktxZFpKZkJFRC9LWnlYY3NXVTFmV2xQckFtdWdWV1RsYUJXY1paQmNrc0Jm?=
 =?utf-8?B?ZzBoOXFtVmNTaHRUc3U1dllYMVJZZ0EzRmhLcDZULzJnbW1VeWpObkpCbjdK?=
 =?utf-8?B?RmROcGw5aC9pWC9VNTF1QVFXYUV4UnB4NHdCeTFMdGk2VG9HZnNQSnk1K3Fq?=
 =?utf-8?B?WVlNaXltZ0FDbFQ3VzdaYjhDN0RyL1BEc3NlNXk1dzRaalVvM2NRTjVqZjZC?=
 =?utf-8?B?UC95clVsc21heXVHZFF1RFRnc1k3WG04NG9jQ0kwbjhKRTlXaWlrM2tBNEdL?=
 =?utf-8?B?VEdXT3JqRDBuZkpMQWNVSmJQdlVONHJOYkpkUHI5b2lpek5mYjVWK0RJdTI2?=
 =?utf-8?B?bGJBYm93YU5EZHlDZGlQNWxDc2VoMm0yWVY3R01tRGlsMEx4U3BRVEl5Umov?=
 =?utf-8?B?ZVl4azQ0eFNiZ1c3bHBRNEtDMkc5d3JoR2RFcXRSQTZXZzYzTkRpL0tXWW9a?=
 =?utf-8?B?enpVZEJYUllWaFZpTXZUWTNIbmdHdUlCcmNqcDl0Z1plN01taGQ1M3RYT3JV?=
 =?utf-8?B?OG1PYmFQNHNvUTVwbWZtK01adUZOZzNBUm4wOUpsdkhxbmo1TzJ0VGlRMEtV?=
 =?utf-8?B?YjJ2ZExSVWNlL2RwRVc1OWdFRFFTREpPUFF5cDJDNmgxZC9DSkF6cW9aY3dv?=
 =?utf-8?B?S05pR01uWEVLamozMUFvTXl0Z1E3eW4rUkQ1NEQ4UWVCaHFTekhyRmdBeER4?=
 =?utf-8?B?ME1vRTNFWlpBTDNWMEpDcGVOS0ZnRGdJOWdBMzZLMEhrUzBId0d3ajlBSW4v?=
 =?utf-8?B?S2p3SDlmdEwyT01ReVhCWlpqYlRiUE5HODBLWlp6cHRnN24rTWdNL2ZRYzJV?=
 =?utf-8?B?bHJTcm82ZW5aSFFmbGNHWjBEbnFzcWJIejg1OHFxeHNzU1BwNlVLVVhmSHc3?=
 =?utf-8?B?RU9EWFRkRk5sNCtrWDlvZzh6a01PaXdwaWpDdzRkRlA1b3h6STNnSEhGQzhC?=
 =?utf-8?B?cHp5d0UzbWQyNUJ1dElkM255Um4ySU9sTnFxYXRIaHQ3WnI1MTZ1bnd0cGdD?=
 =?utf-8?B?UGZkL1p4bGlOaENjdGt3NHJxelNKd2FDYkcvZEFnZ0FyMnpHcDhqVDdUZlJ2?=
 =?utf-8?B?MnFDS2tlNkYzeWcxc3ZDTEVQMzFDaFI5Zyt6YmZ4eVBPWW1zbHZvTFNJNzcr?=
 =?utf-8?B?cGxKZjczZzMrKzhTUVBNazY3L3hjNldEMWRray82VXRtVUNJQ281NkRhRlVR?=
 =?utf-8?B?bFgwdS9CSXpwZnYzN1dtakxsQ09rM29wUzh0VmRxSlVJeU5YTnV4ZlF5c3dS?=
 =?utf-8?B?Y0RwUS8vMTdoRUwrRk9HRHQxS3Vza0pvSUF3cUFBZWVCRUowS0RSc0I2clNG?=
 =?utf-8?B?alhZSFFkaStZQzNyaE9wbGxQdkxsVU12YWhtaDllZzFiUzZ4anBmV2xJNXM2?=
 =?utf-8?Q?EjCzXPpNL2iIUyH2bsiKME2OW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d5df46-7ef4-4498-d7b9-08db40a01560
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:34:10.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK5Lb8Zx6pD9WGrcoYpCMHPekzTDf0N2AOBGUe4WNERZrfivVv6Le741sZEMKGE4enidto9PTEuKTqKHydfNtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9805

On 18.04.2023 14:47, Bertrand Marquis wrote:
>> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>> @@ -118,3 +121,21 @@ void sve_restore_state(struct vcpu *v)
>>
>>     sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
>> }
>> +
>> +int __init sve_sanitize_vl_param(int val, unsigned int *out)
>> +{
>> +    /*
>> +     * Negative SVE parameter value means to use the maximum supported
>> +     * vector length, otherwise if a positive value is provided, check if the
>> +     * vector length is a multiple of 128 and not bigger than the maximum value
>> +     * 2048
>> +     */
>> +    if ( val < 0 )
>> +        *out = get_sys_vl_len();
>> +    else if ( ((val % SVE_VL_MULTIPLE_VAL) == 0) && (val <= SVE_VL_MAX_BITS) )
>> +        *out = val;
> 
> Shouldn't you also check if it is not greater than the maximum vector length ?

Perhaps not "also" but "instead", because the supported length shouldn't be
larger than SVE_VL_MAX_BITS (or if there was a risk that it might be, that
should be taken care of elsewhere, e.g. in get_sys_vl_len(), not here).

>> @@ -61,6 +62,21 @@ custom_param("dom0_mem", parse_dom0_mem);
>>
>> int __init parse_arch_dom0_param(const char *s, const char *e)
>> {
>> +    long long val;
>> +
>> +    if ( !parse_signed_integer("sve", s, e, &val) )
>> +    {
>> +#ifdef CONFIG_ARM64_SVE
>> +        if ( (val >= INT_MIN) && (val <= INT_MAX) )
>> +            opt_dom0_sve = val;
>> +        else
>> +            printk(XENLOG_INFO "'sve=%lld' value out of range!\n", val);
>> +#else
>> +        no_config_param("ARM64_SVE", "sve", s, e);
>> +#endif
> 
> Correct me if my understanding is wrong but here you just ignore the sve
> parameter if SVE is not supported by Xen ?
> 
> I am a bit wondering if we should not just refuse it here as the user might
> wrongly think that his parameter had some effect.
> 
> Or is it a usual way to handle this case ?

It is, or else we'd need to alter what no_config_param() does. Plus ignoring
the argument when !ARM64_SVE is no different from passing the same argument
to an older Xen version, or from passing any unknown one.

Jan

