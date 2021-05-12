Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7B37BDA8
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 15:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126242.237613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgoZQ-00051L-U3; Wed, 12 May 2021 13:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126242.237613; Wed, 12 May 2021 13:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgoZQ-0004yH-P8; Wed, 12 May 2021 13:06:36 +0000
Received: by outflank-mailman (input) for mailman id 126242;
 Wed, 12 May 2021 13:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XikZ=KH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgoZO-0004yB-Lm
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 13:06:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27dbfd81-e478-43be-a742-14ac8fb0c16f;
 Wed, 12 May 2021 13:06:33 +0000 (UTC)
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
X-Inumbo-ID: 27dbfd81-e478-43be-a742-14ac8fb0c16f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620824793;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rLl/dedN9rk965YCYeMWOo1RYr+zFI8RdAReZm+ColU=;
  b=FynzWnCsTWB4F5Mi0eeeOWd8rLwE74ZvkjWqzqHpuEacNyST3wSpQnzF
   OQN9rr2Gth0JQFpVbZw0QsLj3kvrwiPUxObrgMDvxDHRm8rBrv+BNUaUH
   EIoPNy74DsOXR+ajlffxWnugsgzRzQo3rWD2ovzhVCqaj6uVFeMVSjel3
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j7qRNONbHY4OnoRkAW0WQdBnI+IW+Pqt06UVbVjKiGf2RuLn4fncgZAsbtqH/jp2FGYsEw4W0c
 vvvYcc1PZ4YPPPoltukwlDyg6kiX3qxa4xdY22D3r++3Ejm/dR4nGS+tdM3amt3rMgeQVcMm3j
 vOV8d8zFyJBnR8Q/9Fi1sCmx9NX1p1YBwoL3/Yo7Ig6+R2rh8hnMeh2xPYBt8rhOqr70R7KJPL
 zbnFo8XjsjRbPhVqqe76zW/EpK0tR8qp9y8LhfdOXYPmcIUpRAxLQa5BbOIIrG4DUSEd4GrusX
 /+U=
X-SBRS: 5.1
X-MesageID: 43424328
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FxUuR6l6aZYFygJ62JXgJEdYVBrpDfIs3DAbv31ZSRFFG/Fwwf
 rAoB19726RtN9xYgBEpTnkAsK9qBznhP1ICOUqXItKPzOJhILLFvAE0WKK+VSJcUDDH4VmpM
 VdmsZFaOEYJGIXsS6wiDPIdeod/A==
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="43424328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIjrsGlmcr8FeowPECAKadvy2ImM3wgtpWdkEjauM23Jfg1iF/ZK4Dc9zgYOps+Ka0B3c3zp6XJJyrMg41ehZ+kLwxU0ofKAN0Okh4chbGZCK+hbOdqQd/hF2d1yaIRG42PyYInAx/+UkwXTRKacYDT84Mp42kzKJJkDHyoE0n5yYoVXDJ3jR1Qb7ToeLyjICF+iJbyOIoHfuCzte7Te5Bz7Qv9c3IUPsxnUKSPlBFgS5CwQxxegSfohSSlTc24hdeugD4LwdbDcRED5GzrUZsf/259iZCinaOaS33QTo2cfyzUexpX+m2lzKINmUqL1ZSSeOIFzP0ijawHjahqFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QAeRcH2yITfeyIVLS3SF+CzQZKrd9W57cayGjn8adI=;
 b=buWJLVNq9TdtgD4+eOqft8qRY3mOCHwm/ICESp0Rrzf9JtkuuoL6zJ1P+2lD3gx6SnlKBlDZYIlxEive3Jt6XSfUVzxTLQCH25uHrvzr7iG1H6v92Jjnzc0HjWi4p12vDttbSrdGmjFiWPect2Pq245KTH9NAfujJmSooB4nBjSPZF1suUY2gsy617fsnRlEiegg8MEYf9cc396pHnMGbgvd5Nh9x7khPZ0jNCm8Ot0dn5iZ6YW27QNIjCfmc7dLafbgDHFymvDd6zdSEl/KY4LRqrbsyM7W8BfpJ0/vBhsmleXoXPf1accytujA2FakvjeZMO95PsrXtxV6PD3UNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QAeRcH2yITfeyIVLS3SF+CzQZKrd9W57cayGjn8adI=;
 b=O7YSl3YxaYghTXzPAeMgzmN/BCWlmAXR6jdtZrGcf/IoYC/+6dR3bJBSNtc6P7FVRVS0urEUXYMx8YzWE0ANmc4anfRzQm0lWuwpefXPChgQhV0Xtr7boFvZJuHCdb2DDpmncnY9DL5NT35Dyl7OUEp5qz+ODyEo+sf1/casK4c=
