Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33CB966D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 19:18:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBMVC-0006sT-Sz; Fri, 20 Sep 2019 17:15:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Fkx=XP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iBMVB-0006sO-KP
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 17:15:25 +0000
X-Inumbo-ID: 3b936d50-dbca-11e9-959b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b936d50-dbca-11e9-959b-12813bfff9fa;
 Fri, 20 Sep 2019 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568999725;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=oHLkA/Lo/JAR8c4+5qcVwjuH4qDrhVVTd93s2+mjz9U=;
 b=AH6Jh9wQ0MIYzSg9pelwinzvNxo2t9iXoTJWILi1yuSQ9h2HiP+t1TAo
 Tdff7D089l4ZniF0BA77odh2azrYL9jCBkc7QmKfhJpqz5Ebj12FM9BEY
 VlnA+oPyidVuFeaqtq9hIvjbhwWQu3QWErLKq6NANjvxqv4T7RhX27rCG 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: 4QyrVJC/3n0Oy2iHfPHIVBS3cadOHDyzrbqczfrlDk/mfflDQuj5fWbHZu7E2lFpmQzdGCxLn9
 wE2G2mZ8xM1DHeEW7XjQKKQw6XmzIMQxocFPTRFu/CHsn5vRvn0XqK+KTAPOHUV1DTONjAkxpX
 5oYRHaKVKdidfFn1bP87S5cVMKikt3vJ59+FkT0p/0M+GYMS8qxAjWjtX94ucaMUoaDkN31jve
 V/dcPZ1k3suwXzSCED5uTQJrO9/iMoJaPclRJDliQ/SObBPSkTO4QHrn+zeqVEekVktM3W560U
 KfQ=
X-SBRS: 2.7
X-MesageID: 5865205
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,529,1559534400"; 
   d="scan'208";a="5865205"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23941.2337.713234.62031@mariner.uk.xensource.com>
Date: Fri, 20 Sep 2019 18:15:13 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190920170054.GX1308@perard.uk.xensource.com>
References: <20190920161902.1353598-1-anthony.perard@citrix.com>
 <20190920170054.GX1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Build fix following libxl API
 changes
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
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>, David
 Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSF0gdG9vbHMvb2NhbWw6IEJ1aWxkIGZp
eCBmb2xsb3dpbmcgbGlieGwgQVBJIGNoYW5nZXMiKToKPiBPbiBGcmksIFNlcCAyMCwgMjAxOSBh
dCAwNToxOTowMlBNICswMTAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IFRoZSBmb2xsb3dp
bmcgbGlieGwgQVBJIGJlY2FtZSBhc3luY2hyb25vdXMgYW5kIGdhaW5lZCBhbiBhZGRpdGlvbmFs
Cj4gPiBgYW9faG93JyBwYXJhbWV0ZXI6Cj4gPiAgICAgbGlieGxfZG9tYWluX3BhdXNlKCkKPiA+
ICAgICBsaWJ4bF9kb21haW5fdW5wYXVzZSgpCj4gPiAgICAgbGlieGxfc2VuZF90cmlnZ2VyKCkK
PiA+IAo+ID4gQWRhcHQgdGhlIG9jYW1sIGJpbmRpbmcuCj4gPiAKPiA+IEJ1aWxkIHRlc3RlZCBv
bmx5Lgo+ID4gCj4gPiBGaXhlczogZWRhYTYzMWRkY2VlNjY1Y2RmYWUxY2Y2YmM3NDkyYzc5MWUw
MWVmNAo+ID4gRml4ZXM6IDk1NjI3Yjg3YzMxNTk5Mjg0NThlZTU4NmU4YzVjNTkzYmRkMjQ4ZDgK
PiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgo+ID4gLS0tCj4gPiAKPiA+IE5vdGVzOgo+ID4gICAgIEN1cnJlbnRseSwgYWxsIGxpYnhs
IEFQSSB0aGF0IHRha2VzIGFuIGBhb19ob3dgIGhhdmUgYD9hc3luYzonYSAtPiB1bml0YAo+ID4g
ICAgIGluIHRoZSBvY2FtbCBkZWZpbml0aW9uIChhbmQgYW4gZXh0cmEgdW51c2VkIHZhbHVlIHVu
aXQgaW4gdGhlIGMgc3R1Ygo+ID4gICAgIGZpbGUpLCBpcyB0aGF0IGB1bml0YCBuZWVkZWQgPwo+
ID4gICAgIAo+ID4gICAgIEkgdHJpZWQgdG8gYWRkIGl0LCBidXQgdGhlbiBmb3Igc3R1Yl94bF9z
ZW5kX3RyaWdnZXIoKSBJIGhhZCB0byB1c2UKPiA+ICAgICBDQU1McGFyYW02LCBhbmQgdGhhdCBk
b2Vzbid0IGV4aXN0Lgo+IAo+IEkgZGlzY292ZXJlZCBDQU1MeHBhcmFtMSBtYWNybywgYnV0IHRo
YXQncyBub3QgYmV0dGVyOgo+ICAgICBGaWxlICJ4ZW5saWdodC5tbCIsIGxpbmUgMTczNSwgY2hh
cmFjdGVycyAyNS04NDoKPiAgICAgRXJyb3I6IEFuIGV4dGVybmFsIGZ1bmN0aW9uIHdpdGggbW9y
ZSB0aGFuIDUgYXJndW1lbnRzIHJlcXVpcmVzIGEgc2Vjb25kIHN0dWIgZnVuY3Rpb24KPiAgICAg
ICAgICAgIGZvciBuYXRpdmUtY29kZSBjb21waWxhdGlvbgoKSW4gb3JkZXIgdG8gdW5icmVhayB0
aGUgYnVpbGQgSSBoYXZlIGFja2VkIGFuZCBwdXNoZWQgdGhpcyBwYXRjaCByaWdodAphd2F5LCBi
dXQgSU1PIGEgcmV2aWV3IGZyb20gYW4gb2NhbWwgbWFpbnRhaW5lciBpcyBxdWl0ZSBpbXBvcnRh
bnQKaGVyZS4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
