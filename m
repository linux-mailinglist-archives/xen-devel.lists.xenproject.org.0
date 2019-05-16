Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F862059F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:54:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREuP-0004so-2H; Thu, 16 May 2019 11:50:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREuN-0004sf-Hq
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:50:47 +0000
X-Inumbo-ID: d77cf4c8-77d0-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d77cf4c8-77d0-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:50:46 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: fIbwS5RHT7WUg3YQGVJA843OvfjWbk85wazhpiaE4kf0luTh1oD1zj4ruGwH6X2WzJJs5pUByt
 OZu8DOg1u5EAxUE2AnMoN4OTpVBEMN6nX6+5ijj7Ly3EaNrkTdxfFQbsY+hnqNtPBDISy4Z7fS
 8M3LG3gQr2YQhGIa4LjgVB+oH6K78U6o2RSkfcfLUxPifar1ryFIjc9jiSZNUJYqRRdjy2Y8ud
 BwcUSnPY7S5IvRWw/U8MHIhwbkaXXjwisak9QkCL2yNuE0XjUrTTM/cfCOpQshni7ahLDIkW0b
 ubg=
X-SBRS: 2.7
X-MesageID: 519492
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="519492"
Date: Thu, 16 May 2019 12:50:43 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <ohering@suse.com>
Message-ID: <20190516115043.GB2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516133857.742e4f13.ohering@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516133857.742e4f13.ohering@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDE6Mzg6NTdQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMjoyNDo1MCArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgYXBw
cm9hY2ggaXMgdGhhdCBpdCBkb2Vzbid0IGhlbHAgZXhpc3RpbmcgbGlieGwKPiA+IHVzZXJzLiBU
aGV5IHdpbGwgbmVlZCB0byBiZSBmaXhlZCBieSBjYWxsaW5nIHRoaXMgbmV3IEFQSS4KPiAKPiBJ
ZiB0aGUgQVBJIG5lZWRzIHRvIGJlIGNoYW5nZWQsIGEgTElCWExfSEFWRV8gY2FtZSB3aXRoIHRo
ZSBjaGFuZ2UuCj4gCj4gSSdtIG5vdCBzdXJlIGhvdyB0byBmaXggdGhpcyB3aXRob3V0IGNoYW5n
aW5nIHNvbWUgQVBJLgo+IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0IHdvdWxk
IG5lZWQgYSBkX2NvbmZpZyB0byBtYWtlIGEKPiB1c2FibGUgZGVjaXNpb24uIFRoZSBjYWxsZXJz
IGRvIG5vdCBoYXZlIGEgZF9jb25maWcuIEFuZCB3aGF0IHRoZWlyCj4gY2FsbGVzIGhhdmUgaXMg
YW4gaW5jb21wbGV0ZSBkX2NvbmZpZyBiZWNhdXNlIGxpYnhsIGxhY2tzIGEgcHVibGljIEFQSQo+
IHRvIHByb3Blcmx5IHBvcHVsYXRlIG1pc3NpbmcgZGVmYXVsdHMgaW4gZF9jb25maWcuCj4gCj4g
VG8gbWUgaXQgbG9va3MgbGlrZSBzb21ldGhpbmcgbGlrZSBsaWJ4bF9kb21haW5fY29uZmlnX2Zp
bmlzaChsaWJ4bF9kb21haW5fY29uZmlnKikKPiBpcyBtaXNzaW5nIG5vdy4KPiAKPiBNYXliZSBJ
IGFtIGp1c3QgbWlzdW5kZXJzdGFuZGluZyB3aGF0IHlvdSB0cnlpbmcgdG8gc2F5LCBidXQgdG8g
bWUgaXQKPiBsb29rcyBsaWtlIGZyZWVtZW0oKSB3b3VsZCBuZWVkIHRvIGNhbGwgYW4gdXBkYXRl
ZCBsaWJ4bCBwdWJsaWMgQVBJCj4gYW55d2F5LiBTdXJlbHkgbm90IGZyZWVtZW0gaXRzZWxmLCBi
dXQgeGw6Y3JlYXRlX2RvbWFpbiBhcyBhIHdob2xlLgoKWWVzLCB0aGF0J3Mgd2hhdCBJIHdhbnQg
dG8gYXZvaWQgaWYgcG9zc2libGUuIHhsIGlzIGp1c3Qgb25lIG9mIHRoZQp1c2VycyBvZiBsaWJ4
bC4gWW91IHdpbGwgbGlrZWx5IG5lZWQgdG8gY2hhbmdlIGxpYnZpcnQgYXMgd2VsbC4KCkFkZGlu
ZyBuZXcgQVBJcyBhbmQgZGVmaW5pbmcgTElCWExfSEFWRSB3b24ndCBnZXQgeW91IG91dCBvZiB0
aGlzIGhvbGUuClllcyB5b3UgY2FuIGFkZCBuZXcgQVBJcyBhbmQgbmV3IHVzZXJzIGFyZSBmcmVl
IHRvIHVzZSB0aGVtLCBidXQgWW91CnN0aWxsIG5lZWQgdG8gcmV0YWluIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkgc29tZWhvdy4KCldlaS4KCj4gCj4gT2xhZgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
