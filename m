Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD88592E93
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387368.623571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYmA-0006oc-UI; Mon, 15 Aug 2022 12:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387368.623571; Mon, 15 Aug 2022 12:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYmA-0006ls-Qo; Mon, 15 Aug 2022 12:00:58 +0000
Received: by outflank-mailman (input) for mailman id 387368;
 Mon, 15 Aug 2022 12:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNYm9-0006lm-Bn
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:00:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb0834f0-1c91-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 14:00:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 12:00:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 12:00:54 +0000
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
X-Inumbo-ID: eb0834f0-1c91-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+kRkVemDzQ487ZYVaPIDZs7rt3XXYc2ZdciAsFBUb33onuemDfI7veKcoy8OyuW7TtjIny1+Bc3SNBx+EkQ0z6l3/6VC+lznP3iqJVW/WaHKAqme8bf5QrJtyahKHHTYW8xk89IP72ttWbXINY8KrDzV2l418nFIw55LfPq4qk6i+uz/P94Gy2E2xknODX7K5Ilkd1o0rCkdNjvPQCLQR2GWqXSOEyttfK4/w1/nLoc1DIilPyduTJRhY2/6R5ZabjxtxaCVfXLwaffhUou/Ju1rDisCafHyRSSgQqECSTji3hA/6TyRyWW7vKnyyPssZV3S15tOk6Nyds+smfoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nljlc6iGhKQdJGEjzecpgPBDCVnyO1+0i9il7CBYTxE=;
 b=WDnJfdcKsWlaW/kSXXUwax/ax2YyRqJmbLp+fE5ALOusglrP3oakltGOiG94miN5kHQ4D0k1W1NK9ZcCibQxP2apBQybxHLFb0CEgwiIDbJv1CC7PxrUJXgA4Cv1YfM6b1uNuZLBGpnrvQdhdXOR/RTWlr791DBbrU7DN9f3LRWh/xS9Lp0E4SlcAhlNO9FV7O2pK3bfdbsLT3I/+/YPDiV6SJ7Jymoq5D31MfXREH46dlfIZ9yGKAVYYq+4RZf3UP9HPfz9hpuYllVLVAzplLIiiyjQrKnxRxyc4JnSM2eX5UoMXM67IShGzyxLVzlCu2V5we5EFyfpiRMNrrHLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nljlc6iGhKQdJGEjzecpgPBDCVnyO1+0i9il7CBYTxE=;
 b=SRPdv6kDrd7HUwH5BCIQTsr9UNWZ8YDdzxFqiY1EGdFAGBmlyK1m+rBbjUCC57ZV4XvmUXgSycZOROSt+4U1t8BTXjdymTVWzCISxKLSfa2BOndqdF7a0EccMZnWpb9EGaegR2DsvoIm2nVI4jyPzL48TfhTHgqPVsBcqoOHPCu1pmEl7AVx8+D2nTFOweDiI/d8NWW4H3XCkJzjAH1UqbbKGxI8BcTGAJyQE+McAvTP74yPgBXSkM90zJdyb2d09YVpScsRzQ9ZXo8Aot1msXx31auXwRTXFcIxqpH3V8H+syfnY2iAcTqLBtDuOnDI4VHy7DkdjIbcufUCj7mI2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
