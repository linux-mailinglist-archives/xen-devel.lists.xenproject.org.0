Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC35146BC9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:51:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iudk1-00044e-Pl; Thu, 23 Jan 2020 14:45:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LOIr=3M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iudk0-00044T-Dk
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 14:45:52 +0000
X-Inumbo-ID: 080e1c1e-3def-11ea-9fd7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 080e1c1e-3def-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579790744;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WvryDapjqhtHJswZw8RultYpllmAhoWpqiohWOnDN2c=;
 b=dtQtj0hkMFwdEHsq8qRajSzfmPvqvmEB0gowAkRx5zAt+IyRt2Xkj5OM
 5eHYM0i7gmQS50w04XG0gzsiNHzKIaCsZh4DE5NXrf14086XLAW8om1TG
 FSgTaIjnZrwMXVG3n92hBB4cxnd7EcZdtXd+42GaGLTdaRAh3NPgSvBBe U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sApWxqcx343LMWE9IUdURiErM1VBOtoOR3g+hqfNF7JX7cq7shiS+Rdo0VKEHpdjE/na3CvF63
 hjFq/mMUjJbw5yxccLuwsd1dihFF11EmT96wbgxRZaclhXQ4CWPN1tssxaR4UHUpqldU7oWCgP
 ab7HBUrz7Hjd/zgzwkv/3Plv5RcGuo8demVAYBkbStrhUU9IKRTQQ7rx15VEwplcAwzbofs65y
 1RMgEGUFY3iANNeZdTfRYxCfeikKH1yLoNrLFclBN1bspgiDbYo45q7nAUEfe1rDezveKj0QiK
 3zA=
