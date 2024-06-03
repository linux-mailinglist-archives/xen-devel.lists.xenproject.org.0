Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6668D85E2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 17:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734953.1141090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9SF-000323-Ny; Mon, 03 Jun 2024 15:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734953.1141090; Mon, 03 Jun 2024 15:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9SF-0002zf-LG; Mon, 03 Jun 2024 15:18:35 +0000
Received: by outflank-mailman (input) for mailman id 734953;
 Mon, 03 Jun 2024 15:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DZA=NF=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1sE9SE-0002zU-7Z
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 15:18:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f5dadc-21bc-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 17:18:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-YU-I1tivMFSQruzegKHrDA-1; Mon, 03 Jun 2024 11:18:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AB06101A525;
 Mon,  3 Jun 2024 15:18:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5C140AD3DE;
 Mon,  3 Jun 2024 15:18:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F27C61800985; Mon,  3 Jun 2024 17:18:25 +0200 (CEST)
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
X-Inumbo-ID: 88f5dadc-21bc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717427910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Ot+g6unzuYazgp1aGNy1K4xrxxsPWswKLjbLi14qio=;
	b=eBXPZp4WgbMAWCj+MS9aGG4ZI/n0O22+4x/jKd4u1p+Vj/KcuTGhMeVD2pBPAdUCULIgvK
	hJreZ7huPSoM3dxp7k+hp3GziSgWysiK6LBDrkrSedBJKAiQ8V1N+bt+/SnpPuP8wKIWcW
	6/18aLkTlTN8Y+H0Kq4p3AGgXyCcj5w=
X-MC-Unique: YU-I1tivMFSQruzegKHrDA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] stdvga: fix screen blanking
Date: Mon,  3 Jun 2024 17:18:22 +0200
Message-ID: <20240603151825.188353-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2



Gerd Hoffmann (3):
  stdvga: fix screen blanking
  ui+display: rename is_buffer_shared() -> surface_is_borrowed()
  ui+display: rename is_placeholder -> surface_is_placeholder

 include/ui/surface.h    |  4 ++--
 hw/display/qxl-render.c |  2 +-
 hw/display/vga.c        | 14 ++++++++++----
 hw/display/xenfb.c      |  4 ++--
 ui/console.c            |  2 +-
 ui/sdl2-2d.c            |  2 +-
 ui/sdl2-gl.c            |  2 +-
 7 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.45.1


