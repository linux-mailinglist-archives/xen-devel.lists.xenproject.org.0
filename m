Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BFD116AE5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:23:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieG9s-00089k-8B; Mon, 09 Dec 2019 10:20:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieG9q-00089f-RG
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:20:50 +0000
X-Inumbo-ID: 923b79d6-1a6d-11ea-87b9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 923b79d6-1a6d-11ea-87b9-12813bfff9fa;
 Mon, 09 Dec 2019 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575886849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+9tBzu38EMMLlwD2A6swqJ/5zQK26PEFL07Z0VxuZE8=;
 b=CVGxUxyw2Q1gNpmUL5D6oJZZ3v/omFsMxZnCmyqncDTIe+yl1D+y0kbM
 o6vvXAInFUYk6ZjHl60wBVUYkKgQ8SMVz22bKE1iwilbIdNyheJu0NAAg
 QSyZPBNSQmN2cEBJ3ETVUSyLhJBaz4pxTH3Ailxo1xTsx5itGGkMRd3VO A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jnX28iFgTSbU0aeCSWa2N6WJsqhBusMLfYxR/FlYWy99yLnRwtwqzQ67CR3nidb+vrKl1Ktflw
 WPnPmq4kJM/mxxpGOpspQMOr/DwqQxNw34ZqknzIIdR00WqoT8Fcy2R4R8LLc3VzUH4jeEGr7E
 Qky453slESYHHVvaxu8WJ6BFzxbqmHDoLQCEFmJo4Hk0KGZ5rpVQRIK1d1gMa9BOmpOUUVd5xr
 445JImZF1hVWq8tVl4H9M64w3lEZ7LRjOaKYZOpDMAHG7fyAHBhfCA82u3AV4FKKyUZqprYMmG
 Ncc=
X-SBRS: 2.7
X-MesageID: 9797380
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9797380"
Date: Mon, 9 Dec 2019 11:20:42 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209102042.GN980@Air-de-Roger>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDY6MDU6MTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA1OjExOjQyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA0LjEyLjIwMTkgMTY6MTIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
QEAgLTEzMCw3ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0cnVj
dCB2Y3B1ICp2KQo+ID4+PiAgICAgICAqLwo+ID4+PiAgICAgIGlmICggZC0+YXJjaC5wdi5wY2lk
ICkKPiA+Pj4gICAgICAgICAgY3I0IHw9IFg4Nl9DUjRfUENJREU7Cj4gPj4+IC0gICAgZWxzZSBp
ZiAoICFkLT5hcmNoLnB2LnhwdGkgKQo+ID4+PiArICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54
cHRpICYmIG9wdF9nbG9iYWxfcGFnZXMgKQo+ID4+PiAgICAgICAgICBjcjQgfD0gWDg2X0NSNF9Q
R0U7Cj4gPj4KPiA+PiBJJ20gc29ycnkgZm9yIG5vdGljaW5nIHRoaXMgb25seSBub3csIGJ1dCB3
aGF0IGFib3V0IFhFTl9NSU5JTUFMX0NSNCwKPiA+PiB3aGljaCBpbmNsdWRlcyBYODZfQ1I0X1BH
RT8KPiA+IAo+ID4gSSd2ZSB0cmllZCByZW1vdmluZyBQR0UgZnJvbSBYRU5fTUlOSU1BTF9DUjQg
YnV0IGl0IG1hZGUgbm8gbm90aWNlYWJsZQo+ID4gcGVyZm9ybWFuY2UgZGlmZmVyZW5jZSwgc28g
SSBsZWZ0IGl0IGFzLWlzLgo+IAo+IE15IGNvbmNlcm4gaXNuJ3QgYWJvdXQgcGVyZm9ybWFuY2Us
IGJ1dCBjb3JyZWN0bmVzcy4gSSBhZG1pdCBJCj4gZm9yZ290IGZvciBhIG1vbWVudCB0aGF0IHdl
IG5vdyBhbHdheXMgd3JpdGUgQ1I0ICh1bmxlc3MgdGhlCj4gY2FjaGVkIHZhbHVlIG1hdGNoZXMg
dGhlIGludGVuZGVkIG5ldyBvbmUpLiBZZXQKPiBtbXVfY3I0X2ZlYXR1cmVzIChzdGFydGluZyBv
dXQgYXMgWEVOX01JTklNQUxfQ1I0KSBpcyBzdGlsbCBvZgo+IGNvbmNlcm4uCj4gCj4gSSB0aGlu
ayB0aGlzIGF0IGxlYXN0IHJlcXVpcmVzIGV4dGVuZGluZyB0aGUgZGVzY3JpcHRpb24gdG8KPiBk
aXNjdXNzIHRoZSBjb3JyZWN0bmVzcy4KCldvdWxkIHlvdSBiZSBmaW5lIHdpdGggYWRkaW5nIHRo
ZSBmb2xsb3dpbmcgYXQgdGhlIGVuZCBvZiB0aGUgY29tbWl0Cm1lc3NhZ2UuCgoiTm90ZSB0aGF0
IFhFTl9NSU5JTUFMX0NSNCBpcyBub3QgbW9kaWZpZWQsIGFuZCB0aHVzIGdsb2JhbCBwYWdlcyBh
cmUKbGVmdCBlbmFibGVkIGZvciB0aGUgaHlwZXJ2aXNvci4gVGhpcyBpcyBub3QgYW4gaXNzdWUg
YmVjYXVzZSB0aGUgY29kZQp0byBzd2l0Y2ggdGhlIGNvbnRyb2wgcmVnaXN0ZXJzIChjcjMgYW5k
IGNyNCkgYWxyZWFkeSB0YWtlcyBpbnRvCmFjY291bnQgc3VjaCBzaXR1YXRpb24gYW5kIHBlcmZv
cm1zIHRoZSBuZWNlc3NhcnkgZmx1c2hlcy4gVGhlIHNhbWUKYWxyZWFkeSBoYXBwZW5zIHdoZW4g
dXNpbmcgWFBUSSBvciBQQ0lERSwgYXMgdGhlIGd1ZXN0IGNyNCBkb2Vzbid0CmhhdmUgZ2xvYmFs
IHBhZ2VzIGVuYWJsZWQgaW4gdGhhdCBjYXNlIGVpdGhlci4iCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
