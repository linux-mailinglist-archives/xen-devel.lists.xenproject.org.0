Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041F2E752D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:32:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6y3-0000sA-3c; Mon, 28 Oct 2019 15:30:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP6y1-0000l0-B2
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:30:01 +0000
X-Inumbo-ID: cb8a5db7-f997-11e9-94fa-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb8a5db7-f997-11e9-94fa-12813bfff9fa;
 Mon, 28 Oct 2019 15:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572276597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=idJQT3dktdNr+6Mag+/V/3wjPRaVFe12y8JOuZZZUos=;
 b=FCTgXqYEA1fVa9+FSDmIKBoymZKJt9smMPof2ovDqarJeD8FHOhZ0Koh
 FmHFYFttRRaZXR6B2ieIsa/HQkaBBDSwRmyXCDu2r7k2wDkFJtyYjoteQ
 2QxyksBWSNsMnHWQMxMWiigVoRwCtgbYakscB+Ac2t6F1t3SZ9EGM25kW o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GFNlsme9IerX1hz02cgERN8bwuDz1zN+8goe6K64zfWVWZ0Lgn9OmLspZhBoZ9mneJipruquU9
 3cCbknRy/YQndCk+zzOwoU3I/eySOsye0bmVfpLjidsuqtOqIip/P+Cz3nwCyerfo9aa2hcuOg
 CkfW4p8OO1j0cOcwA5qqOHkEWK+4vGr1eQUtMy6f+sLOGIwIMX2hiXJteBNlMDFYGmdGHNlODi
 w8YjOI+x4wsmMrn11DFtB0/Ynd9u7O7Y/B1WlD9ajUl86HLaT4xwlGvSOzOOCqLwdDxaDO8gth
 oek=
