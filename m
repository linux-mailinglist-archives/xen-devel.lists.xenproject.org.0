Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE5902C60
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 01:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737574.1143951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGoCV-0001kY-Ch; Mon, 10 Jun 2024 23:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737574.1143951; Mon, 10 Jun 2024 23:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGoCV-0001im-9s; Mon, 10 Jun 2024 23:13:19 +0000
Received: by outflank-mailman (input) for mailman id 737574;
 Mon, 10 Jun 2024 23:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tSL=NM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sGoCT-0001ie-4Q
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 23:13:17 +0000
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01df97f2-277f-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 01:13:12 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 4D2E0114017B;
 Mon, 10 Jun 2024 19:13:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 10 Jun 2024 19:13:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 19:13:09 -0400 (EDT)
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
X-Inumbo-ID: 01df97f2-277f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718061191;
	 x=1718147591; bh=XdB1LeNJvq5cTqeCGvMUXa2njhR2pweuTKlndzyLsPU=; b=
	KMSSkTvhUHf7Wny3EmIW8zkRSrIsajj0JC9sNO/jnCM4Vh1Wpy7PLSQHxFGYRJYD
	9vxd2nZikfJG8FGpFretDpt3ag3Ja7N+tu7IQiAhdS8W/hn/m+svZdBD0FTJuq3I
	i5gmI50W8p27EXEY1pT4ABoF0vGmtQJMmOVBrpBijKkzT+tfaUojba70SjQBJvn6
	KWQrgUxckJAbKcbhKdPVvRlf3U9aPqB2ct6EN0j3QM7nArCMzEXQsLMnz0yRXh3U
	vf03TFns3qKhxVS3vKVi5zP7en+BVONVr2FR04Eha0RMxk99k/HsHNmlYh31/xU9
	xJfd7moyStFPsSt4xftFuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718061191; x=1718147591; bh=XdB1LeNJvq5cTqeCGvMUXa2njhR2
	pweuTKlndzyLsPU=; b=LdfUZQSXY06z1Oa9xvucvXpDqvKgTokuAvP7U4RvMK8P
	VigpzTZjYXbGxyClYJGl0NnPr/8vktOdmg2prx17dqw9/5ZoQRVAuIhmt2xf9IpO
	Qeg/wxO8cG8i1gMo9PYZ+xGkjuq26Cz/fUr6KMYi8vQ8+WDF/Jx6b+936ylS1XgD
	r42ICwOJ1hNu0EbLlrKQIHHlKfyJJtrXqDa2VC/ZtA5LlTu5Agqh+N9YIvBl2lgv
	uTKPMQLPyN4oT79r/yead77TnNbqnDJQV9DNP6U3Bjdo8noi7E1+uB6QKRYYH2iv
	wkcgMMRZrs6NSbEmRXh6j3w6h5uSVBGz6TtNAHluDw==
X-ME-Sender: <xms:hohnZsIQKC2ufqpf81oxTD18etEzt3xj-tLwbZo8jbJCOdXH--Jgqw>
    <xme:hohnZsKK6y-n8wlguPZ7w6CgjLtc8YLFcSIzMZvk08Ya_Zq3xazXUgW37maO4FHoO
    2imMoFnzgJjBg>
X-ME-Received: <xmr:hohnZsu4LCQVHmEk6Uvd7OKu3CWOLeWygTCDJcPpgJbEMKvrQyVaVR05VnBHHtzWDOz_8VwMqzhNp_BbByVLutbTQ0Uu1uoehA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeeuleejfeegtdeuhfek
    veelgedtvddtfffhkefggeeuudeuveevhffggedugfehnecuffhomhgrihhnpeigvghnrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:h4hnZpZ8GD9nfEiIGN2Sr-erWGKbzOZm9qBSkvEcuhSAf_qJQK-ubw>
    <xmx:h4hnZjaU5wcBe0AdALzeitTz-Z0EVMpD-qyrJLvL5EPOUGHBBAG6PA>
    <xmx:h4hnZlA7cWP_wOuAKeIXDaLlQ3QTzCPbphrj0S2se4l5GLV_-Vqjug>
    <xmx:h4hnZpay3ZIpHnks75oei6lmOuNb8cA4hAXSXsEN1eb_S5DULRT5EQ>
    <xmx:h4hnZn5JNZTWxcPyzbtRf7RJmYNVQVhBtNBrUng7_G6RgtyMBH-tev5a>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Jun 2024 01:13:06 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: alter EFI section
Message-ID: <ZmeIgkFux7tbCZk4@mail-itl>
References: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v41JMIFRagluK5zY"
Content-Disposition: inline
In-Reply-To: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>


--v41JMIFRagluK5zY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Jun 2024 01:13:06 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: alter EFI section

On Mon, Jun 10, 2024 at 08:38:45AM +0200, Jan Beulich wrote:
> To get past the recurring friction on the approach to take wrt
> workarounds needed for various firmware flaws, I'm stepping down as the
> maintainer of our code interfacing with EFI firmware. Two new
> maintainers are being introduced in my place.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm not sure what is the proper tag for cases like this, but:
Acked-by: Marek Marczykowski <marmarek@invisiblethingslab.com>

> ---
> For the new maintainers, here's a 1st patch to consider right away:
> https://lists.xen.org/archives/html/xen-devel/2024-03/msg00931.html.
>=20
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -308,7 +308,9 @@ F:	automation/eclair_analysis/
>  F:	automation/scripts/eclair
> =20
>  EFI
> -M:	Jan Beulich <jbeulich@suse.com>
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:	Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> +R:	Jan Beulich <jbeulich@suse.com>
>  S:	Supported
>  F:	xen/arch/x86/efi/
>  F:	xen/arch/x86/include/asm/efi*.h

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--v41JMIFRagluK5zY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZniIIACgkQ24/THMrX
1yxlMQgAk1G5lANkDxtIWJGe8EyEYWTZm2Tj6VAvgqfXWmhC3wRWboezjwICQjMr
DzT9HBPO/N++PsVtqz+1eKZQxeaVxTGUAS4m5ulj2svIis+qoMEuJRli23GGmlg5
y79VhNFPynkNDBrr670UrBvxPZJWm3NAGLGmqEG8j38zZbj+MWxr34em/CZXjcr5
ZlcU+FRRkyFf33hNM7HxllqI+IoLuPYl5q8u7T9bwHtXfYJsCE6SAhvYt0Ag5tYr
w8VCF6Fwacq8h7hP29AVxzfaWHB+4qlvdX5w4CczlBxZz9BVg+4D7MM5qVDj630O
g+8pgXRNk1aaF9sqMr7iaaYak2zXtA==
=Nh2x
-----END PGP SIGNATURE-----

--v41JMIFRagluK5zY--

