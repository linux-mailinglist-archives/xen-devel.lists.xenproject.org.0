Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890E321D5E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 17:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88262.165828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEENF-0000qJ-0U; Mon, 22 Feb 2021 16:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88262.165828; Mon, 22 Feb 2021 16:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEENE-0000pu-TP; Mon, 22 Feb 2021 16:47:52 +0000
Received: by outflank-mailman (input) for mailman id 88262;
 Mon, 22 Feb 2021 16:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEENC-0000pp-Vh
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 16:47:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be596848-b707-41a8-a15a-87d03f989a18;
 Mon, 22 Feb 2021 16:47:49 +0000 (UTC)
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
X-Inumbo-ID: be596848-b707-41a8-a15a-87d03f989a18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614012469;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=70Sst0AB2Da/emwY1ASdEevkGhbzuWUaowz6K55cHKk=;
  b=f5OkSOeIlGPAJzV9SjI/DWTuWm2dd7QTKgmR40gXQdW1N4uz0UEKcz0Y
   dIIe5EZirhInhUxVCvi84sz00rCPvnR5FtxbYr22IMqEHxRG7Q2AmPTq4
   vIVIqAup7iZgc/GJtRAgaINlp8mYo4IsjHFq4A1nu636anShp/D3h5ry2
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dU2ipOSJKeeWvGzD4D/f5b3G7ZNwAuB75RxitbE2hWi8YRfUKekA4Rkyg5s0xnmh22cUF1JKNS
 SQDNanqkr1Y7FLPImNH+aHL+OtXqIFZTJtL7XovMNUleeZcRLsuKjroHcgQ8hKikbDTWAAlMim
 z8O0RO4BpWEggdu02XuZa1E00agX6SGrlHURPPYYysqyXftjnGATkH9nchYLXp1xAfTNxjY8Q7
 hpAXqf6yfeqeGIrAnvOAD7UiIJ8SZHpMUtvXnmzxxNqv7dGrllvX8zkmk8fJqnxUWoYksqE3Cc
 LDU=
X-SBRS: 5.2
X-MesageID: 37752078
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37752078"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwi+1G9YCfb4x5t+I8mjYX2IPzdx1xg7NoOViSEErhZxAb0V1gJzd3E8Fe+qF45mG44VWdEXD1bqpttqIJo43mO2fXx0SjYZPiVO5XsRUFy+iv3Dg0hWHdBIDlraiLqWZh99s3OXAUJ3CyjZJivVcPo3afuPd15FC/kqFDLvRsA8lYeshA1yrekNSaCj9dxXvmpymqhOkfXk0FzNmJGnfhx5PGWBoWaM+FbXC3R5B3kK19ytemCFnJZAfrbnpqW/HGqNL6hkxjKvPqULtT+TqJsgzh5MzNJLHswGNwZ0wTQS5pbCHFC1PTsg+DDlCTUfbAOWdP6DDl6jXl+pUJjaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgvN37ACd1a4UDwjqHLdcvk+kqIiDrpjX4DXrjugPZA=;
 b=HG6hxGPsXaG8KBAdPAo6aIG/u3Ir65j7YC1GbOnKNG2B5Pqw6074jLxPOflmBsP62xLwg1TVLl6zxwetWNtF9toelZyS46/qndwkEyEb5HNZk9HyAyCGq2bpaheWJB0uFFJQre8v654fg/zYglgOlxyOOFJNGYA7RBSlzmAmDRorwJSLOLxoI31kup9ahzBeGa5t8ybyegnRArtfryFG0z0F1WuVm0fS0WIBz/Cgd+KHkOUzdS87bwYUwPuDl0oNCW6CG6va0oT5c2elxjOIcbsoq4Mr2jRyQpG95oNxI2RTFUlGTEKfgvS1XWp7/QdNjQI887hub6RUP3U5qw3Qow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgvN37ACd1a4UDwjqHLdcvk+kqIiDrpjX4DXrjugPZA=;
 b=flbujg3KzogSg2CPY6hWJTG2ry51337oUvCrtsK15QjkJBnhBaf0dI864Sky8J62swCj56IJIKLQ5XjRwmHpmV5ouHYfdXWYVKRSOeBdX5flsYhGM1JNn+ev8FbeAprBhEZXRfV3pBDNnf6DyqUeBIWud6AKEYQz21I8h1VJzSQ=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
 <77a36366-9157-c3d3-b1f0-211f4fc39a93@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <60a31ec8-6844-2149-1a04-7e757d1d2dd3@citrix.com>
