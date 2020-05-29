Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DC1E7B06
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jech0-0002gn-VT; Fri, 29 May 2020 10:56:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlOG=7L=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jecgz-0002gg-Hk
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:56:50 +0000
X-Inumbo-ID: 170096f6-a19b-11ea-a893-12813bfff9fa
Received: from forwardcorp1p.mail.yandex.net (unknown [77.88.29.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 170096f6-a19b-11ea-a893-12813bfff9fa;
 Fri, 29 May 2020 10:56:47 +0000 (UTC)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B05B12E150B;
 Fri, 29 May 2020 13:56:45 +0300 (MSK)
Received: from sas1-9998cec34266.qloud-c.yandex.net
 (sas1-9998cec34266.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:9998:cec3])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 C0dMrlp5nF-ucIOOhIW; Fri, 29 May 2020 13:56:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590749805; bh=G1Y+AsTfEGyWO3X/IwL5ebwsjjHayAfjlAggCqZ0R2c=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=CgPc82c+iFzBRlXzgmepj0bZmxnyRiXXL7yjT5eVElFDeSuiZmdZajNCKKdFeLDwu
 wCEl5KFGnYhIMj5/aKO5pGI9s4lVjBlu/mKljHhpzxaeYwQBWaqJ6JnW3KU1AWwTdW
 hpAlAZLdeAvwfZFJHsbC70wdHRhI3mFJIeOEvMtQ=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by sas1-9998cec34266.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dFgBuk5uAo-ucXSPWVD; Fri, 29 May 2020 13:56:38 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 29 May 2020 13:56:36 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 2/8] block: consolidate blocksize properties
 consistency checks
Message-ID: <20200529105636.GB1255099@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
References: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
 <20200528225516.1676602-3-rvkagan@yandex-team.ru>
 <87r1v3m5ih.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1v3m5ih.fsf@dusky.pond.sub.org>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 11:53:26AM +0200, Markus Armbruster wrote:
> Roman Kagan <rvkagan@yandex-team.ru> writes:
> 
> > Several block device properties related to blocksize configuration must
> > be in certain relationship WRT each other: physical block must be no
> > smaller than logical block; min_io_size, opt_io_size, and
> > discard_granularity must be a multiple of a logical block.
> >
> > To ensure these requirements are met, add corresponding consistency
> > checks to blkconf_blocksizes, adjusting its signature to communicate
> > possible error to the caller.  Also remove the now redundant consistency
> > checks from the specific devices.
> >
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Reviewed-by: Paul Durrant <paul@xen.org>
> > ---
> >  include/hw/block/block.h   |  2 +-
> >  hw/block/block.c           | 30 +++++++++++++++++++++++++++++-
> >  hw/block/fdc.c             |  5 ++++-
> >  hw/block/nvme.c            |  5 ++++-
> >  hw/block/swim.c            |  5 ++++-
> >  hw/block/virtio-blk.c      |  7 +------
> >  hw/block/xen-block.c       |  6 +-----
> >  hw/ide/qdev.c              |  5 ++++-
> >  hw/scsi/scsi-disk.c        | 12 +++++-------
> >  hw/usb/dev-storage.c       |  5 ++++-
> >  tests/qemu-iotests/172.out |  2 +-
> >  11 files changed, 58 insertions(+), 26 deletions(-)
> >
> > diff --git a/include/hw/block/block.h b/include/hw/block/block.h
> > index d7246f3862..784953a237 100644
> > --- a/include/hw/block/block.h
> > +++ b/include/hw/block/block.h
> > @@ -87,7 +87,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
> >  bool blkconf_geometry(BlockConf *conf, int *trans,
> >                        unsigned cyls_max, unsigned heads_max, unsigned secs_max,
> >                        Error **errp);
> > -void blkconf_blocksizes(BlockConf *conf);
> > +bool blkconf_blocksizes(BlockConf *conf, Error **errp);
> >  bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
> >                                     bool resizable, Error **errp);
> >  
> > diff --git a/hw/block/block.c b/hw/block/block.c
> > index bf56c7612b..b22207c921 100644
> > --- a/hw/block/block.c
> > +++ b/hw/block/block.c
> > @@ -61,7 +61,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
> >      return true;
> >  }
> >  
> > -void blkconf_blocksizes(BlockConf *conf)
> > +bool blkconf_blocksizes(BlockConf *conf, Error **errp)
> >  {
> >      BlockBackend *blk = conf->blk;
> >      BlockSizes blocksizes;
> > @@ -83,6 +83,34 @@ void blkconf_blocksizes(BlockConf *conf)
> >              conf->logical_block_size = BDRV_SECTOR_SIZE;
> >          }
> >      }
> > +
> > +    if (conf->logical_block_size > conf->physical_block_size) {
> > +        error_setg(errp,
> > +                   "logical_block_size > physical_block_size not supported");
> > +        return false;
> > +    }
> 
> Pardon me if this has been answered already for prior revisions: do we
> really support physical block sizes that are not a multiple of the
> logical block size?

