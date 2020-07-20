Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE42260B9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 15:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxVkU-00012K-VT; Mon, 20 Jul 2020 13:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxVkT-00011o-H3
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 13:22:29 +0000
X-Inumbo-ID: 0e2f93c9-ca8c-11ea-848e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e2f93c9-ca8c-11ea-848e-bc764e2007e4;
 Mon, 20 Jul 2020 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595251348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rWX7UgQLWphzCpDeE9TH91eyyN4ef7p3oiKbTx8bXGQ=;
 b=EPz9JdkPznULBDIRL1KZ8SndXh3QlflXtdu4uoG509t7Sxg0iqfQS3ys
 auJIse6qVU5TMjd3jIL2XKiNR9IKC0rmlTr8drfgDJ3dNnwGyPGhwKV2b
 dB6V1cJ9O4Gc1DhMzGojAoP9geufdhwofKBlMao8wZjmSNl1BqvfQegMp A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JSc1KxCDMqwgE350jYVkc/thdFnuFjAul1kIhutLHrFGFEDANkexuSOA36gQXjddgIDy0KW4Qf
 XcmQzqw6iz0blI6b0dZYR3gxZK5HcOdY1G0FbNBP/7jEUqfz0vv3J5SEfXWZKFq8ytyhYpeh8t
 ha8iTqLjkQ0hC9Y/7omqNNQ+cwlvQ2p/4xgkpSBIcWFBkCVdlkUqGDXlywxgrDr0psZtvmzCpA
 raNj+4vvEpmOGoK+M0SAgXwQsgnhzrWNk047SNaw3GW8PFX8TKaHmmpTVk9yB/Hds1mGe6Qnl8
 uAE=
X-SBRS: 2.7
X-MesageID: 23077979
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208";a="23077979"
Date: Mon, 20 Jul 2020 15:22:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: guard against port I/O overlapping the RTC/CMOS range
Message-ID: <20200720132219.GL7191@Air-de-Roger>
References: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
 <20200720105213.GI7191@Air-de-Roger>
 <c82b9985-fd4e-fbd6-afe1-7bdbf395d426@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c82b9985-fd4e-fbd6-afe1-7bdbf395d426@suse.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 20, 2020 at 01:58:40PM +0200, Jan Beulich wrote:
> On 20.07.2020 12:52, Roger Pau Monné wrote:
> > On Fri, Jul 17, 2020 at 03:10:43PM +0200, Jan Beulich wrote:
> >> Since we intercept RTC/CMOS port accesses, let's do so consistently in
> >> all cases, i.e. also for e.g. a dword access to [006E,0071]. To avoid
> >> the risk of unintended impact on Dom0 code actually doing so (despite
> >> the belief that none ought to exist), also extend
> >> guest_io_{read,write}() to decompose accesses where some ports are
> >> allowed to be directly accessed and some aren't.
> > 
> > Wouldn't the same apply to displaced accesses to port 0xcf8?
> 
> No, CF8 is special - partial accesses have no meaning as to the
> index selection for subsequent CFC accesses. Or else CF9
> couldn't be a standalone port with entirely different
> functionality..

Right:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

See below.

> >> @@ -373,25 +384,31 @@ static int read_io(unsigned int port, un
> >>      return X86EMUL_OKAY;
> >>  }
> >>  
> >> +static void _guest_io_write(unsigned int port, unsigned int bytes,
> >> +                            uint32_t data)
> > 
> > There's nothing guest specific about this function I think? If so you
> > could drop the _guest_ prefix and just name it io_write?
> 
> Hmm, when choosing the name I decided that (a) it's a helper of
> the other function and (b) it's still guest driven data that we
> output.

Well, the fact that it's guest driven data shouldn't matter much,
because there are no guest-specific checks in the function anyway - it
might as well be used for non-guest driven data AFAICT? (even if it's
not the case ATM).

It's likely that if I have to change code here in the future I will
drop such prefix, but the change is correct regardless of the naming,
so I'm not going to insist.

> >> +{
> >> +    switch ( bytes )
> >> +    {
> >> +    case 1:
> >> +        outb((uint8_t)data, port);
> >> +        if ( amd_acpi_c1e_quirk )
> >> +            amd_check_disable_c1e(port, (uint8_t)data);
> >> +        break;
> >> +    case 2:
> >> +        outw((uint16_t)data, port);
> >> +        break;
> >> +    case 4:
> >> +        outl(data, port);
> >> +        break;
> >> +    }
> > 
> > Newlines after break statements would be nice, and maybe add a
> > default: ASSERT_UNREACHABLE() case to be on the safe side?
> 
> Well, yes, I guess I should. But then if I edit this moved code,
> I guess I'll also get rid of the stray casts.

Was going to also ask for that, but I assumed there might we some
value in making the truncations explicit here. Feel free to drop those
also if you end up making the above adjustments.

Thanks, Roger.

