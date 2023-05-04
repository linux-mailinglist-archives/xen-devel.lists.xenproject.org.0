Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9C6F6DCD
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529821.824652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pua3e-0000Hl-KE; Thu, 04 May 2023 14:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529821.824652; Thu, 04 May 2023 14:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pua3e-0000Fq-HY; Thu, 04 May 2023 14:35:46 +0000
Received: by outflank-mailman (input) for mailman id 529821;
 Thu, 04 May 2023 14:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pua3c-0000FR-E6
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:35:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2f891dc-ea88-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:35:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 14:35:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 14:35:14 +0000
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
X-Inumbo-ID: f2f891dc-ea88-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjPoXI9peTov5mIL79eiUWZc1JUtY2i2QVBYqiuu90q9TPd+nZAdUYwikXJOSU+pFGAtKqQFPC5Rr3MtuLkANtp0QoNvS7CY4wDvHgLkIWn6xvO6MFs/09Ptniz3dq7KA1DEKmelsfCPO2Bl0ovmyeUQ7gzlaQ/o02PrYQz9vK7DxTLk7/gExbkqEZZ18R29SqftqG2oEzQGdl/5ENeA4AsUsKriMXdD8IJrozB8GZXIuyIWcU8cQ9i2a2eclj8h7ttcVdBCvFgOO5gNoXu222IQ9j7AJEpxMrWQfJnV1Y+EMuBMSaDhDOpj1Am/la2UZcEQzjZ+qGgIyrf9EZv5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB4/rhLL5Ist8rEa+N+ZqWBPQdVApQyPPYPHHJTga2M=;
 b=XzkBiQYeoHkueUkEo3kTIZAdf/Ggh0K/TZmbKid/IJMYy6SNzmXxmFCg3LgQyWgT9mB21H8icy5Pz9UxMNbd7V/slYu+RC3viwCPHbVsSzgdUZ5Pf79MPS8amWWfOOHFYPGSB20nd6Fdo2pHF1OoTEoxWlVesfBXPBPMQDBGR/vvmb7/uNGhN4atTgJvZ15kpxe8nuq1hk7bIYvfRwBnRR6zZzCA8c+MfdLum5up3f+U9UUktw7fQ0MI9QuRNlQBCBaN6JTjjhOMyWaNFdfH44Ymrb14opUn5LCGPPt581GXnBsHEdAhcuPuH8VEsbVebEoPZxeUXoMu2jku+Gd4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB4/rhLL5Ist8rEa+N+ZqWBPQdVApQyPPYPHHJTga2M=;
 b=a5/OHWWAKR4pBPb4igWUG6XZ9kEDC17HKYF8G7QaJwWj7SjWhih8uBvhruirwNvrm8M1ve2k2B6N7sjOZoMbVH5Hya3LdW4etPMSlP/vKEjSvi3oiBpZ9gjgUwuQ4ke3W3n/b4TuHckYm4X3oRh80mag0Qe0hiQQdQEu+zZYBTZpkgvAeFZYg7d5JOfW0mMZbnUN11PHZW41sJhMMxZbkn9c6ZKb4R9HuAxOhC8o5WDMyTN28yMr2IqmDvjIXrD0Jm7aw6t5Bl3wvn8lAZn/QGrPVEjHWBNZyfbnmvrLQZs4Mu2p68bPJtxFxAmyL62YXWu4tRxUMZ5P1FESPQajnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2864bf57-88cd-6fce-2d38-6f3a31abb440@suse.com>
