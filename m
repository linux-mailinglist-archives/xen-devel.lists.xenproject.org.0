Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D517D9722
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 14:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624356.972870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwLXd-0001Bc-O7; Fri, 27 Oct 2023 12:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624356.972870; Fri, 27 Oct 2023 12:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwLXd-00018z-LR; Fri, 27 Oct 2023 12:02:17 +0000
Received: by outflank-mailman (input) for mailman id 624356;
 Fri, 27 Oct 2023 12:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qwLXc-00018r-Ev
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 12:02:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aab012a6-74c0-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 14:02:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9779.eurprd04.prod.outlook.com (2603:10a6:150:111::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Fri, 27 Oct
 2023 12:01:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Fri, 27 Oct 2023
 12:01:42 +0000
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
X-Inumbo-ID: aab012a6-74c0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRpIGXl2gkvoVGegMCmjREFjEEV1gXU+sUTnLYoF8gLbg/VQ1xpltv3co4VR27uZR5XLypCAtvUQVGfyBqlrwjKDrbXvenyBjtYops0wSrLQ9Dx+JrzhY6uJAdjkrj48v1J7KfltjhBmL2fwmeostUwSzZOxpeb8PVfrG/jE27SubMq15RieyXgNcms92zVyBOhJCy3Z0VxDXijSxv+WiuJbSzC2JihlvZPSVxzpVRfNKo+yJnyXoNJSi0kgPcKigOxBo6xUO9fC0slgkfj/MZUHvFVfmXusxtVGz8S7ilPyFGwzJ7AUUIRQ4ZRIi+gCWF8Gdj7CTkHfwmIotK32mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsU7jeeWvVCQy2eDHxlahJ2eaccKu+iNVXUXo9mKLaY=;
 b=Za5aWsdJCQpTZvbVtxySXNi0HkpFtKYCVFKZFEHzX8WT/otXU7nc9WUNTb3FYDl3sv7IdsMnPu+b3Caj7it9grZfMPDEpjCwNKOiM0+oCMtGQ6SavSDClWuw42r8BC73MbIoL1mG9QvAfWMznV2yBOmiEZie1Xyy+/t7C4Z1vZxShWT0lPIcdPoDqqSPhURftd0wvOB3vZOEko8BEpNqnEfGXUAntRrSiBqJUW7cUe7WEu69gpTA/O07r41ClMqMpmKunq1Y/ThDUduKQ4bS5QkraHPtReCVLwVKjNMuy/Qscu9/HJ5C0UqWWkXf0vUVgNLA0x3eMDub04OHL4tJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsU7jeeWvVCQy2eDHxlahJ2eaccKu+iNVXUXo9mKLaY=;
 b=CDPfe6cvt/z+70i+4uOoRfrejH+V9zDowqjZzpL/xD04tUcZYJf/t+0+GGKtmSWu4yEBYjJAQXbQyrykMp+T+C+5Gvozq/9j3oxlBzYbuZK3hQzGqnkZndqAn2QWOVC5EfuY9CilcpM/k+ociH516NeGSK8eCBUXQYCdfcLYPTijcyIpfc5+Fd9KuqNyoCUgPHTBl8EaEb9zmE35/jA7k0LDkqhAERbr9PN/3ciCCjB6+UAvyWV8NfP8CGF/hqoB+89bRV/oKuJdSTLDKMjlTvB+aIRNdHt9L9VOyWMzGwZZ76PJEZE69jmHtp78ISxf3SY2UFywiGIBQEgV0b65Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <486c778c-4a33-703f-2811-27101d10ea9b@suse.com>
Date: Fri, 27 Oct 2023 14:01:40 +0200
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
 <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
 <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
 <08ea1b7b-c85f-337a-42c4-520e40b75288@suse.com>
 <987b5b7d-57f8-4d63-bd13-fe662b6cb87f@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <987b5b7d-57f8-4d63-bd13-fe662b6cb87f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 35749d1e-0dd4-4549-4367-08dbd6e47c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZBz4jntoD823ccmardXWvjYstEEwKhh/lUpetIh5k4SGcRcqoVTLfRbRSZqFfGr2blfE0ghmykQTdNMYJJoALsqU1sQaFXr3E6GMegjrjUykGhdgjo9pOzQqszkEOXkKOzUIbqpEkRoylwJujttGM36l31eoK8hH83ZNkvVe640ByIR9/HDraqVCKOFlS1LbwCaAftPMlyenKajApGksYIbQMbXdGT3l4nUFRBZEYyw5T1ewEFej7+PROgqqmScjbxurrdApfF4vE0DPIaDtdBzT2faRwyRLEHPer1dwQFLRNt6gyosFElqGuQJBJHzTlo5WZ3F6Gkl7shmOYx94DI/sf/aZfjWpqvCIpzWEPogd3JSowFGWYwfkfyFmIt7OjMNrpK8f3P4PAeUEA/QW/wTCjug0oJMbMSm0z6OdiMv6hhKUwlZrGtjcx0Nfu0e9VLA9VW5Gn/JudiBPuc9K7PAUPocs3YrZfNmgaEoxLIHQYyj3OSnz84Br82teTaFz+FKr2zX2SqFQNjB0Z0L8k+hXAjtBDsP4AmmxdT8vpoyyGfkS2SL30DVPec7lSsakXbF0rl9sch7vNRaE21pRKrJrmi7rD+/509jcBN5ZBu0+t98IMFkaOrMeJm60vBgQVuAVz0728MZyNDbEV9vTFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(31686004)(8936002)(8676002)(66946007)(316002)(66476007)(66556008)(6916009)(54906003)(4326008)(26005)(66899024)(86362001)(83380400001)(31696002)(2616005)(478600001)(5660300002)(6486002)(6506007)(53546011)(41300700001)(2906002)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVTV3RTSUlMa211ellidlk4N3hHMDVRYTVSQWdHSWhJZVk1cHdkeEk0WG5k?=
 =?utf-8?B?TkErRm40K1JKTitaazl1dENlVDhyT0Yza0dRYXJFTUZHT2U0RG1tRWZDMlky?=
 =?utf-8?B?alRtMVpncGVQeldlYUIxWDVZeW9UUkRzSXZpdGppbFloNXE4U2tGcTJjWEZ6?=
 =?utf-8?B?dXl0dkZDa1NBL2lsbTFCSmNjTXpwSnVqMXJLaGIzVGJhcktsdGptbVVpVCts?=
 =?utf-8?B?cTVobzlpT2prYlhwSWZiRml4WVZEVjh3QUFvSnVkekc5MW01RWNld3N3Qy82?=
 =?utf-8?B?VllYcW5zTTFmd2N4WVFBUUNSUStYQlJiakgrcDI2T0hleTFhNW50Mlk2NEo0?=
 =?utf-8?B?NC9JZTNNNjU3NFRIQ0FnaGRrNEF6VVBpSk9RWjRoMDdlNVVKSWFTQklIcUNO?=
 =?utf-8?B?ZFJZM0NDNDE0aEl4K1JuUkVPQTJySVlPQlRxaVFlUndidUhaWjdiMDNwSEZM?=
 =?utf-8?B?VDlRdks2d1MveG1VbWdlTXFBdGhwU2R2Nm9yNkQ0Vm9DRS9rSlllVTNUUVpK?=
 =?utf-8?B?R2U4VldtbXBDRTQxdTlMTDY0T2pBblJLQmV4bUhBa2dQRE9sTDdEdUM0WUh1?=
 =?utf-8?B?QU1zSXBjKzVKSVVzWXpmUUVVdEVSaHZCcHJTWjJnRjl6UnZxazhIRUh6N0xJ?=
 =?utf-8?B?cjg5MTJHS0tiQkUvbDM0cjJRUWo2QVBEVTh3NzEzVktXeUpMc1dkdUZoWUpj?=
 =?utf-8?B?bTh1Z0lvNmNDRm5Wb3VkRzRnUWJqZWF6bFVJSnZVUC82QXhZaEwyOCtxbWhs?=
 =?utf-8?B?d0orQ1QwNGdNbUZlMHF3MjU5YlhKTnFGd0dueFRGa3FST21IelljaTlteGkx?=
 =?utf-8?B?WFZSY3Ezc2drWmhXNnVqK2lKbnhnQm1STFp0MlY5YTczNnBHNXZUdVdFaE1U?=
 =?utf-8?B?SVZrajlmcE9QOElTdlJZdzQzYlozeW9wTGlPYW4vOE0rWURBT1hBbVVxK1N0?=
 =?utf-8?B?aUhydHhreS85QWdDTmp2SUNpYzhJdFFHeTVab25ONkt6OVBmdkZGWS9TYVUz?=
 =?utf-8?B?cW5zQ2orUzc4cFZHZ2p5VG53NnEzbk1rUmN0RzdTWmJlV1RmUFRJUGU2Z2tx?=
 =?utf-8?B?dXp0TlRYYlY3clA2UmdPdUhBR08zQWd1VmkzNGlia1JyaDRTZjFocUt1N1Vp?=
 =?utf-8?B?V3VrQllKc1dyK3dnOFRMNTAvdFFHQkFHNjZ4RDF1akg3ZDlGeHRadmdIdEZn?=
 =?utf-8?B?VlZhS2hkOE1aYUNtcTV5cTl1QVhKczNWSnVkZ3NDeTRqQ2RpR3ZIdm9nWVJr?=
 =?utf-8?B?R2dUOStrakNCckVhdmE1TGZ1NU5DNVphc3ExMHBBK0VFNWF5ZTlHVDQ0Rmt1?=
 =?utf-8?B?WkQ1d3E2QngybmNqWWM1MXhQL296b01CeWwxUGMvWmpWSmJQUFVUa0ozMEJG?=
 =?utf-8?B?ZDJhYy9tTEFGRXdrTGl1S04veWpTL2dBdS9MY2dDZWRLcWU1N0duMmtPb3M0?=
 =?utf-8?B?RThTNnBpTTNGUGU4MjZ0eFJRUzN1NThFSk5IQkVTVjZrcU5WMlU5eUEvcmY1?=
 =?utf-8?B?RGY2V3BWeUpDTXF0akNncktOdFpiOGg2OHhMYnB4L21HdXkxczN0ZUx2b0Jo?=
 =?utf-8?B?ZTE0VXFxOHRhUmZ0a3FLWkdBV2VWYWhFNWFSUncrUDZhRHpzRlZOU1J1bEt3?=
 =?utf-8?B?R0w2UGlYNEdNTUlIbEJNTjdwK0tqRFFDbmVIK2pIZVRrcFdCSUF0VS9oNEEv?=
 =?utf-8?B?a08zRXdPajlxRXJFK3dIaktvaisrSE1aQ2wxK0JNSlhOUEZSaUlrLzB5VW5R?=
 =?utf-8?B?M3F3QVZzYXo4S2Vhc3hXZmpTbTZtT0RPbmNZbjV2dWp5QnBObUFoY2VhdVho?=
 =?utf-8?B?QzczbjBjbWJqYUp0Mzlwc0tBR1RtL3FJRnMxL05qQitZK1dvZmxNQWI5OTIz?=
 =?utf-8?B?UEI2TVExaytPVkFpU3FMYVdLQW8yKzVyaW1xVkxlV01QVUZod3RzMm5ORW8w?=
 =?utf-8?B?SUVRZlNYclM4RHlRS2xJV2tDM2tFenlCMDlBdzFlMzR3VFZvSEFqa3hpMGZw?=
 =?utf-8?B?ZGNvR0Q5V1F2M2NYRDhYc0lhZGFVVHorcHJBTFBaMDkxdTRENmVZcUZIQnZk?=
 =?utf-8?B?VjFOYWtQZjhsbDJYUlBpbVBkVlFiL0I2QkZiY3orbERjVno0SmVXNTRaUDh3?=
 =?utf-8?Q?wjv2CzN5NWyrbFqzyCXuWJjH/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35749d1e-0dd4-4549-4367-08dbd6e47c06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 12:01:42.7526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9lTOovn+JQ9APHbNb3wQYxe2pMDdZrzSwoBB+myYl3oBrT6e/BHuzPPkvL4FDv1cn7sWlzYgIq+SKKkXJwqWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9779

On 27.10.2023 13:18, Xenia Ragiadakou wrote:
> 
> On 27/10/23 09:37, Jan Beulich wrote:
>> On 26.10.2023 18:55, Xenia Ragiadakou wrote:
>>>
>>>
>>> On 26/10/23 17:55, Jan Beulich wrote:
>>>> On 26.10.2023 15:58, Xenia Ragiadakou wrote:
>>>>>
>>>>> On 26/10/23 15:37, Jan Beulich wrote:
>>>>>> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 26/10/23 14:51, Jan Beulich wrote:
>>>>>>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>>>>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>>>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>>>>>>                if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>>>>>>                    ; /* No overlap, nothing to do. */
>>>>>>>>>>>>>                /* Deal with the kernel already being loaded in the region. */
>>>>>>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>>>>>>> "kernel range fully contained") to use
>>>>>>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>>>>>>         if the kernel range is fully contained,
>>>>>>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>>>>>>> - the head of the range when the overlap is at the end.
>>>>>>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>>>>>>> the first condition failing.
>>>>>>>>>>>
>>>>>>>>>>> Both cases:
>>>>>>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>>>>>>> (kernel_start - start > end - kernel_end)
>>>>>>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>>>>>>
>>>>>>>>>>> And both the cases:
>>>>>>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>>>>>>> (end - kernel_end > kernel_start - start)
>>>>>>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>>>>>>
>>>>>>>>>>> ... unless of course I miss a case
>>>>>>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>>>>>>> original expression and your replacement are identical anyway. But
>>>>>>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>>>>>>> (theoretical only at this point) risk with the replacement expression
>>>>>>>>>> as well. As a result I still think that ...
>>>>>>>>>>
>>>>>>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>>>>>>> ... this alternative approach may want considering (provided we need
>>>>>>>>>> to make a change in the first place, which I continue to be
>>>>>>>>>> unconvinced of).
>>>>>>>>> Hmm, I see your point regarding the overflow.
>>>>>>>>> Given that start < kernel_end and end > kernel_start, this could
>>>>>>>>> be resolved by changing the above condition into:
>>>>>>>>> if ( kernel_end - start > end - kernel_start )
>>>>>>>>>
>>>>>>>>> Would that work for you?
>>>>>>>>
>>>>>>>> That would look quite a bit more natural, yes. But I don't think it covers
>>>>>>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>>>>>>> If we consider kernel range crossing E820 region boundaries, we also need
>>>>>>>> to take that possibility into account, I think.
>>>>>>>
>>>>>>> You are right, this case is not handled and can lead to either of the
>>>>>>> issues mentioned in commit message.
>>>>>>> Maybe we should check whether end > start before proceeding with
>>>>>>> checking the size.
>>>>>>
>>>>>> It looks like it all boils down to the alternative I did sketch out.
>>>>>
>>>>> I 'm not sure I fully understood the alternative.
>>>>> Do you mean sth in the lines below?
>>>>>
>>>>>             if ( end <= kernel_start || start >= kernel_end )
>>>>>                 ; /* No overlap, nothing to do. */
>>>>>             /* Deal with the kernel already being loaded in the region. */
>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>> +        else if ( start < kernel_start && end > kernel_end ) {
>>>>> +            if ( kernel_start - start > end - kernel_end )
>>>>> +                end = kernel_start;
>>>>> +            else
>>>>> +                start = kernel_end;
>>>>> +        }
>>>>> +        else if ( start < kernel_start )
>>>>>                 end = kernel_start;
>>>>> -        else
>>>>> +        else if ( end > kernel_end )
>>>>>                 start = kernel_end;
>>>>> +        else
>>>>> +            continue;
>>>>>
>>>>>             if ( end - start >= size )
>>>>>                 return start;
>>>>
>>>> Not exactly, no, because this still takes the size into account only
>>>> in this final if().
>>>>
>>>>> You wouldn't like to consider this approach?
>>>>
>>>> I'm happy to consider any other approach. Just that ...
>>>>
>>>>>             if ( end <= kernel_start || start >= kernel_end )
>>>>>                 ; /* No overlap, nothing to do. */
>>>>>             /* Deal with the kernel already being loaded in the region. */
>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>> +        else if ( kernel_end - start > end - kernel_start )
>>>>>                 end = kernel_start;
>>>>>             else
>>>>>                 start = kernel_end;
>>>>>
>>>>> -        if ( end - start >= size )
>>>>> +        if ( end > start && end - start >= size )
>>>>>                 return start;
>>>>>         }
>>>>
>>>> ... I'm afraid this doesn't deal well with the specific case I was
>>>> mentioning: If the E820 region is fully contained in the kernel range,
>>>> it looks to me as if this approach would ignore the E820 altogether,
>>>> since you either move end ahead of start or start past end then. Both
>>>> head and tail regions may be large enough in this case, and if this
>>>> was the only region above 1M, there'd be no other space to fall back
>>>> to.
>>>
>>> Yes, in which case it will fail. This is legitimate.
>>
>> Not really, if there is space available (but just not properly used).
> 
> I said so because I noticed that, if, for instance, the loading address 
> conflicts with a reserved memory region, xen won't attempt to relocate 
> the kernel (assuming that it is relocatable). It will fail.

Hmm, if so, perhaps yet something else to deal with.

>>> Currently, the code proceeds with the dom0 kernel being corrupted.
>>
>> And we agree that this wants fixing.
> 
> Ok, and IIUC, using rangeset as per Roger's suggestion, right?

Going that route would be optimal of course, but I for one wouldn't
insist.

Jan

