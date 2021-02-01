Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E240B30A746
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79824.145409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Y2b-0008SH-1Q; Mon, 01 Feb 2021 12:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79824.145409; Mon, 01 Feb 2021 12:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Y2a-0008Rs-UF; Mon, 01 Feb 2021 12:10:48 +0000
Received: by outflank-mailman (input) for mailman id 79824;
 Mon, 01 Feb 2021 12:10:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6Y2Z-0008Rn-Ti
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:10:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d4db2a2-d9ca-4c6a-aff7-a935cf033c2a;
 Mon, 01 Feb 2021 12:10:46 +0000 (UTC)
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
X-Inumbo-ID: 0d4db2a2-d9ca-4c6a-aff7-a935cf033c2a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612181446;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jk0VGGDCLdafKuQSgGrvHoVip91gbWGqE1CZd/yuumk=;
  b=JksPSME9OQJ6xXOnEUzneGJK6g9gUnLkujl6VfH1V6kA0cSdU0SmYd9t
   6GgWkF/+zvnJRgg3uQiq28qCAf+uOxHSd89UXhs4c8PQigbBLd4DWY0Sa
   Z9kXa8Pjat/fzF5hKZSg0EKcxtT8zTSCDaDcJ+BuOegAQ587z9uo9GaGp
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0WceRi0BsSsTGRbF4IVoS0GkpqJDL3Uu3bzyGaF3LjsJBkRigFuyM4X3nLCwRkDSjELs8rx+0y
 Gogaz5+yTjMG+tLUS1eQauovSxr9lz/ry+Ss6gwqf2Ed0nKiErqrNhZhbbFg6bbnBXWkfdnxcy
 PIDgh6ZMJXKep8xzBE3O9TJaHxom8u9MwHvP/2pFQKg/L4LhLiAUHv3qvl8jljN/GZMzk0F3pV
 xAGyra8TNyIfFUSTpcMcj8EOkUVfb2YMy559SevTx83C3g/d73GPdS6Xx9tfXri0ptrQa/wRuO
 +3c=
X-SBRS: 5.2
X-MesageID: 36647773
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36647773"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWLfW5btlNdi8ol7SxhSaX8rB5T7hxV3AY801zqFmewXKxJcVYEr2m50l0TpxqQ0M1hHVmfiGxH2AU8uVJTuaSyswPequXFZa0C4SbvPfHwI+TIOYg5vA0Sp8k9hZ+0DoBVjCWgV2Aw6a+RCK1Lcq6Gif7gnix5KWyYlUqonFNBZkXF9Fd5PDmJu+muIGtzwpbEqahE0fZ0ni1csJkAuV48rCFJ5qbgnG6tKOAVk/b6/WSQ33iQOglihoto3/JP49wbpnHmmpj1JCUe+6agHsk305aBIlIUEmSJlhsX/aUEZmwc6+CRqqg7c8PGDV7n3jmNuzF+bgXFjB5fSYhviKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNk1fO7H6/8CzNxzsFbl+/PTqOzZVtHgN/tfSPzX2ec=;
 b=YNSKKGpAGokkRWzsNuqmRgeAl3q7VKe35kmZbVQTy9h2eCi4ELVYu0iU+w8EW4OBmWN1pJwyIdNPYbUk03wM/YFiILhgGy7HJWTnA6xUa5cgUAlEkBbHhSrmEXu6qjHY4VqxYg1LRqib9uZLP7kx7j8oiT4TnlDzShbHXjHF08c1iLDJRXm3iF7M4QZbz0Tw7Gf1Qmhn1ukYpzpim4udBDmrWmP8Qmup0xGcIrBQ3Pvg1S9qayKPvj6nm6l/u5/R+C4q9AKWkdUe/H8nOK+no0gK3oDIsISG/K/Mr1u1+3lwOV2F5Q8xLSfTTBnpMjhQKt90al9LHcbyZXIJ7c1VzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNk1fO7H6/8CzNxzsFbl+/PTqOzZVtHgN/tfSPzX2ec=;
 b=GQlVA/36PuX3kUqNJxRV1W0s49cTnWcBUTi8H6r0w/6T2Fr70s22uQt1o8/w3ulTXht4HrDffDH6iL6AZsCE5/4DYq/m03Cxgjy4NZRcKI3O9bXg1+u3i8o/+sPukbuXJcOt1ZIjgaZSOtYkGOEf6T/AxahNaHAyzNusyDQowNY=
