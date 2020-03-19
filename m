Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500F18B166
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 11:30:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEsOW-0002Zj-Vp; Thu, 19 Mar 2020 10:27:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rfW=5E=bombadil.srs.infradead.org=batv+4234b9076f5f6a7c125b+6052+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1jEsOU-0002Ze-Ud
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 10:27:19 +0000
X-Inumbo-ID: 3313f5c4-69cc-11ea-b34e-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3313f5c4-69cc-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 10:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6ortyKVVjKslbnaF+ebkKZIrdSSPvvBOML56moGDA6Q=; b=R2y/cUr9Tb+CIzg88E6tR100t4
 yAHyEdnWlkJ/Ybkwps9OykHstKwMduzwbrFp8EMpiPphxzEdHM39uQNKSO4Yn0BN70UoewyOX6RTd
 ilgx3TOvccPU79ko/+x8sPKIjKOfneZ1q3wC6xCNv+lz6wjI7Kypv3GU2cOT9a4xQonFf/weBE+fd
 gqtMbO5B2MUDuf4GRn56+baTgYYhHKmtyCVAgBkQkAc2Mw3B1ft8noa6aWh20HlwwiqBfZCDVB3Mz
 l6kaiSokh7+bieascIK+0wpLsd6+EeRD5eGAy3vdCWSvq+F071Rg2ckfupOBMwkdUbz/sYv/eDiC3
 YuwOkhzg==;
