Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC9200A01
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmH2a-0000nj-La; Fri, 19 Jun 2020 13:26:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezQq=AA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jmH2Z-0000ne-5k
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:26:43 +0000
X-Inumbo-ID: 830223c4-b230-11ea-bb81-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 830223c4-b230-11ea-bb81-12813bfff9fa;
 Fri, 19 Jun 2020 13:26:42 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +5taL90pSMM1Y4K2q2iQcjiklfgmDetB8Q5UeYJus7vndKpTNNbucnXkStBDhwwfi95O5F6JF3
 VpF3Z/AEjR2mL9wZtAiKpvSl603BoiVxiyoWZnTvQEXUvbRdoK0Z67WidrgYkoOBcOgmmSkkBc
 S/gVNp1S4zd6BEeKdt473Sv4lY0/Mrimd1omR/+hOBHw29yC0sY644jzXBmypqO3d4b6ee1XZT
 1jJbYDPbjwWvD3WOF/Ph0iEtRNS+Q3YjAgr1a+W55tF3Sg4bumhR/HsVpgVXVOHMvFa9xMzh6l
 3nQ=
X-SBRS: 2.7
X-MesageID: 20481370
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20481370"
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 "Jan Beulich" <jbeulich@suse.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <1417373854.10164826.1592568614663.JavaMail.zimbra@cert.pl>
 <d6c7f9f8-9c9e-9648-1c51-43db38cb0b00@suse.com>
 <893375527.10199950.1592571477991.JavaMail.zimbra@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0d520017-23b2-9f91-fe5b-160cc46866fa@citrix.com>
Date: Fri, 19 Jun 2020 14:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <893375527.10199950.1592571477991.JavaMail.zimbra@cert.pl>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/06/2020 13:57, Michał Leszczyński wrote:
> ----- 19 cze 2020 o 14:49, Jan Beulich jbeulich@suse.com napisał(a):
>
>> On 19.06.2020 14:10, Michał Leszczyński wrote:
>>> ----- 19 cze 2020 o 13:58, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
>>>
>>>> We do not expose the feature to guests, so should disallow access to the
>>>> respective MSRs.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Paul Durrant <paul@xen.org>
>>>> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
>>>>
>>>> Paul: For 4.14.  This needs backporting to older trees as well.
>>>>
>>>> Michał: CC'ing, just to keep you in the loop.  Xen has some dubious default
>>>> MSR semantics which we're still in the middle of untangling in a backwards
>>>> compatible way.  Patches like this will eventually not be necessary, but they
>>>> are for now.
>>>
>>> As for external IPT monitoring, it would be best if the VM would think
>>> that IPT is simply not supported at all by the underlying hypervisor.
>> This is already the case, isn't it? Yet not reporting a feature may
>> not keep a guest from trying to access the respective MSRs.
>>
>> Jan
>
> Okay, understood :)

Hiding bits in CPUID doesn't magically make the feature disappear out of
the pipeline.

Some things we can effectively disable (using suitable intercepts to
audit changes to control registers), but for most instruction groups,
its trivial to discover if the pipeline supports them, via fault analysis.

Despite the software manuals being clear on the matter, not all code
checks CPUID properly before poking features.  If anything in your VM
does do this, then it is likely to crash on migrate, so wherever
possible, block access at all levels, not just in CPUID.

(Windows DRM/Anti-cheat systems seem to have a particular knack for
finding features we haven't disabled properly, and architectural corner
cases we don't cope with correctly.)

~Andrew

