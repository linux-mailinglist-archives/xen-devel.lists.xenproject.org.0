Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584C57D385B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621469.967930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvFq-0003Tr-V9; Mon, 23 Oct 2023 13:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621469.967930; Mon, 23 Oct 2023 13:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvFq-0003Qr-Rr; Mon, 23 Oct 2023 13:46:02 +0000
Received: by outflank-mailman (input) for mailman id 621469;
 Mon, 23 Oct 2023 13:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zmhW=GF=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1quvFp-0003PJ-Pb
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:46:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f7d2f5f-71aa-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 15:46:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-mjSKRdUpPyGnGYhKh02Sbg-1; Mon, 23 Oct 2023 09:45:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F555101AA75;
 Mon, 23 Oct 2023 13:45:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBF01C060B6;
 Mon, 23 Oct 2023 13:45:52 +0000 (UTC)
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
X-Inumbo-ID: 7f7d2f5f-71aa-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698068759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRwDvjlRKO8xrlwJvcJXG0QiFBX/VuVy6rRUymKs+DU=;
	b=LEzQPwiNkc1yz9w0HNvBEwxU6PndrGS8P0kRkjiXAKLO8fZuhOBcoNgPJcwXs6NNUfnImb
	ld6GgJFU6YvG8pR9GkcZjY1JUfiN930wvOGDi5SVJWU3w5m7sAcGOKl184oYYcgu2w8K3B
	msQFWkd/KRpNsvChNWrz/DM0oguawas=
X-MC-Unique: mjSKRdUpPyGnGYhKh02Sbg-1
Date: Mon, 23 Oct 2023 15:45:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 11/12] hw/xen: automatically assign device index to block
 devices
Message-ID: <ZTZ5D2wZXkDQanbQ@redhat.com>
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-12-dwmw2@infradead.org>
 <20231018093239.3d525fd8@imammedo.users.ipa.redhat.com>
 <3f3487af227dcdce7afb37e8406d5ce8dcdbf55f.camel@infradead.org>
 <20231023113002.0e83c209@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023113002.0e83c209@imammedo.users.ipa.redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Am 23.10.2023 um 11:30 hat Igor Mammedov geschrieben:
> On Wed, 18 Oct 2023 09:32:47 +0100
> David Woodhouse <dwmw2@infradead.org> wrote:
> 
> > On Wed, 2023-10-18 at 09:32 +0200, Igor Mammedov wrote:
> > > On Mon, 16 Oct 2023 16:19:08 +0100
> > > David Woodhouse <dwmw2@infradead.org> wrote:
> > >   
> > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > >   
> > > 
> > > is this index a user (guest) visible?  
> > 
> > Yes. It defines what block device (e.g. /dev/xvda) the disk appears as
> > in the guest. In the common case, it literally encodes the Linux
> > major/minor numbers. So xvda (major 202) is 0xca00, xvdb is 0xca10 etc.
> 
> that makes 'index' an implicit ABI and a subject to versioning
> when the way it's assigned changes (i.e. one has to use versioned
> machine types to keep older versions working the they used to).
> 
> From what I remember it's discouraged to make QEMU invent
> various IDs that are part of ABI (guest or mgmt side).
> Instead it's preferred for mgmt side/user to provide that explicitly.
> 
> Basically you are trading off manageability/simplicity at QEMU
> level with CLI usability for human user.
> I don't care much as long as it is hidden within xen code base,
> but maybe libvirt does.

-drive is mostly a convenience option for human users anyway. Management
tools should use a combination of -blockdev and -device.

Kevin