Date: Thu, 4 May 2023 16:35:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 05/14 RESEND] xenpm: Change get-cpufreq-para output for
 internal
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-6-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-6-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: d99b4171-58ba-4a10-0e49-08db4cacc5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k4RBb+C4x0vBffGUfrekkmDs6ZdtCDyBKZYMCeFmiJGek00NoTfx6OBZVmZocdkE9JwGg2ROFeIKqOqHW8/GC+4VxQ8Yc4oYcB/h1rMp8Ix3owyZFmQhtLWPa+65O6wCjbdx4a2OIJmXLN/odCtEdCh7+4Q9GnCkD9uAnvYxWRajMCMInwm1t+8cuGEeDrxbFRMX2HVQphCvuehLvWEoGPHsD5x+oY1ZFY0hZiy1Aa2d0uHHTJC7DziX9hQvGBYHRMArcQ1Q1TMotigCWcfQCkkhYmTced7pdK06b0FpBYr6UmD5pndtQdbNBN+qQdH6sGpC6TshxycID1IY/HmnaNbdqBzqolwPEdFPoPKExQW+FSdsEuRUoSYCUXCgfeNeyMPSyWDLniQzWQ461idLzDvrnnyw8UuSsRnijRHJqApu1h4MRivs4hf81jQbsPlxRwjWoe2kLu69TLISU4DJZFaZLFIXsuBWIVre5d0R7CSXpxfrxzOZN9oVzenwaI4vsHc+oK6oLm2NNy3TcDc9VBP/8gOjs0HWRk67uvbiWXvanL87gvvPz2VgvazEyqsmRjkPRhQiqH4H5Np6CI42CiaAu5rmW7qRsx5eKnOYySioDOJAZ44kD2LtFLpTdg48lvakjLE4IaV8f6qY86pbpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199021)(31696002)(8676002)(6916009)(316002)(86362001)(38100700002)(66476007)(66556008)(66946007)(478600001)(4326008)(54906003)(36756003)(41300700001)(8936002)(6486002)(2616005)(2906002)(5660300002)(6506007)(6512007)(31686004)(53546011)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1sV21ROGtrdHp6WDJyNWdzN21waUVoVkpaYkxsS1lnQTF5cmt0bE14YzJm?=
 =?utf-8?B?c2VrVmt4cWIyK3o2YzhUUWtNTUFtSnNCUXJLMmZEWFdCTGxMWWNoMWFsTklP?=
 =?utf-8?B?ZkdjblBhYnQxK3ZhNXN6NTdWVGErRTh0ZmlpSDVCcUFCKzJYVFVpakRIbEIx?=
 =?utf-8?B?ZTk3YnFXQitHNm5zZ0t0WjFGQzFEcTN1eXNOQ0pqVGdSLzg4YWMrSEFkQTBx?=
 =?utf-8?B?bFBJdTZBRnBZYThHMG9uZ2tQYjE0V0x0d0NXNEZxWlNZdTQwMXc4YVBFV25E?=
 =?utf-8?B?V0Q5UnBaNnJCVXFXTDh2TWFodjRoaGpqa2k3cWI0T0Zza2hlRDZsc1FmbEhi?=
 =?utf-8?B?SE8yV3U1OUVIT1ErMTBqU29iUWtScW5qcEhsdEdtc1k4UDhlQVhkOWN0VFlJ?=
 =?utf-8?B?T0cwSXRZckJWdmkvM0pyNGtEYXNqWlZvdFV2TjNUM1hxVlVBVFhzN1FMbngw?=
 =?utf-8?B?c3EzcEw4ZGpFejNmNUtFWUZLc1VpWU9IZndoeXRUSVh3bTRhQmpseSt6cWFG?=
 =?utf-8?B?alZuL0dRYmlyU1ZxSWV0UFBpSlpGY0FpZnoxMEdjY2NneTIrdHBnNFpRQ3lW?=
 =?utf-8?B?bTZxQVVxbkhkRWlrT0gyYVdnb0xEZmw3bkVkN0JhU2dVQXJPOXNIK1h0VXkv?=
 =?utf-8?B?UGphUUcxYmxyVWFKeWdoZS9ybWNMMW5pb3prOUVqTnkzNjJBcnN2VTJqN3Ns?=
 =?utf-8?B?NTRQR1VQdVBIaUtOUVM4RU5DRXlvR2YzTkhINDE4bHBPYzJqNlNJeHkwSzhp?=
 =?utf-8?B?aU9QS1puaWJJSk5PV2hrckVzbFRNZk9GTjZyVzMyVEVTeEFJa1NZUkRNQ3Ar?=
 =?utf-8?B?VHpwUlBtTm1kV3N0WHBDS1UwWUNmNzRFNkRZV0J5ZFpIU2lsdFFHWW1LYUE2?=
 =?utf-8?B?Y2VSS0g5bHdDcnd1UFdvYXlsMWFyM3Q3Y1dhaEJIcW5NVnppWjFhRzIwOWpV?=
 =?utf-8?B?bVlXckpKSTVzQVdvM2ErQU4yaDFWM0tPZFR6T0JSZ2s5VmtHSW5FeGcvMlda?=
 =?utf-8?B?V21GMkZQNndwYVRaSU10NTFGSXRtR0d6SGd6TUpSMEVmK1dQcWRlMlpKZGND?=
 =?utf-8?B?N3JyeUUxM1hxK1M0WE4rQWF3ajVYNlpNRkdLVnBuTzZRTXNoR2VFYVd1RmdS?=
 =?utf-8?B?TzcxeWpSZDkyWjUyZVFxS2VCUy9pRTgzaWNDT3JNNSthaXBRb1FLTXVoMkdx?=
 =?utf-8?B?REx2M3NUU1IxYkw0Q04yQldpSWFXVVRscmdOMHNBL3RiSnNXekltZ3p0bStL?=
 =?utf-8?B?RitlNnBTcGVDTGtnR1NZMHFOaGd1NVdEOFRiUmEwL0VvcUVwTkJjdXFHYWVa?=
 =?utf-8?B?ajZydWIwTkMrYkZSMjl4QXhIak9WRjhtQnYzUDVzbDBwMlNVRDFDeUU1K3VM?=
 =?utf-8?B?YVZVR0Q0bGVCeFYwOXJLV0R0cDN5WEZXVkVUb1Vkd1BOSTBzS044N0FWS3pW?=
 =?utf-8?B?WnVyOVg5QVhyZWs4cmI1anh2OStwVXFMaDVHZzVGbWhQOUYvejFTZC93RXBs?=
 =?utf-8?B?aHgwZDdqS2I1K24yWktvZXlHV3NoWUIveUY0WE42bnRGanhMcTdaU2lzaWFv?=
 =?utf-8?B?NDg0YUFjMU9uMnFEenNlckZBaUppTzVaTG1kMFFwNmdNaGlCRThKVUltWnUr?=
 =?utf-8?B?TkxkTWpNTG1oWE1NV0l1c2hvNmlNRHNUOURTbGhEVWRCcEUxOVgxME8xNlNW?=
 =?utf-8?B?TSticTZHekNVVFZKSVdrenVEMEdlUjNjMWkrUFUxMEhqRVdXWVAzRDREZVdq?=
 =?utf-8?B?NWpFNklzQmJDVjUrVkl3VFIrMmVwbHkxdFMwZWwrR1JQeVNRcEp2aWF0QUcx?=
 =?utf-8?B?NnN5bWhVRFNIWW51LzdULzdHaXFqK1Z6aHdNMklyazdjcVRuNSttdXFubFgr?=
 =?utf-8?B?bTEweFhMbkkvMjdvMTU3N3pwSWIzVHdodFNXVmVJM3doN1VEaHl3SDBKNGkw?=
 =?utf-8?B?ZUQyYnJiTGo3VkM5aUVXNHZnbEYxM3Q5RXRNc2MwdzEyOFVSRW9HZWRyUmNL?=
 =?utf-8?B?UkZ3VjVucUJtay9uRERqZkc3eEFwY1BZSW1vNHJySTFMbytvNFJTTXZwNi92?=
 =?utf-8?B?enNuQjJidzc0cFRaVGM4eEpMckFjQkpRQnBXRmtiTkZRamYxWDJLWTZBcFJi?=
 =?utf-8?Q?kGEd2rFOfl+yHXNUXcBlwXXh/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99b4171-58ba-4a10-0e49-08db4cacc5ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:35:14.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NufDsvLtqJR/cCqnK6jFtVOqMu8u+9dWjfN++GSIA1iW48hyTOObSJ/Wk/GVfiTMhhqM79k1FxbQMwL6+djkRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On 01.05.2023 21:30, Jason Andryuk wrote:
> When using HWP, some of the returned data is not applicable.  In that
> case, we should just omit it to avoid confusing the user.  So switch to
> printing the base and turbo frequencies since those are relevant to HWP.
> Similarly, stop printing the CPU frequencies since those do not apply.

It vaguely feels like I have asked this before: Can you point me at a
place in the SDM where it is said that CPUID 0x16's "Maximum Frequency"
is the turbo frequency? Without such a reference I feel a little uneasy
with ...

> @@ -720,10 +721,15 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>          printf(" %d", p_cpufreq->affected_cpus[i]);
>      printf("\n");
>  
> -    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
> -           p_cpufreq->cpuinfo_max_freq,
> -           p_cpufreq->cpuinfo_min_freq,
> -           p_cpufreq->cpuinfo_cur_freq);
> +    if ( internal )
> +        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
> +               p_cpufreq->cpuinfo_min_freq,
> +               p_cpufreq->cpuinfo_max_freq);

... calling it "turbo" (and not "max") here.

Jan

> +    else
> +        printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
> +               p_cpufreq->cpuinfo_max_freq,
> +               p_cpufreq->cpuinfo_min_freq,
> +               p_cpufreq->cpuinfo_cur_freq);
>  
>      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>  


