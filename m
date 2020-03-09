Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D317DECF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:37:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBGfr-0007ZC-1T; Mon, 09 Mar 2020 11:34:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EaUg=42=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jBGfp-0007Z7-J6
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:34:17 +0000
X-Inumbo-ID: e873909e-61f9-11ea-b52f-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e873909e-61f9-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583753656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z7YbHMWLLWXu56WoX2gxWFdWnxUaUnq0yOiM87dfsyg=;
 b=NnCq5CRDiHvDvAlJ+rcXXB+SZeLXu+DX259HiizMW1WmKIF7hf7Ra3/U
 TtxwqD1o84XZoTvbkYIZHUSyCKMGPEJIGhS8FTiJ1CJaF7vM255vQeiqK
 /Vf7oKtApp0vYYNGmDvQ3Ce3tHl1GydsBK+pl7VRNdWu/vHOw2nknpBQL g=;
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
IronPort-SDR: esSIF6UQLBG8M4rpo6JWIj7RJ3zM2tzVOOhFGqRSH/7O/v6+ILzPZ4DETVd4oQnmzsCbFOQT2/
 sx4OmT7bnvQhWRU97TKpcfIx/3+s/ksmBnfUl/+9LH0VlxRzY9Z16YcUhJIHp9ATt5SlxK0nBP
 hQlWZ4XXOk7CvxcCI/OvnmbklSswRemhQPOGQB4F+Og+UeGFonaFavPihz/DevJhOUUaGKYgwu
 dGzFd7AvfiWYwjd72YW/HWeEmSymN1e+eVmvzOjqBlq8wZvQFkiVZBeMhQl/9ZGMdpvtj42ThW
 /+s=
X-SBRS: 2.7
X-MesageID: 14250139
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,533,1574139600"; d="scan'208";a="14250139"
Date: Mon, 9 Mar 2020 11:34:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20200309113413.GB2152@perard.uk.xensource.com>
References: <20200306174250.291503-1-anthony.perard@citrix.com>
 <20200306174250.291503-2-anthony.perard@citrix.com>
 <alpine.DEB.2.21.2003061323190.11326@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003061323190.11326@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] xen/arm: Rename all early printk
 macro
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDM6NTc6MjNQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIEZyaSwgNiBNYXIgMjAyMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4g
PiBXZSBhbHNvIHJldXNlIENPTkZJR19FQVJMWV9QUklOVEsgcHJvdmlkZWQgYnkgdXNlcnMgdG8g
ZW5hYmxlIG9yIG5vdAo+ID4gZWFybHkgcHJpbnRrLCB0aHVzIHdlIG5lZWQgdG8gb3ZlcnJpZGUg
dGhlIHZhbHVlIGluIG1ha2VmaWxlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBJIHRyaWVkIHRoaXMgcGF0Y2gg
YW5kIGl0IGJyZWFrcyB0aGUgYnVpbGQgd2l0aCBFQVJMWV9QUklOVEsuIFdpdGg6Cj4gCj4gZXhw
b3J0IENPTkZJR19FQVJMWV9QUklOVEs9enlucW1wCj4gCj4gSSBnZXQ6Cj4gCj4gL2xvY2FsL3Jl
cG9zL2djYy1saW5hcm8tNS4zLjEtMjAxNi4wNS14ODZfNjRfYWFyY2g2NC1saW51eC1nbnUvYmlu
L2FhcmNoNjQtbGludXgtZ251LWdjYyAtRF9fQVNTRU1CTFlfXyAtREJVSUxEX0lEIC1mbm8tc3Ry
aWN0LWFsaWFzaW5nIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1hZnRl
ci1zdGF0ZW1lbnQgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1sb2Nh
bC10eXBlZGVmcyAtTzEgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIgLW5vc3RkaW5jIC1mbm8tYnVp
bHRpbiAtZm5vLWNvbW1vbiAtV2Vycm9yIC1XcmVkdW5kYW50LWRlY2xzIC1Xbm8tcG9pbnRlci1h
cml0aCAtV3ZsYSAtcGlwZSAtRF9fWEVOX18gLWluY2x1ZGUgL2xvY2FsL3JlcG9zL3hlbi11cHN0
cmVhbS94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmggJy1EX19PQkpFQ1RfRklMRV9fPSJhcm02NC9o
ZWFkLm8iJyAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZSAtZyAtTU1EIC1NRiBhcm02NC8uaGVh
ZC5vLmQgLW1jcHU9Z2VuZXJpYyAtbWdlbmVyYWwtcmVncy1vbmx5IC1EQ09ORklHX0VBUkxZX1BS
SU5USyAtRENPTkZJR19FQVJMWV9QUklOVEtfSU5DPVwiZGVidWcteS5pbmNcIiAtRENPTkZJR19F
QVJMWV9VQVJUX0JBVURfUkFURT0gLURDT05GSUdfRUFSTFlfVUFSVF9CQVNFX0FERFJFU1M9IC1E
Q09ORklHX0VBUkxZX1VBUlRfODI1MF9SRUdfU0hJRlQ9IC1JL2xvY2FsL3JlcG9zL3hlbi11cHN0
cmVhbS94ZW4vaW5jbHVkZSAtZm5vLXN0YWNrLXByb3RlY3RvciAtZm5vLWV4Y2VwdGlvbnMgLVdu
ZXN0ZWQtZXh0ZXJucyAtYyBhcm02NC9oZWFkLlMgLW8gYXJtNjQvaGVhZC5vCj4gYXJtNjQvaGVh
ZC5TOjQ5OjMzOiBmYXRhbCBlcnJvcjogZGVidWcteS5pbmM6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKPiAKPiBJIHRha2UgdGhlIHBhdGNoIHdhcyBub3QgZXhwZWN0ZWQgdG8gZG8gdGhhdD8K
CkkgZGlkbid0IGFib3V0IHVzZXJzIHByb3ZpZGluZyBDT05GSUdfRUFSTFlfUFJJTlRLIHZpYSB0
aGUgZW52aXJvbm1lbnQsCmFuZCBJJ20gY2hhbmdpbmcgdGhlIHZhbHVlLCBzbyB0aGF0IGZhaWxz
LgoKVGhlcmUncyB0d28gd2F5IHRvIHByb3ZpZGUgQ09ORklHX0VBUkxZX1BSSU5USzoKLSB2aWEg
bWFrZQogICAgbWFrZSBDT05GSUdfRUFSTFlfUFJJTlRLPXp5bnFtcAotIHZpYSB0aGUgZW52aXJv
bm1lbnQKICAgIENPTkZJR19FQVJMWV9QUklOVEs9enlucW1wIG1ha2UKCkkndmUgb25seSB0ZXN0
ZWQgdGhlIGZpcnN0IHNjZW5hcmlvLCB0aGF0IHdoeSBJIGhhdmUgYW4gb3ZlcnJpZGUuIEJ1dAp0
aGF0IGRvZXNuJ3Qgd29yayB3aXRoIHRoZSBzZWNvbmQgc2NlbmFyaW8uCgpTbyByZW5hbWluZyB0
aGUgbWFrZSB2YXJpYWJsZSBFQVJMWV9QUklOVEsgdG8gQ09ORklHX0VBUkxZX1BSSU5USyB3aWxs
CmhhdmUgdG8gd2FpdCB1bnRpbCB0aGUgc2Vjb25kIHBhdGNoIG9mIHRoZSBzZXJpZXMuCgpUaGFu
a3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
