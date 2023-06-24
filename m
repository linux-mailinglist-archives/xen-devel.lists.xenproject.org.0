Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B573CB07
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 15:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554576.865842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD3Gz-0002oD-8p; Sat, 24 Jun 2023 13:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554576.865842; Sat, 24 Jun 2023 13:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD3Gz-0002lQ-64; Sat, 24 Jun 2023 13:25:53 +0000
Received: by outflank-mailman (input) for mailman id 554576;
 Sat, 24 Jun 2023 13:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdeE=CM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qD3Gx-0002lI-0b
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 13:25:51 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0666eba-1292-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 15:25:47 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B774B5C00C7
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 09:25:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 24 Jun 2023 09:25:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 09:25:44 -0400 (EDT)
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
X-Inumbo-ID: a0666eba-1292-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687613145; x=1687699545; bh=kQ
	X8yLjTccw2AZEGYbcqPTuV979FZSJJ3OWM0j5r/lI=; b=X2cXithaTJAFlwFOzh
	D6P9BD0PJFxk+HxJ5YaBZ/T74snayOtxApcygddXqKh9og6svkH69YpMg74hRGEf
	6azarwyA11FyvgHeYDR9pa+m55MbqK7Lx6h9Rp6r9zfkMUGNRp+4C1e5J1Yl7s50
	u+x04jmm7z/LXKNoGXzdgpXNYiZXwjYBW7xHuw9/Hn7X4UWqiahtHy24qDgJXMKw
	jgkVwIZH6ZwCa6UkfcwfIu8dOm1MdduyKGLACppMxhyW1z/kmkANRieqXl7+fudZ
	pxb3IxnhyBnOQ+pv9oTta4ClGv/be9jjCnebxuS5XPKB+tsPkP5Ep7AQGp9NKTjg
	7mJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687613145; x=1687699545; bh=kQX8yLjTccw2AZEGYbcqPTuV979FZSJJ3OW
	M0j5r/lI=; b=PYetgrsDmr+F2dM55D8zRCrDUhM5vcW8BWYKqX8eB9+aCw6bDen
	AT6MiguHyxsKa6bBO1ean1qvCZENgO5eh78ovkEHG10HjnaA7q48R3TRS2bmazX0
	Jsbdtsn9BodaH3wdiUcG785bv8QPfm0F/5HQH3wawUF5JqkY8nJ3sIBP7rNn3ig6
	uJfgPSOHGGR9sN/BL7J5y83tv3mOZC5I8WjiqDZdOXm+8hP1uMqzI5mBTYTmna4/
	DnSq1sTclvlm1v6x1VBamagUzUWbfBxm6mrlp5IKn6ajy8swnCdu0ngbTA4KeGpP
	GyoHu+sUPvyQ5fyVqYr/si/8xTFOcE5QN8g==
X-ME-Sender: <xms:2e6WZOZ-g1w8B8XwP8tPV1yhDfBsm4ZbmeAhv8Bqm6-BnIKJymWOPA>
    <xme:2e6WZBbI_T_vBYwmjld7_cV9NsdYU01KKYwWy3E1EZaJoVDy6zvSHdAtWhQmFsuZi
    TNSG-92PDv9XA>
X-ME-Received: <xmr:2e6WZI9NesBfLKKuy7XPiLgpaPNW95th0D1NT1ZsBQTTbQLapB6SqPOJVPSq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegjedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:2e6WZArseJyRZVYNNcqFMVEhTDyvlzlqXJJ_YCaZ9TsgQkKif5xbfw>
    <xmx:2e6WZJpACcWe6XJPp5w0hzQjA-uOf27WGUo7boK2yEl6Q-NfEh7UWQ>
    <xmx:2e6WZOR52c9D9dutHKplyiCnhbc3DNOLT1na1TvYN9hs8r-LgyD7pg>
    <xmx:2e6WZG2gUlYzjc50v8qz1cqVfNJe_BQYlWuZf2afqjxQygtpIgpoLg>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 24 Jun 2023 15:25:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session notes: Committers workflow: move to Gitlab
