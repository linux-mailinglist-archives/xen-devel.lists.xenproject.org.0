Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38CC6D44D5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517429.802726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJdF-0005TN-6t; Mon, 03 Apr 2023 12:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517429.802726; Mon, 03 Apr 2023 12:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJdF-0005RR-3S; Mon, 03 Apr 2023 12:49:57 +0000
Received: by outflank-mailman (input) for mailman id 517429;
 Mon, 03 Apr 2023 12:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UzYg=72=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pjJdE-0005RL-4H
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 12:49:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07444ab3-d21e-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 14:49:54 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:49:51 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 12:49:50 +0000
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
X-Inumbo-ID: 07444ab3-d21e-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoyMUN8lkB4TWJczrrnC+webiCjV0i3IcQSOHW8nq+ZhmaW/OP9RCfYYY+rbE6aJjm+SxcVlnrWZGdu6RuZ2gNC2B7HW8EQvS8ApRu1zTT1D7BzI84HZ6Hxl8Ka2r6yDSh4wIbdULKi2AVfUQbAT7dQi2EVmlfJ+k65XRwz99RFIF6jeK38UzcG0gMB3FuqOjbzDckBHkCEp7H8WQEGVpvTL7d1inTWG9kK5iOdLdz37KPE0BnfqBQP78z9NlQ3vv6PRr9rHJh7/lnGlchfCHfmSP6IWs7vEQ11sGLgzCjHk/9QXz6KbqeuuWnkIK9vX9wRnTFzJ0sD4EWQIhIUiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ulHxYGxKal1Hs+seRR7jT18eEPRUjrcMb+GtA8Atv4=;
 b=YCCk+OSU9li5Wc/nNrAYmffOEHb8tirpsk8gA8UnrCA/O20cRK/EtsuKVxHGXO3wVN/qDXBRxVJmSR9U/JUbnM4p5ckaansoE3Ws5wXdoTRh1+alkUooltZJ55OmKoKQjJ9wxs245H3YyYSLMhEV22MTNqrMA+E8BVLreyMu48xK+iVSCNcxvpyxwkGDiZ2FboPaMRPYd1+FAX7RQAmgPFKtXxG9VUbJNxJK5WeAUAQuZ8nX07GkaeNxCG8YbdrUKzvv18sF6FzWeQ4Dj6tFXazF8WJoel4M7cCKVyHyO21jCLHPVO4iqiXs+vfMCWJKjYSvNqwoe7cn+gN7bAw4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ulHxYGxKal1Hs+seRR7jT18eEPRUjrcMb+GtA8Atv4=;
 b=rJVZcICm9E8Y9WhzweWI1oAc1+dk7enAelJgJQW1M9KlSaFmNRYZyNRDkn7Tw2TSMRdnPkpR/qlOcDCMDPpio7FL7IG72a0epePfqDPEnPfoPw0La31GNzI5XT0z9xBdhmb5HaLCtZQJZ1eLPTuNR/NfbW5K7HR6Z5xR+EAOJyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <049cc80b-9fe3-1b01-67a6-112bd5e46443@amd.com>
