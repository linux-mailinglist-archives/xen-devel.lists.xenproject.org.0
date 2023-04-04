Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4F6D6707
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517967.804023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiQN-00010d-5k; Tue, 04 Apr 2023 15:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517967.804023; Tue, 04 Apr 2023 15:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiQN-0000xv-2y; Tue, 04 Apr 2023 15:18:19 +0000
Received: by outflank-mailman (input) for mailman id 517967;
 Tue, 04 Apr 2023 15:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjiQL-0000wk-Fa
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:18:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebd7f2bb-d2fb-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 17:18:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 15:18:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:18:14 +0000
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
X-Inumbo-ID: ebd7f2bb-d2fb-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qge5t21hXJyEHRkcmOzMh/XI4LOHNFeIm9xUWwrxOF1dGcLWyZOBfyaEQiEd88Et0rV6/ZC6wE5bcvRc2W6cqvL/JIWE9AMNznlTFOu6GR1aPbMCQb1UxWWzjRTBMVIRuYpob/IJyS1pYqsmdHQm3CRsPHUNS+s5KmgLUa1+LnBLny7RaQb40AArkhfAPMfvj4DEN3xl5xsEIcoBXj55D8pUOax2zv9eQKGWPL/t6OiAZQmi5l9FTlITBRcRWrHKvgQi+5mXHtt68/pctR52Qvz5aBw5kNr8oWcF13nzCIPCFBmKBI3Dx0V4wlUbCMyX+m85kj5mXGmuH8OJMsivIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62XBXfVTI7hx6DBhJHmeGCLANXJLmjSM/SQCiMNAh4c=;
 b=cFAfsyS/MGqAxLJA36bCHNzpJPzPCqH+h3Dshoe5g1k4LZD8TtvxGRrI0QTukKcVw8/89xH2ipkF0sLXlphewf8bvTp0FO1tdCCiEiNXPC4ZvwuIrwTHUD8jgEaB8vXmbpXjJdHTQ9y6UeH7biwwMWkopwzolWHZipzhbdiyldZU/pps4g2z2eY+JVqnJeFRx4kbU36n5qB/RcxDvZxSVkxVAjYyyn3QVnSgBffxUq2/ZfXZdOAwYUYNSK7Br6HcT+OVtKyIl1P81Zw5OJrm89QpQ7uftFrtlzzW50QkCufAGgg4zsRv+p9dX2PfKjdcY4GnNZ4DofHIflK8PewI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62XBXfVTI7hx6DBhJHmeGCLANXJLmjSM/SQCiMNAh4c=;
 b=sN/t/NtkfDhjk+UMQMQZwT1uR0jUrefEbCq5yTcFYQVWLM6kpa5k8xFJBdGchrfb/nDgWwVwYfWpNYm/WPRUqbkYVEUx9Y46xoosen8wHHPDvth04v1xhCGCgsG0+o/4fJ44k4RoqqycilIrJ3jdV2eqcB9IcAvtQAvuqSQLomut8sZehKQg46V0zdY+AtaCac7y5eEeOOyCSHm4BvwmfUFob3ut7Iv5N7uKPq96guFf2zSXwpWxbwGRbmBpBAnCAQuZDQnsqBbM1/vkn3V02+i3GqFwio9+J2c6JDO3RXOXnt48YEEMJHguC/L6nB0zE1PW3UM5j6sdwH1RpuXMiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e1d7c6f-82c8-418d-922a-e3f6f24c8d21@suse.com>
