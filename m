Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950F7986A4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 13:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597940.932383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qea7e-0001Ld-H5; Fri, 08 Sep 2023 11:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597940.932383; Fri, 08 Sep 2023 11:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qea7e-0001Jb-EC; Fri, 08 Sep 2023 11:58:02 +0000
Received: by outflank-mailman (input) for mailman id 597940;
 Fri, 08 Sep 2023 11:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qea7d-0001JU-9y
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 11:58:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4c0661c-4e3e-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 13:58:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 11:57:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 11:57:57 +0000
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
X-Inumbo-ID: f4c0661c-4e3e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRo5+PN1R0ZFCU4bMgwuk4FrZXmMvNWsQgtMerjjmvRCbNucsI/j02GDVpccWgP73Ztuo1ZRLTtG05sxVCmWoaO83Pkt9pjmrNcxGWuO9ITKFe4iGUDzPXc5RRH8RUwpJXUKq7qFgq5Rc1S5fjPNcsikVVAZEciBAOFzintF5n3CTvq6//VdAIHiCKD0UOemTEo6Z6CUJPogXkF0RMMoLTm2l6EruCeod2f1NUg15P1T3EXdLLhQpEPZKPgcF6C3efaIVzlesk86mOopTqAR9McjaJxm9DfF3eKxR+ksM1999pED1YEkDgnXx2tnYbf1uuvZd4T11mqdNcSLLg307Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6twvm2oY/dT6zr1zeCutXruYQQ6EydshraWWzmgxxFM=;
 b=XZ0tON1iViYLW55L5XFUxeG5q84SdGvJ5g/hklNtQZ9XAZB1Yh/aHxj7O6FopHRceoDXW3vsFxCrgRlryw0mqe7oRE6tsi8ZO+c1zhTTNW1KZCeL8VHuKKhGXgHWzGkULjk/W4UUqLioT/lW7JAg0DbDS+ngMfGXkDfijKA20o00fQ2dNsctRTGlOEGks+ZKGYRbhwLpiS/QmJ1jlgBXtQfHAHm4yriScJqRwkrB0crn9igoxxa+e6qzO9LHAivJz6RdyL6FYw0wdxxpf0NjAbJdTwYnPRI+GW38MStdVMCE2yQZEWPY5SPM+SIc8hjVPDhmUMZPv/Q0v2AJAuJ6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6twvm2oY/dT6zr1zeCutXruYQQ6EydshraWWzmgxxFM=;
 b=VcrSIOncXh0HGpqALhbw3oicZtDMcyzpdERe8qyo9UW6UFqUZXBjPflm9PjXQlaziMy3Wc4aVeEIRBf4qYOxELT439HSCt4DLZWBuUBjsj7ZKue1SjxbpBOsVFCJQVaC/dk7tJQlU4pyDtE07HDVoKH3A599WYFvoIeLZsyLIbAeRFg4AFwnCHt0kRdYRIjsfMRleesWt1XKcPM6kQraZvHhS3v7fyIP45JTRxmHPXD02SfV9sCVXF2Yy93nksNmxSt1SZ25c/71I5usAUYUAmsBTRkXJNJwRsV2GLDsWj81UNJtqABVsq5lrw9alsy7Kf9ccSV6dejC7gdULDgo0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
