Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF977401A75
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179646.326028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCeK-0002gW-Fj; Mon, 06 Sep 2021 11:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179646.326028; Mon, 06 Sep 2021 11:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCeK-0002e7-CC; Mon, 06 Sep 2021 11:18:52 +0000
Received: by outflank-mailman (input) for mailman id 179646;
 Mon, 06 Sep 2021 11:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNCeI-0002e1-NK
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:18:50 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35136e66-0f04-11ec-b09e-12813bfff9fa;
 Mon, 06 Sep 2021 11:18:49 +0000 (UTC)
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
X-Inumbo-ID: 35136e66-0f04-11ec-b09e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630927128;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UGxqvqQGjENugmIZlJdv6hd3iip9nYlhxFfwYqsejpA=;
  b=O1pZjZRvTM276/T8roanNsFyDFoG4+krJRgHIG+XSDegMVOmoCGKLjMe
   uVyP7QsojVGfb9KYF8Jkw4V87w1OYl2/Q182Mdh5cuNk+vUPBrr/VJYYM
   QtehVa9S0QqxVhdk/6qtpYRZmLPpwnXeCFiRF7CUKe2VwE01ibIglJUeU
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9UqJlYe1eqL2Dv9Z2t16LuKYX0yFqSP+7scu9rBlrvCeY3EYfNfMIda9FVfG+YfjFUVBp8VDMt
 vRRFR3Ealss/X9PCPiDpJs5iKxkEH0ezMAuCDw+Pd5URBhkeYSUpYHKUGS9qiwYYeCWn1JfU06
 Pqkfh+6wHTzL5tEOgjBpraWtQxEhPpRJjfaRzz2fdHigUEdyJIJxkLlvVX20ptI9Eqn3XHv70S
 kw98ZgxjuxdL4RSVnysg/0MZ1TyKl7zOnJ26kJo548hV9m2rbM0fuM8dL9ko3P/CEu8IqOAGxx
 iZ3K+XuMJbIKlZrgJOI2cLn3
X-SBRS: 5.1
X-MesageID: 52082718
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1Ym+2KACDVsh0T/lHeglsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90dq7MA3hHPlOkPYs1NaZLXXbUQ6TTb2KgrGSuAEIdxeOktK1kJ
 0QDpSWa+eAfmSS7/yKmDVQeuxIqLLsndHK9IWuvUuFDzsaEp2Ihz0JejpzeXcGITWua6BJc6
 Z0qvA33QZJLh8sH7WG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNxN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wiJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABCnhkjizy1SKeGXLzMO9k/seDlFhiXV6UkXoJlB9Tpc+CRF9U1wra7USPF/lq
 /52+pT5elzpmJ/V9MKOA47e7rCNoX6e2OFDIujGyWTKEg5AQO7l3fW2sR52Aj4Qu1F8HMN8K
 6xGW+w81RCIH7TNQ==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52082718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfjvxeuYzk9xRximLHfT1uCp3BqMPTwM+t1MFhP7VM4LKf4cuYzKWsvXDDp/fsVWsJIYWSzMREH96vwZxb2kNTkh/srzEdU37ZlVkYtFL6KJJ91uCBlZFCg/RS0PuZHaa0OEyf0sz0Rn8UZ3qJbGqan6nBpROCVkmCjMmD+KYUJJBJnRDjQGpoWhB7QGVcQ+TJ54OwTHe51aZ15TjlJRaixe4tPX1KffAVPScdFAyjhpG95GuWPrl0npPB2ZbF05ovnITDtrPF3Z/d0HkfjGp95Trs3AE/B9OtTFajeBVadT9Jky6lvUZjcJscmUNUWbZMacHJCqI7xX10/+cEktRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PRyRSKeSK8xNzfD/CkdS3fjOL8eQZf6W+On4hkPJgyY=;
 b=EVZATBHR2QTHRMBDr6eciyk5kLKhOS+R3maEnPpRg+DhwVcU5VV6TZ+1e2D2ntozFc7PbEKPN7IlK1JFghYz9MZGXC6rHLDhA33J9RTC7XwLkexUYqbINpZ9qKQ+55+jSUBjyuB226eGRBM0G9s4ln9ZInYdqkX2C5uio+xHzd/ND3O1iXkaAeRjy8Ywt6jBYtlnzshvMf9iR1qyoOwDUziLuauTjbLdpN/vM5qjm5W4q3jASWD5MasqEihSZS0hVI8BmsKw4AiH+vmIQ2e7U7lF2W3uVi2uOgB8EUaSwLz/x1p1TB4kWDAOeIz8XONpyRuefMJt8fNLJ9PMBF8YZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRyRSKeSK8xNzfD/CkdS3fjOL8eQZf6W+On4hkPJgyY=;
 b=mK6qUL4ivudI9fYpmaG9Uy/AAWlLffwiXIRivkdvlmcU0OBn0bNz5wB2SOhhibADxvbbPIu73iSGtOeRUgu/6ou95Rj99aTt1r18SW8WmfVg2NGawzsxnUCnNfaRTbUBnq5CoqNindzC0jme6r/EvAj5sCOQV7aePu6w5ZqXRco=