X-SBRS: 2.7
X-MesageID: 11322255
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11322255"
To: Paul Durrant <pdurrant@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <dbdeec02-3a69-7262-fed6-2b280faf2b8e@citrix.com>
Date: Thu, 23 Jan 2020 14:45:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200123140305.21050-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMy8yMCAyOjAzIFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gdm14X2FsbG9jX3ZsYXBp
Y19tYXBwaW5nKCkgY3VycmVudGx5IGNvbnRhaW5zIHNvbWUgdmVyeSBvZGQgbG9va2luZyBjb2Rl
Cj4gdGhhdCBhbGxvY2F0ZXMgYSBNRU1GX25vX293bmVyIGRvbWhlYXAgcGFnZSBhbmQgdGhlbiBz
aGFyZXMgd2l0aCB0aGUgZ3Vlc3QKPiBhcyBpZiBpdCB3ZXJlIGEgeGVuaGVhcCBwYWdlLiBUaGlz
IHRoZW4gcmVxdWlyZXMgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKQo+IHRvIGNhbGwgYSBzcGVj
aWFsIGZ1bmN0aW9uIGluIHRoZSBtbSBjb2RlOiBmcmVlX3NoYXJlZF9kb21oZWFwX3BhZ2UoKS4K
PiAKPiBCeSB1c2luZyBhICdub3JtYWwnIGRvbWhlYXAgcGFnZSAoaS5lLiBieSBub3QgcGFzc2lu
ZyBNRU1GX25vX293bmVyIHRvCj4gYWxsb2NfZG9taGVhcF9wYWdlKCkpLCB0aGUgb2RkIGxvb2tp
bmcgY29kZSBpbiB2bXhfYWxsb2NfdmxhcGljX21hcHBpbmcoKQo+IGNhbiBzaW1wbHkgdXNlIGdl
dF9wYWdlX2FuZF90eXBlKCkgdG8gc2V0IHVwIGEgd3JpdGFibGUgbWFwcGluZyBiZWZvcmUKPiBp
bnNlcnRpb24gaW4gdGhlIFAyTSBhbmQgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKSBjYW4gc2lt
cGx5IHJlbGVhc2UgdGhlCj4gcGFnZSB1c2luZyBwdXRfcGFnZV9hbGxvY19yZWYoKSBmb2xsb3dl
ZCBieSBwdXRfcGFnZV9hbmRfdHlwZSgpLiBUaGlzCj4gdGhlbiBhbGxvd3MgZnJlZV9zaGFyZWRf
ZG9taGVhcF9wYWdlKCkgdG8gYmUgcHVyZ2VkLgo+IAo+IFRoZXJlIGlzLCBob3dldmVyLCBzb21l
IGZhbGwtb3V0IGZyb20gdGhpcyBzaW1wbGlmaWNhdGlvbjoKPiAKPiAtIGFsbG9jX2RvbWhlYXBf
cGFnZSgpIHdpbGwgbm93IGNhbGwgYXNzaWduX3BhZ2VzKCkgYW5kIHJ1biBpbnRvIHRoZSBmYWN0
Cj4gICB0aGF0ICdtYXhfcGFnZXMnIGlzIG5vdCBzZXQgdW50aWwgc29tZSB0aW1lIGFmdGVyIGRv
bWFpbl9jcmVhdGUoKS4gVG8KPiAgIGF2b2lkIGFuIGFsbG9jYXRpb24gZmFpbHVyZSwgZG9tYWlu
X2NyZWF0ZSgpIGlzIG1vZGlmaWVkIHRvIHNldAo+ICAgbWF4X3BhZ2VzIHRvIGFuIGluaXRpYWwg
dmFsdWUsIHN1ZmZpY2llbnQgdG8gY292ZXIgYW55IGRvbWhlYXAKPiAgIGFsbG9jYXRpb25zIHJl
cXVpcmVkIHRvIGNvbXBsZXRlIGRvbWFpbiBjcmVhdGlvbi4gVGhlIHZhbHVlIHdpbGwgYmUKPiAg
IHNldCB0byB0aGUgJ3JlYWwnIG1heF9wYWdlcyB3aGVuIHRoZSB0b29sLXN0YWNrIGxhdGVyIHBl
cmZvcm1zIHRoZQo+ICAgWEVOX0RPTUNUTF9tYXhfbWVtIG9wZXJhdGlvbiwgdGh1cyBhbGxvd2lu
ZyB0aGUgcmVzdCBvZiB0aGUgZG9tYWluJ3MKPiAgIG1lbW9yeSB0byBiZSBhbGxvY2F0ZWQuCj4g
Cj4gLSBCZWNhdXNlIHRoZSBkb21oZWFwIHBhZ2UgaXMgbm8gbG9uZ2VyIGEgcHNldWRvLXhlbmhl
YXAgcGFnZSwgdGhlCj4gICByZWZlcmVuY2UgY291bnRpbmcgd2lsbCBwcmV2ZW50IHRoZSBkb21h
aW4gZnJvbSBiZWluZyBkZXN0cm95ZWQuIFRodXMKPiAgIHRoZSBjYWxsIHRvIHZteF9mcmVlX3Zs
YXBpY19tYXBwaW5nKCkgaXMgbW92ZWQgZnJvbSB0aGUKPiAgIGRvbWFpbl9kZXN0cm95KCkgbWV0
aG9kIGludG8gdGhlIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIG1ldGhvZC4KPiAgIFdo
aWxzdCBpbiB0aGUgYXJlYSwgbWFrZSB0aGUgZG9tYWluX2Rlc3Ryb3koKSBtZXRob2QgYW4gb3B0
aW9uYWwKPiAgIGFsdGVybmF0aXZlX3ZjYWxsKCkgKHNpbmNlIGl0IHdpbGwgbm8gbG9uZ2VyIHBl
Zm9ybSBhbnkgZnVuY3Rpb24gaW4gVk1YCj4gICBhbmQgaXMgc3R1YmJlZCBpbiBTVk0gYW55d2F5
KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
CgpUaGlzIGlzIGFuIGV4Y2VsbGVudCBjaGFuZ2UsIHRoYW5rIHlvdToKClJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpNeSBvbmx5IGNvbW1lbnQg
aXMgdGhhdCB0aGlzIHdvdWxkIGhhdmUgYmVlbiBhIGJpdCBlYXNpZXIgdG8gcmV2aWV3CmJyb2tl
biBkb3duIGludG8gcHJvYmFibHkgdGhyZWUgcGF0Y2hlczogMSkgbWFraW5nIGRvbWFpbl9kZXN0
cm95Cm9wdGlvbmFsLCAyKSBtb3Zpbmcgdm14IHRlYXJkb3duIHRvIGEgcmVsaW5xdWlzaF9yZXNv
dXJjZXMgY2FsbCAzKSB1c2luZwoibm9ybWFsIiBwYWdlcyIuICBCdXQgSSBkb24ndCB0aGluayBp
dCdzIHdvcnRoIGEgcmUtc2VuZCBqdXN0IGZvciB0aGF0LgoKIC1HZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
