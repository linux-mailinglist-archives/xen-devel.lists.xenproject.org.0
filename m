Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46673D1446
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 18:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIEwU-0003XH-FU; Wed, 09 Oct 2019 16:36:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tdgz=YC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iIEwS-0003XC-J8
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 16:36:00 +0000
X-Inumbo-ID: df5f30f8-eab2-11e9-97f5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df5f30f8-eab2-11e9-97f5-12813bfff9fa;
 Wed, 09 Oct 2019 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570638958;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/FY0FR0FFCwUOCxdig4Uu2ezzxpLfslCJKHq33J2Z44=;
 b=EZT84r249KRUToWwjV7WylOVf5ZCAJcAKZ4zc21LGzxgWrDZySQdjKtw
 PSHxjsIegc1fenXlSdjrDzuIuRSbSp3Hzif8J8pDD/L5f/eHdFhSTE14Q
 qQuSH0UEtBc7tNBqibyQmcmrCk2z5TZ6F7EX46u14JKYM1hnz8DXSyoQF o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IEXGRPlHTSGDVQE97LEFmfoLZ8J58GLK7Th7hDFETJhunsClTrxeoQ+v91rA5/pW0HLRMZ+CR/
 8ZoEFhFBohLLcm8SYaDI09LJDWigM74Vw2vfbxRCGqQ7/DaWNu6Na0jnAqwBaN4W7jrKrUKlJD
 8j0ErtifArvE9Dz7/UJ6QOiMNwhB2W3wA4YlMVi32WIHx6uhv5sCV0/0yO+QyTsHVCUuBx+3h1
 rtIbB9HoN4T8QWOSx28/7qvpT/nwvsEk+rpGvoW8jU5nQOFWUUnXS8uu8//3P9G03xn3wEpX7c
 Ux8=
X-SBRS: 2.7
X-MesageID: 7057073
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,276,1566878400"; 
   d="scan'208";a="7057073"
Date: Wed, 9 Oct 2019 17:35:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20191009163556.GB18712@perard.uk.xensource.com>
References: <1285554440.4009671.1570271711943.ref@mail.yahoo.com>
 <1285554440.4009671.1570271711943@mail.yahoo.com>
 <20191008083911.GA66437@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008083911.GA66437@Air-de-Roger>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] How PV frontend and backend initializes?
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMTA6Mzk6MTFBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBTYXQsIE9jdCAwNSwgMjAxOSBhdCAxMDozNToxMUFNICswMDAwLCB0b3No
ZXIgMSB3cm90ZToKPiA+IDMuIEhvdyB4ZW5idXMgZGlyZWN0b3JpZXMgYXJlIGNyZWF0ZWQ/IFdo
YXQgaXMgdGhlIGhpZXJhcmNoeSBvZiB0aGUgZGlyZWN0b3JpZXM/IAo+IAo+IFRoZXkgYXJlIGNy
ZWF0ZWQgYnkgdGhlIHRvb2xzdGFjayBkdXJpbmcgZG9tYWluIGNyZWF0aW9uOiB4bC9saWJ4bC4K
PiBUaGVyZSBhcmUgZG9jdW1lbnRzIGluIHRoZSBwdWJsaWMgaGVhZGVycyB0aGF0IGRlc2NyaWJl
IHRoZSBleHBlY3RlZAo+IGFuZCBvcHRpb25hbCB4ZW5zdG9yZSBub2RlcyBmb3IgZWFjaCBkZXZp
Y2UsIHNlZToKPiAKPiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9
dHJlZTtmPXhlbi9pbmNsdWRlL3B1YmxpYy9pbwoKVGhlIGhpZXJhcmNoeSBvZiB0aGUgZGlyZWN0
b3JpZXMgY2FuIGJlIGZvdW5kIGluIHRoaXMgb3RoZXIgZG9jdW1lbnQ6CgpodHRwczovL3hlbmJp
dHMueGVucHJvamVjdC5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3hlbnN0b3JlLXBhdGhzLmh0bWwK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
