Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041CD64EAE5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464477.722935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69El-00022t-GU; Fri, 16 Dec 2022 11:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464477.722935; Fri, 16 Dec 2022 11:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69El-0001zO-Cs; Fri, 16 Dec 2022 11:50:47 +0000
Received: by outflank-mailman (input) for mailman id 464477;
 Fri, 16 Dec 2022 11:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p69Ej-0001yn-Nd
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:50:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df28173b-7d37-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 12:50:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.13; Fri, 16 Dec
 2022 11:50:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 11:50:42 +0000
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
X-Inumbo-ID: df28173b-7d37-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px3EuzYhYPXT9PO1iBFHV+fdEPb8orpPAs4Dn1II2o3boLFyeF9u6nXl6S0MdxQpJMjTg22dfUOgKXAW5DAaZ52fsiaw2zGN2fliBKCNurY/J56kgQ4KG5F4c3ZKkHOhYZAVIoFzUdO81WKRlB6hmGOfdXZIIt/2P/GqHV/N5XexSBVT6lXlYbK2WaWRp6SMFYVkEJoeIT3Vh4ishYavpt19di8IJIOsAvhIPAjkJCBpQTZ4UrRMbhyZE8mh1tocTB0TprWAdkIhatgpwBXu8FHoB73idjQ1mgRdMfe8+X6aD5af5klZ86d9xixusBi1GdDCKn/Jy3RiQtE/cmg/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPSVG6XaNdUx3Ml9rDy7eAlngk6b6nxB1OMvfceZ7sk=;
 b=QHMwtYDrSH3Qz/Odg2nWANnWgf8JTrZT+cS45dW9hFkvY0uwY7q9G54A9W1LRZun3CB55noKTHz4/4t85y8/0kXGAFBxgOShSWCJ+9zEIKZnlXDJPdOeQ7PdxC2vNIza4GPwYBlxJsjC4HecqZ/qPt77BYZE4nH58SibUqAyq0QPTFXjyfP85/OvAW5efYS9C0LP5FK8r4TI2kr8rIQzzmAcPgmrFwTMrgQkodefl2ItHFV6IQvxlTLcrI+a/TXOI/8f72TWSU6TAJCUiM6v/r/gxfC9yjOKnsdMMgL3c5reEk0a+p8MuBexcqNIlFPB4LliO0GoNUT4AZ5modM50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPSVG6XaNdUx3Ml9rDy7eAlngk6b6nxB1OMvfceZ7sk=;
 b=i6x666IEjflOlbCbhotiqk5aQg9zVku80CK4E8/Zteth6nuTkW/X4ARpGEsFt2+nogOXbl+f9z8tn5x4UCUTL3IbZ9tKAqrVA225K8gjRmIPZ28O7VBUlsJ6uuLPJEw4b+i3OvhANAMwHw9hxX0bn4R0lbC6YbFtb25PhegKqOnuayiFBknOQljrV9XX72hM/oGHG33dKxUe5XCGJlg/GGiQ+5XgQYWS+iI/r9DtAp1lAL6LyCkwxtxgAJ5WwZo3E3Ba4XxFPseNIVraP0qX4szNhunBhPehaTj8bd8uRbnD+sSm1mrS+xp2mHzV8RjFo6W5G6GuFtPJNM+YlTMt3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba863886-91db-6e78-2b74-11e382d90b96@suse.com>