Date: Fri, 8 Sep 2023 13:57:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 185d3947-410a-4bb3-6787-08dbb062d78f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ma30HO3uy3vh6qCioVwli3cIHRy5WiStm+ajilMahXZOmrJ3WmIQobu/ccz9poOMAwtX0T50lDhblzXy3H5YBEpc5eV1RQGZ+pmgRWJu2OVJtDq8usGkcUBOLcSZB9ZB30EBHUjhrShue7EfXQSV3pmWghMGd/8OpokppmTxeasJuhm4r+0bKpoUUXmgiLJe0OCisxeD5JJy08RrgXHynU5WU8RsOTz6QUMgEv/LUiFpq1peWKhIv3ZlQ66jiOqw0Wg4uJDHisbdsIQwoEzm2i6UU2+2m8HJR7XEJ/LFSlc6E7xgtej0kS8MP4gGnvXXtnEwhr6todwa8EWLwEXpQosFaLjYRnU3flSMaF8wP77k7/6C8bkCxJumVZvdgOOEk8HeCNgDE2KCABCcqpHrQbzo74rbsUaGzu8CfVPZhp8+FcWbbw6lWpX8RhCV+7IyRUhBGhSS7lWOtEJ5k8djwoKpAlxWqiJvyW0AlFJ1ey/KVUxow7LChwnlvVs7GanA7gliUaGBwAVBzIu0IOnmCaBo/n5cAOiMNQ52Hl3UBH1q4XfKSQcogdhIt8TrwNUUAAoa5gLtesaY9eB403BXHTaZeZ6GGcExq5p4ia9ZYdn/+P+GgdfEezgFIfct68YovTx64DLlC5RmOQaLZ0KCOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(186009)(1800799009)(451199024)(53546011)(7416002)(6506007)(6486002)(41300700001)(66899024)(316002)(36756003)(2906002)(478600001)(31696002)(86362001)(66556008)(66476007)(54906003)(6916009)(38100700002)(66946007)(5660300002)(2616005)(83380400001)(8936002)(8676002)(4326008)(26005)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGFKL2Zzc0hRS2trMjQrZFRaUThERVo1all4bmJVYm9vSXAxRnp4SWx3MXVX?=
 =?utf-8?B?b3QyS1dWN0g0NFN6TjJOUG9IR2FUTzlGdHJZOW5pNkM2aXNoRTV3WXBMaVlm?=
 =?utf-8?B?VXl1Njl4Y2twUE8zcUF6WUg2S3cxK2x1UjJLdGRBL0N5WVRreWJHUEpMbGVj?=
 =?utf-8?B?Z3d4ems2WXg5TVF1aERlR2liSWhCSUw4VyswU0tIZ0NkOEE5R3ZRUGMzTklS?=
 =?utf-8?B?bWMzaDYxUE9WQlJNWGVDNGF4d0xVaURWTHBEcHFvcjBnK1RaVnVLajFrblR1?=
 =?utf-8?B?THJNMUlIR0czK1pZQnplOXNpdlg1VU9LZmZiVWh0Y0R6Z1JpbGhwZXNiUFUx?=
 =?utf-8?B?d3FaRmVPMWpKYVgvcnhNd0lvU3g5OXdFeklNTEFwTzk5UUs2K3RneFVSNHFp?=
 =?utf-8?B?c3ZqNnFzVzZPanJtdEZSQ0Rkbng2aUhra2tyemQwNWgvS0JERTFBZGFoUW5J?=
 =?utf-8?B?WFdBcTNuQy9rMFJ6MmhIcWJyczd4Q0V0RjV6SlVubkNzaFl3Z0x2RXo4U1Bx?=
 =?utf-8?B?ZkhmN2V1OTlHc2U3c1h1VnZscWdoVzRxTWhzVVpjWFVwdXZnUm9GKzNKNUZ0?=
 =?utf-8?B?MXprS2RXYTdvRytsY3YrTHpZOFY2bFlaSmZVVHcwanVwbERlT0pFSWhrZVgr?=
 =?utf-8?B?UHk5OVhycXFCcXJyZ3QzL2c3OTBWZ1I3VmludWZIVGRRYmltMWtDbXJzWHNB?=
 =?utf-8?B?ZWp0TmttS0c5WWV4ZkRNU0NsKzI1RzF2L0RRbjQrZldSdSs2Uk5qdFRwOGs3?=
 =?utf-8?B?alZ0c0Q5cGxHQ2NmU1BuZlV4MkRBbEZWZUdMMzVlM3VyNDVaZDZVU0lrdEFO?=
 =?utf-8?B?a1VUYmxMWFJCMzNTZlh3NXBqTkxRWGNRTmIwRVBTVmVjRjllZzBPRUI3dXlD?=
 =?utf-8?B?VmNhVk96UG5HNG9NN2VoNmNpS3FHMDNHaEFiWGYvZkJveSthYVhkcGRETGow?=
 =?utf-8?B?MEwzTWl2bFhOVFYrVXd2YldlWG44QWhFd25xTFpYNCtTY1BGOUh1SUlIWjI5?=
 =?utf-8?B?OVNiUzB2NnArZTdBWEczMTd4VHBBcW1xdFVlODh3N25pVW1pVHJDT1lQYkNO?=
 =?utf-8?B?N0Z0QjVjdDVBQUVSbUZSL0NnUzZIMDBZckk0UE1EWTVWenFUdGpUWGFhMmJp?=
 =?utf-8?B?Z1NTZ3cwMVJodFFMa25zYVhBUDVFdjl1UjRjRVl3eG82SlRRZzgzekNUeFRM?=
 =?utf-8?B?allwaXdDM3hWTjZuTEs4aC9SeUR1M2RudnJhYTB0S2ZKSnFQdU9RSjg2cHpv?=
 =?utf-8?B?WVFtWktKaDVTbUZkbUtFM0lBVlRlcmJqVTJHbnhTN2FaZlhjN2V4SGp2RTBj?=
 =?utf-8?B?aFlZT2I5RlpQTzJQQzE3UlZTZXg3UXdTYnI5K21QMkQ1WCtXeEc0aGtYR2ZO?=
 =?utf-8?B?WlhxMmRnZ3RFaWtqVXRsbXFPTldISGc0Q2o0ZDFtUVRKdkRYSmRWbFFKZEdz?=
 =?utf-8?B?Sjk4NXp5cWpkS1VGeSt1QWI3ZkFMdEFqYTNhRVBsYWxZWWpaRHJWNXcrUGpr?=
 =?utf-8?B?WGQyK0RBR05wU2I5VDJDRlVvdUxHMnNHSDA3YjNsVlVBV0tLaXV1S1Voc3c5?=
 =?utf-8?B?S2FYQ2lsdnMzZUZjUHcvK1NrOE9lV0VCRU1SUU9sZ1FrN2NVLzlPNW45aEhv?=
 =?utf-8?B?M0F2UGNwY3IwSWdEWE8yd0FBOEdxbWszNStVSk42R3RsS0dUSVA4V1FpeU5M?=
 =?utf-8?B?VWVTMW10dWt0MjVqSXhhSGFVL1EzTjI2NFBSQ05HVWpIZ01USHZpOFhQYWha?=
 =?utf-8?B?d0RoRmM3cmJFaHZwQ01sSElGTXN2bFhhVEJPSzdra3k1eXMrRkYvcEUvNlpK?=
 =?utf-8?B?YTlYb3R0WnB2L2lXOHkxUU1vdnlLUTh3LzRqNi9ram1jUWwrWE92TnAzTU1a?=
 =?utf-8?B?NFo4ZDFSYlU0R0tRbzdNRVhidXN2QWFNZ0lFc0ZmWG15NlkrWUpVMCtEYmE0?=
 =?utf-8?B?NDAxT1hhQVhDMmg2YUhlQ2xCV3IvMHlIN3NWVFp6RFIwT0V5eHd1UTZOZC9K?=
 =?utf-8?B?MXJQV0lxNGJsYWJnZ3ZYTFNQQTFyWk9hb3pqRlFXd1BhMitkTjltN0dSbFhE?=
 =?utf-8?B?MVJ5Y3Q2V05zUFB1WDRQdmZzaHFKS1ZGOWczTFZYSzlzeTRHNTY5VXo4NlEy?=
 =?utf-8?Q?Nazz79wdyx9h5f1HIXdUs7CK2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 185d3947-410a-4bb3-6787-08dbb062d78f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 11:57:57.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcGA13gq3Fz16Er1ocCby5z8NpwlZvZIxas/X2ZPpFO4YLLpurydCDJIzwCjuLg4m0WuQZSpquhkBZKLlCj5tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