Date: Mon, 15 Aug 2022 14:00:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb3dc417-ed77-49cf-9194-08da7eb5ce32
X-MS-TrafficTypeDiagnostic: AS8PR04MB8625:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ywh/QrIa2iiBw2VsdYVQDZo2QWeDZrTVgtwxBxdNyZnhPV/v8ffC/h3nohV1JK4WRRM5j4pJKKVPfJOHGmm2UewwA4oMsgMWMtyyQA8mrK0WgK8U11IYjJ4LrRmpf8f1bR1w7B8OlL+k+9nPPdf3XV7zv/tRK+K5//T8cv8KDpGQj7Vb3B6BVBzgL8lIldTPkldCU34cc/GsqLFuiXIPlIOyjwzTee8rPf/7Lrqhqm/jK13qWQGJov8QjK83iRRMB2fqqWelrdFIWurx0JPvfrtaLUtJUyIDGEERb9HfN9r6xs/AqVAywxn7NUwYNALcNtORXHSxy/Utt07dX58+mYAtqdNrKOvnoBp8zr+ad16glMhMoGdjnVVbTp4YbVgNX/QzquKvXAnLzDkeujZ5+MCA4bXpmHWDVHaN9IRLC85Xb9Oyq0vnR0IzxfHiC+gez+h/Id9j83wD1doo0YK6CtO3Z5Ed5S4y8nMEVmNUfhp2SDxdRPploW46fPxNmEtcwNcVLZcl6gO4DIaJ5VdPk0TlueOCzlB8ColGn8pUL/xdYLkmr04SJ1Z02iNBB/oo4T3bAaHWShQlK3k4jT9aoxM3jg9uBoU4PTvIFChwxEGR7MAekW9QRjQQk/qR9emfOt/FrHMuIaHnrR7tI9sSh72yp4iOSg/zbvhSW5H/pY5fsv6gEBjcZTZSZJ9VMM0tCKT16hk/+iPEE91pul6P0rhmk08hWghtDg6/6gWiH9O1JfMVcV8pwm7VQeu4VRmZe6XSzEJaHQxUd4p6y9UzGoSwKIe/jJ7YKQF/klozI/4MZK/lWMkhZrPg0fqWwBvp/VDVbXoYjGJp542xX5VBrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(396003)(39860400002)(38100700002)(31696002)(86362001)(316002)(36756003)(66556008)(66946007)(66476007)(8676002)(4326008)(83380400001)(8936002)(6506007)(6486002)(53546011)(5660300002)(478600001)(2616005)(6512007)(6636002)(186003)(26005)(54906003)(37006003)(6862004)(41300700001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0ZSL2hUZ3EyNklnbldNTjd0SXYxakZTakpzaWlZaENPb3BLbTBTMnVUSWEr?=
 =?utf-8?B?MFVyaXRvcnRIa3M2Q0FacllQMm96bTFnRE1PWERIclpmWDlEcCtJM0t4SnVq?=
 =?utf-8?B?NlNJTzMzWUw4UFVrWUEwUzdmcVQ3MHJaMVQvVDdZdGVFakZHTVV1ZFhwR25l?=
 =?utf-8?B?bFBKeGFiQUEvbWRiZzdTVG0zTjRleFFDU3h6V2hkNjJWWXhMWFk0cHJHQjdU?=
 =?utf-8?B?ams1akJnOWhzUEVkeDR6dFV0dGtoYXJidWxlTmVscGpNU1VnV3lpeTl2b1VG?=
 =?utf-8?B?WDZ2SXB5ejBTTDZmemg0c1dFNnVSbWRuUldjUTE0ZlR4UzM0WWhLakozNVl2?=
 =?utf-8?B?aGtDclJnNkNOQW5hWmJ0NXFZbUphY3J2L3hzUWhkT1h2OGY4TDZoVkFBeklp?=
 =?utf-8?B?Y05TcmhTaTYyYnhaeFZKc1JmQXdIa1grYjBZMGhlRm43Q2tnenBxL0hKc0NR?=
 =?utf-8?B?bnNZK3IrNklIUENpeEtLdW9ERXRvQ2VyOFBoZklpTFBWbzZKbE5nQWtSS3Ax?=
 =?utf-8?B?dE52VXJXR1BzMkhIWGJ0TUFvbm44bmVCYURaYkhuSTk2Nm83TjMwTkJpY2ht?=
 =?utf-8?B?NjRUclY5V250MFByOFMxYkZDTlNPWTJlK1U3YS9mcGZDYUZqNEFtRXRkYVI3?=
 =?utf-8?B?WTU1bG1NNHZOTVdjYk04VnBDODNVZWkrTUJFQVU3TzMrcldUVTh2NUdFSHVj?=
 =?utf-8?B?UXRoajdZZTdqWXJtdjF2VjhYREFZYVQxTG54ZnlWczI3dmxCWTRRWU5LL3By?=
 =?utf-8?B?Vkl1VEgwNkdSS2VZdHlKZDV3a2VtK1pUSXV2dVZVeUVOaDEyNlJKS0dNK0lw?=
 =?utf-8?B?QVNtU1FMMEloOTU5cXBQa2dwVVA3TGhEYVVTRXM0cm5lTEQxSFU3enZsZERx?=
 =?utf-8?B?dmswczVnejdXaWxYTDFlNWM1R2hMUUZiUmNDVHpxYkszVktTa2VqZTA0c1cx?=
 =?utf-8?B?MUEyT3RETlJzM2VZR00yZUovbWdXQnE3WWRtWW9tUzhNMHdFMmJnZTdGM1FR?=
 =?utf-8?B?MHJDRHNVOWlGcEs3ZjU4UndOZ294b1ZobHJLNHd0K25hdC9vVVhUZTY1ck5t?=
 =?utf-8?B?cXhhMGpSTXNuYTBjYVM1bXRJZHRtR0dGSVFMdHE1OUhDKzRSWnhDUVplV1R1?=
 =?utf-8?B?d1lobjZjUG5ZZjNUczB1UHdnQ0E3Y2hVYjlCR2owUlM4ajdzeUp5RUxmS1Vv?=
 =?utf-8?B?UDg1UWZHSWZMQzNEUTVSa2hIMU1zajVBbzZINVNXcy9NZlFYM1loZHpqZnFo?=
 =?utf-8?B?UlRod3M3aVBwZVVoRENzbUJsc3RWaXZtNmRTYVpranlzaS9PNEtScG1ZM0Rr?=
 =?utf-8?B?bnViODVoQXptOHNGMkVGMndQajZGM1FvVlZpZXlNZjJhK1lBUVpwRFJLOVZY?=
 =?utf-8?B?eFFjaGJmakVMVzYybGRpZzZRS3pSSU5FQ1BPbVlPTGVtUnQ4VmNDQ1dVQ0N1?=
 =?utf-8?B?amVmV0VIUlVyTy9ZRWNXOUMwOWx4Q2liVEZia1FrWi96aUJOVW9ZMkpuK0xY?=
 =?utf-8?B?a29ERkYrek44UUVPZFlxbzh0SkJPVjhkOVJxZCsyYTZwT3g4SW5pd0NYbE8v?=
 =?utf-8?B?OEcvSzRFRWRPVUliTXBjUkFEaWNlbWxoVy93bUE3UmdTZ1lXbCtkUFZhNzlq?=
 =?utf-8?B?OExNb0RBWFgxcVVsOUg0b0QzeG4wWmhDYW9Md3pzbWZBNFpIdk5oYTVSb3ZG?=
 =?utf-8?B?Qk9iMGtSWmVUcVQrVUY2UXoxVGFndHl4ZnhYTGZpaVFvRWowOWNPcXU2bEk0?=
 =?utf-8?B?MHZkakRsYzBmaFlTemlMUWl4YjVIV0xPVHAxNzNLWmI2dk55Ny95SEpOanN1?=
 =?utf-8?B?NUczR3M0Y0oxS0JhbEo1RVN0eDdteGg4VmhNdlhNUFFiTkx6NzVSWVE2Nkta?=
 =?utf-8?B?VEI2VlBpMS9SU1haUEhSaDMzdTRIajdtNVhOVGVNSFhkaTl5WUduK284NFNF?=
 =?utf-8?B?ajhRQkVxTFlVMHhoS3doTTNIZkFyNy9hQ054MnRqQmExNXFQTXpEYzVka1Jo?=
 =?utf-8?B?eUVPK2VmbXBqaFV5WkZDWlB5bVpackY3MENjNC9KejhRN0Z0T3ZrN3dicjBm?=
 =?utf-8?B?VDFTVFdMbkNMRzI3OUR4ZXhSQS85cGNJcmNHRFlXQUdteElHeHgyNVZvUW5D?=
 =?utf-8?Q?FaWJRj0DhxCCmbfvAnb64PkOl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3dc417-ed77-49cf-9194-08da7eb5ce32
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 12:00:54.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouGYPxNrDrNnxtD1qSOrSrzD98jl9z8dWMAoh3t5pxFMaFXz/d2R7eGYoUpIlTvOmYn/Blh6IhvvUcjBjO3JMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

