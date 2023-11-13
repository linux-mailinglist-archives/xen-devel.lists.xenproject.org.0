Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64E7E9A58
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 11:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631496.984865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2UHR-0003Sw-5v; Mon, 13 Nov 2023 10:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631496.984865; Mon, 13 Nov 2023 10:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2UHR-0003Pz-3K; Mon, 13 Nov 2023 10:34:57 +0000
Received: by outflank-mailman (input) for mailman id 631496;
 Mon, 13 Nov 2023 10:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2UHP-0003O5-HN
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 10:34:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47e698bb-8210-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 11:34:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 10:34:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 10:34:50 +0000
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
X-Inumbo-ID: 47e698bb-8210-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOQRAtuI0cWl67wM5Pcr/fAHLZ9nn/hF8vZ3ccyLSnIxemZHubYFPvLQo5oEwdmgLgAm65BEoopmed4F1yPUZMycQ04eqP6eh+vYt3sJXT0AwUKw8sH7gzIKJ3R1nyZCuVFOWMVnqrP5J9dBrQuK2tEM3gjDEVlnd0Nw6j5D9aWJte9sirjgKQn2PI/yWfRfm1Y/NlJspg3ic9T6DF/TR7q4qqt/lYsCoMIZhvGE+tj5PD50ORyVr/L8DN7ba23etfVBYJevni9slfQ4a+t+iCSKj6Dn7RvNYFDxzcUF0A9Z5EqysoMq2Kx+wf8z4FWsJMo8z/jRle33h13XTYgrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwso1ff1s3HdaJH8t7lb+fKDX8RR0AK6VBDhCoizYMU=;
 b=OUnO5bt9XxMQPULSBbZCohgvH0bqFIo0Mq+MMHntWL5o3phgwf2q4DIzqPzSZt2VbQBKhGBAzkq8AYHvnej5rRSP0/uBr251OpVgIdpYaPz+aRWj4FVGuKU25CbzYJbTJFiNBdIErl5u2rwT8tChf6SQm6KV6oA61yqbyw7p9OI/Wvc+TQ62h/xRT070kJftma5pv6HOwBheNjvMDizgZNa4exRNkoxaSAUPXd2py9/QvIlD3OWuA72ZaMEq1im/u5fc2OObOIZQfxq1zWrVrF0ok6QLhhbCZFyEeIERUd5Ct4fOeq3xqliXsF0N04x5Fi9W5oZitP965Qs3nte+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwso1ff1s3HdaJH8t7lb+fKDX8RR0AK6VBDhCoizYMU=;
 b=P728983ZS/JhR57lfyKggWVF3KoRxqQQaFgkzZgKiv11+1HFdcmiyTGuyho9dm7MVyGGcRjfm3/YXLo3uWZP316KfHPYiB3kRlN6IrFZqH6l+SmVJuDsAaX3XELAn4z1HeOBUrVxBfsIX4HHTglDtQ7Upu0Hu6QwZzdly7JaGom0azkcH4GiaD4SfxXs/z9rUMbErl+Y29s80Y0pG0wMVBF3oDGCLDNH0S/0lL8iCa+c0wAQpP/Ob2GrvcqvLjF/jsmdcL21VDdD2MPyD2dS3Vsh7yHhFmNcb5OROk/FWk44W3ZjNl/uLimFvsUPXa+RHi4v6QLvgUXqw7ZwXK4jcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41f4b8b3-4a4f-9fcf-516c-8051a8a64e70@suse.com>
