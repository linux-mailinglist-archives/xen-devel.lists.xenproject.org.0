Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF063E01FA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 15:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163742.299862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBGwg-0006TU-09; Wed, 04 Aug 2021 13:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163742.299862; Wed, 04 Aug 2021 13:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBGwf-0006QG-TH; Wed, 04 Aug 2021 13:28:29 +0000
Received: by outflank-mailman (input) for mailman id 163742;
 Wed, 04 Aug 2021 13:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RR6J=M3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mBGwe-0006QA-7I
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 13:28:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73dc670e-9194-4b25-8b97-079131048fcb;
 Wed, 04 Aug 2021 13:28:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D574221D1D;
 Wed,  4 Aug 2021 13:28:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C2AC13C7F;
 Wed,  4 Aug 2021 13:28:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mtKLI/mVCmGmXQAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 04 Aug 2021 13:28:25 +0000
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
X-Inumbo-ID: 73dc670e-9194-4b25-8b97-079131048fcb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628083705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5e1AooYmcDCl65gMxBHRkJOfos8nSyV4QAbuSvCkoLY=;
	b=dWjWoXjEitde8//6kHpS4umS3MRFAgUEp3kC7H55B9nuRcEu0iXw4+MYGqYOsNICh+PtqC
	uvk1SkgauBl1aYbJL/FSsTcb/BgFZ+WI6hHB7KcxgiimTA5i+Kaa09LQ221scbTgrMg2sm
	nFxPHlLFW8WVBT1zU4NeyTCXcvyMC9Y=
Message-ID: <dc1f7b4c18e46d1cdadedc9db2fcab516ad4cc81.camel@suse.com>
Subject: Re: [PATCH] Xen: credit2: avoid picking a spurious idle unit when
 caps are used
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 04 Aug 2021 15:28:24 +0200
In-Reply-To: <d8c821f4-8cdf-8d77-90cb-5149a70c7741@suse.com>
References: <162801221667.955.3439735419862661383.stgit@Wayrath>
	 <d8c821f4-8cdf-8d77-90cb-5149a70c7741@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4ngynJ28XS+oUoQU7RHt"
User-Agent: Evolution 3.40.3 (by Flathub.org) 
MIME-Version: 1.0


--=-4ngynJ28XS+oUoQU7RHt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-08-04 at 09:37 +0200, Jan Beulich wrote:
> On 03.08.2021 19:36, Dario Faggioli wrote:
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > Suggested-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Minor remark: Generally I think the order of tags should follow the
> timeline: Suggestions (or bug reports) come before patch creation,
> which in turns comes before reviewing / acking of a patch.
>=20
Right. In fact, I agree, and I keep forgetting doing that.

Thanks, will fix.

> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
>=20
> Since George is on leave and since I was Cc-ed, I thought I'd make an
> attempt at reviewing this. The more that ...
>=20
Yep. You were Cc-ed because of the request to backport and include in
stable branches, but thank you very much for also taking the time to
have a look at it!! :-)

> > It should, therefore, be backported and applied to all the branches
> > to
> > which that commit has been. About backports, it should be
> > straigthforward to do that until 4.13.
>=20
> ... for 4.13.4 it would of course be nice to have it in. Things look
> plausible overall, but I've got one question which - despite concerning
> code you only move - may play into the underlying issue.
>=20
Ok.

> > For 4.12 and earlier, it's trickier, but the fix is still necessary.
> > Actually, both 07b0eb5d0ef0 and this patch should be backported to
> > that
> > branch!
>=20
> Depends on what you target with this remark: For downstreams - yes. The
> stable upstream branch, otoh, is out of general support, and since this
> is not a security fix it is not going to be applied to that tree.
>=20
Yeah, I know. I decided to mention this (although, I probably could
have made myself more clear) and provide a backport (of this and of the
other, already committed patch) just for convenience of both users and
downstreams that happens to use such codebases.

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If an unit is meant=
 to be picked up by another processor,
> > and such
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * processor has not s=
cheduled yet, leave it in the runqueue
> > for him.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the unit in the =
runqueue has more credit than current
> > (or than
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * idle, if current is=
 not runnable) or if current is
