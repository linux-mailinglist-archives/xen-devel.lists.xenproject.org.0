Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9E171702
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 13:21:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7I7c-0006Lo-Nw; Thu, 27 Feb 2020 12:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGbP=4P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j7I7b-0006Lf-QC
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 12:18:31 +0000
X-Inumbo-ID: 4405d37e-595b-11ea-83b0-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4405d37e-595b-11ea-83b0-bc764e2007e4;
 Thu, 27 Feb 2020 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582805911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=leJlT/PogD+4eEMLNXJBwg3gOe8mb22nIY33UNBkSvg=;
 b=CtZwjNxSlhKQaSumuhRlfXU+UjtZBcA34sUIQ2b7jZ4mVr2eGmWWKf3w
 161PedPmyElgWfRZ5k/eRRrySqnQ9ZROHQ39e9lns00iAkHjyKcRnnhGS
 hkAl7XUetA+HOailSqTwgHWqXAsBDNGtkZ7nTy4S7UstY0lIW+ExRl2Lq A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EZcnnE8ANHumrgCk71hvQ1MXqxkdFYtqR8fspKhUhtBHUwmitLzR+F+5/cs9t0beQWMM1mtcbv
 tD9Yq2Lxv0ta67YvabechDPL8+baFjNJITKLsI3utX36OLiVkwSkHFVQ3iALXoRfPckMbZMa/D
 Xd1FVZWLcZslqlJ9JwgJT6ZPg0lyb9gQumXeorVq9YRQhH0axUJ5krVgN23Wdkg24XSELvb+MZ
 Nc/FDZLGMmJYbPBMBL8GXdhb1OdxdXvXOzs21jK0Wcvi05X43VaBubDZqGrOD/cXxlMgsc4oPR
 ww4=
X-SBRS: 2.7
X-MesageID: 13277810
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13277810"
Date: Thu, 27 Feb 2020 12:18:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <pdurrant@gmail.com>
Message-ID: <20200227121825.GE2193@perard.uk.xensource.com>
References: <20191014142246.4538-1-philmd@redhat.com>
 <20191014142246.4538-9-philmd@redhat.com>
 <CACCGGhCaC5-K+q+fJpTt5aZQ=-XurNAWwNDvKunBLaFHvu7yow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACCGGhCaC5-K+q+fJpTt5aZQ=-XurNAWwNDvKunBLaFHvu7yow@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH 08/20] hw/xen/xen_pt_load_rom: Remove unused
 includes
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Gerd
 Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>, David
 Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDM6Mjk6NDJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9uIE1vbiwgMTQgT2N0IDIwMTkgYXQgMTU6MjcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4geGVuX3B0X2xvYWRfcm9tLmMg
ZG9lcyBub3QgdXNlIGFueSBvZiB0aGVzZSBpbmNsdWRlcywgcmVtb3ZlIHRoZW0uCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KCkhpLAoKSSd2
ZSBhZGRlZCB0aGlzIHBhdGNoIHRvIGEgcHVsbCByZXF1ZXN0cyBmb3IgdGhlIHhlbi4KCkNoZWVy
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
