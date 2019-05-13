Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384C1BF80
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 00:32:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQJRr-0007v7-Ju; Mon, 13 May 2019 22:29:31 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.153])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth.xen@gmail.com>) id 1hQJRq-0007v2-1S
 for xen-devel@lists.xensource.com; Mon, 13 May 2019 22:29:30 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-central-1.aws.symcld.net id BC/2A-23082-8CFE9DC5;
 Mon, 13 May 2019 22:29:28 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-12.tower-244.messagelabs.com: domain of gmail.com designates 
 209.85.217.65 as permitted sender) smtp.mailfrom=gmail.com; dkim=pass 
 (good signature) header.i=@gmail.com header.s=20161025; dmarc=pass 
 (p=none sp=quarantine adkim=r aspf=r) header.from=gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRWlGSWpSXmKPExsVyMfSmo+7x9zd
 jDGZvlrW4N+U9uwOjx/a+XewBjFGsmXlJ+RUJrBnTvh9iK5jlXnHg7ha2BsbFNl2MXBxCAtMY
 JaZ/OMYM4rAINLBKrJn9ghHEkRCYwyqx6McG1i5GTiAnTeLzjNlw9vzDJxgh7DqJDQ1d7CC2k
 IC6xL1Ft6HsqUwSq5eqgdhsAtoSm248YIaot5P4c+gVWC+vgKPE+3VzmECWMQtMZ5T4+eQxM0
 TCWOLqnvdgtjBQ0Y3tH4EaOIDOU5V4uMYTJMwpYC2x6c9vNojep0wSCxu3gDkiAm2MEv8OL2W
 HeA5oavPV01BnK0r0rznENoFRZBayjbOQbASxmYHOXbbwNZx9/dIFRghbXmL72zlQcQuJWzfu
 MEHYNhLPpy+HihtIzGmezLSAkWMVo2VSUWZ6RkluYmaOrqGBga6hobGuua6RqYleYpVukl5qq
 W5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMEpTCtn/7WA8tzT9EKMkB5OSKO/jvhsxQnxJ+S
 mVGYnFGfFFpTmpxYcYZTg4lCR4T7+7GSMkWJSanlqRlpkDTBcwaQkOHiUR3udvgdK8xQWJucW
 Z6RCpU4yBHLufP5zLzPGl/RGQPLQcRD7e9RRIrpvwDEjOuA8iD3V/WsAsxJKXn5cqJc67AGSP
 AMigjNI8uDWwFHiJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvD8gUnsy8ErhrXgEdygR0a
 EDxNZBDSxIRUlINjIoHDb9krumvby8XVlBbrnJFtu29+f0N8940JZVZn59yP2xfd4RpaZy+7H
 P5mpUCIX422Q2/9uRN+T71RW7lmrsrr0v/efyP6X9k8+1G5t0pb34EHNRIzG9U3sNou1Bfz2H
 +7saeho0TuT8+5klet0vrwS4BgzVeObcvnvtR1Og97eykwmseW5RYijMSDbWYi4oTAcISP298
 AwAA
X-Env-Sender: lars.kurth.xen@gmail.com
X-Msg-Ref: server-12.tower-244.messagelabs.com!1557786566!5363527!1
X-Originating-IP: [209.85.217.65]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18610 invoked from network); 13 May 2019 22:29:27 -0000
Received: from mail-vs1-f65.google.com (HELO mail-vs1-f65.google.com)
 (209.85.217.65)
 by server-12.tower-244.messagelabs.com with AES128-GCM-SHA256 encrypted SMTP;
 13 May 2019 22:29:27 -0000
