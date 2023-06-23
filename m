Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C097373BD7E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 19:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554407.865572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCkIT-0008K5-Bn; Fri, 23 Jun 2023 17:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554407.865572; Fri, 23 Jun 2023 17:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCkIT-0008I8-92; Fri, 23 Jun 2023 17:10:09 +0000
Received: by outflank-mailman (input) for mailman id 554407;
 Fri, 23 Jun 2023 17:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCkIR-0008HG-V5
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 17:10:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc1d9d56-11e8-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 19:10:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 17:10:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 17:10:01 +0000
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
X-Inumbo-ID: cc1d9d56-11e8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjfD7HvlmjRLLQryktafD69HM6Dule1R5aJueee3FtmNGWik8qApM7ok4vu9GoTXcEtIUyraq+dEaOnKJkzzZem8Zt8KIiobAcadoKUqBSVWZEB6FIU0QtHz+ofqpp2/PGb1F4SR8ESUv5n+sTP0u6IpVOjYvYCnwA7FKyxIRigl48m+LUc+T3kX7KKFKhxOAGQUnh/a40JwKh+DMc+wTS6N50DelR1vdJ/zF03mxHrG4KumNPFAg/nVGzYju7npXrHVXQ7QE0H542CZDleMwT5LOg3t7EXHOz9bszEDfOIsuI54aeS7DtLiS9TyL89sh565jRcagZq+4KAr4LvfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbhS8Zds9r9rRC6Mx0XjAmWQAqyw6yDOD+2hQ2uY1UA=;
 b=kPgv7+bOMh5Y1rCpLHlU1Gh7uF1y+LAcyTKTXyIDx3qvmJljwJCdrRZrKa/nN+xusKGoutV+nUu/UmIR9HrFNYxlNnfzuaQO06GTTRJeyDNk8g36Z0mB+NG+4QnOLeH/X/Uu5VfMU1byiRGF0QqRBvjXcxJVGp6i9VbhP0g+nGm4iXiIcnuy/3zPFNYSf6NzVR+E2UHCPlfTlO2AQ4rjIsnVaiaFZwXu0gClwDMuK/fg73HWDwMkdmskNkIK1zjber4JiDzkbJOKA3tZa9PHFwOhN8hmWeOG4YBfmjGmzkZSnVDcs5n55S6pyrpWUS16xfINJ1tZWV4eZA0AdQ6fVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbhS8Zds9r9rRC6Mx0XjAmWQAqyw6yDOD+2hQ2uY1UA=;
 b=bAaUQ6RruUuhySVWQeXejLUVOLjISizSpDW8lH0o7sALXdrWSMvbTpvrZCpIsS1SYlfg/ux0eANcK7COwWfE/KI2t81KaKskuZbWPXvbwb/kEo65jyCzkuC6B3pD9c8n9Mb2BmdpzsT2kAoYM/VeHDGXk4lsKd4g010rp4jQ+dhXOJUnorCA31DF2ySD/+6sDr79NMCsx3bnbD+FObJ0uqShXyiDHfddTLHVWO0wWmQwYku1ujWjCNlriREFheBZMN1gjWsUCfwHpdlve4YIlbNJLgIoklLBEmlYRnz09ofYFHm/fdallZFdFmBRyTfvGQS3PPuSgDYL08vOLcSp9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <302c0bb9-79ee-f006-76a5-c0dedf60e278@suse.com>
