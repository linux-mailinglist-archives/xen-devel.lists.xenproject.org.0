Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D576E167DA
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 18:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2tk-0008F9-7q; Tue, 07 May 2019 16:24:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhYC=TH=gmail.com=ketuzsezr@srs-us1.protection.inumbo.net>)
 id 1hO2ti-0008F4-Un
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:24:55 +0000
X-Inumbo-ID: a4cc74d9-70e4-11e9-843c-bc764e045a96
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a4cc74d9-70e4-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 16:24:53 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id a132so10428923qkb.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2019 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=iSNw5fu9lUP2MWiBpedtYkAamwdAf22AYRSw8dqpkoc=;
 b=NjJFTWJEcuSDKym1wWes+8rSRjiyMTVCtxK8R5Yo70hBVhhVNbjv0BlB3Rut6LW1uu
 Q6yRVr5VRdkCzqk9GmwvDlCWz5aJ4Qefh/x4MN0IhPA4HlPJDu7aCPwMPt7kRHa1nkr+
 uVVXIlPD+/RdEOCt7liyHhfpFF8bktBid26Vu3cKq7M8HjlR1krFErkcBKRob/VY5W17
 dIUbAmHNyl7FuWZBqRN/Oo/6jphVJhjtEtk55S1/LJaQ4Mw2Fn75llrBnlElMA+lYZqt
 DgPJwxsJ+sbTlgzZdbEcGkB3Gd2r+Ij6CJO3Uyp5gQ6JKFuXZ1vg2tTapGlgPaLfrQev
 0wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=iSNw5fu9lUP2MWiBpedtYkAamwdAf22AYRSw8dqpkoc=;
 b=rYHeVdHyn2mmUPIrEphSe66lrILg7Vov8p3WLcuTME4GtIaZoKRBY1h8/SZd3CuADe
 wR3Au1zXvjm6kIQqFnK7wGKwUwJVAx2Y75j80hG0+bVLAgjaYMieFY6bHJ5uA6ed9VQJ
 Wi6ULzTbLEajbpuB7Fcq0aGBRhWpmJ6cJQ+fR8eQqlvOLbb0otgJgVICXz3gEyXq6YB1
 VrOdQ33s5615H+Dkuob0N1ajMMHu3CNX3kAq4Hx3hdklr9vmVNLFCUwW+GtnfYcIxIwX
 XbXPm+/RcvkNwli19eV/e7lOI5d1B/jRdyvZXruqOO5Dc9YwT7SKDASMuoODa7jbLI27
 agog==
X-Gm-Message-State: APjAAAVUuyKsOBUzAUTN7V5eXpZ5SAUFotsFPQ8J5qoF2L/FZAS9mYzx
 DPlvvMXWRbg82kfMhJW9zhA=
X-Google-Smtp-Source: APXvYqwhHr/1zzAbdilCsxzM93SPTG+zJd5uRO7jrTzHIUam6NUjs6kXmHnuXACDHAkgvN83jxUx5A==
X-Received: by 2002:a37:a394:: with SMTP id
 m142mr15434807qke.180.1557246292745; 
 Tue, 07 May 2019 09:24:52 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-36-129.s6527.c3-0.smr-cbr2.sbo-smr.ma.cable.rcncustomer.com.
 [209.6.36.129])
 by smtp.gmail.com with ESMTPSA id 7sm8892335qtx.20.2019.05.07.09.24.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 09:24:51 -0700 (PDT)
Date: Tue, 7 May 2019 12:24:47 -0400
From: Konrad Rzeszutek Wilk <konrad@kernel.org>
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <20190507162434.GA27798@localhost.localdomain>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Xen-devel] [GIT PULL] (swiotlb) stable/for-linus-5.2
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
Cc: konrad.wilk@oracle.com
Content-Type: multipart/mixed; boundary="===============2378694655181119826=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2378694655181119826==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please git pull the following branch:


git pull git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git stable/for-linus-5.2

which has cleanups in the swiotlb code and extra debugfs knobs to help with the field
diagnostics.

Thank you!

Christoph Hellwig (4):
      swiotlb-xen: make instances match their method names
      swiotlb-xen: use ->map_page to implement ->map_sg
      swiotlb-xen: simplify the DMA sync method implementations
      swiotlb-xen: ensure we have a single callsite for xen_dma_map_page

Dongli Zhang (2):
      swiotlb: dump used and total slots when swiotlb buffer is full
      swiotlb: save io_tlb_used to local variable before leaving critical section


 drivers/xen/swiotlb-xen.c | 196 ++++++++++++++--------------------------------
 kernel/dma/swiotlb.c      |   6 +-
 2 files changed, 64 insertions(+), 138 deletions(-)

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJc0bFJAAoJEFKlDoTx2wm/rjkQAIA42+eXI4nVD/i+qetJbNxF
XmUUNt+WjKuUTvlllQGfiqN5Za9+Qc5vQAPOxXsi6UYxsYkuJEiOMsOpGsMjF3rd
v7/i5SuDOdhLnVyoQZZOoIQ2sKmYmNXFVr0eT9Va/jVnphC+06EGdgQd+KTLYVTv
KZUpIvgXLo4zZGqTuYKtBE6CmT1DKfZlYd5wCz7Z410FLvbKItv/R5Jh00dzlEVy
YaukyLLJ9tKVqIvKDVbhj1l5rbh+BFuYTHriIl8/KVvPE6Z+Ku0Cz7chKAhB8RRS
BoQfRtqK02kEEryPK9yNAdpUhSWb6v6yw8kXdabs+Bz1OTE7XrmFdk0aVVcWmoPz
Dv4lHrO0Lp6OriOkJY2IlTGaiBGQo3Qq1/31gDkazMoBBBHcUidTOy8AO3tr3QuE
uljmtKCzDSd61rhUFKnGzkZNaQ2QnMUjUZylUFq6CbIwaoRagUPJBUpqeKz1emJy
SY+38LNdtaTwPc5FVirtoz0sa2eG56L+wX8XGR5ATvqIk+ACR3/VANMW6kLR2DG5
Lj3fiUzOl8X5fksC6SaAu3/NCWw/HsSzh1i7qVxiXKgZHHY+Z9NqAOWQAqFXx4ob
RxAUVe2jxnDzErRpO5+52a8B+px5b1ijInXBaK9uAH/s3RywU9xT/LK9lFvtxBl1
e7TDyyIMZyXvhmBhnv2O
=wKk8
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--


--===============2378694655181119826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2378694655181119826==--

