Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840C11527C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 15:16:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idELe-0007mw-Ar; Fri, 06 Dec 2019 14:12:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnnL=Z4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1idELc-0007mr-O6
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 14:12:44 +0000
X-Inumbo-ID: 777fbacf-1832-11ea-830c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 777fbacf-1832-11ea-830c-12813bfff9fa;
 Fri, 06 Dec 2019 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575641564;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cBXW9IuKa/KZKhcvfUx5vDZIloTEoRhFiSbhWe9OU6E=;
 b=T3ypb2vENcIBqTxFHROL3sFhgnui3kTYQGuUedhbyCdTfgTj+7Kmx8hq
 1S7xCpbk7xVkQ86PoWeyXSFqt+Sh/e/KXeR/LHRQswmg8uxfa6LR/Zeq9
 x7AImtHgEZiu+Rne1iZP85JBPDydx0Ff9Brq9gJbO2WZdkJ73ae03oC70 Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qCWhSUfHor+K7YYad9Y5SCbp0WDy1LamN+Fdl+v0qGSfa0fX27lQQi7DsaV14xgXBOQ62scI15
 hX88b1yDIb/gzIu9akIeNydtlpzVTHlhYn+WyVvCuKx2iVEuejZL6WVW3HnVkuTUVpG3qfQREi
 qqIiI2H4wH44DiUihy96OMttGCqlYrNao8q6MmtSzXiVJ8iFNQ6A+/UsHaXWdeQw4sTFqcpk2J
 ublfFh5A8ZFkvHk3AQfo7W5aGVtMi7zYfxi4Usyv02DbTi6j0AmGTNnWpkC2g/DriWwzR0vCrg
 RuI=
X-SBRS: 2.7
X-MesageID: 9312296
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9312296"
To: Jan Beulich <jbeulich@suse.com>
References: <20191206114843.4028617-1-george.dunlap@citrix.com>
 <3739b475-3573-14ad-7020-1c9e9befcf34@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <10ce5c3f-c303-7c04-1ef2-f296705d376c@citrix.com>
