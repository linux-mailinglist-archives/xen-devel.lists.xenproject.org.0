Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0510C6FA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:44:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaHFY-0001fN-QJ; Thu, 28 Nov 2019 10:42:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RBoy=ZU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iaHFY-0001fI-7O
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:42:16 +0000
X-Inumbo-ID: bd98ee92-11cb-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd98ee92-11cb-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574937736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tfDyq0Znvr2FU1aKqXxkAGoN+4XIK/rJ5K6AeFyXnto=;
 b=CNRNjlFmb3hYsqY7HuVpScYQ6RsaepW5JB4YD5OMIYLnIJLOnIhhmpsi
 ont1aaxfv45331F+36YeMtZNEAwk0xAVAljM0QZrF6VtBm5YkhusrKqFK
 PJVR3rFqb6a9fNMw4DBOGG+fQ0V0B97K78CSajvEF7x9z4OGMlp9Kouqi Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uXYQdYUuEq3Ia6p9wi1nR3TjSDHyHUdeNtC5KNd92fjTUG1MN432D7WYo5QW2J4/UnRU/aK+qH
 1gKSSCzower9Jp6uEfn2i7Jo6eCiAfyfCea4pLu/cxJ+zM0oSuESx3/2CWwp/GpCojGzI0cPqt
 56us96tO4aJVCq1mj+VoJ55NIxr11V2sZ2cmMJi4seBNKY6b8mVkxy5Qx9kp6DqppaWLnBinY/
 5yu39JsG3GE7clECTFhax2y3RZY1s9FCWRpctPsxDRuhWmTJdFs5bC/IU3Gv4hJuOvuXbcL/dq
 OQ4=
X-SBRS: 2.7
X-MesageID: 8953015
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8953015"
Date: Thu, 28 Nov 2019 10:42:11 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew <andrew@donehue.net>
Message-ID: <20191128104211.GC1155@perard.uk.xensource.com>
References: <63a86773-8b9c-0634-2157-ea71cb6eff74@donehue.net>
 <CAFLBxZZNnNQHFoLHqWghELMMKYZV4pwGrbDoK7=WgZc1Y5ZV-Q@mail.gmail.com>
 <7ebeddd0-4726-7294-5e31-c05802e50802@donehue.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ebeddd0-4726-7294-5e31-c05802e50802@donehue.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [Xen-users] 4.13RC3 and PVHVM makes drive drops
 just after boot
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <dunlapg@umich.edu>,
 "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6NTQ6NDJQTSArMTAwMCwgQW5kcmV3IHdyb3RlOgo+
IEkgaGF2ZSB0aGUgc3lzdGVtIHNldHVwIGZvciB0ZXN0aW5nLCBzbyBoYXBweSB0byB0ZXN0IGFu
eSBwYXRjaGVzIHRoYXQgbWF5Cj4gY29tZSBvdXQuCgpUaGFua3MgQW5kcmV3IGZvciB0aGUgcmVw
b3J0LCBJIHRoaW5rIEkgdW5kZXJzdGFuZCB0aGUgaXNzdWUuIEknbGwgd29yawpvbiBhIGZpeC4K
CkNoZWVycywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