Date: Mon, 22 Feb 2021 16:47:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <77a36366-9157-c3d3-b1f0-211f4fc39a93@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f9cd8e-0c40-4053-d371-08d8d7519445
X-MS-TrafficTypeDiagnostic: BYAPR03MB4485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4485B7239CBCA50455E643A4BA819@BYAPR03MB4485.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PfPevVfnss+qLa0uRnZZC28eXh+I5ZCbU03JJ9yGl7WQvoZ4xV3BkveV9JDoN7sWiwsxLYkicLJmtT2EJbveJkijpkBSVu7K/PRTN5H4XFxRn0byZxkxb6LfBJ2tV/+TtrXCWSLj5ZpblZxsjM5zxQcS+VS9Ohqg2QPNJ20SQja5EqJQu/6ecku3nnuk5vZhzLVcMRpbjooOGwoR32+05BKUQ/wJRayb/x+j63s4oazYZ35L1yXUuLqgMKXwF7wfhADMwlqL5qZT1+9r89/T+D1Kz6UXxf04+ns+8b0tOGSCf5UaE5y/3v0N0+38zIytANkiFG5Nm+7X6gSi1hY3aLo4p9ae29uodQrez4VqSOw8ujWk30w7y4i4NcNPbmAIgtwMUHU/2Oxp6gQhxzEveXETyCAKDyIsHvEtb8XpS8swfiLQJxpp8g0RU4V8ptarmpNzS7JQpB2YHTSA+c5lCX8e0ua8kO7PyjsrcyVSMwUXspZS6+1lJSUxqu/ALH5rl3cWBthxno08hLu/9SFPYflp/2Y+InS8ll9x6nG9bONYGnzlieiVVLyv8LmVxgvaWi+6bB0DXoufBpw6zhJzojNKS9Uaj/JR6KSGu+uxLCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6916009)(16576012)(2616005)(36756003)(6666004)(8676002)(66946007)(186003)(4326008)(2906002)(16526019)(83380400001)(478600001)(53546011)(316002)(31696002)(54906003)(26005)(6486002)(31686004)(86362001)(66476007)(66556008)(956004)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0lUNGNIaUJ5M0lZTG53eFlpNURCend2U0h3YXFKZEFtZm1Fb2xKNXU1MUl4?=
 =?utf-8?B?WUNZSnQvYTVyc09MMVo0RXlRMnhRaDY2cWFUMnVGU2YyUk0veityTjU4T2Nk?=
 =?utf-8?B?d29BVVRvZWRwVy9reWpIbnFYU0lWNXduZVU1ZlpNTllDSWNVTnJOWDlqYnIx?=
 =?utf-8?B?dU1HMnIxbUcyd0g3Z3BlaURqeEFSTHRMeEtLQzBoTmUza25Sek1QdENEMWpR?=
 =?utf-8?B?bWFkMUVRakJackN6ZFZxdXJoQnM5b0tlY1VSU3FDY09hdGhDVmRQeGJDczRG?=
 =?utf-8?B?RFZ0NklqMEhGcHFNd0UxNmVqdGVhTXRpVHQ4SXNnVW5YaXZubTlOSlhvalg2?=
 =?utf-8?B?Wk9HVVdwOUs2RnhxT2J0ZFR6MHBSRitxeGhxcnd5VnRwTUlIY3RtL0ptRXRZ?=
 =?utf-8?B?VG43YlVLY0NIdFhiQlhkc0d3N2ZRRStRbHBuWUlqb3hhZW1ydjA2VGU0K3Zm?=
 =?utf-8?B?RjZjV3dEVEVNeFAyeVBsYjRsL2R6M0dObjRTMWVuMjJYNG1ybU1JNFI3YnJ4?=
 =?utf-8?B?QkxYa21tcVNMTUhWR1NGVkpWTFZKWFIvVWJkQUxqS1ZsazFvSWRoOVNnRmNj?=
 =?utf-8?B?NDRRb0o5UXZJWE1KZFArS0lmVUdpcjJhRkM4UmhNZ242cHB3OFlQdXFHUlZ5?=
 =?utf-8?B?M3hmSmt4QTVCMUs4bWFYOHVIZklTaGsramFRRmROTDVlWUpQZEQ3K0RIdDZR?=
 =?utf-8?B?bGVEZjFMM1U0R3U1QzZOcGZkNURUTzBYbXFZM1M5ZlJVS1M3bkJWUzlrRDZS?=
 =?utf-8?B?Z1JENklGbVdnRG9udkRUQVRKK3RKNmhLaE1DR3pYQWFkRjV1MXNadDFUUlNu?=
 =?utf-8?B?KzJyRUtaSHFKbjEyd25tT3FKRmhveXVodVg3QnIvUll1d0pnN0tmUkN4bml0?=
 =?utf-8?B?VTZKbVdSbWZaOVlVbXVPZ2VSZHVNZEZLMlRyb2oyajBqWXFLSm1VZFZ3N2NR?=
 =?utf-8?B?T21BSDhibW0vWTF5KzFSUUJYb1ptSk5kLzZ0WElJTlZRSG9mRU1peDEvU0Fi?=
 =?utf-8?B?QkZqV2pyTkRkekk2SUZ0VS90eFVYVmtubjgxdisvVTdkVHlDdFhVcGt5Tlhk?=
 =?utf-8?B?ZkpMRjU3ZmtoNVZVYzRvbHhMaUN3WC9oU1RSNVR4aG1zS014VUtuN0Fjdlcx?=
 =?utf-8?B?a2Vod2JOMWd0amRoYWthNjhwZTVudkU0SlRMa1JvQjlGMDdkNFBGT2NxQUs3?=
 =?utf-8?B?OGt4ZXYxdnZ3V1NTUXBYSmFZdk0vWWNnVTlXYUFwbjVpUzNCcDVzaXpoVWRQ?=
 =?utf-8?B?TjJjV2kvanBwK2lkeENvOENkOVdrVWQ2R1pjc1lXTGpPeldYZmF6bkI2cVdn?=
 =?utf-8?B?TWpjNS9ud1Nnak1WK2MxN3RLbFZPc1ZMMGQxWHZVWEpYRkxuSHAvNnErMGZw?=
 =?utf-8?B?ZlRJZFYvS1pBcTNpZmZFU1kvdU13OGZUajdHUDNNemg1MnFzcnN2Und0Zmti?=
 =?utf-8?B?Vm5LRjljQStUUjAvVWhPem4rM2M1N3ZnMVFtUzU2U2VpTlVhRDQrcE45Nzg5?=
 =?utf-8?B?MDVpR1RGQ3FVL0Q2L2Q3c3VSUXlObzBZTVloczN3cFBna0lLZ3FTajFDVXph?=
 =?utf-8?B?VWpqc3ZITEwzdFJCeVZVTGJVM2NpVDBLZG84cmVMVU5XcTNXaHJiTTFwaHlv?=
 =?utf-8?B?dzdZYWxBZXVhMXQ3cENpZlpYeWlkaTNGUlZ6a3BIZlRwck9jM1FPREZ3NW96?=
 =?utf-8?B?dE5mb1hWZTZ4UWlUbVlmZTBzTWloNlU1cCs4Z000ZC9UVWJTNDgycDBla1Ji?=
 =?utf-8?Q?b9ntEMHS5SMdM/axX13vtCIUNygDAtEqAtZvjaH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f9cd8e-0c40-4053-d371-08d8d7519445
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 16:47:45.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbwCZZhMlRfslZb7YqVoTL8KjJZi85ZzDp2FN/iymvIHiPM/lfotgJbtZWw/vXZpS0OoKFIPTofe68pWcpAq0nX6MZDC0phkM8EkLywh4UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4485
X-OriginatorOrg: citrix.com

