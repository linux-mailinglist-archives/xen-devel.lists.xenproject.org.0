Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E125426
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 17:37:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT6lo-00060j-9q; Tue, 21 May 2019 15:33:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dk3M=TV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hT6ll-00060e-Os
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:33:38 +0000
X-Inumbo-ID: cb3ecc9c-7bdd-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::8])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb3ecc9c-7bdd-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558452813;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/GrReZWDkZNxVShcQfLzKh5jceHC2hoUGodg4fE+1W0=;
 b=RSpDpboycyEWfaGsUh/2InH7JdY5f15O2IdpGB8p2P1aNHqxvsCKx7/kFKpDFrjlKr
 tB4059ZtcApgiEodnnjl0v9IsptpccYoGK9wpE7oo9+vt3tlpqEUxFcSksiEfubwAW1U
 Nd5ulqf7TjHn2gMPd0i6tGILNrsYdlvNMNClymbITQ9ojNTmG/edJQf0dnNMgKCNc2hr
 pv9OLngwoCYmkbA0/IucD5UCdRdJnYi2h96Uly7EgqlxL+vUvhCwZFdoAObeMgCoNKFA
 wJzPnBy0TvpdRmm/V+V29WRI4A8ry1Fsx+p3BmSJ3VZ/3KTiMOLnzMkR/T7GwQgqr6ca
 sx0w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G5Mjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 44.21 DYNA|AUTH)
 with ESMTPSA id N09966v4LFXX7hY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 21 May 2019 17:33:33 +0200 (CEST)
Date: Tue, 21 May 2019 17:33:29 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190521153329.GA11623@aepfle.de>
References: <20190521143702.GH1846@zion.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <20190521143702.GH1846@zion.uk.xensource.com>
User-Agent: Mutt/1.11.4 (20190510T140348.ce6e1db0)
Subject: Re: [Xen-devel] Unhandle NONE type device model broke QDISK backend
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============6234672158450109682=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6234672158450109682==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 21, Wei Liu wrote:

> bxl: debug: libxl_device.c:380:libxl__device_disk_set_backend: Disk vdev=xvda spec.backend=qdisk
> libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:backend_kind 3, no need to execute scripts

The backtrace looks like that:
(gdb) bt
#0  libxl_device_disk_dm_needed (e=0x5555557950b0, domid=0) at libxl_disk.c:1151
#1  0x00007ffff791c9a9 in libxl__need_xenpv_qemu (gc=gc@entry=0x555555795570, d_config=d_config@entry=0x7fffffffdb90) at libxl_dm.c:3196
#2  0x00007ffff7911bdb in libxl__domain_set_device_model (gc=gc@entry=0x555555795570, d_config=d_config@entry=0x7fffffffdb90) at libxl_create.c:50
#3  0x00007ffff7914a36 in initiate_domain_create (egc=egc@entry=0x7fffffffd970, dcs=dcs@entry=0x555555797960) at libxl_create.c:967
#4  0x00007ffff791505f in do_domain_create (ctx=ctx@entry=0x555555790860, d_config=d_config@entry=0x7fffffffdb90, domid=domid@entry=0x7fffffffdac8, restore_fd=restore_fd@entry=-1,
    send_back_fd=send_back_fd@entry=-1, params=params@entry=0x0, ao_how=0x0, aop_console_how=0x0) at libxl_create.c:1766
#5  0x00007ffff7915c8e in libxl_domain_create_new (ctx=0x555555790860, d_config=0x7fffffffdb90, domid=0x7fffffffdac8, ao_how=0x0, aop_console_how=0x0) at libxl_create.c:1980
#6  0x0000555555579a98 in create_domain (dom_info=0x7fffffffe0f0) at xl_vmcontrol.c:932
#7  0x000055555557abfa in main_create (argc=3, argv=0x7fffffffe3c8) at xl_vmcontrol.c:1242
#8  0x0000555555561116 in main (argc=3, argv=0x7fffffffe3c8) at xl.c:413

(gdb) p *elem
$2 = {backend_domid = 0, backend_domname = 0x0, pdev_path = 0x55555579b120 "/nfs_vmimages/sle12sp2/vdisk.pv_sle12sp2_c_qcow2.disk0.qcow2", vdev = 0x555555794670 "xvda",
  backend = LIBXL_DISK_BACKEND_UNKNOWN, format = LIBXL_DISK_FORMAT_QCOW2, script = 0x0, removable = 0, readwrite = 1, is_cdrom = 0, direct_io_safe = false, discard_enable = {val = 0},
  colo_enable = {val = 0}, colo_restore_enable = {val = -1}, colo_host = 0x0, colo_port = 0, colo_export = 0x0, active_disk = 0x0, hidden_disk = 0x0}

backend is not initialized at this point.
With 'backend=qdisk' it will be initialized, so there is some ordering bug.

Olaf

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOQaRgAKCRBdQqD6ppg2
fuT+AJ4mee2QeqUJanH3sX/mEC07iVihJgCg4j9+JjNg9YOVnlLzV0FPNvXK8cI=
=kIdN
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--


--===============6234672158450109682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6234672158450109682==--