Received: from [54.239.6.185] (helo=u3832b3a9db3152.ant.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEsOA-0006t3-Vz; Thu, 19 Mar 2020 10:26:59 +0000
Message-ID: <4a1504117e7422a685ed2fec2b97bb15a0e1bf29.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Thu, 19 Mar 2020 10:26:54 +0000
In-Reply-To: <9b0363ea-ad62-c0d9-700a-fa0107642f3b@suse.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-1-dwmw2@infradead.org>
 <a531f518-f996-34a0-7218-a746ae210393@suse.com>
 <641040a4aebc62e1e0e3874f513e3a308ec3ace0.camel@infradead.org>
 <9b0d191e-2553-6368-84d6-8425abe23c39@suse.com>
 <6b41e45f-fc91-3a9f-20f8-28d66604adec@xen.org>
 <304d502011075fdda6d00a2393bf9cfd8fde68bc.camel@infradead.org>
 <9b0363ea-ad62-c0d9-700a-fa0107642f3b@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state
 bits
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============8499964956394064584=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8499964956394064584==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-WaBZV/SE9z6wr3O7AoSA"


--=-WaBZV/SE9z6wr3O7AoSA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-19 at 09:49 +0100, Jan Beulich wrote:
> On 18.03.2020 18:13, David Woodhouse wrote:
> > On Wed, 2020-03-18 at 12:31 +0000, Julien Grall wrote:
> > > On 18/03/2020 09:56, Jan Beulich wrote:
> > > > On 17.03.2020 22:52, David Woodhouse wrote:
> > > > > On Thu, 2020-02-20 at 12:10 +0100, Jan Beulich wrote:
> > > > > > > @@ -1699,14 +1714,14 @@ unsigned int online_page(mfn_t mfn,
> > > > > > > uint32_t *status)
> > > > > > >       do {
> > > > > > >           ret =3D *status =3D 0;
> > > > > > > -        if ( y & PGC_broken )
> > > > > > > +        if ( (y & PGC_state) =3D=3D PGC_state_broken ||
> > > > > > > +             (y & PGC_state) =3D=3D PGC_state_broken_offlini=
ng )
> > > > > > >           {
> > > > > > >               ret =3D -EINVAL;
> > > > > > >               *status =3D PG_ONLINE_FAILED |PG_ONLINE_BROKEN;
> > > > > > >               break;
> > > > > > >           }
> > > > > > > -
> > > > > > > -        if ( (y & PGC_state) =3D=3D PGC_state_offlined )
> > > > > > > +        else if ( (y & PGC_state) =3D=3D PGC_state_offlined =
)
> > > > > >=20
> > > > > > I don't see a need for adding "else" here.
> > > > >=20
> > > > > They are mutually exclusive cases. It makes things a whole lot cl=
earer
> > > > > to the reader to put the 'else' there, and sometimes helps a na=
=C3=AFve
> > > > > compiler along the way too.
> > > >=20
> > > > Well, I'm afraid I'm going to be pretty strict about this: It's aga=
in
> > > > a matter of taste, yes, but we generally try to avoid pointless els=
e.
> > > > What you consider "a whole lot clearer to the reader" is the opposi=
te
> > > > from my pov.
> > >=20
> > > While I agree the 'else' may be pointless, I don't think it is worth =
an=20
> > > argument. As the author of the patch, it is his choice to write the c=
ode=20
> > > like that.
> >=20
> > Indeed. While I appreciate your insight, Jan, and your detailed reviews
> > are undoubtedly helpful =E2=80=94 especially to me as I poke around the=
 Xen
> > code base without knowing where the bodies are buried =E2=80=94 I do so=
metimes
> > find that it degenerates into what appears to be gratuitous
> > bikeshedding.
> >=20
> > Like *some* others, I'm perfectly capable of responding "I understand
> > you would have done it differently, but I prefer it this way".
> >=20
> > But even for those like me who have the self-confidence (or arrogance?)
> > to respond in such a way, the end result is often the same =E2=80=94 a =
patch
> > series which the maintainer doesn't apply because it has "unresolved
> > issues".
> >=20
> > Perfect is the enemy of good. Especially when perfection is so
> > subjective.
> >=20
> > This definitely isn't the kind of welcoming community that I enjoy
> > trying to get my junior engineers to contribute to. And they aren't
> > snowflakes; they cope with the Linux community just fine, for the most
> > part.
>=20
> I appreciate your open an honest feedback, and having had similar
> comments in the past I can assure you that I've already tried to
> adjust where I find this acceptable. I take it you realize that
> there are two limitations in this - trying doesn't mean succeeding,
> and the boundaries of what I'd consider acceptable to let go with
> no comments.
>=20
> Of course there are always two sides of the medal.
>=20
> As a maintainer of some piece of code, I view it as my
> responsibility to look after not only the technical correctness of
> that code, but also after its style (in the broadest sense of the
> word). Looking at some very bad examples in our tree, many of
> which I'm afraid have a Linux origin, I'm in particular of the
> opinion that consistent style is a significant aid in code
> readability and maintainability. And I hope you agree that _style_
> adjustments are pretty easy to make, so I don't view asking for
> such as placing a significant burden on the submitter. The
> alternative of letting it go uncommented and then take the time
> myself to clean up seems quite a bit worse to me, not the least
> because of this scaling even less well than the amount of code
> review that needs doing.

Yes, 100% agreed. And I'll even concede that for the cases of moving
code around that happens to not conform to the current style, and
asking contributors to fix it up as they go.

I was agreeing with you on that point, while simultaneously telling
Julien "nah, I'll fix it while I'm here" when he suggested that I *not*
realign the PGC_state bit definitions.


> The mentioned Linux origin of some of the particularly bad
> examples in our tree is why I view your "they cope with the Linux
> community just fine" as not really applicable. This is despite
> our subsequent changes to those files often having made the
> situation worse rather than better.

Was more about the community effect than technical matters, but let's
not rathole on that.

> To some degree the same goes for bigger than necessary code churn,
> albeit I agree that in a number of cases it is far less objective
> to judge than the aim for consistent style. Extra code churn
> instead is often making review harder, irrespective of the often
> good intentions behind doing so.

Completely agreed.

> > There is a lot of value in your reviews, and they are appreciated. But
> > the overall effect is seen by some as making the Xen community somewhat
> > dysfunctional.=20
>=20
> In which case I ought to consider, of course after first checking
> with my management, to step back as a maintainer. I'd very much
> regret doing so, but if it's in the interest of the community ...

I definitely don't think that would be in the interest of the
community. As I think I may have mentioned once or twice in my previous
message, your detailed reviews are massively appreciated and useful.

> (As an aside, likely being among those doing the largest part of
> code reviews, helping with that part of the overall workload the
> project generates would reduce the number of reviews I'd have to
> do, and hence the chances of me giving comments viewed as
> unhelpful or worse by submitters. Or, to put it in different,
> frank, but hopefully not offending words - I'd like to see you do
> a fair amount of code review, including looking after merely
> cosmetic aspects in the spirit of our written and unwritten rules,
> before you actually comment on me going too far with some of my
> feedback. And without me wanting to put too much emphasis on this:
> It is my opinion that maintainer views generally have somewhat
> higher weight than non-maintainer ones. I'm not going to claim
> though there aren't cases where I might go too far and hence abuse
> rather than use this, but as per above I can only try to avoid
> doing so, I can't promise to succeed. And of course I, like others,
> can be convinced to be wrong.)

Understood.

> > The -MP makefile patch I posted yesterday... I almost didn't bother.
> > And when I allowed myself to be talked into it, I was entirely
> > unsurprised when a review came in basically asking me to prove a
> > negative before the patch could proceed. So as far as I can tell, it'll
> > fall by the wayside and the build will remain broken any time anyone
> > removes or renames a header file. Because life's too short to invest
> > the energy to make improvements like that.
>=20
> So are you saying that as a maintainer I should let go uncommented a
> change which I'm unconvinced doesn't have negative side effects,
> besides its positive intended behavioral change? The more that here
> the workaround is rather trivial? As you may imagine, I've run into
> the situation myself a number of times, without considering this a
> reason to make any adjustments to the build machinery.

Jan, I would respectfully request that you take another look at your
initial response, but put yourself in the shoes of a patch submitter:
https://lists.xenproject.org/archives/html/xen-devel/2020-03/msg01171.html

You mention a "simple" workaround... but the workaround I've been using
is to manually remove the offending .o.d files, one at a time (or at
least one directory at a time), until the broken build starts working
again. Is that what you meant? And you really didn't ever consider that
it should be fixed?

And the substance of the response is basically saying "this is voodoo
and we can't touch it or unspecified things might break, but I have no
idea where to tell you to look."

Looking back I realise that the concern about phony rules overriding
pattern rules didn't even come from you; your concern was more nebulous
and unaddressable. It looks like I came up with a straw man and shot
*that* down in my later analysis (although that wasn't my intent; I
think the concern about pattern rules really did come from somewhere).

You asked a question about "why isn't this default behaviour", which is
kind of a silly question when asking about an option (-MP) that was
added to GCC almost a decade after the initial -MD behaviour was
established. Of *course* they didn't retroactively change the default.


Read that message again from the point of view of a contributor.
Pretend it isn't even me; pretend it's someone attempting to make their
first, trivial, improvement to the Xen ecosystem.

I hope you'll understand why my initial reaction was just a
monosyllabic 'no'.


> > > > > > > +#define PGC_state_broken_offlining PG_mask(4, 9)
> > > > > >=20
> > > > > > TBH I'd prefer PGC_state_offlining_broken, as it's not the
> > > > > > offlining which is broken, but a broken page is being
> > > > > > offlined.
> > > > >=20
> > > > > It is the page which is both broken and offlining.
> > > > > Or indeed it is the page which is both offlining and broken.
> > > >=20
> > > > I.e. you agree with flipping the two parts around?
> >=20
> > I hope I have respectfully made it clear that no, I'm really not happy
> > with the very concept of such a request.
> >=20
> > Perhaps it would be easier for me to acquiesce, in the short term.
> >=20
> > But on the whole I think it's better to put my foot down and say 'no',
> > and focus on real work and things that matter.
>=20
> Well, in the specific case here I've meanwhile realized that my
> alternative naming suggested in in no way less ambiguous. So
> stick to what you've chosen, albeit I continue to dislike the
> name ambiguously also suggesting that the offlining operation
> might be broken (e.g. as in "can't be offlined"), rather than the
> page itself. I'm not going to exclude though that this is just
> because of not being a native English speaker.

As a native English speaker, the naming of these bothered me too.
They're too long and redundant. But subsuming the PGC_broken but into a
3-bit PGC_state makes sense, and we can't abandon that idea purely
because we can't come up with a *name* that fills us with joy.

There wasn't a *good* answer. I vacillated for a while, and picked the
one that offended me least.

And then ended up in a debate about it when it really wasn't important.


> > > > > > > +#define page_is_offlining(pg)      (page_state_is((pg),=20
> > > > > > > broken_offlining) || \
> > > > > > > +                                    page_state_is((pg), offl=
ining))
> > > > > >=20
> > > > > > Overall I wonder whether the PGC_state_* ordering couldn't be
> > > > > > adjusted such that at least some of these three won't need
> > > > > > two comparisons (by masking off a bit before comparing).
> > > > >=20
> > > > > The whole point in this exercise is that there isn't a whole bit =
for
> > > > > these; they are each *two* states out of the possible 8.
> > > >=20
> > > > Sure. But just consider the more general case: Instead of writing
> > > >=20
> > > >      if ( i =3D=3D 6 || i =3D=3D 7 )
> > > >=20
> > > > you can as well write
> > > >=20
> > > >      if ( (i | 1) =3D=3D 7 )
> > >=20
> > > I stumbled accross a few of those recently and this is not the obviou=
s=20
> > > things to read. Yes, your code may be faster. But is it really worth =
it=20
> > > compare to the cost of readability and futureproofness?
> >=20
> > No. Just no.
> >=20
> > If that kind of change is really a worthwhile win, it'll depend on the
> > CPU. File a GCC PR with a test case as a missed optimisation.
>=20
> Your experience may be different, but I hardly ever see any effect from
> reporting bugs (not just against gcc) unless they're really bad or really
> easy to address. That's why I generally prefer to fix such issues myself,
> provided of course that I can find the time.

