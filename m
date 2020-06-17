Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19DC1FCD6C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:29:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXC3-00075U-KC; Wed, 17 Jun 2020 12:29:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiE7=76=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jlXC1-00070F-U9
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:29:25 +0000
X-Inumbo-ID: 2b518610-b096-11ea-bb8b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2b518610-b096-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=njPufjQU9J06Is2FXVSy/pVf/aMSRVIW2nX5LRoWV4E=;
 b=HOgNyksFTYZRyaRfOK2pMNCHJgaSWp8MYQWAMCJs7kBfT8XOrKMfg0r6rerckoifQ0/m+F
 Nq/Pi9xYG7e4J+qpcadF/JzMBPRVBOyeBTqFRv2qsFNqEjqHQm9t0aIWprxrxENnXEEHy/
 DNDWSVcoP9SW45KWPCZmWdM92i2EAgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-KQmlQncdOiGFUbPBAR1Qlw-1; Wed, 17 Jun 2020 08:29:16 -0400
X-MC-Unique: KQmlQncdOiGFUbPBAR1Qlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75DFE100962B;
 Wed, 17 Jun 2020 12:29:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09EB719D7B;
 Wed, 17 Jun 2020 12:29:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9AC9B16E16; Wed, 17 Jun 2020 14:29:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Microvm 20200617 patches
Date: Wed, 17 Jun 2020 14:28:57 +0200
Message-Id: <20200617122901.13327-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following changes since commit 5c24bce3056ff209a1ecc50ff4b7e65b85ad8e74:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-plugin-160620-2' into staging (2020-06-16 14:57:15 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/microvm-20200617-pull-request

for you to fetch changes up to c8b473594b8fbba169a6ea950493a3015d15a18d:

  microvm: move virtio base to 0xfeb00000 (2020-06-17 14:24:28 +0200)

----------------------------------------------------------------
microvm: memory config tweaks

----------------------------------------------------------------

Gerd Hoffmann (4):
  microvm: use 3G split unconditionally
  microvm: drop max-ram-below-4g support
  x86: move max-ram-below-4g to pc
  microvm: move virtio base to 0xfeb00000

 include/hw/i386/microvm.h |  2 +-
 include/hw/i386/pc.h      |  2 ++
 include/hw/i386/x86.h     |  4 ----
 hw/i386/microvm.c         | 35 +----------------------------
 hw/i386/pc.c              | 46 +++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c         | 10 ++++-----
 hw/i386/pc_q35.c          | 10 ++++-----
 hw/i386/x86.c             | 46 ---------------------------------------
 hw/i386/xen/xen-hvm.c     |  2 +-
 9 files changed, 61 insertions(+), 96 deletions(-)

-- 
2.18.4


