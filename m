Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE451D08A
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 07:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322366.543871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLf-0001fa-Tk; Fri, 06 May 2022 05:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322366.543871; Fri, 06 May 2022 05:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLf-0001Yq-MS; Fri, 06 May 2022 05:17:51 +0000
Received: by outflank-mailman (input) for mailman id 322366;
 Thu, 05 May 2022 20:09:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QviM=VN=keithp.com=keithp@srs-se1.protection.inumbo.net>)
 id 1nmhmZ-0007Up-AJ
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 20:09:03 +0000
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327837f0-ccaf-11ec-a406-831a346695d4;
 Thu, 05 May 2022 22:09:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 891C13F3296F;
 Thu,  5 May 2022 13:08:56 -0700 (PDT)
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 5VTuAkNJ6jJp; Thu,  5 May 2022 13:08:56 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [192.168.11.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 067933F3296B;
 Thu,  5 May 2022 13:08:56 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
 id A1FFA1E601B9; Thu,  5 May 2022 13:08:55 -0700 (PDT)
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
X-Inumbo-ID: 327837f0-ccaf-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1651781336; bh=FYwb/JL7BiNf1ERDNYW+QEpxdN3SDh8ueitySQdIrBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Np/XZ4pFy233AB0Yh+gi2AcW/e9+t3y/fWG6qdh4wkqzGzyv/5d60R37rlx2q0dkx
	 ZcA/OHcd/fQ1CoFSDxr0Vi8FXjWjSwahx9raUDyKmUlHDNFden+UlqdoPoL9lb3N6j
	 z/Qqv9Wa2pLIQ3ZQ4WNbOu4gllTZvT8Le/cE0WdmezbxN7Lo811QY78xROKox4aoxD
	 YtJ5TG07Cfh89+3GGGmDQQjL7bmwxYOqopOZ5A82byaJA6k7cohAwc8JRFZ33WFxKZ
	 /7mx5KCwL1wU3NFmP6UKOcEgk9zOwdOR12cnrjAgCLv/62+PIg/yKTdgVBApfc2HeW
	 bh24dG0NyBe9A==
X-Virus-Scanned: Debian amavisd-new at keithp.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1651781336; bh=FYwb/JL7BiNf1ERDNYW+QEpxdN3SDh8ueitySQdIrBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Np/XZ4pFy233AB0Yh+gi2AcW/e9+t3y/fWG6qdh4wkqzGzyv/5d60R37rlx2q0dkx
	 ZcA/OHcd/fQ1CoFSDxr0Vi8FXjWjSwahx9raUDyKmUlHDNFden+UlqdoPoL9lb3N6j
	 z/Qqv9Wa2pLIQ3ZQ4WNbOu4gllTZvT8Le/cE0WdmezbxN7Lo811QY78xROKox4aoxD
	 YtJ5TG07Cfh89+3GGGmDQQjL7bmwxYOqopOZ5A82byaJA6k7cohAwc8JRFZ33WFxKZ
	 /7mx5KCwL1wU3NFmP6UKOcEgk9zOwdOR12cnrjAgCLv/62+PIg/yKTdgVBApfc2HeW
	 bh24dG0NyBe9A==
From: Keith Packard <keithp@keithp.com>
To: Kees Cook <keescook@chromium.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, "Gustavo A . R . Silva"
 <gustavoars@kernel.org>, Francis Laniel
 <laniel_francis@privacyrequired.com>, Daniel Axtens <dja@axtens.net>, Dan
 Williams <dan.j.williams@intel.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Guenter Roeck <linux@roeck-us.net>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Tadeusz Struk <tadeusz.struk@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org, Al Viro
 <viro@zeniv.linux.org.uk>, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 Andy Lavr <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>,
 Baowen Zheng <baowen.zheng@corigine.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Bradley Grove <linuxdrivers@attotech.com>,
 brcm80211-dev-list.pdl@broadcom.com, Christian Brauner
 <brauner@kernel.org>, Christian =?utf-8?Q?G=C3=B6ttsche?=
 <cgzones@googlemail.com>,
 Christian Lamparter <chunkeey@googlemail.com>, Chris Zankel
 <chris@zankel.net>, Cong Wang <cong.wang@bytedance.com>, David Gow
 <davidgow@google.com>, David Howells <dhowells@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>, devicetree@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, Eli Cohen <elic@nvidia.com>, Eric Dumazet
 <edumazet@google.com>, Eric Paris <eparis@parisplace.org>, Eugeniu Rosca
 <erosca@de.adit-jv.com>, Felipe Balbi <balbi@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman
 <gregory.greenman@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Hulk Robot <hulkci@huawei.com>, Jakub
 Kicinski <kuba@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 James Morris <jmorris@namei.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens
 Axboe <axboe@kernel.dk>, Johan Hedberg <johan.hedberg@gmail.com>, John
 Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>, Kalle Valo
 <kvalo@kernel.org>, keyrings@vger.kernel.org, kunit-dev@googlegroups.com,
 Kuniyuki Iwashima <kuniyu@amazon.co.jp>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones
 <lee.jones@linaro.org>, Leon Romanovsky <leon@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, llvm@lists.linux.dev, Loic Poulain
 <loic.poulain@linaro.org>, Louis Peens <louis.peens@corigine.com>, Luca
 Coelho <luciano.coelho@intel.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Marc Dionne <marc.dionne@auristor.com>, Marcel
 Holtmann <marcel@holtmann.org>, Mark Brown <broonie@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>, Muchun Song
 <songmuchun@bytedance.com>, Nathan Chancellor <nathan@kernel.org>,
 netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nuno
 =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Moore
 <paul@paul-moore.com>, Rich Felker <dalias@aerifal.cx>, Rob Herring
 <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 selinux@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 SHA-cyfmac-dev-list@infineon.com, Simon Horman
 <simon.horman@corigine.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, Steffen Klassert
 <steffen.klassert@secunet.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Takashi Iwai <tiwai@suse.com>, Tom Rix
 <trix@redhat.com>, Udipto Goswami <quic_ugoswami@quicinc.com>,
 wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 xen-devel@lists.xenproject.org, Xiu Jianfeng <xiujianfeng@huawei.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
In-Reply-To: <202205051228.4D5B8CD624@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-3-keescook@chromium.org>
 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
 <202205040819.DEA70BD@keescook>
 <970a674df04271b5fd1971b495c6b11a996c20c2.camel@sipsolutions.net>
 <871qx8qabo.fsf@keithp.com> <202205051228.4D5B8CD624@keescook>
Date: Thu, 05 May 2022 13:08:55 -0700
Message-ID: <87pmkrpwrs.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kees Cook <keescook@chromium.org> writes:

> I don't think I can do a declaration and an expression statement at the
> same time with different scopes, but that would be kind of cool. We did
> just move to c11 to gain the in-loop iterator declarations...

Yeah, you'd end up creating a statement-level macro, and I think that
would have poor syntax:

        mem_to_flex_dup(struct something *instance, rc, byte_array,
                        count, GFP_KERNEL);
        if (rc)
           return rc;

I bet you've already considered the simpler form:

        struct something *instance =3D mem_to_flex_dup(byte_array, count, G=
FP_KERNEL);
        if (IS_ERR(instance))
            return PTR_ERR(instance);

This doesn't allow you to require a new name, so you effectively lose
the check you're trying to insist upon.

Some way to ask the compiler 'is this reference dead?' would be nice --
it knows if a valid pointer was passed to free, or if a variable has not
been initialized, after all; we just need that exposed at the source
level.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmJ0LtcACgkQ2yIaaQAA
ABHC0hAAr3uHP5hrK0TrjV0miTlsckS+Z8SZ2+xvHioDubRTMMdfP79BMu5ndZB4
QaRps+OPUgs6f0p8V2N5qN2jruvrUHrKXQyiIjdsRQmUp+3qyvpjuYrtNDeHHTD2
vfM0b48EgU8kkiVZH9ksTQ/b48dkf2r7GYLnmd3VO/LkFTymGVqvodKSYl/6dZOZ
x7yTZYIRcbsjqPumSocldZhrYNuDwDWd3K2voU8pDD202q2xk3BpatYQOCnRYAzk
Le8pCTMAkJmy3VcKuORvTyRaq0/AvjfjEVHVP9ucCk68zGEU1/egKnkv3iQ5b7UY
RzyQTJSlFZQv2EomuxRRhmKQ/Ubqr//1Y5P8FLqQjJFdocf7x/wCkMdE5X/WZhIN
tjA64pkC+b20mi6NQ5XouaUSTBKTnU44rsSCWsabc+fBx96Arj1tMJCrOoqYCWpy
yg2mbeB3A55aDXAVSoC9vKoeleOJER70z7sOfycFpLPcO/XAoDOUOlfH46McYIIK
0xMfYCih17SZ/wY5s/NAamDnihpT26Zkm028+XJtQdxgyS3rSIjH+TxqQ3dpl+Tq
q78xgiJ/GBR6QVyfdgbWEbXlJUOTIA1gtT+YvkC9NwhJszdT72psVFUXtZraEaRs
+XEV7uZeDpyI0x1VGRqSDZgJtavhxjCqeR9SZ21Vch7I0NhT24I=
=lS49
-----END PGP SIGNATURE-----
--=-=-=--

