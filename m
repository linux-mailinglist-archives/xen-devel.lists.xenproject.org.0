Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE87E403F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 14:41:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628816.980666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0MK6-00085r-Sc; Tue, 07 Nov 2023 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628816.980666; Tue, 07 Nov 2023 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0MK6-000837-Pb; Tue, 07 Nov 2023 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 628816;
 Tue, 07 Nov 2023 13:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s63f=GU=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r0MK5-00082g-Er
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 13:40:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42bbfaa1-7d73-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 14:40:50 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-OXJe754lPCaTuJ2nvsmUSQ-1; Tue, 07 Nov 2023 08:40:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 381BD8556E9;
 Tue,  7 Nov 2023 13:40:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46AA72026D66;
 Tue,  7 Nov 2023 13:40:42 +0000 (UTC)
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
X-Inumbo-ID: 42bbfaa1-7d73-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699364448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NHuO1OojHY7F9rWwEFTdZTm7zhHRCPLRzfq8vCij62c=;
	b=ioWZukLsTXjaQSOi+Pw08zZybXD3IMgIdw88LWyqWih3lGA4bvR3NiXKte1fagOEmkKpdB
	aRu+0w7Yp+05fL8ctrTlXbWgDlCNiZJ74KzQcxCkCiDIjdvQzNe263xScTQekcbtYUGQYL
	yytpxwJc0wflOA7rlBlKrdQ82WwPugE=
X-MC-Unique: OXJe754lPCaTuJ2nvsmUSQ-1
Date: Tue, 7 Nov 2023 21:40:40 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PULL 00/15] xenfv.for-upstream queue
Message-ID: <20231107134040.GA1010741@fedora>
References: <20231107092149.404842-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GSuJ/hBc0Lx51aih"
Content-Disposition: inline
In-Reply-To: <20231107092149.404842-1-dwmw2@infradead.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4


--GSuJ/hBc0Lx51aih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--GSuJ/hBc0Lx51aih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVKPlgACgkQnKSrs4Gr
c8go6QgAldelY+trwwwNMAllr73WkdwjqbENy+zeBaBa2FAdn9YSw3bke+1Xwo/M
i5mzyJahOWqCBm6B8JS3r7ERxhaln3x4jVxxkSBCcLKLh31WAaaPFRLb0WVr6Wqe
hWQ7dTmOu7V/J2xmpi+FTB4AP4ng5259uWKqsZgsfJvPU+tOsKxscm7ERerOO21A
IoH+7v+IK8uhN94hWcOXcsJlRY8HxMmigsDRTGjex/NuWuQkOW+iMJqhgyANnr+e
h1FMvC18NFzynfvr3Gd750fTps7SLhf0eDQUNpIZvPX6P1Trz9KD9DTQcJ9QZpra
V3L/gTy+FrrDaEEFB8KGtSwyYqSicg==
=TuL5
-----END PGP SIGNATURE-----

--GSuJ/hBc0Lx51aih--


