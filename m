Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0775548AD66
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 13:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255717.438274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7G2R-0008HN-2h; Tue, 11 Jan 2022 12:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255717.438274; Tue, 11 Jan 2022 12:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7G2Q-0008F6-Vm; Tue, 11 Jan 2022 12:14:06 +0000
Received: by outflank-mailman (input) for mailman id 255717;
 Tue, 11 Jan 2022 12:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAIS=R3=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n7G2P-0008F0-CP
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 12:14:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f65daf29-72d7-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 13:14:03 +0100 (CET)
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
X-Inumbo-ID: f65daf29-72d7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641903243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PH2MYi6bnECWgRXJnJOLCYEdVOwCs4G77IDB6Uw3O6g=;
  b=H3WnGeVw70PR1qr7qmbIzQ8VS2gZRAMYnG/r8IOJh7Aa70zy26dLv5WZ
   +ngpGbRPi8rwUHRhrE769uCf/RroaZYUO5zkfpg/Une1i87DUAucCPfM4
   1QLWeFUG/9rYUcHkLSxhtpki0PLOyJQAzJZss6rKouuwE7U/WcOFJ0K1C
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bKMYToewx4VAiXwE8PqSSM/xlGftohC0a9viNtG9SiOZWToSZUAVKSqOlzno5TPAESP8YF4dmH
 2lyHSJxSSHbYhc5xDc2sshCM8H2gyK42P6ml+DwWMQF2zYosO3b5TZtcLUpwrZHlXjn0rYeKC2
 FrQ7FWV38s1grUaJOb6AvH9gD2GV3l2M1J781lBYrwq5STapSCOAyeNhCcQ2/m9cU9V1x5/L7z
 SFbE66AubAoNHmt5UdSNObFMRopgNjyUn+34T/gzIMUK0izFrVPv6q+YKO3KrmPe8B4GFDetUO
 N6uXJ/h3Ro/5PEwhBvy/eJKd
X-SBRS: 5.2
X-MesageID: 62133951
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:n+A+aq5ewkTKCs+XQ7cRSQxRtMPAchMFZxGqfqrLsTDasY5as4F+v
 mFJXD2AOfmNZmPweI91adjn8BkGvpaByoc1SQJu+3pmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg29cw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 u1cnrPzRiASeYLWxskSUDZyTh1MMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQR6+FP
 JtEMFKDajyDcSRUJGkPD6kkp9auoXrFQyRC+Ve88P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7y2geDhRQSFW6pOWih1C3c9VFI
 kcQ92wlqq1a3E6kVN7mRDWjvWWJ+BUbXrJ4Eec39QWMwar8+BuCCy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3pGsvBideicyFigtf3EpQggqyYTfko5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab4P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsFJG9eFoSfLkWVsDNdWfhwB3iEsI26BX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtLV/bpHg/PRXNhwgBdXTAd4llY
 v93lu72XB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNNcTgicCZqbbir+50/XrPSeWJORTB+Y8I9NJt8IeSJaYwPyLeRl
 px8M2cFoGfCaYrvclTVOis9OeK2Df6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:86dEZapRvZSFgnLYNDqQvpAaV5oUeYIsimQD101hICG9Kvbo8/
 xG785rsiMc6QxhI03I9urwWpVoLUmzyXcX2/hqAV7BZniChILAFugLhuGPrAEIcBeSygcp79
 YCT0EIMr3N5DZB7PoSqzPIderIiOP3iZxAq92ut0tQcQ==
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="62133951"
Date: Tue, 11 Jan 2022 12:13:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] build: fix make distclean
Message-ID: <Yd10hFujiVdg8DwV@perard>
References: <20220109100133.19731-1-jgross@suse.com>
 <1e5fb9e5-8334-9888-4bae-97564caa90bd@suse.com>
 <c445ec6f-a484-fa03-acf6-21687833ed2c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c445ec6f-a484-fa03-acf6-21687833ed2c@suse.com>

On Mon, Jan 10, 2022 at 10:04:56AM +0100, Juergen Gross wrote:
> On 10.01.22 09:42, Jan Beulich wrote:
> > On 09.01.2022 11:01, Juergen Gross wrote:
> > > "make distclean" will complain that "-c" is no supported flag for make.
> > > 
> > > Fix that by using "-C".
> > > 
> > > The error has been present for a long time, but it was uncovered only
> > > recently.
> > 
> > And that's because the rule simply was unreachable before? Or it was
> > reachable, but only via special (non-default) $(MAKE) invocations?
> 
> I just hit the bug during a top level "make distclean" and looked which
> commit introduced it. As it was really old, I looked for a more recent
> commit which could trigger the bug and found the rather recent one,
> making me believe that the wrong rule was never reached (other than by
> a "make" in the local directory of that rule).
> 
> I didn't spend more time on digging out whether the problem could have
> happened in other cases, too.
> 
> > > Fixes: 2400a9a365c5619 ("tools/debugger: Allow make to recurse into debugger/")
> > > Fixes: f9c9b127753e9ed ("tools: fix make distclean")
> > 
> > To distinguish from this commit's title and to also identify the affected
> > component, how about having "gdbsx" somewhere in the subject? (To be
> > honest, with this title I wouldn't even have expected the issue is in the
> > tool stack part of the tree.)
> 
> Hmm, yes, the prefix could be changed to "tools/debugger".

With that:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

