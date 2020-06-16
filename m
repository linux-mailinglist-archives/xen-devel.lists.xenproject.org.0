Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD91FBA43
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:10:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlE9e-0005bZ-Dq; Tue, 16 Jun 2020 16:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFDG=75=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1jlE9c-0005bU-FZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:09:40 +0000
X-Inumbo-ID: c82443b6-afeb-11ea-bca7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c82443b6-afeb-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592323779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0rqSFzZq3qFEqQpqMeOjnJbYfs9zNhM4NpNV+yeVM3M=;
 b=IzEa8fj8ZYqtM9P/g0LhSXYabvtGW5eTvnnSRYSSq3trfE/FZFNm7J7TVJ2alhnhgVFoyY
 DZyhTZn+EzsRE5tijp/xDKweKvBWPKwTi4JkW1vY1POjdU80AgFpU0Nfo10qLe0zPsEQy3
 XHfYbXiJp7w/o0EVjFI/LgUlgiP1if0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-BZsOtuhpNI-w7lHrfoBlbQ-1; Tue, 16 Jun 2020 12:09:36 -0400
X-MC-Unique: BZsOtuhpNI-w7lHrfoBlbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281FE10059C0;
 Tue, 16 Jun 2020 16:09:34 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C44325D9D7;
 Tue, 16 Jun 2020 16:09:21 +0000 (UTC)
Date: Tue, 16 Jun 2020 18:09:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH v8 0/8] block: enhance handling of size-related BlockConf
 properties
Message-ID: <20200616160920.GG4305@linux.fritz.box>
References: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Am 29.05.2020 um 00:55 hat Roman Kagan geschrieben:
> BlockConf includes several properties counted in bytes.
> 
> Enhance their handling in some aspects, specifically
> 
> - accept common size suffixes (k, m)
> - perform consistency checks on the values
> - lift the upper limit on physical_block_size and logical_block_size
> 
> Also fix the accessor for opt_io_size in virtio-blk to make it consistent with
> the size of the field.

Thanks, applied to the block branch.

Kevin


