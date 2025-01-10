Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E69FA084E9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 02:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869201.1280669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW3vP-0007tj-Oi; Fri, 10 Jan 2025 01:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869201.1280669; Fri, 10 Jan 2025 01:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW3vP-0007rO-M5; Fri, 10 Jan 2025 01:34:59 +0000
Received: by outflank-mailman (input) for mailman id 869201;
 Fri, 10 Jan 2025 01:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CmC5=UC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tW3vN-0007rI-Fr
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 01:34:58 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f6cf13-cef3-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 02:34:54 +0100 (CET)
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
X-Inumbo-ID: 17f6cf13-cef3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736472893; x=1736732093;
	bh=tLrguJOShqZcXP2ov0aLkOlT3deeWIUvIRvhQQx9OIo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WgIW/Gt2NtQTTnW6TxQoEd29eozkNNG/QLvkDII+wwpiZNvW/r/pkLeioPQ3jKOqP
	 dcWkOfPX+bPBSZDWjEcIYyAxn4wf1G75prfpExfyppoS1p+Jl8QnHBH9c5PuKb4qzx
	 e/rIZf9+mtLox2MC8Fqp0mf1RfYYDpnNH2L9htjUIllQQedi5vggHC/YN7rcsbr8ES
	 4meS8dmGK8nh1bBPJtuDqgy4wLrdVswvNlipaJaNpUO7RWqD4KCHbQwLMYLL9dNTwP
	 zIz/6vQhBiTgnawf9xTje9yN1MK+7n+dXsGPaWrlmQU2RMj60MAofGg/aZ9JDZtOFR
	 8JSEBSiMwC46g==
Date: Fri, 10 Jan 2025 01:34:49 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <fEu9aEr73Vo1rvovrlR8uVR0cwOfWI1I6EfoFsrF3Vv776ylHUWRC7Asae-btnRTcfagSx9h-FZOtvS0aSa0zkBnRWHBP6sm4jGT8nRTrCk=@proton.me>
In-Reply-To: <e936ebe8-f729-4878-843e-639755b2fefb@suse.com>
References: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com> <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop> <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com> <Z34xhkNu5YLyEzut@macbook.local> <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com> <Z344xgqtpNZIDxHD@macbook.local> <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me> <e936ebe8-f729-4878-843e-639755b2fefb@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0d08b10c8ce2db5f6d17488f569651accd1a411a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, January 9th, 2025 at 12:27 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 08.01.2025 23:15, Denis Mukhin wrote:
>
> > On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monn=C3=A9 roger=
.pau@citrix.com wrote:
> >
> > > On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
> > >
> > > > On 08.01.2025 09:04, Roger Pau Monn=C3=A9 wrote:
> > > >
> > > > > On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> > > > >
> > > > > > On 08.01.2025 00:40, Stefano Stabellini wrote:
> > > > > >
> > > > > > > On Tue, 7 Jan 2025, Jan Beulich wrote:
> > > > > > >
> > > > > > > > On 06.01.2025 19:48, Stefano Stabellini wrote:
> > > > > > > >
> > > > > > > > > On Mon, 6 Jan 2025, Jan Beulich wrote:
> > > > > > > > >
> > > > > > > > > > On 04.01.2025 05:15, Denis Mukhin wrote:
> > > > > > > > > >
> > > > > > > > > > > On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beul=
ich jbeulich@suse.com wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrot=
e:
> > > > > > > > > > > >
> > > > > > > > > > > > > From: Denis Mukhin dmukhin@ford.com
> > > > > > > > > > > > >
> > > > > > > > > > > > > console_owner_domid() is introduced to obtain the=
 "console owner" domain ID.
> > > > > > > > > > > > >
> > > > > > > > > > > > > The call is used in NS8250 emulator to identify t=
he case when physical xen
> > > > > > > > > > > > > console focus is owned by the domain w/ NS8250 em=
ulator, in which case,
> > > > > > > > > > > > > messages from guest OS are formatted w/o '(XEN)' =
prefix.
> > > > > > > > > > > >
> > > > > > > > > > > > Such messages ought to be processed through guest_p=
rintk(), which wants a
> > > > > > > > > > > > domain pointer, not a domid_t anyway. Plus isn't th=
at going to be
> > > > > > > > > > > > current->domain anyway at the callsite, eliminating=
 the need for such a