On 22/02/2021 14:22, Jan Beulich wrote:
> On 22.02.2021 15:14, Andrew Cooper wrote:
>> On 22/02/2021 10:27, Jan Beulich wrote:
>>> Now that we guard the entire Xen VA space against speculative abuse
>>> through hypervisor accesses to guest memory, the argument translation
>>> area's VA also needs to live outside this range, at least for 32-bit PV
>>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
>>> uniformly.
>>>
>>> While this could be conditionalized upon CONFIG_PV32 &&
>>> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
>>> keeps the code more legible imo.
>>>
>>> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
>>>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>>>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>>>      }
>>> +
>>> +    /* Slot 511: Per-domain mappings mirror. */
>>> +    if ( !is_pv_64bit_domain(d) )
>>> +        l4t[l4_table_offset(PERDOMAIN2_VIRT_START)] =
>>> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
>> This virtual address is inside the extended directmap.
> No. That one covers only the range excluding the last L4 slot.
>
>>   You're going to
>> need to rearrange more things than just this, to make it safe.
> I specifically picked that entry because I don't think further
> arrangements are needed.

map_domain_page() will blindly hand this virtual address if an
appropriate mfn is passed, because there are no suitability checks.

The error handling isn't great, but at least any attempt to use that
pointer would fault, which is now no longer the case.

LA57 machines can have RAM or NVDIMMs in a range which will tickle this
bug.  In fact, they can have MFNs which would wrap around 0 into guest
space.

~Andrew

