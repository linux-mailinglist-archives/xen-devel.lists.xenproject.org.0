Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE9223EFC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 17:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwRr0-0002Ym-Qf; Fri, 17 Jul 2020 15:00:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwRqy-0002Ya-S4
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 15:00:48 +0000
X-Inumbo-ID: 4b504b8a-c83e-11ea-9622-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b504b8a-c83e-11ea-9622-12813bfff9fa;
 Fri, 17 Jul 2020 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594998047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6taC/Ie7M8Gq+JWvdtEOr5MJlc6+b45lxyY1V4fbMo4=;
 b=YWSHHjflJEeSl4jZ3hvM/yCBAsG4YZIHSlbPcp+gOYWbDaUqYi3vBdHU
 mrSKspgrYDjNM9BplcNGphto9Jk1kzbLXaLdX5nCRUHNGtGg6WKX+QNQu
 ACDfXr2YFMqqiyGX0Ck7k/B/rGUeoVPj4j5kvmzlq1uqXfQpSKzGcvLZs Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BK9ktkuQrB6scE79g2FzZnIirusEq0ov5RvCfyy3LBP33FHQmhKqWU5AN5dmjv/+x59JUOEzx1
 Avi/FzZS48l06rE8sTzyWyWVKx8Q1FUhZOVh1g7K2xXwmZIje9bzi5KS/q86frqSlz4lFvLLfP
 ssSu3ML9QPi4q39D7GioAUXwyQrMjFGCSjo7UmaWK6tYNUUNVSegeCSU6J/Q6xKysioQpR0WRq
 a2Eqj6i+ymgqE6nENA8dDrwtCQabS3KKDARReuMxKe1SEJjJzib4Ra5d0oYKTAKzu4zkRAyb+6
 aSM=
X-SBRS: 2.7
X-MesageID: 22954211
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22954211"
Date: Fri, 17 Jul 2020 17:00:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200717150039.GV7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

I'm very happy to see this proposal, as I think having proper (1st
class) VirtIO support on Xen is crucial to our survival. Almost all
OSes have VirtIO frontends, while the same can't be said about Xen PV
frontends. It would also allow us to piggyback on any new VirtIO
devices without having to re-invent the wheel by creating a clone Xen
PV device.

On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> Hello all.
> 
> We would like to resume Virtio in Xen on Arm activities. You can find some
> background at [1] and Virtio specification at [2].
> 
> *A few words about importance:*
> There is an increasing interest, I would even say, the requirement to have
> flexible, generic and standardized cross-hypervisor solution for I/O
> virtualization
> in the automotive and embedded areas. The target is quite clear here.
> Providing a standardized interface and device models for device
> para-virtualization
> in hypervisor environments, Virtio interface allows us to move Guest domains
> among different hypervisor systems without further modification at the
> Guest side.
> What is more that Virtio support is available in Linux, Android and many
> other
> operating systems and there are a lot of existing Virtio drivers (frontends)
> which could be just reused without reinventing the wheel. Many
> organisations push
> Virtio direction as a common interface. To summarize, Virtio support would
> be
> the great feature in Xen on Arm in addition to traditional Xen PV drivers
> for
> the user to be able to choose which one to use.

I think most of the above also applies to x86, and fully agree.

> 
> *A few word about solution:*
> As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm

Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
it would be very interesting from a x86 PoV, as I don't think
virtio-mmio is something that you can easily use on x86 (or even use
at all).

> requires
> some implementation to forward guest MMIO access to a device model. And as
> it
> turned out the Xen on x86 contains most of the pieces to be able to use that
> transport (via existing IOREQ concept). Julien has already done a big amount
> of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
> device emulator).
> Using that code as a base we managed to create a completely functional PoC
> with DomU
> running on virtio block device instead of a traditional Xen PV driver
> without
> modifications to DomU Linux. Our work is mostly about rebasing Julien's
> code on the actual
> codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
> (virtio-disk backend)
> in other than Dom0 domain (in our system we have thin Dom0 and keep all
> backends
> in driver domain),

How do you handle this use-case? Are you using grants in the VirtIO
ring, or rather allowing the driver domain to map all the guest memory
and then placing gfn on the ring like it's commonly done with VirtIO?

Do you have any plans to try to upstream a modification to the VirtIO
spec so that grants (ie: abstract references to memory addresses) can
be used on the VirtIO ring?

> misc fixes for our use-cases and tool support for the
> configuration.
> Unfortunately, Julien doesn’t have much time to allocate on the work
> anymore,
> so we would like to step in and continue.
> 
> *A few word about the Xen code:*
> You can find the whole Xen series at [5]. The patches are in RFC state
> because
> some actions in the series should be reconsidered and implemented properly.
> Before submitting the final code for the review the first IOREQ patch
> (which is quite
> big) will be split into x86, Arm and common parts. Please note, x86 part
> wasn’t
> even build-tested so far and could be broken with that series. Also the
> series probably
> wants splitting into adding IOREQ on Arm (should be focused first) and
> tools support
> for the virtio-disk (which is going to be the first Virtio driver)
> configuration before going
> into the mailing list.

Sending first a patch series to enable IOREQs on Arm seems perfectly
fine, and it doesn't have to come with the VirtIO backend. In fact I
would recommend that you send that ASAP, so that you don't spend time
working on the backend that would likely need to be modified
according to the review received on the IOREQ series.

> 
> What I would like to add here, the IOREQ feature on Arm could be used not
> only
> for implementing Virtio, but for other use-cases which require some
> emulator entity
> outside Xen such as custom PCI emulator (non-ECAM compatible) for example.
> 
> *A few word about the backend(s):*
> One of the main problems with Virtio in Xen on Arm is the absence of
> “ready-to-use” and “out-of-Qemu” Virtio backends (I least am not aware of).
> We managed to create virtio-disk backend based on demu [3] and kvmtool [4]
> using
> that series. It is worth mentioning that although Xenbus/Xenstore is not
> supposed
> to be used with native Virtio, that interface was chosen to just pass
> configuration from toolstack
> to the backend and notify it about creating/destroying Guest domain (I
> think it is

I would prefer if a single instance was launched to handle each
backend, and that the configuration was passed on the command line.
Killing the user-space backend from the toolstack is fine I think,
there's no need to notify the backend using xenstore or any other
out-of-band methods.

xenstore has proven to be a bottleneck in terms of performance, and it
would be better if we can avoid using it when possible, specially here
that you have to do this from scratch anyway.

Thanks, Roger.

