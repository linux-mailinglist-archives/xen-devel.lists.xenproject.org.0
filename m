Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0921A084EE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 02:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869210.1280680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW400-0008Ud-9y; Fri, 10 Jan 2025 01:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869210.1280680; Fri, 10 Jan 2025 01:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW400-0008Rc-75; Fri, 10 Jan 2025 01:39:44 +0000
Received: by outflank-mailman (input) for mailman id 869210;
 Fri, 10 Jan 2025 01:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CmC5=UC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tW3zz-0008RW-4k
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 01:39:43 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2bda1d0-cef3-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 02:39:41 +0100 (CET)
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
X-Inumbo-ID: c2bda1d0-cef3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736473179; x=1736732379;
	bh=UZCiOtNyBFgwmB0bA+RI2qQUT6B61jfzP8IOQSKi5jk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FAnbUF8d4b0cY9FM57C786UUtlIKNwygMNEyP/BWKpvHudQhleGvdLJikhB89oLyq
	 k/9h/Jp82CjSepAPwqcT6p1uT9hudvez0XEjkyoKPpK/cBqb1yuHeaIXNwqfKkWklw
	 u/chFQFm6HMh71xlQLBD1gwJXuBEgtQrpR8JyEucxSfH6URc8tgHww7PRFjCx0sqHj
	 5evITkFXSwRZFq5v5olv3GnWsg8uWOnpViAijWpMx1pJjgBqIkgLEyrCnKFdkZa+DW
	 CqGYkPIihQPYkp2b7tVARVHxThItAXbCOMzztN9C9T4Fkm5XF3FrVQneAwiT/h26ll
	 yPOXw3tjWzF5A==
Date: Fri, 10 Jan 2025 01:39:36 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: Denis Mukhin <dmkhn@proton.me>
Cc: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <cKowJ0lJhKcoHoaPgGOX4xdDu6PCcg7MVnhS_y5L4mVGJfNlG-xXJdSGXJkIys5OqdCeSdiYtNQmI4znkjXLaqtqHefgvM33MbvMX700nk0=@proton.me>
In-Reply-To: <alpine.DEB.2.22.394.2501091534090.133435@ubuntu-linux-20-04-desktop>
References: <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com> <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com> <Z34xhkNu5YLyEzut@macbook.local> <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com> <Z344xgqtpNZIDxHD@macbook.local> <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me> <alpine.DEB.2.22.394.2501081615050.133435@ubuntu-linux-20-04-desktop> <Z3-Dcraxc55vi-ur@macbook.local> <alpine.DEB.2.22.394.2501091534090.133435@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: aebd2e3c7115c982923ac7776c9ea7f0b1dd45be
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Thursday, January 9th, 2025 at 3:46 PM, Stefano Stabellini <sstabellini@=
kernel.org> wrote:

>=20
>=20
> On Thu, 9 Jan 2025, Roger Pau Monn=C3=A9 wrote:
>=20
> > On Wed, Jan 08, 2025 at 04:29:24PM -0800, Stefano Stabellini wrote:
> >=20
> > > On Wed, 8 Jan 2025, Denis Mukhin wrote:
> > >=20
> > > > On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monn=C3=
=A9 roger.pau@citrix.com wrote:
> > > >=20
> > > > > On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
> > > > >=20
> > > > > > On 08.01.2025 09:04, Roger Pau Monn=C3=A9 wrote:
> > > > > >=20
> > > > > > > On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> > > > > > >=20
> > > > > > > > On 08.01.2025 00:40, Stefano Stabellini wrote:
> > > > > > > >=20
> > > > > > > > > On Tue, 7 Jan 2025, Jan Beulich wrote:
> > > > > > > > >=20
> > > > > > > > > > On 06.01.2025 19:48, Stefano Stabellini wrote:
> > > > > > > > > >=20
> > > > > > > > > > > On Mon, 6 Jan 2025, Jan Beulich wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > > On 04.01.2025 05:15, Denis Mukhin wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > > On Tuesday, December 10th, 2024 at 11:28 PM, Jan =
Beulich jbeulich@suse.com wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > On 06.12.2024 05:41, Denis Mukhin via B4 Relay =
wrote:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > From: Denis Mukhin dmukhin@ford.com
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > console_owner_domid() is introduced to obtain=
 the "console owner" domain ID.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > The call is used in NS8250 emulator to identi=
