Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD86358C0A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 20:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107492.205476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUZEs-0006wd-Ul; Thu, 08 Apr 2021 18:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107492.205476; Thu, 08 Apr 2021 18:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUZEs-0006wH-RH; Thu, 08 Apr 2021 18:18:46 +0000
Received: by outflank-mailman (input) for mailman id 107492;
 Thu, 08 Apr 2021 17:32:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Pp8=JF=net-space.pl=dkiper@srs-us1.protection.inumbo.net>)
 id 1lUYVw-000379-Qb
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 17:32:20 +0000
Received: from dibed.net-space.pl (unknown [84.10.22.86])
 by us1-amaz-eas2.inumbo.com (Halon) with SMTP
 id 60efd386-e1e1-4491-b657-6c2078e537b2;
 Thu, 08 Apr 2021 17:32:19 +0000 (UTC)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:58848 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S2096011AbhDHQsq convert rfc822-to-quoted-printable (ORCPT
 <rfc822;xen-devel@lists.xenproject.org>);
 Thu, 8 Apr 2021 18:48:46 +0200
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
X-Inumbo-ID: 60efd386-e1e1-4491-b657-6c2078e537b2
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Thu, 8 Apr 2021 18:48:39 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	Roman Shaposhnik <roman@zededa.com>
Cc:	grub-devel@gnu.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <20210408164839.t5ulhjswnypbqpnz@tomti.i.net-space.pl>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
 <YGWH89ubVe104Tnl@Air-de-Roger>
 <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
MIME-Version: 1.0
Content-Type:	text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Apr 01, 2021 at 08:43:46PM +0100, Andrew Cooper via Grub-devel =
wrote:
> On 01/04/2021 09:44, Roger Pau Monn=E9 wrote:
> > On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
> >> On 01.04.2021 03:06, Roman Shaposhnik wrote:
> >>> And the obvious next question: is my EVE usecase esoteric enough =
that
> >>> I should just go ahead and do a custom GRUB patch or is there a m=
ore
> >>> general interest in this?
> >> Not sure if it ought to be a grub patch - the issue could as well
> >> be dealt with in Xen, by concatenating modules to form a monolithi=
c
> >> initrd.
> > I would rather have it done in the loader than Xen, mostly because
> > it's a Linux boot specific format, and hence I don't think Xen shou=
ld
> > have any knowledge about it.
> >
> > If it turns out to be impossible to implement on the loader side we
> > should consider doing it in Xen, but that's not my first option.
>
> Concatenating random things which may or may not be initrds is
> absolutely not something Xen should do.=A0 We don't have enough conte=
xt to
> do it safely/sensibly.
>
> Honestly, I like the idea of supporting something like this generally=
 in
> grub.=A0 Linux already commonly has initrd preparation prepending an
> uncompressed microcode CPIO archive, and I can see a usability advant=
age
> from maintaining the initrd fragments separately.
>
> Looking at the grub manual, this behaviour of the `initrd` command is=
n't
> even documented.=A0 Perhaps that should be fixed first, and then mayb=
e
> `module2_multi` added too?

I am OK with additional Multiboot2 command. Though I would do
s/module2_multi/module2_concat/. Additionally, it should look for "--"
and interpret everything after it as a command line argument for
a concatenated module.

Daniel

