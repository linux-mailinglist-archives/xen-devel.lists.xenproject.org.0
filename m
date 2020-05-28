Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF21E64CE
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:55:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJwS-00083l-CZ; Thu, 28 May 2020 14:55:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVz=7K=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jeJwQ-00083g-9D
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:55:30 +0000
X-Inumbo-ID: 45253ed6-a0f3-11ea-a7e7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45253ed6-a0f3-11ea-a7e7-12813bfff9fa;
 Thu, 28 May 2020 14:55:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C313AEB8;
 Thu, 28 May 2020 14:55:27 +0000 (UTC)
Message-ID: <a959e9e807dc1f832d151ab72f324f2c084c2461.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Thu, 28 May 2020 16:55:26 +0200
In-Reply-To: <cd566bb2-753f-b0eb-3c6a-bc2dc01cf37c@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
 <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
 <cd566bb2-753f-b0eb-3c6a-bc2dc01cf37c@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-GJSCESBdF8F/HKfEl0Tn"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-GJSCESBdF8F/HKfEl0Tn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-27 at 08:17 +0200, Jan Beulich wrote:
> On 27.05.2020 00:00, Dario Faggioli wrote:
> >=20
> > Cache oriented runqueue organization will be the subject of another
> > patch series, and that's why I kept them out. However, that's a
> > rather
> > special case with a lot in common to SMT...
>=20
> I didn't think of cache sharing in particular, but about the
> concept of compute units vs hyperthreads in general.
>=20
Ok.

> > Just in case, is there a
> > way to identify them easily, like with a mask or something, in the
> > code
> > already?
>=20
> cpu_sibling_mask still gets used for both, so there's no mask
> to use. As per set_cpu_sibling_map() you can look at
> cpu_data[].compute_unit_id to tell, but that's of course x86-
> specific (as is the entire compute unit concept).
>=20
Right. And thanks for the pointers.

But then, what I am understanding by having a look there is that I
indeed can use (again, appropriately wrapped) x86_num_siblings, for
telling, in this function, whether a CPU has any, and if yes how many,
HT (Intel) or CU (AMD) siblings in total, although some of them may
currently be offline.

Which means I will be treating HTs and CUs the same which, thinking
more about it (and thinking actually to CUs, rather than to any cache
sharing relationship), does make sense for this feature.

Does this make sense, or am I missing or misinterpreting anything?

> > So I think I will demote this printk as a XENLOG_DEBUG one (and
> > will
> > also get rid of others that were already DEBUG, but not super
> > useful,
> > after some more thinking).
>=20
> Having seen J=C3=BCrgen's reply as well as what you further wrote below,
> I'd still like to point out that even XENLOG_DEBUG isn't quiet
> enough: There may be some value to such a debugging message to you,
> but it may be mainly spam to e.g. me, who I still have a need to
> run with loglvl=3Dall in the common case. Let's not forget, the
> context in which the underlying topic came up in was pretty-many-
> core AMD CPUs.
>=20
Good point indeed about DEBUG potentially being an issue as well. So
yes, as announced in my reply to Juergen, I was going with the recap in
cpupool_init().

However, that looks like it requires a new hook in the scheduler's
interface, as the information is scheduler specific but at the same
time I don't think we want to have the exact same information from
either dump_settings() or dump_cpu_state(), which is all we have... :-/

I'll see about it.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GJSCESBdF8F/HKfEl0Tn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7P0N4ACgkQFkJ4iaW4
c+6TERAA6faSMR4AkggC2CwbPyZe10EgJ6TlzDMXSfwSdhv/9sxNtvtS2Ej/fdSn
9W+icF94JvzKP5iOBP6laN2q3ssbLp8ut4XWSWweTPBdnpRphF+bSyZ6Ca47Ra/0
lRQeO7PtaGvzEfA8Kz6ckXd4xmursjzSc1frx9ZLx48aQFPJb2/8/gWg9ZwsZswB
fAhzlYOq86i6SSqXUPGs0ztv5nzU773gQ7w5zAFS1XuemgZqs195wDxV54pqQB7k
ssMPOYawFoKmq6WY2ME1kK36d0JMon9eIUfdIHcAjho1CQH3u6CwcV/qjAS92e9C
1inXTQRtlWphpBPctrTY4Zf4XUi2GyonGrgCr5MtaEHNMMWFzQOaepGTYnUDsgLy
LJnaqVwio/b39JQpmF02zQ8w7cJY/VhKmA17Ujmv/4ZVbDJmSgfHdx3gJ3D+GLkv
0AcwionEOjYRqN7AQnZ+1cDxnihUEA5/+6owXGLg5OrFGLCKna8BjfMa6c4/kf7G
LLeFZQPDW0TeM6iiTe3YDt9Ol3Afkc/y61QMuMdO/6JoD0hYmzqdvrkyp5jEFKjc
RbYKe4Nvq+rwVOT0+Sx1hl3XqJn3+h9eVs7mmsxEEjY0Am4svMgN9dH2y8bj8+k4
sk6H5wpDL29Tma5yEXpAHOMbGZkkJcC17Yn1Y4MIW7OuPBB+rYU=
=Op7o
-----END PGP SIGNATURE-----

--=-GJSCESBdF8F/HKfEl0Tn--