Received: by mail-vs1-f65.google.com with SMTP id q13so4222684vso.2
 for <xen-devel@lists.xensource.com>; Mon, 13 May 2019 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=NSSOVZHnXXeyX8cPIQTOoJiMm0c3IB1AeCeTkYRQeVU=;
 b=j88vOv2zDX0M48yACwKVFUZZgn4n1/a7f77VrohRRsuKi5n8+k+JvwR3M1v1QUG9Yn
 xK3fZ0GizxMEPsNVk7huD2uXCn2DlN6mnwrI/6wPChFNkgyDZUtNP78d38F6ztZ2Rqcz
 2uKB9qUo6tbHinsWhz9zPGhQetY844WNcOU/bZglGD4DXzRPCa43wVMMtppVuQDzzfDV
 iTfPmsKYrMjvTLZitVUy5h3CekrrSnyLWKFu6+KiPeoMlKoBYFlqMAlOsjzg2Au0JNVy
 2NUp5o6wYl6QKBH/eDL5b+sVqNg5BEL3+vbr6/gYVmodjyaZJ4eDpWMj9u+cxCg2lKmB
 RPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=NSSOVZHnXXeyX8cPIQTOoJiMm0c3IB1AeCeTkYRQeVU=;
 b=qDBmzBaNHLTF3hsLkREOfOyOHN7NJ4zgptqvvim1DyQ9C3V89Qe/tuNN+sVAiN+25+
 /o/yph7Ucc/cLxMYs4uLFjCcGSoxczkULqvOwnggr6RYVBTEhOjQRwSaVhJQlAMS/MCp
 QtcCHflXwkKgwIFHhutpAiN4qiS3zs49ztMzaZB/+F4ijENOhNaXbKidCyWfjjQ+3MGQ
 IylRRdJQMuEcrwHm1kVKmvVWgg5U0QdgsiMfzmP5eHEKmK1fBVQ1HgOB6HniGO4ylMWi
 CcjeS5OGottbcJ/m9RVENr7f6LW5Qr5Ez3tKtFUD5R/2TybNE0dbhu3o0WFR5q0+EVM2
 1vqA==
X-Gm-Message-State: APjAAAXZfS4eexB34WNkDv37LYIMOjqqA/g2zL666O3B1OZdEqz1fYqB
 LCTG7ISKjz9A+B4HIbnJSd8=
X-Google-Smtp-Source: APXvYqxOAw/nXbRE1KrTFMhR+9g3TpJND5A+ZWvAYQuTaFvRIsCtfZeXYAHfrxmlwGCOi3Cs9m+B2Q==
X-Received: by 2002:a67:8e84:: with SMTP id
 q126mr15277515vsd.115.1557786565577; 
 Mon, 13 May 2019 15:29:25 -0700 (PDT)
Received: from [192.168.0.100] (ip219-141-50-179.ct.co.cr. [179.50.141.219])
 by smtp.gmail.com with ESMTPSA id j195sm7357916vkd.3.2019.05.13.15.29.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 15:29:24 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 13 May 2019 16:29:15 -0600
In-Reply-To: <1499370325.22465.107.camel@fedoraproject.org>
To: Adam Williamson <adamwill@fedoraproject.org>,
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============9123533373637995496=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9123533373637995496==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3BC4B9B7-65EA-4FB6-BC27-24D736313216";
	protocol="application/pgp-signature";
	micalg=pgp-sha512


--Apple-Mail=_3BC4B9B7-65EA-4FB6-BC27-24D736313216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

I am going to step in here with my hat as Xen Project community
manager. We had a discussion about this issue as part of last week's
community call. I CC'ed a number of stake-holders, which probably
should have been on the thread such as ITL (which builds QubesOS
on top of Fedora) and Michael A Young (the Xen package manager).

First of all apologies that this issue has lingered so long. Key
members of the community were not aware of the issues raised in
this thread, otherwise we would have acted earlier. With this in
mind, please in future raise issues with me, on xen-devel@,
committers@ or the Xen-Fedora package manager. The Xen Community
would like to see Fedora running as guest: in fact it would be
somewhat odd if there was a Xen-Dom0 package and guest support
didn't work. And there are some downstreams such as QubesOS,
which depend on this support.

