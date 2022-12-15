Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691364DE0E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463556.721766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qTn-0000E2-GG; Thu, 15 Dec 2022 15:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463556.721766; Thu, 15 Dec 2022 15:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qTn-0000CB-D0; Thu, 15 Dec 2022 15:49:03 +0000
Received: by outflank-mailman (input) for mailman id 463556;
 Thu, 15 Dec 2022 15:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5qTm-0000C5-Co
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 15:49:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe632952-7c8f-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 16:49:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6820.eurprd04.prod.outlook.com (2603:10a6:208:188::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 15:48:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 15:48:59 +0000
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
X-Inumbo-ID: fe632952-7c8f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LG3PK6kZfii/MBi20hIx8sDbTB+WJLQnVQsDKnXhQuuR+5MfVqAyJnC+ZRJUxZ7QIoIbXmpGreUY9yZXYHQwqk2o1Vj5BxntHe7cUttIa10WwlF/4HOXj558EPs84fTMFf/AqPLvujmmaLTh48i0uybvpc6ulXj+oV2YFSPU9Rob8M9Li0XuzrX+JIxnrFFSGM1/GyriYdMVRBNq7x7EKGBHAHIBq71ZLQmM/qTXY69zcwFp4SnKmbrwxlbwZ1whmRoUxt/QamD8lR05ohUeCzE9Od8YfYk4K4SA1SSMoI7zA9HdPoa/g7bWA/jsBsRpkqcJ6g1O/NwKyBaXsyFf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oceKss5hYKN711vmcuhTmnFPfZW+sexdiFHWqOCkPjA=;
 b=EDTh96nFl2ckikhnodLh7suscdu54kx6YkCDYJEJM4EDnqYbI4DNWW5yLTBWAKRYiQ0hm4823iFdiAlZ6csESuK7dGH7hIWLW2dX/xvTZjOaV7q7IZd5iEg06EyC2MF3KFvrxrKMxQtBrAVgJI/GKxRKYRLDfRGQQzW6xX7BuXnEUw9Fm/vAuuEoa6ZGOiYzw9ehDB5oZ7y9dlXplpGduOwm+0NsiQ9jyAwDRxnrquptWeAjNigRtarwrPfrf/F7baRneT1vHdJaLEkeHBR+cfmtn0o1+sHBbtS3eA9hmro63YaWSNzjZPZbc7xNs6ZWgHji/VfccJAC7iS2vuRsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oceKss5hYKN711vmcuhTmnFPfZW+sexdiFHWqOCkPjA=;
 b=geBvcXzSgTMgFvGIoDmQzusODSuLhbDqk6IcD7Pzt8NYbQaV+vqwd7njgsdGRVAO7fjZT+OLB49MuoglLW8gYo80Dvsj1ZffzjutTaMfK6QtSPGwerhFKOYtNzQLyuKR3vQFnAWeERbN9YgJXy+yrKivKXcvr7NqRG7d4L/eFFCq22HJ56ciqhl/yhocfuvlrDGQWkX8ztJ9U421gsI3HQYiCST4g1CY6tc6Us0iKjXeiN2W3UAYV3o4dO0yV8GKj772/Q52DI7l8vx4e8fyqFFJ7xvmk/+capPGr948RhIne0y4Xu/2dHCBJTL+O1aIxImfeYEC3+JfdpY8J7gGig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
Date: Thu, 15 Dec 2022 16:48:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XTF-ARM] tests: Hypercall xen_version testing
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20221215152511.10194-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221215152511.10194-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe9d852-5cc2-4c07-2991-08dadeb3e197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0B28NhFZEiRsqHAFWUyE9bFDsCgMAzRo3OJfaCsZyj5Am2ir+aL7wTOL7tIP2jT8b0SrA4fIsYq2DrhQ21IfdlU6XE07uOKisB+3yTIxExheCbRjj7Rl1DIO5Gjzl4xSpeEzv9NjuyE/VxYXQzF265NpqR4s42CI3OMSeTbF611R2IKrTXlOxkmq4JQlw8BWW0FNnkt8gI9vqPRSsbUpJ8+JnfedBdv7TxFK726F/ohPsPMuZ+DrrMWe+FJYIHFRN4iBtF9sPC9gfXIn6/2yz+AKmlF3/cBCv6bAwx7VbZJ4hQEtgTULcLkOglrkK+8EwvZTq4o2eWt9EooeomC3lf+2c3F0edRAQIqct+aGNHxOSHsk7cLnk90OJ6o0At8F9gXYiq2J7CfLg0gyngvk9i/DBtkDjOSQWVM3aVpIwgjncz3K/T5RMc7JlIFhkGTMCdcTp3cpgTMg8MmiR1qeu52cNowHhSqbCd9TUJ/qbiEF26YTZfGm+yldrvW87yUsBfV4Y9l8Tn47iCobSZLEpe96pk3DkyywEo8D2kd/fxDkEXRVCaUaBipUmdNvVDNe+O/C0TdhG5yFFARLbF77Ub6jW4MB2FoPGO9sR+diUfMYvHbtZsKa8QzxSb3PQxbdf6DVB8OMLTLN/tnKiLldmBTJkibzfBLnQLVPElCRZMOAtxVUEfSRjkbLrKDXy6Af5+5KFOxDt/lsnuRS5BQqfquVRtGst9ItLP8c1rLsLCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(2616005)(31686004)(83380400001)(86362001)(31696002)(478600001)(316002)(6916009)(36756003)(38100700002)(53546011)(6506007)(6512007)(26005)(186003)(2906002)(6486002)(66946007)(4326008)(8936002)(41300700001)(5660300002)(8676002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFpNVlowaVRUWWRzUXhCOHJycytxTzAwU1RtQnlKcTFEbmdFcVA0T3ltbkFM?=
 =?utf-8?B?RFo5TEY0bE9EK1hhSjlyc05nV3NuSGdCcStGbFc0dHY2L1BCVHE1NUZhYUQ2?=
 =?utf-8?B?K1IycU1RdUprcHJWUzhhN1FOanBEeEJZL0RPSTF4Q1h2NXFUdWRRdDlkU1lI?=
 =?utf-8?B?NHo2RzgwdVJGQ2pQU29YbDI4dHJSS1JFQmw5Z3cyeFJ5WmJTTTA5TFZCaWRK?=
 =?utf-8?B?end4MGF0akNqcmtXbzNmK1ZHVUllR1BFQVk4QkJXQnJDaUc1OWNDWFJGNS96?=
 =?utf-8?B?YWFMYTByZmhOZHFkSzJUSkduQnUvVS9Qc0ZEVUkxRFcxQ2hsV3lqVEhSTEM2?=
 =?utf-8?B?NzQwYWdvMVFWeHNCdFgxNStnTG5hYURxOElXTGZsUC92TC8yYThGUnV0VWlr?=
 =?utf-8?B?VnhOV21Bc0w2QndYdXZsYWJIV1RHRUdNbEg1dkdObnQyRnFwWkQ2QkFMVzNt?=
 =?utf-8?B?KzZ0Q0hnSElnU081VStpaVppd3pvOG91bGNyTnJCOEZpWFo4aXdnV0xQeDdH?=
 =?utf-8?B?VVF3dG14c3JZSUtkT0pFU1dXMFZ3TXBwMUJac3p4Sm5zSjR3eHdmN2JwL0Va?=
 =?utf-8?B?cjJWY21BTlo4NGFUVnFHS29zUWtlZDJDdU1CYmZ1VkdSMmNxRlNkRHhpTUty?=
 =?utf-8?B?Ty9GRys4T3ExWjIyeGE3OUs4VmVybmJqV0hxdEhQOTNOSEFIYVFYQ0VYSnhi?=
 =?utf-8?B?aEJTSGN3MUJDbWgxcGJBYjJTWFV1a2ZIMFlvdzJ6WVpJYTRDbWtMclVwMHRQ?=
 =?utf-8?B?VkJINXkvMWVXc3RxVmtSNzZ0Q25zcllEZVhSQ2hQOW1Paks4OENjTDZiK1dv?=
 =?utf-8?B?aS8wbUlXd3gzRnY2TUZ6bHd1ZnlERHJQWGpTZHdLb0hPL3Z5N1BUaFN6a1Ru?=
 =?utf-8?B?WUdoSldEdVludHdBN2VidDZ3d1JnVllxcnU0bmxVRFkwSnUwLzF2YzJFQ011?=
 =?utf-8?B?WGE1REljaVFMbUQzSC9PaDNGakQwZEQyWnY3bjVyelF1cC9rVHd6NHlRWk1j?=
 =?utf-8?B?UUVXemdlTjhXYXBuZjdEQlAwZ2J0enFEeExHWG4vUDlLbGhUMjdMSStJYTJI?=
 =?utf-8?B?STNLbmVobm04aU1XSXlaZ2w4QzVYc1RRTEJaMEUzTm9KanVFVnlRRTRvZjNZ?=
 =?utf-8?B?dW9PL2N2bVhzemd4ZFZYSjN5OGNVVUc5MjdNREJDUWdxM09vUnNNSVk2Slpz?=
 =?utf-8?B?SmM4R0VUTmcySjVPZjVqbmNNaXZNWExITC9SYi9BSnBKQmY4elIvZWxLTGEw?=
 =?utf-8?B?b1R0alF2dUJHT2dNdC9Ic0RYUllyTXM2Sm83dTJHd09lSzJaZmJPQkpDWVVW?=
 =?utf-8?B?SmhEQ0hZSjBZZk5iT1l5djFhd1pmMGdUa0Z4SkFlMjRXaEo3NjQzTHF3c0hO?=
 =?utf-8?B?RUJWQVNJVWUzOExiN2hQQ3NYZ3VyWVpVd1hyVUVrcVR1NlJPbUhvQ0srdFUr?=
 =?utf-8?B?K1R4dndoalhTTlQ3bTNYT1ZkZXZTNTV1Uk91VmV6SFFGMkErK01UZ08zOGFy?=
 =?utf-8?B?aFdQdTcrL2pNL3RxanFDT1JZVk4rT09LUVRnNkF5SGxhTU5scWpTZ0V6Q2lY?=
 =?utf-8?B?eHB2Qm9MUHpQVVFaY2RteXpHT3h3Q3hISlg1UHZxOG1BYXRwSXlyQXhBN1oz?=
 =?utf-8?B?TjVpdEUxeE05WUhrYlJyS0lIdHlIZ3Fwa2xRY0pIaHB0Ni9BaEU2aEcyR2pp?=
 =?utf-8?B?VVl6MXRIVGRHZ0hIc2x3am5lSXQ5WHA0bko0RkdIcVF2dW93TWZIeFgwL0g0?=
 =?utf-8?B?a1dUUDNZWjkwOFZxMGtNendnbEN1ZnhxS2tPQW1zSnRsUXg2SE9KTU1zM2Jy?=
 =?utf-8?B?aFBNSml6MHcwWU9OMUk4blhGRFA4VmZuQ2tudzJiUWJMYy9EdVhycFIxQ2ov?=
 =?utf-8?B?MjNqV2ZHSDR3dWtaRDhlTGJJMkJkdjA1Y1d5THRQbjFYYjhpWUJOSUpKMlVu?=
 =?utf-8?B?YngxODJiQW5DM2d5SDZKSWlMRVlWa1g2cFpxVFNIdE9EYmF3OCttSFhOa2FH?=
 =?utf-8?B?eWdIZ2tvUU9veTRqMHFSYmpqemlaS2dxRXZPYzNlYm1KZU4zTFhueDBNekVX?=
 =?utf-8?B?SmFSZTNNN29rcktQWE5kbE1wQUZnK2JOd0tWeWU5ZWlVVkpUbG1QREpINE5Y?=
 =?utf-8?Q?2dC9NhGEpNQhH+MqSbVrgh2KK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe9d852-5cc2-4c07-2991-08dadeb3e197
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:48:59.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhTr5xX0ZeBKqnmrmy+z/1osCVbP+kARz9IpWH2qaE1ga7HoRZh4T5w2buTP98n/hWYlTMkNeZUZzebLDjPzbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6820

On 15.12.2022 16:25, Michal Orzel wrote:
> Add a new test hyp-xen-version to perform functional testing of
> xen_version hypercall. Check the following commands (more can be added
> later on):
>  - XENVER_version,
>  - XENVER_extraversion,
>  - XENVER_compile_info,
>  - XENVER_changeset
>  - XENVER_get_features,
>  - passing invalid command.
> 
> For now, enable this test only for arm64.

What's wrong with exposing this uniformly?

> --- /dev/null
> +++ b/tests/hyp-xen-version/main.c
> @@ -0,0 +1,105 @@
> +/**
> + * @file tests/hyp-xen-version/main.c
> + * @ref test-hyp-xen-version
> + *
> + * @page test-hyp-xen-version Hypercall xen_version
> + *
> + * Functional testing of xen_version hypercall.
> + *
> + * @see tests/hyp-xen-version/main.c
> + */
> +#include <xtf.h>
> +
> +const char test_title[] = "Hypercall xen_version testing";
> +
> +#define INVALID_CMD -1
> +
> +void test_main(void)
> +{
> +    int ret;
> +
> +    printk("Checking XENVER_version:\n");
> +    {
> +        /*
> +        * Version is returned directly in format: ((major << 16) | minor),
> +        * so no need to check the return value for an error.
> +        */
> +        ret = hypercall_xen_version(XENVER_version, NULL);
> +        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
> +    }
> +
> +    printk("Checking XENVER_extraversion:\n");
> +    {
> +        xen_extraversion_t xen_ev;
> +        memset(&xen_ev, 0, sizeof(xen_ev));
> +
> +        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
> +        if ( ret < 0 )
> +            return xtf_error("Error %d\n", ret);

This, ...

> +        printk(" extraversion: %s\n", xen_ev);
> +    }
> +
> +    printk("Checking XENVER_compile_info:\n");
> +    {
> +        xen_compile_info_t xen_ci;
> +        memset(&xen_ci, 0, sizeof(xen_ci));
> +
> +        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
> +        if ( ret < 0 )
> +            return xtf_error("Error %d\n", ret);

... this, and ...

> +        printk(" compiler:       %s\n", xen_ci.compiler);
> +        printk(" compile_by:     %s\n", xen_ci.compile_by);
> +        printk(" compile_domain: %s\n", xen_ci.compile_domain);
> +        printk(" compile_date:   %s\n", xen_ci.compile_date);
> +    }
> +
> +    printk("Checking XENVER_changeset:\n");
> +    {
> +        xen_changeset_info_t xen_cs;
> +        memset(&xen_cs, 0, sizeof(xen_cs));
> +
> +        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
> +        if ( ret < 0 )
> +            return xtf_error("Error %d\n", ret);

... this can fail because of XSM denying access. (Others can of course
also fail for this reason, but here possible failure is kind of
"intended" - see the dummy xsm_xen_version() handling.) Therefore I
would like to suggest that you also special case getting back -EPERM,
resulting in e.g. just a warning instead of an error.

Jan

