Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F374E4C0D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 06:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293613.499114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWtJZ-0002Mt-HE; Wed, 23 Mar 2022 05:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293613.499114; Wed, 23 Mar 2022 05:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWtJZ-0002K4-Ab; Wed, 23 Mar 2022 05:13:45 +0000
Received: by outflank-mailman (input) for mailman id 293613;
 Tue, 22 Mar 2022 17:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cMSl=UB=irrelevant.dk=its@srs-se1.protection.inumbo.net>)
 id 1nWiD1-0007dX-49
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 17:22:15 +0000
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bbc9895-aa04-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 18:22:13 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C20565801B2;
 Tue, 22 Mar 2022 13:22:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Mar 2022 13:22:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 13:22:00 -0400 (EDT)
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
X-Inumbo-ID: 9bbc9895-aa04-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; bh=DKA1S+zaOnp0EXg0D/eCjdJnTBqB3w
	lH33M2skJaIIM=; b=kUjswknOc/LNgIBFH7zcVbzZV9YF/Q7z7pKdb1AQC2FC6e
	tzxhuA3aNM7wNZzPtyEtnsPihfCxdYq4JV1l2ve6fTch6rDfr61f7+4xLQBY8GAG
	Z4H/2nh9Mdfc8j4wrXjcwJs9303SEHhbq1+XKBLkJqBVzhpIGLv75bBitbKEjYzn
	7HRrsZ9Cz7abydk5FnBX9cKXa31Cn6tK/pXZvAVhNEEueJV6HI6QUhPH5FtC2M1x
	yPxITWXQs7HQQRtyekZloFU2ESBiMFUewLOq0lEbsPb4d4+jGa2v/CQZHCfLtJQp
	ug3mXazcnjhZTW9Mz0SZN/HmL4N89/cRdYNqYAwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DKA1S+zaOnp0EXg0D
	/eCjdJnTBqB3wlH33M2skJaIIM=; b=dbnSSTgUklpqQhwWFknQDnahg1Ryed2g7
	wZ0PE3zLkLNJpLCKyefyvIzDT1zdqKS0G43qgA4EidVFIWdForoozWc7RWaJ0BW4
	3r3L3gR7+QeaibY37sjTIFuJVwZ3E+FC8iej7yL5lRnra7n8fkxbge4yWFaaaPNr
	gasE8fIyPuP0EtOKfvrde3Va2Zc1Ge9Fhhc2aeU3W+Rg9uX2+9pLEPYBlawvbirN
	vESQFI4Y/HCFWVPYAuOyfE69fJ/jrRMYIBSMKi5u9sppOJQrIJ0irBz5VrR99jGk
	niEfkdZ4sh/2I7LfxNxuTUVKZXmv5ej/Da4vUOHhwCVJ3d3eWhRWw==
X-ME-Sender: <xms:wAU6YuiDVSiO5DXDfSL8EIMJPMlDj54UyI_sfzAOFASsHtGMDphZBg>
    <xme:wAU6YvC1wRJ4Pxg8ngkDfAEPQ0xqzNpje2B93LCNzR3fLKD5slrs57CvkQ6hzA-MA
    MO7QN7gFJpfj1rOVFo>
X-ME-Received: <xmr:wAU6YmFvkNY5p9PlD_Cw_LT0A6zz4RfLSj-c-dcgQdAukt_SOaChW2UNw_k-lh11iO-gqeOtvp9zgH0V7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
    ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
    gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
    hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wAU6YnT-3y9ba53YTbdzDilaJdXcBx0lP9NRYpcahWvudI3S6ZAyQQ>
    <xmx:wAU6YrxTLwhzw0WFqIxp-d74Cf2UQRYGNgd8JFhrgumPo2LmigxrBQ>
    <xmx:wAU6Yl4rmLv7PAa_H7QhvkfyzDaoXDiwKlGZYaq58M_gYE7Kj1ksNw>
    <xmx:wgU6Ylh8R0wqYvzc50CjDVm3cmAN4T0qVUWveuXkCGEB5-jlmI349w>
Date: Tue, 22 Mar 2022 18:21:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,	Paul Durrant <paul@xen.org>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,	Greg Kurz <groug@kaod.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>,	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,	qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org,	qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, haxm-team@intel.com,	qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Message-ID: <YjoFtvvV/LtGt2X9@apples>
References: <20220315144156.1595462-1-armbru@redhat.com>
 <20220315144156.1595462-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W/A79Jf9YM97F5Ll"
Content-Disposition: inline
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>


--W/A79Jf9YM97F5Ll
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 15 15:41, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/nvme/ns.c                             |  2 +-

For hw/nvme,

Acked-by: Klaus Jensen <k.jensen@samsung.com>

--W/A79Jf9YM97F5Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmI6BbQACgkQTeGvMW1P
DemVHQf/UvBrob2AKXn7QLs1LPvjspegusuMZAUULXyiS7FJ456DBSy0wWUweIj0
+PKX+HOXbZu7s0mUXhZ0GpiD5V39c/M7/18p620LaokIDnuwuI1Mshnytrk5gao6
EyfSap+WxrF/ys8BQ7X22h6juLgDsY4J/QwuHEk+rcjSO4YQpeJBpp+3AsOFbWbl
7wx6aFzLcoAWIWr5zc9BwboE5w9Ot7/fSBdn1GnbWUfVr0VxCJGv5oU833IsOcbL
3Kufe+QE2ZxyD7v+mHI1/THkr9rFYaWJ8f4HAfQ5XfoOo/ULXo6qkw4fM04tD3ex
oGvzJovacGYnvSvYmde1KMydB+oNXQ==
=KxTS
-----END PGP SIGNATURE-----

--W/A79Jf9YM97F5Ll--