fy the case when physical xen
> > > > > > > > > > > > > > > console focus is owned by the domain w/ NS825=
0 emulator, in which case,
> > > > > > > > > > > > > > > messages from guest OS are formatted w/o '(XE=
N)' prefix.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Such messages ought to be processed through gue=
st_printk(), which wants a
> > > > > > > > > > > > > > domain pointer, not a domid_t anyway. Plus isn'=
t that going to be
> > > > > > > > > > > > > > current->domain anyway at the callsite, elimina=
ting the need for such a
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > helper altogether?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > If the current domain is owning the physical cons=
ole and printing, say, Linux
> > > > > > > > > > > > > login prompt, there's no need to add "(XEN)" for =
every printout; adding timestamps
> > > > > > > > > > > > > can be disabled from Xen command line.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Surely there shouldn't be (XEN), but without (d<N>)=
 it'll be ambiguous in a log
> > > > > > > > > > > > which domain a message came from. As long as only D=
om0 messages are left un-
> > > > > > > > > > > > prefixed, that's likely fine. Yet as soon as multip=
le domains can issue such
> > > > > > > > > > > > messages (and have console "focus") I think the pre=
fix needs to be there.
> > > > > > > > > > >=20
> > > > > > > > > > > It looks like we are aligned on the desired behavior,
> > > > > > > > > >=20
> > > > > > > > > > Hmm, no, I don't think we are. I don't ...
> > > > > > > > > >=20
> > > > > > > > > > > but for clarity,
> > > > > > > > > > > see https://marc.info/?l=3Dxen-devel&m=3D173405161613=
716, also copy/pasted
> > > > > > > > > > > here:
> > > > > > > > > > >=20
> > > > > > > > > > > I think we should provide a consistent behavior acros=
s architectures.
> > > > > > > > > > > The current behavior with vpl011 and dom0less on ARM =
is the following:
> > > > > > > > > > >=20
> > > > > > > > > > > - no prefix for Dom0 output
> > > > > > > > > > > - DOM$NUM for DomUs when not in focus, otherwise no p=
refix
> > > > > > > > > >=20
> > > > > > > > > > ... view this model as a desirable one. It leaves room =
for ambiguity.
> > > > > > > > >=20
> > > > > > > > > Adding a few more people in CC for feedback.
> > > > > > > > >=20
> > > > > > > > > My priority is to keep the architectures aligned. It migh=
t be OK to
> > > > > > > > > change output format, but then let's do it uniformly on A=
RM as well.
> > > > > > > > >=20
> > > > > > > > > Jan, please clarify what you think would be better than t=
he above. Is it
> > > > > > > > > the following? I don't think I understood your preference=
.
> > > > > > > > >=20
> > > > > > > > > - DOM$NUM for Dom0 and DomUs when not in focus, otherwise=
 no prefix
> > > > > > > >=20
> > > > > > > > No, I mean like we have it with guest_printk() today. (XEN)=
 for Xen's
> > > > > > > > own messages, (d<N>) for ordinary domains' ones, and no pre=
fix
> > > > > > > > exclusively for the hardware/control domain. What is best t=
o do when
> > > > > > > > hardware and control domains are distinct I'm uncertain - I=
'd be
> > > > > > > > inclined to suggest that the hardware domain then stay the =
one without
> > > > > > > > any prefix.
> > > > > > >=20
> > > > > > > One concern I have with this approach is whether the addition=
 of the
> > > > > > > (d<N>) prefixes will skew output of interactive applications.=
 So far
> > > > > > > the prefix is added to output from all domains different than=
 dom0
> > > > > > > because the console is not interactive for them, and hence no=
 input