Date: Mon, 3 Apr 2023 13:49:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN v4 06/11] xen/arm: smmu: Use writeq_relaxed_non_atomic() for
 writing to SMMU_CBn_TTBR0
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-7-ayan.kumar.halder@amd.com>
 <f1e638f2-28c8-fcee-bfb4-a7d459281420@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f1e638f2-28c8-fcee-bfb4-a7d459281420@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: c15ac467-100a-41e8-1b0b-08db3441ea04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnkDqbon/RKPst/EN01pi4SOxk2ooXqNrL/jeH1V0X/2bBRJcIiYIGM7Qm7KYQXHIYoLQKkjkmw+bVrXygVUDyOwsx1kAGj9sIl+ZL/nYV+H72p3jMkOIVsJ4nMhvL5s07SfaRb5WjQumGxbUZ12gHyHd2xOBy14Qs0iVKpzsOWhyStvHTfcXAhokVjB5gxUsuORrlDLfrVRxwmfi3vEAwieocbbnvgWX8RS+Vg25oZd0iiqxZtv8+f46EVJPq3t3vkyVvuIM2IMiYo67wS3zqYob6G1auEbyj80Ox9bzjg9lGG5ySCuM52oz6mGXPAqq3nXTk6DeGgsAgC12WRFXFyasNHH5myR+UrZI3LHlA3wdPNUsTkOY9X86EIpcaVU46/vMhAGvYbzqNq45AmsU43EcsqsoevUx1Lxq/6K/Bhi/GpeLMmAs4+n/DqlHroQ7pPQ2GvsL+/3c8Qkeo9kXRIhGIArTP2LPI9oTDsR1EiY6FK4ZPYNRUrEKYgCknYM0Zc4OGSaBqRF/ABMPAB0lEE/Njsl+/q5Kwb8gVWX1BdxmbfKq37r0uRz2vNEq+7GzPqFNljt8vWbIyD1fbnNOXcsCMW/MqvV4XcZ44UGJXTeEPEfzAJjVYHbGewiJfdUMlQNsPWD+b/UOhEYJ6qMZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(8676002)(7416002)(8936002)(66556008)(2616005)(31696002)(186003)(26005)(6506007)(6512007)(38100700002)(83380400001)(53546011)(110136005)(316002)(478600001)(6486002)(6666004)(5660300002)(66476007)(41300700001)(4326008)(36756003)(66946007)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVFUcTJEVVM5MEZiMUo1SWxoWUcycUt1ZUtheUcrcUU4eng4RTVjUDE0ZS8y?=
 =?utf-8?B?TlFyNFBNOFFVM05EdVp2S01MSUVpc3JtVTlST2svT2VFblV1cXd6SWlHMFpm?=
 =?utf-8?B?Smpqc1VIbkJCTUNLL0UxL2xnQkc1UDdIM0o4bTJ4V0hmVjlmaFpNV1NkQTZV?=
 =?utf-8?B?MUs1Y0s3QWUwU1lIMDREWjNVVmJoZ3pmc0FSM29RdEtENi85OTRNVkxEWlRx?=
 =?utf-8?B?L0VNR0tmTW53dTF3ck93MFBudHY0VERSdWd2WjNrRTZhay80QkJFYlQxUG1D?=
 =?utf-8?B?ZGY5YkdIRWhlRFM2NUdqamg0NE0rSTlsa2ZReCszSURvZ2JRSmx0ZGpsWC9E?=
 =?utf-8?B?OFNMaHMyaFY3aHBIVTUvT1B6enJwZkc2Y3dWZUZBUmZGWllUQzVOQXVsS25l?=
 =?utf-8?B?d3pWVXNwc0VKaG1SK24zY2JBRkU1TEJjWE9oWFN4TDV2OWhVVG54NE5McitJ?=
 =?utf-8?B?bnpTM3p0WXdmRjY1MXlmZzUraUcrelp4L3VGaVd3L2U1RFVnS3haRXFBMlha?=
 =?utf-8?B?SFhtdVg4N0dNTE04WXhoSkVuRVV2TWExZUhnNEVQbzZGQ3lJeUdnMDFYN0VT?=
 =?utf-8?B?S1RqMm5JMU5RYzlEQnlnUW9XbG5oUzgvNitNMlozR0VHMVpGWUViSnJEVXJR?=
 =?utf-8?B?blRibWtjeTd1R2xFaXB0d1RERnB2ZCtxc0k0NEo1SXdITWV2eE4xcWV5cTg5?=
 =?utf-8?B?YzNZR3lrNTVoQ2RBUUdxTk1aa0xTUSthbjhYdXBOWFRSVUZhdk5LbnR2Vm5m?=
 =?utf-8?B?ckcyUUpYdmRNQXpxZit4cXhzVEJTRFMwaVRvejhzOUNGNzdLOTAzSmQ4eWpl?=
 =?utf-8?B?NUYrYjlBNHp4NzdjbzVNVUN1SEZNOFdMcmJuaDgwQkRvT1lCSEpKYitDMytD?=
 =?utf-8?B?OSt1aVJ4empTOTlvN3BiYVIrSVU1OU1Lc05RdnJXb0xJOE1ibHZHV3R1djBQ?=
 =?utf-8?B?MitqVXU2a1Q3bE5CeVMwaytIamN1RkZhdlV0R1JNZDc5dWRVNWRUUnh1bEM4?=
 =?utf-8?B?TFpzNWp3eEdpZ3FBZXhsQUovM0djbncvWmV3VFFKMVR4VkVYNnRnaTlzc056?=
 =?utf-8?B?cDhpS0hKQ1hITFBZRGJ1RWdyeXlGTzNDSXJsUlIva2Fvdnh0dzNJemN5Y3dV?=
 =?utf-8?B?L0VPazdtZkZRRk5aV0pvMjNTNEI0K21MN0VSQlJnMXY4WXhMU0xSc2VzbExO?=
 =?utf-8?B?VXBUVzBRcWw5S0MwSEs3MkhRODZLUjRCYmNvTDIwbE9HVHA3aUtrNUxHWDVT?=
 =?utf-8?B?Smw1K0VjSExhdjZTSEdoaXRQZW9rbkovcXBUZlRYUk5MaDc5QkJ6SFlGNUE2?=
 =?utf-8?B?T2UyYlJkK3VUVkZUKzI4Sy9DSHdaVG15TkRDczlvUkV2S2kweUEyRTZlRi84?=
 =?utf-8?B?U3Z0Y1Y4K1o0STgzeXpNdEhRVW5PSXl2ODNqMzBpYTRxSVFKcFppUUlLM3BN?=
 =?utf-8?B?OUlZbHJWdXFQQkVtT0pnWHVYTDZEN05NUlNCaHRDcXhJMDlKWVg4KzdoSnE4?=
 =?utf-8?B?ZGhBd1Y2ZWRiVS8xKzJrTnpHbmJNV3YwckZISGsvOGFKS2lqbjk0N0lIUmQ5?=
 =?utf-8?B?enNhaVdyN1JkMDJ6SEdDQlBKb2dGdUtjWVBUdVhCWDdGZG5WSW8ydGF6clNU?=
 =?utf-8?B?WnMvOG8rc0xybmEvckZ5M1VKY3JUcWM1cnNKbGdkUGRIWlNyQ3FQVzZiNDJm?=
 =?utf-8?B?aWJsdVFZbmtZWjRYenBEM0N0aTZRRXlMQTRVVFl0VXU2SGtZWmRvT1V1Wnhp?=
 =?utf-8?B?ZXVhaE9PaXJyanVHOTBCWlI4L3ZqUC9RVVlUQWs3TXdEWlk2c1dSTEdQWkJU?=
 =?utf-8?B?VDFkMm0yQ25YV2t4OXJKR29MNzVmQlpldjhmci9wMDFNSFFOZmpVVjZPY0Zu?=
 =?utf-8?B?VzlCRm5MWS9iSkZ6MlB2bCs2alhYakN4ell2UEExbWM5S3BuNUhhSC9PTkxV?=
 =?utf-8?B?YXdZOGdZS282ZS81MGhMcG1lRjhNZHdtOUtoQ3FNT1JUUm1yOEV0enA4bUMy?=
 =?utf-8?B?VzhNMnFGL2dMcFJJSHNEdzJHT3g5TmQrRmhrMVYwekhIVVRUUFpYUS9lKzFu?=
 =?utf-8?B?ZGlVOGNxRDJxNFU4WHJkTVkrc3ZrMTRhb0hWWTFNb0g4cVU5dVJTN2hkakh6?=
 =?utf-8?Q?uIUPQ6c9/3zcHS+B90E+Cgh7b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15ac467-100a-41e8-1b0b-08db3441ea04
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:49:50.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUEqTcO+joF1U4qTClxAY7vT18IHh1gzwx4Uu0jn7OwC0pnGbCB2jn7JJKzkCG+skkYHQxF97G+fPKewuqcSSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063


On 30/03/2023 22:27, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please 
> use proper judgment and caution when opening attachments, clicking 
> links, or responding to this email.
>
>
> Hi Ayan,
Hi Julien,
>
> On 21/03/2023 14:03, Ayan Kumar Halder wrote:
>> Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
>> SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
>> writeq_relaxed_non_atomic() to write to it instead of invoking
>> writel_relaxed() twice for lower half and upper half of the register.
>>
>> This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
>> Thus, one can assign p2maddr to a 64 bit register and do the bit
>> manipulations on it, to generate the value for SMMU_CBn_TTBR0.
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> The tags should be ordered in a timeline. So Signed-off-by should be 
> first.
Ack. I will take care henceforth.
>
> I am happy to do it on commit if you can confirm that this patch doesn't
> dependent on the patches before.

Yes, please commit this patch as it is independent of the patch series.

- Ayan

>
> Cheers,
>
> -- 
> Julien Grall
>

