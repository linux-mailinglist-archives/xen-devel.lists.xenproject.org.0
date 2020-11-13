Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B12B19FE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 12:24:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26390.54715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdXBh-0000D0-HJ; Fri, 13 Nov 2020 11:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26390.54715; Fri, 13 Nov 2020 11:24:17 +0000
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
	id 1kdXBh-0000Cd-DA; Fri, 13 Nov 2020 11:24:17 +0000
Received: by outflank-mailman (input) for mailman id 26390;
 Fri, 13 Nov 2020 11:24:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DL5=ET=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kdXBf-0000CX-TC
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:24:16 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aebf0d58-04c0-4030-87a6-f9a2267f90b0;
 Fri, 13 Nov 2020 11:24:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-_EGJdfxvP22jC5B0pSvw3w-1; Fri, 13 Nov 2020 06:24:10 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9515F9D1;
 Fri, 13 Nov 2020 11:24:08 +0000 (UTC)
Received: from gondolin (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A47C15B4B0;
 Fri, 13 Nov 2020 11:23:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+DL5=ET=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
	id 1kdXBf-0000CX-TC
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:24:16 +0000
X-Inumbo-ID: aebf0d58-04c0-4030-87a6-f9a2267f90b0
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id aebf0d58-04c0-4030-87a6-f9a2267f90b0;
	Fri, 13 Nov 2020 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605266654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8n4tiXp+8mrteg2gUVfjQLr91gUwx8183hlKQTpBrkk=;
	b=d+fPLQPeO0NAYE81+Dqs4gYOtDCNBCCBbtXIGZC9ISS9YBuTcrvI0VoDPiBUakCihPU5th
	w4uDsSHH6Q8DmhAj34ZoyUGyhIJby/1A2wFHvcRRVAgwtswsmHK1kHc19VWaM5k/JuJuIx
	vL9XVFZcG7KxnBdoLyOrW3JOKAgk3jQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-_EGJdfxvP22jC5B0pSvw3w-1; Fri, 13 Nov 2020 06:24:10 -0500
X-MC-Unique: _EGJdfxvP22jC5B0pSvw3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9515F9D1;
	Fri, 13 Nov 2020 11:24:08 +0000 (UTC)
Received: from gondolin (ovpn-113-133.ams2.redhat.com [10.36.113.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A47C15B4B0;
	Fri, 13 Nov 2020 11:23:54 +0000 (UTC)
Date: Fri, 13 Nov 2020 12:23:51 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Eric
 Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Stefan Berger
 <stefanb@linux.ibm.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Max Reitz
 <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, Richard Henderson
 <rth@twiddle.net>, David Hildenbrand <david@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v3 09/53] qdev: Make qdev_get_prop_ptr() get Object* arg
Message-ID: <20201113122351.583f53a2.cohuck@redhat.com>
In-Reply-To: <20201112214350.872250-10-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
	<20201112214350.872250-10-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2020 16:43:06 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Make the code more generic and not specific to TYPE_DEVICE.
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> - Fix build error with CONFIG_XEN
>   I took the liberty of keeping the Reviewed-by line from
>   Marc-Andr=C3=A9 as the build fix is a trivial one line change
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
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/hw/qdev-properties.h     |  2 +-
>  backends/tpm/tpm_util.c          |  8 ++--
>  hw/block/xen-block.c             |  5 +-
>  hw/core/qdev-properties-system.c | 57 +++++++++-------------
>  hw/core/qdev-properties.c        | 82 +++++++++++++-------------------
>  hw/s390x/css.c                   |  5 +-
>  hw/s390x/s390-pci-bus.c          |  4 +-
>  hw/vfio/pci-quirks.c             |  5 +-
>  8 files changed, 68 insertions(+), 100 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com> #s390 parts