On 15.08.2022 13:55, Juergen Gross wrote:
> On 15.08.22 13:52, Jan Beulich wrote:
>> On 15.08.2022 13:04, Juergen Gross wrote:
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -3237,6 +3237,65 @@ out:
>>>       return ret;
>>>   }
>>>   
>>> +static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
>>> +{
>>> +    struct cpu_rm_data *data;
>>> +    const struct sched_resource *sr;
>>> +    unsigned int idx;
>>> +
>>> +    rcu_read_lock(&sched_res_rculock);
>>> +
>>> +    sr = get_sched_res(cpu);
>>> +    data = xmalloc_flex_struct(struct cpu_rm_data, sr, sr->granularity - 1);
>>> +    if ( !data )
>>> +        goto out;
>>> +
>>> +    data->old_ops = sr->scheduler;
>>> +    data->vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
>>> +    data->ppriv_old = sr->sched_priv;
>>
>> Repeating a v1 comment:
>>
>> "At least from an abstract perspective, doesn't reading fields from
>>   sr require the RCU lock to be held continuously (i.e. not dropping
>>   it at the end of this function and re-acquiring it in the caller)?"
>>
>> Initially I thought you did respond to this in some way, but when
>> looking for a matching reply I couldn't find one.
> 
> Oh, sorry.
> 
> The RCU lock is protecting only the sr, not any data pointers in the sr
> are referencing. So it is fine to drop the RCU lock after reading some
> of the fields from the sr and storing it in the cpu_rm_data memory.

Hmm, interesting. "Protecting only the sr" then means what exactly?
Just its allocation, but not its contents?

Plus it's not just the pointers - sr->granularity also would better not
increase in the meantime ... Quite likely there's a reason why that also
cannot happen, yet even then I think a brief code comment might be
helpful here.

Jan

