Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14033A06809
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 23:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867760.1279326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVeKi-000725-EF; Wed, 08 Jan 2025 22:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867760.1279326; Wed, 08 Jan 2025 22:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVeKi-0006yw-Av; Wed, 08 Jan 2025 22:15:24 +0000
Received: by outflank-mailman (input) for mailman id 867760;
 Wed, 08 Jan 2025 22:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=id0C=UA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tVeKg-0006yq-Mv
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 22:15:23 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c038417-ce0e-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 23:15:20 +0100 (CET)
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
X-Inumbo-ID: 0c038417-ce0e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=xcc7p6cv75bwbjoi56cbpkzc4u.protonmail; t=1736374516; x=1736633716;
	bh=iJ7jgISMnP8moSJeN9ZG3IJ8El/2wUuhZQhxp6SyEeY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UUB80WaO9OnBzShM5TXlZKagTl9MVzGOrSmhNbAdOXlyk5QhOLJsdewDjF7WcsPfJ
	 //W7y5hUNV3BvYxOG1U8kPd91gEjjdAa7+9AihlVDMM1eqx0OS/8+TJe2gwjuByWAB
	 Ke0WTkX+IwiCvfgqj3qMa/Wzbjg+NhQODV10i5Y2Q5ht7xpqJO1iVS5pR/yZWufXdN
	 BDfYHuj0PRE4DgyyZKzc6cg/lV6njppzzrGTo6pBtMPyhA0kMb+8tLT0FsDuBfPz/q
	 /9kIp6hXkMiaumfp1bGCC0hULsh9vTbwxntHevYgZ1NALMDYgYYiOVeJ7e9Kt4RZ0D
	 9LYT7856ncSZg==
Date: Wed, 08 Jan 2025 22:15:13 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
In-Reply-To: <Z344xgqtpNZIDxHD@macbook.local>
References: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com> <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop> <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com> <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop> <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com> <Z34xhkNu5YLyEzut@macbook.local> <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com> <Z344xgqtpNZIDxHD@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 57f5106749caa5e22301cbc8a0994558b0ce2fc3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>=20
>=20
> On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
>=20
> > On 08.01.2025 09:04, Roger Pau Monn=C3=A9 wrote:
> >=20
> > > On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> > >=20
> > > > On 08.01.2025 00:40, Stefano Stabellini wrote:
> > > >=20
> > > > > On Tue, 7 Jan 2025, Jan Beulich wrote:
> > > > >=20
> > > > > > On 06.01.2025 19:48, Stefano Stabellini wrote:
> > > > > >=20
> > > > > > > On Mon, 6 Jan 2025, Jan Beulich wrote:
> > > > > > >=20
> > > > > > > > On 04.01.2025 05:15, Denis Mukhin wrote:
> > > > > > > >=20
> > > > > > > > > On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich =
jbeulich@suse.com wrote:
> > > > > > > > >=20
> > > > > > > > > > On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> > > > > > > > > >=20
> > > > > > > > > > > From: Denis Mukhin dmukhin@ford.com
> > > > > > > > > > >=20
> > > > > > > > > > > console_owner_domid() is introduced to obtain the "co=
nsole owner" domain ID.
> > > > > > > > > > >=20
> > > > > > > > > > > The call is used in NS8250 emulator to identify the c=
ase when physical xen
> > > > > > > > > > > console focus is owned by the domain w/ NS8250 emulat=
or, in which case,
> > > > > > > > > > > messages from guest OS are formatted w/o '(XEN)' pref=
ix.
> > > > > > > > > >=20
> > > > > > > > > > Such messages ought to be processed through guest_print=
k(), which wants a
> > > > > > > > > > domain pointer, not a domid_t anyway. Plus isn't that g=
oing to be
> > > > > > > > > > current->domain anyway at the callsite, eliminating the=
 need for such a
> > > > > > > > > >=20
> > > > > > > > > > helper altogether?
> > > > > > > > >=20
> > > > > > > > > If the current domain is owning the physical console and =
printing, say, Linux
> > > > > > > > > login prompt, there's no need to add "(XEN)" for every pr=
intout; adding timestamps
> > > > > > > > > can be disabled from Xen command line.
> > > > > > > >=20
> > > > > > > > Surely there shouldn't be (XEN), but without (d<N>) it'll b=
e ambiguous in a log
> > > > > > > > which domain a message came from. As long as only Dom0 mess=
ages are left un-
> > > > > > > > prefixed, that's likely fine. Yet as soon as multiple domai=
ns can issue such
> > > > > > > > messages (and have console "focus") I think the prefix need=
s to be there.
> > > > > > >=20
> > > > > > > It looks like we are aligned on the desired behavior,
> > > > > >=20
> > > > > > Hmm, no, I don't think we are. I don't ...
> > > > > >=20
> > > > > > > but for clarity,
> > > > > > > see https://marc.info/?l=3Dxen-devel&m=3D173405161613716, als=
o copy/pasted
> > > > > > > here:
> > > > > > >=20
> > > > > > > I think we should provide a consistent behavior across archit=
ectures.
> > > > > > > The current behavior with vpl011 and dom0less on ARM is the f=
ollowing:
> > > > > > >=20
> > > > > > > - no prefix for Dom0 output
> > > > > > > - DOM$NUM for DomUs when not in focus, otherwise no prefix
> > > > > >=20
> > > > > > ... view this model as a desirable one. It leaves room for ambi=
guity.
> > > > >=20
> > > > > Adding a few more people in CC for feedback.
> > > > >=20
> > > > > My priority is to keep the architectures aligned. It might be OK =
to
> > > > > change output format, but then let's do it uniformly on ARM as we=
ll.
> > > > >=20
> > > > > Jan, please clarify what you think would be better than the above=
. Is it
> > > > > the following? I don't think I understood your preference.
> > > > >=20
> > > > > - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no pref=
ix
> > > >=20
> > > > No, I mean like we have it with guest_printk() today. (XEN) for Xen=
's
> > > > own messages, (d<N>) for ordinary domains' ones, and no prefix
> > > > exclusively for the hardware/control domain. What is best to do whe=
n
> > > > hardware and control domains are distinct I'm uncertain - I'd be
> > > > inclined to suggest that the hardware domain then stay the one with=
out
> > > > any prefix.
> > >=20
> > > One concern I have with this approach is whether the addition of the
> > > (d<N>) prefixes will skew output of interactive applications. So far
> > > the prefix is added to output from all domains different than dom0
> > > because the console is not interactive for them, and hence no input
> > > can be consumed.
> >=20
> > Hmm, that's an aspect I have to admit I didn't think of.
> >=20
> > > If that changes however, and domains different than dom0 can get inpu=
t
> > > from the Xen console then I wonder how much the added prefix will ske=
w
> > > output. Another possible option would be to not print the prefix for
> > > the domain that has the console input assigned (current target), and
> > > print it for all other domains (even for dom0 when not in focus).
> >=20
> > That's largely what aiui was proposed. My extra requirement there would
> > then be that we make sure a log message is always emitted when console
> > focus shifts, so it's possible to identify the owner for any part of
> > the log.
>=20
>=20
> Indeed, printing console input shifting should be a requirement
> regardless of how we decide to print the prefix.

Console input focus switch is indicated after pressing Crtl+aaa, e.g.:
[[
...
(XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to switch inp=
ut)
(XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to switch in=
put)
(XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to switch in=
put)
...
]]

>=20
> Thanks, Roger.

