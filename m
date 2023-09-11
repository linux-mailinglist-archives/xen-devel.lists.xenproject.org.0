Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8279A98F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599579.935057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfijd-00027y-U3; Mon, 11 Sep 2023 15:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599579.935057; Mon, 11 Sep 2023 15:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfijd-000252-RF; Mon, 11 Sep 2023 15:21:57 +0000
Received: by outflank-mailman (input) for mailman id 599579;
 Mon, 11 Sep 2023 15:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfijc-00024u-7R
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:21:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0c49854-50b6-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 17:21:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 15:21:53 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 15:21:53 +0000
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
X-Inumbo-ID: f0c49854-50b6-11ee-8785-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ6L/thjbm2kKkw8JDWy5tJmHW5O26QPmXvPumBih7t8XoPnKWTvrqpx+PANN7R063DZizAsZXeUyGyfoo2S5IcM1Ckgc1sPlZ8BGCBI3gHHkahX8bZPm595szS4gbEv3hLmQyLlQwjGtGKAY99wAGFtz+Qv87AJ/CLrWJSiqji5S2jc3PRwdFW1i/l7kfllQDdwXPKZroyqCdmuOElwN2r0SNCaNmEStYpv1myPMI6hqbEdQusrcYL8RN+nwlFLIp2B5V3A1Kr6ipAdLNDMqZdSbF20yS0R6QzZcp1Wc6joiYWUbF+0zp3LTvB/sI6DQ5Uox6jHt7Qar8Qz/xDgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm+fjSskQ3ewVSIp+iaOqiiJ7JXg/o9Jyz16SdfmkRE=;
 b=HK+Ds/9HJwTyY4PrF4fWpmfjOFU5rSMmHBfFSfLK/fmv9uBR8LG5EREwQaDPogFYUqyEbK9o9JznZKrw45wIuQwmSS6gakAtNDd06V8B19Wt3SnaXbZuc/yx6Vn7K+L2r1yYtVufAIaJ59Ifu4vOB/+m/IIN367XJAB0ZqkdbYAXSM/fONyNAv2y9XFSqK62S1foG76/V8yR5QSNMxKDYFoW5GtvGMlts9mTaR3Dlu2Wfr7BI99G0/dBGmxZJB36zjI4R6eXP+O+k1nV7Y+sJ2jGhthh4879cNFbsLP8BsaIlc36e8PyZSD5LJYDF/35/JAVs5F+lepXjkbWqtFs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sm+fjSskQ3ewVSIp+iaOqiiJ7JXg/o9Jyz16SdfmkRE=;
 b=o8J+rKGMNHcGi77KNeMKMjaUZYHTXx0HaSq3i0gE2JfRemKANjGa7HJTk7XYjxtxsSP6ydwMXQ3d1Vk9bTJisnyT4zjb04YYlC5M1ao8O1IL8fzyMB8Pn34Kw+7b7nCAnJKlKcTdFoConSbhYT/J5UnTC0RRAKTIml8AFp/3p/VrgdykJkEuHR7YJFU8h8KaIn9lzGTKFHSGv+JHcPNHXVDe4uu72MflDWK1kl/mwXZWnODHsdIWHv3tB9VlFvKuLGfi3wJ5Yc2JOPvHsq617f/aos7iLpE5dgXBmYAwu3N3bk8XNQpzXlIR1r1DGWnR55BlzUBy4+4LwF+mCelScw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fbb0390-a5fe-668e-06c1-c66ed14da707@suse.com>
