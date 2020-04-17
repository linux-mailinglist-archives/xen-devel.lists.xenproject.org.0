Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37791ADE24
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 15:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPQuD-00017T-Ah; Fri, 17 Apr 2020 13:19:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNba=6B=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jPQuB-00016v-WF
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 13:19:40 +0000
X-Inumbo-ID: 162a4f82-80ae-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 162a4f82-80ae-11ea-83d8-bc764e2007e4;
 Fri, 17 Apr 2020 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587129577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z3WtNWDaRIC8wLfSnN432v4D7LHYtucb0aC+fVHX9Vg=;
 b=M7R3Tg3DltuTJQloXZkCTLz7k4d+i+qJDlTED+kSmU7RzD4WV0TA5rSc
 ClC7rSjnVFML76853rbUn7mXgkPi54bVa7YfipSK87hBGhKWsbD/D39RE
 J2Hd5B73krXf+/sl1UfaKoFyLPcEuMQYwLkgbG3Xc8KstfYwBTGzuSChi A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wsRw+yfmvKUvI9XLHy3KfJD0s5nsAbwcsHNu8AyKMgo369T4sd2Ne5JxoooSuqCQ4CmwlKnsTg
 pPwU08NgY8SWHBGL8MSG6ng86ABTFvtcNGwLMyBEusm4Ff71vf83dmBFShLMG0rzrZKZneQ4Nd
 3msDQy5jgQoVMKshpWG9RqfK54fX3Gm+M0UJx8iuJlzG262uUpKudzGB048ZQpe+fY3ETc5ih4
 rfenKhC3YjKSNn/4fkvzm3Zrqk0oPwJ/4khEw1iXXVzQygP1FeGYew7dW8/to6HIRKLFZp/md+
 Nho=
X-SBRS: 2.7
X-MesageID: 16159541
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16159541"
Date: Fri, 17 Apr 2020 14:19:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
Message-ID: <20200417131931.GM4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-15-anthony.perard@citrix.com>
 <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
 <20200416124400.GG4088@perard.uk.xensource.com>
 <312e719f-2bae-cb29-a6dd-29ae0d976d95@suse.com>
 <20200416150929.GL4088@perard.uk.xensource.com>
 <586cff44-d46e-3a5b-9e47-0c7ff4de8801@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <586cff44-d46e-3a5b-9e47-0c7ff4de8801@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 09:12:11AM +0200, Jan Beulich wrote:
> On 16.04.2020 17:09, Anthony PERARD wrote:
> > On Thu, Apr 16, 2020 at 04:22:05PM +0200, Jan Beulich wrote:
> >> On 16.04.2020 14:44, Anthony PERARD wrote:
> >>> On Wed, Apr 08, 2020 at 02:54:35PM +0200, Jan Beulich wrote:
> >>>> On 31.03.2020 12:30, Anthony PERARD wrote:
> >>>>> We want to use the same rune to build mm/*/guest_*.o as the one use to
> >>>>> build every other *.o object. The consequence it that file symbols that
> >>>>> the program ./symbols prefer changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.
> >>>>>
> >>>>> (1) Currently we have those two file symbols:
> >>>>>     guest_walk.c
> >>>>>     guest_walk_2.o
> >>>>> (2) with CONFIG_ENFORCE_UNIQUE_SYMBOLS used on guest_walk.c, we will have:
> >>>>>     arch/x86/mm/guest_walk.c
> >>>>>     guest_walk_2.o
> >>>>>
> >>>>> The order in which those symbols are present may be different.
> >>>>>
> >>>>> Currently, in case (1) ./symbols chooses the *.o symbol (object file
> >>>>> name). But in case (2), may choose the *.c symbol (source file name with
> >>>>> path component) if it is first
> >>>>>
> >>>>> We want to have ./symbols choose the object file name symbol in both
> >>>>> cases.
> >>>>
> >>>> I guess the reason for wanting this is somehow connected to the
> >>>> statement at the beginning of the description, but I can't seem
> >>>> to be able to make the connection.
> >>>
> >>> I'm not sure I can explain it better.
> >>>
> >>> The "object file name" file symbol is used to distinguish between symbols
> >>> from all mm/*/guest_* objects. The other file symbol present in those
> >>> object is a "source file name without any path component symbol".
> >>>
> >>> But building those objects with the same rune as any other objects, and
> >>> having CONFIG_ENFORCE_UNIQUE_SYMBOLS=y, changes the file symbols present
> >>> in the resulting object. We still have the "object file name" symbol,
> >>> but now we also have "source file name with path components" symbol.
> >>> Unfortunately, all mm/*/guest_*.o in one directory are built from the
> >>> same source file, and thus have the same "source file name" symbol, but
> >>> have different "object file name" symbol. We still want to be able to
> >>> distinguish between guest_*.o in one dir, and the only way for that is
> >>> to use the "object file name" symbol.
> >>
> >> So where's the difference from how things work right now? The "same rune"
> >> aspect doesn't really change - right now we also build with effectively
> >> the same logic, just that -DGUEST_PAGING_LEVELS=... gets added. I guess
> >> it might help if you showed (for one particular example) how the set of
> >> file symbols changes from what we have now (with and without
> >> CONFIG_ENFORCE_UNIQUE_SYMBOLS=y) to what there would be with your changes
> >> to the symbols utility to what there will be with those changes.
> > 
> > The logic to build objects from C files changed in 81ecb38b83b0 ("build:
> > provide option to disambiguate symbol names"), with objects build with
> > __OBJECT_FILE__ explicitly left alone. So the logic is different now (at
> > least when CONFIG_ENFORCE_UNIQUE_SYMBOLS=y).
> > 
> > I did add the example of building arch/x86/mm/guest_walk_2.o to the
> > commit message, reworded below:
> > 
> > For example, when building arch/x86/mm/guest_walk_2.o from guest_walk.c,
> > this would be the difference of file symbol present in the object when
> > building with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y:
> > 
> > (1) Currently we have those two file symbols:
> >     guest_walk.c
> >     guest_walk_2.o
> > (2) When building with the same rune, we will have:
> >     arch/x86/mm/guest_walk.c
> >     guest_walk_2.o
> 
> Ah, yes, the changed introductory paragraph makes clear (to me)
> what presence and what future (1) and (2) are talking about. Yet
> what I then still don't understand - what is it that makes the
> path appear when switching to the common rune? Oh - I finally
> figured it: It's the objcopy step that will apply to all targets
> uniformly then. Perhaps it's indeed obvious, but it clearly
> wasn't to me when merely looking at the patch.
>
> With this I'd then wonder whether it wouldn't be a far smaller
> adjustment to simply skip that --redefine-sym step in case the
> object file already has a file symbol naming the object file,
> thus simply retaining the status quo.

So, we should call `nm' thousands of time, to find out if calling
`objcopy' is needed, for the 9 objects that doesn't need the extra step?

Or do you mean keeping exception to the rule? And hope that when someone
changes the rule, it doesn't forget to check if the exception needs
changing as well?

Also, I'm going to have to use this patch later anyway as sometime CC
use a full path to the source as file symbol. So this is going to be
important when we will run for example
`clang -o arch/x86/mm/guest_walk_2.o arch/x86/mm/guest_walk.c`.
(There isn't a patch for that yet.)

-- 
Anthony PERARD

