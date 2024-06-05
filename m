Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3A8FCEB8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 15:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735755.1141866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEqTj-0003TX-6s; Wed, 05 Jun 2024 13:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735755.1141866; Wed, 05 Jun 2024 13:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEqTj-0003S1-2x; Wed, 05 Jun 2024 13:14:59 +0000
Received: by outflank-mailman (input) for mailman id 735755;
 Wed, 05 Jun 2024 13:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oDqB=NH=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1sEqTh-0003E5-OZ
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 13:14:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9881ad5b-233d-11ef-90a2-e314d9c70b13;
 Wed, 05 Jun 2024 15:14:55 +0200 (CEST)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-tkqqa6s6PxClgnS5JezhrA-1; Wed,
 05 Jun 2024 09:14:49 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D88511955D7D; Wed,  5 Jun 2024 13:14:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.217])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9315F1956086; Wed,  5 Jun 2024 13:14:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 364391800DCF; Wed,  5 Jun 2024 15:14:44 +0200 (CEST)
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
X-Inumbo-ID: 9881ad5b-233d-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717593292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NpWaLJawczwJqHAf2KqSeR/1UYWX96+8lZ1AEzU9pjg=;
	b=JVoP7A62CMDJU8MXpilr+bbm5fdIYQgIPZ3EwoxEGRQnsMvzNmGD3/KA5/GlIkCoUoB2ye
	L3q+2MJyQ2h5yuJg0pYTJygmweQ+GShQhKSWh5ag9rBfuDEuCo5aeB5Arpz8QuvftrbzhE
	HSx5MmSrppWIRRE6NYTzEWXgZp8+H1I=
X-MC-Unique: tkqqa6s6PxClgnS5JezhrA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 0/3] stdvga: fix screen blanking
Date: Wed,  5 Jun 2024 15:14:40 +0200
Message-ID: <20240605131444.797896-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15



Gerd Hoffmann (3):
  stdvga: fix screen blanking
  ui+display: rename is_placeholder() -> surface_is_placeholder()
  ui+display: rename is_buffer_shared() -> surface_is_allocated()

 include/ui/surface.h    |  6 +++---
 hw/display/qxl-render.c |  2 +-
 hw/display/vga.c        | 24 +++++++++++++++---------
 hw/display/xenfb.c      |  5 +++--
 ui/console.c            |  3 ++-
 ui/sdl2-2d.c            |  2 +-
 ui/sdl2-gl.c            |  2 +-
 7 files changed, 26 insertions(+), 18 deletions(-)

-- 
2.45.1