Date: Fri, 16 Dec 2022 12:50:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XTF-ARM] tests: Hypercall xen_version testing
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20221215152511.10194-1-michal.orzel@amd.com>
 <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
 <235eaf7f-5b59-e8de-8657-ce9d202365c1@amd.com>
 <219f3764-dade-7ef5-fbd7-fa9d2ae20d8c@suse.com>
 <22696c5b-f9cf-fddd-77aa-79f1c28f1cd9@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22696c5b-f9cf-fddd-77aa-79f1c28f1cd9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 986587d2-5a41-4f14-dc3f-08dadf5bc252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s3oixRiCiuQj8Bbqr5JGXx5UYeC1xxFGbq9CGUyc+wcu0EdYdOxoyDXyNY2D3KjF3Gfijo5MNU49msBb3OEvaZHZ7WkMMMndFqjckPVfhq8rdKwrMznwthaiJsH7fmRt5gK+wziQ5kVJTN4FnveVszymKJJFz02q32QRucRRJeGi8IzaCd3+lqare4KHZ334nReIMtyVdoRssgKpAfafVnH7VNiXORLtqHnqz+83makPxynZw9KIQTuwam4VXkExOY6JYAxyYvLGzoPeGErNLYCvSrtBonQUi0iXUWpYkCKPyf8ldVpbsO+NTLZ1iIjHcpAKtZIbLzRxpIQVPAeVD5gi7dY+fR3ksKOTSc/lT8lz2qTe8e1HuUsVguVrWo5kvD7AIWuf7i0St43g4cmmCLhICSpmpSsrti+pXOQpPV3VPuZBEpbtW3cMqVrExY+FFFIuGnk7fYnzJfVtGM8RQ7+qkwg34AXJNmEgb4PqHtd8JAZR7OvN6W6HcatPwH9rCETsrrrnhkYEF8KEvH0apimVjVc9cy6eYwyAZlKxnNNGwLMejuFOTMovVKruGHYKXy9AE3bSwY/NFb+TPmo3eCmhGKPmDBD3s+kdFHSZQpjfa597XVWg4pxCnKUbq0x9ZOrmNB/eaer0NgfOo8hfAP8F24iY9rgkCk1MUAzANHBzMFP+9N9OJIVHXSp3yUYjB9VeQ3+Gyg5ve0xT5DvACRaLXyLBQIkwB/eKleg3qlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(66946007)(4326008)(5660300002)(66556008)(8676002)(31686004)(41300700001)(8936002)(66476007)(6916009)(478600001)(36756003)(316002)(2906002)(6486002)(86362001)(2616005)(6506007)(6512007)(186003)(53546011)(26005)(83380400001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0l4L04wdXNEUWRWeEVmQWxzUjhuY1hDMmE1djV2TmdLOHJFajdNZXFSZUdR?=
 =?utf-8?B?YWhhMGZmQmU0QUsva2tOK0dEMHdoL0R3cEkydUlFN3BjTSsvaU9VaWNTMVR2?=
 =?utf-8?B?RVZFVmhkdzFHclhSa0d5ZUlYKzVPUHpPMjhTK1lwM29ZeTQ0ZFJIUEVkKzIr?=
 =?utf-8?B?VC9uR0gzZWFvanBISFluOE9qb1huR3NvNUVDaUEvRHhDT09SYW9MKzNIdFl1?=
 =?utf-8?B?elhIMGhpbGhSSURsS1g3U3NHMkhhQnpsVzNndmpZUlZrUnVadXUwTHM4TkRF?=
 =?utf-8?B?TTFmdnhmNkhSYi9LeUxVR1NjWU0zV0RzUmZvek5HSU9qdm5kcC9Pd2FKQ1Vr?=
 =?utf-8?B?YXhKVCtpdk1aVmRsMXhOZkQyVTZmUDJkdG1VU2hmb2cwblJpaEgwb1UrSnBY?=
 =?utf-8?B?N21yMUsvcWpkMC96eVZoV2lVcVFPUTRyYkJsN0dVbTFVMkNXTDQyVk10WUFK?=
 =?utf-8?B?Mlc2ZVR1a2cwZU9Dcjd5cGJ5eW5tZ3RnRWpZV1dCdzFqM09jMFNvajZxNExn?=
 =?utf-8?B?Q3JNK2pKUjJXVVRUZ1Jkb0ROTWYzVS91eVBrZFpmeXpYRWVLTitCTWJIKzg5?=
 =?utf-8?B?T0wxVXlwVW5IejNGWXlTK1FUYzNNbFUwVGlMQlVDZE1temkzbzEwSU9yL0sy?=
 =?utf-8?B?ZWFNenBESnB1eFBRcTUzdlNVVTlPWUlMd0dCTjRIakhRQWpFZ2hoNTZKYnpG?=
 =?utf-8?B?aC9mbnJaanV4NEZWTE5sTmJMMFEvVGpEczN1aTVET2MvTkQxdFh0TEhlWUhh?=
 =?utf-8?B?MXlNSk1ETzIxREE0c2owbWhGMjZpK216dm53ZHVPL0dpNm5uMnR5MjZPUk5S?=
 =?utf-8?B?dDhNUGhmWXFISnYyejRmVHVDMUhiY3lheXZUbE9jQnh4UmRNbEkvem9PRTN5?=
 =?utf-8?B?MERlRjFtT2J1KzRJQkt6Y0ZIZDVKNXdWMkJOekR3UmlpTjV2b2VTak9Ub25y?=
 =?utf-8?B?Tkg1c2daWDVvMHQrcFN0VnFuTTZQc2xsY2dxQWpwbndCV1BKbmNCU1YrU1R2?=
 =?utf-8?B?Ry9nYk9tTXM5Z1hoVGFqdFdPSWx6MXZLdzZCZWtlL2VNZXQ5cURKWTEwdFVT?=
 =?utf-8?B?R015NzJsanNJK2ROV0xzR0FNeHRPVzJJMDV0d1JCL1BXWlgrd2krNjkvZjBG?=
 =?utf-8?B?dDlSYzhOM1JLaHQxdVJDWUJrUVgrT2srT0lkaEVWb1BGT1BoTXJQMmpmY0NO?=
 =?utf-8?B?MjEwMi96L2xWZHIrdnJkZDRpY1NhaXVWNS95b0V6Z2Q3VXRGYVVjM0NOVHF1?=
 =?utf-8?B?cTgxdzdEWFFuSWFEc0RHRkZSR1R1RWhySXRVc2J4VVhwUklaenU2WXJIQVl6?=
 =?utf-8?B?UTZ5ZW8vWitpc2NQeU40bHp3UFd5Z2VRSDNYWmZqRUFuQm85Z3RmUmNTRHpt?=
 =?utf-8?B?bExNM1BPT2kvMXhZTm11bEhZdHpLM1U1MlVONWtuNU5MR2pKZnd6LzJ0enpz?=
 =?utf-8?B?cFdHNmVpMFdUMXVpY3JTVXRwUmxxZTViTnc0WnYxODdSTGl0WWNDM3czVmJx?=
 =?utf-8?B?dmZwNDZsWXI3KzhhVzRyaU0zN3JtUVFlS2tVR0E1Q3NRZ2lIaURRclFKNlJm?=
 =?utf-8?B?RUlXenhQVWplZENRVzluQXV1M2xaNmFkWDdPTzIxdjBaWkcxbHo5VXBXOHcv?=
 =?utf-8?B?dUk5bGcxS1VCY2JsWEExZFQ5dWNqMmNxNHk4VHVCcXN4dVQvRTdyZ0pFOTk1?=
 =?utf-8?B?TjZ6YXZObG1TTGNaSmVPQmlNdzI2blFRaW40TkgwcURHQnVJZ2dWQWxBTndz?=
 =?utf-8?B?ODdkcCtHVU4vQW1TbGtqVWhaNjFxUTlha0lvdEdtYkZkQytSZVFJcm9MVmI5?=
 =?utf-8?B?N2pKNzVXdjljbGtsVFpOM1RHeTFSdmpUNkxLZ2NkMHZia2wzSlhVRnllMTR2?=
 =?utf-8?B?emt4VmZkTy9LbzVvcVB6TlpBMXNJNE9aMFFvNjhOMlpNblhKejlCQjV4MG1O?=
 =?utf-8?B?RGZiRlF3all5eU1KeldQS3VSZ0k3UjgxY29wL0tIekVJREh5eHFva0RRLy9l?=
 =?utf-8?B?QWhJODVxUEVnT0RBcnAxSXNxZFhsZ1NQdytBWXlWaElGdjBoeHlIa3pESWtM?=
 =?utf-8?B?OTl3eHM4ai95RDV4MGNNK0tKbXNlR3NQcTh4V0ZBVkF4OHYwSCtwRmw0N0hy?=
 =?utf-8?Q?jcQNDYsMEjipkz8fXk14WndBu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986587d2-5a41-4f14-dc3f-08dadf5bc252
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 11:50:42.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/NL6KLeccjURefkkfwioX8uMJ8Fy+usT0xCgjueSXeoJxlvznV0Qo6IC9M7uMKnneXLsxWGMwOIb3LlYtLo6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On 16.12.2022 11:53, Michal Orzel wrote:
> 
> 
> On 16/12/2022 11:21, Jan Beulich wrote:
>>
>>
>> On 16.12.2022 10:30, Michal Orzel wrote:
>>> On 15/12/2022 16:48, Jan Beulich wrote:
>>>> On 15.12.2022 16:25, Michal Orzel wrote:
>>>>> --- /dev/null
>>>>> +++ b/tests/hyp-xen-version/main.c
>>>>> @@ -0,0 +1,105 @@
>>>>> +/**
>>>>> + * @file tests/hyp-xen-version/main.c
>>>>> + * @ref test-hyp-xen-version
>>>>> + *
>>>>> + * @page test-hyp-xen-version Hypercall xen_version
>>>>> + *
>>>>> + * Functional testing of xen_version hypercall.
>>>>> + *
>>>>> + * @see tests/hyp-xen-version/main.c
>>>>> + */
>>>>> +#include <xtf.h>
>>>>> +
>>>>> +const char test_title[] = "Hypercall xen_version testing";
>>>>> +
>>>>> +#define INVALID_CMD -1
>>>>> +
>>>>> +void test_main(void)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    printk("Checking XENVER_version:\n");
>>>>> +    {
>>>>> +        /*
>>>>> +        * Version is returned directly in format: ((major << 16) | minor),
>>>>> +        * so no need to check the return value for an error.
>>>>> +        */
>>>>> +        ret = hypercall_xen_version(XENVER_version, NULL);
>>>>> +        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
>>>>> +    }
>>>>> +
>>>>> +    printk("Checking XENVER_extraversion:\n");
>>>>> +    {
>>>>> +        xen_extraversion_t xen_ev;
>>>>> +        memset(&xen_ev, 0, sizeof(xen_ev));
>>>>> +
>>>>> +        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
>>>>> +        if ( ret < 0 )
>>>>> +            return xtf_error("Error %d\n", ret);
>>>>
>>>> This, ...
>>>>
>>>>> +        printk(" extraversion: %s\n", xen_ev);
>>>>> +    }
>>>>> +
>>>>> +    printk("Checking XENVER_compile_info:\n");
>>>>> +    {
>>>>> +        xen_compile_info_t xen_ci;
>>>>> +        memset(&xen_ci, 0, sizeof(xen_ci));
>>>>> +
>>>>> +        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
>>>>> +        if ( ret < 0 )
>>>>> +            return xtf_error("Error %d\n", ret);
>>>>
>>>> ... this, and ...
>>>>
>>>>> +        printk(" compiler:       %s\n", xen_ci.compiler);
>>>>> +        printk(" compile_by:     %s\n", xen_ci.compile_by);
>>>>> +        printk(" compile_domain: %s\n", xen_ci.compile_domain);
>>>>> +        printk(" compile_date:   %s\n", xen_ci.compile_date);
>>>>> +    }
>>>>> +
>>>>> +    printk("Checking XENVER_changeset:\n");
>>>>> +    {
>>>>> +        xen_changeset_info_t xen_cs;
>>>>> +        memset(&xen_cs, 0, sizeof(xen_cs));
>>>>> +
>>>>> +        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
>>>>> +        if ( ret < 0 )
>>>>> +            return xtf_error("Error %d\n", ret);
>>>>
>>>> ... this can fail because of XSM denying access. (Others can of course
>>>> also fail for this reason, but here possible failure is kind of
>>>> "intended" - see the dummy xsm_xen_version() handling.) Therefore I
>>>> would like to suggest that you also special case getting back -EPERM,
>>>> resulting in e.g. just a warning instead of an error.
>>> When writing a test I did make sure to check xsm_xen_version *for the operations that I covered*
>>> and my understanding is as follows:
>>> For XENVER_version and XENVER_get_features, it returns 0 so deny is false.
>>> For other commands I test, xsm_default_action is called with XSM_HOOK which returns 0 as well.
>>> So AFAICT nothing can result in setting deny to true.
>>> But even in case of setting deny to true, it would just result in copying "<denied>" into
>>> the respective buffer. It would not alter the hypercall return value.
>>
>> For dummy itself all is fine; arrangements there suggest to me though
>> that the intention was that an actual Flask policy may be written such
>> that some of these might actually be refused. My recollection actually
>> is that when the distinction for the sub-ops was introduced, quite a
>> bit of discussion happened as to what may or may not be (optionally
>> or uniformly) be rejected.
> Ok but in any case, in the current xen_version implementation, it will just
> result in storing "<denied>". No -EPERM will be returned. So do you think it
> would make sense to add handling for it in the test even though it cannot be
> triggered?

Oh, I see my mistake now. Apologies, I take back my request.

Jan

