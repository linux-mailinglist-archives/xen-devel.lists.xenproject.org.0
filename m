Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7572C1AB9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 02:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35325.66795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khMxy-0004ec-3j; Tue, 24 Nov 2020 01:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35325.66795; Tue, 24 Nov 2020 01:17:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khMxy-0004eD-0j; Tue, 24 Nov 2020 01:17:58 +0000
Received: by outflank-mailman (input) for mailman id 35325;
 Tue, 24 Nov 2020 01:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53sX=E6=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
 id 1khMxv-0004e8-S4
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 01:17:55 +0000
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 06df1276-6f68-4ffe-83aa-6eb82f589ee5;
 Tue, 24 Nov 2020 01:17:54 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 0EF842A8E0;
 Mon, 23 Nov 2020 19:58:39 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=53sX=E6=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
	id 1khMxv-0004e8-S4
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 01:17:55 +0000
X-Inumbo-ID: 06df1276-6f68-4ffe-83aa-6eb82f589ee5
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 06df1276-6f68-4ffe-83aa-6eb82f589ee5;
	Tue, 24 Nov 2020 01:17:54 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id 0EF842A8E0;
	Mon, 23 Nov 2020 19:58:39 -0500 (EST)
Date: Tue, 24 Nov 2020 11:58:37 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, 
    amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org, 
    ceph-devel@vger.kernel.org, cluster-devel@redhat.com, 
    coreteam@netfilter.org, devel@driverdev.osuosl.org, dm-devel@redhat.com, 
    drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org, 
    GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com, 
    intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, 
    keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
    linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    linux-arm-msm@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
    linux-block@vger.kernel.org, linux-can@vger.kernel.org, 
    linux-cifs@vger.kernel.org, 
    Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
    linux-decnet-user@lists.sourceforge.net, 
    Ext4 Developers List <linux-ext4@vger.kernel.org>, 
    linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org, 
    linux-gpio@vger.kernel.org, linux-hams@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, 
    linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-input <linux-input@vger.kernel.org>, linux-integrity@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, 
    Linux Media Mailing List <linux-media@vger.kernel.org>, 
    linux-mmc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, 
    linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
    linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
    linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
    linux-security-module@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, 
    linux-watchdog@vger.kernel.org, 
    linux-wireless <linux-wireless@vger.kernel.org>, 
    Network Development <netdev@vger.kernel.org>, 
    netfilter-devel@vger.kernel.org, nouveau@lists.freedesktop.org, 
    op-tee@lists.trustedfirmware.org, oss-drivers@netronome.com, 
    patches@opensource.cirrus.com, rds-devel@oss.oracle.com, 
    reiserfs-devel@vger.kernel.org, samba-technical@lists.samba.org, 
    selinux@vger.kernel.org, target-devel@vger.kernel.org, 
    tipc-discussion@lists.sourceforge.net, 
    usb-storage@lists.one-eyed-alien.net, 
    virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
    "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
In-Reply-To: <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com> <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com> <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
 <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 23 Nov 2020, Miguel Ojeda wrote:

> On Mon, 23 Nov 2020, Finn Thain wrote:
> 
> > On Sun, 22 Nov 2020, Miguel Ojeda wrote:
> > 
> > > 
> > > It isn't that much effort, isn't it? Plus we need to take into 
> > > account the future mistakes that it might prevent, too.
> > 
> > We should also take into account optimisim about future improvements 
> > in tooling.
> > 
> Not sure what you mean here. There is no reliable way to guess what the 
> intention was with a missing fallthrough, even if you parsed whitespace 
> and indentation.
> 

What I meant was that you've used pessimism as if it was fact.

For example, "There is no way to guess what the effect would be if the 
compiler trained programmers to add a knee-jerk 'break' statement to avoid 
a warning".

Moreover, what I meant was that preventing programmer mistakes is a 
problem to be solved by development tools. The idea that retro-fitting new 
language constructs onto mature code is somehow necessary to "prevent 
future mistakes" is entirely questionable.

> > > So even if there were zero problems found so far, it is still a 
> > > positive change.
> > > 
> > 
> > It is if you want to spin it that way.
> > 
> How is that a "spin"? It is a fact that we won't get *implicit* 
> fallthrough mistakes anymore (in particular if we make it a hard error).
> 

Perhaps "handwaving" is a better term?

> > > I would agree if these changes were high risk, though; but they are 
> > > almost trivial.
> > > 
> > 
> > This is trivial:
> > 
> >  case 1:
> >         this();
> > +       fallthrough;
> >  case 2:
> >         that();
> > 
> > But what we inevitably get is changes like this:
> > 
> >  case 3:
> >         this();
> > +       break;
> >  case 4:
> >         hmmm();
> > 
> > Why? Mainly to silence the compiler. Also because the patch author 
> > argued successfully that they had found a theoretical bug, often in 
> > mature code.
> > 
> If someone changes control flow, that is on them. Every kernel developer 
> knows what `break` does.
> 

Sure. And if you put -Wimplicit-fallthrough into the Makefile and if that 
leads to well-intentioned patches that cause regressions, it is partly on 
you.

Have you ever considered the overall cost of the countless 
-Wpresume-incompetence flags?

Perhaps you pay the power bill for a build farm that produces logs that 
no-one reads? Perhaps you've run git bisect, knowing that the compiler 
messages are not interesting? Or compiled software in using a language 
that generates impenetrable messages? If so, here's a tip:

# grep CFLAGS /etc/portage/make.conf 
CFLAGS="... -Wno-all -Wno-extra ..."
CXXFLAGS="${CFLAGS}"

Now allow me some pessimism: the hardware upgrades, gigawatt hours and 
wait time attributable to obligatory static analyses are a net loss.

> > But is anyone keeping score of the regressions? If unreported bugs 
> > count, what about unreported regressions?
> > 
> Introducing `fallthrough` does not change semantics. If you are really 
> keen, you can always compare the objects because the generated code 
> shouldn't change.
> 

No, it's not for me to prove that such patches don't affect code 
generation. That's for the patch author and (unfortunately) for reviewers.

> Cheers,
> Miguel
> 