Subject: Re: [PATCH] xen/sched: fix sched_move_domain() for domain without
 vcpus
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20210906110057.15384-1-jgross@suse.com>
 <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
Message-ID: <2a42660c-e1ae-c791-784a-da39e64473f3@citrix.com>
Date: Mon, 6 Sep 2021 12:18:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3192ee62-46e8-4a02-093f-08d97128162d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3669:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36693622FF85E26EC78E8FC7BAD29@BYAPR03MB3669.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jt4BjobyesaZRW/Oxf4xa/EFF/Ar6/NQ6VO64zIE0xRXa/4CuAMnIcthjTlmFLww5OF3nUPqSx1X9zuB5uFAeER1jD21VpdVE7VuDpD3wsgCRhbXPFQBEJ9EQdfgXLSR0MKXVxZ2Q6MCkYXIdUZm3kHOJSNLv3spKs3L6JHkLm06CksIfhgtE+xiX2BOwYRrkR7EIwS1e4Ghq3zsduo4jDlELPSNqq1js2AioLaN6Kwv++wCi/AKATjbpRzSQKizg9zXqsKGeCICM2Cf8hRY1SY+O4NGdzvVE36Yw66D8LmefaGJxKZ4YSsjTwcrNedevaYhFzmZ2sd3UQrcdX0htAJJEn5R636kE3tkSPCOpeBoGgkC/5ZJeYts5hiC5buXcTZM8jZduv9ckui+dBHRzqoue6rLCaa6d5Qk54Q8K5hLmfbP11N8ochgkHrcZUZALnm4DE1y1V77xPrb2eX7YO6cTpDZrPkEeGh7JumfuqGulZW47eMpma1L7PBsE5v5zTvQYaZoi51DEPIXowOdv1ibAsZtDaaTNSvZwYNuD2NhRCICLVKPPnHxgwV1OFb2LjRvKxGe+ukI1MQIxgPm+TU6VRzEyXqgCUOzL0Mx4f6RZwoYsqZea4ZWb7/iB7A6TIJPtT9ocENehYnS0W5n5LxCVmeigTCA5910ayBSykn2KMb4OxoYWaBJbLJIo49xrG6ktewQv+xAsnnOLWuoIQ3Sy2YtBCkJ1fsjFyVe/EI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(66476007)(31686004)(8676002)(36756003)(5660300002)(8936002)(31696002)(86362001)(6666004)(54906003)(16576012)(66946007)(55236004)(66556008)(6486002)(316002)(2616005)(956004)(4326008)(478600001)(186003)(26005)(2906002)(38100700002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhtdkpnMTU5WjdNZzRnMUVLYVVhSlhwVjZ3bmZKYW5mQUM4eVRRcTlYTXI4?=
 =?utf-8?B?ZEprM21pMTREVzlPRExrZjZjQjFsQWl1b0RVNHRkSGR2cS9MemkxdUZHZUQ2?=
 =?utf-8?B?YXMvSUUyc3k1dnFLVXdqd2s3WTJjUHJqUXBSRTRKTUtsQ1VRVjQ1c1R0ZUw2?=
 =?utf-8?B?VGJXVzZ5c1V3TUtPTFdYZjllWHAwQlo4eXNRTjNwQ1BPcWwwOG5wbzJFT0Fz?=
 =?utf-8?B?blV6K3AxdDZCSjU4OWFLSENxNHB3bHNuT2JKVWpnN3ByK0N1UUJvUzBQdlhU?=
 =?utf-8?B?UG1mV2cwalVkQ3BsVGpocnZmSVQwWndQUEtBOXgzOXdTT1lVeTFYcFplMFp3?=
 =?utf-8?B?c0Q3bDkvb2NCNzE1eXl5UWVwR0FHWng1MVFKQ1F4dWNPSHYzYTc0aDRPQ1c0?=
 =?utf-8?B?TUQzeTJrNlNtSG9xN1I3S2FLOU9PeUJsd1l0Q3E4eHZwcWJuT2c2MjFNQk5E?=
 =?utf-8?B?UWFNN2hTY0ZrUDZXY3Q5cjRCdUdxNVN4QXQ2dCtPZFYyWmhmU0VSdC9yWDZJ?=
 =?utf-8?B?SmNLTThGa3BWS2Zucm5CWFZUMS9uVXBQWHNlZm9PYm9LdGg5YnJKK0lFVHh2?=
 =?utf-8?B?aGY4bUFvMll0QjZjWnZGYStJTFRiUVhFbWUrdDZ2SzNWalJVbVpES3QvZ2NK?=
 =?utf-8?B?WEFybURzN1N2cDU5bjFWQmJHZmFGdFl5OHBYQkJGdDVmTTFKbEV4RXBqUTJx?=
 =?utf-8?B?VW0rQ2sxY2xpUWQ3b1dTNXVXZG5GT2dIa1hwWUN3bFh3Zis0ZEpQbS9DaUJv?=
 =?utf-8?B?dkJKbHBjZk5wUEl4TnllNnArbkl0bVdSVXRIS2hQWVZrOGIvMVNaNE90bmVr?=
 =?utf-8?B?dEkydzZJSG1tbXRVdE9pQ2xNdTFwU3dTWFJTYmRQTTFtd2k5SmhFc1lpdDRX?=
 =?utf-8?B?aS82bkttK3Rod3c5K3c2UlJmWEk4UlJGdCtkdUl1eGtvTjdCN3d2YlhOYzEw?=
 =?utf-8?B?dlFJbldGbXdKVmtQZi8rVFNLWmRmNllYSXVPOFF1cHpWdzU0dWtmd29MVUJK?=
 =?utf-8?B?WkFnOWdGVEJWbnp5eEdITjFjSUcvMExZMmpjZi9UQlA0aHB0bEZoSGRTcENH?=
 =?utf-8?B?RUtiRHVrb0FoNmlwNWpNSEs4czdyVHBmZnFLM1o4TnB0emd6NlFoL0ZIVHNm?=
 =?utf-8?B?eWIrMDFzOXc2YjNQdm8zcllPSFRKSW1vdXpMaWl3OG1reWZXRFc4bjJzMm9F?=
 =?utf-8?B?MnVHeno4aVh0eVN4SmJrdzk5cVlxakRnVGpZUzFDZFFmSGZvYU85dloyS2Zl?=
 =?utf-8?B?ZDV0cWVLbU1ybnR0SU9RZFFLZ3dHaTkwQldOZ3REcEpiNHlzWlZWYWN2Skl6?=
 =?utf-8?B?RU10S25JRjhKK1FjeUp1T0h0L090a3ZnZEx1Y0NSbUxwcEx3YWNGc2VmR0dt?=
 =?utf-8?B?VXhEN0pJTklqM3hZTWVXaVNHc3NkQjRlM3BoMmNiQjJWcm5aa3J3SGpNT1pi?=
 =?utf-8?B?K0xaelpvdEZwNzVNRVA0NWFNK1lVTVNDVW1yUWZrS0VRdlVRZlBwSnFrUzBU?=
 =?utf-8?B?WXF0ZmJXUlBNaDQ5d0U5OHg4SmVZQ1VJRTE0dnAyRnc1SE1WOG1teWI4MXlJ?=
 =?utf-8?B?d283anFFdUhFeUtUamRJdXAyd0RDejdqb0tPZTRzTjZ3SXMrUFRjcFJISzJq?=
 =?utf-8?B?cnNkWVYvdlNMUGlLMmlsdjY5T3VUbHJ3WmpKYnlsTzBFTmVIRHVCSjBKS2Vi?=
 =?utf-8?B?S1Vnb0RZaWpJZ2xSKzI0WTgvVlJBbDZvOXZ5cmdBZjZJQlZRbmpjakw0cVk2?=
 =?utf-8?Q?pVQ0VIgY854DbH4SZBk71eKkHJGJM/HlUryC1NA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3192ee62-46e8-4a02-093f-08d97128162d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 11:18:43.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6kutlrTSiw1q/o0x5sTJaZ4ylVdG1TLZSnRidwCxdf190au1FI7WTdxf/H+bNsLcMQCjVbX4nh+Y1ofy6xc95OQjPLEzNV1CPMq4k+An2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
X-OriginatorOrg: citrix.com

On 06/09/2021 12:14, Andrew Cooper wrote:
> On 06/09/2021 12:00, Juergen Gross wrote:
>> In case a domain is created with a cpupool other than Pool-0 specified
>> it will be moved to that cpupool before any vcpus are allocated.
>>
>> This will lead to a NULL pointer dereference in sched_move_domain().
>>
>> Fix that by tolerating vcpus not being allocated yet.
>>
>> Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpupools with different granularity")
>> Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>  xen/common/sched/core.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 8d178baf3d..79c9100680 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -671,6 +671,10 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>  
>>      for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>      {
>> +        /* Special case for move at domain creation time. */
>> +        if ( !d->vcpu[unit_idx * gran] )
>> +            break;
>> +
>>          unit = sched_alloc_unit_mem();
>>          if ( unit )
>>          {
> I think the logic would be clearer if you wrap the entire for loop in if
> ( d->max_vcpus ).

And of course, this is wrong.  Turns out the domain_has_vcpus()
predicate still hasn't been committed, but d->vcpu[0] is the correct
internal.

~Andrew

>   This loop is only allocating units in the new
> scheduler for existing vcpus, so there's no point entering the loop at
> all during domain creation.
>
> Also, this removes a non-speculatively-guarded d->vcpu[] deference.
>
> ~Andrew
>
>