Both physical and logical block sizes are required to be powers of two,
so the former is certain to be a multiple of the latter.

> > +
> > +    if (!QEMU_IS_ALIGNED(conf->min_io_size, conf->logical_block_size)) {
> > +        error_setg(errp,
> > +                   "min_io_size must be a multiple of logical_block_size");
> > +        return false;
> > +    }
> > +
> > +    if (!QEMU_IS_ALIGNED(conf->opt_io_size, conf->logical_block_size)) {
> > +        error_setg(errp,
> > +                   "opt_io_size must be a multiple of logical_block_size");
> > +        return false;
> > +    }
> > +
> > +    if (conf->discard_granularity != -1 &&
> > +        !QEMU_IS_ALIGNED(conf->discard_granularity,
> > +                         conf->logical_block_size)) {
> > +        error_setg(errp, "discard_granularity must be "
> > +                   "a multiple of logical_block_size");
> > +        return false;
> > +    }
> > +
> > +    return true;
> >  }
> >  
> >  bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
> > diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> > index c5fb9d6ece..8eda572ef4 100644
> > --- a/hw/block/fdc.c
> > +++ b/hw/block/fdc.c
> > @@ -554,7 +554,10 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
> >          read_only = !blk_bs(dev->conf.blk) || blk_is_read_only(dev->conf.blk);
> >      }
> >  
> > -    blkconf_blocksizes(&dev->conf);
> > +    if (!blkconf_blocksizes(&dev->conf, errp)) {
> > +        return;
> > +    }
> > +
> >      if (dev->conf.logical_block_size != 512 ||
> >          dev->conf.physical_block_size != 512)
> >      {
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 2f3100e56c..672650e162 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1390,7 +1390,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> >          host_memory_backend_set_mapped(n->pmrdev, true);
> >      }
> >  
> > -    blkconf_blocksizes(&n->conf);
> > +    if (!blkconf_blocksizes(&n->conf, errp)) {
> > +        return;
> > +    }
> > +
> >      if (!blkconf_apply_backend_options(&n->conf, blk_is_read_only(n->conf.blk),
> >                                         false, errp)) {
> >          return;
> > diff --git a/hw/block/swim.c b/hw/block/swim.c
> > index 8f124782f4..74f56e8f46 100644
> > --- a/hw/block/swim.c
> > +++ b/hw/block/swim.c
> > @@ -189,7 +189,10 @@ static void swim_drive_realize(DeviceState *qdev, Error **errp)
> >          assert(ret == 0);
> >      }
> >  
> > -    blkconf_blocksizes(&dev->conf);
> > +    if (!blkconf_blocksizes(&dev->conf, errp)) {
> > +        return;
> > +    }
> > +
> >      if (dev->conf.logical_block_size != 512 ||
> >          dev->conf.physical_block_size != 512)
> >      {
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index 413083e62f..4ffdb130be 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -1162,12 +1162,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
> >          return;
> >      }
> >  
> > -    blkconf_blocksizes(&conf->conf);
> > -
> > -    if (conf->conf.logical_block_size >
> > -        conf->conf.physical_block_size) {
> > -        error_setg(errp,
> > -                   "logical_block_size > physical_block_size not supported");
> > +    if (!blkconf_blocksizes(&conf->conf, errp)) {
> >          return;
> >      }
> >  
> > diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> > index 570489d6d9..e17fec50e1 100644
> > --- a/hw/block/xen-block.c
> > +++ b/hw/block/xen-block.c
> > @@ -239,11 +239,7 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
> >          return;
> >      }
> >  
> > -    blkconf_blocksizes(conf);
> > -
> > -    if (conf->logical_block_size > conf->physical_block_size) {
> > -        error_setg(
> > -            errp, "logical_block_size > physical_block_size not supported");
> > +    if (!blkconf_blocksizes(conf, errp)) {
> >          return;
> >      }
> >  
> > diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
> > index 06b11583f5..b4821b2403 100644
> > --- a/hw/ide/qdev.c
> > +++ b/hw/ide/qdev.c
> > @@ -187,7 +187,10 @@ static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
> >          return;
> >      }
> >  
> > -    blkconf_blocksizes(&dev->conf);
> > +    if (!blkconf_blocksizes(&dev->conf, errp)) {
> > +        return;
> > +    }
> > +
> >      if (dev->conf.logical_block_size != 512) {
> >          error_setg(errp, "logical_block_size must be 512 for IDE");
> >          return;
> > diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> > index 387503e11b..8ce68a9dd6 100644
> > --- a/hw/scsi/scsi-disk.c
> > +++ b/hw/scsi/scsi-disk.c
> > @@ -2346,12 +2346,7 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
> >          return;
> >      }
> >  
> > -    blkconf_blocksizes(&s->qdev.conf);
> > -
> > -    if (s->qdev.conf.logical_block_size >
> > -        s->qdev.conf.physical_block_size) {
> > -        error_setg(errp,
> > -                   "logical_block_size > physical_block_size not supported");
> > +    if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
> >          return;
> >      }
> >  
> > @@ -2436,7 +2431,9 @@ static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
> >      if (s->qdev.conf.blk) {
> >          ctx = blk_get_aio_context(s->qdev.conf.blk);
> >          aio_context_acquire(ctx);
> > -        blkconf_blocksizes(&s->qdev.conf);
> > +        if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
> > +            goto out;
> > +        }
> >      }
> >      s->qdev.blocksize = s->qdev.conf.logical_block_size;
> >      s->qdev.type = TYPE_DISK;
> > @@ -2444,6 +2441,7 @@ static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
> >          s->product = g_strdup("QEMU HARDDISK");
> >      }
> >      scsi_realize(&s->qdev, errp);
> > +out:
> >      if (ctx) {
> >          aio_context_release(ctx);
> >      }
> > diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
> > index 4eba47538d..de461f37bd 100644
> > --- a/hw/usb/dev-storage.c
> > +++ b/hw/usb/dev-storage.c
> > @@ -599,7 +599,10 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
> >          return;
> >      }
> >  
> > -    blkconf_blocksizes(&s->conf);
> > +    if (!blkconf_blocksizes(&s->conf, errp)) {
> > +        return;
> > +    }
> > +
> >      if (!blkconf_apply_backend_options(&s->conf, blk_is_read_only(blk), true,
> >                                         errp)) {
> >          return;
> > diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
> > index 7abbe82427..59cc70aebb 100644
> > --- a/tests/qemu-iotests/172.out
> > +++ b/tests/qemu-iotests/172.out
> > @@ -1204,7 +1204,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
> >                  drive-type = "144"
> >  
> >  Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical_block_size=4096
> > -QEMU_PROG: -device floppy,drive=none0,logical_block_size=4096: Physical and logical block size must be 512 for floppy
> > +QEMU_PROG: -device floppy,drive=none0,logical_block_size=4096: logical_block_size > physical_block_size not supported
> >  
> >  Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physical_block_size=1024
> >  QEMU_PROG: -device floppy,drive=none0,physical_block_size=1024: Physical and logical block size must be 512 for floppy
> 
> This no longer exercises floppy_drive_realize()'s check of
> logical_block_size:
> 
>     if (dev->conf.logical_block_size != 512 ||
>         dev->conf.physical_block_size != 512)

Right, this check of logical_block_size here becomes redundant now,
because eariler it's verified to be no less than 512 and no more than
physical_block_size, which is required to be 512 here.  I thought it
made no harm to leave it here as it was, and decided not to bother
replacing it with a comment as to why the condition is known to be true.

>     {
>         error_setg(errp, "Physical and logical block size must "
>                    "be 512 for floppy");
>         return;
>     }
> 
> Please update the test.

The test still makes sense, it just triggers another assertion now.  How
do you suggest to update it?

Thanks,
Roman.

