Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0A3314E2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 18:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95039.179254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJJhX-00034S-Bb; Mon, 08 Mar 2021 17:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95039.179254; Mon, 08 Mar 2021 17:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJJhX-000342-6x; Mon, 08 Mar 2021 17:29:51 +0000
Received: by outflank-mailman (input) for mailman id 95039;
 Mon, 08 Mar 2021 17:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+V0=IG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lJJhW-00033w-8x
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 17:29:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63bd0c7d-db59-4ed4-885b-2095bf1a5a0b;
 Mon, 08 Mar 2021 17:29:48 +0000 (UTC)
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
X-Inumbo-ID: 63bd0c7d-db59-4ed4-885b-2095bf1a5a0b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615224588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qx692fbHiRL4L6T+MZfu9C8g3d1iJXU8ETMMmyC4JAk=;
  b=Y9h7/qd+AvVqFdw0VoO9yzYdgz88qVe7wICX8Z1nPNFv86/OItWH8td3
   tBWdTqUxxEk1k9thX1TP0XtVUGxyoixv+ZvR4MUK/3374+q3QfImfUPNd
   cs/1xRkiVWyHyQaHAtjOtm3G1sw9Zzg9HROPEI2SqUNzyEc4ndJgdVFBx
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: j20KibSo3L8aG0dbglfkza8MpIL91Sk0L4AOpy/JSV8rb0P6eO/qFqdpeft2WyX7Gm8rqtfH0w
 +E16GcrD3X9FLrloQJJvApoXQXmmSvVZvW6uHtVTHlYFX0SiICk/06GkLDyR1hJQRRUYppN+zw
 WE3dm19Wv6Q4dOtqQ/gIdOp/rhZbPb49nJNTtKKeKSBkf/ur68+YrBTDr+T2eY4f3OcXKBAlbN
 XUjo5LlEcTmDelLt1tIYGcyxGSt7m4CyWjcnINYLXBlAkcXVGPD+o0zFYesd3WFAsSu3Z9U3jA
 5Uo=
X-SBRS: 4.0
X-MesageID: 38785020
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38785020"
Date: Mon, 8 Mar 2021 17:29:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, Maxim
 Levitsky <mlevitsk@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
Message-ID: <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>

On Mon, Mar 08, 2021 at 03:38:49PM +0100, Paolo Bonzini wrote:
> On 08/03/21 15:32, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Whenever a Xen block device is detach via xenstore, the image
> > associated with it remained open by the backend QEMU and an error is
> > logged:
> >      qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> > 
> > This happened since object_unparent() doesn't immediately frees the
> > object and thus keep a reference to the node we are trying to free.
> > The reference is hold by the "drive" property and the call
> > xen_block_drive_destroy() fails.
> > 
> > In order to fix that, we call drain_call_rcu() to run the callback
> > setup by bus_remove_child() via object_unparent().
> > 
> > Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > CCing people whom introduced/reviewed the change to use RCU to give
> > them a chance to say if the change is fine.
> 
> If nothing else works then I guess it's okay, but why can't you do the
> xen_block_drive_destroy from e.g. an unrealize callback?

I'm not sure if that's possible.

xen_block_device_create/xen_block_device_destroy() is supposed to be
equivalent to do those qmp commands:
    blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
    device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2

But I tried to add a call xen_block_drive_destroy from
xen_block_unrealize, but that still is called too early, it's called
before object_property_del_all() which would delete "drive" and call
release_drive() which would free the node.

So, no, I don't think we can use an unrealized callback.

I though of trying to delete the "drive" property ahead of calling
object_unparent() but I didn't figure out how to do so and it's maybe
not possible.

So either drain_call_rcu or adding call_rcu(xen_block_drive_destroy)
seems to be the way, but since xen_block_drive_destroy uses
qmp_blockdev_del, it seems better to drain_call_rcu.

Cheers,

-- 
Anthony PERARD

