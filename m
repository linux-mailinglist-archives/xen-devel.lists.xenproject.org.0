Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18C1F9B3B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:00:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqbO-0005fp-HQ; Mon, 15 Jun 2020 15:00:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkqbN-0005fd-5P
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:00:45 +0000
X-Inumbo-ID: fc4d877b-af18-11ea-b807-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc4d877b-af18-11ea-b807-12813bfff9fa;
 Mon, 15 Jun 2020 15:00:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iA9dAEPWvvElXBYE/r76lYVhY+kVnJeKSeon2KGW2OJeHj/NKvYKsC/FzQKK3qBU9po8shJvyC
 1cXV4CAyRTVpaGTOD2M3PXOPcFpHP52Xa7yt2D2YAEeaHsHD8P0RvqiO2Jv8eYrS+Hp/iSogmh
 UbzYTAplQoTHuFJi1J+p8x8nnSpNdszXjCk5QIQLKGmo62Nn1rFxnRv32QqkhWOLhoOgve0BdX
 SGaESY5esALFqvImkYmvcyvrX3Y46++Kbra1rCkAfLeapjTxxDKFnPP6AFaxAlFPTS3ApV0gPT
 YvY=
X-SBRS: 2.7
X-MesageID: 20084269
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20084269"
Subject: Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is
 sorted
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-3-andrew.cooper3@citrix.com>
 <24295.35624.644030.417783@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ec1364c4-f1df-c52d-8651-bbfb3b5b6a0b@citrix.com>
Date: Mon, 15 Jun 2020 16:00:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24295.35624.644030.417783@mariner.uk.xensource.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/06/2020 15:52, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is sorted"):
>> The existing x86_cpuid_copy_to_buffer() does produce sorted results, and we're
>> about to start relying on this.  Extend the unit tests.
>>
>> As test_cpuid_serialise_success() is a fairly limited set of synthetic
>> examples right now, introduce test_cpuid_current() to operate on the full
>> policy for the current CPU.
>>
>> Tweak the fail() macro to allow for simplified control flow.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>
> I don't think anything in our normal dev workflow runs this
> automatically ?  Maybe this would be something for us to think
> about...

Nothing runs it by default, but it is part of my prepush testing for
anything in the relevant area.

We should do something better, but its not totally trivial.  The x86
emulator test for example needs a fairly bleeding edge version of
binutils, given that we routinely add support for bleeding edge
instruction groups.

~Andrew

