Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6901FCC25
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 13:21:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlW84-0001IU-VO; Wed, 17 Jun 2020 11:21:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FoJ=76=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlW83-0001IP-Gv
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 11:21:15 +0000
X-Inumbo-ID: a7d1a4f4-b08c-11ea-b9cb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7d1a4f4-b08c-11ea-b9cb-12813bfff9fa;
 Wed, 17 Jun 2020 11:21:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Njq6p6HfjQdQHbyy4JlsVIjH0+75e7NKJDU83mJN1ti+K0ene32611xjfCepaaYxziWuBS/TZ1
 7fqMqTpoh64oH2p7qRdnml4FlVn8Fe+w8W0Yp+T6eTtsN1LqWGNpV40yumSKGyNzvIvaerLgCu
 HAD7wk/hFdXrbWIeEKtgfwzXcJPIIqWI8AAnrYOTtYBHLM0h0bzjiGDXToCnB2plymCm1KEjSu
 ZdK6+Fud+XG2DMYW7SRCWos66J4flNXkS2lX4o8MODC8NPpSDvGomr/kkyRXpTmC7f89dM9eyo
 MZw=
X-SBRS: 2.7
X-MesageID: 20487720
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20487720"
Subject: Re: [PATCH 9/9] x86/spec-ctrl: Hide RDRAND by default on IvyBridge
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-10-andrew.cooper3@citrix.com>
 <a0733b2c-da6b-e5bc-3041-de30002bcb47@suse.com>
 <00db98fd-d268-71ae-fad1-fb59d2f1eba1@citrix.com>
 <bc5d43b4-afbc-0732-b24f-2edfa939a961@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <63106e4d-3603-9054-c144-1b89d11e30a0@citrix.com>
Date: Wed, 17 Jun 2020 12:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bc5d43b4-afbc-0732-b24f-2edfa939a961@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/06/2020 11:39, Jan Beulich wrote:
> On 16.06.2020 18:26, Andrew Cooper wrote:
>> On 16/06/2020 11:00, Jan Beulich wrote:
>>> On 15.06.2020 16:15, Andrew Cooper wrote:
>>>> --- a/tools/libxc/xc_cpuid_x86.c
>>>> +++ b/tools/libxc/xc_cpuid_x86.c
>>>> @@ -503,6 +503,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>>>       */
>>>>      if ( restore )
>>>>      {
>>>> +        if ( test_bit(X86_FEATURE_RDRAND, host_featureset) && !p->basic.rdrand )
>>>> +            p->basic.rdrand = true;
>>> Same question as before: Why do you derive from the host feature set rather
>>> than the domain type's maximum one?
>> Answer the same as previous.
>>
>> Although I do see now that this should be simplified to:
>>
>>     p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
>>
>> which I've done.
> Right. It makes even more noticeable though that this may mean a
> new feature suddenly appearing after the guest was migrated. But
> aiui this still is the default behavior for all features anyway.

That is how migration always worked, until my migration v3 work in this
release.

I'm still surprised that it did, but both Linux and Windows were fine
with FMS changing on migrate (Linux because it never checked again,
while Windows would notice and install a new CPU HAL driver.)

>>>> --- a/xen/arch/x86/cpuid.c
>>>> +++ b/xen/arch/x86/cpuid.c
>>>> @@ -340,6 +340,25 @@ static void __init calculate_host_policy(void)
>>>>      }
>>>>  }
>>>>  
>>>> +static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>>>> +{
>>>> +    /*
>>>> +     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
>>>> +     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
>>>> +     * compensate.
>>>> +     *
>>>> +     * Mitigate by hiding RDRAND from guests by default, unless explicitly
>>>> +     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
>>>> +     * default setting, guests can use RDRAND if explicitly enabled
>>>> +     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
>>>> +     * previously using RDRAND can migrate in.
>>>> +     */
>>>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
>>>> +         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
>>> This is the first time (description plus patch so far) that the issue
>>> gets mentioned to be for and the workaround restricted to client parts
>>> only. If so, I think at least the doc should say so too.
>> I've updated the command line doc, and patch subject.
> Thanks - with the adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

