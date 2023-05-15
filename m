Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C252702656
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 09:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534583.831727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySv8-0003Vo-1g; Mon, 15 May 2023 07:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534583.831727; Mon, 15 May 2023 07:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySv7-0003SZ-V3; Mon, 15 May 2023 07:47:01 +0000
Received: by outflank-mailman (input) for mailman id 534583;
 Mon, 15 May 2023 07:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pySv6-0003ST-D4
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 07:47:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abfafa2d-f2f4-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 09:46:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8569.eurprd04.prod.outlook.com (2603:10a6:20b:434::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:46:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 07:46:57 +0000
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
X-Inumbo-ID: abfafa2d-f2f4-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAqaAcranOCHYApk8yRxSAMSNnO12Xi8y7C/Q/j4MFdyNf/C4eJb9+c5vvC0khuGbSClzrfMtuy337L4m+Wm0M6Ecg7KugPLZAfe0K/NBgHWiwnA72PTiTm3i3tGzo492tbRzLdVOKGx0ek5waunfEH9ch0ILBw5JW9FN83VZTWYjPvkws9FMrur889b/OLbROAu6AGm583rIVl+6+0SzCrbke/8oIfRbV0uy6uBbxqAOr5hCwHBhVP02sZE1t2+Arq+M0zQONqGlOo4ZvnPcenu/4RdW8e8kyrN+v6IDVbtB8FUcMm1os4Bcwb1AIrafFImJ1eaGBIVzqCEvdF91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4s3gTU5b46ruyQ52PiBJHNQaP6RsxtFLi8QL1fpfaY=;
 b=CYrmISoSJIKVbnn6Ll7dA7l7DdCYQRz8FtMSKJ6MvEuehwXBe3r6ndgwBUWWJW9OxxViTRfmnYCWHmxsgPYAI2kQK7nZBzWj263Unr/fAggo2DEpWUeCJyJAhkEteiqMBrtKU+RRbOSqZNP3FJaflK3RoyujuOOaHPyl6xQaW3USYBoYVNcbI1gmJ3ea/ObZ/47/++n0xFJ1IMgZ98g5xkO4b+Do4chWsQt7YQdNSNHxfFc/i5N3AA1RYKzSsY1HuKfMAjIgdIxjocVOIjVqVdw6JscpuxeOqxJY69UCu47CeMGbW311fg9Dx9brciZq3fyuDzWLFoL1Bb8qPotxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4s3gTU5b46ruyQ52PiBJHNQaP6RsxtFLi8QL1fpfaY=;
 b=xzFGGHzUA8+lTu94/5NqOhAZC/DrX0D5c2RZvqt/ibprW+STAFHHgyW/t4SjAS6Wwve7YkucRL5KneZVNaGzYMyyDo5cf1sJtTLTNbAUAZzufUke8k3TXU7Yz5v6BQ0dozYIn1FsE4lChj+2zTyNlOGuVAwat8ZDTlSz46jFLPKqspBOmbJFDVA2DpnifWR8cyDpJzJ4uZ6P0oFG6dNdMvgCRFIxJ99QhAM/g44KZRPeE7L9qgYiQEhjDAHXdbLbPRyCHVhXFibUhJfvB6n8UzIJdomVppHvWzZkGidGJ3N2gKARLI4Jw0JIhugxTJ0Hk95NFeEUqn5n3DkQ4OA+AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <687ac0c3-9364-f03e-8f7e-afaf985618aa@suse.com>
Date: Mon, 15 May 2023 09:46:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/cpuid: Calculate FEATURESET_NR_ENTRIES more helpfully
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230512124551.443139-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230512124551.443139-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2726f24a-db7c-4686-756d-08db55188f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FQqbaMWmbz3tBA//fkRxqASl0pNVERpdshODGEbJ0vrHSU7DPWF4/Uj7vtRHXXW4gksc9RlUtj5rPklOeF/QmZJlWupzFtMDBkgyKRjS+JDE/zL+8g7uVQl2c6iJ9TB7nTcPhqr5UomZ/HOQ6toIflG3wOMfLBA2wHRgR2Ny04IU5nMP/nFZa4WHrD7ZRMs8lxwxPj/b/1CQqetTnhdVHhTs5yzb6DvXj5o+AfDRgeomdcBKaaPV546uFfNOdk3E0dfvoU+omBQDQpummECyqDhPVyZ1DYcxF4Kixbl9sJ5ktyAs9nP4t6beLY1BCIuqaP10h4DfSJctcb5h+PTWxep1K7UairTxAQq3j/9R3A24GomazcKa2l9fGUx4g5HzeU5ELeYRM5zXtEcMHG16LcqHDSbv+iJtFIgFuDAhi6K2gwNlGJ5slFl2lya+P6Rsdes6ZrRgkrGaDg+38K7M9pC1mKaC5QHp2byEa8p5TT9Yy05cwd0nzxiPmqPXccxijmZNOUkC1oOcaaRSEZDgKYw0gptR5SAf2OlnqzRmGZPjcx0GKW7dR4e+ROpc2UqV22f2yZc1jCXxqvmOtD0Vjin2o9Z6iqyIpMV2nmJzSmXcHK9k+mvNUucdyX7Xdtko+HK5hhD75hz0dHGPcUobFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(54906003)(478600001)(86362001)(2616005)(83380400001)(31696002)(6506007)(186003)(26005)(6512007)(53546011)(38100700002)(36756003)(6486002)(66556008)(66476007)(66946007)(2906002)(4326008)(6916009)(316002)(5660300002)(8936002)(8676002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnhEZ1RSRXVrQW5hTHBrUXlmb3hnTGVvSFU0cHdqT0JJK3ZOa005MjB4aUw2?=
 =?utf-8?B?YjRBUzdNSFZPV0ZBUVlVcWp5Z1l6QkVoL0JVcndVajRVVTRhVUFkRDcvU09V?=
 =?utf-8?B?RUxINXAwWllPSVdISG13VG5GcmpoQWFaUWRQRkNwYmNaWVE0dzNEekJNTDU4?=
 =?utf-8?B?Q0ExT0Jpb1dVQTB4QlJBSjZKTjNZSWhzMEF3dk53L2ZOT0k4WUxXcWlxeGdm?=
 =?utf-8?B?cDZUS1RKTEl1Nk93TFRTL2QvWUs3WjZwcjlPTXlNRGY5RGdFLzlWc28rVDFw?=
 =?utf-8?B?U3pyVTl0cDFET1hra0lkN1V6Ni9LRElka1o5aDhpWjI4QkRyYzBtdnpibXM5?=
 =?utf-8?B?WnlPdTZ5K24vNm44M3FVdHQ5NENlSy9rRnpOVE0zdi9MUEowa2d1Tk41RjFD?=
 =?utf-8?B?Q1VkNGtDaWxPY2V3UEZTT2hEdndPMlJsdFZBTmwzMmtuNnNQbkhIbC9aaVh0?=
 =?utf-8?B?MCtncTVYQ2NhQ242Z1FyOHJYakhTSWdtVXJPS3pSUVQyUzhLQ1RLT2xyaURV?=
 =?utf-8?B?WmRMcjJ1WFJRNWVmMXhvcUo2SkxDYWwrOWFuVk9hYUVQUHhWSURTd21GbjVR?=
 =?utf-8?B?NnZkc3hkRHJ2VlhiZkFBWk1GTVVVVGJESkRPQXdxdjBOaGk3eW40L1doUk1i?=
 =?utf-8?B?U1RzN0haZjFwaW1CL2hpTmZISGhvbTJLY0pBTnlrU3g3MkgvMUhHSVNLdkFO?=
 =?utf-8?B?aUV0eEMzOGNaelNhY0t0bVNyby9kZW96bXpUV2Nab0UySnhRRnNXZTVacVVY?=
 =?utf-8?B?NXptM3psb2NVSEo4OU5tRXdXTm1LQk5uVC9OQ1FFenJBQzM2QWRiTzUyajNh?=
 =?utf-8?B?akJiK2dIQzl3U0Q3cWhoZkZKVFN0YVdJZkFtMEJvbE14aDMxU0dXL3oxbnRx?=
 =?utf-8?B?QWx4akJMaW00K1JLdkwyeFVZZm84SElSM0FFeDBEYXlpTk1hTFFoeXR6akg1?=
 =?utf-8?B?NmRmVURvd0g4QThST08wK3dwMjhmd09vQjVLbWtlQ0xvTk5JV2tmend6SFNh?=
 =?utf-8?B?RURrNVFnWHQ4Rmt2M3BQdnVZdDFyNUt5RUFyZFpEQjY5SGVVaEx2cVFEN3pm?=
 =?utf-8?B?bHUwTG85NWs4eGV3b2ErZnNSMW9Vc2ZZcURrTGFBS2g4Uk0xM0RwcCtPOFh5?=
 =?utf-8?B?UmhHOVA3dStMa2x6Vlc2UlBsR0RMUGJWMW91YnUrVzh3dDk3TDdOTWRRS3FQ?=
 =?utf-8?B?OUxHc0J6YjJpZFBJZlIrajBwaXFLbnhYL0M1MUhiUmpmNGNaclo4aExJNWE1?=
 =?utf-8?B?K29IUFJuVVdOcVFsd2lpTTB3Tm1BblRFSU1pVytlMWFLbVlJUnNEMHZLOGdu?=
 =?utf-8?B?MXFyMHgxUkozNnYwb210WVJQR1RPVVJpY3pyOUp2T2hHOEd5NldqQ051U1hp?=
 =?utf-8?B?UUxXczBudm8rajlmZlljY3JCRS8xUGNPTkVPU1NkWXpyVEhXU2x6bHBzOGhk?=
 =?utf-8?B?Ym5mRXRWU3VoeDhVT2c0NXZSSmtOdmRBdDJsdW03Q3gyZk5jRDRwMFpnNGRN?=
 =?utf-8?B?TG5IcmgwVStCZFJHN2FCd1B1bXd1YXRMN2hHVkhLcGtETVZJZlFGZHpFQzRy?=
 =?utf-8?B?NW5FelhtdUh3Z2Zmd0RaaFJQallHYzBCK2p1eHphTFFjbEJ6c3dkamlucnJl?=
 =?utf-8?B?WFB6dTh0d2M5R2J3Zzh1RENmYThaUFdobllFZjJYeE5maUpxOUl6QVhodzY0?=
 =?utf-8?B?Uk1FZkJkOEZkWEtzUzNJT3BrMStmYWxaY3duVjgzY01pRU05aUM3TXNvTzFv?=
 =?utf-8?B?QlhvQ3RzYzB1dE02QURoODUrNUYyUlNsTWxBK1ZOclNpNkJpVjV1ZFZKUjEz?=
 =?utf-8?B?bkUwWjFhbXFvdGVHaHBlVFE4ZDk1aWZHWEMwbXVhS3d3UkpWVGZaMVFoSTho?=
 =?utf-8?B?NG1MMHV2dGxmWmx3cjM5THlBU3V5cHZxcUVMalRKOGxXTXZvTlVOQ1hjWHE4?=
 =?utf-8?B?UUhUc0RUT0RzbHFvTlU5NWRuaWNNREVZTGRyR1krdElLUXNIejVkd3VwQVdG?=
 =?utf-8?B?eEZKNTJKcFhxd0JqNWVaVGFaZVZFMllqcVl4bDBQWThsUWg1UEdKRnd1TU1L?=
 =?utf-8?B?V2g4U0tSOWVGSjFuSTE1eC9XVWw2ZUtqd1Nub1c0OXNybkxMYUdiUXNTaktK?=
 =?utf-8?Q?0XqBqji/QYTcO4+2c/AKZToub?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2726f24a-db7c-4686-756d-08db55188f36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 07:46:57.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy5qhNANzLSy5q2ZehpcWVOPHTdGc2zvhinETy5lnDT/l6zsEmES9SQga+yL/baVglTib6vRxONmokxYabBM3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8569

On 12.05.2023 14:45, Andrew Cooper wrote:
> When adding new featureset words, it is convenient to split the work into
> several patches.  However, GCC 12 spotted that the way we prefer to split the
> work results in a real (transient) breakage whereby the policy <-> featureset
> helpers perform out-of-bounds accesses on the featureset array.
> 
> Fix this by having gen-cpuid.py calculate FEATURESET_NR_ENTRIES from the
> comments describing the word blocks, rather than from the XEN_CPUFEATURE()
> with the greatest value.
> 
> For simplicty, require that the word blocks appear in order.  This can be
> revisted if we find a good reason to have blocks out of order.
> 
> No functional change.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

As far as my Python goes:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Just one remark further down.

> This supercedes the entire "x86: Fix transient build breakage with featureset
> additions" series, but doesn't really feel as if it ought to be labelled v2

Thank you for re-doing this altogether. I think it's more safe this way,
and it now being less intrusive is imo also beneficial.

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -50,13 +50,37 @@ def parse_definitions(state):
>          "\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
>          "\s+/\*([\w!]*) .*$")
>  
> +    word_regex = re.compile(
> +        r"^/\* .* word (\d*) \*/$")
> +    last_word = -1
> +
>      this = sys.modules[__name__]
>  
>      for l in state.input.readlines():
> -        # Short circuit the regex...
> -        if not l.startswith("XEN_CPUFEATURE("):
> +
> +        # Short circuit the regexes...
> +        if not (l.startswith("XEN_CPUFEATURE(") or
> +                l.startswith("/* ")):
>              continue
>  
> +        # Handle /* ... word $N */ lines
> +        if l.startswith("/* "):
> +
> +            res = word_regex.match(l)
> +            if res is None:
> +                continue # Some other comment
> +
> +            word = int(res.groups()[0])
> +
> +            if word != last_word + 1:
> +                raise Fail("Featureset word %u out of order (last word %u)"
> +                           % (word, last_word))
> +
> +            last_word = word
> +            state.nr_entries = word + 1
> +            continue
> +
> +        # Handle XEN_CPUFEATURE( lines
>          res = feat_regex.match(l)
>  
>          if res is None:
> @@ -94,6 +118,15 @@ def parse_definitions(state):
>      if len(state.names) == 0:
>          raise Fail("No features found")
>  
> +    if state.nr_entries == 0:
> +        raise Fail("No featureset word info found")
> +
> +    max_val = max(state.names.keys())
> +    if (max_val >> 5) + 1 > state.nr_entries:

Maybe

    if (max_val >> 5) >= state.nr_entries:

?

Jan

