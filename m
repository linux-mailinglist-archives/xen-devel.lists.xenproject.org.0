Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B12F5524
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 00:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66794.118788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzpNc-0004sr-Nf; Wed, 13 Jan 2021 23:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66794.118788; Wed, 13 Jan 2021 23:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzpNc-0004sS-KJ; Wed, 13 Jan 2021 23:16:44 +0000
Received: by outflank-mailman (input) for mailman id 66794;
 Wed, 13 Jan 2021 23:16:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzpNb-0004sN-7v
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 23:16:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7eb4f70-5151-456e-b71c-50e9f3048347;
 Wed, 13 Jan 2021 23:16:41 +0000 (UTC)
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
X-Inumbo-ID: c7eb4f70-5151-456e-b71c-50e9f3048347
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610579801;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=K2HFaN7RU2U6A4y+BKYPMhVaSxTaavaW/a9ylMtJi2w=;
  b=YwXGzDY1iXWqLvaM8mPA39CMSGaC2ZzU2i0FnGwoFF9qNdAbFg9mcpwP
   7qZLRDrE12gR966H6JIZuwseH16PQsjp+jGU+Xx81129kbduX6tsgKx/R
   t02bENQIvNAJ1jcmW1u7k9hC4xXZOm8uhCtfccMQbMkghBwBzW0+m9Jf2
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BZuDTOileh1H3/myOyqEGD/mEWjPUkpx2yh/xOWa4V1GjzPK2gRSgJxWlnWPceP0QvBQvw4KLc
 8j87QseRh8k6SyRU8bi4uEEcdRg6azTibweKLjDa7ivWdl/KDJ5WH15OLuxKiS9FULwO/d8mMk
 PjbcdKlepxWBHFdw/t6qy1i47hFcpLUUjJIvHQQ/u+lAwCiCrd4J5SNPfkWqzVxHNotrwcThQ1
 3gtujvKkGPY2jDbNbP6hOfjMMByXiuPq6XmgK/lDMnWUNpHW2vXc0DbclIyYUdP1ZnTDPNnWZ9
 nNg=
X-SBRS: 5.2
X-MesageID: 35418132
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,345,1602561600"; 
   d="scan'208";a="35418132"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccJiMohUiUrfr9Ipy4aDSn6NY2AwTgQk4P2ow9wEcYchc1Z2RTshHtCXD627Yukng2u4wFMgK/izSslDoVN6puTNKtBTCsvMgPV9VPzCa8lEDFKXseRUO897DcKMHuxC1V/pWI5FVVBjPOyVrfAW8C7jdl4ikWcsFIps9j0xw3kbzwSiq0RzT5KSIiq1pvfvnfxbCzFFn1PuIWBwYo+pz3D/m6cnruconpmVd6HYOdJgyC0FGNr/vDT2iUOJYh7f39Qz/t0f+yP7wWhQ0DwXOUUN486UI9MhYNBdX8pGYY3h51Xz4E8XRY5os/SmiPrrRoW8x7pUTnx3G8Lv8Mr5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIDdBM7VK/oLcUR/++D43bAjEPgFMb0Ef+tcxnQoj3o=;
 b=e5o7N9/ZA8gD+tC0v1AGND9mV3snI34b6fnN4XWG2FDlOwcR0V9E5GO/7bQZnQwgWHbBCTa29r/5mxTDhUxHMdhBHYuptz8Mse6O/fl+2SUUe24x4DncAIfxYnaUHWEXBzRF5RMx+90zcBaGrusdM8qGXiXm8zmD8STVWyaJia+mfKD3Z2CRs5iGHTUe3h/UbhvIPmXAb7brRvR/HYoN8W1z+TSOoT8lwmV3hysmsxI8mzdzD6s5DxjGf1kyRb4qTUxuNUNDW+JCBt+1jcPPPUc4UGQzU+OcYtpeq1w3uQNPIt08gwBSmxbmRF+asqNI94vpmnQgz0vD3WR5okS/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIDdBM7VK/oLcUR/++D43bAjEPgFMb0Ef+tcxnQoj3o=;
 b=iDEE1l3mNkBqHhETK/qEf67CUlK8qC41wgY/c45bJ98yJN5U1vnwdMjHL2lZMRmu6JO6Uo2+VomHJhNRILV1708Cs9ufWZeK0FHoWUQj/oCVGKpNzYQY4D/rbfjpcNSpcO/F8BSpU7+rFHwYq4tktiXiJmf8jiTrRdt0JJwtuwo=
Subject: Re: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-2-andrew.cooper3@citrix.com>
 <dffe4e97-e428-3785-7067-2ea19e9e34af@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1cdbec15-4932-7a64-d45a-6cddb2b67e87@citrix.com>
