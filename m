Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069DA2E1F46
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58468.102846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6iV-0006No-C9; Wed, 23 Dec 2020 16:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58468.102846; Wed, 23 Dec 2020 16:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6iV-0006NP-8o; Wed, 23 Dec 2020 16:10:23 +0000
Received: by outflank-mailman (input) for mailman id 58468;
 Wed, 23 Dec 2020 16:10:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNd7=F3=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1ks6iT-0006NK-Ov
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:10:21 +0000
Received: from mx1.somlen.de (unknown [89.238.87.226])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69215828-7abd-4150-a7a0-c600245441f3;
 Wed, 23 Dec 2020 16:10:19 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id C16B7C3AF0B;
 Wed, 23 Dec 2020 17:10:17 +0100 (CET)
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
X-Inumbo-ID: 69215828-7abd-4150-a7a0-c600245441f3
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/3] docs: set date to SOURCE_DATE_EPOCH if available
Date: Wed, 23 Dec 2020 17:10:12 +0100
Message-ID: <2354439.sqZyMsV9Az@localhost>
In-Reply-To: <3c3edc91-7d22-289f-575b-9fd3c2ec4bc8@suse.com>
References: <cover.1608319634.git.maxi@daemonizer.de> <23352f4835ae58c5cae6f425d5a8378f3d694055.1608319634.git.maxi@daemonizer.de> <3c3edc91-7d22-289f-575b-9fd3c2ec4bc8@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2033718.9jYyLHQttZ"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2033718.9jYyLHQttZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 21. Dezember 2020 10:01:14 CET Jan Beulich wrote:
> On 18.12.2020 21:42, Maximilian Engelhardt wrote:
> > --- a/docs/Makefile
> > +++ b/docs/Makefile
> > @@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
> > 
> >  -include $(XEN_ROOT)/config/Docs.mk
> >  
> >  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory
> >  xenversion)> 
> > -DATE		:= $(shell date +%Y-%m-%d)
> > +
> > +DATE_FMT	:= +%Y-%m-%d
> > +ifdef SOURCE_DATE_EPOCH
> > +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
> > 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
> > 2>/dev/null || date -u "$(DATE_FMT)")
> Looking at the doc for a (deliberately) old "date", I can't find
> any mention of the -d "@..." syntax. I take it the command would
> fail on that system. It would then go on to try the -r variant,
> which has entirely different meaning on GNU (Linux) systems.
> 
> docs/ being subject to configuring, why don't you determine the
> capabilities of "date" there and invoke just the one command
> that was found suitable for the system?
> 
> Jan

Hi Jan,

I did some research. The -d "@..." syntax was introduced about 2005. Testing a 
live CD from 2006 (KNOPPIX_V5.0.1CD-2006-06-01-EN.iso) it was supported there. 
The documentation about this syntax has only been added in 2011 to the date 
command. I'm wondering if anybody running such an old system wants to use 
SOURCE_DATE_EPOCH.

However, I came up with a patch to determine which suitable date version is 
available and only call that, as you suggested. I will post the new patch 
soon.

Maxi
--nextPart2033718.9jYyLHQttZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAl/ja+QACgkQgepkfSQr
0hW5+g/+L51OAqHpwGZtFGlFb0eJxdq10ARcuU/iiB3dwyRVXAyMAhrBsMa288IH
m7ZnBGV8MMhp/OVY5CeR+L0y5x+H6UhxvvSesqxcP617ngi8SKtPHSbadsA1gV5Z
bkMUuZI8h4RfkyUxx1u18doF1IUGlXRu4/wujrUzLloY8XUp06x+x2dehNQJ9aj/
kMH5UNZbqPUOnCxcvjZwGxlWIyH45iIwTWgdrUzXhIXOhzueA9egudL8/07/cOss
e6UK+BlmXGJb+jFZyYds1EN0SZxbgAIuNGz0iAKvzRwmz3zQL6lqQByNeZ4YZaeD
ec8qdSNgbQj7aitV4XtuSaKvXZ11Lwiaus4FiEeo4/I1CntuzFieBFvQFGY6gEOE
kBKNfMycSKheZ8xk6dFUPZSdXC17TWvOHqEQqEh4MyIug4LO0lbkXuyLE0F0geAx
kcsjPpCxoHy7dmTSdPQIdn4bYK1ufpKFiQSPvPoUEQ+XKpd2UMIBnR3BNwsb8/ey
g+s8YVyxsPEozvyKNvNzfCIq2DzqrDWI/nQyv1CWxuT+nb98VzwWxwX0CJCPSPee
qOSWB5abRT+zR5X9I+nkpEahQLTxcn92jr5Sk1+oVBjTdOOUqVdJJv7kqisJEPcG
sWiHUeJVhlq4r2iwcjGK6S0f4Okfd2vVKEZ42Rb/RODnoGK7Fpw=
=DFB4
-----END PGP SIGNATURE-----

--nextPart2033718.9jYyLHQttZ--




