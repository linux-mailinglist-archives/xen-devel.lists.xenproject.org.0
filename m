Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380D7195BD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542332.846058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4do0-0006cz-5E; Thu, 01 Jun 2023 08:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542332.846058; Thu, 01 Jun 2023 08:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4do0-0006aW-2c; Thu, 01 Jun 2023 08:37:12 +0000
Received: by outflank-mailman (input) for mailman id 542332;
 Thu, 01 Jun 2023 08:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AK53=BV=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1q4dny-0006aQ-Aj
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:37:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da93e36-0057-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 10:37:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-USG_RcDKNOSC-JcN7c_PZQ-1; Thu, 01 Jun 2023 04:37:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63C7B801585;
 Thu,  1 Jun 2023 08:37:00 +0000 (UTC)
Received: from redhat.com (unknown [10.45.226.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEDAD140E962;
 Thu,  1 Jun 2023 08:36:57 +0000 (UTC)
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
X-Inumbo-ID: 7da93e36-0057-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685608626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=llzAElU+/coIQeoN7wL9nawVE/68O7gV+uWIErknun0=;
	b=Y25F9F5e1xUT/yCzoOVojwqfrEvNV8vg+dSbvGLtPtrru1iLQHL/hMmhKITw/mGuUi4uiW
	tDPpZ8Iy+1SQX0W4fHpbSKsQSFpNslvrKBOPUZwXBgHcPfTBPaN4YoT4auvqG5tYiG4ftc
	p3H+Iip8Wvj05R2901JWm7cGhKGik3U=
X-MC-Unique: USG_RcDKNOSC-JcN7c_PZQ-1
Date: Thu, 1 Jun 2023 10:36:56 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, eblake@redhat.com,
	Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
	sgarzare@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, Julia Suvorova <jusual@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/6] block: add blk_io_plug_call() API
Message-ID: <ZHhYqDp5AUBBemcn@redhat.com>
References: <20230530180959.1108766-1-stefanha@redhat.com>
 <20230531195042.GA1509371@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VwdRIpMbxphm9SWD"
Content-Disposition: inline
In-Reply-To: <20230531195042.GA1509371@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7


--VwdRIpMbxphm9SWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 31.05.2023 um 21:50 hat Stefan Hajnoczi geschrieben:
> Hi Kevin,
> Do you want to review the thread-local blk_io_plug() patch series or
> should I merge it?

I haven't reviewed it in detail, but on the high level it looks good to
me, and you already got reviews for the details.

Acked-by: Kevin Wolf <kwolf@redhat.com>

--VwdRIpMbxphm9SWD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmR4WKgACgkQfwmycsiP
L9bLuw/+JrEF/mSl3V9dn1UGqfl63d7JZc7Zt4RQ0VZa/Pto1DcA3itsLomClVXx
pzskkdFGt/GsSibCl642QP6fWYKvg5G8JVpelmR9qNHfpwjdyRhSmtTqgfkdONX7
UlyOmlQDEs7eSHYbz6lZPbTE0AVgGzncSxJmr4jyw71nR3qEvf3uilnt5542Z1KH
sDwHJat+LGEAebFW6H2DHskP5KfzohCvmB1ojAfZuRawdYEqEyxJPRyDwjl8kWbZ
yuq5SDvlYNPx3D1q03vnKWNoZztm/JQNiaEknTsOYLIM1Qa35RnKguZBglefTO48
NDKUBl7Ti9JgLB8kNqkS3rAHxF73U0lZJjYDE0zwZD83npI3VF5hvvdKbW0RKym5
XzDdVKu6YOTnjBmgDAk7p52yPXFopnx72u7B73XjTii8SZuiJkxi0hZYI44Z4Nkx
B0Dcf+2i1bWtCYW5qJMmpzpY3s+atj6MyGqrhcNLa4pDk0tcQl4rk8frnJHYRrfq
9Ge+4JGEpnb0lWB5OJTCVB1dsfC0StGcs3ahh21fd6XO2oogakibE9G+jUL+UEWZ
+X58VyDIhrXXXMS+CI6iiWp/LTMDTH2Bcy+RQ7Wb+nQ43m2mFCBLd+vYGvPt2xSS
cPFq7gxgfbLmzbLc4A71lljCn9NydX8sCpXClRQ5C8TzAzbUnX4=
=NFLD
-----END PGP SIGNATURE-----

--VwdRIpMbxphm9SWD--


