Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69A140EF2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:27:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUPb-0006au-86; Fri, 17 Jan 2020 16:23:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isUPZ-0006ap-0S
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:23:53 +0000
X-Inumbo-ID: bd5645fa-3945-11ea-b587-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd5645fa-3945-11ea-b587-12813bfff9fa;
 Fri, 17 Jan 2020 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579278228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UIVzi7yP9nKXfYawhdmAS6ZZrsyM8wPbK+JzYmvP2II=;
 b=QWffpUAhJDV6J9jrss8oyt3GT/HJVv7P8Lod0mTeZwwJGnZk95wWbj+G
 VAT4mkuNHcP4gsSBoUFrL2CwMeSvYrclfdaQFMZ5XqAXMnpdLxC8hI7K9
 /7Qzk1s3jCwVPMgK/v4P/kKB1pP4IS+R2gf3GcaQtPcTBBrcf6zOicX74 g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NTOlrM2Dj8Vv8YRPyd/B0lI8UQxXWGKmDM4NMD/l7q2H82I8ahg2sFvVzFBoY/EJ7s3bVkiwBp
 RMU5dSRRMXV8phjgyo9JY8kzUEMiSFkdjRdZSObWe8xymdG31FWTDh7UyWXaJxs8UG030znx9r
 Lgo3J+WjLLAo1/BO2ejJ0siOOWgbUqwdv3UKB4tnFad0rjL4VW9/3+pqcZcLOkDNAOTaS+WVUq
 9R0fRqrLjY+MvswgOiNNBRWhLew3ONLn6+pbDED+GXhaEDYiT+sPTxP8h/yYlt79z7Aw618BEw
 tL8=
X-SBRS: 2.7
X-MesageID: 11074865
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11074865"
Date: Fri, 17 Jan 2020 16:23:45 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200117162345.GE1288@perard.uk.xensource.com>
References: <20200115170015.249667-1-anthony.perard@citrix.com>
 <20200115170015.249667-3-anthony.perard@citrix.com>
 <1b0dcb84-425c-48a2-dba8-03385d3bf4e2@suse.com>
 <20200116122922.GA1288@perard.uk.xensource.com>
 <f09684ed-4a82-0547-8cd1-019a6b762fe4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f09684ed-4a82-0547-8cd1-019a6b762fe4@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMDE6NDA6MzlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTYuMDEuMjAyMCAxMzoyOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gSW5kZWVk
LCBoZW5jZSBhbHNvIG15ICJhcyBzdWdnZXN0ZWQgYmVmb3JlIi4gSSByZW1haW4gdW5jb252aW5j
ZWQKPiB0aGF0IGlzIGl0IHVzZWZ1bCB0byBoYXZlIGUuZy4KPiAKPiBDT05GSUdfR0NDX1ZFUlNJ
T049ODAzMDAKPiBDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCj4gCj4gaW4geGVuLy5jb25maWcuIFRo
aXMgaXMgYXQgYmVzdCBjb25mdXNpbmcsIGJlY2F1c2UgaXQgbWF5IG5vdAo+IHJlcHJlc2VudCB3
aGF0IHRoZSBzeXN0ZW0gYWN0dWFsbHkgaGFzIGluc3RhbGxlZCAod2hpY2ggSSByZWFsaXplCj4g
aXMgYWxzbyBub3QgdGhlIGludGVudGlvbiwgYnV0IHRoZSB2YXJpYWJsZSBuYW1pbmcgc3VnZ2Vz
dHMgdGhhdAo+IHRoaXMgaXMgd2hhdCB3YXMgZm91bmQgb24gdGhlIHN5c3RlbTsgSSBoYXZlIG5v
IGJldHRlciBuYW1pbmcKPiBzdWdnZXN0aW9uLCB0byBwcmVlbXB0IGEgcG9zc2libGUgcXVlc3Rp
b24gdG8gdGhpcyBlZmZlY3QpLgoKQWZ0ZXIgYSB0YWxrIG9uICN4ZW5kZXZlbCB5ZXN0ZXJkYXks
IEkgaGF2ZSBHZW9yZ2UgYWdyZWVpbmcgdGhhdCB3ZQpzaG91bGQga2VlcCB0aGUgc2FtZSBiZWhh
dmlvciBhcyB0aGUgb25lIExpbnV4IGhhdmUuIEFuZCBJYW4gc2F5aW5nIHRoYXQKd2Ugc2hvdWxk
IGNvcHkgZW50aXJlIGZpbGVzIHdoZXJlIHdlIGNhbi4gSWYgd2UgbW9kaWZ5IHRoZSBiZWhhdmlv
ciBvZgolX1ZFUlNJT04sIGl0IHdvdWxkIG1ha2UgaXQgbW9yZSBkaWZmaWN1bHQgdG8gY29weSBl
bnRpcmUgZmlsZXMgZnJvbQolTGludXggbGF0ZXIuCgpTbywgbm93LCBjYW4gd2UgZmluYWxseSBj
b21taXQgdGhlIHBhdGNoIHNlcmllcywgd2l0aCBib3RoICVfVkVSU0lPTgpzZXQsIGFuZCBsZXQg
dGhpcyBiaWtlc2hlZGRpbmcgcmVzdCwgYW5kIG1vdmUgb24/CgpUaGFuayB5b3UsCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