Date: Fri, 23 Jun 2023 19:09:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <874jmyo7g8.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <874jmyo7g8.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0354.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: bb55503e-2a41-490e-2c20-08db740cae43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZpclAigJWxyED/790TgzM10AV+5hCV7Yf9nisbiJ4Z6SwSujAupPRVBp2Sf0Ziydb5u6c2HxncGmPaliuXkkpLgumIjaLKgZIX1xnyj2l5H3ryLO6nsGo1erNf4WiUQWMbMZyfcOTEXjtiq4jfnECIanObGQeyXcNk2j445aZ+ZnuhiyJ2wFi1vZJnPekH/yllZV1wJ2+feeoedwDAwuEWE1lPIB+q3Fn6vPYW6O66O7dD1bir1WBPXnsTpJoSbc8a6wV2MpgPbIKcwAAamjPMOeYzbEIdnQhCSwAaOLVDc1teru1n24nRUZYB2LBrYD9OPQkAk02xor39amGeA6+WvQgbyfoHW3nphqvVydJcUpzn87tXNu7B+0/93GLBAO/1Fz1JzDfM66R0PLgRehBHh4nFCzFYeY5pYExHfPH0NW8tPDwHLkQRxMD0d/zz4nB8KixSxNkePpPomEVxlqmGFg1W1Qi1joipPdVsf4+3scHBJOWHEHBQhQq6JG2uo9KRcACRgAtCYWRfyjSbe/XyyKQSkJxvWx/f2U4HesfZ/eciMc4svACryX7SPSEtpHTwKui2vKu37CUEviWi3CiFJ02sna6nVXdoqv/fTA1BifinDH41+iIWFnDf7qaZnbWo+zH3hP8BQWDXqR5evL/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(31686004)(478600001)(54906003)(4326008)(2616005)(83380400001)(36756003)(31696002)(86362001)(2906002)(6486002)(186003)(26005)(53546011)(6506007)(66946007)(6512007)(38100700002)(66556008)(66476007)(5660300002)(316002)(8936002)(41300700001)(6916009)(8676002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE40RFBLMXI3dWlYcGJLd3lHVHFKZ1owbFBHb2dGc3krR2RWNGJyOWRPbW1h?=
 =?utf-8?B?cFJPMkYzRlFqblltK0FiYlZSTUlXR3dDaEtiVGpidWRkRkI1bDJEdEt5d09t?=
 =?utf-8?B?S0toZVV6eGFvUjBMY2I2ZzZ0VTNqR3hFbllvbGhiQVNpbUUzVzV1ZGhNZCtu?=
 =?utf-8?B?OW5IUlY5ZGsrd1RESGxITThGNWJBZUp3L0pkSWZxV2t3QWs4UkUzTEo3VURk?=
 =?utf-8?B?VENKeFFDbTVFbVFLblhSQTBEci9vYzg3S1VnRVVXZmNSd3NkSUJINUlsb29O?=
 =?utf-8?B?WVNpL2RYQ2FVTklPZjhlSXlTdU1ITlFVek9hZzg4ZWVHK3hNdm5TVTFZNkJD?=
 =?utf-8?B?R0loT05nSnpUWG9nRlZROEZWWHVEVnkxQ240ZUh4RlUyQWJxUXc1aitLU0Jt?=
 =?utf-8?B?dnBDVm5YcmMxRmxNbDhMNUE3UmVpQ0YzdjRtY1hWaS8xQUpGYkRhSjdHUm90?=
 =?utf-8?B?bUtlS3I1T2ZOTkttNmtBbEZHRkY1NHpYM2thV3R2bVFMUFZnVDhwQUk3V25w?=
 =?utf-8?B?UG9Bb2dHWlI0d0JQaWRNQzI5Njh5REJ1YUhqdzZKQUFvWFJ3b2ppeGNMWjUw?=
 =?utf-8?B?ZlFFdXBPTlpkUFZndFpCSjV4cmVjT0htNWZ6RFRqSnhxc3V0bEVpcVBjWE9Q?=
 =?utf-8?B?eC9PMnpJaGdVb05wTlhCdFFjR29IMm1XYlh5enFFbW10Qjc4NzlkcDBSQTBM?=
 =?utf-8?B?ZDk0d0t0VWRqcUpwUXRXbEVsTDRLQms5bWE5bVgydVI5VzY2QmMxUGt5bXVa?=
 =?utf-8?B?MHh1VFU1NExaNHord2RNTTNWWTZLMzdlZXlVQS8vRUk3Y1NMUURqWEFmanRO?=
 =?utf-8?B?R3RsMHVwMjh5SWZ4a1BnYjR3L0N6VUZRUVIxYUpmL3poR1dFWm8zZ0gzQUJ2?=
 =?utf-8?B?RVJrNm9HWFhLcTF2TVN4ckF2NThFTmdYRFVldUJtZzhxTGNnNVlwQ1VSN3RQ?=
 =?utf-8?B?RC9jMkdwRHpsZ2xZZWt3SWF1SFFpeWpPc3dQc2Y1ME4zblZSd3RnSG1iaXhN?=
 =?utf-8?B?T2l2a3B5YzNKejFFM1UxbUxUdWJxUUdWL1lyY0ozYUExQUp4dlpEa2d6d3Qy?=
 =?utf-8?B?cDVVaVFiM2gzUmZzQlp6bFRHZk5yWjJYL040VWlyYit4d1RKZzFTbGlWdFJJ?=
 =?utf-8?B?ODdaSWxvZTRHTlVIWEdIc0lQT0VCWDdIZ2hYelVaT0J1WXg3ZGcrM2RKcFVV?=
 =?utf-8?B?NXA2cVFWTVBVRjErTUxiTW0yZVVyUjBIeVk5VXB5RTI4eVM4aDBucVNsaU1D?=
 =?utf-8?B?ZWl6S01PeVVPQjI1aXJGTEdhbzgzczgyZEQ2Qjl3dGV2dk1GV3Y4WlBvbGVx?=
 =?utf-8?B?QnZ6VFJ4bE9WeWdlR1dmOXVTR1h0czNuQmlYR0szK3I5Tm5DSmx5SGE1Rzht?=
 =?utf-8?B?dnlvazdoUENiUTFDRU9VU2pYYjVHVVV5Vks3am5UK2d5UnRLQ3ZEbnVYN3hu?=
 =?utf-8?B?TWgyd01YdWFHb1ZvTndvM0Rzb2hJWmlCWmVBZUQrUUlyNVBuTGJiRHlzVFlk?=
 =?utf-8?B?ak1POE9tODVSc0pCOGJQTFhHdmo5aWlCQVlYSlJtODhGb2RmR3N2VVNtMjA1?=
 =?utf-8?B?QnQ0RjJwQjRxQkcwR1AxZHFHK2Q2eS9GV2N6Q2V2TGhTaXQ0bmpkWUV2cXpH?=
 =?utf-8?B?bGpqaHJNZ2JqUFRYanhmT0Y3azMzL1V2UHIvaHRtKytQTnNzNXJOby90NWE5?=
 =?utf-8?B?WUtKTHVmTGFPODVVbEtnYUNpR1R2VE5jNklwcFpkaFpta01nRzlFWloyYVNn?=
 =?utf-8?B?UWhFVjJqZGRNcnFxNmNNZkhGMk96YjMvVFdWVGFjY0xocEE3MU04L2FsWko4?=
 =?utf-8?B?OSs5aURjcTJadHJLZTJ3TGZVazVwMThCS3QvM3kvOVlaNXh0Sm9GcHo5WkNY?=
 =?utf-8?B?ckVsb2F1dm9ZY2RLeUJ6UXk1N3FaWUVIZWlrWkZLMmMxMXdTblhUamduaG9X?=
 =?utf-8?B?N01rcm5rbVhsUVN4eUVEVG01QjB3LzJsMW8wU0w1T21XbWtLVk1maTVEeHIw?=
 =?utf-8?B?UVBaQXVqWlBnL3laUkpmZnUzYVVRTm5hSHhFaDlTMXc3N21UMlJRcjdLeWd2?=
 =?utf-8?B?dVNIblZvTUNEQ3RXdGphWm40aGtBaUFBK1RoV2hBYjJkODVwR1hTZHdOV05z?=
 =?utf-8?Q?O8oDQaY3nF2hqeH3m8XDroMto?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb55503e-2a41-490e-2c20-08db740cae43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 17:10:01.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZ4EQsC1IGbQkwnFtgI/dYi+OpFgpM7itrJTyBzjbvh5c1enlr69mw47gzfe3qI+kMCqmEIzaNdrjdXjwts8Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

On 23.06.2023 11:26, Volodymyr Babchuk wrote:
> Roger Pau Monné <roger.pau@citrix.com> writes:
>> On Thu, Jun 22, 2023 at 09:17:36PM +0000, Volodymyr Babchuk wrote:
>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>> On Wed, Jun 21, 2023 at 10:07:20PM +0000, Volodymyr Babchuk wrote:
>>>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>>>> I've made some comments below.
>>>>>
>>>>> Thank you for the review. I believe that it is a good idea to have a
>>>>> per-domain pdev_list lock. See my answers below.
>>>>
>>>> I think it's important that the lock that protects domain->pdev_list
>>>> must be the same that also protects pdev->vpci, or else you might run
>>>> into similar ABBA deadlock situations.
>>>>
>>>> The problem then could be that in vpci_{read,write} you will take the
>>>> per-domain pdev lock in read mode in order to get the pdev, and for
>>>> writes to the command register or the ROM BAR you would have to
>>>> upgrade such lock to a write lock without dropping it, and we don't
>>>> have such functionality for rw locks ATM.
>>>>
>>>> Maybe just re-starting the function knowing that the lock must be
>>>> taken in write mode would be a good solution: writes to the command
>>>> register will already be slow since they are likely to involve
>>>> modifications to the p2m.
>>>
>>> Looks like modify_bars() is the only cause for this extended lock. I
>>> know that this was discussed earlier, but can we rework modify_bars to
>>> not iterate over all the pdevs? We can store copy of all enabled BARs in
>>> a domain structure, protected by domain->vpci_lock. Something akin to
>>>
>>> struct vpci_bar {
>>>         list_head list;
>>>         struct vpci *vpci;
>>>         unsigned long start;
>>>         unsigned long end;
>>>         bool is_rom;
>>> };
>>
>> This IMO makes the logic more complicated, as each time a BAR is
>> updated we would have to change the cached address and size in two
>> different places.  It's also duplicated data that takes up memory, and
>> there are system with a non-trivial amount of PCI devices and thus
>> BARs to track.
>>
>> I think it's easier to just make the newly introduced per-domain
>> rwlock also protect the domain's pdev_list (unless I'm missing
>> something).  AFAICT it would also simplify locking, as such rwlock
>> protecting the domain->pdev_list will avoid you from having to take
>> the pcidevs lock in vpci_{read,write} in order to find the device the
>> access belongs to.
> 
> In my opinion, this will make the whole locking logic complex, because
> we will have one rwlock that protects:
> 
> 1. pdev->vpci
> 2. domain->pdev_list

The import thing at this stage is to get the granularity down from
the global pcidevs lock. What exactly is grouped together is
secondary for the moment; it needs writing down clearly in a code
comment, of course.

Just to be sure I recall things correctly: 1 above is covering
only the pointer, not the contents of the pointed to struct? If
so, I would agree putting both under the same lock is a little odd,
but if that limits lock nesting issues, I'd say so be it. If not,
then this lock could simply be declared as covering everything
PCI-ish that a domain has in use. Especially in the latter case ...

> This is a two semi-related things. I feel that this will be hard to
> understand for anyone who is not deeply intimate with the PCI
> code. Anyways, I want this patch series to get going, so I believe your
> judgment here. How should I name this lock? Taking into account, that
> scope is will be more broad, "domain->vpci_rwlock" does not seems as a
> good name.

... d->pci_lock would seem quite appropriate.

Jan