Date: Fri, 6 Dec 2019 14:12:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3739b475-3573-14ad-7020-1c9e9befcf34@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] CODING_STYLE: Document how to handle
 unexpected conditions
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNi8xOSAxMjoxNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMTIuMjAxOSAx
Mjo0OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gLS0tIGEvQ09ESU5HX1NUWUxFCj4+ICsrKyBi
L0NPRElOR19TVFlMRQo+PiBAQCAtMTMzLDMgKzEzMyw4NiBAQCB0aGUgZW5kIG9mIGZpbGVzLiAg
SXQgc2hvdWxkIGJlOgo+PiAgICogaW5kZW50LXRhYnMtbW9kZTogbmlsCj4+ICAgKiBFbmQ6Cj4+
ICAgKi8KPj4gKwo+PiArSGFuZGxpbmcgdW5leHBlY3RlZCBjb25kaXRpb25zCj4+ICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKwo+PiArR1VJREVMSU5FUzoKPj4gKwo+PiArUGFz
c2luZyBlcnJvcnMgdXAgdGhlIHN0YWNrIHNob3VsZCBiZSB1c2VkIHdoZW4gdGhlIGNhbGxlciBp
cyBhbHJlYWR5Cj4+ICtleHBlY3RpbmcgdG8gaGFuZGxlIGVycm9ycywgYW5kIHRoZSBzdGF0ZSB3
aGVuIHRoZSBlcnJvciB3YXMKPj4gK2Rpc2NvdmVyZWQgaXNu4oCZdCBicm9rZW4sIG9yIHRvbyBp
c24ndCBoYXJkIHRvIGZpeC4KPiAKPiBXYXMgdGhlICJ0b28iIG1lYW50IHRvIGNvbWUgbGF0ZXIg
aW4gdGhlIHNlbnRlbmNlPwoKSSBkaWQgYWN0dWFsbHkgZ28gdGhyb3VnaCB0aGlzIHNldmVyYWwg
dGltZXM7IEkgZG9uJ3QgaGF2ZSBhbnkgaWRlYSBob3cKSSBtYW5hZ2VkIHRvIG1pc3MgYWxsIHRo
ZXNlIGVkaXRpbmcgbWlzdGFrZXMhICBBbGwgZWRpdGluZyBjb21tZW50cyBhcmUKImFjayIgdW5s
ZXNzIG90aGVyd2lzZSBtZW50aW9uZWQuCgo+PiArZG9tYWluX2NyYXNoKCkgc2hvdWxkIGJlIHVz
ZWQgd2hlbiBwYXNzaW5nIGVycm9ycyB1cCB0aGUgc3RhY2sgaXMgdG9vCj4+ICtkaWZmaWN1bHQs
IGFuZC9vciB3aGVuIGZpeGluZyB1cCBzdGF0ZSBvZiBhIGd1ZXN0IGlzIGltcHJhY3RpY2FsLCBi
dXQKPj4gK3doZXJlIGZpeGluZyB1cCB0aGUgc3RhdGUgb2YgWGVuIHdpbGwgYWxsb3cgWGVuIHRv
IGNvbnRpbnVlIHJ1bm5pbmcuCj4+ICsKPj4gK0JVR19PTigpIHNob3VsZCBiZSB1c2VkIHdoZW4g
eW91IGNhbuKAmXQgcGFzcyBlcnJvcnMgdXAgdGhlIHN0YWNrLCBhbmQKPj4gK2VpdGhlciBjb250
aW51aW5nIG9yIGNyYXNoaW5nIHRoZSBndWVzdCB3b3VsZCBsaWtlbHkgY2F1c2UgYW4KPj4gK2lu
Zm9ybWF0aW9uIGxlYWsgb3IgcHJpdmlsZWdlIGVzY2FsYXRpb24gdnVsbmVyYWJpbGl0eS4KPiAK
PiBTdHJpY3RseSBzcGVha2luZyBCVUdfT04oKSBpc24ndCBhbiBlcnJvciBoYW5kbGluZyBtZWNo
YW5pc20gZWl0aGVyLgo+IEZ1cnRoZXIgZG93biBpdCBiZWNvbWVzIG1vcmUgY2xlYXIgKGl0IHJh
dGhlciB0byBiZSB1c2VkIGZvcgo+IGRldGVjdGluZyBicm9rZW4gYXNzdW1wdGlvbnMpLCBidXQg
SSBndWVzcyBpdCB3b3VsZG4ndCBodXJ0IHRvIHNheQo+IHNvIGhlcmUgYXMgd2VsbC4KCkkgZ3Vl
c3MgaXQgZGVwZW5kcyBvbiB3aGF0IHlvdSBtZWFuIGJ5ICJlcnJvciBoYW5kbGluZyBtZWNoYW5p
c20iLiAgVGhlCkJVR19PTigpIGluIHBhZ2VfYWxsb2MuYyBoYXMgcmVsaWFibHkgY2hhbmdlZCBw
b3RlbnRpYWwgcHJpdmlsZWdlCmVzY2FsYXRpb25zIGludG8gIm1lcmUiIERvU2VzIG92ZXIgdGhl
IHllYXJzLgoKVGhlIGRpc3RpbmN0aW9uIEknbSB0cnlpbmcgdG8gZHJhdyBiZXR3ZWVuIEJVR19P
TigpIGFuZCBBU1NFUlQoKSBpcyB0aGF0CkJVR19PTigpIGFjdHVhbGx5IGhhbmRsZXMgdGhlIHNp
dHVhdGlvbiAoYWxiZWl0IHdpdGggYSB2ZXJ5IGhlYXZ5CmhhbW1lcikuICBBU1NFUlQoKSBpcyBl
c3NlbnRpYWxseSBhIG1vcmUgbm90aWNlYWJsZSBwcmludGsuCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
