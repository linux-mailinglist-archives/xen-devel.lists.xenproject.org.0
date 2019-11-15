Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3EBFE3E5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 18:26:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVfJm-0002w2-Fu; Fri, 15 Nov 2019 17:23:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVfJl-0002vu-Nb
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 17:23:33 +0000
X-Inumbo-ID: a5216514-07cc-11ea-a27d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5216514-07cc-11ea-a27d-12813bfff9fa;
 Fri, 15 Nov 2019 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573838611;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=E+YPBmRZuwWCYwQ++j/VgVvLC6os/CILF8llUjCUNik=;
 b=g8GkIRNbbowTSDt23FogdlAO/XAE5/oOWcj5WCrwplN7zUibu5UaOczS
 kNJqX4zHHwq2n1FU2CkIeFjkdq4bbS+fFm5u4tHAITm7hR5qL14XkoZDc
 YfshPufHy+JT9fVaeC75GArNGtx0v7kDrsbvfB6SCKYYT/ylBrr2u8NM/ k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Wkb/qO4i5qJ6wK+wz2Km7L8ZHZ2bgl9C9/bZ+RgX+h3coNhaZ+mfQvUsIuxo2X8mtwKXcfqQgh
 Ve3NmTwoflvpGLDwSLUc9sRVVWMqqWbY6ZxLAkgKRBVlSPwrjJFMuwQ6a2EwoxoHeMRR4NYVcP
 Lo/PFc7GKvvvxOREzL67X0KxhaE4Gwaanb1KDJcrLjqDh4IHLw5IRCg8iI+OyTQk2iOl4ROrp3
 c8i/zQbCivINq17krR/ULFLDsPhOgU260+DIDNF7kAzNmTvDY2Iq4ULK886xTdhFCjpGyYZyhI
 MY0=
X-SBRS: 2.7
X-MesageID: 8808637
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8808637"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.57104.551178.557836@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 17:23:28 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191031121727.287419-1-anthony.perard@citrix.com>
References: <20191031121727.287419-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl_pci: Don't hold QMP
 connection while waiting
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xM10gbGlieGxfcGNpOiBE
b24ndCBob2xkIFFNUCBjb25uZWN0aW9uIHdoaWxlIHdhaXRpbmciKToKPiBBZnRlciBzZW5kaW5n
IHRoZSAnZGV2aWNlX2RlbCcgY29tbWFuZCBmb3IgYSBQQ0kgcGFzc3Rocm91Z2ggZGV2aWNlLAo+
IHdlIHdhaXQgdW50aWwgUUVNVSBoYXMgZWZmZWN0aXZlbHkgZGVsZXRlZCB0aGUgZGV2aWNlLCB0
aGlzIGludm9sdmVzCj4gZXhlY3V0aW5nIG1vcmUgUU1QIGNvbW1hbmRzLiBXaGlsZSB3YWl0aW5n
LCBsaWJ4bCBob2xkIHRoZSBjb25uZWN0aW9uLgoKSSBqdXN0IHJlYWQgdGhlIGNvZGUgaGVyZS4g
IEl0IHNlZW1zIHRvIHBvbGwgb24gYSB0aW1lci4gIEhvdyB1Z2x5LgoKPiBJdCBpc24ndCBuZWNl
c3NhcnkgdG8gaG9sZCB0aGUgY29ubmVjdGlvbiBhbmQgaXQgcHJldmVudHMgb3RoZXJzIGZyb20K
PiBtYWtpbmcgcHJvZ3Jlc3MsIHNvIHRoaXMgcGF0Y2ggcmVsZWFzZXMgdGhlIFFNUCBjb25uZWN0
aW9uLgoKUmlnaHQuCgo+ICAgICAgaWYgKHJjKSBnb3RvIG91dDsKPiAgCj4gKyAgICBsaWJ4bF9f
ZXZfcW1wX2Rpc3Bvc2UoZ2MsIHFtcCk7Cj4gKwo+ICAgICAgYXNrZWRfaWQgPSBHQ1NQUklOVEYo
UENJX1BUX1FERVZfSUQsCgpJdCdzIG5vdCBpdCBlbnRpcmVseSBjbGVhciB0byBtZSB3aHkgeW91
IGRpc3Bvc2UgdGhpcyBiZWZvcmUgdGhlIGVycm9yCmV4aXQsIGJ1dCBJIHRoaW5rIGl0IGRvZXNu
J3QgbWF0dGVyLiAgSWYgaXQgZG9lcyBtYXR0ZXIgdGhlbiBwbGVhc2UKZXhwbGFpbiA6LSkuCgpB
Y2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGFua3Ms
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
