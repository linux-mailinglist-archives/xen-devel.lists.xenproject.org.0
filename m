Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C651FBFD8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 22:16:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlI0a-0003BA-2X; Tue, 16 Jun 2020 20:16:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlI0Y-0003At-Ak
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 20:16:34 +0000
X-Inumbo-ID: 4525b094-b00e-11ea-b94a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4525b094-b00e-11ea-b94a-12813bfff9fa;
 Tue, 16 Jun 2020 20:16:32 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: D9w8eurEA+OORasAjcLOUEtPX5ainqdE0/241ppbMrL6rsB+6+FTBzcQLgvBDNDJxhr2cikNYL
 x8U3KKPvs5YghfchNld89eX+4FPrn3oYxoyGzgfTj0v9w0Qyw+ACBn4H8Vxi8Pz8sBCMwtb7qr
 22UoeJPgHSoXdrPS9D0JlYAmSv2qAm0LLvGPJMgCCXkr1O0caCvSq2njkOSak+1vz2DF/k0zC8
 +hqWKBB59HNSst4j2KsVvz6+XNdsO69p5f+sdmVjOjyuxllXdQJ9uVW/eDLxj5CjSAFTLWKnSL
 /rA=
X-SBRS: 2.7
X-MesageID: 20988688
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,519,1583211600"; d="scan'208";a="20988688"
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
Date: Tue, 16 Jun 2020 21:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 19:47, Michał Leszczyński wrote:
> ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
>
>> Are there any restrictions on EPT being enabled in the first place?  I'm
>> not aware of any, and in principle we could use this functionality for
>> PV guests as well (using the CPL filter).  Therefore, I think it would
>> be helpful to not tie the functionality to HVM guests, even if that is
>> the only option enabled to start with.
> I think at the moment it's not required to have EPT. This patch series doesn't use any translation feature flags, so the output address is always a machine physical address, regardless of context. I will check if it could be easily used with PV.

If its trivial to add PV support then please do.  If its not, then don't
feel obliged, but please do at least consider how PV support might look
in the eventual feature.

(Generally speaking, considering "how would I make this work in other
modes where it is possible" leads to a better design.)

>> The buffer mapping and creation logic is fairly problematic.  Instead of
>> fighting with another opencoded example, take a look at the IOREQ
>> server's use of "acquire resource" which is a mapping interface which
>> supports allocating memory on behalf of the guest, outside of the guest
>> memory, for use by control tools.
>>
>> I think what this wants is a bit somewhere in domain_create to indicate
>> that external tracing is used for this domain (and allocate whatever
>> structures/buffers are necessary), acquire resource to map the buffers
>> themselves, and a domctl for any necessary runtime controls.
>>
> I will check this out, this sounds like a good option as it would remove lots of complexity from the existing ipt_enable domctl.

Xen has traditionally opted for a "and turn this extra thing on
dynamically" model, but this has caused no end of security issues and
broken corner cases.

You can see this still existing in the difference between
XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
required to chose the number of vcpus for the domain) and we're making
good progress undoing this particular wart (before 4.13, it was
concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
issuing other hypercalls between these two).

There is a lot of settings which should be immutable for the lifetime of
the domain, and external monitoring looks like another one of these. 
Specifying it at createdomain time allows for far better runtime
behaviour (you are no longer in a situation where the first time you try
to turn tracing on, you end up with -ENOMEM because another VM booted in
the meantime and used the remaining memory), and it makes for rather
more simple code in Xen itself (at runtime, you can rely on it having
been set up properly, because a failure setting up will have killed the
domain already).

>> What semantics do you want for the buffer becoming full?  Given that
>> debugging/tracing is the goal, I presume "pause vcpu on full" is the
>> preferred behaviour, rather than drop packets on full?
>>
> Right now this is a ring-style buffer and when it would become full it would simply wrap and override the old data.

How does the consumer spot that the data has wrapped?  What happens if
data starts getting logged, but noone is listening?  What happens if the
consumer exits/crashes/etc and stops listening as a consequence?

It's fine to simply state what will happen, and possibly even "don't do
that then", but the corner cases do at least need thinking about.

>> When this subject was broached on xen-devel before, one issue was the
>> fact that all actions which are intercepted don't end up writing any
>> appropriate packets.  This is perhaps less of an issue for this example,
>> where the external agent can see VMExits in the trace, but it still
>> results in missing information.  (It is a major problem for PT within
>> the guest, and needs Xen's intercept/emulation framework being updated
>> to be PT-aware so it can fill in the same packets which hardware would
>> have done for equivalent actions.)
> Ok, this sounds like a hard issue. Could you point out what could be the particular problematic cases? For instance, if something would alter EIP/RIP or CR3 then I belive it would still be recorded in PT trace (i.e. these values will be logged on VM entry).

One easy case is what happens on a Pstate transition while in the
hypervisor.  That won't be recorded.  (Perhaps this bit of data isn't
terribly interesting.)

More complicated cases exist when you start combining Xen features. 
E.g. with Introspection, a function pointer call which happens to set a
pagetable access bit bit which is write-protected will trap for
emulation, and be completed by the emulator (this is far faster than
pausing the domain, changing EPT permissions, singlestepping the vcpu,
then reinstating reduced EPT permissions).

In this case, no TIP would be generated unless the x86 emulator were
updated to know how to do this.

~Andrew

