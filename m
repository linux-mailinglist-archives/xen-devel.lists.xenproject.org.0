Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E437A1ECAFC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 10:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgOOQ-00051E-9R; Wed, 03 Jun 2020 08:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZjh=7Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jgOOO-000517-Ik
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 08:04:56 +0000
X-Inumbo-ID: e8ebe3b8-a570-11ea-9dbe-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8ebe3b8-a570-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 08:04:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /I5ZVj8U7HfHGRMlpH5DQhW4Ul0ywGV4njgOWh+sg48a/eq0rqRa/PL/hQ6ICNEoaNtSv4N7pF
 uX2rhUAADtVp/MuMTptwUgKUtNhrYx5+ubRSb0vVNG/wzdFlP0X97Btold2Dy0XQ26uCzuoIDy
 HPdl5FFij5kKiGqEAnle10c2gDcVBc9IsecuUGywEqHo4AZWmJskpL7wAbjq4FDGh0tKIeqkoi
 LeddxBA051LO27SfhKqEuudH/eQZPYv3HFMon+zvMMAkuwKHISxf03Xf03VNt0Q/i3mA0ctis/
 Oio=
X-SBRS: 2.7
X-MesageID: 19842000
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19842000"
Date: Wed, 3 Jun 2020 10:04:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
Message-ID: <20200603080440.GB1195@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhkB1u2M8RCO0v8uwsur4ZUSThwy_1Uhj=k0UjUdyNZi3Q@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 07:10:07AM -0600, Tamas K Lengyel wrote:
> On Tue, Jun 2, 2020 at 7:00 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 02.06.2020 14:51, Tamas K Lengyel wrote:
> > > On Tue, Jun 2, 2020 at 6:47 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 02.06.2020 14:40, Tamas K Lengyel wrote:
> > >>> On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >>>>
> > >>>> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> > >>>>> Extend the monitor_op domctl to include option that enables
> > >>>>> controlling what values certain registers are permitted to hold
> > >>>>> by a monitor subscriber.
> > >>>>
> > >>>> I think the change could benefit for some more detail commit message
> > >>>> here. Why is this useful?
> > >>>
> > >>> You would have to ask the Bitdefender folks who made the feature. I
> > >>> don't use it. Here we are just making it optional as it is buggy so it
> > >>> is disabled by default.
> > >>
> > >> Now that's exactly the opposite of what I had derived from the
> > >> description here so far. Perhaps an at least weak indication
> > >> that you want to reword this. For example, from your reply to
> > >> Roger I understand it's rather that the new flag allows to
> > >> "suppress" the controlling (since presumably you don't change
> > >> default behavior), rather then "enabling" it.
> > >
> > > What we are adding is a domctl you need to call that enables this
> > > feature. It's not an option to suppress it. It shouldn't have been
> > > enabled by default to begin with. That was a mistake when the feature
> > > was contributed and it is buggy.
> >
> > Okay, in this case it's important to point out that you alter
> > default behavior. The BitDefender folks may not like this, yet
> > they've been surprisingly silent so far.
> 
> Well, it was Bitdefender who altered the default behavior. We are
> reverting their mistake and making it optional. But I can certainly
> make that more clear.

I would like some input from the Bitdefender guys. Is there a bugfix
planned for this feature?

It would be nice to get this in before 4.14 releases.

Roger.

