Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64C1F1A25
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:33:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHtu-0005GC-3b; Mon, 08 Jun 2020 13:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqEd=7V=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jiHts-0005G3-Bh
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:33:16 +0000
X-Inumbo-ID: 9b66b9b8-a98c-11ea-9ad7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9b66b9b8-a98c-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591623195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jy3UQ9TwolgMzcs+mF+EHL8I0EaYgGjLeRsKkZIF4Go=;
 b=N+yLZ3SAEYwHAyJmH0FzT/y2iw9iAWyLs2E+QpZTDMGkZdM1by10kLkWHUUvOx5D6EcbrF
 9Z9xevBV+AURdRJlXNqyjv0mNIuqux7rx5wa/QnI1FSAq++Kt7AIt5cMPO+GoyKwGhBEjR
 4GfDMNw9h+h0tqvx2POaWYZPvQel5EU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-53gGRSa8PY2WRD-1hdezfQ-1; Mon, 08 Jun 2020 09:33:11 -0400
X-MC-Unique: 53gGRSa8PY2WRD-1hdezfQ-1
Received: by mail-wr1-f72.google.com with SMTP id r5so7176715wrt.9
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 06:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jy3UQ9TwolgMzcs+mF+EHL8I0EaYgGjLeRsKkZIF4Go=;
 b=HB1If90sv/+Hu4urfyULs6KJgkVRQjX/v4riFiwrJt8RYFGB9OdmATTr16+yAPjDMv
 IxchYWJZUg8atvgphBodCkF5twUaqDotzr6x1LubN0qlaTgSFXcWYA6R+K0+UFd1RKGr
 44Ft7RornKcIJV9IZBp98+tD8gZCMrAleQralwSA21Ib/2APtruSAWa1yoNPOEQ191p2
 yioOjxqaFO08Y8snCiTmRumKtv83ftcuwFos6q9XRVza+BRs5tENSB0XV8s+3AjNMqp/
 d271rtiTx2zmJlyP4GT+uFbzBAv417/lSJerNFAvrwSUuubffbXcXdCaAjJR3fWWRDRF
 cMGQ==
X-Gm-Message-State: AOAM533z/AJPhGle/ZZUeEAaVwL43QPBzttC98GtoJMEzZH8cqhinYVx
 zo62Eez/gMLQPxl1tiuhkb2kD8dhVq+JBl2hChxj3Z3INtkOQGi2s4zKpCUDGcfHX2f/TvfL7CZ
 enS3yJm2dGrNrOz3G/AzrFFPF2uQ=
X-Received: by 2002:a7b:c18a:: with SMTP id y10mr17443025wmi.73.1591623190857; 
 Mon, 08 Jun 2020 06:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9bnbokhnVLN46q9sCb6V6ovAK9n5BS2Myq9eEvkQEpQdDlMBW6QLuyUv0QuXRGF4o3ryjhA==
X-Received: by 2002:a7b:c18a:: with SMTP id y10mr17443008wmi.73.1591623190701; 
 Mon, 08 Jun 2020 06:33:10 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 88sm25269941wre.45.2020.06.08.06.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:33:10 -0700 (PDT)
Date: Mon, 8 Jun 2020 09:33:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 4/4] microvm: move virtio base to 0xfeb00000
Message-ID: <20200608093247-mutt-send-email-mst@kernel.org>
References: <20200529073957.8018-1-kraxel@redhat.com>
 <20200529073957.8018-5-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529073957.8018-5-kraxel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org, imammedo@redhat.com,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 09:39:57AM +0200, Gerd Hoffmann wrote:
> Place virtio-mmio devices near the other mmio regions,
> next ioapic is at @ 0xfec00000.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/microvm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index ba68d1f22bb3..fd34b78e0d2a 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -26,7 +26,7 @@
>  #include "hw/i386/x86.h"
>  
>  /* Platform virtio definitions */
> -#define VIRTIO_MMIO_BASE      0xc0000000
> +#define VIRTIO_MMIO_BASE      0xfeb00000
>  #define VIRTIO_IRQ_BASE       5
>  #define VIRTIO_NUM_TRANSPORTS 8
>  #define VIRTIO_CMDLINE_MAXLEN 64

OK, and let's hope we don't need to move it again.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> -- 
> 2.18.4


