Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081C62AB53F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22345.48622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4fn-0008O5-JL; Mon, 09 Nov 2020 10:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22345.48622; Mon, 09 Nov 2020 10:45:19 +0000
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
	id 1kc4fn-0008Ng-GH; Mon, 09 Nov 2020 10:45:19 +0000
Received: by outflank-mailman (input) for mailman id 22345;
 Mon, 09 Nov 2020 10:45:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQmy=EP=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kc4fm-0008Nb-2Y
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:45:18 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 740bdb85-0db7-485f-bd18-b02b4fd1cc68;
 Mon, 09 Nov 2020 10:45:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-bZouaZUZO4upuVnTmkfAdA-1; Mon, 09 Nov 2020 05:45:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25E2186840C;
 Mon,  9 Nov 2020 10:45:11 +0000 (UTC)
Received: from gondolin (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D14D075125;
 Mon,  9 Nov 2020 10:44:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FQmy=EP=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
	id 1kc4fm-0008Nb-2Y
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:45:18 +0000
X-Inumbo-ID: 740bdb85-0db7-485f-bd18-b02b4fd1cc68
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 740bdb85-0db7-485f-bd18-b02b4fd1cc68;
	Mon, 09 Nov 2020 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604918717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvovXvGi96RLS5Xlxa3vEz79xbJKjbaUI17fwHflXc8=;
	b=XbsA+exQ94ZZYCdC/P/uCt2BeIesqg78v3cNrf70OAAc/ogSrJ7z5HCo8lmXw35X1qtW0c
	qZmBqKltzxrajZ5nVjfbHTN0ubdlMK7/p1W3KfIIY5qOgKtDp5SIQ32d8zmJkjbcXwSnjz
	tTy+ZUjt4pScsVB7l48JrdJ26640gD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-bZouaZUZO4upuVnTmkfAdA-1; Mon, 09 Nov 2020 05:45:13 -0500
X-MC-Unique: bZouaZUZO4upuVnTmkfAdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25E2186840C;
	Mon,  9 Nov 2020 10:45:11 +0000 (UTC)
Received: from gondolin (ovpn-113-28.ams2.redhat.com [10.36.113.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D14D075125;
	Mon,  9 Nov 2020 10:44:57 +0000 (UTC)
Date: Mon, 9 Nov 2020 11:44:55 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 4/7] qom: Replace void* parameter with Property* on
 field getters/setters
Message-ID: <20201109114455.2eb0fabd.cohuck@redhat.com>
In-Reply-To: <20201104172512.2381656-5-ehabkost@redhat.com>
References: <20201104172512.2381656-1-ehabkost@redhat.com>
	<20201104172512.2381656-5-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  4 Nov 2020 12:25:09 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> All field property getters and setters must interpret the fourth
> argument as Property*.  Change the function signature of field
> property getters and setters to indicate that.
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
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/qom/field-property-internal.h |   8 +-
>  include/qom/field-property.h          |  26 ++++---
>  backends/tpm/tpm_util.c               |  11 ++-
>  hw/block/xen-block.c                  |   6 +-
>  hw/core/qdev-properties-system.c      |  86 +++++++++-------------
>  hw/s390x/css.c                        |   6 +-
>  hw/s390x/s390-pci-bus.c               |   6 +-
>  hw/vfio/pci-quirks.c                  |  10 +--
>  qom/property-types.c                  | 102 +++++++++-----------------
>  target/sparc/cpu.c                    |   4 +-
>  10 files changed, 105 insertions(+), 160 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