> > > > > > > can be consumed.
> > > > > >=20
> > > > > > Hmm, that's an aspect I have to admit I didn't think of.
> > > > > >=20
> > > > > > > If that changes however, and domains different than dom0 can =
get input
> > > > > > > from the Xen console then I wonder how much the added prefix =
will skew
> > > > > > > output. Another possible option would be to not print the pre=
fix for
> > > > > > > the domain that has the console input assigned (current targe=
t), and
> > > > > > > print it for all other domains (even for dom0 when not in foc=
us).
> > > > > >=20
> > > > > > That's largely what aiui was proposed. My extra requirement the=
re would
> > > > > > then be that we make sure a log message is always emitted when =
console
> > > > > > focus shifts, so it's possible to identify the owner for any pa=
rt of
> > > > > > the log.
> > > > >=20
> > > > > Indeed, printing console input shifting should be a requirement
> > > > > regardless of how we decide to print the prefix.
> > > >=20
> > > > Console input focus switch is indicated after pressing Crtl+aaa, e.=
g.:
> > > > [[
> > > > ...
> > > > (XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to sw=
itch input)
> > > > (XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to s=
witch input)
> > > > (XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to s=
witch input)
> > > > ...
> > > > ]]
> > >=20
> > > Roger, Jan, you should use Xen Dom0less more :-) This is the way it
> > > already works on ARM. Let me expand on my earlier message that was to=
o
> > > terse.
> >=20
> > Hehe, I should use ARM more in general I think :).
> >=20
> > > At boot time, Xen prints messages with the (XEN) prefix as usual:
> > >=20
> > > (XEN) Brought up 4 CPUs
> > >=20
> > > When Dom0 starts, it has not prefix (and has input by default):
> > >=20
> > > [ 0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> > >=20
> > > When a DomU starts, it has the following prefix (and doesn't have
> > > input):
> > >=20
> > > (XEN) DOM1: [ 0.000000] Booting Linux on physical CPU 0x0000000000 [0=
x410fd034]
> > >=20
> > > Eventually, both Linuxes finish booting, you can login into Dom0 as
> > > usual. Messages from Dom1, if any, are still printed with (XEN) DOM1 =
as
> > > prefix.
> > >=20
> > > You can switch input to Dom1 with Ctrx-aaa, the same way that you do
> > > today to switch between Xen and Dom0. Xen prints a message:
> > >=20
> > > (XEN) *** Serial input to DOM1 (type 'CTRL-a' three times to switch i=
nput)
> > >=20
> > > Now, as you type, you send characters to Dom1. And Dom1 doesn't have =
the
> > > DOM1 prefix any longer, while it is still has (XEN) because the messa=
ge
> > > is printed by Xen on behalf of the domain:
> > >=20
> > > (XEN) / # echo hello world
> > > (XEN) hello world
> > >=20
> > > If Dom0 prints anything in the backgrounds, it shows without prefixes=
:
> > >=20
> > > hello world from dom0
> > >=20
> > > If another domain, dom2, prints anything in the background, it shows
> > > with (XEN) DOM2 prefix:
> > >=20
> > > (XEN) DOM2: hello from dom2
> > >=20
> > > I think it makes sense to be consistent across architectures and we
> > > should default to the same behavior on x86 too. If we want to make
> > > improvements, the one thing I could potentially see changing is addin=
g a
> > > DOM0 prefix to Dom0 messages when Dom0 does not have input. If we do
> > > that, let's do it on both ARM and x86 architectures.
> >=20
> > The usual prefix is (d<domid>) IIRC, that's what guest_printk() uses,
> > is there any reason dom0less uses "(XEN) DOM<domid>:" instead of the
> > guest_printk() prefix?
> >=20
> > My preference would be use to (d<domid>) prefix for any guest output
> > that doesn't belong to the domain that's the recipient of the input
> > (iow: not in console input focus). And drop the (XEN) prefix from
> > guest output.
> >=20
> > The rest looks all sensible to me. I think we should avoid adding any
> > prefixes to guest output when it has the console focus, as otherwise
> > interactive applications might not work correctly.
>=20
>=20
> I am OK with what you describe, I would kindly ask Denis to also modify
> ARM vpl011 to match. Looking at the code, I don't know where the (XEN)
> prefix is coming from, but for the DOM<domid> to d<domid> change, it

Yep, I implemented such logic in v3 iteration of the series:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-24-c5d36b31=
d66c@ford.com/

printk() adds "(XEN)" prefix (drivers/char/console.c)

>=20
> would be probably something like this:
>=20
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 1fc3114cce..959d172e96 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -107,7 +107,10 @@ static void vpl011_write_data_xen(struct domain *d, =
uint8_t data)
> if ( data !=3D '\n' )
> intf->out[intf->out_prod++] =3D '\n';
>=20
> intf->out[intf->out_prod++] =3D '\0';
>=20
> - printk("DOM%u: %s", d->domain_id, intf->out);
>=20
> + if ( in_focus(d) )
> + printk("%s", intf->out);
>=20
> + else
> + guest_printk("%s", d, intf->out);
>=20
> intf->out_prod =3D 0;
>=20
> }
> }
>=20
> There is also one additional change needed to add the (d<domid>) prefix
>=20
> for dom0 when not in focus. The Dom0 print typically comes from

This change I missed. Thanks!

> do_console_io, so in pseudocode we would need something like:
>=20
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 7da8c5296f..5d250b642a 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -643,6 +643,9 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
> /* Use direct console output as it could be interactive */
> nrspin_lock_irq(&console_lock);
>=20
> + if ( !in_focus(cd) )
> + add_prefix(kbuf, "(d0) ");
> +
> console_serial_puts(kbuf, kcount);
> video_puts(kbuf, kcount);

