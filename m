Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01FA373DAC
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 16:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123140.232288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIWx-00012g-St; Wed, 05 May 2021 14:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123140.232288; Wed, 05 May 2021 14:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIWx-00010m-Ou; Wed, 05 May 2021 14:29:39 +0000
Received: by outflank-mailman (input) for mailman id 123140;
 Wed, 05 May 2021 14:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leIWw-00010b-Nc
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 14:29:38 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f200ba-8d3d-4a72-b54a-749f596f45ea;
 Wed, 05 May 2021 14:29:36 +0000 (UTC)
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
X-Inumbo-ID: d7f200ba-8d3d-4a72-b54a-749f596f45ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620224976;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8OGsTjhqalkfxGekwq98QPFllSJ+iC0LeZE8rigX0ek=;
  b=h/JlqvfWx/Kb7lhQLid3iWJXAfqI4D/HL9OZwSzH57TLlKeSqylN6KmS
   ZruLMOeP43J7uDvaCsO/iu9xZVH1UjJRsbdkH/zgOgPOktbIhWveY/q+j
   fEPco91QwCneXBJytBpZJFml5gWH2345RtPZOLYl+nR4UAeohs+q8XLti
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GEJoPujiSm4460pGyeTxd1p1KUUDWQTBRJPKx/LHEKTGHVBHYmwamMPPd/S77Qekjh0b7ZJmZ2
 pwFtnf8AN6V3fLeimsRrg8QqUQnkSmFVYNxsik3gCUyafaDEcuYg/yPzoOjPNTsw1e1ZuoWM38
 Gw9IGrk6jg3sEU7QwScDXfKrdHt0nJC/VuMWrkNgxqpwUe7SZaUUT+1FfdDSGrhDtHQKFR0EGd
 CAKPQyQ/hIkK+wYs5TXKDCrGKpb9NXewkUxWCbuS7KGbJ7b7fhNZ5sUhw8A3kTwDB/TGOpjqQQ
 vy8=
X-SBRS: 5.1
X-MesageID: 43508936
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:J8DDhK4gv3+NRqPoUgPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.82,275,1613451600"; 
   d="scan'208";a="43508936"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0gnPzerL+8JDgnQQcIFV8e7yGC5Fvb+KGUmjTERKWGC1rqitXY7FxHbVHOV9Q7RI6jn8vH1y8e81K+U2cbXUI/fwxIx/xgtZlX6ewErJQc6JaaHVmje86kCxbYrKW/4eu9/RqeLZ8KY2yFZER1WXYNKmlwWV41qlOJeg3z16kj6V0txykGzO7SWkrRJnoMKPcvE3xj3u7H+ymMUMH2jg9rwo93y+kQA3ZEk3c63Zb+mukwAL29X0SgpgcFHSQR8fEB9t+2h+a1ENnJ+H9XNkP1dGTR0kAqKuJZFageURWzg6XbvvENzWtO6WtFKx+Wm1h7RHgYKGzC5K/IGMc7BKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2mwY0Dq6XSJzaHvRvMrUpwEzdVWGP1uhjH1InxBqHQ=;
 b=ocMTrzanRj8KbG4/20IeTf8Sxhg+/DcAXdGqratTMvCoKyv8Vnk6ePuJqWJ0QnrxLkqO+NoMY3y60fsTXaCk2gJCQ1rnDYNA6MNSRzCf2ezbBuv4SjghekXP5U4xCNUvdqd4jiutnx1bZvbYF742df2GJ5xmrLU5IEzhgcQJ97dHuXCPuSuGOykRLA+vk6Sw3naaseC1OlR8pV7C2NRkLPq7wYimFv6wOECIX+efe8jbvycTzpLyZ7IY59G8waBGXlyoo6DTnTpjIIebyenl/z2SOTXJtLP6uzH73wAPINO9R29G7HgnR0xmMVyuweWTjyQ9Hii0Td6+Go1Y5Bsmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2mwY0Dq6XSJzaHvRvMrUpwEzdVWGP1uhjH1InxBqHQ=;
 b=H0UgieouH9irxfYvAGvlaPzX4vmO0HnawK3IL7nAZMFqI3Wpi/DzUDAewdRjD5HFJq4xBX38WiKKnP5aNhe+AmWLKb/pzqOd6s9IFT1Rb93eQx4OPWROUpytwIurT+O80rDjq1foguD+VoNJ3DtESumWkZywy/t9X22jukVvMV0=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
 <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
 <YJKXZyCHpRg32tyc@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
