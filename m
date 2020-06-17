Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E11FD35F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 19:25:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlbmt-0001RN-Jb; Wed, 17 Jun 2020 17:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FoJ=76=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlbms-0001RI-T2
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 17:23:46 +0000
X-Inumbo-ID: 4c1f2cc0-b0bf-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c1f2cc0-b0bf-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 17:23:45 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: R3mq5HKs5sN7ZN05SiUGXn1Kw8PDbFatJ+xRe5acT9HwTHNwsWFeq39Q8418vch2xwhyUgSZDi
 NRIQI0tAj1xJsaLUEHP6HanCOeTRxDnZfwFLXfX9tlMuPVpFDeijR1icwFPj30FzGoD3lsbfVp
 2DcntngsgGE25/JUD1qd54NzUrmaMhJ96w68ISYd7L4U8qsXpj95B3Vp+Bbsdyi/TOTKOMNbpe
 4VRsHraGfSS5Yx0U/gWYGx8k05M48Z+pt3+2Gxnzmvcwdvr5sPp7oHv1/fgqrPDPXLg+3hk/G1
 8/M=
X-SBRS: 2.7
X-MesageID: 20643545
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,523,1583211600"; d="scan'208";a="20643545"
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
 <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
 <CABfawhn3UsLo_Ffe4C47Po+gCCChGXnH6ghENSNTY3OwqnBjUg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2df6eecb-df3b-7f6e-4185-99f4244ed9d1@citrix.com>
Date: Wed, 17 Jun 2020 18:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhn3UsLo_Ffe4C47Po+gCCChGXnH6ghENSNTY3OwqnBjUg@mail.gmail.com>
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

On 17/06/2020 17:27, Tamas K Lengyel wrote:
>>>>>> What semantics do you want for the buffer becoming full?  Given that
>>>>>> debugging/tracing is the goal, I presume "pause vcpu on full" is the
>>>>>> preferred behaviour, rather than drop packets on full?
>>>>>>
>>>>> Right now this is a ring-style buffer and when it would become full it would simply wrap and override the old data.
>>>> How does the consumer spot that the data has wrapped?  What happens if
>>>> data starts getting logged, but noone is listening?  What happens if the
>>>> consumer exits/crashes/etc and stops listening as a consequence?
>>>>
>>>> It's fine to simply state what will happen, and possibly even "don't do
>>>> that then", but the corner cases do at least need thinking about.
>>> AFAIU the current use-case is predominantly to be used in conjunction
>>> with VMI events where you want to be able to see the trace leading up
>>> to a particular vmexit. So in the case when the buffer is wrapped
>>> in-between events and data is lost that's not really of concern.
>> That's all fine.  I imagine the output here is voluminous, and needs
>> help being cut down as much as possible.
>>
>> On a tangent, I presume you'd like to include VM-fork eventually, which
>> ought to include copying the trace buffer on fork?
> I would eventually like to use it to reconstruct the branch history so
> we can update AFL's coverage map with that instead of having to do the
> current breakpoint-singlestep dance. But for that I would only care
> about the trace starting after the fork, so copying the parent's PT
> buffer is not needed. We'll also probably only use PT if the branch
> history is larger than what LBR can hold. I asked Michal to name the
> hypercall interface "vmtrace" for this reason so we can add other
> stuff like LBR later using the same interface (which I already
> implemented in https://github.com/tklengyel/xen/commits/lbr).

I was wondering when someone was going to want LBR data like this. 
Can't you borrow the LBR-stitching tricks from Linux's perf to recover
the call trace even when its deeper than the LBR stack?

What about PEBS?  ISTR there is a fairly complicated matrix of which
features work in combination.


As for naming, we should definitely have something fairly generic. 
AFAICT, it would be applicable to ARM's CoreSight facilities as well.

~Andrew

