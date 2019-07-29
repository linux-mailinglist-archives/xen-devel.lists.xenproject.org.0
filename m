Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E09791CA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 19:09:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs96J-0003WU-1l; Mon, 29 Jul 2019 17:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs96G-0003WL-SL
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 17:06:16 +0000
X-Inumbo-ID: 2b657642-b223-11e9-896e-ab2167e59835
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b657642-b223-11e9-896e-ab2167e59835;
 Mon, 29 Jul 2019 17:06:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mOxltsFQto6ELg0ju4UocdcOUUd5FxEfXbTS/zFTwdkI6jn7AdSIuRlKY4XVdAnR1nZiwRw8JY
 lGYUeMjNxkWUDZlO2fH7jsyU0iqjtQPrsteWXUovygieyKtZ3TzvY0xKpDYPGeVtPra+jy2cNg
 /9W1OzijjeDdK0LxVTFQlsR/z8E+bWYuImXhnN3njqi8CRopkRI724dnVlrMBB9tqKq2AQGobe
 gqMuFBtax4SNDwhJji4FEIzdX6+Fay9tojrjaULGdl/25Q3YlaJRvjWdWEQ3XiuR80QWDjgT1Y
 B6s=
X-SBRS: 2.7
X-MesageID: 3610961
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3610961"
To: Jan Beulich <JBeulich@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20190729154112.7644-1-ross.lagerwall@citrix.com>
 <d9cb90b9-1d58-9514-0f35-0c1dbb1476be@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7dc7166d-dae2-45b2-4119-eda08f63cd83@citrix.com>
Date: Mon, 29 Jul 2019 18:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d9cb90b9-1d58-9514-0f35-0c1dbb1476be@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDcvMjAxOSAxNjo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDcuMjAxOSAx
Nzo0MSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4+IFdoZW4gc3VzcGVuZGluZy9yZXN1bWluZyBv
ciBtaWdyYXRpbmcgdW5kZXIgWGVuLCB0aGVyZSBpc24ndCBtdWNoIG5lZWQKPj4gZm9yIHN1c3Bl
bmRpbmcgYW5kIHJlc3VtaW5nIGFsbCB0aGUgYXR0YWNoZWQgZGV2aWNlcyBzaW5jZSB0aGUgWGVu
L1FFTVUKPj4gc2hvdWxkIGNvcnJlY3RseSBtYWludGFpbiB0aGUgaGFyZHdhcmUgc3RhdGUuIERy
b3AgdGhlc2UgY2FsbHMgYW5kCj4+IHJlcGxhY2Ugd2l0aCBtb3JlIHNwZWNpZmljIGNhbGxzIHRv
IGVuc3VyZSBYZW4gZnJvbnRlbmQgZGV2aWNlcyBhcmUKPj4gcHJvcGVybHkgcmVjb25uZWN0ZWQu
Cj4gSXMgdGhpcyB0cnVlIGZvciB0aGUgZ2VuZXJhbCBwYXNzLXRocm91Z2ggY2FzZSBhcyB3ZWxs
PyBXaGlsZSBtaWdyYXRpb24KPiBtYXkgbm90IGJlIChmdWxseSkgY29tcGF0aWJsZSB3aXRoIHBh
c3MtdGhyb3VnaCwgaWlyYyBzYXZlL3Jlc3RvcmUgaXMuCgpXaGF0IGdpdmVzIHlvdSB0aGlzIGlt
cHJlc3Npb24/CgpNaWdyYXRpb24gYW5kIHNhdmUvcmVzdG9yZSBhcmUgKmxpdGVyYWxseSogdGhl
IHNhbWUgdGhpbmcsIGV4Y2VwdCB0aGF0CmluIG9uZSBjYXNlIHlvdSdyZSBwaXBpbmcgdGhlIGRh
dGEgdG8vZnJvbSBkaXNrLCBhbmQgaW4gdGhlIG90aGVyIHlvdSdyZQpwaXBpbmcgaXQgdG8gdGhl
IGRlc3RpbmF0aW9uIGFuZCByZXN0b3JpbmcgaXQgaW1tZWRpYXRlbHkuCgpJZiB5b3UgbG9vayBh
dCB0aGUgdG9vbHN0YWNrIGNvZGUsIGl0IGlzIGFsbCBpbiB0ZXJtcyBvZiByZWFkaW5nL3dyaXRp
bmcKYW4gZmQgKGluY2x1ZGluZyBsaWJ4bCdzIEFQSSkgd2hpY2ggaXMgZWl0aGVyIGEgbmV0d29y
ayBzb2NrZXQgb3IgYQpmaWxlLCBhcyBjaG9zZW4gYnkgeGwuCgo+IFdvdWxkIHFlbXUgcmVzdG9y
ZSBzdGF0ZSBvZiBwaHlzaWNhbCBQQ0kgZGV2aWNlcz8KCldoYXQgc3RhdGUgd291bGQgUWVtdSBi
ZSBpbiBhIHBvc2l0aW9uIHRvIGtub3cgYWJvdXQsIHdoaWNoIGlzbid0CmFscmVhZHkgcHJlc2Vu
dCBpbiBRZW11J3MgZGF0YWJsb2I/CgpXaGF0IHdlIGRvIHdpdGggZ3JhcGhpY3MgY2FyZHMgaXMg
dG8gbWVyZ2UgWGVucyBsb2dkaXJ0eSBiaXRtYXAsIHdpdGggYQpkaXJ0eSBsaXN0IHByb3ZpZGVk
IGJ5IHRoZSBjYXJkIGl0c2VsZi7CoCBUaGlzIG5lZWRzIGEgZGV2aWNlLXNwZWNpZmljCmtub3ds
ZWRnZS7CoCBJbiBhZGRpdGlvbiwgdGhlcmUgaXMgYW4gb3BhcXVlIGJsb2Igb2YgZGF0YSBwcm9k
dWNlZCBieSB0aGUKc291cmNlIGNhcmQsIHdoaWNoIGlzIGhhbmRlZCB0byB0aGUgZGVzdGluYXRp
b24gY2FyZC7CoCBUaGF0IGFsc28gbGl2ZXMKaW4gdGhlIHN0cmVhbS4KCkludGVsJ3MgU2NhbGFi
bGUgSU9WIHNwZWMgaXMgYXR0ZW1wdGluZyB0byByYXRpb25hbGlzZSB0aGlzIGJ5IGhhdmluZyBh
CnN0YW5kYXJkIHdheXMgb2YgZ2V0dGluZyBsb2dkaXJ0eSBhbmQgImludGVybmFsIHN0YXRlIiBp
bmZvcm1hdGlvbiBvdXQKb2YgYSBkZXZpY2UsIGJ1dCBmb3IgdGhlIG1vbWVudCwgaXQgcmVxdWly
ZXMgY3VzdG9tIGRldmljZS1kcml2ZXIKc3BlY2lmaWMgY29kZSB0byBkbyBhbnl0aGluZyBtaWdy
YXRpb24gcmVsYXRlZCB3aXRoIHJlYWwgaGFyZHdhcmUuCgpBcyBmb3Igd2h5IGl0cyBzYWZlIHRv
IGRvIGxpa2UgdGhpcywgdGhlIGJlc3QgYXJndW1lbnQgaXMgdGhhdCB0aGlzIGlzCmhvdyBhbGwg
b3RoZXIgdmVuZG9ycyBkbyBtaWdyYXRpb24sIGluY2x1ZGluZyBLVk0uwqAgWGVuIGlzIHRoZQpv
ZGQtb25lLW91dCB1c2luZyB0aGUgZnVsbCBTMyBwYXRoLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