Message-ID: <38f5b74f-b005-784b-a92d-8ddb9e1b8d3c@citrix.com>
Date: Wed, 5 May 2021 15:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJKXZyCHpRg32tyc@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ffaa77-126b-46af-464e-08d90fd23398
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5695:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5695AE769A72315C0329A12EBA599@SJ0PR03MB5695.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVlmbt16eY0w91cwSgFCunK/cDp+IZbbxpffkI9G+lISDwq/6wVhHgHT+m0dY+8Tn4FMEQLf5gS1HmNGLgFlI0pZn1lBRKlvg/NfQGPHRm9fpOc0yQU3sZwn1QUUgcI7SMqklkVaBfYIAHrEO2gV2+SoYmPH841V+53Komhv8CN5X2IvSOAFNL7/f5MHMhWbL8Ve+Yo6SpAV+KMZzMjiaM3dRegW8KrIdGWFTPHo9VIoSRzyM2QJz1HCE6NmqNyk1dDn7ffYuRw8rd8QRNSCZsVob3OCjMHPcI/sqJZGXNjV7n+266DSBuIwEu2rT/gsTH4cFyd+74ky9AmcZg05a6Xe0bSmYiOJmoLruhtNi/G42veLXPC4PuelUjK8lUUbWXQYXk+PKJamMPDC0iH+vShfeh+7yC0I53pKpMrkkXkxZWQWnoJG/dnXomFBSoyKCu0JuQTbkPO8aZIaPIFDdzCn1Un8T5Rb9fEPvAweU7xiKdOvo6v13cPqlE2c3t3yc7KcQ+W/5qUyPep1YCoGTqAmI2qlYTCvyyLlx+mKLoCCQwYmj/XQnedmLtEUZnSytlsfXj5mi++GXw9XSxYVSPEZK+o3ClsukCcq0R1+oLC9Rq1yaYHRMCiALKC/oXnZjst3BdHyVGRyE7wW686+cDKsfyi7oRZZ6oNr8Od47snugW/vOADBbOhPQt+W0rSi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(6486002)(478600001)(83380400001)(36756003)(38100700002)(4326008)(86362001)(31696002)(8936002)(53546011)(6636002)(26005)(8676002)(956004)(2616005)(2906002)(316002)(6666004)(54906003)(31686004)(16526019)(16576012)(6862004)(66556008)(66476007)(37006003)(66946007)(5660300002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aElzb1VYQ2tsQnJUWVdrY0EwL1FUeDBkZ2kwdjJFR2t5ZGZuTlUrQ0hlVkcr?=
 =?utf-8?B?RVhVeStkVVRTM1p0V1o3bThYVCtGUm9SUGsxb2o0cFY5Q1g4dU93Z2FDTXMx?=
 =?utf-8?B?aVZJcVcvQWJPT1Q0ZnUxeFg0VDVLbEJQaXdyTERTNWZWKzBMblhNcXhKeFJ6?=
 =?utf-8?B?U3U3eXpKSWlmWWFFcXEzRWY3NGhOYzFmWVBlZFpxNTlPeXdMZHN6TDh5Vnd5?=
 =?utf-8?B?SEw1by9VL3RNUFdMMk1zL2VPQUZLMGRKbUpLUGF4VFlZMVVEL2V5WFZaZXg1?=
 =?utf-8?B?TVIzUUU3bmZZOHhQTGF6WHk1bVRLbnBNakxpcjR3aGxxeG9oY3BHd29FSGdq?=
 =?utf-8?B?OXB6dE1xZS8zZGhqMTVTOGczLzN4Zy80TlpqUW83ZzFyK3ZJN0UwWlJacmZ3?=
 =?utf-8?B?bTF0OGQ4cUJrZi93OEZsWFZ1ZkozYVhlWUs1eGlsakFHMTVYZkF3Y3pNaTcw?=
 =?utf-8?B?SlV2NzdVZjhzbEJLNVBibi9tSWJ5UEtUTklqMkVTMWlxamNtcjZWS0Mrc3p0?=
 =?utf-8?B?RkZyazhxcXNQY2VIT09zNjg2WjFhUDIvVzErOXVURkVBeFBiYVV1UzFNTnBU?=
 =?utf-8?B?YlovVDBLK0FPaXVoSWdWWDUvRVFGb0R6WWE0V1dQQy8wdWpoZzhtMFR5RDJC?=
 =?utf-8?B?b2ZtdkVobVI3ckFibEtWbEpHMGRxRWpVczRhN3NnT3VWcDBHSGxxVHliTFJx?=
 =?utf-8?B?MElwckRUeC9NYUlvcm1RU0c5bytBQkh2ZS9KREhWODVobENJRXFjdFpseEZ6?=
 =?utf-8?B?MTdHdEdzcElEYXhXTGljVG5NcXhlanRWWkVxV0hVOUd5QlVTdHNxUGY5aE9n?=
 =?utf-8?B?cWZWWjFJbEV1S2Z1NmZabkFPU3E4bWIzcytpaFlUVEZqSENnRXdiS3lQLzdP?=
 =?utf-8?B?NnRsOFh3OHByblZVWWlMZXBxK083SElKNlg5Y3ZXdlh0Wkp0TS94Y255TytT?=
 =?utf-8?B?UzNMMG9XY3VZTmpPZFAzVVd3OHkrRmxpRGpMRmJVWWZjTlZvQWhlZTlDSVhC?=
 =?utf-8?B?dm9PZTg1VHNZOGZOUmdSRk05QnIzeExIaEFPcXJVZksyUzM4d3RhMVNiWnNw?=
 =?utf-8?B?dm4wbkgvMHFxbXorVDVRTHAzWDBIVHhQWWtDZkdXT0Y3d1RLYUZXYjczZzBs?=
 =?utf-8?B?blU4VVhQb2lFY1J6WEplK1BUK0xrL0xyc0htSDh1VmEydFRGdHRaSTBYYXNn?=
 =?utf-8?B?VzhKblVVRlQwQThmdVR6Uy9jcWVaWlI3OTVUTzRZL0VKWnp3YWxlTC92UnUz?=
 =?utf-8?B?Y0Z4TkttOExCV2JBeUZyeTlCa014TExDblE5UlVkam1GODhad0M4Y2JYWkdh?=
 =?utf-8?B?Tk5JWTdmWG9Tb25Kb2hHYSsrU1NnUzgrRVBTRXFuRWFJU1VDWEcwWnlBRnRI?=
 =?utf-8?B?RG4rd1haRUVBbzZFWTZQNzU5Q3Q5cEx0ekNCK0ZOczJJNGF1RHA4UGlickVC?=
 =?utf-8?B?R1BUZHhQTUdrNCs3bTVrWXI5cEd5ekRKYkFkWG9EOWtUZXNRUFNOa1hFak1K?=
 =?utf-8?B?cEYvdEFJVzFVNzM3QXhnYkR4QzlLM29IMUZ6b2FEMjJZUlZJS1FhaG1lZjVO?=
 =?utf-8?B?V2pjYWswcmhzOFRra21XWEZaSUZHUnNuMVgza2N4UFhjNldHZ1VvRUwrdXpk?=
 =?utf-8?B?R1l0eW1adzNZeXZsNCtCMTg2R3Q3OWpmaU1TSGFVampGOUUvL1QzcFVtMVZJ?=
 =?utf-8?B?MWxrYTZ4ZWNnUHcya2ZmaklvOTBIRm5xYkhuejZJdzdoVFBjbkI2Q2dtTUVv?=
 =?utf-8?Q?Q/U88ozn+abv1HqAkvpaF4f71I8IwKS1C027b5S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ffaa77-126b-46af-464e-08d90fd23398
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 14:29:33.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRzCOY0tk7YaYMmGh+6x/VBczYaz2AcNSzAw/LDpOhUQ559cXa+tK/hNRxi1B8QvXuColptMlsy9waUhBhyTLAlZWr+VD3WALU8H6oQ9qP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5695
X-OriginatorOrg: citrix.com

On 05/05/2021 14:02, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 05, 2021 at 01:37:48PM +0100, Andrew Cooper wrote:
>> On 05/05/2021 11:04, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, May 04, 2021 at 10:31:20PM +0100, Andrew Cooper wrote:
>>>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>>>> index f6cea4e2f9..06039e8aa8 100644
>>>> --- a/xen/lib/x86/policy.c
>>>> +++ b/xen/lib/x86/policy.c
>>>> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu=
_policy *host,
>>>>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.ra=
w )
>>>>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
>>>> =20
>>>> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
>>>> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);
>>> It might be nice to expand test_is_compatible_{success,failure} to
>>> account for arch_caps being checked now.
>> At some point we're going to need to stop unit testing "does the AND
>> operator work", and limit testing to the interesting corner cases.
>>
>>> Shouldn't this check also take into account that host might not have
>>> RSBA set, but it's legit for a guest policy to have it?
>> When we expose this properly to guests, the max policies will have RSBA
>> set, and the default policies will have RSBA forwarded from hardware
>> and/or the model table.
>>
>> Therefore, we can accept any VM RSBA configuration, irrespective of the
>> particulars of this host, but if you e.g. have a pool of haswell's, the
>> default policy will have RSBA clear across the board, and the VM won't
>> see it.
>>
>>> if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw & ~POL_MASK =
)
>>>     FAIL_MSR(MSR_ARCH_CAPABILITIES);
>>>
>>> Maybe POL_MASK should be renamed and defined in a header so it's
>>> widely available?
>> No - this would be incorrect.=C2=A0 The polarity of certain bits only ma=
tters
>> for levelling calculations, not for "can this VM run on this host"
>> calculations.
>>
>> If the VM has seen RSBA, and Xen doesn't know about it, the VM cannot ru=
n.
> But then the logic relation between
> x86_cpu_policy_calculate_compatible and
> x86_cpu_policies_are_compatible is broken AFAICT.
>
> If you give x86_cpu_policy_calculate_compatible one policy with RSBA set
> and one without it will generate a compatible policy, yet that output
> will be regarded as not compatible if feed into
> x86_cpu_policies_are_compatible against the policy that doesn't have
> RSBA set.
>
> I think the output from x86_cpu_policy_calculate_compatible should
> strictly return true when checked against any of the inputs using
> x86_cpu_policies_are_compatible, or else we need to note it somewhere
> because I think it's not the expected behavior.

