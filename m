Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF942D96B1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52123.91213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolXU-0006DG-UT; Mon, 14 Dec 2020 10:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52123.91213; Mon, 14 Dec 2020 10:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolXU-0006Cq-R3; Mon, 14 Dec 2020 10:57:12 +0000
Received: by outflank-mailman (input) for mailman id 52123;
 Mon, 14 Dec 2020 10:57:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiKs=FS=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kolXT-0006Cd-FC
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:57:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 90338825-5843-47a3-97aa-cbf92c8ef737;
 Mon, 14 Dec 2020 10:57:09 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-0FiotJxVMLufwGePF1JPOQ-1; Mon, 14 Dec 2020 05:57:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57EC818C89C4;
 Mon, 14 Dec 2020 10:57:05 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71D1671C94;
 Mon, 14 Dec 2020 10:56:49 +0000 (UTC)
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
X-Inumbo-ID: 90338825-5843-47a3-97aa-cbf92c8ef737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607943429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihKJQubl2WVLBfE3VRV687ZDrqvVtE5WofmHPnkT1gY=;
	b=btSuYfTF4wTpftgYXh/YNlCyco5d5MX283/MGnPIT9aj1ZEFX9ILEKAqi9+Oto9qCpJ09a
	WGFlTyicsYEYCRu8WnZ3XfqwUlRWHo/UnPjkMAohoxYbEkRZdZHphCNgt4RAlROns8naK1
	7ohlZMqnxZKquzD2pVLxTFPf0rMKUNU=
X-MC-Unique: 0FiotJxVMLufwGePF1JPOQ-1
Date: Mon, 14 Dec 2020 11:56:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, "Daniel
 P. Berrange" <berrange@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@redhat.com>, John Snow <jsnow@redhat.com>, Kevin
 Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Max Reitz
 <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 30/32] qdev: Rename qdev_get_prop_ptr() to
 object_field_prop_ptr()
Message-ID: <20201214115646.42998a6e.cohuck@redhat.com>
In-Reply-To: <20201211220529.2290218-31-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
	<20201211220529.2290218-31-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 17:05:27 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The function will be moved to common QOM code, as it is not
> specific to TYPE_DEVICE anymore.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Rename to object_field_prop_ptr() instead of object_static_prop_ptr()
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
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/hw/qdev-properties.h     |  2 +-
>  backends/tpm/tpm_util.c          |  6 ++--
>  hw/block/xen-block.c             |  4 +--
>  hw/core/qdev-properties-system.c | 50 +++++++++++++-------------
>  hw/core/qdev-properties.c        | 60 ++++++++++++++++----------------
>  hw/s390x/css.c                   |  4 +--
>  hw/s390x/s390-pci-bus.c          |  4 +--
>  hw/vfio/pci-quirks.c             |  4 +--
>  8 files changed, 67 insertions(+), 67 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


