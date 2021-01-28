Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1D3081F6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 00:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77507.140397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Gmo-0000Db-6M; Thu, 28 Jan 2021 23:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77507.140397; Thu, 28 Jan 2021 23:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Gmo-0000D4-3B; Thu, 28 Jan 2021 23:33:14 +0000
Received: by outflank-mailman (input) for mailman id 77507;
 Thu, 28 Jan 2021 23:33:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Gmm-0000Cz-Ji
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 23:33:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a32c4ae-4761-4f7f-9e4b-13a053a2aee9;
 Thu, 28 Jan 2021 23:33:10 +0000 (UTC)
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
X-Inumbo-ID: 0a32c4ae-4761-4f7f-9e4b-13a053a2aee9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611876790;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=INL2KOUH6+iYPbNdjL+LhDkV3L7K8AYvvmcel43oJUU=;
  b=MBdu2leU3nZWJaC/a6ezUnKMlAzWmJoqNHLJKwfS3gx9h8bhYqxNDgS/
   +Jiu0K2YA3jv0r6y3bflE8bGAECSkDMZXDaktWABoY6ao/sOOwVyORinh
   5HEVm6Hs8S69vCu3SAipsPuwvZkYnToCrLKhHG9VMZC6U5pDEiUwJglo2
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 95o08M4YoNjUSW/qy/MXzhCGD1myZreowWnrzKO4EwQF+sSOvHBoosHl+6XzkrZNn/QXSqvEml
 aEjkzltz568p9fuBUrOrwuM1+8shRr6YdNsZGbIMZ2ZPLww557eVovj3tg1wRGQeg+V6c1EKXt
 gMLOyB7NHNHhGqo91oNATfcdHaT7EJntxwlPfh+7ZaM7LOsmq5ArWR45yo4JQOT9M1AztmbyW0
 H7amJh/JhZi9QPBkpHEir2N6cK3EczdbzL5d8/PY+Hf3qoS8KwbpbnmjznxK4x4cCuUhcfPiWl
 7m4=
X-SBRS: 5.2
X-MesageID: 36488626
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36488626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9Ez63ns23aqAaSZ9t36bw3JfUwtxect2hZizg2sKGmaYatw3deqpUpXjVxECKle4BPdHVL1uLS9q4w5JpG2siH+SMB+pVOqvskt/yCFpg2R8uo9jfH/PCoYkXsBkIhH3SAH747lmweXE0EY0uuqAZPeNvc8vbyNLlmteynrtaxY8tii16NOamzHiHJt4kwJjt6yFPCJshMrZo9ZNaiA6mwSbWukrB9+nqkKMWGKB1f7bhs9jjwfzxpE4RlmSdevUH2tw4F9e2/cgG7N/pM7zIrNrRwxK6+gwbzyzdlcH4A6IMxA2QFtUBlLyM/ol/l4Kpg28KNHMHvtXaL5Yw3ELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLVwV46W+YBJSO5OZt3Zxa12crLy8t/a08LlrxrYFVE=;
 b=JZ5n3rHso3IY9GjQo7fQfGKPSpQ8Z8ZjWpJ4kTvyEPvScgH5Msk+Sa38AvrVutOXv5L2T/qDyLZN7vsuj4CPaACOASS2ZX+RxwmLKTJzHrA0liyOSjfKM8pzLRhWa8Ig7EyQNry8Q7vmR9l2K5ES+c4tXJPT3OpOC1B0xtAsGnzJG3jpXXCYa7nczcPx1wUZBiVjpM8rdo/qUr2CWq6eEKneuTOEnW7vyK0XAotUpCxTAtLk1xihUHemF4bpxVcMDBnSKissEG7bulWnTIwA9m21DnAJMaOLHdCQJ3zFqqY/y1W7s3XLXXrZaDKABn6kn5AwwyipmajZeHBAza+kcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLVwV46W+YBJSO5OZt3Zxa12crLy8t/a08LlrxrYFVE=;
 b=GRA/N0l9xTqlutMDcqaH1Mciui2NrzpTGcFkETvBUdzc7tdD4ZutZ0IeQUve8EW4enQnT2pcbfjH+PcwTWhDmt4eOWVC71MiML4l1GuzbctqdOOMJ3ACuLMq407rT3vgXSQcC5olxTiLDM7wYV2/lMGKywmAVGPHgzn7j8GM8vs=
Subject: Re: [PATCH v3 5/7] xen/memory: Improve compat XENMEM_acquire_resource
 handling
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-6-andrew.cooper3@citrix.com>
 <e8162d0a-b85f-abc4-790e-60ea93a8dc6b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cf8408e3-4869-8fae-fb33-b651ee1f8948@citrix.com>
