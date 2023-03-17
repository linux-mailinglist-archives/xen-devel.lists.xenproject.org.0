Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B86BEBE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 15:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511142.790039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBUl-0003yi-W1; Fri, 17 Mar 2023 14:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511142.790039; Fri, 17 Mar 2023 14:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBUl-0003wH-Se; Fri, 17 Mar 2023 14:55:51 +0000
Received: by outflank-mailman (input) for mailman id 511142;
 Fri, 17 Mar 2023 14:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pdBUk-0003w7-EW
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:55:50 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe12::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd36a790-c4d3-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 15:55:48 +0100 (CET)
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com (2603:10a6:10:10a::28)
 by PAXPR04MB8734.eurprd04.prod.outlook.com (2603:10a6:102:21e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 14:55:46 +0000
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498]) by DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:55:46 +0000
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
X-Inumbo-ID: cd36a790-c4d3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk7wezAygK2qG/AUsEBVulL+jzWiI9esMuoBemtvAP0sydAZNqFsdk78+niX3YlUjc1bcrcudVsZl/e2QIpcJni7hU4ufor62RII0OMQrUsE/72/uxvyAQG+UMRfx6GetSTaQDJDEsep9hkCpY3eIQdelDGmh5vXCVp1GQwErTKpbFV76S+qORX0M3ZV4GLSmpt5OM+XaQH1P+zX6ZD/5r+Xb3ff0yMe+eEqvjQLKaJjK3FxoIVKVW6yzB0mgjobPvuEj9dqr0GQ5E96YQVtEehrn0W2BQJ/8T/b0hcnIfhSAkRF9tvpmVwmJ+b+PFimfUqAn9UuOcQhsOkDK17Q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0VNVGTLxzGg/7HH36BakSv3iCp0+VG1KJ87OsG0u7U=;
 b=O7Uh5W5QCpcyDaGKBlNIW6Blz+q2H6zqlL8eK5Zz6+rqSNTXQHCBtaILcD5Qg769r4k1PbU71frzlJ7FcmYw7bLjXd9HKxGjYKF6m2m41M3a02ElQ3V4QeYCL0NzgxCGydZN2vKhXnjFjjOjgnibxJDi6PYXYG3YIXGvx/Nzo7l8CyuNEiYeXCzMqsXM1x8NoWrZfS5VDtcJbp8Ft6ycvH1pnUTojZ65udj+NAKx+ChHyoD5YdN4NKd9vGHD6YriU0ojQ5LUUMDSagB0N48hAnneSOBnxeqjgoeAbxreOcWvoaaXl0ejaYN6aYnJfP5h3CAN7FBg/Z+fRXwJik1odw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0VNVGTLxzGg/7HH36BakSv3iCp0+VG1KJ87OsG0u7U=;
 b=lc7PJV1uwGE6Uq4+ZIAVqJLiSk607BgSk+dg9OTpREvXBYvvUhAWp6JhsCF5iToRrQNmbAL2JxbioaYUTYcLLTcLhOce8XYRyACeCEP6zwAFC7iHI9EfP8ud00AT5KRHFf9JCyeZ2NAb1lS/EUq/eFGf2mghjezGE3UTmVCn68a9xG3BHEMLaV7Z8XLBJEfKolSpcpSr3p4TRCZSsqEBIlCqg7QexfgJF1NWX19/RPxd3efRNZw4VjRboq+JHyD3G6bZKS5YBn22ZmXC48lKge7O/wdILbZw9+EEfuAbslLvT6mhf8/SeAX3QV+2qSAJE3lS6/OXbi5LANpINrU4lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44a0aa6c-41ae-a9da-3c73-67c4d8e5eff9@suse.com>