Date: Tue, 4 Apr 2023 17:18:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
 <ZCqVEHe1Qo3skeVf@Air-de-Roger>
 <4b76def9-9940-ccf0-8050-12ddf2c1253c@citrix.com>
 <ZCrUErZZkd6co1Dq@Air-de-Roger>
 <91fc0c1f-a985-17bd-2011-f4964d82e008@citrix.com>
 <ZCw8eQSIN0FpXAhX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCw8eQSIN0FpXAhX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: d03ec373-8be0-4f2b-c7c3-08db351fcf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+051pjhnvn4C0k5LxZqCUTp3RbzbFJ8y5e2SZqH5zyxhIGQoSn2HGOc/+MErV7v4dJpURA9O/JNF85ajTAIggQrfltNH0fPF1AqnfrF3HPCD4uskU/qC9wAvjkG+FTCbRSUANj8RTCTkjim0Rgf7e5gNMMVhmf1s7VKlj0daE44edwZJlYNBLorK+54Y7U97w1iNVYfloYqDoU86YRWWzbVsvUszOXFqUUJqfL3BHu9CvMem/6NRTM5cjXAUMIpoYOBvsLQL6tqOQ3JdGrFCSEfGI767+qZ76/mGMIM2A+VzeYkrpB5PrtITgWIh1eKvkXbiX/dlL4B+n8a1rtcH+zWs5Bl+t/MgDku7JE9T+lMS7I/GNJM7oVTDmCO/kRfBFsu7iir+bs65JXkKKbEYQfehWpUY4Mmds+3rQACj83L1mJDQp2A+DKmN4KSIhHtBcQQ3sx21UNxjWOUqUpZsWp4W1WBaYpR5Z4+7c2OmYe2zGMUlhANLjQW54qHL7fHClXxHElbCC4f4Y/lVC9zggFtPbamY0R1NEJhRqX0FKFC2wbu0F6YHJeAYSIzRwHQZSpsWOScVyjkHXOyzl5ch534TVOI4Rrir7SDyXopKVO2qywEdV6md4wrAoVR8XB3LScBAM7lpYphIaKbpQ86OQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(38100700002)(5660300002)(83380400001)(2616005)(31696002)(54906003)(316002)(36756003)(53546011)(6486002)(86362001)(186003)(6512007)(478600001)(6506007)(26005)(6916009)(66556008)(66476007)(41300700001)(4326008)(8676002)(66946007)(8936002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2dnYStKNmZGeHhRRE4yM1Z6RzZPTjRNa3RWajRmWlhuTExrMzg1T2MvMklQ?=
 =?utf-8?B?VVFaTHRGbXpqT3oreFZDVkhpbzBTM2k5bTY2MmpaWndRVDRtWSs0M3dDVkZI?=
 =?utf-8?B?bWJYSnkvekhDeFBPdWJFeHNLMnFQVWVwR1JwcmExWE5RNTZNTEpUSUFSMmdw?=
 =?utf-8?B?VVR1ZFBRSHBBcjNVQSszTXIxLzR1OUIxSjRVYjQyNmxnenlRbURIR0VJaWFk?=
 =?utf-8?B?YnpwMHRxcmxYWXh5RGJBMHRlc0llb1lWdmtyT2Y1N0FCdTJsL3pnenFDUmZO?=
 =?utf-8?B?UDBLKy9QZWFQTW8xNWg1VUVTa3hWOHJvV1Mvb21xamVCM3E1N3dwa2lpSm1V?=
 =?utf-8?B?a2NZSUVxMkNuNkNzUDZDNi9HMGRlRCtDZ0RQdGpMNW80eE1nR2JyRXZReEUw?=
 =?utf-8?B?bHczdkhETEIrZW91bnhNZ3AySzI2YkR4NnB2eDdnMUs4NzRSbzZKOG9hazhj?=
 =?utf-8?B?QVV5U0FNdE1GdUh0dmhNWW5vWENaYUdXaTdiTXBhWkplcTFFdHhKVlBHNFJo?=
 =?utf-8?B?NFFXeExvODA3S2s0Q2FaV3FXMzVZMmpWeVRvajFuZU4wOHMyeWE2UXlqejBR?=
 =?utf-8?B?cXFORVlPUW1ESFJCbWN1Z1ZjRzlyM1ZVVjRWSGxOMlNEQXlrUU5oK2lERnkv?=
 =?utf-8?B?RE1MREpmRmxqSGRCcW9oa2QyQmwvYzBscE5MUktlRWpUbFVMdHI4QjdSNEt5?=
 =?utf-8?B?dGN5M3czalBoUC9JbHlPSm5pMHFZV1J5TS9WQk9OdWxEUFlIeFZwd2tFNTBl?=
 =?utf-8?B?U1ZLWFVIZ3BmcUxTdXluNE8xVm5udkNQZ1lqL2ZYaklhKzRPaEg5NzJpVWJW?=
 =?utf-8?B?U0UzelhNSk9MblF6TU8yRGJINlE4bnU0cXhMZFFDZEI4WFVUV1VQVTg0N3dt?=
 =?utf-8?B?ZXhkSGFOTXBGRkkyMmFJYllsMEZRU3BaYVBCTFAxbW1jeUVtMGtiSm1hdXhR?=
 =?utf-8?B?VmV3MFdKcTBmS3dpMXRDWWpmRzREaSthejhqVDI3SmZ4RDRlUExxdWlETUt3?=
 =?utf-8?B?cVQ0NFN5REtSTFFzektvNnJGUjFLeDJHM21vdWU4TXNKb203czVXNS8wSE5Z?=
 =?utf-8?B?RzM4NnZjN2tPSC9ZdWh6ODAzOUlTdDBQQ0dMazVRNElQTjJOM01QeU13ei85?=
 =?utf-8?B?M01zUkg2cEM1dkwvRzFuZVFoTGE5SlBBN0hrSFBzS0w3Q1lHbGk0M2FudDAz?=
 =?utf-8?B?K0pJOXpCZVQraU5lR3ovam9ERnpUN0N0bjNqOXpoZk0rZTBIR3pLUXpuT1VB?=
 =?utf-8?B?QmlVOXRlUDZ1eUoxclFxT1ZCQ004Vk9LTVpsM3NVZmk3VzlNeVJRa2ZjS2lH?=
 =?utf-8?B?c1F6bnFoNnNpeWRtYWJrM2ZsZlRqZ0VCcnk5UHo5NWVCK3IxYzBXbm1aUmFy?=
 =?utf-8?B?dkVQbFhvQzN3OHF1Q1ZMTTluZi9EZHhUdlhnd3BUZ1ZHSlE4ZkVQaTZITkFB?=
 =?utf-8?B?a3BSRWVlYjRUZUhqakgwQnhIOVROZFo2MUp5U3VseEtWSzI2K1RweERVa0hQ?=
 =?utf-8?B?M1J2YU9JRWxEK0EvMDc4bys4MldTT3ZWVmJncHVjc2xXYkJ4NWpYanlJcU1C?=
 =?utf-8?B?Tk9rYk5hblBsM200UkNhcmR3bzNZdk05L3JaU3lKbERuWGQrZFVTN2pTdXRB?=
 =?utf-8?B?eHprMzBqbUNsdFFSYU96U1hRNStlYWQrbmxCVlRFbG0vTG9CYkN6a0ZzeFRu?=
 =?utf-8?B?VklIbEhYMkxVeGgwdmVZV2Nvbk4wMlk4SlM2Q3JnY0RZQlVGQWxDZHBiY05F?=
 =?utf-8?B?cGtRQmtZMzZBRjZnZEY5bjJHMWZEUjJqU29WRStIVHI5TU1CRTJ3RjMvbDlZ?=
 =?utf-8?B?TERYdzdkcjBpaVoveGZINFFUdVpWSWJVZVBZT09ib21RWFNiK2gxeHlEd2E0?=
 =?utf-8?B?YW5pYUl3WnoydUtNVDl0eHpTWEp0bXB0aHZienJpK3RPMEhONFVUc0UyWWFT?=
 =?utf-8?B?T1lMd3pESmpQM2NHSEFabE50eFVvNE5JZ08xRkVVK1dLY0M5SHlLWVpLRkxo?=
 =?utf-8?B?RHpKdk9aTkp6Y1pralBVMHNwQm5EYVR0Z2ZGb20xaTdKZHJQUm9DWVNLeE15?=
 =?utf-8?B?eGJMbGRhNlBobk1ybk5qbVM5L2pUVDRxUVkvRU5vUXRYZ3JORGtoSWNDN1ky?=
 =?utf-8?Q?92BDiQS5x3A2wJzpSNJi2tSGm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03ec373-8be0-4f2b-c7c3-08db351fcf5d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:18:14.3795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1mXU8/tG1ZLKM3mtuX9BztNW+MgdDyPFrLWBjAM8GGFCQpYtQx5/OuPaih60R2hE5nAqDllbLwQs9a/WyKpMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261

On 04.04.2023 17:04, Roger Pau Monné wrote:
> On Tue, Apr 04, 2023 at 02:27:36PM +0100, Andrew Cooper wrote:
>> On 03/04/2023 2:26 pm, Roger Pau Monné wrote:
>>> On Mon, Apr 03, 2023 at 11:16:52AM +0100, Andrew Cooper wrote:
>>>> On 03/04/2023 9:57 am, Roger Pau Monné wrote:
>>>>>> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
>>>>>>          if ( !is_hwdom_pinned_vcpu(curr) )
>>>>>>              return X86EMUL_OKAY;
>>>>>>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
>>>>>> +             /*
>>>>>> +              * TODO: this is broken.  What happens when dom0 is pinned but
>>>>>> +              * can't see the full system?  CF8_EXT probably ought to be a
>>>>>> +              * Xen-owned setting, and made symmetric across the system.
>>>>>> +              */
>>>>> I would assume CF8_EXT would be symmetric across the system, specially
>>>>> given that it seems to be phased out and only used in older AMD
>>>>> families that where all symmetric?
>>>> The CF8_EXT bit has been phased out.  The IO ECS functionality still exists.
>>>>
>>>> But yes, the more I think about letting dom0 play with this, the more I
>>>> think it is a fundamentally broken idea...  I bet it was from the very
>>>> early AMD Fam10h days where dom0 knew how to turn it on, and Xen was
>>>> trying to pretend it didn't have to touch any PCI devices.
>>> It seems to me Xen should set CF8_EXT on all threads (when available)
>>> and expose it to dom0, so that accesses using pci_{conf,write}_read()
>>> work as expected?
>>
>> It's per northbridge in the system, not per thread.  Hence needing the
>> spinlock protecting the CF8/CFC IO port pair access, and why MMCFG is
>> strictly preferable.
> 
> So just setting CF8_EXT_ENABLE on MSR_AMD64_NB_CFG by the BSP should
> be enough to have it enabled?  I expect all other threads will see the
> bit as set in the MSR then.

No, it's one bit per socket iirc.

Jan