Perhaps so. But if I *don't* file it, it *certainly* doesn't get fixed.

And I've learned over the years *not* to second-guess the optimisations
that today's compiler might make, with the wind blowing in this
particular direction.

FWIW 'return (x =3D=3D 6 || x =3D=3D 7)' ends up being emitted by GCC on x8=
6 as

	subl	$6, %edi
	xorl	%eax, %eax
	cmpl	$1, %edi
	setbe	%al
	ret

And 'return (x =3D=3D 5 || x =3D=3D 7)' gives:

	andl	$-3, %edi
	xorl	%eax, %eax
	cmpl	$5, %edi
	sete	%al
	ret

So it does look like GCC is actually doing its job, on this occasion.

But that's entirely beside the point, which is that I'm having some
pointless discussion about compiler optimisation minuti=C3=A6 when fixing
PGC_broken was *already* deep into yak-shaving for the improvement I
was *actually* trying to make. It's distracting from real work, raising
barriers to getting fixes merged.

> > Don't make the source code gratuitously harder to read.
>=20
> That's a very subjective aspect again. Personally I find two comparisons
> of the same variable against different constants harder to read.
>=20
> > Honestly, this, right here, is the *epitome* of why I, and others,
> > sometimes feel that submitting a patch to Xen can be more effort than
> > it's worth.
>=20
> Note how I said "I wonder", not "please make".

