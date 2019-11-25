Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D46B109040
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:41:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFW3-0002s5-CT; Mon, 25 Nov 2019 14:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nqy9=ZR=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZFW2-0002rq-8U
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 14:39:02 +0000
X-Inumbo-ID: 51ce2fc4-0f91-11ea-9455-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51ce2fc4-0f91-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574692740;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=39qxxSnECzI2bbuEcS2WsdVKiNSawm7SgCKOfv+EDsc=;
 b=bjHVDuDwdjF54khvAG9ysuNFouTdn2Imn98EprgO0856/Gnu0sP8Fb9Y
 V9fmdxboiBaT2OVgi8kEIzKnaiiXhAgVKBoJtg1aiBV+zMuDEg3/z3YZS
 9Ubbk7foxrzBVZWE7Nsd7dTrVWKEIigsgOqWye/zX9edmtIhB5o/aqbzL A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M3TXTfTK7zZJ2ivjGgffLMzrs4TR7kU0oHsDid+ZaeM/p9da3zxmtpboNd2PdpEE+iiVDMZpO5
 CIKUvN9NT04QdAbRV2Bo0BIHZhICFNPboTLkfiaFFL4nG7P/1Aa0dL8rGlF4xbPIpfhedESxFS
 l6suooE57M0Q7MMZ1vkuKAKNy3SBDWK4VyflC3CiHIWBQeQlW645Q/tQg1vrO0E8TCnFpRaqRx
 NuIN1goABJq45xJb+YX3cVx00wyUGzYiN8OHxg27/TJy19g396GPz61U/umYOSyckJv/ZVwaSE
 7QI=
X-SBRS: 2.7
X-MesageID: 9205627
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="9205627"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916113056.16592-1-wipawel@amazon.de>
 <20190916113056.16592-7-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <9dd3a4db-b348-6770-1815-86ce78377119@citrix.com>
