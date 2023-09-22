Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFC7AAAC5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 09:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606728.944746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjauz-0005hW-Sb; Fri, 22 Sep 2023 07:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606728.944746; Fri, 22 Sep 2023 07:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjauz-0005em-PC; Fri, 22 Sep 2023 07:49:41 +0000
Received: by outflank-mailman (input) for mailman id 606728;
 Fri, 22 Sep 2023 07:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BOPQ=FG=alyssa.is=hi@srs-se1.protection.inumbo.net>)
 id 1qjao6-0004qf-Lb
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 07:42:36 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95fe3403-591b-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 09:42:31 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AAD2D5C02B3;
 Fri, 22 Sep 2023 03:42:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 22 Sep 2023 03:42:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Sep 2023 03:42:29 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id 73A198982; Fri, 22 Sep 2023 07:42:28 +0000 (UTC)
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
X-Inumbo-ID: 95fe3403-591b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695368550; x=1695454950; bh=k6
	4X2p2VwoRCcxIEmILfU1Ile1Borr2azLvc7cFXmsM=; b=bOauwSytSvxCBYLJCp
	5iMYlbyZXt1KiskmL2vOCPuUC13MdANwe4OmYegi2l5ufISVK6jtT4BTk0AD6fEu
	xC/+6dUPmtkWrESP8ZUXETa42osg7Ylsdl3AHg1QjdSGxGllJFRn4pbQuz2FJzAu
	NifSlp0EklHjiowSgQ7uZcOHnsazW+m6TsJgnLqVg9ZpztQCguyJl2Pd4tnHWj/7
	rKGs2dK9cjLl4ktz0xiYapy7UKkvCIFtBclYQUU2xbuCHsmSNC55OUmP76xkSXD8
	ysbcP9vJBs5EXWlgpR6vJC2O5Wx104n3pMbS9RZ2vGCwKIYsEDK5WRekXNtWao7O
	U9SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695368550; x=1695454950; bh=k64X2p2VwoRCc
	xIEmILfU1Ile1Borr2azLvc7cFXmsM=; b=Bj4Q2anne6tMsUIhRmSt38pm6nPHs
	ecVY34km4V+BKfwiX5iOE4Ha/reivVecOAfwbZ45yx4Oha7g+MqPgfR7BE7bx/7D
	gO1jD/9cIg6ZnYBPsuz+cAv3qcLvwO97EKuxMGCcvckQ6JxI/16/VRMnY2GTY4qM
	0zK5NLmN8m+wcIc188t0HL+P9LtVJ59+FGsnpSVpHkFZcQKgTzicuzAE1UotOm0P
	BWJerTwwjshu5lpUC1CcJKFQn8ODFyRQ2ELsqoMPloFlX5fIAlt2g5EbenYFBgwg
	YK3egIcdR3HRSoba9M1QfgBz3r5w9T+pqJFLh7m4ah89tpUo1pVbS6Chg==
X-ME-Sender: <xms:ZkUNZRcxJpNTfy_WnvleWcQYvr3flawWHd6tzFU535Bj9q9blgqrUQ>
    <xme:ZkUNZfOsh3KXW1IAZPitiXgDkmkpKFKITpfZ2sVqzfTLZkxkxZr8MJaXamX64JRHA
    0j8a1tF4mi-hCHJ3A>
X-ME-Received: <xmr:ZkUNZahNi8qwyisHiN4_X3jTfq0rl05KaaUDulHaKLf7yGpc5_QdezqCzthO4_TfJlvmqsk6UENkr1Fsr6U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufgjfhffkfggtgesghdtreertddttdenucfhrhhomheptehlhihs
    shgrucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnhepie
    duffeuieelgfetgfdttddtkeekheekgfehkedufeevteegfeeiffetvdetueevnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihsh
    hsrgdrihhs
