Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A347C419
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 17:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250505.431463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziHp-0006zN-VA; Tue, 21 Dec 2021 16:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250505.431463; Tue, 21 Dec 2021 16:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziHp-0006x8-Rn; Tue, 21 Dec 2021 16:46:49 +0000
Received: by outflank-mailman (input) for mailman id 250505;
 Tue, 21 Dec 2021 16:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mziHo-0006x2-16
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 16:46:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9371ae48-627d-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 17:46:44 +0100 (CET)
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
X-Inumbo-ID: 9371ae48-627d-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640105204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kVZWwk6094asa98Fxe/+u89/BVK7Cfue7zX9sjQrgaw=;
  b=Ic+w5gJ1KMTTb+6l52e9C16GrE83gGxtY2AnoRGxJL7+9WHmTLm4H+4K
   YATM+taMIVgRRwfiyhLKO/7rMh7skS0ck087FUSjU6hugz2QsUNXhYr6O
   S+h1FR3uyx+Hpol9j18P31t324lhb6FVPCwPi0roTpWFSvZPe5EwLng7A
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: exwW7skouF2YGlwGqJ6DYvBdlXmXn/MNcEefSX2jSwglV2El7/jKF6RPpfx5OyqY35WsKMFlhF
 yl+fE0jEWDVlW/GXtTkKbSmc//yGr2zidBTpIS2TuEj4LwQi5qJNt71UlUI4OgjgYy00RE9Sch
 GemM5F+PpN0u2K/4je+88qbNzHRL1KOndNyqd3uwv+rL334XpU22dMhJxhWBpPCVnZ2GgL+EaE
 WS7sHwfoZDsTF5JrAZFZH8+cEbLlLpiWVgQpi+CbW3ERbil0sjwUB66vTcADgB4wO43hEZPpbN
 i6URK4GVi6zFGTB3SqWsM84b
X-SBRS: 5.1
X-MesageID: 60917302
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3TDHNKNBEELxRiTvrR3QkcFynXyQoLVcMsEvi/4bfWQNrUp0gzQDy
 WpMDWCGOv7bMTTzc9x/Ptng8RxQ7MfQztZrGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400g6w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxmVvdpN5
 NVTiaXuVSElGq7pie0TVBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9h358VRay2i
 8wxYyphMVeQfgJzZlpMBplk27yttGj8fGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSFziGP6HWrhennlCL9VoUJGbb+/flv6HWR22gSBRs+RVa95/6jhSaWUd9FN
 1Yd/CZoqKEo7VGqVfH0RRj+q3mB1jYiXN5XH/w/+Ru64KPe6AaEBUAJVjdELtchsaceRzMw0
 USSt8j0HjEpu7qQIVqa8rqXti+jIig9ImoLZCtCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj/7q/1UDKhXSrvJehZgkx6wbMV2Sp9DRldZWlbIyl71vcxftYJYPfRV6E1
 EXogODHsrpIV8vU0nXQHqNdR9lF+sppLhXwnXxlI7Uh6QiUpWKFcaRTxSB3KkBmZ5NslSDSX
 GffvgZY5Zl2NXSsbLNqb4/ZN/nG3ZQMBvy+CKmKM4MmjoxZMVbeoXowPRL4M3XFyRB0yckC1
 YGnndFA5JrwIYBu13KISugUytfHLQhulDqIFfgXI/lKuIdyhUJ5q59ZYTNijchjtctoRTk5F
 f4Fb6NmLD0FD4XDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4JdA9x/4IybuSp
 yrnMqO99LYZrSefQeltQio8AI4DoL4l9S5rVcDSFQvAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3basmjvg/vomxHBbGk9dQKXE3y2WqmYnr0CBBiLsUIb1GYpbfZkv7HqXBm4tyf7pBl/
 dVNF2rzHPI+euiVJJqMNa/0kQru5SN1dSAbdxKgH+S/sX7EqOBCQxEdRNdtSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:GeOvhK2hvsuxep8k5TSFGQqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60917302"
Date: Tue, 21 Dec 2021 16:46:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <YcIE5rv5vwxwSvKd@perard>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard>
 <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
 <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
 <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
 <44885d7e-c5a0-5b7c-144d-b9e6c7e54715@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <44885d7e-c5a0-5b7c-144d-b9e6c7e54715@gmail.com>

On Fri, Dec 17, 2021 at 06:50:02PM +0200, Oleksandr wrote:
> On 17.12.21 17:26, Juergen Gross wrote:
> > On 15.12.21 22:36, Oleksandr wrote:
> > > On 15.12.21 17:58, Juergen Gross wrote:
> > > > In practice we are having something like the "protocol" already today:
> > > > the disk device name is encoding that ("xvd*" is a Xen PV disk, while
> > > > "sd*" is an emulated SCSI disk, which happens to be presented to the
> > > > guest as "xvd*", too). And this is an additional information not
> > > > related to the backendtype.

You mean in theory? ;-) In practice, xvd* is the same as hd* (or sd*?).
I tried once to have xvd* mean PV disk only, but the patch was rejected.
So at the moment, we always get an emulated disk, we can't have PV disk
alone, at least on x86.

> > > > 
> > > > So we have basically the following configuration items, which are
> > > > orthogonal to each other (some combinations might not make sense,
> > > > but in theory most would be possible):
> > > > 
> > > > 1. protocol: emulated (not PV), Xen (like today), virtio
> > > > 
> > > > 2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)
> > > > 
> > > > 3. format: raw, qcow, qcow2, vhd, qed
> > > > 
> > > > The combination virtio+phy would be equivalent to vhost, BTW. And
> > > > virtio+other might even use vhost-user, depending on the daemon.
> > > yes, BTW the combination virtio+other is close to our use-case.
> > > 
> > > 
> > > Thank you for the detailed explanation, now I see your point why
> > > using backendtype=virtio is not flexible option in the long term
> > > and why we would want/need to an extra configuration option such as
> > > protocol, etc. I think, it makes sense and would be correct.
> > > 
> > > If we take a disk as an example, then from the configuration PoV we
> > > will need to:
> > > - add an optional "protocol" option
> > 
> > I'm not sure regarding the name of the option. "protocol" was just a
> > suggestion by me.
> 
> Yes, personally I would be fine with either "protocol" or "specification",
> with a little preference for the former. What other people think of the
> name?

I don't have a better idea. "protocol" sound fine, as long as the description of
this new field is about how a guest kernel will communicate with the
backend.

We could start with "default" and "virtio-mmio" as options. "default" is
what we have now and usually mean emulated+xen-pv.

> > 
> > > - add new backendtype: external/other/daemon/etc.
> > > This seems to cover all possible combinations describe above
> > > (although I agree that some of them might not make sense). Is my
> > > understanding correct?
> > 
> > Yes.
> 
> ok, thank you for confirming.
> 
> > > Unfortunately, disk configuration/management code is spread over
> > > multiple sources (including auto-generated) in the toolstack which
> > > is not so easy to follow (at least to me
> > > who is not familiar enough with all this stuff), but anyway may I
> > > please clarify what is the minimum required amount of things that I
> > > need to do in order to get this basic virtio-mmio
> > > support series accepted?
> > 
> > I'd say we should first get consensus that others agree with my
> > suggestion.
> This is fair. Personally I share your opinion (what you propose sounds
> reasonable to me in general). Are there any other opinions? Any feedback
> would be highly appreciated.

The new proposed property sound good to me as well.

Thanks,

-- 
Anthony PERARD

