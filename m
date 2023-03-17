Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC56BE3C6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510926.789504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5ZM-0003de-KI; Fri, 17 Mar 2023 08:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510926.789504; Fri, 17 Mar 2023 08:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5ZM-0003ak-Gb; Fri, 17 Mar 2023 08:36:12 +0000
Received: by outflank-mailman (input) for mailman id 510926;
 Fri, 17 Mar 2023 08:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pd5ZK-0003ae-Sk
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:36:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c193212e-c49e-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 09:36:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7486.eurprd04.prod.outlook.com (2603:10a6:800:1b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:36:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 08:36:03 +0000
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
X-Inumbo-ID: c193212e-c49e-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvLDgmJ6Fvr0v1qjkk0yh9Mog3PLgC4vCRH8ffWwrIKjjh08dXicWiUImD9OX74TUXN0vCall5A+f9Dwd88R+aP8pux3lSV9EcXgt15+9TBNIXZ4Zx6YmS41gM0N08jU6mKO352Yv4Ru2z5YBH2WVdY3eucGDtw0CNZ9ibEqeu3QFhvagxZIJ+nLThmQ5NYSHpAko9JwB7VShYQlQHxN+9JeEWG3RvxEZCseZLmD0FMAd23mBnYJQ7yQ4xh49Q/mZw0wb3p7Sn17fxJOwY4gSZRzn1JM3qdUCnhMQoHCF2vNIvq3s2UWqT0YFsLWIuasJevBZXf/tH/nD6KGH8y6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVfivTb6ESZPZFA4yEzEv6+i/Vdza1OGnc4z3izec7g=;
 b=GN05g5VcI/og18/9uHCx/SVHNyQwF/lfIZogidYtIugU8ZF0hWb++sVYdzrgnstbSOxaq8+wOk90/WRH1zG/YTcHK2ZeTQ9iAB7X1xgb2VJAWLbhsqT8SDpaaMUl+TbLzwClLDgBzaIaeKGh4H/oDh5+nHAzaZWj/EFZIGFVnE9a+gXnaG6+n/w1ks/tUIZ6ySwIUDm098GAHkhx5dwxzePdzCPDBcncgQBOLYjkqJuKlo3ruXCEAebFSYARzrK/LFYSmmiSUbcI7/jmJSLV/BXEMlHdEbsKcSYI4i7Iu3R78NZXgaVGzoKpBs7AUZN/gpElXFZs63P35lBdLVWlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVfivTb6ESZPZFA4yEzEv6+i/Vdza1OGnc4z3izec7g=;
 b=SwzpUkHM7MYAlGUmXBQsjyR6diU/E3Wy2gVKCOUFnn5tZwcvqJ09viW3tw29YhiPX66prwuWPmnk6T8iP+hWV6b8/HaF/iq/g/25M3SOQSceQTFtTyO7+bjoyMqJMWNH5OgmAVlgye9Q5HXmWWliUJVi/yEOe0+q0dW/Rm3VrZOMe0CbSBmbx5ATVGHhFhfgnLX93CZsOQZDTGCHTfu/Wl4OokNLZoNFh+lzQMnDjYuha51hHxxO1X0g5DXBunGqJiHFBcL1UuDHkp8MdhiGtwng4/Ddas+qHblTHvTS5M7zTvetYePnUrDXcZhGfuqcdcYi1hzYCE+HZsojVQfbIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02d111e0-000b-ff82-9483-6301c18e5172@suse.com>
Date: Fri, 17 Mar 2023 09:36:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230316102635.6497-1-michal.orzel@amd.com>
 <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
 <alpine.DEB.2.22.394.2303161559250.3359@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303161559250.3359@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 24209220-99f7-4b5b-9df7-08db26c2a4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E35xC/N3s/s9Iex8D6tGQd1wv0kaVZ7a+fj1wLJHkU6FJ9pt2+Fij5ZgYpOBWbJlKkTD/viCluMYbcB259dcS6ZhniY82nCeWhyiU+cusrC2wmKeDX0NpuUDOwYyJO10mlT94Tdyf5esegi+1uDhUSUiTZ6odh/QdBOAl0stOAb/dk9kKKipjux4BiO2Hm9oS9uaiExjhmmTsBZUTK1FoujIGy0Tlb16iqjgVnMp10vEP89MI1I8MZR/YDAAWpbspN/6PxhvoRgn/uK7/EloZC2+KiUdIANKMUKua+2ySj1asWW13dApZtezMvZugoXdwGKA+JzExq+5t6YPomuwDiMw25J292bMvU69p4NrqyNUfMHWZ+zaIvhNrZdJE4UVoIRDSRnrz1oQqMe6VKgnEEo+8hCtmR4BfQWOmqgj42ezQo0NexZSrt3opLgGc2mL3eOfZOnPr67atcejrQElZIIE+2XwPq0TXz1zQ1mVGLKOJYsYoWGvB2VgZDOOsySNOOgbcDdaLo+4S5loEFKyVPzcglsJ+R+DzpmbXic68jmaYFHqqeyWjpBXp5sj4w/PckmZLgWvMab5n7stPibAg0eFxVO7hiQV9HWxxITLQGhnHXd1rI9DRWn/Ti5tcEOpTdpIVvEaRZCztkvO3NPs0WFy3ByYI9SCbBWz+Wt+u6GShIYg/WxfPdwIaMLnOvBQKb1+wJbpQje33E8hd1v/vMkq0qN5M80iGEf9nMcuRuY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199018)(186003)(2616005)(6486002)(31686004)(2906002)(83380400001)(478600001)(6506007)(6512007)(26005)(53546011)(54906003)(316002)(8676002)(66556008)(66476007)(66946007)(4326008)(6916009)(8936002)(41300700001)(5660300002)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUJYRWhSbWtOa01HMnpqNWZWNHNnZ0xZMXNCVzVmcHlTWUVpbnJBQURSaGxa?=
 =?utf-8?B?cVpuMzZqK0RNNlBYYTd5U0dsck1wbkpQWFdSR2R2SEQySXU1SU05VzlYblF6?=
 =?utf-8?B?UEZ4NUc5aXNBVU9DUkQwYUZ5WW5EZk9iNnJvdm5wMkF0NlBQeEowUUo0cUdp?=
 =?utf-8?B?MkJHbkJEYUs2dGxXb3NzaDM1WVB6bCtDQTlSY1ZDQndjSXV2MHU5YUpMQzYv?=
 =?utf-8?B?WTYzM3B0WDhpNjc2ekJCQS9VZ2xLU2NDNU5HeHdsYXQ4czNzQVJvQ2JrQjNv?=
 =?utf-8?B?OXpHMGd1ZlUzWUI1Q1B6NWZyWEl6TTdBS01xdk15NFRTdWVHMG50RGlYL3BY?=
 =?utf-8?B?R1p5bXkraUh6V0NBbXRmVTZJZnJib1RpR2NVcnp2dXl1NEJmZ1ZzWXR3RFFG?=
 =?utf-8?B?a3Vza1IzMlJ0SStpb25JRjd3QWNwL1BzQWUxVVBRalBHa2tqMThrNnVTT0xS?=
 =?utf-8?B?SjA3YXJJVWs3aW5YbUVOTHYyWnprNEhzRDl6ak1zc0JIODRXQmE3Y1c5Qlcz?=
 =?utf-8?B?d0xxamxvenB5VVJlNHZlZElwU0RRZFdkejYycUFtRjZFeUt6VWV6cDdzcDRN?=
 =?utf-8?B?MnR4VUxqNDJ3c0hrV0xDQXJXQ3FCUFQ2a1U5SjJSUU1uV2tHN3FPV1FKSHlG?=
 =?utf-8?B?bGNKcmFwWnNFY09pMmdZcmp1MGtVR2sxK2wxSVR5Tkg4MGx5SzlqcGdFSVlw?=
 =?utf-8?B?aTN5MTFWMUp6cEcwN0VxbkVkRFAydmlPUC9kb3VCWHRsREtZMlUvbDBSYkF4?=
 =?utf-8?B?UGR4ZGNob1FFODZIdDhwTkhWWGczT09ZK3YrbGxDSUk4MnlPYkdCQmZzbXhT?=
 =?utf-8?B?VXljcUJKNThBRExHK1UxV0F3azg3czlMWEZBSUxSdFhlMStrRmc3c016aWUy?=
 =?utf-8?B?Y1RQWnRiTWxIc2dtRU1XYy9LWCtXNjN6WFFTQ1ZweGVVN3BRa0dDUS9yTWZ4?=
 =?utf-8?B?dU9hNmhsanAxYU5taExINWZBN3NEaUpYaGszQVpKeTliNW10cHZSRHZiT1Az?=
 =?utf-8?B?M0VCa3g5Z1N5UWdTS1hyMldlY3Mxd0JrcUh0T1VkQkJ2UWlFeGdadDVDRW1G?=
 =?utf-8?B?djY2RDBXZjc4RGNYcm04WFpSalRnZXdYbzNxbnlSbjZmcnYxZGJGWWtIOCs3?=
 =?utf-8?B?MDE0T3JFeERFVmFqbm8zelpWM3R3dDc2dW1UM25NS1hnUXdhYU10UU9hSGs1?=
 =?utf-8?B?KzROYytLQ1NGVUdGb1EzTXdQYW5QRlNqT3FCTitQbzJ5TU1sUXJDMUc0V25E?=
 =?utf-8?B?NEViV2prYkpLb2hwMGx3OUNrRjVjZWhQM0lMb2FLS3h2Q2FqMmpWVTVENVZP?=
 =?utf-8?B?bGFTb0pxR1B3QllHYjFZNFBQUE8vUXFHOEdrQlJQNEExY3NXZGNlK1lTVm8w?=
 =?utf-8?B?L0phblMvdStyeEFJdFp3dXZJTmF5NlZ0YThXTEg5TzdpZ2Yremc5THQ0NUZM?=
 =?utf-8?B?L0J5cnh6ZUlHL0NlSGNGMzMrT1lVN2VQcDdHOE05YzVqbEtzcWZVWjBjVXZr?=
 =?utf-8?B?MVJldWtLUDJLMURRRWlicFZVU3RxVnNRcGRRcmFHQzB3QnYyeUd5SlBZUGs5?=
 =?utf-8?B?L2FSM2lXZVBUTXM3SjlPMHVlTThhNHNobnUvbXovVGZLeGhnMTRHRXFON2NW?=
 =?utf-8?B?WUdERUR4SnBzNHNTaCt2ZzYwT2lER0pkUElnWE4vNDNib1l3OEQvb3grTERJ?=
 =?utf-8?B?ZndVNlRnZSthSCtDRllhNlhTL1dmUkw0RkFrMlBPczQ3Mm9yUVRUN1lhbm5D?=
 =?utf-8?B?VE1hZEYwSEpIYUUvMlRxUkZXZEJEMnZaMForbVdsdTQ4R3VlRVM3VWZiQklv?=
 =?utf-8?B?MXE4blZwWitsNkl0c2lRcm9aODdxOEYxTi8rN0trL1JUNittYmpja2tFVWk5?=
 =?utf-8?B?Yjhvd1JJSk9YYTE2NldNUmV6SzJ2UWl1NmtrZjgvYy9ib2dBRFRlcVN6TkxP?=
 =?utf-8?B?WVRIMUg2VEFnbzAxVHdITFdISEpGaW92ZkEraDNXYzlXVUVnOEQxaEpZaEhM?=
 =?utf-8?B?ckxpSkFCSHhqajM1WnNxRWJvRFk1dUN0bmlTZmQ3WFZtTXY5d2ZvdUNGNVVL?=
 =?utf-8?B?aUJjdjVTdkFlVy9XbEZVNUJtL211YkhyRnBsTTFBZ29Xa05HTmVLUGR0MEd0?=
 =?utf-8?Q?K8uoYrpCrb2QV77UfNZSoZXbs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24209220-99f7-4b5b-9df7-08db26c2a4c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:36:03.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYbuaNC56Xms+rQzYx5LY5kKxkHxq+gmTLIYleOwNQO7g9vZNDHEOhDavjXDhYy+Fkwlq9oyFe1MxeHrdJhW7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7486

