Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E55B0389
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401418.643260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtkl-0005ZL-AV; Wed, 07 Sep 2022 12:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401418.643260; Wed, 07 Sep 2022 12:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtkl-0005WA-6g; Wed, 07 Sep 2022 12:01:59 +0000
Received: by outflank-mailman (input) for mailman id 401418;
 Wed, 07 Sep 2022 12:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVtkj-0005Vt-CO
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:01:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00055.outbound.protection.outlook.com [40.107.0.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de7f5e75-2ea4-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:01:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8669.eurprd04.prod.outlook.com (2603:10a6:102:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 12:01:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 12:01:54 +0000
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
X-Inumbo-ID: de7f5e75-2ea4-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMBNuQ89BjWI1BflvYJH+KxZZgJfxB7F+TmT9FTV+yVD5Unnc/HB6nvooyR+oQMbwqNecL9Ts7LI7Mlwcp2YKpbpkz2XWCOaktUZsKe41gmb+VHpxcwrPuJfLfGY9vDlqEFeIsd0VoXgBqNoI6KuWu6ekDXPcgJC+egXSQXJSgAbhuceoa4J/lFMolCMxSzGaLAIIYBbblrJx9uwBi4WLALvg6dWikvaEkplq2lP1xBDCvdetlPne2C6JRJUcHEZd6dJisPerMnxks3mTfM3o5fafqrTct2AcqyazAesRGVmrCjfmsqBXZgcyNSAzHRofC7pKOpCMKxZAdqr7FOf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl+fOY4e71cwi/TlwNboldX6wLZzZrpFC6vc8fQGmRk=;
 b=CIl/oQp0z0XZf8t1xcXLOuYpEP7NK9ffKeWP+iZ/GNdJRST8/YiIeZ1y38Wud2ZptgfrqGlyLDwFa6I/9WZEz7KkxnNzAIM3ziaW8cSo9CZW4O4ViB2nNT+/VVJMjcARKJgDbknpdcVO8P0IIsROOkyfV505O5e2DhFP60gaGbwV4HWq6eehSXsM15dsVgCJ96prdW1+B+ulXOxr9K46ckwxiny2fgjj1DDdLfc3ymQREx92O7VvuqkqRIUqPxL2OW3aamkrhds354kUiUq6hDrroRKuZqU93yGu4GIJjY8Hhua2uHmQbqu3/THLIk7qYCuGDAKa2L9JqbVU3yM0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl+fOY4e71cwi/TlwNboldX6wLZzZrpFC6vc8fQGmRk=;
 b=BXh2zfYJiCe68CwuqxTnXYPmD1laNW/ARkhJnDekZ/VHmDoDlR+soqEkFaxr7VdP6lPyYWkMzGjoI8G3AB7pklOrcFUUWcZ0OEVPYkcE4ON2NSYJ1zQRwVVRt6RgKzqwQwwhEuTEID0b6SgFIMRzYBOzhiBNVmedoJIxhwLNL/GgMzkW3rPFsI/OYEeh16kpNqjmfy9Q7BBa6hI0ucY6IEzgB0JrAdqYOx+rJ1uBAbBSpS4zg1Qak6FPnxJ3GbWfKudEPZY3gDBkRCuVChzMh80bXP+/Oy0R4RZQwsRPL55emHGYS+LWw8Xyc0x/wUv38JqrJrz4xPP4jBP4kXjkyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5929d69-6dee-c755-b9e8-e6585a51ef6d@suse.com>
Date: Wed, 7 Sep 2022 14:01:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Rahul Singh
 <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
 <f40f1ac1-fe19-9d62-06d0-b049d4edcd85@suse.com>
 <5948f099-7287-2743-aa24-3c7a17033877@xen.org>
 <4ac67001-9406-6cac-b032-b6cbefb598b5@suse.com>
 <4f070d84-a732-3166-ad6c-2c15e6cfc882@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4f070d84-a732-3166-ad6c-2c15e6cfc882@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: f6befce7-15cf-4960-2c47-08da90c8c1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGTGugEoO86KMYFdAOxzgHjcO4WYNcgfk+y1uc+Fp1yGFC+e20oa/MlEPedz3K5NkHUBaM5pOj/TIjZUqgf3z39tTFekwOsd3c4LWggVHbPQKzKxcLXfGrUOpFqpjZaLrL5LVdLcSxEARM1xuCp3Ar3bb2RA23KXKRI41/GI5NYD27ZO63UcpTkKuStIWkaZ9C3IZIUj6ZDNgJtv9DMZAORe/HKojSxLB6UpSo3/pt1/+KIgNz2/GiB0vnugrqa6AF9NqtJ/aDZucjKXtfJvaxtvDSuuya8iiZR/8FiIad+pAa5+sR6vN+iYDALn3P4avxzDVo1SpIS5VTGJaWHQSACSO0j21B/gY4kqgCGrJXfjanjB65IIrY1DO4TJBYH2KVXyTeUZM9Xtccj6yjYDrTSDb3IAsgHaplm1YntXX/gvbN/gsVDYNuPEDN/TAPqkYeVzt54JT8rPzuxd9RusLJYpOApP8LJQym+3AKPNxQsPvhDbo1o6rXt2SBfSZkLgeGvuPli/rVCH6Ifc7Q3Y8y4CsuLVs7BdYv0iaD+b44w+f2sVDyRe6n44zXDTGys3mSbv1KeOggpLi1a+xW+gcznUsxzExNIwj6CymjGO5J1uBDLISt9E+bsG/gED9l8Ka13dtirKYqqy2oJo/LL0A7lbyDW0KmgZ7qYm+bdShbFOaAdMYyMDFdmw1nbZLvXrK87h81UhyA9b+J4lgf8kuKzRb69Cd9PWNiDJcMj57RSFWWo8JEM+avgjndsAUHlUmK5sbp9zp3kyWMwVEz0qHXJO50TolnwXSoJo3Od3WpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(396003)(39860400002)(346002)(4326008)(38100700002)(66556008)(8676002)(316002)(66946007)(66476007)(6916009)(54906003)(2906002)(5660300002)(7416002)(2616005)(8936002)(186003)(83380400001)(6486002)(478600001)(53546011)(6512007)(41300700001)(26005)(6506007)(31686004)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy96MkN5SkNkdTczc2hjbm4zL245VFJTVDZvZTdHOWo4NEhzSGcyVWlSSWlO?=
 =?utf-8?B?aDVYejl5c3I2QTlkdWdTWXdWa3BPUVZsUjlVYTV6Tjk5VUxRS20yVUtCR3hC?=
 =?utf-8?B?eHhtY2VCMG13b2pTdFJBMFdvb2tJNmhYaUYxdDhTR2xzakZIeEdDbjlMYlFZ?=
 =?utf-8?B?MnRYN1d0OWE1Y3IyYk43aE5EQ0tKdEtBT0dFTTVDSzZMd0R2RHJQUFpjSFlL?=
 =?utf-8?B?S1JpRTZ1ZU80NUFINnAvUnVIVk04Uk5ZVEorTmt5cXRLOU1qV01LVDJrK29h?=
 =?utf-8?B?RVhwdG9uM09sTXUwOFpidmlWSnV4b0FpbWM4eGIzWnFucjE1RXA4b2dVQjU4?=
 =?utf-8?B?RG5WaG41SzNUbjdjTjk2TzM1SHJtUzJtK3B3ek81Vm9TKzd1RHpJVlQ1Yko5?=
 =?utf-8?B?U3lYVXltV1lrNUpBcE5aaG9yV2UrVElPSUJXVjdmaTFUcXVqVGIvNUIzN3lJ?=
 =?utf-8?B?ZzhxMjF2eW9LSjhOQTFXQ3pyYjBTMnk0aWxyVCtFckludlVSSHozcFNaUWpp?=
 =?utf-8?B?YmxVOGpjUkxKMHZZbXJLeVU2aFZMRFdlczRDTUFVMFNDQkdUTTg3MW1vS0xm?=
 =?utf-8?B?NTUzOVZLNENpOHJEc1FUS3hXUUVRN3dJNEkydUY0ZU1iNHMyd2toS05JTnBq?=
 =?utf-8?B?UkhJM2VXalpWcFBvdHl5OXdGZStVRHh2WktVWXQvUG80Si9DMy84RmhWTzhU?=
 =?utf-8?B?TkpNUE5NMDRjajdKRng2Zkd1a0NNM1c3TW5mdjBwUnp2S2ZwYi9tZ2U5ckUw?=
 =?utf-8?B?b2FJS28wRWlUeEtydDhLckd6QTNIMDdJM2UyVW9tQ0lWSmNkbjJPMElyR2xB?=
 =?utf-8?B?cjhuWHQ5N05iaitDc0E0djJTOXhmYVRvT1J6S0V0clhzTXZUN2IvRm9MVHpq?=
 =?utf-8?B?SWJZcVo5c2xya3ptWnF2ZXRSbTkvWTU2SWVneDNhZy9XWCtLMytNU0MxNmJv?=
 =?utf-8?B?R25KVk5HT3haTUYwZG1HbnY5RUNXL2o1ZUlDUG1YREd6cmpQZnByckhoZklI?=
 =?utf-8?B?eUN0ZTVENmRFWStIQ3RQMmxMallNV0k3dW52WGp0OGxYTUgyVEhFaTVEWjRv?=
 =?utf-8?B?c3Z3TzNiU1JhK1gzOGUwaHZnbnlIMmlsaWNmN0d5bE9WSzVQblFlRGVLd3BF?=
 =?utf-8?B?VnhRN29BREx2azdKN1pMSjBTWUhpSWloK3pFUUFaalFPRnRJalhLZG5oL1hl?=
 =?utf-8?B?K0hTaWQxQldCUUJ2UlBodTJ5MVk3aVgyZGhZQkVjNmVCMzc0WkZteEo4MCtn?=
 =?utf-8?B?bHVjeXdXWEJoSW0ySWpTYmIzYjg2clhWM2YxZDkvdHZRSG8zbkk3dVpmbm5O?=
 =?utf-8?B?MVp3UjNZdHdUM3puNXNBZ1BTTEVuMmZxWVVKWmdvUkJVMTZxN2VvUnF5SDlL?=
 =?utf-8?B?cHBnSk5MdCttOTRmSUk0bExOMDBVMFVsalpwcWQxL0NtMjFvNW52RzMxWGtZ?=
 =?utf-8?B?QXhJSmJzQlNGeXYwdHRaYzB3OVE4bFc3NjVLVjhzaU12TDQ0Q2tPL3ZSaTFW?=
 =?utf-8?B?M3N3Zk1HZ3dBY0EzTDdwdjVMbHF5YkhYd01KQVFZVGJRSU5vZndlOGZlY011?=
 =?utf-8?B?OEJVZXZQa3Jld2hLcHRUOGhKeWdQMWVmRzRWaVZId1N2VHQ1ODNzNm4zdWxY?=
 =?utf-8?B?eG1XZ2pjNk9iajZva1dCeFhaUm9tZUUzVFZoUDl6dXlZckJjODJYdEZUM1Fo?=
 =?utf-8?B?aTlteTNES01ML0lUTm91YUxWRjEwV3Z1b3hubFpDWnlQaDlQcW5kWC9CeldU?=
 =?utf-8?B?QnFiK3pjVlQrQUdFU2NvZmZMS295ZHFRa0V6WjVPZjF1Z0wzRnJOR0o5dVli?=
 =?utf-8?B?cjBqS3BVcW9NbEt4U1VLT2hWQW9VV1FqbW5pMHZpRlBRRlFObnVndVJVWU5S?=
 =?utf-8?B?ZHFJQndYV3JDNkdnSWh6NDFyZjhLZXd2SXdPMloxSFJWYnBTTnJUTk5ZL3RE?=
 =?utf-8?B?NXdMRVRkUks5UzBNQnF1dStnN1dIekRuZXFKODFRdmhOMlRrUUlaNGoxZnp3?=
 =?utf-8?B?bTZYSUVRTGpTZzhYU3VjOXd4cEJFLzJWQU1OdXBxMVhRbmxIcjdUTEFkVUZL?=
 =?utf-8?B?eHgvbWR4dkFGL25JRlNWUjdya1FqazFkNEZOdXhhZ0NPSTRpdE9DdlcxVzZl?=
 =?utf-8?Q?9LzKsbWqwMiiOSPlT11sEYc2g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6befce7-15cf-4960-2c47-08da90c8c1b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:01:54.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCZtqHhQgCYwb9OlxUCBzynfylpCyWJJFStBurRmANNOjdNlsXJAcL5y76FozXl+sRF25LF1YLHWisTW3I0ivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8669

On 07.09.2022 12:00, Julien Grall wrote:
> On 07/09/2022 10:07, Jan Beulich wrote:
>> On 07.09.2022 10:58, Julien Grall wrote:
>>> On 06/09/2022 09:53, Jan Beulich wrote:
>>>> On 03.09.2022 02:24, Stefano Stabellini wrote:
>>>>> On Thu, 1 Sep 2022, Rahul Singh wrote:
>>>>>> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>>>>>        return 0;
>>>>>>    }
>>>>>>    
>>>>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>>>>> +                        uint64_t addr, uint64_t len, void *data)
>>>>>> +{
>>>>>> +    struct pdev_bar *bar_data = data;
>>>>>> +    unsigned long s = mfn_x(bar_data->start);
>>>>>> +    unsigned long e = mfn_x(bar_data->end);
>>>>>> +
>>>>>> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
>>>>>> +        bar_data->is_valid =  true;
>>>>>
>>>>>
>>>>> This patch looks good and you addressed all Jan's comment well. Before I
>>>>> ack it, one question.
>>>>>
>>>>> I know that you made this change to address Jan's comment but using
>>>>> PFN_DOWN for the (s >= PFN_DOWN(addr)) check and PFN_UP for the (e <=
>>>>> PFN_UP(addr + len - 1)) check means that we are relaxing the
>>>>> requirements, aren't we?
>>>>>
>>>>> I know that this discussion is a bit pointless because addr and len should
>>>>> always be page aligned, and if they weren't it would be a mistake.
>>>
>>> Hmmm.... Is that requirement written down somewhere?
>>
>> What do you mean here? Isn't it quite obvious that every byte in the
>> address space may only be used for a single purpose? I.e. if a byte
>> is covered by a BAR, it cannot also be covered by a RAM region or
>> yet something else (e.g. MMIO beyond BARs of PCI devices). What
>> happens if BAR and RAM indeed overlap depends on fabric and chipset,
>> but it'll either result in chaos if two parties respond to a single
>> request on the bus, or it'll be (hopefully) deterministic (for any
>> individual system) which of the two takes "precedence".
> 
> I am well aware about that and I am not sure how you implied this is 
> what I was referring to from what I wrote (in particular if you read the 
> next sentence).
> 
> Stefano wrote that it would be a mistake if the address/length is not 
> page-aligned. However, I am not aware from such requirement written 
> down. It seems to be more an expected common sense that was IIRC not 
> always respected on HW supporting multiple page-granularity.

I guess the question was then solely directed at Stefano? I have no
idea, after all, what guarantees there are for addr and len, which
presumably originate from DT somewhere.

Yet if there aren't any guarantees, then aligning the incoming range
may be necessary: BARs can be sub-page size (even more so when
considering page sizes above 4k), and so a not-really-overlap (at
byte granularity) could still be an issue if there's an overlap at
4k or system page size granularity.

Jan