Date: Wed, 13 Jan 2021 23:16:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <dffe4e97-e428-3785-7067-2ea19e9e34af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0154.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa160a71-e0ea-41c7-20ff-08d8b81945f2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5662F376DFEACE56F7D4D0FFBAA90@SJ0PR03MB5662.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxuNWB/chPqE6mD/gmqKijkgXZOG4MBbq9qcP2Bt+YeHJoemceUF5YVaB5t7q5uwYSCFTpPjX/icUQO7vYDlfEJ9bQWQU9Mn/Gi0Rc3z93Jue3hXwhhZ0nsR8cdouJuGAUtErLAXSdKbQCZLDiT3R44zGdNKHtndZUdOdVhDV8ZlJemS3VaqkXskdfly6TnGJlk6mzefwM4Vm9ezveG9RWCT42hMoERDpXXlTbm0zg5ygyIaLBvI+GBNO3nUt3zPneJv0owJ9G996pN43UWeTUTJOxG8NfF30er9YWCdNIIRbI+paasFRft/KY0oOVCnh2hfWRIUVr+S9TWvb5THcFHWJmTBRYhmnH9kGywlM/mHdLvLrhv6sdljzg+lLrHOnNpQRvaetemASZTEXcsipmRtX71WfwC2iPUl4Ibr8RoiI6thu7n5MhaAW6/wOHZ7JSdAFgBaacW0SfbNmZsONfdpD30AzRDpGON/hPBEak0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(66556008)(66476007)(2616005)(6666004)(478600001)(36756003)(956004)(5660300002)(8936002)(31686004)(66946007)(54906003)(31696002)(8676002)(186003)(16576012)(86362001)(316002)(6916009)(83380400001)(6486002)(2906002)(53546011)(4326008)(16526019)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RjUyVDNwQ1MrR2d6SjRoTldsZFVESmVqaVM3YWZtaXNoTGJhb3Z5TnVpMzRr?=
 =?utf-8?B?R21rY2hROHdIMzFyZTQwZXpWSW9SU3RWK2FqTVpNVDJXd05yZ3Q0cEJlNkpr?=
 =?utf-8?B?YTZ0QWpiK0NwNGVtSXB5cmRJTWVvUi9rYWRvNTZXZER0ZThWNnN5MS9MRFl0?=
 =?utf-8?B?cURkdWc0ZGhFUWtSeGF3czRPOVBkNXMzdGFVL1Y0T3VkcGd4akEvSFdDOUVr?=
 =?utf-8?B?MVRkYTdoRHdnMTUrTWk3YThhNk0xaHpIVU9OTEVkL3BtVGlOVGV5RGNCak4r?=
 =?utf-8?B?eTZjazE1bnRxRVMzNnRaS0xxOVVROUJLVFZHNmVVb3VBeXcrQkt5NVp2eWtZ?=
 =?utf-8?B?OENUY3J0WG9EaExYbE9uSlNQci9PRU5FaHZ4S0M0THBacnZtQkxtdHZPd3pB?=
 =?utf-8?B?emhqYVhtWXE5OElybE1kODNhMUd1Mk1mY002L2NJVTVndVM2OHNRZVAxVStJ?=
 =?utf-8?B?TDF5clVCK0lzT1ZrZDFRdU53dWNWVVpqY2oxRXM3RzNDcXhodjkvVzhQUkpE?=
 =?utf-8?B?Rks2S1piTG8zQ2hpbHRXWkROTmN0MGFGWTZGWmtrY3JLMG5vRGRDc2JMRTQ4?=
 =?utf-8?B?V29TRTdKT21YdGlFbCtRUlRMT3p5SXVkZ2hQbXZycDg5ckoyUFI2VnBYQjQ4?=
 =?utf-8?B?ZVdCemZjRzQ4VHdoVjV3VmxpREhHN2VxU21pOU1kOENLcHZ0M1kxSks5ZFZ1?=
 =?utf-8?B?ckxQaG51c052OExlRGJQdThhaytuWWFuVFFreWpIb1FqRDJOUGtHYnpTQVNp?=
 =?utf-8?B?dytaSTVmY216V3o3WXRoaTdzVmpmTDYyS3lsK3ZORTFmRHlwSWp3TWllaFhB?=
 =?utf-8?B?NEFYdGZwS2NrMjlRZndlZ2VwK1ZFSGo3bXdiRmNoSSs4c0JGVVBYSzhRM3JV?=
 =?utf-8?B?MHdGV2EvVWxaS2szV01YS1duTHdyNFM1ZzJGaVd2ZWNtTEJFTTRsdm5tS3Iw?=
 =?utf-8?B?NzlqazVtckJvb2JyV28vTXpFdk84OTcyL0hsTS9WYnlRUzdjMW1EZG1LdHBj?=
 =?utf-8?B?c3R0RmhQNkRzVm5UK1ZVM0oxT0V3ZHF2aG9oUERkamRYUVplS2tOcWgxNnd5?=
 =?utf-8?B?V1RqeXRqV0JFdTE2SXkwRFdNSWZNa0hQaDBDM0MycXpQR3BSdEdWejRMejc4?=
 =?utf-8?B?SXN2OTRXZlVkYmFYL0hHVnk3QXY5WUJZRGNCclJWaGttU2RFQWR1VFJzWTRW?=
 =?utf-8?B?L1N3MHVocVdGalJPZGtkVXZUcHRKc0VoZmR0QmxIa1F2UUFMb20vNzZuK0Fv?=
 =?utf-8?B?ODIxeUg4c2F6QlIwRDZMbS9vSEpaVjZCSlU3ek5HajZvaFlyeUV5NUVjcXdQ?=
 =?utf-8?Q?ZQRrJ5N+xwkmYyN9mgB7OrIj+OK0lwSx+Q?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 23:16:35.8745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: fa160a71-e0ea-41c7-20ff-08d8b81945f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPvGTbHIqcgqP3PCSPn+88Jg5NzUjAaPnNCcbHJyofe1jsCe86wV54sdzrktU9P2KETNUEsqWDoX6DqUBp1Z3lVT2b5P+AnyE2XbiPeqdOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5662
