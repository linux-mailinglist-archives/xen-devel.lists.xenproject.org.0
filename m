Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49E65FF2F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472477.732707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkLb-0002Bf-76; Fri, 06 Jan 2023 10:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472477.732707; Fri, 06 Jan 2023 10:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkLb-00029P-2a; Fri, 06 Jan 2023 10:53:15 +0000
Received: by outflank-mailman (input) for mailman id 472477;
 Fri, 06 Jan 2023 10:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6IK=5D=citrix.com=prvs=36316be06=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pDkLZ-00029J-3u
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:53:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cfb5768-8db0-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 11:53:09 +0100 (CET)
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
X-Inumbo-ID: 4cfb5768-8db0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673002389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Wk2TSCEO9A+5OEvRCIDTA7EztFEDFJs4i2Z9OGalEk=;
  b=FJThnpB0G0nAi5Uj4/vTmBx89lsFwzWXoSGCQ5wri/bsJ1jpRfWWV54T
   xJ2jQLqNlzJLtxKZFJAvpiggtADuoFxCGsNqY/vuR/kp8OKrEHylleegg
   s8BxWyRe1y0KC6GUnbF6OVGSeM74U3EtC5eNR0BHPq5BjOrvUeYtwq0bm
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90405203
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ullLqqDkDLmaBBVW/33kw5YqxClBgxIJ4kV8jS/XYbTApDp2hmECy
 2sbDzqBOfaLYWr0cowgPo7j9E4Bu5/Tz9VqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxtxWG1NRq
 fgjMwsObSuM2Mu7+52RY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKEIoDSGJ8NxS50o
 Erhw0DwIjgHF+bYzBub6U61rMOVuR/CDdd6+LqQqacx3Qz7KnYoIBAaSFKhrf6Rike0WNVEN
 woS9zZGhbIz/0yiVNW7XxC+rHOepRkac95RFeQg70eK0KW8ywOQHGMJSnhIcNIrsMU/WDkC2
 VqAntevDjtq2JWMRHeAs7uZsz62ES4SK2AEeGkDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYjz6+8+0LGhTOEvJXFTgcpoA7QWwqN5wd0dMi6Zois6FHe9vFGBJyUQlmIo
 D4PnM32xOoUBpGQny+faOwKGPei4PPtGCXVnFpHD5QnsTO39BaLZptM6TtzIENoNMcsejLzZ
 kLX/wRL6/d7OWC2RbV6b4K4F4Ihyq2IKDj+fqmKNJwUOME3LVLZunE1DaKN44zzuHQWsLsNJ
 sufSt2XDnUhBvtOwQGZbc5IhNfH2RsC7W/UQJn6yTGu3ryfeGOZRN85DbeeUgwqxPja+VuIq
 r6zI+PPkkwCC7OmPkE75KZJdTg3wW4H6YcaQiC9XsqKOUJYFW4oEJc9KptxKtU+z8y5egoll
 0xRu3O0KnKl3hUryi3QMBiPjY8Dur4hxU/XxQR2YT6VN4ELOO5DFps3eZotZqUA/+d+1/NyR
 PRtU5zeXa4eFm+aq2VBPMiVQGlemPKD31Lm082NOWFXQnKdb1aRpo+MkvXHrkHi8RZbReNh+
 ub9h2s3sLIIRhh4Dda+Vc9DO2iZ5CBH8MorBhugHzWmUBm0mGScA3Cr36BfzgBlAUmr+wZ2I
 C7NXEZE9bGS+tZlmDQL7Ijdx7qU/yJFNhIyNwHmAXyebEE2IkLLLVd8bdu1
IronPort-HdrOrdr: A9a23:12j/1qAICkWol0nlHemW55DYdb4zR+YMi2TDsHocdfU1SKOlfq
 WV98jzuiWbtN98YhAdcLK7Scq9qALnlaKdiLN5Vd3OYOCBghrMEGgI1/qB/9SPIVyYysdtkY
 tmbqhiGJnRIDFB/KDHCdCDYrId/OU=
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="90405203"
Date: Fri, 6 Jan 2023 10:52:54 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	<xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <Y7f9hi0SqYk6KQzW@perard.uk.xensource.com>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
 <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
 <20230103081456.1d676b8e.alex.williamson@redhat.com>
 <cbfdcafc-383e-aea3-d04d-38388fab202f@aol.com>
 <ba4f8fd6-ae10-da60-7ef5-66782f29fdb9@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba4f8fd6-ae10-da60-7ef5-66782f29fdb9@aol.com>

On Tue, Jan 03, 2023 at 05:58:01PM -0500, Chuck Zmudzinski wrote:
> Hello Anthony and Paul,

Hi Chuck,

> I am requesting your feedback to Alex Williamson's suggestion that this
> problem with assigning the correct slot address to the igd on xen should
> be fixed in libxl instead of in qemu.
> 
> It seems to me that the xen folks and the kvm folks have two different
> philosophies regarding how a tool stack should be designed. kvm/libvirt
> provides much greater flexibility in configuring the guest which puts
> the burden on the administrator to set all the options correctly for
> a given feature set, while xen/xenlight does not provide so much
> flexibility and tries to automatically configure the guest based on
> a high-level feature option such as the igd-passthrough=on option that
> is available for xen guests using qemu but not for kvm guests using
> qemu.
> 
> What do you think? Should libxl be patched instead of fixing the problem
> with this patch to qemu, which is contrary to Alex's suggestion?

I do think that libxl should be able to deal with having to put a
graphic card on slot 2. QEMU already provides every API necessary for a
toolstack to be able to start a Xen guest with all the PCI card in the
right slot. But it would just be a bit more complicated to implement in
libxl.

At the moment, libxl makes use of the QEMU machine 'xenfv', libxl should
instead start to use the 'pc' machine and add the "xen-platform" pci
device. (libxl already uses 'pc' when the "xen-platform" pci card isn't
needed.) Also probably add the other pci devices to specific slot to be
able to add the passthrough graphic card at the right slot.

Next is to deal with migration when using the 'pc' machine, as it's just
an alias to a specific version of the machine. We need to use the same
machine on the receiving end, that is start with e.g. "pc-i440fx-7.1" if
'pc' was an alias for it at guest creation.


I wonder if we can already avoid to patch the 'xenfv' machine with some
xl config:
    # avoid 'xenfv' machine and use 'pc' instead
    xen_platform_pci=0
    # add xen-platform pci device back
    device_model_args_hvm = [
        "-device", "xen-platform,addr=3",
    ]
But there's probably another device which is going to be auto-assigned
to slot 2.


If you feel like dealing with the technical dept in libxl, that is to
stop using 'xenfv' and use 'pc' instead, then go for it, I can help with
that. Otherwise, if the patch to QEMU only changes the behavior of the
'xenfv' machine then I think I would be ok with it.

I'll do a review of that QEMU patch in another email.

Cheers,

-- 
Anthony PERARD