X-ME-Proxy: <xmx:ZkUNZa9s2PAqSptq63tF5yFrxiom9CjvcWIX-eFDUjYt1-8rETh7kA>
    <xmx:ZkUNZdtEYy10L9XorIN4Tnge7fJwzF5q9B_xOTO9lbRaCjHw8kB0DA>
    <xmx:ZkUNZZGv62c3n_dRALyZe3Nuyhj9PAmHW0ObSqgM9ixonwrfaYrMbA>
    <xmx:ZkUNZdf4eY3SoaBZzSj76J1Tehew6ivJegkQo0CJlnqk0WfEP6Fmzw>
Feedback-ID: i12284293:Fastmail
From: Alyssa Ross <hi@alyssa.is>
To: Akihiko Odaki <akihiko.odaki@gmail.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 marcandre.lureau@redhat.com, ray.huang@amd.com, alex.bennee@linaro.org,
 shentey@gmail.com, ernunes@redhat.com, manos.pitsidianakis@linaro.org,
 philmd@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 xen-devel@lists.xenproject.org, Albert Esteve <aesteve@redhat.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v13 6/9] gfxstream + rutabaga: add initial support for
 gfxstream
In-Reply-To: <6256f069-ee39-495e-a8c3-ea2328f085a2@gmail.com>
References: <20230829003629.410-1-gurchetansingh@chromium.org>
 <20230829003629.410-7-gurchetansingh@chromium.org>
 <2620fca0-a5b4-49d0-bf91-fd359ee4999b@gmail.com>
 <3830bf8d-8c25-950c-f901-8d70dbfc06a6@ilande.co.uk>
 <CAAfnVBknhG=QYn=OFjNW9h=KbDtQ=xq3AEs5Pg=AG3LTO=LZ6w@mail.gmail.com>
 <6256f069-ee39-495e-a8c3-ea2328f085a2@gmail.com>
Date: Fri, 22 Sep 2023 07:42:25 +0000
Message-ID: <87lecyejry.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Akihiko Odaki <akihiko.odaki@gmail.com> writes:

> Practically there is very low chance to hit the bug. I think only=20
> fuzzers and malicious actors will trigger it, and probably no one will=20
> dare using virtio-gpu-rutabaga or virtio-gpu-gl in a security-sensitive=20
> context.

Well, this is exactly what Chrome OS does, albiet with crosvm rather
than QEMU, right?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmUNRWEACgkQ+dvtSFmy
ccBxGg//dcsfGgRKdv8Y2vhhzZlfuKKWbz7u93kMnMRywPinims++Ly+iU7qpaJv
Ppts5R/DmBdzxG1+b8/v2KDv40d4vy9ehB6XnVEFIdGjhMXOyWGSMw2vN1ndc1jz
RCkaDr0p3WZQxT91o1kQ1g0wM633zmL3oPbIFC5JFGdw8v/6Tn2jx52TZGN1YQF9
W41N5kstGQSvPI2M08OupGKPFU/e6zSw92WY9z/PGVKJPR2iCazQFI3Q9Yb2ttR5
+W0LNEfgy2NviwlaI7Wdx+E21aWgmyfwHS+AZDuyEP90yWledJ7RR2Ah9hqeGh4l
wryHd8zrm1RZ81i/v6DDWZV/vuPzeK9eQQcVEprZi8vGyhoeOafG2CfBTki+Acf+
L/uj3BlyHo6SUIWiPNR89xW6zHWeTT3Fpnt5ZONmdTIw4cWLkvgVOH8MNAZH3HgE
/+iG1nqlrEd1P8AoLc5vt0rsPAl2IXgQ8NAWVEtn+G50FPMDVLx1DcSfnS3BDTsw
NLzDkTU5KZ60mp6jqLUBeATLq6TJw6aNdf5nkbLThka6g9C7KOZaX8EkC8I+71VV
40uc1iTxvmLMIT66XK2e3xDXU1c7nGCh4Z6EuM9/JGWn6uRJ3sjcZn69AGZa3OkN
XImxWk+TBV15JTGcBKsxODqETiDqUrLCqBIeJOcAiMmoB5eF3xU=
=jP0G
-----END PGP SIGNATURE-----
--=-=-=--