On 08.09.2023 10:48, Nicola Vetrini wrote:
> On 07/09/2023 03:33, Stefano Stabellini wrote:
>> On Wed, 6 Sep 2023, Jan Beulich wrote:
>>> On 06.09.2023 17:57, Nicola Vetrini wrote:
>>>> On 05/09/2023 10:33, Jan Beulich wrote:
>>>>> On 05.09.2023 10:20, Nicola Vetrini wrote:
>>>>>> On 05/09/2023 09:46, Jan Beulich wrote:
>>>>>>> On 05.09.2023 09:31, Nicola Vetrini wrote:
>>>>>>>> Given its use in the declaration
>>>>>>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>>>>>>>> 'bits' has essential type 'enum iommu_feature', which is not
>>>>>>>> allowed by the Rule as an operand to the addition operator.
>>>>>>>> Given that its value can be represented by a signed integer,
>>>>>>>> the explicit cast resolves the violation.
>>>>>>>
>>>>>>> Wait - why would this lead to a change to BITS_TO_LONGS()? And if
>>>>>>> that
>>>>>>> was to be changed, why plain int? I don't think negative input makes
>>>>>>> sense there, and in principle I'd expect values beyond 4 billion to
>>>>>>> also be permissible (even if likely no such use will ever appear in a
>>>>>>> DECLARE_BITMAP(), but elsewhere it may make sense). Even going to
>>>>>>> "unsigned long" may be too limiting ...
>>>>>>>
>>>>>>
>>>>>> You have a point. I can think of doing it like this:
>>>>>> DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)
>>
>> I think this is a good solution for this case (even more so if we can't
>> find a better implementation of BITS_TO_LONGS)
>>
>>
>>>>>> on the grounds that the enum constant is representable in an int, and
>>>>>> it
>>>>>> does not seem likely
>>>>>> to get much bigger.
>>>>>> Having an unsigned cast requires making the whole expression
>>>>>> essentially unsigned, otherwise Rule 10.4 is violated because
>>>>>> BITS_PER_LONG is
>>>>>> essentially signed. This can be done, but it depends on how
>>>>>> BITS_TO_LONGS will be/is used.
>>>>>
>>>>> It'll need looking closely, yes, but I expect that actually wants to be
>>>>> an
>>>>> unsigned constant. I wouldn't be surprised if some use of
>>>>> DECLARE_BITMAP()
>>>>> appeared (or already existed) where the 2nd argument involves sizeof()
>>>>> in
>>>>> some way.
>>>>>
>>>>
>>>> I think there's one with ARRAY_SIZE. In my opinion this can be resolved
>>>> as follows:
>>>>
>>>> #define BYTES_PER_LONG (1U << LONG_BYTEORDER) // the essential type gets
>>>> from signed to unsigned
>>>>
>>>> #define BITS_TO_LONGS(bits) \
>>>>          (((unsigned long long)(bits)+BITS_PER_LONG-1U)/BITS_PER_LONG) //
>>>> same here
>>>
>>> Except, as said before, I consider any kind of cast on "bits" latently
>>> problematic.
>>
>> Can't we just do this (same but without the cast):
>>
>> #define BYTES_PER_LONG (1U << LONG_BYTEORDER)
>> #define BITS_TO_LONGS(bits) \
>>          (((bits)+BITS_PER_LONG-1U)/BITS_PER_LONG)
>>
>> Then we just need to make sure to pass an unsigned to BITS_TO_LONGS. In
>> the case above we would do:
>>
>> DECLARE_BITMAP(features, (unsigned int)IOMMU_FEAT_count)
> 
> There is a build error due to -Werror because of a pointer comparison at 
> line 469 of common/numa.c:
> i = min(PADDR_BITS, BITS_PER_LONG - 1);
> where
> #define PADDR_BITS              52
> 
> I guess PADDR_BITS can become unsigned or gain a cast

While generally converting constants to unsigned comes with a certain
risk, I think for this (and its siblings) this ought to be okay. As to
the alternative of a cast - before considering that, please consider
e.g. adding 0u (as we do elsewhere in the code base to deal with such
cases).

Jan

