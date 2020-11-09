Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EB2AB550
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22351.48635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4iR-00007j-1V; Mon, 09 Nov 2020 10:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22351.48635; Mon, 09 Nov 2020 10:48:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4iQ-00007F-U5; Mon, 09 Nov 2020 10:48:02 +0000
Received: by outflank-mailman (input) for mailman id 22351;
 Mon, 09 Nov 2020 10:48:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQmy=EP=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kc4iQ-000074-0T
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:48:02 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 173e2d7d-7bd5-4887-a9ae-09e503516baa;
 Mon, 09 Nov 2020 10:48:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-4D-q5n4QNqulbb6oiE2qdQ-1; Mon, 09 Nov 2020 05:47:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B2481074653;
 Mon,  9 Nov 2020 10:47:55 +0000 (UTC)
Received: from gondolin (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AF175125;
 Mon,  9 Nov 2020 10:47:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FQmy=EP=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
	id 1kc4iQ-000074-0T
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:48:02 +0000
X-Inumbo-ID: 173e2d7d-7bd5-4887-a9ae-09e503516baa
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 173e2d7d-7bd5-4887-a9ae-09e503516baa;
	Mon, 09 Nov 2020 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604918880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xhQO0ta8Zk7YojdbHZFj2vc+4a/lBAf0TXONvmSYBs=;
	b=Y57XVgQ30rv+NqboQG+U0Z76cL3+V5FWalC/3pedE5VdUg7KwlCtevkyksHjfJrelxxihS
	c1tfQC3NIzUHXZlwz8ZgmH2eSMed/qCH+Y9oGnJ3jsj+6iA2UWxiHf3wl2MJuAvSAL19pc
	EqPZrXejAGuTuO3eyXpJO3myRUbcFIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-4D-q5n4QNqulbb6oiE2qdQ-1; Mon, 09 Nov 2020 05:47:57 -0500
X-MC-Unique: 4D-q5n4QNqulbb6oiE2qdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B2481074653;
	Mon,  9 Nov 2020 10:47:55 +0000 (UTC)
Received: from gondolin (ovpn-113-28.ams2.redhat.com [10.36.113.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3AF175125;
	Mon,  9 Nov 2020 10:47:43 +0000 (UTC)
Date: Mon, 9 Nov 2020 11:47:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <rth@twiddle.net>, David Hildenbrand <david@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH 6/7] qom: Add FIELD_PTR, a type-safe wrapper for
 object_field_prop_ptr()
Message-ID: <20201109114740.19e727d9.cohuck@redhat.com>
In-Reply-To: <20201104172512.2381656-7-ehabkost@redhat.com>
References: <20201104172512.2381656-1-ehabkost@redhat.com>
	<20201104172512.2381656-7-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  4 Nov 2020 12:25:11 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Introduce a FIELD_PTR macro that will ensure the size of the area
> we are accessing has the correct size, and will return a pointer
> of the correct type.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/qom/field-property.h     | 21 ++++++++++-
>  backends/tpm/tpm_util.c          |  6 ++--
>  hw/block/xen-block.c             |  4 +--
>  hw/core/qdev-properties-system.c | 50 +++++++++++++-------------
>  hw/s390x/css.c                   |  4 +--
>  hw/s390x/s390-pci-bus.c          |  4 +--
>  hw/vfio/pci-quirks.c             |  4 +--
>  qom/field-property.c             |  3 +-
>  qom/property-types.c             | 60 +++++++++++++++++---------------
>  9 files changed, 89 insertions(+), 67 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