Date: Mon, 25 Nov 2019 14:38:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190916113056.16592-7-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 6/7] livepatch-build: Strip transient or
 unneeded symbols
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMjozMCBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gSW4gdGhl
IHByb2Nlc3Mgb2YgY3JlYXRpbmcgYSBmaW5hbCBob3RwYXRjaCBtb2R1bGUgZmlsZSBtYWtlIHN1
cmUgdG8KPiBzdHJpcCBhbGwgdHJhbnNpZW50IHN5bWJvbHMgdGhhdCBoYXZlIG5vdCBiZWVuIGNh
dWdodCBhbmQgcmVtb3ZlZCBieQo+IGNyZWF0ZS1kaWZmLW9iamVjdCBwcm9jZXNzaW5nLiBGb3Ig
bm93IHRoZXNlIGFyZSBvbmx5IHRoZSBob29rcwo+IGtwYXRjaCBsb2FkL3VubG9hZCBzeW1ib2xz
Lgo+IAo+IEZvciBhbGwgbmV3IG9iamVjdCBmaWxlcyB0aGF0IGFyZSBjYXJyaWVkIGFsb25nIGZv
ciB0aGUgZmluYWwgbGlua2luZwo+IHRoZSB0cmFuc2llbnQgaG9va3Mgc3ltYm9scyBhcmUgbm90
IHN0cmlwcGVkIGFuZCBuZWl0aGVyIGFyZSBhbnkKPiB1bm5lZWRlZCBzeW1ib2xzLiBTdHJpcCB0
aGVtIGV4cGxpY2l0bHkgZnJvbSByZXN1bHRpbmcgb2JqZWN0IGZpbGUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IC0tLQo+ICBs
aXZlcGF0Y2gtYnVpbGQgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1idWls
ZCBiL2xpdmVwYXRjaC1idWlsZAo+IGluZGV4IGI4YTE3MjguLjgxNjA2NGMgMTAwNzU1Cj4gLS0t
IGEvbGl2ZXBhdGNoLWJ1aWxkCj4gKysrIGIvbGl2ZXBhdGNoLWJ1aWxkCj4gQEAgLTExMSw2ICsx
MTEsMjggQEAgZnVuY3Rpb24gYnVpbGRfc3BlY2lhbCgpCj4gICAgICB1bnNldCBMSVZFUEFUQ0hf
Q0FQVFVSRV9ESVIKPiAgfQo+ICAKPiArc3RyaXBfZXh0cmFfc3ltYm9scyAoKQo+ICt7Cj4gKyAg
ICBsb2NhbCAtciBGSUxFPSIkMSIKPiArICAgIGxvY2FsIC1hIFNUUklQX0NNRF9PUFRTPSgpCj4g
KyAgICBsb2NhbCAtYSBTWU1fUFJFRklYPSgibGl2ZXBhdGNoX2xvYWRfZGF0YV8iCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAibGl2ZXBhdGNoX3VubG9hZF9kYXRhXyIKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICJsaXZlcGF0Y2hfcHJlYXBwbHlfZGF0YV8iCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAibGl2ZXBhdGNoX2FwcGx5X2RhdGFfIgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgImxpdmVwYXRjaF9wb3N0YXBwbHlfZGF0YV8iCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAibGl2ZXBhdGNoX3ByZXJldmVydF9kYXRhXyIKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICJsaXZlcGF0Y2hfcmV2ZXJ0X2RhdGFfIgo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgImxpdmVwYXRjaF9wb3N0cmV2ZXJ0X2RhdGFfIikKPiArCj4gKyAgICBTVFJJUF9DTURfT1BU
Uys9KCItdyIpCj4gKyAgICBmb3Igc3ltIGluICIke1NZTV9QUkVGSVhbQF19IjsgZG8KPiArICAg
ICAgICBTVFJJUF9DTURfT1BUUys9KCItTiIpCj4gKyAgICAgICAgU1RSSVBfQ01EX09QVFMrPSgi
XCIke3N5bX0qXCIiKQo+ICsgICAgZG9uZQo+ICsKPiArICAgIHN0cmlwICIke1NUUklQX0NNRF9P
UFRTW0BdfSIgIiRGSUxFIgo+ICt9Cj4gKwo+ICBmdW5jdGlvbiBjcmVhdGVfcGF0Y2goKQo+ICB7
Cj4gICAgICBlY2hvICJFeHRyYWN0aW5nIG5ldyBhbmQgbW9kaWZpZWQgRUxGIHNlY3Rpb25zLi4u
Igo+IEBAIC0xNTAsNiArMTcyLDcgQEAgZnVuY3Rpb24gY3JlYXRlX3BhdGNoKCkKPiAgICAgIE5F
V19GSUxFUz0kKGNvbW0gLTIzIDwoY2QgcGF0Y2hlZC94ZW4gJiYgZmluZCAuIC10eXBlIGYgLW5h
bWUgJyoubycgfCBzb3J0KSA8KGNkIG9yaWdpbmFsL3hlbiAmJiBmaW5kIC4gLXR5cGUgZiAtbmFt
ZSAnKi5vJyB8IHNvcnQpKQo+ICAgICAgZm9yIGkgaW4gJE5FV19GSUxFUzsgZG8KPiAgICAgICAg
ICBjcCAicGF0Y2hlZC8kaSIgIm91dHB1dC8kaSIKPiArICAgICAgICBzdHJpcCAtLXN0cmlwLXVu
bmVlZGVkICJvdXRwdXQvJGkiCgpUaGlzIHN0cmlwcyBkZWJ1ZyBzeW1ib2xzIHRvbyB3aGljaCBp
cyBub3QgbmVjZXNzYXJpbHkgZGVzaXJhYmxlIGFuZCBJIHRoaW5rIGZvciBtb3N0IHNvZnR3YXJl
IGlzIG5vcm1hbGx5IGxlZnQgYSBoaWdoIGxldmVsIHByb2Nlc3MgKGUuZy4gcnBtYnVpbGQpLiBD
YW4geW91IG1ha2UgdGhpcyBvcHRpb25hbCBwbGVhc2U/CgpUaGFua3MsCi0tIApSb3NzIExhZ2Vy
d2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
