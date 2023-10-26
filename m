Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533FD7D8556
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 16:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623854.972103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1lx-0006cF-Md; Thu, 26 Oct 2023 14:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623854.972103; Thu, 26 Oct 2023 14:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1lx-0006Yw-Jn; Thu, 26 Oct 2023 14:55:45 +0000
Received: by outflank-mailman (input) for mailman id 623854;
 Thu, 26 Oct 2023 14:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qw1lv-0006YX-GA
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 14:55:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb5dc7ee-740f-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 16:55:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9101.eurprd04.prod.outlook.com (2603:10a6:150:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Thu, 26 Oct
 2023 14:55:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 14:55:38 +0000
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
X-Inumbo-ID: bb5dc7ee-740f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8lY8Fpwuyvz6SuNYpJN6WBH76KSeU7/n4X85Jfhb6rmtPxEe/QpGqT7lIm4sJKWJDfO+4Tug+u1yHdyO33Kv18LAGumTbFLq/6+aCu/iM54d7awbV9zrGj6dOD9pwSkdnE6D7O9rjsjrf44qtleEj7SHHIQ7oi4FRW+fWwdpU/buLSD590I5NznFWBGFT0UKFn/YWtLuyOF+axuZo6AqLT7VUfPY1AFEgjzfK2XHfwYc2UJaAgwNOxzNtBphNfkxYL+o06U8jB7HElppA4Oe5a9PlSq2pnMk+DEfaW9RD04srzXtqsy4m5kIWWB6xdn5MO+YAJn9WqI7gEIPmXtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKXTNTikjp96Wsz9YiIJcvkFan7yuwOGnEYCcOLzOcE=;
 b=HylZzYciYkNQGJ5pVfXbprDitOlfv5FtgW4z+ozuEkl331T5Vm7c/8aB5eyyBX/jdzffd1MY1p9YBExZV2qFv9TNAnM4HBE/syiACvzWrTMlSy3TQbBxwVXU+RWyWOWilt7WYhom974uahq4cscnbHt3VWATLWSjBvtgtDyqwG3n3D1GCkDLH4Oq4pjXISPjCmSj0f+SepFcPIx4Ir7TKybkFCXQmZCpPVEQMtNfsD7E1/AV2Wxp/cEJ4OOoJlAXZU4dL53zIhZfc3k7OZk47DXTTmjwscHkyqalmVbjgoCOSa6vNZTlBXZRWriGkbVjba3WK271JCRM/6RT8sCRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKXTNTikjp96Wsz9YiIJcvkFan7yuwOGnEYCcOLzOcE=;
 b=PSkL7rHLIf3LNUdCH1pzdYSr8PrX3+hKJvd5mBkffHcige0WkLmovRnBpg4jNRujP7PnrUNpMAfVcWyu6Ks61BFNwntn22DurC4a+sw68psO127XGx/EHNQYiw1q6Lqt3IVIru8zgC2wSSaCGLinyXjVZKr03S49oOALmFcXi5dzTOGEP55ah1Kzrma1lBk+DWnzYjv27W6ZfxUEg6G3BghNR4Daap2NYEddTpq2H0kZZkBHMhOYbZPz/K3mE4/Lkd8q796wFto4pslKU3FCwbsjOlngyea1HFCkl8R95NMUEGY5wIDM35J933nSbC5AcPE9XatyibzWf+rYfpj01Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
Date: Thu, 26 Oct 2023 16:55:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
 <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
 <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
 <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
 <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
 <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0411.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: a31fea13-7a12-41ca-0038-08dbd6339dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qgxig8KN/kIlXbtSjVGqCCKuhUK4Q+T3AxT46r2qQpJdKyyXq4zfEtJFKRR3WeBaKUDBu9QFmwnCyDpeKNwjmzqu1HyYDvQURtSLFgTH5NnA1fsXnksg9mVtR/FRajwgsDVB7/6j//RqW0hR6lqub7s6UioGbAj23BPK1o7Em7RBD/to4VE5lBEj6uHTjWgtec6tvetm5fDfSdKYDVhdhstqt7qucgeOIQcoks/NUhy8f+lCpNVP0NlEEfnS2S7MrcqS6AQsjWReTA/nMaIIDIgvX9s5bwBg+u/oST1EezXeRKZiGBmwjfmeCk4kudJtwSYpS7J2RRtXOi2mUdNnjOEWBEssvyXFqJHShDpjaYaS9xa+m9K2wdKjCSXKEM/AAgyGasjF411l1maVABoijEDvtH1osQuBn6s1H94Br3hwTY9BQgfYV6QKHkcjGXpb68Me5Al0NvLFb2tDtC7JhFQTumrV2hikLoaYt5Xwx2JhJOsmOm7DJNshuz6AZaiFGeUIsneQjXg/rqS2zHtEke3w2mgbmm+kqUzXOXvr4xFXyeGfmzgu97a2NMasJM7BufF4ygt1GX517PB0lhF1WM7Q3yIEn8Vx/LOcIIg5jIyH55CHby+mZUhHNK1ePXtRBOmaKHe8J45nxwRJH0CxZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(8936002)(4326008)(8676002)(2906002)(5660300002)(66899024)(6512007)(53546011)(83380400001)(6506007)(26005)(31686004)(2616005)(36756003)(31696002)(86362001)(38100700002)(54906003)(316002)(6486002)(478600001)(66946007)(6916009)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME5aVkZXSXVBK1lqWGgzRXBTdUxDSGZ0Q3N2L0gxTXR3MGloU2VtNHBiYlpI?=
 =?utf-8?B?eFd3UENqSkNoTWRpeWxjc3FPQks5WDNJdElzeDE0Zm9UTS96clppd25FWXpF?=
 =?utf-8?B?TWgyZElCL2dUYlUzNHFieXhGcUlQVVRMd2dyQ2traGwxTys2RWVjangwaCtm?=
 =?utf-8?B?anIyczhXL2NTL3lPVDdQb0gvdzZzZFpWUGtyUTVjV0Q5L05sZFVKelZMa2VY?=
 =?utf-8?B?WmVvcnlLUEdpUUcwcHI4MmZiTTluM3lDTjk1VTJpMkJlNk5Nb09jbllnc0Y4?=
 =?utf-8?B?KzlpVjJYbk43S2haWHpQN3NrU0lJN0JkUDIvamJiUkM0NElaRk1DOVRndjJM?=
 =?utf-8?B?bnB3NnZmUFI0RlpobDFYUXorWGxJTXd6Q3k4T0V2ckYxQ2VMcUh1MTJ2Z2Ux?=
 =?utf-8?B?bjlSYUYzOHpibVhWSHZqc3NqUHlZeEViTklMUWkxRFNLUW1SeDQ0N3YxWmdK?=
 =?utf-8?B?SDh6eXlGcElTa25WRzB6NVVYNkNsd3pFdmdNZ1pkZUIwZzVPSERaM3FVRW0x?=
 =?utf-8?B?dE1Uc1FwZFk1WDN3emUrcGgwQ2gzQy9TQVQ4WVdPbWlMY0tQSS9uZWF1UzRE?=
 =?utf-8?B?Y24vbjJnRkoyZk9WRE5KK2dSRHZ4SGpVajQ1Q1ZWZERCTUdDVVpWN2Yxd0Rh?=
 =?utf-8?B?ajJVZEhoVkNNeFRTM3Mvd3pWbEg0TkFROHlKbjdON3VmYTdWL0Erck5QT1gr?=
 =?utf-8?B?Zm9zWDNJZTNFVU4xNDhtNFRJR3FrazE5RDBEQTNBTEw2RmxLZzFBNVh2Z210?=
 =?utf-8?B?U0k2MmpCQWwxL0FwSjdpOEY0cmdwQkFrWFJ4bmY3cEpIUnNsNGtROTNMMy8r?=
 =?utf-8?B?Qm9iR0Y0Nk9ocld3TmRrdUg0VTg0L3ZqUGdKMlNoeFdBbGI5LytVQUdOMEc5?=
 =?utf-8?B?QmVLb1dXQUNMTCt5L2diK0JKQWNkZUZBMnArVlZXNkx2dzZJbWhuSi9tVGxC?=
 =?utf-8?B?ZWxSZUVidExDY1ZpRk5EcDlEYTRUb0Z0RFZ1U1lWb1BnMjF2M1hVeHBucHUy?=
 =?utf-8?B?eTBvZkcwMGNkcEZaamFUS2s1ZXloa1FIUCtwOUQzUm01OHlTekp5VkFmZ29I?=
 =?utf-8?B?T2MwRHBUaE5uT2pmZlpnMUo5VTc3SVpFdndQZjV4WlVVUkk1bTRGMVc4akg0?=
 =?utf-8?B?aVNreWJtdjg3LzBSSEtVRnVjOWFseFlIZnliOC8zc0JTL0E5a1FvVmtUaWFa?=
 =?utf-8?B?TEovcE1ySmVDSEl0bTdPQTZrZjVkTTZ2TDhPcHFScWVaQ3dsQ3ZkRUxTdDBz?=
 =?utf-8?B?WDZlWnRaUG1lajEyVG1kbWdYaEFtUWRURzhZSFlIVEt2cVROS1REem5EbFBT?=
 =?utf-8?B?b1hvUWd5c2k2cXVOeWxjNXZsUXRXK2NzVWsvYnQxSnJlU1F5aktrSU1EUEZF?=
 =?utf-8?B?QS9IbzMzaVR4MkFQNXJCRjZxNklndXBmMTNzVXZPSjVLWUo3ZGRYWmtCWVE1?=
 =?utf-8?B?SmlIWFRXKzY4VUhRSTB2Rk0xQllobVpaSVd6RDdKaDZCVER1eUxLMWpFYjBm?=
 =?utf-8?B?QmVnQWM0eGZSa041blVnSkhzRUpBSmV2aHlxT1psWGJNbU1kT0RnQUJBc0FC?=
 =?utf-8?B?cEp2UjA3UlBJbHNYZGgrY1puOWpsOXJZc2U1WTVRSm5zWVNTMEpESnNlRUtq?=
 =?utf-8?B?U1Y2NnFUMTBFNEpSS01FR3lXM1NDZzRkWnJ2N283ZjY2dzBib01rMXF1L1pz?=
 =?utf-8?B?QXRCYWtaL05lQ0VMQ0lGRElqeG0raWlnNmxBU3IvSThseUltOEs4YTVSZGFz?=
 =?utf-8?B?VldULzNJTDFVTlJoaWZKNGN6Ymg5T2pLWDNuYkllV2F1elFLbXpyZS9OY29s?=
 =?utf-8?B?dWJvWnBPOGNjWmZ1RHBIbEErSFgxeEZCR0Raa0ZsU0JPQWh2UkFFYm5IY01Q?=
 =?utf-8?B?WkZSR0xURDJydUJIcFQxckJ3Wk9tVU95UGNIYS92cjBuQjJ3d01RKzI3d0Zt?=
 =?utf-8?B?NFpFZkVILytoYURjajV0eGM1RDFveGpKY1VoMnphOUNqYWdoaEdjWDhXTzJB?=
 =?utf-8?B?OHJsY1lpYy9nMUZUOWdXYS95enNhUk4xdk1TeXE3Z0dVN2NlV25YQk5yNjYw?=
 =?utf-8?B?WkhWVzIwN3dzTW5yY3FVUHFRZnZjYk1xOHY5dmJVdGxFdWJkMFdmR29ML1VT?=
 =?utf-8?Q?+a2+CaPVW5ul6Aia9dxLG4sfy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31fea13-7a12-41ca-0038-08dbd6339dbb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 14:55:38.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/vZMUDDtVRrcSpzvESvoRXB8u9O7jR0MMFh/hOTa5jBaLskPihzjigvDVPCd4nMCu29HS09fN3NeBRTrq+IYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9101

On 26.10.2023 15:58, Xenia Ragiadakou wrote:
> 
> On 26/10/23 15:37, Jan Beulich wrote:
>> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>>
>>>
>>> On 26/10/23 14:51, Jan Beulich wrote:
>>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>>              if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>>                  ; /* No overlap, nothing to do. */
>>>>>>>>>              /* Deal with the kernel already being loaded in the region. */
>>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>>> "kernel range fully contained") to use
>>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>>       if the kernel range is fully contained,
>>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>>> - the head of the range when the overlap is at the end.
>>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>>> the first condition failing.
>>>>>>>
>>>>>>> Both cases:
>>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>>> (kernel_start - start > end - kernel_end)
>>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>>
>>>>>>> And both the cases:
>>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>>> (end - kernel_end > kernel_start - start)
>>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>>
>>>>>>> ... unless of course I miss a case
>>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>>> original expression and your replacement are identical anyway. But
>>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>>> (theoretical only at this point) risk with the replacement expression
>>>>>> as well. As a result I still think that ...
>>>>>>
>>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>>> ... this alternative approach may want considering (provided we need
>>>>>> to make a change in the first place, which I continue to be
>>>>>> unconvinced of).
>>>>> Hmm, I see your point regarding the overflow.
>>>>> Given that start < kernel_end and end > kernel_start, this could
>>>>> be resolved by changing the above condition into:
>>>>> if ( kernel_end - start > end - kernel_start )
>>>>>
>>>>> Would that work for you?
>>>>
>>>> That would look quite a bit more natural, yes. But I don't think it covers
>>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>>> If we consider kernel range crossing E820 region boundaries, we also need
>>>> to take that possibility into account, I think.
>>>
>>> You are right, this case is not handled and can lead to either of the
>>> issues mentioned in commit message.
>>> Maybe we should check whether end > start before proceeding with
>>> checking the size.
>>
>> It looks like it all boils down to the alternative I did sketch out.
> 
> I 'm not sure I fully understood the alternative.
> Do you mean sth in the lines below?
> 
>           if ( end <= kernel_start || start >= kernel_end )
>               ; /* No overlap, nothing to do. */
>           /* Deal with the kernel already being loaded in the region. */
> -        else if ( kernel_start - start > end - kernel_end )
> +        else if ( start < kernel_start && end > kernel_end ) {
> +            if ( kernel_start - start > end - kernel_end )
> +                end = kernel_start;
> +            else
> +                start = kernel_end;
> +        }
> +        else if ( start < kernel_start )
>               end = kernel_start;
> -        else
> +        else if ( end > kernel_end )
>               start = kernel_end;
> +        else
> +            continue;
> 
>           if ( end - start >= size )
>               return start;

Not exactly, no, because this still takes the size into account only
in this final if().

> You wouldn't like to consider this approach?

I'm happy to consider any other approach. Just that ...

>           if ( end <= kernel_start || start >= kernel_end )
>               ; /* No overlap, nothing to do. */
>           /* Deal with the kernel already being loaded in the region. */
> -        else if ( kernel_start - start > end - kernel_end )
> +        else if ( kernel_end - start > end - kernel_start )
>               end = kernel_start;
>           else
>               start = kernel_end;
> 
> -        if ( end - start >= size )
> +        if ( end > start && end - start >= size )
>               return start;
>       }

... I'm afraid this doesn't deal well with the specific case I was
mentioning: If the E820 region is fully contained in the kernel range,
it looks to me as if this approach would ignore the E820 altogether,
since you either move end ahead of start or start past end then. Both
head and tail regions may be large enough in this case, and if this
was the only region above 1M, there'd be no other space to fall back
to.

Jan

