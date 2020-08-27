Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADA254CDF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 20:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBMUO-0001WU-BY; Thu, 27 Aug 2020 18:19:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx2V=CF=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kBMUL-0001WP-Vp
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 18:19:06 +0000
X-Inumbo-ID: e2423606-66ec-4272-ace1-2ca288c7f61e
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e2423606-66ec-4272-ace1-2ca288c7f61e;
 Thu, 27 Aug 2020 18:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598552344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xq67xF1Ah1SkuP7oFrCV75JxzXmfxpuV8L0SN/RmBDk=;
 b=UrcTPrXfMF47d9Fe4smV3Ogp+Qg9KmYkxbkLVxjucpUEYmci8z/hmBFsUqr5GPNp6ZJ6++
 TzswGUs7NiHepqTfiCNvDIfX6gWeKA3aY+nYz4Y2YtUzKkQYjxczZRMpFNGPflEM9zbo8U
 +4NZNeOF6YwwhefX7goACDL4MdfCCK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-L87QBkKKNdqtVT7o2Yd_Pg-1; Thu, 27 Aug 2020 14:18:39 -0400
X-MC-Unique: L87QBkKKNdqtVT7o2Yd_Pg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79FCE1074650;
 Thu, 27 Aug 2020 18:18:33 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233C35D9E8;
 Thu, 27 Aug 2020 18:18:17 +0000 (UTC)
Date: Thu, 27 Aug 2020 14:18:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Sven Schnelle <svens@stackframe.org>,
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiri Pirko <jiri@resnulli.us>,
 Andrzej Zaborowski <balrogg@gmail.com>, kvm@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 00/74] qom: Automated conversion of type checking
 boilerplate
Message-ID: <20200827181816.GI642093@habkost.net>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25, 2020 at 03:19:56PM -0400, Eduardo Habkost wrote:
> git tree for this series:
> https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert
> 
> This is an extension of the series previously submitted by
> Daniel[1], including a script that will convert existing type
> checker macros automatically.
> 
> [1] https://lore.kernel.org/qemu-devel/20200723181410.3145233-1-berrange@redh=
> at.com/

I'm queueing the following patches on machine-next:

[PATCH v3 01/74] e1000: Rename QOM class cast macros
[PATCH v3 02/74] megasas: Rename QOM class cast macros
[PATCH v3 03/74] vmw_pvscsi: Rename QOM class cast macros
[PATCH v3 04/74] pl110: Rename pl110_version enum values
[PATCH v3 05/74] allwinner-h3: Rename memmap enum constants
[PATCH v3 06/74] aspeed_soc: Rename memmap/irqmap enum constants
[PATCH v3 07/74] opentitan: Rename memmap enum constants
[PATCH v3 10/74] aspeed_timer: Fix ASPEED_TIMER macro definition
[PATCH v3 11/74] versatile: Fix typo in PCI_VPB_HOST definition
[PATCH v3 12/74] virtio-ccw: Fix definition of VIRTIO_CCW_BUS_GET_CLASS
[PATCH v3 13/74] hvf: Add missing include
[PATCH v3 14/74] hcd-dwc2: Rename USB_*CLASS macros for consistency
[PATCH v3 15/74] tulip: Move TulipState typedef to header
[PATCH v3 16/74] throttle-groups: Move ThrottleGroup typedef to header
[PATCH v3 17/74] pci: Move PCIBusClass typedef to pci.h
[PATCH v3 18/74] i8254: Move PITCommonState/PITCommonClass typedefs to i8254.h
[PATCH v3 19/74] hvf: Move HVFState typedef to hvf.h
[PATCH v3 20/74] mcf_fec: Move mcf_fec_state typedef to header
[PATCH v3 21/74] s390_flic: Move KVMS390FLICState typedef to header
[PATCH v3 22/74] can_emu: Delete macros for non-existing typedef
[PATCH v3 23/74] nubus: Delete unused NUBUS_BRIDGE macro
[PATCH v3 24/74] platform-bus: Delete macros for non-existing typedef
[PATCH v3 25/74] armsse: Rename QOM macros to avoid conflicts
[PATCH v3 26/74] xen-legacy-backend: Add missing typedef XenLegacyDevice
[PATCH v3 27/74] spapr: Move typedef SpaprMachineState to spapr.h
[PATCH v3 28/74] s390x: Move typedef SCLPEventFacility to event-facility.h
[PATCH v3 29/74] vhost-user-gpu: Move QOM macro to header
[PATCH v3 30/74] ahci: Move QOM macros to header
[PATCH v3 31/74] i8257: Move QOM macro to header
[PATCH v3 32/74] ahci: Move QOM macro to header
[PATCH v3 33/74] pckbd: Move QOM macro to header
[PATCH v3 34/74] vmbus: Move QOM macros to vmbus.h
[PATCH v3 35/74] virtio-serial-bus: Move QOM macros to header
[PATCH v3 36/74] piix: Move QOM macros to header
[PATCH v3 37/74] auxbus: Move QOM macros to header
[PATCH v3 38/74] rocker: Move QOM macros to header
[PATCH v3 39/74] pxa2xx: Move QOM macros to header
[PATCH v3 40/74] mptsas: Move QOM macros to header
[PATCH v3 41/74] kvm: Move QOM macros to kvm.h
[PATCH v3 42/74] vfio/pci: Move QOM macros to header
[PATCH v3 43/74] nubus: Rename class type checking macros
[PATCH v3 48/74] s390-virtio-ccw: Rename S390_MACHINE_CLASS macro
[PATCH v3 49/74] swim: Rename struct SWIM to Swim
[PATCH v3 50/74] migration: Rename class type checking macros

-- 
Eduardo