Date: Mon, 11 Sep 2023 17:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/PCI: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <f6884bbff0a4117874618bfbece5066d98131aff.1694419992.git.federico.serafini@bugseng.com>
 <16edda00-662a-1b37-327e-3ee3ab87fd3a@suse.com>
 <2e7f0482-7a39-daec-7d2d-92b6fc4bd9a7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e7f0482-7a39-daec-7d2d-92b6fc4bd9a7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 51510884-8d0d-49e9-8c23-08dbb2dad3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bNmP0zALRgMqnW7AxlixsHTrG0ji5I2ivJpdUulT7MIPIzyjTac0ddw9J96GfbDwhNONhePErjDQD8PubOdlZCv6i2zAOHIZmC5A/vBDUEMx4uuk58811mg8InSnFo6fSAf2vkmYyyfo27EBASOEV7YtxJCojEGeQtGKVVBzsH9DwEG9tfd8ZFudhVowIgYiD6CJZU2xZPTra7Ezb3q+qRl4JW62d6c76iKNKzmZcU7hbjhhJ8yEW6CazLefGPdaW2yuX7a+O9TdhZ9uuDAOFAjgCTaEACETkkC7C+RIy4SxEeuA1YdqnOMVzWhonnR2+GgpynvvH2/31i3jXtnApEPcElMFY8k9jpx/u4JTitm/nvUjy09x8Dv/icW4oXyeFcZyU4gewVqPp1Yddvna4lap4Sx5SfkpOPDS2odTu7ZzHREp5E34r/JhE0q7luuaOS4nixpF5AALmxBCc3WuhvmlKUwitFoegfRfJsFGlEmf9Jw12gYN1nTcXwd8TuVedmC0ETWIekhOC1zudpPxaWy8+APPDPLS+fkwywgABfOOQw5bjZmYv4ySQJQpfxBZZx4cf7Nq64gOynqw8mScSB2ncGvYad7jZHNsB0d40jj5MylxTKRG4TlweFPhF02acWStvSIyIvB4yN6p3wcNTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199024)(186009)(1800799009)(41300700001)(31686004)(53546011)(6486002)(6506007)(36756003)(31696002)(86362001)(38100700002)(2616005)(2906002)(6512007)(478600001)(110136005)(4326008)(316002)(8936002)(5660300002)(8676002)(54906003)(26005)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukl2V2xXOXNYR1lzZVE1V3VDOVYxd3NuUXFqSFFJeDhXYUxobVBmRFJXYkYy?=
 =?utf-8?B?V25qb1hUVmhZUWNlNWg5T1ZlNU9uamozTkpUN2ZKVk4yY0FZN3FSdXZ3MFJN?=
 =?utf-8?B?VGdGSHJseit3STlDRHQva1E2UUVwM1phdkh4MXN5YVBUMHYzS2JiY0pXMi9q?=
 =?utf-8?B?T0pjaXZ2blV3MG9PR1ZLWW9OeW9IMkZxRW1DMWtMdUFYRXQ5R0ZYenFNU2Fp?=
 =?utf-8?B?czdodkpFbU1peDVTYldNSVZPdVlrbzRWOHREWkpGMkZ1WTA4UGVuN3NqNnFB?=
 =?utf-8?B?TjV1SzZkcURWN0pXblBuakttS1FjMkNWa0tFYzhqZ0owVGRzVkkxYjBPWnBR?=
 =?utf-8?B?T2hwS0xQVkVsdjdDYk5QeG9yNGJoS0VmdFd1bktxYXVBcUh4WW12L01VYWpO?=
 =?utf-8?B?RTZtSytDVmVGYzZGTGk3M3BqZ2NwMmtvSE5aNnIwQS9LRCthd0hGWXowZjZp?=
 =?utf-8?B?b1J0cnlEcE9lQXA1WWlOZlY3Z2liS3MrU205TCtHQzRVU3RBcFQ5d1FteDJp?=
 =?utf-8?B?ZW9XTHdmZEpybk93aXU2TlVUSUFpa3NzZzc4eHRMQ1FmYzNSUkZsSVBYOXBT?=
 =?utf-8?B?WWRoYVhNOGV3bnRpeFBscS82UTZ2cGRmY2pVVXBMZ21Gdy8rUkNBbi9Ud1N3?=
 =?utf-8?B?MDBxZXphYzVNUjJjcUg1RHdlNWh0Zkd2R3J1aHRZbUVuYi9ONTM1dTRqRzl4?=
 =?utf-8?B?UzQwS2ZaSTZxYkdJMkNCamJISFY4NFAvaEYyZTFLYisxa3ZjTUhtYVJIdVFm?=
 =?utf-8?B?cER5YXNqVzZlZFZFTlhVeDlMd2tqMHhIdWwyUjVEVTVybm5DYzhpZVVBS1RZ?=
 =?utf-8?B?Z3craXJBeUszWFpjK0V4NVJlVzBLUlNLTmRNZTF6QXVoY1ZwRlJ6Rk4wR08z?=
 =?utf-8?B?dE5ReUo4SnJibWw5Ly9JTnFWeTNaVEhIM2ZBMnZvd2R2TDVFTmFNeTJlRWF2?=
 =?utf-8?B?U2FJSm9SMi9nQ0M2TlBxcGVQenNLQXY4MGxiWklIZzEzbW4xbXBmN3B6Yk9G?=
 =?utf-8?B?c1diOW5tdFZ2bU83am0yME1ERkt4V2Zsc1ZXMEhibFVkTVk3YTIxT09hYVZ3?=
 =?utf-8?B?Rkd3ZnozZE5HZ05kSHFyQVVLZ3dwcnh0SnQ3QnQ3VUtHNTdDcE15SkRLVHVQ?=
 =?utf-8?B?cjEvWGp5STZPYWRMSE5UQ3B3akpTdnFURTNRdUZWTWVPQk9WcnQ5R3h4OG1D?=
 =?utf-8?B?ZkhPRWs4WW9xNnNUMW5STXA0Yzg5VDB3Z0xSeUNhZ1pCR3FoVlhIOVZMQWta?=
 =?utf-8?B?NThaZG1MbXFiUUFLZ2QrdkY1YnN6RWlNNElpYXlLUWFmTG1SM0paSXo4cjlZ?=
 =?utf-8?B?QTA0YS9aOFhwZUVjcFd4c09sbXBTZERZNWVLUHpwTG9tMzdBZGtFYnFBdmw2?=
 =?utf-8?B?aVhqeDZJZ1NYa1NxMWw1YzVNSnliZE5WdWRSZy9kSllBdHlmYkJqTGNWYWFr?=
 =?utf-8?B?bVBRdDVQWUVhSGJTL21IN1UwVVpKUnFkQ3g3Mi9rSSthbXRIZW9oV2VhQWNj?=
 =?utf-8?B?U1NEc0NFTXVMWStzVDExM0hWVmxIYzBPaFpudHBnelN6b2w5VnVhWXZ4Rm5t?=
 =?utf-8?B?a3dBRHlmS0NJeXpyUUVtN0tZYnNibzhhUlpuYUFkQnN2bjBIY0JYd2xYSm1i?=
 =?utf-8?B?cnltYUJ5UWQ2RHh3c0xtY2MyV3Jvd1pVendPcEVlUHpYM2pRbHFmN1JCWjNT?=
 =?utf-8?B?cEp6dXczd0ovd3gzSjZNcWgzUmZCdWxYb0lhZTFjNUVWRDJGK3VnRXBvVWw1?=
 =?utf-8?B?Y0pMLzlmM05MMkZzcEVrRHZQN2htakZOamhSNGdxREYvd2NjcHpYcDNZSXF6?=
 =?utf-8?B?OTNsSXI3aWsvT25EcWFCSHpsTXRFWXBIbEVWeVVKdFRrMzkzcWxIblZ4cnFY?=
 =?utf-8?B?SEtkQ2M2ZkV1TXFVOWVNbCtjNTQ3eCtSODRVc2N0MUlYdm8ybU41RlRTTEtv?=
 =?utf-8?B?djQ0MTBaR00ydFAxWXpzaUxEV3pNYWo2QVR0ZjFtdVp6ZmN5NzQ5SndCUTQ2?=
 =?utf-8?B?emt6ajl5TEFXa3RrUEl4ZmxwKzJCSUd3NWwxZ3JQdVNqZHlnVkhpZjdQVUFH?=
 =?utf-8?B?MkE5WlgzMEh0aDFEZnlWdjlTZ3REZ00vWk1YbGo0c0hCN1VkQTdZKzdNTG1F?=
 =?utf-8?Q?oEKqB6sp77dTEBXW7ge5xu6Pw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51510884-8d0d-49e9-8c23-08dbb2dad3f5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 15:21:53.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xvqoWNCk1jqTHpPGKD/rZI5cz1+oXwfkAOdlUZ99QddPeWVGlmXghbd8gBfXqs6YBUnMh3LsD0N4bEzIqyjSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