Date: Thu, 28 Jan 2021 23:32:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <e8162d0a-b85f-abc4-790e-60ea93a8dc6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f058250-bcf4-4355-fb87-08d8c3e50fef
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5501:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5501CE26C7389E82C4713DAEBABA9@SJ0PR03MB5501.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jErvFOt6yv5P5jfzD6n+Dxd3iakRv9agYcE2mDLg1QbF5NL52Q+TTrH+aoetcagZkpHcVgKaq9gQlpU4bQyDYp5v7zExGPDvqMFRIx3hTw07+Eu04xJKlylg9c8obbbO8exM58VyFgcYONxttPVTsa4IlTbFrDPQLRah68lUe5t+NvbsXV2cSsyoyABtFrzvvH629/cipKEKxlcOfCBtipJd0HVoYTjzNpOEtRuoV4fab74eaAOfZr140FpbI9RrsSgxf9PYnXyCzOF5dpXnjjA+21uN+e1RESV/uQM4MArXMAc9/fQuv5bNvnbOCxXPM8/BEWgpr3ieKcJ7udG+ziHhlyvGawyaqwZYAOD87DA4MVPdThymSuuVnrVYs0CkoRR0Me3lwLMoCcqkcogKki+wuBzk0mN3TZiEz3cBogxemgNw6Z3IYoO4bDZZNtvyn559M8URrAFOHoC5HS+E+fB9O9cM4p+ZUdLtplxW5I3BpUdP8z5pAYMkJQFjuxtaSCAaBC5M9818fgtJFJuWW3jWpDdiXo1c0l2cKp0HDHPNp7GLg4v/UJ4Hmjf4wFVEbVu6R+Jat6aONdAcMAxEtWh5E+8WHTP6OmNm0HOm9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(86362001)(16526019)(31696002)(8676002)(186003)(54906003)(6486002)(26005)(5660300002)(478600001)(83380400001)(53546011)(36756003)(16576012)(316002)(66556008)(8936002)(4326008)(66946007)(66476007)(6666004)(2616005)(956004)(31686004)(7416002)(2906002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3hNVlRaQmxkWU9XK21pQ0lSM3llb1EycUR2V0pkTkhXQnhnc0FQWXFQLzlB?=
 =?utf-8?B?TmQ1N3Z2UXlCN25pUEpPaWxVMnVZcVVNUkdiN2JjQlczekk4MkpZN3NBQzdI?=
 =?utf-8?B?MjhGK3ZVVFFkTmdwT0x2bGJYUmd5Qkt3TlVBWWVXdzJKbXgyNDBURmFrNHIz?=
 =?utf-8?B?SVhvWDV1a3dyTTZNYUkxd0lqclFkM0g1ckJiRFA3dUhOUmdzZ1kzWGlodWdW?=
 =?utf-8?B?SjdLNVpMRTVsYm0ybWI0ZDc4elJDMkF1dkRmamFQdlFrSG1vaVlOQkpudTlO?=
 =?utf-8?B?eWZTQmNGdWN4VTMwcXpncEJvNnB6eU5Uem13UTM2K0xITFdrRDYvdmpocXRD?=
 =?utf-8?B?WE9oUi9wR0k5dUhnNFVKZTZoTkxsWHpYQjUycjZVWndLb29VMUlQbERkRlNl?=
 =?utf-8?B?MndHZjNWM3YxbENCbnMyQ1QwT1NqOUFkdm9kemIraEVSamtNR1dzbkRGSWg4?=
 =?utf-8?B?QXpxMThpVU5yOElxTVpYQ0JPZ203VVdMNzhORVgxN3dvaSsxVU0xNGVyN2Zi?=
 =?utf-8?B?RWtzUThBaEtVdXU0NlpNL3hic00zNzJjRy9Oamc3N3h1OGFyTTB4b1FHMXFi?=
 =?utf-8?B?ZFpSMjZ2VmUxUlVyTkNoZi9aN1E2V25RbSt5VEVGTmJVRFUxenh4M25VZjNO?=
 =?utf-8?B?a1hxM1greEplRHJHUmxXRXp4SmFibVRncWhTUkI1ekFWSzNSOXF5cGRieWFt?=
 =?utf-8?B?MUdLZENtRFVWb3FUNzRyQktwUm9yVFhSWUZYVElIZmRqNW5aVUVRZTRhRVJn?=
 =?utf-8?B?VnR0aDNUVUtteUNDaTFJYlE4Q0I5L0FCaS95bXoyQzBadzdIUy9pWWg1TTE1?=
 =?utf-8?B?VEVqSkUxTFF6QkFENHZSMmR6RHZ2WHo4Sk9xN2hueGs3ZmUvcitRNnNRektz?=
 =?utf-8?B?YW44Y3M5M1BRV0xhQ3RzV0VSdXNsQUJpOE8zMmk3U2pQYzI4bGhaSW94S3dy?=
 =?utf-8?B?enpQWURJMHpRcWkraENISVROOUIwY1ltdnpIWWVGVjJtVE51WndXd2hWOEJY?=
 =?utf-8?B?WEIrZEdnRmo0S0pCVE1GVW1FN0puMDI5Ky9oSXlwNW0xVDc0R3VHWktaeHlE?=
 =?utf-8?B?V2hsVHZyMytIU3Z1K2tRUnFwNVNObjdsNVF6UDRjaGM5NG1hdWQxeU9KNzdr?=
 =?utf-8?B?UGxMZlVxb2lqQm5uYmhtdnJCdEZkNnVaR2JFc3RxV09mSmlvelFjTmx0RS8z?=
 =?utf-8?B?eEt2bGJma0xGUzIwVzgrRnh4eFJWRkhtcysreGQwTzdtOGhhT2Z2V2Z5bHBB?=
 =?utf-8?B?MU1BNGVJS1VaNFhNMUJyTXVaMTZiS3RIRDdvUitRZ3hqS0k2dUtRV2tZNXdP?=
 =?utf-8?B?ZzdIKzFoS3E4Y29YNFJaQXBvcGsrSkdJeXdoL0J1UVJjR1FRRlRuZHp6ajVu?=
 =?utf-8?B?QXJaNElIMERXNDlqSERtVkpTTnk3M2lYYzZ5S1BaWkIwWmpvRmQ4WDZKUXp1?=
 =?utf-8?B?TUxnd094b1VaWU1xenpUQ054NnZTSi9ZSGVobWxRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f058250-bcf4-4355-fb87-08d8c3e50fef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 23:33:05.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPsnezZ6aXfMSi7ggA7taWZaICjjpyK/APo7lSKCcbpbC2Ig1QjtB/u+IQ6GW6O9quGUrdogcnRwg7MDsolN022/xiu/wi3mFDd00d8gGSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5501
X-OriginatorOrg: citrix.com

On 15/01/2021 15:37, Jan Beulich wrote:
> On 12.01.2021 20:48, Andrew Cooper wrote:
>> @@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>  
>>  #undef XLAT_mem_acquire_resource_HNDL_frame_list
>>  
>> +            if ( xen_frame_list && cmp.mar.nr_frames )
>> +            {
>> +                /*
>> +                 * frame_list is an input for translated guests, and an output
>> +                 * for untranslated guests.  Only copy in for translated guests.
>> +                 */
>> +                if ( paging_mode_translate(currd) )
>> +                {
>> +                    compat_pfn_t *compat_frame_list = (void *)xen_frame_list;
>> +
>> +                    if ( !compat_handle_okay(cmp.mar.frame_list,
>> +                                             cmp.mar.nr_frames) ||
>> +                         __copy_from_compat_offset(
>> +                             compat_frame_list, cmp.mar.frame_list,
>> +                             0, cmp.mar.nr_frames) )
>> +                        return -EFAULT;
>> +
>> +                    /*
>> +                     * Iterate backwards over compat_frame_list[] expanding
>> +                     * compat_pfn_t to xen_pfn_t in place.
>> +                     */
>> +                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
>> +                        xen_frame_list[x] = compat_frame_list[x];
> Just as a nit, without requiring you to adjust (but with the
> request to consider adjusting) - x getting used as array index
> would generally suggest it wants to be an unsigned type (despite
> me guessing the compiler ought to be able to avoid an explicit
> sign-extension for the actual memory accesses):
>
>                     for ( unsigned int x = cmp.mar.nr_frames; x--; )
>                         xen_frame_list[x] = compat_frame_list[x];

Signed numbers are not inherently evil.  The range of x is between 0 and
1020 so there is no issue with failing to enter the loop.

It is the compilers job to make this optimisation.  It is a very poor
use of a developers time to write logic which takes extra effort to
figure out whether it is correct or not.

You know what my attitude will be towards a compiler which is incapable
of making the optimisation, and you've got to go back a decade to find a
processor old enough to not have identical performance between the
unoptimised signed and unsigned forms.

Both signs of numbers have their uses, and a rigid policy of using
unsigned numbers does more harm than good (in this case, concerning the
simplicity of the code).

~Andrew