Perspective again. That distinction really doesn't matter. Perhaps you
underestimate the weight your words carry, as a well-respected
maintainer. You can't negate that effect purely by word tricks like
saying 'I wonder'.=20

Because understatement is a very common tool in the English language,
especially in British English =E2=80=94 and we've all seen people write "I
wonder if you should..." when what was really meant was "I will set
fire to you if you don't...".=20

Understatement like that doesn't work. It still derails the patch
review. It just didn't need to be said, in that context.

Let me repeat =E2=80=94 because I've only said it once today, I think, that
your reviews are incredibly useful. I'm only asking that you recognise
the weight that your 'wondering' can have, and recognise when something
you are asking for is *subjective*.

A review is not about "is this code precisely how it would look if I
had written it myself", but it is about "is this code correct and
maintainable".

Sometimes, as in the example with the PGC_state_ naming above, there
isn't a "nice" answer. We pick the solution that offends us least. And
I completely understand as a maintainer, what it's like to be on the
receiving end of such a choice. You think "that could be nicer"... and
have to work through the alternatives yourself before you realise that
actually, it was the best of the choices available.

Each of the responses I've identified from you as 'excessive' has some
merit, we can focus on each of them and you can justify them, to a
certain extent. But as a whole, the effect is of a barrage of nitpicks
of questionable utility which really does hinder forward progress.

Let's try to focus on comments which will genuinely make the code
better. It's not that we should deliberately stop paying attention to
detail, or deliberately allow buggy and broken code into the tree. It's
that we should be aware that "perfect is the enemy of good".

For my part, I'll stop whining at you now. If I end up giving responses
to parts of your code review which seem to be along the lines of
"that's nice, dear, but I didn't think so and I did the typing", please
hark back to this conversation. I'll try to phrase them more
appropriately than that, but no promises :)

Thanks.


--=-WaBZV/SE9z6wr3O7AoSA
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAw
MzE5MTAyNjU0WjAvBgkqhkiG9w0BCQQxIgQgyoyetew6ZmTs8pNd/u1r+pZ4L1IG23CvgAmJa+A5
Hvgwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAD/6FsSjD+nMlTt9NWrOzuLwmEoeFJfYeipR9qB6TkueAfSvfNS3fZiVW/KtwOiZ
zmXPbNa2GmZ56krqXgOE8ETDH0uFTRZSQwT8JX0FWGigb4JbzETlXDk2qSgj0CBuLTGFT2RghbhD
Q4534conxngEBGUBBTe9XPMaWFUIQYE9wU0J1Ik8aNlq/DusWL39L/9q8udmW/DseAP5MRkeoZXL
PNuAvPteLWRXXF8upMYttq9DIaBmeYbFjjBOjYvJlgzVhYEmIE18gYFIOO0sG9v899607xnziZde
NKHDGBfCVs3VDIdSJEn9Paow3nnt+8MMFUt6YFSrisK1hTSG1XsAAAAAAAA=


--=-WaBZV/SE9z6wr3O7AoSA--



--===============8499964956394064584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8499964956394064584==--


