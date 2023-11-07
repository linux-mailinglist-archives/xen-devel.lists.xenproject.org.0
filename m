Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195B7E3364
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 04:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628548.980128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0CM8-0005dR-I7; Tue, 07 Nov 2023 03:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628548.980128; Tue, 07 Nov 2023 03:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0CM8-0005bl-DH; Tue, 07 Nov 2023 03:02:20 +0000
Received: by outflank-mailman (input) for mailman id 628548;
 Tue, 07 Nov 2023 03:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s63f=GU=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r0CM7-0005bf-9F
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 03:02:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0edd2ef0-7d1a-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 04:02:17 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-Pk4mdENMOXq5-CxBqCqMvw-1; Mon, 06 Nov 2023 22:02:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F70082193C;
 Tue,  7 Nov 2023 03:02:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5019F502B;
 Tue,  7 Nov 2023 03:01:59 +0000 (UTC)
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
X-Inumbo-ID: 0edd2ef0-7d1a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699326136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tz6O63wS9xvXe/DSKsh5Kh+EKEvdNpB8Byv3/EykdAg=;
	b=ad/Cj2wltYu0Zfs47eG/9mJ055WxpU93xrFGjRyEPd8u7DhPR6DlwLOyZw4mS8y1VVSOf9
	uNslVaxNA8hz3sP7ttKDuz3BrDI70Q24th8Y/NpzPn24yAGj62w8rFSEhoQIYN7qQb3Ncu
	p+hzAxc+e5sdlTjivInv8+V6fOJUBw4=
X-MC-Unique: Pk4mdENMOXq5-CxBqCqMvw-1
Date: Tue, 7 Nov 2023 11:01:58 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PULL 0/7] xenfv-stable queue
Message-ID: <20231107030158.GA952663@fedora>
References: <20231106103955.200867-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wp5z172Ctjx3Blgf"
Content-Disposition: inline
In-Reply-To: <20231106103955.200867-1-dwmw2@infradead.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5


--wp5z172Ctjx3Blgf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--wp5z172Ctjx3Blgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVJqKYACgkQnKSrs4Gr
c8gMmwf9GAB7eByH2P6TUvsHNM0P8Xl1xHhxPxDQ3frOBLumzDoLuebaCa2oVib4
T0tEdiG0loSkUc7+MT4y4gWe1+1L5baYwlw2hu4e+6l1lI9qTrvE4BZhn2Dd8Qzz
iJtMERsgLr7Xm1qAId88EC9/FxL4k1fWAaZ2cOzRxtRtJNwfHm8vzTpXryIfnsRz
B/FxIY/zGBpbww8qOA7kUeftb+XRa8O82jSdh/WyHFN0nO4HspLkmnTW3a/LSHUx
qrdweXdCLgmMJHuwqb2aQ3dWK6KKQQphfwSeAlIb+CfmT2aGdt5j1bFVlMDdFuic
aqhiL+Ibvu++zxPXLMagJrI+jY01oQ==
=u1Xn
-----END PGP SIGNATURE-----

--wp5z172Ctjx3Blgf--


