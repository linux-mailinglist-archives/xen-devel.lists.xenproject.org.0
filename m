Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88589AB24FA
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 20:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980704.1367310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDp4l-0000r5-1a; Sat, 10 May 2025 18:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980704.1367310; Sat, 10 May 2025 18:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDp4k-0000pc-Uz; Sat, 10 May 2025 18:37:30 +0000
Received: by outflank-mailman (input) for mailman id 980704;
 Sat, 10 May 2025 18:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pzd=X2=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1uDp4k-0000pW-9F
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 18:37:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d18f1a14-2dcd-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 20:37:28 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-RsyE8OITNZmsNK-Eh3G34g-1; Sat,
 10 May 2025 14:37:23 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E7B83180035E; Sat, 10 May 2025 18:37:20 +0000 (UTC)
Received: from localhost (unknown [10.2.16.39])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D9D9F19560B0; Sat, 10 May 2025 18:37:19 +0000 (UTC)
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
X-Inumbo-ID: d18f1a14-2dcd-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746902245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwFEh6TeQ/8H51vJTIhIozvJpz7tQ/a2+PVeDJq/CUE=;
	b=EuQ8k/Grf/wlVdNrFxAk3n3XD8EyLxd6owovfgcJlXKQpBiRHbP8/XdAkXWe5o3FT4QjeS
	sAaf6RJGMQrA1TUuG2xmiOy70ilOum+JiaRqd/FbqitjG/FtGxxznEPxfVTzS94l27l7WY
	aUYW5wVN0U99CNVTF0LgCuHLnXHo/PQ=
X-MC-Unique: RsyE8OITNZmsNK-Eh3G34g-1
X-Mimecast-MFC-AGG-ID: RsyE8OITNZmsNK-Eh3G34g_1746902241
Date: Sat, 10 May 2025 14:35:30 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, sstabellini@kernel.org,
	anthony@xenproject.org, paul@xen.org, alex.pentagrid@gmail.com,
	peter.maydell@linaro.org, edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PULL v1 0/2] xen: mapcache: Fixes
Message-ID: <20250510183530.GA116869@fedora>
References: <20250506182647.302961-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/i3kukPHmWcJP39C"
Content-Disposition: inline
In-Reply-To: <20250506182647.302961-1-edgar.iglesias@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


--/i3kukPHmWcJP39C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.1 for any user-visible changes.

--/i3kukPHmWcJP39C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmgfnHEACgkQnKSrs4Gr
c8j8tggAvnRrQweJgUw6K7reSq12P9b9XzUcjumibOgBBolATBPlplHyEtE9ACvB
NRsd6Bs/yfcCpKc8elPDC0jhrWC/Ii9d/a7xOLpSJpb4X6Jvmvl2LIC2IYmbMQ7x
zJGZuKSQ39p8RqpHQbS8Lc7vM83susWIiV6o6N0ErjvCUbQ/0h5iCCd4t0GPszWE
tT/7YXlCnpdR/S4e7E9W51+JKdD+r+rgFayQjvZb+oJZaMkB3u6laSeGkbicsWh4
JgDmRN6jagWI03mSTK111WVYR40uXtKVxEKCHxCMQzE3YLzGvFcS567KLMuRLfIQ
oWxSrz3tDIpJLDUdKz31VOHzLm6y/Q==
=+iw6
-----END PGP SIGNATURE-----

--/i3kukPHmWcJP39C--


