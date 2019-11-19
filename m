Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6E1029C7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:50:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6fW-0004hP-Bp; Tue, 19 Nov 2019 16:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a1CI=ZL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iX6fV-0004hE-9K
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:47:57 +0000
X-Inumbo-ID: 53710206-0aec-11ea-a2ff-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53710206-0aec-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574182072;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=4/cYNwXMONFyAgC3JR7E9jwb+T/JGeqgyzuSdHp+RKI=;
 b=Wk1IOAmoI13u2eDU3F6XrCLURzgg8mKrK4xg+C0BO2CaGDdH1Lsl7QBE
 Y9IUcJdSqtHFpVEB1p2efMh1sF0qqmiPMdMZqYQEBlpmWn120KKWZp0+P
 oFzSFy4Wjz2MJgoeS3S83a9UNftsMGujtvXroKoJJnMNheB5wacxEC90J 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bUhxlzvhHNxA0ByrMuHGzQ6aK9CoNiwRzORpWmNlXcOPxbb7h+tsF+ER7wC7W/WKzm1CTa3StY
 AAJD23DWZjBEY4l+RGeJnnnCP8yq67D0+bXGx0iDr/nu0hiBNrvD1Z+p6JUQW0vzebl61tN3aF
 Bxg2llg5Nt433yGDxHwoDmGJdb8ffHDDCOC6Meay3SRIK9OeuYihMRLF6FNI0kzD9GYktdl0B9
 PhhfLbWEgbSwAAvBuUq8Tpt7wGeQymlWGXQRH6cff7N8j7DqVj4KuPUScg92/lWmF5/ojCe1xi
 vdM=
X-SBRS: 2.7
X-MesageID: 8660087
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,218,1571716800"; 
   d="scan'208";a="8660087"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24020.7348.510330.847360@mariner.uk.xensource.com>
Date: Tue, 19 Nov 2019 16:47:48 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Olaf Hering
 <olaf@aepfle.de>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
In-Reply-To: <24010.40492.241066.724248@mariner.uk.xensource.com>
References: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
 <bbcb318a-0774-ba98-6f83-49f0ee1c6598@citrix.com>
 <23992.34990.952195.433864@mariner.uk.xensource.com>
 <24010.40492.241066.724248@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9yLTQuMTNd