> On 6 Jul 2017, at 13:45, Adam Williamson <adamwill@fedoraproject.org> =
wrote:
>=20
> On Thu, 2017-07-06 at 15:13 -0400, Konrad Rzeszutek Wilk wrote:
>> On Thu, Jul 06, 2017 at 11:59:01AM -0700, Adam Williamson wrote:
>>> Hi, folks! A while ago, Xen virtualization functionality was added =
to
>>> the criteria and the validation test case set, on the understanding
>>> that Oracle would provide testing for it (and help fix bugs as they
>>> arose).
>>>=20
>>> For the last couple of releases we really have not had any such =
testing
>>=20
>> We had been doing the testing, it just that we (or rather me and
>> Dariof) seem to get a wind of this at the last minute. Not sure =
exactly
>> how to fix that thought.
>=20
> Well, I mean, every few *days* a compose gets nominated for validation
> testing, and a mail is sent to test-announce. Just check your test-
> announce archives for mails with "nominated for testing" in their
> subject lines, and you'll see dozens. Is this not sufficient
> notification?

We discussed this at the community call and came to the conclusion that
we can run regular tests of Fedora RC's as part of our OSSTEST
infrastructure. Ian Jackson volunteered to implement this, but there
are some questions on
a) The installer (which we can handle ourselves)
b) When we would trigger a test - aka is there some trigger other than =
the
c) How would results best be reported back to Fedora

Apologies, I am not very familiar with how the Fedora Test group works.
Is there some documentation which would help integrate what you to with
the test system of another open source project?

>>> from Oracle. On that basis, I'm proposing we remove this Final
>>> criterion:
>>=20
>> s/Oracle/Xen Project/ I believe?
>=20
> Perhaps, it's just that it always seemed to be you doing the testing,
> so they got a bit conflated :)

Can we come to some arrangement, by which such issues get communicated
to the Xen Project earlier? Aka me, xen-devel@ or committers@

>>> "The release must boot successfully as Xen DomU with releases =
providing
>>> a functional, supported Xen Dom0 and widely used cloud providers
>>> utilizing Xen."
>>>=20
>>> and change the 'milestone' for the test case -
>>> =
https://fedoraproject.org/wiki/QA:Testcase_Boot_Methods_Xen_Para_Virt -
>>> from Final to Optional.
>>>=20
>>> Thoughts? Comments? Thanks!
>>=20
>> I would prefer for it to remain as it is.
>=20
> This is only practical if it's going to be tested, and tested =
regularly
> - not *only* on the final release candidate, right before we sign off
> on the release. It needs to be tested regularly throughout the release
> cycle, on the composes that are "nominated for testing".

Would the proposal above work for you? I think it satisfies what you are
looking for. We would also have someone who monitors these test results
pro-actively.

Then, there are the specific grub issues that need resolving
[A1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1486002
     (and a recently filed duplicate @
      https://bugzilla.redhat.com/show_bug.cgi?id=3D1691559) caused by
      [A2])
[A2] https://bugzilla.redhat.com/show_bug.cgi?id=3D1703700
[B1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1264103

The first makes it harder to boot Fedora _dom0_ (but workarounds exist).
While it is unpleasant, it doesn't break the release criterion, but
probably has deterred people from testing. The second one [B1] is about
Fedora _domU_, which breaks the release criterion.

Marek and Michael had a discussion about these and there was also
a summary from Daniel.

=3D=3D On [A1]/[A2] =3D=3D
Lack of GRUB2 multiboot2/module2 commands in Fedora/RH which does not
allow you load Xen as dom0 on EFI platforms with or without secure
boot. Here are some relevant snippets from the discussions:

"In general both modules were dropped due to CVE-2015-5281 (grub2:
modules built in on EFI builds that allow loading arbitrary code,
circumventing secure boot) [A3][A4]. Of course this makes sense
because we do not want to break UEFI secure boot. But this means
that you cannot boot Xen dom0 on UEFI platforms. The Multiboot2
protocol support is required to do that. Potentially you can
use xen.efi directly but AFAICT many people prefer to use GRUB2.
The CVE issue does not exist in GRUB2 upstream. It was fixed at
the end of 2019."

Is there any chance these can get upstreamed into Fedora/RH?

"However, this is only one piece of the puzzle. Another is a
requirement for additional set of patches for Xen which allow
you to load xen.efi instead of xen.gz using Mulitboot2. I
started work on it last year but it is currently stalled."

I have taken an action to get this resolved
(aka find someone to do the work).

[A3] https://access.redhat.com/security/cve/cve-2015-5281
[A4] http://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-5281
[A5] =
https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg01292.html=


=3D=3D On [B1] / grub2-switch-to-blscfg  =3D=3D
This issue is about Fedora _domU_ and breaks the release
criterion. And looks like, it wasn't tested at all.

"blscfg is okay in _dom0_ - it looks like the xen setup still
gets put in non-blscfg format, and doesn't seem to matter in
HVM _domU_."

"The big issue is _domU_ in PV which would need a fair amount
of work in pygrub to fix properly, including reading variables
from grubenv and extracting details from the loader files. This
is really something to be fixed on the Xen side ... I do keep
intending to have a look at it myself though I may not get around
to it."

Instead of fixing pygrub, it would be better, more future proof
and easier to "use pvgrub2 instead. To be honest, its very unclear
to me why would anyone want to use pygrub, when pvgrub2 exists.
pygrub is much more fragile (as it needs to re-implement a
parser for 3rd-party configuration format, without stable
specification) and less secure - it does that in dom0, including
mounting domU controlled disk.

That said, the pvgrub2 option also requires some work, because:
- Fedora grub2 packages do not include the "xen" target platform
- Non-Fedora grub2 package don't have blscfg support
- If we'd talk about PVH (which isn't the case here), it requires grub
  2.04, which is at RC1 and isn't packaged for Fedora yet"

