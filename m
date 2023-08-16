Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CCE77E036
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 13:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584725.915517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWEbG-000779-TK; Wed, 16 Aug 2023 11:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584725.915517; Wed, 16 Aug 2023 11:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWEbG-00074U-QT; Wed, 16 Aug 2023 11:22:06 +0000
Received: by outflank-mailman (input) for mailman id 584725;
 Wed, 16 Aug 2023 11:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqiy=EB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qWEbF-00074M-R7
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 11:22:05 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f4ed451-3c27-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 13:22:03 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1692184899873579.7919559485985;
 Wed, 16 Aug 2023 04:21:39 -0700 (PDT)
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
X-Inumbo-ID: 1f4ed451-3c27-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1692184907; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HkViHG+dXgJ+jddCEU1EATIDtUT1K3BGKmyEjnlJ6b20chLlg80CGEiU/ajq8JJMappdZn0L1X9qFlWO/5iYGdQlJA9nTKKPJOsvlsKOFbZ2cvVanwoHGQTvk0kyhtQ7Y3fu+fs8d7VOPWcQkOqbNibxUUEBYDudgBCl0lqS0lg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692184907; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vtxXbee+zxc7FUpnBzIcjEPQ5yDmwZbJjZZRZ0OsM/s=; 
	b=kMxY/BZ+eSackSNCdH5Jhxu7K6TGDBGSyKG+wnn+qbAVtfd99KsK7ir5AqJpajy90KyjjE3iC44Z5+3TKT4UgRpYVsfz+is62UVEEnyrGQIUzNW6B2ktYOkc9iPevwdqArDzjzT2yDQ0bEHF5vdIEIyLP+z2K7zwWfF0nHDtHpQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692184907;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vtxXbee+zxc7FUpnBzIcjEPQ5yDmwZbJjZZRZ0OsM/s=;
	b=U+WknY1oAy/vcLSM4cwrP1N7gooe83f02QDnvDouF+f5xmQZDjPKyuqgce0WnsaC
	dbrGD0uyRVDm17t5ZC6NhPS/zTGCOYnqnAnHd+DyAKi6zaIGi3Wdd/Z49C4JH7DNNkt
	Ab8sXFcrkVIMaLZNDUQi4agH0fQD6QprO7VWRkNk=
Date: Wed, 16 Aug 2023 07:21:39 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "George Dunlap" <george.dunlap@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Xen-devel" <xen-devel@lists.xenproject.org>,
	"Jason Andryuk" <jandryuk@gmail.com>,
	"George Dunlap" <George.Dunlap@eu.citrix.com>,
	"Jan Beulich" <JBeulich@suse.com>, "Wei Liu" <wl@xen.org>,
	"Julien Grall" <julien@xen.org>,
	"Daniel De Graaf" <dgdegra@tycho.nsa.gov>,
	"Henry Wang" <Henry.Wang@arm.com>
Message-ID: <189fe1470d7.c9aa0e23891146.4230412711034328964@apertussolutions.com>
In-Reply-To: <CA+zSX=arMnCNmckcc1a-JoQokw4nc5g7+49xhQFoxFYA3uB4_g@mail.gmail.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
 <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com> <CA+zSX=arMnCNmckcc1a-JoQokw4nc5g7+49xhQFoxFYA3uB4_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Wed, 16 Aug 2023 05:55:07 -0400 George Dunlap  wrote ---

 >=20
 >=20
 > On Wed, Aug 16, 2023 at 3:58=E2=80=AFAM Andrew Cooper andrew.cooper3@cit=
rix.com> wrote:
 > On 16/08/2023 1:19 am, Stefano Stabellini wrote:
 >  > On Tue, 15 Aug 2023, Andrew Cooper wrote:
 >=20
 >  >> diff --git a/xen/include/public/version.h b/xen/include/public/versi=