> > > > > > > > > > > >
> > > > > > > > > > > > helper altogether?
> > > > > > > > > > >
> > > > > > > > > > > If the current domain is owning the physical console =
and printing, say, Linux
> > > > > > > > > > > login prompt, there's no need to add "(XEN)" for ever=
y printout; adding timestamps
> > > > > > > > > > > can be disabled from Xen command line.
> > > > > > > > > >
> > > > > > > > > > Surely there shouldn't be (XEN), but without (d<N>) it'=
ll be ambiguous in a log
> > > > > > > > > > which domain a message came from. As long as only Dom0 =
messages are left un-
> > > > > > > > > > prefixed, that's likely fine. Yet as soon as multiple d=
omains can issue such
> > > > > > > > > > messages (and have console "focus") I think the prefix =
needs to be there.
> > > > > > > > >
> > > > > > > > > It looks like we are aligned on the desired behavior,
> > > > > > > >
> > > > > > > > Hmm, no, I don't think we are. I don't ...
> > > > > > > >
> > > > > > > > > but for clarity,
> > > > > > > > > see https://marc.info/?l=3Dxen-devel&m=3D173405161613716,=
 also copy/pasted
> > > > > > > > > here:
> > > > > > > > >
> > > > > > > > > I think we should provide a consistent behavior across ar=
chitectures.
> > > > > > > > > The current behavior with vpl011 and dom0less on ARM is t=
he following:
> > > > > > > > >
> > > > > > > > > - no prefix for Dom0 output
> > > > > > > > > - DOM$NUM for DomUs when not in focus, otherwise no prefi=
x
> > > > > > > >
> > > > > > > > ... view this model as a desirable one. It leaves room for =
ambiguity.
> > > > > > >
> > > > > > > Adding a few more people in CC for feedback.
> > > > > > >
> > > > > > > My priority is to keep the architectures aligned. It might be=
 OK to
> > > > > > > change output format, but then let's do it uniformly on ARM a=
s well.
> > > > > > >
> > > > > > > Jan, please clarify what you think would be better than the a=
bove. Is it
> > > > > > > the following? I don't think I understood your preference.
> > > > > > >
> > > > > > > - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no =
prefix
> > > > > >
> > > > > > No, I mean like we have it with guest_printk() today. (XEN) for=
 Xen's
> > > > > > own messages, (d<N>) for ordinary domains' ones, and no prefix
> > > > > > exclusively for the hardware/control domain. What is best to do=
 when
> > > > > > hardware and control domains are distinct I'm uncertain - I'd b=
e
> > > > > > inclined to suggest that the hardware domain then stay the one =
without
> > > > > > any prefix.
> > > > >
> > > > > One concern I have with this approach is whether the addition of =
the
> > > > > (d<N>) prefixes will skew output of interactive applications. So =
far
> > > > > the prefix is added to output from all domains different than dom=
0
> > > > > because the console is not interactive for them, and hence no inp=
ut
> > > > > can be consumed.
> > > >
> > > > Hmm, that's an aspect I have to admit I didn't think of.
> > > >
> > > > > If that changes however, and domains different than dom0 can get =
input
> > > > > from the Xen console then I wonder how much the added prefix will=
 skew
> > > > > output. Another possible option would be to not print the prefix =
for
> > > > > the domain that has the console input assigned (current target), =
and
> > > > > print it for all other domains (even for dom0 when not in focus).
> > > >
> > > > That's largely what aiui was proposed. My extra requirement there w=
ould
> > > > then be that we make sure a log message is always emitted when cons=
ole
> > > > focus shifts, so it's possible to identify the owner for any part o=
f
> > > > the log.
> > >
> > > Indeed, printing console input shifting should be a requirement
> > > regardless of how we decide to print the prefix.
> >
> > Console input focus switch is indicated after pressing Crtl+aaa, e.g.:
> > [[
> > ...
> > (XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to switch=
 input)
> > (XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to switc=
h input)
> > (XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to switc=
h input)
> > ...
> > ]]
>
>
> And just to double check: These messages aren't affected by "loglvl=3D" s=
ettings,
> i.e. they're always there (as asked for earlier; see context above)?

`loglvl=3Dnone` disables console switch indication (even w/o my patches).
I will fix that.

Thanks!

>
> Jan

