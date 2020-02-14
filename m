Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD215D9B3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 15:46:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2cD0-00038K-2a; Fri, 14 Feb 2020 14:44:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lgAG=4C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2cCz-00038D-Bv
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 14:44:45 +0000
X-Inumbo-ID: 898b56e4-4f38-11ea-ba7e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 898b56e4-4f38-11ea-ba7e-12813bfff9fa;
 Fri, 14 Feb 2020 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581691485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0pvfiJLXTOHty4liouMLF0mURx44SZOSxjxpMqoy4VI=;
 b=WVTy3PqBENV+2oPfsCDOYmiCyGlV70YqDerTNDqoIPY2dfzr1ynwtB6x
 Uf/AP6FFQo9ZpBEhTFUCUARoD9DOH6uzYQe6kckvYqI3/phnP+ZhouUu7
 aVUG71RCmuND7U7WxUutVhK0CXHpjrP55ncd9XbI0kv0HaTNbz0oEgfEH 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aZ8QUu6d/g9DbWPDKdzXnv6OzO8VNhntLsrlcFg/1oUI0JfTRcK8mOcbk32iPcRnxOC/5CdOvV
 8iEt1VOmCGD/4yI+HxBjqCRG4afcGkQf3VE/dxgLHczcCxZEzkIFV5L1A0I9HKRnkcrDMxiyoq
 7aYrfjBhmbclh3OotMAvhAMlwNlFyo58pp84/lSJ5nEkTKAdsvgKyUrbMYdezWjEmC+b6FJX20
 85ZASwnqyb3Ii2/iBZVcHAXLtBhHhYIQDC27UJwIqE58/pTsHusgYD4gQiUkNbNLnUEeZLfZ7m
 nb0=
X-SBRS: 2.7
X-MesageID: 12460744
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,440,1574139600"; d="scan'208";a="12460744"
Date: Fri, 14 Feb 2020 15:44:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200214144436.GC4679@Air-de-Roger>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-2-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214123430.4942-2-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMTI6MzQ6MjhQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBIeXBlci1WJ3MgTDAgYXNzaXN0ZWQgZmx1c2ggaGFzIGZpbmUtZ3JhaW5lZCBjb250cm9sIG92
ZXIgd2hhdCBnZXRzCj4gZmx1c2hlZC4gV2UgbmVlZCBhbGwgdGhlIGZsYWdzIGF2YWlsYWJsZSB0
byBtYWtlIHRoZSBiZXN0IGRlY2lzaW9ucwo+IHBvc3NpYmxlLgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGJlY2F1c2UgWGVuJ3MgaW1wbGVtZW50YXRpb24gZG9lc24ndCBjYXJlIGFib3V0Cj4g
d2hhdCBpcyBwYXNzZWQgdG8gaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT4KCkxHVE06CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CgpKdXN0IG9uZSBjb21tZW50IGJlbG93LgoKPiAtLS0KPiB2MjoK
PiAxLiBJbnRyb2R1Y2UgRkxVU0hfVExCX0ZMQUdTX01BU0sKPiAtLS0KPiAgeGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCAgNyArKysrKy0tCj4gIHhlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4veGVuLmMgICAgICAgICAgIHwgIDIgKy0KPiAgeGVuL2FyY2gveDg2L3NtcC5jICAg
ICAgICAgICAgICAgICAgICAgfCAgNSArKy0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNo
dGxiLmggICAgICAgICB8ICAzICsrKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
dmlzb3IuaCB8IDEwICsrKysrLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiBpbmRleCA0
N2U5MzhlMjg3Li42ZWUyOGM5ZGYxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnZpc29yLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gQEAg
LTc1LDEwICs3NSwxMyBAQCB2b2lkIF9faW5pdCBoeXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0
IGU4MjBtYXAgKmU4MjApCj4gIH0KPiAgCj4gIGludCBoeXBlcnZpc29yX2ZsdXNoX3RsYihjb25z
dCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGZsYWdzKQo+ICB7Cj4gKyAgICBpZiAoIGZsYWdzICYgfkZMVVNIX1RMQl9GTEFH
U19NQVNLICkKCkkgdGhpbmsgYW4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgd291bGQgYmUgZ29vZCBo
ZXJlLCBzaW5jZSB5b3UgYXJlIG5vdApzdXBwb3NlZCB0byBjYWxsIGh5cGVydmlzb3JfZmx1c2hf
dGxiIHdpdGggbm9uIFRMQiByZWxhdGVkIGZsYWdzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
