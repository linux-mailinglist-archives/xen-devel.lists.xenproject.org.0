Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F53BBA85
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150019.277442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LH2-0000aD-0m; Mon, 05 Jul 2021 09:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150019.277442; Mon, 05 Jul 2021 09:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LH1-0000YC-TZ; Mon, 05 Jul 2021 09:52:19 +0000
Received: by outflank-mailman (input) for mailman id 150019;
 Mon, 05 Jul 2021 09:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LH0-0000Y6-9I
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:52:18 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e68924fa-086a-49a4-8478-b552487331c5;
 Mon, 05 Jul 2021 09:52:17 +0000 (UTC)
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
X-Inumbo-ID: e68924fa-086a-49a4-8478-b552487331c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625478737;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wBv0Ys6SYdFppmKuo9xep9r9u++Dchky4Xw4n8bKPL4=;
  b=Be8NBDQBNOAwTRD3WSM4apiwL8BdRbetjYyyuYCHoWZlvPkXIMvxQO6G
   ehZCzbbY85hGuTXVesvoGLr/DLnz8hR5hwMxuWcbXIX9aQ+gJYT7I62gE
   yY5L3biLwQ9/JGzJiQCSX8+9ARCaaIwRT5CGz9HrxCLa9ougNo5fskL5z
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4ZNjjD5IQ9ScxIZyWxaqYdJLHVl1GvBroQfhRI93h+dzUsVg7fapXLoaIgSXAjWMiHzo6S3xIv
 43VWkX6/bpBZkKyGkZXeS8V45CpQuZN0nGOeF+JE/nw7YveZAR6YtVQkFYRY9Xuk+XTtIO6M+/
 1aetUu9fFWFlIJrdFMiG4uYyoXNwx3lUIg5P98yY0ErzU+yH8UU+bZhX1k1k98/tVz9M/Rd9Nx
 2ZgzmW3gJQT8P460I6vGK2D9mCC11BqrqNBZc5L6RcJxKTTPAQSeoozxqB6nx6w43RGoqauZkG
 yRE=
X-SBRS: 5.1
X-MesageID: 47944738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Xj0ma6j7s2ZirqfdkIQYAGqU33BQX2d13DAbv31ZSRFFG/FwyP
 rOoB1L73HJYWgqN03IwerwR5VpQRvnhPlICPoqTMmftWjdySuVxeRZjbcKrAeQYBEWmtQtsJ
 uINpIOdOEYbmIKzvoSgjPIaerIqePvmMvD6IuurAYOcegpUdAc0+4TMHf8LqQCfng/OXNPLu
 vk2iMonUvFRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1UjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3DRY0eTFcBcso+5zXYISdKUmQ8XeR
 730k8d1vFImjTsl6eO0EDQMkfboWwTAjTZuC6laDPY0LzErXQBepd8bUYzSGqH16Lm1+sMjJ
 6jlljpxaa+R3n77VfAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdg99Q/Bmc0a+d
 NVfY3hDTdtABunRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOth5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdI1JVsJ6d
 78uXZjxCcPkm7VeLqzNaxwg1vwqT+GLEDQI+lllu5EU5PHNc/WDRE=
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47944738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXWPcv3skpAFv0IvhqPmaf1sYlhPKmTrFji5OpnLfige1pZkQZoYarHU1deVVKR48rXUK3hfUZQWNyWjftSY0yABGR5Ea/j/fm/VfKTRlK/u6KED2FMr+YDjZNZOcfyh+lAeAybqqm4O8NwZDcEA5Q9e5JFMp9u3XIngCxgizlSSKbpbsQ3mafucZikdPRpe6/fGbdB47dUZ6hyP6yDAeSc++rj7robY8GriuwUGyvakiLCdX26en7BPu1TjDEUjNzecGX5RJy4RPG/SX4vOef6dgtlvSKJtBGvkXUhdHngDXzfmmxPHnAy1u80lmqRHLS/wcJVVTrGLe5Pgga+fbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6chlBY/ISf0K7dfNK7yktQk8072F0L0VK+2+ixf0Ac=;
 b=FnfVBi6FNR6AM8523j4vID67eUFL6OXDXG5tIUycWDXV6SNRwxBPpJCULYhHK/CcIVuxTx73dHrpHJUOm6kd5yuEiYDcFNJJjxYWmkbgmxw65rIZPjpLmacLAHwEjKIEnaTn2zCXM3MpMVZIVUNL/WzotTGFBeIQ/rIUzUGkq1QfZ9DdYO965Alb1dh8T+1ndvJzGYlAkL1C5ecp9G0XSrnlu9oirRX77KwhHW895+etp18Vsk/9bBKq4iu04+JPfav2J6W7T+GwwWdLJDEcni2rpEVI21gyGRjAgXpa90rPKf9WSPam6cfAzBuG7SDE4CBa1WS3uhnuzv4IqyS5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6chlBY/ISf0K7dfNK7yktQk8072F0L0VK+2+ixf0Ac=;
 b=Bo2P7iclEuMchvHQnVSX76eMldDzJ5BBmS5NpWOODpUvuci7qfLx7TTxlb6wDC4Js6rKNsOYdTtV5QzHBevpMoctGb5QWxBdDeU9SxZJV6NfWALfADTK4sX5UD/FiH7bV7tkOVRVRG4vy6k7wyomaUsxdmW/viEa5Q0uN2GUAP4=
