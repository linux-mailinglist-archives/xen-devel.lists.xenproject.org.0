Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AAB80D8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 20:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB18v-000202-U2; Thu, 19 Sep 2019 18:27:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rfT7=XO=decadent.org.uk=ben@srs-us1.protection.inumbo.net>)
 id 1iB18u-0001zv-1l
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 18:27:00 +0000
X-Inumbo-ID: 10171632-db0b-11e9-9670-12813bfff9fa
Received: from shadbolt.e.decadent.org.uk (unknown [88.96.1.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10171632-db0b-11e9-9670-12813bfff9fa;
 Thu, 19 Sep 2019 18:26:58 +0000 (UTC)
Received: from [167.98.27.226] (helo=deadeye)
 by shadbolt.decadent.org.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1iB18i-000664-79; Thu, 19 Sep 2019 19:26:48 +0100
Received: from ben by deadeye with local (Exim 4.92.1)
 (envelope-from <ben@decadent.org.uk>)
 id 1iB18h-0001a6-C8; Thu, 19 Sep 2019 19:26:47 +0100
Message-ID: <d3bb280b405d6acf0bc4176d63639201ff62853f.camel@decadent.org.uk>
From: Ben Hutchings <ben@decadent.org.uk>
To: Vlastimil Babka <vbabka@suse.cz>, stable@vger.kernel.org
Date: Thu, 19 Sep 2019 19:26:41 +0100
In-Reply-To: <20190802160614.8089-1-vbabka@suse.cz>
References: <20190802160614.8089-1-vbabka@suse.cz>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH STABLE 4.9] x86, mm,
 gup: prevent get_page() race with munmap in paravirt guest
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
Cc: Juergen Gross <jgross@suse.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, "Kirill
 A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: multipart/mixed; boundary="===============3617440138452089054=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3617440138452089054==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FBmeXmh5MpmOJLyUNuxi"


--=-FBmeXmh5MpmOJLyUNuxi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-19 at 18:58 +0100, Vlastimil Babka wrote:
[...]
> Hi, I'm sending this stable-only patch for consideration because it's pro=
bably
> unrealistic to backport the 4.13 switch to generic GUP. I can look at 4.4=
 and
> 3.16 if accepted. The RCU page table freeing could be also considered.

I would be interested in backports for 3.16 and 4.4.

> Note the patch also includes page refcount protection. I found out that
> 8fde12ca79af ("mm: prevent get_user_pages() from overflowing page refcoun=
t")
> backport to 4.9 missed the arch-specific gup implementations:
> https://lore.kernel.org/lkml/6650323f-dbc9-f069-000b-f6b0f941a065@suse.cz=
/
[...]

I suppose that still needs to be addressed for 4.9, right?

Ben.

--=20
Ben Hutchings
Quantity is no substitute for quality, but it's the only one we've got.



--=-FBmeXmh5MpmOJLyUNuxi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl2DyGIACgkQ57/I7JWG
EQmtMBAAi586lgxSJosug6EchWJu1bRh3VBWNNPgJ4J6ffWIDUl3ADDOA94ewtHd
yv3AmUmnMZf6HzM2pxfWzVtzEUf2MnaUtttFjJ3ChyY1PYTd+sKB9xL63Frdfv4K
rhLq/Gh/buYvFzvPAgLFIF9OedV4winWz1OM66ZFPKs56UzTMGWS6FxEDgsuSeVL
UJbi/nU7eEV9BWu7hcnYWedHXemtvzJdVApsDSypcHloXHBDmMl1wkVyYhpKp5UZ
M6s56CvPZXWrIpVo8/YJYIuPLB1ExeaqvddJHGQ8sZAjkcFDSXwTonASK5YdiVYa
+7NtLgVp1sKLls2FDVrhKP70XVwB9HkeThnShdifTO4Q3YIfRF8DjaWwl2EtaC2b
OGOGCdBZZY7kMFdGPiySxQarEAFGK4N6aNeAdl7Dst2XH88olWmSwy4m6Auw/hBD
V5npJtk92/M/QILGzyjrmABefbktwY2xo+byqoAHY/CBGZv/p/WfNikBQpCb7s4g
1LKslHq9CzQzTSoD7EYkjrNHtNFZHhYrJCM8INcM3aK589/3t+ktz13QxKVrCGIp
jZjWn2QA5uINC26dkeszYhzyInFsKO4QeR7riuxKH13rH+D+bVel5HpL8q7gvefd
toAfqG2c3MrjekRhyA8GyTRoHz7LAPbvH+J2tJhA++9AcFW+5l8=
=jVXl
-----END PGP SIGNATURE-----

--=-FBmeXmh5MpmOJLyUNuxi--


--===============3617440138452089054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3617440138452089054==--