Subject: Re: [PATCH v2 17/17] tools/ocaml/libs/mmap: Clean up unused
 read/write
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1620755942.git.edvin.torok@citrix.com>
 <9bfd0989994953f08142d26cbe5a22651a1faa2a.1620755943.git.edvin.torok@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <155869cb-a4cc-b3ee-93f7-937045630c7a@citrix.com>
Date: Wed, 12 May 2021 14:06:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <9bfd0989994953f08142d26cbe5a22651a1faa2a.1620755943.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0231.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35301e0c-1f92-4806-b2a7-08d91546c1a5
X-MS-TrafficTypeDiagnostic: BYAPR03MB3798:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB379893FAC1F2314EC08E75F6BA529@BYAPR03MB3798.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnvtCE2jAPiojC1MGEqdyTTeL0A/6s+qSEeA+1zLQN+i88PCAZ5XoYRAvPWj/A56ZpK5Fw8sMcscwXqu6/myDI41NSsXC1Xo2Lpzh/UNJ9fV6boe6mBjJVQ+W07bsN7qvDTW5SlfbF/ZqiDu+y8o88gTdwgFCjc8Ycx54N1lOckch0MZBmV0z6eCAV9cT8XtUHP2vUgSY9l2t49UKEiZN9pabAPDDd4S+wW6U3f8HU//O0nRz5UW72m1kKm+VO+Bq9CJ59TGHND0iHIIIDeCMw3jhqsU6kyD58UKHFq18Dl4/R5hKxagtX+hZ+gRH1zGWuH4sTma1SsdvFggrG13RRUd59HXxyty9eR7WHXnINfoxIq3bjFXsIAUIaCz9xAk9cRVyo9urY3lCczYxE+94pxJ1ybf+sAoxFOZlL8zrlg1YI2W3L0VDYqpfAOpnUHSeX7B5cMrJ8dO+lMCmcSNKnExqQ3IHePyWw8HpcCfhVfKv43MsVQN9OLi6g0RJlKIwlmwLLIjihkrEjjCwaXpEEkkQFDPcCPB4lwcQbjZt1WSqHVbuzie+DL7Lh/JoIohwAluOiR5+Hc+aqz2wcKfyBocpFO52l9gzBqmu+eqlzSOprT45pkgg4Ugz7UDlA1kKsfOBbd8Se7X/H0TXcBCEWykjoO4VlWi4O74VT/khIqgnCDYlWOgbKFlECWUQEDX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(478600001)(16576012)(54906003)(2906002)(4326008)(316002)(5660300002)(16526019)(956004)(2616005)(6486002)(66556008)(66476007)(66946007)(186003)(8676002)(86362001)(31686004)(31696002)(38100700002)(8936002)(6666004)(53546011)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzQ0Mk5WY05yRThSMmhESUpGR3BxVVdCWUVTWXh5TW1sU3pqd2RNS3hOdDNV?=
 =?utf-8?B?b3NKZFlDYXpOWk9Ud2Y1WGdMY3JocGhyeGVwdE9ubXhZRW5MQjNzSHhiUEVV?=
 =?utf-8?B?S0xtaFBNT2NTbXFuR0FoSVdtT09DTVRtQ2VFMjA1RU5CMXhKNmlVb1dJdmI0?=
 =?utf-8?B?WHdrejUwbWhYdS8rN2lXVFFkTzR6c0h5QWtTc2c1TFdzNnpicEpSSit6N2pS?=
 =?utf-8?B?ZHBveDdaQnJPdWllT0dGcWtROHJTM3VRVTdEM1ZJclFQc0JyNDRQTDV2VDN0?=
 =?utf-8?B?SDk3VXpHZEU5VkVZRHhQNFl2UTBLRFR1d0JYK1plTGFzRlJXRE52dUlCbUJL?=
 =?utf-8?B?OFBLL2hWV3lVaWVjdEt2Mm04OUdVL0Q5NUNpcU11UWU5c2Raak9DR0lFaEh0?=
 =?utf-8?B?d0NrWEw1bHovVnhTYW54d0U5dy9QcW9wWnEvR3YyOWZwc2dmSjdkWGp0RkRp?=
 =?utf-8?B?cmpaeGdkcVZiOHVqOWpTWmpST0xMWHQzTThpclVUOW50ZWRRUjhLQWtxQ3RY?=
 =?utf-8?B?ZGVXZFYzSmsyZ1duQkkxSmpCMzZCUFljcnJiRXN2YkZMYkJwUCtoKzIyMTVU?=
 =?utf-8?B?YWZwMGZXdjNrVHFtTTF0N0MwTHVQVGZWY2JPVXlnVjNrd3VLeEhMUlNkRXZj?=
 =?utf-8?B?d2cyZ0R4MHRKZndSeHVCWlVneTROekFYc3NtYmRRcFp1N0RxM0lNSTRiK2dU?=
 =?utf-8?B?WlN6bFJ1TkIyb2wva3BHRWJLcG9zMU9SZExML3gvaTArY0c3N0FhNmdPRVdW?=
 =?utf-8?B?ZHVMeEV0Nk5OVGRxTmdwWHNUaldON3YrSmZ5RlRPT01wMS9QZmRqNTAzbnc4?=
 =?utf-8?B?Ry93UUpYakNza0xBZnhSYWZyR2tTaFh1SU9OczBkcEhyNXJzNmdLOHp3UlZH?=
 =?utf-8?B?eFRFVjlNZG1XZkFmV2s0WEFqaElpQXdzMnVPcCtWSytQMkRLWWRNN0pWeEdl?=
 =?utf-8?B?K3NMUk8wYWxlMXQxQnNteE5lWUdtdkNweVo4Z0UweXpaSnlEVkRqc0VFNTdI?=
 =?utf-8?B?Qi84THdVcDJ6ZFRZQVJzZnBRNy9GWTBDbXZtYzRYR1J1NzNSS3hKa01DdlMy?=
 =?utf-8?B?MzEwdUcyZk1lTTQwNkEvSzJKZjRPdk52ekMrMTdOZUhKT2QxZlJMNmg5SUdk?=
 =?utf-8?B?Y2NGamJVZ1hCUTFVR245TUlucVlUTk5JK2tBZk0xT3RWZEZKTUxiT3VyaUx2?=
 =?utf-8?B?NEU0ME84bFowT0RSYURFSUtFUFB3UWdjckMwVm8zcnFNWkNldzBYOVRxMTEr?=
 =?utf-8?B?MlJnUVIzMW9BK3BBeEpDTnh2dW5mLzhjcytUZVNlbzhwTUlPUklublZFd0dV?=
 =?utf-8?B?UUZRNGJxVGQwVEI3cnp6OWZodk92QUJST3pYK1lac1FRaTZBeG9qUkVLQWFw?=
 =?utf-8?B?ZGZNd0p3V1lHcXZ5RG9JVkkwUlRBSFF4ajJyU1dQQ3VGSzRwYWtVZ1pXYkRy?=
 =?utf-8?B?Tmc5c0tCT29ZT1h2aXNvK3djcVNsNWxzRDdCN3FhOFZveFA0LzU2KzJUUzhp?=
 =?utf-8?B?VVFHc0RkaEV5dDdaRWxmbzd3QytGL0V3RGcwald5SlZ0ZjN4eWlpSzVUWEJF?=
 =?utf-8?B?R25Xc25PSnhVSHNRN2UwQVlubXRFcURPRDlRam9xZHBFZ3ZKemFhTzNlMFEr?=
 =?utf-8?B?K2VoYzJVWE44bG9PdFNnSTVpSG1raUwwNk1NdS9xMXBNdjRObG5DTjRVT0Jl?=
 =?utf-8?B?a3ZVM0V3MXZNY0ZiVVllTml2UW1haUsrUkc5L214WXFFdVB1dG14aTlWTWdI?=
 =?utf-8?Q?9WFhGIiSrMhe//aY+Af6+lp7XrRjdYJfHNHxqu8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35301e0c-1f92-4806-b2a7-08d91546c1a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 13:06:29.1980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHqXmmKQ57e3Y1HZWmOOHEJIuiw2GGNHMEpFicjpQFWd9XR0B2WXKTzytfSQWsgjEN59kyE8lDGjOls3XOItk1cIy0LMuge9zLmhY/WwDEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3798
