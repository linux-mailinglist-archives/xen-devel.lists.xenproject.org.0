Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +chAB50fVmr0zQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 13:38:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4D753F6C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 13:38:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b=DIdZ3qJD;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=Z1xmThv1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1362208.1614108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjbRj-0007Ox-RI; Tue, 14 Jul 2026 11:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362208.1614108; Tue, 14 Jul 2026 11:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjbRj-0007MM-Oa; Tue, 14 Jul 2026 11:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1362208;
 Tue, 14 Jul 2026 11:37:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wjbRh-0007MA-E9
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 11:37:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjbRe-00BJ8x-Aq
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 13:37:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a561f56-2eae-0a2a0a5409dd-0a2a45028e28-20
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 13:37:02 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a561f5c-6ca4-0a2a45020019-ca0c7c90dcb5-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 13:37:01 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 1D8331D00169;
 Tue, 14 Jul 2026 07:37:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 14 Jul 2026 07:37:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 07:36:57 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784029019;
	 x=1784115419; bh=7RbE0Nv3PqcWEvg1NZK6t1ZxnUn6Kyl+33LgQxDmYXI=; b=
	DIdZ3qJDNjFfCq4vVsWQ87xJiw3qZ5c7YL3vGL4qywkWZjEIN7uYZaZPgR1g5kWK
	zCwiJGs2kcDMs+kKUnEnt5+l4ZAYNe6+ixyMRLMvh/j35WEBZlh6nkyWov9CcQl9
	iFO4asR5sMES6GvXJHll6mWHJLZEyXfus6rkbxbjm/Rq1ZFRX75Tzef5cZ3Ydlyz
	CMjjUmWYkaX9K3qC6XknGqMr4hVpQEu6L8djFyjbR/Q9cX9Iau8UDzdFVBYEdSFC
	MkomefYe7mDOxVsoHS9jwp37FYFsLvuPPrmx7TgHeX9lKGcB5KmSlJ2RA+pBdmTa
	Yxk+oL0dQ/udPcMqbBWYhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784029019; x=1784115419; bh=7RbE0Nv3PqcWEvg1NZK6t1ZxnUn6Kyl+33L
	gQxDmYXI=; b=Z1xmThv1CYV1tNrSnZEi0QiOlbH+i7cdpdojeV31lnk0o8tWWgw
	VuCcKnbphyhooTP1ke5JtxtCykYynYAgZDt2v5Oc/fZsNT25N1pLzjkMY1ZyPA8Q
	mOXHggO+0G8d3chlmhbJgfemnWyoUKTw9Jg9ZA/G1Ztmxj/iRDgGxwaBxSTLnAUT
	UmYFpbQ+DyTebINyw60T56YoaByJwORTvC3ybWlGQkShD58rHzK7Bryu8r8wG4cd
	KT9yICHSimzQ22YJ5mi3wuhccZ2n4nvoP5nBtEzgwSEu61B1oiGawwb9YAncUDUk
	05iz8nn//Dw7ZjraRfvZ9d+7Echhjez4JzQ==
X-ME-Sender: <xms:Wx9WauHLaHt_gupfLLE40lPICHUHoourcg8bHJ6R1w-k8ZB3RzE7fw>
    <xme:Wx9WavC2sU3qmnjz5XAdxkTFVgvmMnj-Em4YnBO3nV-C8CO0HLooevmK0eEOUtI-V
    PibthgL5grIeVdpTGDagMwFyWkNozDfvtahLCl1sf2ezE6r>
X-ME-Received: <xmr:Wx9WajwKv-bobG9As7YjRNvisWNxEcTNwnVpKSlIXLNW6jQrCrpKxDO9gVtsMTzeHFtlhSaKWYGS7EY4FrIuf-h_mCsJAtPrZUE>
X-ME-Proxy-Cause: dmFkZTEFCIzIQMCd2MkWM2GVRPXPZcLLdFwqIvCqn7GNb/FgdSTRcwIq2bs70YB4KkszA0
    2Uu3wp1FwQ9/V4n2J5vOU4vaQRgdzlHw0yPwcCuCso7VIxmXCWYu8IUyjRtDnMApMYk63Q
    8YAp2R6L/gdWyVzjJB87R229XAVEhDPaYGFpcWlQAY4dDV31/3M34n7UFcBai4hWiu/l76
    kgXWXllMALS0ldoYIP/4pPVV6OAtxoGSSxcgVBT79/xhnOGimo4VmNFxG8cGmqmy6BJYYt
    cpa0mAteMx2JSNzl8dQSJVHtsmy/mpEFdof5T3KEXOGFqfC6F1gRed+oxwEL3Ys64vPppm
    IEgImoAdzdXUaJGEhUB8BBAixpojp7+95yQn1EnMWiQVVtkqNA+YQsajUpPkfAazrpFKUs
    Ax38yXkVmSI/xr2lCJ4OQnKslwH0zeLS0wNN5UZxT1ExwypRmjKdf8Rz4FVvv/RVxoekI9
    M8Y3Sdt1btLcUD3dmPWYSWxLvIpOe8hvsyPdBQLWEgUkhC5RYQ3/CbYW/allvTEPNUgywj
    IEhCg+ViWQhF6EhvLi9xgc5hqyVQsCgoEmDao6ceqs3QfuiRdJHbI3vZPXP3LwFfisEczt
    oMNSe68bgBKoH379/ecqFep3N7MwTcJu0IioGwoEwcB59EnXNjrYBSJANnKg
