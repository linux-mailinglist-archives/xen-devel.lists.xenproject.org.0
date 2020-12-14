Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B12D9689
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52108.91177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolN8-0004xP-Cc; Mon, 14 Dec 2020 10:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52108.91177; Mon, 14 Dec 2020 10:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolN8-0004x0-96; Mon, 14 Dec 2020 10:46:30 +0000
Received: by outflank-mailman (input) for mailman id 52108;
 Mon, 14 Dec 2020 10:46:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiKs=FS=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kolN6-0004wv-Td
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:46:28 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fa86bfc6-a847-453f-a7bb-a02a2ff208fa;
 Mon, 14 Dec 2020 10:46:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-xWMsxTH2P-Cw0hCX1-vmVw-1; Mon, 14 Dec 2020 05:46:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45CE180A092;
 Mon, 14 Dec 2020 10:46:23 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492F036FA;
 Mon, 14 Dec 2020 10:46:08 +0000 (UTC)
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
X-Inumbo-ID: fa86bfc6-a847-453f-a7bb-a02a2ff208fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607942787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0weGPvVnxCMZMQQMsPnBuU6LsncWqvHjw8ElN8KahE=;
	b=Lefayf+Qulq87N6AYyRox0UY/h0M5cd/f8evMWuCyg//RVJWNTO1DkqulDg8LevRDL5nLq
	bH+OZEA91kIL3Ndw1o9LOKSFJzEGkOifHZFWAnp/UTMkCs5yeVXcYIG4WG6n8TObIuEdb1
	jlCVHGSP0l8TUKibeGXtxgwFZRawUZ0=
X-MC-Unique: xWMsxTH2P-Cw0hCX1-vmVw-1
Date: Mon, 14 Dec 2020 11:46:04 +0100
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
 <alex.williamson@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 23/32] qdev: Move dev->realized check to
 qdev_property_set()
Message-ID: <20201214114604.2b439baf.cohuck@redhat.com>
In-Reply-To: <20201211220529.2290218-24-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
	<20201211220529.2290218-24-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 17:05:20 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Every single qdev property setter function manually checks
> dev->realized.  We can just check dev->realized inside
> qdev_property_set() instead.
>=20
> The check is being added as a separate function
> (qdev_prop_allow_set()) because it will become a callback later.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Removed unused variable at xen_block_set_vdev()
> * Redone patch after changes in the previous patches in the
>   series
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
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  backends/tpm/tpm_util.c          |   6 --
>  hw/block/xen-block.c             |   6 --
>  hw/core/qdev-properties-system.c |  70 ----------------------
>  hw/core/qdev-properties.c        | 100 ++++++-------------------------
>  hw/s390x/css.c                   |   6 --
>  hw/s390x/s390-pci-bus.c          |   6 --
>  hw/vfio/pci-quirks.c             |   6 --
>  target/sparc/cpu.c               |   6 --
>  8 files changed, 18 insertions(+), 188 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