On 16.03.2023 23:59, Stefano Stabellini wrote:
> On Thu, 16 Mar 2023, Jan Beulich wrote:
>> On 16.03.2023 11:26, Michal Orzel wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
>>>      }
>>>      else
>>>      {
>>> -        console_rx++;
>>> +        unsigned int next_rx = console_rx + 1;
>>> +
>>> +        /* Skip switching serial input to non existing domains */
>>> +        while ( next_rx < max_init_domid + 1 )
>>> +        {
>>> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>>> +
>>> +            if ( d )
>>> +            {
>>> +                rcu_unlock_domain(d);
>>> +                break;
>>> +            }
>>> +
>>> +            next_rx++;
>>> +        }
>>> +
>>> +        console_rx = next_rx;
>>> +
>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>      }
>>
>> While at the first glance (when you sent it in reply to v1) it looked okay,
>> I'm afraid it really isn't: Please consider what happens when the last of
>> the DomU-s doesn't exist anymore. (You don't really check whether it still
>> exists, because the range check comes ahead of the existence one.) In that
>> case you want to move from second-to-last to Xen. I expect the entire
>> if/else construct wants to be inside the loop.
> 
> I don't think we need another loop, just a check if we found a domain or

I didn't say "another loop", but I suggested that the loop needs to be
around the if/else. Of course this can be transformed into equivalent
forms, like ...

> not. E.g.:
> 
> 
>     unsigned int next_rx = console_rx + 1;
> 
>     /* Skip switching serial input to non existing domains */
>     while ( next_rx < max_init_domid + 1 )
>     {
>         struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
> 
>         if ( d )
>         {
>             rcu_unlock_domain(d);
>             console_rx = next_rx;
>             printk("*** Serial input to DOM%d", console_rx - 1);
>             break;
>         }
> 
>         next_rx++;
>     }
> 
>     /* no domain found */
>     console_rx = 0;
>     printk("*** Serial input to Xen");

... what you suggest (or at least almost, because the way it's written
we'd always switch to Xen).

Jan

