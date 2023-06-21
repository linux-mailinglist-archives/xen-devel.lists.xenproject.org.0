Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C8737DB5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552542.862679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtNZ-0001um-IH; Wed, 21 Jun 2023 08:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552542.862679; Wed, 21 Jun 2023 08:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtNZ-0001sA-FP; Wed, 21 Jun 2023 08:39:53 +0000
Received: by outflank-mailman (input) for mailman id 552542;
 Wed, 21 Jun 2023 08:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RRwT=CJ=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1qBtNY-0001s2-3B
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:39:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f09f1ac-100f-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 10:39:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-nOT0jC-nMhCavQXxm-kAig-1; Wed, 21 Jun 2023 04:39:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD4C280BC88;
 Wed, 21 Jun 2023 08:39:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C9DD4087C6D;
 Wed, 21 Jun 2023 08:39:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1AF931800381; Wed, 21 Jun 2023 10:39:41 +0200 (CEST)
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
X-Inumbo-ID: 2f09f1ac-100f-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687336789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OinvM39eNcyuqTY4ayH3U9HRb8PC8b84eJfHXMZWEzo=;
	b=JFC/cGq8K8QSYa8ZXU8JfLtbyt0HS3Qwixl0/YMRXneD/E3JoA69A05icozCOSoTUmXac6
	hz4SS+aUueJAqvR4vWQ1sNA7Xud2rF0saaDH6Sh7Sn4M+3TGmYyEJ24ptmP5XD0+dSd1sw
	2c/7BES4zLqkYDBh6m5fH59DOPa13iU=
X-MC-Unique: nOT0jC-nMhCavQXxm-kAig-1
Date: Wed, 21 Jun 2023 10:39:41 +0200
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
Message-ID: <2s33vb2tfogntkyk5laxzcmgexf42mhkpwr2gh3gjvpitav6ez@h5zbmuklzmv5>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <lgan3p6wqmxht5fpduh5nvg3f5m5n636k7zrrealnu2lilghhh@qlbvgu3l4apw>
 <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

On Tue, Jun 20, 2023 at 01:26:15PM +0100, Robert Beckett wrote:
> 
> On 20/06/2023 10:41, Gerd Hoffmann wrote:
> >    Hi,
> > 
> > > > The guest driver should be able to restore resources after resume.
> > > Thank you for your suggestion!
> > > As far as I know, resources are created on host side and guest has no backup, if resources are destroyed, guest can't restore them.
> > > Or do you mean guest driver need to send commands to re-create resources after resume?
> > The later.  The guest driver knows which resources it has created,
> > it can restore them after suspend.
> 
> Are you sure that this is viable?
> 
> How would you propose that a guest kernel could reproduce a resource,
> including pixel data upload during a resume?
> 
> The kernel would not have any of the pixel data to transfer to host.

Depends on the of resource type.  For resources which are created by
uploading pixel data (using VIRTIO_GPU_CMD_TRANSFER_TO_HOST_*) a guest
mirror exists which can be used for re-upload.

For resources filled by gl rendering ops this is indeed not the case.

> Could you explain how you anticipate the guest being able to reproduce the
> resources please?

Same you do on physical hardware?  Suspend can poweroff your PCI
devices, so there must be some standard way to handle that situation
for resources stored in gpu device memory, which is very similar to
the problem we have here.

take care,
  Gerd