That would be much simpler, if blscfg was upstreamed into grub2 by
Fedora community members. Do you know whether the Fedora has plans
to do this?

In any case, I have taken an action to get this resolved
(aka find someone to do the work).

@xen-devel: this should probably be discussed separately, such that
we don't flood test@fedoraproject with unnecessary traffic

=3D=3D In Summary =3D=3D
I think we can find a way forward on the testing side. Would
the proposal work for you?

Resolving the current blockers, this seems to have been caused by a
lack of communication or not understanding the impact of the
grub2-switch-to-blscfg in Fedora. In any case, we are where we are.

Best Regards
Lars



--Apple-Mail=_3BC4B9B7-65EA-4FB6-BC27-24D736313216
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGMt8INYPShzLT5l8yRKINn2yyNoFAlzZ77sACgkQyRKINn2y
yNoP5A//Z0LA304H7H2bFIhNmU7dpEHVSQxGChA7AONYl7VRqp3Sgf1ESb5jjx+h
+ctnaVPHaZOeA9iQ2/t8gAdtDUVG1bvPJ/9E5JdwGfMlll7g7qZT2lZUwJvKpdHj
FETe8Pwk6eKGZo9kECHbmsOPr3x8SqMbPoBYC7eGYe6xj3a9Y5E0DObOkvdXXAFk
fwCEO4sr0vUCvvaSCuW/VjYwM3JzU53QZ0hKRMxa3IWovrYIeZZjeZKcxuQEFEnp
tQhXvzCIeo9dHXbHf6HHJPQV4h+YobseDLLCSYJQAEtimmSJOM5Wk6KIPrf3uYGA
ZUYwRdgjwgVVQ9ZN1+0jsvB9PMecvvgUda4mVKzYWz1LfUY5hYj027ICxntFAMzN
dO2bSyKdNgpDF4fFRd7/SoM5Ko+RL3GzPYemEH9fsYj4alGSeke25GDrmhPVTx4M
zid3PM6g9QOap2fWL1J0gclbyCtKJt04RMP6+DbfYgbdTTIuy+/zTq+lZHgTt0x7
Xqn6OaOcJHfP1ZyTpCQJ9tVAqlfzXs7lbRejnBySK6+Z9KcRRDw6yGgcOi7RVE+f
csSwzWlQg5oJizJMt8m72pKMfq9FKJITUAoIfKDUt1yEufhtnX+1ORuj9LQA2x6a
/k89JpFQeiZ8HJS0VyypcmcZgpCe0K5W+UbEuYJYlEHRMY/AsCE=
=zgrS
-----END PGP SIGNATURE-----

--Apple-Mail=_3BC4B9B7-65EA-4FB6-BC27-24D736313216--


--===============9123533373637995496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9123533373637995496==--

