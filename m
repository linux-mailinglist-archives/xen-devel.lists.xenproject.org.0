Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D61E4FAC
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 22:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je33D-00059j-9N; Wed, 27 May 2020 20:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVnz=7J=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1je33B-00059e-CL
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 20:53:21 +0000
X-Inumbo-ID: 175459e8-a05c-11ea-a782-12813bfff9fa
Received: from forwardcorp1j.mail.yandex.net (unknown [5.45.199.163])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 175459e8-a05c-11ea-a782-12813bfff9fa;
 Wed, 27 May 2020 20:53:18 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id BD23D2E157F;
 Wed, 27 May 2020 23:53:16 +0300 (MSK)
Received: from sas2-32987e004045.qloud-c.yandex.net
 (sas2-32987e004045.qloud-c.yandex.net [2a02:6b8:c08:b889:0:640:3298:7e00])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Xt3ArwXecc-rCfKmK9U; Wed, 27 May 2020 23:53:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590612796; bh=ZsdCg7tQAxxXKqG44grgO5wkYDTDlvE1HPG0Z1dXtPA=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=F3RR6S+ZRu88QHnYWpbbvafacf6fEC/1xkhzlcxkkqo49KTGptul9Z1Oit3tDKxul
 3qjVktQ/i3tf08IpeyluZJm0G030wnzCELwqcpIsqxOeYX9xHAmPsfA2lnAobH2iI/
 hWck9RjN7KSaV2qfKo+WD+82KTDgWLDtYj5bvMW8=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:12])
 by sas2-32987e004045.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6CLcHCW0d0-rCX0XiYO; Wed, 27 May 2020 23:53:12 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 27 May 2020 23:53:11 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v6 4/5] block: make size-related BlockConf properties
 accept size suffixes
Message-ID: <20200527205311.GA373697@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Fam Zheng <fam@euphon.net>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
 <20200527124511.986099-5-rvkagan@yandex-team.ru>
 <d2ac3549-e63d-d737-41fa-21965c551175@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2ac3549-e63d-d737-41fa-21965c551175@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Keith Busch <kbusch@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 27, 2020 at 09:50:39AM -0500, Eric Blake wrote:
> On 5/27/20 7:45 AM, Roman Kagan wrote:
> > Several BlockConf properties represent respective sizes in bytes so it
> > makes sense to accept size suffixes for them.
> > 
> > Turn them all into uint32_t and use size-suffix-capable setters/getters
> > on them; introduce DEFINE_PROP_SIZE32 and adjust DEFINE_PROP_BLOCKSIZE
> > for that. (Making them uint64_t and reusing DEFINE_PROP_SIZE isn't
> > justified because guests expect at most 32bit values.)
> > 
> > Also, since min_io_size is exposed to the guest by scsi and virtio-blk
> > devices as an uint16_t in units of logical blocks, introduce an
> > additional check in blkconf_blocksizes to prevent its silent truncation.
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> > v5 -> v6:
> > - add prop_size32 instead of going with 64bit
> 
> Would it be worth adding prop_size32 as its own patch, before using it here?

I've no strong opinion on this.  Should I better split it out when
respinning?

> But I'll review this as-is.
> 
> > +++ b/hw/block/block.c
> > @@ -96,6 +96,17 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp)
> >           return false;
> >       }
> > +    /*
> > +     * all devices which support min_io_size (scsi and virtio-blk) expose it to
> > +     * the guest as a uint16_t in units of logical blocks
> > +     */
> > +    if (conf->min_io_size > conf->logical_block_size * UINT16_MAX) {
> 
> This risks overflow.  Better would be:
> 
> if (conf->min_io_size / conf->logical_block-size > UINT16_MAX)

D'oh.  I kept it in mind and did it right initially in v4, but then
mixed it up.  Thanks for catching!

> 
> > +        error_setg(errp,
> > +                   "min_io_size must not exceed " stringify(UINT16_MAX)
> > +                   " logical blocks");
> > +        return false;
> > +    }
> > +
> >       if (!QEMU_IS_ALIGNED(conf->opt_io_size, conf->logical_block_size)) {
> >           error_setg(errp,
> >                      "opt_io_size must be a multiple of logical_block_size");
> 
> > +++ b/tests/qemu-iotests/172.out
> > @@ -24,11 +24,11 @@ Testing:
> >                 dev: floppy, id ""
> >                   unit = 0 (0x0)
> >                   drive = "floppy0"
> > -                logical_block_size = 512 (0x200)
> > -                physical_block_size = 512 (0x200)
> > -                min_io_size = 0 (0x0)
> > -                opt_io_size = 0 (0x0)
> > -                discard_granularity = 4294967295 (0xffffffff)
> > +                logical_block_size = 512 (512 B)
> > +                physical_block_size = 512 (512 B)
> > +                min_io_size = 0 (0 B)
> > +                opt_io_size = 0 (0 B)
> > +                discard_granularity = 4294967295 (4 GiB)
> 
> Although 4 GiB is not quite the same as 4294967295, the exact byte value
> next to the approximate size is not too bad.  The mechanical fallout from
> the change from int to size is fine to me.

Thanks,
Roman.

