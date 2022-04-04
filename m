Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F474F13DD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298288.508085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKxN-0006pW-C1; Mon, 04 Apr 2022 11:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298288.508085; Mon, 04 Apr 2022 11:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKxN-0006mC-8x; Mon, 04 Apr 2022 11:33:13 +0000
Received: by outflank-mailman (input) for mailman id 298288;
 Mon, 04 Apr 2022 11:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbKxL-0006lq-JV
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:33:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0061b922-b40b-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 13:33:09 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-TaSEFA_lPwq5gcK9hcys0Q-1; Mon, 04 Apr 2022 13:33:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6100.eurprd04.prod.outlook.com (2603:10a6:208:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 11:32:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 11:32:59 +0000
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
X-Inumbo-ID: 0061b922-b40b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649071988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vninudnNY5iyLT5yME4S0Ywt/TnpeHxiHfTBgQ6Hl0=;
	b=WcKBn/w/nmru+ddAvXmgDaNnwxgYecAumpmwzu1nfqaOUZEfLMerwXdhOSwc6iM58EDRnn
	Z+9Q8Btx/9RGVuG7GDFaWb95vCiQjsrkIbrl3WKpJgGzyFu1zwd1vYuJ4DBt6fWAGNg0kP
	AtQGBmzTrxP+vMhx9a5uRTLjDhq5Ypo=
X-MC-Unique: TaSEFA_lPwq5gcK9hcys0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLkUryBJGZ+mCLMNh8hCvKmDHeORW+19SkfTkid8Smkwstw9D/THdqMdh4YUSgrfwreyuLI4nwdwwMH+4rRc7s9r2/EXVuuwv5XRNsEe1D7SKXCsLT+iQiK2RAFQhO/JbcRzWoaPjBeBJ5eY30qJCaMe7fHgwUVET9R1Ofk6UliMIZlhf8wN6I8AbmF3eQ91Tor9AoXprBTMgdkTN3ngzVXpWCNzZYc27/J7jW5GByk//49HZ/YqJ7BfyJEqn3wKZ7k1VJpWIkBiiCAj84Hk268XRYtIcVFqpnQJmjV/0uJiEWSx2zLxFgSSdmB2Z1O68P3pCNZnZq9PJlFpXfSb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vninudnNY5iyLT5yME4S0Ywt/TnpeHxiHfTBgQ6Hl0=;
 b=O/eN1nUmYhHFU8rW0SoLU3sGIf7hWsRur6SQhEYv0OE4IRpkB6qUd22k+G4d7naufm5F6P29K13xZNI4vshLfHgMNtmhYW52yUmHcPT8GQ1sl1uOyLl6Gi0+3zb1poFdbsLt6LrFC+QmYFkU3SnYXzNbjwWvq0e+2RYUktuSzCdAlUoazFWIF2BKCgsv9a3XO2HSyiMsh/pEj5DJi1KNgOPE727K27Ee2xoTqelfYLcGKfy9PWNuv6SHkiIu9ro/cLGbqLlSVvnXFVfKvHMTW/dRs8P3QVoMrpub/QvJ+D3qwO/tKWuR3xj402F0QzM3BRdWF5xxQIgpEYBwE+Wqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d67bcd6d-8db4-2ac2-14e6-11eb71ceac61@suse.com>
Date: Mon, 4 Apr 2022 13:33:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
 <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <eba664e6-4146-426b-5119-59fe02a96bb5@suse.com>
 <DU2PR08MB7325D94A0BFFC2A3BB0AFF08F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325D94A0BFFC2A3BB0AFF08F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c00c4af-4865-4c52-3975-08da162edf16
X-MS-TrafficTypeDiagnostic: AM0PR04MB6100:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB610069080128831BA1C564E6B3E59@AM0PR04MB6100.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lHERgtQDIuYogaNMlzIDbvirVhWbTRfiBxywnopxpIq3X4h0H1VhwKKvz24Rny0AgVMN4Lh8MWGGymSQA6pzWd0womcQ20kdrNRB1f+S8j7oXhb+YCNWQcqH05bHdsApVPtYXk1KTsE/sAZfdnY4Q38aATEh10ru4hLLz7+UU/ayTO9cXuJvKH0C9Kv2AutBhPv/o/G9MMV2ugraZg9SS6EPJvxUQhtHNQQm5yy4dJlTwwjjgUslgQc35Rv+1SEM6g7b4f7B9UqCK8Wpc4/MJGPYekLa4Y5wmZpS2pX/QISiDRjTS1EFnpX8RmD6d47ibnwQJiO0pOgOyu52/syjxcdESg/ZzA5eFxb7uJwObwIN65sY3ZnTRQO7U3mFI3+O5l1z4saaIf7AY2bP71pctDao5/DEqWzFoG5SoOPW1FNzSD+lDL5QX1YuPJ5qCx6nAFWgKTQKdRIU1Sq1hqxAfjJ9TLP8IifSDH8sUi4NIyUM0OSaBJQSuQZJlq0JflwtJoQmIloVsA9KkL2U558noF1w6luzHhhWkPc7mJUKK+qdR8LlSj+2Sg+zkUpnratXSEvqh2ZnGvM3FN9aJIKPtM36Fb1bNtNVNgGm9ZNC+q5hXAbWDyG7NaWrTXpmbPUDBrPXAZQK7pZTYrG+pAYSwW/4w/IlF+MEp5NYkw95QeHnsaBnlKOSpImfD3c8X166HnW43ONFD7aqri4KSFpDpAuDLDQTmr2JYH8M3UbSrQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(31686004)(36756003)(2906002)(54906003)(86362001)(2616005)(38100700002)(6916009)(6512007)(26005)(6666004)(186003)(316002)(5660300002)(8676002)(66946007)(66556008)(66476007)(6486002)(53546011)(45080400002)(4326008)(508600001)(83380400001)(31696002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldEa2Q1S1RjeHRXaWpuWlRPN3FnWGplWlVVOEp0VHdPNkRiTWcwYW1WKy85?=
 =?utf-8?B?dC9IUnJETW5ld0R6UkdCT2hmRFFDU0c1ZEl6NFFWSjg5cGtuUVdDQkdXKzl3?=
 =?utf-8?B?OEMvbFBJU3ZFc0ltZzNzbHhxazBhN0FZNndDMW0xOWMxeDhMYlptaTdGZ3RZ?=
 =?utf-8?B?OGI0bHFUdEE4bCtMbnkzVW4vR0JHSEk1Y2tBeElvUnZURllTM3hTQmhCRFdS?=
 =?utf-8?B?QTZCYjEybmdWWER3Q1dIUTJhQ2lOQ2o1MWhjNmhzb3ZzeVY2VUk0SnRFWEFz?=
 =?utf-8?B?Q3ZqQmVNKytZQ3h2TWw3MTNjMGlZU1kyT1lKQzJKbXVvUVN2TmRTZ1U3NTVL?=
 =?utf-8?B?Ujd4Y0QvdnFkY0d4bVBxTVh2Nm9LUXlDYWFKQWJEUVZ0SnJjTHhHTkdNK1pT?=
 =?utf-8?B?NVF0RUozS3paWjVxQzVwZkdPZ21WZ25PQnpyRnRUaTRIZ0grZmFqUC9ScDVR?=
 =?utf-8?B?OFRXUWFKcGd3clFMRFdpeDd1RW5TaVdGN21RZlA0eU9zcDM2a0pyMERuQ2U3?=
 =?utf-8?B?NksreVNVU2s2ZUVmMllKWlB3aThUZXdxdGlQbGx5ZC9OQXBEVFUyOGVMd05z?=
 =?utf-8?B?eU5OejVDZHR6dkNWcVRWc1V6cDhuS0ZjVXZrbkQrcXIvL1QvaStyalF3Skdw?=
 =?utf-8?B?QjBESHFuM2Yzd0RUdVFuVll0d0xEcmljaTEwN2tJcUd3VG5BVU02U21RQW1l?=
 =?utf-8?B?alNXNnFNeTRaTTRFeVoyclJKZFRRTTF6ZnZZR2tSUkdKcDF2K1FYSElwcG5h?=
 =?utf-8?B?U2VoL0dWYUZIS2syVjJlZFUvQUFaNmpLR21HU0pWdE1GMnh1cG14Z0I2TUNr?=
 =?utf-8?B?bFJ0OHU3bjdlOUUrY21HS1BUQStJY2hUUFBTR0hvcWVRUmZZUmluZGZaNUd0?=
 =?utf-8?B?dUd1SGwvNjNuSUc4VXFrcW9SSU1FSFQzNmZvMjFlMmJJMzdxeWQzSFBYL1Rx?=
 =?utf-8?B?SCtaTXl5dUJvdXRwWlNRSk9QaGhCWnRibUVMeHBseG5DZkVHY2xvUDZPMkc5?=
 =?utf-8?B?MG1lNi9GTFRVbjZESkp4U1hyM2tSNmJXK2hxVnZac2crNzNMRDJvM3ZHYlUw?=
 =?utf-8?B?RkFjRXJPQU5Na2dWUWJHa00rRGdIMlh5cy8wcUZkajJVN1dYbXAwYzdUcjhp?=
 =?utf-8?B?MFRWaHowbDg5aGp6dWpTWCtoamNXYm9PVjNQVGIrM1JlOTZyZmRwd0ttdUND?=
 =?utf-8?B?RUFlSXZZbThGYnd2eE9zMnBublZkVWFHdGlsZTRVZGg0Z0pSTEhxVW5iWWl4?=
 =?utf-8?B?VmJyWDJFKzF2SXV6eENnaXdKamFGdlF3QkxGaGx5UXAyQmQxMGZ1d0VNT2Nv?=
 =?utf-8?B?ZCtKLzJhUU5MZWFCQnJmTUNydUdnbEVPV2pHMG8wY3NQd3RNc2pOT0RRUy8w?=
 =?utf-8?B?NXM4cWRsaTdSUTlkT3dGT2NZbUo4TTdpR1VFTGg2TUFCdXVkQ0JUWGV4NEhh?=
 =?utf-8?B?amZybFljMS9NeGxuS0hPQ1BTMmNrWHNsZ3A0dzdtV2xILytRS3ZNYjNKK2t6?=
 =?utf-8?B?amtHUkxVVmJ6WlJBVVVEalpTdStER29abll2b2tzdktYMHdaYW5VRjk2K3hY?=
 =?utf-8?B?cTZlQmZMWnBGWjRoYXpreUxwUTd2MVpva3VTOUM5NmxNWEJkSEhIUVJjNUYx?=
 =?utf-8?B?cDRaM3l5Q3o0VFpma3BRdlkxL084Vyt6azBvS3RCUDFldkk1RFFsU3ZhclRX?=
 =?utf-8?B?WEZiYVhsVk8wR2g2bFBnc0FRZWRhT3pOeHZWSTB5d09VOENVNVlxV2JJaG9Q?=
 =?utf-8?B?L2svcGRLalJVb3lRQUpDVzVGZUsycUhEamFLd3VkL1hCWWUyd3BCbDQ0MUJ2?=
 =?utf-8?B?b0VGc0ttZm9SVmhBei9FY2NmTjJFb3p0S0NqeGtGelRYZE5MVXVWcjhYUlBj?=
 =?utf-8?B?WFYwUzdEbjR6NFA3SGo1Yko4bHFiYy9mdzByUlU0MStyZ3hZN0FMbmk2ZFB2?=
 =?utf-8?B?Y3Z6OFIrQ1dWTWNYekxaZmErVDU3ejNmU3BodFZKcGtqNjl3U0YyM0cxcVdk?=
 =?utf-8?B?Z2NRc2phd0tnS3NDMGtwcyswUG8wV25tQktBcVlxL3RKUGdZbHpSTDRyb2tx?=
 =?utf-8?B?OHEvQnhGcE1jRHYrZEpCampuMHA3NlNRUDlWckhuZG5Eci93cUxDZmdQWGdu?=
 =?utf-8?B?L2xWZGJOTTBobmZsc2hUTXdOeGY4S2s1UFlFbUROTjZ4RzZrUzgwMnhUWHJE?=
 =?utf-8?B?QWQwWUNSbVlYK1NmTWlxSGtUT0lwTHowRTdKVVgrNGZxRTY0dzBwNlpKU2JP?=
 =?utf-8?B?UUZKSEdhdDJ4Q3JFSmQ0TVRxcHZLVnUza3hWRUVmQkhmUU1tRU1jTGx3Q0Yr?=
 =?utf-8?B?SitoeVBxdEhVQ0dFVkQrdDgycXdJdkVDNm8wcFpsZGJ0WEJtekxnQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c00c4af-4865-4c52-3975-08da162edf16
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 11:32:59.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3NIFjW/wbSN6OL6NplsbfkhFsIzBS9wdJU4/OUNhq7AzjgBJ84NC2d5dPeamTW8gn9hVDsjQD5JM3ydo6uvLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6100

On 31.03.2022 12:30, Penny Zheng wrote:
> Hi Jan 
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, March 31, 2022 3:06 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Henry Wang <Henry.Wang@arm.com>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on
>> static allocation
>>
>> On 31.03.2022 08:13, Penny Zheng wrote:
>>> Hi Jan
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, March 30, 2022 5:53 PM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>
>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Henry Wang
>> <Henry.Wang@arm.com>;
>>>> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>>>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>>>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-
>>>> devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on
>>>> static allocation
>>>>
>>>> On 30.03.2022 11:36, Penny Zheng wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -35,6 +35,10 @@
>>>>>  #include <asm/guest.h>
>>>>>  #endif
>>>>>
>>>>> +#ifndef is_domain_on_static_allocation #define
>>>>> +is_domain_on_static_allocation(d) 0
>>>>
>>>> Nit: "false", not "0".
>>>>
>>>>> @@ -405,13 +409,29 @@ int guest_remove_page(struct domain *d,
>>>> unsigned long gmfn)
>>>>>       * device must retrieve the same pfn when the hypercall
>>>> populate_physmap
>>>>>       * is called.
>>>>>       *
>>>>> +     * When domain on static allocation, they should always get
>>>>> + pages from
>>>> the
>>>>> +     * reserved static region when the hypercall populate_physmap is
>> called.
>>>>> +     *
>>>>>       * For this purpose (and to match populate_physmap() behavior), the
>> page
>>>>>       * is kept allocated.
>>>>>       */
>>>>> -    if ( !rc && !is_domain_direct_mapped(d) )
>>>>> +    if ( !rc && !(is_domain_direct_mapped(d) ||
>>>>> +                  is_domain_on_static_allocation(d)) )
>>>>>          put_page_alloc_ref(page);
>>>>>
>>>>>      put_page(page);
>>>>> +#ifdef CONFIG_STATIC_MEMORY
>>>>> +    /*
>>>>> +     * When domain on static allocation, we shall store pages to
>>>> resv_page_list,
>>>>> +     * so the hypercall populate_physmap could retrieve pages from it,
>>>>> +     * rather than allocating from heap.
>>>>> +     */
>>>>> +    if ( is_domain_on_static_allocation(d) )
>>>>> +    {
>>>>> +        page_list_add_tail(page, &d->resv_page_list);
>>>>> +        d->resv_pages++;
>>>>> +    }
>>>>> +#endif
>>>>
>>>> I think this is wrong, as a result of not integrating with put_page().
>>>> The page should only go on that list once its last ref was dropped. I
>>>> don't recall for sure, but iirc staticmem pages are put on the
>>>> domain's page list just like other pages would be. But then you also
>>>> corrupt the list when this isn't the last ref which is put.
>>>
>>> Yes, staticmem pages are put on the domain's page list.
>>> Here, I tried to only destroy the P2M mapping, and keep the page still
>>> allocated to this domain.
>>
>> Well, much depends on what you call "allocated". For populate_physmap you
>> then take pages from resv_page_list. So I'd like to distinguish "allocated" from
>> "reserved": The pages are allocated to the domain when they're on the normal
>> page list; they're reserved when they're on the new list you introduce. And
>> what you want to initiate here is an "allocated" -> "reserved" transition.
>>
>>> resv_page_list is just providing an easy way to track down the unpopulated
>> memory.
>>> '''
>>> But then you also corrupt the list when this isn't the last ref which
>>> is put.
>>> '''
>>> I'm sorry, would you like to be more specific on this comment?
>>> I want these pages to linked in the domain's page list, then it could
>>> be freed properly when domain get destroyed through relinquish_memory.
>>
>> Clearly they can't be on both lists. Hence you can put them on the new list
>> only _after_ having taken them off the "normal" list. That "taking off the
>> normal list" should happen when the last ref is dropped, not here - see
>> free_domheap_pages()'s uses of arch_free_heap_page(), recalling that
>> free_domheap_page() is what
>> put_page() calls upon dropping the last ref.
>>
> 
> Right, right, I've missed the critical point "they can't be on both lists".
> Here is a thing, put_page is a very common helper that it is also beening
> used when freeing memory on domain deconstruction. At that time, I
> don't want to put these pages in resv_page_list, I'd like them to be
> freed to the heap. This putting pages in resv_page_list thing is only for
> unpopulating memory on the runtime. So I'd suggest introducing a
> new helper put_pages_resv(...) to do the work.

I'd like to suggest to avoid introducing special case helpers as much
as possible. put_page() would better remain the single, common
function to use when dropping a ref. Any special treatment for certain
kinds of pages should happen without the callers needing to care.

> About before you mentioned that "The pages are allocated to the
> domain when they're on the normal page list; they're reserved when
> they're on the new list you introduce. " Is there a possibility that I
> still keep the pages allocated but just moving them from normal page list
> to the new resv_page_list? Of course, a few extra things needed to be
> covered, like domain_adjust_tot_pages, scrubing the pages. 

It's all a matter of definition. What I said (and what you quoted) was
merely based on my understanding of your intentions.

> Another reason I want to keep page allocated is that if putting pages in
> resv_page_list upon dropping the last ref, we need to do a lot things on
> pages to totally let it free, like set its owner to NULL, changing page state
> from in_use to free, etc. Later when populating them, we shall do the
> exact in backwards, setting the owner back to the domain, changing the
> state from free back to in_use, which seems a bit useless. And actually
> for domain on static allocation, these staticmem pages are reserved
> from the very beginning, and when it is allocated to the domain, it
> forever belongs to the domain, and it could never be used in any other way.
>  
> Later when populating the memory, we could just move the pages from
> resv_page_list back to the normal list, and also domain_adjust_tot_pages.

I don't mind the particular model you want to implement. What I do care
about is that the end result is consistent within itself, with as little
special casing (potentially) all over the code base as possible.

Jan