On 11.09.2023 17:13, Federico Serafini wrote:
> On 11/09/23 10:42, Jan Beulich wrote:
>> On 11.09.2023 10:15, Federico Serafini wrote:
>>> Add missing parameter names and make function declarations and
>>> definitions consistent. No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Since formally correct:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Nevertheless, it is probably about time to mention that ...
>>
>>> @@ -198,10 +198,11 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
>>>   int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
>>>   int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
>>>                                    int cap);
>>> -const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
>>> -                      unsigned int *dev, unsigned int *func);
>>> -const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
>>> -                          unsigned int *dev, unsigned int *func, bool *def_seg);
>>> +const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
>>> +                      unsigned int *dev_p, unsigned int *func_p);
>>> +const char *parse_pci_seg(const char *s, unsigned int *seg_p,
>>> +                          unsigned int *bus_p, unsigned int *dev_p,
>>> +                          unsigned int *func_p, bool *def_seg);
>>
>> ... parameter renaming like this, while fulfilling the word of Misra, is
>> actually hampering readability. To someone wanting to use the function
>> and hence looking at the declaration it is entirely uninteresting
>> whether the _p suffixes are there; there were similar changes earlier on.
>> The longer names merely make reading harder and - as is the case here -
>> also may require a single declaration to wrap across more lines. I view
>> such as going against the spirit of Misra (aiming to improve code
>> clarity).
> 
> I agree with you, but, the removal of _p would lead to
> other (mechanical) changes to the function body.
> In such cases, do you think that an improvement in readability
> justifies the code churn?

I didn't suggest changing the definition. I suggested keeping declaration
and definition (slightly) out of sync.

Jan

