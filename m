Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C8C64E949
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 11:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464338.722702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67q7-0007Cg-PP; Fri, 16 Dec 2022 10:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464338.722702; Fri, 16 Dec 2022 10:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67q7-0007A3-Lu; Fri, 16 Dec 2022 10:21:15 +0000
Received: by outflank-mailman (input) for mailman id 464338;
 Fri, 16 Dec 2022 10:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p67q6-00079x-CL
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 10:21:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2088.outbound.protection.outlook.com [40.107.6.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d90a97e-7d2b-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 11:21:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 16 Dec
 2022 10:21:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 10:21:10 +0000
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
X-Inumbo-ID: 5d90a97e-7d2b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQK9t22nvlP8Z1fVvNKDIk+qQWylQ74m+6sV2DIhG3vco3Ax0hvMeXCInkvnXA0qgSEgZSAsxQxv2bzGP7YxffkfrGOek6IC+UNGGnl2PKw1IGZI80dhCc1/J5HnzM1q7u33UPkIvQA9ya0TygNo1khRlEOR7ObAQP1D4Knpm0vLOTqpAQquToZSTxBWcvx/5Yai9LZ63TFFbWiaZ0rP2dMXWCm+uqXgB5VGJb/6ELJnzy86ltefzjWZaHayfDZruqvKPj9WjHD8qgQ+ZFqEOIOP1blqA5IBXB8wtPeK5lkC7HCqnHvHmFgsa8gBi6SlgeMQxdGXlqLtW1oq0xIFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6qj3w2fEttbT6VInOtdy87P0ChvNbKe1kxsfBFexKU=;
 b=PLhKIOJs69/SdqrjOPkms6Jf4SNHM0IpMgBcRUKrk7LZFs0+NmJhLaDqio61rg+1KAqXxzLFa52kXH+dt0pTukBwxzL7mc5RZBrpJ4lnURwsYkK6Moi7mGiyRixMRvlivZuYPPfVkbQzwppuBvOZCv3PlQ+hWFXERBH2JVuM4hI+R+lM4M1x3jKgAYE3BzzFdJNd9fvm6CalEGjtm/ZTWTYvvveiyx1aMdeKIuMqMc3nGaZgmjnAeSFsn5LFAD9132figqK7UYIGogOhOhdTrpiGQtXJSGYq9DJqxuF9EYldp6j0affDXEbhYrDmM3/KlOzCY8TPSZ7boL67lGNRTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6qj3w2fEttbT6VInOtdy87P0ChvNbKe1kxsfBFexKU=;
 b=irDczScUEcH5pNSrVFgP8TqB7IwMekQhVmthD0cvbcQdCQfloVVo/gfE0JdwjkrxyhQMeoeQviPbTEvDG19BS0mJNACFpJHv0teKamtWY/XLVPtLQCkKTwxCqzyY0uu6lq/nJDopeuFbUmMqUpo6jRchLLhGgi46Pa8Ynyxet6ug8Kl9XA0EJK7cMgE8exqAyf04zi8TygGeDqMzNGHXv+h7wQaTdrv/ZMmNfM7BDUYxMajlSMi0qyKq9PBja3l8MpUFTiUzG0vfdkDguM3gPJVU2s+5XjDhpEUrAXAxLZYI14x849uwSiZPyg0be7uOXW9eIRX9TfHw40YRZiHiww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <219f3764-dade-7ef5-fbd7-fa9d2ae20d8c@suse.com>
Date: Fri, 16 Dec 2022 11:21:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XTF-ARM] tests: Hypercall xen_version testing
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20221215152511.10194-1-michal.orzel@amd.com>
 <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
 <235eaf7f-5b59-e8de-8657-ce9d202365c1@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <235eaf7f-5b59-e8de-8657-ce9d202365c1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ac6a19-c34f-4c2c-3b5d-08dadf4f407b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bvac51Dq/E3KZ+MobT24PSUjP86hcxGIFCDdZZzcXLBtG34Wn/jBC8+X5YQ8GowV0O/zYIyzqdNs0RX86mqXyPlhQsn9ygJh/XgDd8N/4TOhbnD0HuEz3NhnPjNGT7eMkyubj3508B1S9L1WyYass0lWHVawCuMISwA4KlAbd+v1g0dKTLDkF/QCgoEgBkJZs883awb2M4HKladkNOlXGwl8cZth9CJ16CtDBuLN3jR87ySnxAD+tYLvYtjUQk6CHzVJmwM+4mdk0K1+0PyMQ0mbAWcss4BhV30HrvqDoDAc1/IVuppKU5ACNS42UjuW9lY7sWlQxSDL9OV4yoYbNaT8T9somGMp2G1/2XItS9L7UdKQkSlSjFn3qM3iJWUXCF4d+eaMvK01kNLXeeK+gkdzAwrIRg100IY+N9Xuj28NqR3jHL8xqKpkWEI++IoMxSYLPTBNov1y/URxQoxmWbLtso62lP2H+VvB23LHtcFihAvurwbDq2KrhNd/s4JHggz+cK9K1bwxdEHuUiWWRQzyx3rn9i3rv4JkU17ZQbJki4h59k5yPNF6T4HRdNHTNIyzM8l+zIdQ+kjVg0tPIzAVuRWhBJB0EpW5nojwRwsIfLqrMfoRAtiD5iQ0CdJAiXP0Bi9nD3m5ZeKq9YQQKjh13KrtkoYNM2F1/7wGWYtsiqw6W8sCdudST5bX2NiPcYdKbDunR4cUXROv+BqasG8wxQ755j2BCCzZBCeXE+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199015)(31686004)(26005)(6506007)(66946007)(8936002)(66556008)(53546011)(36756003)(31696002)(86362001)(6512007)(38100700002)(41300700001)(4326008)(6916009)(83380400001)(8676002)(316002)(5660300002)(6486002)(478600001)(66476007)(2906002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUMzbWUyVkFiNDd0Vi91NmxEQXJSQmVuMUdYNXN3MDdheU42QzBGWGNBTmFi?=
 =?utf-8?B?WXBrdkdjTFlIWkV5cHFWMFkyU3FVVTlpV3l2MVlvNGU5NDRyYzlKbkhiY251?=
 =?utf-8?B?MlpzRTE4T0NFc21CU05TcGhSbHNwR2E1dHJhempTRnRvaUM2QVdMYy9laElq?=
 =?utf-8?B?a3I1QUdEUjhLeCtQUjV2WGpPRlNtZmVtVGcyQ0JmYjRIeUlKckN6RTNaUzhR?=
 =?utf-8?B?Uy9YOXdidUQ1T2N5d056ZzQ3elhybUVYVXNTc1Y2dUhKd2NqWktmTHhHeXhX?=
 =?utf-8?B?RVJuVFZVNk0ydEpTV1VlN3dWQVdnV1JiTnFneGk4Q0VEeDJtVTdoNW5tZmE5?=
 =?utf-8?B?OWRreXM2cjU5bkZrVExIbGpFVXBmQXIxVlNJb09aV2VndWVVcE1hOUN3VlZo?=
 =?utf-8?B?U3J1clp3RGtKSEZ6akQvbjdTVzZJQTRBWUpKeUhaNmdFaEY0ZVFWVVNJdnVq?=
 =?utf-8?B?eTN0SmJJRkdZZmFLUzc5Ykdnc0NaZFlCSy9naW8xZW1rNkxqYXMrVUdhTDJL?=
 =?utf-8?B?bHNpelhUMFRYaEpjTHc5dVVPSTB1djN3NU5OYlVoenA2RnNaUmI3TDNGSVJk?=
 =?utf-8?B?c3hyYkFWUG0zZHFDaWh0ZnNBVStMNjRBMGloeXlrc0NISFJLRDlWV0F4WS9O?=
 =?utf-8?B?ZEtLTDFXYSs3UitFaERVZXEyenV2QXM2cUtTZWJKTmJwR3duVmtBby9mRUc1?=
 =?utf-8?B?bkJFOXJMZ0J2UzczVVlMdlBIMjRydHVDTnkrbHZ6MlE0dE13RDB6Ky9RL3Z1?=
 =?utf-8?B?OVRuMlIyUDBNNVpZblBEUEY0UHJ2L3VqY251SmxZdVpiQzNPekdKVDJpaFQz?=
 =?utf-8?B?azRROW1kdFoyNnVZbmdpUWFDWThYZjFKdVhtc0xXTDFPaTVrNkNIdlVYNXdI?=
 =?utf-8?B?dlF3bGpLSGN1cXVJTVZXSThjSHJvT3Jab1RPUVA4Umt4WHd0T3J1aW5NWTFw?=
 =?utf-8?B?Rm4zZ2tNRmdkN0tFYUJnL3QzNnl5dzZIcjZFaHhwSUFiZkI3RXVvWGZodWVo?=
 =?utf-8?B?VGYwYkI3T2tPUTFpUkVwTlR2Wmx0Z3o4L0p4bHJOUjV0VExBOG90WDMxWHUx?=
 =?utf-8?B?cFAzMlJ3UEdjRWh6L0QvdDhkcFpQV0VUdm1LUXBXbnQxYmZkTjRMU3dyNjYr?=
 =?utf-8?B?YzFlU3JrTDFXa0o5V0wzRUkyYnBRUEFMc0dENitMQ0dqTzM4SEVxZy9QR3cx?=
 =?utf-8?B?RVNVMEhNdnFGZmg1UitsQlZsTnluMVNtRzVuK2s1cUJJdWZxcUlIRU9HZ3hu?=
 =?utf-8?B?bjNxV2ppalJ4T0RuNmFSOUdnS09haFdQQ1hGSktwQ1NtZTM0enBwS2xNNkQ0?=
 =?utf-8?B?dHU0SEpmSG9mdGdHb0pKRURqZCtvN1BHaFVWcEY3bXFjU0ZMbExhclplVUlO?=
 =?utf-8?B?NDZRK0YxZUpHUEQ2QktDaXJYenRRYml4K2g1TVdzOHkxa0tadDJhTEdRWndp?=
 =?utf-8?B?SHdRbjhtSHVJMDJNMkxmaXV5SjBPVDBnWnlrQmk4RmpoNHMwbGNIcTc1Q0oy?=
 =?utf-8?B?MEh0VGdzdDVKTU5HZGZLakxzMTlvS090YnVTK1ZJTTlRQjhjUjdzak9yOS9s?=
 =?utf-8?B?UkRZWlRXOWFycWdPNno0ZjRxSE1BRnVCMzM0R01iRlIwcVZBZlhrc2hyUzVi?=
 =?utf-8?B?OEZjR2poYUQyaENuSVMraVFNbVNXdUZLVGk5M3dzaUk3am5xY0d6WTI1dTVB?=
 =?utf-8?B?QURMRlAxUUF1YzRsMXArNTFWMk00WWtlNE5uZjF2QTYxRUdtb3pwd0ZQa3BI?=
 =?utf-8?B?YVducnBrS3pwSzFKY0dZNGsyN0ZMdkJUSmgvQkU2TUFpbHFwdW1LOTFhcVQ0?=
 =?utf-8?B?bEkwbXpSQkxnenZFOFlpem9vaWxlbVRvZTcycUJxV2xRR0hjQjVVOFZRY21h?=
 =?utf-8?B?S282YnBvK09RWjcyY3ZYUFh5cEs4UTBCUW1ZOXd2UHdTemdxZ0ZtU2RJUFlp?=
 =?utf-8?B?MWtkbDYzK1J1STB0bGxFdkYwc1JVYS9Rakt1Wmp0OGxna24vdjJEcHhDQTdF?=
 =?utf-8?B?TXNKdmIvYXhKSFo5alVWWGNvK1pNaHEzcE5FcDhZZ2x4YVZ0RElqczlIYjhU?=
 =?utf-8?B?SWlrYnBlT3dURHNyNkFFOC85TWJqVWxKY0tMRnVhOGhPT1NLL1kxM2UyYXJp?=
 =?utf-8?Q?HwJYaE+sPTbuSlxGcBXVRe6em?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ac6a19-c34f-4c2c-3b5d-08dadf4f407b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 10:21:10.6074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weiZNdhP2e0z+d71Jwp9kwEdAzpRSvXkhoGRRKBgPifx9EMgQK4poYlnl6a8Z9KrrKx8x2A9SyysbiuSvne5EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8644

On 16.12.2022 10:30, Michal Orzel wrote:
> On 15/12/2022 16:48, Jan Beulich wrote:
>> On 15.12.2022 16:25, Michal Orzel wrote:
>>> --- /dev/null
>>> +++ b/tests/hyp-xen-version/main.c
>>> @@ -0,0 +1,105 @@
>>> +/**
>>> + * @file tests/hyp-xen-version/main.c
>>> + * @ref test-hyp-xen-version
>>> + *
>>> + * @page test-hyp-xen-version Hypercall xen_version
>>> + *
>>> + * Functional testing of xen_version hypercall.
>>> + *
>>> + * @see tests/hyp-xen-version/main.c
>>> + */
>>> +#include <xtf.h>
>>> +
>>> +const char test_title[] = "Hypercall xen_version testing";
>>> +
>>> +#define INVALID_CMD -1
>>> +
>>> +void test_main(void)
>>> +{
>>> +    int ret;
>>> +
>>> +    printk("Checking XENVER_version:\n");
>>> +    {
>>> +        /*
>>> +        * Version is returned directly in format: ((major << 16) | minor),
>>> +        * so no need to check the return value for an error.
>>> +        */
>>> +        ret = hypercall_xen_version(XENVER_version, NULL);
>>> +        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
>>> +    }
>>> +
>>> +    printk("Checking XENVER_extraversion:\n");
>>> +    {
>>> +        xen_extraversion_t xen_ev;
>>> +        memset(&xen_ev, 0, sizeof(xen_ev));
>>> +
>>> +        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
>>> +        if ( ret < 0 )
>>> +            return xtf_error("Error %d\n", ret);
>>
>> This, ...
>>
>>> +        printk(" extraversion: %s\n", xen_ev);
>>> +    }
>>> +
>>> +    printk("Checking XENVER_compile_info:\n");
>>> +    {
>>> +        xen_compile_info_t xen_ci;
>>> +        memset(&xen_ci, 0, sizeof(xen_ci));
>>> +
>>> +        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
>>> +        if ( ret < 0 )
>>> +            return xtf_error("Error %d\n", ret);
>>
>> ... this, and ...
>>
>>> +        printk(" compiler:       %s\n", xen_ci.compiler);
>>> +        printk(" compile_by:     %s\n", xen_ci.compile_by);
>>> +        printk(" compile_domain: %s\n", xen_ci.compile_domain);
>>> +        printk(" compile_date:   %s\n", xen_ci.compile_date);
>>> +    }
>>> +
>>> +    printk("Checking XENVER_changeset:\n");
>>> +    {
>>> +        xen_changeset_info_t xen_cs;
>>> +        memset(&xen_cs, 0, sizeof(xen_cs));
>>> +
>>> +        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
>>> +        if ( ret < 0 )
>>> +            return xtf_error("Error %d\n", ret);
>>
>> ... this can fail because of XSM denying access. (Others can of course
>> also fail for this reason, but here possible failure is kind of
>> "intended" - see the dummy xsm_xen_version() handling.) Therefore I
>> would like to suggest that you also special case getting back -EPERM,
>> resulting in e.g. just a warning instead of an error.
> When writing a test I did make sure to check xsm_xen_version *for the operations that I covered*
> and my understanding is as follows:
> For XENVER_version and XENVER_get_features, it returns 0 so deny is false.
> For other commands I test, xsm_default_action is called with XSM_HOOK which returns 0 as well.
> So AFAICT nothing can result in setting deny to true.
> But even in case of setting deny to true, it would just result in copying "<denied>" into
> the respective buffer. It would not alter the hypercall return value.

For dummy itself all is fine; arrangements there suggest to me though
that the intention was that an actual Flask policy may be written such
that some of these might actually be refused. My recollection actually
is that when the distinction for the sub-ops was introduced, quite a
bit of discussion happened as to what may or may not be (optionally
or uniformly) be rejected.

Jan

