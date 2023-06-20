Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EDB736805
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 11:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551488.861063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBXrj-0003Ui-AN; Tue, 20 Jun 2023 09:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551488.861063; Tue, 20 Jun 2023 09:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBXrj-0003SZ-7L; Tue, 20 Jun 2023 09:41:35 +0000
Received: by outflank-mailman (input) for mailman id 551488;
 Tue, 20 Jun 2023 09:41:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZvHW=CI=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1qBXrh-00037y-Iz
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 09:41:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a34b74df-0f4e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 11:41:32 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-ae1SokUPNamv0gV-ky2RfQ-1; Tue, 20 Jun 2023 05:41:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94F0803FE0;
 Tue, 20 Jun 2023 09:41:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD1B40C200F;
 Tue, 20 Jun 2023 09:41:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CD1E1807DD4; Tue, 20 Jun 2023 11:41:22 +0200 (CEST)
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
X-Inumbo-ID: a34b74df-0f4e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687254091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3It2NZYCXKRzeV7HhNGMTFh0lnlvIJkuzNah3Z/f6V8=;
	b=fhfIQukg5JWbT9W4QQQVIbWtuxSR140CNfsi8ZPlUQO/lcOm0S3VBo6vFM2XwDYL8oOMMu
	DFSF/p7PLFyNXu8I6bofkrLN0J3tBzM0Dw2hQ2BfJve7ugcYkCx2ysj6y/hVhq39FHMM32
	Qn4wyv/EaqGHoJIjzoElEsGbU5qJNsk=
X-MC-Unique: ae1SokUPNamv0gV-ky2RfQ-1
Date: Tue, 20 Jun 2023 11:41:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>, 
	Damien Hedde <damien.hedde@greensocs.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	Robert Beckett <bob.beckett@collabora.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, 
	"Zhang, Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Message-ID: <lgan3p6wqmxht5fpduh5nvg3f5m5n636k7zrrealnu2lilghhh@qlbvgu3l4apw>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

  Hi,

> > The guest driver should be able to restore resources after resume.
> 
> Thank you for your suggestion!
> As far as I know, resources are created on host side and guest has no backup, if resources are destroyed, guest can't restore them.
> Or do you mean guest driver need to send commands to re-create resources after resume?

The later.  The guest driver knows which resources it has created,
it can restore them after suspend.

> If so, I have some questions. Can guest re-create resources by using
> object(virtio_vpu_object) or others? Can the new resources replace the
> destroyed resources to continue the suspended display tasks after
> resume?

Any display scanout information will be gone too, the guest driver needs
re-create this too (after re-creating the resources).

take care,
  Gerd