Subject: Re: [PATCH v20210701 10/40] tools: add xc_is_known_page_type to
 libxenctrl
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-11-olaf@aepfle.de>
 <3c0efa9b-aaff-b4b7-0fd5-9eed32b20e01@citrix.com>
 <20210705102230.48a86473.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8762eaaf-a8bc-430b-470d-b84f68c06b5b@citrix.com>
Date: Mon, 5 Jul 2021 10:51:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705102230.48a86473.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8f32f40-96ba-4866-6195-08d93f9a8790
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4806A2C51F094583C8B8B029BA1C9@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yAHxlcO0Et4vQNS8+BAN0FVIsnOqOYgTuga4G84oWzFxRkJLn3wQM2kjtnvD7ZzGy4YEhIEVkDQpR/peDQJq3e8CGERYJ9YvK5B3O1zgNyUxIApGljmknhVrOrJH7RlPkuEv8tAVahioEj8iLrp7CSpACFl00G9EWDipx2NpoMtONUDX4Z9BD4WK8KxyIzLK0Dee47c/+jWH2i8lkwzxB4XDVrGu0v44vrZcpY1q04cCZoSUmx9wNyZBfaX/y+O4+Vw4y7U9vD4gg2JZ5RkRQylTa1yG7+qV5W5ZWlsLG+21YlBObo5k+ohPBjni7YK+4EmTszBIbt+UVRV2q/DW3mNNGB4KJ4b1deyd/Mto9E9VswEPFXgMX58My1TQPNOtsgwQGdHw5OF7xHjVrAHHovjZrNimXbWKj6RpdGOdAX19rn4DVcce7eegt1gB3JNCrVqRoQNIJbLLPv7LvQuHWfnbYDDl6GF56wet777sGFVgyBsBRl3qclYYWWca4gxKcc/eaVRwNV2sKeKjw8LaokfwMsdXyzvZzzxmDjPvO3qhyfXgF5oNVS+s8K+yhdvSHfN/Zr/LXixn8FPqLKqC4g0+0F0mYl7dQOPkoJ0XDiFIeOTqQhawDDxC8s2dnSEzvhWqUrxDAijIHUw7GJvkP+bAD7JwuTW2vsaRlnDX45mBCUMlLajeHfRfCf0NyhscMNoNLSYlM+HK5ThA0OU5k6y5wLO9wv56SNF7A8B15Vo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(53546011)(36756003)(8676002)(66556008)(6486002)(66946007)(66476007)(6666004)(31686004)(5660300002)(16526019)(478600001)(6916009)(4744005)(31696002)(316002)(38100700002)(16576012)(86362001)(2906002)(26005)(8936002)(186003)(4326008)(2616005)(956004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kys3VVFsdEZUZ1lLMXIyTjhNYVpnbjFIaEJQNThmZDcwWVpaYVJ3ZzZvek4v?=
 =?utf-8?B?bkNGdUZlYlBDZzBBOEE5cFg3Sk93SVB0R3R3UHk1cUlZMFdLN1dkOWdkZEd2?=
 =?utf-8?B?UUhJWWtJNHVRQTYyaWJsRk5BQW4wS1pLSXR5blc1ZlFWMlpuZ29reGJheGJ4?=
 =?utf-8?B?UVdkMnlCdjRwTnQrOHowTEVNQ1NCMzlVTVRPRDFnZitSWStHUVVLb3RYL0lC?=
 =?utf-8?B?NE1sNndvOWZZdUNseUFiOEhqQktZTi9OdytJa3BIZm5WeTBiZjhlWGtXZVpS?=
 =?utf-8?B?YytEaFhucGY2dmVUQlFPVFBjMDNIUzdNUWRaVnVOV2xIaWkzd0FDZDdVSGt2?=
 =?utf-8?B?b3JneVFzVW0yQ2JtQXhVbm45SDlUbDR6dU5VY2wxWG5VZWdhQ1NTdmVqbkQ3?=
 =?utf-8?B?czU4cnBlZGxRZzAzZCtROFBvTTB3dkVGNGxYeUtxYU9CdzU0Y0MvVGF5Tnpa?=
 =?utf-8?B?U2dER0JqUFpGZWU3OEZoZkFkNnkvbVROUHRJUldHMk4rRFZuU3o1aDdKVTFx?=
 =?utf-8?B?TUdFbFhySVBzcGJXdDZxZW1WeUZxTTFVMnNFaGFHcm8zM0d0Vy9KbXBkdlM0?=
 =?utf-8?B?c1MyeldzWTU3bVhpWnpJMWk1Y2pzc0tpZUJiR0loTXI4M3hFRjNQSUlzM0NE?=
 =?utf-8?B?Ryttd3RjcjI0dW1JMEV2ck9tQ0N4WURsQTJNdVJqeXFrK2gxNzJUZEp1MHZX?=
 =?utf-8?B?YnZTK3FkQ01tbkczd2IxSTVsVVByK2ZiWkl4V1Y1bjhVZHZyTWJqNTVxZGlJ?=
 =?utf-8?B?WWE2ckM4LzJ0T3QxUk1LN1NjTmxEL21rWUt4ZUMyZXY3Y2xNNWQ5MFlReWho?=
 =?utf-8?B?dFFRbk1kYXFYZ3dMeGRxQW5wNzAyTUtvTWZmNFVVREFXSkJGQVhUN2ZtOE5r?=
 =?utf-8?B?anVubWE5VDQ0M3MrbEtlNkJRM2FNUXZmRzFxWjJhOGtySGI1THNhdWo5TVVr?=
 =?utf-8?B?ZGtKWUI5Y3hIaC8ybXpZczBFNDhwWlhHYWthU0Q1azlpT0FObCtBcVhDNitq?=
 =?utf-8?B?L0prRnA4dy93UnR3THIxbHB4T1hHMDJESXRLUElJZlU0YzlSUngwVVpIYkQw?=
 =?utf-8?B?eEh0OUp3blRnQ1FSTVlXWmhwNldqY3hHWERwNFJJeXlOaytsVGIzZ2hkamdV?=
 =?utf-8?B?QmliSzhvSFlPWnJVL1VPSGg3VUxOTjQvSzdjRUx4REo4SzdaNUNOU1NYaFFj?=
 =?utf-8?B?bHBJVHlSbHRMTWtKNFFaQVRZeFJSMzY0UWtad2gwcUNuQTA5cUdBNzFBczk5?=
 =?utf-8?B?WVM0QVU4a1pveXc2VVB2b3NOWWl4eTRpSVVESTNPQWg2MDZydmVaRmRQRUQ3?=
 =?utf-8?B?M3VlcDFzbThYQXZyeXV5Q09QQ1FTZ053aGRQZ2RLTTBUMVo5a08vVDJETGZo?=
 =?utf-8?B?NFNHV1hwc054cjdRWW9jS3I1V0dlRlNIZm5wbGt1bzF6ak0rTE1Mc1RSTlpI?=
 =?utf-8?B?WmIwa0Fra2c1cGQxaFZwTjBPMU8xSHBXVnBSbldzdHpWbC94d3QvZ1hCOStV?=
 =?utf-8?B?RzFDRy81RzRQQ1NhY1JueU9UcCtuaDRJQ0VhbW5iOHRwZW1aSFZvUzBoSnR6?=
 =?utf-8?B?UEJUWkFZY3BDMC93K0Yyc1RHc0pOeldhOGJWaVprdkZ6YVJsUGg1QlN1a250?=
 =?utf-8?B?QWh6bXYzSGM2U0RrQkV5L1Z0MjFxOWtrS3UzL01FMWIwVkRBelpTNERZMHlX?=
 =?utf-8?B?eUpTOGdXWTlTN3RxMVJ2T1pNcnByaW1UOU12WEFCdTAzcFZEY2VKSUxIcXUw?=
 =?utf-8?Q?WuASwTv6BdlN2fWSnFA5uLpkgyRr+q0jzsdDXE8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f32f40-96ba-4866-6195-08d93f9a8790
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:51:58.2575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx2wu9ISbSxYiKsS7nC+3GHrB8KmLE+cLPp1rlf8WmAbSMuEqc9ZIx3YGK6ruOB126JCannTaZuwXQrz+asPaHf0zyT8DGiqpcTmMoQZdcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 05/07/2021 09:22, Olaf Hering wrote:
> Am Fri, 2 Jul 2021 20:20:08 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>>> +/* Sanitiy check for types returned by Xen */
>>> +static inline bool sr_is_known_page_type(xen_pfn_t type)  
>> uint32_t
> Why is this better than returning 'bool'?

For the parameter sorry, not the return type.

All type fields are uniformly uint32_t elsewhere.

>
>> I can fix up everything on commit if you're happy with the suggestions.
> Yes, I'm certainly fine with it.

Ok - I'll put together a branch.

~Andrew

