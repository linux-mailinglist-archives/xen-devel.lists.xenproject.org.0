Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE773826D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 13:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552683.862889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwNu-0007fN-Dq; Wed, 21 Jun 2023 11:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552683.862889; Wed, 21 Jun 2023 11:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwNu-0007cS-B1; Wed, 21 Jun 2023 11:52:26 +0000
Received: by outflank-mailman (input) for mailman id 552683;
 Wed, 21 Jun 2023 11:52:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RRwT=CJ=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1qBwNs-0007cM-Nq
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 11:52:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14823907-102a-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 13:52:22 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-gpQihIOlOSOYiHCzefAYzg-1; Wed, 21 Jun 2023 07:52:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76AA9104458B;
 Wed, 21 Jun 2023 11:52:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 237362166B32;
 Wed, 21 Jun 2023 11:52:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C42DC1800381; Wed, 21 Jun 2023 13:52:14 +0200 (CEST)
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
X-Inumbo-ID: 14823907-102a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687348341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xuxGBrFySUpFdaMZyf6lD57o+cjaU24aCglqgfIFZhE=;
	b=RXJOlxT/5YOCp9g7BvLV7pCX60V1lKzJG8kLj2qK07yTBkDgcV0LS+lOCyxv8qGevIwAsK
	nDuZSrwHv3KN/wsaZoQF5k0F6Gwk25BE2OgDvVfUfOCqydw9cNRQNUyGQwCHELExJtGFXK
	/3MV4b6tkzr1od6s3VqtlcspeVYgfUc=
X-MC-Unique: gpQihIOlOSOYiHCzefAYzg-1
Date: Wed, 21 Jun 2023 13:52:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Robert Beckett <bob.beckett@collabora.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>, 
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, 
	"Zhang, Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Message-ID: <ihcpcf5lkwv6apvon5kye33nna6nfjwwlpsxxphekb5dq5j5sh@alc56ijteeac>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <lgan3p6wqmxht5fpduh5nvg3f5m5n636k7zrrealnu2lilghhh@qlbvgu3l4apw>
 <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
 <2s33vb2tfogntkyk5laxzcmgexf42mhkpwr2gh3gjvpitav6ez@h5zbmuklzmv5>
 <e9e10508-c26c-cf2a-6407-8e26a1342370@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9e10508-c26c-cf2a-6407-8e26a1342370@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

  Hi,

> As virtio drivers are by design paravirt drivers ,I think it is reasonable
> to accept some knowledge with and cooperation with the host to manage
> suspend/resume.

Fair point.

In any case this needs a feature flag, so guest and host can negotiate
whenever this is supported or not.

virtio spec needs an update for that, describing the exact behavior.

take care,
  Gerd


