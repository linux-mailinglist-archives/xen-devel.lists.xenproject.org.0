Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97781E770F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:40:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZcy-0007Pn-Bx; Fri, 29 May 2020 07:40:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3I2r=7L=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jeZcx-0007PN-8p
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:40:27 +0000
X-Inumbo-ID: a2e19467-a17f-11ea-a877-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a2e19467-a17f-11ea-a877-12813bfff9fa;
 Fri, 29 May 2020 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590738015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pQn0bGDZvr2S3O3jxeuAg3AzJn+Iii0I+O8+ViqeBjo=;
 b=SqRBi73QcIL5NcVeB4u3EvriEeKDSGPFd/PAvU61uYSDUvRqwqcPSXQlDSzSHn5yzsBHkN
 GRcEEBWCWjIjeDYR19ZQm8H3uuoNotltZ9mCNCHBv0yxYxNtpnmeszq3tNnlPDyCGBmMSV
 l7saN9urTortR/fOYqlbU2sggbuGZJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-j2IMzAvKPCG-RW4t-W3vUw-1; Fri, 29 May 2020 03:40:14 -0400
X-MC-Unique: j2IMzAvKPCG-RW4t-W3vUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF73D800D24;
 Fri, 29 May 2020 07:40:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB1FA1035;
 Fri, 29 May 2020 07:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3314616E2C; Fri, 29 May 2020 09:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] microvm: memory config tweaks
Date: Fri, 29 May 2020 09:39:53 +0200
Message-Id: <20200529073957.8018-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With more microvm memory config tweaks split this into its owns series,
the microvm acpi patch series is already big enough ...

v2:
 - use 3G split.
 - add patch to move virtio-mmio region.
 - pick up acks & reviews.
v3:
 - fix xen build.
 - pick up acks & reviews.

take care,
  Gerd

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


