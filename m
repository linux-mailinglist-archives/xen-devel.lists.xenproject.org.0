Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA9D1FD1D3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 18:20:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlama-0003xy-FW; Wed, 17 Jun 2020 16:19:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FoJ=76=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlamY-0003xt-P9
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 16:19:22 +0000
X-Inumbo-ID: 4c352a60-b0b6-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c352a60-b0b6-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 16:19:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zq2ehM8fwF58L2dEjXpcOpRHXAr8oODFbTzIxMFCrit3qVo5gwSQuXXv0jv+Vb0P5nCVT7+EVS
 hnXxKIblzbHy/v9q9LPItditKQ0Vmkq7q6lWt5aVGcZilxD56vWUkl8JCi2LOO1QBBCXiB+YMy
 AdOcyIQ59piWmLAX4+Nc95+/SrtyeW6FOe/jqjYw3jFL0m3j2t5JGRtJ/SxfKvOzaFNfMMHBMK
 ZYJ8EVV5bosbREH0JXHOJYcrNMpZeCns0N/KATRgQeYWOP70lETeARb0CqmL4HQDVK0Z7p9scI
 Sg0=
X-SBRS: 2.7
X-MesageID: 20592051
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,523,1583211600"; d="scan'208";a="20592051"
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
Date: Wed, 17 Jun 2020 17:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/06/2020 04:02, Tamas K Lengyel wrote:
> On Tue, Jun 16, 2020 at 2:17 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 16/06/2020 19:47, Michał Leszczyński wrote:
>>> ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
>>>
>>>> Are there any restrictions on EPT being enabled in the first place?  I'm
>>>> not aware of any, and in principle we could use this functionality for
>>>> PV guests as well (using the CPL filter).  Therefore, I think it would
>>>> be helpful to not tie the functionality to HVM guests, even if that is
>>>> the only option enabled to start with.
>>> I think at the moment it's not required to have EPT. This patch series doesn't use any translation feature flags, so the output address is always a machine physical address, regardless of context. I will check if it could be easily used with PV.
>> If its trivial to add PV support then please do.  If its not, then don't
>> feel obliged, but please do at least consider how PV support might look
>> in the eventual feature.
>>
>> (Generally speaking, considering "how would I make this work in other
>> modes where it is possible" leads to a better design.)
>>
>>>> The buffer mapping and creation logic is fairly problematic.  Instead of
>>>> fighting with another opencoded example, take a look at the IOREQ
>>>> server's use of "acquire resource" which is a mapping interface which
>>>> supports allocating memory on behalf of the guest, outside of the guest
>>>> memory, for use by control tools.
>>>>
>>>> I think what this wants is a bit somewhere in domain_create to indicate
>>>> that external tracing is used for this domain (and allocate whatever
>>>> structures/buffers are necessary), acquire resource to map the buffers
>>>> themselves, and a domctl for any necessary runtime controls.
>>>>
>>> I will check this out, this sounds like a good option as it would remove lots of complexity from the existing ipt_enable domctl.
>> Xen has traditionally opted for a "and turn this extra thing on
>> dynamically" model, but this has caused no end of security issues and
>> broken corner cases.
>>
>> You can see this still existing in the difference between
>> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
>> required to chose the number of vcpus for the domain) and we're making
>> good progress undoing this particular wart (before 4.13, it was
>> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
>> issuing other hypercalls between these two).
>>
>> There is a lot of settings which should be immutable for the lifetime of
>> the domain, and external monitoring looks like another one of these.
>> Specifying it at createdomain time allows for far better runtime
>> behaviour (you are no longer in a situation where the first time you try
>> to turn tracing on, you end up with -ENOMEM because another VM booted in
>> the meantime and used the remaining memory), and it makes for rather
>> more simple code in Xen itself (at runtime, you can rely on it having
>> been set up properly, because a failure setting up will have killed the
>> domain already).
> I'm not in favor of this being a flag that gets set during domain
> creation time. It could certainly be the case that some users would
> want this being on from the start till the end but in other cases you
> may want to enable it intermittently only for some time in-between
> particular events. If it's an on/off flag during domain creation you
> pretty much force that choice on the users and while the overhead of
> PT is better than say MTF it's certainly not nothing. In case there is
> an OOM situation enabling IPT dynamically the user can always just
> pause the VM and wait till memory becomes available.

There is nothing wrong with having "turn tracing on/off at runtime"
hypercalls.  It is specifically what I suggested two posts up in this
thread, but it should be limited to the TraceEn bit in RTIT_CTL.

What isn't ok is trying to allocate the buffers, write the TOPA, etc on
first-enable or first-map, because the runtime complexity of logic like
this large, and far too easy to get wrong in security relevant ways.

The domain create flag would mean "I wish to use tracing with this
domain", and not "I want tracing enabled from the getgo".

>>>> What semantics do you want for the buffer becoming full?  Given that
>>>> debugging/tracing is the goal, I presume "pause vcpu on full" is the
>>>> preferred behaviour, rather than drop packets on full?
>>>>
>>> Right now this is a ring-style buffer and when it would become full it would simply wrap and override the old data.
>> How does the consumer spot that the data has wrapped?  What happens if
>> data starts getting logged, but noone is listening?  What happens if the
>> consumer exits/crashes/etc and stops listening as a consequence?
>>
>> It's fine to simply state what will happen, and possibly even "don't do
>> that then", but the corner cases do at least need thinking about.
> AFAIU the current use-case is predominantly to be used in conjunction
> with VMI events where you want to be able to see the trace leading up
> to a particular vmexit. So in the case when the buffer is wrapped
> in-between events and data is lost that's not really of concern.

That's all fine.  I imagine the output here is voluminous, and needs
help being cut down as much as possible.

On a tangent, I presume you'd like to include VM-fork eventually, which
ought to include copying the trace buffer on fork?

~Andrew

