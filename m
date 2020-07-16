Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151412220A6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 12:31:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw1Ak-0006vi-La; Thu, 16 Jul 2020 10:31:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw1Aj-0006vZ-G3
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:31:25 +0000
X-Inumbo-ID: 7e42dc46-c74f-11ea-949b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e42dc46-c74f-11ea-949b-12813bfff9fa;
 Thu, 16 Jul 2020 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594895485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NBFRfwyxPgTlZ8qfQKummKCUon0ZFqZEtEKuh7EX5dk=;
 b=dCBSXsSoG0Sycc8gUpCI58WH12V0wD1+uYvnYsgu0gcnJFYcBjvUKJZK
 SOiSW1RZ14nhoVQTMnUl26usC7oZU42OrACx5/mMLHxslTLNuHC62jmw5
 xgP6XGYos9MAO2jJCkdQVTc6GwS/614HiFswkjJTEBrS423nuIb7bR/0r E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dN4IxCAtEEFFXNtkXI+PVdoa37nyoaS1pZN5o6eWMohq7LVkwHy/W5Y3OAeBCI9JAALwSvPvQh
 2JYMzLFmRg+Za/eegmI6Y8bvnZTBaF4H+gLn2mwaRGsdcMKmWz2xTneledNeUTY1mpdYwefjO8
 uR5FhVowgH0uPJpVNz7oQUE24FLiK4/og+S9txr5EfmbhMk4rKqbSFxXIYIsFki2Lpw1w/pHAM
 wgbRX1gYG599Sw1Y5sBHmqoOd03ETA2DXuBIezpnTlnmuitNtw183WWa+q+3HL/HJqW/gvcbmZ
 8GQ=
X-SBRS: 2.7
X-MesageID: 22830947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,358,1589256000"; d="scan'208";a="22830947"
Date: Thu, 16 Jul 2020 12:31:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
Message-ID: <20200716103110.GM7191@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
 <20200715145144.GA7191@Air-de-Roger>
 <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 16, 2020 at 12:06:14PM +0200, Jan Beulich wrote:
> On 15.07.2020 16:51, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 03:51:17PM +0200, Jan Beulich wrote:
> >> On 15.07.2020 15:32, Roger Pau Monné wrote:
> >>> Feel free to change to ACCESS_ONCE or barrier if you think it's
> >>> clearer.
> >>
> >> I did so (also on the writer side), not the least based on guessing
> >> what Andrew would presumably have preferred.
> > 
> > Thanks! Sorry I might be pedantic, but is the ACCESS_ONCE on the write
> > side actually required? I'm not sure I see what ACCESS_ONCE protects
> > against in handle_rtc_once.
> 
> Well, this is all sort of a mess, I think. We have this mixture of
> ACCESS_ONCE() and read_atomic() / write_atomic(), but I don't think
> we use them consistently, and I'm not sure either is suitable to
> deal with all (theoretical) corner cases.
> 
> read_atomic() / write_atomic() guarantee a single insn to be used
> to access a piece of data. I'm uncertain whether they also guarantee
> single access (i.e. that the compiler won't replicate the asm()-s).

Yes, that would be my expectation from my reading of the manual, as
it prevents gcc from: "move it out of loops or omit it on the
assumption that the result from a previous call is still valid".

> The wording in gcc doc is pretty precise, but not quite enough imo
> to be entirely certain.

I agree it's not that precise.

> ACCESS_ONCE() guarantees single access, but doesn't guarantee that
> the compiler wouldn't split this single access into multiple insns.
> (It's just, like elsewhere, that it would be pretty silly of it if
> it did.)
> 
> Yesterday, as said, I tried to in particular do what I expect/guess
> Andrew would have wanted done. This is despite me not being entirely
> convinced this is the right thing to do here, i.e. personally I
> would have preferred read_atomic() / write_atomic(), as I think the
> intention of what the gcc doc is saying is what we want (taking
> into consideration both uses of "volatile" in these helpers).

Well, gcc states:

"Note that the compiler can move even volatile asm instructions
relative to other code, including across jump instructions."

So I think we likely want to use {read/write}_atomic plus a compiler
barrier? I'm not sure anyway how the read of pv_rtc_handler could be
moved, but I guess I'm not that creative :).

AFAICT we require a write_atomic in handle_rtc_once in order to assure
a single instruction is used (no barrier required), and then we
require a read_atomic + a compiler barrier in rtc_guest_write in order
to prevent the compiler from optimizing the accesses to 'hook' in any
way? (that barrier might not be strictly required, as you say it's not
fully clear whether 'asm volatile' doesn't provide the necessary
protection here).

Thanks.