Welcome to the monumental complexity, and the reason why this isn't 5
minutes of work.=C2=A0 This is just the tip of the iceberg.

"Please create me a policy for a VM" is conducted across PV/HVM default
policies, and/or user settings, while "Can this VM run on this host" is
checked against the max policy.=C2=A0 This split is necessary to cope with
the corner cases.

So no - levelling max policies isn't expected to result in anything
useful, and calling is_compatible with a default (rather than max) host
setting also isn't going result in a useful answer.

And yes - for some changes, RSBA included, you're going to need to
update all your Xen's across the pool before migration is going to work,
but that's already the case now.


Tangentially, we haven't started yet on

struct irritating_corner_cases {
=C2=A0=C2=A0=C2=A0 bool vm_not_using_fcs_fds;
=C2=A0=C2=A0=C2=A0 bool vm_not_using_lbr;
=C2=A0=C2=A0=C2=A0 ...
};

which will require explicit user opt-in to override the "No - you can't
migration across the IvyBridge/Haswell, or pre-Zen/Zen boundary".

Technically, MCXSR_MASK is also a hard blocker to migration, but we
don't even have that data in a consumable form, and we just might be
extremely lucky and discover that it is restricted to non-64-bit CPUs.

Migration with a VM having turned on LBR is still a disaster.=C2=A0 For now=
,
we drop everything on the floor, and let the VM explode if the
LBR_FORMAT has changed, or if the number of stack entries changes (which
does change with Hyperthreading enabled/disabled in firmware).