X-SBRS: 2.7
X-MesageID: 7826419
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7826419"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 28 Oct 2019 15:29:47 +0000
Message-ID: <20191028152948.11900-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 2/3] libxl: libxl__spawn_stub_dm:
 Call domain_config_setdefault
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJldmlvdXNseSwgZGVmYXVsdGluZyBhbmQgY2hlY2tpbmcgb2Ygc29tZSBhc3BlY3RzIG9mIHRo
ZSBkb21haW4KY29uZmlnIHdhcyBza2lwcGVkIGZvciBzdHViIGRtcy4gIFRoaXMgaGFzIGJlZW4g
dGhlIGNhc2UgZm9yZXZlci4KCkluIGFkMDExYWQwODg0MyAibGlieGwveGw6IE92ZXJoYXVsIHBh
c3N0aHJvdWdoIHNldHRpbmcgbG9naWMiIHNvbWUKZGVmYXVsdGluZyB0aGF0IHdhcyBuZWVkZWQg
Zm9yIHN0dWIgZG1zIHdhcyBtb3ZlZCBmcm9tCmxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0
ZGVmYXVsdCB0byAuLl9jb25maWdfc2V0ZGVmYXVsdCB3aXRoIHRoZQpyZXN1bHQgdGhhdCBmb3Ig
c3R1YiBkbXMsIGxpYnhsX19kb21haW5fbWFrZSBmYWlscyB3aXRoIHRoaXMKYXNzZXJ0aW9uOgog
IHhsOiBsaWJ4bF9jcmVhdGUuYzo1ODI6IGxpYnhsX19kb21haW5fbWFrZTogQXNzZXJ0aW9uCiAg
YGluZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BBU1NUSFJPVUdIX0RFRkFVTFQnIGZhaWxlZC4K
CkZpeCB0aGlzIGJ5IHByb3Blcmx5IGRvaW5nIGFsbCBkZWZhdWx0aW5nIGFuZCBhbGwgY2hlY2tp
bmcgZm9yIHN0dWIKZG1zLiAgVGhpcyBpcyBtb3JlIGNvcnJlY3QsIGJ1dCAoZXNwZWNpYWxseSBh
dCB0aGlzIHN0YWdlIG9mIHRoZQpyZWxlYXNlKSBpdCBpcyBuZWNlc3NhcnkgdG8gbW9yZSBjbG9z
ZWx5IGV2YWx1YXRlIHRoZSBlZmZlY3RzIGJ5CnJldmlld2luZyB0aGUgYm9keSBvZiBfY29uZmln
X3NldGRlZmF1bHQuICBUaGUgY2hhbmdlcyBhcmUgYXMgZm9sbG93czoKCk9uZSBhY3R1YWwgZnVu
Y3Rpb25hbCBjaGFuZ2U6CgoqIFRoZSBuZXcgcGFzc3Rocm91Z2ggZGVmYXVsdGluZyBpcyBwcm9w
ZXJseSBkb25lLiAgVGhpcyBpcyB3aGF0IHdlCiAgYXJlIHRyeWluZyB0byBhY3R1YWxseSBmaXgg
aGVyZS4KCkFuZCBhIGxvdCBvZiB0aGluZ3MgdGhhdCBtYWtlIG5vIGRpZmZlcmVuY2U6CgoqIHNo
YWRvd19tZW1rYiB3b3VsZCBub3cgYmUgc2V0LiAgV2hldGhlciB0aGlzIHdvdWxkIGJlIGNvcnJl
Y3QgaXMgbm90CiAgZW50aXJlbHkgY2xlYXIuICBJdCBzZWVtcyBiZXR0ZXIgdG8gbWFrZSB0aGlz
IHBhdGNoICh3aG9zZSBwdXJwb3NlCiAgaXMgdG8gZml4IHRoZSBwYXNzdGhyb3VnaCBkZWZhdWx0
aW5nKSAqbm90KiBpbmNsdWRlIHRoYXQgc2VtYW50aWMKICBjaGFuZ2UsIHNvIGhlcmUgSSBoYXZl
IGluY2x1ZGVkIGEgaHVuayB0byBleHBsaWNpdGx5IG92ZXJyaWRlIHRoaXMuCgoqIEZMQVNLIHNz
aWRfbGFiZWwgaXMgcHJvY2Vzc2VkLiAgQnV0IHRoZSBhY3R1YWwgc3NpZHJlZiBpcyBjb3BpZWQK
ICBmcm9tIHRoZSBndWVzdCBkb21haW4gYnkgc3Bhd25fc3R1Yl9kbSwgYW5kIHNzaWRfbGFiZWwg
aXMgc2V0IHRvCiAgTlVMTC4gIFNvIG5vIGNoYW5nZS4KCiogV2Ugc2V0IGlvbW11X21lbWtiLiAg
QnV0IHRvIDAgc2luY2UgcGFzc3Rocm91Z2ggaXMgZGlzYWJsZWQuCgoqIGNwdWlkIHBvb2xfbmFt
ZSBpcyBwcm9jZXNzZWQuICBCdXQgdGhpcyBpcyBub3Qgc2V0IGJ5CiAgc3Bhd25fc3R1Yl9kbS4g
IChBcmd1YWJseSB0aGlzIGlzIGEgYnVnOiBzdHViIGRtcyBzaG91bGQgaW5oZXJpdCB0aGUKICBw
YXJlbnQgY3B1cG9vbC4pICBUaGUgZWZmZWN0IGlzIHRvIGxlYXZlIHBvb2xpZCBzZXQgdG8gMCBh
bmQgY2FsbAogIGxpYnhsX2NwdXBvb2xpZF9pc192YWxpZCBidXQgdGhhdCBhbHdheXMgc3VjY2Vl
ZHMgZm9yIDAuICBTbyBubwogIGNoYW5nZS4KCiogVmFyaW91cyBleHRyYSBjaGVja3MgYXJlIGRv
bmU6IHJlamVjdCBQQ0kgcGFzc3Rocm91Z2ggZm9yIEhWTSB3aXRoCiAgUE9EIChzdHViIGRtIGlz
IFBWKTsgcmVqZWN0IHBvZCArIHZudW1hLCBvciBQViArIHZudW1hIChzdHViIGRtIGhhcwogIG5v
IHZudW1hKTsgcmVqZWN0IG5lc3RlZCBIVk0gb3IgcG9kLCB3aXRoIGFsdDJwbS1odm0gKGFnYWlu
LCBzdHViIGRtCiAgaXMgUFYpLiAgU28gdGhlc2UgY2hlY2tzIHdpbGwgYWx3YXlzIHBhc3MuCgpT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9k
bS5jIHwgMTAgKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZG0uYwppbmRleCBlNmE0ODk3NGY4Li43ZTUyZjA5NzMxIDEwMDY0NAotLS0g
YS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAg
LTIxNDEsNiArMjE0MSw3IEBAIHZvaWQgbGlieGxfX3NwYXduX3N0dWJfZG0obGlieGxfX2VnYyAq
ZWdjLCBsaWJ4bF9fc3R1Yl9kbV9zcGF3bl9zdGF0ZSAqc2RzcykKICAgICBsaWJ4bF9kb21haW5f
YnVpbGRfaW5mb19pbml0KCZkbV9jb25maWctPmJfaW5mbyk7CiAgICAgbGlieGxfZG9tYWluX2J1
aWxkX2luZm9faW5pdF90eXBlKCZkbV9jb25maWctPmJfaW5mbywgTElCWExfRE9NQUlOX1RZUEVf
UFYpOwogCisgICAgZG1fY29uZmlnLT5iX2luZm8uc2hhZG93X21lbWtiID0gMDsKICAgICBkbV9j
b25maWctPmJfaW5mby5tYXhfdmNwdXMgPSAxOwogICAgIGRtX2NvbmZpZy0+Yl9pbmZvLm1heF9t
ZW1rYiA9IDI4ICogMTAyNCArCiAgICAgICAgIGd1ZXN0X2NvbmZpZy0+Yl9pbmZvLnZpZGVvX21l
bWtiOwpAQCAtMjE2NywxNCArMjE2OCw3IEBAIHZvaWQgbGlieGxfX3NwYXduX3N0dWJfZG0obGli
eGxfX2VnYyAqZWdjLCBsaWJ4bF9fc3R1Yl9kbV9zcGF3bl9zdGF0ZSAqc2RzcykKICAgICBkbV9j
b25maWctPmNfaW5mby5ydW5faG90cGx1Z19zY3JpcHRzID0KICAgICAgICAgZ3Vlc3RfY29uZmln
LT5jX2luZm8ucnVuX2hvdHBsdWdfc2NyaXB0czsKIAotICAgIGxpYnhsX3BoeXNpbmZvIHBoeXNp
bmZvOwotICAgIHJldCA9IGxpYnhsX2dldF9waHlzaW5mbyhDVFgsICZwaHlzaW5mbyk7Ci0gICAg
aWYgKHJldCkgZ290byBvdXQ7Ci0KLSAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZv
X3NldGRlZmF1bHQoZ2MsICZkbV9jb25maWctPmNfaW5mbywKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBoeXNpbmZvKTsKLSAgICBpZiAocmV0KSBnb3Rv
IG91dDsKLSAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChnYywg
JmRtX2NvbmZpZy0+Yl9pbmZvKTsKKyAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRk
ZWZhdWx0KGdjLCBkbV9jb25maWcsIGd1ZXN0X2RvbWlkKTsKICAgICBpZiAocmV0KSBnb3RvIG91
dDsKIAogICAgIGlmIChsaWJ4bF9kZWZib29sX3ZhbChndWVzdF9jb25maWctPmJfaW5mby51Lmh2
bS52bmMuZW5hYmxlKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