IHRvb2xzL2NvbmZpZ3VyZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJHRVRfIGZv
ciBzaGltIik6Cj4gQW5kcmV3LCBkaWQgeW91IHdhbnQgdG8gYWNrIHRoaXMgPyAgT3IgZG8geW91
IGhhdmUgZnVydGhlciBjb21tZW50cyA/Cj4gSSBoYXZlIGEgcmVsZWFzZS1hY2suLi4KCkhybS4g
IGdldF9tYWludGFpbmVyIHRoaW5rcyB0aGlzIGlzIGZvciBXZWkuICBDQydkLgoKSWFuLgoKPiA+
RnJvbSAxYThkZTM2Njk5YjkwNDJjMzA3OTdlMDVmN2E1ZjQzMTNkN2Y3YWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgo+IERhdGU6IFR1ZSwgMjkgT2N0IDIwMTkgMTc6NDU6MzAgKzAwMDAKPiBTdWJqZWN0OiBb
UEFUQ0hdIHRvb2xzL2NvbmZpZ3VyZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJH
RVRfIGZvcgo+ICBzaGltCj4gTUlNRS1WZXJzaW9uOiAxLjAKPiBDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKPiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4g
Cj4gVGhlIHB2c2hpbSBjYW4gb25seSBiZSBidWlsdCA2NC1iaXQgYmVjYXVzZSB0aGUgaHlwZXJ2
aXNvciBpcyBvbmx5Cj4gNjQtYml0IG5vd2FkYXlzLiAgVGhlIGh5cGVydmlzb3IgYnVpbGQgc3Vw
cG9ydHMgWEVOX0NPTVBJTEVfQVJDSCBhbmQKPiBYRU5fVEFSR0VUX0FSQ0ggd2hpY2ggb3ZlcnJp
ZGUgdGhlIGluZm9ybWF0aW9uIGZyb20gdW5hbWUuICBUaGUgcHZzaGltCj4gYnVpbGQgcnVucyBv
dXQgb2YgdGhlIHRvb2xzLyBkaXJlY3RvcnkgYnV0IGNhbGxzIHRoZSBoeXBlcnZpc29yIGJ1aWxk
Cj4gc3lzdGVtLgo+IAo+IElmIG9uZSBydW5zIGluIGEgTGludXggMzItYml0IHVzZXJsYW5kIHdp
dGggYSA2NC1iaXQga2VybmVsLCBvbmUgdXNlZAo+IHRvIGJlIGFibGUgdG8gc2V0IFhFTl9DT01Q
SUxFX0FSQ0guICBCdXQgbm93YWRheXMgdGhpcyBkb2VzIG5vdCB3b3JrLgo+IGNvbmZpZ3VyZSBz
ZWVzIHRoZSB0YXJnZXQgY3B1IGFzIDY0LWJpdCBhbmQgdHJpZXMgdG8gYnVpbGQgcHZzaGltLgo+
IFRoZSBidWlsZCBwcmludHMKPiAgIGVjaG8gIioqKiBYZW4geDg2LzMyIHRhcmdldCBubyBsb25n
ZXIgc3VwcG9ydGVkISIKPiBhbmQgZG9lc24ndCBidWlsZCBhbnl0aGluZy4gIFRoZW4gdGhlIHN1
YnNlcXVlbnQgTWFrZWZpbGVzIHRyeSB0bwo+IGluc3RhbGwgdGhlIG5vbi1idWlsdCBwaWVjZXMu
Cj4gCj4gRml4IHRoaXMgYW5vbWFseSBieSBjYXVzaW5nIGNvbmZpZ3VyZSB0byBob25vdXIgdGhl
IFhlbiBoeXBlcnZpc29yIHdheQo+IG9mIHNldHRpbmcgdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUu
Cj4gCj4gSW4gcHJpbmNpcGxlIHRoaXMgdXNlciBiZWhhdmlvdXIgaXMgbm90IGhhbmRsZWQgcXVp
dGUgcmlnaHQsIGJlY2F1c2UKPiBjb25maWd1cmUgd2lsbCBzdGlsbCBzZWUgNjQtYml0IGFuZCBz
byBhbGwgdGhlIGF1dG9jb25mLWJhc2VkCj4gYXJjaGl0ZWN0dXJlIHRlc3Rpbmcgd2lsbCBzZWUg
NjQtYml0IHJhdGhlciB0aGFuIDMyLWJpdCB4ODYuICBCdXQgdGhlCj4gdG9vbHMgYXJlIGluIGZh
Y3QgZ2VuZXJhbGx5IHF1aXRlIHBvcnRhYmxlOiB0aGlzIHBhcnRpY3VsYXIgbG9jYXRpb24KPiBp
biBjb25maWd1cmV7LmFjLH0gaXMgdGhlIG9ubHkgcGxhY2UgaW4gdG9vbHMvIHdoZXJlIDY0LWJp
dCB4ODYgaXMKPiB0cmVhdGVkIGRpZmZlcmVudGx5IGZyb20gMzItYml0IHg4Niwgc28gdGhlIGZp
eCBpcyBzdWZmaWNpZW50IGFuZAo+IGNvcnJlY3QgZm9yIHRoaXMgdXNlIGNhc2UuCj4gCj4gSXQg
cmVtYWlucyB0aGUgY2FzZSB0aGF0IFhFTl9DT01QSUxFX0FSQ0ggb3IgWEVOX1RBUkdFVF9BUkNI
IHRvIGEKPiBub24teDg2IGFyY2hpdGVjdHVyZSwgd2hlbiBjb25maWd1cmUgdGhpbmtzIHRoaW5n
cyBhcmUgeDg2LCBvciB2aWNlCj4gdmVyc2EsIHdpbGwgbm90IHdvcmsgcmlnaHQuCj4gCj4gKFRo
aXMgaXMgYSBidWdmaXggdG8gODg0NTE1NWM4MzFjCj4gICBwdnNoaW06IG1ha2UgUFYgc2hpbSBi
dWlsZCBzZWxlY3RhYmxlIGZyb20gY29uZmlndXJlCj4gd2hpY2ggaW5hZHZlcnRhbnRseSBkZWxl
dGVkIHRoZSBsb2dpYyB0byBvbmx5IGJ1aWxkIHRoZSBzaGltIGZvcgo+IFhFTl9UQVJHRVRfQVJD
SCAhPSB4ODZfMzIuKQo+IAo+IEkgaGF2ZSByZXJ1biBhdXRvZ2VuLnNoLCBzbyB0aGlzIHBhdGNo
IGNvbnRhaW5zIHRoZSBmaXggdG8gY29uZmlndXJlCj4gYXMgd2VsbCBhcyB0aGUgc291cmNlIGZp
eCB0byBjb25maWd1cmUuYWMuCj4gCj4gRml4ZXM6IDg4NDUxNTVjODMxYzU5ZTg2N2VlM2RkMzFl
ZTYzZTBjYzZjN2RjZjIKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KPiBDQzogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+IENDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBSZWxlYXNlLWFja2VkLWJ5
OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHRvb2xzL2NvbmZpZ3Vy
ZSAgICB8IDIgKy0KPiAgdG9vbHMvY29uZmlndXJlLmFjIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvY29uZmlndXJlIGIvdG9vbHMvY29uZmlndXJlCj4gaW5kZXggODI5NDdhZDMwOC4uZDljY2Nl
NmQyYiAxMDA3NTUKPiAtLS0gYS90b29scy9jb25maWd1cmUKPiArKysgYi90b29scy9jb25maWd1
cmUKPiBAQCAtOTcxMSw3ICs5NzExLDcgQEAgZmkKPiAgZWxzZQo+ICAKPiAgICAgIGNwdT1gdGVz
dCAteiAiJHRhcmdldF9jcHUiICYmIGVjaG8gIiRob3N0X2NwdSIgfHwgZWNobyAiJHRhcmdldF9j
cHUiYAo+IC0gICAgY2FzZSAiJGNwdSIgaW4KPiArICAgIGNhc2UgIiR7WEVOX0NPTVBJTEVfQVJD
SC0ke1hFTl9UQVJHRVRfQVJDSC0kY3B1fX0iIGluCj4gICAgICAgICAgeDg2XzY0KQo+ICAgICAg
ICAgICAgIHB2c2hpbT0ieSI7Owo+ICAgICAgICAgICopIHB2c2hpbT0ibiI7Owo+IGRpZmYgLS1n
aXQgYS90b29scy9jb25maWd1cmUuYWMgYi90b29scy9jb25maWd1cmUuYWMKPiBpbmRleCA2NzRi
ZDU4MDlkLi5hOGQ4Y2U1ZmZlIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+ICsr
KyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+IEBAIC00NzksNyArNDc5LDcgQEAgQUNfQVJHX0VOQUJM
RShbcHZzaGltXSwKPiAgICAgICAgICAgICAgICAgICAgIFtEaXNhYmxlIHB2c2hpbSBidWlsZCAo
ZW5hYmxlZCBieSBkZWZhdWx0IG9uIDY0Yml0IHg4NildKSwKPiAgICAgIFtBU19JRihbdGVzdCAi
eCRlbmFibGVfcHZzaGltIiA9ICJ4bm8iXSwgW3B2c2hpbT1uXSwgW3B2c2hpbT15XSldLCBbCj4g
ICAgICBjcHU9YHRlc3QgLXogIiR0YXJnZXRfY3B1IiAmJiBlY2hvICIkaG9zdF9jcHUiIHx8IGVj
aG8gIiR0YXJnZXRfY3B1ImAKPiAtICAgIGNhc2UgIiRjcHUiIGluCj4gKyAgICBjYXNlICIke1hF
Tl9DT01QSUxFX0FSQ0gtJHtYRU5fVEFSR0VUX0FSQ0gtJGNwdX19IiBpbgo+ICAgICAgICAgIHg4
Nl82NCkKPiAgICAgICAgICAgICBwdnNoaW09InkiOzsKPiAgICAgICAgICAqKSBwdnNoaW09Im4i
OzsKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