Subject: Re: [PATCH v8 06/16] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-7-andrew.cooper3@citrix.com>
 <YBfTpTzi+wo7AFSH@Air-de-Roger>
 <53a26fb9-9c43-d1c4-90cd-bb29d57e106b@citrix.com>
 <YBfvGKkQWSisFHNs@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <932c9ab3-361d-0188-e608-2d686fc6b31a@citrix.com>
Date: Mon, 1 Feb 2021 12:10:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBfvGKkQWSisFHNs@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62fa8407-56f9-4ca0-cfc1-08d8c6aa64ae
X-MS-TrafficTypeDiagnostic: BYAPR03MB4534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4534E5B61428D750BE89A921BAB69@BYAPR03MB4534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oy5Mhze/auUCQEXM7My2yUwQ6GM7/Rkmr6abibW72tx2Xr2N+TWQblwB6d8HB0enW5NmJ7DWjUmeqnbizrI4zkS1+RjHHDDnlu4vCrLDxC+JRq92kF9Oe6hRGdZKbmvf5D2aos5QvCi23iU4lwfzDVzHAzQh3h+C28tZ7eq2akRIeCZYghQ5I+yZQDESHe+QFlKUJ4nphyW+f0ds9EB4O8+ouJ73F1AiCp1A/5aHQqGH5IyF65MR20I/+F8whJKPU8D6YiZF/m6BPfwbRdKhZ8kyellVAGsOqE4c72vY2v7VjBd2o21l0tu2qm8NJSnw760QE5UeEXs2vBelDqTEaAGomJkweGaJzXOuuSzOptk749DNGGPoVno0bicHNs+1ZLgDJOLM9aQ6rZ/bGAZ8eZDI4ZZ+YNgke8zOeafWd39fzzKhHums2izmWcw3GzKcvO1iFWKXheWT0ViXZVd095LbfRF+eQCOyxYK8khTWoosMZMGO1jvAdDOk9cbQUiVgMcn4xwdqmY8u/Bvf+OSJqpqqYEzmnjSdbjeDsNXgvpfBu98RUqnTsgV6MPIqpuhjc5HjVeCNG1dRLdQ5lr2JrcFua3UJN0l++QgiLOe2a4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(5660300002)(186003)(86362001)(36756003)(54906003)(26005)(53546011)(7416002)(6862004)(16526019)(37006003)(66946007)(2906002)(66556008)(31686004)(16576012)(8676002)(66476007)(8936002)(2616005)(6636002)(316002)(478600001)(83380400001)(31696002)(956004)(4326008)(6486002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0JQVWh4WWVLTWhWcHhpYnR6TjhKZ3p4L0RLRkpraUFjUVB0d2FrZHRHVHZV?=
 =?utf-8?B?WTJNSlNvMTNmL3FFUTFhc0VsQ0wxRklZMU9hOXVIQlFOTXZCbnZQd0RvOUxz?=
 =?utf-8?B?MThTY1hxb1ZoMXRZeC9OVmN6YTAwNDY5M050akdTVjhSb1NrOFBDOG9kSjRl?=
 =?utf-8?B?SGZwenh2UENyeDgwcVpDaHB5QU1jajFBcS9Na3hyeW9sR1RwblJpemV1UzNT?=
 =?utf-8?B?QThkRWc0WVlySjVKSUwxRUZuSUNNRmFRWEhUMzdFeFZGaDZkb2daQzJZOHJ4?=
 =?utf-8?B?YWduMFdzaE9RWXNHU1hvWXgrSlE5SnFyZGZQRWliQU80ZGtWTldiaEh1b2Nh?=
 =?utf-8?B?MUlVQkFXN2sxM2JSbDVBakllcW9iWkFacFVEU0lNM3o3ZEFYazlMYzFBdVBL?=
 =?utf-8?B?ak52UXlDaWF6RUp6WUZmMkdNOE43d0V2NHRXRE5OdEVFRGp1UzQ0UllEaFJp?=
 =?utf-8?B?eHZIdU0wU1AxYXJIdmVqZ0MxOFhEeTN5THM2NnNNQmhrOXE5SG9VLytUekJ5?=
 =?utf-8?B?TEZMWEdJRkR1dnFscEV3ZHQzN0VaTTE2TXlUWjN1MmdZZUJTdUYwUXNIbmM0?=
 =?utf-8?B?SG80NVlnTGRiRGQ1cjVjKzJleEh4bEtXUzNVTlFoMG1FNll2cXgwSTJBQ0xJ?=
 =?utf-8?B?eGxLSjhzdzlwZXlpWGI3NWlOSFpZVHNIQXZxRmtONEY0U1JkRXFkK2lmeVg4?=
 =?utf-8?B?WnMxSlY4NW95bDFWTVQ4aitwdyt3bGpocStQTDFxTzRjRVBEZUxVZHUrQ0ZX?=
 =?utf-8?B?eGJZMjhIU3puTUEwTG13aHlnbXJpckhBNDdKcnpmZHU3UEVka1hXd1pTM3h6?=
 =?utf-8?B?SXFHc0JaMUd6UUNrcXQ1aTZvK0I0R3J4UVgvWlVzVXlBZFlPdU9wMEVuRnFP?=
 =?utf-8?B?cjZJMGxHZ3JyYXFjN3pWK0NJWHlvdTVjaEVXR0dCSXZsZmFyaTlDZjZEWVVJ?=
 =?utf-8?B?S2hsbmtsSGFTcm5lTnNzZGlOSVAvNkRlVXRDWGRLNzRSc0dDamZjRWZtRTUv?=
 =?utf-8?B?OW1DWU9EajQvTWdHbG85blh1NERXcWZTZHd0ZEduTDlvOE04WmJ1SC9SY3Zj?=
 =?utf-8?B?RU1sYUJGZktGUTM3UnA1a3FJK2t2dVIwMHZPVmQzYThEQ2lNZnVzTnlGdmwx?=
 =?utf-8?B?S2oza1ZhZHYyK28ySmE5VncrLy9DR3pUbi9UbmxPU0Q0c1VKL1k3TmdxL1Nk?=
 =?utf-8?B?ZHQxU3R4eTdlcUVJZkhZaG1xNE54Z2xXc05tZFg1S2tPaTlHRFpDOS9LdTV1?=
 =?utf-8?B?ZFVOam9xMzV1bmN1RS9sZDhSU1ExVml1WldSMUVPZTI2b210d3Bua0xvT3Rs?=
 =?utf-8?B?dS9ZTWRsenUrNEliMjNGTm9DNENsd2YzTXF4UlhFMWdMb1M0NU9laXJodFpv?=
 =?utf-8?B?VU1rdjVObi9LMFc0UU04Qm00Sys0aEJ0c1dzMjhsODZFd0didTdmMWxBeFlN?=
 =?utf-8?Q?SqA54L4d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fa8407-56f9-4ca0-cfc1-08d8c6aa64ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 12:10:41.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YL+OJQe5hnawBj+2a0MAuNLUIkjEBIX4vybu2Ny/hCRqWdT9DrRFB8GSyq+iEFtCgTyT6akVL8ndbeomdXLQn7pqTEzE7m2UwOwKMFgjBLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4534
X-OriginatorOrg: citrix.com

On 01/02/2021 12:07, Roger Pau Monné wrote:
> On Mon, Feb 01, 2021 at 11:11:37AM +0000, Andrew Cooper wrote:
>> On 01/02/2021 10:10, Roger Pau Monné wrote:
>>> On Sat, Jan 30, 2021 at 02:58:42AM +0000, Andrew Cooper wrote:
>>>> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
>>>> +                    sizeof(*xen_frame_list);
>>>> +
>>>> +                if ( start_extent >= cmp.mar.nr_frames )
>>>> +                    return -EINVAL;
>>>> +
>>>> +                /*
>>>> +                 * Adjust nat to account for work done on previous
>>>> +                 * continuations, leaving cmp pristine.  Hide the continaution
>>>> +                 * from the native code to prevent double accounting.
>>>> +                 */
>>>> +                nat.mar->nr_frames -= start_extent;
>>>> +                nat.mar->frame += start_extent;
>>>> +                cmd &= MEMOP_CMD_MASK;
>>>> +
>>>> +                /*
>>>> +                 * If there are two many frames to fit within the xlat buffer,
>>>> +                 * we'll need to loop to marshal them all.
>>>> +                 */
>>>> +                nat.mar->nr_frames = min(nat.mar->nr_frames, xlat_max_frames);
>>>> +
>>>>                  /*
>>>>                   * frame_list is an input for translated guests, and an output
>>>>                   * for untranslated guests.  Only copy in for translated guests.
>>>> @@ -444,14 +453,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>                                               cmp.mar.nr_frames) ||
>>>>                           __copy_from_compat_offset(
>>>>                               compat_frame_list, cmp.mar.frame_list,
>>>> -                             0, cmp.mar.nr_frames) )
>>>> +                             start_extent, nat.mar->nr_frames) )
>>>>                          return -EFAULT;
>>>>  
>>>>                      /*
>>>>                       * Iterate backwards over compat_frame_list[] expanding
>>>>                       * compat_pfn_t to xen_pfn_t in place.
>>>>                       */
>>>> -                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
>>>> +                    for ( int x = nat.mar->nr_frames - 1; x >= 0; --x )
>>>>                          xen_frame_list[x] = compat_frame_list[x];
>>> Unrelated question, but I don't really see the point of iterating
>>> backwards, wouldn't it be easy to use use the existing 'i' loop
>>> counter and for a for ( i = 0; i <  nat.mar->nr_frames; i++ )?
>>>
>>> (Not that you need to fix it here, just curious about why we use that
>>> construct instead).
>> Iterating backwards is totally critical.
>>
>> xen_frame_list and compat_frame_list are the same numerical pointer. 
>> We've just filled it 50% full with compat_pfn_t's, and need to turn
>> these into xen_pfn_t's which are double the size.
>>
>> Iterating forwards would clobber every entry but the first.
> Oh, I didn't realize they point to the same address. A comment would
> help (not that you need to add it now).

Well - that's what "expand ... in place" means in the existing comment. 
Suggestions for how to make it clearer?

>
>>>>                  }
>>>>              }
>>>> @@ -600,9 +609,11 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>          case XENMEM_acquire_resource:
>>>>          {
>>>>              DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
>>>> +            unsigned int done;
>>>>  
>>>>              if ( compat_handle_is_null(cmp.mar.frame_list) )
>>>>              {
>>>> +                ASSERT(split == 0 && rc == 0);
>>>>                  if ( __copy_field_to_guest(
>>>>                           guest_handle_cast(compat,
>>>>                                             compat_mem_acquire_resource_t),
>>>> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>                  break;
>>>>              }
>>>>  
>>>> +            if ( split < 0 )
>>>> +            {
>>>> +                /* Continuation occurred. */
>>>> +                ASSERT(rc != XENMEM_acquire_resource);
>>>> +                done = cmd >> MEMOP_EXTENT_SHIFT;
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                /* No continuation. */
>>>> +                ASSERT(rc == 0);
>>>> +                done = nat.mar->nr_frames;
>>>> +            }
>>>> +
>>>> +            ASSERT(done <= nat.mar->nr_frames);
>>>> +
>>>>              /*
>>>>               * frame_list is an input for translated guests, and an output for
>>>>               * untranslated guests.  Only copy out for untranslated guests.
>>>> @@ -626,7 +652,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>                   */
>>>>                  BUILD_BUG_ON(sizeof(compat_pfn_t) > sizeof(xen_pfn_t));
>>>>  
>>>> -                for ( i = 0; i < cmp.mar.nr_frames; i++ )
>>>> +                for ( i = 0; i < done; i++ )
>>>>                  {
>>>>                      compat_pfn_t frame = xen_frame_list[i];
>>>>  
>>>> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>                      compat_frame_list[i] = frame;
>>>>                  }
>>>>  
>>>> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
>>>> +                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
>>>>                                               compat_frame_list,
>>>> -                                             cmp.mar.nr_frames) )
>>>> +                                             done) )
>>>>                      return -EFAULT;
>>> Is it fine to return with a possibly pending continuation already
>>> encoded here?
>>>
>>> Other places seem to crash the domain when that happens.
>> Hmm.  This is all a total mess.  (Elsewhere the error handling is also
>> broken - a caller who receives an error can't figure out how to recover)
>>
>> But yes - I think you're right - the only thing we can do here is `goto
>> crash;` and woe betide any 32bit kernel which passes a pointer to a
>> read-only buffer.
> With that added:
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