> > yielding, we may
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * want to pick it up.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( svc->tickled_cpu !=3D =
-1 && svc->tickled_cpu !=3D cpu &&
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpumask_test_cpu(svc->tickled_cpu, &rqd->tickled) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (yield || svc->credit =
> snext->credit) )
>=20
> The "credit" field is plain "int", i.e. signed. Idle domain's vCPU-s
> don't get INT_MIN credit afaict (there's only one use of INT_MIN
> throughout the entire file). Hence I can't see why in principle a
> vCPU of an ordinary domain couldn't have equal or less credit than
> the CPU's idle vCPU.=C2=A0
>
So, if I understand what you mean, yes, we've had that issue, i.e.,
vCPUs managing to get to credit values which were lower than the one of
the idle vCPUs.

That was, in fact, even causing issue and it's what lead to
36f3662f27dec32d76c0edb4c6b62b9628d6869d "credit2: avoid vCPUs to ever
reach lower credits than idle".

After that commit, idle vCPUs' credits are set to CSCHED2_CREDIT_MIN-1
and, for regular vCPUs, whenever we subtract some value from their
credits, we limit them to not go beyond CSCHED2_CREDIT_MIN (this
happens in t2c_update(), called by burn_credit()).

Therefore, it should now not be possible any longer for regular vCPUs
to fall behind idle vCPUs, in terms of amount of credits.

So, was it this you were asking about and, if yes, does this answer
your concerns?

> Otoh I'm having trouble seeing why all of this code movement / re-
> indentation is necessary in the first place: If the initial if() was
> inverted to
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !yield && svc->credit <=
=3D snext->credit )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contin=
ue;
>=20
Actually, I am just realizing that if I, instead, use:

        if ( !yield && svc->credit <=3D snext->credit )
            break;

It would be much better (even as compared to the current situation).

In fact, right now that the priority check is toward the end, we have
do the checks that comes earlier in the loop (is it runnable? Can it
run on this CPU? Is it worth migrating it? Etc) at least for one
element of the runqueue.

With either my code or above the suggested form, we don't, but we may
have to do at least the priority check for all the elements of the
runqueue. This was something I knew, and as a matter of fact, it should
be quick enough (and comparable with doing expensive checks even on
just 1 vCPU). But still, it's ugly.

However, we know that the runqueue is sorted by credits! So, unless
we're yielding, it is always the case that as soon as we find there an
unit that has less credit than snext, we want to bail (and keep running
snext).

This means that we neither scan all the runqueues, not even for doing
just quick priority checks, nor we, in the case that snext is the
actual highest priority unit need to do any check for the unit at the
top of the runqueue.

So, I'm actually re-doing (and re-testing) the patch in this way.

Thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-4ngynJ28XS+oUoQU7RHt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmEKlfgACgkQFkJ4iaW4
c+5I/w/+Jlsp+IOG4Pyil1ZqMKCO+GpYPu2FOrtAaQqBbkzaxJHeEuHwQjFEiQh2
eSwVvXcr7BJ9TbiZtr5vLSZMpr0Rc1cHvMnoPlJzJ4ZlHAbpffEwps/DCAupJK7L
tnmYpNvTVdMzYNWQNDxM9O0BoS5ZSfTkHseQirsSkSNAT6ZhxJ5o97Qra/Jg9j1v
pmXYvLA0o2SmK5ksHB1vSzU2nYTXBOGP1Hz6D5B60ntIsu1tJl3FGAiYNYUDu9Kc
Iv6P4+mLphT23cx9EXF5TcE/Q3+UMi+ZrhyQfPQwfUY9uFojJ4+o87R6TneUjXg8
JpPcUEK1pSbUlYVpgiKB7/0RLuW23SRoBG7rRmRF8tCXaIg/KZsrrAHr/OmxWT5x
zx0q0rTfGGLdgn/i7YXvTf9ocK/i9ffdFY3poI6zFCb/y2QakkTWNCmOh1xZQ1W1
E4HE4ORqfOWo1XCtp/MqMS3YJVD51Ou2ap1CeMjzs2sXORCqq5P6wuM9ZoJT4ghH
+Otv/gdplGiQlAh/vT3T6zviF7zJ8Q8v6Kk82uXhcWBrVPYPy4/FhalFzxDFbq3T
CdastnVAYq8b537ckLJzfCtnPS1GKL6TSmSPA0cqBWDozObc1d5oTpb/BY6pp3y5
RC1FLoXAFhbUO6HAH2EedhX+3CTwZqXxQEnKBOxzLoAI/s9eCuk=
=BpNw
-----END PGP SIGNATURE-----

--=-4ngynJ28XS+oUoQU7RHt--