>>>> +
>>>>  #undef FAIL_MSR
>>>>  #undef FAIL_CPUID
>>>>  #undef NA
>>>> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cp=
u_policy *host,
>>>>      return ret;
>>>>  }
>>>> =20
>>>> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
>>>> +                                        const struct cpu_policy *b,
>>>> +                                        struct cpu_policy *out,
>>>> +                                        struct cpu_policy_errors *err=
)
>>> I think this should be in an #ifndef __XEN__ protected region?
>>>
>>> There's no need to expose this to the hypervisor, as I would expect it
>>> will never have to do compatible policy generation? (ie: it will
>>> always be done by the toolstack?)
>> As indicated previously, I still think we want this in Xen for the boot
>> paths, but I suppose the guard was my suggestion to you, so is only fair
>> at this point.
> TBH I replied before seeing your email that also had this suggestion.
> If it's indeed going to be used by Xen itself then that's fine, but I
> couldn't figure out why the hypervisor would need to generate
> compatible policies itself.
>
> Maybe it will be used to generate the initial policies?

Yes.

>
>>>> +{
>>>> +    const struct cpuid_policy *ap =3D a->cpuid, *bp =3D b->cpuid;
>>>> +    const struct msr_policy *am =3D a->msr, *bm =3D b->msr;
>>>> +    struct cpuid_policy *cp =3D out->cpuid;
>>>> +    struct msr_policy *mp =3D out->msr;
>>>> +
>>>> +    memset(cp, 0, sizeof(*cp));
>>>> +    memset(mp, 0, sizeof(*mp));
>>>> +
>>>> +    cp->basic.max_leaf =3D min(ap->basic.max_leaf, bp->basic.max_leaf=
);
>>>> +
>>>> +    if ( cp->basic.max_leaf >=3D 7 )
>>>> +    {
>>>> +        cp->feat.max_subleaf =3D min(ap->feat.max_subleaf, bp->feat.m=
ax_subleaf);
>>>> +
>>>> +        cp->feat.raw[0].b =3D ap->feat.raw[0].b & bp->feat.raw[0].b;
>>>> +        cp->feat.raw[0].c =3D ap->feat.raw[0].c & bp->feat.raw[0].c;
>>>> +        cp->feat.raw[0].d =3D ap->feat.raw[0].d & bp->feat.raw[0].d;
>>>> +    }
>>>> +
>>>> +    /* TODO: Far more. */
>>> Right, my proposed patch (07/13) went a bit further and also leveled
>>> 1c, 1d, Da1, e1c, e1d, e7d, e8b and e21a, and we also need to level
>>> a couple of max_leaf fields.
>>>
>>> I'm happy for this to go in first, and I can rebase the extra logic I
>>> have on top of this one.
>> There is a lot of work to do.
>>
>> One thing I haven't addressed yet is the fact is things which don't
>> level, e.g. vendor.=C2=A0 You've got to pick one, and there isn't a
>> mathematical relationship to use between a and b.
>>
>> I think for that, we ought to document that we strictly take from a.=C2=
=A0
>> This makes the operation not commutative, and in particular, I don't
>> think we want to waste too much time/effort trying to make cross-vendor
>> cases work - it was a stunt a decade ago, with a huge number of sharp
>> corners, as well as creating a number of XSAs due to poor implementation=
.
>>
>> For v1, I suggest we firmly stick to the same-vendor case.=C2=A0 It's no=
t as
>> if there is a lack of things to do to make this work.
> OK, so level all the feature fields and pick the non feature parts of
> cpuid strictly from one of the inputs.

The awkward part to address is that we've still got simultaneous
equations with feature handling.=C2=A0 I'm fairly certain that the simple
and's which both you and I did won't be sufficient in due course.

~Andrew


