Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D68735761
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 14:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551064.860373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBENc-0003Ha-RB; Mon, 19 Jun 2023 12:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551064.860373; Mon, 19 Jun 2023 12:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBENc-0003FM-Ng; Mon, 19 Jun 2023 12:53:12 +0000
Received: by outflank-mailman (input) for mailman id 551064;
 Mon, 19 Jun 2023 12:53:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QlQe=CH=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1qBENc-0003Ex-1q
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 12:53:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d4ec410-0ea0-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 14:53:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-eMbUOAW0MCuDPYrn0jiopg-1; Mon, 19 Jun 2023 08:51:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3085685A58C;
 Mon, 19 Jun 2023 12:51:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6D9440C6E8E;
 Mon, 19 Jun 2023 12:51:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 936C518003AB; Mon, 19 Jun 2023 14:51:24 +0200 (CEST)
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
X-Inumbo-ID: 3d4ec410-0ea0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687179187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ORtopzT9s1qYWn/4SUYyTcc3sJhCuS5dk+3R+10YLU=;
	b=FGVFQ+8c85j1Be0eBLrQ7CQb6S5G092T+/7SpbBPGCCs8vkSAGncppa3UnQ6/lATqK2fZL
	XDuhrmFg/bsHyj6Z9mSKDIXXLMa1zoZDfanmwGaZcVJPPoIMLal96xwnkB67vYld3TlEhY
	ece/PlSye+GHLSLZAYnkqVyJp0MhLwk=
X-MC-Unique: eMbUOAW0MCuDPYrn0jiopg-1
Date: Mon, 19 Jun 2023 14:51:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, 
	Damien Hedde <damien.hedde@greensocs.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Alex Deucher <Alexander.Deucher@amd.com>, Christian Koenig <Christian.Koenig@amd.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>, 
	Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Message-ID: <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

  Hi, 
> Adding a new command requires new feature flag (and maybe it should be in
> the <0x1000 range instead)
> 
> But I am not sure we need a new message at the virtio-gpu level. Gerd, wdyt?
> 
> Maybe it's not a good place to reset all GPU resources during QEMU reset()
> after all, if it's called during s3 and there is no mechanism to restore
> it. Damien?

The guest driver should be able to restore resources after resume.

take care,
  Gerd


