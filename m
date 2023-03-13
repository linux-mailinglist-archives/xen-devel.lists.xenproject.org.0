Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC856B7B4E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 15:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509326.784875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbjdf-0004lh-9N; Mon, 13 Mar 2023 14:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509326.784875; Mon, 13 Mar 2023 14:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbjdf-0004jw-5L; Mon, 13 Mar 2023 14:59:03 +0000
Received: by outflank-mailman (input) for mailman id 509326;
 Mon, 13 Mar 2023 14:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6L42=7F=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1pbjdd-0004j2-Nh
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 14:59:02 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d388d827-c1aa-11ed-b457-930f4c7d94ae;
 Mon, 13 Mar 2023 15:24:57 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 40AE63200950
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 10:58:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Mar 2023 10:58:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 10:58:54 -0400 (EDT)
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
X-Inumbo-ID: d388d827-c1aa-11ed-b457-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678719535; x=1678805935; bh=ekL30hUV11WTmvrfjmLPnt6ofiYJ5JinL7V
	Gv9I9Bt4=; b=bK0tpI+7Ch+vo5s4nFyqmhFt5xKLqKS4eICPeHzHDYeuhRXy6LQ
	SdqjWrNxQbH7KFYlMiDLWHpK3GSK4ELyQquMn9rXaQQQN9wXQB2hmMQokbx8QTdC
	4OA3iL8J043oWuP+ROoyDZ4YtMTo5V1BIUNJYj+qzrQyTORdos82GaLLyyY4nyEF
	hAiakdet3E7GmoldQzmIZ3EORP8oz8qWQWj4jdtyI9YH1FilwdLih1dRziqg4HHH
	/Hl+RuWqdg4mx0qHkAembJG/dvShl7EBQTNyEvKWv7U6eS3Z1/rggdQx+uiwK7TX
	OQuqIL/qAllJmRkyr7J+6YJ6ixT8IuvqEdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678719535; x=1678805935; bh=ekL30hUV11WTm
	vrfjmLPnt6ofiYJ5JinL7VGv9I9Bt4=; b=avAT7YdAAVT8OCu21kKFTST6ORpIe
	cH8GOk/4daIyJkbLkHW5rLOwpeUVQ9nTvKs9DWIcLDASag9dbDNMoQXTiiNvKnrH
	riyewP/JZZn5jdFlItFVb4tFRbqptCCz+b7tbSPZzFHm4fnng9W8TYUMFDcmwObx
	mAxDEXka/N7UI1T5qFyWqG4b+f0QeAFrnblqnt/4JfdLe96TsnICJUvMB8AzVbQQ
	Q5VzCh6qCy9zWWuEt+KcMF78NATSMkFquLfE1FQhgh0Ab/pfZSARGqJfy1TMQovC
	o+T8g6onjwuT1/bWErfyigje5FnQapxdgxKRyUsw6fAnUGspbw8dyNvow==
X-ME-Sender: <xms:LzoPZJhyhzUnyI2YEDRM1YSdlyjDw0FxOBAQ5FA-K_y11xsKz7gpVg>
    <xme:LzoPZOB2tjeHHoERl04_FCLF6ugSZ7LpSp9X83E36TS-AaDqW_TguxGKY4ES-O7Hk
    eurWnfKDT-RqsY>
X-ME-Received: <xmr:LzoPZJE1XnXJ_hRLc_vXyayiQfN3-ZF8DtvbIjqqGAib4C9KHUIscgdHFneN1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffgguffhvfhfjggtsehgtderre
    dttdejnecuhfhrohhmpefuihhmohhnucfirghishgvrhcuoehsihhmohhnsehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeduheevve
    dttdeludfgueevleekveeihfeuvdfhgeetieeiffegudetveduueegnecuffhomhgrihhn
    pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:LzoPZOSAzAEjQK2Z3_Tmqz-96TMgqBkJvStjALuX7xHwVtDlHD1OKQ>
    <xmx:LzoPZGx9U0ZszTKLYnQXDD7H-Q_gyQkoCzohM8FESI2UuBHQwx320w>
    <xmx:LzoPZE4LsrxO-2n2sJ2LcxajC9NXbHUH7eQChSfnDAYZ-S8Rge0WgQ>
    <xmx:LzoPZF-Y6oq-E8FlzjqgnbGQgFKh7oTBfEeQjV2IJoDp20Mt3ov42Q>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <10726811-33d9-94ab-edce-0e8de6d6021a@invisiblethingslab.com>
