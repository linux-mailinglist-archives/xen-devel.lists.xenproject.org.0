Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E81F19F9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHmC-0004JB-1m; Mon, 08 Jun 2020 13:25:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HF7x=7V=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jiHmA-0004J6-Vp
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:25:19 +0000
X-Inumbo-ID: 7e5b4cb8-a98b-11ea-b272-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7e5b4cb8-a98b-11ea-b272-12813bfff9fa;
 Mon, 08 Jun 2020 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591622717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iunWMdgIpilPK2dxhO36sttTtgukW90nUykrzyVwqng=;
 b=CSAPApQu2AZYMUdgm0SPEEqdFZHeJ/+GBLro/qdChbcPOz4JnzfkWWMMT+5W3/Y0uVhosI
 5oOHbfU1fIE72qh62RHnq1PRB0RRgFkWVZiTWETrAqqVRPxcVVgoUB9nRFG6bpXtZ81ZHk
 veqa+hi8xnpvRwFKp8yq6OBezfQsdkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-S--JotAmMg2_IzD9mvHcxA-1; Mon, 08 Jun 2020 09:25:15 -0400
X-MC-Unique: S--JotAmMg2_IzD9mvHcxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08A73107B267;
 Mon,  8 Jun 2020 13:25:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F0405C1D6;
 Mon,  8 Jun 2020 13:25:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D7A116E16; Mon,  8 Jun 2020 15:25:07 +0200 (CEST)
Date: Mon, 8 Jun 2020 15:25:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/4] microvm: memory config tweaks
Message-ID: <20200608132507.snzujn4yb37z3xmj@sirius.home.kraxel.org>
References: <20200529073957.8018-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529073957.8018-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 09:39:53AM +0200, Gerd Hoffmann wrote:
> With more microvm memory config tweaks split this into its owns series,
> the microvm acpi patch series is already big enough ...
> 
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

Ping.  Anyone going to pick this up?  MAINTAINERS lists Sergio+Paolo ...
Or should I send a pull req myself?

take care,
  Gerd


