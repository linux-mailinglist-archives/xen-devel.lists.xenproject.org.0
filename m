Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC015B4A38
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 11:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA9ae-0000cp-PB; Tue, 17 Sep 2019 09:16:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lvim=XM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iA9ad-0000cN-52
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 09:16:03 +0000
X-Inumbo-ID: c1649932-d92b-11e9-9604-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1649932-d92b-11e9-9604-12813bfff9fa;
 Tue, 17 Sep 2019 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568711757;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qWoaeG67EB1c1SaTLPQkwUYmV815EXI5/saZIDu3I6Q=;
 b=S7Uy0xeluK6kkkTFKF73215pGwefWm+DrOQwPk0Wun+L5FL4k7VZDKCi
 O3LZyboy8rRWsckCUAxRR5jXnSZMBnGvlskaXdW/kHdbC9tcGCB40gkQ5
 isiH70oqEOewnTrg6Qz+VbQwyO/fgy4M5ItP++5RdnQFdyEGoQ02gh4ib Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I+ta0LXVLGK/1vQ++lZOsvYeQD9GxOkvB48H5/cmZ9dArtjtHVdoMPBRfsI9jj+A14R9rppQQM
 Z1ha1xQvw8Sb8IDE0b5DjJ5GEKC7bCeAih0sgVcgRNsq6gleaoFRAPXyAVHQY4bgnbs6qs8qfZ
 ipwlA+vGFjiUbTs6ggbstz+Vk0bCDKS8VACp838J/sPr6BBjQe9CFEEUoftHUlZL0LC/xaO2bQ
 qPdk8LtQ+imJpNQTKO6KwU3GdIpq9mCiTflb9Jkgcet9+OtanaPowLfWoULGr1Hl/taI7+QDXA
 OWw=
X-SBRS: 2.7
X-MesageID: 5656551
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,515,1559534400"; 
   d="scan'208";a="5656551"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-5-wipawel@amazon.de>
 <631eae09-7962-c1eb-6f78-07c5e5f3f43f@citrix.com>
 <A970765E-5DDF-4E62-9C9C-EAF8634882DE@amazon.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <e618d173-07fe-49c5-0c80-28c95182edca@citrix.com>
Date: Tue, 17 Sep 2019 10:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <A970765E-5DDF-4E62-9C9C-EAF8634882DE@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 04/12] livepatch: Implement pre-|post-
 apply|revert hooks
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNy8xOSAxMDoxMiBBTSwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oIGIveGVuL2luY2x1
ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKPj4+IGluZGV4IDk5NjEzYWYyZGIuLmNkMjA5NDRj
YzQgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaAo+
Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKPj4+IEBAIC0yMSw2
ICsyMSwxNiBAQCB0eXBlZGVmIHN0cnVjdCBwYXlsb2FkIGxpdmVwYXRjaF9wYXlsb2FkX3Q7Cj4+
PiAgIHR5cGVkZWYgdm9pZCBsaXZlcGF0Y2hfbG9hZGNhbGxfdCh2b2lkKTsKPj4+ICAgdHlwZWRl
ZiB2b2lkIGxpdmVwYXRjaF91bmxvYWRjYWxsX3Qodm9pZCk7Cj4+PiAgICt0eXBlZGVmIGludCBs
aXZlcGF0Y2hfcHJlY2FsbF90KGxpdmVwYXRjaF9wYXlsb2FkX3QgKmFyZyk7Cj4+PiArdHlwZWRl
ZiB2b2lkIGxpdmVwYXRjaF9wb3N0Y2FsbF90KGxpdmVwYXRjaF9wYXlsb2FkX3QgKmFyZyk7Cj4+
PiArCj4+PiArc3RydWN0IGxpdmVwYXRjaF9ob29rcyB7Cj4+PiArICAgIHN0cnVjdCB7Cj4+PiAr
ICAgICAgICBsaXZlcGF0Y2hfcHJlY2FsbF90ICpjb25zdCAqcHJlOwo+Pj4gKyAgICAgICAgbGl2
ZXBhdGNoX3Bvc3RjYWxsX3QgKmNvbnN0ICpwb3N0Owo+Pgo+PiBXb3VsZG4ndCBpdCBiZSBzaW1w
bGVyIHRvIGRyb3AgYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiBoZXJlPwo+IAo+IEkgdGhpbmsgaXQg
d291bGQgY29tcGxpY2F0ZSB0aGluZ3MsIGJlY2F1c2UgdGhlIGhhbmRsaW5nIG9mIG9yaWdpbmFs
IGhvb2tzIChsb2FkLCB1bmxvYWQpCj4gaGFzIGJlZW4gaW1wbGVtZW50ZWQgYXMgYSBwb2ludGVy
IHRvIGFuIGFycmF5IG9mIHBvaW50ZXJzIChiZWNhdXNlIG9mIHRoZSBtdWx0aXBsZSBob29rcyBy
ZXF1aXJlbWVudCkuCj4gCj4gSSBkaWQgbm90IHdhbnQgdG8gaW50cm9kdWNlIGEgZGlzdGluY3Rp
b24gYmV0d2VlbiBwb2ludGVycyB0byBtdWx0aXBsZSBob29rcyBhbmQgc2luZ2xlIGhvb2tzIGZv
ciBzaW1wbGljaXR5Cj4gKGFsbCB0aGUgaG9va3MgYXJlIGFycmF5cyBvZiBwb2ludGVycywgZXZl
biBpZiB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlIGhvb2spLgo+IAo+IEkgYmVsaWV2ZSB0aGF0IG1h
a2VzIHRoZSB3aG9sZSBjb2RlIGEgYml0IG1vcmUgY29uc2lzdGVudCBhbmQgcG90ZW50aWFsbHkg
cmUtdXNhYmxlLgo+IApPSywgZmFpciBlbm91Z2guCgotLSAKUm9zcyBMYWdlcndhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
