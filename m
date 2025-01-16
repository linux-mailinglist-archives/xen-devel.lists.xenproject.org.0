Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C18A14463
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 23:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873822.1284782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYY4Z-00081d-VI; Thu, 16 Jan 2025 22:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873822.1284782; Thu, 16 Jan 2025 22:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYY4Z-0007zw-Sd; Thu, 16 Jan 2025 22:10:43 +0000
Received: by outflank-mailman (input) for mailman id 873822;
 Thu, 16 Jan 2025 22:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbEa=UI=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1tYY4Y-0007wG-VD
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 22:10:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b775f8be-d456-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 23:10:39 +0100 (CET)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-215--MrRq8HIO2CqLybNWlljYw-1; Thu,
 16 Jan 2025 17:10:34 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3C5AD1955DCC; Thu, 16 Jan 2025 22:10:32 +0000 (UTC)
Received: from localhost (unknown [10.2.16.180])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E5DEA195608A; Thu, 16 Jan 2025 22:10:28 +0000 (UTC)
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
X-Inumbo-ID: b775f8be-d456-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737065438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3w/7Xt83amm/l8+9d346Cvv8xvPaOw1+n1RLVeOI+Fc=;
	b=TwxCCDJJW+bhBrPwIob4yF5kNvfdOL8Rtq3ZhQGuS0OHnanAuEXdUL8DKFnXND7v68D1ac
	db4yDqnwQMg/T/OWsT8ijTu0w2Qw7xCuHzLyBHdB14L85SAjE6fxdIvqr9YPCyHulMWYll
	Me67wkngDYNaYKqoA2g3b/n6jVhkkTY=
X-MC-Unique: -MrRq8HIO2CqLybNWlljYw-1
X-Mimecast-MFC-AGG-ID: -MrRq8HIO2CqLybNWlljYw
Date: Thu, 16 Jan 2025 17:10:27 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>, xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PULL 0/8] Xen regression fixes and cleanups
Message-ID: <20250116221027.GA378432@fedora>
References: <20250116084332.1864967-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8HLMaDdlMH1p57ew"
Content-Disposition: inline
In-Reply-To: <20250116084332.1864967-1-dwmw2@infradead.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15


--8HLMaDdlMH1p57ew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.0 for any user-visible changes.

--8HLMaDdlMH1p57ew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmeJg9MACgkQnKSrs4Gr
c8i1bgf+MHoLNCA3PrVNq+8PBjcLbABt0e/iUMP1lMjdZbfbSuXOKnOXzkuuV4j/
B4VgoC3lPDm5BLF8YmliXE377/khnnh87uFifbar35rL/CZ/FQaMQ1+LSmqx5muk
B38lJR6aA16v/FmcOfQiIe3ucNcqVoxUGLMUD9maouS05t0EhSN3ZYEbwn8lU65O
8OoVoBRgKlBH+3KQf+x5pdKC8WkFm1rzhak5WfY2G7kghzspSYvTaz9z2TPfgobq
ejm6N8Nstls4VrqBOPUzcuJpOC5nDsx1DgabuTiGWkPwSZ1wccDNn+rfJkb85tEz
uO8oEL54Z5Ie9w4+tfuhOl7MdVcLiw==
=eYTV
-----END PGP SIGNATURE-----

--8HLMaDdlMH1p57ew--