X-ME-Proxy: <xmx:Wx9Waj6HJ1HZy5pwxQMmH2l_QJSPJlgFBfNW-CIsuFaA-ZuaGhyMlw>
    <xmx:Wx9WakwcY3m5WIs76-FAIFGMVngiHN81kPKXOj8-RufKbZ5tvNLbVg>
    <xmx:Wx9WandveogwV-gWTqPYujKe2VvHtfP3RdF1wvcvqBjOQ_ycW5lAKA>
    <xmx:Wx9WapDKK83ncNPhj7-FAJLXBG9TPlkhPdMcFKoG_02C97GSFFWnXw>
    <xmx:Wx9WarWWotNXlr6sYu6OniZPRL6HhYOWATfOo8neVOEkPT05SnvjLu8m>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 14 Jul 2026 13:36:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
	Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	stable@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Message-ID: <alYfV2l-7p4Y3eX-@mail-itl>
References: <20260127195907.34563-1-roger.pau@citrix.com>
 <aXokOX20HMD0E_PM@kbusch-mbp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G/yGk+MB9HjdayeF"
Content-Disposition: inline
In-Reply-To: <aXokOX20HMD0E_PM@kbusch-mbp>
X-purgate-ID: tlsNG-720697/1784029022-674BE2AC-F00AEF62/0/0
X-purgate-type: clean
X-purgate-size: 2391
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:axboe@kernel.dk,m:martin.petersen@oracle.com,m:linux-nvme@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hch@lst.de,m:sagi@grimberg.me,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62D4D753F6C


--G/yGk+MB9HjdayeF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:36:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
	Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	stable@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call

On Wed, Jan 28, 2026 at 07:59:05AM -0700, Keith Busch wrote:
> On Tue, Jan 27, 2026 at 08:59:06PM +0100, Roger Pau Monne wrote:
> > The call to nvme_free_sgls() in nvme_unmap_data() has the sg_list and s=
ge
> > parameters swapped.  This wasn't noticed by the compiler because both s=
hare
> > the same type.  On a Xen PV hardware domain, and possibly any other
> > architectures that takes that path, this leads to corruption of the NVMe
> > contents.

On Wed, Jan 28, 2026 at 09:49:58AM +0100, Christoph Hellwig wrote:
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>=20
> but maybe we can reword the subject to sound less harmless, e.g.:
>=20
> nvme-pci: DMA unmap the correct regions in nvme_free_sgls

On Wed, Jan 28, 2026 at 07:59:05AM -0700, Keith Busch wrote:
> Thanks, applied to nvme-6.19 with updated subject.

Hi,

I think this wants to be included in v6.18 too, as it also has the
faulty commit. And indeed, I do hit this issue when running 6.18.38.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--G/yGk+MB9HjdayeF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpWH1cACgkQ24/THMrX
1yyenAf9FWpkwva0hdfgfqEDIy6a/Hgllhx36/HeJWibLzeDbTJFYpwU8I+qDTRh
fFCn1CT9lYNxu4O0IFtCTBiktCI/J7aFuZXIvFak2viOU9Jc06fYF5q+dEgwnZm2
m/glL8tOsJDW9TCtxqzvn5Zvjb7eGZCqKZeQFQmlcDWgTsXLssyoTrYJBoK3EyKV
XqJooQme6+zH6s6S0ACyaBWq/5W6MmWsa6awJ2RlhDFOX3LgKjXY6TMAIXkCVjj5
VHOepitO3/fFqVu2QpICN89638kG9JCZsG53x/dUSVrtdpBVZhXVYkzMTT2ViDUu
P7FaNiGtA2F7sbx1kImZcp8q0pSQrA==
=7k8S
-----END PGP SIGNATURE-----

--G/yGk+MB9HjdayeF--

