Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E1769EF2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573371.898075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWP5-0001RR-04; Mon, 31 Jul 2023 17:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573371.898075; Mon, 31 Jul 2023 17:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWP4-0001OM-TB; Mon, 31 Jul 2023 17:09:54 +0000
Received: by outflank-mailman (input) for mailman id 573371;
 Mon, 31 Jul 2023 17:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hZk=DR=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1qQWP2-0001NR-KV
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:09:53 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0caf9753-2fc5-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:09:48 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1qQWOr-0002ds-L1; Mon, 31 Jul 2023 18:09:41 +0100
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
X-Inumbo-ID: 0caf9753-2fc5-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=k.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=kq3C9qdHinQVZt4g5pbFr5nLdggSuLiE7Cy5h/e80Zg=; b=nVIcsoN2NZw4
	t4niyQw0UBtVPY+ovRrpXqXj7lLH5sP2WdBDMupYBXLq7dowyyxhYsD//uhlw5Q/HSAdEM/uLYapU
	qmyAxubtVzqdsAO7Y8OT3ywsDXb/+fDJXa+MUDVuW+rwkyKkvgd85mluwnjcCPHX6EPwX2Xq21AZJ
	6tkjxd2SBjylDBYnVL9eHRt/rNzHdI8o8OI2zrDkRhWlzPPNnUPiqHKcfFjnKhwDo/b0tjcv+cPBs
	F3R+E8kOTEDMPjj5PnsO8yMSuPNiGPGnmQhNVDe6Zvc9+DsfC/IAlIbKna4LdFC5IUUjYy8Eud68W
	HaI+2GByL816gphy5JOVuQ==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <25799.60117.528120.26189@chiark.greenend.org.uk>
Date: Mon, 31 Jul 2023 18:09:41 +0100
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    xen-devel@lists.xenproject.org,
    wl@xen.org,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: Python in Domain Configurations
In-Reply-To: <ZMflj1F5qDydEgbd@mattapan.m5p.com>
References: <ZKiN80e08QIojRSL@mattapan.m5p.com>
	<ZL7e6IcJWK38IHU7@mattapan.m5p.com>
	<ZMcxvdSbpQdWg5/r@mail-itl>
	<ZMflj1F5qDydEgbd@mattapan.m5p.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/af/afac8f396f88c5d9f7a728135905de4e.pem

Elliott Mitchell writes ("Re: Python in Domain Configurations"):
> On Mon, Jul 31, 2023 at 05:59:55AM +0200, Marek Marczykowski-G=F3reck=
i wrote:
> > So, IMHO reducing config file from a full python (like it used to b=
e in
> > xend times) into a static file with well defined syntax was an
> > improvement. Lets not go backward.

I'm no longer working on this codebase, but since I've been CC'd:

I was one of the people who replaced the Python-based config parsing
with the current arrangements.  We didn't just do this because we were
replacing xend (whose use of Python as implementation language made it
appear convenient to just read and execute the configs as Python
code).

We did it for the reasons Marek gives.  It's true that the existing
format is not as well specified as it could be.  It was intended as a
plausible subset of Python literal syntax.  We chose that syntax to
preserve compatibility with the vast majority of existing config files
and to provide something familiar.  (And it seems we did achieve those
goals.)

The disk configuration syntax is particularly warty, but we inherited
much of that from the Python version.

If we had a free choice today, I might advocate for TOML.  But I don't
see any value in changing the concrete syntax now.

> > As for your original problem, IIUC you would like to add some data =
that
> > would _not_ be interpreted by libxl, right? For that you can use
> > comments with some specific marker for your script. This approach u=
sed
> > to work well for SysV init script, and in fact for a very similar u=
se case
> > (ordering and dependencies, among other things).
>=20
> That is /not/ the issue.  `xl` simply ignores any variables which it
> doesn't interpret (this is in fact a Bad Thing).

I forget, but isn't there some kind of scheme for warning about
unrecognised configuration options ?

>  I need to know what the limits to the syntax are.

I agree that it's not great that the syntax is not 100% documented.
The parser is in
  tools/libs/util/libxlu_cfg_y.y
  tools/libs/util/libxlu_cfg_l.l
I'm sure patches to improve the docs would be welcome.

Note that it is still a *subset* of Python, so if you wish to use a
Python interpreter to parse it in your own tooling, you're very
welcome to do so.

> Notice how many init scripts do `. /etc/default/<somefile>` to load
> configuration?  I'm thinking it would be very handy to use a similar
> technique to load domain.cfg files, with Python being the interpreter=
.

I don't think this is a good idea.  Both because I don't think the
functionality available in a Python interpreter should be available in
the libxl configuration, and because Python is a large and complex
dependency which we don't want to pull in here.

> I also think some portions of the domain.cfg format might work better=

> with full Python syntax.  For example might it be handier to allow:
>=20
> disk =3D [
> =09{
> =09=09'vdev': 'xvda',
> =09=09'format': 'raw',
> =09=09'access': 'rw',
> =09=09'target': '/dev/disk/by-path/foo-bar-baz',
> =09},
> ]

I agree that something like this would be nice.  I don't think it
should be done by importing Python.  These two files - the main part
of the existing parser - is only 183 loc including comments.
Extending it (and the support code in libxlu_cfg.c) to do dictionaries
as well as lists doesn't seem like it would make it too much bigger.

Thanks,
Ian.

--=20
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my o=
wn. =20

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

