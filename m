Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B41ACDF8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:47:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP7fR-0003sC-QB; Thu, 16 Apr 2020 16:47:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04wr=6A=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jP7fQ-0003s7-PB
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:47:08 +0000
X-Inumbo-ID: e8aaec26-8001-11ea-8bce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8aaec26-8001-11ea-8bce-12813bfff9fa;
 Thu, 16 Apr 2020 16:47:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7EC97AAC7;
 Thu, 16 Apr 2020 16:47:06 +0000 (UTC)
Message-ID: <4716e235b5a5723c7cf55c3ef2d6295bcb27d8e0.camel@suse.com>
Subject: Re: [PATCH] sched: print information about scheduler granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Thu, 16 Apr 2020 18:47:05 +0200
In-Reply-To: <bd38c4da-b982-0d13-bdbd-ab363dae68e0@suse.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <996ed66e-3782-5187-a804-9291741a2241@suse.com>
 <1587028832608.72974@citrix.com>
 <bd38c4da-b982-0d13-bdbd-ab363dae68e0@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-CKOCHYlTqc2Ci+0DTwlt"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-CKOCHYlTqc2Ci+0DTwlt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-16 at 11:25 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 16.04.20 11:20, Sergey Dyasli wrote:
> > On 16/04/2020 09:57, J=C3=BCrgen Gro=C3=9F wrote:
> > >=20
> > > The xen commandline ins part of the boot messages and is
> > > contained
> > > in the "xl info" output.
> >=20
> > It's true that you can see "sched-gran=3Dcore" in "xl info" output.
> > But that's
> > just the switch - not the end result. A user might want to verify
> > that he did
> > everything correctly and core-scheduling mode has indeed been
> > enabled.
>=20
> I'm not opposed to your patch, but as soon as we have per-cpupool
> granularity it should be reverted again.
>=20
Why reverted? Each cpupool dumps its own scheduling information. With
per-pool granularity, we'll see something like

cpupool: Pool-A
Scheduler: SMP Credit Scheduler (credit)
Scheduling granularity: cpu
...
cpupool: Pool-B
Scheduler: SMP Credit Scheduler (credit)
Scheduling granularity: core

etc.

Or am I missing something?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-CKOCHYlTqc2Ci+0DTwlt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6YjAoACgkQFkJ4iaW4
c+6R2Q/+LwMlSNIdE1d5dFF1Jy2y+5hLE0Owh/RXFj3EISxS04r3nyUwwFrrHDel
RONmQ8z0FnPQHpV+SOPoE0+yM5An0lKcA7bo5IDgKcycZuWWuczwuMZpKW4eBZYl
clKphTqYDRzr4nYCY1L8z4YlpmJE9DUosOTl/+aKgYospuYqqaPnbL23wCNMk9W6
UM/NzIrJkpzUyTzTczd2QOqT+Rgm354KkFdgZGf+2gKW+jbfdjkbnzi+74vK5AX/
q1fEKQTy7cKS1e4AWECLFfWwd7TnD05zAIsPooxU81cQBq0WZx1alDkO4TsPm/3L
XDq5mGmW6s+J4d4fb50wqHZi/0D9bAURyRd/HKgLJORDCjX+4bYUw3pQYwZNTGIU
X77DO+m5Q+sEy/ULFpOmEMxV/5NlMRXHcbSCve0jKEFPz60OJ7ACWUmUZYTFyII3
aeEgC8yvEJWsh3N4xAyJFOosa2Mt2Ys4Z3LQhKmGcOrUsKBjFsESXPvOWnzQ29Kk
TX/GRaQoN1OKm7+N3rBbtap3OQqqZb0KzTlgTiEBPQLEED2yK6EK6xILnU+WQwYe
6z18Dm1t3BnRRAuYgowIzYsV/UzmnbFz61tKj+IAN421X5eA85DRbBsk13CEJ8tT
0tnLUZykz1b4SuRz3ep5oskjUM5kv4BEa8FfXVshmOTe2d9d5do=
=LwrW
-----END PGP SIGNATURE-----

--=-CKOCHYlTqc2Ci+0DTwlt--


