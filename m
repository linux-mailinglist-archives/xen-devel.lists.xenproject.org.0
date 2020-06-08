Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E121F1A1D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:32:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHsZ-00059Q-O7; Mon, 08 Jun 2020 13:31:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqEd=7V=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jiHsY-00059L-OX
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:31:54 +0000
X-Inumbo-ID: 6ac71fbe-a98c-11ea-b274-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6ac71fbe-a98c-11ea-b274-12813bfff9fa;
 Mon, 08 Jun 2020 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591623113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPVzldjJJNnkRaNdn/VsItofhkeod9E0zRG0RaxQv2M=;
 b=ZeToD1XSgSNLSaeUE/QKsnNPkDXZUZAhJso1I3cOr1+Ie5UC21xuyvZB5UloD37V1Wtbvd
 ase5H6QivF85SkcV/1AUZXb8xlEcjLHXoMq5srvUUq0NOLABlZVPvquzsZAsyPZTCQd5Vh
 khcrCvIlgXicc+D/dxI/ugp4D58YxqE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-_0cL9hfgPG6rX1sBKjiaAg-1; Mon, 08 Jun 2020 09:31:52 -0400
X-MC-Unique: _0cL9hfgPG6rX1sBKjiaAg-1
Received: by mail-wr1-f70.google.com with SMTP id m14so7150475wrj.12
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 06:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tPVzldjJJNnkRaNdn/VsItofhkeod9E0zRG0RaxQv2M=;
 b=l7Yn9fyxZc/ZxKWdh80gTtQVVxaSwYRb6170mPwtn2hZlDK+iSclSLyS3octc28PlZ
 WEZUZ9+3gmcYLQ4NHwrhYw4QMXfd3nz3hg2J08qXol98G7NIyS/ifYypVrQXp5Px48Ek
 z0+/pGlQRmOYMIUqKaVlPJs5S5W+vkb5jKbEZQX3SisZ1U50vgJbZoBIMhyCtGzuvK1P
 oq3IQh5DbUS7sVH8DWqgK7lhKA92zzJ4/WQw6luOxYwgmJmxvyQm+zj/Yr+1dx30Een9
 d+i3wUuVH1aly8fjX2/2W9o4LkEJ+wS43PclOVZh1gWnnRN/NhCrk+uaft83E6R60GmI
 6a6w==
X-Gm-Message-State: AOAM532t52xBJTZlgb+JEAEcC1YAeiWIno1Kqo+B5QfNqzwpujbmFPI1
 ZOCFvLttdPi5sAAbrORQJsAp5NDjd0xURHTXEjpsdtPj9EBWaoQxKqAoDJgw0yfui8sab3BJgF4
 BNrrtlhClzzI1Wzs1iMPXW+VJvqM=
X-Received: by 2002:a1c:66d5:: with SMTP id
 a204mr16198843wmc.134.1591623111290; 
 Mon, 08 Jun 2020 06:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA2HGg4NasaA8mCwPnDF9hNXQFQyNEekHr1Gs1mIC4JFKlyCAxU1yaGFm2tkHNCg14ZmLU4Q==
X-Received: by 2002:a1c:66d5:: with SMTP id
 a204mr16198827wmc.134.1591623111104; 
 Mon, 08 Jun 2020 06:31:51 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 j190sm22821770wmb.33.2020.06.08.06.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:31:50 -0700 (PDT)
Date: Mon, 8 Jun 2020 09:31:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/4] microvm: memory config tweaks
Message-ID: <20200608093125-mutt-send-email-mst@kernel.org>
References: <20200529073957.8018-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529073957.8018-1-kraxel@redhat.com>
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

On Fri, May 29, 2020 at 09:39:53AM +0200, Gerd Hoffmann wrote:
> With more microvm memory config tweaks split this into its owns series,
> the microvm acpi patch series is already big enough ...

Looks sane:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

microvm things so should use that tree ...

> v2:
>  - use 3G split.
>  - add patch to move virtio-mmio region.
>  - pick up acks & reviews.
> v3:
>  - fix xen build.
>  - pick up acks & reviews.
> 
> take care,
>   Gerd
> 
> Gerd Hoffmann (4):
>   microvm: use 3G split unconditionally
>   microvm: drop max-ram-below-4g support
>   x86: move max-ram-below-4g to pc
>   microvm: move virtio base to 0xfeb00000
> 
>  include/hw/i386/microvm.h |  2 +-
>  include/hw/i386/pc.h      |  2 ++
>  include/hw/i386/x86.h     |  4 ----
>  hw/i386/microvm.c         | 35 +----------------------------
>  hw/i386/pc.c              | 46 +++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc_piix.c         | 10 ++++-----
>  hw/i386/pc_q35.c          | 10 ++++-----
>  hw/i386/x86.c             | 46 ---------------------------------------
>  hw/i386/xen/xen-hvm.c     |  2 +-
>  9 files changed, 61 insertions(+), 96 deletions(-)
> 
> -- 
> 2.18.4


