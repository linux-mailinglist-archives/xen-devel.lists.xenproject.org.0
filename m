Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBA0F33E0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:55:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSk4o-0001oo-Dc; Thu, 07 Nov 2019 15:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/O7A=Y7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iSk4m-0001oj-J5
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:52:00 +0000
X-Inumbo-ID: 88450164-0176-11ea-adbe-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88450164-0176-11ea-adbe-bc764e2007e4;
 Thu, 07 Nov 2019 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573141920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E2Kry47Uxw15SMJbEWFQlOVuhG4s9uA+slrcK7q9BFs=;
 b=Md9XJFxut6O0YrnKmurCJks5U6x+Rhloizb/QnoX1UPG3RGzDkfXLro8
 nomyn3nMwG06RdS2eHW/wVBpjKaJD+JwV0inrHjpznCieE5+VjXv+3Xte
 n3NDAyB+D2a4pHL7r+ltwrJC5Mpr4RMym0MwaHJ9ivFyS2Ubjkngn+d/a c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MM9XxGCck+qCdzLe/XB2Jb0x7zn2KZlFo6hAh9UJeNi1zmxmPDLfqLXOM2pqb2h8KVZ6CnAtHn
 qrjKwIetpVVoB8BcfluonndRkb8x0Qw19ChBWF/tTOYrovaME54ceURM3RTV4K//QqyMzzKjZ4
 p6ypM+uOrRe9Ln/lCJF2hjnDtjjq0SLrSYGlEzFvIbaZjeiIZnqQvIwpITwMs5vEiQJ4hNKavm
 exvGW2PUA+aOrEGBcvk4cyY1zbAZ6zmIiLSipxx/kF/qQkRxVEKLERTjLf69WCFX5NQ1bBYJfZ
 ups=
X-SBRS: 2.7
X-MesageID: 8001512
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8001512"
Date: Thu, 7 Nov 2019 16:51:33 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191107155133.GB17494@Air-de-Roger>
References: <20191107150609.93004-1-roger.pau@citrix.com>
 <20191107150609.93004-3-roger.pau@citrix.com>
 <df702a74-0941-3491-fb18-165f7fb592b0@suse.com>
 <20191107154632.GA17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107154632.GA17494@Air-de-Roger>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] x86/ioapic: don't use raw
 entry reads/writes in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDQ6NDY6MzJQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNDoyODo1NlBNICswMTAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IE9uIDA3LjExLjIwMTkgMTY6MDYsIFJvZ2VyIFBhdSBNb25uZSB3
cm90ZToKPiA+ID4gY2xlYXJfSU9fQVBJQ19waW4gY2FuIGJlIGNhbGxlZCBhZnRlciB0aGUgaW9t
bXUgaGFzIGJlZW4gZW5hYmxlZCwgYW5kCj4gPiA+IHVzaW5nIHJhdyBlbnRyeSByZWFkcyBhbmQg
d3JpdGVzIHdpbGwgcmVzdWx0IGluIGEgbWlzY29uZmlndXJhdGlvbiBvZgo+ID4gPiB0aGUgZW50
cmllcyBhbHJlYWR5IHNldHVwIHRvIHVzZSB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZS4K
PiA+IAo+ID4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgdGhpczogUmF3IHJlYWRzIGFu
ZCB3cml0ZXMgZG9uJ3QgZXZlbgo+ID4gZ28gdG8gdGhlIElPTU1VIGludGVycnVwdCByZW1hcHBp
bmcgY29kZSwgc28gaG93IHdvdWxkIHRoZSBhc3NlcnRpb24KPiA+IGJlIHRyaWdnZXJlZD8KPiAK
PiBCZWNhdXNlIHRoZSBjb2RlIGRvZXMgc29tZXRoaW5nIGxpa2U6Cj4gCj4gbWVtc2V0KCZydGUs
IDAsIC4uLik7Cj4gLi4uCj4gX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCB0cnVlLCBy
dGUpOwo+IAo+IEF0IHdoaWNoIHBvaW50IHlvdSBtaXNjb25maWd1cmUgYW4gaW9hcGljIGVudHJ5
IHRoYXQgd2FzIGFscmVhZHkgc2V0dXAKPiB0byBwb2ludCB0byBhbiBpbnRlcnJ1cHQgcmVtYXBw
aW5nIGVudHJ5LCBhbmQgdGhlIEFNRCBJT01NVSBjb2RlCj4gY2hva2VzIGluIHRoZSBhc3NlcnQg
YmVsb3cuCgpKdXN0IHRvIGNsYXJpZnkgc2luY2UgSSB0aGluayBteSByZXBseSBoYXNuJ3QgYmVl
biBmdWxseSBjbGVhciwgdGhlCkFTU0VSVCBkb2Vzbid0IHRyaWdnZXIgaW4gY2xlYXJfSU9fQVBJ
Q19waW4sIGJ1dCBhdCBhIGxhdGVyIHBvaW50IHdoZW4KdGhlIElPLUFQSUMgZW50cnkgaXMgY29u
ZmlndXJlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