on.h
 >  >> index cbc4ef7a46e6..0dd6bbcb43cc 100644
 >  >> --- a/xen/include/public/version.h
 >  >> +++ b/xen/include/public/version.h
 >  >> @@ -19,12 +19,20 @@
 >  >>=C2=A0 /* arg =3D=3D NULL; returns major:minor (16:16). */
 >  >>=C2=A0 #define XENVER_version=C2=A0 =C2=A0 =C2=A0 0
 >  >>=C2=A0=20
 >  >> -/* arg =3D=3D xen_extraversion_t. */
 >  >> +/*
 >  >> + * arg =3D=3D xen_extraversion_t.
 >  >> + *
 >  >> + * This API/ABI is broken.=C2=A0 Use XENVER_extraversion2 where pos=
sible.
 >  > Like Jan and Julien I also don't like the word "broken" especially
 >  > without explanation of why it is broken next to it.
 > =20
 >  The word "broken" is an accurate and appropriate word in the English
 >  language to describe the situation.=C2=A0 I'm sorry you don't like it, =
but
 >  unless any of you can articulate why you think it is inappropriate
 >  phraseology, the complaint is unactionable.
 > =20
 >  Specifically ...
 > =20
 >  > Instead, I would say:
 >  >
 >  > "XENVER_extraversion is deprecated. Please use XENVER_extraversion2."
 > =20
 >  ... depreciated is misleading.
 >=20
 > Deprecated means, "It is the official position of the developers of the =
project that for the moment, you *can* use it, but you *shouldn't*"; it als=
o implies that support for it might go away at some point.=C2=A0 The fact t=
hat we're saying "you shouldn't use it" by itself implies that it is lackin=
g somehow.=C2=A0 It's a factual statement that gives you useful information=
.
 >=20
 > Neither "broken" nor "has problems" actually tell you anything above "de=
precated", other than the opinion of the developer writing the documentatio=
n; and they are both (to different=C2=A0levels) emotionally charged.=C2=A0 =
You don't deprecate things unless there's something wrong with them.=C2=A0 =
In this particular case, I don't think anyone has an emotional attachment t=
o the existing hypercall, so nobody is going to be insulted; but it's a goo=
d habit to avoid it.=C2=A0 (See [1] for more about this.)

With all due respect George but deprecated and broken are fundamentally dif=
ferent. Deprecation means that an interface is being retired in the future =
for any number of reasons and that it can continue to be used until its ret=
irement without risk of unintended consequences. Labeling an interface as b=
roken, which has been acceptable to do so in other much larger communities,=
 is a stronger sentiment that the interface should stop being used immediat=
ely because it can lead to unintended consequences, not because it will be =
retired in some distant future.

 > [1]=C2=A0http://xenbits.xenproject.org/governance/communication-practice=
.html , the "Avoid inflammatory and negatively charged language" section
 >=20
 > If I have a backlog of a million things to do, how do I prioritize switc=
hing to and testing extraversion2?=C2=A0 The situation as I understand it i=
s: "If it works for you now with the current value you're fine, but it may =
break later when you change it, in a way that's obvious".=C2=A0 In that sit=
uation, you can safely put off fixing it until your build breaks.=C2=A0 If,=
 on the other hand, the situation is "It may randomly work or not work with=
 any given build", or "It may seem to work for you now but is actually fail=
ing in a not-very-obvious way", then you probably need to prioritize fixing=
 it.
 >=20
 > Saying "May cause truncation" gives you some the information you need to=
 know. "Will silently truncate past N characters" gives you even more.=C2=
=A0=C2=A0
 > =C2=A0
 > We should at very least say it's deprecated.=C2=A0 If we can summarize t=
he issues briefly, then that would be helpful.

In general I would concur here, except that these are externally consumed f=
iles for which the consuming projects just need to be told don't use this i=
nterface. The why is not so important to them as it is to the Xen community=
. But for the latter, any one working on Xen code can do a git blame on the=
 comment line to find the originating commit and read the commit message fo=
r the details as to why.

v/r,
dps