Message-ID: <ZJbu1iIDVTqqnwNa@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BDNRKQAo++Xe7qV/"
Content-Disposition: inline


--BDNRKQAo++Xe7qV/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Jun 2023 15:25:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session notes: Committers workflow: move to Gitlab

Stefano: 2min summary: gitlab as CI infrastucture, not as code hosting, tic=
kets etc;
  we have several improvements for gitlab CI, including tests on hw
  there are a bunch of build jobs, and also some run tests, most on qemu, b=
ut some on hw
  I'd like to give commiters and other notable community members a way to t=
rigger a pipeline - it's as easy as git push to your repository
Julien: everyone can push, how it's prioritized?
Stefano: unfortunately we don't have prioritized, but increasing capacity i=
s easy
  everyone can have a personal repo on gitlab
  but also: it would be nice to gate push to staging by gitlab pipeline
Marek: isn't the purpose of staging to be a pre-test master copy?
George: staging is fast-forward branch, cannot be rewind
Stefano: goal is to not allow bad commits even in staging
  committers would push to somewhere on gitlab and that only then it would =
go to staging on xenbits
  later: use merge request workflow:
  1. push to personal branch, open MR (git push -o ...)
  2. if pipeline passes, it can be merged to staging fast-forward
  3.=20

Julien: maybe let osstest pull from gitlab?
Stefano: staging on xenbits is useful for legacy reasons
Marek: I have a script to push and pull stuff around in reaction to webhooks
Andrew: there is also stuff on github - FreeBSD testing, coverity testing, =
codeql code analyzer; generally github actions are nice
  it would be good to collect that state into common place (gitlab) too
Bertrand: can osstest be trigerred from gitlab?
George: the goal is to slowly move out of osstest into gitlab
Jan: I'm concerned about few things, for example conflicting merge requests
Bertrand: auto-rebase bot?
Julien: may introduce issues
Stefano: adding more capacity also reduces risk of such conflicts (smaller =
time window);
  two MR options:
  - merge commit
  - cherry-pick (rebase?)
Juline: when Jan is pushing, I'd like to know that when I'm pushing, to pot=
entially adjust
George: maybe another bot that watches for MRs and see if they conflict to =
notify early (while pipeline is still running)?
Stefano: this can be another gitlab job
  and also, we can have a fast-fail job - if it fails, it stops the whole p=
ipeline (earlier notifications, save resources)
Andrew: there are some non-deterministic errors, but also, there is a lot o=
f noise (error messages that are harmless, basically bugs in the test)
Jan: to recap: first push to gitlab staging, then osstest, and only then to=
 master; this increases delay
Andrew: security team must have a way to bypass public CI loop, but do test=
ing in private first (private gitlab pipelines)
  but also, maintainers of runners implicitly will have access to that - th=
is needs to be documented - like require them to be on pre-disclosure list
Jan: what about stable trees?
Stefano: most are okay with gitlab
Andrew: no, recent container change broke all stable trees :/
Stefano: we need George to cleanup permissions on gitlab - a lot of "Owner"s
Marek: what about removing osstests already covered by gitlab?
Andrew: that's stage 2


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BDNRKQAo++Xe7qV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSW7tYACgkQ24/THMrX
1yzHqwf/TzbW+bc1f8o9UJtAVoKYtnl39zXGiM6H1B1vd+CJ7JGY7QMInD7CbO6g
QryKmLViXMlYPQun9KBBVcpW8lp0psfBsXJ/nG+2/rrEu3xzHuOwtlHxEdkoufXT
L81aYL5NgpVbwvv4w2WWpbj7tnIONKnluExDuhY8jp7yV069xJrJgwc8nJLhvQC9
mKUMp1m+da8RIcLnsu34Y3PTBaktZKMiJI1C3I26JE+3wQ6bt3cpKv8nWxgH6RGy
+EQ0zlQsrXDvWXjiZzTm+2tFVcti2xrTzGbyjDfQm07G45JZt+IwPTvbMZ5LHWiM
EvhG+F0zFaduiCMiQFBdZMI6y16pZQ==
=xucd
-----END PGP SIGNATURE-----

--BDNRKQAo++Xe7qV/--

