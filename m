Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA41F9CBA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrj3-0004jm-TZ; Mon, 15 Jun 2020 16:12:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkrj2-0004j3-G2
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:12:44 +0000
X-Inumbo-ID: 0af9cf18-af23-11ea-b816-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0af9cf18-af23-11ea-b816-12813bfff9fa;
 Mon, 15 Jun 2020 16:12:43 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DVjhz2OacSxeHcAH78go9zXuHDZfmCQ8V8qTBQxH1YVNOxI4ifVpvOUMPMGkFv/O7PbAnYJdyD
 +5ke4Q5/dxJMGIfACccTgIaG5m0bwPX3OfutoFvA/F3DQ2T8CJ13FOE9V92Ia7/LYPJhLxiNT8
 7wavVHNev1uLAjuFoHq+Y777dr6X5PSiQnpJUWC61dojbnex+X5CAmLO/RgDeErn8gWXC4lcni
 XRbJ3qdK6VAroN0uH05r3lraDBNwSRSEbyzP8GEH/EHAcnCSSk7FtHCwziFW6QdGY2Oz+UJi04
 Rt0=
X-SBRS: 2.7
X-MesageID: 20378738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20378738"
Subject: Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is
 sorted
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-3-andrew.cooper3@citrix.com>
 <24295.35624.644030.417783@mariner.uk.xensource.com>
 <ec1364c4-f1df-c52d-8651-bbfb3b5b6a0b@citrix.com>
 <24295.38146.988316.316252@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <53a1f221-89ae-0d8e-32ef-c9c8c83580c5@citrix.com>
Date: Mon, 15 Jun 2020 17:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24295.38146.988316.316252@mariner.uk.xensource.com>
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
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/06/2020 16:34, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is sorted"):
>> Nothing runs it by default, but it is part of my prepush testing for
>> anything in the relevant area.
>>
>> We should do something better, but its not totally trivial.  The x86
>> emulator test for example needs a fairly bleeding edge version of
>> binutils, given that we routinely add support for bleeding edge
>> instruction groups.
> Hmmm.  Is it likely that installing the version from Debian testing
> (say) would work ?  Or do we want to build it from source ?  These are
> all possibilities.

Pulling from Sid may work, if they're fairly prompt to update to new
binutils releases.  (They're certainly up to date ATM)

Jan: are we ever in a position where we need something more bleeding
edge than the latest binutils release?

>
> We could build binutils from source with a job-specific --prefix
> setting and that wouldn't stop it sharing the build host with other
> jobs.  Maybe it could be a seperate job which provides an anointed
> binutils build.
>
> What other awkward requirements are there ?

Most of the tests require running under a suitably configured Xen, and
even then, require doing some fairly custom things with the guest.

Perhaps a good start would be to split our "unit test like" tests away
from our "need a specifically configured Xen" tests.  The former would
be rather more amenable to running by default.

~Andrew

