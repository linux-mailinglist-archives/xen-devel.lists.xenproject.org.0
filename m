Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A292EB583
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 23:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62210.110022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwv5Z-0001rL-N7; Tue, 05 Jan 2021 22:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62210.110022; Tue, 05 Jan 2021 22:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwv5Z-0001qz-Jm; Tue, 05 Jan 2021 22:46:05 +0000
Received: by outflank-mailman (input) for mailman id 62210;
 Tue, 05 Jan 2021 22:46:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az2+=GI=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1kwv5Y-0001qu-T4
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 22:46:04 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82baf36f-e15a-4a85-b04c-2d67d7f5ab45;
 Tue, 05 Jan 2021 22:46:02 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id CF8A0C3AF0B;
 Tue,  5 Jan 2021 23:46:00 +0100 (CET)
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
X-Inumbo-ID: 82baf36f-e15a-4a85-b04c-2d67d7f5ab45
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: Wei Liu <wl@xen.org>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2] docs: set date to SOURCE_DATE_EPOCH if available
Date: Tue, 05 Jan 2021 23:45:50 +0100
Message-ID: <4329807.xOQAj1xCVp@localhost>
In-Reply-To: <20210105120034.qzjlitwd3lxe5kyl@liuwe-devbox-debian-v2>
References: <8b4564696cae00041848af8c5793172b80edadd5.1608742171.git.maxi@daemonizer.de> <f602c6d8-2e3d-806f-0584-ddb478b151b0@knorrie.org> <20210105120034.qzjlitwd3lxe5kyl@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13429479.VXcYR3I2OV"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart13429479.VXcYR3I2OV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 5. Januar 2021 13:00:34 CET Wei Liu wrote:
> On Thu, Dec 24, 2020 at 08:02:37PM +0100, Hans van Kranenburg wrote:
> > Hi,
> > 
> > On 12/23/20 5:56 PM, Maximilian Engelhardt wrote:
> > > check if a GNU date that supports the '-u -d @...' options and syntax or
> > > a BSD date are available. If so, use the appropriate options for the
> > > date command to produce a custom date if SOURCE_DATE_EPOCH is defined.
> > > If SOURCE_DATE_EPOCH is not defined or no suitable date command was
> > > found, use the current date. This enables reproducible builds.
> > > 
> > > Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
> > > 
> > > Changes in v2:
> > > - add capability detection for the 'date' command using ax_prog_date.m4
> > > - add information about detected date command to config/Docs.mk
> > > - only call a supported date command in docs/Makefile
> > > ---
> > > Please note the ax_prog_date.m4 macro is taken from the autoconf-archive
> > > repository [1] and it's license is GPL v3 or later with an exception for
> > > the generated configure script.
> > > 
> > > [1] https://www.gnu.org/software/autoconf-archive/
> > > ---
> > > 
> > >  config/Docs.mk.in  |   3 +
> > >  docs/Makefile      |  16 +++-
> > >  docs/configure     | 213 +++++++++++++++++++++++++++++++++++++++++++++
> > >  docs/configure.ac  |   9 ++
> > >  m4/ax_prog_date.m4 | 139 +++++++++++++++++++++++++++++
> > >  5 files changed, 379 insertions(+), 1 deletion(-)
> > >  create mode 100644 m4/ax_prog_date.m4
> > 
> > Wait, what. The comment about the -d option already existing since 2005
> > (in the previous thread) is relevant here...
> > 
> > I guess there would be other reasons why the whole current Xen master
> > branch would not compile on e.g. Debian Sarge 3.1 from 2005... Like,
> > amd64 did not even exist as release architecture yet, back then...
> > 
> > I'd prefer
> > 
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > over
> > 
> >   5 files changed, 379 insertions(+), 1 deletion(-)
> > 
> > in this case.
> 
> I have not read the previous thread. I would rather prefer a smaller
> patch than a larger one. I agree with Hans here.
> 
> Maximilian, what do you think?
> 
> Wei.

Hi Wei,

My previous patch and the following discussion can be found here:

https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg01518.html

This v2 patch basically implements the suggestion from Jan Beulich to 
determine the capabilities of the date command in configure and then call it 
with the appropriate options. My fist patch just assumed the -d "@..." syntax 
was available on a GNU date, through it might also not have failed in the end 
if it was not, but I never tested this.

I also researched the addition of the -d "@..." syntax in GNU date and it 
seems it was introduced in about 2005 (it was available on a linux live CD 
from 2006). With my v1 patch this syntax only gets called when 
SOURCE_DATE_EPOCH is defined. I'm totally fine with the v1 patch, so if you 
don't see this as a problem, feel free to take it.

This fix is the last step for getting xen built reproducibly in the next 
Debian release.

Thanks
Maxi
--nextPart13429479.VXcYR3I2OV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAl/07B4ACgkQgepkfSQr
0hW/LhAAsy2ff5GnRrngcjpQYfhulkwys87txDMTZ5KIKRR2uSVfbBvjoQz1iZRE
boqAwP0aeRFGsZPcFvJfsyWuDM3tLQpeTi6ZLORn99gZhf8gaNNz/p0X+WVqyZWG
61OTYq/iD/7JP3hxpuTxv0LjgK0gHg2QocmmFxfhiKdGDbZr7AYm2hTzO6aIFf7h
zT0HVoZWHUBGOQ6xf/mXN/B4I1dvm0nbfxe4IXh8IFSln8LV2XA0idNu5g9MGn7z
0bwr2EHDRA4BD0+2fUz27Wt8gXJvXKnu/8YneETzk3OMI5shO2ddwnDSIB8aVxN9
0UvhiD7oO3b0ZiEhf8kOJtQ4NlXbIVylARqeiNRB6Omqs4qcbSt67mGhaghVPki1
5hwWN0UUaRMj1t6k1NTWvXp+ZeOW+3HgocK4Uxvyirm5FDFtUsxVyWFIIeC2r8aO
1WDXluaHj5wefJT6d85w6aIEaZK//6mMvMjBQjdxm3fYntaKmFXOJQiCLOC8mRMa
dxxv7ypcxc+n2oxSk8Pj8nLIyOFj/EK5Lwz2GKTtpWQVUWh8zsCTZCLAzsCNWITH
WENWV0knOeQS3k6Cy64geg3j5QgKvZy0/oNaJeyOWsBHW3vI+QDrJ82q7URpTnq+
p+qIVIP8dYvE/n/WCWqOC4NnIDjh4WptebqOZAtmvpyzE6b/Osk=
=2dgT
-----END PGP SIGNATURE-----

--nextPart13429479.VXcYR3I2OV--