Date: Mon, 13 Nov 2023 11:34:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
 <9d75d794-a333-792a-786c-064d35910980@suse.com>
 <7265e418-6c40-47ea-97a7-bcf3c2e61cf7@xen.org>
 <e70d9b85-00fa-3d7e-8c0a-d463cf0e0c74@suse.com>
 <c25eb77a-9a15-4450-80dc-0d9e2e79c858@xen.org>
 <53d3435f-f021-edf2-3b90-9ea8f1784725@suse.com>
 <35421335-ae20-41d7-bacc-5f4a60327e9a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35421335-ae20-41d7-bacc-5f4a60327e9a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 20620b53-595d-452f-0003-08dbe4342a4b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63DLPIMjNnjHwdkXkeMzc63YfwyxpK/IBjFbbMcbXlKPExqaEHFjd0M/dQEBEA7oq84+YRekWxOJJeRnoOKGfOXIB/ytwU6gPeZf32Mp4+PAEmN4EJhXy8FDxTsLSQSVGyJ8FL3NUBuPjOfjVzur2I8+w8yETOXCHMTVI1Jd1zfPaguTWkZ8FhzEDl4ycGQ51pmLLoRuiMd64A1RUQqsvGy8li3dzjTvQ/TSJ4O7fNiKEhAxl0crXyQu1RC2YpG6+hPtsaWoknNk1F9cSEhOW/1+WCk6+D4c9EWBhiiJso/gqOE8nYxnLF5XJtJy0h1ANQ+hkRNMUVjH1keLX+biVPECGrLw+gQbahHg0FU8IpBKU5Wi9cDHfQk3e3c8VhiY4nM56ffirCegcf0SJDapxx/Zz0Il/lt3GDmPdEsLumjtM+O+ixCiDpAMgfBZ0Fz/akBuQ0A7rLVf4v/YT5gx3ISrQPoo8/l5LM5NXS6uZh3RQ62DJthXQ38etE7MBmDtY9Jcyc+YACJelHrV98NaSK98gB7uABUevfpmfAzcgvzN5omSIc+1R2ie3m7i9anV7ad/2wDAVnX8LsDtbIQF+RfReJvRhc025vyQobLwzCznUi53jquKKNeximlJisEp8UA7fSa2sZ+rkvk4nmo7vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(26005)(2616005)(53546011)(6506007)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWZHaDZyM21YelNuQjV2WXM2bnVNeDNQN1prbWIycXZWaGhaRTA4ZXF6UTVB?=
 =?utf-8?B?Ui9SZVV2S2ZhZnA2UEhXSGt5VUxMUnF0bEFKU3I5UGxCakxXQzlaWmVMcGVs?=
 =?utf-8?B?NGJOdWVkWHpwRmd4YXNjTkMwditLeHk4ek81THZaR0k2eEFjVDFzYnZIVkha?=
 =?utf-8?B?Z0lYRmdFa3QwdVNKcjF6WVJ0dFJpeVQzdWdtUDN5RzZaSXV2WmhnQlQxcnpu?=
 =?utf-8?B?NnNreGtvZ05xTmlldDBmdk5TWHRBZk1lb0FpZVRJa092cDE3d0F0Qkp1K2pp?=
 =?utf-8?B?T1o0STY4Rk1ZSDlWek5wRXZMSnhMWFJxZzg3TnM3RWFxemVrVnRDWWc2NEFT?=
 =?utf-8?B?MGtRL1d4bEdKalRKQTJSS2JhT3dkR2Fkd1FONGYyUmJuK2JHejNESUtMeFBG?=
 =?utf-8?B?b05tMG43TW5qVUh6V211L2hXajIxSHdGOUpGQldkU01qVERqQUtSTmI5djRM?=
 =?utf-8?B?dzB1SitqL2tGZG5TUkFMWXowSTZGdFhaQjQvaG4xSGRCNm83bncxenlmUWg0?=
 =?utf-8?B?S0d1Z2F1aC96VjVVNEd6RjFKMkJSeUhka1ZNdVZoR1JlRzlWdVNHeWc3WXlT?=
 =?utf-8?B?Z01uYXZVem94cmRzeGFYbXZiVnRDL0J1NGtteU55VmNabGZpaXRVL0dESUln?=
 =?utf-8?B?Nk9aM1YvbFN5bkZPMjNTTXYvMGxpNGtjQm1KeWFEWGlPcFEzelpmY0g5ZTdE?=
 =?utf-8?B?RHAwdENQWnVKM0s5clZYaHVSSnhCaEhTcmdhbDVETHY4dDJjaVVOV2tONVZQ?=
 =?utf-8?B?aGRoYlhJTFR3VjBiM1V5Qy9tUWNZVnMzY3IvRDVjUEdIVUZWR0YyZjJPemRT?=
 =?utf-8?B?TFRHVGt5R1l4R21UYitlWEplSlJDdDRWdDlpTlFBLy9xUHFjS0xLSDV1Q3F5?=
 =?utf-8?B?SFVwNFNNOVhFa0szbm42dWlZeWJEUFNzL0lLcWhBd21wZmt1ek9iUXNlb3Yz?=
 =?utf-8?B?Vm9KR3VlZTg1Y29VNHNkQnlvZzdGTHcveWR5WjBnUnVFVXRvUGRJNUFoZnd5?=
 =?utf-8?B?TjBmMWoybjNkd2dWYzZlVW0yc1RyL1RsdjE1N0pyOGJhWm9wNjhCV2MvUjRN?=
 =?utf-8?B?NHowUGVLeUZST2M0VUU3TktRNFJhcUt6dko1dTBRTGdSS2ZsYXlmZ0xHNWdG?=
 =?utf-8?B?V0JSakRybG9ZM3htVFUvT2xQbUZNSEU2RFJJa3EyQm5neXN1WUpIYktRT0dL?=
 =?utf-8?B?WXk4STloSjNDWlFvNURDbW9SSnN3WkU3NEc4Zkw2OTEvbTE1TWwvajArYzlL?=
 =?utf-8?B?VWZDL0N3Nnd4aEFvejFsVkoxeFo2WHNIczZ6TGpMbldpTkJES09vck4ydThx?=
 =?utf-8?B?TmpndkoxdU5oMFhkLzVld2dGNDNnRHo5L1RTU0VsRDZFNTRUdGUzOXFNajJ6?=
 =?utf-8?B?dEE5YStFa1J6UWowa3R5am9NUFZOaDdQTHJQaDdyajhNOHVBbnNFV3dqMzI2?=
 =?utf-8?B?czl3RDB1blFoQkthTGFSOXpKVHF0V1pBbzZTZXRGTTN6emtkM0JMN1JJNXly?=
 =?utf-8?B?ZS9PQTRIeW51elJsWVhXVGZKVzJNNnljbDh4VGhVT2xZbFZhTjdXdDVBRXNu?=
 =?utf-8?B?UkxhRXBqTUFKdTNQWWNob1VvT0dkL2l6NlRLemI5MFo5OGYvdEJYaWFoVFdu?=
 =?utf-8?B?N2lJS2FndjBpYjdWdE91dzZmck1Nendjb25hSy85WjNlVmxXcDB6eEYzSmx5?=
 =?utf-8?B?NEp5NFI2R0FsRy9mVUJBQVpUY3FLbzhQVVhIaU9UTmNzVXFiL0NFUkxVOHNS?=
 =?utf-8?B?K0Zza0R3MlorRm9MV2liTVNaVmlmVGZJT0hIbnNhbzY2YlgxS05oTG5aU280?=
 =?utf-8?B?UTkrUXdWZE5vUW9zR3hSdUhocERQWnBiREY5UnQxUmU5emNLeGZyUnpSeTQv?=
 =?utf-8?B?aC9JMWx2NElDSDg3d3dQZDlTNTRvd1pwMmoxd3g3RTFXemw5SzQxUTNtRjJ1?=
 =?utf-8?B?aHNXUnJiQVhjYW5kZytud1lPQmF1WjNiNUFsNVBkeEVCd1dtZ3lKdHJTOG1B?=
 =?utf-8?B?NDk1VmdRNUExdlVYdnB1Vi9GL2JQT0pURlRWNFdsd2VIbUF4cVNLOTZuRllm?=
 =?utf-8?B?eEJvZVU5OFAydlRBdFl1blFmYWZ2ZEFEVkptei85SWIvMDNqWFllRUdJMHdy?=
 =?utf-8?Q?ay64Oqo91nM1aiicy7YzoWiwN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20620b53-595d-452f-0003-08dbe4342a4b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 10:34:50.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTCrR1GLDOP3MfExR7HhdiFJkW2kDrcyWWbHK5McfNLiXYP7sZkJ92rCU54hq8A8BDSJF1RSM2JIaNk7ZwNoSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936

