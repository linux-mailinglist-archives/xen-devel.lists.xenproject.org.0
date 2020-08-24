Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08824FFC8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 16:27:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kADRp-0007ki-2u; Mon, 24 Aug 2020 14:27:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51FD=CC=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kADRn-0007kd-N5
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 14:27:43 +0000
X-Inumbo-ID: 3a7dd23e-0091-43a7-a438-ebe66d3b53bd
Received: from se18-4.privateemail.com (unknown [198.54.127.87])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a7dd23e-0091-43a7-a438-ebe66d3b53bd;
 Mon, 24 Aug 2020 14:27:42 +0000 (UTC)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <tamas@tklengyel.com>) id 1kADRa-0000g7-EQ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 07:27:41 -0700
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id D0446A86
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 14:27:29 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 4277480060
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 10:27:29 -0400 (EDT)
Received: from mail-wm1-f49.google.com (unknown [10.20.151.224])
 by mta-13.privateemail.com (Postfix) with ESMTPA id A06698006B
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 14:27:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 83so8527874wme.4
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 07:27:28 -0700 (PDT)
X-Gm-Message-State: AOAM530c/QxUgm9GlUCdaeMfqD66JfwXDXJ/9PGs98Ij0JfHD77G5g9X
 7ZBOgnQy7iAJbpESwuaA07JLyQPlRecJ3CvOo7M=
X-Google-Smtp-Source: ABdhPJz/IOxIKJW8vXeEDgaJmSnfNrSXxpL6ExqfCV+qTzy69Lt+6L8aa5bavT/7PwOSQDs2nlUnS7NCqf6wnmhuyYg=
X-Received: by 2002:a1c:a787:: with SMTP id q129mr5974201wme.77.1598279243106; 
 Mon, 24 Aug 2020 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <7176ab91-d7c8-ccb0-cfa5-724c0687b454@suse.com>
 <cf64e65c-9de9-8626-7890-152b546c0dda@citrix.com>
 <3ab4e2da-ca9c-4121-0369-36faf953fe5e@suse.com>
In-Reply-To: <3ab4e2da-ca9c-4121-0369-36faf953fe5e@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Aug 2020 10:26:46 -0400
X-Gmail-Original-Message-ID: <CABfawhkgRgA5V-YbZGdDdxoBxZ0YrQyDM3Jo_-NxTJsJ_OiJ1w@mail.gmail.com>
Message-ID: <CABfawhkgRgA5V-YbZGdDdxoBxZ0YrQyDM3Jo_-NxTJsJ_OiJ1w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.12)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhV/41Oc2KkG5Wl
 lczZY20k90TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD6dlyFUCNOm4A+RbagoqcGcXW
 KniNrlErAk1ka2x3ssWY/RLwb8LtNblQmhlQVhqrxo241cMeOuhdZXqJnKm/0dqwTTJhLChIm0ME
 lNcQXjgsWoWxNnQGVmXmGlNWFvqPiTX6paolSqlHgPgYmEpc/CXAqEAQZXCFCwvZK9SRAKUfQDJw
 C6vqf+1ekbFu9TPIiDKbdpSbtI1rabalqsakRhVVJ2mVvokCO2vVjpfr/eX3+RWxljT0AAJgouHP
 rg5R6cTrAfIBtLJVe62uoyOAUop4cZXX4YNvBwClFIJz3G8Bi53Psle5cUmOuJZEMw7GmFVVgWdB
 XKkEH0++/JhR/Qa+FEE+TmTK/6Hl36Y/23+8Ksk+aedMfNWSnJswrtlNb4Rbo17Z1teUSazoNDZl
 dHZc3qoCx6jB3DEPYTf4NonYQ5Td2RXsWX2IABvakz06874MD/XDMPpcnv6l5Hrq7jOPc3EG53uL
 3j4HL+IhMsqbPc0mYnNMTVPrDKDVIdcLW+y7FntU/xwaLfK/la1KDKAaXVo/EC2K+bDeFIM9LXtF
 WNmB+XreNGXJtFt0qIJAj8QB+r6c4JMDkXz0ELFOj4DOcg83LXH4GksgCfTIQ54TKgAQriuw1aTi
 a+0Fz1FRylBJH/HZL+SBwttDp25IjkFQ4FPMf16J1ee+Ao2D6rE14O9uIBc4R2FHvu2iptL1STvE
 vUDMnx+cOT1kicaQRk4vidrAbzPztKfs4s5XguI1eiePaQrZKwdQXE5oc9bbgU04Eqk0ovQHihEN
 x9UXNWt2q/kTHLzyCebGKfzivszIQZBdZwQyA3WtwOFul/wCAEskSfm9PBUpgWCdb6TGLpT7gdGH
 fbJUKKBLQmc/IEXooxwbXsRR+vzvUHpiFqCMdQSGZdUgxw/2/3R/MN3ySHt7xa38BTgaUFztXoSo
 PpB5Ee/uSzbytlYMSQpUVs4HMS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 24, 2020 at 9:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 24.08.2020 15:00, Andrew Cooper wrote:
> > On 24/08/2020 13:34, Jan Beulich wrote:
> >> While in most cases code ahead of the invocation of set_gpfn_from_mfn()
> >> deals with shared pages, at least in set_typed_p2m_entry() I can't spot
> >> such handling (it's entirely possible there's code missing there). Let's
> >> try to play safe and add an extra check.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > I agree that this is an improvement.
> >
> > Therefore, tentatively Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks, but - what do I do with a tentative ack? Take it as a "normal"
> one, or not take it at all?
>
> > However, I don't think it is legitimate for set_gpfn_from_mfn() to be
> > overriding anything.
> >
> > IMO, we should be asserting something like (pfn == SHARED_M2P_ENTRY) ==
> > (d == dom_cow).
> >
> > Any code not passing this properly is almost certainly broken anyway,
> > and fixing up behind its back like this doesn't feel like a clever idea
> > (in debug builds at least).
>
> As said on v1: I agree in principle, but I'd like such a change to be
> made by the mem-sharing maintainer(s), so we wouldn't notice fallout
> only several months or years later. Tamas - would you be up for this?

Please feel free to add that ASSERT, if it does actually catch a
situation where it doesn't hold we'll fix it when it crosses our path.
It might indeed be several months/years before we get there. Currently
no bandwidth to check manually whether it triggers anything. Having
some CI tests would help with this for sure, but currently I only
check stuff like this by hand when we get to rc's.

Tamas

