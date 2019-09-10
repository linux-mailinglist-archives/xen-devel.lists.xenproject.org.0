Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F990AEA01
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7etb-0007rZ-V3; Tue, 10 Sep 2019 12:05:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7eta-0007r7-HP
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:05:18 +0000
X-Inumbo-ID: 40f69a7e-d3c3-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40f69a7e-d3c3-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=vkywOB2ALmY05LTCZ9whL88lySWzpu7NrDNLs1ESLMA=;
 b=Q3Hb/8q/Nus3mq5RYoCsefnuC5zAjJ9k0y6kBuUBmfW2jg7ThqrpuZ8o
 Hd5DvnsshXlno01r3ZMkoFHZgQoG7SChUWyDx0a0ylQWoU1PaY9UoFkZv
 WzSass53D9cGpl37sHEWxMGHq3V/ayT9YV+XHQ0ZvjExVEYq5u/a0iE8t Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZmfNl+92b5GJ7EwT0bR0c1qad+Qh6gPgrTQMTVvTMYwOLtk97EsuCIWNG2sxSzG/B/3bQzOGCq
 GZFkmBga6826CdX1nfljmaGvDb9dnLYZN6oRKQIpMjWSDIKM7KpLF+2p+lZek0iWWK8a8TPQPO
 8eU2XRXWPyIziqcsNqfVdEcfowr0qi41sMa3SN4AsnJC8dEKJv8KdeJNTh5BU53pHHQh8eJGnr
 N36dphuKF9ElIxHMSS9J6begAhNgygYDvn+oooQHwK0zPDj2FuQVtgkZ0I2z3ozgX7s89ruhHO
 MoA=
X-SBRS: 2.7
X-MesageID: 5370634
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5370634"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:05 +0100
Message-ID: <20190910120207.10358-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 10/12] tools/ocaml: abi-check: Check properly.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IGEgYnJva2VuIHJlZ2V4cCB3aGljaCB3b3VsZCBtZW50aW9uIGAkLycgd2hlbiBpdCBvdWdo
dCB0byBoYXZlCm1lbnRpb25lZCBgJCcuICBUaGUgcmVzdWx0IHdvdWxkIGJlIHRoYXQgaXQgd291
bGQgbWF0Y2ggbGluZXMgbGlrZQogICAgdHlwZSBzb21lX29jYW1sX3R5cGUgPSBUaGluZyB8IE90
aGVyX1RoaW5nCmJ1dCBpZ25vcmUgZXZlcnl0aGluZyBidXQgdGhlIHR5cGUgbmFtZSwgZ2l2aW5n
IHdyb25nIGFuc3dlcnMuCgpDaGVjayB0aGF0IHdlIGNoZWNrIG1lbnRpb25lZCB0eXBlcy4gIE90
aGVyd2lzZSBpZiB3ZSBmYWlsIHRvIHNwb3QKc29tZSBzdWl0YWJsZSB0aGluZyBpbiB0aGUgb2Nh
bWwsIHdlIHdvdWxkIGp1c3Qgb21pdCBjaGVja2luZyB0aGlzCnR5cGUgIQoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvb2Nh
bWwvbGlicy94Yy9hYmktY2hlY2sgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMv
eGMvYWJpLWNoZWNrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sKaW5kZXggYWJjZDZj
ZTZmMS4uZDUzMmYzNzI3MSAxMDA3NTUKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hl
Y2sKKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sKQEAgLTQ3LDYgKzQ3LDcgQEAg
d2hpbGUgKDxDX0ZJTEU+KSB7CiAgICAgICAgIH0gZWxzaWYgKCRjbGluZSA9PSAxICYmIEB2YWxz
ID09IDEpIHsKICAgICAgICAgICAgIG15ICgkb3R5cGUpID0gQHZhbHM7CiAgICAgICAgICAgICBk
aWUgInJlZmVyZW5jZSB0byB1bmRlZmluZWQgT1R5cGUgJG90eXBlIiB1bmxlc3MgJGVudW1zeyRv
dHlwZX07CisgICAgICAgICAgICAkY2xpbmUgPSAtMTsKICAgICAgICAgfSBlbHNpZiAoJGNsaW5l
ID09IDEgJiYgQHZhbHMgPT0gMykgewogICAgICAgICAgICAgJGVpLT57JF99ID0gc2hpZnQgQHZh
bHMgZm9yZWFjaCBxdyhPVHlwZSBPUHJlZml4IE1hbmdsZSk7CiAgICAgICAgIH0gZWxzaWYgKCRj
bGluZSA9PSAyICYmIEB2YWxzID09IDMpIHsKQEAgLTcwLDcgKzcxLDcgQEAgJGVpID0gdW5kZWY7
CiBteSAkYml0bnVtID0gMDsKIHdoaWxlICg8T0NBTUxfRklMRT4pIHsKICAgICBpZiAoISRlaSkg
ewotICAgICAgICBpZiAobXtedHlwZSBccysgKFx3KykgXHMqIFw9IFxzKiAkL314ICYmICRlbnVt
c3skMX0pIHsKKyAgICAgICAgaWYgKG17XnR5cGUgXHMrIChcdyspIFxzKiBcPSBccyogJH14ICYm
ICRlbnVtc3skMX0pIHsKICAgICAgICAgICAgIHByaW50ICIvLyBmb3VuZCBvY2FtbCB0eXBlICQx
IGF0ICRvOiQuXG4iIG9yIGRpZSAkITsKICAgICAgICAgICAgICRlaSA9ICRlbnVtc3skMX07CiAg
ICAgICAgICAgICAkY3ZhbCA9ICcnOwpAQCAtOTYsNiArOTcsNyBAQCB3aGlsZSAoPE9DQU1MX0ZJ
TEU+KSB7CiAgICAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgICAgIGRpZSBEdW1wZXIo
JGVpKS4iID8iOwogICAgICAgICAgICAgfQorICAgICAgICAgICAgJGVpLT57Q2hlY2tlZH0gPSAx
OwogICAgICAgICAgICAgJGVpID0gdW5kZWY7CiAgICAgICAgIH0gZWxzaWYgKCFte1xTfSkgewog
ICAgICAgICB9IGVsc2UgewpAQCAtMTA0LDQgKzEwNiw5IEBAIHdoaWxlICg8T0NBTUxfRklMRT4p
IHsKICAgICB9CiB9CiAKK2ZvcmVhY2ggJGVpICh2YWx1ZXMgJWVudW1zKSB7CisgICAgbmV4dCBp
ZiAkZWktPntDaGVja2VkfTsKKyAgICBkaWUgImRpZCBub3QgZmluZCBvY2FtbCB0eXBlIGRlZmlu
aXRpb24gZm9yICRlaS0+e09UeXBlfSBpbiAkbyI7Cit9CisKIGNsb3NlIFNURE9VVCBvciBkaWUg
JCE7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