On 13.11.2023 11:20, Julien Grall wrote:
> Hi,
> 
> On 13/11/2023 09:28, Jan Beulich wrote:
>> On 13.11.2023 10:12, Julien Grall wrote:
>>>
>>>
>>> On 13/11/2023 07:37, Jan Beulich wrote:
>>>> On 10.11.2023 18:38, Julien Grall wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 10/11/2023 12:44, Jan Beulich wrote:
>>>>>> On 10.11.2023 13:23, Roger Pau Monné wrote:
>>>>>>> On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
>>>>>>>> Get the own domid via creation of a temporary event channel. There is
>>>>>>>> no "official" way to read the own domid in PV guests, so use the event
>>>>>>>> channel interface to get it:
>>>>>>>>
>>>>>>>> - allocate an unbound event channel specifying DOMID_SELF for the
>>>>>>>>      other end
>>>>>>>>
>>>>>>>> - read the event channel status which will contain the own domid in
>>>>>>>>      unbound.dom
>>>>>>>>
>>>>>>>> - close the event channel
>>>>>>>
>>>>>>> Should we look into introducing a way to expose the domid, so that in
>>>>>>> the future we might not need to resort to this workarounds to get the
>>>>>>> domid?
>>>>>>>
>>>>>>> Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
>>>>>>> a non-HVM specific leaf when it was made available to HVM for pvshim
>>>>>>> reasons.
>>>>>>
>>>>>> Couldn't we retroactively generalize the type-agnostic parts of that
>>>>>> leaf?
>>>>>
>>>>> This would only work for x86. I think we want to have a generic
>>>>> hypercalls so it can be used by all arch.
>>>>
>>>> Hmm, yes, perhaps. Otoh it would seem desirable to me if arch-es also
>>>> provided some extension to an arch-natural way of feature detection
>>>> (which CPUID is on x86), without the need to invoke any hypercalls.
>>>
>>> For Arm, I can't really think of anything other than hvc/smc which are
>>> used for calls to the hypervisor/monitor (so basically hypercalls).
>>>
>>> Please suggest if you have a better idea.
>>
>> I don't know enough Arm to properly suggest something. Arm64 has various
>> id_* system registers, so I would be wondering whether having a properly
>> virtual one reserved in system register space couldn't do the trick.
> 
> AFAIK there are none available. But if such exists, then I don't see how 
> that would suit with my requests to have an arch-agnostic approach.
> 
> Each architecture would need to have to provide a way to expose those 
> values.

Right. Just like hardware of each architecture also surfaces its
capabilities in architecture-specific ways.

> At which point, why not using hypercall? What's wrong with it?

There's nothing "wrong" with hypercalls, they're just less natural to use
in certain cases. Plus of course using them may require setup inside the
guest.

I'm tempted to ask a counter question: Do you consider it a mistake that
on x86 certain capability information is surfaced as CPUID data?

Jan