Date: Fri, 17 Mar 2023 15:55:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230316102635.6497-1-michal.orzel@amd.com>
 <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
 <alpine.DEB.2.22.394.2303161559250.3359@ubuntu-linux-20-04-desktop>
 <02d111e0-000b-ff82-9483-6301c18e5172@suse.com>
 <875eea95-a9b2-656d-b182-1a48cf557a9b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <875eea95-a9b2-656d-b182-1a48cf557a9b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To DB8PR04MB6554.eurprd04.prod.outlook.com
 (2603:10a6:10:10a::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6554:EE_|PAXPR04MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a2dfd3-4cc3-4183-844c-08db26f7b0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	osYkZn8PcrdErBp2fetOMegFXm6vzRBMUg6fHvbOx77AVGGv9tcQSycje/svEf8Ye5xZjDfsUTF5paTp4YjYsgKK7wU0ky45g/SsktzHjri4xQKlvsLkWaoOIvr48flxIyyuvTtXwvpPZxRBZFOrY1yquMIWXV0jp4tN++oFB6TWDoak0emOgjjmYuH1mYUadhCsssou2oFBZ4yX0jRJexs2M48+35pvPYRfR9PxNcg9swA7aaudJl/qRJGSyE/yh8GcLtLJx0onG2N/HQRxYpHpOHsV8EUc5F11XLuc4/t4SnIDIygAie7QUY9KE1hnf5BX4gzrW0fY7JunTr4yWDQzmkNfZlfJc4g3GL1XT/tdNwGuibVxY0HUTjiuFqNGBsXpy4vIy0LT5jM99dI7LVwZq+AwkIJGbP+WUTy2QWH/j5n69dRHOuWD+oEs4W5dFYlfqR1iCF3JtsaCc3kNwKWGhvHBJJ738rJEGXEjGlEHPtsGUABZN1q5Q9Ax07/HEGGfVyMTKczJuhHMB/OkfI7pZrg1R4KxAVKyZXunmYN8QkhtDAq3ExBy2FnUXxzwfvtq0BpXOp3XjOmzdCc/CDhdNVbXa+QNMcCYg+BS1obCA4Vk1DZ3IbNr15aLdKpa7qAWB4PHP95ApFZHfNBot+vBqWEhwKrOKm6/1Bx34keFxJL7GOk75vYbmBbmmUskrkogXpcBZsbdndq1uKd0AqYyi67HC6iydzS5txYvw+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6554.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199018)(316002)(38100700002)(2906002)(478600001)(36756003)(54906003)(4326008)(8936002)(5660300002)(41300700001)(66476007)(66946007)(66556008)(8676002)(6916009)(31696002)(83380400001)(86362001)(31686004)(186003)(2616005)(53546011)(6512007)(6506007)(26005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxqWEVuVC9NUDBycjM3Sm1nWFJQQmVGTTk4VlRnL3pzd1l5dVRCWEU5U0lU?=
 =?utf-8?B?VzhsNW9ZK1lNYUNsUzJIcDZqRURET0ppN1o5K0RsbFIzTldMQzlLOUo4Y1Az?=
 =?utf-8?B?UGpOOG9ONEltQytSTGRaS042b29DejI3dzZtdlFMNGIydG1YTzZxM1lpUG5h?=
 =?utf-8?B?SWNyVTNsc1dpU1hERjhnMUpzbzVhR21QZyt2QWFybXNPOURYdjdYMUZDWitX?=
 =?utf-8?B?YU9qUUJFV2gvVnFLajlsUWZzVUxNWTZpeWx6TUNKQnFLRkpUZ3pjSE1TbVdB?=
 =?utf-8?B?bytlVnU2R29EVHk5ZHQxL0RXNUZ5VklRVzJOcVp4V0JqbkFMdjJrOFJzQ3FE?=
 =?utf-8?B?dzBqY3BFL2FIWWpUaStSVWcxZS9KMkxBTklEK2xVY1VHakdVcXdocWZ2VUlT?=
 =?utf-8?B?OTFsUmZodWREMGg3d3gzQXJCRWYrL2F2d3hWU2ZzalhmYlgrRk1zZXZkME9y?=
 =?utf-8?B?RHZXWDMwaHdINXh2TzFKS2VKV09lV1BROEZSMUdrSkx6NnQxdWVGdUs5c2Zv?=
 =?utf-8?B?cGxFajBkcUZ0eWg4OXNSeVFsSFRRdXZ0S2FoVDYzZXRldUdKSm0wTDNWMmFS?=
 =?utf-8?B?c0pSTTVQRzlyU3lRc2ZJM3F5SXllckh0MnQvaXJ3VEVETlhGUDFieXMyYmNS?=
 =?utf-8?B?dlBCMHFWWmRPYTlkWEJrajBHZi82Um5vdVNRbWVjUzVDWFgvOVI3T2VCbGE4?=
 =?utf-8?B?NlRLT0d1QWVrcUxaVERUUW9sMHI4L2t1TjF0aWtyNWpTZ1I2M0hIL3Y2Y1pV?=
 =?utf-8?B?L3FSV09acmV1Y2xkUXhUeTNHTHJoT28xMUNXek4rcjZwNVRpaHhlb1J5MWw3?=
 =?utf-8?B?T21WUU5aT3FDdFZzUmlta3dUd1ZveCsxK1lkZHdYWUk1aTNHTXp4K0RrQkNv?=
 =?utf-8?B?aGV5blBCTXJJMUpUcmtsQVpyL2NwNUVkWk9lWlN6Z05RRVAxNjFISlBMSkVF?=
 =?utf-8?B?aHdIcTVnaWxBbTlEZjlUcGRiTE9BQjBmMFRXOGU4aEdwb2JicHFqdnVWNG9i?=
 =?utf-8?B?bnVEU0VZa2dCMklFbUpMbjVGYTQzNlFlSi9WQ0tTTU9iVmlDZEhKYUZwQ3RR?=
 =?utf-8?B?NFREYVNsTlBJbkw1THNnTE1mWEFqcDdJVVZhem1yY1I0QSt0cWc0aDkzY1F0?=
 =?utf-8?B?SGxrcDR1V0lUdTcrdmpHMFlVa0ZQM3BlQkRHQUViTXR4L0pRZUtzcWdrZUFr?=
 =?utf-8?B?T0FDN1hHRVVLbUo3c2VHUEVUaUZaWXpiYUlKTGZWVlFveWN1M29OSy9BN2JI?=
 =?utf-8?B?Ti9pdG92bStXUTBLa01qZVFyZVp0TCtoa1Joa3NIanpsOENUL0RkS044SVNs?=
 =?utf-8?B?cXVkY2pDWis1U0Y2WWI1VUYxSWt5a2xMNlhQakxjWEo5Mk90R1RrWmlYbVFs?=
 =?utf-8?B?ejY0Zmc3NVBXZk9xWHYxU1BadVQ0QkIxUjgwdnJGd01QRExpdXR1M2RVRnF0?=
 =?utf-8?B?SElHanF2R1FrVGowSmw1SzZlZ0p2Y2VJRXg4b0tVQjZmUzhCWlBOa21BazYx?=
 =?utf-8?B?dWJNTENuVjhsNVM5U3BqcWNGS3FsdjFNZEhicFVXbTArQ2JZUWdqeHlyb3JX?=
 =?utf-8?B?bXE1NFhlUVFSckliNC9NcTB2QzYxQjNmQXAyWUpoTWVkL2NJYU5YNU5qMWhL?=
 =?utf-8?B?cmxkempUZmhUb1F1aDRBdE8rYk83S3M4VFM2aTlvWVNwckxaODZiUy93REJl?=
 =?utf-8?B?N3Q1RmQ1WUx5cDVOazZOSGN5QkV3eUJyZ0NVY3h2dSsxd291cHIxb05VRUhG?=
 =?utf-8?B?Tmw1L3VoM20xVVhXaDBic0NIQkRKa2RHeG9keEhjcmx1dlltTHNndkd5QmRF?=
 =?utf-8?B?NUZHN1hYRk55alNsRHNBNzE1VVBwUTNUcWpSMWdGYjkvdkNjbVdzRDVHZjZO?=
 =?utf-8?B?b2FqTDBwcmNZOUU2aERLV0lOSktKdXpMZm40dW8va25qaGEydkZiVGxneUhE?=
 =?utf-8?B?dmljTEptRE5QbzdvL0I1eTBHUG5pY2I2YWpIUmRDeVNJL2Z1RjFDTHdnSHdw?=
 =?utf-8?B?dHdEWEJzczFCTXpRUUJPZmdEWWlndWpQRllUanhhVXhYcWQzaFpxaXlDQktZ?=
 =?utf-8?B?Z1dPMWd1Nm1vQjg5Uk5zOThBYU9TdS9KbEtRUjhwNm1oRXFVdy82alRIa05n?=
 =?utf-8?Q?XJw/x3QfEV01MWF9AKdDw2bED?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a2dfd3-4cc3-4183-844c-08db26f7b0a4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6554.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 14:55:46.6969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isyx/ZKGOFBO5AYX8EzdyKG02inL8T512KEdW7lrO5x4LyHvTM5gwuZ6LgwAWllD2N5OYq8QNq1LLEjqYVaC+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8734

On 17.03.2023 10:32, Michal Orzel wrote:
> 
> 
> On 17/03/2023 09:36, Jan Beulich wrote:
>>
>>
>> On 16.03.2023 23:59, Stefano Stabellini wrote:
>>> On Thu, 16 Mar 2023, Jan Beulich wrote:
>>>> On 16.03.2023 11:26, Michal Orzel wrote:
>>>>> --- a/xen/drivers/char/console.c
>>>>> +++ b/xen/drivers/char/console.c
>>>>> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
>>>>>      }
>>>>>      else
>>>>>      {
>>>>> -        console_rx++;
>>>>> +        unsigned int next_rx = console_rx + 1;
>>>>> +
>>>>> +        /* Skip switching serial input to non existing domains */
>>>>> +        while ( next_rx < max_init_domid + 1 )
>>>>> +        {
>>>>> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>>>>> +
>>>>> +            if ( d )
>>>>> +            {
>>>>> +                rcu_unlock_domain(d);
>>>>> +                break;
>>>>> +            }
>>>>> +
>>>>> +            next_rx++;
>>>>> +        }
>>>>> +
>>>>> +        console_rx = next_rx;
>>>>> +
>>>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>>>      }
>>>>
>>>> While at the first glance (when you sent it in reply to v1) it looked okay,
>>>> I'm afraid it really isn't: Please consider what happens when the last of
>>>> the DomU-s doesn't exist anymore. (You don't really check whether it still
>>>> exists, because the range check comes ahead of the existence one.) In that
>>>> case you want to move from second-to-last to Xen. I expect the entire
>>>> if/else construct wants to be inside the loop.
>>>
>>> I don't think we need another loop, just a check if we found a domain or
>>
>> I didn't say "another loop", but I suggested that the loop needs to be
>> around the if/else. Of course this can be transformed into equivalent
>> forms, like ...
>>
>>> not. E.g.:
>>>
>>>
>>>     unsigned int next_rx = console_rx + 1;
>>>
>>>     /* Skip switching serial input to non existing domains */
>>>     while ( next_rx < max_init_domid + 1 )
>>>     {
>>>         struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>>>
>>>         if ( d )
>>>         {
>>>             rcu_unlock_domain(d);
>>>             console_rx = next_rx;
>>>             printk("*** Serial input to DOM%d", console_rx - 1);
>>>             break;
>>>         }
>>>
>>>         next_rx++;
>>>     }
>>>
>>>     /* no domain found */
>>>     console_rx = 0;
>>>     printk("*** Serial input to Xen");
>>
>> ... what you suggest (or at least almost, because the way it's written
>> we'd always switch to Xen).
> 
> I would prefer a loop with if/else inside. If you are ok with the following code
> that handles all the cases, I will push a patch in a minute:

Looks roughly okay, but recall I said so also when you "pre-posted" the
previous version.

Jan