X-OriginatorOrg: citrix.com

On 11/05/2021 19:05, Edwin Török wrote:
> diff --git a/tools/ocaml/libs/mmap/xenmmap.ml b/tools/ocaml/libs/mmap/xenmmap.ml
> index af258942a0..e17a62e607 100644
> --- a/tools/ocaml/libs/mmap/xenmmap.ml
> +++ b/tools/ocaml/libs/mmap/xenmmap.ml
> @@ -24,11 +24,6 @@ type mmap_map_flag = SHARED | PRIVATE
>  (* mmap: fd -> prot_flag -> map_flag -> length -> offset -> interface *)
>  external mmap': Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
>  		-> int -> int -> mmap_interface = "stub_mmap_init"
> -(* read: interface -> start -> length -> data *)
> -external read: mmap_interface -> int -> int -> string = "stub_mmap_read"
> -(* write: interface -> data -> start -> length -> unit *)
> -external write: mmap_interface -> string -> int -> int -> unit = "stub_mmap_write"
> -(* getpagesize: unit -> size of page *)
>  external unmap': mmap_interface -> unit = "stub_mmap_final"
>  (* getpagesize: unit -> size of page *)
>  let make ?(unmap=unmap') interface = interface, unmap

Are comments supposed to be above or below the declaration?  The double
getpagesize and missing unmap comment looks like a copy&paste mistake in
the past.

~Andrew

