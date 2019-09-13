Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E38B2419
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8oR5-0007wS-Od; Fri, 13 Sep 2019 16:28:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8oR3-0007wN-V2
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:28:37 +0000
X-Inumbo-ID: 892a4111-d643-11e9-95b3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 892a4111-d643-11e9-95b3-12813bfff9fa;
 Fri, 13 Sep 2019 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568392116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ne3XR7pcwrQUtxnRMFImwzITzxGrFZD5Z0ExYyniBDw=;
 b=VcXP8orrYVIjldihk02EUZHAT1xb0VN5tfMsqYU9NltDqYLUlWoxm5AB
 VOb4SSpiVlW0PQbyW1QIrSs/SkXzeoYOlTqM/y590s4LomjMdpkBwgHqX
 IVzofu0Ji3F3o/DZjvplQtRD59Gf9BSf5KCjcagCtPIXC21B7LGbIZQtm k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ws/CUlZWLgVH7PUGyYKRDLXSgPdWmTMaXmZqIYx+Y1zKt91copQ1A9ifQU7Aha63ZrzMC2TMWK
 T82KrxpQXOv4wQCVf9DQkkdtdjnFuJOvOLQNKeEjC6cDRIvKWXCHh70236vML3urpb3i8mTKCu
 c2lcZJyxkvYfPqWpXB35H5fDxbkrFI7Kn62Zugy7o0Pim+xJLIPAG4HwGH7/K/BNdWfauYwsAM
 Mrs3O3SGUB/HA9Qbo9KIAd4LAhX94D2reLyDzWtomaQxShbuCGkaPbwLCNlk9ad6+IP2IC06Ar
 w7M=
X-SBRS: 2.7
X-MesageID: 5845161
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5845161"
Date: Fri, 13 Sep 2019 17:28:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190913162833.GG1308@perard.uk.xensource.com>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-7-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913105826.2704-7-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v11 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6NTg6MjZBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5oIGIvdG9vbHMvbGlieGwvbGli
eGwuaAo+IGluZGV4IDEyNTQ1MTMwZGYuLmU0YjljNTM5YjYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMv
bGlieGwvbGlieGwuaAo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKPiBAQCAtNDE1LDYgKzQx
NSwxNSBAQAo+ICAgKi8KPiAgI2RlZmluZSBMSUJYTF9IQVZFX0JVSUxESU5GT19JT01NVV9NRU1L
QiAxCj4gIAo+ICsvKgo+ICsgKiBMSUJYTF9IQVZFX0NSRUFURUlORk9fUEFTU1RIUk9VR0ggaW5k
aWNhdGVzIHRoYXQKPiArICogbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvIGhhcyBhIHBhc3N0aHJv
dWdoIGZpZWxkICh3aGljaCBpcyBhCj4gKyAqIGxpYnhsX3Bhc3N0aHJvdWdoIGVudW1lcmF0aW9u
KSB0aGF0IGluZGljYXRlcyB3aGV0aGVyIGRldmljZSBwYXNzLQo+ICsgKiB0aHJvdWdoIGlzIGVu
YWJsZWQgZm9yIHRoZSBkb21haW4gYW5kLCBpZiBzbywgd2hldGhlciB0aGUgSU9NTVUgYW5kCj4g
KyAqIEhBUCBwYWdlIHRhYmxlcyBtYXkgYmUgc2hhcmVkIG9yIG5vdC4KPiArICovCj4gKyNkZWZp
bmUgTElCWExfSEFWRV9DUkVBVEVJTkZPX1BBU1NUSFJPVUdIIDEKPiArCj4gIC8qCj4gICAqIGxp
YnhsIEFCSSBjb21wYXRpYmlsaXR5Cj4gICAqCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBpbmRleCA1OWRiY2I1
MGEwLi42Yjc3MDJkYjE3IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
Cj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAtNTc4LDYgKzU3OCwxNSBA
QCBpbnQgbGlieGxfX2RvbWFpbl9tYWtlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RvbWFpbl9jb25m
aWcgKmRfY29uZmlnLAo+ICAgICAgICAgICAgICAgICAgbGlieGxfZGVmYm9vbF92YWwoaW5mby0+
b29zKSA/IDAgOiBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmOwo+ICAgICAgICAgIH0KPiAgCj4gKyAg
ICAgICAgTE9HKERFVEFJTCwgInBhc3N0aHJvdWdoOiAlcyIsCj4gKyAgICAgICAgICAgIGxpYnhs
X3Bhc3N0aHJvdWdoX3RvX3N0cmluZyhpbmZvLT5wYXNzdGhyb3VnaCkpOwo+ICsKPiArICAgICAg
ICBpZiAoaW5mby0+cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfRElTQUJMRUQpCj4g
KyAgICAgICAgICAgIGNyZWF0ZS5mbGFncyB8PSBYRU5fRE9NQ1RMX0NERl9pb21tdTsKPiArCj4g
KyAgICAgICAgaWYgKGluZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNf
UFQpCj4gKyAgICAgICAgICAgIGNyZWF0ZS5pb21tdV9vcHRzIHw9IFhFTl9ET01DVExfSU9NTVVf
bm9fc2hhcmVwdDsKPiArCj4gICAgICAgICAgLyogVWx0aW1hdGVseSwgaGFuZGxlIGlzIGFuIGFy
cmF5IG9mIDE2IHVpbnQ4X3QsIHNhbWUgYXMgdXVpZCAqLwo+ICAgICAgICAgIGxpYnhsX3V1aWRf
Y29weShjdHgsIChsaWJ4bF91dWlkICopJmNyZWF0ZS5oYW5kbGUsICZpbmZvLT51dWlkKTsKPiAg
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xpYnhs
L2xpYnhsX3R5cGVzLmlkbAo+IGluZGV4IGQ1MmM2M2I2YjAuLjIyZjA1NzExZTMgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfdHlwZXMuaWRsCj4gQEAgLTI2Myw2ICsyNjMsMTIgQEAgbGlieGxfdmtiX2JhY2tlbmQgPSBF
bnVtZXJhdGlvbigidmtiX2JhY2tlbmQiLCBbCj4gICAgICAoMiwgIkxJTlVYIikKPiAgICAgIF0p
Cj4gIAo+ICtsaWJ4bF9wYXNzdGhyb3VnaCA9IEVudW1lcmF0aW9uKCJwYXNzdGhyb3VnaCIsIFsK
PiArICAgICgwLCAiZGlzYWJsZWQiKSwKPiArICAgICgxLCAic3luY19wdCIpLAo+ICsgICAgKDIs
ICJzaGFyZV9wdCIpLAo+ICsgICAgXSkKPiArCj4gICMKPiAgIyBDb21wbGV4IGxpYnhsIHR5cGVz
Cj4gICMKClNvLCB3aXRoIHRoaXMgY2hhbmdlcywgd2hlbiBsaWJ2aXJ0IGlzIHJlYnVpbHQgYWdh
aW5zdCBhIG5ld2VyIGxpYnhsLApndWVzdCB3aXRoIHBhc3MtdGhyb3VnaCBkZXZpY2VzIHdvbid0
IHdvcmsgYW55bW9yZT8KKFRoYXQgaXMsIHdpdGhvdXQgbW9kaWZpY2F0aW9uIG9mIGxpYnZpcnQu
KQoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