X-OriginatorOrg: citrix.com

On 05/01/2021 15:56, Jan Beulich wrote:
> On 23.12.2020 17:34, Andrew Cooper wrote:
>> RFC:
>>  * This probably wants to be less fatal in release builds
> I'm not even convinced this wants to be a panic() in debug builds.

Any memory leak spotted by this is an XSA, except in the narrow case of
being due exclusively to a weird and non-default order of hypercalls.

It absolutely needs to be something fatal in debug builds, for avoid
going unnoticed by testing.  Patch 4 is my proposed solution for this,
which will hopefully prevent bugs from escaping staging.

For release builds, a real memory leak is less bad behaviour than taking
the host down, but it certainly shouldn't shouldn't go unnoticed.

>>  * In an ideal world, we'd also want to count the total number of bytes
>>    allocated from the xmalloc heap, which would be interesting to print in the
>>    'q' debugkey.  However, that data is fairly invasive to obtain.
> Unless we used an xmem_pool rather than the new interface being
> a thin layer around xmalloc(). (This would then also provide
> better locality of the allocations, i.e. different domains
> wouldn't share allocations from the same page.)

I'm not sure if using a separate memory pool is a clear cut improvement.

For an attacker which has a corruption primitive, a single shared pool
will reduce the chance of the exploit being stable across different
systems.  Improved locality of allocations is an advantage from the
attackers point of view, but the proper way to combat that is with a
real randomised heap allocator.

Sharing within the same page isn't an issue, so long as we respect a
cache line minimum allocation size.

More importantly however, until we know exactly how much memory we're
talking about here, switching to a per-domain pool might be a massive
waste.  The xmalloc() allocations are in the noise compared to RAM, and
might only be a small multiple of the pool metadata to begin with.

> And even without doing so, adding a function to retrieve the actual size
> shouldn't be all that difficult - internally xmalloc_tlsf.c
> knows the size, after all, for e.g. xrealloc() to work right.

Yeah - the internals of the pool can calculate this.  I was considering
doing just this, but wasn't sure how exposing an API for this would go down.

For maximum flexibility, it would be my preferred way forward.

>> --- /dev/null
>> +++ b/xen/include/xen/dmalloc.h
>> @@ -0,0 +1,29 @@
>> +#ifndef XEN_DMALLOC_H
>> +#define XEN_DMALLOC_H
>> +
>> +#include <xen/types.h>
>> +
>> +struct domain;
>> +
>> +#define dzalloc_array(d, _type, _num)                                   \
> While I realize I'll get bashed again, the inconsistency of using
> (or not) leading underscores is too odd to not comment upon. I
> don't see what use they are here, irrespective of my general view
> on the topic.
>
>> +    ((_type *)_dzalloc_array(d, sizeof(_type), __alignof__(_type), _num))
>> +
>> +
>> +void dfree(struct domain *d, void *ptr);
> May I ask to avoid double blank lines?

Both of these were just copied from xmalloc.h without any real thought. 
What I did forget was to plaster this series with RFC.

>> +#define DFREE(d, p)                             \
>> +    do {                                        \
>> +        dfree(d, p);                            \
>> +        (p) = NULL;                             \
>> +    } while ( 0 )
>> +
>> +
>> +void *_dzalloc(struct domain *d, size_t size, size_t align);
>> +
>> +static inline void *_dzalloc_array(struct domain *d, size_t size,
>> +                                   size_t align, size_t num)
>> +{
>> +    return _dzalloc(d, size * num, align);
> No protection at all against the multiplication overflowing?

Well - xmalloc doesn't have any either.  But yes - both want some
compiler-aided overflow detection, rather than messing around with
arbitrary limits pretending to be an overflow check.

~Andrew