Date: Mon, 13 Mar 2023 15:59:23 +0100
MIME-Version: 1.0
Subject: Re: S0ix support in Xen
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
References: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
In-Reply-To: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zHRZCHvdimxymIELgfWJJ5LW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zHRZCHvdimxymIELgfWJJ5LW
Content-Type: multipart/mixed; boundary="------------4tMPZ13elEkbQ3FkHkz8eJ5d";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <10726811-33d9-94ab-edce-0e8de6d6021a@invisiblethingslab.com>
Subject: Re: S0ix support in Xen
References: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
In-Reply-To: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>

--------------4tMPZ13elEkbQ3FkHkz8eJ5d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Simon Gaiser:
[...]
> On my test system (NUC11TNHi5, Tiger Lake) I haven't seen it reaching
> cstates lower PC7 with Xen (so it can of course not reach S0ix
> residency). With plain Linux I got it working on that system although i=
t
> was rather fiddly and probably something is fishy on the firmware side.=

> After seeing it very occasionally not working under plain Linux I have
> installed a newer firmware version. With that Xen currently doesn't wak=
e
> up after triggering s2idle in dom0. I'm currently looking into that and=

> will follow up if I have more details on that part.

Solved the wakeup issue, see
https://lore.kernel.org/xen-devel/20230313134102.3157-1-simon@invisibleth=
ingslab.com/
(doesn't change the cstate it reaches)

--------------4tMPZ13elEkbQ3FkHkz8eJ5d--

--------------zHRZCHvdimxymIELgfWJJ5LW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmQPOk0ACgkQkO9xfO/x
ly8wqhAAlE4jvwo1Fhgw+Abe8J+WRIgWwujig3URbu84B2nujZ0KLwygGAlX6yoa
gxB6pAnDJ9ZujFkRt/2GPoc3IaBaB/HbLD/qqX2ThuLwegm4mHJD6BZwf1WQBrmu
aGOMQHwZU6udMloNFRjvUaqqx40ecLnGvBwbJWYLqjwxP8GztEIxIZBsNECbdyde
6BA/EX7YMkkg04y1mUpt1zEJOoUwLSrGPLmN4RJjKOZ0iOpHTpeVBS3lBIq/MsSf
PIuaEaosomyvyAkIWyhDVUf5no5b0x7Q3lJ2j7m16vGvQF7OwX9v/edR7XEbdPaL
pQIqby3CtEKtIuCCzkMnRi+HD306Bpflcn/gTDBKsinM7USxQItBJAa7AQh5Fqgm
rMHZ+h1zuHl60m5K4H2qEeTFYw6Liu8756M24Mc5iXlEG07Cg0wU9ganEwtum3bL
j50TOXXqIEDI+Nth8LvO+lBYCNtDQzUxgBvVi7phyj9tmanw4dD185EKPztAfXY3
K1wZog89K87wqikkD1I9QZlRCTQ6nGJV2XlJoq2Y7rdJMm8Z90qxW4sOiqkEuRVd
Q3iEw4IgkT/nG8dhQy8BPRiNbcA9Vkr93CQO52lY8sL5eB3AnhfteXamaJMfZtk1
w8UEGnjWEOt1jfyQrBfPLn0aPW+4yfaqDmlysKkE/7ArKwfQvCs=
=fcbc
-----END PGP SIGNATURE-----

--------------zHRZCHvdimxymIELgfWJJ5LW--

