Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB014B6904
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 19:25:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAdfK-0007se-1W; Wed, 18 Sep 2019 17:22:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAdfI-0007sG-Qw
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 17:22:52 +0000
X-Inumbo-ID: f0ecc06a-da38-11e9-963e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0ecc06a-da38-11e9-963e-12813bfff9fa;
 Wed, 18 Sep 2019 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568827371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MSeM4p/BKiG/iqBp10DlpyI1rlqC/qUSZnKA936JU3o=;
 b=cpVBMwREO8fwvIcBGerufZV0u5RMXFgOSr/Vkwts7Xpum988AAoRver3
 RLuVLEvEsCHwlQ0OBeheo9e01VbnnPk0oD9eBU//pSpZ+K77unoqSdjnq
 tp6pgYFe4izwEZqlhTWqENFAmFZEscP4MJrdQlIU7O34mgvJKbN6CVoMA c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oNjdiTswyNciVojX0ZB4+DqhmZQqvuMcnx7uPDyuWmNSYbPuCOHhcmUVI9MBAMdRUiQvsEyTCk
 t6hEOA2PN1599YhRCzaI33mP0X/GYFeD44dxeWcRsPBNbT1wddNtbDiOthAFGs14aremREcNyX
 +g4K3/d8R+pJ+cy3gjQDMlufyBZb175+eZURjjq8ur0hSmTHOsCjRq9k3cVsd3YvOIMkV9vDpX
 /bupUjwYAf0F0NcGAzMAJTNHWQwiTYCnegDdOEHWiY4AR8xYWZcbBnmV/YQMTbZLIm0wjVyS6V
 1q8=
X-SBRS: 2.7
X-MesageID: 5743141
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5743141"
Date: Wed, 18 Sep 2019 18:22:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918172243.GQ1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-29-anthony.perard@citrix.com>
 <23937.5522.999447.418653@mariner.uk.xensource.com>
 <20190918142345.GN1308@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918142345.GN1308@perard.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 28/35] libxl_pci: Use ev_qmp in do_pci_add
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDM6MjM6NDVQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDY6MTk6MTRQTSArMDEwMCwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUEFUQ0ggMjgvMzVdIGxp
YnhsX3BjaTogVXNlIGV2X3FtcCBpbiBkb19wY2lfYWRkIik6Cj4gPiA+IFRoaXMgcGF0Y2ggYWxz
byByZXBsYWNlcyB0aGUgdXNlIG9mCj4gPiA+IGxpYnhsX193YWl0X2Zvcl9kZXZpY2VfbW9kZWxf
ZGVwcmVjYXRlZCgpIGJ5IGl0cyBlcXVpdmFsZW50Cj4gPiA+IHdpdGhvdXQgdGhlIG5lZWQgZm9y
IGEgdGhyZWFkLgo+ID4gCj4gPiBBZ2Fpbiwgd291bGQgaXQgYmUgZWFzeSB0byBhZGQgYSBwcmUt
cGF0Y2ggc28gSSBjYW4gc2VlIHRoZSBjb2RlCj4gPiBjaGFuZ2VzID8gIElmIG5vdCBJIHdpbGwg
Y29tcGFyZSBsaW5lLWJ5LWxpbmUgYnkgaGFuZC4KPiAKPiBJdCBkb2Vzbid0IGxvb2sgdG8gaGFy
ZCwgSSBnaXZlIGl0IGEgdHJ5LgoKSXQncyBwcm9iYWJseSBnb2luZyB0byBiZSBxdWlja2VyIGZv
ciB5b3UgdG8gcmV2aWV3IHRoZSBwYXRjaCBhcyBpcyB0aGFuCmZvciBtZSB0byBiZSBhYmxlIHRv
IHdyaXRlIGEgcHJlLXBhdGNoIHRoYXQgY2FuIGJ1aWxkLCBmb3IgdGhlIHNhbWUKcmVhc29uIGFz
IHRoZSBvdGhlciBwYXRjaC4gSSBjb3VsZCB0cnkgdG8gY29tZSB1cCB3aXRoIGEgcHJlLXBhdGNo
IHdoZXJlCm1vc3Qgb2YgdGhlIGNvZGluZyBzdHlsZSBjaGFuZ2UgYXJlIGFwcGxpZWQsIGJ1dCB0
aGF0J3MgYWJvdXQgaXQuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
