Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A331408CA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:17:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPb8-0008Md-H7; Fri, 17 Jan 2020 11:15:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPb6-0008MY-QV
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:15:28 +0000
X-Inumbo-ID: a7d6f422-391a-11ea-b4d6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7d6f422-391a-11ea-b4d6-12813bfff9fa;
 Fri, 17 Jan 2020 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579259724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n/XW7qW8NZEm89cH9VqLCs6KlVnFE9CePeT3gKbPXpw=;
 b=KviTa1nmTL02O7utzUraIILsewFxPILsZ3QYKwd+xofULnQrX6rUyp4P
 8fP/e7mrd9GgUU7Ar7O8TQBJkdpGf80OK0UFAlJLv2BGu5YUMGedOz6qW
 aezytoR+3FFBvfkH4eTctHQy0vhdWRj74Gjt0BmiRUNC1S/7o7mwGWnmp o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5iRTS63EJtCwvdqHk71ne3ulNZZVjO9cEladb5ThxTG0MmgMKyDOD2xd6QCZYQ3vJhoa+r2JuO
 5aRxZT9OEAOrhyEgXih3obRcCmrm1c+b5msWkNXuop3ywxGQ6XgFHjPAg+OWG0OyzUqJSFzN9v
 2L/ZXD4e3boui1QqMjoTQbqeTNEBO4UXUVYhisZzwAPhG5wf1pYORR6QtlNxoj//c5fLoKldmm
 xfuHuIL8eb4FHVJd0lcjLbfvEsCSLNiTZOrnHu7IagHX8vgktGVkbgpPj0F+9lzJ5WvNhymhbn
 rzg=
X-SBRS: 2.7
X-MesageID: 11433120
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11433120"
Date: Fri, 17 Jan 2020 11:15:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200117111521.GB1288@perard.uk.xensource.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
 <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
 <fec3f76c-c85e-1bd6-2049-c0b6031005fe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fec3f76c-c85e-1bd6-2049-c0b6031005fe@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 00/18] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMTA6MTI6MTRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUGxlYXNlIG5vdGUgdGhhdCBteSBwcmV2aW91cyBtYWlsIHdhcyBfdG9fIEdlb3JnZSwg
d2l0aCB5b3Ugb25seQo+IF9jY18tZWQuIEhlbmNlIHRoZSBxdWVzdGlvbiB3YXMgdG8gR2Vvcmdl
LCBub3QgeW91LiAoSXQgaXMgYQo+IGNvbW1vbiBpc3N1ZSB3aGljaCBJIGtlZXAgbWVudGlvbmlu
ZyBvbiBtZWV0aW5ncyB0aGF0IHRoZQo+IGRpc3RpbmN0aW9uIG9mIFRvIGFuZCBDYyBpcyBvZnRl
biBub3QgYmVpbmcgaG9ub3JlZCwgYWxiZWl0Cj4gdHlwaWNhbGx5IG1vcmUgYnkgc2VuZGVycyB0
aGFuIHJlY2lwaWVudHMuKQoKVGlwOiBKYW4sIHlvdSBjb3VsZCBhbHNvIGhhdmUgc3RhcnRlZCB0
aGUgc2VudGVuY2UgYnkgIkdlb3JnZSwgIiBpbgphZGRpdGlvbiB0byBwcm9wZXJseSBzZXR0aW5n
IHRoZSAiVG86IiwgaXQgd291bGQgaGVscCBhIGxvdCBJIHRoaW5rLgoKVGVhY2hpbmcgcGVvcGxl
IGFib3V0IHNldHRpbmcgcHJvcGVybHkgIlRvOiIsIGFuZCByZWFkaW5nIGl0IGJlZm9yZQpyZWFk
aW5nIHRoZSBlbWFpbCBpcyBhIGxvc3QgZmlnaHQgSSB0aGluay4gRXZlbiBzbyBpdCBjYW4gYmUg
dXNlZnVsIHRvCmZpbHRlciBlbWFpbCB3aGljaCBuZWVkcyBhIHJlc3BvbnNlLgoKQ2hlZXJzLAoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
